Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BFEB25F06
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:37:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081094.1441218 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTSA-0001Qy-S0; Thu, 14 Aug 2025 08:36:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081094.1441218; Thu, 14 Aug 2025 08:36:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTSA-0001PX-Ns; Thu, 14 Aug 2025 08:36:54 +0000
Received: by outflank-mailman (input) for mailman id 1081094;
 Thu, 14 Aug 2025 08:36:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umTS8-0001PR-Pj
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:36:52 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3202c35-78e9-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 10:36:51 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-afcb78c77ebso109714866b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 01:36:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21b0d0sm2509934366b.107.2025.08.14.01.36.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 01:36:50 -0700 (PDT)
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
X-Inumbo-ID: d3202c35-78e9-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755160611; x=1755765411; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=LzKul1nFWAlPgzX/TWwKk7/A5Owya3TsOJVQ7n2txBA=;
        b=MYLWdtjHBzCyxeYI2YxoLZu/rjGP5KyN99XdEx2mtjPq4HfIgWvZZBAuHFPeiYHI1R
         xlraGmUPf2B9M4rPb1t6z5vplbov+XTCa8IcxQPC0YjYwFF75LV76/UGtcPfL2ZjnBwp
         kquPI529uiMTME8rloNsWjFu+WxXY91munalUOwo8iJSyzUNpA78An0cZqC6XXsHdF5b
         EDou3fyCObtc/2EgGt/kv1wtDFhlBOgamSKYVwmmmbSs3eUYHMDAdoLW0doaii7Olk7I
         /bfgH3iSypsJ/DpNnMco4tU/vpjRIygUsNOukDS6cUtQbJUnmb0AjeAt9/i2vUFIG8Yn
         Gkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755160611; x=1755765411;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzKul1nFWAlPgzX/TWwKk7/A5Owya3TsOJVQ7n2txBA=;
        b=uTVMXfa5e1MTDINFXPiVPerA74E2LQqP3q8A957wE+cHdE5G2dQ+rmem5W53VFrhdS
         J5Gq7BQMSbHflCwe1M0jpgH5f7rfT89/GXJM3xIRotmPKlhSPy1CIARxMBa/Mev+mJZy
         KlOTnW/Um7dnkhlmaR2JPcXBc5TRzxCeTUHf5kLhh1zjlRKSX7Dsa31ggVJojuVtCf4X
         IrD//0MbVuippbKUnqdqAhmpN5a+0nFpi5NPGIcEK+/MPqMLsz8K9jHlnpzoxdCI5nfh
         HpOeWgsReIlMg26J6h9ochC6TvODhvVNVbKkpitR66jViXwlvnDK/i6iTSn0eSjXfnFm
         reNA==
X-Forwarded-Encrypted: i=1; AJvYcCU3BRiLiV6Y05DkFWhI8t3CtCM2N/6u6YvV5d88kuh1FoAdFQiD48d0zlH4Mur6t2c7EaIjsNdm8DA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxriZPgpIo+vlqW1Z3+SsWCIxykuRUMENwfk1U9StTC+dwc3wR8
	z9kGjC4HX6Qzb25RHm5FamDziyxk9v2ug1zheTrA2za+b7fZI41oDHBj7tEKnRv3Rg==
X-Gm-Gg: ASbGncvRM+EcRKfs2Q1BtXpZWODhRpzpmNKJ938YmfZP1vuLWx5HpjbzQZuyzjEc2pe
	ydpnUftPpRBeu3s0vHb1Kchaq1i+v0xf0c0+7WEitGClwt4Ciu98FLTTRUNiKODLyeIg2dtpG4j
	bYi7ZvDu/w37hXzEVqcsrJVKTs6IqN+hUOHSEJdxwZ5MG2Rdy63zZB42mIIs+QTh9Y0KQSitR8i
	L12e6Z3yv3FyiADYrzClPHiREPhbiLQngUqu0TooE8DwqwhkfptmwdNJyoKpSsXthOl3RnfeWMk
	74UCllOqatE6DO8c0QN8c7pR0XRSKkSSiNJMKQ79zNrupRtKkWCYorDQKKBjcxj22YHoJnm/CeT
	w8eOVMc+diIbrQfSznaJQnM0/GrvCt/7Pm4gV2aT8CdTER6BrdhnX0OBEYdwwpnyvrjixd0q7MJ
	FYkaYWaQI=
