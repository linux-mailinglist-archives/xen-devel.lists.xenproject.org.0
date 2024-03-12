Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D98E8791F8
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 11:27:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691739.1078008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzLd-0005ei-KP; Tue, 12 Mar 2024 10:27:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691739.1078008; Tue, 12 Mar 2024 10:27:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rjzLd-0005cw-HU; Tue, 12 Mar 2024 10:27:05 +0000
Received: by outflank-mailman (input) for mailman id 691739;
 Tue, 12 Mar 2024 10:27:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=88Ay=KS=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rjzLc-0005cq-MV
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 10:27:04 +0000
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [2a00:1450:4864:20::52b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10f48ede-e05b-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 11:27:02 +0100 (CET)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-56829f41f81so5929090a12.2
 for <xen-devel@lists.xenproject.org>; Tue, 12 Mar 2024 03:27:02 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 e20-20020a056402149400b00568229390f2sm3848964edv.70.2024.03.12.03.27.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Mar 2024 03:27:01 -0700 (PDT)
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
X-Inumbo-ID: 10f48ede-e05b-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710239222; x=1710844022; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QyyVWKQYvsrBwxAWlOdMNIERUxfrCBr902msAjkZoyE=;
        b=UgG4adGVT0j6UdhYfZAHPyl0AxdKkbaJXPnLbeo7WBEjBjD3LREiVx3ZdFOLiphIxr
         ZSVcTnpaf59UJxiIdp3NPZ9g04k3yZDngIoIO6qRSW0UPEos7YqT7faN6dR+VAio9G2U
         IPQ+SaSjSs2BMXuzatDN6RGM7mYE7B0wRwSNH5YFfl5UtVNmb/rJc1QYI3ouHSoOov/9
         0/u0ElDtxljhLT2a25dXTnrp8S1FnAVqb/JhrXro0zEjnS7a5p1KnhLHgMlYiGB7P9Iv
         spGgEF0y+VnJh5i88ejZStFLrGafC1GOpwn2B+K94vkJ1QFHeX6CkmurJxv5NlU1pMBZ
         uc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710239222; x=1710844022;
        h=content-transfer-encoding:autocrypt:content-language:cc:to:subject
         :from:user-agent:mime-version:date:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QyyVWKQYvsrBwxAWlOdMNIERUxfrCBr902msAjkZoyE=;
        b=WM0rB9IkiuxSec6Ble5hAS1ZcDbISIDuxDs9DCyNLZS7NotW2MQ4y2OLuG1kD8Mi7H
         Rx/Dz+VXmf2iUepWHVBt/Wl5tO0ZX3ntGiLWOqhyw5NRrpyCDy0jz7eQYyp22925KZau
         W7Zbu7nBedIYM3Wz1VwME4QeenYMiNGScyTTZAT1sfusH7/j5ySCRA/pVSPWdM/fLS6P
         6q1A0LmyjmTymFWj8jREhwA9bs4x+TbCgrEgUgjAfC3MyaZXsyhoWc+Dt3MSe30km7ws
         2H2PXU2kIYXahS3VpgMxEtp2ZmxXImDjO3hvbzsdtHqPkNHlMNmdUahEF0zuuHMbRc4N
         6glw==
X-Gm-Message-State: AOJu0YxpICkaAoOQoaggxPlB80ZvFyr6lROC8S+ApLdlc/oLetUuMpjJ
	N6+SucbFhB6AZramEbG+vilvFdvN2k7cZjaljnlMMh8p+dJZvGhJkgafRbl2AtMX5XCE5pu5Bak
	=
X-Google-Smtp-Source: AGHT+IG0Tzn0nErONZTRjvk4Jc/alLfKl3YZMvM2TgOr6agzJNzeTL7WOEouD3ZjP7DeWwQsh98z2w==
X-Received: by 2002:a50:d6c2:0:b0:568:1445:c32b with SMTP id l2-20020a50d6c2000000b005681445c32bmr5953612edj.25.1710239222225;
        Tue, 12 Mar 2024 03:27:02 -0700 (PDT)
Message-ID: <f7b82e17-8282-400b-a6c2-b74761bbd6ce@suse.com>
Date: Tue, 12 Mar 2024 11:27:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v2] x86+Arm: drop (rename) __virt_to_maddr() /
 __maddr_to_virt()
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

There's no use of them anymore except in the definitions of the non-
underscore-prefixed aliases.

On Arm convert the (renamed) inline function to a macro.

On x86 rename the inline functions, adjust the virt_to_maddr() #define,
and purge the maddr_to_virt() one, thus eliminating a bogus cast which
would have allowed the passing of a pointer type variable into
maddr_to_virt() to go silently.

No functional change intended.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
v2: Avoid aliasing macro on Arm.

--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -256,12 +256,10 @@ static inline void __iomem *ioremap_wc(p
 /* Page-align address and convert to frame number format */
 #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
 
-static inline paddr_t __virt_to_maddr(vaddr_t va)
-{
-    uint64_t par = va_to_par(va);
-    return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
-}
-#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
+#define virt_to_maddr(va) ({                                        \
+    vaddr_t va_ = (vaddr_t)(va);                                    \
+    (va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK); \
+})
 
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
@@ -269,8 +269,6 @@ void copy_page_sse2(void *to, const void
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

