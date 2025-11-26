Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ACFC89FE1
	for <lists+xen-devel@lfdr.de>; Wed, 26 Nov 2025 14:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1172614.1497737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFTd-0006Tz-CV; Wed, 26 Nov 2025 13:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1172614.1497737; Wed, 26 Nov 2025 13:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vOFTd-0006Ro-5o; Wed, 26 Nov 2025 13:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1172614;
 Wed, 26 Nov 2025 13:22:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+ZBX=6C=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vOFTb-0005zB-Gt
 for xen-devel@lists.xenproject.org; Wed, 26 Nov 2025 13:22:31 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f51c6845-caca-11f0-980a-7dc792cee155;
 Wed, 26 Nov 2025 14:22:29 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4779d47be12so51357195e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 26 Nov 2025 05:22:29 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052b3f5fsm42042275e9.4.2025.11.26.05.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Nov 2025 05:22:28 -0800 (PST)
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
X-Inumbo-ID: f51c6845-caca-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764163349; x=1764768149; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=19EMhPwi+GdHgfL1g0v2UfyNMhFsDMdRnBMaRbpB0ZU=;
        b=MljMjp/hhh+WWS+OZnzMfaVZp6brfVoOloAGrxFTfaYiCsvhHKZtTtxoaka/S7ir3K
         cg9XT4NJXb1Y03THAnI/M9et5y8iB9AbvX9O0pxiyjRnGOTz3Raa9w552Ery373uAKHs
         F7LVHax9wj0K/qKKPL/OG/Uxhc61J7D5/RKTc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764163349; x=1764768149;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=19EMhPwi+GdHgfL1g0v2UfyNMhFsDMdRnBMaRbpB0ZU=;
        b=YpChTOgnuXDhoqX/es/Xv84ogxoOTLE9DTpAO//U7UjDDgWAKnRTRX/1hKkeBulRpd
         4rkeKSJAlf0LHypOs5gbgbCTB29iRaYvN04ipvmcgQlDs0a4o6kTrMYwxoyjTfRj0sWa
         CydmLTS3+8FS8KJxp/b2I69GuWt2/2Jlefu5CV8q4nNQBdx1YlNifljMca0P3wAYCf61
         ThRG3GXGSjKp9EVnCcfsQp46dR4kD0WNf02DIbJ6J/WkbxDXEFQnvi6M+/BLgVF31SFm
         OuGNrjkJYSPScMXw9Fxryo/5beiXz3nYv7N4bO972PcrPIeoV6yZLBKeBOELAWMl3gEb
         odwQ==
X-Gm-Message-State: AOJu0YxZtzkBHekWN8DYQTY60shmQ8fr7A1pyYtDmGPRCjns6KjIE6au
	OXaICYFhRohz3Mct+uFGX3mkUPfy9pA0ODBp8gjeiL5Dl5GHkvu3kZelUIZ2MNeiixYKHfIJwPO
	jawvw
X-Gm-Gg: ASbGncsaqOP1Zejq6CLwI5YfjI/zayM+0KGzqj+FW2Dqg8kzMQFKRudBAjXp1MRYU7w
	JF+9VDsFM6J4aVamD+BiWQACuHFPM4TefjOaSCjWdwrmt1ARX9wHIqEk72b4cTRN+bjW3/uC4lm
	2q15bUf3chnTmeFd7E/7Czf92iQ913ZA5EDT9GNgjOmdRxnF6xcVyAGYw9T5lZPnvejkFN2NaNZ
	unrnVf0wya9LsAvlsGGwVv4mJdKO2cBNqtZr2d98O7RZ4smcBwObkhv1Y+BDoyzXbgrM8afsmoW
	jrGWsIycDsj6ZDPOq5VM5OJ0G78jxo+uiULC+dP/JMiIDdNCa1ELZ0EUXq57TWbejRMTHD8sHMV
	mqw8ME2MyoXu9b4Z8JFN/F/D0KzkgRAPkPD09RiZS8+GC98T5E97QhxlGYpxaT/uZHLVLi9sPzR
	/24x66F2mvynBKKzXgHHZVqxHsp62etuB+nGBECIT7pKf/dZmGAYWyM7eqjcihEQ==
