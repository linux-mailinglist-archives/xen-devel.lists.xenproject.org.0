Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DEB4AE063
	for <lists+xen-devel@lfdr.de>; Tue,  8 Feb 2022 19:10:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.268583.462440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwE-0003e2-Sn; Tue, 08 Feb 2022 18:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 268583.462440; Tue, 08 Feb 2022 18:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHUwE-0003Xf-Ko; Tue, 08 Feb 2022 18:10:02 +0000
Received: by outflank-mailman (input) for mailman id 268583;
 Tue, 08 Feb 2022 18:10:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1rHF=SX=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nHUwD-0003Sy-6C
 for xen-devel@lists.xenproject.org; Tue, 08 Feb 2022 18:10:01 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 52deec30-890a-11ec-8eb8-a37418f5ba1a;
 Tue, 08 Feb 2022 19:09:59 +0100 (CET)
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
X-Inumbo-ID: 52deec30-890a-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644343799;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=0oObUQpZAUPYFZpIBW0xewUnMdr0+AaT7RXg0NpNwug=;
  b=BnWdPMNtyl3c4JcNm/zrgdDwQ+CtQmSylqEassSeZeHDeVoNsLM/Cln5
   k2I0HX320JKLM6Y1JwQZie129ruMjwEucZlx9ZTc4n3yv+ilPNjIRytyM
   rQUf1JCQCD4fDmqwfd3f/tjGHUpF+czosKgFWyw6QUWdXhOEoB3qL6vco
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: vykE8PlYTPcHxHdlWU41j30bG1djZdD9FKl08Kygc/jOWjGP5y4OSQ63ydDpAiOGuDHflUFPQ6
 o3CuappdhSkLGUSNmTnGz4KgrYBQJfTdGA9Lvp/FXgSIxzQkCwLRrwNTSX9Ke6XbwzUJjuO1JT
 p4XBpWFGF6eLm2zct6DNHhEEzD6jDsGsX4PEVZfm0ycePsU0ntbCyw1giNrSbaNWLR4Z3ubmTo
 7syMOeCw0R9Qn6VbYQv1eC8LmXr3dCcswNWq1Ja0qo556ioJxLfgdR1Nq1ZYDI4SGbG6Bcqy+E
 nEWdXbLHWpw+CFaj22nGBD6r
