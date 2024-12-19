Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9689F7693
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2024 09:02:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.860829.1272805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBTe-0000my-FH; Thu, 19 Dec 2024 08:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 860829.1272805; Thu, 19 Dec 2024 08:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOBTe-0000lO-CT; Thu, 19 Dec 2024 08:01:46 +0000
Received: by outflank-mailman (input) for mailman id 860829;
 Thu, 19 Dec 2024 08:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nfYH=TM=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tOBTd-0000l3-2V
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2024 08:01:45 +0000
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [2a00:1450:4864:20::332])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cd5783e-bddf-11ef-a0d7-8be0dac302b0;
 Thu, 19 Dec 2024 09:01:44 +0100 (CET)
Received: by mail-wm1-x332.google.com with SMTP id
 5b1f17b1804b1-4361c705434so3210635e9.3
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 00:01:44 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43656b013ecsm44439845e9.16.2024.12.19.00.01.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Dec 2024 00:01:43 -0800 (PST)
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
X-Inumbo-ID: 7cd5783e-bddf-11ef-a0d7-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1734595304; x=1735200104; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U07+G/ShjaYvwPy/lODKVWP+QdMhiAg8+R5YXTWup4o=;
        b=U7wwxZf9PfVm4CZHBcm/Y5JriQTSZxidai+Uj0+69aGx501wba0lggqKTnodyeGXJ6
         itsEInqvxD74+QZG7h0TNNyLwaO+dpgXrVQMKIaw6xY6EmwGeBpJEwpc+sWTl+q6HfhK
         ZdjhdII0QFxTk9gqIO337QhdHwvcaWN6/bzR6gZxziCimqqxn2ENYtbe8raYE8RiNAWB
         yAFOvk1xpVO7LZdqd5U6UEEMlvl8kt3eDVFoOvxA6L1+Z2BvvdNmydCvVvs96Tqz+jYh
         KYOH8Z/E8/j0evpMSHDwROEOO395+Jgseflws3wfTAYJiyXxaAwxiHYAW+nexJJU/rms
         SKLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734595304; x=1735200104;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U07+G/ShjaYvwPy/lODKVWP+QdMhiAg8+R5YXTWup4o=;
        b=Cgb1fGXT4I1v9vUIOLFaO24CWgsIBQLPVBzCgGS/EQBgNqdKk1hMlGPF0O+PApLN+L
         cXV02T8ruz4nXAaYcDCOHWFbPI2u+kPxWDJsyeHzbNXnpz2faL/gfUNlKkvVCF6KQvM5
         INsy359HTiJ30WuPlJ+AX5+ghZZ5rp+J6Dci21ixjjUt0k59R91rg8oYz5XSYNWw8Iys
         om17bXmTmyYDqczMl/iR8xwkb/S3PAY8MnWu7vPmZRTnSRIDxFq0TGwlqW0i4fN01h8H
         +sLHmuMMQ7VKkurQOiUVFN8uOj5g8Qaf5Kh4uvnzGnf33dkulK8clUxpcv5AWigtt2fW
         I0Hg==
X-Forwarded-Encrypted: i=1; AJvYcCWrEepyFbFOf+HNWB6a9vRVZzoDTzbTvKj12xOeXPufXLGri9ObAuYynYf94+LbrOMhf7Ujed+Kf9c=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yw+9MKvS9aRCxd9lbln/w0xFtV52dRgycX8RGRIiVEsY3V5fNcc
	42QhT8PFZIRZeMsXflq3PgxVyikNi3nPvPGxJ31YEEBno0+QTfnjsHVUrychLA==
X-Gm-Gg: ASbGncuAEP1l0AklUxTyCerLxOG8FYufQ10LfT3o0Wi+zpQHLHYvnBte/nwiZHIVP+I
	a8D0cziErpElivKbf5B4sZFln/yBvRPId98myuylH4GyhfvXwrowS4AjotU0FKqU7JXq1LGkKEt
	nTqAmbNM/1YaD0G/ZsJi2M/oY9/AgnIFpAadLytCLL5A+cc+eTTidELrcev/juGBVoysoPXd1Ty
	hly6+J7FA4Lw2m0eCzxN8CCdaQoa9zagsfyOq3OmJIfLTgg3gSBOY5JLlVidyv2tLiWfknA15g5
	azE+emTJ/3pYrnKQ1RTYtnpdBHbZcK/G9s78XOdhvw==
