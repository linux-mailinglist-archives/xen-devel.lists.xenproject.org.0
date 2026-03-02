Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPO9FHKwpWkiEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:44:50 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C05E1DC162
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244375.1543844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Rr-0006qA-QM; Mon, 02 Mar 2026 15:44:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244375.1543844; Mon, 02 Mar 2026 15:44:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5Rr-0006mx-M9; Mon, 02 Mar 2026 15:44:43 +0000
Received: by outflank-mailman (input) for mailman id 1244375;
 Mon, 02 Mar 2026 15:44:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f7KG=BC=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vx5Rq-00060E-2A
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:44:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id b949a518-164e-11f1-9ccf-f158ae23cfc8;
 Mon, 02 Mar 2026 16:44:39 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17D21570;
 Mon,  2 Mar 2026 07:44:32 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.82.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E32103F73B;
 Mon,  2 Mar 2026 07:44:37 -0800 (PST)
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
X-Inumbo-ID: b949a518-164e-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v2 3/4] xen/arm: ffa: Drop SP subscriber lists
Date: Mon,  2 Mar 2026 16:44:12 +0100
Message-ID: <055bed7c55f298a0916518fb61929bfc7dac6ef2.1772464956.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1772464956.git.bertrand.marquis@arm.com>
References: <cover.1772464956.git.bertrand.marquis@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2C05E1DC162
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
	NEURAL_HAM(-0.00)[-0.954];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo]
X-Rspamd-Action: no action

The init-time SP cache already contains partition properties, but the
code still builds separate subscriber arrays for VM created/destroyed
notifications. That duplicates state and allocation.

Use the cached SP list directly to:
- decide which SPs receive created/destroyed notifications
- build the per-domain destroy bitmap
- skip destroy notifications for SPs not notified on create

Also switch cached SP entry field reads in VM create/destroy
notification paths to unaligned-safe helpers, as cache entries are
variable-size and should not be dereferenced via struct pointers.

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
Changes since v1:
- use unaligned-safe reads for cached SP entry fields
  (id/partition_properties) in VM create/destroy notification paths
---
 xen/arch/arm/tee/ffa_partinfo.c | 170 +++++++++-----------------------
 1 file changed, 47 insertions(+), 123 deletions(-)

diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index b933becaa55a..419e19510f6f 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -29,12 +29,6 @@ struct ffa_partition_info_1_1 {
     uint8_t uuid[16];
 };
 
-/* SPs subscribing to VM_CREATE and VM_DESTROYED events */
-static uint16_t *subscr_vm_created __read_mostly;
-static uint16_t subscr_vm_created_count __read_mostly;
-static uint16_t *subscr_vm_destroyed __read_mostly;
-static uint16_t subscr_vm_destroyed_count __read_mostly;
-
 /* SP list cache (secure endpoints only); populated at init. */
 static void *sp_list __read_mostly;
 static uint32_t sp_list_count __read_mostly;
@@ -92,6 +86,14 @@ static uint16_t ffa_sp_entry_read_id(const void *entry)
                            offsetof(struct ffa_partition_info_1_0, id));
 }
 
+static uint32_t ffa_sp_entry_read_partition_properties(const void *entry)
+{
+    return get_unaligned_t(uint32_t,
+                           (const uint8_t *)entry +
+                           offsetof(struct ffa_partition_info_1_0,
+                                    partition_properties));
+}
+
 static bool ffa_sp_entry_matches_uuid(const void *entry, struct ffa_uuid uuid)
 {
     struct ffa_uuid sp_uuid;
@@ -440,14 +442,6 @@ static void ffa_sp_list_cache_free(void)
     sp_list_entry_size = 0;
 }
 
