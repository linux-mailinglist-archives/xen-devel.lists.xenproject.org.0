Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E02DD2C0D76
	for <lists+xen-devel@lfdr.de>; Mon, 23 Nov 2020 15:29:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.34459.65536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCqV-0007Uo-3v; Mon, 23 Nov 2020 14:29:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 34459.65536; Mon, 23 Nov 2020 14:29:35 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khCqV-0007UP-0X; Mon, 23 Nov 2020 14:29:35 +0000
Received: by outflank-mailman (input) for mailman id 34459;
 Mon, 23 Nov 2020 14:29:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1khCqT-0007UF-VE
 for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:29:33 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8240edfc-1097-492e-848d-1604c4052fea;
 Mon, 23 Nov 2020 14:29:32 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CFC2AD1E;
 Mon, 23 Nov 2020 14:29:32 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=qJrE=E5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1khCqT-0007UF-VE
	for xen-devel@lists.xenproject.org; Mon, 23 Nov 2020 14:29:33 +0000
X-Inumbo-ID: 8240edfc-1097-492e-848d-1604c4052fea
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 8240edfc-1097-492e-848d-1604c4052fea;
	Mon, 23 Nov 2020 14:29:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606141772; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=topsFTtubCCTfjnREywJuAhrQ3UsXaerCVcSXj//Ras=;
	b=PLpqinmHAaaLZEN0XUryDve53WCXXATMcXpFZyXbZIh2f88ulib03wYKuNaDtHUhooDgff
	D4JD8BjR+p/luOL89a9XpJUiVW4Wiwie5Cl+cdvmbZQFWJO3IH2WFfbVGn5Bxre2ZILR1S
	N/8FN//78wWKZzhL6TtN78v4sYXlW5I=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 0CFC2AD1E;
	Mon, 23 Nov 2020 14:29:32 +0000 (UTC)
Subject: [PATCH v2 06/17] x86/xstate: drop xstate_offsets[] and xstate_sizes[]
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Message-ID: <6d6d1c7f-3d17-5031-ad31-600cff88c55c@suse.com>
Date: Mon, 23 Nov 2020 15:29:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <255f466c-3c95-88c5-3e55-0f04c9ae1b12@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

They're redundant with respective fields from the raw CPUID policy; no
need to keep two copies of the same data. This also breaks
recalculate_xstate()'s dependency on xstate_init(), allowing host CPUID
policy calculation to be moved together with that of the raw one (which
a subsequent change willl require anyway).

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: New.

--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -498,6 +498,8 @@ void identify_cpu(struct cpuinfo_x86 *c)
 	}
 
 	/* Now the feature flags better reflect actual CPU features! */
+	if (c == &boot_cpu_data)
+		init_host_cpuid();
 
 	xstate_init(c);
 
--- a/xen/arch/x86/cpuid.c
+++ b/xen/arch/x86/cpuid.c
@@ -167,32 +167,32 @@ static void recalculate_xstate(struct cp
     {
         xstates |= X86_XCR0_YMM;
         xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_YMM_POS] +
-                          xstate_sizes[X86_XCR0_YMM_POS]);
+                          xstate_offset(X86_XCR0_YMM_POS) +
+                          xstate_size(X86_XCR0_YMM_POS));
     }
 
     if ( p->feat.mpx )
     {
         xstates |= X86_XCR0_BNDREGS | X86_XCR0_BNDCSR;
         xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_BNDCSR_POS] +
-                          xstate_sizes[X86_XCR0_BNDCSR_POS]);
+                          xstate_offset(X86_XCR0_BNDCSR_POS) +
+                          xstate_size(X86_XCR0_BNDCSR_POS));
     }
 
     if ( p->feat.avx512f )
     {
         xstates |= X86_XCR0_OPMASK | X86_XCR0_ZMM | X86_XCR0_HI_ZMM;
         xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_HI_ZMM_POS] +
