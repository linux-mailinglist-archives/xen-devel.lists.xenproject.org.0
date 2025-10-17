Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB64FBE6E70
	for <lists+xen-devel@lfdr.de>; Fri, 17 Oct 2025 09:15:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1144986.1478166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9egE-00045a-K6; Fri, 17 Oct 2025 07:15:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1144986.1478166; Fri, 17 Oct 2025 07:15:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v9egE-00043k-Fo; Fri, 17 Oct 2025 07:15:14 +0000
Received: by outflank-mailman (input) for mailman id 1144986;
 Fri, 17 Oct 2025 07:15:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=k1Ob=42=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v9egD-00043e-58
 for xen-devel@lists.xenproject.org; Fri, 17 Oct 2025 07:15:13 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04a4eb84-ab29-11f0-980a-7dc792cee155;
 Fri, 17 Oct 2025 09:15:11 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4710665e7deso7321975e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 17 Oct 2025 00:15:11 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce582b39sm38423909f8f.15.2025.10.17.00.15.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Oct 2025 00:15:09 -0700 (PDT)
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
X-Inumbo-ID: 04a4eb84-ab29-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1760685310; x=1761290110; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=XvSbBtLRcuTeJpB8h5iN74f2IFoPayK528G1grRnZeo=;
        b=P7WR1fv8A1uCmmK2dFbrP/GAE8zRIv06zTL/KKedksoKhUg4Flp6xw4Qd1rVjJmGNY
         3qHHZ96Q82HZU48uCYsoSpDpLtXFoO4d8Lfw4x+Dpbir3bUtTrSlEbXsdenTaKjehsBn
         LMmTTEIkMphJHy+rmrChPxYuWaSJ2MmUb48w/s+HzOOO5/NkkBzRhhC5TMH/xpgdt7aE
         YbC8wlVAXuF8/41i0rRIQklaTqBC7SvZqLz/MYqUqPN0uhrZIfIQPh+XkfEfpBMpTxGA
         6ow6CrQSOXU07I1u+IpUmy6ZhuwC0ycRRF44ghMVaiWkYhJYJFzVJDaNUUs906cKouVL
         QuRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760685310; x=1761290110;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XvSbBtLRcuTeJpB8h5iN74f2IFoPayK528G1grRnZeo=;
        b=rFv2odKeQqUxsqbI9Xj+teEt2qzA9cqQenQSQC3V+h2FKfYlJkUZBU7J3WqhkLXZS0
         YW4k1EJnd7yFs+QlIQUlv1bDmfAk5bMjE5QNpkry+RhK6Ivd5Mlo4cXlfTEF2Qt6Nhmf
         +U2iLWwND69hSVNt3B7nvo5f1x+oo6RRJMCJRmIy4WztBoRoaJa9DAI8dhO4R4Dvk6Gf
         h3QBHazYAFyZCXPs0eCgHG37MUene7XB/T1Tlk57yEE+h0EefxiGGMmt+WWVoVBpyQgL
         Kwi6OoeaVDTOKxGLhS5/VQPVJfixk7zaE2+BKmKTag0nzgXylGcmn6Q4HhJHSorsCbYS
         HKUg==
X-Gm-Message-State: AOJu0Yz10T8/QCeP4WPZb4gJr5GDmWACBm7vvJdMSE2KEIK21m3kZGSc
	gFDWYeWUFMIRLzAyHRuyYtSeT23LP2Vdd81Frr7TNhJq8LJAYUqZtXfo4kQcb8p7tQ==
X-Gm-Gg: ASbGnctUkoaD6JJ/mTpKQYv/fyxpT0ldHtyODU8B/TNGqMQExrkMpPtqHY0gWl6VVXU
	Xga658vT4c4pXz79nGHoDv1JffbQ7C9NJKa1zmKnqWDQ9GavSiOx2bD8zWBrDYWYCZAh99mn2C2
	VjP0N74TfzwJNKWxTTK6XzXwzISGNlbnT+JeN9u8dofhZyaYwdgUzIoX5/Y5Ud9xRTmcn/Fx92D
	LErLxg8vOHMhf2hKa90yFf85/NYIGwrL0Fs5lB8K/5Gdh9Pp5fCK9nbtft7YV3XixYScJln0GKh
	R+LX8kSsidk8mwYrgzm06EsWxtGWwO1lGN9UXnWPHKp4X7L65GoNfej/u1lu2U9e8RQszYHyWHs
	stKP7TSbBYvBmMR9IkwYvkvGF+/xIKod3W9OPSYjpTX4RJTsQzUC5sP29goEkcn8yHQyqlQUxuk
	JhmpNbQMTZaff8rQurCfezkHgwQDo7jV4kOujF1KtXbuNaNoNINmaWRLfy6L8T
