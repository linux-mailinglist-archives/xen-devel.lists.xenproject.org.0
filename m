Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D34BFB232
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 11:21:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147716.1479890 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBV22-0002AI-HL; Wed, 22 Oct 2025 09:21:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147716.1479890; Wed, 22 Oct 2025 09:21:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBV22-00028q-Ed; Wed, 22 Oct 2025 09:21:22 +0000
Received: by outflank-mailman (input) for mailman id 1147716;
 Wed, 22 Oct 2025 09:21:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBV20-00028k-HB
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 09:21:20 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 768b1cd3-af28-11f0-9d15-b5c5bf9af7f9;
 Wed, 22 Oct 2025 11:21:17 +0200 (CEST)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-46e6ba26c50so42108785e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 02:21:17 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-427ea5b3c34sm24057968f8f.17.2025.10.22.02.21.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 02:21:16 -0700 (PDT)
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
X-Inumbo-ID: 768b1cd3-af28-11f0-9d15-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761124877; x=1761729677; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QY6aoDLRkUV73YUObjsXqpWa8DSMsOni1KkIN5MaqQc=;
        b=MgqvHmGf8h63f6i+mJQ8rMI55B27FUgO+epPHzGxvhAM1qGuljksJe4ZFDp1Uc2q3j
         q6yAN8YqFk7/83LJZwnB1a2xTuupTlg9riDmmiNdBOSfmM+PmV9Sda9dSXwwAK/yfNmI
         u7MtUONreVBslDKb8+9RxIdYJLREgH5mnDZQx2eQ98rfYvYp93dz/ZFG33nbORd+zNJn
         mhjjdJE/cCaa92yJ4O52XAKyYGRsCDwjqinTNRxEmQ+jaPWrGLCa8wCQDDwYgaDB2nH1
         B599rN14iauRsZ59KLv51n/vbVmn+vwtDdT4+Qv82ACmb4QNU1+R6dY00vaV5LqVgYjr
         UGPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761124877; x=1761729677;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QY6aoDLRkUV73YUObjsXqpWa8DSMsOni1KkIN5MaqQc=;
        b=oDGaXC36E9jRuFh+9a/JXnW2d+82JojZxs8QT3MQuUdgvYI+CgWU4Fchb1oSeWlsDc
         x2uv3NWSGisUhGd6FIZsf+c6xu6NJ6hJitPDsoP+qklK0PSPKaSoAR/ydg0PMhW0abvn
         HHW2KPyE4+yFoM8owO04uYEc7bzhq1a/xrrBhu+xaOH3O/O5/UH/wmS+JusAkqyDYOGc
         19Q1vgLcuXqCpYk4ChZPkQ5PsWg1jLa2iT169rBpeUyUPC34vARlOmDQRP4NhOG6Xpu+
         8bzSzQh3tUivaXEFSCHn0yrl4N4NV5Uo2/ASN/wplvEckl8vkb4PLWFysXubnQLDBKNb
         8mqA==
X-Gm-Message-State: AOJu0Yw6dnh1RFLx2Eab307pVxgpxInVEzYSyBB2XuoKixtE5MEj2xRT
	WczA/EjDSd8Kh6RbGa50XCheuTb3O2yVxLfm3ZeJhwokmhjFacWbj2ZDyEz9DzVRsw==
X-Gm-Gg: ASbGncvAmmRHMVNKWPctpozksXqQDd8eGNQKLOP+Wcd5AX9XKNp6ABMClDpevMZbB9N
	iMrYFN8YWBg9G/KYidxnefjlouPViqflEHXSouTAmZ0Th1rSgT/jRPaYO/ipSKWNBW6uHaYky37
	+lq16AZwI8ueTy9uJ4q+ujIXJbaFSsfjDWPZ0EQfraYSze5VO42zoKV1HHkFo/Unf5fIMlk2p7A
	gryD5Hj8bnR0kqjSjTUSfT5B4bXp0K7OZSGQ+F+Ul+nQxv8Rc/PZV7KCT/QRN8Gq+/vOVFSoB0N
	vI6ozWSegACEYyk4Klt53kZxuPZ0bB0aa07FN8fQgdlTPPk0VFDytOn5r/WWlPpSpidWv6EdKLD
	VK3HGPKDhWSF6IcOJMggDX00lpt/VXbqGw5neoIDukbVmc/7jlAdQOsVIIjLu1KWvkDLZRsVVaG
	ji9gfY1l375UnVHjJtBZYsp7eaBVaz08z0D3kDML3e6rfWSpc0OqH+A2u9X+nX0Sniaqy1BbU=
