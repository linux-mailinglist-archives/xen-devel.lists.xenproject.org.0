Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BABC1B28741
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 22:41:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1083894.1443416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F0-0007fp-MB; Fri, 15 Aug 2025 20:41:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1083894.1443416; Fri, 15 Aug 2025 20:41:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un1F0-0007XA-2X; Fri, 15 Aug 2025 20:41:34 +0000
Received: by outflank-mailman (input) for mailman id 1083894;
 Fri, 15 Aug 2025 20:41:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oFbR=23=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1un1Ex-0005E7-9v
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 20:41:31 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 39581d1d-7a18-11f0-a328-13f23c93f187;
 Fri, 15 Aug 2025 22:41:31 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3b9e4148134so1245347f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Aug 2025 13:41:30 -0700 (PDT)
Received: from localhost.localdomain (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3bb5d089e07sm3153924f8f.0.2025.08.15.13.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Aug 2025 13:41:29 -0700 (PDT)
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
X-Inumbo-ID: 39581d1d-7a18-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755290490; x=1755895290; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvO0yLtg8eUzoMi6i7eFIKNAZaltNGJ3gKQP47UCP/c=;
        b=SDs43sESv2h4o8hjJLbluotkQwu296vvU+HE1HTMWlfSiZKNzfxYex1cT+qHlZ9Tl7
         glx0Raa7RdpfJshz6/fU60PHXQQJtsOn6VSkpk84r3k9aQL7Lq+R//Oi0+VuZpnri7+3
         OoHCajUa/T7HeJ1sjw2oqml8D0pTcc6Dt+Cn0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755290490; x=1755895290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvO0yLtg8eUzoMi6i7eFIKNAZaltNGJ3gKQP47UCP/c=;
        b=koBU1eL4YtUvPpz/UjOVLDzFBeE8Q8zm27h5y+7amk8IWiURWr/4wio4i9jVivgo4E
         UED7MjC/TeBCt8yYF7GcGwVcS75eqXCtsIrvmxFtk6e3ruU687Z0UBfHknLeQaylxcQd
         WYpUXkxkAx6etOKRezxz0RRkHqRwdM4RBMSeOT54mC3Pp4nzwxcUnf79QUGsplWYTPWc
         U3h9XMexVpbkLY+1fKZLHEO9dfoaMl7Bm/Mm2ENKXCvF0eDOCCNC6N73qSrvyyWuHylJ
         ClpLNqJAhQKOIN9xTX+fViRSCmptL8VhoYgY2f7ntyPomD9ABbqw6GHI8EzIqwdlCRVc
         1HAw==
X-Gm-Message-State: AOJu0YzncWpzAR7yn93efCoxyRhrKNWC2to/6aftJM46Iw64PquMeeNi
	Rnc1vtD4mEMJ/Yzj22DMgtNSy9cX21p1lRmsS+dhCe2SCe8IuulXFWTbldqKR9ZFJq2sRhCU8WG
	9HfGx
X-Gm-Gg: ASbGncvJ2ejbMoyK2ZK1cIbQ6P0OvWp3u8gpKpk4r6Y+tnyQ6NmpaieXrDwOBBBuLGa
	shrztAZQBJBaT9MogTecpeZ4FFTA1xYV8cxJiEABXIFPa5XiminBj+Gno5t1HToWKOYaYchvv5h
	fv95vq3oyWPl3CMSVExRgGiqmyUjpJ1l/WgUN2TUxGfCetNkDbMaDUYwgTxX5DrKnvzq2xDPnu1
	2cABp4Z1pAoE295Bb9KfZKigqlyvwppjLJClwIRCugkxUemeRj5U6Cwqo5dxfjS3UgLD1NSyoP3
	AysLhueKQa62WuJxYOYil1kqPDzqsDPfCnmEJEZF5IGzO4vRFKG8Ky8EmWcV6eS6Zk6YT4rxgg7
	hMQFNA9c5Qt68d45KVHv0Kj80Dlnn/911SjBH/HzOnO3dpSOXsCu/3k14Ug6jBqoYfjNzyjMOhv
	16
X-Google-Smtp-Source: AGHT+IE5gUnTS0BYvPT4trTFUJODzmMQk18pgqY+TyoH28fLr+55LY4YaVDros88nEa37ogXoOhYdQ==
X-Received: by 2002:a05:6000:3113:b0:3b7:75dd:f37d with SMTP id ffacd0b85a97d-3bb636edd8emr2680132f8f.0.1755290489859;
        Fri, 15 Aug 2025 13:41:29 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 12/16] x86/msr: Change wrmsr() to take a single parameter
