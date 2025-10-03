Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7897FBB85C7
	for <lists+xen-devel@lfdr.de>; Sat, 04 Oct 2025 00:54:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1136887.1473304 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oen-0004ns-Rf; Fri, 03 Oct 2025 22:53:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1136887.1473304; Fri, 03 Oct 2025 22:53:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v4oen-0004mR-Oq; Fri, 03 Oct 2025 22:53:45 +0000
Received: by outflank-mailman (input) for mailman id 1136887;
 Fri, 03 Oct 2025 22:53:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WVFT=4M=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1v4oem-0004mF-UM
 for xen-devel@lists.xenproject.org; Fri, 03 Oct 2025 22:53:44 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfd99f00-a0ab-11f0-9d14-b5c5bf9af7f9;
 Sat, 04 Oct 2025 00:53:43 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-4256866958bso732903f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 03 Oct 2025 15:53:43 -0700 (PDT)
Received: from localhost.localdomain (host-92-22-57-86.as13285.net.
 [92.22.57.86]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4255d8a6bbesm9616571f8f.12.2025.10.03.15.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Oct 2025 15:53:42 -0700 (PDT)
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
X-Inumbo-ID: cfd99f00-a0ab-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1759532023; x=1760136823; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBOGdSYhutEDI2EaxleEBeinmCty68xU9InOyjr4reI=;
        b=MACedWK1QS2zs64nu/cn+Hb1GoWSQnLUjeNmsWT6hF2WTpnzq0nGnghYb2CiRm5wN/
         yo3cWX2QPVn3Q918+OOguoepWImgHk/5UPewH7e5m1QXUx31nkQKsmvL/+08Acl1kk95
         ZxkmgztmG75BLFQjEkzo81HF4ljxneRkhuElQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759532023; x=1760136823;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qBOGdSYhutEDI2EaxleEBeinmCty68xU9InOyjr4reI=;
        b=RK56dKaeMyXtXqMxus4XwpHbRaiYwMJuaX78PZ2Z2NfR1fhWgHHiRirQpHvcNBOkWt
         mwTUoilveoFRa0fBP6dEPIvHWkwpIEvjUYae5g9VvD+/eq+rBR8O6PmFDOG/cTSqbQjq
         Q/QjRVrMeqCqgi2xegUf7QQkWpgWAOV9WL8kvSaEVUib3XWsLVPU8B5Mv9qMta68S+Xj
         4ESM2bXEv0yVZbkpctQYlekQkAIn36MdjRikTbsdjth6PfgpyACEXrG5F3xlpAAexq46
         vxX3/n+kIKeSdFoML/GjHgXNxVhKMgqT+hKCdmMH3/np/RZzGE/bKQeijqiKfKiJEmaI
         e8rw==
X-Gm-Message-State: AOJu0YyRYFaiUrxJOOpUtzLnwUwT+stFwn6jtSQgoR5ZI1k0GBb3paR4
	uZoeYQkkU7JsU1h2GSBOpvvQjtwQT0egcm6KDVwDZ3U8gdV7E3t5b9mAW+dJtkxCGo3g0J+XqvK
	RXJakwYSoPg==
X-Gm-Gg: ASbGncu1Tdw61TjOTCBkCEmzAmBeIJbpm6wIGDJexZgdiBMYUxqycT+6evKY/94eaiU
	NiH0iFgcnjtgX/A3utZG8lSPOk7UgYvZac7/y7cqcQGWTm6qWb15s4bdiEKbkM6EHIdkQOXIkDZ
	L587NqspzF6QBdB5929RRmjdFjTYlCTkModsYGeaoHLKWz3jJFoqSInGUt22HQW8IXYbBT0M/iw
	6Bu5TI5a/ckifAeVBpS9HCqZcettTsk5pGrvbwJTiEnN4pAHohGfzT1b67H+AFgEvA7dBWhLlfW
	bV2GuntbJL8RvG26Jbl37Qr0WUIkOZOR2InI99hDOxNTHgrZYxXyqYz67PYiRmyOB7zQTLNf0Pf
	kC8hsJbPBdssBjVOKVmEne7qv2zIruyN44g6ZVkJuWpX5DJTiVDwkF+mZdJIY/nLjbOzUMgov9t
	vwyxhlfVqW9hIXL7n3pu6k
X-Google-Smtp-Source: AGHT+IHIr+hs4rOlzl06AfMSE61LYSI0IMlFJJPgZ4b7S6Ao2ZqCuDK9tAzmz4Bti0cadYe4y78WdA==
X-Received: by 2002:a05:6000:4211:b0:402:d5e6:2283 with SMTP id ffacd0b85a97d-4256714c852mr3093348f8f.20.1759532022794;
        Fri, 03 Oct 2025 15:53:42 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 02/22] x86/msr: Change wrmsr() to take a single parameter
