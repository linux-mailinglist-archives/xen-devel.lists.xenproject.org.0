Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E54C99F508A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 17:12:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859399.1271530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaBT-000561-2j; Tue, 17 Dec 2024 16:12:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859399.1271530; Tue, 17 Dec 2024 16:12:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNaBT-000540-05; Tue, 17 Dec 2024 16:12:31 +0000
Received: by outflank-mailman (input) for mailman id 859399;
 Tue, 17 Dec 2024 16:12:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5pb9=TK=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tNaBS-0004Xt-C7
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 16:12:30 +0000
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [2a00:1450:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b625168e-bc91-11ef-99a3-01e77a169b0f;
 Tue, 17 Dec 2024 17:12:28 +0100 (CET)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3862df95f92so2802921f8f.2
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 08:12:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-388c80120dcsm11805797f8f.8.2024.12.17.08.12.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2024 08:12:27 -0800 (PST)
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
X-Inumbo-ID: b625168e-bc91-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734451948; x=1735056748; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nlCT9xubKhsVArmmCmXQLeMQkwVs3crBvROWCBas4+o=;
        b=Vda70zUCHlw2c0wVCIpcRvxV/GW+tQ/X9pzOLZYceOn0oH84FIDkYfyV9HCnKiTle/
         GA8IL21P7iZ6G0usyeHlC0pZz8hlZrlKgSk6xlcgwTWRSJ74XRAll01FbronCKQl/459
         ZrYMBnc0z8o/fb61po7xsYRXiMF/L2itqX7aXZOHccdk6UCUDSnKDjizMQ+CstJTGk91
         1sbVuXRucfadMi9xoyzAJz7vdpSxj7had2FAeT+4TSJGnAvVhafxBHtuWuTDga2hJ6L6
         mKRRWUSaaKBdV6TW18rPJL+lGHuEZb74ibKKBugyGHsJpZnKw40yhkx9KldK/Zt3YLBk
         oLXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734451948; x=1735056748;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nlCT9xubKhsVArmmCmXQLeMQkwVs3crBvROWCBas4+o=;
        b=L1OaXbbxR4RIZhJlHqJfqU7/XwEnN2b/CvfnjQRc7GZ9iAznf/pEp0VpnTBqMI88cc
         EIsubn4XSv09Vu8wmeAU+zBNS94UXxPGwg23SaGDGHORKK5SzkeR3Po5cneeDLUOpX0U
         fGS4mUf8xyLfjM5VJ2hT+ADrcGXnKbM+dt06B6hM7yua5GOKRg0O+9M+K7BVdzrsCsui
         WZYjBoE2GNCBx6x48Hik5Y5vfrkoNlBoUHC54hOy3Hro8wT1AjY5mQ9ogTFyLVHiS+oo
         ZWnyH5/3tRGq3IgAvd7y7FhVl2rG/bVWQkf0m5wX1c32YtaiISv0DtZzAVgj8KIO/tzd
         uhVw==
X-Forwarded-Encrypted: i=1; AJvYcCUpUhmrYlJGo/tlyNvA+yh8RQoE7g+c/qYThl04sjzPlzU0IJoL5ggWvvYmlYZSToWU3WKC/KkXCwM=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw2J3QRQ1vTFKhDDyqOwHyRJCEAH++VAYVobEWv39grHJuwdeAL
	x+5Bi0azDny6x8D4jDftWdw+ENFUagrUn9QqTbtztfHLeCvJZAw8yJJ7Rfwb5A==
X-Gm-Gg: ASbGncsen+BZqHBc8PxIVWCf8Pw6fivpo69DMoF8lPZAzPMxFnpL3wxxgBUEMGSMQv2
	9xyFfxBoZugHcOzPyp1lYVfjWnbZRvBQUT5PhDxRXjR6HBMS3D56+3w61Q7LwDZeloWO2ZArYgD
	pWxHZItKhNoyrIFLVHVDojnbWhQ2I65gJyJTXa0BSW+ufwmlRAiy92tvwad2H2zwlz0uHegRTSH
	pNsk3QMhnw3whE77BNz127PJPnU93bCWgCrqskuwpvEUEX8D0+T8RTf1Lo0GQstHs9V5HzUE2H8
	h5uv+jQ9D+xcgJ+9rWH61qlphp0lhseM3LNYcnAXcg==
X-Google-Smtp-Source: AGHT+IEjJh0vLqU0xCZ7QrftBSB+LQjyh4IPIJn9lvaRwXH3fu2mwQcluMaPRcyjPhgJiHyhlqxuoA==
X-Received: by 2002:a5d:5984:0:b0:385:fc32:1ec6 with SMTP id ffacd0b85a97d-3888e0c081bmr13298391f8f.50.1734451947893;
        Tue, 17 Dec 2024 08:12:27 -0800 (PST)
Message-ID: <be77e290-086e-4393-ac68-13a9cddc3f98@suse.com>
Date: Tue, 17 Dec 2024 17:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] xen: add bitmap to indicate per-domain state
 changes
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20241217142218.24129-1-jgross@suse.com>
 <20241217142218.24129-3-jgross@suse.com>
 <ce327545-c23b-4272-a290-ce950b4c27f5@suse.com>
 <b7738421-5802-4179-8b6b-1ec18b8abd8a@suse.com>
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
In-Reply-To: <b7738421-5802-4179-8b6b-1ec18b8abd8a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17.12.2024 16:55, Jürgen Groß wrote:
> On 17.12.24 16:19, Jan Beulich wrote:
>> On 17.12.2024 15:22, Juergen Gross wrote:
>>> Add a bitmap with one bit per possible domid indicating the respective
>>> domain has changed its state (created, deleted, dying, crashed,
>>> shutdown).
>>>
>>> Registering the VIRQ_DOM_EXC event will result in setting the bits for
>>> all existing domains and resetting all other bits.
>>>
>>> As the usage of this bitmap is tightly coupled with the VIRQ_DOM_EXC
>>> event, it is meant to be used only by a single consumer in the system,
>>> just like the VIRQ_DOM_EXC event.
>>
>> I'm sorry, but I need to come back to this. I thought I had got convinced
>> that only a single entity in the system can bind this vIRQ. Yet upon
>> checking I can't seem to find what would guarantee this. In particular
>> binding a vIRQ doesn't involve any XSM check. Hence an unprivileged entity
>> could, on the assumption that the interested privileged entity (xenstore)
>> is already up and running, bind and unbind this vIRQ, just to have the
>> global map freed. What am I overlooking (which would likely want stating
>> here)?
> 
> I think you are not overlooking anything.
> 
> I guess this can easily be handled by checking that the VIRQ_DOM_EXC handling
> domain is the calling one in domain_[de]init_states(). Note that global virqs
> are only ever sent to vcpu[0] of the handling domain, so rebinding the event
> to another vcpu is possible, but doesn't make sense.