X-SBRS: 5.1
X-MesageID: 64166858
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:rM9HU6NtXoVGVBnvrR2GkMFynXyQoLVcMsEvi/4bfWQNrUp21zcOy
 TBJWjvQbvuPNjTwed10Poy+8xgG7JGGnYA3Hgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdpJYz/uUGuCJQUNUjMlkfZKhTr6UUsxNbVU8En1500ozw7RRbrNA2rBVPSvc4
 bsenOWHULOV82Yc3rU8sv/rRLtH5ZweiRtA1rAMTakjUGz2zhH5OKk3N6CpR0YUd6EPdgKMq
 0Qv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOK/WNz8A/+v9TCRYSVatYoxSqgtNYk
 8UQjLGhEgcwFKHFscowAjANRkmSPYUekFPGCX22sMjVxEzaaXr8hf5pCSnaP6VBpLwxWzsXs
 6VFdnZdNXhvhMrvqF6/YsBqit4uM4/AO4QHt2s75TrYEewnUdbIRKCiCdpwgmtp2J4eQKa2i
 8wxSjNpaS3bPzZ1BQk8Lqozkc2F2HP9SmgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3EuwPUtXqlAsRITuT+r6M0xg3IroAONPEIfXqYvPqQ0V7jYv9Oc
 EwN0CYnhIYfpWX+G7ERQCaEiHKDuxcdXf9ZHOs79ByBx8Lo3uqJOoQXZmUfMYJ77afaURRvj
 wbUxI2xWVSDpZXIESr1y1uCkd+l1cH5x0cmbDRMcwYK6sKLTGob3kOWFYYL/EJYY7TI9dDML
 9Ki8XJWa1Y715djO0CHEbfv2WPEm3QxZlRpjjg7p0r8hu+DWKarZpaz9X/Q5utaIYCSQzGp5
 SZYx5HPtblQXMvUz0Rhpdnh+5nztp643MD02wYzT/HNCRzxk5JcQWygyG4nfxo4Wir1UTTof
 FXSqWtsCGx7ZxOXgVtMS9vpUawClPG4ffy8D6y8RoceM/BZKV7clAkzNBH49z62yiAEz/pgU
 ap3hO7xVB72/4w8l2HoLwrcuJd2rh0DKZT7H8iklk/6iurHPxZ4i94taTOzUwzw14vcyC29z
 jqVH5LiJ8x3XLKsby/J35QUKFxWf3E3CYqv855cd/KZIxogE2YkUqeDzbQkco1jvqJUiuaXo
 S3tBh4GkALy1S/dNAGHSnF/c7ezD5xxmm02YH43NlGy1nl9PYv2tPUDd4E6dKUM/fB4yaImV
 OEMfsiNW6wdSjnO9zkHQ4P6qYhuKEaiiQ6UZnL3azkjZZ9wAQfO/4a8LAfo8SAPCAuxtNc//
 OL8hl+KH8JbSl07XsjMaf+pw1eghlQnmbp/DxnSP91eWETw64w2eSb/ueA6fpMXIhLZyzrEi
 wvPWUUEpfPAqpMe+cXSgfzWtJ+gFuZzExYIH2Tf6rrqZyDW8nD6nN1FWeeMOzvcSHn16OOpY
 uAMl6PwN/gOnVBrtYtgEuk0kfJitoW3/7IKnB55GHjrbkiwDuIyK3aL6sBDq6lRy+ILogCxQ
 E+OpoFXNLjh1BkJy7LNyN7Jtti+6Mw=
IronPort-HdrOrdr: A9a23:aABuLK9REeYKrKiB8QJuk+DaI+orL9Y04lQ7vn2YSXRuHPBw9v
 re5cjzuiWVtN98Yh0dcJW7Scy9qBDnhPhICOsqTNSftWDd0QPCRuxfBMnZslnd8kXFh4lgPM
 xbEpSWZueeMbEDt7eZ3DWF
X-IronPort-AV: E=Sophos;i="5.88,353,1635220800"; 
   d="scan'208";a="64166858"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH 1/6] x86/spec-ctrl: Clean up MSR_MCU_OPT_CTRL handling
Date: Tue, 8 Feb 2022 18:09:37 +0000
Message-ID: <20220208180942.14871-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220208180942.14871-1-andrew.cooper3@citrix.com>
References: <20220208180942.14871-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Introduce cpu_has_srbds_ctrl as more users are going to appear shortly.

MSR_MCU_OPT_CTRL is gaining extra functionality, meaning that the current
default_xen_mcu_opt_ctrl is no longer a good fit.

Introduce two new helpers, update_mcu_opt_ctrl() which does a full RMW cycle
on the MSR, and set_in_mcu_opt_ctrl() which lets callers configure specific
bits at a time without clobbering each others settings.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/acpi/power.c             |  3 +--
 xen/arch/x86/cpu/intel.c              | 32 +++++++++++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeature.h |  1 +
 xen/arch/x86/include/asm/processor.h  |  3 +++
 xen/arch/x86/include/asm/spec_ctrl.h  |  2 --
 xen/arch/x86/smpboot.c                |  3 +--
 xen/arch/x86/spec_ctrl.c              | 38 ++++++++++++-----------------------
 7 files changed, 51 insertions(+), 31 deletions(-)

diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index d4bdc3e7df42..5eaa77f66a28 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -301,8 +301,7 @@ static int enter_state(u32 state)
         ci->last_spec_ctrl = default_xen_spec_ctrl;
     }
 
