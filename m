Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81836401ADF
	for <lists+xen-devel@lfdr.de>; Mon,  6 Sep 2021 14:03:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.179711.326126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNDL7-0004LM-9G; Mon, 06 Sep 2021 12:03:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 179711.326126; Mon, 06 Sep 2021 12:03:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNDL7-0004JT-5t; Mon, 06 Sep 2021 12:03:05 +0000
Received: by outflank-mailman (input) for mailman id 179711;
 Mon, 06 Sep 2021 12:03:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PlzZ=N4=citrix.com=Jane.Malalane@srs-us1.protection.inumbo.net>)
 id 1mNDL5-0004Im-Qs
 for xen-devel@lists.xenproject.org; Mon, 06 Sep 2021 12:03:03 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 624bf758-0f0a-11ec-b0a0-12813bfff9fa;
 Mon, 06 Sep 2021 12:03:02 +0000 (UTC)
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
X-Inumbo-ID: 624bf758-0f0a-11ec-b0a0-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630929782;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/rO6h35/M0MTFcSt9DOaPPseqG4z+McXNWqLbx32HoQ=;
  b=J6nhEADilOC8KYSU8QnOO4JAM+JjbszA3b4z2OdKJXLYECgqpwMu36d+
   KEGg32OsacZXebRbbFzMpkkgLFjGIcmQfqK+wrVwQtUMXwXrSVI/gftLP
   IeyZ9lLRJaVpMLiz7Icu3klH9AmPnZEhej4iWjnshovLim/JhjmCSNMT6
   I=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 2yxqHK4UoAn9Tf3hwbH09y0L2oHBa7OhCWCfPCeDayrroAYgWSup1sXhjxISpYkXvgzfxWiQjd
 Ke24p72vg7DHS4UbxvqUFTVHPU7FGMcSa0xK7uG1Ix3k5T4xLLCTuQzH1oSIdiAC79+wmBHegC
 YZuYtF6U9NRE2T0Mev4Hc6yayUwOeXKwGfD34t73IptbcztfsESVz4eSO8ZT3gNhBTTX1MfXXI
 Toi6ePZYTZZvnRTf97k/0nT0RKQmXYMhmccNvmNoM+EHu22R7DNNFvmxTG2y1mlL3O7us3DEfb
 Al33XHISP2E3tmH7XBRq2XLM
X-SBRS: 5.1
X-MesageID: 51690456
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:RtKG1qyMl9JJEBXjb1RrKrPwFL1zdoMgy1knxilNoRw8SKKlfq
 eV7Y0mPH7P+VAssR4b+exoVJPtfZqYz+8R3WBzB8bEYOCFghrKEGgK1+KLqFeMJ8S9zJ846U
 4JSdkHNDSaNzlHZKjBjzVQa+xQouW6zA==
X-IronPort-AV: E=Sophos;i="5.85,272,1624334400"; 
   d="scan'208";a="51690456"
From: Jane Malalane <jane.malalane@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Jane Malalane <jane.malalane@citrix.com>, Wei Liu <wl@xen.org>, "Jan
 Beulich" <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Pu Wen
	<puwen@hygon.cn>, Andy Lutomirski <luto@kernel.org>
Subject: [PATCH v1 2/2] x86/cpuid: Detect null segment behaviour on Zen2 CPUs
Date: Mon, 6 Sep 2021 13:00:04 +0100
Message-ID: <c9c3228982cc81c79cab4ced983f80296107124a.1630929059.git.jane.malalane@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1630929059.git.jane.malalane@citrix.com>
References: <cover.1630929059.git.jane.malalane@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Zen2 CPUs actually have this behaviour, but the CPUID bit couldn't be
introduced into Zen2 due to a lack of leaves. So, it was added in a
new leaf in Zen3. Nonetheless, hypervisors can synthesize the CPUID
bit in software.

