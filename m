Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 041E5CCFD9B
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 13:43:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190621.1510968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWZo8-0007cs-GT; Fri, 19 Dec 2025 12:42:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190621.1510968; Fri, 19 Dec 2025 12:42:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWZo8-0007bR-DJ; Fri, 19 Dec 2025 12:42:08 +0000
Received: by outflank-mailman (input) for mailman id 1190621;
 Fri, 19 Dec 2025 12:42:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S3ad=6Z=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1vWZo7-0007ah-7q
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 12:42:07 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1fe98628-dcd8-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 13:42:05 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-b7636c96b9aso299080466b.2
 for <xen-devel@lists.xenproject.org>; Fri, 19 Dec 2025 04:42:05 -0800 (PST)
Received: from [192.168.1.6] (user-109-243-71-38.play-internet.pl.
 [109.243.71.38]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b8037f4ef1fsm221975966b.64.2025.12.19.04.42.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Dec 2025 04:42:04 -0800 (PST)
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
X-Inumbo-ID: 1fe98628-dcd8-11f0-9cce-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766148125; x=1766752925; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F8amu2wqDy97vzBkq0Jt6gz7CwL9jcfmzjef9FC7dKQ=;
        b=KS6oca/ArqOfrZRosb0WaEcmzd+dhBu2O1kjlnCAwEGLWC/NNVQQVfyVcN1AE8BVte
         eNf/T2wTOSBUkCqzGYns8+AK0LHxDXEqIB8qPbkQkkrG1YHgvACrdjuXLgJvf/d4VQcN
         VyNTlh0G3NwhoHUP0k8+eFdCCCVU3BCiZ0EiU1RPrBIeeyUl9cwoCfIWH9STgKVN/eBF
         fx4cHDw+k2SokVBvZAJfFcQvZjkWMi781LGz7eL+pdLHMut426I/7izU8HYM0olm/Ye/
         FAWih15AN/aYXTHyZiYupbJGVeLDBXynepTtMUk6Q8gm3Ei7v6uFYmximuV9hdK3Jcs/
         lAjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766148125; x=1766752925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8amu2wqDy97vzBkq0Jt6gz7CwL9jcfmzjef9FC7dKQ=;
        b=AqzLoSXHR2LoeM7tY7J33rdp1k2rCVnjWCjY92zElI/n4GacRG2kjyl+aOludqR/Ox
         67Fdg8SabKcQ35PDBeXp88tE4XYkmZ3FvrK5eLHliR8trRZzOxJ8lJ+VJcBnT9JQzoXM
         Qygz1MEvpFgxB8iWrkb0D0r9XBYb137vTzWzqzDjuEwdL2808xcWe3BwKr2CXm7kWDUb
         aMgZ8Lf9wyW5JbwpmclU1WiayBDpUhZuCfAMrFu2qTm0fiDXan8k4FkuUCqQCuuabv6V
         M5NpGebwZzznpCqfE97VOpFc0cAGD1MF1m3SppHaoPk/ufzbiw4iFzXl5mzBG2LAWO8D
         UO3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVskP/557qbrQgJyP0s5gaT7kCS8qAynYGcqMGpNZf96gngc/usTJ4JSwHLT0hN0UvufgFdUXytcaE=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnZckzdhwY4ozN6J9ptjeyqeKbGJug6+SeIytln+15ouqDWFmv
	HDoS3hIMd/HXtdsytl8EFI3eTwvLj/GTAnDuRDqAKIyAekYTIkoRn+A0
X-Gm-Gg: AY/fxX4+ZVZ6Xsby0XjqPRDOKxLO3hdtsiOfQs5Mh0xxQhQ82lz2E+1wguetsteqmSW
	ti9412KIbvFxS/hHah7aITEn4QxDSm23ON8AM2SkJyss8hqpUXeY3j2fIY2dMZOcmxxq6eiQbaf
	tK/bLV+obr0TtdD80us8kl34lKT1PrtXO4b04Q1iT11+WD3Z4twHNwPOHoRu3Ho3g1JOwRUZMHn
	KbDd/6xa+XdHWkkc8sMk1Ej1HOMcUirUoV4cnIBYFrY5Nob71zb94SFqFfQwql2jKcwh3qJoVwq
	84qZQIZEOb0pRmJt0P5jVHqcnCb/EVikO38cMhiSUFKF3thAX0dFLpKQgkwtdC6Mn77J8hSohMs
	9uMBWLjt7zrOKuQKxdL12Xr31jmwxTt+vrNP8Fy0+CvLt6Wg9gBIw+dZTWqt2L77a92sxOomxTb
	7os5oG9IxgkGvXCyLr5mJETPS6MmZhKgvxeUPEDA6pV1peaR7RP/Ew2t3dSZtlOoaz
X-Google-Smtp-Source: AGHT+IFxdXPyR+fe+99EmunjSZAilJW7Yy05C7BiTXbPR0166XJdbJCjSEIb6hiiActUYZtN+UNXDw==
X-Received: by 2002:a17:907:940b:b0:b73:4d06:bc8 with SMTP id a640c23a62f3a-b8037233d2cmr232990666b.53.1766148124730;
        Fri, 19 Dec 2025 04:42:04 -0800 (PST)
Message-ID: <33574fb0-0331-48ac-a7c1-e4a2907db0d1@gmail.com>
Date: Fri, 19 Dec 2025 13:42:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] xen/arm: optimize the size of struct vcpu
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <946a1c2cfaf4157074470a653bba5baa8561ebbf.1766053253.git.oleksii.kurochko@gmail.com>
 <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
