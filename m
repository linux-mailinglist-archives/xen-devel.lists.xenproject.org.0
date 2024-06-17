Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B69EE90AAFC
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jun 2024 12:26:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.742118.1148831 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ9Yh-0008TY-4E; Mon, 17 Jun 2024 10:25:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 742118.1148831; Mon, 17 Jun 2024 10:25:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJ9Yh-0008Rf-1R; Mon, 17 Jun 2024 10:25:55 +0000
Received: by outflank-mailman (input) for mailman id 742118;
 Mon, 17 Jun 2024 10:25:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E9YK=NT=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sJ9Yf-0008RZ-TH
 for xen-devel@lists.xenproject.org; Mon, 17 Jun 2024 10:25:53 +0000
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [2a00:1450:4864:20::536])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8809015-2c93-11ef-b4bb-af5377834399;
 Mon, 17 Jun 2024 12:25:51 +0200 (CEST)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57c83100c5fso4561565a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jun 2024 03:25:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57cb72da6fdsm6229678a12.31.2024.06.17.03.25.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jun 2024 03:25:50 -0700 (PDT)
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
X-Inumbo-ID: f8809015-2c93-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718619951; x=1719224751; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0GprUjYlawhnXFHZSE6K5QIBPrw0qkzh+mD69PrN5Lg=;
        b=dpc35s5JNL/D4Xz0XpKH4EMJCKY3d6eLQ+o0AXvOk13Z2lbl/lmnwsi8ST43qWpHoH
         i65YmEcAjOmiC7tsE9icFFLsHg0KyQcCMQNY5gJr3+SVu3d6ANC8jNCK8u8QB0607bEI
         VqIEBWUUYGXSm1XhS3KhAL6HGJ0Q/iWFj4BTxsHeyeQIEt58uVgzo3GP1H5mSDz4b/Jf
         RhQScfiIvj5wHUPucpT2sE5NrZ1hIzLlRd1q+cAqP0JeRcPjjs/MUUjHdzrmvpT4h9T/
         WNpzVUbwDCxpCdXLuLrWeHrfhmOshKfnOgcOOW84ZxvwF7ygu3JXsefKSU8RD08TqZc8
         a/9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718619951; x=1719224751;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GprUjYlawhnXFHZSE6K5QIBPrw0qkzh+mD69PrN5Lg=;
        b=n8l20YVoETHnxyHRLvTtQItxRdLzJ/bircQI27z7FsFsjB8YQI2qEDl98mcKTwCmwz
         XsdvmB47JrJPVtR302+v2CIO8XVo2zrZ+khct+QsUR6IpwbK4B4QRnGvOqJHfsTFhDoF
         mPim7pYs/X09OAltpFcgmZUR4HPJx+7IZuDgW60NldDvlEXHQMLleAOpog0m8DUmEjlL
         lOvIiTnZh0oyS9K1yz4prDxn+CuIjpzYLo6cHbCsHWwhcxKDl1htvwcGAm2VSMWWnPl3
         HD9+FJq2QT4zRAhNvs0m83DowAqeRD5h0Ifz9Lfbxi54O+YttsQkOwjyzdqWYVc66xQW
         cNJg==
X-Forwarded-Encrypted: i=1; AJvYcCVz5A30MZBA5J2jfa2iZZV9KZdi3KwxZOBo+6HpjcnZeCXL3otT+QM5+HzUPjPU14xPfjMWnjHVK29ztAbCXm4+5gumKt3S89J8w+VDcWE=
X-Gm-Message-State: AOJu0Yxd6WGouw28WqnisFg600td6xEFzEHal2yhsM0dvbXe87EDnR8z
	kdv8j51//+xjMP9JMaV7nW/dpPuHkBPEG1kmWlj7y3VZ64Y7duG3EEC9BAmGsg==
X-Google-Smtp-Source: AGHT+IGdhSocCvf3TX/yE7jXrTPFBei84T/Aqf1HbH8d8eq4JGfBaU43OFBKGnphMBWvtooeJoEtbA==
X-Received: by 2002:a50:c051:0:b0:57c:7413:a6e0 with SMTP id 4fb4d7f45d1cf-57cbd674310mr5608784a12.2.1718619950710;
        Mon, 17 Jun 2024 03:25:50 -0700 (PDT)
