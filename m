Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F23871844
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 09:34:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688633.1073043 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhQEs-0007vT-I8; Tue, 05 Mar 2024 08:33:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688633.1073043; Tue, 05 Mar 2024 08:33:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhQEs-0007tB-FY; Tue, 05 Mar 2024 08:33:30 +0000
Received: by outflank-mailman (input) for mailman id 688633;
 Tue, 05 Mar 2024 08:33:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhQEr-0007t5-8f
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 08:33:29 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0999745b-dacb-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 09:33:27 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a44665605f3so568422666b.2
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 00:33:27 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 pv18-20020a170907209200b00a44b90abb1dsm4127990ejb.110.2024.03.05.00.33.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 00:33:26 -0800 (PST)
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
X-Inumbo-ID: 0999745b-dacb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709627606; x=1710232406; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFMuQQVXEvQBi3w+KoeuqJ85gaYdYCISc5BsefqpMV0=;
        b=glhpi/giOepF8vsorulnU4whUim0j3PdRoPeAwjx7pb/awESflvDZ9OgxFjd2IbgN8
         yd1VQTw4JJtDCyJUM+BLMyD2KFHrIQZWTc7Jp5i8rK8YuB3oTY2fvIMVWuRWQpNkGi0Z
         sWleqEBxFFaGIXL5+pkskv6YgJuxeE1nnUSLB0N7r5V/idiQ6mDAqK2Rq87LGfqPH7fF
         IsqfzFX77fF9a5Yg8dGkZG49T0bxLhlXiXz0c2ZEQO8MSXVyR8q7uUjzcp4dmlVpQirL
         drSwqQWiWx1TjiBD4mqWhBsnjOBJMImy9x73Dh4W9NAXNhrM39ftE3Qfp3XLww91q2WV
         2YcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709627606; x=1710232406;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LFMuQQVXEvQBi3w+KoeuqJ85gaYdYCISc5BsefqpMV0=;
        b=CQ+p8hETX/89MIxpbtEsS5/6GXOSuUNyi/GcSIM5lFuaNfIKLu8oh7bnCt6OV8YZN0
         V9iM7Y9+BaMMxWjvQyTHguPrTMz/u908nKIjkwEDECQ53lBhxwT6gqOLNE/tTXnE+aUT
         2gXn3nMKHOWd5sVx7eeEPLjFhij4mePf47rcRkLXfAwIRVs0cBh0wEv7P2P+AU/p2ItB
         KuU0XYZnDDYlJY6Of9DYaPwRVMXXWt43CuCC5GtUOeVIHRh3etYyElrRqwovZbtUjYLW
         2SCdfFcyTxeD2fFkm2LFK77YOpsdywRwHybob0tr+DXnPpiq/0NYOFbK+mD+doZCatZ3
         R0uQ==
X-Gm-Message-State: AOJu0YzdujA391P6LURaxT95RFhuCSuOI+FjRXSStz0JN9MMgE8p1i3u
	6ay1gG+x0PduZE3DuVvixKo4eEB7WafMQXGqnbY90Cd1eadjXLRfkqbd+Le5ItK+R/FlT1uoNMw
	=
X-Google-Smtp-Source: AGHT+IHnBmNRf2j8z8HETjjGST44SUuYFu7KBmeSlr/pK0WP+xzztrNwkiGQW+XISuqbnHAjMeGx4w==
X-Received: by 2002:a17:906:1356:b0:a45:d6f:2c63 with SMTP id x22-20020a170906135600b00a450d6f2c63mr4323815ejb.22.1709627606438;
        Tue, 05 Mar 2024 00:33:26 -0800 (PST)
Message-ID: <b837e02d-fd65-458f-a946-ea36a52ddd3e@suse.com>
Date: Tue, 5 Mar 2024 09:33:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86+Arm: drop (rename) __virt_to_maddr() / __maddr_to_virt()
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

There's no use of them anymore except in the definitions of the non-
underscore-prefixed aliases. Rename the inline functions, adjust the
virt_to_maddr() #define-e, and purge the (x86-only) maddr_to_virt() one,
thus eliminating a bogus cast which would have allowed the passing of a
pointer type variable into maddr_to_virt() to go silently.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -256,12 +256,12 @@ static inline void __iomem *ioremap_wc(p
 /* Page-align address and convert to frame number format */
 #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
 
-static inline paddr_t __virt_to_maddr(vaddr_t va)
+static inline paddr_t virt_to_maddr(vaddr_t va)
 {
     uint64_t par = va_to_par(va);
     return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
 }
-#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
+#define virt_to_maddr(va) virt_to_maddr((vaddr_t)(va))
 
 #ifdef CONFIG_ARM_32
 /**
--- a/xen/arch/x86/hvm/nestedhvm.c
+++ b/xen/arch/x86/hvm/nestedhvm.c
@@ -125,7 +125,7 @@ static int __init cf_check nestedhvm_set
     /* shadow_io_bitmaps can't be declared static because
      *   they must fulfill hw requirements (page aligned section)
      *   and doing so triggers the ASSERT(va >= XEN_VIRT_START)
-     *   in __virt_to_maddr()
+     *   in virt_to_maddr()
      *
      * So as a compromise pre-allocate them when xen boots.
      * This function must be called from within start_xen() when
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -269,8 +269,6 @@ void scrub_page_cold(void *);
 #define mfn_valid(mfn)      __mfn_valid(mfn_x(mfn))
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
-#define virt_to_maddr(va)   __virt_to_maddr((unsigned long)(va))
-#define maddr_to_virt(ma)   __maddr_to_virt((unsigned long)(ma))
 #define maddr_to_page(ma)   __maddr_to_page(ma)
 #define page_to_maddr(pg)   __page_to_maddr(pg)
 #define virt_to_page(va)    __virt_to_page(va)
--- a/xen/arch/x86/include/asm/x86_64/page.h
+++ b/xen/arch/x86/include/asm/x86_64/page.h
@@ -34,7 +34,7 @@ static inline unsigned long canonicalise
 #define pdx_to_virt(pdx) ((void *)(DIRECTMAP_VIRT_START + \
                                    ((unsigned long)(pdx) << PAGE_SHIFT)))
 
-static inline unsigned long __virt_to_maddr(unsigned long va)
+static inline unsigned long virt_to_maddr(unsigned long va)
 {
     ASSERT(va < DIRECTMAP_VIRT_END);
     if ( va >= DIRECTMAP_VIRT_START )
@@ -47,8 +47,9 @@ static inline unsigned long __virt_to_ma
 
     return xen_phys_start + va - XEN_VIRT_START;
 }
+#define virt_to_maddr(va) virt_to_maddr((unsigned long)(va))
 
-static inline void *__maddr_to_virt(unsigned long ma)
+static inline void *maddr_to_virt(unsigned long ma)
 {
     /* Offset in the direct map, accounting for pdx compression */
     unsigned long va_offset = maddr_to_directmapoff(ma);

