Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ECEEA8A0DA
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 16:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.954058.1348408 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4h9R-0006e7-Ce; Tue, 15 Apr 2025 14:20:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 954058.1348408; Tue, 15 Apr 2025 14:20:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4h9R-0006cQ-90; Tue, 15 Apr 2025 14:20:37 +0000
Received: by outflank-mailman (input) for mailman id 954058;
 Tue, 15 Apr 2025 14:20:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ai1O=XB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1u4h9P-0006cK-GX
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 14:20:35 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb69a91a-1a04-11f0-9eae-5ba50f476ded;
 Tue, 15 Apr 2025 16:20:34 +0200 (CEST)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-39c0dfad22aso3251823f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 07:20:34 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae978023sm14439772f8f.47.2025.04.15.07.20.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 07:20:33 -0700 (PDT)
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
X-Inumbo-ID: cb69a91a-1a04-11f0-9eae-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744726834; x=1745331634; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7tirfQAFAerkvUkHalZl/LE3nMMbQgC9ahYhuE4XLOQ=;
        b=beczkU1yQVPjTJqrYhcfaz8DFldxJ3udWpDXbcWPeKQn3PZ0yOz88x2LMo3T4eUy54
         A4ITP4zWnp5AhWOXjFbU5C4KiVYrlo7m4aEv6p5H+Y0o5B4qUBABre+MzTGfs/0lNASV
         DsjVIskZPcfsqrvmx2NXkxwv0+FsiteejLL5DfuqVRg2+Kymg6k4AaAhRsEsD/jV9tRd
         Jpqib21RdU/EeseNho/JoPWE+weHoTZsjmbIf4KxUYifTZBYEHco0C9aQxHzRepHB1MD
         T8CNRPtNLn4sQ/M0c/zM/oCkzwHc9006ipgxXCosPyV80+jXioR3RdbH5oYwft1/1H0c
         1Ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726834; x=1745331634;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tirfQAFAerkvUkHalZl/LE3nMMbQgC9ahYhuE4XLOQ=;
        b=smStFnto7t/KuXvOHfumPDaepG1iDR6XvLcgXIl6zvX13AG+hp8UkLruEUJdHfuCix
         h62J6VRDKaKHvQ6B1la5hTpvomA+aIQw3ZI5wdoaODbQe6vqQpjS6ZjWVMqJcXQpj+1k
         ELYOkTkB/JEdxxkEiYcDKuoY1LGLn1XWQkR/FUriFK67f1S7gtgtj7z9CSV/rDIfJzLT
         J+6nDDiSYmVQOqG/VWdM/ig59utF2jVDraiKlfZx7jXT6ZRtpKtsdbs4ybcKYZXq/6s8
         OI/aKad6lleGQp6qZ5rFcHbIM/CUwBAuGDQzQSCS9v8GPsH+tbgAooXAOYdchvKKHaBA
         zsvw==
X-Forwarded-Encrypted: i=1; AJvYcCUfwH6yuB691B+wSOIcwM55nWAwgSA0huUivZhTGyOMGDC4b8HkdGcKAT306rzq5K4Log0nblIGpi4=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxNy7uoV5MZbOrU43+utTWKcc/Dmz111My9BcrEXiZ4Vfg76c6R
	tqZP/weTqZYhuqLaPqkTnR7WYwtDyPaZSJUirBSvmsEiEv7XXkDPM7r4O6AD6w==
X-Gm-Gg: ASbGnctZ6gM1BoTAZrsi8I4iflVdKJ+Tva43+eCJRB8TQ3pLaTgrsixwSoSt00IcRV1
	2vuYBRJ3Bhahjtu/dDeLk2GrKXd6J9SnJCkvuxeqFFAW8MaSWs958IrOST05ZYcpThxOikUklQC
	Ic2spBkcRcVUeB5w94YdcJnjgC0yLeGo9MZB0zC/4sbJUnC3O9IzJsG/zkGYZfcd3qOFg51JQiK
	r1G5yBgXEQLlODD7Epk5tGgQNzvvAOGMcHqsxOs1YByeZ6YyatN9IxdnZDEgoummfORaacMHs5F
	QZwkyOz1pdgKJSJr6scn+iWmsVApmwyUG846WK7j+m1nyF1Uh4rl/a0pmmFP3qLglIZF1bW2/Ns
	zBftAtlp14KgpZp3miM2CXpFx3A==
