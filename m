Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50E37B0DF44
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 16:46:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052791.1421567 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEFk-0001kQ-NS; Tue, 22 Jul 2025 14:46:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052791.1421567; Tue, 22 Jul 2025 14:46:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueEFk-0001hb-Kh; Tue, 22 Jul 2025 14:46:00 +0000
Received: by outflank-mailman (input) for mailman id 1052791;
 Tue, 22 Jul 2025 14:45:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=D6vH=2D=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ueEFj-0001hV-IZ
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 14:45:59 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92f92fb4-670a-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 16:45:56 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so3035872f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Jul 2025 07:45:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6b4c81sm77751025ad.114.2025.07.22.07.45.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jul 2025 07:45:55 -0700 (PDT)
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
X-Inumbo-ID: 92f92fb4-670a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753195556; x=1753800356; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=SYQvMmK05Da5UOZLWUI1SnDq76DuwITq0NZy2HilPVg=;
        b=Lls8cKX7ojbGamLoXn4QxEmdZ8lnM4Qg7xn8GuuNv+hNb7TTb81VfDBMG8liTJvu7T
         OeqLqxe3UyKn01/Jovklcbo/2b8pAT830dxmioKEObfAl9+/TCpQiTOGjqahgETkQtiU
         KFLPYe+589JOvPcx//1jerS2ln1ArlstbS2BML5ygqfdPG/FZ0rMdxWDePr/obWMt2a3
         jlC7cEAVhaEoXCF1USxtFnCB3uN3QxQqZtVm9PXbooc1aK4qiYWO0s/rxfBuDHtIxl5a
         XxRJyGVfQTCOF4Z/myTkRclm1b+uFSGGxA6vWfCkRN8vjiUzRgO0LbDxA3IzC8whmAwQ
         h6oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753195556; x=1753800356;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYQvMmK05Da5UOZLWUI1SnDq76DuwITq0NZy2HilPVg=;
        b=Vk2JqM3JHIZh3jT9LTn5fLnzF06oj/9242t3BA58QQkHd4QQuyKEmG9lSfILEB6HD0
         X2slx3Vmf3aM3PM/tTBT7BZNZdiM2t2VbYIPzDX5wfMuJzpXQYY4qP6262zDgY9gn+12
         4Saxu8hair2LweTC3tSvJ0ts1QpYvV/J9O79723Jg2+PVQykPdW6gYzMQHNcnbmlhEA6
         LYpQuE1DQUdZxul5ZW4TjwRASFStfGxLk6ypCJjugG1IyzjpCOskkPgLdQYWeokWiM92
         7lV4B5xTAUQOWmXwzZBx2AXUcj89QcpAtNIBQbnKmRQ8H7VNS4bUhnCgBIiRujQvOCXC
         giqA==
X-Forwarded-Encrypted: i=1; AJvYcCUt0HuyIJ030KZ038qx+aVYbJgjS5eieaMe3sd1dZItF6+r3217NE4RnB9X+eM3ej3lea5VjaR8ZV4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwaNPwJS1fuFQobUwpWXCL8aG4HDMIiJfKa4LBehKzBcoqsBEEf
	7aeK6aSB20FkBtjBdHxZ5RQmA/gkdKIcYQYeCTweZeG/GKjh2AIEPg8aMzVhyLQtHQ==
X-Gm-Gg: ASbGncuY6e2PorbK7H95avFbk0MR1/IPkYb4okgrE7fYiFJkCUsPGXhmouAR45ofjN+
	9hMHeaFB70hcBUPuMbrGInhZslSw+e+vBJCpnQAX0VpfPvE6oTi1C5Vu77MkYwimlmOBn8gNZgc
	zjCFKwlQMffgPEVM30aIPplcx32tK1py/X40uYJ74ppApQlclvqMZ/W9e9eLKybFnbE2gxgqdBN
	jI+1BZrM+aOaNUpgIPldrrXkoLp4BOzxCki1mobCbS1NoWGdEmtz/5ttCsxoc7JfORyOG4a3J7z
	4HZn1gDCDHGDVcTwwudga45qvBNLGXRH9S7Ov7X4N6kval07UkrunYuB2eTX+YK0Vsa+PCDRalR
	BDxGd5FDqU86+YHKndUh0qumFfVlt95svnX5c2yqiGjKHdD9X7FeOgJC5kXKenmC8qejFRX4a5L
	vOUKi98Ww=
