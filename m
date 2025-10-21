Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A5BBF4BB4
	for <lists+xen-devel@lfdr.de>; Tue, 21 Oct 2025 08:43:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1146852.1479205 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB64Y-0002E3-8N; Tue, 21 Oct 2025 06:42:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1146852.1479205; Tue, 21 Oct 2025 06:42:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vB64Y-0002BX-1T; Tue, 21 Oct 2025 06:42:18 +0000
Received: by outflank-mailman (input) for mailman id 1146852;
 Tue, 21 Oct 2025 06:42:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9TpK=46=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vB64W-0002BR-Ve
 for xen-devel@lists.xenproject.org; Tue, 21 Oct 2025 06:42:17 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 14c9733e-ae49-11f0-9d15-b5c5bf9af7f9;
 Tue, 21 Oct 2025 08:42:15 +0200 (CEST)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-47112a73785so39098115e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 20 Oct 2025 23:42:15 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144c82b8sm266431825e9.15.2025.10.20.23.42.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 23:42:14 -0700 (PDT)
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
X-Inumbo-ID: 14c9733e-ae49-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761028935; x=1761633735; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=1R4fWVqOsFGpSYag2la9O7ZCyPs8UBS+bf4VqA6zqOk=;
        b=RtplIlbBU3zRBjw/YdQx1SNOjAq2jE77qeH9soHdq8CU1oJZm4zt/pPwLE9GZFnXdl
         GyazwinDB4l1pCpijZSCuoLiAhRYXpPa5fzMWVVxcsQQKXIVV+5AuIG1lTaWxY9uVcHD
         UuMC52GYWzIUaB3B2YLLhUZeri5AgEOvK0f8meHRnpAq30UNb2shhPDjU5onaMxfwOUK
         gqFsSAJ89gc2ChXjHguUZyo+zgb/mmHzF4gUctoJUAcNNkBDUe049sk0IM2y0dWStFqO
         bNewVQ6NmAgCakLgL6FAB+WNw2uxzCq+hlw+VLDJljwMxgkBPKI7gFWe1BaL8TNUbzEs
         P+xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761028935; x=1761633735;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1R4fWVqOsFGpSYag2la9O7ZCyPs8UBS+bf4VqA6zqOk=;
        b=O/FBhzDR7zJWm3NXf9puEvo1wW4Tw3IjK+uX8v+I8wIeZ7EejEvSWAGvAlFAqGU1cN
         tqZuomvcCtjGtBAzGaDvHnelHD2PGdFGuYtru+IZUmIlwUwU38m+S0YkMlY5bZa//9uJ
         flwE/3Ete7CqqjIUkzGLdV41NccxoCqt2XtwqmNM9bVMXsIt6jdx1yaHoPQKXQx1Yby+
         V8apxKIyTvJI3VPlN+w6Ke5qHUsLz30xOqZZifqFpBe2XHjunfu/4D+YrVgYYzE1O4O+
         VUchmFFWuXLUvA8qubXUESCDZNzmVYm9GRoLqEIZ6yCuYTsL3yBl1ocy/8QkV3lQUzCn
         c05A==
X-Gm-Message-State: AOJu0YxzZlVEaRibcBImVtcTsBUgbbYXlVADp39vgUqLCxUCzSVqFnZh
	pf17LskphOlmJQfqFRbY4gZigXBNxImwaS6NCKP9J3913Qx5HCSlfVCw96V76yzG7g==
X-Gm-Gg: ASbGncslkZ7+JJNq3RAIFZO1ea7X0Qsraavc0MsguBTeTf50rVKheqy4jUsP5wO/g2J
	HCPN7TOzHpvcEg7+JFW1iRmQv2v5IUHQAm3Z3Kp2VjGFcy5MHvFY9plZavmNi599rt3XOAaKXk+
	jVxSf7duGe+t+1qJ2GbL3CmoCSXC5p82l98J2F9rDsqrEEjBccRQ7CIdZKG3IbHsBZQPScii7Qb
	urorok3XHfKd74qtipcY5QDx8UBXY0G+S2WwqA5ierCKT5i4DhpOj3/Vdg0KcdtOcxB5pN3bcEm
	KHF1wI3s6L6FdcWpxRMxplLi+qYPTFgJzBQr5BO7wCou7VmR9HDfOeLUHu5vyWPepf7M2HG++Wj
	I8WGNdDJg+yWX7RgWS+VOzwuuhhNqm/DIEMENL/BTIv1I9svvadIy/nnKodM5ZkHTvntcg7PBDR
	tyRXEjtnN8xUAXjT7oR5vrTQ+8kRqDccuMi9ByKmeGieJxIgOWImDXDE+0RLSMWoBnXLrMm/U=
