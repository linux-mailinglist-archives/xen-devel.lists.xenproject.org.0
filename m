Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 443BAAB9A31
	for <lists+xen-devel@lfdr.de>; Fri, 16 May 2025 12:31:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.986855.1372382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLm-0004gI-0K; Fri, 16 May 2025 10:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 986855.1372382; Fri, 16 May 2025 10:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uFsLl-0004dl-Sm; Fri, 16 May 2025 10:31:33 +0000
Received: by outflank-mailman (input) for mailman id 986855;
 Fri, 16 May 2025 10:31:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bXh3=YA=bounce.vates.tech=bounce-md_30504962.68271253.v1-ceb244a8b2c1464eb7eaedbb43d943a4@srs-se1.protection.inumbo.net>)
 id 1uFsEn-0000kS-Km
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 10:24:21 +0000
Received: from mail187-4.suw11.mandrillapp.com
 (mail187-4.suw11.mandrillapp.com [198.2.187.4])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ed3994a5-323f-11f0-9ffb-bf95429c2676;
 Fri, 16 May 2025 12:24:20 +0200 (CEST)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-4.suw11.mandrillapp.com (Mailchimp) with ESMTP id 4ZzNVC0TpJzlfknC
 for <xen-devel@lists.xenproject.org>; Fri, 16 May 2025 10:24:19 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ceb244a8b2c1464eb7eaedbb43d943a4; Fri, 16 May 2025 10:24:19 +0000
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
X-Inumbo-ID: ed3994a5-323f-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1747391059; x=1747661059;
	bh=Jt1BJnr3uTOtuUOvC1fwjWoIL41pGCxe5NFXv3n0GUU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=1+HQ7axaBIXi8erEPvRPonY+S8ynrwwzD5Pe3cP5DwDNcSh3FDRhdBBPwfR435tRA
	 /KH4MG+7U3yJSSvScdIdSW6e134ZHWfcdZwj0oRtO88++yyxT/H7EjFBqF5QYE8iOx
	 pFlHCxt1t9EsVqgOd94RPGm5f7h5pNbuvPqWBIdpzazeqXmzcvbdoUXty4+Zh8oq2A
	 4tWfCFWC8EegM5J4D0JoSIi/UzOR49Y3K7wrdme28nOZIXIhq+Vc29gLPW+8FkqQVL
	 VzS2C2g8ltQmI8+PeivBtsTeb0CA/DUoU2acL4rReL8B5LPhGM6qclvhjCje8F9ja/
	 IRqzc/CMtWyaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1747391059; x=1747651559; i=teddy.astie@vates.tech;
	bh=Jt1BJnr3uTOtuUOvC1fwjWoIL41pGCxe5NFXv3n0GUU=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=N3IGwhZSwgPVxnNZgSUgdDkm9UccNoYIDxv7PhP7FNpIqtHRPEWlVp7rN0MMZp+zv
	 ze7Vo9RY1Im7PELfLIrrYxG6Q+QXB23G83AO3nAk7rb2zk7zqBsDSP0Cf0jfAXMlYj
	 nW7bEwzE1fzFrqxtuOGpCSNuNHWlBJaQZjZbVxNTMOuLtHKPUI4OMlVB+cRsOhaszr
	 LLeQiT22CgaZRm7auXU/zU1/EoW0fgyB8m6wx4BvJNY8WkrV2NFreZJZV4WGMRERXQ
	 pHSzEucj0b5J9zO/gXC9LfK8fFt3S6PPFLN+R46L9J1/BdN6Ah+tO2TvhUUadY11cy
	 I73u6PFAk4LQA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=2012/16]=20x86/cpufeature:=20Introduce=20SME=20and=20SEV-related=20CPU=20features?=
