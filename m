Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757AAB9D80E
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 07:58:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129892.1469596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1f04-0005bD-J5; Thu, 25 Sep 2025 05:58:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129892.1469596; Thu, 25 Sep 2025 05:58:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1f04-0005ZV-Ff; Thu, 25 Sep 2025 05:58:40 +0000
Received: by outflank-mailman (input) for mailman id 1129892;
 Thu, 25 Sep 2025 05:58:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v1f02-0005ZP-H4
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 05:58:38 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ad68a486-99d4-11f0-9d14-b5c5bf9af7f9;
 Thu, 25 Sep 2025 07:58:37 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-631845b51e2so611165a12.3
 for <xen-devel@lists.xenproject.org>; Wed, 24 Sep 2025 22:58:37 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-634a365093asm627828a12.18.2025.09.24.22.58.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Sep 2025 22:58:36 -0700 (PDT)
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
X-Inumbo-ID: ad68a486-99d4-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1758779916; x=1759384716; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cZjkbxKWrgIkfZ1tUIa7NXcyB06M2RYOUMqTSLQfcJY=;
        b=gLz1pxZuGrmKodaSA9qfNl2LT1qCubMiktzpe885we+wBuS/mLutnVaLjntyBre1GP
         l8GMBNjHhWTDhnxDQ9K3FrqFCiIBWZ70/WJRbOZTVPXETurdQUQi0QONFIUbB/Bq15zJ
         NvQ6iq5/ASFHoLBcdidOnkPplgPqLgQ3ej+wP4MHqFPSM6JKTXypFOjkWxE9N7TKAo9/
         RVbL8rFXwvtTABGUxfBueY27Jd/0RZBP+0zGIXPG8pWl/aY+cqoBvy2zi7OK4LDVdl4R
         QE2crU7e4aEug65ZVwDn8CyoCccKUEVPoLhWJa4ezIjHO8cL2fGRWG88SjZfy849z6iB
         /QDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758779916; x=1759384716;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cZjkbxKWrgIkfZ1tUIa7NXcyB06M2RYOUMqTSLQfcJY=;
        b=CufSTd9D8dvuPbtResJ0rRR6WN/+sj5RzTRwLPDMLNhSERLhhCxiPCsf2V4nAuq0T4
         M+XYvkkS0k6vFyyT6F+22SYvxhezt9ucGnJs4sGklgVMJprgt1Su9KjyOZGQLGIC5KFL
         8V/LSFmdc7IDuG0pxw90MnkxanY9YPxOVib4fRCRhiXllkzeszBD9hb+qVzC5o9GCZin
         q0QnE575+hnS9SaxXRYRSdHkytvRHkwI28U3W0/YAnwRqDGUHTw4XeHXEvOCltLtnqjG
         WyA1M8lyQfH7i4Q2qfsT0hJtX9h0jnJWot0/tszAVWcCaw3ridp2tHRyh2w8dDsdIjYU
         2OpA==
X-Forwarded-Encrypted: i=1; AJvYcCXvhgXCMS6Qi1PaYYW8/5IxirFC0t72S2EGZdOopGgXTDpE4H7fahViIb3Hjv4ofiH0RMQdraM3vd4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw5b/8ZUvyj28DIg2zyMjoUp1Y4bw+6kAiU/e73j10fCI05ObPx
	CNnxbta9syUhdETTTAOli1PAKPWG4q32WAxAbSMvAMCGIGzpOjrEr7lOMz3qdnbU5A==
X-Gm-Gg: ASbGncuABdZU+k1nUfnAkyiqdlfl0EQgm+4QM3N0UHi4poVBlpoH8YNZzgrc/FcwvJ+
	8VZYnn8PFX/61t6UyrO2mVYyUg6xFVl93B1l+NpmlLCXFlpGvA6PlGmfKvfPhSn/DbehWwhxhc0
	ulF0hfH9XIUg9wIO/dRIGYvTaOIW5qtbIEPbIxoHsfn7llwHCa3D5QQ51TuLV4kjirpAtnOM0eb
	yp8Bn4NXMcwYuP9KuluAdXkiG0NP5fNhvgHnou3EB0TWsiZuvU3ALsG5z/7W9kebZklyELBLu3L
	A20PGQKNXBeKlIRI+F8hgr3SFOytxYxdCMSg+TcWO4cu5YvCHcbvXuuezcHD1vI6VQF59NMpfj8
	hCopTovi9EjlYTMqWH/ulo8ns5wSLzHsmifx4kQCCYAJJI4pkzHB6kae9BVo6a+SJCnge6o2hDJ
	FP7Yrr104=
X-Google-Smtp-Source: AGHT+IFqaHGlAiJrxJ1BHzG4ru52kaCya5IwOHsTk6YUShppCyGe+BI2Q0RrlYasU2jVhWQhipTjSQ==
X-Received: by 2002:aa7:dbd8:0:b0:634:7224:c6b5 with SMTP id 4fb4d7f45d1cf-6349fa8f109mr1274277a12.28.1758779916475;
        Wed, 24 Sep 2025 22:58:36 -0700 (PDT)