-                          xstate_sizes[X86_XCR0_HI_ZMM_POS]);
+                          xstate_offset(X86_XCR0_HI_ZMM_POS) +
+                          xstate_size(X86_XCR0_HI_ZMM_POS));
     }
 
     if ( p->feat.pku )
     {
         xstates |= X86_XCR0_PKRU;
         xstate_size = max(xstate_size,
-                          xstate_offsets[X86_XCR0_PKRU_POS] +
-                          xstate_sizes[X86_XCR0_PKRU_POS]);
+                          xstate_offset(X86_XCR0_PKRU_POS) +
+                          xstate_size(X86_XCR0_PKRU_POS));
     }
 
     p->xstate.max_size  =  xstate_size;
@@ -215,8 +215,8 @@ static void recalculate_xstate(struct cp
         if ( !(xstates & curr_xstate) )
             continue;
 
-        p->xstate.comp[i].size   = xstate_sizes[i];
-        p->xstate.comp[i].offset = xstate_offsets[i];
+        p->xstate.comp[i].size   = xstate_size(i);
+        p->xstate.comp[i].offset = xstate_offset(i);
         p->xstate.comp[i].xss    = curr_xstate & XSTATE_XSAVES_ONLY;
         p->xstate.comp[i].align  = curr_xstate & xstate_align;
     }
@@ -512,10 +512,16 @@ static void __init calculate_hvm_def_pol
     recalculate_xstate(p);
 }
 
