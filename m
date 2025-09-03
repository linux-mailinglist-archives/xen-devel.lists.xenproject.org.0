Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7DFB41D64
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 13:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108169.1458269 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utlzD-0005x5-TV; Wed, 03 Sep 2025 11:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108169.1458269; Wed, 03 Sep 2025 11:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utlzD-0005uY-Qp; Wed, 03 Sep 2025 11:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1108169;
 Wed, 03 Sep 2025 11:49:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+jY=3O=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1utlzC-0005uQ-M9
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 11:49:10 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fff22493-88bb-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 13:49:08 +0200 (CEST)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-336dd55aae1so28612061fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 03 Sep 2025 04:49:08 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50b0e98sm9605041fa.60.2025.09.03.04.49.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 04:49:05 -0700 (PDT)
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
X-Inumbo-ID: fff22493-88bb-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756900148; x=1757504948; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2HZ9ED8IhQeYW/SYNGTLZ7QR0Fs4zqE1wPhtH5mcgG4=;
        b=R9wkoXa/Z0HEUC9B2BO4q4rZWs6hhHV1b3wV4rjcVl19h93VtloU5YZVO3fhC7hnkL
         DSK46BcmZCRh8M9H8wg1ZTKbpGK5mV2HrARp0qha+SiN3sH6fjrIgFB0zNcpZDjE5pMk
         M0EzohyYbbdJ6YeB3uiPnecGa1uSnXPbOMgAx7ejoGLIV4wV09nRNgq2GViYDMYC4ziP
         a4Mvz40fXm9Pa1Ss34a1U9hQHMLABCVD4aAEUfwEg1v8X/PV3n/+MeDK7Pl3SDeQtI5H
         zcSWJloyb6zH8u225tSnRTVtkgd/vvYJRtWd+smEzYdUxN/EQ/HFzQBpUMJTEnBt+SnV
         LyIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756900148; x=1757504948;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2HZ9ED8IhQeYW/SYNGTLZ7QR0Fs4zqE1wPhtH5mcgG4=;
        b=uwSabvKvPFpJ32uPM3wzq8N40COb0LR6ilfg+e742tTBVSh1R8lJV/clvtg56pC3M8
         FZkUxaN3LPJZfJU1h3q97YHAPmSvtb+zTlW6z2PG6d87hEIUrpnO4t2yHlsMILe9lekG
         ufFOctMgmiFownjztLkCoqEmwuMf/5JMzn97ypD/+fqcz+Syvrgs0RidfQdE08VsF1T1
         riaV5izCau9czGK3QBv/IxrnPUkFMDqPR951wl1xBcESANTFvWaixlCxOS81SxVVEngY
         cZFTaWnpJpuNHj8BXb37xBDaCOg1LMwKs+sFnbbEyrDKrn3gY/ajWM8Cxunmj6V92mkc
         cf5g==
X-Gm-Message-State: AOJu0Yx6fTPaTUoib4IWrKDdEeshUbIYXiLeaX4dvmx7Cvv69kWdRW7P
	ApJdazHpm59yJUpGtQ8grObmyHtJmri+u5EDI9lw0HRExI+LuZZ1Q5Jl
X-Gm-Gg: ASbGncuUnrwLg1Y2UO6sJvSdMFQxPKOf5nLV2OXZfJabKIAW8JJfqb9Z5JR2kaAwAw7
	xTuLXrJd8Ir3PIFOAA/rV99cWEKMalD1ewfMyWyOCgQ1c9r/rIMkqfL1CWSpUdQ8FdZ92x6WL2K
	2qwKPDQysD9YqD6Z61ZX0pbVIhDWTIGtESNcK6oUJ5ryQMOzx/vNJ6/kEA5C/T89wpamCpMkDcB
	k6OxC7xy77ypWe28fJLasDLL6uHwy3k7k+8zHk3G2cI6XTkUFNIoKC7oIoQD6d33xoxpqqHjsZk
	s0Lds6RKiGwYPSSFddvY+PZHJIaG1ebVIJO9Us2BQUo2BCYvEIwnUj66qHvIT1AXFBeKtjuVdbi
	o7RuTH83/aidDe7NpbWnKdf8P0P8XjJp98Y8a
