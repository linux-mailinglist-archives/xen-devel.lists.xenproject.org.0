Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDudA3ywpWkiEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:45:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE161DC180
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:44:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244378.1543852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Ru-00075h-0q; Mon, 02 Mar 2026 15:44:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244378.1543852; Mon, 02 Mar 2026 15:44:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Rt-00073O-TM; Mon, 02 Mar 2026 15:44:45 +0000
Received: by outflank-mailman (input) for mailman id 1244378;
 Mon, 02 Mar 2026 15:44:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7KG=BC=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vx5Rr-00060E-UU
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:44:44 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id ba4f9867-164e-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 16:44:41 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AECAA152B;
 Mon,  2 Mar 2026 07:44:34 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.82.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A35133F73B;
 Mon,  2 Mar 2026 07:44:39 -0800 (PST)
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
X-Inumbo-ID: ba4f9867-164e-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 4/4] xen/arm: ffa: Add cached GET_REGS support
Date: Mon,  2 Mar 2026 16:44:13 +0100
Message-ID: <a7a2ba28c75241c1f1340482ed31d521ef38d218.1772464956.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772464956.git.bertrand.marquis@arm.com>
References: <cover.1772464956.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9CE161DC180
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
	RCVD_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.960];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action

FF-A v1.2 defines PARTITION_INFO_GET_REGS for register-based partition
info retrieval, but Xen currently only supports the buffer-based GET
path for guests.

Implement GET_REGS using the cached SP list and VM entries, including
the register window layout and input validation. Track VM list changes
via the partinfo tag and use it to validate GET_REGS tag inputs. Ensure
that when a non-Nil UUID is specified, the UUID fields in both GET and
GET_REGS results are MBZ as required by the specification.

PARTITION_INFO_GET_REGS is available to v1.2 guests, returning cached SP
entries and VM entries with UUIDs zeroed for non-Nil UUID queries.

Also publish VM membership updates (VM count, ctx list, and partinfo
tag) under the same write-locked section so GET_REGS sees coherent state
and concurrent changes are reliably reported via RETRY.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- ignore x4-x17 not being zero and x3 bits 63-32 not being zero (defined
  as SBZ in the spec)
- detect tag changes during GET_REGS handling and return RETRY
- remove strict check of sp_list_entry_size, larger cache entry sizes
  will now be accepted
- publish VM count, ctx list, and partinfo tag updates under
  ffa_ctx_list_rwlock for coherent visibility
---
 xen/arch/arm/tee/ffa.c          |  23 +++-
 xen/arch/arm/tee/ffa_partinfo.c | 200 ++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_private.h  |   4 +-
 3 files changed, 223 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index aa43ae2595d7..d6cae67e1a48 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -44,6 +44,11 @@
  *   - doesn't support signalling the secondary scheduler of pending
  *     notification for secure partitions
  *   - doesn't support notifications for Xen itself
+ * o FFA_PARTITION_INFO_GET/GET_REGS:
+ *   - v1.0 guests may see duplicate SP IDs when firmware provides UUIDs
+ *   - SP list is cached at init; SPMC tag changes are not tracked
+ *     between calls
+ *   - SP list is capped at FFA_MAX_NUM_SP entries
  *
  * There are some large locked sections with ffa_spmc_tx_lock and
  * ffa_spmc_rx_lock. Especially the ffa_spmc_tx_lock spinlock used
@@ -183,10 +188,11 @@ static bool ffa_negotiate_version(struct cpu_user_regs *regs)
 
         if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
         {
-            /* One more VM with FF-A support available */
-            inc_ffa_vm_count();
             write_lock(&ffa_ctx_list_rwlock);
+            /* Publish VM membership changes atomically with tag updates. */
+            inc_ffa_vm_count();
             list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
+            ffa_partinfo_inc_tag();
             write_unlock(&ffa_ctx_list_rwlock);
         }
 
@@ -341,6 +347,12 @@ static void handle_features(struct cpu_user_regs *regs)
     case FFA_FEATURE_SCHEDULE_RECV_INTR:
         ffa_set_regs_success(regs, GUEST_FFA_SCHEDULE_RECV_INTR_ID, 0);
         break;
+    case FFA_PARTITION_INFO_GET_REGS:
+        if ( ACCESS_ONCE(ctx->guest_vers) >= FFA_VERSION_1_2 )
+            ffa_set_regs_success(regs, 0, 0);
+        else
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        break;
 
     case FFA_NOTIFICATION_BIND:
     case FFA_NOTIFICATION_UNBIND:
@@ -402,6 +414,9 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
     case FFA_PARTITION_INFO_GET:
         ffa_handle_partition_info_get(regs);
         return true;
+    case FFA_PARTITION_INFO_GET_REGS:
+        ffa_handle_partition_info_get_regs(regs);
+        return true;
     case FFA_RX_RELEASE:
         e = ffa_rx_release(ctx);
         break;