Date: Fri,  3 Oct 2025 23:53:14 +0100
Message-Id: <20251003225334.2123667-3-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
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

For CTR_WRITE() in op_model_athlon.c there is a logical change in behaviour,
but it's fixing a bug.  Peformance counters typically get written to -(count)
as they generate an interrupt on overflow.  The performance counters even in
the K8 were 48 bits wide, and this wrmsr() not being a wrmsrl() appears to
have been an oversight in commit b5103d692aa7 ("x86 oprofile: use
rdmsrl/wrmsrl") which converted all other users, and appears to be the last
time there was an attempt to unify the MSR APIs.

No practical change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>

v3:
 * Swap to wrmsrns() in setup_k7_watchdog()
 * Reinstate correct bracketing in op_model_athlon.c's CTR_WRITE(), drop
   useless do{}while().
---
 xen/arch/x86/cpu/amd.c                  |  2 +-
 xen/arch/x86/hvm/vmx/vmcs.c             |  2 +-
 xen/arch/x86/include/asm/msr.h          | 20 ++++++++++----------
 xen/arch/x86/nmi.c                      | 18 +++++++++---------
 xen/arch/x86/oprofile/op_model_athlon.c |  2 +-
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 43481daa8e26..9b02e1ba675c 100644
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
index b639818b6ea6..cd5ac8a5f0e3 100644
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
index 188a50f9cea4..941a7612f4ba 100644
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
 
@@ -43,17 +47,13 @@ static always_inline uint64_t rdmsr(unsigned int msr)
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
@@ -150,7 +150,7 @@ static inline void wrmsr_tsc_aux(uint32_t val)
 
     if ( *this_tsc_aux != val )
     {
-        wrmsr(MSR_TSC_AUX, val, 0);
+        wrmsrns(MSR_TSC_AUX, val);
         *this_tsc_aux = val;
     }
 }
diff --git a/xen/arch/x86/nmi.c b/xen/arch/x86/nmi.c
index 9793fa23168d..a0c9194ff032 100644
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
+    wrmsrns(MSR_K7_EVNTSEL0, evntsel);
     write_watchdog_counter("K7_PERFCTR0");
     apic_write(APIC_LVTPC, APIC_DM_NMI);
     evntsel |= K7_EVNTSEL_ENABLE;
-    wrmsr(MSR_K7_EVNTSEL0, evntsel, 0);
+    wrmsrns(MSR_K7_EVNTSEL0, evntsel);
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
index bf897a4b6328..4c016624a69b 100644
--- a/xen/arch/x86/oprofile/op_model_athlon.c
+++ b/xen/arch/x86/oprofile/op_model_athlon.c
@@ -34,7 +34,7 @@
 #define MAX_COUNTERS FAM15H_NUM_COUNTERS
 
 #define CTR_READ(msr_content,msrs,c) do {rdmsrl(msrs->counters[(c)].addr, (msr_content));} while (0)
-#define CTR_WRITE(l,msrs,c) do {wrmsr(msrs->counters[(c)].addr, -(unsigned int)(l), -1);} while (0)
+#define CTR_WRITE(l,msrs,c) wrmsr(msrs->counters[(c)].addr, -(l))
 #define CTR_OVERFLOWED(n) (!((n) & (1ULL<<31)))
 
 #define CTRL_READ(msr_content,msrs,c) do {rdmsrl(msrs->controls[(c)].addr, (msr_content));} while (0)
-- 
2.39.5


