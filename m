Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAG4BcTInmkuXQQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 11:02:44 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F6A1956FF
	for <lists+xen-devel@lfdr.de>; Wed, 25 Feb 2026 11:02:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240486.1541857 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvBit-0004OT-RC; Wed, 25 Feb 2026 10:02:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240486.1541857; Wed, 25 Feb 2026 10:02:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vvBit-0004Lu-Nk; Wed, 25 Feb 2026 10:02:27 +0000
Received: by outflank-mailman (input) for mailman id 1240486;
 Wed, 25 Feb 2026 10:02:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tMbn=A5=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vvBis-0004Lo-I7
 for xen-devel@lists.xenproject.org; Wed, 25 Feb 2026 10:02:26 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 14c26905-1231-11f1-9ccf-f158ae23cfc8;
 Wed, 25 Feb 2026 11:02:23 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA74D1691;
 Wed, 25 Feb 2026 02:02:16 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.86])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BCE703F62B;
 Wed, 25 Feb 2026 02:02:21 -0800 (PST)
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
X-Inumbo-ID: 14c26905-1231-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 2/4] xen/arm: ffa: Cache SP partition info at init
Date: Wed, 25 Feb 2026 10:57:44 +0100
Message-ID: <0a5f66eaa16f262d4ffad6a8ec4b1b02461f96c1.1772013062.git.bertrand.marquis@arm.com>
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
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:volodymyr_babchuk@epam.com,m:jens.wiklander@linaro.org,m:sstabellini@kernel.org,m:julien@xen.org,m:michal.orzel@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[bertrand.marquis@arm.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RSPAMD_EMAILBL_FAIL(0.00)[bertrand.marquis.arm.com:query timed out];
	NEURAL_HAM(-0.00)[-0.975];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,arm.com:mid,arm.com:email]
X-Rspamd-Queue-Id: D9F6A1956FF
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
 xen/arch/arm/tee/ffa_partinfo.c | 205 +++++++++++++++++++++-----------
 1 file changed, 138 insertions(+), 67 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 6a6f3ffb822e..8a3eac25f99f 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -6,6 +6,7 @@
 #include <xen/const.h>
 #include <xen/sizes.h>
 #include <xen/types.h>
+#include <xen/xmalloc.h>
 
 #include <asm/smccc.h>
 #include <asm/regs.h>
@@ -33,6 +34,10 @@ static uint16_t subscr_vm_created_count __read_mostly;
 static uint16_t *subscr_vm_destroyed __read_mostly;
 static uint16_t subscr_vm_destroyed_count __read_mostly;
 
+/* SP list cache (secure endpoints only); populated at init. */
+static void *sp_list __read_mostly;
+static uint32_t sp_list_count __read_mostly;
+static uint32_t sp_list_entry_size __read_mostly;
 static int32_t ffa_partition_info_get(struct ffa_uuid uuid, uint32_t flags,
                                       uint32_t *count, uint32_t *fpi_size)
 {
@@ -79,92 +84,78 @@ static int32_t ffa_copy_info(void **dst, void *dst_end, const void *src,
     return FFA_RET_OK;
 }
 
-static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_count)
+static bool ffa_sp_entry_matches_uuid(const void *entry, struct ffa_uuid uuid)
 {
-    uint32_t src_size;
+    const struct ffa_partition_info_1_1 *fpi = entry;
+    struct ffa_uuid sp_uuid;
+
+    if ( ffa_uuid_is_nil(uuid) )
+        return true;
 
-    return ffa_partition_info_get(uuid, FFA_PARTITION_INFO_GET_COUNT_FLAG,
-                                  sp_count, &src_size);
+    if ( sp_list_entry_size < sizeof(*fpi) )
+        return false;
+
+    memcpy(&sp_uuid, fpi->uuid, sizeof(sp_uuid));
+    return ffa_uuid_equal(uuid, sp_uuid);
 }
 
