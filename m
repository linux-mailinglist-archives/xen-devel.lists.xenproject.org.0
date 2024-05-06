Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D438BCDB9
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 14:22:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717606.1119985 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xM8-0002eu-ET; Mon, 06 May 2024 12:22:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717606.1119985; Mon, 06 May 2024 12:22:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3xM8-0002bu-9n; Mon, 06 May 2024 12:22:08 +0000
Received: by outflank-mailman (input) for mailman id 717606;
 Mon, 06 May 2024 12:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gbjR=MJ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1s3xM7-0002bo-H3
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 12:22:07 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 409c3f33-0ba3-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 14:22:06 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2db17e8767cso23237951fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 05:22:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c314b00b00418f72d9027sm19623521wmo.18.2024.05.06.05.22.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 May 2024 05:22:05 -0700 (PDT)
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
X-Inumbo-ID: 409c3f33-0ba3-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1714998126; x=1715602926; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bxo0c2JnSEh32fqZxBsLZSfN57DBcB8XaU4pEtQxhYI=;
        b=HfojG50/Rkw9T3NEU1wbd8jN8HRH3QcWwjVC33pDWP/jdu/tkIzt117Wd/v7ZEdhDL
         V0O7bPJ8mhot0/YH/1cMYGO9C7i2UZwiZIOO8yIsA5CTlLF4vu2ppgQNQAESaHWEDN/Z
         HTk2jmtlbnxOSo260MiFwUNhKyLjUoc6NqzJaLHwIItGLc40hVqzZ2FtItrOoo5wMBCs
         y7pHWOc+CW9XNZVL+W3ap/fNXPXHDeC0u9h7Yt6tEDlmbik4AK4A9fYB+z1Sr+VMO+8S
         9uIAs+LeoxjMWrafZ7Quh2pI3fogcxTiv6EHNotJx01EUEcbUopPWO3Lg9BTq4YrDuDF
         J98g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714998126; x=1715602926;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bxo0c2JnSEh32fqZxBsLZSfN57DBcB8XaU4pEtQxhYI=;
        b=srynDeYytfGiv95XhPCnIZh3zT+3jX27wU3K43r8TI/YM3LXuvdmTyKpCAVzatRIh3
         BG+Xjr8bvqZKQjIOcVrOBiJFaluOxmnU9n3jw0bKY0oV5UBWsPYdm+EXG1Rbk4nUXIju
         nuGSzszhIrifcJuwcjPD+lcK/CwJJAlDKgkYdLLHqW5aitHCwn78CBs2p8pwZVW2tz4f
         NcDYFNLhMLi2v0EzdxwjoJ+LAZfsC/Vxds19B7aB/6sic42UTutmjEoRZbJWkRAgVw4M
         1TITfHu85uKQ+Bf21lZjY2bVs8B81XkKChkJZ2H/21u+JrtCzsjVblih9tcFO8rmbZJ1
         sq6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUfwt45lhS0xY16ZyRdJCCB9V60VTIBcEcXakXkNaSaemUNe1iVJp47fHpugW9fY8rBfOXCFvacLijUFk++ui0yuV9nWvbllW5d+fZQh9Y=
X-Gm-Message-State: AOJu0YwcbrSvUaFz5JwDSOKC7MAefOfWg93V6oheQjtydWY7hp7l/nsI
	ySdYL9W2BZDP89dLg8NPzL+OCAUXZ3Sas/R0zKB9L8J/nF5TbRHmMo0hP9DCZg==
X-Google-Smtp-Source: AGHT+IHWCFIwLkDwGzs54+64v6fwBdW6o42d7rP4gg8wPh4kgwmzYg12fCeRwZcZkLqs5cp3zFVjIw==
X-Received: by 2002:a2e:bc02:0:b0:2d8:6054:a1bd with SMTP id b2-20020a2ebc02000000b002d86054a1bdmr8093495ljf.40.1714998125902;
        Mon, 06 May 2024 05:22:05 -0700 (PDT)
Message-ID: <674578c8-8243-40f6-ad90-28f9b76a42fd@suse.com>
Date: Mon, 6 May 2024 14:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 08/13] xen/page_alloc: introduce preserved page flags
 macro
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrea.bastoni@minervasys.tech, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
 <20240502165533.319988-9-carlo.nonato@minervasys.tech>
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
In-Reply-To: <20240502165533.319988-9-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.05.2024 18:55, Carlo Nonato wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -159,6 +159,7 @@
>  #endif
>  
>  #define PGC_no_buddy_merge PGC_static
> +#define PGC_preserved (PGC_extra | PGC_static)

Seeing this again and its use ...

> @@ -1426,11 +1427,11 @@ static bool mark_page_free(struct page_info *pg, mfn_t mfn)
>      {
>      case PGC_state_inuse:
>          BUG_ON(pg->count_info & PGC_broken);
> -        pg->count_info = PGC_state_free;
> +        pg->count_info = PGC_state_free | (pg->count_info & PGC_preserved);
>          break;
>  
>      case PGC_state_offlining:
> -        pg->count_info = (pg->count_info & PGC_broken) |
> +        pg->count_info = (pg->count_info & (PGC_broken | PGC_preserved)) |
>                           PGC_state_offlined;
>          pg_offlined = true;
>          break;

... here: Shouldn't PGC_broken also be included in PGC_preserved?

> @@ -2484,6 +2485,11 @@ struct page_info *alloc_domheap_pages(
>          }
>          if ( assign_page(pg, order, d, memflags) )
>          {
> +            unsigned long i;
> +
> +            for ( i = 0; i < (1UL << order); i++ )
> +                pg[i].count_info &= ~PGC_extra;

For larger order this loop is non-trivial and may have a fair effect on
caches. Looking at the code just outside of upper patch context, is this
loop needed at all when MEMF_no_refcount is clear in memflags?

Jan

