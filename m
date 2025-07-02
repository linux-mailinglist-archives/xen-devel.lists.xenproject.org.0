Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E170CAF155F
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 14:19:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031036.1404730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwR5-0002y6-JL; Wed, 02 Jul 2025 12:19:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031036.1404730; Wed, 02 Jul 2025 12:19:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWwR5-0002vd-GR; Wed, 02 Jul 2025 12:19:35 +0000
Received: by outflank-mailman (input) for mailman id 1031036;
 Wed, 02 Jul 2025 12:19:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FQsZ=ZP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWwR4-0002vT-Ir
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 12:19:34 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfcbbb5d-573e-11f0-a313-13f23c93f187;
 Wed, 02 Jul 2025 14:19:33 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so4122075f8f.3
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 05:19:33 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb3c3985sm129064455ad.209.2025.07.02.05.19.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 05:19:32 -0700 (PDT)
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
X-Inumbo-ID: cfcbbb5d-573e-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751458773; x=1752063573; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=RrahAouvwtmbuX3ET80MXFLODL8AuIbd/jGTYB0L7n8=;
        b=NV/5pySqoJ5dUI0U9IBi+AnebXMA2Wmihy2Sqwk6IBGwd5MVPCfmPwiAGrbuR6SEL+
         q5X624LJfuEAP5qOSPY56cL3DsCnzVa0MNJh7lO15HfkdYf0hl01Rx5VDnKvg6zwx1g4
         bwi3bOY5DeZ2k4DzoVomrI55ugmrlOFkf/lqZ0pqH0Lw5hSnKCxNmoEWmPueIm/yACUU
         V7npSuMS1fBw9M6p5w2NJbY3A3QnoXaPGrxpxYAukY0A+LC+8b8KiZ1nytaIxJT7qAcT
         3rMmxffTvC/V0rw14ImMAN6JCuj2SLrMneEvXmxyfGdFBdGn0e7Dr0sSusdNGDf8ZqrW
         fTLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751458773; x=1752063573;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrahAouvwtmbuX3ET80MXFLODL8AuIbd/jGTYB0L7n8=;
        b=C3kpQcn+3XJH2UcumxApVhykadPm8hptbuiPUQKLa5KTBLsKdGKRI+QT6HK/ntPd71
         xUso0yGvdqbiRGPJ79T8ff34/DTNVTJ8XYfHPvBBy3qYvBxhq8kx4uArWdawSNnN+6d4
         WSxpSNGCqJafebgQS8L/mvAxFjh2QTaa8tDrrvjMTBYF8f+ZnbIlqPQ99NLxXmw8Ban6
         Jat6cIdJ+dWIXucod9C+75xhZ5ZeTeudicHbu/wLK1a+YIFhPZZ3BTkn/hMxTb5MAjzo
         FT+uYvnjGNnGfiF6psTeoECS7Cg6IJe90jMncCQhBCH2vh9/88DjLr4DCu+eGdg8N/+1
         VS+A==
X-Gm-Message-State: AOJu0YxWuxGi1zvXoW21tCWPQpS9DYt6VGD3jrfE5z7krmfZ3LZcc+Jj
	VYqe3n/K8RRqg0Kn+HALJAXr9hC3DVMBSvjISkKzE+fcxHV36XKxnSoZtRA8llO71qrXmZi12lv
	W5HI=
X-Gm-Gg: ASbGnctidtv9yaq8WqnMnVrY+Zxx/S+zeHpAgKKKDNx6WrN2WQNaYv1wgJTBcMeC0ob
	JyOr7I5B9ozjtr4xEWKQ/YXIMr7jwCoC16ufji40Fbn+H92AIozpGZcFJk+08P45D+6sXtqh7mr
	PZaf38yoJP8/6o4EuYNDQjmM3HTEUizuJ0rxWMdFsXiM8vAWoO936Yajy91Z/CuFEh+piTr9o4Q
	9y5SR0cP+0B+7uVWxa/Znp720wAvUYV4s45SjcMmeOHWMT+yWHZrFL86WKOrzyJeYQTh0vsJjI9
	8+6SV4QWMavV4ZzB5tM+GcqdPwMgXmWB8wJIQtgfpCcUyrxkASNBdAq5GieDV0c3jcLCB1r2zEj
	kfWTN+Osb41nhEwl3I+A9YZRUl0xHLtJuPUYRn9sNK4fDEXY=
