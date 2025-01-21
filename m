Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A364A17BE9
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 11:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875356.1285805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBbo-0002Q6-Ah; Tue, 21 Jan 2025 10:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875356.1285805; Tue, 21 Jan 2025 10:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taBbo-0002Mx-6t; Tue, 21 Jan 2025 10:35:48 +0000
Received: by outflank-mailman (input) for mailman id 875356;
 Tue, 21 Jan 2025 10:35:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Gode=UN=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1taBbm-0002Mr-FS
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 10:35:46 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78114107-d7e3-11ef-99a4-01e77a169b0f;
 Tue, 21 Jan 2025 11:35:44 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so2909364f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 02:35:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-437c752935csm230629295e9.26.2025.01.21.02.35.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Jan 2025 02:35:43 -0800 (PST)
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
X-Inumbo-ID: 78114107-d7e3-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1737455744; x=1738060544; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=iqME+v0CEK8F/LmxoOToHCnJ0x3lcEhnSNs5R3C2FWY=;
        b=Vusj5ranAC6gs37dt4qerhRDY6O8/iYBp+oqT37fBSb98zKHg7JnUEroALsRTJ/CtO
         bcuVgpy2fTsJ+d3Yo2f8PCjKUJ+kCSH+8uuu/RLe03LWLSVw71LL5nafntnV36m8BTBG
         n0KDd94vO+URIxkR/Z8oDiBZfX84b7jamWG13lAPn+V7JWMA1B72BwKoeU+El0N8nCdY
         h8QXvS7RBP9mIYVrqvS8M3n/yMb7pcQMq6zIdml3yJouo+lGL6TGzCClO6VcFJMLemqh
         7JgO4VTJJ3LrSWVJTS0C/76ZMA0NryK+xjLOXzgCCx0Gp4FhQ1uBBgXbkZquWqma6OOg
         CQDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737455744; x=1738060544;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqME+v0CEK8F/LmxoOToHCnJ0x3lcEhnSNs5R3C2FWY=;
        b=YQ4NaAzrQ8pBhU4SWp9Gw8UURnVoP7bHPbOPmzDIM0jsXY4S9mnZPR0fX77XR8SDim
         gYd28BG2ugstXFBX+xPPUl+zOPCmD33QS+qvsljuUmIZNqUFZGFYoS3EaMXEMTzaLpGq
         F9Kpt6eCXBmlzl8IPXbcq1ae/OTfj/7gnMTIqt1AHqIXmooQg8YiLEqx/bsfnzlIeYNL
         KK6A6ZdS3pSOtvZClu9NUUvjbqcKsihknRJYJ4F9sq/QwkEnXpiT5Dp4e+GpdcHlcEhZ
         cfVC/wGDUjv9o6ehpxwnhrWovOkODs4W8ilsK6EcHtLTh74Ptm2UE3lNXNMuzXMcg8hS
         62nQ==
X-Forwarded-Encrypted: i=1; AJvYcCV46zxRzhuhz65A36kgSm53FTlmcWgCYAfma+IUNtU6VUuvt9pRTO+y9e8UxVEddZ2vetLikTnHEPo=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx7Jh2RuKKes43jWSefzPtvMD4mMtOvq2AqE9RdSVcI9Mdi4/mG
	yfaOV2t7AHpSKDBawagf5ZsjXEXL/Fgm9un0LF8d6P7d6gTZZ9qq1mzylUYBwg==
X-Gm-Gg: ASbGncu5lmQLJcJE0krxfQL+F5hKAK0DEkaF0O7xCzjBEIdfdMT8fvFF+r5CrtIlgde
	BYqNxqY3cXpAJtVPVvW/nJvde9sg7JUvFw+WYXAwkeToc9CcI9bKMWrjnzbhqLjl+Q5jG6Waa6K
	yD1b+R181lOIzBGXRLImjKHDIT1wsk1eoJJE5K+dy685Yt44nWzAVS7ot+45Ht4StLirUsGtwpC
	1xh3ZVSrg7RGPlqThI+8MUZXBxApaONcY4fxgGAbd53HqUH7gwFiUaRUgPzz+znnDF/2CY+Qtls
	FfT584fnZhcdoajcjzmaXP/0VSTqrqlgXAJ+HaVh1BoEfPoqjcgsKBk=
X-Google-Smtp-Source: AGHT+IFydmMWnH8VyLrNV/nd8vONhKGDArxk1MTMJBWZ06LplpTRZnmC3ZIIWX4D8e0LS9cariADDg==
X-Received: by 2002:a05:6000:dcc:b0:382:5aae:87c7 with SMTP id ffacd0b85a97d-38bf5674546mr12452872f8f.31.1737455743762;
        Tue, 21 Jan 2025 02:35:43 -0800 (PST)
