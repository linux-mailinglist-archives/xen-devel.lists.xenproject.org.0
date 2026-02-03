Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNh+Krwygml5QQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:08 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A623DCE89
	for <lists+xen-devel@lfdr.de>; Tue, 03 Feb 2026 18:39:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1219549.1528475 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMa-0002W9-Er; Tue, 03 Feb 2026 17:38:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1219549.1528475; Tue, 03 Feb 2026 17:38:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vnKMa-0002TW-6g; Tue, 03 Feb 2026 17:38:56 +0000
Received: by outflank-mailman (input) for mailman id 1219549;
 Tue, 03 Feb 2026 17:38:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbdA=AH=arm.com=bertrand.marquis@srs-se1.protection.inumbo.net>)
 id 1vnKMY-0000Zt-Pm
 for xen-devel@lists.xenproject.org; Tue, 03 Feb 2026 17:38:54 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 347a7422-0127-11f1-9ccf-f158ae23cfc8;
 Tue, 03 Feb 2026 18:38:52 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7201A150C;
 Tue,  3 Feb 2026 09:38:45 -0800 (PST)
Received: from C3HXLD123V.arm.com (unknown [10.57.54.220])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D84193F632;
 Tue,  3 Feb 2026 09:38:50 -0800 (PST)
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
X-Inumbo-ID: 347a7422-0127-11f1-9ccf-f158ae23cfc8
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 08/12] xen/arm: ffa: Fix FFA_FEATURES validation
Date: Tue,  3 Feb 2026 18:38:03 +0100
Message-ID: <5331b33343441028d10c290b21b82acce295fff0.1770115302.git.bertrand.marquis@arm.com>
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
X-Rspamd-Queue-Id: 5A623DCE89
X-Rspamd-Action: no action

FFA_FEATURES currently accepts non-zero input properties (w2-w7) from
guests and advertises several ABIs unconditionally, even when firmware
support is missing or when the ABI is physical-instance-only. This can
mislead guests about what Xen can actually provide and violates FF-A
calling conventions. Some SPMCs (Hafnium v2.14 or earlier) also fail to
report FFA_RX_ACQUIRE despite supporting it.

Update FFA_FEATURES validation to match spec and firmware support:
- reject non-zero w2-w7 input properties with INVALID_PARAMETERS
- reject 64-bit calling conventions from 32-bit guests with NOT_SUPPORTED
- return NOT_SUPPORTED for physical-instance-only ABIs
(FFA_NOTIFICATION_BITMAP_{CREATE,DESTROY}, FFA_RX_ACQUIRE)
- advertise FFA_INTERRUPT as supported
- gate message ABIs on firmware support:
- FFA_MSG_SEND_DIRECT_REQ_{32,64}
- FFA_MSG_SEND_DIRECT_REQ2 (also requires FF-A 1.2 negotiation)
- FFA_MSG_SEND2 (or VM-to-VM enabled)
- report MEM_SHARE_{32,64} only when FFA_MEM_SHARE_64 is supported
- stop advertising FFA_MSG_YIELD (not implemented)

Update firmware probing: drop FFA_MEM_SHARE_32 checks (deprecated) and
add FFA_RX_ACQUIRE to the probed set. If FFA_MSG_SEND2 is reported but
FFA_RX_ACQUIRE is not, assume RX_ACQUIRE support and warn to work
around the Hafnium bug.

Functional impact: guests now see ABI support that reflects firmware
capabilities and Xen implementation status. When SEND2 is present but
RX_ACQUIRE is not reported, Xen assumes RX_ACQUIRE support.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/tee/ffa.c | 62 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 7 deletions(-)