@@ -625,9 +640,11 @@ static int ffa_domain_teardown(struct domain *d)
 
     if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) && ACCESS_ONCE(ctx->guest_vers) )
     {
-        dec_ffa_vm_count();
         write_lock(&ffa_ctx_list_rwlock);
+        /* Publish VM membership changes atomically with tag updates. */
+        dec_ffa_vm_count();
         list_del(&ctx->ctx_list);
+        ffa_partinfo_inc_tag();
         write_unlock(&ffa_ctx_list_rwlock);
     }
 
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 419e19510f6f..16da5ee567db 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -29,10 +29,39 @@ struct ffa_partition_info_1_1 {
     uint8_t uuid[16];
 };
 
+/* Registers a3..a17 (15 regs) carry partition descriptors, 3 regs each. */
+#define FFA_PARTINFO_REG_MAX_ENTRIES \
+    ((15 * sizeof(uint64_t)) / sizeof(struct ffa_partition_info_1_1))
+
 /* SP list cache (secure endpoints only); populated at init. */
 static void *sp_list __read_mostly;
 static uint32_t sp_list_count __read_mostly;
 static uint32_t sp_list_entry_size __read_mostly;
+
+/* SP list is static; tag only moves when VMs are added/removed. */
+static atomic_t ffa_partinfo_tag = ATOMIC_INIT(1);
+
+void ffa_partinfo_inc_tag(void)
+{
+    atomic_inc(&ffa_partinfo_tag);
+}
+
+static inline uint16_t ffa_partinfo_get_tag(void)
+{
+    /*
+     * Tag moves with VM list changes only.
+     *
+     * Limitation: we cannot detect an SPMC tag change between calls because we
+     * do not retain the previous SPMC tag; we only refresh it via the mandatory
+     * start_index=0 call and assume it stays stable while combined_tag (our
+     * VM/SP-count tag) is used for guest validation. This means SPMC tag
+     * changes alone will not trigger RETRY.
+     */
+    if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+        return atomic_read(&ffa_partinfo_tag) & GENMASK(15, 0);
+    else
+        return 1;
+}
 static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t flags,
                                       uint32_t *count, uint32_t *fpi_size)
 {
@@ -140,6 +169,7 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
     for ( n = 0; n < sp_list_count; n++ )
     {
         void *entry = sp_list + n * sp_list_entry_size;
+        void *dst_pos;
 
         if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
             continue;
@@ -151,11 +181,20 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
          * This is a non-compliance to the specification but 1.0 VMs should
          * handle that on their own to simplify Xen implementation.
          */
+        dst_pos = *dst_buf;
         ret = ffa_copy_info(dst_buf, end_buf, entry, dst_size,
                             sp_list_entry_size);
         if ( ret )
             return ret;
 
+        if ( !ffa_uuid_is_nil(uuid) &&
+             dst_size >= sizeof(struct ffa_partition_info_1_1) )
+        {
+            struct ffa_partition_info_1_1 *fpi = dst_pos;
+
+            memset(fpi->uuid, 0, sizeof(fpi->uuid));
+        }
+
         count++;
     }
 
@@ -167,6 +206,38 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
     return FFA_RET_OK;
 }
 
+static uint16_t ffa_get_sp_partinfo_regs(struct ffa_uuid uuid,
+                                         uint16_t start_index,
+                                         uint64_t *out_regs,
+                                         uint16_t max_entries)
+{
+    uint32_t idx = 0;
+    uint16_t filled = 0;
+    uint32_t n;
+
+    for ( n = 0; n < sp_list_count && filled < max_entries; n++ )
+    {
+        void *entry = sp_list + n * sp_list_entry_size;
+
+        if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
+            continue;
+
+        if ( idx++ < start_index )
+            continue;
+
+        memcpy(&out_regs[filled * 3], entry,
+               sizeof(struct ffa_partition_info_1_1));
+        if ( !ffa_uuid_is_nil(uuid) )
+        {
+            out_regs[filled * 3 + 1] = 0;
+            out_regs[filled * 3 + 2] = 0;
+        }
+        filled++;
+    }
+
+    return filled;
+}
+
 static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t start_index,
                                    uint32_t *vm_count, void **dst_buf,
                                    void *end_buf, uint32_t dst_size)
@@ -383,6 +454,135 @@ out:
     }
 }
 