X-Google-Smtp-Source: AGHT+IFGOUgPmwEt33MoFXflt1qtQHoB0ZJLNlE8xS7JJPS0h6fhPHCv2MzL+XbIpOTl0SAiM6VQBA==
X-Received: by 2002:a05:651c:514:b0:336:ac3a:73b6 with SMTP id 38308e7fff4ca-336cad33d7bmr43532741fa.28.1756900145809;
        Wed, 03 Sep 2025 04:49:05 -0700 (PDT)
Message-ID: <98444477-bf97-440e-a5a4-844d51e92a54@gmail.com>
Date: Wed, 3 Sep 2025 14:49:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/13] iommu/ipmmu-vmsa: Implement suspend/resume
 callbacks
To: Mykola Kvach <xakep.amatop@gmail.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Mykola Kvach <Mykola_Kvach@epam.com>
References: <cover.1756763487.git.mykola_kvach@epam.com>
 <3a05d0f188943173703690981a7590fd12fabd4c.1756763487.git.mykola_kvach@epam.com>
 <41cddeee-6cc2-4426-9020-2f1000983845@epam.com>
 <CAGeoDV_qgq6HWma_QDoxGdk+3=J1QYfUE6tCRAr7361mNqjpGQ@mail.gmail.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <CAGeoDV_qgq6HWma_QDoxGdk+3=J1QYfUE6tCRAr7361mNqjpGQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 03.09.25 13:25, Mykola Kvach wrote:
> Hi Oleksandr,

Hello Mykola