diff --git a/xen/arch/arm/tee/ffa.c b/xen/arch/arm/tee/ffa.c
index 6de2b9f8ac8e..e9e020bb0cb3 100644
--- a/xen/arch/arm/tee/ffa.c
+++ b/xen/arch/arm/tee/ffa.c
@@ -91,10 +91,10 @@ static const struct ffa_fw_abi ffa_fw_abi_needed[] = {
     FW_ABI(FFA_PARTITION_INFO_GET),
     FW_ABI(FFA_NOTIFICATION_INFO_GET_64),
     FW_ABI(FFA_NOTIFICATION_GET),
+    FW_ABI(FFA_RX_ACQUIRE),
     FW_ABI(FFA_RX_RELEASE),
     FW_ABI(FFA_RXTX_MAP_64),
     FW_ABI(FFA_RXTX_UNMAP),
-    FW_ABI(FFA_MEM_SHARE_32),
     FW_ABI(FFA_MEM_SHARE_64),
     FW_ABI(FFA_MEM_RECLAIM),
     FW_ABI(FFA_MSG_SEND_DIRECT_REQ_32),
@@ -240,19 +240,39 @@ static void handle_features(struct cpu_user_regs *regs)
     struct ffa_ctx *ctx = d->arch.tee;
     unsigned int n;
 
+    /*
+     * Xen does not accept any non-zero FFA_FEATURES input properties from
+     * VMs. The spec only defines w2 input properties for FFA_MEM_RETRIEVE_REQ
+     * (NS-bit negotiation for SP/SPMC) and FFA_RXTX_MAP (buffer size and
+     * alignment), so w2 must be MBZ for our callers.
+     */
     for ( n = 2; n <= 7; n++ )
     {
         if ( get_user_reg(regs, n) )
         {
-            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+            ffa_set_regs_error(regs, FFA_RET_INVALID_PARAMETERS);
             return;
         }
     }
 
+    if ( !is_64bit_domain(d) && smccc_is_conv_64(a1) )
+    {
+        /* 32bit guests should only use 32bit convention calls */
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        return;
+    }
+
     switch ( a1 )
     {
+    case FFA_NOTIFICATION_BITMAP_CREATE:
+    case FFA_NOTIFICATION_BITMAP_DESTROY:
+    case FFA_RX_ACQUIRE:
+        /* Physical-instance-only ABIs are not exposed to VMs. */
+        ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        break;
     case FFA_ERROR:
     case FFA_VERSION:
+    case FFA_INTERRUPT:
     case FFA_SUCCESS_32:
     case FFA_SUCCESS_64:
     case FFA_FEATURES:
@@ -261,16 +281,25 @@ static void handle_features(struct cpu_user_regs *regs)
     case FFA_RXTX_UNMAP:
     case FFA_MEM_RECLAIM:
     case FFA_PARTITION_INFO_GET:
+        ffa_set_regs_success(regs, 0, 0);
+        break;
     case FFA_MSG_SEND_DIRECT_REQ_32:
     case FFA_MSG_SEND_DIRECT_REQ_64:
-    case FFA_MSG_SEND2:
     case FFA_RUN:
-    case FFA_INTERRUPT:
-    case FFA_MSG_YIELD:
-        ffa_set_regs_success(regs, 0, 0);
+        if ( ffa_fw_supports_fid(a1) )
+            ffa_set_regs_success(regs, 0, 0);
+        else
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+        break;
+    case FFA_MSG_SEND2:
+        if ( ffa_fw_supports_fid(a1) || IS_ENABLED(CONFIG_FFA_VM_TO_VM) )
+            ffa_set_regs_success(regs, 0, 0);
+        else
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
         break;
     case FFA_MSG_SEND_DIRECT_REQ2:
-        if ( ACCESS_ONCE(ctx->guest_vers) >= FFA_VERSION_1_2 )
+        if ( ACCESS_ONCE(ctx->guest_vers) >= FFA_VERSION_1_2 &&
+             ffa_fw_supports_fid(FFA_MSG_SEND_DIRECT_REQ2) )
         {
             ffa_set_regs_success(regs, 0, 0);
         }
@@ -281,6 +310,11 @@ static void handle_features(struct cpu_user_regs *regs)
         break;
     case FFA_MEM_SHARE_64:
     case FFA_MEM_SHARE_32:
+        if ( !ffa_fw_supports_fid(FFA_MEM_SHARE_64) )
+        {
+            ffa_set_regs_error(regs, FFA_RET_NOT_SUPPORTED);
+            break;
+        }
         /*
          * We currently don't support dynamically allocated buffers. Report
          * that with 0 in bit[0] of w2.
@@ -688,6 +722,20 @@ static bool ffa_probe_fw(void)
                    ffa_fw_abi_needed[i].name);
     }
 
+    /*
+     * Hafnium v2.14 or earlier does not report FFA_RX_ACQUIRE in
+     * FFA_FEATURES even though it supports it.
+     */
+    if ( !ffa_fw_supports_fid(FFA_RX_ACQUIRE) &&
+         ffa_fw_supports_fid(FFA_MSG_SEND2) )
+    {
+        printk(XENLOG_WARNING
+               "ARM FF-A Firmware reports FFA_MSG_SEND2 without FFA_RX_ACQUIRE\n");
+        printk(XENLOG_WARNING
+               "ffa: assuming RX_ACQUIRE support (workaround)\n");
+        set_bit(FFA_ABI_BITNUM(FFA_RX_ACQUIRE), ffa_fw_abi_supported);
+    }
+
     if ( !ffa_rxtx_spmc_init() )
     {
         printk(XENLOG_ERR "ffa: Error during RXTX buffer init\n");
-- 
2.50.1 (Apple Git-155)


