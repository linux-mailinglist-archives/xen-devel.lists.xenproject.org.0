Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDRTHHCwpWkiEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:44:48 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E16011DC153
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:44:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244372.1543823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Rp-0006JO-72; Mon, 02 Mar 2026 15:44:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244372.1543823; Mon, 02 Mar 2026 15:44:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Rp-0006He-1l; Mon, 02 Mar 2026 15:44:41 +0000
Received: by outflank-mailman (input) for mailman id 1244372;
 Mon, 02 Mar 2026 15:44:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7KG=BC=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vx5Rn-0006Gr-6s
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:44:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b8194af2-164e-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 16:44:38 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 21967152B;
 Mon,  2 Mar 2026 07:44:31 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.82.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10B3F3F73B;
 Mon,  2 Mar 2026 07:44:35 -0800 (PST)
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
X-Inumbo-ID: b8194af2-164e-11f1-b164-2bf370ae4941
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 2/4] xen/arm: ffa: Cache SP partition info at init
Date: Mon,  2 Mar 2026 16:44:11 +0100
Message-ID: <e05fcde563e09dc63fbe4e3299049f6d6ebf903e.1772464956.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772464956.git.bertrand.marquis@arm.com>
References: <cover.1772464956.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: E16011DC153
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
	NEURAL_HAM(-0.00)[-0.955];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action

FFA_PARTITION_INFO_GET currently queries the SPMC on each call and walks the
RX buffer every time. The SP list is expected to be static, so repeated
firmware calls and validation are unnecessary.

Cache the SPMC partition-info list at init time, keeping only secure
endpoints, and reuse the cached entries for SP count and partition-info
responses. Initialize the VM create/destroy subscriber lists from the cached
list and free the cache on init failure.

SP partition info now reflects the init-time snapshot and will not change.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- removed unneeded NULL assignment after XFREE
- remove warned usage and only rely on printk_once to warn on the 15-bit
  convention
- rework ffa_partinfo_init cleanup
- ensure we do not do unaligned accesses when building the SP cache
- enforce SPMC partinfo size to be at least 1.1 structure size when
  creating and remove tests when using the cache
---
 xen/arch/arm/tee/ffa_partinfo.c | 216 +++++++++++++++++++++-----------
 1 file changed, 146 insertions(+), 70 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 6a6f3ffb822e..b933becaa55a 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -6,6 +6,8 @@
 #include <xen/const.h>
 #include <xen/sizes.h>
 #include <xen/types.h>
+#include <xen/unaligned.h>
+#include <xen/xmalloc.h>
 
 #include <asm/smccc.h>
 #include <asm/regs.h>
@@ -33,6 +35,10 @@ static uint16_t subscr_vm_created_count __read_mostly;
 static uint16_t *subscr_vm_destroyed __read_mostly;
 static uint16_t subscr_vm_destroyed_count __read_mostly;
 
+/* SP list cache (secure endpoints only); populated at init. */
+static void *sp_list __read_mostly;
+static uint32_t sp_list_count __read_mostly;
+static uint32_t sp_list_entry_size __read_mostly;
 static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t flags,
                                       uint32_t *count, uint32_t *fpi_size)
 {
@@ -79,92 +85,84 @@ static int32_t ffa_copy_info(void **dst, void *dst_end, const void *src,
     return FFA_RET_OK;
 }
 
-static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_count)
+static uint16_t ffa_sp_entry_read_id(const void *entry)
 {
-    uint32_t src_size;
-
-    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FLAG,
-                                  sp_count, &src_size);
+    return get_unaligned_t(uint16_t,
+                           (const uint8_t *)entry +
+                           offsetof(struct ffa_partition_info_1_0, id));
 }
 
