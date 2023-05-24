Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EB470F532
	for <lists+xen-devel@lfdr.de>; Wed, 24 May 2023 13:26:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538969.839416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mck-000765-FM; Wed, 24 May 2023 11:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538969.839416; Wed, 24 May 2023 11:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1mck-0006yY-AI; Wed, 24 May 2023 11:25:46 +0000
Received: by outflank-mailman (input) for mailman id 538969;
 Wed, 24 May 2023 11:25:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KTJK=BN=citrix.com=prvs=501cbbf32=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1mci-0006nQ-U2
 for xen-devel@lists.xenproject.org; Wed, 24 May 2023 11:25:44 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b8ac8520-fa25-11ed-b22f-6b7b168915f2;
 Wed, 24 May 2023 13:25:44 +0200 (CEST)
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
X-Inumbo-ID: b8ac8520-fa25-11ed-b22f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684927543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GzTaYahCvQbgziVS0gqwaK4qufFZHl9uL0tpi65cPFw=;
  b=NI4TuNsVkjTErUwcS4vm6g7fuSQqvtWQc2W4gjWa6m5lbCxy3EjkBa0J
   A9jUfcGh6wv/4ptscnWyRCaH6gJEbWBLLZdCikQNzQ2KdMJTaJb9XPsjY
   tWF5G5W30Jmc+qT936fFi7Xh+tpGRSC0Ln2UaKHkfO7SVc140Y4pUhaCb
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 110226276
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:BPtf06vvZQDj7fcV+yRiuCfg+ufnVF5eMUV32f8akzHdYApBsoF/q
 tZmKW7QOK7ZMWryfNglb4qw90sFupWGz9c3TQQ/+30xQy8S+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Fv0gnRkPaoQ5AKEyyFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwEW0zKUyqtdmPxp2GbPdwhPkRNYrvI9ZK0p1g5Wmx4fcORJnCR+PB5MNC3Sd2jcdLdRrcT
 5NHM3w1Nk2GOkARfA5NU/rSn8/x7pX7WxRepEiYuuwc5G/LwRYq+LPsLMDUapqBQsA9ckOw/
 zuepT6nWE5EXDCZ4RCe3nn0oObBoX36RL4CE4ay5MQ133TGkwT/DzVJDADm8JFVkHWWS99Zb
 kAZ5Ccqhawz71CwCMnwWQWip3yJtQJaXMBfe8U44gyQzqvf4y6CG3MJCDVGbbQOq8seVTEsk
 FiTkLvU6SdH6ePPDyjHr/HN8G30YHJORYMfWcMaZTJY3Z6/ibMItxTgc/B9DKyIvMS2HS6ll
 lhmsxMCr7kUiMcK0YCy8lbGny+gq/D1c+Il2unEdjn7t10kPeZJc6TtsAGGtqgYcO51W3Hb5
 BA5d96iAPfi5H1nvAiEW60zEb6g/J5p2xWM0Ac0T/HNG9lAkkNPnLy8AhkkfC+F0e5eI1cFh
 XM/XisPjKK/xFPwMcdKj3uZUqzGN5TIG9X/TezzZdFTeJV3fwLv1HgwNRLAgT69zBNywPtX1
 XKnnSGEVCxyNEia5GDuG7d1PUEDnUjSOl8/tbiklk/6gNJylVaeSKsfMUvmU93VGJis+V2Pm
 /4Gbpvi9vmqeLGmCsUh2dJJfA9iwLlSLcyelvG7gcbcf1M5QTh9WqC5LHFIU9UNopm5X9zgp
 hmVMnK0AnKm7ZEbAW1mskxeVY4=
IronPort-HdrOrdr: A9a23:R0+V5KrTmuAziqFCCO7W7M8aV5rveYIsimQD101hICG9Evb0qy
 nOpoV/6faQslwssR4b9uxoVJPvfZq+z+8W3WByB9eftWDd0QPFEGgL1+DfKlbbak7DH4BmtJ
 uJc8JFeafN5VoRt7eG3OFveexQvOVu88qT9JjjJ28Gd3APV0n5hT0JcjpyFCdNNW57LKt8Lr
 WwzOxdqQGtfHwGB/7LfUXsD4D41rv2fIuNW29+OyIa
X-Talos-CUID: =?us-ascii?q?9a23=3A2GQLlWqKhvDRLz/dE7vP32vmUfl4TDqB5UXrGkm?=
 =?us-ascii?q?XNEB3VL+oe0bT/Lwxxg=3D=3D?=
X-Talos-MUID: 9a23:hyHvygW7wTVQmEXq/BX3qDo6Es5m3/qvFHwdlq4MqfPbagUlbg==
X-IronPort-AV: E=Sophos;i="6.00,189,1681185600"; 
   d="scan'208";a="110226276"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 01/10] x86/boot: Rework dom0 feature configuration
Date: Wed, 24 May 2023 12:25:17 +0100
Message-ID: <20230524112526.3475200-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
References: <20230524112526.3475200-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Right now, dom0's feature configuration is split between between the common
path and a dom0-specific one.  This mostly is by accident, and causes some
very subtle bugs.

First, start by clearly defining init_dom0_cpuid_policy() to be the domain
that Xen builds automatically.  The late hwdom case is still constructed in a
mostly normal way, with the control domain having full discretion over the CPU
policy.