X-Google-Smtp-Source: AGHT+IFmWh/VvyFrIoUvZMMrP60Ej4zSQGIcrLM+z8jD2TE17466Y5Y8qHBo2dMu3E9TUjpk93Rfpg==
X-Received: by 2002:adf:b650:0:b0:3b6:136d:55de with SMTP id ffacd0b85a97d-3b6136d55efmr12800095f8f.7.1753195555545;
        Tue, 22 Jul 2025 07:45:55 -0700 (PDT)
Message-ID: <4f3da0b5-d8f1-4f6a-b6b7-7febe46d1750@suse.com>
Date: Tue, 22 Jul 2025 16:45:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] x86: generalise vcpu0 creation for a domain
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Daniel P . Smith" <dpsmith@apertussolutions.com>,
 xen-devel@lists.xenproject.org
References: <20250717175128.462996-1-alejandro.garciavallejo@amd.com>
 <20250717175128.462996-3-alejandro.garciavallejo@amd.com>
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
In-Reply-To: <20250717175128.462996-3-alejandro.garciavallejo@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17.07.2025 19:51, Alejandro Vallejo wrote:
> Make alloc_dom0_vcpu0() viable as a general vcpu0 allocator. Keep
> behaviour on any hwdom/ctldom identical to that dom0 used to have, and
> make non-dom0 have auto node affinity.
> 
> Rename the function to alloc_dom_vcpu0() to reflect this change in
> scope, and move the prototype to asm/domain.h from xen/domain.h as it's
> only used in x86.

Which makes we wonder what's really x86-specific about it. Yes, the use of
...

> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -254,12 +254,16 @@ unsigned int __init dom0_max_vcpus(void)
>      return max_vcpus;
>  }
>  
> -struct vcpu *__init alloc_dom0_vcpu0(struct domain *dom0)
> +struct vcpu *__init alloc_dom_vcpu0(struct domain *d)
>  {
> -    dom0->node_affinity = dom0_nodes;
> -    dom0->auto_node_affinity = !dom0_nr_pxms;
> +    d->auto_node_affinity = true;
> +    if ( is_hardware_domain(d) || is_control_domain(d) )
> +    {
> +        d->node_affinity = dom0_nodes;
> +        d->auto_node_affinity = !dom0_nr_pxms;

... dom0_nr_pxms here perhaps is. Yet that could be sorted e.g. by making
this a function parameter.

> --- a/xen/arch/x86/include/asm/dom0_build.h
> +++ b/xen/arch/x86/include/asm/dom0_build.h
> @@ -23,6 +23,11 @@ unsigned long dom0_paging_pages(const struct domain *d,
>  void dom0_update_physmap(bool compat, unsigned long pfn,
>                           unsigned long mfn, unsigned long vphysmap_s);
>  
> +/* general domain construction */

Nit: Comment style.

> @@ -1054,9 +1055,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>      if ( IS_ERR(d) )
>          panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>  
> +    bd->d = d;
> +
>      init_dom0_cpuid_policy(d);
>  
> -    if ( alloc_dom0_vcpu0(d) == NULL )
> +    if ( alloc_dom_vcpu0(d) == NULL )
>          panic("Error creating %pdv0\n", d);
>  
>      cmdline_size = domain_cmdline_size(bi, bd);
> @@ -1093,7 +1096,6 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>          bd->cmdline = cmdline;
>      }
>  
> -    bd->d = d;
>      if ( construct_dom0(bd) != 0 )
>          panic("Could not construct domain 0\n");

Isn't this movement of the bd->d assignment entirely unrelated?

Jan

