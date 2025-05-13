Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0AFAB552E
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 14:49:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.982798.1369153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEp3T-0001zv-TF; Tue, 13 May 2025 12:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 982798.1369153; Tue, 13 May 2025 12:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEp3T-0001xf-Pb; Tue, 13 May 2025 12:48:19 +0000
Received: by outflank-mailman (input) for mailman id 982798;
 Tue, 13 May 2025 12:48:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p0QL=X5=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1uEp3S-0001xZ-FG
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 12:48:18 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a9dcfb0-2ff8-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 14:48:17 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so11139275e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 05:48:17 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net.
 [92.26.98.202]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442d5cf5d6bsm170957265e9.1.2025.05.13.05.48.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 05:48:15 -0700 (PDT)
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
X-Inumbo-ID: 8a9dcfb0-2ff8-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1747140496; x=1747745296; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EwU7cIuXAcZQkhkLVi2ursHZkv24X8sAV3YSXlpJuPw=;
        b=fvevpl8JV/THltnaPQxgH6JG8guAfC8LRQX3G9XdFLG5r9WnYhvzkKdpme/DPyMjBl
         TDL6OMLsGAYLzTJFckvVijB8kzQoesxQ3wXFW8SglUS2qS1e9P5N9/eCHlywgecNof6g
         JO8+7zlqNCfCg98vRLpxCUKx0RXRzAH4pAhEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747140496; x=1747745296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EwU7cIuXAcZQkhkLVi2ursHZkv24X8sAV3YSXlpJuPw=;
        b=BlYIdnw1qNJg3li1H/MqyXjGV6gyDRvWSnX/ubo58WCFbjF6xKMKCBgKVQBmo8PnuP
         MhDXiU2yOeiJBIVcZf3Vm7CbfCCxo6nMuiv/TUFclZ/c6vCASXcCLGZ3byEmadeCx9h+
         rjMIK8/wyzjX9ZC7zkUzs4W/CYz0kCq+DPmXXNDs1ECQk44d9irrTMyhHGwDP2YKKPMc
         +SpD/oa+L13/2tP+Dfq4L2JKGIQw1qYCnVvGTw6ELe/JYlaXYnIwQoxD2FWGZpbdzS16
         tKwAGSa3QGbl6zrzgZGnco4QZwxy9qiE+S1Hkbl/QgLis9PlFxkhrGUKvVm1YEeN+SVW
         KXgQ==
X-Gm-Message-State: AOJu0Yx6Tf5/vTJRMVS7JFTJVjmJoX6c4lNBGuK/jwNlvFpgrWp1nrEp
	zkeFzFbkl2B/wJzvJ1H6l0jRcmIlEvZBFlw/65nfE/QVx9REkqxMNcQw1dILObofEx3N5PtfQsC
	Y
X-Gm-Gg: ASbGncuBaqJ7PLW8cHCnBXl9bJcWGzTKkheLuy7CV+tok36w7RDFc05VoWHtRcMINfk
	tjOUg1a99HBpKRJ2WiqIK4jbvKDYig3cwq1BvRKpb7Eq5B52IAQv5X+M0SoLX9KQLV19v7kEsG5
	vRjbGTRyVLKqdzk5AmcFsj0sK0lgkDZfcfffbXOWyZgMgG1+9Qhm069w6QfjPPUiulHV57aVrfT
	8QeePwZBkl8BJhwGuxoSAbcGop7smU9zHfa05t9ko8J2Y0yCAqO1tITV2AnIH0X1qFi57vjOYig
	5/dxz05beGdgPt1ypzZ9VpEmwVWLltH0Id98IaD2NANtsF9+mTka5aizd4O9Q/SYSr/6rubZcdB
	SkEitIgMh46qVxv8XOlY5eaoB
X-Google-Smtp-Source: AGHT+IFCknagyukqmUBlsMqarGV3XhKu5cMo7JA5t+Y0usDLHGSMDC2/Ehb0SBbA29gxnoaHoxlEwQ==
X-Received: by 2002:a05:600c:b91:b0:441:b3eb:5720 with SMTP id 5b1f17b1804b1-442d6ddeb79mr135079065e9.29.1747140496511;
        Tue, 13 May 2025 05:48:16 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH] x86/spec-ctrl: Support Intel's new PB-OPT
Date: Tue, 13 May 2025 13:48:14 +0100
Message-Id: <20250513124814.3500710-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In IPU 2025.2 (May 2025), Intel have released an alternative mitigation for a
prior security issue (SA-00982) on Sappire and Emerald Rapids CPUs.

Intel suggest that certain workloads will benefit from using the alternative
mode.  This can be selected by booting with `spec-ctrl=ibpb-alt`.

