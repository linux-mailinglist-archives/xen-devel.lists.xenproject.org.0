Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GPPEMTInmmnXQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 11:02:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 753C8195701
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 11:02:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240489.1541882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvBiw-0004uF-JP; Wed, 25 Feb 2026 10:02:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240489.1541882; Wed, 25 Feb 2026 10:02:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvBiw-0004pZ-CB; Wed, 25 Feb 2026 10:02:30 +0000
Received: by outflank-mailman (input) for mailman id 1240489;
 Wed, 25 Feb 2026 10:02:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMbn=A5=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vvBiu-0004U5-Dp
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 10:02:28 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 16ea283a-1231-11f1-b164-2bf370ae4941;
 Wed, 25 Feb 2026 11:02:27 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 572B016A3;
 Wed, 25 Feb 2026 02:02:20 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.86])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46CCB3F62B;
 Wed, 25 Feb 2026 02:02:25 -0800 (PST)
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
X-Inumbo-ID: 16ea283a-1231-11f1-b164-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 4/4] xen/arm: ffa: Add cached GET_REGS support
Date: Wed, 25 Feb 2026 10:57:46 +0100
Message-ID: <832ba950a53a7139b51053f6570fd9b26ba42df1.1772013062.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772013062.git.bertrand.marquis@arm.com>
References: <cover.1772013062.git.bertrand.marquis@arm.com>
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
	RCVD_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.980];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: 753C8195701
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

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c          |  16 +++
 xen/arch/arm/tee/ffa_partinfo.c | 211 ++++++++++++++++++++++++++++++++
 xen/arch/arm/tee/ffa_private.h  |   4 +-
 3 files changed, 230 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index aa43ae2595d7..d56eb20c2239 100644
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
@@ -188,6 +193,7 @@ static bool ffa_negotiate_version(struct cpu_user_regs *regs)
             write_lock(&ffa_ctx_list_rwlock);
             list_add_tail(&ctx->ctx_list, &ffa_ctx_head);
             write_unlock(&ffa_ctx_list_rwlock);
+            ffa_partinfo_inc_tag();
         }
 
         goto out_continue;
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
@@ -629,6 +644,7 @@ static int ffa_domain_teardown(struct domain *d)
         write_lock(&ffa_ctx_list_rwlock);
         list_del(&ctx->ctx_list);
         write_unlock(&ffa_ctx_list_rwlock);
+        ffa_partinfo_inc_tag();
     }
 
     ffa_rxtx_domain_destroy(d);
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index d7f9b9f7153c..1c7b3579f798 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -28,10 +28,39 @@ struct ffa_partition_info_1_1 {
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
@@ -125,6 +154,7 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
     for ( n = 0; n < sp_list_count; n++ )
     {
         void *entry = sp_list + n * sp_list_entry_size;
+        void *dst_pos;
 
         if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
             continue;
@@ -136,11 +166,20 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
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
 
@@ -152,6 +191,38 @@ static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
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
@@ -368,6 +439,146 @@ out:
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
+    uint16_t tag_out;
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
+    for ( n = 4; n <= 17; n++ )
+    {
+        if ( get_user_reg(regs, n) )
+        {
+            ret = FFA_RET_INVALID_PARAMETERS;
+            goto out;
+        }
+    }
+
+    if ( x3 >> 32 )
+    {
+        ret = FFA_RET_INVALID_PARAMETERS;
+        goto out;
+    }
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
+    if ( sp_list_count &&
+         sp_list_entry_size != sizeof(struct ffa_partition_info_1_1) )
+    {
+        ret = FFA_RET_NOT_SUPPORTED;
+        goto out;
+    }
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
+    out_regs[0] = FFA_SUCCESS_64;
+    out_regs[2] = ((uint64_t)sizeof(struct ffa_partition_info_1_1) << 48) |
+                  ((uint64_t)tag_out << 32) |
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


