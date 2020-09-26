Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FD4279A18
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 16:22:20 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMB52-0003AM-Nn; Sat, 26 Sep 2020 14:21:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I7Fr=DD=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kMB50-0003AE-Vy
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 14:21:39 +0000
X-Inumbo-ID: c85641a1-36f3-4f20-ac49-e614be358fe6
Received: from mail-lj1-x243.google.com (unknown [2a00:1450:4864:20::243])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c85641a1-36f3-4f20-ac49-e614be358fe6;
 Sat, 26 Sep 2020 14:21:37 +0000 (UTC)
Received: by mail-lj1-x243.google.com with SMTP id y4so4764541ljk.8
 for <xen-devel@lists.xenproject.org>; Sat, 26 Sep 2020 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=Mah9Ww0DwPi8U5g9PeGSbINU+DpGhJyH/5ZQKq/M1GM=;
 b=sNov64wxNzXcdAOl6PqByAFcnq877se+yEG9JFAMmcdPxXlzfQ/NiTSrrVVg6oAQr/
 GkODvIXWH4LkUcCHmeyQIMSyWEGNk1HGkRS/twfSF3TTs4hNXfTFVkED9P5HbhdpJOoX
 5KtCGY0cEVqU8JadnrAet2yojKzdH6UsAYZAa1iILCSQWl2gpGkjMkyDP/0IFCP3xc/z
 hU/IRBG3+KaENHVNdxdDJ5xqhnDS3PWKgU4n5Is7GYq7qdhrTRJW17qaP07WfylHmp+i
 vsdD6tmb+mph8ZvABo0uxa3tUHf3yzb6bJtqmbahf8H0GoPtztFe84FD/a+PpDgRodIl
 R16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Mah9Ww0DwPi8U5g9PeGSbINU+DpGhJyH/5ZQKq/M1GM=;
 b=mSknR1vxVnXT9ggeAvx6WJD3bTGsjnbV4HskutKzLFHNlHyhfW0Tg3Uc2R2IJcv0x2
 3YZ9fAli+nRQywod5nWYefsS4JDF1swmwszeLvEnQf0h7SaiEVxoiJjYcfa4HtlvfQw7
 YpB3RJcCGZJ0bDzp8gReFEYIjJgs4dZ4PR9GAADeX7JW6xvwsEuk9o4W69BjfNJfMbqF
 btskYD3GiSi1bdXXEFJsXMro1jk7mxq3lgTQrblcmiL9OdKwcVvMfGWbRhY6WL46SaQf
 hAD78hpiYqx3Og73zoaytB1/dBtDni9cUdRKhFIF0rOWxekLnQCFt8nTcSvb/DC1NcAM
 O9SA==
X-Gm-Message-State: AOAM5303P168r42jXkhkrkXiZb4owKseKnp7JCFTVK1PW2OT0q0+Bk1H
 ekM6bRUa0PKRAEfgi4AOjwk=
X-Google-Smtp-Source: ABdhPJyCBj+3PB3hwJnq08CvIDvXdRttEuFlvtBQsQECYaVGZf+t+CjS4Niil7+VffP0DMIua+MqGQ==
X-Received: by 2002:a2e:98c8:: with SMTP id s8mr2766578ljj.268.1601130096199; 
 Sat, 26 Sep 2020 07:21:36 -0700 (PDT)
Received: from [192.168.1.6] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id n18sm1743699lfe.7.2020.09.26.07.21.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 26 Sep 2020 07:21:35 -0700 (PDT)
Subject: Re: [PATCH V1 12/16] xen/dm: Introduce xendevicemodel_set_irq_level
 DM op
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>, "paul@xen.org" <paul@xen.org>,
 Andre Przywara <andre.przywara@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-13-git-send-email-olekstysh@gmail.com>
 <68259658-e6c7-8a80-dbd6-a01b8f0d9a83@xen.org>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <5e80bb01-16ab-9801-d065-e197fbca790a@gmail.com>
Date: Sat, 26 Sep 2020 17:21:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <68259658-e6c7-8a80-dbd6-a01b8f0d9a83@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 26.09.20 16:50, Julien Grall wrote:
> (+ Paul and Andre)
>
> Hi,

Hi Julien



>
> Adding Paul as the author of DMOP and Andre as this is GIC related.
>
> On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>
> Looking at the PoC I shared with you, this code was originally written 
> by me.

I am sorry, will fix.


