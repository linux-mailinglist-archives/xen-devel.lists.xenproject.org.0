Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A22AAB2064A
	for <lists+xen-devel@lfdr.de>; Mon, 11 Aug 2025 12:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1077296.1438366 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQ6l-0005mv-Uo; Mon, 11 Aug 2025 10:50:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1077296.1438366; Mon, 11 Aug 2025 10:50:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulQ6l-0005kR-Po; Mon, 11 Aug 2025 10:50:27 +0000
Received: by outflank-mailman (input) for mailman id 1077296;
 Mon, 11 Aug 2025 10:50:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ku41=2X=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ulQ6k-0005a8-9S
 for xen-devel@lists.xenproject.org; Mon, 11 Aug 2025 10:50:26 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc2ed450-76a0-11f0-a325-13f23c93f187;
 Mon, 11 Aug 2025 12:50:24 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-61530559887so6661329a12.1
 for <xen-devel@lists.xenproject.org>; Mon, 11 Aug 2025 03:50:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-615a8ff9ae5sm17911920a12.43.2025.08.11.03.50.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 03:50:23 -0700 (PDT)
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
X-Inumbo-ID: fc2ed450-76a0-11f0-a325-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754909424; x=1755514224; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=NNP7nFEccI8WBoRocVIQ5vYhIflCxYg5OB3S5qlC4j0=;
        b=SNgEFLv7XtAKkgCPBDBbxsUdEoJc9x6BMPtQskPHxnpySGDEeSa1kXWuwa0rx6MGik
         jz53cGDYM+sdmOj96HOpeAhQ/ehq/tbbCd3XXGZnOrYiTJWt2EoS+dfuYRvJezBQF3VK
         DR/0fn7NBIeExL/MWP2LkdVO0gsPTJzBJtfQQUuHEDfr4oJmsJaVlRASbNwTWJcY9CBD
         JcbskeZq7JiRcPiT7U6XQpC4VAj9K+4uKYhkJ6TMBdoRPNMuPmOvomLiJK/PSS62+cQd
         rOvqviaCmRpzw/CzOuY87sRE6yG5fz8I6WEojZAovvZgQs1OSlkv9SI/LcAM3MBqEL+F
         TnTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754909424; x=1755514224;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NNP7nFEccI8WBoRocVIQ5vYhIflCxYg5OB3S5qlC4j0=;
        b=JFFCkgu0ac3IcFHdzYF25asY1WeEu4ZlO2/dGcII5jO1Abq7okAZZPeOz/yuJxTC8Y
         t4hlw4WFzpG8Yrgtevb+2+WgPJ19784J2oX6jWFOyZATGIRm9uXScDkdEvdjlLIpmGzN
         l7lp9bLXJPY+lfpnOXJWF5Az7egpF2trpHEYuAsKnQ64WrSLvblf/xM07APG1+KIagn+
         I1V0IEyd2HHTahpdFoLjRQQ3BQ2RmzvtMNtK/xDqvBfXQ/fHG+HbnTUwbbUD5cOrhv6w
         v1XZuQkq/eBYy26zFF/VEtBkd/V5oO1wtWJYDfvaQuz0/tgWUS2OkbzHmgBqfh6iOy2q
         Kobw==
X-Gm-Message-State: AOJu0YxVVEDLHuu31Mi3A5xayT0KurJbxXI55UCC5U8cXyQlZ30PsyBU
	MmhAQiIkcBfDcyKmOEtAvZlg7GFThAI1giM3uK2TDprTPk+dlCtbpXiAeIScqj8T0Ka6XHEg+KX
	fk+g=
X-Gm-Gg: ASbGncu7kLAI0XwTVmUG4lQrnOppR858zHy4bc/jozuUAPSJWIsREsoyL+l3JKfgBbH
	5XOpNB5pYly56TNBptKhntZY1PXw+naKCZSqbKvqf0i2DzifgSdZpEyP8sP+ThP6EmxJthPRxpG
	v6WyEA8azC+cg9miWV8ZuleEnbH5jYIZrRJ0JC8blyDYMdxOm9AmDPaB6jVrlAWTo3fcpt3aQrx
	d4H69WapUYG84MTGcgfvB60KczYW02D9wVASIXGWeSXbfsxA/1xpPR/XCnc8BDIgbO6Mw5wNF/+
	4z34K3V5ulcusD6zV4/v49H++z3QS9EBP+qjg0+rKFymMgj3iwLw/QEwxTzHwN6RJ73KYQJRvlP
	WVVUIpp7cRI9E1NrUsz1rCSeFyZEqz+zf+Ye1GzQkRacFNF5HK3O4oxK+AqoHM+Q+m2yXQ7pXvl
	0px4ZRpOM=
X-Google-Smtp-Source: AGHT+IGzX4dx7d/KHV1d0qMMph5KvSflSYCtu7+99cMBUjVuyjE3Mr8n2aQNe/dZhuCR+ATvlFYa2Q==
X-Received: by 2002:a05:6402:1ec4:b0:615:87a6:58a7 with SMTP id 4fb4d7f45d1cf-617e2e9e45bmr12117531a12.33.1754909424149;
        Mon, 11 Aug 2025 03:50:24 -0700 (PDT)
Message-ID: <5a862787-40d8-4c9f-bd89-01d866648120@suse.com>
Date: Mon, 11 Aug 2025 12:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 2/2] x86/mm: drop unmapping from marking-as-I/O in
 arch_init_memory()
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
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
In-Reply-To: <ddfd86ad-19b3-495b-930c-1770dd92fa99@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

The unmapping part would have wanted to cover UNUSABLE regions as well,
and it would now have been necessary for space outside the low 16Mb
(wherever Xen is placed). However, with everything up to the next 2Mb
boundary now properly backed by RAM, we don't need to unmap anything
anymore: Space up to __2M_rwdata_end[] is properly reserved, whereas
space past that mark (up to the next 2Mb boundary) is ordinary RAM.

While there, limit the scopes of involved variables.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Drop unmapping code altogether.

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
@@ -292,12 +290,17 @@ void __init arch_init_memory(void)
      * case the low 1MB.
      */
     BUG_ON(pvh_boot && trampoline_phys != 0x1000);
-    for ( i = 0; i < 0x100; i++ )
+    for ( unsigned int i = 0; i < MB(1) >> PAGE_SHIFT; i++ )
         assign_io_page(mfn_to_page(_mfn(i)));
 
-    /* Any areas not specified as RAM by the e820 map are considered I/O. */
-    for ( i = 0, pfn = 0; pfn < max_page; i++ )
+    /*
+     * Any areas not specified as RAM or UNUSABLE by the e820 map are
+     * considered I/O.
+     */
+    for ( unsigned long i = 0, pfn = 0; pfn < max_page; i++ )
     {
+        unsigned long rstart_pfn, rend_pfn;
+
         while ( (i < e820.nr_map) &&
                 (e820.map[i].type != E820_RAM) &&
                 (e820.map[i].type != E820_UNUSABLE) )
@@ -317,17 +320,6 @@ void __init arch_init_memory(void)
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
@@ -365,6 +357,7 @@ void __init arch_init_memory(void)
                     const l3_pgentry_t *l3idle = map_l3t_from_l4e(
                             idle_pg_table[l4_table_offset(split_va)]);
                     l3_pgentry_t *l3tab = map_domain_page(l3mfn);
+                    unsigned int i;
 
                     for ( i = 0; i < l3_table_offset(split_va); ++i )
                         l3tab[i] = l3idle[i];