X-Google-Smtp-Source: AGHT+IEKSFXDhmBxA08GlxK6p5ukC4vu+4LcF7EI2NTPrmoi+kZsn/dqADYrSc9WVrpLGy7Sb9SU0w==
X-Received: by 2002:a05:600c:5251:b0:434:9934:575 with SMTP id 5b1f17b1804b1-4365536f024mr54430215e9.16.1734595303617;
        Thu, 19 Dec 2024 00:01:43 -0800 (PST)
Message-ID: <37d13114-91eb-4d0f-9404-e5fd6cfca256@suse.com>
Date: Thu, 19 Dec 2024 09:01:42 +0100
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
 <be77e290-086e-4393-ac68-13a9cddc3f98@suse.com>
 <2fa06b11-e7a0-4f57-9af0-af432d35820a@suse.com>
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
In-Reply-To: <2fa06b11-e7a0-4f57-9af0-af432d35820a@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.12.2024 08:15, Jürgen Groß wrote:
> On 17.12.24 17:12, Jan Beulich wrote:
>> On 17.12.2024 16:55, Jürgen Groß wrote:
>>> On 17.12.24 16:19, Jan Beulich wrote:
>>>> On 17.12.2024 15:22, Juergen Gross wrote:
>>>>> Add a bitmap with one bit per possible domid indicating the respective
>>>>> domain has changed its state (created, deleted, dying, crashed,
>>>>> shutdown).
>>>>>
>>>>> Registering the VIRQ_DOM_EXC event will result in setting the bits for
>>>>> all existing domains and resetting all other bits.
>>>>>
>>>>> As the usage of this bitmap is tightly coupled with the VIRQ_DOM_EXC
>>>>> event, it is meant to be used only by a single consumer in the system,
>>>>> just like the VIRQ_DOM_EXC event.
>>>>
>>>> I'm sorry, but I need to come back to this. I thought I had got convinced
>>>> that only a single entity in the system can bind this vIRQ. Yet upon
>>>> checking I can't seem to find what would guarantee this. In particular
>>>> binding a vIRQ doesn't involve any XSM check. Hence an unprivileged entity
>>>> could, on the assumption that the interested privileged entity (xenstore)
>>>> is already up and running, bind and unbind this vIRQ, just to have the
>>>> global map freed. What am I overlooking (which would likely want stating
>>>> here)?
>>>
>>> I think you are not overlooking anything.
>>>
>>> I guess this can easily be handled by checking that the VIRQ_DOM_EXC handling
>>> domain is the calling one in domain_[de]init_states(). Note that global virqs
>>> are only ever sent to vcpu[0] of the handling domain, so rebinding the event
>>> to another vcpu is possible, but doesn't make sense.
>>
>> No, that's precluded by
>>
>>      if ( virq_is_global(virq) && (vcpu != 0) )
>>          return -EINVAL;
>>
>> afaict. That doesn't, however, preclude multiple vCPU-s from trying to bind
>> the vIRQ to vCPU 0.
> 
> I let myself fool by the ability to use EVTCHNOP_bind_vcpu for a global
> virq. While it is possible to send the event to another vcpu, it is still
> vcpu[0] which is used for the bookkeeping.
> 
>>
>>>>> V5:
>>>>> - domain_init_states() may be called only if evtchn_bind_virq() has been
>>>>>     called validly (Jan Beulich)
>>>>
>>>> I now recall why I had first suggested the placement later in the handling:
>>>> You're now doing the allocation with yet another lock held. It's likely not
>>>> the end of the world, but ...
>>>>
>>>>> @@ -138,6 +139,60 @@ bool __read_mostly vmtrace_available;
>>>>>    
>>>>>    bool __read_mostly vpmu_is_available;
>>>>>    
>>>>> +static DEFINE_SPINLOCK(dom_state_changed_lock);
>>>>> +static unsigned long *__read_mostly dom_state_changed;
>>>>> +
>>>>> +int domain_init_states(void)
>>>>> +{
>>>>> +    const struct domain *d;
>>>>> +    int rc = -ENOMEM;
>>>>> +
>>>>> +    spin_lock(&dom_state_changed_lock);
>>>>> +
>>>>> +    if ( dom_state_changed )
>>>>> +        bitmap_zero(dom_state_changed, DOMID_FIRST_RESERVED);
>>>>> +    else
>>>>> +    {
>>>>> +        dom_state_changed = xvzalloc_array(unsigned long,
>>>>> +                                           BITS_TO_LONGS(DOMID_FIRST_RESERVED));
>>>>
>>>> ... already this alone wasn't nice, and could be avoided (by doing the
>>>> allocation prior to acquiring the lock, which of course complicates the
>>>> logic some).
>>>>
>>>> What's perhaps less desirable is that ...
>>>>
>>>>> @@ -494,6 +495,15 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>>>>>            goto out;
>>>>>        }
>>>>>    
>>>>> +    if ( virq == VIRQ_DOM_EXC )
>>>>> +    {
>>>>> +        rc = domain_init_states();
>>>>> +        if ( rc )
>>>>> +            goto out;
>>>>> +
>>>>> +        deinit_if_err = true;
>>>>> +    }
>>>>> +
>>>>>        port = rc = evtchn_get_port(d, port);
>>>>>        if ( rc < 0 )
>>>>>        {
>>>>
>>>> ... the placement here additionally introduces lock nesting when really
>>>> the two locks shouldn't have any relationship.
>>>>
>>>> How about giving domain_init_states() a boolean parameter, such that it
>>>> can be called twice, with the first invocation moved back up where it
>>>> was, and the second one put ...
>>>>
>>>>> @@ -527,6 +537,9 @@ int evtchn_bind_virq(evtchn_bind_virq_t *bind, evtchn_port_t port)
>>>>>     out:
>>>>>        write_unlock(&d->event_lock);
>>>>>    
>>>>> +    if ( rc && deinit_if_err )
>>>>> +        domain_deinit_states();
>>>>> +
>>>>>        return rc;
>>>>>    }
>>>>
>>>> ... down here, not doing any allocation at all (only the clearing), and
>>>> hence eliminating the need to deal with its failure? (Alternatively
>>>> there could of course be a split into an init and a reset function.)
>>>>
>>>> There of course is the chance of races with such an approach. I'd like
>>>> to note though that with the placement of the call in the hunk above
>>>> there's a minor race, too (against ...
>>>>
>>>>> @@ -730,6 +743,9 @@ int evtchn_close(struct domain *d1, int port1, bool guest)
>>>>>            struct vcpu *v;
>>>>>            unsigned long flags;
>>>>>    
>>>>> +        if ( chn1->u.virq == VIRQ_DOM_EXC )
>>>>> +            domain_deinit_states();
>>>>
>>>> ... this and the same remote vCPU then immediately binding the vIRQ
>>>> again). Hence yet another alternative would appear to be to drop the
>>>> new global lock and use d->event_lock for synchronization instead
>>>> (provided - see above - that only a single entity can actually set up
>>>> all of this). That would pretty much want to have the allocation kept
>>>> with the lock already held (which isn't nice, but as said is perhaps
>>>> tolerable), but would at least eliminate the undesirable lock nesting.
>>>>
>>>> Re-use of the domain's event lock is at least somewhat justified by
>>>> the bit array being tied to VIRQ_DOM_EXEC.
>>>>
>>>> Thoughts?
>>>
>>> With my suggestion above I think there is no race, as only the domain handling
>>> VIRQ_DOM_EXC could alloc/dealloc dom_state_changed.
>>
>> Yet still it could be multiple vCPU-s therein to try to in parallel.
> 
> But isn't this again the need for trusting other processes within the domain
> having the right to consume the virq?
> 
> In the end it doesn't matter whether there is such a race or not. Some
> process in that domain having the power to do event channel operations could
> simply close the event channel. So it IS really about trust.

Well. What we do in Xen should be correct without regard to what a guest might
be doing. And it should be safe against any not-fully-privileged entity in the
system. Hence why I think such a race needs dealing with correctly, no matter
that it's not a sane thing to do for a guest.

>>> Using d->event_lock for synchronization is not a nice option IMO, as it would
>>> require to take the event_lock of the domain handling VIRQ_DOM_EXEC when trying
>>> to set a bit for another domain changing state.
>>
>> Well, yes, it's that domain's data that's to be modified, after all.
> 
> True, but using d->event_lock would probably increase lock contention, as this
> lock is used much more often than the new lock introduced by my patch.

On a system with extremely heavy domain creation / teardown activity there may
be an increase of contention, yes. Whether that's a price worth to pay to avoid
introducing an otherwise unnecessary relationship between two locks is
precisely what we're trying to determine in this discussion. If the two of us
are taking opposite positions here, we'll simply need a 3rd view.

Jan

