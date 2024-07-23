Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B51293A518
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 19:42:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763460.1173733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJW5-0002OO-4i; Tue, 23 Jul 2024 17:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763460.1173733; Tue, 23 Jul 2024 17:41:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWJW5-0002LE-1W; Tue, 23 Jul 2024 17:41:37 +0000
Received: by outflank-mailman (input) for mailman id 763460;
 Tue, 23 Jul 2024 17:41:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=402b=OX=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1sWJW3-0002L8-Lg
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 17:41:35 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd2bcab7-491a-11ef-8776-851b0ebba9a2;
 Tue, 23 Jul 2024 19:41:33 +0200 (CEST)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-52f04150796so3413607e87.3
 for <xen-devel@lists.xenproject.org>; Tue, 23 Jul 2024 10:41:33 -0700 (PDT)
Received: from andrewcoop.eng.citrite.net ([185.25.67.249])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a7a3c785d96sm564232566b.9.2024.07.23.10.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jul 2024 10:41:31 -0700 (PDT)
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
X-Inumbo-ID: cd2bcab7-491a-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1721756492; x=1722361292; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7so5yOkajtILhIB4eAzsw9yrXHKi0Sp/DtmGeke8xss=;
        b=XJwLU5dXpdhHH8ehq90Fhhwqe/1aTqhHO2lt/2TQZyuOpaynboYQXJh4PS7Mu0v7of
         BplJr5T3xkNhlGxfHpJgaYEY8SN6qrE39Nq3GTp6uLNQ1nzXGHi/EzERAYI+0Ucn2t+2
         x3ivOdcIJ+vK/9cF0d16Jni9ovdjlEIvogQbk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721756492; x=1722361292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7so5yOkajtILhIB4eAzsw9yrXHKi0Sp/DtmGeke8xss=;
        b=LM3pFiXsrN7YW1XWM274mwmRwTFaKhGjJWfOqA+5F3GPSsiw+ZIr1EnF5JpyX9pLQf
         AdHF8XDQmseFs84gDELPV+j18HsQQx+vlGv8jJfjv+NmBwYgUESr5zuaGR+6QtjoMJfI
         e4kaEzXMs8x9MmGJZcwYVO2Sp3wmhYgMshFShmuPxOl/DULgvWoeTzZc8DNkrqNbXh52
         RW/4T8hZ2ppj57+oB/swDH5r4ofVhOdBw40mvWuvWAC0RDzpLBIGANT36gpSsUo5KVby
         8NEBIlnR5dFStgiIp5ANgw1oSgG23pmWJjFsItoR1F85VYA9ELo6iOURqM4NTFV/uIdL
         x2fg==
X-Gm-Message-State: AOJu0Yw21Vs6dXvF7LsGT4ZcevSFgsCqns+FxsVqU5ya7CSniPn06aI7
	PGdBtFXO3dkpH6tc1ncPDMKF3k6XQ1MS4QAuHKmHT/n8J5mWBWPEk7s1ZXL/QqeP4cY49gSk0Zb
	c
X-Google-Smtp-Source: AGHT+IG2JsrLKI+X4Ti5/Q8D2AFhgxUBjd2JXxXvATr9WTBvrEdVmEFifovhFX8NwdeALQGPewvIVA==
X-Received: by 2002:a05:6512:2247:b0:52e:9d6c:4462 with SMTP id 2adb3069b0e04-52fc40455e1mr2895738e87.23.1721756492039;
        Tue, 23 Jul 2024 10:41:32 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>
Subject: [PATCH] xen/printk: Avoid the use of L as a length modifier
Date: Tue, 23 Jul 2024 18:41:29 +0100
Message-Id: <20240723174129.67911-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Coverity complains about it being invalid.  It turns out that it is a GCC-ism
to treat ll and L equivalently.  C99 only permits L to mean long double.

Convert all uses of L in to alternatives, either l, ll or PRI.64 depending on
the operand type.  This in turn removes some unnecessary casts which look to
predate us having correct PRI* constants.

No functional change.

Coverity-IDs: 1464224, 1464228, 1464248, 1464261, 1464272, 1464281, 1464287, 1464290, 1494437

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Julien Grall <julien@xen.org>

I'm disappointed at having to use %ll for __fix_to_virt() in apic.c and
io_apic.c.  The expression ends up ULL because of the GB(64) in VMAP_VIRT_END,
but can't really be changed without breaking 32bit builds of Xen.

One option might be to turn __fix_to_virt() into a proper function, but
there's a lot of that infrastructure which should be dedup'd and not left to
each arch to copy.
---
 xen/arch/x86/apic.c            | 2 +-
 xen/arch/x86/cpu/intel.c       | 2 +-
 xen/arch/x86/cpu/mcheck/mce.c  | 9 ++++-----
 xen/arch/x86/cpu/mcheck/vmce.c | 2 +-
 xen/arch/x86/e820.c            | 6 +++---
 xen/arch/x86/hvm/vmx/vmcs.c    | 4 ++--
 xen/arch/x86/io_apic.c         | 2 +-
 xen/common/page_alloc.c        | 4 ++--
 xen/common/perfc.c             | 8 ++++----
 9 files changed, 19 insertions(+), 20 deletions(-)

