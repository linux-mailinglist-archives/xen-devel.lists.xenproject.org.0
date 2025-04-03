Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E229DA79E5E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 10:42:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936346.1337617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0G8u-0000C5-4W; Thu, 03 Apr 2025 08:41:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936346.1337617; Thu, 03 Apr 2025 08:41:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0G8u-000091-1Z; Thu, 03 Apr 2025 08:41:44 +0000
Received: by outflank-mailman (input) for mailman id 936346;
 Thu, 03 Apr 2025 08:41:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lWYu=WV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u0G8t-00008v-06
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 08:41:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75c48301-1067-11f0-9ffb-bf95429c2676;
 Thu, 03 Apr 2025 10:41:39 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so3108065e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 03 Apr 2025 01:41:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1795243sm15067915e9.32.2025.04.03.01.41.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Apr 2025 01:41:39 -0700 (PDT)
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
X-Inumbo-ID: 75c48301-1067-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743669699; x=1744274499; darn=lists.xenproject.org;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4dc4gJDbEWPz2Yducl+vIXVnvrP64klwYDevu5ZqWx0=;
        b=Ll0IpMcc32RKoQWQ5WG5ovTE+5ROYPqtPrkYczBgs9R4mywwEr4ShXlY/0NW1+brqt
         hYdsr/p2bbtWHabATEZiVtTLFuloZkSbBpIzCFlRF4zE/z8yAGqGxJsDEHqiCr5gSBzL
         +Y0/WXKJlywOW+i67A0slzicRz87zFhZHY9BeamdQKCQptqEbs/O/wo1OF+UeN0CrsTh
         E0zhJlJeWaXTLlAsDcPZSMQvtr2fJ/sl0G8pdVP2UWNsuBK8dRu0b+MRRYM2helUNhj2
         nWlktk7GPE8QughcDefB6If5fzMiinZ9VNQqocXXScyrsPFGSbDKEH0S2BQhhSPXhDKQ
         YnGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743669699; x=1744274499;
        h=content-transfer-encoding:autocrypt:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dc4gJDbEWPz2Yducl+vIXVnvrP64klwYDevu5ZqWx0=;
        b=qr5uZiVFAL5BfYrPHIZNx2gmVGZV9Ff2RICeRuktLN4i2KbFg4RdQgqJAxZUy5szoZ
         NDc61E7+WkJigJ2ckLKrqTecGb8UwwgI+y0D1A4wHmpURu5b5RrOx2ADaX7yYcqOezKm
         EpcrELIQVZpaNBu/E12u8YdAUutsVMv0iaspJH46AjMW6kLq48a8MVWzDrpf3+dqmDVN
         sGWLvHQTlw4zjbR82MvZAC/j3ml1x0tWfbJM0OkQrc4WKZRK7Cel/vxEp7VSZCZsIevQ
         wWjn/Gbug0MQ/cuxjWAQTrydk5GQNpA80/viH39l7VHJtidA3ExLcjHgS4e0Fx3LTEOs
         c9eg==
X-Gm-Message-State: AOJu0Yy2ots+tCD0SMe2+MYc0uhs5uLzdjRKAazyW5rzaNjBkRrKBg2d
	dG5IXWS0u+a6Qz3x2GnjTX11fWArMnh7wzm36w+kgzzGjvfW8fDuq+pK+c9jnpULhv7sw84ONBg
	=
X-Gm-Gg: ASbGnculfHlfiAilIL7WQ1fWw3Z4zGqhYv5N1wprDRhBphFU8+RyHTEYQusMpmaygmu
	qrgCmaN1a2VzZKI9nfxK5sfYM9GS4ku5rroXsD5cLxmMofYGqvJ0Wc8RrBGNugfLVx1t5hhb2OU
	D00Xb3wjNUOJEpOXyx2+JZTfrv7Ck7DwS/yjoDwnI2acqnFJ3D4354+g6oQ3KwSXcNmXWAezdjx
	/95atqo93UeMOHFRiau058FbR4D0chaFxfimQse0japvnNugG+yKcFDBCNt1l6Tokqr8WgS2hhb
	+66d3gIOs1LvwqnDyzHbQcSR2bAYnKJTwAol00mteAndfW0xKdwxNracqJlc8vg6QQkFz3k6e6N
	L4U54vDVJ6CMu5BFMhSKC/t2rAkDkjggzzL/LliVy
X-Google-Smtp-Source: AGHT+IFun5LY3PXmDOeiFCS7y+E+YGSlufpMSSVE9fUCRWbf+XF3n1jm6+yQCJe4VCi1UZNSv3G+jw==
X-Received: by 2002:a05:600c:5124:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43eb5c95c04mr39695195e9.28.1743669699493;
        Thu, 03 Apr 2025 01:41:39 -0700 (PDT)
Message-ID: <5a261173-d225-44fc-9078-4030ba11cfd8@suse.com>
Date: Thu, 3 Apr 2025 10:41:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] x86/mem-sharing: short-circuit p2m_is_shared() when
 MEM_SHARING=n
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

Some of the uses of dom_cow aren't easily DCE-able (without extra
#ifdef-ary), and hence it being constantly NULL when MEM_SHARING=n
misguides Coverity into thinking that there may be a NULL deref in

        if ( p2m_is_shared(t) )
            d = dom_cow;

        if ( get_page(page, d) )
            return page;

(in get_page_from_mfn_and_type()). Help the situation by making
p2m_is_shared() be compile-time false when MEM_SHARING=n, thus also
permitting the compiler to DCE some other code.

Note that p2m_is_sharable() isn't used outside of mem_sharing.c, and
hence P2M_SHARABLE_TYPES can simply be left undefined when
MEM_SHARING=n.

Coverity ID: 1645573
Fixes: 79d91e178a1a ("dom_cow is needed for mem-sharing only")
Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
Might be nice to also eliminate p2m_ram_shared (and for MEM_PAGING=n
also the three paging types) entirely from such builds, to eliminate the
risk of accidental use. Yet that would apparently also come at the price
of more #ifdef-ary. Opinions?

--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -136,11 +136,16 @@ typedef unsigned int p2m_query_t;
 #endif
 
 /* Shared types */
+#ifdef CONFIG_MEM_SHARING
 /* XXX: Sharable types could include p2m_ram_ro too, but we would need to
  * reinit the type correctly after fault */
 #define P2M_SHARABLE_TYPES (p2m_to_mask(p2m_ram_rw) \
                             | p2m_to_mask(p2m_ram_logdirty) )
 #define P2M_SHARED_TYPES   (p2m_to_mask(p2m_ram_shared))
+#else
+/* P2M_SHARABLE_TYPES deliberately not provided. */
+#define P2M_SHARED_TYPES 0
+#endif
 
 /* Types established/cleaned up via special accessors. */
 #define P2M_SPECIAL_TYPES (P2M_GRANT_TYPES | \

