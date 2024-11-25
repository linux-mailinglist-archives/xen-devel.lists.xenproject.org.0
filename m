Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3F59D883C
	for <lists+xen-devel@lfdr.de>; Mon, 25 Nov 2024 15:41:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.842686.1258355 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFaGc-0007os-OK; Mon, 25 Nov 2024 14:40:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 842686.1258355; Mon, 25 Nov 2024 14:40:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tFaGc-0007mN-LV; Mon, 25 Nov 2024 14:40:46 +0000
Received: by outflank-mailman (input) for mailman id 842686;
 Mon, 25 Nov 2024 14:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mqqh=SU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tFa6h-0002BZ-Vu
 for xen-devel@lists.xenproject.org; Mon, 25 Nov 2024 14:30:31 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d1efdd90-ab39-11ef-a0cd-8be0dac302b0;
 Mon, 25 Nov 2024 15:30:29 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-382325b0508so2975238f8f.3
 for <xen-devel@lists.xenproject.org>; Mon, 25 Nov 2024 06:30:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fad5fa2sm10803070f8f.1.2024.11.25.06.30.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 06:30:28 -0800 (PST)
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
X-Inumbo-ID: d1efdd90-ab39-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmQiLCJoZWxvIjoibWFpbC13cjEteDQyZC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImQxZWZkZDkwLWFiMzktMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNTQ1MDI5LjcyNjY2NCwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1732545029; x=1733149829; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1/WL1L2329FGbKiM5mFrIl564uR7QFJdztoThD/xDoA=;
        b=Y384DTsQi02MUHEf4d1EZYGCGrNpdsrGfObIdtfBmtDty/DxgLYCLABCdlEi8X6df8
         DX4OfaqfD6GuPbbpzZFGtO+0X4YhJhHPH4p6MO5fs80PAaIwN2INYtA2lYc9yC1bXDmh
         gluQDM5DpThjHsF7FplvmBA2Ht2dmjulkWENi/2PzKPSEKJHHgPJEpPei4uxrkMVl3ey
         10SQEdtGij/Xv63W4E2GOEQuyfRwSU/lo5dbZaIsL9kJLIfFu9V5cc73RDMVyIO/ggw2
         HteAZFPDTDsn/a5q/GoXwlIc/jSMVO0E0i/mOUm6pTR5wiqU7i4zI6TvRxDJnymLQwQI
         Ockw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732545029; x=1733149829;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1/WL1L2329FGbKiM5mFrIl564uR7QFJdztoThD/xDoA=;
        b=KMwYGyU79mCaLXBZZgxp+rwHxkO465GhbNO0ML1ySYG1lpuyW2FHyx0JpPpP+zzq13
         k8YrrwwhtOP5yNASukjamfefWHP9QCvKveAD8TnK++NkfC4Gn0HrGfU4Dj9Ycnh+ZZPe
         i2SZ19j1wpH4zoGE8sTOPuCQMakTbgKPwC9BOPKcOB/88m/a3Y//bscNm45j+FteTzP1
         su03Xj6AaWdVyLj9WOPtc4sg66bvp/apW5KCgmnZSRQJfrPRsWpTsUZ/APBYl92LXmXS
         AkUQZG62hAWS/wYB9V9vnS/MVyKAy9a5ZC6zVpqXr+VCvvGiNXg1FLocaRZxwX8BJSZg
         wsIw==
X-Gm-Message-State: AOJu0YxxTXlqFp+Ae9Jmq5SKYiqPeRKEZ00nE2h9hxMqDXlPBiDnCJIF
	D07s5j5bzy6ayd16j2K8XJ+4bBVt49HmRY7wokMdMVsLMU0nXctBXWsiS/jWredoNWJuBAdrb4o
	=
X-Gm-Gg: ASbGnctxxKpLiFiKCJRm8rz9KsBq22X8GbmOHC2R53giMgvE4tsU/29YfbqOc4OqELS
	Dozsx4jup5Csm97gPG8Z08BncjQSZhyZCsecmKj9boWXMWotYl/qpFYyuJ1GcXmwFGDOnm0gwH2
	hTsPl3lyPt/fm6IP0Sjt19X+y/ip7Tc+E3YoT2KkoLZGtlktzPnAtTRTOYjfrHxcPpLXh2gC7vn
	utl/gjp//Z89+6TB1nNOZNp77gX2LH5Op/6/FhK2QNUyO4z/MTWjnJq3+Vpl4q307lZvS9buukv
	S/tIdtLlX9Kzvnz3u1Jep5LVVssVRmtzfCU=
X-Google-Smtp-Source: AGHT+IEP5xw4wZLAanWgtdLiNIYvsXKiTQDyHGAK04XDdEBs+h/JexWpmUCaXWJK0giEUVFMt7t1eQ==
X-Received: by 2002:a5d:59a2:0:b0:382:516e:271b with SMTP id ffacd0b85a97d-38260bfada9mr8904700f8f.58.1732545029096;
        Mon, 25 Nov 2024 06:30:29 -0800 (PST)
