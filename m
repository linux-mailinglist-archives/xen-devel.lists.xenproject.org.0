Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1B9AF6A02
	for <lists+xen-devel@lfdr.de>; Thu,  3 Jul 2025 08:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031746.1405510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXD3R-0003cA-Sv; Thu, 03 Jul 2025 06:04:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031746.1405510; Thu, 03 Jul 2025 06:04:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXD3R-0003Zr-PJ; Thu, 03 Jul 2025 06:04:17 +0000
Received: by outflank-mailman (input) for mailman id 1031746;
 Thu, 03 Jul 2025 06:04:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lE7m=ZQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uXD3P-0003Zl-RH
 for xen-devel@lists.xenproject.org; Thu, 03 Jul 2025 06:04:15 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b7678d6-57d3-11f0-b894-0df219b8e170;
 Thu, 03 Jul 2025 08:04:14 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3a5123c1533so2916508f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 23:04:14 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31a9cc673d1sm1373979a91.12.2025.07.02.23.04.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 23:04:12 -0700 (PDT)
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
X-Inumbo-ID: 8b7678d6-57d3-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751522653; x=1752127453; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9SchETd2Q5vZ+QFLDuDldJneiPa2FBdSkcKgyCrvWq4=;
        b=ZNeQ8aXQULJuwCaOnLF/+HD9ebg+/g7Pzosp1q07LMgb5e4Sr9YyXHVchKGxgBjDYR
         GV3UIaQOLE0yyQnQu3caXuWvPnU7C1NEB7fYNv3RdrL+4eUvuFw2eHDFhrCHUZjLdH7h
         btt5B746jdPiFWp87SPpftk4DwkYooiDl7zxXNeAjQnChy7+mC250eNLIE0uF2ZXbHw4
         1PyY/bzi28/Y3JIAUw5iOtEViMb81tQGAzATtMf8LUD/otfLOTJaag8IJEcdvWE7RsEY
         14OqcGUvI1/Y4zvizLBCH21rmlcDsO6l5tts0Hh/NCeccDEIKiNkNOvrxV5glTkZjrds
         KwuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751522653; x=1752127453;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9SchETd2Q5vZ+QFLDuDldJneiPa2FBdSkcKgyCrvWq4=;
        b=TyaLjbEd331BroBj/A5HW4+y6jov489uj9cOi25Dnkoa3s0rKNj3eVzYiaIHKya9RH
         PAzVGsvEAVLYh8VEH5kSSw1fumO6V4icJPAhEcAJNJpLP9jqtzUZ50lt2dLpiPXCW7CJ
         6xWmZkkurLw8UrMI/DEtoyj1FF5QfVmHoDMaGavZx5b0CBtW+6BTmyfE2KMrNcAqwEfa
         dKyMvSsgFBs3aM/Ie/aiUDxM57L/3du0IkITbbphiNB3lERW81i3wBJLCly8lbrAL3fR
         n4clV5fWOktlJYHdnOOgdkRxqBL9+z/3bfs4faY4/zawWlFOQkimmSSVVsteQxon8Z4m
         gVQw==
X-Forwarded-Encrypted: i=1; AJvYcCWInpfqz2W5G+NB6PBj8+rARkO38LdNTDEtgppmJW+zV0j9xpEJnheoCDBGPUQlUs/f9nl9WVmSqog=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwTUjT7Pust2uVd22vnbxDlJE0XoeHEfd/PQw7Z9Mkc2xaaGpHc
	J1ztm0B8tpDv01wRwMXVYrKmRs6PG8q9RvTMqk9SGzCOVJH6BJzHPu6v23uMOe29bg==
X-Gm-Gg: ASbGncunit+ha044gd9/PT+vPojBM0CQLKL6zhCfwYkQ1m6sUBKVNADn6gipcJpH+x2
	GcFL80JwySAoL6eq9PpnMAo3sWBU1tJyk7hShQqMkkgwDWHKo8/CVyUPwe8vvSnuG+9d4aHg/Md
	ZQm4gL+9ybaWfYKfFbQG1zPl8zn4q/sPAocnIgmtdaZmpr01zNgEKL2L5Gg5Rc57jkiUF4EYcAJ
	GD2RNBn5RM14jqTluA7HzLi1FepenT2vpq75xqMga8YsyQv4lDUNmXOvLz34s/eKfPM3iReYI3b
	hhiRryjz4uPNFapsVltI19Ajf9wkZJDTMMLkjsRtGv/07/5nSmlFep9SFERTG1OaJfG6cyA2h0s
	TsnRlW2H06Uue8aABZmUakT6LkhtHVmnsOpNOAfFzaIsYdp8=
