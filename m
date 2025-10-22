Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C92BFBC04
	for <lists+xen-devel@lfdr.de>; Wed, 22 Oct 2025 14:00:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1147944.1480088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBXVe-0006T9-55; Wed, 22 Oct 2025 12:00:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1147944.1480088; Wed, 22 Oct 2025 12:00:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vBXVe-0006Qd-1V; Wed, 22 Oct 2025 12:00:06 +0000
Received: by outflank-mailman (input) for mailman id 1147944;
 Wed, 22 Oct 2025 12:00:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pHug=47=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vBXVc-000617-G9
 for xen-devel@lists.xenproject.org; Wed, 22 Oct 2025 12:00:04 +0000
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [2a00:1450:4864:20::32e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a35d8929-af3e-11f0-980a-7dc792cee155;
 Wed, 22 Oct 2025 14:00:01 +0200 (CEST)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-47106fc51faso80674225e9.0
 for <xen-devel@lists.xenproject.org>; Wed, 22 Oct 2025 05:00:01 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475c427f685sm42272675e9.2.2025.10.22.05.00.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 05:00:00 -0700 (PDT)
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
X-Inumbo-ID: a35d8929-af3e-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1761134401; x=1761739201; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PJyxVjm5q9bljcHkMoaY8oQ6BrWP7IUKRjYfmIzh2M8=;
        b=anc4yLkLN4iaCLwz7LLukxiK4XtyRc+rm75LcxIh6Nromow9uRQb1/qFJzBX2tWqoz
         DJFX+3L2kawSw+j0rVmRRrBNs+XbvEB/oi8fy/goANmsPD/YrtBXQL7yq/MmfRFBE/SG
         t0wCpFhK3bqWoOwl/wZn9b5pqm8WUVLc6rr/YY3jvneWApF6OdvoIMy42Ov0lThZQVfc
         bnB/qwqGgP6XGTYprWHFpE5330+/l3tcis7/DzpnaFcw5jr+f94Q8WhvUb4hixAWMjw9
         D/YXMNi7xDUvn9RRukbEjBz6G7SrHl2HYBv1IIHz5HV0AQOz/SGo14ACypbSTcg6jdSt
         /GZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761134401; x=1761739201;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PJyxVjm5q9bljcHkMoaY8oQ6BrWP7IUKRjYfmIzh2M8=;
        b=hlbac47Y+KdqkpHaOAei3EVV+Grcbaa1iB/lDxQbuW0CL9UBG1LGlmwn/rpgtiE9k9
         lIbo5gkoDsatAvGTs22jP41qGB4iJuu2dBXX0wy0mkhVecCClBjK0DtR5cT5Nt4PezMo
         2HtADR/grOniMNuxcN4SnG1bWu5KF5+RuF6rSf8zISzLyMyIVy+1h2XsEKhFSCSzr5Vx
         Y0gh28ZKHk3VZnGj29Mj/7afmMAq2C5JNWKbGJYVcfUsvbssCKW66+exBcoKF67Kc6ov
         L1rgR/u00/rBcl3x69Ld3i6ecnP+VKWiB/B/8ymxLCZscqv1MQD4tXDJJNlOhknNwKIw
         BL1g==
X-Gm-Message-State: AOJu0YwqOggAQWy6bBav8yC4P8CFvQEDX8b0ml6zlpD5Piq8TK/SJW/q
	AHzZIIqd0QmuDuhSJwhYlzhkZQGgt0q86sZpfCX7dqilfurAwQ19OqdX8NeZWvaGsw==
X-Gm-Gg: ASbGncv7VV553teF34udZh1Y0bSLvZk2MvEtR/jzTSOd+sYXWDzU3+rJky9Nw6ezgyx
	ZnUjjDqCAFxDpLsybeibeD8JLIihYBL66yXYxGyhoQwG4LKHx/kL5yt53MpSJ1P1RImiVrodR3d
	qYUeVIc7/BdMTVgWSS3AL6ux9MatVQo3ieV3jNh13H9m/Izy7znTG78EfOEPK6JBLchclMOyq6y
	wQg1H4uHJrUnQRDIIWDysHwlZ7j2rJWzYRu5wn8ks6sZbg8rzmeKYzs66ZvoNzZP7EdHcpJ5fPR
	HrvTVFsYSfLbsj4z3y9qqYyHqkLTiv3Ie/wVMhkEwZ1EoEvyrKvIIMIMd0rm7G8ZJJcPWRcl2Kn
	fqp0ybYFFlNVgpndidtUYmOvQR1H2HBF4aucHR+zlxYUoEsFIDVqdzTNjytV8rFoOEe3JAGrZyl
	4KN/1EZ6mkaLtAYA8pMt3SGfZDdZJ/xdrUjdQDaA9Y2c9K1/zKSQ200h4QAq5C
X-Google-Smtp-Source: AGHT+IFQzs2IRI5vtAVmbTfVaYh4EaG3Nw5t+ZtV96faELYn3Sv2FEwlKL7/XAlsBRmhZl8oyqeMDg==
X-Received: by 2002:a05:600c:46c9:b0:471:747:2116 with SMTP id 5b1f17b1804b1-471179303d0mr156249935e9.41.1761134400740;
        Wed, 22 Oct 2025 05:00:00 -0700 (PDT)
Message-ID: <5345f214-41ec-40b0-a083-26a1415d8076@suse.com>
Date: Wed, 22 Oct 2025 13:59:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 for-4.21 2/9] x86/HPET: use single, global,
 low-priority vector for broadcast IRQ