-static int32_t ffa_get_sp_partinfo(struct ffa_uuid uuid, uint32_t *sp_count,
-                                   void **dst_buf, void *end_buf,
-                                   uint32_t dst_size)
+static int32_t ffa_get_sp_count(struct ffa_uuid uuid, uint32_t *sp_count)
 {
-    int32_t ret;
-    int32_t release_ret;
-    uint32_t src_size, real_sp_count;
-    void *src_buf;
     uint32_t count = 0;
-    bool notify_fw = false;
-
-    /* We need to use the RX buffer to receive the list */
-    src_buf = ffa_rxtx_spmc_rx_acquire();
-    if ( !src_buf )
-        return FFA_RET_DENIED;
-
-    ret = ffa_partition_info_get(uuid, 0, &real_sp_count, &src_size);
-    if ( ret )
-        goto out;
-    notify_fw = true;
+    uint32_t n;
 
-    /* Validate the src_size we got */
-    if ( src_size < sizeof(struct ffa_partition_info_1_0) ||
-         src_size >= FFA_PAGE_SIZE )
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
 
-        src_buf += src_size;
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
+
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
@@ -435,6 +426,14 @@ static int32_t ffa_direct_req_send_vm(uint16_t sp_id, uint16_t vm_id,
     return res;
 }
 
+static void ffa_sp_list_cache_free(void)
+{
+    XFREE(sp_list);
+    sp_list = NULL;
+    sp_list_count = 0;
+    sp_list_entry_size = 0;
+}
+
 static void uninit_subscribers(void)
 {
         subscr_vm_created_count = 0;
@@ -443,6 +442,68 @@ static void uninit_subscribers(void)
         XFREE(subscr_vm_destroyed);
 }
 
+static bool ffa_sp_list_cache_init(const void *buf, uint32_t count,
+                                   uint32_t fpi_size)
+{
+    const uint8_t *src = buf;
+    uint32_t secure_count = 0;
+    uint32_t n, idx = 0;
+    bool warned = false;
+
+    if ( fpi_size < sizeof(struct ffa_partition_info_1_0) ||
+         fpi_size >= FFA_PAGE_SIZE )
+        return false;
+
+    if ( count > (FFA_RXTX_PAGE_COUNT * FFA_PAGE_SIZE) / fpi_size )
+        return false;
+
+    for ( n = 0; n < count; n++ )
+    {
+        const struct ffa_partition_info_1_0 *fpi =
+            (const void *)(src + n * fpi_size);
+
+        if ( !FFA_ID_IS_SECURE(fpi->id) )
+        {
+            if ( !warned )
+            {
+                printk_once(XENLOG_ERR
+                            "ffa: Firmware is not using bit 15 convention for IDs !!\n");
+                warned = true;
+            }
+            printk(XENLOG_ERR
+                   "ffa: Secure partition with id 0x%04x cannot be used\n",
+                   fpi->id);
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
+        const struct ffa_partition_info_1_0 *fpi =
+            (const void *)(src + n * fpi_size);
+
+        if ( !FFA_ID_IS_SECURE(fpi->id) )
+            continue;
+
+        memcpy(sp_list + idx * fpi_size, fpi, fpi_size);
+        idx++;
+    }
+
+    return true;
+}
+
 static bool init_subscribers(void *buf, uint16_t count, uint32_t fpi_size)
 {
     uint16_t n;
@@ -549,12 +610,22 @@ bool ffa_partinfo_init(void)
         goto out;
     }
 
-    ret = init_subscribers(spmc_rx, count, fpi_size);
+    if ( !ffa_sp_list_cache_init(spmc_rx, count, fpi_size) )
+    {
+        printk(XENLOG_ERR "ffa: Failed to cache SP list\n");
+        goto out;
+    }
+
+    ret = init_subscribers(sp_list, sp_list_count, sp_list_entry_size);
 
 out:
     e = ffa_rxtx_spmc_rx_release(notify_fw);
     if ( e )
         printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d\n", e);
+    if ( !ret )
+        uninit_subscribers();
+    if ( !ret )
+        ffa_sp_list_cache_free();
     return ret;
 }
 
-- 
2.52.0