Date: Fri, 15 Aug 2025 21:41:13 +0100
Message-Id: <20250815204117.3312742-13-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
References: <20250815204117.3312742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Mirroring the cleanup to rdmsr(), do the same to wrmsr().  It now has the same
API as wrmsrl(), but we'll want to drop that wrapper in due course.

It's telling that almost all remaining users pass in 0.  Most are converted
directly to WRMSRNS, but a few are not.

MSR_VIRT_SPEC_CTRL is unconditionally intercepted is orders of magnitude more
expensive than just serialising.  In disable_lapic_nmi_watchdog(), the P4 case
won't run on hardware which has anything more than plain WRMSR.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/cpu/amd.c                  |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |  2 +-
 xen/arch/x86/include/asm/msr.h          | 20 ++++++++++----------
 xen/arch/x86/nmi.c                      | 18 +++++++++---------
 xen/arch/x86/oprofile/op_model_athlon.c |  2 +-
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 769413e96a3f..e03fba935510 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -934,7 +934,7 @@ void amd_set_legacy_ssbd(bool enable)
 		return;
 
 	if (cpu_has_virt_ssbd)
-		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0, 0);
+		wrmsr(MSR_VIRT_SPEC_CTRL, enable ? SPEC_CTRL_SSBD : 0);
 	else if (amd_legacy_ssbd)
 		core_set_legacy_ssbd(enable);
 	else
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 1fa61a944b23..328cba64387d 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -754,7 +754,7 @@ static int _vmx_cpu_up(bool bsp)
         eax |= IA32_FEATURE_CONTROL_ENABLE_VMXON_OUTSIDE_SMX;
         if ( test_bit(X86_FEATURE_SMX, &boot_cpu_data.x86_capability) )
             eax |= IA32_FEATURE_CONTROL_ENABLE_VMXON_INSIDE_SMX;
-        wrmsr(MSR_IA32_FEATURE_CONTROL, eax, 0);
+        wrmsrns(MSR_IA32_FEATURE_CONTROL, eax);
     }
 
     if ( (rc = vmx_init_vmcs_config(bsp)) != 0 )
diff --git a/xen/arch/x86/include/asm/msr.h b/xen/arch/x86/include/asm/msr.h
index f1b2bd5adc9f..1bd27b989a4d 100644
--- a/xen/arch/x86/include/asm/msr.h
+++ b/xen/arch/x86/include/asm/msr.h
@@ -15,13 +15,17 @@
  *   uint64_t foo = rdmsr(MSR_BAR);
  *   wrmsrns(MSR_BAR, foo);
  *
+ * and, if architectural serialisaition is necessary, or there are other
+ * reasons that WRMSRNS is inapplicable, then:
+ *
+ *   wrmsr(MSR_BAR, foo);
+ *
  * In addition, *_safe() wrappers exist to cope gracefully with a #GP.
  *
  *
  * All legacy forms are to be phased out:
  *
  *  rdmsrl(MSR_FOO, val);
- *  wrmsr(MSR_FOO, lo, hi);
  *  wrmsrl(MSR_FOO, val);
  */
 
@@ -43,17 +47,13 @@ static inline uint64_t rdmsr(unsigned int msr)
        val = a__ | ((u64)b__<<32); \
 } while(0)
 
-#define wrmsr(msr,val1,val2) \
-     __asm__ __volatile__("wrmsr" \
-			  : /* no outputs */ \
-			  : "c" (msr), "a" (val1), "d" (val2))
-
-static inline void wrmsrl(unsigned int msr, uint64_t val)
+static inline void wrmsr(unsigned int msr, uint64_t val)
 {
-        uint32_t lo = val, hi = val >> 32;
+    uint32_t lo = val, hi = val >> 32;
 
-        wrmsr(msr, lo, hi);
+    asm volatile ( "wrmsr" :: "a" (lo), "d" (hi), "c" (msr) );
 }