-static void uninit_subscribers(void)
-{
-        subscr_vm_created_count = 0;
-        subscr_vm_destroyed_count = 0;
-        XFREE(subscr_vm_created);
-        XFREE(subscr_vm_destroyed);
-}
-
 static bool ffa_sp_list_cache_init(const void *buf, uint32_t count,
                                    uint32_t fpi_size)
 {
@@ -505,79 +499,6 @@ static bool ffa_sp_list_cache_init(const void *buf, uint32_t count,
     return true;
 }
 
-static bool init_subscribers(void *buf, uint16_t count, uint32_t fpi_size)
-{
-    uint16_t n;
-    uint16_t c_pos;
-    uint16_t d_pos;
-    struct ffa_partition_info_1_1 *fpi;
-
-    if ( fpi_size < sizeof(struct ffa_partition_info_1_1) )
-    {
-        printk(XENLOG_ERR "ffa: partition info size invalid: %u\n", fpi_size);
-        return false;
-    }
-
-    subscr_vm_created_count = 0;
-    subscr_vm_destroyed_count = 0;
-    for ( n = 0; n < count; n++ )
-    {
-        fpi = buf + n * fpi_size;
-
-        /*
-         * We need to have secure partitions using bit 15 set convention for
-         * secure partition IDs.
-         * Inform the user with a log and discard giving created or destroy
-         * event to those IDs.
-         */
-        if ( !FFA_ID_IS_SECURE(fpi->id) )
-        {
-            printk_once(XENLOG_ERR
-                        "ffa: Firmware is not using bit 15 convention for IDs !!\n");
-            printk(XENLOG_ERR
-                   "ffa: Secure partition with id 0x%04x cannot be used\n",
-                   fpi->id);
-        }
-        else
-        {
-            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
-                subscr_vm_created_count++;
-            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
-                subscr_vm_destroyed_count++;
-        }
-    }
-
-    if ( subscr_vm_created_count )
-        subscr_vm_created = xzalloc_array(uint16_t, subscr_vm_created_count);
-    if ( subscr_vm_destroyed_count )
-        subscr_vm_destroyed = xzalloc_array(uint16_t,
-                                            subscr_vm_destroyed_count);
-    if ( (subscr_vm_created_count && !subscr_vm_created) ||
-         (subscr_vm_destroyed_count && !subscr_vm_destroyed) )
-    {
-        printk(XENLOG_ERR "ffa: Failed to allocate subscription lists\n");
-        uninit_subscribers();
-        return false;
-    }
-
-    for ( c_pos = 0, d_pos = 0, n = 0; n < count; n++ )
-    {
-        fpi = buf + n * fpi_size;
-
-        if ( FFA_ID_IS_SECURE(fpi->id) )
-        {
-            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_CREATED )
-                subscr_vm_created[c_pos++] = fpi->id;
-            if ( fpi->partition_properties & FFA_PART_PROP_NOTIF_DESTROYED )
-                subscr_vm_destroyed[d_pos++] = fpi->id;
-        }
-    }
-
-    return true;
-}
-
-
-
 bool ffa_partinfo_init(void)
 {
     bool ret = false;
@@ -617,52 +538,39 @@ bool ffa_partinfo_init(void)
         goto out_release_rx;
     }
 
-    if ( !init_subscribers(sp_list, sp_list_count, sp_list_entry_size) )
-        goto out_free_sp_cache;
-
     ret = true;
     goto out_release_rx;
 
-out_free_sp_cache:
-    ffa_sp_list_cache_free();
-
 out_release_rx:
     e = ffa_rxtx_spmc_rx_release(notify_fw);
     if ( e )
         printk(XENLOG_WARNING "ffa: Error releasing SPMC RX buffer: %d\n", e);
-
+    if ( !ret )
+        ffa_sp_list_cache_free();
     return ret;
 }
 
-static bool is_in_subscr_list(const uint16_t *subscr, uint16_t start,
-                              uint16_t end, uint16_t sp_id)
+static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
+                                   unsigned int first_unnotified)
 {
     unsigned int n;
 
-    for ( n = start; n < end; n++ )
+    for ( n = 0; n < sp_list_count; n++ )
     {
-        if ( subscr[n] == sp_id )
-            return true;
-    }
-
-    return false;
-}
+        const void *entry = sp_list + n * sp_list_entry_size;
+        uint32_t partition_props =
+            ffa_sp_entry_read_partition_properties(entry);
 
