Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEhvLlKqd2lAkAEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 704948BC8D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 18:54:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1213837.1524351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmm-00069D-GM; Mon, 26 Jan 2026 17:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1213837.1524351; Mon, 26 Jan 2026 17:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkQmm-00060p-8e; Mon, 26 Jan 2026 17:54:00 +0000
Received: by outflank-mailman (input) for mailman id 1213837;
 Mon, 26 Jan 2026 17:53:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0tkY=77=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vkQmk-0004HW-JI
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 17:53:58 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fca4bec7-fadf-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 18:53:57 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so38026495e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 26 Jan 2026 09:53:57 -0800 (PST)
Received: from localhost.localdomain (host-92-26-102-188.as13285.net.
 [92.26.102.188]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48066c10dbasm3896455e9.15.2026.01.26.09.53.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 09:53:55 -0800 (PST)
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
X-Inumbo-ID: fca4bec7-fadf-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1769450036; x=1770054836; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RD+FwnuL4ppUz8uo27Is5O2Ip6Cil9yXt9VnPw3KiRc=;
        b=h7SiuRzmtZ9Vs7j62Bb6eY7ASK6ZT4/X1HAL7DNQrjbf7hWfeGATHcNHfIrVNUXzjr
         pysAKjj+SuyQu6K6sMM3/Ec3ZCTEgjeouWMa8uslrFS2KeCLxNfPx8vDZdU86MUp0OBH
         wQ8XuW0wbk7t0eLf/riqTHzZ/PB7Vb7wcWXMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769450036; x=1770054836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RD+FwnuL4ppUz8uo27Is5O2Ip6Cil9yXt9VnPw3KiRc=;
        b=CwJZ1UQ+IOdC7/8eA1I/vjMLwY2PactN9dQgbbcnbiYU2ytzXp50NUh/gBmEjqTfna
         0enRpuqLBKLu9+VtHzYQgCZvagqdEOuR2ztAe9nVEY0BCBqWCVGtuYHvxMpbI8icLdgW
         PXy9MguL7Jlzyg8Gjn+7a9d2vKSeh+R6rZ23Fqk1hX246go/71r6WY6XsPJdqStDG6NC
         y9dXIdLbLo9VJxEQ6OozUyAHK4KG8nFS8zRFQchcVBKgE+D908MiwlYrMaf2jAYeZPii
         NP811SS2Q6WeI8CeSyGtvSj4Ye/0658D8o7c/lNVfhzasoT8JGKbFQp/RSjgEnvdYLov
         +7bg==
X-Gm-Message-State: AOJu0YzkiWi2q7X7Ng9kjeRW9BVnEcwpQBbm6vdUi3uJ3SHsZSeA+tYW
	VV8yKvTe5mSU61kqVVQG2YaZ9N39xhTirHIovqC/Swk5qeXZmC5oGTlZCLe53+ZaQmABbmxcFzL
	bI8A0
X-Gm-Gg: AZuq6aLzFdCcbAP85XxgZfBZMZhHuGOuj7/4k/EqxljhiTutOHBmobJMsl2o7VzTSwm
	sNaSwQuPf+dbnwYwAEV7BONXQFbk/GSPmmbLjArfEXWwe6j3MPQNjDACzIc8GMudN+//Y4+xSvX
	XdrmfMyUFYT6HCEqT7zr6MRZ0olwT2x/4VWxcz8kjaDvW/kkbOn2OQpJQkLLLi8WXHsaH5bWwt2
	tAV3Wckv8HDvPZIq3CJLQWMVN8t+nrKTteHfgYjaC5TBvm8SdkCGardPc+Mr6m4V45wWNUL3GtS
	GGBm8YdS3Gx00sylXh7tYBg67Ul7+jVlo5MSEQb1DD1jn31EYVuwz8EfGH2ZpZD8Mh1GwkvmB2b
	YyfKUybEd0gslR0XIlVYfhGG75KoPR/lscCASQeCcy5i7XIPlsyx57N7gflQ3GFmflK33FwDEjs
	+KbARgCdrtP5EzmWuzm/whzSrrGF4FzM+yh9TK7mo5H7BWNXUZcpDg0vGKv9frDw==
X-Received: by 2002:a05:600c:4fd6:b0:480:1d0b:2d15 with SMTP id 5b1f17b1804b1-4805cf63e02mr86010055e9.27.1769450035873;
        Mon, 26 Jan 2026 09:53:55 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Julian Vetter <julian.vetter@vates.tech>,
	Teddy Astie <teddy.astie@vates.tech>
Subject: [PATCH 09/16] x86/intel: Always check MSR_MISC_ENABLE on all CPUs
Date: Mon, 26 Jan 2026 17:53:38 +0000
Message-Id: <20260126175345.2078371-10-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
References: <20260126175345.2078371-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[citrix.com,reject];
	R_DKIM_ALLOW(-0.20)[citrix.com:s=google];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:JBeulich@suse.com,m:roger.pau@citrix.com,m:julian.vetter@vates.tech,m:teddy.astie@vates.tech,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[citrix.com:email,citrix.com:dkim,citrix.com:mid,lists.xenproject.org:helo,lists.xenproject.org:rdns,suse.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[andrew.cooper3@citrix.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[citrix.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 704948BC8D
X-Rspamd-Action: no action

Currently, the BSP only leaves instructions for the APs to adjust
MSR_MISC_ENABLE if the BSP is found to need adjustments.  Particularly if
XD_DISABLE is needed on an AP but not the BSP, the system will triple fault
with no information provided to the user.

Rework the BSP and trampoline logic to always read MISC_ENABLE, and clear
CPUID_LIMIT and XD_DISABLE if either are set.

Repurpose intel_unlock_cpuid_leaves() to be intel_check_misc_enable() and make
it static in common.c.  Replace trampoline_misc_enable_off with the smaller
trampoline_check_misc_enable.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Julian Vetter <julian.vetter@vates.tech>
CC: Teddy Astie <teddy.astie@vates.tech>

This temporarily removes the printk() noting the reactivation of XD because
the earlier BSP code has already done it, but that logic is about to be
removed.
---
 xen/arch/x86/boot/head.S              |  1 -
 xen/arch/x86/boot/trampoline.S        | 29 ++++++++++--------
 xen/arch/x86/boot/wakeup.S            | 27 ++++++++++-------
 xen/arch/x86/cpu/common.c             | 43 ++++++++++++++++++++++++++-
 xen/arch/x86/cpu/cpu.h                |  2 --
 xen/arch/x86/cpu/intel.c              | 19 ------------
 xen/arch/x86/include/asm/trampoline.h |  7 +++--
 7 files changed, 79 insertions(+), 49 deletions(-)

diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
index 77bb7a9e2191..4022f8639478 100644
--- a/xen/arch/x86/boot/head.S
+++ b/xen/arch/x86/boot/head.S
@@ -582,7 +582,6 @@ trampoline_setup:
         btr     $2, %edx
         jnc     .Lno_nx
         wrmsr
-        orb     $MSR_IA32_MISC_ENABLE_XD_DISABLE >> 32, 4 + sym_esi(trampoline_misc_enable_off)
 
         /* Check again for NX */
         mov     $0x80000001, %eax
diff --git a/xen/arch/x86/boot/trampoline.S b/xen/arch/x86/boot/trampoline.S
index a92e399fbe0e..2b4552096fd7 100644
--- a/xen/arch/x86/boot/trampoline.S
+++ b/xen/arch/x86/boot/trampoline.S
@@ -77,17 +77,22 @@ trampoline_protmode_entry:
         mov     %eax,%cr3
 
         /* Adjust IA32_MISC_ENABLE if needed (for NX enabling below). */
-        mov     bootsym_rel(trampoline_misc_enable_off,4,%esi)
-        mov     bootsym_rel(trampoline_misc_enable_off+4,4,%edi)
-        mov     %esi,%eax
-        or      %edi,%eax
-        jz      1f
+        cmpb    $1, bootsym_rel(trampoline_check_misc_enable, 5)
+        jne     1f
+
         mov     $MSR_IA32_MISC_ENABLE,%ecx
         rdmsr
-        not     %esi
-        not     %edi
-        and     %esi,%eax
-        and     %edi,%edx
+
+        xor     %edi, %edi
+        btr     $22 /* ilog2(MSR_IA32_MISC_ENABLE_LIMIT_CPUID) */, %eax
+        adc     %edi, %edi
+
+        btr     $34 /* ilog2(MSR_IA32_MISC_ENABLE_XD_DISABLE) */ - 32, %edx
+        adc     %edi, %edi
+
+        /* No bits need clearing?  Nothing to do */
+        jz      1f
+
         wrmsr
 1:
         /* Set up PAT before enabling paging. */
@@ -141,9 +146,6 @@ gdt_48:
         .long   trampoline_gdt + BOOT_PSEUDORM_DS + 2 - .
         .popsection
 
-GLOBAL(trampoline_misc_enable_off)
-        .quad   0
-
 /* EFER OR-mask for boot paths.  SCE conditional on PV support, NX added when available. */
 GLOBAL(trampoline_efer)
         .long   EFER_LME | (EFER_SCE * IS_ENABLED(CONFIG_PV)) | \
@@ -155,6 +157,9 @@ GLOBAL(trampoline_xen_phys_start)
 GLOBAL(trampoline_cpu_started)
         .byte   0
 
+GLOBAL(trampoline_check_misc_enable)
+        .byte   0
+
 LABEL(trampoline_perm_end, 0)
 
 /* From here on early boot only. */
diff --git a/xen/arch/x86/boot/wakeup.S b/xen/arch/x86/boot/wakeup.S
index 654e97005ff4..aced8153bafa 100644
--- a/xen/arch/x86/boot/wakeup.S
+++ b/xen/arch/x86/boot/wakeup.S
@@ -126,18 +126,23 @@ wakeup_32:
         add     bootsym_rel(trampoline_xen_phys_start,4,%eax)
         mov     %eax,%cr3
 
-        /* Reapply IA32_MISC_ENABLE modifications from early_init_intel(). */
-        mov     bootsym_rel(trampoline_misc_enable_off, 4, %esi)
-        mov     bootsym_rel(trampoline_misc_enable_off + 4, 4, %edi)
-        mov     %esi, %eax
-        or      %edi, %eax
-        jz      1f
-        mov     $MSR_IA32_MISC_ENABLE, %ecx
+        /* Adjust IA32_MISC_ENABLE if needed (for NX enabling below). */
+        cmpb    $1, bootsym_rel(trampoline_check_misc_enable, 5)
+        jne     1f
+
+        mov     $MSR_IA32_MISC_ENABLE,%ecx
         rdmsr
-        not     %esi
-        not     %edi
-        and     %esi, %eax
-        and     %edi, %edx
+
+        xor     %edi, %edi
+        btr     $22 /* ilog2(MSR_IA32_MISC_ENABLE_LIMIT_CPUID) */, %eax
+        adc     %edi, %edi
+
+        btr     $34 /* ilog2(MSR_IA32_MISC_ENABLE_XD_DISABLE) */ - 32, %edx
+        adc     %edi, %edi
+
+        /* No bits need clearing?  Nothing to do */
+        jz      1f
+
         wrmsr
 1:
         /* Set up PAT before enabling paging. */
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index d70f9cf87dc8..0249bb4bf2dc 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -19,6 +19,7 @@
 #include <asm/random.h>
 #include <asm/setup.h>
 #include <asm/shstk.h>
+#include <asm/trampoline.h>
 #include <asm/xstate.h>
 
 #include <public/sysctl.h>
@@ -307,6 +308,46 @@ static inline u32 phys_pkg_id(u32 cpuid_apic, int index_msb)
 	return _phys_pkg_id(get_apic_id(), index_msb);
 }
 
+/*
+ * Disable restrictions in MSR_MISC_ENABLE.  These are often available as
+ * firmware settings for backwards compatibility.  Called prior to cpuid_level
+ * being acted upon, as it may need unlimiting.
+ */
+static void __init intel_check_misc_enable(struct cpuinfo_x86 *c)
+{
+    uint64_t misc_enable, disable = (MSR_IA32_MISC_ENABLE_LIMIT_CPUID |
+                                     MSR_IA32_MISC_ENABLE_XD_DISABLE);
+
+    /* Instruct the trampoline to perform the same check too. */
+    bootsym(trampoline_check_misc_enable) = true;
+
+    misc_enable = rdmsr(MSR_IA32_MISC_ENABLE);
+
+    if ( (misc_enable & disable) == 0 )
+        return; /* Nothing to do */
+
+    wrmsr(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
+
+    /*
+     * When the P4 Nocona introduced the Structured Cache information, it was
+     * discovered that WinNT crashed on encountering a CPUID Leaf 4.  Intel
+     * worked around this by introducing an ability to limit the maximum
+     * reported leaf to 2 (PSN, leaf 3 had already been removed by this time).
+     */
+    if ( misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID )
+    {
+        c->cpuid_level = cpuid_eax(0);
+        printk(XENLOG_INFO "revised cpuid level: %u\n", c->cpuid_level);
+    }
+
+    /*
+     * When Intel added XD support originally, it was recommended to be off by
+     * default because of stability problems in WinXP SP2.
+     */
+    if ( misc_enable & MSR_IA32_MISC_ENABLE_XD_DISABLE )
+        printk(XENLOG_INFO "re-enabled NX (Execute Disable) protection\n");
+}
+
 /* Do minimum CPU detection early.
    Fields really needed: vendor, cpuid_level, family, model, mask, cache alignment.
    The others are not touched to avoid unwanted side effects.
@@ -327,7 +368,7 @@ void __init early_cpu_init(bool verbose)
 
 	c->x86_vendor = x86_cpuid_lookup_vendor(ebx, ecx, edx);
 	switch (c->x86_vendor) {
-	case X86_VENDOR_INTEL:    intel_unlock_cpuid_leaves(c);
+	case X86_VENDOR_INTEL:    intel_check_misc_enable(c);
 				  actual_cpu = intel_cpu_dev;    break;
 	case X86_VENDOR_AMD:      actual_cpu = amd_cpu_dev;      break;
 	case X86_VENDOR_CENTAUR:  actual_cpu = centaur_cpu_dev;  break;
diff --git a/xen/arch/x86/cpu/cpu.h b/xen/arch/x86/cpu/cpu.h
index 0fc6370edb13..d2d37d1d5eec 100644
--- a/xen/arch/x86/cpu/cpu.h
+++ b/xen/arch/x86/cpu/cpu.h
@@ -27,6 +27,4 @@ void amd_init_ssbd(const struct cpuinfo_x86 *c);
 void amd_init_spectral_chicken(void);
 void detect_zen2_null_seg_behaviour(void);
 
-void intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c);
-
 #endif /* X86_CPU_H */
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index 2aeeb2f5bf55..b1dd06d92f60 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -309,22 +309,6 @@ static void __init intel_init_levelling(void)
 		ctxt_switch_masking = intel_ctxt_switch_masking;
 }
 
-/* Unmask CPUID levels if masked. */
-void __init intel_unlock_cpuid_leaves(struct cpuinfo_x86 *c)
-{
-	uint64_t misc_enable, disable;
-
-	rdmsrl(MSR_IA32_MISC_ENABLE, misc_enable);
-
-	disable = misc_enable & MSR_IA32_MISC_ENABLE_LIMIT_CPUID;
-	if (disable) {
-		wrmsrl(MSR_IA32_MISC_ENABLE, misc_enable & ~disable);
-		bootsym(trampoline_misc_enable_off) |= disable;
-		c->cpuid_level = cpuid_eax(0);
-		printk(KERN_INFO "revised cpuid level: %u\n", c->cpuid_level);
-	}
-}
-
 /*
  * Errata BA80, AAK120, AAM108, AAO67, BD59, AAY54: Rapid Core C3/C6 Transition
  * May Cause Unpredictable System Behavior
@@ -392,9 +376,6 @@ static void __init probe_mwait_errata(void)
 
 static void __init cf_check early_init_intel(void)
 {
-    if ( bootsym(trampoline_misc_enable_off) & MSR_IA32_MISC_ENABLE_XD_DISABLE )
-        printk(KERN_INFO "re-enabled NX (Execute Disable) protection\n");
-
     check_memory_type_self_snoop_errata();
 
     /*
diff --git a/xen/arch/x86/include/asm/trampoline.h b/xen/arch/x86/include/asm/trampoline.h
index deed2679d9d5..893bbe54f325 100644
--- a/xen/arch/x86/include/asm/trampoline.h
+++ b/xen/arch/x86/include/asm/trampoline.h
@@ -153,10 +153,11 @@ extern uint8_t trampoline_cpu_started;
 extern uint32_t trampoline_efer;
 
 /*
- * When nonzero, clear the specified bits in MSR_MISC_ENABLE.  This is
- * necessary to clobber XD_DISABLE before trying to set MSR_EFER.NXE.
+ * Instruction from the BSP to APs that MSR_MISC_ENABLE is available and
+ * should be checked to remove limitations.  This is necessary to clobber
+ * XD_DISABLE before trying to set MSR_EFER.NXE.
  */
-extern uint64_t trampoline_misc_enable_off;
+extern bool trampoline_check_misc_enable;
 
 /* Quirks about video mode-setting on S3 resume. */
 extern uint8_t video_flags;
-- 
2.39.5


