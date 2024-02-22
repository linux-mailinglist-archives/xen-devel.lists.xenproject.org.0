Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D699F85F6B4
	for <lists+xen-devel@lfdr.de>; Thu, 22 Feb 2024 12:26:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.684384.1064234 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd7Db-0004MN-7u; Thu, 22 Feb 2024 11:26:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 684384.1064234; Thu, 22 Feb 2024 11:26:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rd7Db-0004JM-4b; Thu, 22 Feb 2024 11:26:23 +0000
Received: by outflank-mailman (input) for mailman id 684384;
 Thu, 22 Feb 2024 11:26:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1gXq=J7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rd7DZ-0004JC-EG
 for xen-devel@lists.xenproject.org; Thu, 22 Feb 2024 11:26:21 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32f16d73-d175-11ee-98f5-efadbce2ee36;
 Thu, 22 Feb 2024 12:26:19 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a3ddc13bbb3so129254666b.0
 for <xen-devel@lists.xenproject.org>; Thu, 22 Feb 2024 03:26:19 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 rg8-20020a1709076b8800b00a3e28471fa4sm5339560ejc.59.2024.02.22.03.26.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Feb 2024 03:26:18 -0800 (PST)
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
X-Inumbo-ID: 32f16d73-d175-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1708601179; x=1709205979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zgKhvR11LyYdIZ9/4bMkbgjO3M131DXJ/4QsMosSG64=;
        b=DL8mrl+7+S+7Z6mcbtOhoWFYjSx+ru+NmBSvnbmcfi0vNqKZenjE0dIuU8+VTqAPZT
         SQqcZRFIOAvR9DR3PZvjSTKCsZeESprFlSdfWzhzonwoub6/Y+4EMk4aTigGrKsxK765
         cXg4WKuSbAy0gZ2qD1iw1vJYaxvqcMMmYahjdXDHnYjOPE/MM2qlrMeNqB+5QIPW+GS3
         mgLs7mV6XldnjK05NjDQp6HSui7BYZH3hYEFsCH7mLo3kBBB3+2qtvl07qIsYzzXhob6
         HAlIo21xEy3oc0/pv7fR4RaKPLkrPCitEUat2VS4ADGB+HIB356I4LJeGiwJlUZYJdZ5
         cw4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708601179; x=1709205979;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zgKhvR11LyYdIZ9/4bMkbgjO3M131DXJ/4QsMosSG64=;
        b=Tgm/UGG2YtgNgVcXtt8txFHWcBvWu3e6lFxOoB+qPzN8TJuB1cEGVlbJfm9A2jHMjI
         xk7lU9GLCySGZRPQv6QKv16OmIYDSrVG/b6akM4oPyl2yPpqwsfHuJ3B6FBS01uvqKJL
         ZVnSlWP1/yEhRhPIOSVUG/hczFFg0+ARXV8xOXRj9g8taKs1IzTY+uwKQW+SW23q/Jea
         UDLR3lYn49fRH/JbonFAr4Wpb05TKFeQnjRYzlv5Qer1gjJKjhO44H9+h72S6ONgoQkE
         CLiCOQhl7NqsdAJ+8l1D7TTqfeCa35aNosSKXl7lib3QcESbd0yoP9IfWeifdW5wqruF
         y09g==
X-Forwarded-Encrypted: i=1; AJvYcCVNcBQoyRzn6tlM2PjNzTyVX5AEDILFctvSbEC7yb+VMoACxHdrwXVSwd2Ya9wwweVqb1m1khsOPlDdYoLGN2/qLUEPq8tQxknp28tT4OY=
X-Gm-Message-State: AOJu0YxJodOUzBJoxvodRjG+6AL/N1+tZYjk4L8PPMKWwocP4L46FnAK
	bhtJuju6wfd2Zz23Vbo/uHV5eH2kVRgtS5bH81q6uNN6ctX4jG+r9dmB3t18Bg==
X-Google-Smtp-Source: AGHT+IGidJzeOmy8hmXeN2kzUtYGC73k08fYyOFm4rIaQ9wNe2VRQRzgbo+MIv5VZRdzSQ9jsd1pPw==
X-Received: by 2002:a17:907:9712:b0:a3f:2596:790c with SMTP id jg18-20020a170907971200b00a3f2596790cmr2744806ejc.8.1708601178656;
        Thu, 22 Feb 2024 03:26:18 -0800 (PST)
