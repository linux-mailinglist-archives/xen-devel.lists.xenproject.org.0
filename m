Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C90C7819B5C
	for <lists+xen-devel@lfdr.de>; Wed, 20 Dec 2023 10:26:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657508.1026385 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsq1-0006mV-Mv; Wed, 20 Dec 2023 09:26:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657508.1026385; Wed, 20 Dec 2023 09:26:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFsq1-0006k2-JW; Wed, 20 Dec 2023 09:26:01 +0000
Received: by outflank-mailman (input) for mailman id 657508;
 Wed, 20 Dec 2023 09:26:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFsq0-0006jv-9b
 for xen-devel@lists.xenproject.org; Wed, 20 Dec 2023 09:26:00 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8fe9897-9f19-11ee-98eb-6d05b1d4d9a1;
 Wed, 20 Dec 2023 10:25:59 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3367632ce7bso1009396f8f.2
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 01:25:59 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 be8-20020a05600c1e8800b0040b397787d3sm6924381wmb.24.2023.12.20.01.25.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 01:25:58 -0800 (PST)
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
X-Inumbo-ID: c8fe9897-9f19-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1703064358; x=1703669158; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VXttWcstDT+d8GLd5dJ9HAv7Qf+YsetdGSBmieF77V0=;
        b=BOf5o1pNFA96VuOIzRfGxQVL1GKywRIcJpR1G9Wb1rzlSBjZxua29swVSkwTrR7vyo
         Oz1A4KgNnmrds7QcbjgElayRO+esDKb4lFzflBOXSyFlo8WZ7xVjD8F1BpuMzNughMPG
         YDnERP67XTXMtSt+xo94eZlUcd9dfCAQ7SfHMKZHBAGZJrS95SE/UZrrsgecThHe79F7
         FM1OJ/ZbS3+GBLiW+4WZlxv1/i2j844+U56Bm6Kxojnim+OuOSmbCeRIpWaUSfMY7nPN
         AuD3tQP2ckZP51HHGzZMbSzGK2j07RusPwzG9mIHcmef4kmsSgp6MaQJ2UHdWQC87iKL
         IFAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703064358; x=1703669158;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXttWcstDT+d8GLd5dJ9HAv7Qf+YsetdGSBmieF77V0=;
        b=MUFVZGgKWijqfK2fwh9x15o2YzJIOtPV/ndm1BhK8xAPaddH7eSTil/je6OOBmb5oa
         yjDQvEcA2deQkFWS967TJsygzbrzWIEFbBA2xMw7pNTdKdy318hWy9PoMnnS6Lr3nYgF
         J5ngFzK/vYzJ3AwTSDqvxlT5yHxiCm8fSM0iWSi3+/AmQeR0pGPI4GURsYJrqYTfxKJ0
         xIm0G/mXrl+SxSOumEVRhzr8UZqnX2ZqWnJsO+BhcrefiM545xvHQdVw8GLrki9rbk6X
         wAqIfHcp1rWYzz83b/kG5tyo602Oojz4B+aLg28Gj1K4k865LREB1QQfc5aohl3sCSWj
         bk3g==
X-Gm-Message-State: AOJu0YwyHnakOeP7UXtz2Is2YvFfts3ks9heOumAHPyza5IzRl8NYiGP
	QGF9m3ptBuXnftXZG7FF5UmV
X-Google-Smtp-Source: AGHT+IG8MKCgpmbYt+E1geVldr3xej0VRm15K1FhTQ0NqKl/XaG9XQcxUAl6wA9qTFWu4aBszSDwYg==
X-Received: by 2002:a7b:c388:0:b0:40c:36b4:a7aa with SMTP id s8-20020a7bc388000000b0040c36b4a7aamr11390604wmj.26.1703064358544;
        Wed, 20 Dec 2023 01:25:58 -0800 (PST)