X-Google-Smtp-Source: AGHT+IHz9ekCSpEi8VFfTFG0FP4qUO0KnD+ArYxSMJDqS/q+hmEr9WwiAWwTd6ZyqLT0eIUSeCoLeQ==
X-Received: by 2002:a05:600c:818f:b0:46f:b42e:e361 with SMTP id 5b1f17b1804b1-47117931c89mr138169825e9.41.1761124876695;
        Wed, 22 Oct 2025 02:21:16 -0700 (PDT)
Message-ID: <16d62ac6-6666-4bad-be59-324cec634a20@suse.com>
Date: Wed, 22 Oct 2025 11:21:15 +0200
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
 <7128bbb5-d099-4584-8cd0-bfeec49b3e55@suse.com> <aPePepQk3t6gxMR1@Mac.lan>
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
In-Reply-To: <aPePepQk3t6gxMR1@Mac.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21.10.2025 15:49, Roger Pau Monné wrote:
> On Tue, Oct 21, 2025 at 08:42:13AM +0200, Jan Beulich wrote:
>> On 20.10.2025 18:22, Roger Pau Monné wrote:
>>> On Mon, Oct 20, 2025 at 01:18:34PM +0200, Jan Beulich wrote:
>>>> Using dynamically allocated / maintained vectors has several downsides:
>>>> - possible nesting of IRQs due to the effects of IRQ migration,
>>>> - reduction of vectors available for devices,
>>>> - IRQs not moving as intended if there's shortage of vectors,
>>>> - higher runtime overhead.
>>>>
>>>> As the vector also doesn't need to be of any priority (first and foremost
>>>> it really shouldn't be of higher or same priority as the timer IRQ, as
>>>> that raises TIMER_SOFTIRQ anyway), avoid any "ordinary" vectors altogther
>>>> and use a vector from the 0x10...0x1f exception vector space. Exception vs
>>>> interrupt can easily be distinguished by checking for the presence of an
>>>> error code.
>>>>
>>>> With a fixed vector, less updating is now necessary in
>>>> set_channel_irq_affinity(); in particular channels don't need transiently
>>>> masking anymore, as the necessary update is now atomic. To fully leverage
>>>> this, however, we want to stop using hpet_msi_set_affinity() there. With
>>>> the transient masking dropped, we're no longer at risk of missing events.
>>>>
>>>> In principle a change to setup_vector_irq() would be necessary, but only
>>>> if we used low-prio vectors as direct-APIC ones. Since the change would be
>>>> at best benign here, it is being omitted.
>>>>
>>>> Fixes: 996576b965cc ("xen: allow up to 16383 cpus")
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> Release-Acked-by: Oleksii Kurochko<oleksii.kurochko@gmail.com>
>>>> ---
>>>> This is an alternative proposal to
>>>> https://lists.xen.org/archives/html/xen-devel/2014-03/msg00399.html.
>>>>
>>>> Should we keep hpet_msi_set_affinity() at all? We'd better not have the
>>>> generic IRQ subsystem play with our IRQs' affinities ... (If so, this
>>>> likely would want to be a separate patch, though.)
>>>
>>> I think that needs to become a no-op, with possibly an ASSERT?  Is it
>>> possibly for dom0 to try to balance this IRQ?  I would think not.
>>
>> I'd consider it an error if that was possible. But then the same goes for
>> other Xen-internal IRQs, like the IOMMU ones. They all implement a
>> .set_affinity hook ...
> 
> We need such hook for fixup_irqs() at least, so that interrupts can be
> evacuated when an AP goes offline.

Hmm, yes. Just not here.

>>>> @@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
>>>>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
>>>>  {
>>>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
>>>> +    struct msi_msg msg = ch->msi.msg;
>>>>  
>>>>      ASSERT(!local_irq_is_enabled());
>>>>      spin_lock(&desc->lock);
>>>> -    hpet_msi_mask(desc);
>>>> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
>>>> -    hpet_msi_unmask(desc);
>>>> +
>>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
>>>> +
>>>> +    /*
>>>> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
>>>> +     * actual update below (either of the IRTE or of [just] message address;
>>>> +     * with interrupt remapping message address/data don't change) now being
>>>> +     * atomic, we can avoid masking the IRQ around the update.  As a result
>>>> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
>>>> +     * keeps setting the new deadline only afterwards).
>>>> +     */
>>>> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
>>>> +
>>>>      spin_unlock(&desc->lock);
>>>>  
>>>> -    spin_unlock(&ch->lock);
>>>> +    msg.dest32 = cpu_physical_id(ch->cpu);
>>>> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>>>> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
>>>> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>>>> +    {
>>>> +        ch->msi.msg = msg;
>>>> +
>>>> +        if ( iommu_intremap != iommu_intremap_off )
>>>> +        {
>>>> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
>>>>  
>>>> -    /* We may have missed an interrupt due to the temporary masking. */
>>>> -    if ( ch->event_handler && ch->next_event < NOW() )
>>>> -        ch->event_handler(ch);
>>>> +            ASSERT(rc <= 0);
>>>> +            if ( rc > 0 )
>>>> +            {
>>>> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>>>> +                ASSERT(msg.address_lo ==
>>>> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
>>>> +            }
>>>
>>> The sequence of asserts seem wrong here, the asserts inside of the rc
>>>> 0 check will never trigger, because there's an ASSERT(rc <= 0)
>>> ahead of them?
>>
>> Hmm. My way of thinking was that if we get back 1 (which we shouldn't),
>> we ought to check (and presumably fail on) data or address having changed.
> 
> Right, but the ASSERT(rc <= 0) will prevent reaching any of the
> followup ASSERTs if rc == 1?

Which is no problem, as we'd be dead already anyway if the first assertion
triggered. Nevertheless I've switched the if() to >= 0 (which then pointed
out a necessary change in AMD IOMMU code).

>  IOW, we possibly want:
> 
>             if ( rc > 0 )
>             {
>                 dprintk(XENLOG_ERR,
>                         "Unexpected HPET MSI setup returned: data: %#x address: %#lx expected data %#x address %#lx\n",
>                         msg.data, msg.address,
>                         ch->msi.msg.data, ch->msi.msg.address);
>                 ASSERT_UNREACHABLE();
>                 hpet_msi_mask(desc);
>                 hpet_write32(msg.data, HPET_Tn_ROUTE(ch->idx));
>                 hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
>                 hpet_msi_unmask(desc);
>             }
>             ASSERT(!rc);

To be honest, for my taste this goes too far as to what follows an
ASSERT_UNREACHABLE().

> I'm unsure about attempting to propagate the returned values on release
> builds, I guess it's slightly better than possibly using an outdated
> RTE entry?  Albeit this should never happen.

Yes to the last remark; I don't actually see what you would want to do
with the propagated return value.

> Also, should the desc->arch.cpu_mask update only be done after the MSI
> fields have correctly updated, so that in case of failure of
> iommu_update_ire_from_msi(9 we could return early form the function
> and avoid changing desc->arch.cpu_mask?

Hmm, yes, I could do that, but then also in hpet_msi_set_affinity().
However, as this needs doing under the IRQ descriptor lock, I'd have to
either extend the locked region here (again), or re-acquire the lock
later. Neither looks very attractive to me.

Jan