X-Google-Smtp-Source: AGHT+IG0QEufqhEm5gGtkegxNfvtz/uC4CBiAEEOWBnqqNHow4+8PHa4ofjGyG+lIgtsgZ2zAcATYA==
X-Received: by 2002:a17:907:1b0c:b0:af9:a4f6:d1a7 with SMTP id a640c23a62f3a-afcb98e1ad5mr198379866b.32.1755160610772;
        Thu, 14 Aug 2025 01:36:50 -0700 (PDT)
Message-ID: <06120b08-7ce8-4d03-b3cd-cbb22547eca3@suse.com>
Date: Thu, 14 Aug 2025 10:36:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] misra: allow conversion from unsigned long to
 function pointer
To: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Cc: Nicola Vetrini <nicola.vetrini@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8cbc9e6d881661d0d7a1055cbcef5a65e20522be.1755109168.git.dmytro_prokopchuk1@epam.com>
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
In-Reply-To: <8cbc9e6d881661d0d7a1055cbcef5a65e20522be.1755109168.git.dmytro_prokopchuk1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.08.2025 20:27, Dmytro Prokopchuk1 wrote:
> ...
> 
> from `vaddr_t' (that is `unsigned long') to `switch_ttbr_fn*' (that is `void(*)(unsigned long)')
> 
> Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
> ---
> This is just a RFC patch.
> The commit message is not important at this stage.
> 
> I am seeking comments regarding this case.
> 
> Thanks.
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl |  8 ++++++++
>  docs/misra/deviations.rst                        | 10 ++++++++++
>  docs/misra/rules.rst                             |  8 +++++++-
>  xen/arch/arm/arm64/mmu/mm.c                      |  2 ++
>  4 files changed, 27 insertions(+), 1 deletion(-)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index ebce1ceab9..f9fd6076b7 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -365,6 +365,14 @@ constant expressions are required.\""
>  }
>  -doc_end
>  
> +-doc_begin="The conversion from unsigned long to a function pointer does not lose any information, provided that the source type has enough bits to restore it."
> +-config=MC3A2.R11.1,casts+={safe,
> +  "from(type(canonical(builtin(unsigned long))))
> +   &&to(type(canonical(__function_pointer_types)))
> +   &&relation(definitely_preserves_value)"
> +}
> +-doc_end
> +
>  -doc_begin="The conversion from a function pointer to a boolean has a well-known semantics that do not lead to unexpected behaviour."
>  -config=MC3A2.R11.1,casts+={safe,
>    "from(type(canonical(__function_pointer_types)))
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 3c46a1e47a..27848602f6 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -348,6 +348,16 @@ Deviations related to MISRA C:2012 Rules:
>         to store it.
>       - Tagged as `safe` for ECLAIR.
>  
> +   * - R11.1
> +     - The conversion from unsigned long to a function pointer does not lose any
> +       information or violate type safety assumptions if the unsigned long type
> +       is guaranteed to be at least as large as a function pointer. This ensures
> +       that the function pointer address can be fully represented without
> +       truncation or corruption. Macro BUILD_BUG_ON can be integrated into the
> +       build system to confirm that 'sizeof(unsigned long) >= sizeof(void (*)())'
> +       on all target platforms.

If sizeof(unsigned long) > sizeof(void (*)()), there is loss of information.
Unless (not said here) the unsigned long value itself is the result of
converting a function pointer to unsigned long. Whether all of that together
can be properly expressed to Eclair I don't know. Hence, as Teddy already
suggested, == may want specifying instead.

> --- a/xen/arch/arm/arm64/mmu/mm.c
> +++ b/xen/arch/arm/arm64/mmu/mm.c
> @@ -150,6 +150,7 @@ void __init relocate_and_switch_ttbr(uint64_t ttbr)
>      vaddr_t id_addr = virt_to_maddr(relocate_xen);
>      relocate_xen_fn *fn = (relocate_xen_fn *)id_addr;
>      lpae_t pte;
> +    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
>  
>      /* Enable the identity mapping in the boot page tables */
>      update_identity_mapping(true);
> @@ -178,6 +179,7 @@ void __init switch_ttbr(uint64_t ttbr)
>      vaddr_t id_addr = virt_to_maddr(switch_ttbr_id);
>      switch_ttbr_fn *fn = (switch_ttbr_fn *)id_addr;
>      lpae_t pte;
> +    BUILD_BUG_ON(sizeof(unsigned long) < sizeof(fn));
>  
>      /* Enable the identity mapping in the boot page tables */
>      update_identity_mapping(true);

BUILD_BUG_ON() is a statement, not a declaration, and hence wants grouping
as such. Question is whether we indeed want to sprinkle such checks all
over the code base. (I expect the two cases here aren't all we have.)

Jan

