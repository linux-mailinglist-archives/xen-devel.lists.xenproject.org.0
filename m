Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGkdJ7wygml5QQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 472AFDCE88
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219540.1528431 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMU-0001LB-Db; Tue, 03 Feb 2026 17:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219540.1528431; Tue, 03 Feb 2026 17:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMU-0001Fc-7B; Tue, 03 Feb 2026 17:38:50 +0000
Received: by outflank-mailman (input) for mailman id 1219540;
 Tue, 03 Feb 2026 17:38:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnKMT-0000Zt-4y
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:38:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 315067dd-0127-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:38:47 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 000A0150C;
 Tue,  3 Feb 2026 09:38:39 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5699A3F632;
 Tue,  3 Feb 2026 09:38:45 -0800 (PST)
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
X-Inumbo-ID: 315067dd-0127-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 04/12] xen/arm: ffa: Add FF-A 1.2 endpoint memory access descriptors
Date: Tue,  3 Feb 2026 18:37:59 +0100
Message-ID: <a8d316dbdbd00a7980c6d527038f9046bb895c69.1770115302.git.bertrand.marquis@arm.com>
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
X-Rspamd-Queue-Id: 472AFDCE88
X-Rspamd-Action: no action

FF-A 1.2 extends the endpoint memory access descriptor (EMAD) from
16 to 32 bytes, adding implementation-defined (IMPDEF) fields and
reserved space. The MEM_SHARE path currently assumes the 1.1 EMAD
size and rejects the 1.2 layout.

Add FF-A 1.2 EMAD support to MEM_SHARE:
- define ffa_mem_access_1_2 and store IMPDEF payload in ffa_shm_mem
- emit 1.2 EMADs to the SPMC for FF-A 1.2 guests, forwarding IMPDEF
- refactor header parsing into read_mem_transaction() for 1.0/1.1+
- detect EMAD format by mem_access_size to allow 1.1 on 1.2 guests

Functional impact: MEM_SHARE supports FF-A 1.2 EMADs.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa_shm.c | 108 +++++++++++++++++++++++++++++--------
 1 file changed, 86 insertions(+), 22 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_shm.c b/xen/arch/arm/tee/ffa_shm.c
index 4c0b45cde6ee..905a64e3db01 100644
--- a/xen/arch/arm/tee/ffa_shm.c
+++ b/xen/arch/arm/tee/ffa_shm.c
@@ -30,6 +30,14 @@ struct ffa_mem_access {
     uint64_t reserved;
 };
 