diff --git a/xen/arch/x86/apic.c b/xen/arch/x86/apic.c
index 6567af685a1b..406ecbaab53e 100644
--- a/xen/arch/x86/apic.c
+++ b/xen/arch/x86/apic.c
@@ -938,7 +938,7 @@ void __init init_apic_mappings(void)
         apic_phys = mp_lapic_addr;
 
     set_fixmap_nocache(FIX_APIC_BASE, apic_phys);
-    apic_printk(APIC_VERBOSE, "mapped APIC to %08Lx (%08lx)\n", APIC_BASE,
+    apic_printk(APIC_VERBOSE, "mapped APIC to %08llx (%08lx)\n", APIC_BASE,
                 apic_phys);
 
 __next:
diff --git a/xen/arch/x86/cpu/intel.c b/xen/arch/x86/cpu/intel.c
index af56e57bd8ab..29690843fa4a 100644
--- a/xen/arch/x86/cpu/intel.c
+++ b/xen/arch/x86/cpu/intel.c
@@ -441,7 +441,7 @@ static void intel_log_freq(const struct cpuinfo_x86 *c)
             unsigned long long val = ecx;
 
             val *= ebx;
-            printk("CPU%u: TSC: %u Hz * %u / %u = %Lu Hz\n",
+            printk("CPU%u: TSC: %u Hz * %u / %u = %llu Hz\n",
                    smp_processor_id(), ecx, ebx, eax, val / eax);
         }
         else if ( ecx | eax | ebx )
diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
index 32c1b2756b90..c2b5199f8bcc 100644
--- a/xen/arch/x86/cpu/mcheck/mce.c
+++ b/xen/arch/x86/cpu/mcheck/mce.c
@@ -1183,8 +1183,8 @@ static bool x86_mc_msrinject_verify(struct xen_mc_msrinject *mci)
 
         if ( reason != NULL )
         {
-            printk("HV MSR INJECT ERROR: MSR %#Lx %s\n",
-                   (unsigned long long)mci->mcinj_msr[i].reg, reason);
+            printk("HV MSR INJECT ERROR: MSR %#"PRIx64" %s\n",
+                   mci->mcinj_msr[i].reg, reason);
             errs++;
         }
     }
