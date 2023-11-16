Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 357FA7EE505
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 17:17:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634498.989995 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3f2C-0003IS-VZ; Thu, 16 Nov 2023 16:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634498.989995; Thu, 16 Nov 2023 16:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3f2C-0003Fv-Sr; Thu, 16 Nov 2023 16:16:04 +0000
Received: by outflank-mailman (input) for mailman id 634498;
 Thu, 16 Nov 2023 16:16:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cdtJ=G5=dingwall.me.uk=james@srs-se1.protection.inumbo.net>)
 id 1r3f2B-0003Fp-Ev
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 16:16:03 +0000
Received: from smarthost01b.sbp.mail.zen.net.uk
 (smarthost01b.sbp.mail.zen.net.uk [212.23.1.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6d0660ff-849b-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 17:15:58 +0100 (CET)
Received: from [217.155.64.189] (helo=mail0.xen.dingwall.me.uk)
 by smarthost01b.sbp.mail.zen.net.uk with esmtpsa (TLS1.0) tls
 TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA (Exim 4.95)
 (envelope-from <james@dingwall.me.uk>) id 1r3f25-008r4B-Gk
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 16:15:57 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail0.xen.dingwall.me.uk (Postfix) with ESMTP id 7379C8A255A
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 16:15:56 +0000 (GMT)
Received: from mail0.xen.dingwall.me.uk ([127.0.0.1])
 by localhost (mail0.xen.dingwall.me.uk [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y98fW0nheVOU for <xen-devel@lists.xenproject.org>;
 Thu, 16 Nov 2023 16:15:56 +0000 (GMT)
Received: from behemoth.dingwall.me.uk (behemoth.dingwall.me.uk
 [IPv6:2a02:8010:698e:302::c0a8:105])
 by dingwall.me.uk (Postfix) with ESMTP id 428088A2555
 for <xen-devel@lists.xenproject.org>; Thu, 16 Nov 2023 16:15:56 +0000 (GMT)
Received: by behemoth.dingwall.me.uk (Postfix, from userid 1000)
 id 8BF42B2A8F0; Thu, 16 Nov 2023 16:15:55 +0000 (GMT)
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
X-Inumbo-ID: 6d0660ff-849b-11ee-9b0e-b553b5be7939
X-Virus-Scanned: Debian amavisd-new at dingwall.me.uk
Date: Thu, 16 Nov 2023 16:15:55 +0000
From: James Dingwall <james-xen@dingwall.me.uk>
To: xen-devel@lists.xenproject.org
Subject: xen 4.15.5: msr_relaxed required for MSR 0x1a2
Message-ID: <ZVZAO/W0m/h+IPbi@dingwall.me.uk>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="YEu8yWOaMoSMZV1p"
Content-Disposition: inline
X-Originating-smarthost01b-IP: [217.155.64.189]
Feedback-ID: 217.155.64.189


--YEu8yWOaMoSMZV1p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Per the msr_relaxed documentation:

   "If using this option is necessary to fix an issue, please report a bug."

After recently upgrading an environment from Xen 4.14.5 to Xen 4.15.5 we
started experiencing a BSOD at boot with one of our Windows guests.  We found
that enabling `msr_relaxed = 1` in the guest configuration has resolved the
problem.  With a debug build of Xen and `hvm_debug=2048` on the command line
the following messages were caught as the BSOD happened:

(XEN) [HVM:11.0] <vmx_msr_read_intercept> ecx=0x1a2
(XEN) vmx.c:3298:d11v0 RDMSR 0x000001a2 unimplemented
(XEN) d11v0 VIRIDIAN CRASH: 1e ffffffffc0000096 fffff80b8de81eb5 0 0

I found that MSR 0x1a2 is MSR_TEMPERATURE_TARGET and from that this patch
series from last month:

https://patchwork.kernel.org/project/xen-devel/list/?series=796550

Picking out just a small part of that fixes the problem for us. Although the
the patch is against 4.15.5 I think it would be relevant to more recent
releases too.

Thanks,
James

--YEu8yWOaMoSMZV1p
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="msr_temperature_target.patch"

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 54023a92587..3f64471c8a8 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3259,6 +3259,14 @@ static int vmx_msr_read_intercept(unsigned int msr, uint64_t *msr_content)
         if ( !nvmx_msr_read_intercept(msr, msr_content) )
             goto gp_fault;
         break;
+
+    case MSR_TEMPERATURE_TARGET:
+        if ( !rdmsr_safe(msr, *msr_content) )
+            break;
+        /* RO for guests, MSR_PLATFORM_INFO bits set accordingly in msr.c to indicate lack of write
+         * support. */
+        goto gp_fault;
+
     case MSR_IA32_MISC_ENABLE:
         rdmsrl(MSR_IA32_MISC_ENABLE, *msr_content);
         /* Debug Trace Store is not supported. */
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index ed97b1d6fcc..eb9eb45e820 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -976,6 +976,9 @@ static int read_msr(unsigned int reg, uint64_t *val,
         *val = 0;
         return X86EMUL_OKAY;
 
+    case MSR_TEMPERATURE_TARGET:
+        goto normal;
+
     case MSR_P6_PERFCTR(0) ... MSR_P6_PERFCTR(7):
     case MSR_P6_EVNTSEL(0) ... MSR_P6_EVNTSEL(3):
     case MSR_CORE_PERF_FIXED_CTR0 ... MSR_CORE_PERF_FIXED_CTR2:
diff --git a/xen/include/asm-x86/msr-index.h b/xen/include/asm-x86/msr-index.h
index 8b3ad575dbc..34e800fdc01 100644
--- a/xen/include/asm-x86/msr-index.h
+++ b/xen/include/asm-x86/msr-index.h
@@ -498,6 +498,9 @@
 #define MSR_IA32_MISC_ENABLE_XD_DISABLE	(1ULL << 34)
 
 #define MSR_IA32_TSC_DEADLINE		0x000006E0
+
+#define MSR_TEMPERATURE_TARGET		0x000001a2
+
 #define MSR_IA32_ENERGY_PERF_BIAS	0x000001b0
 
 /* Platform Shared Resource MSRs */

--YEu8yWOaMoSMZV1p--