+/* Endpoint memory access descriptor (FF-A 1.2) */
+struct ffa_mem_access_1_2 {
+    struct ffa_mem_access_perm access_perm;
+    uint32_t region_offs;
+    uint8_t impdef[16];
+    uint8_t reserved[8];
+};
+
 /* Lend, donate or share memory transaction descriptor */
 struct ffa_mem_transaction_1_0 {
     uint16_t sender_id;
@@ -73,7 +81,7 @@ struct ffa_mem_transaction_1_1 {
 /*
  * The parts needed from struct ffa_mem_transaction_1_0 or struct
  * ffa_mem_transaction_1_1, used to provide an abstraction of difference in
- * data structures between version 1.0 and 1.1. This is just an internal
+ * data structures between version 1.0 and 1.2. This is just an internal
  * interface and can be changed without changing any ABI.
  */
 struct ffa_mem_transaction_int {
@@ -92,6 +100,8 @@ struct ffa_shm_mem {
     uint16_t sender_id;
     uint16_t ep_id;     /* endpoint, the one lending */
     uint64_t handle;    /* FFA_HANDLE_INVALID if not set yet */
+    /* Endpoint memory access descriptor IMPDEF value (FF-A 1.2). */
+    uint64_t impdef[2];
     unsigned int page_count;
     struct page_info *pages[];
 };
@@ -297,17 +307,21 @@ static void init_range(struct ffa_address_range *addr_range,
  * This function uses the ffa_spmc tx buffer to transmit the memory transaction
  * descriptor.
  */
-static int share_shm(struct ffa_shm_mem *shm)
+static int share_shm(struct ffa_shm_mem *shm, uint32_t ffa_vers)
 {
     const uint32_t max_frag_len = FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE;
     struct ffa_mem_access *mem_access_array;
+    struct ffa_mem_access_1_2 *mem_access_array_1_2;
     struct ffa_mem_transaction_1_1 *descr;
     struct ffa_address_range *addr_range;
     struct ffa_mem_region *region_descr;
-    const unsigned int region_count = 1;
     uint32_t frag_len;
     uint32_t tot_len;
+    uint32_t mem_access_size;
+    uint32_t mem_access_offs;
+    uint32_t region_offs;
     paddr_t last_pa;
+    uint32_t range_count;
     unsigned int n;
     paddr_t pa;
     int32_t ret;
@@ -326,16 +340,35 @@ static int share_shm(struct ffa_shm_mem *shm)
     descr->handle = shm->handle;
     descr->mem_reg_attr = FFA_NORMAL_MEM_REG_ATTR;
     descr->mem_access_count = 1;
-    descr->mem_access_size = sizeof(*mem_access_array);
-    descr->mem_access_offs = MEM_ACCESS_OFFSET(0);
+    if ( ffa_vers >= FFA_VERSION_1_2 )
+        mem_access_size = sizeof(struct ffa_mem_access_1_2);
+    else
+        mem_access_size = sizeof(struct ffa_mem_access);
+    mem_access_offs = sizeof(struct ffa_mem_transaction_1_1);
+    region_offs = mem_access_offs + mem_access_size;
+    descr->mem_access_size = mem_access_size;
+    descr->mem_access_offs = mem_access_offs;
 
-    mem_access_array = buf + descr->mem_access_offs;
-    memset(mem_access_array, 0, sizeof(*mem_access_array));
-    mem_access_array[0].access_perm.endpoint_id = shm->ep_id;
-    mem_access_array[0].access_perm.perm = FFA_MEM_ACC_RW;
-    mem_access_array[0].region_offs = REGION_OFFSET(descr->mem_access_count, 0);
+    if ( ffa_vers >= FFA_VERSION_1_2 )
+    {
+        mem_access_array_1_2 = buf + mem_access_offs;
+        memset(mem_access_array_1_2, 0, sizeof(*mem_access_array_1_2));
+        mem_access_array_1_2[0].access_perm.endpoint_id = shm->ep_id;
+        mem_access_array_1_2[0].access_perm.perm = FFA_MEM_ACC_RW;
+        mem_access_array_1_2[0].region_offs = region_offs;
+        memcpy(mem_access_array_1_2[0].impdef, shm->impdef,
+               sizeof(mem_access_array_1_2[0].impdef));
+    }
+    else
+    {
+        mem_access_array = buf + mem_access_offs;
+        memset(mem_access_array, 0, sizeof(*mem_access_array));
+        mem_access_array[0].access_perm.endpoint_id = shm->ep_id;
+        mem_access_array[0].access_perm.perm = FFA_MEM_ACC_RW;
+        mem_access_array[0].region_offs = region_offs;
+    }
 
-    region_descr = buf + mem_access_array[0].region_offs;
+    region_descr = buf + region_offs;
     memset(region_descr, 0, sizeof(*region_descr));
     region_descr->total_page_count = shm->page_count;
 
@@ -349,8 +382,9 @@ static int share_shm(struct ffa_shm_mem *shm)
         region_descr->address_range_count++;
     }
 
-    tot_len = ADDR_RANGE_OFFSET(descr->mem_access_count, region_count,
-                                region_descr->address_range_count);
+    range_count = region_descr->address_range_count;
+    tot_len = region_offs + sizeof(*region_descr) +
+              range_count * sizeof(struct ffa_address_range);
     if ( tot_len > max_frag_len )
     {
         ret = FFA_RET_NOT_SUPPORTED;
@@ -358,7 +392,7 @@ static int share_shm(struct ffa_shm_mem *shm)
     }
 
     addr_range = region_descr->address_range_array;
-    frag_len = ADDR_RANGE_OFFSET(descr->mem_access_count, region_count, 1);
+    frag_len = region_offs + sizeof(*region_descr) + sizeof(*addr_range);
     last_pa = page_to_maddr(shm->pages[0]);
     init_range(addr_range, last_pa);
     for ( n = 1; n < shm->page_count; last_pa = pa, n++ )
@@ -448,6 +482,12 @@ static int read_mem_transaction(uint32_t ffa_vers, const void *buf, size_t blen,
     if ( size * count + offs > blen )
         return FFA_RET_INVALID_PARAMETERS;
 
+    if ( size < sizeof(struct ffa_mem_access) )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    if ( offs & 0xF )
+        return FFA_RET_INVALID_PARAMETERS;
+
     trans->mem_reg_attr = mem_reg_attr;
     trans->flags = flags;
     trans->mem_access_size = size;
@@ -464,7 +504,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     uint64_t addr = get_user_reg(regs, 3);
     uint32_t page_count = get_user_reg(regs, 4);
     const struct ffa_mem_region *region_descr;
-    const struct ffa_mem_access *mem_access;
+    const struct ffa_mem_access_1_2 *mem_access;
     struct ffa_mem_transaction_int trans;
     struct domain *d = current->domain;
     struct ffa_ctx *ctx = d->arch.tee;
@@ -474,9 +514,12 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     register_t handle_hi = 0;
     register_t handle_lo = 0;
     int ret = FFA_RET_DENIED;
+    uint32_t ffa_vers;
     uint32_t range_count;
     uint32_t region_offs;
     uint16_t dst_id;
+    uint8_t perm;
+    uint64_t impdef[2];
 
     if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
     {
@@ -515,8 +558,8 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     if ( frag_len > tx_size )
         goto out_unlock;
 
-    ret = read_mem_transaction(ACCESS_ONCE(ctx->guest_vers), tx_buf,
-                               frag_len, &trans);
+    ffa_vers = ACCESS_ONCE(ctx->guest_vers);
+    ret = read_mem_transaction(ffa_vers, tx_buf, frag_len, &trans);
     if ( ret )
         goto out_unlock;
 
@@ -545,13 +588,35 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
     }
 
+    if ( trans.mem_access_size < sizeof(struct ffa_mem_access) )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out_unlock;
+    }
+
     /* Check that it fits in the supplied data */
     if ( trans.mem_access_offs + trans.mem_access_size > frag_len )
         goto out_unlock;
 
     mem_access = tx_buf + trans.mem_access_offs;
-
     dst_id = ACCESS_ONCE(mem_access->access_perm.endpoint_id);
+    perm = ACCESS_ONCE(mem_access->access_perm.perm);
+    region_offs = ACCESS_ONCE(mem_access->region_offs);
+
+    /*
+     * FF-A 1.2 introduced an extended mem_access descriptor with impdef
+     * fields, but guests can still use the 1.1 format if they don't need
+     * implementation-defined data. Detect which format is used based on
+     * the mem_access_size field rather than the negotiated FF-A version.
+     */
+    if ( trans.mem_access_size >= sizeof(struct ffa_mem_access_1_2) )
+        memcpy(impdef, mem_access->impdef, sizeof(impdef));
+    else
+    {
+        impdef[0] = 0;
+        impdef[1] = 0;
+    }
+
     if ( !FFA_ID_IS_SECURE(dst_id) )
     {
         /* we do not support sharing with VMs */
@@ -559,13 +624,11 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
         goto out_unlock;
     }
 
-    if ( ACCESS_ONCE(mem_access->access_perm.perm) != FFA_MEM_ACC_RW )
+    if ( perm != FFA_MEM_ACC_RW )
     {
         ret = FFA_RET_NOT_SUPPORTED;
         goto out_unlock;
     }
-
-    region_offs = ACCESS_ONCE(mem_access->region_offs);
     if ( sizeof(*region_descr) + region_offs > frag_len )
     {
         ret = FFA_RET_NOT_SUPPORTED;
@@ -590,6 +653,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     }
     shm->sender_id = trans.sender_id;
     shm->ep_id = dst_id;
+    memcpy(shm->impdef, impdef, sizeof(shm->impdef));
 
     /*
      * Check that the Composite memory region descriptor fits.
@@ -605,7 +669,7 @@ void ffa_handle_mem_share(struct cpu_user_regs *regs)
     if ( ret )
         goto out;
 
-    ret = share_shm(shm);
+    ret = share_shm(shm, ffa_vers);
     if ( ret )
         goto out;
 
-- 
2.50.1 (Apple Git-155)