> 
> On Wed, Sep 3, 2025 at 1:01 PM Oleksandr Tyshchenko
> <Oleksandr_Tyshchenko@epam.com> wrote:
>>
>>
>>
>> On 02.09.25 01:10, Mykola Kvach wrote:
>>
>> Hello Mykola
>>
>>
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Store and restore active context and micro-TLB registers.
>>>
>>> Tested on R-Car H3 Starter Kit.
>>>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
>>> ---
>>> Changes in V6:
>>> - refactor code related to hw_register struct, from now it's called
>>>     ipmmu_reg_ctx
>>
>> The updated version looks good, thanks. However, I have one
>> concern/request ...
>>
>>> ---
>>>    xen/drivers/passthrough/arm/ipmmu-vmsa.c | 257 +++++++++++++++++++++++
>>>    1 file changed, 257 insertions(+)
>>>
>>> diff --git a/xen/drivers/passthrough/arm/ipmmu-vmsa.c b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>>> index ea9fa9ddf3..0973559861 100644
>>> --- a/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>>> +++ b/xen/drivers/passthrough/arm/ipmmu-vmsa.c
>>> @@ -71,6 +71,8 @@
>>>    })
>>>    #endif
>>>
>>> +#define dev_dbg(dev, fmt, ...)    \
>>> +    dev_print(dev, XENLOG_DEBUG, fmt, ## __VA_ARGS__)
>>>    #define dev_info(dev, fmt, ...)    \
>>>        dev_print(dev, XENLOG_INFO, fmt, ## __VA_ARGS__)
>>>    #define dev_warn(dev, fmt, ...)    \
>>> @@ -130,6 +132,24 @@ struct ipmmu_features {
>>>        unsigned int imuctr_ttsel_mask;
>>>    };
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +
>>> +struct ipmmu_reg_ctx {
>>> +    unsigned int imttlbr0;
>>> +    unsigned int imttubr0;
>>> +    unsigned int imttbcr;
>>> +    unsigned int imctr;
>>> +};
>>> +
>>> +struct ipmmu_vmsa_backup {
>>> +    struct device *dev;
>>> +    unsigned int *utlbs_val;
>>> +    unsigned int *asids_val;
>>> +    struct list_head list;
>>> +};
>>> +
>>> +#endif
>>> +
>>>    /* Root/Cache IPMMU device's information */
>>>    struct ipmmu_vmsa_device {
>>>        struct device *dev;
>>> @@ -142,6 +162,9 @@ struct ipmmu_vmsa_device {
>>>        struct ipmmu_vmsa_domain *domains[IPMMU_CTX_MAX];
>>>        unsigned int utlb_refcount[IPMMU_UTLB_MAX];
>>>        const struct ipmmu_features *features;
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    struct ipmmu_reg_ctx *reg_backup[IPMMU_CTX_MAX];
>>> +#endif
>>>    };
>>>
>>>    /*
>>> @@ -547,6 +570,222 @@ static void ipmmu_domain_free_context(struct ipmmu_vmsa_device *mmu,
>>>        spin_unlock_irqrestore(&mmu->lock, flags);
>>>    }
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +
>>> +static DEFINE_SPINLOCK(ipmmu_devices_backup_lock);
>>> +static LIST_HEAD(ipmmu_devices_backup);
>>> +
>>> +static struct ipmmu_reg_ctx root_pgtable[IPMMU_CTX_MAX];
>>> +
>>> +static uint32_t ipmmu_imuasid_read(struct ipmmu_vmsa_device *mmu,
>>> +                                   unsigned int utlb)
>>> +{
>>> +    return ipmmu_read(mmu, ipmmu_utlb_reg(mmu, IMUASID(utlb)));
>>> +}
>>> +
>>> +static void ipmmu_utlbs_backup(struct ipmmu_vmsa_device *mmu)
>>> +{
>>> +    struct ipmmu_vmsa_backup *backup_data;
>>> +
>>> +    dev_dbg(mmu->dev, "Handle micro-TLBs backup\n");
>>> +
>>> +    spin_lock(&ipmmu_devices_backup_lock);
>>> +
>>> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
>>> +    {
>>> +        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
>>> +        unsigned int i;
>>> +
>>> +        if ( to_ipmmu(backup_data->dev) != mmu )
>>> +            continue;
>>> +
>>> +        for ( i = 0; i < fwspec->num_ids; i++ )
>>> +        {
>>> +            unsigned int utlb = fwspec->ids[i];
>>> +
>>> +            backup_data->asids_val[i] = ipmmu_imuasid_read(mmu, utlb);
>>> +            backup_data->utlbs_val[i] = ipmmu_imuctr_read(mmu, utlb);
>>> +        }
>>> +    }
>>> +
>>> +    spin_unlock(&ipmmu_devices_backup_lock);
>>> +}
>>> +
>>> +static void ipmmu_utlbs_restore(struct ipmmu_vmsa_device *mmu)
>>> +{
>>> +    struct ipmmu_vmsa_backup *backup_data;
>>> +
>>> +    dev_dbg(mmu->dev, "Handle micro-TLBs restore\n");
>>> +
>>> +    spin_lock(&ipmmu_devices_backup_lock);
>>> +
>>> +    list_for_each_entry( backup_data, &ipmmu_devices_backup, list )
>>> +    {
>>> +        struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(backup_data->dev);
>>> +        unsigned int i;
>>> +
>>> +        if ( to_ipmmu(backup_data->dev) != mmu )
>>> +            continue;
>>> +
>>> +        for ( i = 0; i < fwspec->num_ids; i++ )
>>> +        {
>>> +            unsigned int utlb = fwspec->ids[i];
>>> +
>>> +            ipmmu_imuasid_write(mmu, utlb, backup_data->asids_val[i]);
>>> +            ipmmu_imuctr_write(mmu, utlb, backup_data->utlbs_val[i]);
>>> +        }
>>> +    }
>>> +
>>> +    spin_unlock(&ipmmu_devices_backup_lock);
>>> +}
>>> +
>>> +static void ipmmu_domain_backup_context(struct ipmmu_vmsa_domain *domain)
>>> +{
>>> +    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
>>> +    struct ipmmu_reg_ctx *regs = mmu->reg_backup[domain->context_id];
>>> +
>>> +    dev_dbg(mmu->dev, "Handle domain context %u backup\n", domain->context_id);
>>> +
>>> +    regs->imttlbr0 = ipmmu_ctx_read_root(domain, IMTTLBR0);
>>> +    regs->imttubr0 = ipmmu_ctx_read_root(domain, IMTTUBR0);
>>> +    regs->imttbcr  = ipmmu_ctx_read_root(domain, IMTTBCR);
>>> +    regs->imctr    = ipmmu_ctx_read_root(domain, IMCTR);
>>> +}
>>> +
>>> +static void ipmmu_domain_restore_context(struct ipmmu_vmsa_domain *domain)
>>> +{
>>> +    struct ipmmu_vmsa_device *mmu = domain->mmu->root;
>>> +    struct ipmmu_reg_ctx *regs  = mmu->reg_backup[domain->context_id];
>>> +
>>> +    dev_dbg(mmu->dev, "Handle domain context %u restore\n", domain->context_id);
>>> +
>>> +    ipmmu_ctx_write_root(domain, IMTTLBR0, regs->imttlbr0);
>>> +    ipmmu_ctx_write_root(domain, IMTTUBR0, regs->imttubr0);
>>> +    ipmmu_ctx_write_root(domain, IMTTBCR,  regs->imttbcr);
>>> +    ipmmu_ctx_write_all(domain,  IMCTR,    regs->imctr | IMCTR_FLUSH);
>>> +}
>>> +
>>> +/*
>>> + * Xen: Unlike Linux implementation, Xen uses a single driver instance
>>> + * for handling all IPMMUs. There is no framework for ipmmu_suspend/resume
>>> + * callbacks to be invoked for each IPMMU device. So, we need to iterate
>>> + * through all registered IPMMUs performing required actions.
>>> + *
>>> + * Also take care of restoring special settings, such as translation
>>> + * table format, etc.
>>> + */
>>> +static int __must_check ipmmu_suspend(void)
>>> +{
>>> +    struct ipmmu_vmsa_device *mmu;
>>> +
>>> +    if ( !iommu_enabled )
>>> +        return 0;
>>> +
>>> +    printk(XENLOG_DEBUG "ipmmu: Suspending ...\n");
>>> +
>>> +    spin_lock(&ipmmu_devices_lock);
>>> +
>>> +    list_for_each_entry( mmu, &ipmmu_devices, list )
>>> +    {
>>> +        if ( ipmmu_is_root(mmu) )
>>> +        {
>>> +            unsigned int i;
>>> +
>>> +            for ( i = 0; i < mmu->num_ctx; i++ )
>>> +            {
>>> +                if ( !mmu->domains[i] )
>>> +                    continue;
>>> +                ipmmu_domain_backup_context(mmu->domains[i]);
>>> +            }
>>> +        }
>>> +        else
>>> +            ipmmu_utlbs_backup(mmu);
>>> +    }
>>> +
>>> +    spin_unlock(&ipmmu_devices_lock);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static void ipmmu_resume(void)
>>> +{
>>> +    struct ipmmu_vmsa_device *mmu;
>>> +
>>> +    if ( !iommu_enabled )
>>> +        return;
>>> +
>>> +    printk(XENLOG_DEBUG "ipmmu: Resuming ...\n");
>>> +
>>> +    spin_lock(&ipmmu_devices_lock);
>>> +
>>> +    list_for_each_entry( mmu, &ipmmu_devices, list )
>>> +    {
>>> +        uint32_t reg;
>>> +
>>> +        /* Do not use security group function */
>>> +        reg = IMSCTLR + mmu->features->control_offset_base;
>>> +        ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) & ~IMSCTLR_USE_SECGRP);
>>> +
>>> +        if ( ipmmu_is_root(mmu) )
>>> +        {
>>> +            unsigned int i;
>>> +
>>> +            /* Use stage 2 translation table format */
>>> +            reg = IMSAUXCTLR + mmu->features->control_offset_base;
>>> +            ipmmu_write(mmu, reg, ipmmu_read(mmu, reg) | IMSAUXCTLR_S2PTE);
>>> +
>>> +            for ( i = 0; i < mmu->num_ctx; i++ )
>>> +            {
>>> +                if ( !mmu->domains[i] )
>>> +                    continue;
>>> +                ipmmu_domain_restore_context(mmu->domains[i]);
>>> +            }
>>> +        }
>>> +        else
>>> +            ipmmu_utlbs_restore(mmu);
>>> +    }
>>> +
>>> +    spin_unlock(&ipmmu_devices_lock);
>>> +}
>>> +
>>> +static int ipmmu_alloc_ctx_suspend(struct device *dev)
>>> +{
>>> +    struct ipmmu_vmsa_backup *backup_data;
>>> +    unsigned int *utlbs_val, *asids_val;
>>> +    struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>>> +
>>> +    utlbs_val = xzalloc_array(unsigned int, fwspec->num_ids);
>>> +    if ( !utlbs_val )
>>> +        return -ENOMEM;
>>> +
>>> +    asids_val = xzalloc_array(unsigned int, fwspec->num_ids);
>>> +    if ( !asids_val )
>>> +    {
>>> +        xfree(utlbs_val);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    backup_data = xzalloc(struct ipmmu_vmsa_backup);
>>> +    if ( !backup_data )
>>> +    {
>>> +        xfree(utlbs_val);
>>> +        xfree(asids_val);
>>> +        return -ENOMEM;
>>> +    }
>>> +
>>> +    backup_data->dev = dev;
>>> +    backup_data->utlbs_val = utlbs_val;
>>> +    backup_data->asids_val = asids_val;
>>> +
>>> +    spin_lock(&ipmmu_devices_backup_lock);
>>> +    list_add(&backup_data->list, &ipmmu_devices_backup);
>>> +    spin_unlock(&ipmmu_devices_backup_lock);
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +#endif /* CONFIG_SYSTEM_SUSPEND */
>>> +
>>>    static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>>>    {
>>>        uint64_t ttbr;
>>> @@ -559,6 +798,9 @@ static int ipmmu_domain_init_context(struct ipmmu_vmsa_domain *domain)
>>>            return ret;
>>>
>>>        domain->context_id = ret;
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    domain->mmu->root->reg_backup[ret] = &root_pgtable[ret];
>>> +#endif
>>>
>>>        /*
>>>         * TTBR0
>>> @@ -615,6 +857,9 @@ static void ipmmu_domain_destroy_context(struct ipmmu_vmsa_domain *domain)
>>>        ipmmu_ctx_write_root(domain, IMCTR, IMCTR_FLUSH);
>>>        ipmmu_tlb_sync(domain);
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    domain->mmu->root->reg_backup[domain->context_id] = NULL;
>>> +#endif
>>>        ipmmu_domain_free_context(domain->mmu->root, domain->context_id);
>>>    }
>>>
>>> @@ -1427,6 +1672,14 @@ static int ipmmu_add_device(u8 devfn, struct device *dev)
>>>        }
>>>    #endif
>>>
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    if ( ipmmu_alloc_ctx_suspend(dev) )
>>> +    {
>>> +        dev_err(dev, "Failed to allocate context for suspend\n");
>>> +        return -ENOMEM;
>>> +    }
>>> +#endif
>>
>> ... The initial version was based on the driver code without PCI
>> support, but it is now present. There is PCI-specific code above in this
>> function (not visible in the context) that performs some initialization,
>> allocation and device assignment. What I mean is that in case of the
>> suspend context allocation error here, we will need to undo these
>> actions (i.e. deassign device). I would move this context allocation
>> (whose probability to fail is much lower than what is done for PCI dev)
>> above the PCI-specific stuff, and perform the context freeing on the
>> error path.
> 
> Maybe it would be better just to add some checks to the suspend handler.
> We could skip suspend in case the context is not available, and avoid
> deallocating previously allocated stuff. This is similar to what is
> done for GICs.
> 
> What do you think? Or do you prefer to destroy everything related to the
> IOMMU here on error?

I would prefer if we fail early here in ipmmu_add_device (and rollback 
changes) rather than continue and fail later, other people might think 
differently. I think, if we cannot simply allocate a memory for the 
sctructures that situation is bad.



> 
>>
>>> +
>>>        dev_info(dev, "Added master device (IPMMU %s micro-TLBs %u)\n",
>>>                 dev_name(fwspec->iommu_dev), fwspec->num_ids);
>>>
>>> @@ -1492,6 +1745,10 @@ static const struct iommu_ops ipmmu_iommu_ops =
>>>        .unmap_page      = arm_iommu_unmap_page,
>>>        .dt_xlate        = ipmmu_dt_xlate,
>>>        .add_device      = ipmmu_add_device,
>>> +#ifdef CONFIG_SYSTEM_SUSPEND
>>> +    .suspend         = ipmmu_suspend,
>>> +    .resume          = ipmmu_resume,
>>> +#endif
>>>    };
>>>
>>>    static __init int ipmmu_init(struct dt_device_node *node, const void *data)
> 
> Best regards,
> Mykola
> 