https://www.intel.com/content/www/us/en/developer/articles/technical/software-security-guidance/technical-documentation/cpuid-enumeration-and-architectural-msrs.html
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

Intel have named this PBOPT (no space), but that's too close to PBRSB for my
liking.  PB_OPT (with a space) is also consistent with MCU_OPT, it's closest
neighbour.

I've chosen not to extend print_details() with this.  It's specific to two
Intel CPUs and not being continued into future ones.

I'm not sure what else to say in the cmdline docs.  Intel is very sparse on
details.  An educated guess is that in the default mode, part of the predictor
is inhibited, while in the alternative mode it's active, but at the cost of
extra scrubbing in IBPB.
---
 docs/misc/xen-command-line.pandoc           |  6 ++++-
 xen/arch/x86/acpi/power.c                   |  1 +
 xen/arch/x86/cpu/intel.c                    | 28 +++++++++++++++++++++
 xen/arch/x86/include/asm/cpufeature.h       |  1 +
 xen/arch/x86/include/asm/msr-index.h        |  3 +++
 xen/arch/x86/include/asm/processor.h        |  3 +++
 xen/arch/x86/smpboot.c                      |  1 +
 xen/arch/x86/spec_ctrl.c                    |  7 ++++++
 xen/include/public/arch-x86/cpufeatureset.h |  1 +
 9 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 89db6e83be66..b0eadd2c5d58 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2470,7 +2470,7 @@ By default SSBD will be mitigated at runtime (i.e `ssbd=runtime`).
 >              {ibrs,ibpb,ssbd,psfd,
 >              eager-fpu,l1d-flush,branch-harden,srb-lock,
 >              unpriv-mmio,gds-mit,div-scrub,lock-harden,
->              bhi-dis-s,bp-spec-reduce}=<bool> ]`
+>              bhi-dis-s,bp-spec-reduce,ibpb-alt}=<bool> ]`
 
 Controls for speculative execution sidechannel mitigations.  By default, Xen
 will pick the most appropriate mitigations based on compiled in support,
@@ -2626,6 +2626,10 @@ bp-spec-reduce when available, as it is preferable to using `ibpb-entry=hvm`
 to mitigate SRSO for HVM guests, and because it is a prerequisite to advertise
 SRSO_U/S_NO to PV guests.
 
+On Sappire and Emerald Rapids CPUs with May 2025 microcode or later, the
+`ibpb-alt=` option can be used to switch to the alternative mitigation for
+Intel SA-00982.  Intel suggest that some workloads will benefit from this.
+
 ### sync_console
 > `= <boolean>`
 
diff --git a/xen/arch/x86/acpi/power.c b/xen/arch/x86/acpi/power.c
index 3196a33b1918..095ca391ad22 100644
--- a/xen/arch/x86/acpi/power.c
+++ b/xen/arch/x86/acpi/power.c
@@ -306,6 +306,7 @@ static int enter_state(u32 state)
     }
 
     update_mcu_opt_ctrl();
+    update_pb_opt_ctrl();
 
     /*
      * This should be before restoring CR4, but that is earlier in asm and
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 12c3ff65e02f..ef9368167a0d 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -49,6 +49,34 @@ void __init set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val)
     update_mcu_opt_ctrl();
 }
 
+static uint32_t __ro_after_init pb_opt_ctrl_mask;
+static uint32_t __ro_after_init pb_opt_ctrl_val;
+
+void update_pb_opt_ctrl(void)
+{
+    uint32_t mask = pb_opt_ctrl_mask, lo, hi;
+
+    if ( !mask )
+        return;
+
+    rdmsr(MSR_PB_OPT_CTRL, lo, hi);
+
+    lo &= ~mask;
+    lo |= pb_opt_ctrl_val;
+
+    wrmsr(MSR_PB_OPT_CTRL, lo, hi);
+}
+
+void __init set_in_pb_opt_ctrl(uint32_t mask, uint32_t val)
+{
+    pb_opt_ctrl_mask |= mask;
+
+    pb_opt_ctrl_val &= ~mask;
+    pb_opt_ctrl_val |= (val & mask);
+
+    update_pb_opt_ctrl();
+}
+
 /*
  * Processors which have self-snooping capability can handle conflicting
  * memory type across CPUs by snooping its own cache. However, there exists
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 397a04af41a1..6c5f5ce0cfc5 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -219,6 +219,7 @@ static inline bool boot_cpu_has(unsigned int feat)
 #define cpu_has_gds_no          boot_cpu_has(X86_FEATURE_GDS_NO)
 #define cpu_has_rfds_no         boot_cpu_has(X86_FEATURE_RFDS_NO)
 #define cpu_has_rfds_clear      boot_cpu_has(X86_FEATURE_RFDS_CLEAR)
+#define cpu_has_pb_opt_ctrl     boot_cpu_has(X86_FEATURE_PB_OPT_CTRL)
 #define cpu_has_its_no          boot_cpu_has(X86_FEATURE_ITS_NO)
 
 /* Synthesized. */