So, on Zen2 hardware, Xen probes for NSCB (NullSelectorClearsBit) and
synthesizes the bit.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Jane Malalane <jane.malalane@citrix.com>
---
CC: Wei Liu <wl@xen.org>
CC: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
CC: "Roger Pau Monné" <roger.pau@citrix.com>
CC: Pu Wen <puwen@hygon.cn>
CC: Andy Lutomirski <luto@kernel.org>
---
 xen/arch/x86/cpu/amd.c           | 18 ++++++++++++++++++
 xen/arch/x86/cpu/cpu.h           |  1 +
 xen/arch/x86/cpu/hygon.c         |  5 +++++
 xen/include/asm-x86/cpufeature.h |  1 +
 4 files changed, 25 insertions(+)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 2260eef3aa..654f82e2cb 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -681,6 +681,19 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
 			  c->x86_capability);
 }
 
+void detect_zen2_null_seg_behaviour(void)
+{
+	uint64_t base;
+
+	wrmsrl(MSR_FS_BASE, 1);
+	asm volatile ( "mov %0, %%fs" :: "rm" (0) );
+	rdmsrl(MSR_FS_BASE, base);
+
+	if (base == 0)
+		setup_force_cpu_cap(X86_FEATURE_NSCB);
+
+}
+
 static void init_amd(struct cpuinfo_x86 *c)
 {
 	u32 l, h;
@@ -731,6 +744,11 @@ static void init_amd(struct cpuinfo_x86 *c)
 	else /* Implicily "== 0x10 || >= 0x12" by being 64bit. */
 		amd_init_lfence(c);
 
+	/* Probe for NSCB on Zen2 CPUs when not virtualised */
+	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
+	    c->x86 == 0x17 && c->x86_model >= 30 && c->x86_model <= 0x5f)
+		detect_zen2_null_seg_behaviour();
+
 	/*
 	 * If the user has explicitly chosen to disable Memory Disambiguation
 	 * to mitigiate Speculative Store Bypass, poke the appropriate MSR.
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 1ac3b2867a..0dd1b762ff 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -21,3 +21,4 @@ extern bool detect_extended_topology(struct cpuinfo_x86 *c);
 void early_init_amd(struct cpuinfo_x86 *c);
 void amd_log_freq(const struct cpuinfo_x86 *c);
 void amd_init_lfence(struct cpuinfo_x86 *c);
+void detect_zen2_null_seg_behaviour(void);
diff --git a/xen/arch/x86/cpu/hygon.c b/xen/arch/x86/cpu/hygon.c
index 67e23c5df9..232edb0c4d 100644
--- a/xen/arch/x86/cpu/hygon.c
+++ b/xen/arch/x86/cpu/hygon.c
@@ -34,6 +34,11 @@ static void init_hygon(struct cpuinfo_x86 *c)
 
 	amd_init_lfence(c);
 
+	/* Probe for NSCB on Zen2 CPUs when not virtualised */
+	if (!cpu_has_hypervisor && !cpu_has_nscb && c == &boot_cpu_data &&
+	    c->x86 == 0x18 && c->x86_model >= 4)
+		detect_zen2_null_seg_behaviour();
+
 	/*
 	 * If the user has explicitly chosen to disable Memory Disambiguation
 	 * to mitigiate Speculative Store Bypass, poke the appropriate MSR.
diff --git a/xen/include/asm-x86/cpufeature.h b/xen/include/asm-x86/cpufeature.h
index 5f6b83f71c..4faf9bff29 100644
--- a/xen/include/asm-x86/cpufeature.h
+++ b/xen/include/asm-x86/cpufeature.h
@@ -146,6 +146,7 @@
 #define cpu_has_cpuid_faulting  boot_cpu_has(X86_FEATURE_CPUID_FAULTING)
 #define cpu_has_aperfmperf      boot_cpu_has(X86_FEATURE_APERFMPERF)
 #define cpu_has_lfence_dispatch boot_cpu_has(X86_FEATURE_LFENCE_DISPATCH)
+#define cpu_has_nscb            boot_cpu_has(X86_FEATURE_NSCB)
 #define cpu_has_xen_lbr         boot_cpu_has(X86_FEATURE_XEN_LBR)
 #define cpu_has_xen_shstk       boot_cpu_has(X86_FEATURE_XEN_SHSTK)
 
-- 
2.11.0


