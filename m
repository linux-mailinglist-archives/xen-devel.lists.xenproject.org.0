Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D73CAB15DB9
	for <lists+xen-devel@lfdr.de>; Wed, 30 Jul 2025 11:59:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1063670.1429406 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3aL-0008II-FE; Wed, 30 Jul 2025 09:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1063670.1429406; Wed, 30 Jul 2025 09:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uh3aL-0008FU-Bt; Wed, 30 Jul 2025 09:58:57 +0000
Received: by outflank-mailman (input) for mailman id 1063670;
 Wed, 30 Jul 2025 09:58:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zSpT=2L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uh3aK-0008FJ-Gl
 for xen-devel@lists.xenproject.org; Wed, 30 Jul 2025 09:58:56 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdcd86c0-6d2b-11f0-a320-13f23c93f187;
 Wed, 30 Jul 2025 11:58:55 +0200 (CEST)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3b7834f2e72so2280048f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 30 Jul 2025 02:58:55 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23fd872460fsm90568595ad.61.2025.07.30.02.58.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Jul 2025 02:58:54 -0700 (PDT)
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
X-Inumbo-ID: cdcd86c0-6d2b-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1753869535; x=1754474335; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=OxhycTRlibZKFZJVoPz7m5fj3oXCKVmTLZ3tqEPM6Kk=;
        b=asatKr6nxxOagAD/+Y9alf001Q5dH0nw+46IR3Kl4VHtUAcFdsJFvWxI4kzP1AM4oX
         MU0GQCJNZUSB9LRtcPosaJNrlrMzm2NM4mOs3iFFmVChrqsQNajI1yTVrVP2Iq655z82
         itYEYRTYlxVXDLkDBqGjlF25LuUF5YDHECEwyX7f/ixEjOrtHDOhSyraQODDh73fogQs
         XxAv3IkhpK+30bvJ86XrKVKoJTMylVypSZI9e5ylvgYIoqwMhGHd/PjN0YCoQUA2f/wS
         RWCtfDe9ZLaCiiIxFCz8r5rzrKGzdaZeRgO1JNLVpuWpSkxoRlv7sC4W+qdq9PS1YS7m
         toUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753869535; x=1754474335;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OxhycTRlibZKFZJVoPz7m5fj3oXCKVmTLZ3tqEPM6Kk=;
        b=jqkwMDpG9Ecv4fbrfLC6zcoFLPGzQrTZCJ95cGFHHp4iNIm2C5ABIdXKJnbW4VpoYh
         GlbKMiF2wB+jXNUtB0O7M3+eKIK38vzB0O9gzKktfTcBeI2wbZ37DRpjBuDsu0ahPkBs
         MS6cKommZBOR+6nwCnhD6AuQfJBUKWyqCGgxzGbVjhu0U2rofSz//FqOBJpUzz3nxxum
         sNB0iWWAgJ6V1/u2UY9XgZgsEpDTlhJtKjSAvzFzGUcTbhFloEaQ2fkDC4exRzvvT4BL
         FauOWtSfBBC9O99nkHH+ivUwbo+mIINH3nAFN5ppv00vcAJ+yUaPb89QQ0MoPfjSwVKA
         /PKw==
X-Gm-Message-State: AOJu0Yzi7NhL9kuPHzSe4FibrXI3ET6emZrwIVW2BrX8Dnn/7/iYF6hH
	DRjZ5ZH3+8RYsyNUAP1Zj0+XqfnFAOfRLaKQr3hMPV7wImfWZNod+4ii9vCYPwDOvw==
X-Gm-Gg: ASbGncvnrMTuLsBy28ynYE+WErzEu3XhGld9fYEdhF0pgc1ruE2ZCf5G/DJKeNJcRlC
	gigr3nHQMwzp1bsTqVKxGIM0i9LAEosqTITQfmsl0hUq1XUr1cnAM+ns2Rxn/yuWAzbC6YJaeZ6
	WgGUaC/u71Hv/GnUWpDm+D8lwMxbKJ1r2s3tPOTR/JXaba+qolyukRu10cwF4CjVVhTspYNKLmi
	g7b4ww3t/wd7UikHXIe+mn5mHQBfB+o1By8+8w7BUWHi8oj7vRFuIUUmLyBIK3wk63uiS2gcCl1
	5RLB0f5mJWiTvx0Mh2p5Kw0xURmI+Favdqcsag1LPd3G8HG3UHj5GdNZ0MTLOzh0uJt0aUvL5+v
	o9j6K1AnOimxAizJ6LDp/VpC7qkNrkioMKGqO9w6efUs/vNtD41uL2ZhNdiS1imTlPkiqkOGtb3
	HVSWos0nY=
X-Google-Smtp-Source: AGHT+IE7X8+cHISVrCGxPdSriA9cUioTEp9S4YD9iYopEcmMc/vqPZgd+4HyyHKY1GKuConH6NBUhg==
X-Received: by 2002:a05:6000:144a:b0:3b7:871b:8cba with SMTP id ffacd0b85a97d-3b795005b77mr2192643f8f.55.1753869534809;
        Wed, 30 Jul 2025 02:58:54 -0700 (PDT)
