Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7198C8F5B1
	for <lists+xen-devel@lfdr.de>; Thu, 27 Nov 2025 16:53:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1174079.1499076 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIi-0004bZ-MB; Thu, 27 Nov 2025 15:52:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1174079.1499076; Thu, 27 Nov 2025 15:52:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOeIi-0004Y5-IW; Thu, 27 Nov 2025 15:52:56 +0000
Received: by outflank-mailman (input) for mailman id 1174079;
 Thu, 27 Nov 2025 15:52:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+gQU=6D=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vOeIh-0003dB-1O
 for xen-devel@lists.xenproject.org; Thu, 27 Nov 2025 15:52:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 2299b985-cba9-11f0-9d18-b5c5bf9af7f9;
 Thu, 27 Nov 2025 16:52:54 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1467B176A;
 Thu, 27 Nov 2025 07:52:46 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.89.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22BE53F73B;
 Thu, 27 Nov 2025 07:52:51 -0800 (PST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 2299b985-cba9-11f0-9d18-b5c5bf9af7f9
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 03/10] xen/arm: ffa: harden RX/TX mapping
Date: Thu, 27 Nov 2025 16:51:34 +0100
Message-ID: <d4e6fa4807528918f40e4db76ac57db33efa5f67.1764254975.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1764254975.git.bertrand.marquis@arm.com>
References: <cover.1764254975.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Harden the RX/TX mapping paths and keep signed FF-A return codes
end-to-end.

Reject zero-length mappings and insist on page-aligned RX/TX buffer
addresses before touching the P2M. The unmap plumbing is switched to
use the same signed helpers so dispatcher error handling is consistent
across map and unmap operations.

This avoids partially mapped or silently truncated buffers and makes the
mediator behaviour match the FF-A error model more closely.

While there also introduce a domain_rxtx_init to properly initialize the
rxtx buffers spinlocks.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c         |  4 ++++
 xen/arch/arm/tee/ffa_private.h |  5 +++--
 xen/arch/arm/tee/ffa_rxtx.c    | 28 +++++++++++++++++++++-------
 3 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 3309ca875ec4..47f426e85864 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -446,6 +446,10 @@ static int ffa_domain_init(struct domain *d)
     if ( ret )
         return ret;
 
+    ret = ffa_rxtx_domain_init(d);
+    if ( ret )
+        return ret;
+
     return ffa_notif_domain_init(d);
 }
 
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 88b85c7c453a..4272afd37343 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -427,10 +427,11 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
 
 bool ffa_rxtx_init(void);
 void ffa_rxtx_destroy(void);
+int32_t ffa_rxtx_domain_init(struct domain *d);
 void ffa_rxtx_domain_destroy(struct domain *d);
-uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
+int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 			     register_t rx_addr, uint32_t page_count);
-uint32_t ffa_handle_rxtx_unmap(void);
+int32_t ffa_handle_rxtx_unmap(void);
 int32_t ffa_rx_acquire(struct domain *d);
 int32_t ffa_rx_release(struct domain *d);
 
diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index a40e5b32e3a5..cd467d1dba68 100644
--- a/xen/arch/arm/tee/ffa_rxtx.c
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -41,10 +41,10 @@ static int32_t ffa_rxtx_unmap(uint16_t id)
     return ffa_simple_call(FFA_RXTX_UNMAP, ((uint64_t)id) << 16, 0, 0, 0);
 }
 
-uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
+int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 			     register_t rx_addr, uint32_t page_count)
 {
-    uint32_t ret = FFA_RET_INVALID_PARAMETERS;
+    int32_t ret = FFA_RET_INVALID_PARAMETERS;
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
     struct page_info *tx_pg;
@@ -66,13 +66,17 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
         rx_addr &= UINT32_MAX;
     }
 
-    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT )
+    if ( page_count > FFA_MAX_RXTX_PAGE_COUNT || !page_count )
     {
         printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (limit %u)\n",
                page_count, FFA_MAX_RXTX_PAGE_COUNT);
         return FFA_RET_INVALID_PARAMETERS;
     }
 
+    if ( !IS_ALIGNED(tx_addr, FFA_PAGE_SIZE) ||
+         !IS_ALIGNED(rx_addr, FFA_PAGE_SIZE) )
+        return FFA_RET_INVALID_PARAMETERS;
+
     /* Already mapped */
     if ( ctx->rx )
         return FFA_RET_DENIED;
@@ -181,7 +185,7 @@ err_put_tx_pg:
     return ret;
 }
 
-static uint32_t  rxtx_unmap(struct domain *d)
+static int32_t rxtx_unmap(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.tee;
 
@@ -190,7 +194,7 @@ static uint32_t  rxtx_unmap(struct domain *d)
 
     if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
     {
-        uint32_t ret;
+        int32_t ret;
 
         ret = ffa_rxtx_unmap(ffa_get_vm_id(d));
         if ( ret != FFA_RET_OK )
@@ -211,7 +215,7 @@ static uint32_t  rxtx_unmap(struct domain *d)
     return FFA_RET_OK;
 }
 
-uint32_t ffa_handle_rxtx_unmap(void)
+int32_t ffa_handle_rxtx_unmap(void)
 {
     return rxtx_unmap(current->domain);
 }
@@ -272,6 +276,16 @@ out:
     return ret;
 }
 
+int32_t ffa_rxtx_domain_init(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    spin_lock_init(&ctx->rx_lock);
+    spin_lock_init(&ctx->tx_lock);
+
+    return 0;
+}
+
 void ffa_rxtx_domain_destroy(struct domain *d)
 {
     rxtx_unmap(d);
@@ -298,7 +312,7 @@ void ffa_rxtx_destroy(void)
 
 bool ffa_rxtx_init(void)
 {
-    int e;
+    int32_t e;
 
     /* Firmware not there or not supporting */
     if ( !ffa_fw_supports_fid(FFA_RXTX_MAP_64) )
-- 
2.51.2


