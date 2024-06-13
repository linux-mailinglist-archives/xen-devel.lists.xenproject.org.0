Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701BA906B22
	for <lists+xen-devel@lfdr.de>; Thu, 13 Jun 2024 13:37:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.739841.1146791 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHilJ-0008W1-Jw; Thu, 13 Jun 2024 11:37:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 739841.1146791; Thu, 13 Jun 2024 11:37:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sHilJ-0008UT-Gn; Thu, 13 Jun 2024 11:37:01 +0000
Received: by outflank-mailman (input) for mailman id 739841;
 Thu, 13 Jun 2024 11:36:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mvQ+=NP=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sHilH-0008UN-Em
 for xen-devel@lists.xenproject.org; Thu, 13 Jun 2024 11:36:59 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3df1e259-2979-11ef-90a3-e314d9c70b13;
 Thu, 13 Jun 2024 13:36:58 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-57cbc2a2496so56216a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 13 Jun 2024 04:36:58 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a6f56ecdbbbsm62862666b.99.2024.06.13.04.36.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jun 2024 04:36:56 -0700 (PDT)
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
X-Inumbo-ID: 3df1e259-2979-11ef-90a3-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1718278617; x=1718883417; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=in+sVQxzp4l+XAse0dba3QdnyjCCDhAafq+4H784p7M=;
        b=LeBy/Kmau6AJWyBDsARRbuSifqco0oGxe0uie/0nuiuGPrTebqWkQhtK8oW++GP+XD
         MITMJWZd3ycXfWIUu1dzjb//ZjmT856MQF6PbgkFj8y9Jwc8G/40RADt4pXLpo9nksPE
         YemukoTsyiEWfY7hNy+AsvpWQn6EIZBVZQCi+NLtr436Mf4YdQlTs5Gwsrr/fgSTBAcu
         9rczGWg77NduwGfjPWHRALJ3rb8to6k2QnJe7lJ383gvWU5MIokUE/QyWTVvUPzkcc4c
         6nDfm8amLxJ3mixAzaSrNoWLXiCDujlQIqKO5oBr3cWS3c054w9K19n0mQV8VavPDotl
         nFXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718278617; x=1718883417;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=in+sVQxzp4l+XAse0dba3QdnyjCCDhAafq+4H784p7M=;
        b=Qyso0iGCTn3eeCqvKEWXE/or9245pGRqeNQsX0ZJy6Zw1OlhLsHH/16yIP+GPjZcc1
         eaYuu48kZCzgJSaHIYCt47zwmhiOmoZM8bjScIySzk9ViTrM+faFMc3AtOOrh0w+3lLN
         jIjPnI8xwF6JXMncl/UjOjOxhRiHDQe4kAGDYKgmlt6oQucJ0T8OesHsw5ajcImMP+rZ
         zmhjIjpSqzqDwKueZmo4XKVydpicPQ8Xck7cGSx+a5OW5RnzP3ZTgO7t0tggdltrPGvb
         C5vZSQusy05aLZ8+n1bOCpmum/etA7BUB5yt94STCD/7DNwEPswVI7aUgPTN09IpfkZO
         PrVQ==
X-Forwarded-Encrypted: i=1; AJvYcCULltjmGWU79Y8aTX1RrReFgXKm4sZU3IWVX1hGhEgVJxFLX3r2T3AlDFj1XkOhBQP74CgsIZEXTMDyoZQ2NgPA7wo870D9sDpPityG15w=
X-Gm-Message-State: AOJu0YzESDMD+E2VZqulRBXrLYKkO0C6+SX1NAg9hw6d1SX5dEO7UfNt
	tcbXrn3/hY0HF/37rsGDXgS83TWgrtJNNT5qDfvOofQOxHRyC9t1ClR42bIs1g==
X-Google-Smtp-Source: AGHT+IFjj8VVWhkAkfw0oo3mI+ObazPGztFchRGC4HlcN08uUnsg706BVSwdb1FxaZisyXl3PDc3XA==
X-Received: by 2002:a17:907:7754:b0:a6f:501d:c228 with SMTP id a640c23a62f3a-a6f501dd0f3mr239611266b.9.1718278617110;
        Thu, 13 Jun 2024 04:36:57 -0700 (PDT)
