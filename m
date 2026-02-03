Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2J4+E70ygmktQgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDB6DCEA7
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219539.1528424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMT-0001Dw-RT; Tue, 03 Feb 2026 17:38:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219539.1528424; Tue, 03 Feb 2026 17:38:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMT-0001Au-NG; Tue, 03 Feb 2026 17:38:49 +0000
Received: by outflank-mailman (input) for mailman id 1219539;
 Tue, 03 Feb 2026 17:38:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnKMR-0000Zt-Ow
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:38:47 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3082c8e9-0127-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:38:45 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A181C1063;
 Tue,  3 Feb 2026 09:38:38 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DE5CF3F632;
 Tue,  3 Feb 2026 09:38:43 -0800 (PST)
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
X-Inumbo-ID: 3082c8e9-0127-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 03/12] xen/arm: ffa: Harden shm page parsing
Date: Tue,  3 Feb 2026 18:37:58 +0100
Message-ID: <97a064c81ee5ea26774c189538f9f1e37dd3eebc.1770115302.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1770115301.git.bertrand.marquis@arm.com>
References: <cover.1770115301.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.11 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 1FDB6DCEA7
X-Rspamd-Action: no action

get_shm_pages() uses unchecked address arithmetic and does not enforce
alignment, so malformed descriptors can cause overflow or slip through
validation. The reclaim path also repeats handle-to-shm-mem conversion
in multiple places, duplicating error handling.

Harden page parsing and reclaim handling:
- add ffa_safe_addr_add() and use it to detect address overflows
- enforce alignment checks in get_shm_pages() and return FF-A errors
- introduce ffa_secure_reclaim() and use it for MEM_RECLAIM and teardown
- simplify ffa_mem_share() argument handling and allow max page count

Functional impact: invalid or misaligned memory ranges now fail earlier
with proper error codes; behavior for valid descriptors is unchanged.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_private.h | 11 +++++++
 xen/arch/arm/tee/ffa_shm.c     | 57 +++++++++++++++++-----------------
 2 files changed, 40 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index b625f1c72914..58562d8e733c 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -632,4 +632,15 @@ static inline void ffa_uuid_set(struct ffa_uuid *id, uint32_t val0,
     id->val[1] = ((uint64_t)val3 << 32U) | val2;
 }
 
+/*
+ * Common overflow-safe helper to verify that adding a number of pages to an
+ * address will not wrap around.
+ */
+static inline bool ffa_safe_addr_add(uint64_t addr, uint64_t pages)
+{
+    uint64_t off = pages * FFA_PAGE_SIZE;
+
+    return (off / FFA_PAGE_SIZE) == pages && addr <= UINT64_MAX - off;
+}
+
 #endif /*__FFA_PRIVATE_H__*/
diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index 90800e44a86a..4c0b45cde6ee 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -96,16 +96,14 @@ struct ffa_shm_mem {
     struct page_info *pages[];
 };
 
-static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
-                             register_t addr, uint32_t pg_count,
-                             uint64_t *handle)
+static int32_t ffa_mem_share(uint32_t tot_len, uint64_t *handle)
 {
     struct arm_smccc_1_2_regs arg = {
         .a0 = FFA_MEM_SHARE_64,
         .a1 = tot_len,
-        .a2 = frag_len,
-        .a3 = addr,
-        .a4 = pg_count,
+        .a2 = tot_len,
+        .a3 = 0,
+        .a4 = 0,
     };
     struct arm_smccc_1_2_regs resp;
 
@@ -131,12 +129,16 @@ static int32_t ffa_mem_share(uint32_t tot_len, uint32_t frag_len,
     }
 }
 
-static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
-                               uint32_t flags)
+static int32_t ffa_secure_reclaim(struct ffa_shm_mem *shm, uint32_t flags)
 {
+    register_t handle_hi;
+    register_t handle_lo;
+
     if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
         return FFA_RET_NOT_SUPPORTED;
 
+    uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
+
     return ffa_simple_call(FFA_MEM_RECLAIM, handle_lo, handle_hi, flags, 0);
 }
 
