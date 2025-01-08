Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB0DA057D4
	for <lists+xen-devel@lfdr.de>; Wed,  8 Jan 2025 11:15:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867107.1278539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT6E-0007hm-8c; Wed, 08 Jan 2025 10:15:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867107.1278539; Wed, 08 Jan 2025 10:15:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVT6E-0007fe-5V; Wed, 08 Jan 2025 10:15:42 +0000
Received: by outflank-mailman (input) for mailman id 867107;
 Wed, 08 Jan 2025 10:15:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=svEr=UA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tVT6D-0007AP-AE
 for xen-devel@lists.xenproject.org; Wed, 08 Jan 2025 10:15:41 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 827ace7d-cda9-11ef-99a4-01e77a169b0f;
 Wed, 08 Jan 2025 11:15:39 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-436249df846so114545285e9.3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jan 2025 02:15:39 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2e22c6dsm15489755e9.41.2025.01.08.02.15.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Jan 2025 02:15:38 -0800 (PST)
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
X-Inumbo-ID: 827ace7d-cda9-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736331339; x=1736936139; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=P1MIbiccam+0w1GrD/h7pQdOgwuOnzTZkVsUXNrVWs0=;
        b=Sz3trCHFmI23NmQD04ypMOJpFXitG1AqMrQSXU+h/y6HC93nRzx0uWR/fg0LQi2BhY
         iuN0riM4FrkRdqJM+hZ3XEN5PjHyw2XoiNBkgJ2OKK38b+ptKzsMNhIRheceQOVAi13E
         9Qs/AvHYJnn6tIiEGN4oguuCKi3xaViZ1vW423wxN9rMCME5Ma/4wHXtfoxcXtmFVD2T
         Fyq/+6FJ5z0s3rjsC1Pe8kHScV2azQnav6ulNSp3xdC5+0rCgDI8AE3ke62oEtcSUeI4
         VF2wiD2Qgste4ecc3Ggii3jOZekhWXArv1aW4EZR+Ekshvg7ddMIYy3oEAKOUtoallQX
         3eMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736331339; x=1736936139;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P1MIbiccam+0w1GrD/h7pQdOgwuOnzTZkVsUXNrVWs0=;
        b=STBgvjpo5qlS5d42zuIKBchGtgrpp3UAFnP0asDkrAYHAoudrQoytBLNPuTzLFIHcJ
         ZHQSw/tcBxC5VQLumMRQJHdnzlxKgFDTOvLSTvMPebMypRbraIz/FVbOlX4QaHcHd6jz
         xwa+slsYXxHbwoFWJeBaXA5EODe547j8IvTmzSSOyDNUNVsnBvtoLPaBK/ojna9BOupG
         5D9SV0GwPHqCnKc6DzW0jW3joLlzeBT17vdK1v9ycueyitvax/d5IoVzWszX2OqfM15d
         i+1EHD47e6w1LwNa8LlmmhF/Z9x3OKzH9MZ99v1SlI6Q0ni1ubcsekTOpHbmzx8sH0yv
         2zKQ==
X-Gm-Message-State: AOJu0YzUAICLGLochZi8ysUstyJ7ho51GX4jIMdgz9YXVACfCe21y7sw
	/CXoR9VHEZOICbdpNlOap2NRo7Xu4i659hBa4hpH1BIwwaFwnWCyGH6xA/KDNT2V3YhsJL+yE48
	=
X-Gm-Gg: ASbGncvw0WS/03i95F7AStR1BtqM/4cNbi5YxzEno7OaF+YlrXQ/LRsORy4mvTvOWFl
	sp65gXuBt65aqF7935CbZuP65BGnuBLa4Xv82KaRbPZAVyhDpwHYM5u8MHUaNT8eOruGxB6xtUv
	OE+k96g+VEc6mksS77cEJOuIEbDpbLueRCOStf0cbHwY+sdHLhEK8J2GisI6IBR1r29jWUVrVRG
	PxYpVSPG2vTfEsYshN+/HcGt7Mlu6AM8xsqPPqDpoC5556mV31YlNcUCELs3Stn6USxwfg0+lr6
	pM6Czg22LPD3ojk6QaG7G2bnbNlDdCugtrNnPY3HrQ==
X-Google-Smtp-Source: AGHT+IFeve6rmgNKMBreSEhP0nNBBk0KZo5lJVNQCRQQxaQPU6Oh4TiQR9KKQ1AY3LJtNX9D29QQvg==
X-Received: by 2002:a05:600c:5491:b0:434:f7f0:1880 with SMTP id 5b1f17b1804b1-436e26ec32amr14641945e9.32.1736331338903;
        Wed, 08 Jan 2025 02:15:38 -0800 (PST)