-static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
-                                   void **dst_buf, void *end_buf,
-                                   uint32_t dst_size)
+static bool ffa_sp_entry_matches_uuid(const void *entry, struct ffa_uuid uuid)
 {
-    int32_t ret;
-    int32_t release_ret;
-    uint32_t src_size, real_sp_count;
-    void *src_buf;
-    uint32_t count = 0;
-    bool notify_fw = false;
+    struct ffa_uuid sp_uuid;
 
-    /* We need to use the RX buffer to receive the list */
-    src_buf = ffa_rxtx_spmc_rx_acquire();
-    if ( !src_buf )
-        return FFA_RET_DENIED;
+    if ( ffa_uuid_is_nil(uuid) )
+        return true;
 
-    ret = ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
-    if ( ret )
-        goto out;
-    notify_fw = true;
+    memcpy(&sp_uuid,
+           (const uint8_t *)entry +
+           offsetof(struct ffa_partition_info_1_1, uuid),
+           sizeof(sp_uuid));
+    return ffa_uuid_equal(uuid, sp_uuid);
+}
 
-    /* Validate the src_size we got */
-    if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
-         src_size >= FFA_PAGE_SIZE )
+static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_count)
+{
+    uint32_t count = 0;
+    uint32_t n;
+
+    for ( n = 0; n < sp_list_count; n++ )
     {
-        ret = FFA_RET_NOT_SUPPORTED;
-        goto out;
+        void *entry = sp_list + n * sp_list_entry_size;
+
+        if ( ffa_sp_entry_matches_uuid(entry, uuid) )
+            count++;
     }
 
-    /*
-     * Limit the maximum time we hold the CPU by limiting the number of SPs.
-     * We just ignore the extra ones as this is tested during init in
-     * ffa_partinfo_init so the only possible reason is SP have been added
-     * since boot.
-     */
-    if ( real_sp_count > FFA_MAX_NUM_SP )
-        real_sp_count = FFA_MAX_NUM_SP;
+    *sp_count = count;
 
-    /* Make sure the data fits in our buffer */
-    if ( real_sp_count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / src_size )
-    {
-        ret = FFA_RET_NOT_SUPPORTED;
-        goto out;
-    }
+    if ( !ffa_uuid_is_nil(uuid) && !count )
+        return FFA_RET_INVALID_PARAMETERS;
 
-    for ( uint32_t sp_num = 0; sp_num < real_sp_count; sp_num++ )
-    {
-        struct ffa_partition_info_1_1 *fpi = src_buf;
+    return FFA_RET_OK;
+}
 
-        /* filter out SP not following bit 15 convention if any */
-        if ( FFA_ID_IS_SECURE(fpi->id) )
-        {
-            /*
-             * If VM is 1.0 but firmware is 1.1 we could have several entries
-             * with the same ID but different UUIDs. In this case the VM will
-             * get a list with several time the same ID.
-             * This is a non-compliance to the specification but 1.0 VMs should
-             * handle that on their own to simplify Xen implementation.
-             */
+static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
+                                   void **dst_buf, void *end_buf,
+                                   uint32_t dst_size)
+{
+    int32_t ret;
+    uint32_t count = 0;
+    uint32_t n;
 
-            ret = ffa_copy_info(dst_buf, end_buf, src_buf, dst_size, src_size);
-            if ( ret )
-                goto out;
+    for ( n = 0; n < sp_list_count; n++ )
+    {
+        void *entry = sp_list + n * sp_list_entry_size;
 
-            count++;
-        }
+        if ( !ffa_sp_entry_matches_uuid(entry, uuid) )
+            continue;
+
+        /*
+         * If VM is 1.0 but firmware is 1.1 we could have several entries
+         * with the same ID but different UUIDs. In this case the VM will
+         * get a list with several time the same ID.
+         * This is a non-compliance to the specification but 1.0 VMs should
+         * handle that on their own to simplify Xen implementation.
+         */
+        ret = ffa_copy_info(dst_buf, end_buf, entry, dst_size,
+                            sp_list_entry_size);
+        if ( ret )
+            return ret;
 
-        src_buf += src_size;
+        count++;
     }
 
     *sp_count = count;
 
-out:
-    release_ret = ffa_rxtx_spmc_rx_release(notify_fw);
-    if ( release_ret )
-        gprintk(XENLOG_WARNING,
-                "ffa: Error releasing SPMC RX buffer: %d\n", release_ret);
-    return ret;
+    if ( !ffa_uuid_is_nil(uuid) && !count )
+        return FFA_RET_INVALID_PARAMETERS;
+
+    return FFA_RET_OK;
 }
 
 static int32_t ffa_get_vm_partinfo(struct ffa_uuid uuid, uint32_t start_index,
@@ -435,6 +433,13 @@ static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
     return res;
 }
 
+static void ffa_sp_list_cache_free(void)
+{
+    XFREE(sp_list);
+    sp_list_count = 0;
+    sp_list_entry_size = 0;
+}
+
 static void uninit_subscribers(void)
 {
         subscr_vm_created_count = 0;
@@ -443,6 +448,63 @@ static void uninit_subscribers(void)
         XFREE(subscr_vm_destroyed);
 }
 
+static bool ffa_sp_list_cache_init(const void *buf, uint32_t count,
+                                   uint32_t fpi_size)
+{
+    const uint8_t *src = buf;
+    uint32_t secure_count = 0;
+    uint32_t n, idx = 0;
+
+    if ( fpi_size < sizeof(struct ffa_partition_info_1_1) ||
+         fpi_size >= FFA_PAGE_SIZE )
+        return false;
+
+    if ( count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / fpi_size )
+        return false;
+
+    for ( n = 0; n < count; n++ )
+    {
+        const uint8_t *entry = src + n * fpi_size;
+        uint16_t id = ffa_sp_entry_read_id(entry);
+
+        if ( !FFA_ID_IS_SECURE(id) )
+        {
+            printk_once(XENLOG_ERR
+                        "ffa: Firmware is not using bit 15 convention for IDs !!\n");
+            printk(XENLOG_ERR
+                   "ffa: Secure partition with id 0x%04x cannot be used\n",
+                   id);
+            continue;
+        }
+
+        secure_count++;
+    }
+
+    if ( secure_count )
+    {
+        sp_list = xzalloc_bytes(secure_count * fpi_size);
+        if ( !sp_list )
+            return false;
+    }
+
+    sp_list_count = secure_count;
+    sp_list_entry_size = fpi_size;
+
+    for ( n = 0; n < count; n++ )
+    {
+        const uint8_t *entry = src + n * fpi_size;
+        uint16_t id = ffa_sp_entry_read_id(entry);
+
+        if ( !FFA_ID_IS_SECURE(id) )
+            continue;
+
+        memcpy(sp_list + idx * fpi_size, entry, fpi_size);
+        idx++;
+    }
+
+    return true;
+}
+
 static bool init_subscribers(void *buf, uint16_t count, uint32_t fpi_size)
 {
     uint16_t n;
@@ -538,7 +600,7 @@ bool ffa_partinfo_init(void)
     if ( e )
     {
         printk(XENLOG_ERR "ffa: Failed to get list of SPs: %d\n", e);
-        goto out;
+        goto out_release_rx;
     }
     notify_fw = true;
 
@@ -546,15 +608,29 @@ bool ffa_partinfo_init(void)
     {
         printk(XENLOG_ERR "ffa: More SPs than the maximum supported: %u - %u\n",
                count, FFA_MAX_NUM_SP);
-        goto out;
+        goto out_release_rx;
+    }
+
+    if ( !ffa_sp_list_cache_init(spmc_rx, count, fpi_size) )
+    {
+        printk(XENLOG_ERR "ffa: Failed to cache SP list\n");
+        goto out_release_rx;
     }
 
-    ret = init_subscribers(spmc_rx, count, fpi_size);
+    if ( !init_subscribers(sp_list, sp_list_count, sp_list_entry_size) )
+        goto out_free_sp_cache;
 
-out:
+    ret = true;
+    goto out_release_rx;
+
+out_free_sp_cache:
+    ffa_sp_list_cache_free();
+
+out_release_rx:
     e = ffa_rxtx_spmc_rx_release(notify_fw);
     if ( e )
         printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d\n", e);
+
     return ret;
 }
 
-- 
2.52.0