X-Google-Smtp-Source: AGHT+IGWZjJGhpydepWJ2VpVScDuk1zaoj+lqAHPK74fKJT3numNq0qOOE5fMgmqSN98CYtQkhzpBQ==
X-Received: by 2002:a05:600c:4506:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-477c0190e57mr246322575e9.15.1764163348485;
        Wed, 26 Nov 2025 05:22:28 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/amd: Fix race editing DE_CFG
Date: Wed, 26 Nov 2025 13:22:20 +0000
Message-Id: <20251126132220.881028-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251126132220.881028-1-andrew.cooper3@citrix.com>
References: <20251126132220.881028-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We have two different functions explaining that DE_CFG is Core-scoped and that
writes are racy but happen to be safe.  This is only true when there's one of
them.

Introduce amd_init_de_cfg() to be the singular function which writes to
DE_CFG, modelled after the logic we already have for BP_CFG.

While reworking amd_check_zenbleed() into a simple predicate used by
amd_init_de_cfg(), fix the microcode table.  The 'good_rev' was specific to an
individual stepping and not valid to be matched by model, let alone a range.
The only CPUs incorrectly matched that I can locate appear to be
pre-production, and probably didn't get Zenbleed microcode.

Rework amd_init_lfence() to be amd_init_lfence_dispatch() with only the
purpose of configuring X86_FEATURE_LFENCE_DISPATCH in the case that it needs
synthesising.  Run it on the BSP only and use setup_force_cpu_cap() to prevent
the bit disappearing on a subseuqent CPUID rescan.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

I've submitted a matching fix to Linux's Zenbleed table.
---
 xen/arch/x86/cpu/amd.c   | 227 +++++++++++++++++++--------------------
 xen/arch/x86/cpu/cpu.h   |   3 +-
 xen/arch/x86/cpu/hygon.c |   6 +-
 3 files changed, 118 insertions(+), 118 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 7953261895ac..c9d0b55c8c8d 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -747,45 +747,6 @@ void amd_log_freq(const struct cpuinfo_x86 *c)
 		printk("CPU%u: %u MHz\n", smp_processor_id(), low_mhz);
 }
 
