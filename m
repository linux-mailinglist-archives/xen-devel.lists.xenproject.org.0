Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBOrC7c0gmmVQgMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:47:35 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C84E4DD0ED
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:47:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219609.1528485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKUm-000688-EO; Tue, 03 Feb 2026 17:47:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219609.1528485; Tue, 03 Feb 2026 17:47:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKUm-00065V-BS; Tue, 03 Feb 2026 17:47:24 +0000
Received: by outflank-mailman (input) for mailman id 1219609;
 Tue, 03 Feb 2026 17:47:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnKMb-0000Zt-QJ
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:38:57 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3616fea1-0127-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:38:54 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33F89339;
 Tue,  3 Feb 2026 09:38:48 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 76D9F3F632;
 Tue,  3 Feb 2026 09:38:53 -0800 (PST)
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
X-Inumbo-ID: 3616fea1-0127-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 10/12] xen/arm: ffa: Reduce logging noise
Date: Tue,  3 Feb 2026 18:38:05 +0100
Message-ID: <38d71ac53abeeb4598d6ffb6bdab3717b3531334.1770115302.git.bertrand.marquis@arm.com>
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
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: C84E4DD0ED
X-Rspamd-Action: no action

Several FF-A paths log warnings for expected or recoverable conditions,
leading to noisy logs during normal operation.

Reduce log noise by:
- demoting unhandled FID warnings to debug
- ratelimiting notification and VM teardown failures
- printing the bit-15 convention warning once per boot
- adjusting log prefixes for hypervisor-only events
- adding debug diagnostics for RX/TX acquire failures, with busy cases
  ratelimited

No functional changes.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c          | 11 ++++++-----
 xen/arch/arm/tee/ffa_notif.c    | 11 ++++++-----
 xen/arch/arm/tee/ffa_partinfo.c | 15 ++++++++-------
 xen/arch/arm/tee/ffa_rxtx.c     | 21 +++++++++++++++++++--
 4 files changed, 39 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index a46c6e5e67f1..d0b9c9f1ab2e 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -461,7 +461,7 @@ static bool ffa_handle_call(struct cpu_user_regs *regs)
         break;
 
     default:
-        gprintk(XENLOG_ERR, "ffa: unhandled fid 0x%x\n", fid);
+        gdprintk(XENLOG_DEBUG, "ffa: unhandled fid 0x%x\n", fid);
         e = FFA_RET_NOT_SUPPORTED;
         break;
     }
@@ -581,7 +581,8 @@ static void ffa_domain_teardown_continue(struct ffa_ctx *ctx, bool first_time)
 
     if ( retry )
     {
-        printk(XENLOG_G_INFO "%pd: ffa: Remaining cleanup, retrying\n", ctx->teardown_d);
+        printk(XENLOG_G_DEBUG "%pd: ffa: Remaining cleanup, retrying\n",
+               ctx->teardown_d);
 
         ctx->teardown_expire = NOW() + FFA_CTX_TEARDOWN_DELAY;
 
@@ -622,7 +623,7 @@ static void ffa_teardown_timer_callback(void *arg)
     if ( ctx )
         ffa_domain_teardown_continue(ctx, false /* !first_time */);
     else
-        printk(XENLOG_G_ERR "%s: teardown list is empty\n", __func__);
+        printk(XENLOG_ERR "%s: teardown list is empty\n", __func__);
 }
 
 /* This function is supposed to undo what ffa_domain_init() has done */
@@ -684,7 +685,7 @@ static bool ffa_probe_fw(void)
 
     if ( !ffa_get_version(&vers) )
     {
-        gprintk(XENLOG_ERR, "Cannot retrieve the FFA version\n");
+        printk(XENLOG_ERR "ffa: Cannot retrieve the FFA version\n");
         goto err_no_fw;
     }
 
@@ -724,7 +725,7 @@ static bool ffa_probe_fw(void)
             set_bit(FFA_ABI_BITNUM(ffa_fw_abi_needed[i].id),
                     ffa_fw_abi_supported);
         else
-            printk(XENLOG_INFO "ARM FF-A Firmware does not support %s\n",
+            printk(XENLOG_WARNING "ARM FF-A Firmware does not support %s\n",
                    ffa_fw_abi_needed[i].name);
     }
 
diff --git a/xen/arch/arm/tee/ffa_notif.c b/xen/arch/arm/tee/ffa_notif.c
index 37b05747cd21..186e72641237 100644
--- a/xen/arch/arm/tee/ffa_notif.c
+++ b/xen/arch/arm/tee/ffa_notif.c
@@ -292,8 +292,9 @@ static void notif_vm_pend_intr(uint16_t vm_id)
             break;
         }
     }
-    if ( !v )
-        printk(XENLOG_ERR "ffa: can't inject NPI, all vCPUs offline\n");
+    if ( !v && printk_ratelimit() )
+        printk(XENLOG_G_DEBUG "%pd: ffa: can't inject NPI, all vCPUs offline\n",
+               d);
 
 out_unlock:
     rcu_unlock_domain(d);
@@ -316,9 +317,9 @@ static void notif_sri_action(void *unused)
         res = ffa_get_ret_code(&resp);
         if ( res )
         {
-            if ( res != FFA_RET_NO_DATA )
-                printk(XENLOG_ERR "ffa: notification info get failed: error %d\n",
-                       res);
+            if ( res != FFA_RET_NO_DATA && printk_ratelimit() )
+                printk(XENLOG_WARNING
+                       "ffa: notification info get failed: error %d\n", res);
             return;
         }
 