Identifying this highlights a latent bug - the two halves of the MSR_ARCH_CAPS
bodge are asymmetric with respect to the hardware domain.  This means that
shim, or a control-only dom0 sees the MSR_ARCH_CAPS CPUID bit but none of the
MSR content.  This in turn declares the hardware to be retpoline-safe by
failing to advertise the {R,}RSBA bits appropriately.  Restrict this logic to
the hardware domain, although the special case will cease to exist shortly.

For the CPUID Faulting adjustment, the comment in ctxt_switch_levelling()
isn't actually relevant.  Provide a better explanation.

Move the recalculate_cpuid_policy() call outside of the dom0-cpuid= case.
This is no change for now, but will become necessary shortly.

Finally, place the second half of the MSR_ARCH_CAPS bodge after the
recalculate_cpuid_policy() call.  This is necessary to avoid transiently
breaking the hardware domain's view while the handling is cleaned up.  This
special case will cease to exist shortly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/cpu-policy.c | 57 +++++++++++++++++++++------------------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/xen/arch/x86/cpu-policy.c b/xen/arch/x86/cpu-policy.c
index ef6a2d0d180a..5e7e19fbcda8 100644
--- a/xen/arch/x86/cpu-policy.c
+++ b/xen/arch/x86/cpu-policy.c
@@ -687,29 +687,6 @@ int init_domain_cpu_policy(struct domain *d)
     if ( !p )
         return -ENOMEM;
 
-    /* See comment in ctxt_switch_levelling() */
-    if ( !opt_dom0_cpuid_faulting && is_control_domain(d) && is_pv_domain(d) )
-        p->platform_info.cpuid_faulting = false;
-
-    /*
-     * Expose the "hardware speculation behaviour" bits of ARCH_CAPS to dom0,
-     * so dom0 can turn off workarounds as appropriate.  Temporary, until the
-     * domain policy logic gains a better understanding of MSRs.
-     */
-    if ( is_hardware_domain(d) && cpu_has_arch_caps )
-    {
-        uint64_t val;
-
-        rdmsrl(MSR_ARCH_CAPABILITIES, val);
-
-        p->arch_caps.raw = val &
-            (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
-             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
-             ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
-             ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
-             ARCH_CAPS_BHI_NO | ARCH_CAPS_PBRSB_NO);
-    }
-
     d->arch.cpu_policy = p;
 
     recalculate_cpuid_policy(d);
@@ -845,11 +822,15 @@ void recalculate_cpuid_policy(struct domain *d)
         p->extd.raw[0x19] = EMPTY_LEAF;
 }
 
+/*
+ * Adjust the CPU policy for dom0.  Really, this is "the domain Xen builds
+ * automatically on boot", and might not have the domid 0 (e.g. pvshim).
+ */
 void __init init_dom0_cpuid_policy(struct domain *d)
 {
     struct cpu_policy *p = d->arch.cpuid;
 
-    /* dom0 can't migrate.  Give it ITSC if available. */
+    /* Dom0 doesn't migrate relative to Xen.  Give it ITSC if available. */
     if ( cpu_has_itsc )
         p->extd.itsc = true;
 
@@ -858,7 +839,7 @@ void __init init_dom0_cpuid_policy(struct domain *d)
      * so dom0 can turn off workarounds as appropriate.  Temporary, until the
      * domain policy logic gains a better understanding of MSRs.
      */
-    if ( cpu_has_arch_caps )
+    if ( is_hardware_domain(d) && cpu_has_arch_caps )
         p->feat.arch_caps = true;
 
     /* Apply dom0-cpuid= command line settings, if provided. */
@@ -876,8 +857,32 @@ void __init init_dom0_cpuid_policy(struct domain *d)
         }
 
         x86_cpu_featureset_to_policy(fs, p);
+    }
+
+    /*
+     * PV Control domains used to require unfiltered CPUID.  This was fixed in
+     * Xen 4.13, but there is an cmdline knob to restore the prior behaviour.
+     *
+     * If the domain is getting unfiltered CPUID, don't let the guest kernel
+     * play with CPUID faulting either, as Xen's CPUID path won't cope.
+     */
+    if ( !opt_dom0_cpuid_faulting && is_control_domain(d) && is_pv_domain(d) )
+        p->platform_info.cpuid_faulting = false;
 
-        recalculate_cpuid_policy(d);
+    recalculate_cpuid_policy(d);
+
+    if ( is_hardware_domain(d) && cpu_has_arch_caps )
+    {
+        uint64_t val;
+
+        rdmsrl(MSR_ARCH_CAPABILITIES, val);
+
+        p->arch_caps.raw = val &
+            (ARCH_CAPS_RDCL_NO | ARCH_CAPS_IBRS_ALL | ARCH_CAPS_RSBA |
+             ARCH_CAPS_SSB_NO | ARCH_CAPS_MDS_NO | ARCH_CAPS_IF_PSCHANGE_MC_NO |
+             ARCH_CAPS_TAA_NO | ARCH_CAPS_SBDR_SSDP_NO | ARCH_CAPS_FBSDP_NO |
+             ARCH_CAPS_PSDP_NO | ARCH_CAPS_FB_CLEAR | ARCH_CAPS_RRSBA |
+             ARCH_CAPS_BHI_NO | ARCH_CAPS_PBRSB_NO);
     }
 }
 
-- 
2.30.2