Message-ID: <cc1b52d8-163f-443c-8418-aba1c7d77ecb@suse.com>
Date: Mon, 17 Jun 2024 12:25:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] x86/boot: Collect the Raw CPU Policy earlier on boot
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20240523111627.28896-1-andrew.cooper3@citrix.com>
 <20240523111627.28896-4-andrew.cooper3@citrix.com>
 <8245f0ce-2964-4ecb-a31d-3e182a6d3e0b@suse.com>
 <6b4ed926-8934-4660-98c7-1856d0c90878@citrix.com>
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
In-Reply-To: <6b4ed926-8934-4660-98c7-1856d0c90878@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.06.2024 20:26, Andrew Cooper wrote:
> On 23/05/2024 4:44 pm, Jan Beulich wrote:
>> On 23.05.2024 13:16, Andrew Cooper wrote:
>>> This is a tangle, but it's a small step in the right direction.
>>>
>>> xstate_init() is shortly going to want data from the Raw policy.
>>> calculate_raw_cpu_policy() is sufficiently separate from the other policies to
>>> be safe to do.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Would you mind taking a look at
>> https://lists.xen.org/archives/html/xen-devel/2021-04/msg01335.html
>> to make clear (to me at least) in how far we can perhaps find common grounds
>> on what wants doing when? (Of course the local version I have has been
>> constantly re-based, so some of the function names would have changed from
>> what's visible there.)
> 
> That's been covered several times, at least in part.
> 
> I want to eventually move the host policy too, but I'm not willing to
> compound the mess we've currently got just to do it earlier.  It's just
> creating even more obstacles to doing it nicely.
> 
> Nothing in this series needs (or indeed should) use the host policy.

Hmm, I'm irritated: You talk about host policy here, ...

> The same is true of your AMX series.  You're (correctly) breaking the
> uniform allocation size and (when policy selection is ordered WRT vCPU
> creation, as discussed) it becomes solely depend on the guest policy.

... then guest policy, and ...

> xsave.c really has no legitimate use for the host policy once the
> uniform allocation size aspect has gone away.

... then host policy again. Whereas my patch switches to using the raw
policy, simply to eliminate redundant data. And your patch here is about
collecting raw policy earlier, too, for that to become usable by
xstate_init(). Differences between your any my variant are when exactly
raw policy collection happens, and that mine _additionally_ calculates
host policy a first time right after having calculated the raw one. My
patch specifically does not use the host policy in xstate_init(), nor in
the two new macros that are being introduced.

In the end it sounds like all you object to is my patch calculating the
host policy (a first time) earlier, too. As the description there says,
a subsequent change in that series needs this movement anyway. If some
suitable replacement for that dependency exists, I'm sure that early
calculation could be left out of the patch referenced above, if that's
indeed the sole concern.

>>> --- a/xen/arch/x86/cpu-policy.c
>>> +++ b/xen/arch/x86/cpu-policy.c
>>> @@ -845,7 +845,6 @@ static void __init calculate_hvm_def_policy(void)
>>>  
>>>  void __init init_guest_cpu_policies(void)
>>>  {
>>> -    calculate_raw_cpu_policy();
>>>      calculate_host_policy();
>>>  
>>>      if ( IS_ENABLED(CONFIG_PV) )
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1888,7 +1888,9 @@ void asmlinkage __init noreturn __start_xen(unsigned long mbi_p)
>>>  
>>>      tsx_init(); /* Needs microcode.  May change HLE/RTM feature bits. */
>>>  
>>> -    identify_cpu(&boot_cpu_data);
>>> +    calculate_raw_cpu_policy(); /* Needs microcode.  No other dependenices. */
>>> +
>>> +    identify_cpu(&boot_cpu_data); /* Needs microcode and raw policy. */
>> You don't introduce any dependency on raw policy here, and there cannot possibly
>> have been such a dependency before (unless there was a bug somewhere). Therefore
>> I consider this latter comment misleading at this point.
> 
> It's made true by the next patch, and I'm not included to split the
> comment across two patches which are going to be committed together in a
> unit.

Which is fine, so long as this is then not done silently, leaving it to
reviewers to notice (or not). IOW please: Just mention anomalies like this
in half a sentence in the description. (Committing as a unit is also an
uncertain thing, as long as that's not put forth as a strict requirement
somewhere. We do partial commits of series all the time, after all.)

Jan

