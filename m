Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0629D8814
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 15:32:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842662.1258346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa8c-0005kw-V1; Mon, 25 Nov 2024 14:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842662.1258346; Mon, 25 Nov 2024 14:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFa8c-0005ik-Rn; Mon, 25 Nov 2024 14:32:30 +0000
Received: by outflank-mailman (input) for mailman id 842662;
 Mon, 25 Nov 2024 14:32:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFa8c-0005ie-7F
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 14:32:30 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 17451e63-ab3a-11ef-99a3-01e77a169b0f;
 Mon, 25 Nov 2024 15:32:26 +0100 (CET)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434a1833367so3718805e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 06:32:26 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434932dbc7esm78932905e9.37.2024.11.25.06.32.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 06:32:24 -0800 (PST)
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
X-Inumbo-ID: 17451e63-ab3a-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjozMmIiLCJoZWxvIjoibWFpbC13bTEteDMyYi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE3NDUxZTYzLWFiM2EtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMyNTQ1MTQ2LjA3MDcwNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732545145; x=1733149945; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=q3dfeu1CINxWaia0Kmp6+ReqAbfDxHiKGmjMUR9eVkU=;
        b=FCM2l/DQwvuoDW6aDoYeY26pvtoP7DsDgEMX+mryQn+7qu+H0U/kw3BdhhD6PmZRRx
         wUgkGvilthsZ/942t5/Vc6uHcsVewph66Iwg7/phKYGU5C9by82QivN8Jys/hOhzzQ95
         Cc/1Katoug3Kf2/wOfXMAj/qUzBdXUql8PU07fhjC8ZxHlWt8JW5muz8luAxVoKcDbW9
         qwEMhUCN9tOaXvk7hXILnVANRYU64HBtJ835s+VDK9xWZfIzzUoYMw/XhMG8TqTO4m3h
         ESYoze3egggDDiRQC7Zeq+7BdD6e+O8RGlFAd+Y+MaCDJv9bEgWSFi4t2z/Xuq8s3dcm
         M6TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545145; x=1733149945;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q3dfeu1CINxWaia0Kmp6+ReqAbfDxHiKGmjMUR9eVkU=;
        b=iSpQHfn72owrKIfrgXQupTX/W8cBHSgaom2O/wglPxXOy/YpEPZdj/t3zJcd8oVTed
         cBSR5T3yZN3l301E7p91mB6WKkM6WG5aLjfbdpKTd1IKx3XkRagNnFkSxNUqzW1vl6yH
         qVlZ6OWPCyjzmphZiD1RVlCUO3xcocT3dtMfdQGdvV2DkJYphQ46AwCfJJMZVJRULRDd
         eT2dtrqUe+KtpfA4FQvAtiUrqxOfsQR/u4Mwop9Tpn9rhqQAKFpj06p0WYRyPqCE6EKW
         h6g/3CWpJKSdo/1HhsXzfBYDjKERjND1JfhKt8lgykIRSXrdEeV89bzfK5esdnc/VDf9
         iDRQ==
X-Gm-Message-State: AOJu0YxGp+6P4sqKtPhpwo1AGuwveIRmyCQnCp//Qyt9kiaFbmdHB05x
	YgUUBPycHR0/ugOQjsdg/LUqsZKM0hDTO3zmbdYMQasey52au6ETLmsJTCRtV+I7SLN9JLH3AIw
	=
X-Gm-Gg: ASbGnctgoddRQ/GmF6mkY83hHUu1ohHcfPaSxQIXtzlTHRi6NUW0lHwnW4fLEoNzH5i
	R6YGw40fBKRi3u7VDaBmHI2jfMS9aYlTBfNv4iQwttkRAK6h/2iD9a6+IksKVlwOV6GYXHkuLt/
	BTUmED+Smoj8skznGxCbGFJdueKfoovbmryCZmPeDqIE8sWmmOSKfPOzLJb91SuXPVy4Q+wVr5O
	IBqf52n3q1+EswlCUWSOop3qf5VyoaO4F8TFDONGUqcOGanMuqEPbJeWl4vQbs05cHbhykC6r+b
	TWa00ZQBTD42MKJSWetdI1Y1Fyo3I3bU+7M=
X-Google-Smtp-Source: AGHT+IGQ9LvePiJOOWXSL7hKIUlIZvi7wl/hKr+3yGcjstEyQOOan4WbQMaxLph2Hw0aOyX5GFq8wQ==
X-Received: by 2002:a05:600c:3b27:b0:431:9340:77e0 with SMTP id 5b1f17b1804b1-433cdb0b3b6mr104045795e9.9.1732545145422;
        Mon, 25 Nov 2024 06:32:25 -0800 (PST)
Message-ID: <49b0a003-3fae-4908-ba63-a1c764293755@suse.com>
Date: Mon, 25 Nov 2024 15:32:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 7/7] mm: allow page scrubbing routine(s) to be arch
 controlled
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, Bobby Eshleman
 <bobbyeshleman@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
References: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
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
In-Reply-To: <e7314ac8-ed09-4da8-b915-09409b01fe77@suse.com>
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
---
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
@@ -156,6 +156,12 @@ static inline void invalidate_icache(voi
 #define clear_page(page) memset((void *)(page), 0, PAGE_SIZE)
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
@@ -134,6 +134,7 @@
 #include <xen/pfn.h>
 #include <xen/types.h>
 #include <xen/sched.h>
+#include <xen/scrub.h>
 #include <xen/sections.h>
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
@@ -767,27 +768,31 @@ static void page_list_add_scrub(struct p
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
@@ -1067,12 +1072,14 @@ static struct page_info *alloc_heap_page
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
@@ -1337,7 +1344,7 @@ bool scrub_free_pages(void)
                 {
                     if ( test_bit(_PGC_need_scrub, &pg[i].count_info) )
                     {
-                        scrub_one_page(&pg[i]);
+                        scrub_one_page(&pg[i], true);
                         /*
                          * We can modify count_info without holding heap
                          * lock since we effectively locked this buddy by
@@ -2042,7 +2049,7 @@ static void __init cf_check smp_scrub_he
         if ( !mfn_valid(_mfn(mfn)) || !page_state_is(pg, free) )
             continue;
 
-        scrub_one_page(pg);
+        scrub_one_page(pg, true);
     }
 }
 
@@ -2735,7 +2742,7 @@ void unprepare_staticmem_pages(struct pa
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


