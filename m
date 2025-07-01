Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FADAEF2DE
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 11:13:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029449.1403190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWX3G-000502-Q3; Tue, 01 Jul 2025 09:13:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029449.1403190; Tue, 01 Jul 2025 09:13:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWX3G-0004yJ-NG; Tue, 01 Jul 2025 09:13:18 +0000
Received: by outflank-mailman (input) for mailman id 1029449;
 Tue, 01 Jul 2025 09:13:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=28IZ=ZO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uWX3F-0004yD-55
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 09:13:17 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9eb5e931-565b-11f0-a313-13f23c93f187;
 Tue, 01 Jul 2025 11:13:15 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-453643020bdso46834055e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 01 Jul 2025 02:13:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb2e1a7fsm107308335ad.25.2025.07.01.02.13.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Jul 2025 02:13:14 -0700 (PDT)
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
X-Inumbo-ID: 9eb5e931-565b-11f0-a313-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1751361195; x=1751965995; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=l3nJuoNrEuELXNxijAXgsYQ2DeNS1nohjg5NrGYA79w=;
        b=W2vu/If2MWUwoeNo1bRryQ/iXOrmdJIrYsNQPamkYp6wMlPIh4uTEi5JdmraIEo2vN
         Fy65OhiWXVnL+21/31CPJsnm/07e2j8blbGXfVYSFHjHt2Zkrg3ddjM0PiIQ6g3nJlvQ
         3PGIZQA0RF7W6+4ZDVOR27TcCw6IoOEwX4b8aoib3Tz2259mlXDyKbVWn1SO5Ub5mbJ/
         sw1VzsVJJJYqn/Xwg6SbM56/EHBRwRSjRw5d8x6LU/5w9f0cyZkoomBMeFf/nLsNPe55
         4QA6wp1aWAueilsde4Wgr9c9F7J/qJSbQXAR30yZ2vkTy9OcAWKWbrBJdxdD/0RiGvDu
         Y7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361195; x=1751965995;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l3nJuoNrEuELXNxijAXgsYQ2DeNS1nohjg5NrGYA79w=;
        b=kgXyb+jOW2tjhisfWG6sB3rCtOhEgNgME/8Q6sgCHjpCz9l50f2jpYossarNcWLdXu
         nL2PYEKNDAkB8ofV5wQMaSVQYsxVzHDbmarhmuwJr99dG2f8mhu2ubcRs0zER5s9I40B
         Vr1XckN3tU3l28AJH0fe+irI/0jyT6i3TENaK2cRB11JrOfm5MoiFFC1rVdYvm8tM1Ds
         vP43z679iJUWfWsdrvaFXkmUVwcK+bUCEuIwtaW1qMQiVuAsb1lEFe+Q+TctEvGuUYoP
         X9lNhqgspaUup+wJZ3UVnM80bThec+RPemzCMvVohm3SDfQfq337gOLwJCprPhV7O5iY
         mLHw==
X-Forwarded-Encrypted: i=1; AJvYcCV81gRByFc0dCjqaQ1CNImN6FClmW7+j5p6AR+NpcFpjadHxvacCS6k8a5SXjumiqZAKsH73C0Ps9g=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy/G+d1WfAnGTaZHa9OmFLPMGp3hU5KViUJB6MvF+ofn+Gg5GBs
	7TjGiYVx/cdiG8cnnJU/3COmdJ72N7bZlg5OuL5lhjB1mPIasJwUXWsuwqaHKELYbb9JPSQdvoh
	1h60=
X-Gm-Gg: ASbGnctSSOeoirVvksq9KucPMs+cepKOSYKeNgY/k+d5F7Ft4H3EtrKm73E5KetLSgo
	9LvAYTWQ2i8DQq+tg4IEjVfF/Abh0Gyix/HFGGU60vmKSSwJgw2nqhKCaHvKGBFjiDGXOh5FBQP
	nUSGbABVjIANRVSL55xKDWOX/IaPC27Wy8w4zdrQIEVS42Z5nHpsy+DODw2fsrbwE3BcfSIgamE
	hiwaeM6Cvi+Fr1qmZcbd1T6d50gkxRIIzrsY3q5emL+9Q30YtXuqDOJVR3y0f13zybi90BCK5g4
	Azc3xJXFP7W5WoJZNBl7o4VzNuKxg/7Ym6oawu87qFJ8sJ3SeQMigK9vUUmKJb+g6MSuZUNvrS5
	h50o9b0dWDyYTbf6v5YLVPKfhjPwqhusYcMRWZqjVB7vO9Lc=
X-Google-Smtp-Source: AGHT+IE1Z3s51QAYBWgVqNVockscagKBoLBBMOFXWG8CtQrREz1lLrzB1jQdZT3T8c70muk5LvsJUw==
X-Received: by 2002:a5d:5f55:0:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a8fdff4461mr14671118f8f.13.1751361194755;
        Tue, 01 Jul 2025 02:13:14 -0700 (PDT)