>
>
>>
>> This patch adds ability to the device emulator to notify otherend
>> (some entity running in the guest) using a SPI and implements Arm
>> specific bits for it. Proposed interface allows emulator to set
>> the logical level of a one of a domain's IRQ lines.
>
> It would be good to explain in the commit message why we can't use the 
> existing DMOP to inject an interrupt.

Agree, will explain why the existing DMOP to inject an interrupt is not 
suitable for us.


>
>
>> Signed-off-by: Julien Grall <julien.grall@arm.com>
>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>
>> ---
>> Please note, this is a split/cleanup/hardening of Julien's PoC:
>> "Add support for Guest IO forwarding to a device emulator"
>>
>> Please note, I left interface untouched since there is still
>> an open discussion what interface to use/what information to pass
>> to the hypervisor. The question whether we should abstract away
>> the state of the line or not.
>>
>> Changes RFC -> V1:
>>     - check incoming parameters in arch_dm_op()
>>     - add explicit padding to struct xen_dm_op_set_irq_level
>> ---
>> ---
>>   tools/libs/devicemodel/core.c                   | 18 +++++++++++++
>>   tools/libs/devicemodel/include/xendevicemodel.h |  4 +++
>>   tools/libs/devicemodel/libxendevicemodel.map    |  1 +
>>   xen/arch/arm/dm.c                               | 36 
>> ++++++++++++++++++++++++-
>>   xen/common/dm.c                                 |  1 +
>>   xen/include/public/hvm/dm_op.h                  | 15 +++++++++++
>>   6 files changed, 74 insertions(+), 1 deletion(-)
>>
>> diff --git a/tools/libs/devicemodel/core.c 
>> b/tools/libs/devicemodel/core.c
>> index 4d40639..30bd79f 100644
>> --- a/tools/libs/devicemodel/core.c
>> +++ b/tools/libs/devicemodel/core.c
>> @@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
>>       return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>>   }
>>   +int xendevicemodel_set_irq_level(
>> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t irq,
>> +    unsigned int level)
>> +{
>> +    struct xen_dm_op op;
>> +    struct xen_dm_op_set_irq_level *data;
>> +
>> +    memset(&op, 0, sizeof(op));
>> +
>> +    op.op = XEN_DMOP_set_irq_level;
>> +    data = &op.u.set_irq_level;
>> +
>> +    data->irq = irq;
>> +    data->level = level;
>> +
>> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>> +}
>> +
>>   int xendevicemodel_set_pci_link_route(
>>       xendevicemodel_handle *dmod, domid_t domid, uint8_t link, 
>> uint8_t irq)
>>   {
>> diff --git a/tools/libs/devicemodel/include/xendevicemodel.h 
>> b/tools/libs/devicemodel/include/xendevicemodel.h
>> index e877f5c..c06b3c8 100644
>> --- a/tools/libs/devicemodel/include/xendevicemodel.h
>> +++ b/tools/libs/devicemodel/include/xendevicemodel.h
>> @@ -209,6 +209,10 @@ int xendevicemodel_set_isa_irq_level(
>>       xendevicemodel_handle *dmod, domid_t domid, uint8_t irq,
>>       unsigned int level);
>>   +int xendevicemodel_set_irq_level(
>> +    xendevicemodel_handle *dmod, domid_t domid, unsigned int irq,
>> +    unsigned int level);
>> +
>>   /**
>>    * This function maps a PCI INTx line to a an IRQ line.
>>    *
>> diff --git a/tools/libs/devicemodel/libxendevicemodel.map 
>> b/tools/libs/devicemodel/libxendevicemodel.map
>> index 561c62d..a0c3012 100644
>> --- a/tools/libs/devicemodel/libxendevicemodel.map
>> +++ b/tools/libs/devicemodel/libxendevicemodel.map
>> @@ -32,6 +32,7 @@ VERS_1.2 {
>>       global:
>>           xendevicemodel_relocate_memory;
>>           xendevicemodel_pin_memory_cacheattr;
>> +        xendevicemodel_set_irq_level;
>>   } VERS_1.1;
>>     VERS_1.3 {
>> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
>> index eb20344..428ef98 100644
>> --- a/xen/arch/arm/dm.c
>> +++ b/xen/arch/arm/dm.c
>> @@ -15,11 +15,45 @@
>>    */
>>     #include <xen/hypercall.h>
>
> NIT: newline between <xen/*> and <asm/*> includes.

ok


>
>> +#include <asm/vgic.h>
>>     int arch_dm_op(struct xen_dm_op *op, struct domain *d,
>>                  const struct dmop_args *op_args, bool *const_op)
>>   {
>> -    return -EOPNOTSUPP;
>> +    int rc;
>> +
>> +    switch ( op->op )
>> +    {
>> +    case XEN_DMOP_set_irq_level:
>> +    {
>> +        const struct xen_dm_op_set_irq_level *data =
>> +            &op->u.set_irq_level;
>> +
>> +        /* Only SPIs are supported */
>> +        if ( (data->irq < NR_LOCAL_IRQS) || (data->irq >= 
>> vgic_num_irqs(d)) )
>> +        {
>> +            rc = -EINVAL;
>> +            break;
>> +        }
>> +
>> +        if ( data->level != 0 && data->level != 1 )
>> +        {
>> +            rc = -EINVAL;
>> +            break;
>> +        }
>> +
>
> I think we want to check the padding is always 0.

ok


>
>> +
>> +        vgic_inject_irq(d, NULL, data->irq, data->level);
>
> So, this interface will allow the device emulator to raise/lower the 
> line for an HW mapped interrupt. I think this will mess up with the 
> internal state machine.
>
> It would probably be better if a device emulator can only raise/lower 
> the line for non-allocated interrupts (see 
> d->arch.vgic.allocated_irqs). Any thoughts?

I think, it really makes sense. Will add a corresponding check.


>
>
>> +        rc = 0;
>> +        break;
>> +    }
>> +
>> +    default:
>> +        rc = -EOPNOTSUPP;
>> +        break;
>> +    }
>> +
>> +    return rc;
>>   }
>>     /*
>> diff --git a/xen/common/dm.c b/xen/common/dm.c
>> index 060731d..c55e042 100644
>> --- a/xen/common/dm.c
>> +++ b/xen/common/dm.c
>> @@ -47,6 +47,7 @@ static int dm_op(const struct dmop_args *op_args)
>>           [XEN_DMOP_remote_shutdown]                  = sizeof(struct 
>> xen_dm_op_remote_shutdown),
>>           [XEN_DMOP_relocate_memory]                  = sizeof(struct 
>> xen_dm_op_relocate_memory),
>>           [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct 
>> xen_dm_op_pin_memory_cacheattr),
>> +        [XEN_DMOP_set_irq_level]                    = sizeof(struct 
>> xen_dm_op_set_irq_level),
>>       };
>>         rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
>> diff --git a/xen/include/public/hvm/dm_op.h 
>> b/xen/include/public/hvm/dm_op.h
>> index fd00e9d..39567bf 100644
>> --- a/xen/include/public/hvm/dm_op.h
>> +++ b/xen/include/public/hvm/dm_op.h
>> @@ -417,6 +417,20 @@ struct xen_dm_op_pin_memory_cacheattr {
>>       uint32_t pad;
>>   };
>>   +/*
>> + * XEN_DMOP_set_irq_level: Set the logical level of a one of a domain's
>> + *                         IRQ lines.
>> + * XXX Handle PPIs.
>
> This is a public interface, so it seems a bit strange to leave a TODO 
> in this code.
>
> I wouldn't be surprised if someone will want PPI support soon, but we 
> may be able to defer it if we can easily extend the hypercall.
>
> @Paul, how did you envision to extend DMOP?
>
> Also, is there any plan to add x86 support? If not, then I think we 
> want to document in the interface that this is Arm only.

I don't have a plan to add x86 support. Will clarify that it is for ARM 
only.


>
>> + */
>> +#define XEN_DMOP_set_irq_level 19
>> +
>> +struct xen_dm_op_set_irq_level {
>> +    uint32_t irq;
>> +    /* IN - Level: 0 -> deasserted, 1 -> asserted */
>> +    uint8_t level;
>> +    uint8_t pad[3];
>> +};
>> +
>>   struct xen_dm_op {
>>       uint32_t op;
>>       uint32_t pad;
>> @@ -430,6 +444,7 @@ struct xen_dm_op {
>>           struct xen_dm_op_track_dirty_vram track_dirty_vram;
>>           struct xen_dm_op_set_pci_intx_level set_pci_intx_level;
>>           struct xen_dm_op_set_isa_irq_level set_isa_irq_level;
>> +        struct xen_dm_op_set_irq_level set_irq_level;
>>           struct xen_dm_op_set_pci_link_route set_pci_link_route;
>>           struct xen_dm_op_modified_memory modified_memory;
>>           struct xen_dm_op_set_mem_type set_mem_type;
>>
>
> Cheers,
>
-- 
Regards,

Oleksandr Tyshchenko