X-Google-Smtp-Source: AGHT+IFa8awRtCABf9OVi9i40/yRhNSR0IjjeexzQR3+kILF84p05uftI2EsEq2qHMd0jYYpjSDDvw==
X-Received: by 2002:a05:6000:2485:b0:3b3:bd27:f2b0 with SMTP id ffacd0b85a97d-3b3bd27f7d4mr302601f8f.43.1751522653071;
        Wed, 02 Jul 2025 23:04:13 -0700 (PDT)
Message-ID: <3ac18508-d1e6-471f-8fee-6e233ea6cef4@suse.com>
Date: Thu, 3 Jul 2025 08:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] x86: Replace arch-specific boot_domain with the
 common one
To: Alejandro Vallejo <agarciav@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jason Andryuk <jandryuk@gmail.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org,
 Daniel Smith <dpsmith@apertussolutions.com>
References: <20250701105706.86133-1-agarciav@amd.com>
 <20250701105706.86133-4-agarciav@amd.com>
 <0a4196db-dfc8-4259-bfef-e62cf3fe17d1@suse.com>
 <DB1NXDYYSE3Y.1OWV3AS1TYRLA@amd.com>
 <2a7dab07-9e52-4d4a-a80d-99229c9fe093@suse.com>
 <DB1OGNLX29US.Z8UCST2IR3VI@amd.com>
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
In-Reply-To: <DB1OGNLX29US.Z8UCST2IR3VI@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.07.2025 17:34, Alejandro Vallejo wrote:
> On Wed Jul 2, 2025 at 5:15 PM CEST, Jan Beulich wrote:
>> On 02.07.2025 17:09, Alejandro Vallejo wrote:
>>> On Wed Jul 2, 2025 at 3:15 PM CEST, Jan Beulich wrote:
>>>> On 01.07.2025 12:56, Alejandro Vallejo wrote:
>>>>> --- a/xen/arch/x86/include/asm/bootfdt.h
>>>>> +++ b/xen/arch/x86/include/asm/bootfdt.h
>>>>> @@ -3,6 +3,12 @@
>>>>>  #define X86_BOOTFDT_H
>>>>>  
>>>>>  #include <xen/types.h>
>>>>> +#include <public/xen.h>
>>>>> +
>>>>> +struct arch_boot_domain
>>>>> +{
>>>>> +    domid_t domid;
>>>>> +};
>>>>>  
>>>>>  struct arch_boot_module
>>>>>  {
>>>>> [...]
>>>>> @@ -1048,11 +1050,11 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>>>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>>>>>  
>>>>>      /* Create initial domain.  Not d0 for pvshim. */
>>>>> -    bd->domid = get_initial_domain_id();
>>>>> -    d = domain_create(bd->domid, &dom0_cfg,
>>>>> +    bd->arch.domid = get_initial_domain_id();
>>>>> +    d = domain_create(bd->arch.domid, &dom0_cfg,
>>>>>                        pv_shim ? 0 : CDF_privileged | CDF_hardware);
>>>>>      if ( IS_ERR(d) )
>>>>> -        panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>>>>> +        panic("Error creating d%u: %ld\n", bd->arch.domid, PTR_ERR(d));
>>>>
>>>> This being the only place where the (now) arch-specific field is used, why
>>>> does it exist? A local variable would do? And if it's needed for
>>>> (supposedly arch-agnostic) hyperlaunch, then it probably shouldn't be
>>>> arch-specific? Daniel, Jason?
>>>
>>> As for the arch-agnostic side of things, arm needs some extra work to be
>>> able to do it safely. dom0less currently constructs domains immediately after
>>> parsing them, which is problematic for cases where some domains have the prop
>>> and others don't. The domid allocation strategy may preclude further otherwise
>>> good domains from being created just because their domid was stolen by a domain
>>> that didn't actually care about which domid it got.
>>>
>>> It'll eventually want to leave the arch-specific area, but I don't want to do
>>> that work now.
>>
>> But if the domU field is fine to live in a common struct despite being unused
>> on x86, why can't the domid field live in a common struct too, despite being
>> unused on non-x86? Otherwise it'll be extra churn for no gain to later move it
>> there.
> 
> Mostly out of tidiness. Otherwise it's hard to know which fields serve a purpose
> where.
> 
> I genuinely forgot about the domU field. I'm more than happy to drop that arch
> subfield and have domid in the main body of the struct, but I suspect MISRA
> would have something to say about dead data?

In principle yes (and then also about the domU field), but we rejected the
respective rule altogether (for now? plus for a reason that I must have forgot
and that escapes me).

Jan

