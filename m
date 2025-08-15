Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F12B28739
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083887.1443345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Et-0005nv-2A; Fri, 15 Aug 2025 20:41:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083887.1443345; Fri, 15 Aug 2025 20:41:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1Es-0005db-St; Fri, 15 Aug 2025 20:41:26 +0000
Received: by outflank-mailman (input) for mailman id 1083887;
 Fri, 15 Aug 2025 20:41:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Er-0005Rl-C7
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:25 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3418a8be-7a18-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 22:41:22 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-45a1b065d59so12105795e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:22 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:20 -0700 (PDT)
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
X-Inumbo-ID: 3418a8be-7a18-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290481; x=1755895281; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mj6TEvAdxVzR/7U8GT5TshFxyIHuvBrftHDmoFGVHrQ=;
        b=Yzzvq7jErhYOM6/U/V42pMqV+MFfi/GY9gPhaxcW/FQWe6Ik+/xGhay7Fr+S8FkWs3
         6knTBzrTVytJ1MIEDJ6jthMSgkN4pf5fFimJnQ637+GzgXgTiw5wxAaJO8r4CEujr7Fh
         sW6YdaB10hAuQOxw8NvWFmj98ADgUn7WiQr/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290481; x=1755895281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mj6TEvAdxVzR/7U8GT5TshFxyIHuvBrftHDmoFGVHrQ=;
        b=lRvyLTVsN2AYHCdQNQAJ5WhjU36ASzXzpKP7dRcuHpYq/GqW7CA4GuOljNl8zqP+LM
         WzNgLoU0Eft5IlI2utTxGXK5y/JLIOk02henkh1plM7sAKeVoJQ8+qsT0QJQnK4C5qI5
         fqzltTRnIeYSy1Ibv1VCpwNILdBg6lgIcjhNVclzjCPOeY1CrRh7fSVFyDC2Bvx3jW/w
         goRrHjfg3se6vp1Wo0xjwrJTWTYmxFwJbZJ1IDDXcUnNwVjiD8TJBEHnAmEVmu8d4mal
         qtuBlAISIhwpj6uio0Ml7TQIzfi8r5hjeequ868PNx4lT9ZQSOP5rsPJqnk/FDpmAsJ9
         LARQ==
X-Gm-Message-State: AOJu0YzQAxnUzbfyjxSv296AIvAhiPnLBKgEWpRyutN8bCuDqXvm7j3K
	qagV/UsVjQ/YXS8Yse8DR+dXqF9ZRUqyeq6OIH6Gwc0i+K60HZQrA89qveFE5/J/+BuwsPGEzfr
	BX/gg
X-Gm-Gg: ASbGncungSZqbBGyhcKKTro6LpmKe7M4/ol4dIgwooQwWa0aZSYRj7M0qLN06YVR9ez
	tzf8uu4RUsvBYWFg4PzEoNJpICordteSuYwGxBBOd6zvGRp21aLHtZ2/YdOjmac6C44qR2GWHjC
	a3KUhpMHOH2NsRbBs0UfZovFb38onMfjcuron5CMa5dc9abdYzu4A8kqGvH9SL5AHD6aGOd+7QB
	nJGR3nW0ZFM2Lv3+w73gVWGlZiUA3GNURSoTEWZrbOrfPqoWpK+dKF0cHvQacvaRZgFDED7wcdh
	pAQcVEeHQI4pA2J0ON3tUhO59OM7A7AVS7dxhHC0hPUg1US8AWQD4TAuIqs8R+/Etc4mAt4x9Up
	sIvM0dshB+ANAso+We4ZYXBuO1ACwXd4eXviwGbVE9wC9ZbMWNprxxWbccOQfey6Ws51FBRrUZg
	mh
X-Google-Smtp-Source: AGHT+IGWRY+BlPaw6b1OLFiLe1oOrOesRfoJZceGFBwdQDl4sSHD4EVGyhAOnHX1aSuriWfCSLy/GQ==
X-Received: by 2002:a05:600c:8707:b0:453:5c30:a1fd with SMTP id 5b1f17b1804b1-45a25283959mr11356635e9.8.1755290481074;
        Fri, 15 Aug 2025 13:41:21 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 01/16] x86/msr: Implement rdmsr_safe() in C
Date: Fri, 15 Aug 2025 21:41:02 +0100
Message-Id: <20250815204117.3312742-2-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

... in preparation to be able to use asm goto.

