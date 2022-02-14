Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C901D4B5175
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:18:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.272055.466866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEu-00041g-NA; Mon, 14 Feb 2022 13:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 272055.466866; Mon, 14 Feb 2022 13:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbEu-0003xZ-H1; Mon, 14 Feb 2022 13:18:00 +0000
Received: by outflank-mailman (input) for mailman id 272055;
 Mon, 14 Feb 2022 13:17:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3o-00023t-R9
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:32 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ec7c1354-8d96-11ec-b215-9bbe72dcb22c;
 Mon, 14 Feb 2022 14:06:30 +0100 (CET)
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
X-Inumbo-ID: ec7c1354-8d96-11ec-b215-9bbe72dcb22c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843991;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fi1axB5uLDN6sum8D3QAzPbry9w69HfPZE5bf+cwyeI=;
  b=PQQq7X46NRbXGvmVSBPosFHLgyw90NQKIivGXJkLPESi1dKWbHlOsYuO
   Ut7xsWEMdh/okBNM+wT8/klBZBIVkiS2MYur/JvsRLiSaAuS2bAWC9HhH
   +ybA+W3OZ4fCcHej6awBoIOEIb3T74M4qlNluPnOlGH3N5v6wJtMahQEI
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: QN9REi7sea3NQjbnfqcCbTAgxLnQRXYY7nAJdw3CZLM2hEi06ARdRAbUibAOeWSUqe7/XDV3pH
 vqpyXkGofxjgc+6Y6lMZfrTB9dhuq1YqbFxAGpfmpJnOsv1HFwVJZ4S0ZBgfjYxZ14XyM6H/dz
 Hr/WHjh4kGddGmmpwhxMlEZ8SZ+X2mfRGJvysY5ZS+W8IKLDA2xprjL6iZU8eOjNAsB3Q9zBus
 2qzEUPciw2yKqK1+mweDSqkr1AkSI+tdxgDN9JKVGiLWt/5nFS5aWNY3AE/06RzuNoRpDjk1sZ
 2apg6rjJs6nTsXaJueJHjUkK
X-SBRS: 5.1
X-MesageID: 64149496
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:g4kxga3gJS4tdbjDWvbD5ex2kn2cJEfYwER7XKvMYLTBsI5bpzFVm
 jBMCj3QaancYDCmfYp3Oouw9BwO65WHmNNhHAs6pC1hF35El5HIVI+TRqvS04J+DSFhoGZPt
 Zh2hgzodZhsJpPkS5PE3oHJ9RGQ74nRLlbHILOCanAZqTNMEn9700o5wrJh2+aEvPDia++zk
 YKqyyHgEAfNNw5cagr4PIra9XuDFNyr0N8plgRWicJj5TcypFFMZH4rHomjLmOQf2VhNrXSq
 9Avbl2O1jixEx8FUrtJm1tgG6EAaua60QOm0hK6V0U+6/TrS+NbPqsTbZIhhUlrZzqhuPBB5
 tVxrpCMURYWAa7et8MQVz1RHHQrVUFG0OevzXmXtMWSywvNcmf2wuUoB0YzVWEa0r8pWycUr
 6VecW1TKEDY7w616OvTpu1Er8IvNsT0eqgYvWlt12rxBvc6W5HTBa7N4Le02R9u2pkSTKqPO
 aL1bxJJURfFTScXIG0TJ7Aj28GugX3zV2FH/Qf9Sa0fvDGIkV0ZPKLWGMXRUsyHQ4NShEnwj
 kDs8nn9AxoaHMeC0jfD+XWp7sffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWZj5EA
 xVKoGx09/F0rRH1CImmN/GlnJKaljk8a/RQL/Y21Bmc9ZXX8Sm+C2wgRzEUPbTKq/QKbTAt0
 1aImfbgCjpurKCZRBqhy1uEkd+hEXNLdDFfPEfoWSNAuoC++99r0nojW/4+SPbdszHjJd3nL
 9lmRgAajq5bs8ME3r7TEbvv02P1/cihouLYC2zqsoOZAuFROdTNi2+AswGzARN8wGGxFAfpg
 ZT8s5LChN3i9LnU/MB3fM0DHauy+9GOOyDGjFhkEvEJrmrxpyHzLd0NuGglfi+F1/ronhezP
 ifuVf55vscPbBNGk4crC25ONyja5fe5Tom0PhwlRtFPfoJwZGe6ENJGPiatM5TWuBF0y8kXY
 M7DGe71VCpyIfk3nVKeGrZGuZd2l39W+I8mbc2ip/hR+eHFPyD9pHZsGAbmU93VG4va/FSLo
 44HbZPiJtc2eLSWXxQ7OLU7dTgiRUXXz7iqwyCOXuLccAdgBk87DPrdneEod4B/xvwHnebU5
 HCtHERfzQOn13HALAyLbFFlaa/uAskj/S5qY3R0MAb6wWUnbKau8LwbK8k9c444+bEx1vVzV
 fQEJZmNW6wdVjTd9j0BRpDht4g+Jg+zjAeDMnP9MjgydpJtXSLT/drgcle9/SUCFHPv58A/v
 6ehxkXQRp9aH1ZuC8PfafSOyVKtvCdCxLIuDhWQetQKIRfi6olnLSD1n8QbGcBUJEWR3Cae2
 iaXHQwc+bvHrbgq/YSbnquDtYqoTbdzRxIIA2nB4L+qHiDG5W7/k5RYWeOFcD2BBmP5/KKuO
 bdcw/3maaBVmV9Lt8x3EqpxzLJ47Nzq/ucIwgNhFXTNTlKqFrI/fSXWgZgR7vVAlu1DpA+7e
 kOT4d0La7yGNfTsHEMVOAd4PP+I0usZm2WK4Pk4SKkgCPSbIFZTvZ1uAiSx
