Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B7B96BE48
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 15:22:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790344.1200061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpxP-0002Bm-TH; Wed, 04 Sep 2024 13:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790344.1200061; Wed, 04 Sep 2024 13:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpxP-00029I-Qi; Wed, 04 Sep 2024 13:21:59 +0000
Received: by outflank-mailman (input) for mailman id 790344;
 Wed, 04 Sep 2024 13:21:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1slpxO-00029A-MW
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 13:21:58 +0000
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [2a00:1450:4864:20::22e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a86136f9-6ac0-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 15:21:56 +0200 (CEST)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2f3edb2d908so21444461fa.2
 for <xen-devel@lists.xenproject.org>; Wed, 04 Sep 2024 06:21:56 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5c3c2e83ce5sm598375a12.26.2024.09.04.06.21.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Sep 2024 06:21:55 -0700 (PDT)
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
X-Inumbo-ID: a86136f9-6ac0-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725456116; x=1726060916; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbO7VdziOhx11clz+XjksduJF7dGP4/Nra5iFV9Er4Y=;
        b=Ek4U3SQS2X0IX+Xd2WZKrIHE2rlizUumMmaLGhlmUNSLOYuoYwFwKe0W3T3iKzsKoD
         1xsI0wZG7RfLHmNHN6wHi9r0z2N4PpzD4o4QAljRVDRUWSnKvQCZE31eYZcfWbUb9MWq
         FyuvUjjKKu5g73gaNDt1XRvpzP4ejwNtWsuDQkHksEXb8xzL4pCFC667NyMjOVhqBlms
         RiMaonw0g2QtgE4ZZf+LrhuM5yjPQ+c4IOZM6dx9eAc6NRhMcXhm+QVkQjIgJqh8MrFw
         /obeUFef4SQg07HJqXri2cCJOA6vRS1Pdyu9rB+aAH1jphDpdwBx1mgDix15NNDgn1va
         97EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725456116; x=1726060916;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZbO7VdziOhx11clz+XjksduJF7dGP4/Nra5iFV9Er4Y=;
        b=lExmCtbEk0XUhKCTbkINEU5i6X0GBE3YgvKjmf6amQw56uRTLRpK/PqF01ITLmhzZo
         43/HHDDKMu/uXYdzFaVxV1D45g+o4e2wcyr4F8O1fJh5Qc6IENY0mPIY2KNKaH7kiZ0J
         F24Knpkm5SOzL43RGOH5Y7eTT0n/Mis0JvMq+uYiq/ycJeU+zMDgL+3hRZ6e/5onaGE2
         0Nv/t/+T9wBTVd0n2pbGg+5n3UHCDsbg35aE5sed9By6wn7UteyujlXF4N0qnUHGxroE
         lOf0N9DcZKyQ2RycOeLHVaqLXS2HLK0vpjjSGe0kKb87zDmNTtp98MeeCxk0oe/2fz9/
         iMxA==
X-Forwarded-Encrypted: i=1; AJvYcCUR/m68n+9O6pncSx2V0IeFAJXVF8C/70oM+Go0eKuDX9Eid6ECvbtbcPvHal1hMCPy/hk/TxV6WTM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIZ9rkYpnwcBGw5/ZjZ2MTwJCuYcvfxiXSCuCJNuaAeOLRFze1
	K3UaVgl2bD7CtDiXoR4h7qK1+56TKhe+7aGJ91bmiW0YmGOyigLvSiIt0Q3Rl9DiLPdbt4d6phg
	=
X-Google-Smtp-Source: AGHT+IED5c4SuMxzS3ku+CGVVB//cnyq4mPX8vPJf7iQ2LTpuA+FmE7xvloZn0A93C96boeYpLqxxQ==
X-Received: by 2002:a2e:be12:0:b0:2f4:5d9:e8e3 with SMTP id 38308e7fff4ca-2f6443faed2mr61760741fa.7.1725456115512;
        Wed, 04 Sep 2024 06:21:55 -0700 (PDT)
Message-ID: <7fdae909-5614-4e1c-bcad-fb12ca490f41@suse.com>
Date: Wed, 4 Sep 2024 15:21:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] x86/time: probe the CMOS RTC by default
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20240903130303.71334-1-roger.pau@citrix.com>
 <20240903130303.71334-8-roger.pau@citrix.com>
 <66465a2a-f7a0-412d-b1af-98a28fd38472@suse.com>
 <ZthWTO6rOgAob-z_@macbook.local>
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
In-Reply-To: <ZthWTO6rOgAob-z_@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.09.2024 14:45, Roger Pau Monné wrote:
> On Tue, Sep 03, 2024 at 05:48:09PM +0200, Jan Beulich wrote:
>> On 03.09.2024 15:03, Roger Pau Monne wrote:
>>> Probing for the CMOS RTC registers consist in reading IO ports, and we expect
>>> those reads to have no side effects even when the CMOS RTC is not present.
>>
>> But what do we gain from this besides possible being slower to boot?
> 
> The intent is that Xen can successfully boot on more systems without
> having to pass specific command line options.