X-Google-Smtp-Source: AGHT+IHirI+zlFNvyxDXFHP/6F6FhsuMY1cRdSkxVXDWXZeBKGEgsS4TvCFiOQWYXhILGcqhibe2Tg==
X-Received: by 2002:a05:6000:4401:b0:39e:cbd2:9128 with SMTP id ffacd0b85a97d-39ecbd29166mr7466750f8f.11.1744726833933;
        Tue, 15 Apr 2025 07:20:33 -0700 (PDT)
Message-ID: <2207a182-5232-47ca-91b7-840528ba8adf@suse.com>
Date: Tue, 15 Apr 2025 16:20:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/16] x86/hyperlaunch: add capabilities to boot domain
To: Alejandro Vallejo <agarciav@amd.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org, Jason Andryuk <jason.andryuk@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
 <20250408160802.49870-17-agarciav@amd.com>
 <93bad6aa-57a8-427d-a0f6-924f03f0db34@suse.com>
 <D96M14WZ37ZW.D7AAHJ3RMV9D@amd.com>
 <2b269381-d002-4aa5-bad4-8c677b8a4b0d@suse.com>
 <D977IWWCSWMK.2JV329ZHXLA2J@amd.com>
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
In-Reply-To: <D977IWWCSWMK.2JV329ZHXLA2J@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 15.04.2025 14:22, Alejandro Vallejo wrote:
> On Tue Apr 15, 2025 at 7:38 AM BST, Jan Beulich wrote:
>> On 14.04.2025 21:31, Alejandro Vallejo wrote:
>>> On Thu Apr 10, 2025 at 1:18 PM BST, Jan Beulich wrote:
>>>> On 08.04.2025 18:07, Alejandro Vallejo wrote:
>>>>> --- a/xen/arch/x86/setup.c
>>>>> +++ b/xen/arch/x86/setup.c
>>>>> @@ -1006,6 +1006,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>>>  {
>>>>>      char *cmdline = NULL;
>>>>>      size_t cmdline_size;
>>>>> +    unsigned int create_flags = 0;
>>>>>      struct xen_domctl_createdomain dom0_cfg = {
>>>>>          .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
>>>>>          .max_evtchn_port = -1,
>>>>> @@ -1037,7 +1038,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>>>      if ( bd->domid == DOMID_INVALID )
>>>>>          /* Create initial domain.  Not d0 for pvshim. */
>>>>>          bd->domid = get_initial_domain_id();
>>>>> -    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>>>>> +    if ( bd->capabilities & BUILD_CAPS_CONTROL )
>>>>> +        create_flags |= CDF_privileged;
>>>>
>>>> Seeing that builder_init() in the non-DT case sets the new bit unconditionally,
>>>> isn't the shim's only domain suddenly getting CDF_privileged set this way? Oh,
>>>> no, you then ...
>>>>
>>>>> +    d = domain_create(bd->domid, &dom0_cfg,
>>>>> +                      pv_shim ? 0 : create_flags);
>>>>
>>>> ... hide the flag here. Any reason to have the intermediate variable in the
>>>> first place
>>>
>>> Well, the logic would end up fairly convoluted otherwise. As things
>>> stand this can be encoded in an if-else fashion with 2 calls, but
>>> there's 2 capability flags coming that need integrating together.
>>>
>>> This is just avoiding further code motion down the line.
>>
>> Is it?
>>
>> -    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
>> +    d = domain_create(bd->domid, &dom0_cfg,
>> +                      ((bd->capabilities & BUILD_CAPS_CONTROL) && !pv_shim
>> +                       ? CDF_privileged : 0));
>>
>> isn't really worse (imo),
> 
> Not sure I agree. Long conditions on ternary operators makes the
> control flow harder to follow.
> 
> A nicer alternative that also removes the auxiliary variable is to have
> a helper to convert from bootcaps to whatever createdomainflags are
> required. That'd extend naturally for more bits.
> 
>> but is highlighting the problem more clearly: Why
>> would the shim have BUILD_CAPS_CONTROL set in the first place? Without that
>> the statement would remain pretty similar to what it was before.
> 
> If the commandline is parsed early enough (I see the early parse path in
> head.S?) it would be better to add this logic to builder_init() and
> prevent the capability from reaching the boot_domain in the first place.

The parsing from head.S is only partial. But surely DT is being looked at
far later than when the full parsing (cmdline_parse()) is done?

Jan

