Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CDE70304D
	for <lists+xen-devel@lfdr.de>; Mon, 15 May 2023 16:43:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.534777.832126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZPq-0000LF-GN; Mon, 15 May 2023 14:43:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 534777.832126; Mon, 15 May 2023 14:43:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyZPq-0000ES-8q; Mon, 15 May 2023 14:43:10 +0000
Received: by outflank-mailman (input) for mailman id 534777;
 Mon, 15 May 2023 14:43:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWdz=BE=citrix.com=prvs=492993889=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pyZPo-0000CZ-Q5
 for xen-devel@lists.xenproject.org; Mon, 15 May 2023 14:43:08 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cc1c406d-f32e-11ed-8611-37d641c3527e;
 Mon, 15 May 2023 16:43:05 +0200 (CEST)
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
X-Inumbo-ID: cc1c406d-f32e-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684161785;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9XFTUf7BDejsn84FeldN2UDYxQF11ZKC+fFIFGNNJWI=;
  b=ZL/1IzA9H6Dzn4YgVKvqmACbJcAVo3zbtxZVW+tRiNHokpe+/nDnoD3q
   lLgHcFeySKRBA0cKdVs5XPzabNaojGEA+g8iTNMlmL2UY4R970ENLEvTU
   LsY5aChigc+65FzUkXz9cwOaOZkKhKL+6sB0r8k12ejnTacd94+FZfQgF
   g=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 4.0
X-MesageID: 109479563
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:PgQf2K6s0opUt0g6H7XBaAxRtDDHchMFZxGqfqrLsTDasY5as4F+v
 jQeUDjUbv2CZWWkfNFzOdnn9UoAupfVnIUwQQdu/CwwHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9VU+7ZwehBtC5gZlPa0S4QeH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5m3
 /02GB03b0i/l/O436inZMdQu9wMI5y+VG8fkikIITDxCP8nRdbIQrnQ5M8e1zA17ixMNa+AP
 YxDM2MpNUmeJUQVYT/7C7pn9AusrlD5fydVtxS+oq0v7nKI5AdwzKLsIJzefdniqcB9xx7J+
 j2Xojqiav0cHJui6heH8iyAvcCMowT9c54ANfqZpvE/1TV/wURMUUZLBDNXu8KRmkO4Ht5SN
 UEQ0i4vtrQpslymSMHnWB+1q2LCuQQTM/JyOeAn7ACGyoLP/h2UQGMDS1Zpd9gOpMIwAzsw2
 Te0c8jBXGI19ufPEDTEq+nS9GnpUcQIEYMcTQUFYzso2di7nJEigA3VUvhNLJOtodKgTFkc3
 Au2hCQ5grwSi+sC2KO64U3LjlqQm3TZcuImzl6JBzz4t2uVcKbgPtX1sgaDsZ6sOa7DFjG8U
 G44d99yBQzkJbWEj2SzTeoEB9lFDN7VYWSH0TaD83TMnglBGkJPn6gKulmSx28zaK7onAMFh
 2eN0T69HLcJYBOXgVZfOupd8fgCw6n6DsjCXfvJdNdIaZUZXFbZrH02NR/KgDu9yxBEfUQD1
 XCzIK6R4YsyU/w7nFJauc9HuVPU+szO7TyKHs2qp/hW+bGfeGSUWd84Dbd6VchgtPnsiFyMo
 75i2z6il003vBvWPnOGrub+7DkicRAGOHwBg5YKJ7/efFA3RDlJ5j246epJRrGJVp99zo/gl
 kxRkGcCoLYjrRUr8Tm3V00=
IronPort-HdrOrdr: A9a23:2I/yoq/Ibf4jrk98fe1uk+AoI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HLoB1/73XJYVkqN03I9ervBEDiewK4yXcW2/hzAV7KZmCP1FdASrsC0WKL+Vbd8kbFh4xgPM
 lbE5SWc+eAamSTjazBkXWF+9RL+qj5zEh/792usUuETmtRGtBdBx8SMHf8LqXvLjM2f6bQEv
 Cnl7N6jgvlQ1s7ROKhCEIIWuDSzue76a4PMXY9dmYaABDlt0LS1ILH
X-Talos-CUID: 9a23:Mfbq3mxrosvvN86IBeUPBgU+G+4VX0fclEvAMkGnE3pHZoGoUXCfrfY=
X-Talos-MUID: 9a23:7rariQkXFeI4BdhTRuTtdnolCeRF4aTwJHsi0qshveKYJw03GmeS2WE=
X-IronPort-AV: E=Sophos;i="5.99,276,1677560400"; 
   d="scan'208";a="109479563"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 1/6] x86/boot: Rework dom0 feature configuration
Date: Mon, 15 May 2023 15:42:54 +0100
Message-ID: <20230515144259.1009245-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
References: <20230515144259.1009245-1-andrew.cooper3@citrix.com>
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