Message-ID: <f0307505-8260-4955-86f7-95bc6f31669f@suse.com>
Date: Mon, 25 Nov 2024 15:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 6/7] page-alloc: make scrub_one_page() static
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
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

Before starting to alter its properties, restrict the function's
visibility. The only external user is mem-paging, which we can
accommodate by different means.

Also move the function up in its source file, so we won't need to
forward-declare it. Constify its parameter at the same time.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v3: Re-base.
v2: New.

--- a/xen/arch/x86/mm/mem_paging.c
+++ b/xen/arch/x86/mm/mem_paging.c
@@ -304,9 +304,6 @@ static int evict(struct domain *d, gfn_t
     ret = p2m_set_entry(p2m, gfn, INVALID_MFN, PAGE_ORDER_4K,
                         p2m_ram_paged, a);
 
-    /* Clear content before returning the page to Xen */
-    scrub_one_page(page);
-
     /* Track number of paged gfns */
     atomic_inc(&d->paged_pages);
 
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -137,6 +137,7 @@
 #include <xen/sections.h>
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
+#include <xen/vm_event.h>
 
 #include <asm/flushtlb.h>
 #include <asm/page.h>
@@ -774,6 +775,21 @@ static void page_list_add_scrub(struct p
 #endif
 #define SCRUB_BYTE_PATTERN   (SCRUB_PATTERN & 0xff)
 
+static void scrub_one_page(const struct page_info *pg)
+{
+    if ( unlikely(pg->count_info & PGC_broken) )
+        return;
+
+#ifndef NDEBUG
+    /* Avoid callers relying on allocations returning zeroed pages. */
+    unmap_domain_page(memset(__map_domain_page(pg),
+                             SCRUB_BYTE_PATTERN, PAGE_SIZE));
+#else
+    /* For a production build, clear_page() is the fastest way to scrub. */
+    clear_domain_page(_mfn(page_to_mfn(pg)));
+#endif
+}
+
 static void poison_one_page(struct page_info *pg)
 {
 #ifdef CONFIG_SCRUB_DEBUG
@@ -2548,10 +2564,12 @@ void free_domheap_pages(struct page_info
             /*
              * Normally we expect a domain to clear pages before freeing them,
              * if it cares about the secrecy of their contents. However, after
-             * a domain has died we assume responsibility for erasure. We do
-             * scrub regardless if option scrub_domheap is set.
+             * a domain has died or if it has mem-paging enabled we assume
+             * responsibility for erasure. We do scrub regardless if option
+             * scrub_domheap is set.
              */
-            scrub = d->is_dying || scrub_debug || opt_scrub_domheap;
+            scrub = d->is_dying || mem_paging_enabled(d) ||
+                    scrub_debug || opt_scrub_domheap;
         }
         else
         {
@@ -2635,22 +2653,6 @@ static __init int cf_check pagealloc_key
 }
 __initcall(pagealloc_keyhandler_init);
 
-
-void scrub_one_page(struct page_info *pg)
-{
-    if ( unlikely(pg->count_info & PGC_broken) )
-        return;
-
-#ifndef NDEBUG
-    /* Avoid callers relying on allocations returning zeroed pages. */
-    unmap_domain_page(memset(__map_domain_page(pg),
-                             SCRUB_BYTE_PATTERN, PAGE_SIZE));
-#else
-    /* For a production build, clear_page() is the fastest way to scrub. */
-    clear_domain_page(_mfn(page_to_mfn(pg)));
-#endif
-}
-
 static void cf_check dump_heap(unsigned char key)
 {
     s_time_t      now = NOW();
--- a/xen/arch/x86/include/asm/mem_paging.h
+++ b/xen/arch/x86/include/asm/mem_paging.h
@@ -12,12 +12,6 @@
 
 int mem_paging_memop(XEN_GUEST_HANDLE_PARAM(xen_mem_paging_op_t) arg);
 
-#ifdef CONFIG_MEM_PAGING
-# define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
-#else
-# define mem_paging_enabled(d) false
-#endif
-
 #endif /*__ASM_X86_MEM_PAGING_H__ */
 
 /*
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -532,8 +532,6 @@ static inline unsigned int get_order_fro
     return order;
 }
 
-void scrub_one_page(struct page_info *pg);
-
 #ifndef arch_free_heap_page
 #define arch_free_heap_page(d, pg) \
     page_list_del(pg, page_to_list(d, pg))
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1203,6 +1203,12 @@ static always_inline bool is_iommu_enabl
     return evaluate_nospec(d->options & XEN_DOMCTL_CDF_iommu);
 }
 
+#ifdef CONFIG_MEM_PAGING
+# define mem_paging_enabled(d) vm_event_check_ring((d)->vm_event_paging)
+#else
+# define mem_paging_enabled(d) false
+#endif
+
 extern bool sched_smt_power_savings;
 extern bool sched_disable_smt_switching;
 


