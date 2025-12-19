Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5528CD039A
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 15:17:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190698.1511008 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWbHd-0003RD-NP; Fri, 19 Dec 2025 14:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190698.1511008; Fri, 19 Dec 2025 14:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWbHd-0003Ok-Jk; Fri, 19 Dec 2025 14:16:41 +0000
Received: by outflank-mailman (input) for mailman id 1190698;
 Fri, 19 Dec 2025 14:16:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vWbHc-0003Oe-Py
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 14:16:40 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5365afb7-dce5-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 15:16:35 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-42e2e77f519so1320607f8f.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 06:16:35 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea830fesm5162451f8f.20.2025.12.19.06.16.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 06:16:33 -0800 (PST)
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
X-Inumbo-ID: 5365afb7-dce5-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766153795; x=1766758595; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9NcFCrU2zeObXvlfOzBhBH/aBc2X2ZqANkEVmij7Rh8=;
        b=S+xNmI/dGuO2wXGSNMFh4dFnMoJ3dQNb+Tj+y+FUnaO5JwW5GXgOMByraoIns8qIzM
         0ruPdzPkTf/yki+eJ4Rrrb6JQ4Z9wecrcHibNhocrPuZArqJ7VVdlZVFe5UpNXoNJa0B
         GDDik0PuX4+IAcr0Oedw8og2+c2e0i60YtUsN1TT+58TAJfbt6ZzXfelE9OJY9E3uO6Q
         2ND6H+c8eVeI5zOBASoXQkqZGgliCCNjwG5HC7fQ5GEXvLxBbUh1G7YdwLQFatVJJ4UP
         rjP1SZR7Ns48VNZ77S4C5r6QZY48Mu+UOAfgYK6gI6xOkAfPEELNmrEqiZW7YoCQ6N8b
         4NGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766153795; x=1766758595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NcFCrU2zeObXvlfOzBhBH/aBc2X2ZqANkEVmij7Rh8=;
        b=mk0eiM6XwAwtU1kfYqaFbuQ01AeAVQyj2Z4hkZH8q74u/c2oi7I3XwSIF/u0ZkmXi6
         kzfdvtcbSJTWy++53dxiPCcvhi+q2vPSSfl4vhtlZ6xJaBFkv9euNuRhYu51UEL1h63y
         nvqScbIpfcPvoPt3Cn0SPNKkY7HPOByMoJv/NHKf/r1+PWNaG/+Inh6hnVrJxmf23ZaO
         e4qVI5Jjg/ZaB0aAsu8pDISlxO4SbPBkbVd5zR0r6QWbqxvPSaAd/c9rRsKaTpYQwaci
         lteeDQ8adhxhnjDxubJOL6YGp8JvOLS1/bDDs3rK/2B1xxaNmVlKFVq40RQw9T7dNUz9
         amFA==
X-Forwarded-Encrypted: i=1; AJvYcCX5MOykW+kMmyiprBmUTo6iYtKChYNujYrtfXfo18GeJnpXAtn3SSHCQgyumDxNk4iwaDXYbk/1084=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwgsnZx4Z7xAITy8ldNYg3ioB/D11pvGb8P5rZZ+IWygVagsv1C
	JkYpyQfHbR+7rbcRv3jDy6vmXYC374X5plz/R58qzKmrMaNcBqYNnX58am6D0CX+4FMze1WoIwR
	Fq+o=
X-Gm-Gg: AY/fxX4du3QlvhSBqzevSjU3dJMqYrb6EhE1pFW9BmGnL5wxbhUgA/tT8HFCl0GkWt7
	zmiGYQh0NbqAI1KVS/HXx/5D0d6v6adVtV+EwtskuSlCQ/IgYn/KdWh//vYbM9iwyzjiZDlvOr5
	9UixtgAvhm8da8rutuQ6c8oK+oN1nXuRccOTQV50zk6iKywH+fUbU5oO95zxwwrmYrspJOW1fZH
	2dm1fRk3Reix1N5naTD2KgoHp76ptBo/c5pOQSo+pkXR7IPz7v+5qaK/QWjUmGhRXZg2pJ/5AdG
	znnig1Q8kih0WEcrNi1CaTG43VGTTG03xWeKZo0OsbOuEGcVqrpmJek+TUVaPqvlUplRtVXUz0M
	rL4dSGxpPaaCbY1d4O1/lJ07wvWPN/Ta1Af8JMteh4Z0Lwm2Skr0SXiLDT+u1o7IfOc9fte8fVD
	5vwfRNQSlDX7zf+Cgef33rbU/BbilrNf3f3hFzMEPFriyI3eZGz2o7M2bUdl+JXLgqKJ5LB9hhy
	2U=