Message-ID: <4afef39b-ff01-40f8-9bf1-68202f3a8b60@suse.com>
Date: Wed, 8 Jan 2025 11:15:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v4 6/6] mm: allow page scrubbing routine(s) to be arch
 controlled
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, Julien Grall
 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Anthony PERARD <anthony.perard@vates.tech>
References: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
Content-Language: en-US
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <14b65231-b83b-43fb-bbcf-dec5c07d285b@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Especially when dealing with large amounts of memory, memset() may not
be very efficient; this can be bad enough that even for debug builds a
custom function is warranted. We additionally want to distinguish "hot"
and "cold" cases (with, as initial heuristic, "hot" being for any
allocations a domain does for itself, assuming that in all other cases
the page wouldn't be accessed [again] soon). The goal is for accesses
of "cold" pages to not disturb caches (albeit finding a good balance
between this and the higher latency looks to be difficult).

Keep the default fallback to clear_page_*() in common code; this may
want to be revisited down the road.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v4: Re-base.
v3: Re-base.
v2: New.
---
The choice between hot and cold in scrub_one_page()'s callers is
certainly up for discussion / improvement.

--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -144,6 +144,12 @@ extern size_t dcache_line_bytes;
 
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
+#define clear_page_hot  clear_page
+#define clear_page_cold clear_page
+
+#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
+#define scrub_page_cold      scrub_page_hot
+
 static inline size_t read_dcache_line_bytes(void)
 {
     register_t ctr;
--- a/xen/arch/ppc/include/asm/page.h
+++ b/xen/arch/ppc/include/asm/page.h
@@ -190,6 +190,12 @@ static inline void invalidate_icache(voi
 #define clear_page(page) memset(page, 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
+#define clear_page_hot  clear_page
+#define clear_page_cold clear_page
+
+#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
+#define scrub_page_cold      scrub_page_hot
+
 /* TODO: Flush the dcache for an entire page. */
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
--- a/xen/arch/riscv/include/asm/page.h
+++ b/xen/arch/riscv/include/asm/page.h
@@ -177,6 +177,12 @@ static inline void invalidate_icache(voi
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
+#define clear_page_hot  clear_page
+#define clear_page_cold clear_page
+
+#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
+#define scrub_page_cold      scrub_page_hot
+
 static inline void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     const void *v = map_domain_page(_mfn(mfn));
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -59,6 +59,7 @@ obj-y += pci.o
 obj-y += physdev.o
 obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-$(CONFIG_X86_PSR) += psr.o
+obj-bin-$(CONFIG_DEBUG) += scrub_page.o
 obj-y += setup.o
 obj-y += shutdown.o
 obj-y += smp.o
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -226,6 +226,11 @@ void copy_page_sse2(void *to, const void
 #define clear_page(_p)      clear_page_cold(_p)
 #define copy_page(_t, _f)   copy_page_sse2(_t, _f)
 
+#ifdef CONFIG_DEBUG
+void scrub_page_hot(void *);
+void scrub_page_cold(void *);
+#endif
+
 /* Convert between Xen-heap virtual addresses and machine addresses. */
 #define __pa(x)             (virt_to_maddr(x))
 #define __va(x)             (maddr_to_virt(x))
--- /dev/null
+++ b/xen/arch/x86/scrub_page.S
@@ -0,0 +1,39 @@
+        .file __FILE__
+
+#include <asm/asm_defns.h>
+#include <xen/page-size.h>
+#include <xen/scrub.h>
+
+FUNC(scrub_page_cold)
+        mov     $PAGE_SIZE/32, %ecx
+        mov     $SCRUB_PATTERN, %rax
+
+0:      movnti  %rax,   (%rdi)
+        movnti  %rax,  8(%rdi)
+        movnti  %rax, 16(%rdi)
+        movnti  %rax, 24(%rdi)
+        add     $32, %rdi
+        sub     $1, %ecx
+        jnz     0b
+
+        sfence
+        ret
+END(scrub_page_cold)
+
+        .macro scrub_page_stosb
+        mov     $PAGE_SIZE, %ecx
+        mov     $SCRUB_BYTE_PATTERN, %eax
+        rep stosb
+        ret
+        .endm
+
+        .macro scrub_page_stosq
+        mov     $PAGE_SIZE/8, %ecx
+        mov     $SCRUB_PATTERN, %rax
+        rep stosq
+        ret
+        .endm
+
+FUNC(scrub_page_hot)
+        ALTERNATIVE scrub_page_stosq, scrub_page_stosb, X86_FEATURE_ERMS
+END(scrub_page_hot)
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -135,6 +135,7 @@
 #include <xen/pfn.h>
 #include <xen/types.h>
 #include <xen/sched.h>
+#include <xen/scrub.h>
 #include <xen/sections.h>
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
@@ -780,27 +781,31 @@ static void page_list_add_scrub(struct p
         page_list_add(pg, &heap(node, zone, order));
 }
 
-/* SCRUB_PATTERN needs to be a repeating series of bytes. */
-#ifndef NDEBUG
-#define SCRUB_PATTERN        0xc2c2c2c2c2c2c2c2ULL
-#else
-#define SCRUB_PATTERN        0ULL
+/*
+ * While in debug builds we want callers to avoid relying on allocations
+ * returning zeroed pages, for a production build, clear_page_*() is the
+ * fastest way to scrub.
+ */
+#ifndef CONFIG_DEBUG
+# undef  scrub_page_hot
+# define scrub_page_hot clear_page_hot
+# undef  scrub_page_cold
+# define scrub_page_cold clear_page_cold
 #endif
-#define SCRUB_BYTE_PATTERN   (SCRUB_PATTERN & 0xff)
 
-static void scrub_one_page(const struct page_info *pg)
+static void scrub_one_page(const struct page_info *pg, bool cold)
 {
+    void *ptr;
+
     if ( unlikely(pg->count_info & PGC_broken) )
         return;
 
-#ifndef NDEBUG
-    /* Avoid callers relying on allocations returning zeroed pages. */
-    unmap_domain_page(memset(__map_domain_page(pg),
-                             SCRUB_BYTE_PATTERN, PAGE_SIZE));
-#else
-    /* For a production build, clear_page() is the fastest way to scrub. */
-    clear_domain_page(_mfn(page_to_mfn(pg)));
-#endif
+    ptr = __map_domain_page(pg);
+    if ( cold )
+        scrub_page_cold(ptr);
+    else
+        scrub_page_hot(ptr);
+    unmap_domain_page(ptr);
 }
 
 static void poison_one_page(struct page_info *pg)
@@ -1080,12 +1085,14 @@ static struct page_info *alloc_heap_page
     if ( first_dirty != INVALID_DIRTY_IDX ||
          (scrub_debug && !(memflags & MEMF_no_scrub)) )
     {
+        bool cold = d && d != current->domain;
+
         for ( i = 0; i < (1U << order); i++ )
         {
             if ( test_and_clear_bit(_PGC_need_scrub, &pg[i].count_info) )
             {
                 if ( !(memflags & MEMF_no_scrub) )
-                    scrub_one_page(&pg[i]);
+                    scrub_one_page(&pg[i], cold);
 
                 dirty_cnt++;
             }
@@ -1350,7 +1357,7 @@ bool scrub_free_pages(void)
                 {
                     if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
                     {
-                        scrub_one_page(&pg[i]);
+                        scrub_one_page(&pg[i], true);
                         /*
                          * We can modify count_info without holding heap
                          * lock since we effectively locked this buddy by
@@ -2072,7 +2079,7 @@ static struct page_info *alloc_color_hea
     if ( !(memflags & MEMF_no_scrub) )
     {
         if ( need_scrub )
-            scrub_one_page(pg);
+            scrub_one_page(pg, d != current->domain);
         else
             check_one_page(pg);
     }
@@ -2223,7 +2230,7 @@ static void __init cf_check smp_scrub_he
         if ( !mfn_valid(_mfn(mfn)) || !page_state_is(pg, free) )
             continue;
 
-        scrub_one_page(pg);
+        scrub_one_page(pg, true);
     }
 }
 
@@ -2928,7 +2935,7 @@ void unprepare_staticmem_pages(struct pa
         if ( need_scrub )
         {
             /* TODO: asynchronous scrubbing for pages of static memory. */
-            scrub_one_page(pg);
+            scrub_one_page(pg, true);
         }
 
         pg[i].count_info |= PGC_static;
--- /dev/null
+++ b/xen/include/xen/scrub.h
@@ -0,0 +1,24 @@
+#ifndef __XEN_SCRUB_H__
+#define __XEN_SCRUB_H__
+
+#include <xen/const.h>
+
+/* SCRUB_PATTERN needs to be a repeating series of bytes. */
+#ifdef CONFIG_DEBUG
+# define SCRUB_PATTERN       _AC(0xc2c2c2c2c2c2c2c2,ULL)
+#else
+# define SCRUB_PATTERN       _AC(0,ULL)
+#endif
+#define SCRUB_BYTE_PATTERN   (SCRUB_PATTERN & 0xff)
+
+#endif /* __XEN_SCRUB_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */


