Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E673345EEA8
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232804.403884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawh-0007QA-CE; Fri, 26 Nov 2021 13:07:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232804.403884; Fri, 26 Nov 2021 13:07:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawg-00079D-FX; Fri, 26 Nov 2021 13:07:18 +0000
Received: by outflank-mailman (input) for mailman id 232804;
 Fri, 26 Nov 2021 13:07:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqaug-0003W9-B4
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:14 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7cd3963a-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:12 +0100 (CET)
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
X-Inumbo-ID: 7cd3963a-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931912;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=746QsnWin6OQb455qcVFN7IMD2ME3Bl0zmu1yTWBR/k=;
  b=boJok758E2DbyrfNGsW0K1nD22EK5GW2Bcuw0nD1yPlPRuZpjsf4PIUu
   HBDjCjuiiKOLt5h8ylvzUeFpJu4z9biPxhqkJKRwVWEhTEp26iTvX9x1S
   8sld+K90/oocxAWyJeWT076QSejlbdn/JS9nPEZXVSu6mXa6bsSi0M7IQ
   k=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: RyIhBz+rJqLuLebsns2cQNRKoum3qY911Ub6CMBIynZx3p5kShJvORwI91t6gtehNJ26EdxU03
 px/lmGMXc+gxRK3BkN6AOEtTbE0pmjZu4R3JBAL/8nMekGs0OHyjZygwW0Xk5w48+Xvs1ze8Ce
 Lh2A3sTDRyZ14ZsVBEv1hnxVuxo7X06Z1h/836QHxzA/cjiqtPxBGLEnteV2sp+0gjmjQkJiaE
 koGsWUDo9GSWVaBYUfwtkv1EuM2U3oM10DKeQRlq69OuIwAM++xs+7YjKfzKkm70iq/vfVchhI
 U8LLK9h6AJNCGf29C68NHG4q
X-SBRS: 5.1
X-MesageID: 58193786
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:R5X73qhfWJcu/mk7Z9PhZS6iX161rRcKZh0ujC45NGQN5FlHY01je
 htvCjyGOPuMMWX8fdl1bN7l9h9X7J7SztBjSAtk/ygzEn4b9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oAMKRCQ7InQLlbGILes1htZGEk0F0/NtTo5w7Rg29cy34Dja++wk
 YiaT/P3aQfNNwFcagr424rbwP+4lK2v0N+wlgVWicFj5DcypVFMZH4sDfjZw0/DaptVBoaHq
 9Prl9lVyI97EyAFUbtJmp6jGqEDryW70QKm0hK6UID66vROS7BbPg/W+5PwZG8O4whlkeydx
 /1W9o6wSV8LDJbrv/saWAdmKAF8G5J/reqvzXiX6aR/zmXDenrohf5vEFs3LcsT/eMf7WNmr
 KJCbmpXN1ba2rzwkOnTpupE36zPKOHCOo8Ft24m5jbeFfs8GrjIQrnQ5M8e1zA17ixLNauOP
 ptCNmoxBPjGSwVPCH4RAZZkoOCtplDAcGRq9RGL/4NitgA/yyQuieOwYbI5YOeiWsF9jkue4
 GXc8AzRIDsXKdiewjqt6W+3i6nEmiaTcJIfEvi0++BnhHWXx3cPE1sGWF2ju/67h0WiHdVFJ
 CQpFjEG9PZoshbxF5+kAkP+8CXsUgMgt8R4CK4o6AHV6JjvxCGGAWMacAVhavoZjZpjLdA17
 WOhk9TsDD1plbSaT3OB67uZxQ+P1TgpwXwqPnFdE1ZcizX3iMRq10+UEI4/eEKgpoStQWmY/
 tyckMQpa1z/Z+Yv3r7zw13IiinESnPhHl9svVW/so5IA2pEiG+Zi26AtQezARVodt/xory9U
 J4swJP2AAcmV8zlqcB1aL9RdIxFHt7cWNEmvXZhHoM66xOm8GO5cIZb7VlWfRkybZZaJGC4P
 BGP4mu9AaO/2lPxNsebhKrrVqwXIVXIT4y5Bpg4kPISCnSOSON31H43PhPBt4wcuEMtjbs+K
 f+mnTWEVh4n5VBc5GPuHY81iOZzrghnnD+7bc2rnnyPjOvFDFbIGOhtDbd7Rr1ghE9yiF6Oq
 Ig32grj40g3bdASlQGLq9NOdg5TciBgbX00wuQOHtO+zsNdMDlJI5fsLXkJIeSJRoxZybXF+
 G+TQEhdxAatjHHLM1zSOHtidKnuTdB0qndiZX4gOlOh2n4CZ4ez7fhAK8trLOd/rOEzn+RpS
 /QletmbBqgdQDrw5DlAP4L2q5ZvdUr3iFvWbTalejU2Y7VpWxfNpo3/ZgLq+SRXVni3uMIyr
 qeOzATeRZZfFQ1uANyPMKCkzk+rvGhbk+V3BhOaLt5WcUTq0Y5rNy2u0aNnf5BScU3On2LI2
 RyXDBEUofj2j7U0qNSZ17qZq4qJEvdlGhYIFWfs8rvrZzLR+XCuwNEcXb/QLyzdTm795I6re
 f5Rk6PnKPQCkVtH79h8HrJswf5s7tfjveYHnAFtHXGNZFW3ELJwZHKB2JAX5KFKw7ZYvyqwW
 16OpYYGaenYZpu9HQ5DPhchY8SCyeoQy2vb4vkCKUnn4DN6oeicWkJIMhjQ0CFQIdOZ6m/+L
 TvNbCLO1zGCtw==
IronPort-HdrOrdr: A9a23:dIgVs6hpd+3gt94YCVDXHWLOD3BQXuIji2hC6mlwRA09TySZ//
 rBoB19726MtN9xYgBHpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdWSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="58193786"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 65/65] x86: Enable CET Indirect Branch Tracking
Date: Fri, 26 Nov 2021 12:34:46 +0000
Message-ID: <20211126123446.32324-66-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
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
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 docs/misc/xen-command-line.pandoc | 16 +++++++++++----
 xen/arch/x86/cpu/common.c         |  1 +
 xen/arch/x86/setup.c              | 42 ++++++++++++++++++++++++++++++++++-----
 3 files changed, 50 insertions(+), 9 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index f7797ea233f9..ea033c1a1d74 100644
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
+can be maintained with the `pv-shim` mechanism.
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
index 7c41a21bf07c..9658c31cab48 100644
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
index daaba097d57f..6cec1918f66b 100644
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
 
@@ -1102,11 +1116,33 @@ void __init noreturn __start_xen(unsigned long mbi_p)
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
+        if ( efi_no_cet_ibt )
+            printk("  - UEFI Runtime Services not IBT safe\n");
+
+        /*
+         * Enable IBT now.  Only require the ENDBR64 on callees, which is
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
@@ -1863,10 +1899,6 @@ void __init noreturn __start_xen(unsigned long mbi_p)
 
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