No, that's precluded by

    if ( virq_is_global(virq) && (vcpu != 0) )
        return -EINVAL;

afaict. That doesn't, however, preclude multiple vCPU-s from trying to bind
the vIRQ to vCPU 0.

>>> V5:
>>> - domain_init_states() may be called only if evtchn_bind_virq() has been
>>>    called validly (Jan Beulich)
>>
>> I now recall why I had first suggested the placement later in the handling:
>> You're now doing the allocation with yet another lock held. It's likely not
>> the end of the world, but ...
>>
>>> @@ -138,6 +139,60 @@ bool __read_mostly vmtrace_available;
>>>   
>>>   bool __read_mostly vpmu_is_available;
>>>   
>>> +static DEFINE_SPINLOCK(dom_state_changed_lock);
>>> +static unsigned long *__read_mostly dom_state_changed;
>>> +
>>> +int domain_init_states(void)
>>> +{
>>> +    const struct domain *d;
>>> +    int rc = -ENOMEM;
>>> +
>>> +    spin_lock(&dom_state_changed_lock);
>>> +
>>> +    if ( dom_state_changed )
>>> +        bitmap_zero(dom_state_changed, DOMID_FIRST_RESERVED);
>>> +    else
>>> +    {
>>> +        dom_state_changed = xvzalloc_array(unsigned long,
>>> +                                           BITS_TO_LONGS(DOMID_FIRST_RESERVED));
>>
>> ... already this alone wasn't nice, and could be avoided (by doing the
>> allocation prior to acquiring the lock, which of course complicates the
>> logic some).
>>
>> What's perhaps less desirable is that ...
>>
>>> @@ -494,6 +495,15 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>>>           goto out;
>>>       }
>>>   
>>> +    if ( virq == VIRQ_DOM_EXC )
>>> +    {
>>> +        rc = domain_init_states();
>>> +        if ( rc )
>>> +            goto out;
>>> +
>>> +        deinit_if_err = true;
>>> +    }
>>> +
>>>       port = rc = evtchn_get_port(d, port);
>>>       if ( rc < 0 )
>>>       {
>>
>> ... the placement here additionally introduces lock nesting when really
>> the two locks shouldn't have any relationship.
>>
>> How about giving domain_init_states() a boolean parameter, such that it
>> can be called twice, with the first invocation moved back up where it
>> was, and the second one put ...
>>
>>> @@ -527,6 +537,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>>>    out:
>>>       write_unlock(&d->event_lock);
>>>   
>>> +    if ( rc && deinit_if_err )
>>> +        domain_deinit_states();
>>> +
>>>       return rc;
>>>   }
>>
>> ... down here, not doing any allocation at all (only the clearing), and
>> hence eliminating the need to deal with its failure? (Alternatively
>> there could of course be a split into an init and a reset function.)
>>
>> There of course is the chance of races with such an approach. I'd like
>> to note though that with the placement of the call in the hunk above
>> there's a minor race, too (against ...
>>
>>> @@ -730,6 +743,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
>>>           struct vcpu *v;
>>>           unsigned long flags;
>>>   
>>> +        if ( chn1->u.virq == VIRQ_DOM_EXC )
>>> +            domain_deinit_states();
>>
>> ... this and the same remote vCPU then immediately binding the vIRQ
>> again). Hence yet another alternative would appear to be to drop the
>> new global lock and use d->event_lock for synchronization instead
>> (provided - see above - that only a single entity can actually set up
>> all of this). That would pretty much want to have the allocation kept
>> with the lock already held (which isn't nice, but as said is perhaps
>> tolerable), but would at least eliminate the undesirable lock nesting.
>>
>> Re-use of the domain's event lock is at least somewhat justified by
>> the bit array being tied to VIRQ_DOM_EXEC.
>>
>> Thoughts?
> 
> With my suggestion above I think there is no race, as only the domain handling
> VIRQ_DOM_EXC could alloc/dealloc dom_state_changed.

Yet still it could be multiple vCPU-s therein to try to in parallel.

> Using d->event_lock for synchronization is not a nice option IMO, as it would
> require to take the event_lock of the domain handling VIRQ_DOM_EXEC when trying
> to set a bit for another domain changing state.

Well, yes, it's that domain's data that's to be modified, after all.

Jan

