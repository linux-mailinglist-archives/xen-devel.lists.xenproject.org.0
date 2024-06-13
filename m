Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCF6907328
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 15:08:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739978.1146979 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHkB0-0006xQ-VC; Thu, 13 Jun 2024 13:07:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739978.1146979; Thu, 13 Jun 2024 13:07:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHkB0-0006vf-Rz; Thu, 13 Jun 2024 13:07:38 +0000
Received: by outflank-mailman (input) for mailman id 739978;
 Thu, 13 Jun 2024 13:07:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHkAz-0006vZ-Nh
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 13:07:37 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e75bdb48-2985-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 15:07:36 +0200 (CEST)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-a6f0dc80ab9so163825566b.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 06:07:36 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56f416dfsm70921266b.164.2024.06.13.06.07.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 06:07:35 -0700 (PDT)
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
X-Inumbo-ID: e75bdb48-2985-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718284056; x=1718888856; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vE/yhJRg2OuaMGSiE8GwcWt6S2O+bUofmKJ0USws6KU=;
        b=PwNsTeHEFyyHU02FZlC6wxTTh5Jt3jMUqy3KR72My+A1f7SWTkTBWjbr7C+VRCgGGG
         cRrCLItUkbyYcB/UUwbWpB5IEA8FmFB7vxrCNpyoxc4IGRG1Kg9W84Q1z3arxBz5/kAC
         58eW40baQGAfBNOzNDBX8Wiem+s9HyUX2MwMJGf6pdAHQ44Ix0r9rgvLWFgLPaXuW39x
         uAP+YYh3oJrOYnxVNu3XhRxCzcESZoRFjF/dUuL5SKpId0SSVOFmq8wAKoF+GqS29FZn
         QSSeBjlhd1y1QQf9fZ1cj2ILvxotVGqbpPL9LbzDibC+BX9gKhwTk1gOcs2zZSCCgWrK
         0rFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718284056; x=1718888856;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vE/yhJRg2OuaMGSiE8GwcWt6S2O+bUofmKJ0USws6KU=;
        b=kpejchbv7h1Ywqj+M5anG5830e7vTMl+Tt8qz8naZOZrJdV5L2dgjXGWtMdF8fPjd1
         1MerbhUFk9mZQ/Hi36ytAi2O120cF3Z6yjsMMWKS0cSL0BgFj8wNcU6up4/XhIpYENIS
         Tpm2xfRnCcyahHlD1eVD4RDUO6Hgd1P5CyFm2mMoBqsN8XXdE3NotXvZ0P31u8AFHcJj
         YnrR83rKj8+EW+ODFUvCA6Jr36ZdHEnUUGO37H1PAMer3wltmU9KOxKlWLIBZB5PeK6f
         dDMzZ0FIOLhoh0fnrCaJLb6rrbknEgaHRGfORA1uz6YWof74XCXVHCuIeFtGBtDvLuQW
         YBoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0yfjP5Pn7Wy87Asmv0P6fBEQ069gBCxt4PPzhh+MfW3VcAuwtTjZQxSrVuxBvp2OBX5RD4PEO7yPu5GMyiXphsRYmSK3swVt/BzbH9mA=
X-Gm-Message-State: AOJu0YyOTl/SAhSMU6JwdirUsTOsjhvuJFmv8qMZ3i+f3Qh3u0vlp86P
	sSL+M7XGod9n1o6T8oe0qJcZgUpyycs50eboOrSkxrf69TjCFSO2evhnQ3SRDVQkeCkvFfTe/aI
	=
X-Google-Smtp-Source: AGHT+IH68n6+mAuhzYQ9m/AR+2EDepWY9iUfsKhnuM+BlRViNEXHNds2Yx0yuO1kW6hEs/zx/Y4FQQ==
X-Received: by 2002:a17:906:8411:b0:a6e:f701:384d with SMTP id a640c23a62f3a-a6f47c9ef68mr283846366b.29.1718284055706;
        Thu, 13 Jun 2024 06:07:35 -0700 (PDT)