@@ -1228,11 +1228,10 @@ static void cf_check x86_mc_msrinject(void *data)
 
     for ( i = 0, msr = &mci->mcinj_msr[0]; i < mci->mcinj_count; i++, msr++ )
     {
-        printk("HV MSR INJECT (%s) target %u actual %u MSR %#Lx <-- %#Lx\n",
+        printk("HV MSR INJECT (%s) target %u actual %u MSR %#"PRIx64" <-- %#"PRIx64"\n",
                intpose ? "interpose" : "hardware",
                mci->mcinj_cpunr, smp_processor_id(),
-               (unsigned long long)msr->reg,
-               (unsigned long long)msr->value);
+               msr->reg, msr->value);
 
         if ( intpose )
             intpose_add(mci->mcinj_cpunr, msr->reg, msr->value);
diff --git a/xen/arch/x86/cpu/mcheck/vmce.c b/xen/arch/x86/cpu/mcheck/vmce.c
index 5abdf4cb5fd5..dce67a3e1b2c 100644
--- a/xen/arch/x86/cpu/mcheck/vmce.c
+++ b/xen/arch/x86/cpu/mcheck/vmce.c
@@ -71,7 +71,7 @@ int vmce_restore_vcpu(struct vcpu *v, const struct hvm_vmce_vcpu *ctxt)
     if ( ctxt->caps & ~guest_mcg_cap & ~MCG_CAP_COUNT & ~MCG_CTL_P )
     {
         printk(XENLOG_G_ERR
-               "%s restore: unsupported MCA capabilities %#"PRIx64" for %pv (supported: %#Lx)\n",
+               "%s restore: unsupported MCA capabilities %#"PRIx64" for %pv (supported: %#llx)\n",
                 is_hvm_vcpu(v) ? "HVM" : "PV", ctxt->caps,
                 v, guest_mcg_cap & ~MCG_CAP_COUNT);
         return -EINVAL;
diff --git a/xen/arch/x86/e820.c b/xen/arch/x86/e820.c
index 6a3ce7e0a07f..bfe373e03427 100644
--- a/xen/arch/x86/e820.c
+++ b/xen/arch/x86/e820.c
@@ -94,9 +94,9 @@ void __init print_e820_memory_map(const struct e820entry *map,
     unsigned int i;
 
     for (i = 0; i < entries; i++) {
-        printk(" [%016Lx, %016Lx] ",
-               (unsigned long long)(map[i].addr),
-               (unsigned long long)(map[i].addr + map[i].size) - 1);
+        printk(" [%016"PRIx64", %016"PRIx64"] ",
+               map[i].addr,
+               map[i].addr + map[i].size - 1);
         switch (map[i].type) {
         case E820_RAM:
             printk("(usable)\n");
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index 9b6dc51f36ab..28d91c3857d5 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -517,7 +517,7 @@ static int vmx_init_vmcs_config(bool bsp)
         if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) >
              PAGE_SIZE )
         {
-            printk("VMX: CPU%d VMCS size is too big (%Lu bytes)\n",
+            printk("VMX: CPU%d VMCS size is too big (%llu bytes)\n",
                    smp_processor_id(),
                    vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32));
             return -EINVAL;
@@ -564,7 +564,7 @@ static int vmx_init_vmcs_config(bool bsp)
         if ( (vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32)) !=
              ((vmx_basic_msr & VMX_BASIC_VMCS_SIZE_MASK) >> 32) )
         {
-            printk("VMX: CPU%d unexpected VMCS size %Lu\n",
+            printk("VMX: CPU%d unexpected VMCS size %llu\n",
                    smp_processor_id(),
                    vmx_basic_msr_high & (VMX_BASIC_VMCS_SIZE_MASK >> 32));
             mismatch = 1;
diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
index d2a313c4ac72..ef076bfaf3f5 100644
--- a/xen/arch/x86/io_apic.c
+++ b/xen/arch/x86/io_apic.c
@@ -2597,7 +2597,7 @@ static void __init ioapic_init_mappings(void)
         }
 
         set_fixmap_nocache(idx, ioapic_phys);
-        apic_printk(APIC_VERBOSE, "mapped IOAPIC to %08Lx (%08lx)\n",
+        apic_printk(APIC_VERBOSE, "mapped IOAPIC to %08llx (%08lx)\n",
                     __fix_to_virt(idx), ioapic_phys);
 
         if ( bad_ioapic_register(i) )
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 33c8c917d984..3ea5c1b38b4a 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2395,7 +2395,7 @@ int assign_pages(
 
         if ( unlikely(nr > d->max_pages - tot_pages) )
         {
-            gprintk(XENLOG_INFO, "Over-allocation for %pd: %Lu > %u\n",
+            gprintk(XENLOG_INFO, "Over-allocation for %pd: %llu > %u\n",
                     d, tot_pages + 0ULL + nr, d->max_pages);
             rc = -E2BIG;
             goto out;
@@ -2407,7 +2407,7 @@ int assign_pages(
         if ( unlikely(d->tot_pages + nr < nr) )
         {
             gprintk(XENLOG_INFO,
-                    "Excess allocation for %pd: %Lu (%u extra)\n",
+                    "Excess allocation for %pd: %llu (%u extra)\n",
                     d, d->tot_pages + 0ULL + nr, d->extra_pages);
             if ( pg[0].count_info & PGC_extra )
                 d->extra_pages -= nr;
diff --git a/xen/common/perfc.c b/xen/common/perfc.c
index 80480aa7766d..3efb3a4262ef 100644
--- a/xen/common/perfc.c
+++ b/xen/common/perfc.c
@@ -49,7 +49,7 @@ void cf_check perfc_printall(unsigned char key)
                 sum += per_cpu(perfcounters, cpu)[j];
             if ( perfc_info[i].type == TYPE_S_SINGLE ) 
                 sum = (perfc_t) sum;
-            printk("TOTAL[%12Lu]", sum);
+            printk("TOTAL[%12llu]", sum);
             if ( sum )
             {
                 k = 0;
@@ -74,7 +74,7 @@ void cf_check perfc_printall(unsigned char key)
             }
             if ( perfc_info[i].type == TYPE_S_ARRAY ) 
                 sum = (perfc_t) sum;
-            printk("TOTAL[%12Lu]", sum);
+            printk("TOTAL[%12llu]", sum);
             if (sum)
             {
 #ifdef CONFIG_PERF_ARRAYS
@@ -87,7 +87,7 @@ void cf_check perfc_printall(unsigned char key)
                         sum = (perfc_t) sum;
                     if ( (k % 4) == 0 )
                         printk("\n%16s", "");
-                    printk("  ARR%02u[%10Lu]", k, sum);
+                    printk("  ARR%02u[%10llu]", k, sum);
                 }
 #else
                 k = 0;
@@ -103,7 +103,7 @@ void cf_check perfc_printall(unsigned char key)
                         sum = (perfc_t) sum;
                     if ( k > 0 && (k % 4) == 0 )
                         printk("\n%53s", "");
-                    printk("  CPU%02u[%10Lu]", cpu, sum);
+                    printk("  CPU%02u[%10llu]", cpu, sum);
                     ++k;
                 }
 #endif
-- 
2.39.2