IronPort-HdrOrdr: A9a23:6y10gKrvUIhlEuZ8Jo6yMIkaV5opeYIsimQD101hICG8cqSj+f
 xG/c5rrCMc5wxwZJhNo7y90ey7MBbhHP1OkO8s1NWZLWrbUQKTRekIh+bfKn/baknDH4ZmpM
 BdmsNFaeEYY2IUsS+D2njbL+od
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149496"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 70/70] x86: Enable CET Indirect Branch Tracking
Date: Mon, 14 Feb 2022 12:51:27 +0000
Message-ID: <20220214125127.17985-71-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

With all the pieces now in place, turn CET-IBT on when available.

MSR_S_CET, like SMEP/SMAP, controls Ring1 meaning that ENDBR_EN can't be
enabled for Xen independently of PV32 kernels.  As we already disable PV32 for
CET-SS, extend this to all CET, adjusting the documentation/comments as
appropriate.

Introduce a cet=no-ibt command line option to allow the admin to disable IBT
even when everything else is configured correctly.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Rebase over change to UEFI RS handling
---
 docs/misc/xen-command-line.pandoc | 16 +++++++++++----
 xen/arch/x86/cpu/common.c         |  1 +
 xen/arch/x86/setup.c              | 42 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1ca817f5e1b9..92891a856971 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -271,7 +271,7 @@ enough. Setting this to a high value may cause boot failure, particularly if
 the NMI watchdog is also enabled.
 
 ### cet
-    = List of [ shstk=<bool> ]
+    = List of [ shstk=<bool>, ibt=<bool> ]
 
     Applicability: x86
 
@@ -279,6 +279,10 @@ Controls for the use of Control-flow Enforcement Technology.  CET is group a
 of hardware features designed to combat Return-oriented Programming (ROP, also
 call/jmp COP/JOP) attacks.
 
+CET is incompatible with 32bit PV guests.  If any CET sub-options are active,
+they will override the `pv=32` boolean to `false`.  Backwards compatibility
+can be maintained with the pv-shim mechanism.
+
 *   The `shstk=` boolean controls whether Xen uses Shadow Stacks for its own
     protection.
 