Message-ID: <13b34047-1137-44dd-ad74-27ec5b5fb8d3@suse.com>
Date: Wed, 20 Dec 2023 10:25:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] x86/PV: issue branch prediction barrier when
 switching 64-bit guest to kernel mode
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <06591b64-2f05-a4cc-a2f3-a74c3c4a76d6@suse.com>
 <2863b0a9-ca7c-3cce-104d-0b6685b0b383@suse.com> <ZYCARJAxH9hBD0YQ@macbook>
 <6e022af1-d383-48be-ab54-6ec254aa1502@suse.com> <ZYGC8JaJ45tkbqQC@macbook>
 <aacaa220-3e95-4dff-9572-79f9e79faeae@suse.com> <ZYGyjQiAomxh0QnI@macbook>
 <ZYHNzo8UFzOkt0pv@macbook>
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
In-Reply-To: <ZYHNzo8UFzOkt0pv@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.12.2023 18:07, Roger Pau Monné wrote:
> On Tue, Dec 19, 2023 at 04:11:09PM +0100, Roger Pau Monné wrote:
>> On Tue, Dec 19, 2023 at 03:06:50PM +0100, Jan Beulich wrote:
>>> On 19.12.2023 12:48, Roger Pau Monné wrote:
>>>> On Tue, Dec 19, 2023 at 10:56:16AM +0100, Jan Beulich wrote:
>>>>> On 18.12.2023 18:24, Roger Pau Monné wrote:
>>>>>> On Tue, Feb 14, 2023 at 05:12:08PM +0100, Jan Beulich wrote:
>>>>>>> --- a/xen/arch/x86/pv/domain.c
>>>>>>> +++ b/xen/arch/x86/pv/domain.c
>>>>>>> @@ -455,6 +455,7 @@ static void _toggle_guest_pt(struct vcpu
>>>>>>>  void toggle_guest_mode(struct vcpu *v)
>>>>>>>  {
>>>>>>>      const struct domain *d = v->domain;
>>>>>>> +    struct cpu_info *cpu_info = get_cpu_info();
>>>>>>>      unsigned long gs_base;
>>>>>>>  
>>>>>>>      ASSERT(!is_pv_32bit_vcpu(v));
>>>>>>> @@ -467,15 +468,21 @@ void toggle_guest_mode(struct vcpu *v)
>>>>>>>      if ( v->arch.flags & TF_kernel_mode )
>>>>>>>          v->arch.pv.gs_base_kernel = gs_base;
>>>>>>>      else
>>>>>>> +    {
>>>>>>>          v->arch.pv.gs_base_user = gs_base;
>>>>>>> +
>>>>>>> +        if ( opt_ibpb_mode_switch &&
>>>>>>> +             !(d->arch.spec_ctrl_flags & SCF_entry_ibpb) &&
>>>>>>> +             !VM_ASSIST(d, mode_switch_no_ibpb) )
>>>>>>> +            cpu_info->spec_ctrl_flags |= SCF_new_pred_ctxt;
>>>>>>
>>>>>> Likewise similar to the remarks I've made before, if doing an IBPB on
>>>>>> entry is enough to cover for the case here, it must also be fine to
>>>>>> issue the IBPB right here, instead of deferring to return to guest
>>>>>> context?
>>>>>>
>>>>>> The only concern would be (as you mentioned before) to avoid clearing
>>>>>> valid Xen predictions, but I would rather see some figures about what
>>>>>> effect the delaying to return to guest has vs issuing it right here.
>>>>>
>>>>> Part of the reason (aiui) to do things on the exit path was to
>>>>> consolidate the context switch induced one and the user->kernel switch
>>>>> one into the same place and mechanism.
>>>>
>>>> Isn't it kind of a very specific case that we end up doing a
>>>> user->kernel switch as part of a context switch?  IOW: would require
>>>> the vCPU to be scheduled out at that very specific point.
>>>
>>> No, there's no user->kernel switch at the same time as context switch.
>>> What I was trying to explain is that with the actual IBPB being issued
>>> on exit to guest, both the context switch path and the user->kernel
>>> mode switch path set the same indicator, for the exit path to consume.
>>
>> Deferring to exit to guest path could be OK, but unless strictly
>> needed, which I don't think it's the case, I would request for IBPB to
>> be executed in C context rather than assembly one.
>>
>>>>>>> + *
>>>>>>> + * By default (on affected and capable hardware) as a safety measure Xen,
>>>>>>> + * to cover for the fact that guest-kernel and guest-user modes are both
>>>>>>> + * running in ring 3 (and hence share prediction context), would issue a
>>>>>>> + * barrier for user->kernel mode switches of PV guests.
>>>>>>> + */
>>>>>>> +#define VMASST_TYPE_mode_switch_no_ibpb  33
>>>>>>
>>>>>> Would it be possible to define the assist as
>>>>>> VMASST_TYPE_mode_switch_ibpb and have it on when enabled?  So that the
>>>>>> guest would disable it if unneeded?  IMO negated options are in
>>>>>> general harder to understand.
>>>>>
>>>>> Negative options aren't nice, yes, but VM assists start out as all
>>>>> clear.
>>>>
>>>> Are you sure?  I see VMASST_TYPE_pae_extended_cr3 getting set in
>>>> dom0_construct_pv() and that makes me wonder whether other bits
>>>> couldn't start set also.
>>>>
>>>> Maybe there's some restriction I'm missing, but I don't see any
>>>> wording in the description of the interface that states that all
>>>> assists are supposed to start disabled.
>>>
>>> Well, that setting of pae_extended_cr3 is in response to the kernel's
>>> notes section having a respective indicator. So we still only set the
>>> bit in response to what the kernel's asking us to do, just that here
>>> we carry out the request ahead of launching the kernel.
>>>
>>> Also consider what would happen during migration if there was a
>>> default-on assist: At the destination we can't know whether the
>>> source simply didn't know of the bit, or whether the guest elected to
>>> clear it.
>>
>> Hm, I see, so I was indeed missing that aspect.  VM assist is passed
>> as a plain bitmap, and there's no signal on which assists the VM had
>> available on the source side if not enabled.
> 
> Sorry, please bear with me, as I've been further thinking about this.
> 
> Why does the assist needs to be default-on?  It's my understanding
> that the guest can execute the IBPB itself by writing to the MSR, but
> that's suboptimal in the user -> kernel context switch as it then
> involves two traps into Xen, but the guest is not left insecure, it
> just needs to write the MSR itself like on native.
> 
> In fact, if we add an IBPB by default as part of amd64 PV user ->
> kernel guest context switch, we are likely doing a double IBPB on
> guests not aware of the assist.
> 
> IOW: I don't know why doing the assist as guest opt-in would be
> insecure, in fact I think it's the best approach (again I might be
> missing something).

By issuing IBPB by default we can make guests safe (in this regard)
irrespective of their awareness of IBPB, and in particular their
awareness of IBPB being needed explicitly on the user->kernel mode
transition (where on native, with IBRS enabled, sufficient separation
exists iirc). IOW we're trying to cater for a 64-bit-PV special aspect
by default. (Andrew, please correct me if there's anything wrong in
here.)

Jan