-    if ( boot_cpu_has(X86_FEATURE_SRBDS_CTRL) )
-        wrmsrl(MSR_MCU_OPT_CTRL, default_xen_mcu_opt_ctrl);
+    update_mcu_opt_ctrl();
 
     /* (re)initialise SYSCALL/SYSENTER state, amongst other things. */
     percpu_traps_init();
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 9b011c344636..e7d4dd652f9f 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -15,6 +15,38 @@
 #include "cpu.h"
 
 /*
+ * MSR_MCU_OPT_CTRL is a collection of unrelated functionality, with separate
+ * enablement requirements, but which want to be consistent across the system.
+ */
+static uint32_t __read_mostly mcu_opt_ctrl_mask;
+static uint32_t __read_mostly mcu_opt_ctrl_val;
+
+void update_mcu_opt_ctrl(void)
+{
+    uint32_t mask = mcu_opt_ctrl_mask, lo, hi;
+
+    if ( !mask )
+        return;
+
+    rdmsr(MSR_MCU_OPT_CTRL, lo, hi);
+
+    lo &= ~mask;
+    lo |= mcu_opt_ctrl_val;
+
+    wrmsr(MSR_MCU_OPT_CTRL, lo, hi);
+}
+
+void __init set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val)
+{
+    mcu_opt_ctrl_mask |= mask;
+
+    mcu_opt_ctrl_val &= ~mask;
+    mcu_opt_ctrl_val |= (val & mask);
+
+    update_mcu_opt_ctrl();
+}
+
+/*
  * Processors which have self-snooping capability can handle conflicting
  * memory type across CPUs by snooping its own cache. However, there exists
  * CPU models in which having conflicting memory types still leads to
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 4754940e23f3..a0ab6d7d78ea 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -134,6 +134,7 @@
 #define cpu_has_avx512_4vnniw   boot_cpu_has(X86_FEATURE_AVX512_4VNNIW)
 #define cpu_has_avx512_4fmaps   boot_cpu_has(X86_FEATURE_AVX512_4FMAPS)
 #define cpu_has_avx512_vp2intersect boot_cpu_has(X86_FEATURE_AVX512_VP2INTERSECT)
+#define cpu_has_srbds_ctrl      boot_cpu_has(X86_FEATURE_SRBDS_CTRL)
 #define cpu_has_rtm_always_abort boot_cpu_has(X86_FEATURE_RTM_ALWAYS_ABORT)
 #define cpu_has_tsx_force_abort boot_cpu_has(X86_FEATURE_TSX_FORCE_ABORT)
 #define cpu_has_serialize       boot_cpu_has(X86_FEATURE_SERIALIZE)
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index e2e1eaf5bd0d..23639d5479a3 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -626,6 +626,9 @@ extern int8_t opt_tsx, cpu_has_tsx_ctrl;
 extern bool rtm_disabled;
 void tsx_init(void);
 
+void update_mcu_opt_ctrl(void);
+void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
+
 enum ap_boot_method {
     AP_BOOT_NORMAL,
     AP_BOOT_SKINIT,
diff --git a/xen/arch/x86/include/asm/spec_ctrl.h b/xen/arch/x86/include/asm/spec_ctrl.h
index a803d16f9065..f76029523610 100644
--- a/xen/arch/x86/include/asm/spec_ctrl.h
+++ b/xen/arch/x86/include/asm/spec_ctrl.h
@@ -54,8 +54,6 @@ extern int8_t opt_pv_l1tf_hwdom, opt_pv_l1tf_domu;
  */
 extern paddr_t l1tf_addr_mask, l1tf_safe_maddr;
 
-extern uint64_t default_xen_mcu_opt_ctrl;
-
 static inline void init_shadow_spec_ctrl_state(void)
 {
     struct cpu_info *info = get_cpu_info();
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 22ae4c1b2de9..335129a0104d 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -385,8 +385,7 @@ void start_secondary(void *unused)
         wrmsrl(MSR_SPEC_CTRL, default_xen_spec_ctrl);
         info->last_spec_ctrl = default_xen_spec_ctrl;
     }