Content-Language: en-US
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
In-Reply-To: <ea01af72-c94e-4203-90c4-eaf68174b576@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 12/18/25 7:15 PM, Andrew Cooper wrote:
> On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
>> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
>> index 3ebdf9953f..8b17871b86 100644
>> --- a/xen/arch/arm/vgic.c
>> +++ b/xen/arch/arm/vgic.c
>> @@ -370,29 +370,35 @@ int vcpu_vgic_init(struct vcpu *v)
>>   {
>>       int i;
>>   
>> -    v->arch.vgic.private_irqs = xzalloc(struct vgic_irq_rank);
>> -    if ( v->arch.vgic.private_irqs == NULL )
>> +    v->arch.vgic = xzalloc(struct vgic_cpu);
>> +    if ( v->arch.vgic == NULL )
>> +        return -ENOMEM;
>> +
>> +    v->arch.vgic->private_irqs = xzalloc(struct vgic_irq_rank);
>> +    if ( v->arch.vgic->private_irqs == NULL )
>>         return -ENOMEM;
> This error path needs to free v->arch.vgic.  (If we continue down this
> route.  See below.)
>
>>   
>>       /* SGIs/PPIs are always routed to this VCPU */
>> -    vgic_rank_init(v->arch.vgic.private_irqs, 0, v->vcpu_id);
>> +    vgic_rank_init(v->arch.vgic->private_irqs, 0, v->vcpu_id);
>>   
>>       v->domain->arch.vgic.handler->vcpu_init(v);
>>   
>> -    memset(&v->arch.vgic.pending_irqs, 0, sizeof(v->arch.vgic.pending_irqs));
>> +    memset(&v->arch.vgic->pending_irqs, 0, sizeof(v->arch.vgic->pending_irqs));
>>       for (i = 0; i < 32; i++)
>> -        vgic_init_pending_irq(&v->arch.vgic.pending_irqs[i], i);
>> +        vgic_init_pending_irq(&v->arch.vgic->pending_irqs[i], i);
>>   
>> -    INIT_LIST_HEAD(&v->arch.vgic.inflight_irqs);
>> -    INIT_LIST_HEAD(&v->arch.vgic.lr_pending);
>> -    spin_lock_init(&v->arch.vgic.lock);
>> +    INIT_LIST_HEAD(&v->arch.vgic->inflight_irqs);
>> +    INIT_LIST_HEAD(&v->arch.vgic->lr_pending);
>> +    spin_lock_init(&v->arch.vgic->lock);
>>   
>>       return 0;
>>   }
>>   
>>   int vcpu_vgic_free(struct vcpu *v)
>>   {
>> -    xfree(v->arch.vgic.private_irqs);
>> +    xfree(v->arch.vgic->private_irqs);
>> +    xfree(v->arch.vgic);
>> +
>>       return 0;
>>   }
> Free functions should be idempotent.  This was buggy before, even moreso
> now.  It wants to be:
>
> void vcpu_vgic_free(struct vcpu *v)
> {
>      if ( v->arch.vgic )
>      {
>          XFREE(v->arch.vgic->private_irqs);
>          XFREE(v->arch.vgic);
>      }
> }
>
> Given the type change, this probably wants splitting out into an earlier
> patch.
>
> Given the fact that the single caller doesn't even check the return
> value, you're fixing a MISRA violation by making it void.