Message-ID: <bace3eda-3505-497d-a028-86bafc03de9b@suse.com>
Date: Thu, 22 Feb 2024 12:26:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] nestedsvm: Disable TscRateMSR
To: George Dunlap <george.dunlap@cloud.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20240206012051.3564035-1-george.dunlap@cloud.com>
 <20240206012051.3564035-5-george.dunlap@cloud.com>
 <c5f3a78c-4a2b-499b-93bb-11f60b0afcc0@suse.com>
 <CA+zSX=acH-4B01=vUBstAbsNBMVgcRe_A5v0eXn66BdsuPtgiA@mail.gmail.com>
 <74ef7b2b-b105-4060-afaa-73ec272a7449@suse.com>
 <CA+zSX=ZPKScDQO6XXGOp6gv1arEs4-iWTgX8NSezYo4LGqkoLA@mail.gmail.com>
 <40ff2158-78aa-478b-b591-02bbcb1bf88f@suse.com>
 <CA+zSX=b4DKJ1_s9E8N9EGu09=zzQC+NPVMHeF-C1gHxT5RgSog@mail.gmail.com>
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
In-Reply-To: <CA+zSX=b4DKJ1_s9E8N9EGu09=zzQC+NPVMHeF-C1gHxT5RgSog@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.02.2024 12:00, George Dunlap wrote:
> On Thu, Feb 22, 2024 at 5:50 PM Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 22.02.2024 10:30, George Dunlap wrote:
>>> On Wed, Feb 21, 2024 at 6:52 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>>>> But then of course Andrew may know of reasons why all of this is done
>>>>>> in calculate_host_policy() in the first place, rather than in HVM
>>>>>> policy calculation.
>>>>>
>>>>> It sounds like maybe you're confusing host_policy with
>>>>> x86_capabilities?  From what I can tell:
>>>>>
>>>>> *  the "basic" cpu_has_X macros resolve to boot_cpu_has(), which
>>>>> resolves to cpu_has(&boot_cpu_data, ...), which is completely
>>>>> independent of the cpu-policy.c:host_cpu_policy
>>>>>
>>>>> * cpu-policy.c:host_cpu_policy only affects what is advertised to
>>>>> guests, via {pv,hvm}_cpu_policy and featureset bits.  Most notably a
>>>>> quick skim doesn't show any mechanism by which host_cpu_policy could
>>>>> affect what features Xen itself decides to use.
>>>>
>>>> I'm not mixing the two, no; the two are still insufficiently disentangled.
>>>> There's really no reason (long term) to have both host policy and
>>>> x86_capabilities. Therefore I'd prefer if new code (including a basically
>>>> fundamental re-write as is going to be needed for nested) to avoid
>>>> needlessly further extending x86_capabilities. Unless of course there's
>>>> something fundamentally wrong with eliminating the redundancy, which
>>>> likely Andrew would be in the best position to point out.
>>>
>>> So I don't know the history of how things got to be the way they are,
>>> nor really much about the code but what I've gathered from skimming
>>> through while creating this patch series.  But from that impression,
>>> the only issue I really see with the current code is the confusing
>>> naming.  The cpufeature.h code has this nice infrastructure to allow
>>> you to, for instance, enable or disable certain bits on the
>>> command-line; and the interface for querying all the different bits of
>>> functionality is all nicely put in one place.  Moving the
>>> svm_feature_flags into x86_capabilities would immediately allow SVM to
>>> take advantage of this infrastructure; it's not clear to me how this
>>> would be "needless".
>>>
>>> Furthermore, it looks to me like host_cpu_policy is used as a starting
>>> point for generating pv_cpu_policy and hvm_cpu_policy, both of which
>>> are only used for guest cpuid generation.  Given that the format of
>>> those policies is fixed, and there's a lot of "copy this bit from the
>>> host policy wholesale", it seems like no matter what, you'd want a
>>> host_cpu_policy.
>>>
>>> And in any case -- all that is kind of moot.  *Right now*,
>>> host_cpu_policy is only used for guest cpuid policy creation; *right
>>> now*, the nested virt features of AMD are handled in the
>>> host_cpu_policy; *right now*, we're advertising to guests bits which
>>> are not properly virtualized; *right now* these bits are actually set
>>> unconditionally, regardless of whether they're even available on the
>>> hardware; *right now*, Xen uses svm_feature_flags to determine its own
>>> use of TscRateMSR; so *right now*, removing this bit from
>>> host_cpu_policy won't prevent Xen from using TscRateMSR itself.
>>>
>>> (Unless my understanding of the code is wrong, in which case I'd
>>> appreciate a correction.)
>>
>> There's nothing wrong afaics, just missing at least one aspect: Did you
>> see all the featureset <-> policy conversions in cpu-policy.c? That (to
>> me at least) clearly is a sign of unnecessary duplication of the same
>> data. This goes as far as seeding the host policy from the raw one, just
>> to then immediately run x86_cpu_featureset_to_policy(), thus overwriting
>> a fair part of what was first taken from the raw policy. That's necessary
>> right now, because setup_{force,clear}_cpu_cap() act on
>> boot_cpu_data.x86_capability[], not the host policy.
>>
>> As to the "needless" further up, it's only as far as moving those bits
>> into x86_capability[] would further duplicate information, rather than
>> (for that piece at least) putting them into the policies right away. But
>> yes, if the goal is to have setup_{force,clear}_cpu_cap() be able to
>> control those bits as well, then going the intermediate step would be
>> unavoidable at this point in time.
> 
> I'm still not sure of what needs to happen to move this forward.
> 
> As I said, I'm not opposed to doing some prep work; but I don't want
> to randomly guess as to what kinds of clean-up needs to be done, only
> to be told it was wrong (either by you when I post it or by Andy
> sometime after it's checked in).
> 
> I could certainly move svm_feature_flags into host_cpu_policy, and
> have cpu_svm_feature_* reference host_cpu_policy instead (after moving
> the nested virt "guest policy" tweaks into hvm_cpu_policy); but as far
> as I can tell, that would be the *very first* instance of Xen using
> host_cpu_policy in that manner.  I'd like more clarity that this is
> the long-term direction that things are going before then.
> 
> If you (plural) don't have time now to refresh your memory / make an
> informed decision about what you want to happen, then please consider
> just taking the patch as it is; it doesn't make future changes any
> harder.

I'd be willing to ack the patch as is if I understood the piece of code
in calculate_host_policy() that is being changed here. My take is that
in a prereq patch that wants adjusting, by moving it wherever applicable.
Without indications to the contrary, it living there is plain wrong, and
the patch here touching that function isn't quite right either, even if
only as a result of the original issue.

If without at least a little bit of input from Andrew we can't move
forward, then that's the way it is - we need to wait. As you likely know
I have dozens of patches in that state ...

Jan