X-Google-Smtp-Source: AGHT+IG5vsDJvLDufxVzviiqldq6Ym6fmrrNqts90rMhobwjJY5oFUVc2nfmJuqw0L+J4MLC9vDaWg==
X-Received: by 2002:a05:600c:5287:b0:46e:6a6a:5cec with SMTP id 5b1f17b1804b1-47117876738mr133422055e9.2.1761028934788;
        Mon, 20 Oct 2025 23:42:14 -0700 (PDT)
Message-ID: <7128bbb5-d099-4584-8cd0-bfeec49b3e55@suse.com>
Date: Tue, 21 Oct 2025 08:42:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com> <aPZh3Y8W4QcV_oLs@Mac.lan>
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
In-Reply-To: <aPZh3Y8W4QcV_oLs@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.10.2025 18:22, Roger Pau Monné wrote:
> On Mon, Oct 20, 2025 at 01:18:34PM +0200, Jan Beulich wrote:
>> Using dynamically allocated / maintained vectors has several downsides:
>> - possible nesting of IRQs due to the effects of IRQ migration,
>> - reduction of vectors available for devices,
>> - IRQs not moving as intended if there's shortage of vectors,
>> - higher runtime overhead.
>>
>> As the vector also doesn't need to be of any priority (first and foremost
>> it really shouldn't be of higher or same priority as the timer IRQ, as
>> that raises TIMER_SOFTIRQ anyway), avoid any "ordinary" vectors altogther
>> and use a vector from the 0x10...0x1f exception vector space. Exception vs
>> interrupt can easily be distinguished by checking for the presence of an
>> error code.
>>
>> With a fixed vector, less updating is now necessary in
>> set_channel_irq_affinity(); in particular channels don't need transiently
>> masking anymore, as the necessary update is now atomic. To fully leverage
>> this, however, we want to stop using hpet_msi_set_affinity() there. With
>> the transient masking dropped, we're no longer at risk of missing events.
>>
>> In principle a change to setup_vector_irq() would be necessary, but only
>> if we used low-prio vectors as direct-APIC ones. Since the change would be
>> at best benign here, it is being omitted.
>>
>> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>> ---
>> This is an alternative proposal to
>> https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.
>>
>> Should we keep hpet_msi_set_affinity() at all? We'd better not have the
>> generic IRQ subsystem play with our IRQs' affinities ... (If so, this
>> likely would want to be a separate patch, though.)
> 
> I think that needs to become a no-op, with possibly an ASSERT?  Is it
> possibly for dom0 to try to balance this IRQ?  I would think not.

I'd consider it an error if that was possible. But then the same goes for
other Xen-internal IRQs, like the IOMMU ones. They all implement a
.set_affinity hook ...

>> @@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
>>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
>>  {
>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
>> +    struct msi_msg msg = ch->msi.msg;
>>  
>>      ASSERT(!local_irq_is_enabled());
>>      spin_lock(&desc->lock);
>> -    hpet_msi_mask(desc);
>> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
>> -    hpet_msi_unmask(desc);
>> +
>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
>> +
>> +    /*
>> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
>> +     * actual update below (either of the IRTE or of [just] message address;
>> +     * with interrupt remapping message address/data don't change) now being
>> +     * atomic, we can avoid masking the IRQ around the update.  As a result
>> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
>> +     * keeps setting the new deadline only afterwards).
>> +     */
>> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
>> +
>>      spin_unlock(&desc->lock);
>>  
>> -    spin_unlock(&ch->lock);
>> +    msg.dest32 = cpu_physical_id(ch->cpu);
>> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
>> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>> +    {
>> +        ch->msi.msg = msg;
>> +
>> +        if ( iommu_intremap != iommu_intremap_off )
>> +        {
>> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
>>  
>> -    /* We may have missed an interrupt due to the temporary masking. */
>> -    if ( ch->event_handler && ch->next_event < NOW() )
>> -        ch->event_handler(ch);
>> +            ASSERT(rc <= 0);
>> +            if ( rc > 0 )
>> +            {
>> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>> +                ASSERT(msg.address_lo ==
>> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
>> +            }
> 
> The sequence of asserts seem wrong here, the asserts inside of the rc
> > 0 check will never trigger, because there's an ASSERT(rc <= 0)
> ahead of them?

Hmm. My way of thinking was that if we get back 1 (which we shouldn't),
we ought to check (and presumably fail on) data or address having changed.
Whereas when we get back 0, we're told "no change" anyway, and hence
checking isn't even needed. Did I misunderstand the purpose of the zero
vs positive return value here?

Of could I could switch to using "rc >= 0" anyway; I actually had it that
way first, but then decided the extra checks would be redundant in the 0
case.

>> +        }
>> +        else
>> +            hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
> 
> If you avoid the HPET register update here you possibly need to make
> sure that both fields are unconditionally written on the first call
> after resume from suspension.  hpet_resume() needs to somehow taint
> the channels to signal that a re-write of the address and data fields
> is mandatory regardless of what iommu_update_ire_from_msi() has
> returned.

hpet_broadcast_resume() calls __hpet_setup_msi_irq() (and hence
hpet_msi_write()), which I thought is enough?

Jan

