Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5EBCBE639
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 15:50:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187132.1508587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9tn-0004uX-5y; Mon, 15 Dec 2025 14:50:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187132.1508587; Mon, 15 Dec 2025 14:50:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vV9tm-0004rp-Vm; Mon, 15 Dec 2025 14:50:06 +0000
Received: by outflank-mailman (input) for mailman id 1187132;
 Mon, 15 Dec 2025 14:50:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pAKg=6V=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vV9tl-00038W-1G
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 14:50:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 564167ba-d9c5-11f0-9cce-f158ae23cfc8;
 Mon, 15 Dec 2025 15:50:03 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2711F497;
 Mon, 15 Dec 2025 06:49:55 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.46.206])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 33BD23F694;
 Mon, 15 Dec 2025 06:50:01 -0800 (PST)
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
X-Inumbo-ID: 564167ba-d9c5-11f0-9cce-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: jens.wiklander@linaro.org,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 04/12] xen/arm: ffa: harden RX/TX mapping
Date: Mon, 15 Dec 2025 15:49:21 +0100
Message-ID: <5c8d22e3c3db0a62aa14f000fe4867614bc78456.1765807707.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1765807707.git.bertrand.marquis@arm.com>
References: <cover.1765807707.git.bertrand.marquis@arm.com>
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

Prevent concurrent usage of rx or tx buffer during map or unmap by
holding the rx_lock and tx_lock.

While there also introduce a domain_rxtx_init to properly initialize the
rxtx buffers spinlocks.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
---
Changes in v2:
- add Jens R-b
Changes in v1:
- take the rx_lock and tx_lock during rxtx_map and rxtx_unmap to prevent
  concurrent calls using the rx or tx buffer during mapping.
- properly clean rx/tx buffer related context entries during domain_init
---
 xen/arch/arm/tee/ffa.c         |  4 ++
 xen/arch/arm/tee/ffa_private.h |  5 ++-
 xen/arch/arm/tee/ffa_rxtx.c    | 68 +++++++++++++++++++++++++++-------
 3 files changed, 62 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 0f6f837378cc..497ada8264e0 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -451,6 +451,10 @@ static int ffa_domain_init(struct domain *d)
     if ( ret )
         return ret;
 
+    ret = ffa_rxtx_domain_init(d);
+    if ( ret )
+        return ret;
+
     return ffa_notif_domain_init(d);
 }
 
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 96794ecebe4b..0bb5a84553ce 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -439,10 +439,11 @@ void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
 
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
index a40e5b32e3a5..5776693bb3f0 100644
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
@@ -66,20 +66,30 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
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
+    spin_lock(&ctx->rx_lock);
+    spin_lock(&ctx->tx_lock);
+
     /* Already mapped */
     if ( ctx->rx )
-        return FFA_RET_DENIED;
+    {
+        ret = FFA_RET_DENIED;
+        goto err_unlock_rxtx;
+    }
 
     tx_pg = get_page_from_gfn(d, gfn_x(gaddr_to_gfn(tx_addr)), &t, P2M_ALLOC);
     if ( !tx_pg )
-        return FFA_RET_INVALID_PARAMETERS;
+        goto err_unlock_rxtx;
 
     /* Only normal RW RAM for now */
     if ( t != p2m_ram_rw )
@@ -167,6 +177,10 @@ uint32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
     ctx->tx_pg = tx_pg;
     ctx->page_count = page_count;
     ctx->rx_is_free = true;
+
+    spin_unlock(&ctx->tx_lock);
+    spin_unlock(&ctx->rx_lock);
+
     return FFA_RET_OK;
 
 err_unmap_rx:
@@ -177,24 +191,32 @@ err_put_rx_pg:
     put_page(rx_pg);
 err_put_tx_pg:
     put_page(tx_pg);
+err_unlock_rxtx:
+    spin_unlock(&ctx->tx_lock);
+    spin_unlock(&ctx->rx_lock);
 
     return ret;
 }
 
-static uint32_t  rxtx_unmap(struct domain *d)
+static int32_t rxtx_unmap(struct domain *d)
 {
     struct ffa_ctx *ctx = d->arch.tee;
+    int32_t ret = FFA_RET_OK;
+
+    spin_lock(&ctx->rx_lock);
+    spin_lock(&ctx->tx_lock);
 
     if ( !ctx->page_count )
-        return FFA_RET_INVALID_PARAMETERS;
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto err_unlock_rxtx;
+    }
 
     if ( ffa_fw_supports_fid(FFA_RX_ACQUIRE) )
     {
-        uint32_t ret;
-
         ret = ffa_rxtx_unmap(ffa_get_vm_id(d));
         if ( ret != FFA_RET_OK )
-            return ret;
+            goto err_unlock_rxtx;
     }
 
     unmap_domain_page_global(ctx->rx);
@@ -208,10 +230,14 @@ static uint32_t  rxtx_unmap(struct domain *d)
     ctx->page_count = 0;
     ctx->rx_is_free = false;
 
-    return FFA_RET_OK;
+err_unlock_rxtx:
+    spin_unlock(&ctx->tx_lock);
+    spin_unlock(&ctx->rx_lock);
+
+    return ret;
 }
 
-uint32_t ffa_handle_rxtx_unmap(void)
+int32_t ffa_handle_rxtx_unmap(void)
 {
     return rxtx_unmap(current->domain);
 }
@@ -272,6 +298,22 @@ out:
     return ret;
 }
 
+int32_t ffa_rxtx_domain_init(struct domain *d)
+{
+    struct ffa_ctx *ctx = d->arch.tee;
+
+    spin_lock_init(&ctx->rx_lock);
+    spin_lock_init(&ctx->tx_lock);
+    ctx->rx = NULL;
+    ctx->tx = NULL;
+    ctx->rx_pg = NULL;
+    ctx->tx_pg = NULL;
+    ctx->page_count = 0;
+    ctx->rx_is_free = false;
+
+    return 0;
+}
+
 void ffa_rxtx_domain_destroy(struct domain *d)
 {
     rxtx_unmap(d);
@@ -298,7 +340,7 @@ void ffa_rxtx_destroy(void)
 
 bool ffa_rxtx_init(void)
 {
-    int e;
+    int32_t e;
 
     /* Firmware not there or not supporting */
     if ( !ffa_fw_supports_fid(FFA_RXTX_MAP_64) )
-- 
2.51.2