+#define wrmsrl(msr, val) wrmsr(msr, val)
 
 /* Non-serialising WRMSR, when available.  Falls back to a serialising WRMSR. */
 static inline void wrmsrns(uint32_t msr, uint64_t val)
@@ -151,7 +151,7 @@ static inline void wrmsr_tsc_aux(uint32_t val)
 
     if ( *this_tsc_aux != val )
     {
-        wrmsr(MSR_TSC_AUX, val, 0);
+        wrmsrns(MSR_TSC_AUX, val);
         *this_tsc_aux = val;
     }
 }
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 9793fa23168d..0d4aaa5a0b57 100644
--- a/xen/arch/x86/nmi.c
+++ b/xen/arch/x86/nmi.c
@@ -218,16 +218,16 @@ void disable_lapic_nmi_watchdog(void)
         return;
     switch (boot_cpu_data.x86_vendor) {
     case X86_VENDOR_AMD:
-        wrmsr(MSR_K7_EVNTSEL0, 0, 0);
+        wrmsrns(MSR_K7_EVNTSEL0, 0);
         break;
     case X86_VENDOR_INTEL:
         switch (boot_cpu_data.x86) {
         case 6:
-            wrmsr(MSR_P6_EVNTSEL(0), 0, 0);
+            wrmsrns(MSR_P6_EVNTSEL(0), 0);
             break;
         case 15:
-            wrmsr(MSR_P4_IQ_CCCR0, 0, 0);
-            wrmsr(MSR_P4_CRU_ESCR0, 0, 0);
+            wrmsr(MSR_P4_IQ_CCCR0, 0);
+            wrmsr(MSR_P4_CRU_ESCR0, 0);
             break;
         }
         break;
@@ -282,7 +282,7 @@ static void clear_msr_range(unsigned int base, unsigned int n)
     unsigned int i;
 
     for (i = 0; i < n; i++)
-        wrmsr(base+i, 0, 0);
+        wrmsrns(base + i, 0);
 }
 
 static inline void write_watchdog_counter(const char *descr)
@@ -308,11 +308,11 @@ static void setup_k7_watchdog(void)
         | K7_EVNTSEL_USR
         | K7_NMI_EVENT;
 
-    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
+    wrmsr(MSR_K7_EVNTSEL0, evntsel);
     write_watchdog_counter("K7_PERFCTR0");
     apic_write(APIC_LVTPC, APIC_DM_NMI);
     evntsel |= K7_EVNTSEL_ENABLE;
-    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
+    wrmsr(MSR_K7_EVNTSEL0, evntsel);
 }
 
 static void setup_p6_watchdog(unsigned counter)
@@ -338,11 +338,11 @@ static void setup_p6_watchdog(unsigned counter)
         | P6_EVNTSEL_USR
         | counter;
 
-    wrmsr(MSR_P6_EVNTSEL(0), evntsel, 0);
+    wrmsrns(MSR_P6_EVNTSEL(0), evntsel);
     write_watchdog_counter("P6_PERFCTR0");
     apic_write(APIC_LVTPC, APIC_DM_NMI);
     evntsel |= P6_EVNTSEL0_ENABLE;
-    wrmsr(MSR_P6_EVNTSEL(0), evntsel, 0);
+    wrmsrns(MSR_P6_EVNTSEL(0), evntsel);
 }
 
 static void setup_p4_watchdog(void)
diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/oprofile/op_model_athlon.c
index bf897a4b6328..fd454b04c353 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -34,7 +34,7 @@
 #define MAX_COUNTERS FAM15H_NUM_COUNTERS
 
 #define CTR_READ(msr_content,msrs,c) do {rdmsrl(msrs->counters[(c)].addr, (msr_content));} while (0)
-#define CTR_WRITE(l,msrs,c) do {wrmsr(msrs->counters[(c)].addr, -(unsigned int)(l), -1);} while (0)
+#define CTR_WRITE(l,msrs,c) do { wrmsr(msrs->counters[(c)].addr, -l); } while (0)
 #define CTR_OVERFLOWED(n) (!((n) & (1ULL<<31)))
 
 #define CTRL_READ(msr_content,msrs,c) do {rdmsrl(msrs->controls[(c)].addr, (msr_content));} while (0)
-- 
2.39.5