Message-ID: <f184fbb9-3212-4000-8541-5f64fe65f782@suse.com>
Date: Tue, 1 Jul 2025 11:13:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/18] xen/x86: remove "depends on !PV_SHIM_EXCLUSIVE"
To: "Penny, Zheng" <penny.zheng@amd.com>
Cc: "Huang, Ray" <Ray.Huang@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 "Orzel, Michal" <Michal.Orzel@amd.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20250616064128.581164-1-Penny.Zheng@amd.com>
 <20250616064128.581164-2-Penny.Zheng@amd.com>
 <a4244940-8c03-4391-8078-7308d6a3fcca@suse.com>
 <DM4PR12MB84515AB588A2DF0C6AF451E7E141A@DM4PR12MB8451.namprd12.prod.outlook.com>
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
In-Reply-To: <DM4PR12MB84515AB588A2DF0C6AF451E7E141A@DM4PR12MB8451.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 01.07.2025 09:00, Penny, Zheng wrote:
> [Public]
> 
> Hi,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Sent: Monday, June 30, 2025 4:21 PM
>> To: Penny, Zheng <penny.zheng@amd.com>
>> Cc: Huang, Ray <Ray.Huang@amd.com>; Andrew Cooper
>> <andrew.cooper3@citrix.com>; Roger Pau Monné <roger.pau@citrix.com>;
>> Anthony PERARD <anthony.perard@vates.tech>; Orzel, Michal
>> <Michal.Orzel@amd.com>; Julien Grall <julien@xen.org>; Stefano Stabellini
>> <sstabellini@kernel.org>; xen-devel@lists.xenproject.org
>> Subject: Re: [PATCH v5 01/18] xen/x86: remove "depends
>> on !PV_SHIM_EXCLUSIVE"
>>
>> On 16.06.2025 08:41, Penny Zheng wrote:
>>> Remove all "depends on !PV_SHIM_EXCLUSIVE" (also the functionally
>>> equivalent "if !...") in Kconfig file, since negative dependancy will
>>> badly affect allyesconfig.
>>>
>>> Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
>>> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
>>> ---
>>> v2 -> v3:
>>> - remove comment for PV_SHIM_EXCLUSIVE
>>> ---
>>> v3 -> v4:
>>> - explicitly state "CONFIG_xxx is not set" in "pvshim_defconfig"
>>
>> Where did these changes go? Nothing is said about ...
>>
>>> - Add "default y" for SHADOW_PAGING and TBOOT
>>> - refactor commit message
>>> ---
>>> v4 -> v5:
>>> - For not breaking allyesconfig, changes to defaults are actually not needed.
>>> So remove them all
>>> - Leave one blank lines
>>
>> ... their (complete) dropping here. Aiui overrides for anything where you remove the
>> dependency (and where the intended setting for the shim is different from the
>> general default) would still be needed here.
>>
> 
> Since I checked, before and after this commit, result of "make defconfig pvshim_defconfig" doesn't really change for above options, so I remove them

Hmm, I'm puzzled by that. But if so, ...

> I'll add them back to emphasize intended setting for the shim is different from the general default

... nothing should indeed be added (back). What's there isn't to emphasize
anything, but to override what otherwise is the default.

(I can see my mistake there at the example of HVM: That option itself has a
suitable default, and hence anything enclosed in the subsequent "if HVM" is
indeed suitable covered.)

>>> --- a/xen/drivers/video/Kconfig
>>> +++ b/xen/drivers/video/Kconfig
>>> @@ -3,7 +3,7 @@ config VIDEO
>>>     bool
>>>
>>>  config VGA
>>> -   bool "VGA support" if !PV_SHIM_EXCLUSIVE
>>> +   bool "VGA support"
>>>     select VIDEO
>>>     depends on X86
>>>     default y if !PV_SHIM_EXCLUSIVE
>>
>> ... here, which (as indicated before) imo doesn't belong here, but at the very least
>> would need covering in the description.
>>
> 
> Hmmm. Although " bool "VGA support" if !PV_SHIM_EXCLUSIVE " doesn't make CONFIG_VGA the option disappear when PV_SHIM_EXCLUSIVE=y, it still make it unconfigurable. So I treat it dependency too here...
> Maybe I shall add the following in the description:
> ```
> Although " if !PV_SHIM_EXCLUSIVE " for CONFIG_VGA is not truly a dependency, setting PV_SHIM_EXCLUSIVE y still makes it unconfigurable. So we remove it here too
> ```

Hmm, now that you say this I wonder why this was written that way. I notice it
was me who suggested this form, but I don't remember anymore why I didn't
suggest the simpler "depends on", which - afaict - would have the exact same
effect. What you mean to add to the description may want to reflect that (as
long as you agree, of course).

>> Also, just to repeat what I said in reply to the cover letter: Imo this change needs to
>> move 2nd to last in the series, and it then wants committing together with the last
>> patch (which you will want to put in as a remark to the eventual committer).
> 
> Yes, I'll move it to 2nd to last. Shall I mention "It shall be committed together with ...." in commit message or change log?

Somewhere below the first --- separator (and maybe best also in the cover letter).
Such doesn't belong in the eventual commit.

Jan