-void amd_init_lfence(struct cpuinfo_x86 *c)
-{
-	uint64_t value;
-
-	/*
-	 * Some hardware has LFENCE dispatch serialising always enabled,
-	 * nothing to do on that case.
-	 */
-	if (test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability))
-		return;
-
-	/*
-	 * Attempt to set lfence to be Dispatch Serialising.  This MSR almost
-	 * certainly isn't virtualised (and Xen at least will leak the real
-	 * value in but silently discard writes), as well as being per-core
-	 * rather than per-thread, so do a full safe read/write/readback cycle
-	 * in the worst case.
-	 */
-	if (rdmsr_safe(MSR_AMD64_DE_CFG, &value))
-		/* Unable to read.  Assume the safer default. */
-		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-			    c->x86_capability);
-	else if (value & AMD64_DE_CFG_LFENCE_SERIALISE)
-		/* Already dispatch serialising. */
-		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-			  c->x86_capability);
-	else if (wrmsr_safe(MSR_AMD64_DE_CFG,
-			    value | AMD64_DE_CFG_LFENCE_SERIALISE) ||
-		 rdmsr_safe(MSR_AMD64_DE_CFG, &value) ||
-		 !(value & AMD64_DE_CFG_LFENCE_SERIALISE))
-		/* Attempt to set failed.  Assume the safer default. */
-		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
-			    c->x86_capability);
-	else
-		/* Successfully enabled! */
-		__set_bit(X86_FEATURE_LFENCE_DISPATCH,
-			  c->x86_capability);
-}
-
 /*
  * Refer to the AMD Speculative Store Bypass whitepaper:
  * https://developer.amd.com/wp-content/resources/124441_AMD64_SpeculativeStoreBypassDisable_Whitepaper_final.pdf
@@ -979,76 +940,6 @@ void __init detect_zen2_null_seg_behaviour(void)
 
 }
 
-static void amd_check_zenbleed(void)
-{
-	const struct cpu_signature *sig = &this_cpu(cpu_sig);
-	unsigned int good_rev;
-	uint64_t val, old_val, chickenbit = (1 << 9);
-
-	/*
-	 * If we're virtualised, we can't do family/model checks safely, and
-	 * we likely wouldn't have access to DE_CFG even if we could see a
-	 * microcode revision.
-	 *
-	 * A hypervisor may hide AVX as a stopgap mitigation.  We're not in a
-	 * position to care either way.  An admin doesn't want to be disabling
-	 * AVX as a mitigation on any build of Xen with this logic present.
-	 */
-	if (cpu_has_hypervisor || boot_cpu_data.x86 != 0x17)
-		return;
-
-	switch (boot_cpu_data.x86_model) {
-	case 0x30 ... 0x3f: good_rev = 0x0830107a; break;
-	case 0x60 ... 0x67: good_rev = 0x0860010b; break;
-	case 0x68 ... 0x6f: good_rev = 0x08608105; break;
-	case 0x70 ... 0x7f: good_rev = 0x08701032; break;
-	case 0xa0 ... 0xaf: good_rev = 0x08a00008; break;
-	default:
-		/*
-		 * With the Fam17h check above, most parts getting here are
-		 * Zen1.  They're not affected.  Assume Zen2 ones making it
-		 * here are affected regardless of microcode version.
-		 */
-		if (is_zen1_uarch())
-			return;
-		good_rev = ~0U;
-		break;
-	}
-
-	rdmsrl(MSR_AMD64_DE_CFG, val);
-	old_val = val;
-
-	/*
-	 * Microcode is the preferred mitigation, in terms of performance.
-	 * However, without microcode, this chickenbit (specific to the Zen2
-	 * uarch) disables Floating Point Mov-Elimination to mitigate the
-	 * issue.
-	 */
-	val &= ~chickenbit;
-	if (sig->rev < good_rev)
-		val |= chickenbit;
-
-	if (val == old_val)
-		/* Nothing to change. */
-		return;
-
-	/*
-	 * DE_CFG is a Core-scoped MSR, and this write is racy during late
-	 * microcode load.  However, both threads calculate the new value from
-	 * state which is shared, and unrelated to the old value, so the
-	 * result should be consistent.
-	 */
-	wrmsrl(MSR_AMD64_DE_CFG, val);
-
-	/*
-	 * Inform the admin that we changed something, but don't spam,
-	 * especially during a late microcode load.
-	 */
-	if (smp_processor_id() == 0)
-		printk(XENLOG_INFO "Zenbleed mitigation - using %s\n",
-		       val & chickenbit ? "chickenbit" : "microcode");
-}
-
 static void cf_check fam17_disable_c6(void *arg)
 {
 	/* Disable C6 by clearing the CCR{0,1,2}_CC6EN bits. */
@@ -1075,6 +966,112 @@ static void cf_check fam17_disable_c6(void *arg)
 	wrmsrl(MSR_AMD_CSTATE_CFG, val & mask);
 }
 
