Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B06D6AA0655
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 10:55:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971697.1360030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9gjQ-00060M-Fx; Tue, 29 Apr 2025 08:54:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971697.1360030; Tue, 29 Apr 2025 08:54:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9gjQ-0005zd-DO; Tue, 29 Apr 2025 08:54:24 +0000
Received: by outflank-mailman (input) for mailman id 971697;
 Tue, 29 Apr 2025 08:54:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qXnC=XP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u9gjO-0005zX-Q0
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 08:54:22 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a948045-24d7-11f0-9eb4-5ba50f476ded;
 Tue, 29 Apr 2025 10:54:21 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-ac2a81e41e3so1026293266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 01:54:21 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ace6e41c91csm745504866b.37.2025.04.29.01.54.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Apr 2025 01:54:20 -0700 (PDT)
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
X-Inumbo-ID: 8a948045-24d7-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1745916860; x=1746521660; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZ2IEDCdQpVj/BnrH+neE7AO4mqlMQn3f43kpeF75LQ=;
        b=Eg7ddiPLfVtBqLwiD2fxCT0mLdjErlKotfoj3OiEVCgiq4Ov1EUB4o5MOoPumyCzpu
         8njGUoRyd1r8oAIj+0v2SUkCii0HpNmdFlXu+D2K7lun/PRSBuZDofWOVYfBRKIX+lOF
         40rXT+4o+UZybWoKYcfKHXo2u75wMWAbom3UNCT5cw4X1UGbYfg3wmoF58WBja8ZQ9N8
         9wy3zVxpQP15U75HRtzWekFGEoEYCxoNmJMrUhj0TVFc430tuu3HpHfv9zz+d4EU25ZF
         NflhzkbZ5K26Px2KUWMcKwSAS6EfrHTEpkN0M3H3wzWeMwfM/TOjs9WJlUgt1G2ZSZpE
         WIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745916860; x=1746521660;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rZ2IEDCdQpVj/BnrH+neE7AO4mqlMQn3f43kpeF75LQ=;
        b=R5I2Wi/KeVCcciwhfG77qHjSWnw/GvYCTw6jFzjIiY7F5awbrT8u4vdlvNIcGSA905
         k5WpyfJYDJEuUSoDRBfv5XkqGJE87yDD0Ezw+GWITQafh26b3n9R6rcuw9JfNG1SE5Eb
         gXNB5i6iBID+TD++MOZthrVxpPqE6grUq2GUXt7QiIkYSlS9+hipdm+xuvWKg/qBOIR1
         BM2MiDqPrpdFXCkc6QuLsNIrcsVyQEv9OsRD0AOzVHz3lSKDHpKfYaJNsM/OZu17eM02
         kjPdFquzxK5qBSboVePvqGTVgfep9q90/TPNx5aklGpe2KB+HRmtVP5M83Bvy9qs+Sd3
         XAOg==
X-Gm-Message-State: AOJu0YycA+vsu5CqMfNVsT/D9aQrVPW3nOtzeKCK939SZaMdX+8jBcAQ
	cdO0bp99kW72HhwKVXdWbTZV0ZAmH0VDNgB0/12xrKII16AtFaAwsW74/temqONd4j4dkiIK+Ng
	=
X-Gm-Gg: ASbGncvB6qOWClee5AbYdvZvC6vnhdMowXN/HNdAQxfPDk+tCfr9Jz2qUdAJhDFGtqy
	3+gpveND4mbiqj+ku4N6GaOn3fwDdI9g58M/S/Zq7RR00JQOrHXQwZ4IUmnDjNgEuufMFIuoPr3
	QTM0xFChe1t5Q3XbwlMqhgSMYC0GvUm4e8X93S97p+djcFQ7VWpl/rFkt9jHQZjPj/ay9R4Ugoj
	fdlmdFYSXr/k5dYP6x44FFctD+8mLRuxB1/cCj8TJFsJ4iThQV3jvcIuaVESsgs5YQ+mNSDF+mE
	WDMAh2mbm3pPeT2IoJ6b5pihB4f2acFFc7zA31vt5OVWyM3s1w2dVmggzp0NsxLbWemG7Q2nhWM
	LyryAvhiCy+fSYWaTm9ZpblwvXtLDEPS0ZOcj
X-Google-Smtp-Source: AGHT+IFIJOlHeQwhphjNY31OKcAvbVtk+A7qIzf/yw4TbN6ZkIr/kG8KKdkc18ZIzcMtMwZIMSCJiQ==
X-Received: by 2002:a17:907:3e9e:b0:aca:d54d:a1f8 with SMTP id a640c23a62f3a-acec8525c8emr220080666b.31.1745916860470;
        Tue, 29 Apr 2025 01:54:20 -0700 (PDT)
Message-ID: <09ac878a-fcbf-479a-9628-1cb08ff77a9e@suse.com>
Date: Tue, 29 Apr 2025 10:54:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86: drop underscore-prefixed {maddr,virt} <=> page
 conversion macros
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

Unlike the ones converting to/from frame numbers, these don't have type-
safe overrides, and they also can't gain any within our present type
system. Unsurprisingly we also don't have any uses of the underscore-
prefixed variants.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/arch/x86/include/asm/mm.h
+++ b/xen/arch/x86/include/asm/mm.h
@@ -342,7 +342,7 @@ void init_frametable(void);
 #define PDX_GROUP_SHIFT L2_PAGETABLE_SHIFT
 
 /* Convert between Xen-heap virtual addresses and page-info structures. */
-static inline struct page_info *__virt_to_page(const void *v)
+static inline struct page_info *virt_to_page(const void *v)
 {
     unsigned long va = (unsigned long)v;
 
@@ -355,7 +355,7 @@ static inline struct page_info *__virt_t
     return frame_table + ((va - DIRECTMAP_VIRT_START) >> PAGE_SHIFT);
 }
 
-static inline void *__page_to_virt(const struct page_info *pg)
+static inline void *page_to_virt(const struct page_info *pg)
 {
     ASSERT((unsigned long)pg - FRAMETABLE_VIRT_START < FRAMETABLE_SIZE);
     /*
--- a/xen/arch/x86/include/asm/page.h
+++ b/xen/arch/x86/include/asm/page.h
@@ -238,8 +238,8 @@ void scrub_page_cold(void *);
 #define page_to_mfn(pg)     pdx_to_mfn((unsigned long)((pg) - frame_table))
 
 /* Convert between machine addresses and page-info structures. */
-#define __maddr_to_page(ma) mfn_to_page(maddr_to_mfn(ma))
-#define __page_to_maddr(pg) mfn_to_maddr(page_to_mfn(pg))
+#define maddr_to_page(ma)   mfn_to_page(maddr_to_mfn(ma))
+#define page_to_maddr(pg)   mfn_to_maddr(page_to_mfn(pg))
 
 /* Convert between frame number and address formats.  */
 #define __pfn_to_paddr(pfn) ((paddr_t)(pfn) << PAGE_SHIFT)
@@ -256,10 +256,6 @@ void scrub_page_cold(void *);
 #define mfn_valid(mfn)      __mfn_valid(mfn_x(mfn))
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
-#define maddr_to_page(ma)   __maddr_to_page(ma)
-#define page_to_maddr(pg)   __page_to_maddr(pg)
-#define virt_to_page(va)    __virt_to_page(va)
-#define page_to_virt(pg)    __page_to_virt(pg)
 #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
 #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
 #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))

