Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5145CB1D4F8
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 11:38:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072725.1435702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujx4O-0002QE-SM; Thu, 07 Aug 2025 09:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072725.1435702; Thu, 07 Aug 2025 09:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujx4O-0002On-OW; Thu, 07 Aug 2025 09:37:56 +0000
Received: by outflank-mailman (input) for mailman id 1072725;
 Thu, 07 Aug 2025 09:37:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+2Ad=2T=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ujx4N-0002Og-KT
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 09:37:55 +0000
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [2a00:1450:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 311d5d4c-7372-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 11:37:53 +0200 (CEST)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-af934d7c932so115146166b.3
 for <xen-devel@lists.xenproject.org>; Thu, 07 Aug 2025 02:37:53 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af919e96050sm1270640466b.0.2025.08.07.02.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Aug 2025 02:37:52 -0700 (PDT)
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
X-Inumbo-ID: 311d5d4c-7372-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754559473; x=1755164273; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVGYb8WxwOhrbUuyWO0TPEotEzNdYOyXAOOWXxW+HPw=;
        b=TkMR32sorBW3pNrgb1zL0fMxDPU9U9bqqTNJBspx6wvzumt7Lj+jklL4K+6VXztehM
         BkupXJbwr2ndwUAZsl7CB7NkQiHnOZFrr1rLNBv7HCG9eZSlo2BoP8C3IHAjWIk+UUMu
         xG+A2wKVm0s2TAhWEqKwf06RcKWMFNK+C3Pl+B8QxfVkZ6v+LpGDSL+y19IOemUvbzOx
         Ql41DNyKPIMBJtcD+LAICHIGGsF8Hy/3/I4TF4Rh5qumGjarw4ZGcQC+NdguDQZFspRB
         SmGtkdamET7JQdSEHtXgdBPrcmPFRW0Kb3CTqh+47Xc6eacPc/nBzJJs4wuYdFm6i6DL
         2awA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754559473; x=1755164273;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kVGYb8WxwOhrbUuyWO0TPEotEzNdYOyXAOOWXxW+HPw=;
        b=NmX+YtEJcxt1kAvFLmaoW+9TkvfmisgeWr+9utOGVMgFE9xqplvj8/m2lg4YDxuzn/
         O1wLUWKKCCZLLDPbp4OVIShw+hEIHOSH/m893XTG0R+bp+mnRBsElXckubRKZVL1heit
         QfC5WLUgc30S6kfuPaMp7510m72xmX+shqqoxdfa20+6uf8rhP95ZOfIlT0gLmNrnFlN
         HjvlkC+Uw2vuBR6oti97QC11KvZGoTAmreTx02wQfnByqHbFq6QoJBvBXSgiXMGHjqXD
         GY0WXd4iuxzQgpxmcGuqd4ARCZiuf/IvFpCj5ZuAimcM3Q+hF3YwG6wGgZRY+cN70jb9
         9HKQ==
X-Gm-Message-State: AOJu0YyOTUs1Jf/+9grXqFfMx3RRSDPTSxltkVF7NF0XCvuLcyo+Qgla
	NB9Zj4ffctyXlvU3YaV72s7nkB4m5o0UZvWQj+XQ/q84Cm4afWzy1vD4j+gACGBgKVp8uyhe/Uk
	vyQA=
X-Gm-Gg: ASbGnctepcCBdzpWHHLiXMUxEIPk92PGMTYMauqoc0oOmeyjBoADYJZo1brYMyurteK
	8cgzTg6A5l7oMAPiUurYgEV1D9zGv6iKMB/zsUlEMAKo/eoedLRlYZM5VTN61JG1AQJncc21R9e
	XeGeEZ4HmgLiS0kFAz5gopi+w0oHfPCuVAfCuYaQzQmTbgMzgDwMgMgUWsgZOcnOrjOjN21XTTT
	rpBvC8jKzlUcdOeT96e6rbCg7uIAN6U4jI3eQ0TuTf6xcOpzov9h1rP/r9x6eUBY/40QtjoHZoO
	mTEeOj67ozacWvHYBgA7U+1npHQdF1oZdqTnml8D+Ed9k4kuPJFKEN6sJ6tFze4l6KXwo1foI0w
	Jt5kz0YKnoOOUhcBvJjH8KIW8co1kOB93zfa6Zqn2dSLAdBnFEBDKBZuFIY7QV9vpHYPk9xqnOA
	bmOPFaKYc=
X-Google-Smtp-Source: AGHT+IEIv8t+hS15/0pF0HgwyS0DPaENZITNiW/wSa4z7N6MUGA89EWS6uSfPcjAEc5IszNiZqOVVA==
X-Received: by 2002:a17:907:f812:b0:af9:a2a9:b5f8 with SMTP id a640c23a62f3a-af9a2a9b9b6mr288339266b.18.1754559472972;
        Thu, 07 Aug 2025 02:37:52 -0700 (PDT)
Message-ID: <cb3eea3a-bd7a-441b-8bd8-eeabad7ae52c@suse.com>
Date: Thu, 7 Aug 2025 11:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH RFC] x86/mm: split unmapping and marking-as-I/O in
 arch_init_memory()
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The unmapping part also wants to cover UNUSABLE regions, and it will now
be necessary for space outside the low 16Mb (wherever Xen is placed).

While there, limit the scopes of involved variables.