@@ -145,7 +147,7 @@ static int32_t ffa_mem_reclaim(uint32_t handle_lo, uint32_t handle_hi,
  * this function fails then the caller is still expected to call
  * put_shm_pages() as a cleanup.
  */
-static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
+static int32_t get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
                          const struct ffa_address_range *range,
                          uint32_t range_count)
 {
@@ -156,17 +158,26 @@ static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
     p2m_type_t t;
     uint64_t addr;
     uint64_t page_count;
+    uint64_t gaddr;
 
     for ( n = 0; n < range_count; n++ )
     {
         page_count = ACCESS_ONCE(range[n].page_count);
         addr = ACCESS_ONCE(range[n].address);
+
+        if ( !IS_ALIGNED(addr, FFA_PAGE_SIZE) )
+            return FFA_RET_INVALID_PARAMETERS;
+
         for ( m = 0; m < page_count; m++ )
         {
             if ( pg_idx >= shm->page_count )
                 return FFA_RET_INVALID_PARAMETERS;
 
-            gfn = gaddr_to_gfn(addr + m * FFA_PAGE_SIZE);
+            if ( !ffa_safe_addr_add(addr, m) )
+                return FFA_RET_INVALID_PARAMETERS;
+
+            gaddr = addr + m * FFA_PAGE_SIZE;
+            gfn = gaddr_to_gfn(gaddr);
             shm->pages[pg_idx] = get_page_from_gfn(d, gfn_x(gfn), &t,
 						   P2M_ALLOC);
             if ( !shm->pages[pg_idx] )
@@ -180,7 +191,7 @@ static int get_shm_pages(struct domain *d, struct ffa_shm_mem *shm,
 
     /* The ranges must add up */
     if ( pg_idx < shm->page_count )
-            return FFA_RET_INVALID_PARAMETERS;
+        return FFA_RET_INVALID_PARAMETERS;
 
     return FFA_RET_OK;
 }
@@ -198,15 +209,11 @@ static void put_shm_pages(struct ffa_shm_mem *shm)
 
 static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
 {
-    bool ret = true;
+    bool ret = false;
 
     spin_lock(&ctx->lock);
 
-    if ( ctx->shm_count >= FFA_MAX_SHM_COUNT )
-    {
-        ret = false;
-    }
-    else
+    if ( ctx->shm_count < FFA_MAX_SHM_COUNT )
     {
         /*
          * If this is the first shm added, increase the domain reference
@@ -217,6 +224,7 @@ static bool inc_ctx_shm_count(struct domain *d, struct ffa_ctx *ctx)
             get_knownalive_domain(d);
 
         ctx->shm_count++;
+        ret = true;
     }
 
     spin_unlock(&ctx->lock);
@@ -251,7 +259,7 @@ static struct ffa_shm_mem *alloc_ffa_shm_mem(struct domain *d,
     struct ffa_ctx *ctx = d->arch.tee;
     struct ffa_shm_mem *shm;
 
-    if ( page_count >= FFA_MAX_SHM_PAGE_COUNT )
+    if ( page_count > FFA_MAX_SHM_PAGE_COUNT )
         return NULL;
     if ( !inc_ctx_shm_count(d, ctx) )
         return NULL;
@@ -367,7 +375,7 @@ static int share_shm(struct ffa_shm_mem *shm)
         init_range(addr_range, pa);
     }
 
-    ret = ffa_mem_share(tot_len, frag_len, 0, 0, &shm->handle);
+    ret = ffa_mem_share(tot_len, &shm->handle);
 
 out:
     ffa_rxtx_spmc_tx_release();
@@ -637,8 +645,6 @@ int32_t ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags)
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
     struct ffa_shm_mem *shm;
-    register_t handle_hi;
-    register_t handle_lo;
     int32_t ret;
 
     if ( !ffa_fw_supports_fid(FFA_MEM_RECLAIM) )
@@ -652,8 +658,7 @@ int32_t ffa_handle_mem_reclaim(uint64_t handle, uint32_t flags)
     if ( !shm )
         return FFA_RET_INVALID_PARAMETERS;
 
-    uint64_to_regpair(&handle_hi, &handle_lo, handle);
-    ret = ffa_mem_reclaim(handle_lo, handle_hi, flags);
+    ret = ffa_secure_reclaim(shm, flags);
 
     if ( ret )
     {
@@ -677,11 +682,7 @@ bool ffa_shm_domain_destroy(struct domain *d)
 
     list_for_each_entry_safe(shm, tmp, &ctx->shm_list, list)
     {
-        register_t handle_hi;
-        register_t handle_lo;
-
-        uint64_to_regpair(&handle_hi, &handle_lo, shm->handle);
-        res = ffa_mem_reclaim(handle_lo, handle_hi, 0);
+        res = ffa_secure_reclaim(shm, 0);
         switch ( res ) {
         case FFA_RET_OK:
             printk(XENLOG_G_DEBUG "%pd: ffa: Reclaimed handle %#lx\n",
-- 
2.50.1 (Apple Git-155)