Btw, IIUC, it could be also be something like:
   (void) vcpu_vgic_free(...)
and then we won't break any MISRA rule, right?

I will send suggested updates in the separate patch of this patch series.


>
>> diff --git a/xen/arch/arm/vgic/vgic-init.c b/xen/arch/arm/vgic/vgic-init.c
>> index f8d7d3a226..67f297797f 100644
>> --- a/xen/arch/arm/vgic/vgic-init.c
>> +++ b/xen/arch/arm/vgic/vgic-init.c
>> @@ -241,10 +245,12 @@ void domain_vgic_free(struct domain *d)
>>   
>>   int vcpu_vgic_free(struct vcpu *v)
>>   {
>> -    struct vgic_cpu *vgic_cpu = &v->arch.vgic;
>> +    struct vgic_cpu *vgic_cpu = v->arch.vgic;
>>   
>>       INIT_LIST_HEAD(&vgic_cpu->ap_list_head);
>>   
>> +    xfree(vgic_cpu);
>> +
>>       return 0;
>>   }
> Not in your part of the change, but this is bogus.  It's not remotely
> safe to init the list head like that.
>
> The list is either already empty, in which case it's a no-op, or it
> corrupts the list.  It appears that the list mixes entries from other
> vCPUs, and from the domain.

I guess it should be handled by vgic_prune_ap_list() which is called
when we are entering hypervisor (enter_hypervisor_from_guest() ->
vgic_sync_from_lrs() -> vgic_prune_ap_list()).

Also, I would like not that this code is based on KVM which also has
the same INIT_LIST_HEAD():
   https://elixir.bootlin.com/linux/v6.18.1/source/arch/arm64/kvm/vgic/vgic-init.c#L467

I won't touch this code in the next patch series except if one of
Arm's maintainer will tell me so.

>
> I think this is further proof that NEW_VGIC should be deleted
> wholesale.  It's clearly not in a good state, and I get the impression
> that a badly timed evtchn sent to a domain in the middle of being
> cleaned up will cause Xen to trip over the corrupted list.
>
>>   
>> diff --git a/xen/arch/arm/vgic/vgic-v2.c b/xen/arch/arm/vgic/vgic-v2.c
>> index 6a558089c5..e64d681dd2 100644
>> --- a/xen/arch/arm/vgic/vgic-v2.c
>> +++ b/xen/arch/arm/vgic/vgic-v2.c
>> @@ -56,8 +56,8 @@ void vgic_v2_setup_hw(paddr_t dbase, paddr_t cbase, paddr_t csize,
>>    */
>>   void vgic_v2_fold_lr_state(struct vcpu *vcpu)
>>   {
>> -    struct vgic_cpu *vgic_cpu = &vcpu->arch.vgic;
>> -    unsigned int used_lrs = vcpu->arch.vgic.used_lrs;
>> +    struct vgic_cpu *vgic_cpu = vcpu->arch.vgic;
>> +    unsigned int used_lrs = vcpu->arch.vgic->used_lrs;
> vgic_cpu->used_lrs.
>
> Taking a step back, I think the patch could be much smaller if you only
> made private_irqs in NEW_VGIC be a separate pointer, matching the "old"
> VGIC code.  Or does that not save enough space in struct vCPU?

It seems like it would be also fine, the size of struct vcpu will be 2176.
And it also basically just require only:
   struct vgic_cpu {
   -    struct vgic_irq private_irqs[VGIC_NR_PRIVATE_IRQS];
   +    struct vgic_irq *private_irqs;
(of course with allocation and freeing of private_irqs).

Lets stick to this approach then.

Thanks.

~ Oleksii