X-Google-Smtp-Source: AGHT+IFv06iRIMQDrVDWgV7pbdfiDYqmMsmYdztANV5FcY+3bGBu9dNFZvF3kD7IEZy9AnvWOiJs8g==
X-Received: by 2002:a05:600c:5026:b0:46e:477a:f3dd with SMTP id 5b1f17b1804b1-4711792a680mr19375575e9.36.1760685310228;
        Fri, 17 Oct 2025 00:15:10 -0700 (PDT)
Message-ID: <39f00b12-a3f7-4185-a8fa-2c99c43695d9@suse.com>
Date: Fri, 17 Oct 2025 09:15:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.21 03/10] x86/HPET: use single, global, low-priority
 vector for broadcast IRQ
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <8d94abf8-70d1-478c-885e-ff9a960ac72d@suse.com>
 <64d52793-be70-4ae8-9bae-ad88f6379395@suse.com> <aPEc3VWLI0ofq22f@Mac.lan>
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
In-Reply-To: <aPEc3VWLI0ofq22f@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 16.10.2025 18:27, Roger Pau Monné wrote:
> On Thu, Oct 16, 2025 at 09:32:04AM +0200, Jan Beulich wrote:
>> @@ -307,15 +309,13 @@ static void cf_check hpet_msi_set_affini
>>      struct hpet_event_channel *ch = desc->action->dev_id;
>>      struct msi_msg msg = ch->msi.msg;
>>  
>> -    msg.dest32 = set_desc_affinity(desc, mask);
>> -    if ( msg.dest32 == BAD_APICID )
>> -        return;
>> +    /* This really is only for dump_irqs(). */
>> +    cpumask_copy(desc->arch.cpu_mask, mask);
> 
> If you no longer call set_desc_affinity(), could you adjust the second
> parameter of hpet_msi_set_affinity() to be unsigned int cpu instead of
> a cpumask?

Looks like I could, yes. But then we need to split the function, as it's
also used as the .set_affinity hook.

> And here just clear desc->arch.cpu_mask and set the passed CPU.

Which would still better be a cpumask_copy(), just given cpumask_of(cpu)
as input.

>> -    msg.data &= ~MSI_DATA_VECTOR_MASK;
>> -    msg.data |= MSI_DATA_VECTOR(desc->arch.vector);
>> +    msg.dest32 = cpu_mask_to_apicid(mask);
> 
> And here you can just use cpu_physical_id().

Right. All of which (up to here; but see below) perhaps better a separate,
follow-on cleanup change.

>>      msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>>      msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
>> -    if ( msg.data != ch->msi.msg.data || msg.dest32 != ch->msi.msg.dest32 )
>> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>>          hpet_msi_write(ch, &msg);
> 
> A further note here, which ties to my comment on the previous patch
> about loosing the interrupt during the masked window.  If the vector
> is the same across all CPUs, we no longer need to update the MSI data
> field, just the address one, which can be done atomically.  We also
> have signaling from the IOMMU whether the MSI fields need writing.