Message-ID: <84cd0eeb-ff5c-474d-b0d0-eb79c4a33c9b@suse.com>
Date: Thu, 25 Sep 2025 07:58:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH 1/2] x86: hvm: vmx: fix runtime vmx presence check
 for !CONFIG_INTEL_VMX case
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew@xen.org>
References: <20250916103251.2144449-1-grygorii_strashko@epam.com>
 <3baf457c-d32b-4965-96bb-022a2f92bb9d@suse.com>
 <bcd7a98b-5827-4b4d-baa6-52fe24339faa@epam.com>
 <88cc4cf1-3bc9-47f5-b8f7-e04f01b027ee@xen.org>
 <DD0ZQLVE0KSS.3HHC8OHAQPL8L@amd.com>
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
In-Reply-To: <DD0ZQLVE0KSS.3HHC8OHAQPL8L@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24.09.2025 13:23, Alejandro Vallejo wrote:
> On Tue Sep 16, 2025 at 7:14 PM CEST, Andrew Cooper wrote:
>> On 16/09/2025 9:57 am, Grygorii Strashko wrote:
>>> Hi Jan,
>>>
>>> On 16.09.25 17:34, Jan Beulich wrote:
>>>> On 16.09.2025 12:32, Grygorii Strashko wrote:
>>>>> From: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>>
>>>>> Since commit b99227347230 ("x86: Fix AMD_SVM and INTEL_VMX
>>>>> dependency") the
>>>>> HVM Intel VT-x support can be gracefully disabled, but it still
>>>>> keeps VMX
>>>>> code partially built-in, because HVM code uses mix of:
>>>>>
>>>>>   - "cpu_has_vmx" macro, which doesn't account for CONFIG_INTEL_VMX cfg
>>>>>   - "using_vmx()" function, which accounts for CONFIG_INTEL_VMX cfg
>>>>>
>>>>> for runtime VMX availability checking. As result compiler DCE can't
>>>>> remove
>>>>> all, unreachable VMX code.
>>>>>
>>>>> Fix it by sticking to "cpu_has_vmx" macro usage only which is
>>>>> updated to
>>>>> account CONFIG_INTEL_VMX cfg.
>>>>>
>>>>> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
>>>>> ---
>>>>> Hi
>>>>>
>>>>> It could be good to have it in 4.21, so vmx/svm disabling
>>>>> option will be in complete state within 4.21 version.
>>>>
>>>> Imo this isn't release critical and has come too late. It's of course
>>>> Oleksii's call in the end.
>>>>
>>>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>>>> @@ -136,7 +136,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>>>   #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>>>>>   #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>>>>   #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>>>>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>>>>> +#define cpu_has_vmx             (IS_ENABLED(CONFIG_INTEL_VMX) && \
>>>>> +                                 boot_cpu_has(X86_FEATURE_VMX))
>>>>
>>>> I'm pretty sure using_vmx() was introduced precisely to avoid the use of
>>>> IS_ENABLED() here. What is completely missing from the description is a
>>>> discussion of the effect of this change on pre-existing uses of the
>>>> macro. ISTR there being at least one instance which would break with
>>>> that change. And no, I'm not looking forward to digging that out again,
>>>> when I already did at the time the using_vmx() was suggested and then
>>>> implemented. (I can't exclude it was the SVM counterpart; we want to
>>>> keep both in sync in any event, imo.)
> 
> Apologies if this has already been discussed, but I didn't participate in prior
> discussions. Targeted lookups in lore are not shedding a lot of light either.
> 
>>>
>>> Thank you for your comments and sorry for not digging into the history of
>>> the related patches.
>>>
>>> All, please ignore these patches as existing places. where
>>> cpu_has_vmx/smv
>>> are still used, need to be revised one by one.
>>>
>>
>> Off the top of my head, fixups to MSR_FEATURE_CONTROL, and AMD SKINIT
>> need cpu_has_vmx/svm not guarded by Kconfig like this.
>>
>> ~Andrew
> 
> What do you mean? AFAICS SKINIT is guarded by cpu_has_skinit, not cpu_has_svm.
> 
> And MSR_IA32_FEATURE_CONTROL tweaking seems self-contained in xen/hvm/vmx/ which
> is compiled out when !CONFIG_INTEL_VMX.
> 
> For the hypothetical case in which we might want to know the real HW value
> we can go look at the raw policy, as in "raw_cpu_policy.basic.vmx" or
> "raw_cpu_policy.extd.svm". Or what's mentioned in passing here.
> 
> https://lore.kernel.org/xen-devel/a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse.com/
> 
> Forcing the common case to use a helper and leaving the rare case in the
> shorthand macro seems like a bad idea. This ought to follow what cpu_has_nx
> already does.
> 
> Is there a specific code instance in which having IS_ENABLED() in the
> cpu_has_{svm,vmx} macros would cause issues today? While there are some dubious
> choices of svm vs vmx with or without negation, they all seem to resolve
> to correct code, with less codegen after IS_ENABLED() ends up in all the
> conditionals.
> 
> IOW: I have seen fear of incorrectness, but not proof of it. Now, obviously the
> burden of proof rests on the submitter, indeed, but I'd like to know where we
> stand in terms of what that proof would look like.

Such a proof could be a statement clarifying that all use sites were audited. If
then a reviewer found an issue with that, it would get interesting (as [possibly]
in: it being questionable whether an audit was actually done; what I mean to say
here is that it's not a matter of merely stating that an audit was [supposedly]
done).

Jan

> A naive grep shows not many
> sites to check.
> 
>   $git grep cpu_has_svm | grep -v cpu_has_svm_ | wc -l
>   6
> 
>   $git grep cpu_has_vmx | grep -v cpu_has_vmx_ | wc -l
>   11
> 
> cpu_has_X_Y would be off when cpu_has_X is off, but those shouldn't matter for
> this discussion.
> 
> Am I missing something here?
> 
> Cheers,
> Alejandro