Message-ID: <f4c51152-e8a0-4715-af75-4b8c7801fa08@suse.com>
Date: Thu, 13 Jun 2024 13:36:55 +0200
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
In-Reply-To: <ZmrYjv2ljhf-1Ag_@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.06.2024 13:31, Roger Pau Monné wrote:
> On Thu, Jun 13, 2024 at 10:38:35AM +0200, Jan Beulich wrote:
>> On 12.06.2024 17:36, Roger Pau Monné wrote:
>>> On Wed, Jun 12, 2024 at 03:42:58PM +0200, Jan Beulich wrote:
>>>> On 12.06.2024 12:39, Roger Pau Monné wrote:
>>>>> On Tue, Jun 11, 2024 at 03:18:32PM +0200, Jan Beulich wrote:
>>>>>> On 10.06.2024 16:20, Roger Pau Monne wrote:
>>>>>>> Currently there's logic in fixup_irqs() that attempts to prevent
>>>>>>> _assign_irq_vector() from failing, as fixup_irqs() is required to evacuate all
>>>>>>> interrupts from the CPUs not present in the input mask.  The current logic in
>>>>>>> fixup_irqs() is incomplete, as it doesn't deal with interrupts that have
>>>>>>> move_cleanup_count > 0 and a non-empty ->arch.old_cpu_mask field.
>>>>>>>
>>>>>>> Instead of attempting to fixup the interrupt descriptor in fixup_irqs() so that
>>>>>>> _assign_irq_vector() cannot fail, introduce logic in _assign_irq_vector()
>>>>>>> to deal with interrupts that have either move_{in_progress,cleanup_count} set
>>>>>>> and no remaining online CPUs in ->arch.cpu_mask.
>>>>>>>
>>>>>>> If _assign_irq_vector() is requested to move an interrupt in the state
>>>>>>> described above, first attempt to see if ->arch.old_cpu_mask contains any valid
>>>>>>> CPUs that could be used as fallback, and if that's the case do move the
>>>>>>> interrupt back to the previous destination.  Note this is easier because the
>>>>>>> vector hasn't been released yet, so there's no need to allocate and setup a new
>>>>>>> vector on the destination.
>>>>>>>
>>>>>>> Due to the logic in fixup_irqs() that clears offline CPUs from
>>>>>>> ->arch.old_cpu_mask (and releases the old vector if the mask becomes empty) it
>>>>>>> shouldn't be possible to get into _assign_irq_vector() with
>>>>>>> ->arch.move_{in_progress,cleanup_count} set but no online CPUs in
>>>>>>> ->arch.old_cpu_mask.
>>>>>>>
>>>>>>> However if ->arch.move_{in_progress,cleanup_count} is set and the interrupt has
>>>>>>> also changed affinity, it's possible the members of ->arch.old_cpu_mask are no
>>>>>>> longer part of the affinity set,
>>>>>>
>>>>>> I'm having trouble relating this (->arch.old_cpu_mask related) to ...
>>>>>>
>>>>>>> move the interrupt to a different CPU part of
>>>>>>> the provided mask
>>>>>>
>>>>>> ... this (->arch.cpu_mask related).
>>>>>
>>>>> No, the "provided mask" here is the "mask" parameter, not
>>>>> ->arch.cpu_mask.
>>>>
>>>> Oh, so this describes the case of "hitting" the comment at the very bottom of
>>>> the first hunk then? (I probably was misreading this because I was expecting
>>>> it to describe a code change, rather than the case where original behavior
>>>> needs retaining. IOW - all fine here then.)
>>>>
>>>>>>> and keep the current ->arch.old_{cpu_mask,vector} for the
>>>>>>> pending interrupt movement to be completed.
>>>>>>
>>>>>> Right, that's to clean up state from before the initial move. What isn't
>>>>>> clear to me is what's to happen with the state of the intermediate
>>>>>> placement. Description and code changes leave me with the impression that
>>>>>> it's okay to simply abandon, without any cleanup, yet I can't quite figure
>>>>>> why that would be an okay thing to do.
>>>>>
>>>>> There isn't much we can do with the intermediate placement, as the CPU
>>>>> is going offline.  However we can drain any pending interrupts from
>>>>> IRR after the new destination has been set, since setting the
>>>>> destination is done from the CPU that's the current target of the
>>>>> interrupts.  So we can ensure the draining is done strictly after the
>>>>> target has been switched, hence ensuring no further interrupts from
>>>>> this source will be delivered to the current CPU.
>>>>
>>>> Hmm, I'm afraid I still don't follow: I'm specifically in trouble with
>>>> the ...
>>>>
>>>>>>> --- a/xen/arch/x86/irq.c
>>>>>>> +++ b/xen/arch/x86/irq.c
>>>>>>> @@ -544,7 +544,53 @@ static int _assign_irq_vector(struct irq_desc *desc, const cpumask_t *mask)
>>>>>>>      }
>>>>>>>  
>>>>>>>      if ( desc->arch.move_in_progress || desc->arch.move_cleanup_count )
>>>>>>> -        return -EAGAIN;
>>>>>>> +    {
>>>>>>> +        /*
>>>>>>> +         * If the current destination is online refuse to shuffle.  Retry after
>>>>>>> +         * the in-progress movement has finished.
>>>>>>> +         */
>>>>>>> +        if ( cpumask_intersects(desc->arch.cpu_mask, &cpu_online_map) )
>>>>>>> +            return -EAGAIN;
>>>>>>> +
>>>>>>> +        /*
>>>>>>> +         * Due to the logic in fixup_irqs() that clears offlined CPUs from
>>>>>>> +         * ->arch.old_cpu_mask it shouldn't be possible to get here with
>>>>>>> +         * ->arch.move_{in_progress,cleanup_count} set and no online CPUs in
>>>>>>> +         * ->arch.old_cpu_mask.
>>>>>>> +         */
>>>>>>> +        ASSERT(valid_irq_vector(desc->arch.old_vector));
>>>>>>> +        ASSERT(cpumask_intersects(desc->arch.old_cpu_mask, &cpu_online_map));
>>>>>>> +
>>>>>>> +        if ( cpumask_intersects(desc->arch.old_cpu_mask, mask) )
>>>>>>> +        {
>>>>>>> +            /*
>>>>>>> +             * Fallback to the old destination if moving is in progress and the
>>>>>>> +             * current destination is to be offlined.  This is only possible if
>>>>>>> +             * the CPUs in old_cpu_mask intersect with the affinity mask passed
>>>>>>> +             * in the 'mask' parameter.
>>>>>>> +             */
>>>>>>> +            desc->arch.vector = desc->arch.old_vector;
>>>>>>> +            cpumask_and(desc->arch.cpu_mask, desc->arch.old_cpu_mask, mask);
>>>>
>>>> ... replacing of vector (and associated mask), without any further accounting.
>>>
>>> It's quite likely I'm missing something here, but what further
>>> accounting you would like to do?
>>>
>>> The current target of the interrupt (->arch.cpu_mask previous to
>>> cpumask_and()) is all going offline, so any attempt to set it in
>>> ->arch.old_cpu_mask would just result in a stale (offline) CPU getting
>>> set in ->arch.old_cpu_mask, which previous patches attempted to
>>> solve.
>>>
>>> Maybe by "further accounting" you meant something else not related to
>>> ->arch.old_{cpu_mask,vector}?
>>
>> Indeed. What I'm thinking of is what normally release_old_vec() would
>> do (of which only desc->arch.used_vectors updating would appear to be
>> relevant, seeing the CPU's going offline). The other one I was thinking
>> of, updating vector_irq[], likely is also unnecessary, again because
>> that's per-CPU data of a CPU going down.
> 
> I think updating vector_irq[] should be explicitly avoided, as doing
> so would prevent us from correctly draining any pending interrupts
> because the vector -> irq mapping would be broken when the interrupt
> enable window at the bottom of fixup_irqs() is reached.
> 
> For used_vectors: we might clean it, I'm a bit worried however that at
> some point we insert a check in do_IRQ() path that ensures the
> vector_irq[] is inline with desc->arch.used_vectors, which would fail
> for interrupts drained at the bottom of fixup_irqs().  Let me attempt
> to clean the currently used vector from ->arch.used_vectors.

Just to clarify: It may well be that for draining the bit can't be cleared
right here. But it then still needs clearing _somewhere_, or else we
chance ending up with inconsistent state (triggering e.g. an assertion
later on) or the leaking of vectors. My problem here was that I also
couldn't locate any such "somewhere", and commentary also didn't point me
anywhere.

Jan