@@ -287,9 +291,13 @@ call/jmp COP/JOP) attacks.
     `cet=no-shstk` will cause Xen not to use Shadow Stacks even when support
     is available in hardware.
 
-    Shadow Stacks are incompatible with 32bit PV guests.  This option will
-    override the `pv=32` boolean to false.  Backwards compatibility can be
-    maintained with the `pv-shim` mechanism.
+*   The `ibt=` boolean controls whether Xen uses Indirect Branch Tracking for
+    its own protection.
+
+    The option is available when `CONFIG_XEN_IBT` is compiled in, and defaults
+    to `true` on hardware supporting CET-IBT.  Specifying `cet=no-ibt` will
+    cause Xen not to use Indirect Branch Tracking even when support is
+    available in hardware.
 
 ### clocksource (x86)
 > `= pit | hpet | acpi | tsc`
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index 6b674bf15e8b..bfb8cf9f100b 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -345,6 +345,7 @@ void __init early_cpu_init(void)
 	if (c->cpuid_level >= 7) {
 		cpuid_count(7, 0, &eax, &ebx, &ecx, &edx);
 		c->x86_capability[cpufeat_word(X86_FEATURE_CET_SS)] = ecx;
+		c->x86_capability[cpufeat_word(X86_FEATURE_CET_IBT)] = edx;
 	}
 
 	eax = cpuid_eax(0x80000000);
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index f6a59d5f0412..f5449c972825 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -102,6 +102,12 @@ static bool __initdata opt_xen_shstk = true;
 #define opt_xen_shstk false
 #endif
 
+#ifdef CONFIG_XEN_IBT
+static bool __initdata opt_xen_ibt = true;
+#else
+#define opt_xen_ibt false
+#endif
+
 static int __init cf_check parse_cet(const char *s)
 {
     const char *ss;
@@ -120,6 +126,14 @@ static int __init cf_check parse_cet(const char *s)
             no_config_param("XEN_SHSTK", "cet", s, ss);
 #endif
         }
+        else if ( (val = parse_boolean("ibt", s, ss)) >= 0 )
+        {
+#ifdef CONFIG_XEN_IBT
+            opt_xen_ibt = val;
+#else
+            no_config_param("XEN_IBT", "cet", s, ss);
+#endif
+        }
         else
             rc = -EINVAL;
 
@@ -1118,11 +1132,33 @@ void __init noreturn __start_xen(unsigned long mbi_p)
         printk("Enabling Supervisor Shadow Stacks\n");
 
         setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
+    }
+
+    if ( opt_xen_ibt && boot_cpu_has(X86_FEATURE_CET_IBT) )
+    {
+        printk("Enabling Indirect Branch Tracking\n");
+
+        setup_force_cpu_cap(X86_FEATURE_XEN_IBT);
+
+        if ( efi_enabled(EFI_RS) )
+            printk("  - IBT disabled in UEFI Runtime Services\n");
+
+        /*
+         * Enable IBT now.  Only require the endbr64 on callees, which is
+         * entirely build-time arrangements.
+         */
+        wrmsrl(MSR_S_CET, CET_ENDBR_EN);
+    }
+
+    if ( cpu_has_xen_shstk || cpu_has_xen_ibt )
+    {
+        set_in_cr4(X86_CR4_CET);
+
 #ifdef CONFIG_PV32
         if ( opt_pv32 )
         {
             opt_pv32 = 0;
-            printk("  - Disabling PV32 due to Shadow Stacks\n");
+            printk("  - Disabling PV32 due to CET\n");
         }
 #endif
     }
@@ -1849,10 +1885,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
     alternative_branches();
 
-    /* Defer CR4.CET until alternatives have finished playing with CR0.WP */
-    if ( cpu_has_xen_shstk )
-        set_in_cr4(X86_CR4_CET);
-
     /*
      * NB: when running as a PV shim VCPUOP_up/down is wired to the shim
      * physical cpu_add/remove functions, so launch the guest with only
-- 
2.11.0