X-Google-Smtp-Source: AGHT+IH7rozcdz17kb3Xn1PW5bFFhPLyNnKxaYok9nFakiHgjkLbRkRM6Ym/ThwdGFkChIzA5tYTGw==
X-Received: by 2002:a5d:64c4:0:b0:3a4:e502:81e1 with SMTP id ffacd0b85a97d-3b2018c241bmr2165129f8f.52.1751458772834;
        Wed, 02 Jul 2025 05:19:32 -0700 (PDT)
Message-ID: <fb8ddf1b-84de-4bf4-9856-e2e2ace39821@suse.com>
Date: Wed, 2 Jul 2025 14:19:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v7 7/7] mm: allow page scrubbing routine(s) to be arch
 controlled
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
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
In-Reply-To: <0b57c6f0-9fd0-4f8a-93f8-dc494a1e952c@suse.com>
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
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
v7: ret -> RET. Underscore -> dash in new file's name.
v6: Re-base.
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
@@ -188,6 +188,12 @@ static inline void invalidate_icache(voi
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
@@ -185,6 +185,12 @@ static inline void invalidate_icache(voi
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
 #define copy_page(dp, sp) memcpy(dp, sp, PAGE_SIZE)
 
+#define clear_page_hot  clear_page
+#define clear_page_cold clear_page
+
+#define scrub_page_hot(page) memset(page, SCRUB_BYTE_PATTERN, PAGE_SIZE)
+#define scrub_page_cold      scrub_page_hot
+
 void flush_page_to_ram(unsigned long mfn, bool sync_icache);
 
 /* Write a pagetable entry. */
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -58,6 +58,7 @@ obj-y += pci.o
 obj-y += physdev.o
 obj-$(CONFIG_COMPAT) += x86_64/physdev.o
 obj-$(CONFIG_X86_PSR) += psr.o
+obj-bin-$(CONFIG_DEBUG) += scrub-page.o
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
+++ b/xen/arch/x86/scrub-page.S
@@ -0,0 +1,38 @@
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
+        RET
+END(scrub_page_cold)
+
+        .macro scrub_page_stosb
+        mov     $PAGE_SIZE, %ecx
+        mov     $SCRUB_BYTE_PATTERN, %eax
+        rep stosb
+        .endm
+
+        .macro scrub_page_stosq
+        mov     $PAGE_SIZE/8, %ecx
+        mov     $SCRUB_PATTERN, %rax
+        rep stosq
+        .endm
+
+FUNC(scrub_page_hot)
+        ALTERNATIVE scrub_page_stosq, scrub_page_stosb, X86_FEATURE_ERMS
+        RET
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
@@ -802,27 +803,31 @@ static void page_list_add_scrub(struct p
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
@@ -1102,12 +1107,14 @@ static struct page_info *alloc_heap_page
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
@@ -1372,7 +1379,7 @@ bool scrub_free_pages(void)
                 {
                     if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
                     {
-                        scrub_one_page(&pg[i]);
+                        scrub_one_page(&pg[i], true);
                         /*
                          * We can modify count_info without holding heap
                          * lock since we effectively locked this buddy by
@@ -2076,7 +2083,7 @@ static struct page_info *alloc_color_hea
     if ( !(memflags & MEMF_no_scrub) )
     {
         if ( need_scrub )
-            scrub_one_page(pg);
+            scrub_one_page(pg, d != current->domain);
         else
             check_one_page(pg);
     }
@@ -2227,7 +2234,7 @@ static void __init cf_check smp_scrub_he
         if ( !mfn_valid(_mfn(mfn)) || !page_state_is(pg, free) )
             continue;
 
-        scrub_one_page(pg);
+        scrub_one_page(pg, true);
     }
 }
 
@@ -2925,7 +2932,7 @@ void unprepare_staticmem_pages(struct pa
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