-    if ( boot_cpu_has(X86_FEATURE_SRBDS_CTRL) )
-        wrmsrl(MSR_MCU_OPT_CTRL, default_xen_mcu_opt_ctrl);
+    update_mcu_opt_ctrl();
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index ee862089b7f6..3628b4b4154f 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -67,7 +67,6 @@ static bool __initdata cpu_has_bug_msbds_only; /* => minimal HT impact. */
 static bool __initdata cpu_has_bug_mds; /* Any other M{LP,SB,FB}DS combination. */
 
 static int8_t __initdata opt_srb_lock = -1;
-uint64_t __read_mostly default_xen_mcu_opt_ctrl;
 
 static int __init parse_spec_ctrl(const char *s)
 {
@@ -376,7 +375,7 @@ static void __init print_details(enum ind_thunk thunk, uint64_t caps)
            (default_xen_spec_ctrl & SPEC_CTRL_SSBD)  ? " SSBD+" : " SSBD-",
            !(caps & ARCH_CAPS_TSX_CTRL)              ? "" :
            (opt_tsx & 1)                             ? " TSX+" : " TSX-",
-           !boot_cpu_has(X86_FEATURE_SRBDS_CTRL)     ? "" :
+           !cpu_has_srbds_ctrl                       ? "" :
            opt_srb_lock                              ? " SRB_LOCK+" : " SRB_LOCK-",
            opt_ibpb                                  ? " IBPB"  : "",
            opt_l1d_flush                             ? " L1D_FLUSH" : "",
@@ -1251,32 +1250,24 @@ void __init init_speculation_mitigations(void)
         tsx_init();
     }
 
-    /* Calculate suitable defaults for MSR_MCU_OPT_CTRL */
-    if ( boot_cpu_has(X86_FEATURE_SRBDS_CTRL) )
+    /*
+     * On some SRBDS-affected hardware, it may be safe to relax srb-lock by
+     * default.
+     *
+     * On parts which enumerate MDS_NO and not TAA_NO, TSX is the only known
+     * way to access the Fill Buffer.  If TSX isn't available (inc. SKU
+     * reasons on some models), or TSX is explicitly disabled, then there is
+     * no need for the extra overhead to protect RDRAND/RDSEED.
+     */
+    if ( cpu_has_srbds_ctrl )
     {
-        uint64_t val;
-
-        rdmsrl(MSR_MCU_OPT_CTRL, val);
-
-        /*
-         * On some SRBDS-affected hardware, it may be safe to relax srb-lock
-         * by default.
-         *
-         * On parts which enumerate MDS_NO and not TAA_NO, TSX is the only way
-         * to access the Fill Buffer.  If TSX isn't available (inc. SKU
-         * reasons on some models), or TSX is explicitly disabled, then there
-         * is no need for the extra overhead to protect RDRAND/RDSEED.
-         */
         if ( opt_srb_lock == -1 &&
              (caps & (ARCH_CAPS_MDS_NO|ARCH_CAPS_TAA_NO)) == ARCH_CAPS_MDS_NO &&
              (!cpu_has_hle || ((caps & ARCH_CAPS_TSX_CTRL) && rtm_disabled)) )
             opt_srb_lock = 0;
 
-        val &= ~MCU_OPT_CTRL_RNGDS_MITG_DIS;
-        if ( !opt_srb_lock )
-            val |= MCU_OPT_CTRL_RNGDS_MITG_DIS;
-
-        default_xen_mcu_opt_ctrl = val;
+        set_in_mcu_opt_ctrl(MCU_OPT_CTRL_RNGDS_MITG_DIS,
+                            opt_srb_lock ? 0 : MCU_OPT_CTRL_RNGDS_MITG_DIS);
     }
 
     print_details(thunk, caps);
@@ -1314,9 +1305,6 @@ void __init init_speculation_mitigations(void)
         wrmsrl(MSR_SPEC_CTRL, val);
         info->last_spec_ctrl = val;
     }
-
-    if ( boot_cpu_has(X86_FEATURE_SRBDS_CTRL) )
-        wrmsrl(MSR_MCU_OPT_CTRL, default_xen_mcu_opt_ctrl);
 }
 
 static void __init __maybe_unused build_assertions(void)
-- 
2.11.0


