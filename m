Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 32457818B20
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 16:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.656978.1025533 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbx1-0004CT-KT; Tue, 19 Dec 2023 15:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 656978.1025533; Tue, 19 Dec 2023 15:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFbx1-00049u-HB; Tue, 19 Dec 2023 15:24:07 +0000
Received: by outflank-mailman (input) for mailman id 656978;
 Tue, 19 Dec 2023 15:24:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=z0wA=H6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rFbx0-00047E-KS
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 15:24:06 +0000
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [2a00:1450:4864:20::32f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a483381c-9e82-11ee-9b0f-b553b5be7939;
 Tue, 19 Dec 2023 16:24:04 +0100 (CET)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-40d190df5d0so29518145e9.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Dec 2023 07:24:04 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 jg7-20020a05600ca00700b0040c46719966sm3253226wmb.25.2023.12.19.07.24.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Dec 2023 07:24:03 -0800 (PST)
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
X-Inumbo-ID: a483381c-9e82-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1702999443; x=1703604243; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KdMIBMvBlTdGic19aTTRMv+1IVxeZiLUMSPfYu7F/bg=;
        b=FNJyGJaMXyoFFdWuu+2TTuNUJnqckIfyAdGN5YRp1bHNS2G4gkLTsCy50uoSIAb2Ev
         U06WNsYO+cqvKZMWDEJFj6BiZ7YOVpumyVbDRZFnrxGksueIRprAVwxJ2hBzRe27GVAG
         NUCFZOv/vSqsWuLZtTFNQZLDYX9RtFZrdalGirt3nAEAI66V+TBpWd/Of9Uqp5DlV2RA
         3Nj4ZEJqBMgy2n0w/nPtf6pYvt9QMUpW5k2dfrj/Tkhvy+C29iRVIZeVqe1UMJna5WeM
         g3LXzX099lwEY5sP5yuqPBZWOAdy3mqHmPCph+6mOl/21iCNNtmNAiKvLxtV/VHSso8o
         7/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702999443; x=1703604243;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdMIBMvBlTdGic19aTTRMv+1IVxeZiLUMSPfYu7F/bg=;
        b=OnHvozvc49V8I3r2Ueipt17qhdZG6SnLVuPQ67iJSR0O/NJaEdWqAg5D/i478YevtN
         eV/ubEIK2DuGFocZuddua4yTLIzdykPCAxWYZr8uMyP//jZakweNV5Vu35y+pIwYmue8
         eT0VzYLmeFfYHDsLP3vKK9NqEVZZQQY9LrLngKQniqckUMiFFVpGMYLUv0resaVjSsvd
         +YGC/omlafeBXc5e/BFWhXoMD8cT1mfqwP+opT5asFk3OrvPIBLxDvPndy65HaESZFrt
         +MygSTte+PP9ismxtb5/eOwG8exzGduEkmsPYo8yusjyV+ZhJ2Ai/sYXQcKr1Tir2sml
         A0UQ==
X-Gm-Message-State: AOJu0Yx8BVCzMXjpc7W28kGBufs2B6twxaBlPpdK+p+Wy1R35i9z85lh
	MIBqZARIhtTx9mM49z8Tc0MS
X-Google-Smtp-Source: AGHT+IGf0pZ1IQDifizuzyIQ7y4EvCYGH+j2PnbGoXuZCjx27DpXdVcocPAo5/PRrV8gYnCd77rVAA==
X-Received: by 2002:a05:600c:4fd5:b0:40c:34e1:72ef with SMTP id o21-20020a05600c4fd500b0040c34e172efmr9453720wmq.84.1702999443513;
        Tue, 19 Dec 2023 07:24:03 -0800 (PST)
Message-ID: <48b5a33e-19c8-49fd-9682-17056e0acb00@suse.com>
Date: Tue, 19 Dec 2023 16:24:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] x86/HVM: split restore state checking from state
 loading
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <1e855575-8c0f-4222-80ba-e64305ea714b@suse.com>
 <05e69eea-79cc-4b3c-861b-855fa67c878a@suse.com> <ZYGqbboWvjVOGZkb@macbook>
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
In-Reply-To: <ZYGqbboWvjVOGZkb@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.12.2023 15:36, Roger Pau Monné wrote:
> On Mon, Dec 18, 2023 at 03:39:55PM +0100, Jan Beulich wrote:
>> ..., at least as reasonably feasible without making a check hook
>> mandatory (in particular strict vs relaxed/zero-extend length checking
>> can't be done early this way).
>>
>> Note that only one of the two uses of "real" hvm_load() is accompanied
>> with a "checking" one. The other directly consumes hvm_save() output,
>> which ought to be well-formed. This means that while input data related
>> checks don't need repeating in the "load" function when already done by
>> the "check" one (albeit assertions to this effect may be desirable),
>> domain state related checks (e.g. has_xyz(d)) will be required in both
>> places.
>>
>> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Now that this re-arranges hvm_load() anyway, wouldn't it be better to
>> down the vCPU-s ahead of calling arch_hvm_load() (which is now easy to
>> arrange for)?
> 
> Seems OK to me.

As is, or with the suggested adjustment, or either way?

>> Do we really need all the copying involved in use of _hvm_read_entry()
>> (backing hvm_load_entry()? Zero-extending loads are likely easier to
>> handle that way, but for strict loads all we gain is a reduced risk of
>> unaligned accesses (compared to simply pointing into h->data[]).
> 
> I do feel it's safer to copy the data so the checks are done against
> what's loaded.  Albeit hvm_load() is already using hvm_get_entry().

The comment is about individual handlers, not hvm_load() itself. In some
cases - when copying directly into guest state structures - the copying
makes sense. In other cases, where there is separate copying anyway,
things could be done with less duplication of data (see hpet_load(),
which was already converted; along those lines hvm_load() itself also
was already switched away from the original copying).

Checking in any event can't be done against what _is_ loaded (as during
checking we want to avoid altering guest state); it'll always be only
against what is going to be loaded. The difference would be whether we
check data in the incoming buffer or in a copy of that data in a local
variable on the stack. But that applies to checking done in the load
hooks only anyway; the cases with split off check handlers should never
need to do any copying.

>> --- a/xen/arch/x86/domctl.c
>> +++ b/xen/arch/x86/domctl.c
>> @@ -379,8 +379,12 @@ long arch_do_domctl(
>>          if ( copy_from_guest(c.data, domctl->u.hvmcontext.buffer, c.size) != 0 )
>>              goto sethvmcontext_out;
>>  
>> +        ret = hvm_load(d, false, &c);
>> +        if ( ret )
>> +            goto sethvmcontext_out;
>> +
>>          domain_pause(d);
>> -        ret = hvm_load(d, &c);
>> +        ret = hvm_load(d, true, &c);
> 
> Now that the check has been done ahead, do we want to somehow assert
> that this cannot fail?  AIUI that's the expectation.

We certainly can't until all checking was moved out of the load handlers.
And even then I think there are still cases where load might produce an
error. (In fact I would have refused a little more strongly to folding
the prior hvm_check() into hvm_load() if indeed a separate hvm_load()
could have ended up returning void in the long run.)

>> @@ -275,12 +281,10 @@ int hvm_save(struct domain *d, hvm_domai
>>      return 0;
>>  }
>>  
>> -int hvm_load(struct domain *d, hvm_domain_context_t *h)
>> +int hvm_load(struct domain *d, bool real, hvm_domain_context_t *h)
> 
> Maybe the 'real' parameter should instead be an enum:
> 
> enum hvm_load_action {
>     CHECK,
>     LOAD,
> };
> int hvm_load(struct domain *d, enum hvm_load_action action,
>              hvm_domain_context_t *h);

Hmm, yes, it could. I'm not a fan of enums for boolean-like things,
though.

> Otherwise a comment might be warranted about how 'real' affects the
> logic in the function.

I can certainly add a comment immediately ahead of the function:

/*
 * @real = false requests checking of the incoming state, while @real = true
 * requests actual loading, which will then assume that checking was already
 * done or is unnecessary.
 */

>> @@ -291,50 +295,91 @@ int hvm_load(struct domain *d, hvm_domai
>>      if ( !hdr )
>>          return -ENODATA;
>>  
>> -    rc = arch_hvm_load(d, hdr);
>> -    if ( rc )
>> -        return rc;
>> +    rc = arch_hvm_check(d, hdr);
> 
> Shouldn't this _check function only be called when real == false?

Possibly. In v4 I directly transformed what I had in v3:

    ASSERT(!arch_hvm_check(d, hdr));

I.e. it is now the call above plus ...

>> +    if ( real )
>> +    {
>> +        struct vcpu *v;
>> +
>> +        ASSERT(!rc);

... this assertion. Really the little brother of the call site assertion
you're asking for (see above).

>> +        arch_hvm_load(d, hdr);
>>  
>> -    /* Down all the vcpus: we only re-enable the ones that had state saved. */
>> -    for_each_vcpu(d, v)
>> -        if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
>> -            vcpu_sleep_nosync(v);
>> +        /*
>> +         * Down all the vcpus: we only re-enable the ones that had state
>> +         * saved.
>> +         */
>> +        for_each_vcpu(d, v)
>> +            if ( !test_and_set_bit(_VPF_down, &v->pause_flags) )
>> +                vcpu_sleep_nosync(v);
>> +    }
>> +    else if ( rc )
>> +        return rc;
>>  
>>      for ( ; ; )
>>      {
>> +        const char *name;
>> +        hvm_load_handler load;
>> +
>>          if ( h->size - h->cur < sizeof(struct hvm_save_descriptor) )
>>          {
>>              /* Run out of data */
>>              printk(XENLOG_G_ERR
>>                     "HVM%d restore: save did not end with a null entry\n",
>>                     d->domain_id);
>> +            ASSERT(!real);
>>              return -ENODATA;
>>          }
>>  
>>          /* Read the typecode of the next entry  and check for the end-marker */
>>          desc = (struct hvm_save_descriptor *)(&h->data[h->cur]);
>> -        if ( desc->typecode == 0 )
>> +        if ( desc->typecode == HVM_SAVE_CODE(END) )
>> +        {
>> +            /* Reset cursor for hvm_load(, true, ). */
>> +            if ( !real )
>> +                h->cur = 0;
>>              return 0;
>> +        }
>>  
>>          /* Find the handler for this entry */
>> -        if ( (desc->typecode > HVM_SAVE_CODE_MAX) ||
>> -             ((handler = hvm_sr_handlers[desc->typecode].load) == NULL) )
>> +        if ( desc->typecode >= ARRAY_SIZE(hvm_sr_handlers) ||
>> +             !(name = hvm_sr_handlers[desc->typecode].name) ||
>> +             !(load = hvm_sr_handlers[desc->typecode].load) )
>>          {
>>              printk(XENLOG_G_ERR "HVM%d restore: unknown entry typecode %u\n",
>>                     d->domain_id, desc->typecode);
> 
> The message is not very accurate here, it does fail when the typecode
> is unknown, but also fails when such typecode has no name or load
> function setup.

Yes and no, and it's not changing in this patch. Are you suggesting I should
change it despite being unrelated? If so, there not being a name (which is
the new check I'm adding) still suggests the code is unknown. There not being
a load handler really indicates a bug in Xen (yet no reason to e.g. BUG() in
that case, the failed loading will hopefully be noticeable enough).

Jan