-void __init init_guest_cpuid(void)
+void __init init_host_cpuid(void)
 {
     calculate_raw_policy();
     calculate_host_policy();
+}
+
+void __init init_guest_cpuid(void)
+{
+    /* Do this a 2nd time to account for setup_{clear,force}_cpu_cap() uses. */
+    calculate_host_policy();
 
     if ( IS_ENABLED(CONFIG_PV) )
     {
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -9,6 +9,7 @@
 #include <xen/percpu.h>
 #include <xen/sched.h>
 #include <xen/xvmalloc.h>
+#include <asm/cpuid.h>
 #include <asm/current.h>
 #include <asm/processor.h>
 #include <asm/hvm/support.h>
@@ -26,8 +27,6 @@ static u32 __read_mostly xsave_cntxt_siz
 /* A 64-bit bitmask of the XSAVE/XRSTOR features supported by processor. */
 u64 __read_mostly xfeature_mask;
 
-unsigned int *__read_mostly xstate_offsets;
-unsigned int *__read_mostly xstate_sizes;
 u64 __read_mostly xstate_align;
 static unsigned int __read_mostly xstate_features;
 
@@ -93,34 +92,19 @@ static int setup_xstate_features(bool bs
     unsigned int leaf, eax, ebx, ecx, edx;
 
     if ( bsp )
-    {
         xstate_features = flsl(xfeature_mask);
-        xstate_offsets = xzalloc_array(unsigned int, xstate_features);
-        if ( !xstate_offsets )
-            return -ENOMEM;
-
-        xstate_sizes = xzalloc_array(unsigned int, xstate_features);
-        if ( !xstate_sizes )
-            return -ENOMEM;
-    }
 
     for ( leaf = 2; leaf < xstate_features; leaf++ )
     {
-        if ( bsp )
-        {
-            cpuid_count(XSTATE_CPUID, leaf, &xstate_sizes[leaf],
-                        &xstate_offsets[leaf], &ecx, &edx);
-            if ( ecx & XSTATE_ALIGN64 )
-                __set_bit(leaf, &xstate_align);
-        }
+        cpuid_count(XSTATE_CPUID, leaf, &eax,
+                    &ebx, &ecx, &edx);
+        BUG_ON(eax != xstate_size(leaf));
+        BUG_ON(ebx != xstate_offset(leaf));
+
+        if ( bsp && (ecx & XSTATE_ALIGN64) )
+            __set_bit(leaf, &xstate_align);
         else
-        {
-            cpuid_count(XSTATE_CPUID, leaf, &eax,
-                        &ebx, &ecx, &edx);
-            BUG_ON(eax != xstate_sizes[leaf]);
-            BUG_ON(ebx != xstate_offsets[leaf]);
             BUG_ON(!(ecx & XSTATE_ALIGN64) != !test_bit(leaf, &xstate_align));
-        }
     }
 
     return 0;
@@ -150,7 +134,7 @@ static void setup_xstate_comp(uint16_t *
             if ( test_bit(i, &xstate_align) )
                 offset = ROUNDUP(offset, 64);
             comp_offsets[i] = offset;
-            offset += xstate_sizes[i];
+            offset += xstate_size(i);
         }
     }
     ASSERT(offset <= xsave_cntxt_size);
@@ -213,10 +197,10 @@ void expand_xsave_states(struct vcpu *v,
          * comp_offsets[] information, something is very broken.
          */
         BUG_ON(!comp_offsets[index]);
-        BUG_ON((xstate_offsets[index] + xstate_sizes[index]) > size);
+        BUG_ON((xstate_offset(index) + xstate_size(index)) > size);
 
-        memcpy(dest + xstate_offsets[index], src + comp_offsets[index],
-               xstate_sizes[index]);
+        memcpy(dest + xstate_offset(index), src + comp_offsets[index],
+               xstate_size(index));
 
         valid &= ~feature;
     }
@@ -279,10 +263,10 @@ void compress_xsave_states(struct vcpu *
          * comp_offset[] information, something is very broken.
          */
         BUG_ON(!comp_offsets[index]);
-        BUG_ON((xstate_offsets[index] + xstate_sizes[index]) > size);
+        BUG_ON((xstate_offset(index) + xstate_size(index)) > size);
 
-        memcpy(dest + comp_offsets[index], src + xstate_offsets[index],
-               xstate_sizes[index]);
+        memcpy(dest + comp_offsets[index], src + xstate_offset(index),
+               xstate_size(index));
 
         valid &= ~feature;
     }
@@ -516,8 +500,8 @@ int xstate_alloc_save_area(struct vcpu *
         unsigned int i;
 
         for ( size = 0, i = 2; i < xstate_features; ++i )
-            if ( size < xstate_sizes[i] )
-                size = xstate_sizes[i];
+            if ( size < xstate_size(i) )
+                size = xstate_size(i);
         size += XSTATE_AREA_MIN_SIZE;
     }
 
@@ -560,9 +544,9 @@ int xstate_update_save_area(struct vcpu
     for ( size = old = XSTATE_AREA_MIN_SIZE, i = 2; i < xstate_features; ++i )
     {
         if ( xcr0_max & (1ul << i) )
-            size = max(size, xstate_offsets[i] + xstate_sizes[i]);
+            size = max(size, xstate_offset(i) + xstate_size(i));
         if ( v->arch.xcr0_accum & (1ul << i) )
-            old = max(old, xstate_offsets[i] + xstate_sizes[i]);
+            old = max(old, xstate_offset(i) + xstate_size(i));
     }
 
     save_area = _xvrealloc(v->arch.xsave_area, size, __alignof(*save_area));
@@ -821,7 +805,7 @@ uint64_t read_bndcfgu(void)
               : "=m" (*xstate)
               : "a" (X86_XCR0_BNDCSR), "d" (0), "D" (xstate) );
 
-        bndcsr = (void *)xstate + xstate_offsets[X86_XCR0_BNDCSR_POS];
+        bndcsr = (void *)xstate + xstate_offset(X86_XCR0_BNDCSR_POS);
     }
 
     if ( cr0 & X86_CR0_TS )
--- a/xen/include/asm-x86/cpuid.h
+++ b/xen/include/asm-x86/cpuid.h
@@ -16,6 +16,7 @@
 extern const uint32_t known_features[FSCAPINTS];
 extern const uint32_t special_features[FSCAPINTS];
 
+void init_host_cpuid(void);
 void init_guest_cpuid(void);
 
 /*
--- a/xen/include/asm-x86/xstate.h
+++ b/xen/include/asm-x86/xstate.h
@@ -44,8 +44,9 @@ extern uint32_t mxcsr_mask;
 
 extern u64 xfeature_mask;
 extern u64 xstate_align;
-extern unsigned int *xstate_offsets;
-extern unsigned int *xstate_sizes;
+
+#define xstate_offset(n) (raw_cpuid_policy.xstate.comp[n].offset)
+#define xstate_size(n)   (raw_cpuid_policy.xstate.comp[n].size)
 
 /* extended state save area */
 struct __attribute__((aligned (64))) xsave_struct


