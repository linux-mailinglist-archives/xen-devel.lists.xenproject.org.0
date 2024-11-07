Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF1C9C02A4
	for <lists+xen-devel@lfdr.de>; Thu,  7 Nov 2024 11:42:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.831646.1246984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8zxy-0006E3-Do; Thu, 07 Nov 2024 10:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 831646.1246984; Thu, 07 Nov 2024 10:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t8zxy-0006CZ-Af; Thu, 07 Nov 2024 10:42:18 +0000
Received: by outflank-mailman (input) for mailman id 831646;
 Thu, 07 Nov 2024 10:42:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t8zxw-0006CT-Qg
 for xen-devel@lists.xenproject.org; Thu, 07 Nov 2024 10:42:16 +0000
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [2a00:1450:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f308d045-9cf4-11ef-a0c6-8be0dac302b0;
 Thu, 07 Nov 2024 11:42:13 +0100 (CET)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37d43a9bc03so509315f8f.2
 for <xen-devel@lists.xenproject.org>; Thu, 07 Nov 2024 02:42:13 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381ed970f85sm1397254f8f.6.2024.11.07.02.42.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Nov 2024 02:42:12 -0800 (PST)
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
X-Inumbo-ID: f308d045-9cf4-11ef-a0c6-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo0MmMiLCJoZWxvIjoibWFpbC13cjEteDQyYy5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6ImYzMDhkMDQ1LTljZjQtMTFlZi1hMGM2LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwOTc2MTMzLjY5OTQzNiwic2VuZGVyIjoiamJldWxpY2hAc3VzZS5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730976133; x=1731580933; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Jw93W3c8JG9R3gtPFd3iHgWKOgS/EjdU9vPNN5QRmMM=;
        b=A2Ng2jAkRSf/2TBWQK4tCu7Nqhe3tW9dfxpS/VV7WtH2lpElCyrdkpACbi6u9b8GpA
         zh4uSTT4CVou8axgv1N4lKy0TC8cvouqWBXKzBhGVmHkz2xFtjaf9w1aL3htJWEB6kHy
         kPBf87ZU9Qe16f8GJ3SQXHeNeFE+fA/fwzZBh02djGYERs62EhA2c13gzDHivQeLqoHu
         h1lmaIIon9xnKCPZTYlu6B+WuNvNQJcFjLQAlS/G+WP+y6uyHy79FWaEqnUxkLZQx9f8
         Zg3jjBrqrSOVsG6VAvG72GcnpvvCCoar9KY/IKYCCB8O4byK215WaxPusWjU74lNdXxk
         f5qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730976133; x=1731580933;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw93W3c8JG9R3gtPFd3iHgWKOgS/EjdU9vPNN5QRmMM=;
        b=POkWXXqXAnGORU2jIiGAkG8nOxT0hm4VAa/cRlycuapY0LCtct4dQQr++eaBIDMrpb
         cb9Fep2sKs86tkp4wKUywBxMMPsoUHyTnM6qADHClMQ794yoWKnoWbBLRKwp1gDVlcpw
         KfS2J6UWZbtp5nSLRgD7YuidJPx42ak5gsrIQVLF4WRN51snfHofBOOcQ7BIHzyc+bFW
         z7JGdNcRZwLcsIWMypw/3AsDtmouFZ0GBd1UvlZtMxGy3y+fap0jIJrMLydl4lHBTkq/
         eON3L+8Ed8i91tnr+4neOnoRLJiUYc3AiRsE+DNHo1IBiCKwf3ZVtMr0Vdl8NIHeU9XE
         EwlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXR0k9zrMvHMeUQVF8rz0pZ8j7sTOhpbL6j7hP7BMMSUZVT1PiaFOyJubn/hUt3DdpmyFJGGNbImk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyDJNashXQBm07fB+v5lm2/fIDR0ZsEqbY6oXu7BbM/ohjxo0o8
	EYfAVGmGJ9nT+sTxtVDAZWHQpzsoZVUKx3jg+2uJG3grvI33j/g/RLVEa79FyQ==
X-Google-Smtp-Source: AGHT+IHDTyw4eRczkIBhdmDhcSHsDRcJL0nxl9jAox6/z1kwo7bYGQNcfXqer2izKi5YH9tOuO23yg==
X-Received: by 2002:a5d:64c5:0:b0:37d:37b2:385d with SMTP id ffacd0b85a97d-381c7a47416mr20178902f8f.12.1730976133064;
        Thu, 07 Nov 2024 02:42:13 -0800 (PST)
Message-ID: <85d6a128-965b-4f39-8d08-2b2084db65b4@suse.com>
Date: Thu, 7 Nov 2024 11:42:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86/mm: introduce helpers to detect super page
 alignment
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20241106122927.26461-1-roger.pau@citrix.com>
 <20241106122927.26461-2-roger.pau@citrix.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
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
In-Reply-To: <20241106122927.26461-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06.11.2024 13:29, Roger Pau Monne wrote:
> --- a/xen/arch/x86/include/asm/page.h
> +++ b/xen/arch/x86/include/asm/page.h
> @@ -200,6 +200,12 @@ static inline l4_pgentry_t l4e_from_paddr(paddr_t pa, unsigned int flags)
>  #define l4_table_offset(a)         \
>      (((a) >> L4_PAGETABLE_SHIFT) & (L4_PAGETABLE_ENTRIES - 1))
>  
> +/* Check if an address is aligned for a given slot level. */
> +#define SLOT_IS_ALIGNED(v, m, s) \
> +    IS_ALIGNED(PFN_DOWN(v) | mfn_x(m), (1UL << ((s) - PAGE_SHIFT)) - 1)

The check involving an address and an MFN, I think the comment would better
also reflect this. "Check if a (va,mfn) tuple is suitably aligned to be
mapped by a large page at a given page table level"?

As to the name of this helper macro - "SLOT" can mean about anything when
not further qualified. If the macro was local to ...

> +#define IS_L3E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L3_PAGETABLE_SHIFT)
> +#define IS_L2E_ALIGNED(v, m) SLOT_IS_ALIGNED(v, m, L2_PAGETABLE_SHIFT)
> +
>  /* Convert a pointer to a page-table entry into pagetable slot index. */
>  #define pgentry_ptr_to_slot(_p)    \
>      (((unsigned long)(_p) & ~PAGE_MASK) / sizeof(*(_p)))
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c

... this (sole) file using the derived ones, that might be acceptable. If
it's to remain in page.h, how about e.g. IS_LnE_ALIGNED()?

I further wonder whether it wouldn't be neater if just the level was passed
into the helper. Doing so wouldn't even require token concatenation (which
iirc both you and Andrew don't like in situations like this one), as the
mask can be calculated from just level and PAGETABLE_ORDER. At which point
it may even make sense to leave out the wrapper macros.

Jan