+static bool zenbleed_use_chickenbit(void)
+{
+    unsigned int curr_rev;
+    uint8_t fixed_rev;
+
+    /*
+     * If we're virtualised, we can't do family/model checks safely, and
+     * we likely wouldn't have access to DE_CFG even if we could see a
+     * microcode revision.
+     *
+     * A hypervisor may hide AVX as a stopgap mitigation.  We're not in a
+     * position to care either way.  An admin doesn't want to be disabling
+     * AVX as a mitigation on any build of Xen with this logic present.
+     */
+    if ( cpu_has_hypervisor || boot_cpu_data.family != 0x17 )
+        return false;
+
+    curr_rev = this_cpu(cpu_sig).rev;
+    switch ( curr_rev >> 8 )
+    {
+    case 0x083010: fixed_rev = 0x7a; break;
+    case 0x086001: fixed_rev = 0x0b; break;
+    case 0x086081: fixed_rev = 0x05; break;
+    case 0x087010: fixed_rev = 0x32; break;
+    case 0x08a000: fixed_rev = 0x08; break;
+    default:
+        /*
+         * With the Fam17h check above, most parts getting here are Zen1.
+         * They're not affected.  Assume Zen2 ones making it here are affected
+         * regardless of microcode version.
+         */
+        return is_zen2_uarch();
+    }
+
+    return (uint8_t)curr_rev >= fixed_rev;
+}
+
+void amd_init_de_cfg(const struct cpuinfo_x86 *c)
+{
+    uint64_t val, new = 0;
+
+    /* The MSR doesn't exist on Fam 0xf/0x11. */
+    if ( c->family != 0xf && c->family != 0x11 )
+        return;
+
+    /*
+     * On Zen3 (Fam 0x19) and later CPUs, LFENCE is unconditionally dispatch
+     * serialising, and is enumerated in CPUID.  Hypervisors may also
+     * enumerate it when the setting is in place and MSR_AMD64_DE_CFG isn't
+     * available.
+     */
+    if ( !test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
+        new |= AMD64_DE_CFG_LFENCE_SERIALISE;
+
+    /*
+     * If vulnerable to Zenbleed and not mitigated in microcode, use the
+     * bigger hammer.
+     */
+    if ( zenbleed_use_chickenbit() )
+        new |= (1 << 9);
+
+    if ( !new )
+        return;
+
+    if ( rdmsr_safe(MSR_AMD64_DE_CFG, &val) ||
+         (val & new) == new )
+        return;
+
+    /*
+     * DE_CFG is a Core-scoped MSR, and this write is racy.  However, both
+     * threads calculate the new value from state which expected to be
+     * consistent across CPUs and unrelated to the old value, so the result
+     * should be consistent.
+     */
+    wrmsr_safe(MSR_AMD64_DE_CFG, val | new);
+}
+
+void __init amd_init_lfence_dispatch(void)
+{
+    struct cpuinfo_x86 *c = &boot_cpu_data;
+    uint64_t val;
+
+    if ( test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability) )
+        /* LFENCE is forced dispatch serialising and we can't control it. */
+        return;
+
+    if ( c->family == 0xf || c->family == 0x11 )
+        /* MSR doesn't exist.  LFENCE is dispatch serialising on this hardare. */
+        goto set;
+
+    if ( rdmsr_safe(MSR_AMD64_DE_CFG, &val) )
+        /* Unable to read.  Assume the safer default. */
+        goto clear;
+
+    if ( val & AMD64_DE_CFG_LFENCE_SERIALISE )
+        /* Already dispatch serialising. */
+        goto set;
+
+ clear:
+    setup_clear_cpu_cap(X86_FEATURE_LFENCE_DISPATCH);
+    return;
+
+ set:
+    setup_force_cpu_cap(X86_FEATURE_LFENCE_DISPATCH);
+}
+
 static void amd_check_bp_cfg(void)
 {
 	uint64_t val, new = 0;
@@ -1118,6 +1115,11 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	u32 l, h;
 	uint64_t value;
 
+        amd_init_de_cfg(c);
+
+        if (c == &boot_cpu_data)
+            amd_init_lfence_dispatch(); /* Needs amd_init_de_cfg() */
+
 	/* Disable TLB flush filter by setting HWCR.FFDIS on K8
 	 * bit 6 of msr C001_0015
 	 *
@@ -1156,12 +1158,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if (c == &boot_cpu_data && !cpu_has(c, X86_FEATURE_RSTR_FP_ERR_PTRS))
 		setup_force_cpu_cap(X86_BUG_FPU_PTRS);
 
-	if (c->x86 == 0x0f || c->x86 == 0x11)
-		/* Always dispatch serialising on this hardare. */
-		__set_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability);
-	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */
-		amd_init_lfence(c);
-
 	amd_init_ssbd(c);
 
 	if (c->x86 == 0x17)
@@ -1379,7 +1375,6 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if ((smp_processor_id() == 1) && !cpu_has(c, X86_FEATURE_ITSC))
 		disable_c1_ramping();
 
-	amd_check_zenbleed();
 	amd_check_bp_cfg();
 
 	if (fam17_c6_disabled)
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index cbb434f3a23d..8bed3f52490f 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -24,7 +24,8 @@ extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 
 void cf_check early_init_amd(struct cpuinfo_x86 *c);
 void amd_log_freq(const struct cpuinfo_x86 *c);
-void amd_init_lfence(struct cpuinfo_x86 *c);
+void amd_init_de_cfg(const struct cpuinfo_x86 *c);
+void amd_init_lfence_dispatch(void);
 void amd_init_ssbd(const struct cpuinfo_x86 *c);
 void amd_init_spectral_chicken(void);
 void detect_zen2_null_seg_behaviour(void);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index f7508cc8fcb9..68e98651cb79 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -31,7 +31,11 @@ static void cf_check init_hygon(struct cpuinfo_x86 *c)
 {
 	unsigned long long value;
 
-	amd_init_lfence(c);
+        amd_init_de_cfg(c);
+
+        if (c == &boot_cpu_data)
+            amd_init_lfence_dispatch(); /* Needs amd_init_de_cfg() */
+
 	amd_init_ssbd(c);
 
 	/* Probe for NSCB on Zen2 CPUs when not virtualised */
-- 
2.39.5