diff --git a/xen/arch/arm/tee/ffa_partinfo.c b/xen/arch/arm/tee/ffa_partinfo.c
index 6b01c4abe915..c9f186b3720c 100644
--- a/xen/arch/arm/tee/ffa_partinfo.c
+++ b/xen/arch/arm/tee/ffa_partinfo.c
@@ -461,9 +461,11 @@ static bool init_subscribers(void *buf, uint16_t count, uint32_t fpi_size)
          */
         if ( !FFA_ID_IS_SECURE(fpi->id) )
         {
-            printk(XENLOG_ERR "ffa: Firmware is not using bit 15 convention for IDs !!\n"
-                              "ffa: Secure partition with id 0x%04x cannot be used\n",
-                              fpi->id);
+            printk_once(XENLOG_ERR
+                        "ffa: Firmware is not using bit 15 convention for IDs !!\n");
+            printk(XENLOG_ERR
+                   "ffa: Secure partition with id 0x%04x cannot be used\n",
+                   fpi->id);
         }
         else
         {
@@ -632,11 +634,10 @@ bool ffa_partinfo_domain_destroy(struct domain *d)
         res = ffa_direct_req_send_vm(subscr_vm_destroyed[n], ffa_get_vm_id(d),
                                      FFA_MSG_SEND_VM_DESTROYED);
 
-        if ( res )
-        {
-            printk(XENLOG_ERR "%pd: ffa: Failed to report destruction of vm_id %u to %u: res %d\n",
+        if ( res && printk_ratelimit() )
+            printk(XENLOG_WARNING
+                   "%pd: ffa: Failed to report destruction of vm_id %u to %u: res %d\n",
                    d, ffa_get_vm_id(d), subscr_vm_destroyed[n], res);
-        }
 
         /*
          * For these two error codes the hypervisor is expected to resend
diff --git a/xen/arch/arm/tee/ffa_rxtx.c b/xen/arch/arm/tee/ffa_rxtx.c
index 450ce102cbdc..3147aba21ddf 100644
--- a/xen/arch/arm/tee/ffa_rxtx.c
+++ b/xen/arch/arm/tee/ffa_rxtx.c
@@ -4,6 +4,7 @@
  */
 
 #include <xen/const.h>
+#include <xen/lib.h>
 #include <xen/domain_page.h>
 #include <xen/mm.h>
 #include <xen/sizes.h>
@@ -82,8 +83,9 @@ int32_t ffa_handle_rxtx_map(uint32_t fid, register_t tx_addr,
 
     if ( page_count > FFA_MAX_RXTX_PAGE_COUNT || !page_count )
     {
-        printk(XENLOG_ERR "ffa: RXTX_MAP: error: %u pages requested (limit %u)\n",
-               page_count, FFA_MAX_RXTX_PAGE_COUNT);
+        gdprintk(XENLOG_DEBUG,
+                 "ffa: RXTX_MAP: error: %u pages requested (limit %u)\n",
+                 page_count, FFA_MAX_RXTX_PAGE_COUNT);
         return FFA_RET_INVALID_PARAMETERS;
     }
 
@@ -303,12 +305,15 @@ int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **buf, size_t *buf_size)
     if ( !ctx->page_count )
     {
         ret = FFA_RET_DENIED;
+        gdprintk(XENLOG_DEBUG, "ffa: RX acquire denied, no RX/TX mapped\n");
         goto out;
     }
 
     if ( !ctx->rx_is_free )
     {
         ret = FFA_RET_BUSY;
+        if ( printk_ratelimit() )
+            gdprintk(XENLOG_DEBUG, "ffa: RX acquire busy\n");
         goto out;
     }
 
@@ -316,7 +321,10 @@ int32_t ffa_rx_acquire(struct ffa_ctx *ctx, void **buf, size_t *buf_size)
     {
         ret = ffa_simple_call(FFA_RX_ACQUIRE, ctx->ffa_id, 0, 0, 0);
         if ( ret != FFA_RET_OK )
+        {
+            gdprintk(XENLOG_DEBUG, "ffa: RX acquire failed: %d\n", ret);
             goto out;
+        }
     }
     ctx->rx_is_free = false;
     *buf = ctx->rx;
@@ -355,13 +363,22 @@ int32_t ffa_tx_acquire(struct ffa_ctx *ctx, const void **buf, size_t *buf_size)
     int32_t ret = FFA_RET_DENIED;
 
     if ( !spin_trylock(&ctx->tx_lock) )
+    {
+        gdprintk(XENLOG_DEBUG, "ffa: TX acquire busy\n");
         return FFA_RET_BUSY;
+    }
 
     if ( !ctx->page_count )
+    {
+        gdprintk(XENLOG_DEBUG, "ffa: TX acquire denied, no RX/TX mapped\n");
         goto err_unlock;
+    }
 
     if ( !ctx->tx )
+    {
+        gdprintk(XENLOG_DEBUG, "ffa: TX acquire denied, TX buffer missing\n");
         goto err_unlock;
+    }
 
     *buf = ctx->tx;
     *buf_size = ctx->page_count * FFA_PAGE_SIZE;
-- 
2.50.1 (Apple Git-155)