Message-ID: <1eacbe00-b285-4071-8b16-d970c91af8e1@suse.com>
Date: Wed, 30 Jul 2025 11:58:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] x86: Conditionalise init_dom0_cpu_policy()
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <20250717175825.463446-1-alejandro.garciavallejo@amd.com>
 <aICM2hqQoloEahgD@macbook.local> <DBL1SWOYP5OP.35VTULK0U7RBL@amd.com>
 <aINi024baOV5LQgn@macbook.local>
 <ba1de9a2-09b1-4332-b27d-0e485d0c8ce5@apertussolutions.com>
 <0006e9f6-49af-4aef-b680-2042fb0d5213@suse.com>
 <DBPAN1UFFCVS.3BUNHPA38O4NU@amd.com>
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
In-Reply-To: <DBPAN1UFFCVS.3BUNHPA38O4NU@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.07.2025 11:48, Alejandro Vallejo wrote:
> On Wed Jul 30, 2025 at 9:48 AM CEST, Jan Beulich wrote:
>> On 29.07.2025 23:29, Daniel P. Smith wrote:
>>> On 7/25/25 06:56, Roger Pau Monné wrote:
>>>> On Fri, Jul 25, 2025 at 12:02:18PM +0200, Alejandro Vallejo wrote:
>>>>> On Wed Jul 23, 2025 at 9:18 AM CEST, Roger Pau Monné wrote:
>>>>>> On Thu, Jul 17, 2025 at 07:58:24PM +0200, Alejandro Vallejo wrote:
>>>>>>> Later patches will keep refactoring create_dom0()
>>>>>>> until it can create arbitrary domains. This is one
>>>>>>> small step in that direction.
>>>>>>>
>>>>>>> Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
>>>>>>> ---
>>>>>>>   xen/arch/x86/setup.c | 3 ++-
>>>>>>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>>
>>>>>>> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
>>>>>>> index c6890669b9..6943ffba79 100644
>>>>>>> --- a/xen/arch/x86/setup.c
>>>>>>> +++ b/xen/arch/x86/setup.c
>>>>>>> @@ -1054,7 +1054,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
>>>>>>>       if ( IS_ERR(d) )
>>>>>>>           panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
>>>>>>>   
>>>>>>> -    init_dom0_cpuid_policy(d);
>>>>>>> +    if ( pv_shim || d->cdf & (CDF_privileged | CDF_hardware) )
>>>>>>
>>>>>> You possibly want this to be:
>>>>>>
>>>>>> (d->cdf & (CDF_privileged | CDF_hardware)) == (CDF_privileged | CDF_hardware)
>>>>>>
>>>>>> To ensure the contents of dom0_cpuid_cmdline is only applied to dom0,
>>>>>> and not to the hardware or control domains.  I assume it should be
>>>>>> possible to pass a different set of cpuid options for the hardware vs
>>>>>> the control domains.
>>>>>>
>>>>>> Thanks, Roger.
>>>>>
>>>>> Why only a hwdom+ctldom, surely a single hwdom should get it too.
>>>>
>>>> hm, not really I think: a late hardware domain would get any custom
>>>> cpuid options from the toolstack that created it, or in the
>>>> hyperlaunch case from the provided configuration, but not from the
>>>> dom0-cpuid command line option I would expect.  Otherwise you have two
>>>> different sources of cpuid options, the inheritance from dom0-cpuid,
>>>> plus whatever is provided from the hardware domain configuration.
>>>
>>> Yes, this has been a sticking point for me and never got any good 
>>> answers thus far. Should the dom0 related xen command line options only 
>>> apply when not booting via hyperlaunch. If the answer is no, then you're 
>>> in this area with some dom0 options that really are applicable to hwdom 
>>> vs ctldom and vice-a-versa. Some could even be suggested to apply to 
>>> both. And then, I don't believe there really is a consensus one which 
>>> options apply to which domains. Over the years working on this, I have 
>>> been an advocate that commandline adjustments allow for quicker 
>>> troubleshooting by the user/administrator.
> 
>>> In the last version of the multidomain construction RFC, I am growing more
>>> and more to advocate for my initial proposition, that dom0 options only
>>> apply when not using  hyperlaunch.
> 
> I agree. It simplifies everything a ton, and it's far less confusing to know
> ultimate settings, which in a predefined initial system definition is important.
> 
>>
>> With the hyperlaunch plans, is there something that's still properly
>> "Dom0", perhaps under certain conditions? That (and only that) is
>> where I would see respective command line options to apply. IOW no
>> more than one specific domain (i.e. in particular not to both hwdom
>> and ctldom, when they're separate). In cases when respective options
>> are entirely ignored, I think some kind of warning would want issuing.
> 
> The problem is that lines are blurred. A ctldtdom + hwdom + xsdom with domid0
> is clearly a dom0. Is it still a dom0 when there's no xenstore? What about when
> it's not privileged? What about a ctldom + hwdom + xsdom with domid3? What about
> dom0_mem options when some domains have already been constructed and available
> memory is less than total host memory?

Well, this is what needs determining before we actually move in any (unclear)
direction. And we need to keep in mind that people used to infer certain
things from domain ID being 0. 

> Also if a domain is or isn't dom0 depending on whether a certain other domain
> exists makes things confusing. You have a DTB+commandline and get a behaviour,
> then add a domain and you get another behaviour on the first one, even when you
> didn't touch its configuration.
> 
> My general view after a while experimenting with the full series is to _not_ use
> the dom0 command line, as Daniel mentions. The simplifying effect of not looking
> at (e.g) dom0_mem is staggering.

Which likely would imply not to create any domain with ID 0.

Jan

> There's exceptions. nmi=dom0 should be renamed to nmi=hwdom (if anything,
> because that's exactly what it does even with late hwdom), but anything with
> dom0_X ought to be ignored. Which implies first and foremost moving its uses
> outside domain construction and general use.
> 
> All dom0_ options ought to be parsed and used from __init functions before
> construct_dom0(), and construct_dom0 ought to depend strictly on information
> in boot_domain + domain.
> 
> Only then we'll have sanity.
> 
> Cheers
> Alejandro