Message-ID: <41859184-bd9c-420f-96c1-65abe379b81e@suse.com>
Date: Tue, 21 Jan 2025 11:35:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] x86: provide an inverted Kconfig control for
 shim-exclusive mode
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, sergiy_kibrik@epam.com
References: <617842e1-8ef2-b095-0c52-c2e2e5f1c0a8@suse.com>
 <alpine.DEB.2.22.394.2501161503120.2684657@ubuntu-linux-20-04-desktop>
 <Z4oxZSUQ6VARiR0H@macbook.local> <D74CH4RDRRR9.ZR6RL8U6PQ56@cloud.com>
 <6285f86d-f2d2-4040-999d-01aed3e72a36@suse.com>
 <alpine.DEB.2.22.394.2501171430570.2684657@ubuntu-linux-20-04-desktop>
 <f8c1e2c2-ceb5-4200-a304-e2d824a171a8@citrix.com>
 <40c9d806-000d-43e7-a804-ad4e84209b2f@suse.com>
 <alpine.DEB.2.22.394.2501201527090.11086@ubuntu-linux-20-04-desktop>
 <bae48627-fa5b-48b6-b74e-267285175eff@suse.com>
 <Z49gQBkxCbXIO84D@macbook.local>
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
In-Reply-To: <Z49gQBkxCbXIO84D@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.01.2025 09:52, Roger Pau Monné wrote:
> On Tue, Jan 21, 2025 at 09:13:38AM +0100, Jan Beulich wrote:
>> On 21.01.2025 00:27, Stefano Stabellini wrote:
>>> On Mon, 20 Jan 2025, Jan Beulich wrote:
>>>> On 18.01.2025 00:41, Andrew Cooper wrote:
>>>>> On 17/01/2025 10:43 pm, Stefano Stabellini wrote:
>>>>>> On Fri, 17 Jan 2025, Jan Beulich wrote:
>>>>>>> On 17.01.2025 13:24, Alejandro Vallejo wrote:
>>>>>>>> On Fri Jan 17, 2025 at 10:31 AM GMT, Roger Pau Monné wrote:
>>>>>>>>> On Thu, Jan 16, 2025 at 04:31:46PM -0800, Stefano Stabellini wrote:
>>>>>>>>>> On Wed, 1 Mar 2023, Jan Beulich wrote:
>>>>>>>>>>> While we want certain things turned off in shim-exclusive mode, doing
>>>>>>>>>>> so via "depends on !PV_SHIM_EXCLUSIVE" badly affects allyesconfig: Since
>>>>>>>>>>> that will turn on PV_SHIM_EXCLUSIVE, other options will be turned off as
>>>>>>>>>>> a result. Yet allyesconfig wants to enable as much of the functionality
>>>>>>>>>>> as possible.
>>>>>>>>>>>
>>>>>>>>>>> Retain PV_SHIM_EXCLUSIVE as a prompt-less option such that first of all
>>>>>>>>>>> C code using it can remain as is. This isn't just for less code churn,
>>>>>>>>>>> but also because I think that symbol is more logical to use in many
>>>>>>>>>>> (all?) places.
>>>>>>>>>>>
>>>>>>>>>>> Requested-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>>>>>>>
>>>>>>>>>>> ---
>>>>>>>>>>> The new Kconfig control's name is up for improvement suggestions, but I
>>>>>>>>>>> think it's already better than the originally thought of
>>>>>>>>>>> FULL_HYPERVISOR.
>>>>>>>>>> I think the approach in general is OK, maybe we can improve the naming
>>>>>>>>>> further. What about one of the following?
>>>>>>>>>>
>>>>>>>>>> NO_PV_SHIM_EXCLUSIVE
>>>>>>>>>> PV_SHIM_NOT_EXCLUSIVE
>>>>>>>>> IMO negated options are confusing, and if possible I think we should
>>>>>>>>> avoid using them unless strictly necessary.
>>>>>>>> The problem is that the option is negative in nature. It's asking for
>>>>>>>> hypervisor without _something_. I do agree with Stefano that shim would be
>>>>>>>> better in the name. Otherwise readers are forced to play divination tricks.
>>>>>>>>
>>>>>>>> How about something like:
>>>>>>>>
>>>>>>>>     SHIMLESS_HYPERVISOR
>>>>>>>>
>>>>>>>> That's arguably not negated, preserves "shim" in the name and has the correct
>>>>>>>> polarity for allyesconfig to yield the right thing.
>>>>>>> Except that a hypervisor with this option enabled isn't shim-less, but permits
>>>>>>> working in shim as well as in non-shim mode.
>>>>>> First, let's recognize that we have two opposing requirements. One
>>>>>> requirement is to make it as easy as possible to configure for the user.
>>>>>> Ideally without using negative CONFIG options, such as
>>>>>> NO_PV_SHIM_EXCLUSIVE. From the user point of view, honestly,
>>>>>> PV_SHIM_EXCLUSIVE is a pretty good name. Better than all of the others,
>>>>>> I think.
>>>>>>
>>>>>> On the other hand, we have the requirement that we don't want
>>>>>> allyesconfig to end up disabling a bunch of CONFIG options. Now this
>>>>>> requirement can be satisfied easily by adding something like
>>>>>> NO_PV_SHIM_EXCLUSIVE. However, it would go somewhat against the previous
>>>>>> requirement.
>>>>>>
>>>>>> So we need a compromise, something that doesn't end up disabling other
>>>>>> CONFIG options, to make allyesconfig happy, but also not too confusing
>>>>>> for the user (which is a matter of personal opinion).
>>>>>>
>>>>>> In short, expect that people will have different opinions on this and
>>>>>> will find different compromises better or worse. For one, I prefer to
>>>>>> compromise on "no negative CONFIG options" and use
>>>>>> PV_SHIM_NOT_EXCLUSIVE. Because it serves the allyesconfig goal, and
>>>>>> while it is not as clear as PV_SHIM_EXCLUSIVE, is still better than a
>>>>>> completely generic FULL_HYPERVISOR option, which means nothing to me.
>>>>>>
>>>>>> I cannot see a way to have a good and clear non-negated CONFIG option,
>>>>>> and also satisfy the allyesconfig requirement. So I prefer to compromise
>>>>>> on the "non-negated" part.
>>>>>
>>>>> Debating the naming is missing the point.
>>>>>
>>>>>
>>>>> The problem here is the wish to have PV_SHIM_EXCLUSIVE behave in a way
>>>>> that Kconfig is not capable of expressing.  Specifically, what is broken
>>>>> is having "lower level" options inhibit unrelated "higher level" options
>>>>> when the graph gets rescanned[1].  That's why we're in the laughable
>>>>> position of `make allyesconfig` turning off CONFIG_HVM.
>>>>>
>>>>> Jan, you want "echo PV_SHIM_EXCLUSIVE=y >> .config && make" to mean
>>>>> "reset me back to a PV Shim".
>>>>
>>>> Isn't this an independent goal? Or is this a statement on what you see
>>>> my change (kind of) doing, indicating you consider this wrong?
>>>
>>> The way I understood it, it is the latter
>>>
>>>
>>>>> Kconfig spells this "make $foo_defconfig" for an appropriately given foo.
>>>>>
>>>>>
>>>>> There should be:
>>>>>
>>>>> 1) an option called PV_SHIM_EXCLUSIVE which does *nothing* other than
>>>>> making the boolean be a compile time constant.
>>>>
>>>> I fear it remains unclear to me what exactly you mean here. It feels like
>>>> you may be suggesting that all other uses of PV_SHIM_EXCLUSIVE should be
>>>> dropped, without replacement. That seems wrong to me, though. In
>>>> particular I'm of the opinion that besides using "make pvshim_defconfig"
>>>> people ought to also have the option to properly configure a shim build
>>>> from scratch (or from any random .config they hold in hands), requiring
>>>> respective "depends on" and/or "select" / "imply" to be in place.
>>>
>>> That should be done with "make pvshim_defconfig"
>>
>> Why? Specifically, why should people use only one entirely nailed down
>> configuration for a shim. Like a "normal" hypervisor, there are aspects
>> which very well can be left to the person doing the configuration.
> 
> But nothing prevents a user from starting from a shim defconfig, and
> then tweaking it as desired:
> 
> $ make pvshim_defconfig
> $ make menuconfig
> 
> Or there's something I'm missing here?

