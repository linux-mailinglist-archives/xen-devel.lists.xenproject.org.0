Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D62187BDBD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 14:31:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693228.1081061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklAq-0003Yp-Ep; Thu, 14 Mar 2024 13:31:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693228.1081061; Thu, 14 Mar 2024 13:31:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rklAq-0003Wv-Bd; Thu, 14 Mar 2024 13:31:08 +0000
Received: by outflank-mailman (input) for mailman id 693228;
 Thu, 14 Mar 2024 13:31:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=n3nm=KU=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rklAo-0003Wn-Bd
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 13:31:06 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ad7cc16-e207-11ee-afdd-a90da7624cb6;
 Thu, 14 Mar 2024 14:31:03 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a4644bde1d4so124861266b.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Mar 2024 06:31:03 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 h21-20020a17090619d500b00a46447348e8sm713003ejd.191.2024.03.14.06.31.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Mar 2024 06:31:02 -0700 (PDT)
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
X-Inumbo-ID: 1ad7cc16-e207-11ee-afdd-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1710423063; x=1711027863; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rbv8X/itk9iBg29io8nrJACg0Q3U8I3Ljwurfv0ChPI=;
        b=YTeYmhwrvs0/KVOHFluD/317+Wge2hgu5R4I972mZAzAdhuttl2sbxoO/7PRKk9KSh
         0AVE17tJ5lVgIlgQR/KBW8dfghAg1BFvzuqkzvTQFgNNx4wTMKyC1LRjyN+F+DueDetT
         v2C4ZCjpp+1RcawRd1TAJtSPHzaaai3FrJpXS3Tgc53CVf0ZpPrkMIfYKiPZwTEBirEb
         UJmj21/MGuhdv9fZVtST5GzdgmCR7tZN427Xskd1pfSQH/pMV2hvpqrMF5L/wj3ySRNr
         YMLonNL/+xEIp27uUDe1cAbrXGPK2koMLi48ZqXLwgsJxEAQ4w1IRlVfeeOlB9O7Xz/W
         knWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710423063; x=1711027863;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbv8X/itk9iBg29io8nrJACg0Q3U8I3Ljwurfv0ChPI=;
        b=r6AQoxWPAGRxvNxuG75XkrabTRL/Wwuhm0TfPecHS3znE5b7w0OayP3w9XM5m5Kjlt
         6MgG0FyVZQkVESi2VdWLuHbb8YxtbNbCJKERCDKeVlYdrPnNIKbvKNY2lteMZAk8sPAn
         2mOzyZufMmUPv6NHOa4BmIHzXPFEuF/pexlHRdn1rwi9j7FYQVC7Vw4/6tFpe3P8vF2K
         GBMi3+8AVT3AT8s8qxFIULFA22T3r4W5YuTXRsBjjpREd777UAhW5UEs+IivWNuKVotB
         DeaZff+UKPj/cWO6CfFLkQeH8B2AeqFgZQToITZCWYZ0D3X3V7yVWJO/I5aPM7tWxryv
         /NVg==
X-Forwarded-Encrypted: i=1; AJvYcCX3Z6C95tQ2VRSKFlhzevKra0sHF/KApJaX7RX/QN8m+xw7Mh+7PlL619im0alt8vWcoQ+qyBbHHkdcn+EZp62flwua9GcP6+LKlJSGOco=
X-Gm-Message-State: AOJu0YyQ6Us86Kzu6n8XNuAxA++64WG0xJpiSGJw4KOT5WPhKpJmUpn/
	tElyVPbp3+1D9dwJo330MSIdEVcEgiBR69UKXB3EMXiEYIFaomaJ32zCgbBlg+t0UPPPWkoTt/A
	=
X-Google-Smtp-Source: AGHT+IFChXVIOBetCKYvxYHiQFI/lc6ZU9XRA2+Bj53Tbj5K4HU0mIm7dRqmh7LegnTdKU78SxyrVA==
X-Received: by 2002:a17:906:ba8a:b0:a46:75ce:289 with SMTP id cu10-20020a170906ba8a00b00a4675ce0289mr1218010ejd.55.1710423063421;
        Thu, 14 Mar 2024 06:31:03 -0700 (PDT)
Message-ID: <12fe48a6-6957-49d7-adf5-1a3ac8b1bfaa@suse.com>
Date: Thu, 14 Mar 2024 14:31:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] x86/PVH: Support relocatable dom0 kernels
Content-Language: en-US
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20240313193021.241764-1-jason.andryuk@amd.com>
 <20240313193021.241764-4-jason.andryuk@amd.com>
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
In-Reply-To: <20240313193021.241764-4-jason.andryuk@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13.03.2024 20:30, Jason Andryuk wrote:
> --- a/xen/arch/x86/hvm/dom0_build.c
> +++ b/xen/arch/x86/hvm/dom0_build.c
> @@ -537,6 +537,108 @@ static paddr_t __init find_memory(
>      return INVALID_PADDR;
>  }
>  
> +static bool __init check_load_address(
> +    const struct domain *d, const struct elf_binary *elf)
> +{
> +    paddr_t kernel_start = (paddr_t)elf->dest_base & PAGE_MASK;
> +    paddr_t kernel_end = PAGE_ALIGN((paddr_t)elf->dest_base + elf->dest_size);

Both casts act on a pointer value. Such cannot legitimately be converted
to paddr_t; it only so happens that paddr_t is effectively the same as
uintptr_t right now. (Same issue again further down.) That said, I notice
we have pre-existing examples of this ...

> +/* Check the kernel load address, and adjust if necessary and possible. */
> +static bool __init check_and_adjust_load_address(
> +    const struct domain *d, struct elf_binary *elf, struct elf_dom_parms *parms)
> +{
> +    paddr_t reloc_base;
> +
> +    if ( check_load_address(d, elf) )
> +        return true;
> +
> +    if ( parms->phys_align == UNSET_ADDR )
> +    {
> +        printk("Address conflict and %pd kernel is not relocatable\n", d);
> +        return false;
> +    }
> +
> +    reloc_base = find_kernel_memory(d, elf, parms);
> +    if ( reloc_base == 0 )
> +    {
> +        printk("Failed find a load address for the kernel\n");
> +        return false;
> +    }
> +
> +    if ( opt_dom0_verbose )
> +        printk("Relocating kernel from [%lx, %lx] -> [%lx, %lx]\n",
> +               (paddr_t)elf->dest_base,
> +               (paddr_t)elf->dest_base + elf->dest_size,

By using %p you clearly can avoid the casts here.

> +               reloc_base, reloc_base + elf->dest_size);

I'm not convinced %lx is really appropriate for paddr_t.

Jan