-static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
-                                   unsigned int create_signal_count)
-{
-    unsigned int n;
+        if ( !(partition_props & FFA_PART_PROP_NOTIF_DESTROYED) )
+            continue;
 
-    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
-    {
         /*
          * Skip SPs subscribed to the VM created event that never was
          * notified of the VM creation due to an error during
          * ffa_domain_init().
          */
-        if ( is_in_subscr_list(subscr_vm_created, create_signal_count,
-                               subscr_vm_created_count,
-                               subscr_vm_destroyed[n]) )
+        if ( (partition_props & FFA_PART_PROP_NOTIF_CREATED) &&
+             n >= first_unnotified )
             continue;
 
         set_bit(n, ctx->vm_destroy_bitmap);
@@ -671,32 +579,42 @@ static void vm_destroy_bitmap_init(struct ffa_ctx *ctx,
 
 int32_t ffa_partinfo_domain_init(struct domain *d)
 {
-    unsigned int count = BITS_TO_LONGS(subscr_vm_destroyed_count);
+    unsigned int count = BITS_TO_LONGS(sp_list_count);
     struct ffa_ctx *ctx = d->arch.tee;
     unsigned int n;
+    unsigned int first_unnotified = sp_list_count;
     int32_t res;
 
-    if ( !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) )
+    if ( !ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ_32) || !sp_list_count )
         return 0;
 
     ctx->vm_destroy_bitmap = xzalloc_array(unsigned long, count);
     if ( !ctx->vm_destroy_bitmap )
         return -ENOMEM;
 
-    for ( n = 0; n < subscr_vm_created_count; n++ )
+    for ( n = 0; n < sp_list_count; n++ )
     {
-        res = ffa_direct_req_send_vm(subscr_vm_created[n], ffa_get_vm_id(d),
+        const void *entry = sp_list + n * sp_list_entry_size;
+        uint32_t partition_props =
+            ffa_sp_entry_read_partition_properties(entry);
+        uint16_t id = ffa_sp_entry_read_id(entry);
+
+        if ( !(partition_props & FFA_PART_PROP_NOTIF_CREATED) )
+            continue;
+
+        res = ffa_direct_req_send_vm(id, ffa_get_vm_id(d),
                                      FFA_MSG_SEND_VM_CREATED);
         if ( res )
         {
             printk(XENLOG_ERR "ffa: Failed to report creation of vm_id %u to  %u: res %d\n",
-                   ffa_get_vm_id(d), subscr_vm_created[n], res);
+                   ffa_get_vm_id(d), id, res);
+            first_unnotified = n;
             break;
         }
     }
-    vm_destroy_bitmap_init(ctx, n);
+    vm_destroy_bitmap_init(ctx, first_unnotified);
 
-    if ( n != subscr_vm_created_count )
+    if ( first_unnotified != sp_list_count )
         return -EIO;
 
     return 0;
@@ -711,18 +629,24 @@ bool ffa_partinfo_domain_destroy(struct domain *d)
     if ( !ctx->vm_destroy_bitmap )
         return true;
 
-    for ( n = 0; n < subscr_vm_destroyed_count; n++ )
+    for ( n = 0; n < sp_list_count; n++ )
     {
+        const void *entry;
+        uint16_t id;
+
         if ( !test_bit(n, ctx->vm_destroy_bitmap) )
             continue;
 
-        res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_vm_id(d),
+        entry = sp_list + n * sp_list_entry_size;
+        id = ffa_sp_entry_read_id(entry);
+
+        res = ffa_direct_req_send_vm(id, ffa_get_vm_id(d),
                                      FFA_MSG_SEND_VM_DESTROYED);
 
         if ( res && printk_ratelimit() )
             printk(XENLOG_WARNING
                    "%pd: ffa: Failed to report destruction of vm_id %u to %u: res %d\n",
-                   d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
+                   d, ffa_get_vm_id(d), id, res);
 
         /*
          * For these two error codes the hypervisor is expected to resend
@@ -734,7 +658,7 @@ bool ffa_partinfo_domain_destroy(struct domain *d)
             clear_bit(n, ctx->vm_destroy_bitmap);
     }
 
-    if ( bitmap_empty(ctx->vm_destroy_bitmap, subscr_vm_destroyed_count) )
+    if ( bitmap_empty(ctx->vm_destroy_bitmap, sp_list_count) )
         XFREE(ctx->vm_destroy_bitmap);
 
     return !ctx->vm_destroy_bitmap;
-- 
2.52.0