Notably this mean that the value parameter must be taken by pointer rather
than by value.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/acpi/cpufreq/hwp.c       | 14 +++++------
 xen/arch/x86/apic.c                   |  2 +-
 xen/arch/x86/cpu/amd.c                | 25 +++++++++----------
 xen/arch/x86/cpu/common.c             |  6 ++---
 xen/arch/x86/cpu/intel.c              |  8 +++---
 xen/arch/x86/cpu/mcheck/mce_amd.c     |  2 +-
 xen/arch/x86/cpu/mcheck/mce_intel.c   |  6 ++---
 xen/arch/x86/hvm/ioreq.c              |  2 +-
 xen/arch/x86/hvm/svm/svm.c            | 16 ++++++------
 xen/arch/x86/hvm/vmx/vmx.c            |  4 +--
 xen/arch/x86/include/asm/msr.h        | 35 ++++++++++++++++-----------
 xen/arch/x86/msr.c                    |  8 +++---
 xen/arch/x86/platform_hypercall.c     |  2 +-
 xen/arch/x86/pv/emul-priv-op.c        | 18 +++++++-------
 xen/arch/x86/spec_ctrl.c              |  2 +-
 xen/arch/x86/x86_64/mmconfig-shared.c |  2 +-
 xen/drivers/passthrough/vtd/iommu.c   |  2 +-
 17 files changed, 80 insertions(+), 74 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index f22b4674dfe9..26dce9aaf89a 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -245,7 +245,7 @@ static void cf_check hwp_write_request(void *info)
     {
         hwp_verbose("CPU%u: error wrmsr_safe(MSR_HWP_REQUEST, %lx)\n",
                     policy->cpu, hwp_req.raw);
-        rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw);
+        rdmsr_safe(MSR_HWP_REQUEST, &data->curr_req.raw);
         data->ret = -EINVAL;
     }
 }