Hmm, yes, we can leverage that, as long as we're willing to make assumptions
here about what exactly iommu_update_ire_from_msi() does: We'd then rely on
not only the original (untranslated) msg->data not changing, but also the
translated one. That looks to hold for both Intel and AMD, but it's still
something we want to be sure we actually want to make the code dependent
upon. (I'm intending to at least add an assertion to that effect.)

> We can avoid the masking, and the possible drop of interrupts.

Hmm, right. There's nothing wrong with the caller relying on the write
being atomic now. (Really, continuing to use hpet_msi_write() wouldn't
be a problem, as re-writing the low half of HPET_Tn_ROUTE() with the
same value is going to be benign. Unless of course that write was the
source of the extra IRQs I'm seeing.)

Taking together with what you said further up, having
set_channel_irq_affinity() no longer use hpet_msi_set_affinity() as it
is to ...

>> @@ -328,7 +328,7 @@ static hw_irq_controller hpet_msi_type =
>>      .shutdown   = hpet_msi_shutdown,
>>      .enable	    = hpet_msi_unmask,
>>      .disable    = hpet_msi_mask,
>> -    .ack        = ack_nonmaskable_msi_irq,
>> +    .ack        = irq_actor_none,
>>      .end        = end_nonmaskable_irq,
>>      .set_affinity   = hpet_msi_set_affinity,

... satisfy the use here would then probably be desirable right away.
The little bit that's left of hpet_msi_set_affinity() would then be
open-coded in set_channel_irq_affinity().

Getting rid of the masking would (hopefully) also get rid of the stray
IRQs that I'm observing, assuming my guessing towards the reason there
is correct.

>> @@ -497,6 +503,7 @@ static void set_channel_irq_affinity(str
>>      spin_lock(&desc->lock);
>>      hpet_msi_mask(desc);
>>      hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
> 
> I would set the vector table ahead of setting the affinity, in case we
> can drop the mask calls around this block of code.

Isn't there a problematic window either way round? I can make the change,
but I don't see that addressing anything. The new comparator value will
be written later anyway, and interrupts up to that point aren't of any
interest anyway. I.e. it doesn't matter which of the CPUs gets to handle
them.

> I also wonder, do you really need the bind_irq_vector() if you
> manually set the affinity afterwards, and the vector table plus
> desc->arch.cpu_mask are also set here?

At the very least I'd then also need to open-code the setting of
desc->arch.vector and desc->arch.used. Possibly also the setting of the
bit in desc->arch.used_vectors. And strictly speaking also the
trace_irq_mask() invocation.

>> --- a/xen/arch/x86/include/asm/irq-vectors.h
>> +++ b/xen/arch/x86/include/asm/irq-vectors.h
>> @@ -18,6 +18,15 @@
>>  /* IRQ0 (timer) is statically allocated but must be high priority. */
>>  #define IRQ0_VECTOR             0xf0
>>  
>> +/*
>> + * Low-priority (for now statically allocated) vectors, sharing entry
>> + * points with exceptions in the 0x10 ... 0x1f range, as long as the
>> + * respective exception has an error code.
>> + */
>> +#define FIRST_LOPRIORITY_VECTOR 0x10
>> +#define HPET_BROADCAST_VECTOR   X86_EXC_AC
>> +#define LAST_LOPRIORITY_VECTOR  0x1f
> 
> I wonder if it won't be clearer to simply reserve a vector if the HPET
> is used, instead of hijacking the AC one.  It's one vector less, but
> arguably now that we unconditionally use physical destination mode our
> pool of vectors has expanded considerably.

Well, I'd really like to avoid consuming an otherwise usable vector, if
at all possible (as per Andrew's FRED plans, that won't be possible
there anymore then).

>> --- a/xen/arch/x86/irq.c
>> +++ b/xen/arch/x86/irq.c
>> @@ -755,8 +755,9 @@ void setup_vector_irq(unsigned int cpu)
>>          if ( !irq_desc_initialized(desc) )
>>              continue;
>>          vector = irq_to_vector(irq);
>> -        if ( vector >= FIRST_HIPRIORITY_VECTOR &&
>> -             vector <= LAST_HIPRIORITY_VECTOR )
>> +        if ( vector <= (vector >= FIRST_HIPRIORITY_VECTOR
>> +                        ? LAST_HIPRIORITY_VECTOR
>> +                        : LAST_LOPRIORITY_VECTOR) )
>>              cpumask_set_cpu(cpu, desc->arch.cpu_mask);
> 
> I think this is wrong.  The low priority vector used by the HPET will
> only target a single CPU at a time, and hence adding extra CPUs to
> that mask as part of AP bringup is not correct.

I'm not sure about "wrong". It's not strictly necessary for the HPET one,
I expect, but it's generally what would be necessary. For the HPET one,
hpet_msi_set_affinity() replaces the value anyway. (I can add a sentence
to this effect to the description, if that helps.)

Jan