At the risk of breaking on others, in perhaps subtle ways?

>>> --- a/docs/misc/xen-command-line.pandoc
>>> +++ b/docs/misc/xen-command-line.pandoc
>>> @@ -326,11 +326,14 @@ Interrupts.  Specifying zero disables CMCI handling.
>>>  ### cmos-rtc-probe (x86)
>>>  > `= <boolean>`
>>>  
>>> -> Default: `false`
>>> +> Default: `true`
>>>  
>>>  Flag to indicate whether to probe for a CMOS Real Time Clock irrespective of
>>>  ACPI indicating none to be there.
>>>  
>>> +**WARNING: The `cmos-rtc-probe` option is deprecated and superseded by
>>> +_wallclock=no-cmos-probe_ using both options in combination is undefined.**
>>
>> Hmm, but then ...
>>
>>> @@ -2822,7 +2825,7 @@ suboptimal scheduling decisions, but only when the system is
>>>  oversubscribed (i.e., in total there are more vCPUs than pCPUs).
>>>  
>>>  ### wallclock (x86)
>>> -> `= auto | xen | cmos | efi`
>>> +> `= auto | xen | cmos | no-cmos-probe | efi`
>>
>> ... this wants to be a boolean sub-option "cmos-probe", such that the flag
>> can still be set both ways (in particular for a later command line option
>> to override an earlier one).
> 
> What's the point in overriding?  Either the users selects a specific
> wallclock to use, or it's left for Xen to decide which wallclock to
> pick, either with (auto) or without (no-cmos-probe) possibly probing
> the CMOS RTC.

Overriding can be quite relevant, in particular with xen.efi. There you put
command line options in a config file. You may not want to edit that config
file every time you try something (you may not even have an editor, first
and foremost when there's no EFI shell offered by firmware), and xen.efi
intentionally also parses options from its command line (after the first --
separator). Those "manually" supplied options want to be able to override
whatever is in the config file.

> Multiple different wallclock options being passed on the command line
> will result in just the last one taking effect.

That's the goal, yes.

>>> @@ -1560,6 +1560,8 @@ static int __init cf_check parse_wallclock(const char *arg)
>>>      if ( !arg )
>>>          return -EINVAL;
>>>  
>>> +    cmos_rtc_probe = true;
>>> +
>>>      if ( !strcmp("auto", arg) )
>>>          wallclock_source = WALLCLOCK_UNSET;
>>>      else if ( !strcmp("xen", arg) )
>>> @@ -1571,6 +1573,8 @@ static int __init cf_check parse_wallclock(const char *arg)
>>>      }
>>>      else if ( !strcmp("cmos", arg) )
>>>          wallclock_source = WALLCLOCK_CMOS;
>>> +    else if ( !strcmp("no-cmos-probe", arg) )
>>> +        cmos_rtc_probe = false;
>>>      else if ( !strcmp("efi", arg) )
>>>      {
>>>          if ( !efi_enabled(EFI_RS) )
>>
>> And to request a particular wallclock _and_ control the probing one then
>> needs two wallclock= on the command line? And - because of the forcing to
>> true of cmos_rtc_probe - even in a particular order. Not very nice from a
>> usability pov.
> 
> If you request a specific wallclock then there's no probing, so
> nothing to control.  I agree the interface is not great, but I
> couldn't come up with anything better.
> 
> I'm kind of fine with not introducing an extra option to wallclock= to
> control the CMOS RTC probing, but would you agree to switching
> cmos-rtc-probe to true by default?

I remain to be convinced of this being a good idea.

Jan