+void ffa_handle_partition_info_get_regs(struct cpu_user_regs *regs)
+{
+    struct domain *d = current->domain;
+    struct ffa_ctx *ctx = d->arch.tee;
+    struct ffa_uuid uuid;
+    uint32_t sp_count = 0, vm_count = 0, total_count;
+    uint16_t start_index, tag;
+    uint16_t num_entries = 0;
+    uint64_t x3 = get_user_reg(regs, 3);
+    int32_t ret = FFA_RET_OK;
+    uint64_t out_regs[18] = { 0 };
+    unsigned int n;
+    uint16_t tag_out, tag_end;
+
+    if ( ACCESS_ONCE(ctx->guest_vers) < FFA_VERSION_1_2 )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out;
+    }
+
+    /*
+     * Registers a3..a17 (15 regs) carry partition descriptors, 3 regs each.
+     * For FF-A 1.2, that yields a maximum of 5 entries per GET_REGS call.
+     * Enforce the assumed layout so window sizing stays correct.
+     */
+    BUILD_BUG_ON(FFA_PARTINFO_REG_MAX_ENTRIES != 5);
+
+    start_index = x3 & GENMASK(15, 0);
+    tag = (x3 >> 16) & GENMASK(15, 0);
+
+    /* Start index must allow room for up to 5 entries without 16-bit overflow. */
+    if ( start_index > (GENMASK(15, 0) - (FFA_PARTINFO_REG_MAX_ENTRIES - 1)) )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    uuid.val[0] = get_user_reg(regs, 1);
+    uuid.val[1] = get_user_reg(regs, 2);
+
+    tag_out = ffa_partinfo_get_tag();
+
+    if ( start_index == 0 )
+    {
+        if ( tag )
+        {
+            ret = FFA_RET_INVALID_PARAMETERS;
+            goto out;
+        }
+    }
+    else if ( tag != tag_out )
+    {
+        ret = FFA_RET_RETRY;
+        goto out;
+    }
+
+    if ( ffa_uuid_is_nil(uuid) )
+    {
+        if ( IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+            vm_count = get_ffa_vm_count();
+        else
+            vm_count = 1; /* Caller VM only */
+    }
+
+    ret = ffa_get_sp_count(uuid, &sp_count);
+    if ( ret )
+        goto out;
+
+    total_count = sp_count + vm_count;
+
+    if ( total_count == 0 || start_index >= total_count )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    if ( start_index < sp_count )
+        num_entries = ffa_get_sp_partinfo_regs(uuid, start_index, &out_regs[3],
+                                               FFA_PARTINFO_REG_MAX_ENTRIES);
+
+    if ( num_entries < FFA_PARTINFO_REG_MAX_ENTRIES )
+    {
+        uint32_t vm_start = start_index > sp_count ?
+                            start_index - sp_count : 0;
+        uint32_t filled = 0;
+        void *vm_dst = &out_regs[3 + num_entries * 3];
+        void *vm_end = &out_regs[18];
+
+        ret = ffa_get_vm_partinfo(uuid, vm_start, &filled, &vm_dst, vm_end,
+                                  sizeof(struct ffa_partition_info_1_1));
+        if ( ret != FFA_RET_OK && ret != FFA_RET_NO_MEMORY )
+            goto out;
+
+        num_entries += filled;
+    }
+
+    if ( num_entries == 0 )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
+
+    /*
+     * Detect list changes while building the response so the caller can retry
+     * with a coherent snapshot tag.
+     */
+    tag_end = ffa_partinfo_get_tag();
+    if ( tag_end != tag_out )
+    {
+        ret = FFA_RET_RETRY;
+        goto out;
+    }
+
+    out_regs[0] = FFA_SUCCESS_64;
+    out_regs[2] = ((uint64_t)sizeof(struct ffa_partition_info_1_1) << 48) |
+                  ((uint64_t)tag_end << 32) |
+                  ((uint64_t)(start_index + num_entries - 1) << 16) |
+                  ((uint64_t)(total_count - 1) & GENMASK(15, 0));
+
+    for ( n = 0; n < ARRAY_SIZE(out_regs); n++ )
+        set_user_reg(regs, n, out_regs[n]);
+
+    return;
+
+out:
+    if ( ret )
+        ffa_set_regs_error(regs, ret);
+}
+
 static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
                                       uint8_t msg)
 {
diff --git a/xen/arch/arm/tee/ffa_private.h b/xen/arch/arm/tee/ffa_private.h
index 1a632983c860..c291f32b56ff 100644
--- a/xen/arch/arm/tee/ffa_private.h
+++ b/xen/arch/arm/tee/ffa_private.h
@@ -289,7 +289,7 @@
 #define FFA_MSG_SEND2                   0x84000086U
 #define FFA_CONSOLE_LOG_32              0x8400008AU
 #define FFA_CONSOLE_LOG_64              0xC400008AU
-#define FFA_PARTITION_INFO_GET_REGS     0x8400008BU
+#define FFA_PARTITION_INFO_GET_REGS     0xC400008BU
 #define FFA_MSG_SEND_DIRECT_REQ2        0xC400008DU
 #define FFA_MSG_SEND_DIRECT_RESP2       0xC400008EU
 
@@ -452,6 +452,8 @@ bool ffa_partinfo_init(void);
 int32_t ffa_partinfo_domain_init(struct domain *d);
 bool ffa_partinfo_domain_destroy(struct domain *d);
 void ffa_handle_partition_info_get(struct cpu_user_regs *regs);
+void ffa_handle_partition_info_get_regs(struct cpu_user_regs *regs);
+void ffa_partinfo_inc_tag(void);
 
 int32_t ffa_endpoint_domain_lookup(uint16_t endpoint_id, struct domain **d_out,
                                    struct ffa_ctx **ctx_out);
-- 
2.52.0


