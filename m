Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A578770F535
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538976.839488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcy-0000xR-Do; Wed, 24 May 2023 11:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538976.839488; Wed, 24 May 2023 11:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mcy-0000tm-8Y; Wed, 24 May 2023 11:26:00 +0000
Received: by outflank-mailman (input) for mailman id 538976;
 Wed, 24 May 2023 11:25:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mcw-0006nQ-Tc
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:58 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c04d50ee-fa25-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 13:25:58 +0200 (CEST)
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
X-Inumbo-ID: c04d50ee-fa25-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927557;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=lb/LSILGLCd6gJWJslDO2ppBGoRSQMQXkFRr5JMK4ms=;
  b=drk7pOLZ6UJE9rAViFLetIpYGok3ByzpvgK99/0mGDPesKzAzTu6/2GI
   3+ceFvSfakjeiEUt+8fD6hbKGCN5ESXxHD52vcJMN5RVLMfwIcmc1uaTn
   dIcoF41I7Fh2c4S1ZCOh89i2PY9roX3Lc3VTkVy+99VxgReuEiuUR7Emt
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109533433
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:o4YfL62lWqzXFzG5LfbD5epxkn2cJEfYwER7XKvMYLTBsI5bpzdRz
 TAdX2mDb/iPNzP0eIsga9yz8UlQu5aHnIc3GVY+pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK6ULWeUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8teTb8HuDgNyo4GlD5gFkOagQ1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfPDFP3
 NwCOB42TFOPhqW1/uubVetJr5F2RCXrFNt3VnBIyDjYCbAtQIzZQrWM7thdtNsyrpkQR7CEP
 ZNfMGcxKk2aOHWjOX9OYH46tM6uimPybHtzr1WNqLBsy2PS0BZwwP7mN9+9ltmiHJ0Ewx3D+
 jmdl4j/Kj0gLcCt6iGVyGvylqzhgyngQdlKEITto5aGh3XMnzdOWXX6T2CTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsUTppeNEg8sgsSlQC1
 EKP2dXgBjVtsbicYXOb6rqQ6zi1PEA9LmIcZClCUQoM5fHipp0+ilTESdMLLUKupoSrQ3eqm
 WnM9XVgwexJ1qbnyplX43j60zOFhoLZYDUXpQnWGWGbtyNmZquMMtnABUfg0d5MK4OQT1+kt
 XcCmtSD4O1mMaxhhBBhU81WQuj3uq/t3Cn0xAc2QsJ/r2jFF2uLJ9g43d1oGKt+3i/okxfNa
 VSbhw5e7YQ70JCCPf4uONLZ5yjHIMHd+TXZuhL8NIImjntZLlXvEMRSiam4gQjQfLAEy/1XB
 HtiWZ/E4YwmIapm1iGqYOwWzKUmwCszrUuKG8Cnn0r5gebFOi/PIVvgDLdpRrljhJ5oXS2Pq
 4oPXyd04043vBLCjtn/rtdIcAFiwYkTDpHqsc1HHtO+zv5dMDh5UZf5mOpxE7GJaowJzo8kC
 FnhAB4HoLc+7FWbQTi3hodLN+62As8m8SNkVcHuVH7xs0UejU+UxP93X/MKkXMPrbcLISJcJ
 xXdR/i9Pw==
IronPort-HdrOrdr: A9a23:YaXTEaCs0UI/nqnlHemU55DYdb4zR+YMi2TC1yhKJyC9Ffbo7v
 xG/c5rsyMc5wxwZJhNo7y90ey7MBbhHP1OkO4s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpN
 9dmsNFaeEYY2IUsS+D2njbL+od
X-Talos-CUID: 9a23:YwxQ6GFtG711vo4hqmJapE89Oto1XEb/j3vRZEyGUEZ2Spi8HAo=
X-Talos-MUID: =?us-ascii?q?9a23=3AqReWIQzJ0kRRTQsSZ+74frqh5jeaqIiUEVw/so4?=
 =?us-ascii?q?WgdDaJW9eJT2GlW/vRrZyfw=3D=3D?=
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="109533433"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian
	<kevin.tian@intel.com>
Subject: [PATCH v2 08/10] x86/vtx: Remove opencoded MSR_ARCH_CAPS check
Date: Wed, 24 May 2023 12:25:24 +0100
Message-ID: <20230524112526.3475200-9-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

MSR_ARCH_CAPS data is now included in featureset information.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
CC: Jun Nakajima <jun.nakajima@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
---
 xen/arch/x86/hvm/vmx/vmx.c            | 8 ++------
 xen/arch/x86/include/asm/cpufeature.h | 3 +++
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 096c69251d58..9dc16d0cc6b9 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -2849,8 +2849,6 @@ static void __init ler_to_fixup_check(void);
  */
 static bool __init has_if_pschange_mc(void)
 {
-    uint64_t caps = 0;
-
     /*
      * If we are virtualised, there is nothing we can do.  Our EPT tables are
      * shadowed by our hypervisor, and not walked by hardware.
@@ -2858,10 +2856,8 @@ static bool __init has_if_pschange_mc(void)
     if ( cpu_has_hypervisor )
         return false;
 
-    if ( cpu_has_arch_caps )
-        rdmsrl(MSR_ARCH_CAPABILITIES, caps);
-
-    if ( caps & ARCH_CAPS_IF_PSCHANGE_MC_NO )
+    /* Hardware reports itself as fixed. */
+    if ( cpu_has_if_pschange_mc_no )
         return false;
 
     /*
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index d0ead8e7a51e..e3154ec5800d 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -182,6 +182,9 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_avx_vnni_int8   boot_cpu_has(X86_FEATURE_AVX_VNNI_INT8)
 #define cpu_has_avx_ne_convert  boot_cpu_has(X86_FEATURE_AVX_NE_CONVERT)
 
+/* MSR_ARCH_CAPS */
+#define cpu_has_if_pschange_mc_no boot_cpu_has(X86_FEATURE_IF_PSCHANGE_MC_NO)
+
 /* Synthesized. */
 #define cpu_has_arch_perfmon    boot_cpu_has(X86_FEATURE_ARCH_PERFMON)
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
-- 
2.30.2