Message-ID: <1f8c1b9d-7503-4ec5-955f-a025fd06f1b8@suse.com>
Date: Thu, 13 Jun 2024 15:07:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] x86/irq: handle moving interrupts in
 _assign_irq_vector()
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20240610142043.11924-1-roger.pau@citrix.com>
 <20240610142043.11924-7-roger.pau@citrix.com>
 <9de1a9c7-814c-4375-9182-90a2f04806b2@suse.com> <Zml6-ViFPTWI1cUc@macbook>
 <d5b1d273-913e-4d53-9fb6-9b01525da498@suse.com> <ZmnAgSBjjP6N-uJS@macbook>
 <d45ef203-aa29-4aa6-8b40-0449334a2bf0@suse.com> <ZmrYjv2ljhf-1Ag_@macbook>
 <f4c51152-e8a0-4715-af75-4b8c7801fa08@suse.com> <ZmrsQ0ncZWD3tXXV@macbook>
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
In-Reply-To: <ZmrsQ0ncZWD3tXXV@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2024 14:55, Roger Pau Monné wrote:
> On Thu, Jun 13, 2024 at 01:36:55PM +0200, Jan Beulich wrote:
>> On 13.06.2024 13:31, Roger Pau Monné wrote:
>>> On Thu, Jun 13, 2024 at 10:38:35AM +0200, Jan Beulich wrote:
>>>> On 12.06.2024 17:36, Roger Pau Monné wrote:
>>>>> On Wed, Jun 12, 2024 at 03:42:58PM +0200, Jan Beulich wrote:
>>>>>> On 12.06.2024 12:39, Roger Pau Monné wrote:
>>>>>>> On Tue, Jun 11, 2024 at 03:18:32PM +0200, Jan Beulich wrote:
>>>>>>>> On 10.06.2024 16:20, Roger Pau Monne wrote:
>>>>>>>>> Currently there's logic in fixup_irqs() that attempts to prevent
>>>>>>>>> _assign_irq_vector() from failing, as fixup_irqs() is required to evacuate all
>>>>>>>>> interrupts from the CPUs not present in the input mask.  The current logic in
>>>>>>>>> fixup_irqs() is incomplete, as it doesn't deal with interrupts that have
>>>>>>>>> move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.
>>>>>>>>>
>>>>>>>>> Instead of attempting to fixup the interrupt descriptor in fixup_irqs() so that
>>>>>>>>> _assign_irq_vector() cannot fail, introduce logic in _assign_irq_vector()
>>>>>>>>> to deal with interrupts that have either move_{in_progress,cleanup_count} set
>>>>>>>>> and no remaining online CPUs in ->arch.cpu_mask.
>>>>>>>>>
>>>>>>>>> If _assign_irq_vector() is requested to move an interrupt in the state
>>>>>>>>> described above, first attempt to see if ->arch.old_cpu_mask contains any valid
>>>>>>>>> CPUs that could be used as fallback, and if that's the case do move the
>>>>>>>>> interrupt back to the previous destination.  Note this is easier because the
>>>>>>>>> vector hasn't been released yet, so there's no need to allocate and setup a new
>>>>>>>>> vector on the destination.
>>>>>>>>>
>>>>>>>>> Due to the logic in fixup_irqs() that clears offline CPUs from
>>>>>>>>> ->arch.old_cpu_mask (and releases the old vector if the mask becomes empty) it
>>>>>>>>> shouldn't be possible to get into _assign_irq_vector() with
>>>>>>>>> ->arch.move_{in_progress,cleanup_count} set but no online CPUs in
>>>>>>>>> ->arch.old_cpu_mask.
>>>>>>>>>
>>>>>>>>> However if ->arch.move_{in_progress,cleanup_count} is set and the interrupt has
>>>>>>>>> also changed affinity, it's possible the members of ->arch.old_cpu_mask are no
>>>>>>>>> longer part of the affinity set,
>>>>>>>>
>>>>>>>> I'm having trouble relating this (->arch.old_cpu_mask related) to ...
>>>>>>>>
>>>>>>>>> move the interrupt to a different CPU part of
>>>>>>>>> the provided mask
>>>>>>>>
>>>>>>>> ... this (->arch.cpu_mask related).
>>>>>>>
>>>>>>> No, the "provided mask" here is the "mask" parameter, not
>>>>>>> ->arch.cpu_mask.
>>>>>>
>>>>>> Oh, so this describes the case of "hitting" the comment at the very bottom of
>>>>>> the first hunk then? (I probably was misreading this because I was expecting
>>>>>> it to describe a code change, rather than the case where original behavior
>>>>>> needs retaining. IOW - all fine here then.)
>>>>>>
>>>>>>>>> and keep the current ->arch.old_{cpu_mask,vector} for the
>>>>>>>>> pending interrupt movement to be completed.
>>>>>>>>
>>>>>>>> Right, that's to clean up state from before the initial move. What isn't
>>>>>>>> clear to me is what's to happen with the state of the intermediate
>>>>>>>> placement. Description and code changes leave me with the impression that
>>>>>>>> it's okay to simply abandon, without any cleanup, yet I can't quite figure
>>>>>>>> why that would be an okay thing to do.
>>>>>>>
>>>>>>> There isn't much we can do with the intermediate placement, as the CPU
>>>>>>> is going offline.  However we can drain any pending interrupts from
>>>>>>> IRR after the new destination has been set, since setting the
>>>>>>> destination is done from the CPU that's the current target of the
>>>>>>> interrupts.  So we can ensure the draining is done strictly after the
>>>>>>> target has been switched, hence ensuring no further interrupts from
>>>>>>> this source will be delivered to the current CPU.
>>>>>>
>>>>>> Hmm, I'm afraid I still don't follow: I'm specifically in trouble with
>>>>>> the ...
>>>>>>
>>>>>>>>> --- a/xen/arch/x86/irq.c
>>>>>>>>> +++ b/xen/arch/x86/irq.c
>>>>>>>>> @@ -544,7 +544,53 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
>>>>>>>>>      }
>>>>>>>>>  
>>>>>>>>>      if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
>>>>>>>>> -        return -EAGAIN;
>>>>>>>>> +    {
>>>>>>>>> +        /*
>>>>>>>>> +         * If the current destination is online refuse to shuffle.  Retry after
>>>>>>>>> +         * the in-progress movement has finished.
>>>>>>>>> +         */
>>>>>>>>> +        if ( cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) )
>>>>>>>>> +            return -EAGAIN;
>>>>>>>>> +
>>>>>>>>> +        /*
>>>>>>>>> +         * Due to the logic in fixup_irqs() that clears offlined CPUs from
>>>>>>>>> +         * ->arch.old_cpu_mask it shouldn't be possible to get here with
>>>>>>>>> +         * ->arch.move_{in_progress,cleanup_count} set and no online CPUs in
>>>>>>>>> +         * ->arch.old_cpu_mask.
>>>>>>>>> +         */
>>>>>>>>> +        ASSERT(valid_irq_vector(desc->arch.old_vector));
>>>>>>>>> +        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
>>>>>>>>> +
>>>>>>>>> +        if ( cpumask_intersects(desc->arch.old_cpu_mask, mask) )
>>>>>>>>> +        {
>>>>>>>>> +            /*
>>>>>>>>> +             * Fallback to the old destination if moving is in progress and the
>>>>>>>>> +             * current destination is to be offlined.  This is only possible if
>>>>>>>>> +             * the CPUs in old_cpu_mask intersect with the affinity mask passed
>>>>>>>>> +             * in the 'mask' parameter.
>>>>>>>>> +             */
>>>>>>>>> +            desc->arch.vector = desc->arch.old_vector;
>>>>>>>>> +            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
>>>>>>
>>>>>> ... replacing of vector (and associated mask), without any further accounting.
>>>>>
>>>>> It's quite likely I'm missing something here, but what further
>>>>> accounting you would like to do?
>>>>>
>>>>> The current target of the interrupt (->arch.cpu_mask previous to
>>>>> cpumask_and()) is all going offline, so any attempt to set it in
>>>>> ->arch.old_cpu_mask would just result in a stale (offline) CPU getting
>>>>> set in ->arch.old_cpu_mask, which previous patches attempted to
>>>>> solve.
>>>>>
>>>>> Maybe by "further accounting" you meant something else not related to
>>>>> ->arch.old_{cpu_mask,vector}?
>>>>
>>>> Indeed. What I'm thinking of is what normally release_old_vec() would
>>>> do (of which only desc->arch.used_vectors updating would appear to be
>>>> relevant, seeing the CPU's going offline). The other one I was thinking
>>>> of, updating vector_irq[], likely is also unnecessary, again because
>>>> that's per-CPU data of a CPU going down.
>>>
>>> I think updating vector_irq[] should be explicitly avoided, as doing
>>> so would prevent us from correctly draining any pending interrupts
>>> because the vector -> irq mapping would be broken when the interrupt
>>> enable window at the bottom of fixup_irqs() is reached.
>>>
>>> For used_vectors: we might clean it, I'm a bit worried however that at
>>> some point we insert a check in do_IRQ() path that ensures the
>>> vector_irq[] is inline with desc->arch.used_vectors, which would fail
>>> for interrupts drained at the bottom of fixup_irqs().  Let me attempt
>>> to clean the currently used vector from ->arch.used_vectors.
>>
>> Just to clarify: It may well be that for draining the bit can't be cleared
>> right here. But it then still needs clearing _somewhere_, or else we
>> chance ending up with inconsistent state (triggering e.g. an assertion
>> later on) or the leaking of vectors. My problem here was that I also
>> couldn't locate any such "somewhere", and commentary also didn't point me
>> anywhere.
> 
> You are correct, there's no such place where the cleanup would happen.
> 
> I'm afraid the only option I see to correctly deal with this is to do
> the cleanup of the old destination in _assign_irq_vector(), and then
> do the pending interrupt draining from IRR like I had proposed in
> patch 7/7, thus removing the interrupt enable window at the bottom of
> fixup_irqs().
> 
> Let me know if that seems sensible.

I think it does; doing away with that entirely heuristic window would be
pretty nice anyway.

Jan