diff --git a/xen/arch/x86/include/asm/msr-index.h b/xen/arch/x86/include/asm/msr-index.h
index 22d9e76e5521..6f2c3147e343 100644
--- a/xen/arch/x86/include/asm/msr-index.h
+++ b/xen/arch/x86/include/asm/msr-index.h
@@ -56,6 +56,9 @@
 #define MSR_MISC_PACKAGE_CTRL               0x000000bc
 #define  PGK_CTRL_ENERGY_FILTER_EN          (_AC(1, ULL) <<  0)
 
+#define MSR_PB_OPT_CTRL                     0x000000bf
+#define  PB_OPT_IBPB_ALT                    (_AC(1, ULL) <<  0)
+
 #define MSR_CORE_CAPABILITIES               0x000000cf
 #define  CORE_CAPS_SPLITLOCK_DETECT         (_AC(1, ULL) <<  5)
 
diff --git a/xen/arch/x86/include/asm/processor.h b/xen/arch/x86/include/asm/processor.h
index 75af7ea3c476..eacd425c5350 100644
--- a/xen/arch/x86/include/asm/processor.h
+++ b/xen/arch/x86/include/asm/processor.h
@@ -470,6 +470,9 @@ static inline void tsx_init(void) {}
 void update_mcu_opt_ctrl(void);
 void set_in_mcu_opt_ctrl(uint32_t mask, uint32_t val);
 
+void update_pb_opt_ctrl(void);
+void set_in_pb_opt_ctrl(uint32_t mask, uint32_t val);
+
 enum ap_boot_method {
     AP_BOOT_NORMAL,
     AP_BOOT_SKINIT,
diff --git a/xen/arch/x86/smpboot.c b/xen/arch/x86/smpboot.c
index 54207e6d8830..80c729d74895 100644
--- a/xen/arch/x86/smpboot.c
+++ b/xen/arch/x86/smpboot.c
@@ -383,6 +383,7 @@ void asmlinkage start_secondary(void *unused)
         info->last_spec_ctrl = default_xen_spec_ctrl;
     }
     update_mcu_opt_ctrl();
+    update_pb_opt_ctrl();
 
     tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
 
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 0a635025e488..79c0a9df66f8 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -85,6 +85,8 @@ static int8_t __initdata opt_gds_mit = -1;
 static int8_t __initdata opt_div_scrub = -1;
 bool __ro_after_init opt_bp_spec_reduce = true;
 
+static __initdata bool opt_ibpb_alt;
+
 static int __init cf_check parse_spec_ctrl(const char *s)
 {
     const char *ss;
@@ -369,6 +371,8 @@ static int __init cf_check parse_spec_ctrl(const char *s)
             opt_div_scrub = val;
         else if ( (val = parse_boolean("bp-spec-reduce", s, ss)) >= 0 )
             opt_bp_spec_reduce = val;
+        else if ( (val = parse_boolean("ibpb-alt", s, ss)) >= 0 )
+            opt_ibpb_alt = val;
         else
             rc = -EINVAL;
 
@@ -2494,6 +2498,9 @@ void __init init_speculation_mitigations(void)
         wrmsrl(MSR_SPEC_CTRL, val);
         info->last_spec_ctrl = val;
     }
+
+    if ( cpu_has_pb_opt_ctrl )
+        set_in_pb_opt_ctrl(PB_OPT_IBPB_ALT, opt_ibpb_alt);
 }
 
 static void __init __maybe_unused build_assertions(void)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index a6d4a0cba7d8..044230bfe854 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -392,6 +392,7 @@ XEN_CPUFEATURE(IGN_UMONITOR,       16*32+29) /*   MCU_OPT_CTRL.IGN_UMONITOR */
 XEN_CPUFEATURE(MON_UMON_MITG,      16*32+30) /*   MCU_OPT_CTRL.MON_UMON_MITG */
 
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 (express in terms of word 16) */
+XEN_CPUFEATURE(PB_OPT_CTRL,        16*32+32) /*   MSR_PB_OPT_CTRL.IBPB_ALT */
 XEN_CPUFEATURE(ITS_NO,             16*32+62) /*!A No Indirect Target Selection */
 
 #endif /* XEN_CPUFEATURE */

base-commit: f6042f38e621525feff86bb101dc751d2d87cff8
-- 
2.39.5