Well, no, you don't. But if the above is okay, why would not starting from
pvshim_defconfig not also be okay? Plus whichever way tweaks are done,
sensible dependencies should still be enforced imo.

>>>> Or else they may end up with a lot of dead code. (Just consider e.g.
>>>> HVM=n: We also don't permit HVM-only stuff to be enabled in that case,
>>>> as any of that would again be dead code then.)
>>>
>>> It will always be possible to come up with poor configurations. I do not
>>> believe it is necessarily our responsibility to go out of our way to
>>> prevent them.
>>
>> Well - if so, why would we do this in some cases but not in others?
>> You may recall that I'm a proponent of consistency and predictability.
>>
>>>>> 2) a pvshim_defconfig target which expresses what a pvshim ought to look
>>>>> like.
>>>>
>>>> We have this file already. I consider it debatable though whether this file
>>>> should really force PV_SHIM_EXCLUSIVE=y. People may read "pvshim" in the
>>>> name as either "works just as shim" or "can also work as shim".
>>>
>>> If I understood it right, I like Andrew's suggestion. He is suggesting
>>> to do the following:
>>>
>>> - turning PV_SHIM_EXCLUSIVE into something that does nothing
>>
>> FTAOD - you mean Kconfig-wise? Andrew clearly didn't say "nothing", but
>> "nothing other than making the boolean be a compile time constant".
> 
> Won't making the boolean a compile time constant would also result in
> DCO kicking in and removing a fair amount of code?  So even if you
> have enabled everything in Kconfig, the resulting hypervisor would
> only be suitable to be used as a shim?

Of course.

Jan