@@ -281,7 +281,7 @@ static bool hdc_set_pkg_hdc_ctl(unsigned int cpu, bool val)
 {
     uint64_t msr;
 
-    if ( rdmsr_safe(MSR_PKG_HDC_CTL, msr) )
+    if ( rdmsr_safe(MSR_PKG_HDC_CTL, &msr) )
     {
         hwp_err(cpu, "rdmsr_safe(MSR_PKG_HDC_CTL)\n");
         return false;
@@ -305,7 +305,7 @@ static bool hdc_set_pm_ctl1(unsigned int cpu, bool val)
 {
     uint64_t msr;
 
-    if ( rdmsr_safe(MSR_PM_CTL1, msr) )
+    if ( rdmsr_safe(MSR_PM_CTL1, &msr) )
     {
         hwp_err(cpu, "rdmsr_safe(MSR_PM_CTL1)\n");
         return false;
@@ -353,7 +353,7 @@ static void cf_check hwp_init_msrs(void *info)
      * Package level MSR, but we don't have a good idea of packages here, so
      * just do it everytime.
      */
-    if ( rdmsr_safe(MSR_PM_ENABLE, val) )
+    if ( rdmsr_safe(MSR_PM_ENABLE, &val) )
     {
         hwp_err(policy->cpu, "rdmsr_safe(MSR_PM_ENABLE)\n");
         data->curr_req.raw = -1;
@@ -375,13 +375,13 @@ static void cf_check hwp_init_msrs(void *info)
         }
     }
 
-    if ( rdmsr_safe(MSR_HWP_CAPABILITIES, data->hwp_caps) )
+    if ( rdmsr_safe(MSR_HWP_CAPABILITIES, &data->hwp_caps) )
     {
         hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_CAPABILITIES)\n");
         goto error;
     }
 
-    if ( rdmsr_safe(MSR_HWP_REQUEST, data->curr_req.raw) )
+    if ( rdmsr_safe(MSR_HWP_REQUEST, &data->curr_req.raw) )
     {
         hwp_err(policy->cpu, "rdmsr_safe(MSR_HWP_REQUEST)\n");
         goto error;
@@ -481,7 +481,7 @@ static void cf_check hwp_set_misc_turbo(void *info)
 
     data->ret = 0;
 
-    if ( rdmsr_safe(MSR_IA32_MISC_ENABLE, msr) )
+    if ( rdmsr_safe(MSR_IA32_MISC_ENABLE, &msr) )
     {
         hwp_verbose("CPU%u: error rdmsr_safe(MSR_IA32_MISC_ENABLE)\n",
                     policy->cpu);
diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 0fd8bdba7067..cac5ba39e615 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -764,7 +764,7 @@ static int __init detect_init_APIC (void)
     if (enable_local_apic < 0)
         return -1;
 
-    if ( rdmsr_safe(MSR_APIC_BASE, msr_content) )
+    if ( rdmsr_safe(MSR_APIC_BASE, &msr_content) )
     {
         printk("No local APIC present\n");
         return -1;
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index eb428f284ecb..567b992a9fe2 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -496,7 +496,7 @@ static void cf_check disable_c1e(void *unused)
 	 * The MSR does not exist in all FamilyF CPUs (only Rev F and above),
 	 * but we safely catch the #GP in that case.
 	 */
-	if ((rdmsr_safe(MSR_K8_ENABLE_C1E, msr_content) == 0) &&
+	if ((rdmsr_safe(MSR_K8_ENABLE_C1E, &msr_content) == 0) &&
 	    (msr_content & (3ULL << 27)) &&
 	    (wrmsr_safe(MSR_K8_ENABLE_C1E, msr_content & ~(3ULL << 27)) != 0))
 		printk(KERN_ERR "Failed to disable C1E on CPU#%u (%16"PRIx64")\n",
@@ -695,21 +695,21 @@ static void amd_process_freq(const struct cpuinfo_x86 *c,
 
 	lo = 0; /* gcc may not recognize the loop having at least 5 iterations */
 	for (h = c->x86 == 0x10 ? 5 : 8; h--; )
-		if (!rdmsr_safe(0xC0010064 + h, lo) && (lo >> 63))
+		if (!rdmsr_safe(0xC0010064 + h, &lo) && (lo >> 63))
 			break;
 	if (!(lo >> 63))
 		return;
 
 	if (idx && idx < h &&
-	    !rdmsr_safe(0xC0010064 + idx, val) && (val >> 63) &&
-	    !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
+	    !rdmsr_safe(0xC0010064 + idx, &val) && (val >> 63) &&
+	    !rdmsr_safe(0xC0010064, &hi) && (hi >> 63)) {
 		if (nom_mhz)
 			*nom_mhz = amd_parse_freq(c->x86, val);
 		if (low_mhz)
 			*low_mhz = amd_parse_freq(c->x86, lo);
 		if (hi_mhz)
 			*hi_mhz = amd_parse_freq(c->x86, hi);
-	} else if (h && !rdmsr_safe(0xC0010064, hi) && (hi >> 63)) {
+	} else if (h && !rdmsr_safe(0xC0010064, &hi) && (hi >> 63)) {
 		if (low_mhz)
 			*low_mhz = amd_parse_freq(c->x86, lo);
 		if (hi_mhz)
@@ -765,7 +765,7 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
 	 * rather than per-thread, so do a full safe read/write/readback cycle
 	 * in the worst case.
 	 */
-	if (rdmsr_safe(MSR_AMD64_DE_CFG, value))
+	if (rdmsr_safe(MSR_AMD64_DE_CFG, &value))
 		/* Unable to read.  Assume the safer default. */
 		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
 			    c->x86_capability);
@@ -775,7 +775,7 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
 			  c->x86_capability);
 	else if (wrmsr_safe(MSR_AMD64_DE_CFG,
 			    value | AMD64_DE_CFG_LFENCE_SERIALISE) ||
-		 rdmsr_safe(MSR_AMD64_DE_CFG, value) ||
+		 rdmsr_safe(MSR_AMD64_DE_CFG, &value) ||
 		 !(value & AMD64_DE_CFG_LFENCE_SERIALISE))
 		/* Attempt to set failed.  Assume the safer default. */
 		__clear_bit(X86_FEATURE_LFENCE_DISPATCH,
@@ -804,7 +804,7 @@ static bool set_legacy_ssbd(const struct cpuinfo_x86 *c, bool enable)
 	if (bit >= 0) {
 		uint64_t val, mask = 1ull << bit;
 
-		if (rdmsr_safe(MSR_AMD64_LS_CFG, val) ||
+		if (rdmsr_safe(MSR_AMD64_LS_CFG, &val) ||
 		    ({
 			    val &= ~mask;
 			    if (enable)
@@ -962,7 +962,7 @@ void amd_init_spectral_chicken(void)
 	if (cpu_has_hypervisor || !is_zen2_uarch())
 		return;
 
-	if (rdmsr_safe(MSR_AMD64_DE_CFG2, val) == 0 && !(val & chickenbit))
+	if (rdmsr_safe(MSR_AMD64_DE_CFG2, &val) == 0 && !(val & chickenbit))
 		wrmsr_safe(MSR_AMD64_DE_CFG2, val | chickenbit);
 }
 
@@ -1116,8 +1116,7 @@ static void amd_check_bp_cfg(void)
 static void cf_check init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
-
-	unsigned long long value;
+	uint64_t value;
 
 	/* Disable TLB flush filter by setting HWCR.FFDIS on K8
 	 * bit 6 of msr C001_0015
@@ -1251,7 +1250,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	if ((c->x86 == 0x15) &&
 	    (c->x86_model >= 0x10) && (c->x86_model <= 0x1f) &&
 	    !cpu_has(c, X86_FEATURE_TOPOEXT) &&
-	    !rdmsr_safe(MSR_K8_EXT_FEATURE_MASK, value)) {
+	    !rdmsr_safe(MSR_K8_EXT_FEATURE_MASK, &value)) {
 		value |= 1ULL << 54;
 		wrmsr_safe(MSR_K8_EXT_FEATURE_MASK, value);
 		rdmsrl(MSR_K8_EXT_FEATURE_MASK, value);
@@ -1267,7 +1266,7 @@ static void cf_check init_amd(struct cpuinfo_x86 *c)
 	 * Disable it on the affected CPUs.
 	 */
 	if (c->x86 == 0x15 && c->x86_model >= 0x02 && c->x86_model < 0x20 &&
-	    !rdmsr_safe(MSR_AMD64_IC_CFG, value) && (value & 0x1e) != 0x1e)
+	    !rdmsr_safe(MSR_AMD64_IC_CFG, &value) && (value & 0x1e) != 0x1e)
 		wrmsr_safe(MSR_AMD64_IC_CFG, value | 0x1e);
 
         amd_get_topology(c);
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index da05015578aa..60f3c9a29e67 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -130,14 +130,14 @@ bool __init probe_cpuid_faulting(void)
 	uint64_t val;
 	int rc;
 
-	if ((rc = rdmsr_safe(MSR_INTEL_PLATFORM_INFO, val)) == 0)
+	if ((rc = rdmsr_safe(MSR_INTEL_PLATFORM_INFO, &val)) == 0)
 		raw_cpu_policy.platform_info.cpuid_faulting =
 			val & MSR_PLATFORM_INFO_CPUID_FAULTING;
 
 	if (rc ||
 	    !(val & MSR_PLATFORM_INFO_CPUID_FAULTING) ||
 	    rdmsr_safe(MSR_INTEL_MISC_FEATURES_ENABLES,
-		       this_cpu(msr_misc_features)))
+		       &this_cpu(msr_misc_features)))
 	{
 		setup_clear_cpu_cap(X86_FEATURE_CPUID_FAULTING);
 		return false;
@@ -851,7 +851,7 @@ static void skinit_enable_intr(void)
 	 * If the platform is performing a Secure Launch via SKINIT
 	 * INIT_REDIRECTION flag will be active.
 	 */
-	if ( !cpu_has_skinit || rdmsr_safe(MSR_K8_VM_CR, val) ||
+	if ( !cpu_has_skinit || rdmsr_safe(MSR_K8_VM_CR, &val) ||
 	     !(val & VM_CR_INIT_REDIRECTION) )
 		return;
 
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 29144ffe37a5..ecca11f04db8 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -115,7 +115,7 @@ static uint64_t __init _probe_mask_msr(unsigned int *msr, uint64_t caps)
 
 	expected_levelling_cap |= caps;
 
-	if (rdmsr_safe(*msr, val) || wrmsr_safe(*msr, val))
+	if (rdmsr_safe(*msr, &val) || wrmsr_safe(*msr, val))
 		*msr = 0;
 	else
 		levelling_caps |= caps;
@@ -546,7 +546,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
             { 26667, 13333, 20000, 16667, 33333, 10000, 40000 };
 
     case 6:
-        if ( rdmsr_safe(MSR_INTEL_PLATFORM_INFO, msrval) )
+        if ( rdmsr_safe(MSR_INTEL_PLATFORM_INFO, &msrval) )
             return;
         max_ratio = msrval >> 8;
         min_ratio = msrval >> 40;
@@ -566,7 +566,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
              */
             if ( min_ratio > max_ratio )
                 SWAP(min_ratio, max_ratio);
-            if ( rdmsr_safe(MSR_FSB_FREQ, msrval) ||
+            if ( rdmsr_safe(MSR_FSB_FREQ, &msrval) ||
                  (msrval &= 7) >= ARRAY_SIZE(core_factors) )
                 return;
             factor = core_factors[msrval];
@@ -584,7 +584,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
         break;
 
     case 0xf:
-        if ( rdmsr_safe(MSR_IA32_EBC_FREQUENCY_ID, msrval) )
+        if ( rdmsr_safe(MSR_IA32_EBC_FREQUENCY_ID, &msrval) )
             return;
         max_ratio = msrval >> 24;
         min_ratio = 0;
diff --git a/xen/arch/x86/cpu/mcheck/mce_amd.c b/xen/arch/x86/cpu/mcheck/mce_amd.c
index 4f06a3153b91..25c29eb3d255 100644
--- a/xen/arch/x86/cpu/mcheck/mce_amd.c
+++ b/xen/arch/x86/cpu/mcheck/mce_amd.c
@@ -195,7 +195,7 @@ static void mcequirk_amd_apply(enum mcequirk_amd_flags flags)
         break;
 
     case MCEQUIRK_F10_GART:
-        if ( rdmsr_safe(MSR_AMD64_MCx_MASK(4), val) == 0 )
+        if ( rdmsr_safe(MSR_AMD64_MCx_MASK(4), &val) == 0 )
             wrmsr_safe(MSR_AMD64_MCx_MASK(4), val | (1 << 10));
         break;
 
diff --git a/xen/arch/x86/cpu/mcheck/mce_intel.c b/xen/arch/x86/cpu/mcheck/mce_intel.c
index 1e52b1ac25a4..c4655de401c6 100644
--- a/xen/arch/x86/cpu/mcheck/mce_intel.c
+++ b/xen/arch/x86/cpu/mcheck/mce_intel.c
@@ -726,7 +726,7 @@ static bool intel_enable_lmce(void)
      * MSR_IA32_MCG_EXT_CTL.LMCE_EN.
      */
 
-    if ( rdmsr_safe(MSR_IA32_FEATURE_CONTROL, msr_content) )
+    if ( rdmsr_safe(MSR_IA32_FEATURE_CONTROL, &msr_content) )
         return false;
 
     if ( (msr_content & IA32_FEATURE_CONTROL_LOCK) &&
@@ -879,14 +879,14 @@ static void intel_init_ppin(const struct cpuinfo_x86 *c)
     case 0x8f: /* Sapphire Rapids X */
 
         if ( (c != &boot_cpu_data && !ppin_msr) ||
-             rdmsr_safe(MSR_PPIN_CTL, val) )
+             rdmsr_safe(MSR_PPIN_CTL, &val) )
             return;
 
         /* If PPIN is disabled, but not locked, try to enable. */
         if ( !(val & (PPIN_ENABLE | PPIN_LOCKOUT)) )
         {
             wrmsr_safe(MSR_PPIN_CTL, val | PPIN_ENABLE);
-            rdmsr_safe(MSR_PPIN_CTL, val);
+            rdmsr_safe(MSR_PPIN_CTL, &val);
         }
 
         if ( !(val & PPIN_ENABLE) )
diff --git a/xen/arch/x86/hvm/ioreq.c b/xen/arch/x86/hvm/ioreq.c
index ec709e5f4741..98b0dd7972c2 100644
--- a/xen/arch/x86/hvm/ioreq.c
+++ b/xen/arch/x86/hvm/ioreq.c
@@ -292,7 +292,7 @@ bool arch_ioreq_server_get_type_addr(const struct domain *d,
         {
             uint64_t msr_val;
 
-            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) &&
+            if ( !rdmsr_safe(MSR_AMD64_NB_CFG, &msr_val) &&
                  (msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
                 *addr |= CF8_ADDR_HI(cf8);
         }
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index fce750ca1f7a..57520ac3ec2d 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -1082,8 +1082,8 @@ static void svm_host_osvw_init(void)
     {
         uint64_t len, status;
 
-        if ( rdmsr_safe(MSR_AMD_OSVW_ID_LENGTH, len) ||
-             rdmsr_safe(MSR_AMD_OSVW_STATUS, status) )
+        if ( rdmsr_safe(MSR_AMD_OSVW_ID_LENGTH, &len) ||
+             rdmsr_safe(MSR_AMD_OSVW_STATUS, &status) )
             len = status = 0;
 
         if ( len < osvw_length )
@@ -1481,7 +1481,7 @@ static void svm_init_erratum_383(const struct cpuinfo_x86 *c)
         return;
 
     /* use safe methods to be compatible with nested virtualization */
-    if ( rdmsr_safe(MSR_AMD64_DC_CFG, msr_content) == 0 &&
+    if ( rdmsr_safe(MSR_AMD64_DC_CFG, &msr_content) == 0 &&
          wrmsr_safe(MSR_AMD64_DC_CFG, msr_content | (1ULL << 47)) == 0 )
         amd_erratum383_found = 1;
     else
@@ -1785,7 +1785,7 @@ static int cf_check svm_msr_read_intercept(
         break;
 
     case MSR_F10_BU_CFG:
-        if ( !rdmsr_safe(msr, *msr_content) )
+        if ( !rdmsr_safe(msr, msr_content) )
             break;
 
         if ( boot_cpu_data.x86 == 0xf )
@@ -1804,7 +1804,7 @@ static int cf_check svm_msr_read_intercept(
         goto gpf;
 
     case MSR_F10_BU_CFG2:
-        if ( rdmsr_safe(msr, *msr_content) )
+        if ( rdmsr_safe(msr, msr_content) )
             goto gpf;
         break;
 
@@ -1881,7 +1881,7 @@ static int cf_check svm_msr_read_intercept(
         break;
 
     default:
-        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
+        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, &tmp) )
         {
             *msr_content = 0;
             break;
@@ -2047,7 +2047,7 @@ static int cf_check svm_msr_write_intercept(
 
     case MSR_F10_BU_CFG:
     case MSR_F10_BU_CFG2:
-        if ( rdmsr_safe(msr, msr_content) )
+        if ( rdmsr_safe(msr, &msr_content) )
             goto gpf;
         break;
 
@@ -2068,7 +2068,7 @@ static int cf_check svm_msr_write_intercept(
         break;
 
     default:
-        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
+        if ( d->arch.msr_relaxed && !rdmsr_safe(msr, &msr_content) )
             break;
 
         gdprintk(XENLOG_WARNING,
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index cb82d52ef035..6341fa20457c 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -3499,7 +3499,7 @@ static int cf_check vmx_msr_read_intercept(
             break;
         }
 
-        if ( curr->domain->arch.msr_relaxed && !rdmsr_safe(msr, tmp) )
+        if ( curr->domain->arch.msr_relaxed && !rdmsr_safe(msr, &tmp) )
         {
             *msr_content = 0;
             break;
@@ -3809,7 +3809,7 @@ static int cf_check vmx_msr_write_intercept(
              is_last_branch_msr(msr) )
             break;
 
-        if ( v->domain->arch.msr_relaxed && !rdmsr_safe(msr, msr_content) )
+        if ( v->domain->arch.msr_relaxed && !rdmsr_safe(msr, &msr_content) )
             break;
 
         gdprintk(XENLOG_WARNING,
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index e185db096756..d2c86ddb09e9 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -53,20 +53,27 @@ static inline void wrmsrns(uint32_t msr, uint64_t val)
 }
 
 /* rdmsr with exception handling */
-#define rdmsr_safe(msr,val) ({\
-    int rc_; \
-    uint64_t lo_, hi_; \
-    __asm__ __volatile__( \
-        "1: rdmsr\n2:\n" \
-        ".section .fixup,\"ax\"\n" \
-        "3: xorl %k0,%k0\n; xorl %k1,%k1\n" \
-        "   movl %5,%2\n; jmp 2b\n" \
-        ".previous\n" \
-        _ASM_EXTABLE(1b, 3b) \
-        : "=a" (lo_), "=d" (hi_), "=&r" (rc_) \
-        : "c" (msr), "2" (0), "i" (-EFAULT)); \
-    val = lo_ | (hi_ << 32); \
-    rc_; })
+static inline int rdmsr_safe(unsigned int msr, uint64_t *val)
+{
+    int rc;
+    uint64_t lo, hi;
+
+    asm_inline volatile (
+        "1: rdmsr\n2:\n"
+        ".section .fixup,\"ax\"\n"
+        "3: xorl %k0,%k0\n\t"
+        "   xorl %k1,%k1\n\t"
+        "   movl %5,%2\n\t"
+        "   jmp 2b\n\t"
+        ".previous"
+        _ASM_EXTABLE(1b, 3b)
+        : "=a" (lo), "=d" (hi), "=&r" (rc)
+        : "c" (msr), "2" (0), "i" (-EFAULT) );
+
+    *val = lo | (hi << 32);
+
+    return rc;
+}
 
 /* wrmsr with exception handling */
 static inline int wrmsr_safe(unsigned int msr, uint64_t val)
diff --git a/xen/arch/x86/msr.c b/xen/arch/x86/msr.c
index 1bf117cbd80f..b301143ed2d4 100644
--- a/xen/arch/x86/msr.c
+++ b/xen/arch/x86/msr.c
@@ -191,7 +191,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
         if ( !(cp->x86_vendor & (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
              !(boot_cpu_data.x86_vendor &
                (X86_VENDOR_INTEL | X86_VENDOR_AMD)) ||
-             rdmsr_safe(MSR_AMD_PATCHLEVEL, *val) )
+             rdmsr_safe(MSR_AMD_PATCHLEVEL, val) )
             goto gp_fault;
         break;
 
@@ -239,7 +239,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
             goto gp_fault;
 
         *val = 0;
-        if ( likely(!is_cpufreq_controller(d)) || rdmsr_safe(msr, *val) == 0 )
+        if ( likely(!is_cpufreq_controller(d)) || rdmsr_safe(msr, val) == 0 )
             break;
         goto gp_fault;
 
@@ -305,7 +305,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
             goto gp_fault;
         if ( !is_hardware_domain(d) )
             return X86EMUL_UNHANDLEABLE;
-        if ( rdmsr_safe(msr, *val) )
+        if ( rdmsr_safe(msr, val) )
             goto gp_fault;
         if ( msr == MSR_K8_SYSCFG )
             *val &= (SYSCFG_TOM2_FORCE_WB | SYSCFG_MTRR_TOM2_EN |
@@ -321,7 +321,7 @@ int guest_rdmsr(struct vcpu *v, uint32_t msr, uint64_t *val)
     case MSR_FAM10H_MMIO_CONF_BASE:
         if ( !is_hardware_domain(d) ||
              !(cp->x86_vendor & (X86_VENDOR_AMD | X86_VENDOR_HYGON)) ||
-             rdmsr_safe(msr, *val) )
+             rdmsr_safe(msr, val) )
             goto gp_fault;
 
         break;
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 3eba791889bd..21f9f795c1c7 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -186,7 +186,7 @@ void cf_check resource_access(void *info)
                 if ( unlikely(read_tsc) )
                     local_irq_save(flags);
 
-                ret = rdmsr_safe(entry->idx, entry->val);
+                ret = rdmsr_safe(entry->idx, &entry->val);
 
                 if ( unlikely(read_tsc) )
                 {
diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
index f3f012f8fb55..4afbee59e53e 100644
--- a/xen/arch/x86/pv/emul-priv-op.c
+++ b/xen/arch/x86/pv/emul-priv-op.c
@@ -248,7 +248,7 @@ static bool pci_cfg_ok(struct domain *currd, unsigned int start,
     {
         uint64_t msr_val;
 
-        if ( rdmsr_safe(MSR_AMD64_NB_CFG, msr_val) )
+        if ( rdmsr_safe(MSR_AMD64_NB_CFG, &msr_val) )
             return false;
         if ( msr_val & (1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT) )
             start |= CF8_ADDR_HI(currd->arch.pci_cf8);
@@ -961,7 +961,7 @@ static int cf_check read_msr(
         return X86EMUL_OKAY;
 
     case MSR_IA32_MISC_ENABLE:
-        if ( rdmsr_safe(reg, *val) )
+        if ( rdmsr_safe(reg, val) )
             break;
         *val = guest_misc_enable(*val);
         return X86EMUL_OKAY;
@@ -991,7 +991,7 @@ static int cf_check read_msr(
         }
         /* fall through */
     default:
-        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, tmp) )
+        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, &tmp) )
         {
             *val = 0;
             return X86EMUL_OKAY;
@@ -1001,14 +1001,14 @@ static int cf_check read_msr(
         break;
 
     normal:
-        if ( rdmsr_safe(reg, *val) )
+        if ( rdmsr_safe(reg, val) )
             break;
         return X86EMUL_OKAY;
     }
 
  done:
     if ( ret != X86EMUL_OKAY && !curr->arch.pv.trap_ctxt[X86_EXC_GP].address &&
-         (reg >> 16) != 0x4000 && !rdmsr_safe(reg, tmp) )
+         (reg >> 16) != 0x4000 && !rdmsr_safe(reg, &tmp) )
     {
         gprintk(XENLOG_WARNING, "faking RDMSR 0x%08x\n", reg);
         *val = 0;
@@ -1095,7 +1095,7 @@ static int cf_check write_msr(
     case MSR_AMD64_NB_CFG:
         if ( !is_hwdom_pinned_vcpu(curr) )
             return X86EMUL_OKAY;
-        if ( (rdmsr_safe(MSR_AMD64_NB_CFG, temp) != 0) ||
+        if ( (rdmsr_safe(MSR_AMD64_NB_CFG, &temp) != 0) ||
              ((val ^ temp) & ~(1ULL << AMD64_NB_CFG_CF8_EXT_ENABLE_BIT)) )
             goto invalid;
         if ( wrmsr_safe(MSR_AMD64_NB_CFG, val) == 0 )
@@ -1108,7 +1108,7 @@ static int cf_check write_msr(
             break;
         if ( !is_hwdom_pinned_vcpu(curr) )
             return X86EMUL_OKAY;
-        if ( rdmsr_safe(MSR_FAM10H_MMIO_CONF_BASE, temp) != 0 )
+        if ( rdmsr_safe(MSR_FAM10H_MMIO_CONF_BASE, &temp) != 0 )
             break;
         if ( (pci_probe & PCI_PROBE_MASK) == PCI_PROBE_MMCONF ?
              temp != val :
@@ -1124,7 +1124,7 @@ static int cf_check write_msr(
         break;
 
     case MSR_IA32_MISC_ENABLE:
-        if ( rdmsr_safe(reg, temp) )
+        if ( rdmsr_safe(reg, &temp) )
             break;
         if ( val != guest_misc_enable(temp) )
             goto invalid;
@@ -1171,7 +1171,7 @@ static int cf_check write_msr(
         }
         /* fall through */
     default:
-        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, val) )
+        if ( currd->arch.msr_relaxed && !rdmsr_safe(reg, &val) )
             return X86EMUL_OKAY;
 
         gdprintk(XENLOG_WARNING,
diff --git a/xen/arch/x86/spec_ctrl.c b/xen/arch/x86/spec_ctrl.c
index 1ff3d6835d9d..e71f62c60186 100644
--- a/xen/arch/x86/spec_ctrl.c
+++ b/xen/arch/x86/spec_ctrl.c
@@ -714,7 +714,7 @@ static bool __init check_smt_enabled(void)
      */
     if ( boot_cpu_data.vendor == X86_VENDOR_INTEL &&
          boot_cpu_data.family != 0xf && !cpu_has_hypervisor &&
-         !rdmsr_safe(MSR_INTEL_CORE_THREAD_COUNT, val) )
+         !rdmsr_safe(MSR_INTEL_CORE_THREAD_COUNT, &val) )
         return (MASK_EXTR(val, MSR_CTC_CORE_MASK) !=
                 MASK_EXTR(val, MSR_CTC_THREAD_MASK));
 
diff --git a/xen/arch/x86/x86_64/mmconfig-shared.c b/xen/arch/x86/x86_64/mmconfig-shared.c
index f1a3d42c5b21..d2364b32563f 100644
--- a/xen/arch/x86/x86_64/mmconfig-shared.c
+++ b/xen/arch/x86/x86_64/mmconfig-shared.c
@@ -149,7 +149,7 @@ static const char *__init cf_check pci_mmcfg_amd_fam10h(void)
         return NULL;
 
     address = MSR_FAM10H_MMIO_CONF_BASE;
-    if (rdmsr_safe(address, msr_content))
+    if ( rdmsr_safe(address, &msr_content) )
         return NULL;
 
     /* mmconfig is not enable */
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index c55f02c97e16..b4105163cc78 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -2286,7 +2286,7 @@ static bool __init vtd_ept_page_compatible(const struct vtd_iommu *iommu)
 
     /* EPT is not initialised yet, so we must check the capability in
      * the MSR explicitly rather than use cpu_has_vmx_ept_*() */
-    if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, ept_cap) != 0 ) 
+    if ( rdmsr_safe(MSR_IA32_VMX_EPT_VPID_CAP, &ept_cap) != 0 )
         return false;
 
     return (ept_has_2mb(ept_cap) && opt_hap_2mb) <=
-- 
2.39.5


