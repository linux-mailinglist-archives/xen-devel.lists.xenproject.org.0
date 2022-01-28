Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D5C49FAAB
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jan 2022 14:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261999.454004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKB-0004Qw-Em; Fri, 28 Jan 2022 13:29:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261999.454004; Fri, 28 Jan 2022 13:29:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDRKB-0004NO-BJ; Fri, 28 Jan 2022 13:29:59 +0000
Received: by outflank-mailman (input) for mailman id 261999;
 Fri, 28 Jan 2022 13:29:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Vxm=SM=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nDRK9-0003aP-Vq
 for xen-devel@lists.xenproject.org; Fri, 28 Jan 2022 13:29:58 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6219c91d-803e-11ec-8f75-fffcc8bd4f1a;
 Fri, 28 Jan 2022 14:29:56 +0100 (CET)
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
X-Inumbo-ID: 6219c91d-803e-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1643376596;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hm+gxomiwqPtSbO++1a7+fTXxiF/vy04zpwJNsO/xyU=;
  b=iiHMWh8x+fZ++mhQgNKWIN1JvF1UFQgOhfO9ccZKnhZ6LLwVJqFGhX3A
   qZz1b+tuRBcJFWDP6Csob4LhGQb6uUCfOedzWcDZ1OTTvoNCYcBh6zhP1
   NDcDa5pJDXzIyxWn/gA9TxVrgw7k+Tbl2uuigLYD90esCo2NX2w2SiQs8
   Y=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: jPGUa2TrV17ggrERpM+dg0CCxN0dhruUtmk/lgIakaUxAW4C1PEEEzVOPTbIbomG3sbreaCWPy
 tQ6rkwBpNPicB1F0eBRR/jIg5MWjvXIP3zdUzwYiCILjmSpj+CjkvVkWfaz+Vuw4Mqykq5Sb21
 PWPlWR+RIQ6ErPg6xsTICgMh8rm17tW/oW8PDVNw+KnwlUx/TlG6To6Of4BcYE9tCeeftVSGyk
 6EGgTdZYNU+C14vBjkmIDOLANlM7gIY9tv1DF1MUQ3N7wsP+WbJEBiuDxnq0aQnx+2bfbgsykd
 +9NPqUkAIkFgCRHu663NFSHw
X-SBRS: 5.2
X-MesageID: 63388633
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:h7wr9KBO96052hVW//3kw5YqxClBgxIJ4kV8jS/XYbTApD0k0DwHy
 jQZDzjUbviNa2H2LdF/YIzl80pS7ZODnN5rQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+En9400I7x4bVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jhGYmIBDz
 tt09rvqUjcPI6PsmuNBTEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGh2xg1p4VRp4yY
 eJHMR5vMyrwPSdBO3EHOoxgrfu3uHjgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tmSyq
 3/C/m/5KgoHL9HZwj2Amlq8i+mKkS7lVYY6ELyj6uUskFCV3nYUChAdSR28u/bRt6Klc4sBc
 QpOoHNo9PVsshzwJjXgY/GmiHugrxlMadxeKq4dshq97LfawwSeWndRG1atd+canMMxQDUr0
 HqAkNXoGSFjvdWpdJ6NyluHhWjsYHZIdAfucQdBFFJYuIe7/OnfmzqSFo4LLUKjsjHi9dgcK
 RiupTN2ubgchNVjO06TrQGe2GLESnQko2cICuTrsoCNs1sRiG2NPdXABb3nARBodtvxor6p5
 yBspiRmxLpSZaxhbQTUKAn3IJmn5uyeLBrXikN1Ep8q+lyFoiD/JtoLuGogeR80Y67onAMFh
 meJ52u9A7cIZBOXgVJfOdrtW6zGM4C+fTgaahwkRoUXOcUgHON21CpveVSRzwjQfLsEyskC1
 WOgWZ/0Vx4yUP0/pBLvHrt1+eJ1mkgWmD2CLbimn0XP+efPPxa9FOZaWGZim8hktstoVi2Pr
 YYGXyZLoj0CONDDjt7/qN5KcgtSfCFlXPgbaaV/L4a+H+avI0l5Y9e5/F/rU9UNc319mria8
 3ejdFVfzVaj13TLJR/TMiJoaa/1XIY5pnU+ZHR+MVGt0nklQICu8KZAKMdnIeh5rLRunaxuU
 v0IW8ScGfATGD7JzCsQMMvmp4t4eRX12Q/XZ3i5YCIydoJLThDS/oO2ZRPm8SQDV3LltcY3r
 7C6+BncRJ4PG1ZrAMrMMar9xFKtp3kN3ul1WhKQcNVUfUzt9qlsKjDw0aBrc51dd02by2LDh
 QiMABoeqe3cmKMP8YHE1fKesoOkM+piBU4GTWPV2qm7aHvB9W25zI4eDOvRJWLBVHn58bmJb
 PlOy62uK+UOmVtHvtYuE7tvyq5itdLjq6UDk1ZhFXTPKV+qFqlhMj+N2swW7v9BwbpQuA2XX
 EOT+4YFZeXVaZ29SFNBdhA4aumj1O0PnmiA5Ps4F0z2+Str8efVSk5VJRSN1HRQIbYd3FnJG
 gv9VBr6MzCCtyc=
IronPort-HdrOrdr: A9a23:lZsfS6sogAMf7DAH0JSoAQYi7skCO4Aji2hC6mlwRA09TyXGra
 +TdaUguSMc1gx9ZJh5o6H7BEDyewKgyXcV2/haAV7GZmfbUQSTXedfBOfZsl7d8mjFh5VgPM
 RbAuVD4b/LfCFHZK/BiWHSebdB/DDEytHRuQ609QYJcegeUdAG0+4PMHf+LqQZfnglObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUazpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZXcI5p4dY2xY/ouW3bRYzWTFcZcsnq5zXUISdSUmRYXeR
 /30lMd1opImjTslyqO0GfQMkHboUkTAjnZuBOlqEqmmNf+Qj0iDcpHmMZ2Tjv1gnBQ+u1U4e
 ZzxGSeuINQDRTc2ALHx/aNeS1LuyOP0CMfech6tQ0FbWLbUs4IkaUPuExSC5sOByT89cQuF/
 RvFtjV4LJMfUqddG2xhBgn/DWAZAVFIv69eDl1hiVV6UkkoFlpi08DgMAPlHYJ85wwD5FC+u
 TfK6xt0LVDVNUfY65xDPoIBZLfMB2HfTvcdGaJZVj3HqAOPHzA75bx/bUu/emvPJgF1oE7lp
 jNWE5R8WQyZ0XtA8uT24AjyGGEfEytGTD2js1O7ZlwvbPxALLtLC2YUVgr19Ctpv0Oa/erL8
 pb+KgmdsMLAVGeaLqh7jeOKaW6c0NuLvH9kuxLK26zng==
X-IronPort-AV: E=Sophos;i="5.88,324,1635220800"; 
   d="scan'208";a="63388633"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH v2 6/9] x86/spec-ctrl: Use common MSR_SPEC_CTRL logic for AMD
Date: Fri, 28 Jan 2022 13:29:24 +0000
Message-ID: <20220128132927.14997-7-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220128132927.14997-1-andrew.cooper3@citrix.com>
References: <20220128132927.14997-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Currently, amd_init_ssbd() works by being the only write to MSR_SPEC_CTRL in
the system.  This ceases to be true when using the common logic.

Include AMD MSR_SPEC_CTRL in has_spec_ctrl to activate the common paths, and
introduce an AMD specific block to control alternatives.  Also update the
boot/resume paths to configure default_xen_spec_ctrl.

svm.h needs an adjustment to remove a dependency on include order.

For now, only active alternatives for HVM - PV will require more work.  No
functional change, as no alternatives are defined yet for HVM yet.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>

v2:
 * Fix build in some PV Shim configurations
 * Adjust boot/resume paths too
 * Adjust commit message after rearranging in the series
 * Fix typo in comment
---
 xen/arch/x86/acpi/power.c              |  2 +-
 xen/arch/x86/cpu/amd.c                 |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svm.h |  3 +++
 xen/arch/x86/smpboot.c                 |  2 +-
 xen/arch/x86/spec_ctrl.c               | 26 ++++++++++++++++++++++++--
 5 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 5f2ec74f744a..0eae29b5687a 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -295,7 +295,7 @@ static int enter_state(u32 state)
     /* Re-enabled default NMI/#MC use of MSR_SPEC_CTRL. */
     ci->spec_ctrl_flags |= (default_spec_ctrl_flags & SCF_ist_wrmsr);
 