From: Jan Beulich <jbeulich@suse.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <b66ea488-2d47-472c-9520-8590fdf89e0e@suse.com>
 <c8c124c4-71c5-41e7-8d84-fd45ffd6af14@suse.com> <aPZh3Y8W4QcV_oLs@Mac.lan>
 <7128bbb5-d099-4584-8cd0-bfeec49b3e55@suse.com> <aPePepQk3t6gxMR1@Mac.lan>
 <16d62ac6-6666-4bad-be59-324cec634a20@suse.com>
Content-Language: en-US
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
In-Reply-To: <16d62ac6-6666-4bad-be59-324cec634a20@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.10.2025 11:21, Jan Beulich wrote:
> On 21.10.2025 15:49, Roger Pau Monné wrote:
>> On Tue, Oct 21, 2025 at 08:42:13AM +0200, Jan Beulich wrote:
>>> On 20.10.2025 18:22, Roger Pau Monné wrote:
>>>> On Mon, Oct 20, 2025 at 01:18:34PM +0200, Jan Beulich wrote:
>>>>> @@ -476,19 +486,50 @@ static struct hpet_event_channel *hpet_g
>>>>>  static void set_channel_irq_affinity(struct hpet_event_channel *ch)
>>>>>  {
>>>>>      struct irq_desc *desc = irq_to_desc(ch->msi.irq);
>>>>> +    struct msi_msg msg = ch->msi.msg;
>>>>>  
>>>>>      ASSERT(!local_irq_is_enabled());
>>>>>      spin_lock(&desc->lock);
>>>>> -    hpet_msi_mask(desc);
>>>>> -    hpet_msi_set_affinity(desc, cpumask_of(ch->cpu));
>>>>> -    hpet_msi_unmask(desc);
>>>>> +
>>>>> +    per_cpu(vector_irq, ch->cpu)[HPET_BROADCAST_VECTOR] = ch->msi.irq;
>>>>> +
>>>>> +    /*
>>>>> +     * Open-coding a reduced form of hpet_msi_set_affinity() here.  With the
>>>>> +     * actual update below (either of the IRTE or of [just] message address;
>>>>> +     * with interrupt remapping message address/data don't change) now being
>>>>> +     * atomic, we can avoid masking the IRQ around the update.  As a result
>>>>> +     * we're no longer at risk of missing IRQs (provided hpet_broadcast_enter()
>>>>> +     * keeps setting the new deadline only afterwards).
>>>>> +     */
>>>>> +    cpumask_copy(desc->arch.cpu_mask, cpumask_of(ch->cpu));
>>>>> +
>>>>>      spin_unlock(&desc->lock);
>>>>>  
>>>>> -    spin_unlock(&ch->lock);
>>>>> +    msg.dest32 = cpu_physical_id(ch->cpu);
>>>>> +    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
>>>>> +    msg.address_lo |= MSI_ADDR_DEST_ID(msg.dest32);
>>>>> +    if ( msg.dest32 != ch->msi.msg.dest32 )
>>>>> +    {
>>>>> +        ch->msi.msg = msg;
>>>>> +
>>>>> +        if ( iommu_intremap != iommu_intremap_off )
>>>>> +        {
>>>>> +            int rc = iommu_update_ire_from_msi(&ch->msi, &msg);
>>>>>  
>>>>> -    /* We may have missed an interrupt due to the temporary masking. */
>>>>> -    if ( ch->event_handler && ch->next_event < NOW() )
>>>>> -        ch->event_handler(ch);
>>>>> +            ASSERT(rc <= 0);
>>>>> +            if ( rc > 0 )
>>>>> +            {
>>>>> +                ASSERT(msg.data == hpet_read32(HPET_Tn_ROUTE(ch->idx)));
>>>>> +                ASSERT(msg.address_lo ==
>>>>> +                       hpet_read32(HPET_Tn_ROUTE(ch->idx) + 4));
>>>>> +            }
>>>>
>>>> The sequence of asserts seem wrong here, the asserts inside of the rc
>>>>> 0 check will never trigger, because there's an ASSERT(rc <= 0)
>>>> ahead of them?
>>>
>>> Hmm. My way of thinking was that if we get back 1 (which we shouldn't),
>>> we ought to check (and presumably fail on) data or address having changed.
>>
>> Right, but the ASSERT(rc <= 0) will prevent reaching any of the
>> followup ASSERTs if rc == 1?
> 
> Which is no problem, as we'd be dead already anyway if the first assertion
> triggered. Nevertheless I've switched the if() to >= 0 (which then pointed
> out a necessary change in AMD IOMMU code).
> 
>>  IOW, we possibly want:
>>
>>             if ( rc > 0 )
>>             {
>>                 dprintk(XENLOG_ERR,
>>                         "Unexpected HPET MSI setup returned: data: %#x address: %#lx expected data %#x address %#lx\n",
>>                         msg.data, msg.address,
>>                         ch->msi.msg.data, ch->msi.msg.address);
>>                 ASSERT_UNREACHABLE();
>>                 hpet_msi_mask(desc);
>>                 hpet_write32(msg.data, HPET_Tn_ROUTE(ch->idx));
>>                 hpet_write32(msg.address_lo, HPET_Tn_ROUTE(ch->idx) + 4);
>>                 hpet_msi_unmask(desc);
>>             }
>>             ASSERT(!rc);
> 
> To be honest, for my taste this goes too far as to what follows an
> ASSERT_UNREACHABLE().

And it's insufficient: If we suspected the need for a non-atomic update,
the channel would need disabling before the IOMMU update.

Jan