X-Mailer: git-send-email 2.49.0
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1747391057994
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <e9dca2b2675cd4a0bcd01ba7cf64f40bc6e442e1.1747312394.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1747312394.git.teddy.astie@vates.tech>
References: <cover.1747312394.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ceb244a8b2c1464eb7eaedbb43d943a4?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250516:md
Date: Fri, 16 May 2025 10:24:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/cpu/common.c                   | 2 ++
 xen/arch/x86/include/asm/cpufeature.h       | 4 ++++
 xen/include/public/arch-x86/cpufeatureset.h | 5 +++++
 xen/include/xen/lib/x86/cpu-policy.h        | 9 ++++++++-
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e8d4ca3203..a610b0f513 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -481,6 +481,8 @@ static void generic_identify(struct cpuinfo_x86 *c)
 		c->x86_capability[FEATURESET_e8b] = cpuid_ebx(0x80000008);
 	if (c->extended_cpuid_level >= 0x80000021)
 		c->x86_capability[FEATURESET_e21a] = cpuid_eax(0x80000021);
+	if (c->extended_cpuid_level >= 0x8000001f)
+		c->x86_capability[FEATURESET_e1fa] = cpuid_eax(0x8000001f);
 
 	/* Intel-defined flags: level 0x00000007 */
 	if (c->cpuid_level >= 7) {
diff --git a/xen/arch/x86/include/asm/cpufeature.h b/xen/arch/x86/include/asm/cpufeature.h
index 397a04af41..bded70231c 100644
--- a/xen/arch/x86/include/asm/cpufeature.h
+++ b/xen/arch/x86/include/asm/cpufeature.h
@@ -233,6 +233,10 @@ static inline bool boot_cpu_has(unsigned int feat)
 
 #define cpu_has_msr_tsc_aux     (cpu_has_rdtscp || cpu_has_rdpid)
 
+#define cpu_has_sme             boot_cpu_has(X86_FEATURE_SME)
+#define cpu_has_sev             boot_cpu_has(X86_FEATURE_SEV)
+#define cpu_has_sev_es          boot_cpu_has(X86_FEATURE_SEV_ES)
+
 /* Bugs. */
 #define cpu_bug_fpu_ptrs        boot_cpu_has(X86_BUG_FPU_PTRS)
 #define cpu_bug_null_seg        boot_cpu_has(X86_BUG_NULL_SEG)
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index a6d4a0cba7..2a67bcc6a4 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -394,6 +394,11 @@ XEN_CPUFEATURE(MON_UMON_MITG,      16*32+30) /*   MCU_OPT_CTRL.MON_UMON_MITG */
 /* Intel-defined CPU features, MSR_ARCH_CAPS 0x10a.edx, word 17 (express in terms of word 16) */
 XEN_CPUFEATURE(ITS_NO,             16*32+62) /*!A No Indirect Target Selection */
 
+/* AMD-defined CPU features, CPUID level 0x8000001f.eax, word 18 */
+XEN_CPUFEATURE(SME,                18*32+ 0) /*   Secure Memory Encryption */
+XEN_CPUFEATURE(SEV,                18*32+ 1) /*   Secure Encrypted Virtualization */
+XEN_CPUFEATURE(SEV_ES,             18*32+ 3) /*   SEV Encrypted State */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpu-policy.h b/xen/include/xen/lib/x86/cpu-policy.h
index f43e1a3b21..a5b22b34d8 100644
--- a/xen/include/xen/lib/x86/cpu-policy.h
+++ b/xen/include/xen/lib/x86/cpu-policy.h
@@ -22,6 +22,7 @@
 #define FEATURESET_7d1       15 /* 0x00000007:1.edx    */
 #define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
 #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
+#define FEATURESET_e1fa      18 /* 0x8000001f.eax      */
 
 struct cpuid_leaf
 {
@@ -317,7 +318,13 @@ struct cpu_policy
             uint64_t :64, :64; /* Leaf 0x8000001c. */
             uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
             uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
-            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
+            /* Leaf 0x8000001f - AMD Secure Memory Encryption. */
+            union {
+                uint32_t e1fa;
+                struct { DECL_BITFIELD(e1fa); };
+            };
+            uint32_t c_bit_pos:6, physaddr_red:6, num_vmpl:4, :16;
+            uint32_t max_sev_guests:32, min_no_es_asid;
             uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
 
             /* Leaf 0x80000021 - Extended Feature 2 */
-- 
2.49.0



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