-    if ( boot_cpu_has(X86_FEATURE_IBRSB) )
+    if ( boot_cpu_has(X86_FEATURE_IBRSB) || boot_cpu_has(X86_FEATURE_IBRS) )
     {
         wrmsrl(MSR_SPEC_CTRL, default_xen_mcu_opt_ctrl);
         ci->last_spec_ctrl = default_xen_mcu_opt_ctrl;
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index f87484b7ce61..a8e37dbb1f5c 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -693,7 +693,7 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c)
 		return;
 
 	if (cpu_has_amd_ssbd) {
-		wrmsrl(MSR_SPEC_CTRL, opt_ssbd ? SPEC_CTRL_SSBD : 0);
+		/* Handled by common MSR_SPEC_CTRL logic */
 		return;
 	}
 
diff --git a/xen/arch/x86/include/asm/hvm/svm/svm.h b/xen/arch/x86/include/asm/hvm/svm/svm.h
index 05e968502694..09c32044ec8a 100644
--- a/xen/arch/x86/include/asm/hvm/svm/svm.h
+++ b/xen/arch/x86/include/asm/hvm/svm/svm.h
@@ -45,6 +45,9 @@ static inline void svm_invlpga(unsigned long linear, uint32_t asid)
         "a" (linear), "c" (asid));
 }
 
+struct cpu_user_regs;
+struct vcpu;
+
 unsigned long *svm_msrbit(unsigned long *msr_bitmap, uint32_t msr);
 void __update_guest_eip(struct cpu_user_regs *regs, unsigned int inst_len);
 void svm_update_guest_cr(struct vcpu *, unsigned int cr, unsigned int flags);
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 1cfdf96207d4..22ae4c1b2de9 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -380,7 +380,7 @@ void start_secondary(void *unused)
      * settings.  Note: These MSRs may only become available after loading
      * microcode.
      */
-    if ( boot_cpu_has(X86_FEATURE_IBRSB) )
+    if ( boot_cpu_has(X86_FEATURE_IBRSB) || boot_cpu_has(X86_FEATURE_IBRS) )
     {
         wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
         info->last_spec_ctrl = default_xen_spec_ctrl;
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index b2fd86ebe587..c210bb662f84 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -22,6 +22,7 @@
 #include <xen/param.h>
 #include <xen/warning.h>
 
+#include <asm/hvm/svm/svm.h>
 #include <asm/microcode.h>
 #include <asm/msr.h>
 #include <asm/pv/domain.h>
@@ -936,7 +937,8 @@ void __init init_speculation_mitigations(void)
 
     hw_smt_enabled = check_smt_enabled();
 
-    has_spec_ctrl = boot_cpu_has(X86_FEATURE_IBRSB);
+    has_spec_ctrl = (boot_cpu_has(X86_FEATURE_IBRSB) ||
+                     boot_cpu_has(X86_FEATURE_IBRS));
 
     /*
      * First, disable the use of retpolines if Xen is using shadow stacks, as
@@ -1031,12 +1033,32 @@ void __init init_speculation_mitigations(void)
         }
     }
 
+    /* AMD hardware: MSR_SPEC_CTRL alternatives setup. */
+    if ( boot_cpu_has(X86_FEATURE_IBRS) )
+    {
+        /*
+         * Virtualising MSR_SPEC_CTRL for guests depends on SVM support, which
+         * on real hardware matches the availability of MSR_SPEC_CTRL in the
+         * first place.
+         *
+         * No need for SCF_ist_wrmsr because Xen's value is restored
+         * atomically WRT NMIs in the VMExit path.
+         *
+         * TODO Adjust cpu_has_svm_spec_ctrl to be configured earlier on boot.
+         */
+        if ( opt_msr_sc_hvm &&
+             (boot_cpu_data.extended_cpuid_level >= 0x8000000a) &&
+             (cpuid_edx(0x8000000a) & (1u << SVM_FEATURE_SPEC_CTRL)) )
+            setup_force_cpu_cap(X86_FEATURE_SC_MSR_HVM);
+    }
+
     /* If we have IBRS available, see whether we should use it. */
     if ( has_spec_ctrl && ibrs )
         default_xen_spec_ctrl |= SPEC_CTRL_IBRS;
 
     /* If we have SSBD available, see whether we should use it. */
-    if ( boot_cpu_has(X86_FEATURE_SSBD) && opt_ssbd )
+    if ( opt_ssbd && (boot_cpu_has(X86_FEATURE_SSBD) ||
+                      boot_cpu_has(X86_FEATURE_AMD_SSBD)) )
         default_xen_spec_ctrl |= SPEC_CTRL_SSBD;
 
     /*
-- 
2.11.0