Fixes: e4dd91ea85a3 ("x86: Ensure RAM holes really are not mapped in Xen's ongoing 1:1 physmap")
Fixes: 7cd7f2f5e116 ("x86/boot: Remove the preconstructed low 16M superpage mappings")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Originally I had the unmap cover the entire range up to 4Gb, which made
this ACPI mapping issue more pronounced: Mappings done by
acpi_dmar_init(), erst_init(), and acpi_hest_init() may wrongly be
undone this way. Having limited things to the initial mapping range, the
risk of an overlap with some area which needs to remain mapped is lower,
but it's not gone.

As the excess mappings could, at least in principle, also cause other
issues (like mapping a range WB which must strictly be non-cachable), I
wonder whether we can actually get away with those excess mappings,
despite properly tearing them down in arch_init_memory() (directmap) and
__start_xen() (Xen image space). Options would appear to be to move
_end[] to a 2Mb aligned boundary (or at least extend the PT_LOAD segment
to end at the next 2Mb boundary), or to use 4k mappings for the tail
part of .bss. That would then also eliminate the remaining concern here.

Extending the PT_LOAD segment (in mkelf32) would apparently allow to do
away with the hackery introduced by 773ded42218d ("Move cpu0_stack out
of Xen text section and into BSS"), to "work around" a supposed linker
bug (which really was a bug in the linker script imo). The extra command
line argument then wouldn't be needed anymore.

--- a/xen/arch/x86/mm.c
+++ b/xen/arch/x86/mm.c
@@ -275,8 +275,6 @@ static void __init assign_io_page(struct
 
 void __init arch_init_memory(void)
 {
-    unsigned long i, pfn, rstart_pfn, rend_pfn, iostart_pfn, ioend_pfn;
-
     /*
      * Basic guest-accessible flags:
      *   PRESENT, R/W, USER, A/D, AVAIL[0,1,2], AVAIL_HIGH, NX (if available).
@@ -292,12 +290,55 @@ void __init arch_init_memory(void)
      * case the low 1MB.
      */
     BUG_ON(pvh_boot && trampoline_phys != 0x1000);
-    for ( i = 0; i < 0x100; i++ )
+    for ( unsigned int i = 0; i < MB(1) >> PAGE_SHIFT; i++ )
         assign_io_page(mfn_to_page(_mfn(i)));
 
-    /* Any areas not specified as RAM by the e820 map are considered I/O. */
-    for ( i = 0, pfn = 0; pfn < max_page; i++ )
+    /*
+     * Any areas not specified as RAM by the e820 map want to have no mappings.
+     * We may have established some by mapping more than necessary in head.S,
+     * due to the use of super-pages there.
+     */
+    for ( unsigned long i = 0, pfn = 0,
+                        rlimit_pfn = PFN_DOWN(PAGE_ALIGN_2M(__pa(_end)));
+          pfn < rlimit_pfn; i++ )
     {
+        unsigned long rstart_pfn, rend_pfn, start_pfn;
+
+        while ( i < e820.nr_map &&
+                e820.map[i].type != E820_RAM )
+            i++;
+
+        if ( i >= e820.nr_map )
+        {
+            /* No more RAM regions: Unmap right to upper boundary. */
+            rstart_pfn = rend_pfn = rlimit_pfn;
+        }
+        else
+        {
+            /* Unmap just up as far as next RAM region. */
+            rstart_pfn = min(rlimit_pfn, PFN_UP(e820.map[i].addr));
+            rend_pfn   = max(rstart_pfn,
+                             PFN_DOWN(e820.map[i].addr + e820.map[i].size));
+        }
+
+        /* NB: _start is already 2Mb-aligned. */
+        start_pfn = max(pfn, PFN_DOWN(__pa(_start)));
+        if ( start_pfn < rstart_pfn )
+            destroy_xen_mappings((unsigned long)mfn_to_virt(start_pfn),
+                                 (unsigned long)mfn_to_virt(rstart_pfn));
+
+        /* Skip the RAM region. */
+        pfn = rend_pfn;
+    }
+
+    /*
+     * Any areas not specified as RAM or UNUSABLE by the e820 map are
+     * considered I/O.
+     */
+    for ( unsigned long i = 0, pfn = 0; pfn < max_page; i++ )
+    {
+        unsigned long rstart_pfn, rend_pfn;
+
         while ( (i < e820.nr_map) &&
                 (e820.map[i].type != E820_RAM) &&
                 (e820.map[i].type != E820_UNUSABLE) )
@@ -317,17 +358,6 @@ void __init arch_init_memory(void)
                                PFN_DOWN(e820.map[i].addr + e820.map[i].size));
         }
 
-        /*
-         * Make sure any Xen mappings of RAM holes above 1MB are blown away.
-         * In particular this ensures that RAM holes are respected even in
-         * the statically-initialised 1-16MB mapping area.
-         */
-        iostart_pfn = max_t(unsigned long, pfn, 1UL << (20 - PAGE_SHIFT));
-        ioend_pfn = min(rstart_pfn, 16UL << (20 - PAGE_SHIFT));
-        if ( iostart_pfn < ioend_pfn )
-            destroy_xen_mappings((unsigned long)mfn_to_virt(iostart_pfn),
-                                 (unsigned long)mfn_to_virt(ioend_pfn));
-
         /* Mark as I/O up to next RAM region. */
         for ( ; pfn < rstart_pfn; pfn++ )
         {
@@ -365,6 +395,7 @@ void __init arch_init_memory(void)
                     const l3_pgentry_t *l3idle = map_l3t_from_l4e(
                             idle_pg_table[l4_table_offset(split_va)]);
                     l3_pgentry_t *l3tab = map_domain_page(l3mfn);
+                    unsigned int i;
 
                     for ( i = 0; i < l3_table_offset(split_va); ++i )
                         l3tab[i] = l3idle[i];

