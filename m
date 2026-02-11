Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UIvBEmC5jGlHsgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:16:16 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 434DA12688B
	for <lists+xen-devel@lfdr.de>; Wed, 11 Feb 2026 18:16:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1227998.1534410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDov-00063p-5U; Wed, 11 Feb 2026 17:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1227998.1534410; Wed, 11 Feb 2026 17:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqDou-0005zv-SD; Wed, 11 Feb 2026 17:16:08 +0000
Received: by outflank-mailman (input) for mailman id 1227998;
 Wed, 11 Feb 2026 17:16:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvfN=AP=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vqDot-0004U4-1Z
 for xen-devel@lists.xenproject.org; Wed, 11 Feb 2026 17:16:07 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 590bddd8-076d-11f1-9ccf-f158ae23cfc8;
 Wed, 11 Feb 2026 18:16:05 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DD33143D;
 Wed, 11 Feb 2026 09:15:58 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.53.46])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC05D3F63F;
 Wed, 11 Feb 2026 09:16:03 -0800 (PST)
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
X-Inumbo-ID: 590bddd8-076d-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 06/12] xen/arm: ffa: Fix RX/TX map layout and errors
Date: Wed, 11 Feb 2026 18:15:30 +0100
Message-ID: <c4a807f6de112e25f71ef6230079d5061f82a627.1770826406.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1770826406.git.bertrand.marquis@arm.com>
References: <cover.1770826406.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 434DA12688B
X-Rspamd-Action: no action

FFA_RXTX_MAP builds a descriptor for the SPMC and the composite region
offsets must be 8-byte aligned. Xen currently uses a 12-byte header
size, which produces misaligned RX/TX offsets. Mapping failures also
return INVALID_PARAMETERS even when the failure is due to resource
exhaustion, which misreports the error condition.

Round the descriptor header size up to 8 bytes before placing the RX
region and derive the TX offset from the aligned RX offset. Return
FFA_RET_NO_MEMORY when the TX or RX buffer mapping fails before the
error paths unwind.

Functional impact: RXTX_MAP now returns NO_MEMORY on mapping failures
and the SPMC receives an aligned RX/TX descriptor layout.

Reviewed-by: Jens Wiklander <jens.wiklander@linaro.org>
Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- add Jens R-b
---
 xen/arch/arm/tee/ffa_rxtx.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index 50758fb57cdf..eff95a7955d7 100644
--- a/xen/arch/arm/tee/ffa_rxtx.c
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -119,11 +119,17 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 
     tx = __map_domain_page_global(tx_pg);
     if ( !tx )
+    {
+        ret = FFA_RET_NO_MEMORY;
         goto err_put_rx_pg;
+    }
 
     rx = __map_domain_page_global(rx_pg);
     if ( !rx )
+    {
+        ret = FFA_RET_NO_MEMORY;
         goto err_unmap_tx;
+    }
 
     /*
      * Transmit the RX/TX buffer information to the SPM if acquire is supported
@@ -136,7 +142,8 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
         struct ffa_mem_region *mem_reg;
 
         /* All must fit in our TX buffer */
-        BUILD_BUG_ON(sizeof(*rxtx_desc) + sizeof(*mem_reg) * 2 +
+        BUILD_BUG_ON(ROUNDUP(sizeof(*rxtx_desc), 8) +
+                     sizeof(*mem_reg) * 2 +
                      sizeof(struct ffa_address_range) * 2 >
                      FFA_MAX_RXTX_PAGE_COUNT * FFA_PAGE_SIZE);
 
@@ -153,8 +160,8 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
          */
         rxtx_desc->sender_id = ffa_get_vm_id(d);
         rxtx_desc->reserved = 0;
-        rxtx_desc->rx_region_offs = sizeof(*rxtx_desc);
-        rxtx_desc->tx_region_offs = sizeof(*rxtx_desc) +
+        rxtx_desc->rx_region_offs = ROUNDUP(sizeof(*rxtx_desc), 8);
+        rxtx_desc->tx_region_offs = rxtx_desc->rx_region_offs +
                                     offsetof(struct ffa_mem_region,
                                              address_range_array[1]);
 
-- 
2.52.0