X-Google-Smtp-Source: AGHT+IHTsCatPScWQn0qbKhlJDW8etQui7WBlkAFjBGDqN8UI9csZFHmk/nSmR9iVVX8j5KiAZVQig==
X-Received: by 2002:a05:6000:2909:b0:430:f97a:6f43 with SMTP id ffacd0b85a97d-4324e709710mr3802520f8f.53.1766153794756;
        Fri, 19 Dec 2025 06:16:34 -0800 (PST)
Message-ID: <ca485923-ee76-4be6-bb92-7782800f7fee@suse.com>
Date: Fri, 19 Dec 2025 15:16:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <946a1c2cfaf4157074470a653bba5baa8561ebbf.1766053253.git.oleksii.kurochko@gmail.com>
 <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
 <33574fb0-0331-48ac-a7c1-e4a2907db0d1@gmail.com>
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
In-Reply-To: <33574fb0-0331-48ac-a7c1-e4a2907db0d1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 19.12.2025 13:42, Oleksii Kurochko wrote:
> 
> On 12/18/25 7:15 PM, Andrew Cooper wrote:
>> On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>>> index 3ebdf9953f..8b17871b86 100644
>>> --- a/xen/arch/arm/vgic.c
>>> +++ b/xen/arch/arm/vgic.c
>>> @@ -370,29 +370,35 @@ int vcpu_vgic_init(struct vcpu *v)
>>>   {
>>>       int i;
>>>   
>>> -    v->arch.vgic.private_irqs = xzalloc(struct vgic_irq_rank);
>>> -    if ( v->arch.vgic.private_irqs == NULL )
>>> +    v->arch.vgic = xzalloc(struct vgic_cpu);
>>> +    if ( v->arch.vgic == NULL )
>>> +        return -ENOMEM;
>>> +
>>> +    v->arch.vgic->private_irqs = xzalloc(struct vgic_irq_rank);
>>> +    if ( v->arch.vgic->private_irqs == NULL )
>>>         return -ENOMEM;
>> This error path needs to free v->arch.vgic.  (If we continue down this
>> route.  See below.)
>>
>>>   
>>>       /* SGIs/PPIs are always routed to this VCPU */
>>> -    vgic_rank_init(v->arch.vgic.private_irqs, 0, v->vcpu_id);
>>> +    vgic_rank_init(v->arch.vgic->private_irqs, 0, v->vcpu_id);
>>>   
>>>       v->domain->arch.vgic.handler->vcpu_init(v);
>>>   
>>> -    memset(&v->arch.vgic.pending_irqs, 0, sizeof(v->arch.vgic.pending_irqs));
>>> +    memset(&v->arch.vgic->pending_irqs, 0, sizeof(v->arch.vgic->pending_irqs));
>>>       for (i = 0; i < 32; i++)
>>> -        vgic_init_pending_irq(&v->arch.vgic.pending_irqs[i], i);
>>> +        vgic_init_pending_irq(&v->arch.vgic->pending_irqs[i], i);
>>>   
>>> -    INIT_LIST_HEAD(&v->arch.vgic.inflight_irqs);
>>> -    INIT_LIST_HEAD(&v->arch.vgic.lr_pending);
>>> -    spin_lock_init(&v->arch.vgic.lock);
>>> +    INIT_LIST_HEAD(&v->arch.vgic->inflight_irqs);
>>> +    INIT_LIST_HEAD(&v->arch.vgic->lr_pending);
>>> +    spin_lock_init(&v->arch.vgic->lock);
>>>   
>>>       return 0;
>>>   }
>>>   
>>>   int vcpu_vgic_free(struct vcpu *v)
>>>   {
>>> -    xfree(v->arch.vgic.private_irqs);
>>> +    xfree(v->arch.vgic->private_irqs);
>>> +    xfree(v->arch.vgic);
>>> +
>>>       return 0;
>>>   }
>> Free functions should be idempotent.  This was buggy before, even moreso
>> now.  It wants to be:
>>
>> void vcpu_vgic_free(struct vcpu *v)
>> {
>>      if ( v->arch.vgic )
>>      {
>>          XFREE(v->arch.vgic->private_irqs);
>>          XFREE(v->arch.vgic);
>>      }
>> }
>>
>> Given the type change, this probably wants splitting out into an earlier
>> patch.
>>
>> Given the fact that the single caller doesn't even check the return
>> value, you're fixing a MISRA violation by making it void.
> 
> Btw, IIUC, it could be also be something like:
>    (void) vcpu_vgic_free(...)
> and then we won't break any MISRA rule, right?

That would address one Misra concern, but there would then still be dead code.

Jan

