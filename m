Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E326BA895C1
	for <lists+xen-devel@lfdr.de>; Tue, 15 Apr 2025 09:56:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.952226.1347749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4b9b-0006Mh-0U; Tue, 15 Apr 2025 07:56:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 952226.1347749; Tue, 15 Apr 2025 07:56:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4b9a-0006KF-T3; Tue, 15 Apr 2025 07:56:22 +0000
Received: by outflank-mailman (input) for mailman id 952226;
 Tue, 15 Apr 2025 07:56:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0g1d=XB=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1u4b9Z-0005zx-Ia
 for xen-devel@lists.xenproject.org; Tue, 15 Apr 2025 07:56:21 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1d7c5541-19cf-11f0-9ffb-bf95429c2676;
 Tue, 15 Apr 2025 09:56:19 +0200 (CEST)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43ce71582e9so42255475e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 15 Apr 2025 00:56:19 -0700 (PDT)
Received: from [192.168.0.18]
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f235b050fsm205717085e9.40.2025.04.15.00.56.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Apr 2025 00:56:17 -0700 (PDT)
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
X-Inumbo-ID: 1d7c5541-19cf-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744703779; x=1745308579; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D3qT7lZ6wYNs5aL82TRAFgnicl/JTUH1PYLikDCBGHo=;
        b=XxIED8W7+rhyLAJzUtbeZH0drHTcsL3wYV/CaKM4e07zntRVEvXMtHBHI1OQa8vnBk
         FTLYmfaUIKwzbH9u5MHQ/hW4JVKSM34Kz6faYTnNvN83Mi0j8BcKhkXa0yuID8dciL91
         51uwBt60OuMjn0cvumEiz2dXJFCbu9PO9vC1qT9ZDOpzdcYwbwJ5pE/qptRcKHIALwB1
         8LwlWSqorOCv5bVZGBBTC3CtPFesLhJViu/Q7Q9DIa46EHY3xi82fcDYmXxXXzz34nWu
         KLLri3w1GgGTrofPRjf8Ay+6HDB316JQ9dLY+rlFVvX3kKxVlk9TbPCADfpeo9Tr7lr8
         qtXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744703779; x=1745308579;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D3qT7lZ6wYNs5aL82TRAFgnicl/JTUH1PYLikDCBGHo=;
        b=jW8vqo6SDKAxpRWBmuNu2I8jGjZIPafRsJA5ds1snc7wu4BUjHaAe5VLhS+ikor4fN
         3n+rRalxPEJGhs9Rdbep9q8e5j6GxsyNkTjsYVHf/XoOi/hRriTD2XCpeDEmLs/gKjk7
         nktFAHfYE73X1HSR+RKWDryg4nrDNaR/avynMQ2nIUO7FEeuee01zvtwQdQKuLUK2JmA
         LC4ioKfPkKQHRsqKep7A/Mw82XEBTFlcnwOn3b6pFemHMx4nw06kXm5zi8NexipS5B3G
         FhlkkYUGKpiiqXB2zBQ7KxhtJpWErbPaiwXwYoIUb8NnYRTQtxazxIb8Ie88yVyJ6QAL
         Wzyw==
X-Gm-Message-State: AOJu0Yxtau9srxd2Z8NRglxLq2JEbBY0h3f8tjGuRA1IlpOhbccPq4o6
	MIwRbOikygXKyOIno8iYJsfJrT411XIGPdSMGXwHwgR2UXIPGqBd
X-Gm-Gg: ASbGnctE/qL5PibQAaGykvmFUGPoG+xL5sfUycsNLR+NUjuTb7nN4WpI61ccu7Rv4gn
	lYDozM5Sd6SDOo2xvUQgOqNLKFHkbpWI4BMopz3OLbhfxpVdj3aBMk1s8e4cfNVYtBmQ94OMwp+
	iUP9hZr6e/HRLYJQR83gGVclwfV504innh+hvW3xAlbwBTpjykZjcpSxS3SSfdefeck+d1J6M0f
	HtMozmN7X+6KQ8U1Ot1leD0yuEf4iIJfQKObkHiOtL2IaFyJohPUFzpl2AMF2LmQhht2YZxPMWY
	g6ZLljQ3ojAwa02/SoviB9zRzXsHZF8jYMaPKxYYOTTKeDWoKYp9oabvBr8A82gxaWxqXnGeVfs
	oI6OLDZSXyauo3sW14iUUiilzZ9JT1FM=
X-Google-Smtp-Source: AGHT+IEgyAzCH1F9qaK+EcUTcKfvapWzlndZ412BNEkZGFER8PURicE6QuBF+5vBnqWkQWet/zU0kQ==
X-Received: by 2002:a5d:64a9:0:b0:39c:2264:43ea with SMTP id ffacd0b85a97d-39ea51d36a4mr12068312f8f.3.1744703778303;
        Tue, 15 Apr 2025 00:56:18 -0700 (PDT)
Message-ID: <0fd070a8-8045-4df1-a1d6-c9701e3deba1@gmail.com>
Date: Tue, 15 Apr 2025 08:56:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] drivers: Change amd_iommu struct to contain
 pci_sbdf_t, simplify code
To: dmkhn@proton.me
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1744657012.git.andriy.sultanov@vates.tech>
 <40f504017d71c16a3e2bc8945ac5e674a3e791ed.1744657012.git.andriy.sultanov@vates.tech>
 <Z/4MCopF/j5357Mf@starscream>
Content-Language: en-US
From: Andriy Sultanov <sultanovandriy@gmail.com>
In-Reply-To: <Z/4MCopF/j5357Mf@starscream>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/15/25 8:34 AM, dmkhn@proton.me wrote:
> On Mon, Apr 14, 2025 at 08:19:16PM +0100, Andrii Sultanov wrote:
>> From: Andrii Sultanov <sultanovandriy@gmail.com>
>>
>> Following on from 250d87dc3ff9 ("x86/msi: Change __msi_set_enable() to
>> take pci_sbdf_t"), make struct amd_iommu contain pci_sbdf_t directly
>> instead of specifying seg+bdf separately and regenerating sbdf_t from them,
>> which simplifies code.
>>
>> Bloat-o-meter reports:
>> add/remove: 0/0 grow/shrink: 4/13 up/down: 121/-377 (-256)
>> Function                                     old     new   delta
>> _einittext                                 22028   22092     +64
>> amd_iommu_prepare                            853     897     +44
>> __mon_lengths                               2928    2936      +8
>> _invalidate_all_devices                      133     138      +5
>> _hvm_dpci_msi_eoi                            157     155      -2
>> build_info                                   752     744      -8
>> amd_iommu_add_device                         856     844     -12
>> amd_iommu_msi_enable                          33      20     -13
>> update_intremap_entry_from_msi_msg           879     859     -20
>> amd_iommu_msi_msg_update_ire                 472     448     -24
>> send_iommu_command                           251     224     -27
>> amd_iommu_get_supported_ivhd_type             86      54     -32
>> amd_iommu_detect_one_acpi                    918     886     -32
>> iterate_ivrs_mappings                        169     129     -40
>> flush_command_buffer                         460     417     -43
>> set_iommu_interrupt_handler                  421     377     -44
>> enable_iommu                                1745    1665     -80
>>
>> Resolves: https://gitlab.com/xen-project/xen/-/issues/198
>>
>> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>
>>
>> ---
>> Changes in V4:
>> * Dropped references to the order of seg/bdf in the commit message
>> * Dropped unnecessary detail from the commit message
>> * Reverted to a macro usage in one case where it was mistakenly dropped
>> * Folded several separate seg+bdf comparisons into a single one between
>>    sbdf_t, folded separate assignments with a macro.
>> * More code size improvements with the changes, so I've refreshed the
>>    bloat-o-meter report
>>
>> Changes in V3:
>> * Dropped the union with seg+bdf/pci_sbdf_t to avoid aliasing, renamed
>>    all users appropriately
>>
>> Changes in V2:
>> * Split single commit into several patches
>> * Added the commit title of the referenced patch
>> * Dropped brackets around &(iommu->sbdf) and &(sbdf)
>> ---
>>   xen/drivers/passthrough/amd/iommu.h         |  4 +--
>>   xen/drivers/passthrough/amd/iommu_acpi.c    | 16 +++++-----
>>   xen/drivers/passthrough/amd/iommu_cmd.c     |  8 ++---
>>   xen/drivers/passthrough/amd/iommu_detect.c  | 18 +++++------
>>   xen/drivers/passthrough/amd/iommu_init.c    | 35 ++++++++++-----------
>>   xen/drivers/passthrough/amd/iommu_intr.c    | 29 ++++++++---------
>>   xen/drivers/passthrough/amd/iommu_map.c     |  4 +--
>>   xen/drivers/passthrough/amd/pci_amd_iommu.c | 22 ++++++-------
>>   8 files changed, 67 insertions(+), 69 deletions(-)
>>
>> diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
>> index 00e81b4b2a..ba541f7943 100644
>> --- a/xen/drivers/passthrough/amd/iommu.h
>> +++ b/xen/drivers/passthrough/amd/iommu.h
>> @@ -77,8 +77,8 @@ struct amd_iommu {
>>       struct list_head list;
>>       spinlock_t lock; /* protect iommu */
>>
>> -    u16 seg;
>> -    u16 bdf;
>> +    pci_sbdf_t sbdf;
>> +
>>       struct msi_desc msi;
>>
>>       u16 cap_offset;
>> diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
>> index 5bdbfb5ba8..025d9be40f 100644
>> --- a/xen/drivers/passthrough/amd/iommu_acpi.c
>> +++ b/xen/drivers/passthrough/amd/iommu_acpi.c
>> @@ -58,7 +58,7 @@ static void __init add_ivrs_mapping_entry(
>>       uint16_t bdf, uint16_t alias_id, uint8_t flags, unsigned int ext_flags,
>>       bool alloc_irt, struct amd_iommu *iommu)
>>   {
>> -    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->seg);
>> +    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->sbdf.seg);
>>
>>       ASSERT( ivrs_mappings != NULL );
>>
>> @@ -70,7 +70,7 @@ static void __init add_ivrs_mapping_entry(
>>       ivrs_mappings[bdf].device_flags = flags;
>>
>>       /* Don't map an IOMMU by itself. */
>> -    if ( iommu->bdf == bdf )
>> +    if ( iommu->sbdf.bdf == bdf )
>>           return;
>>
>>       /* Allocate interrupt remapping table if needed. */
>> @@ -96,7 +96,7 @@ static void __init add_ivrs_mapping_entry(
>>
>>               if ( !ivrs_mappings[alias_id].intremap_table )
>>                   panic("No memory for %pp's IRT\n",
>> -                      &PCI_SBDF(iommu->seg, alias_id));
>> +                      &PCI_SBDF(iommu->sbdf.seg, alias_id));
>>           }
>>       }
>>
>> @@ -112,7 +112,7 @@ static struct amd_iommu * __init find_iommu_from_bdf_cap(
>>       struct amd_iommu *iommu;
>>
>>       for_each_amd_iommu ( iommu )
>> -        if ( (iommu->seg == seg) && (iommu->bdf == bdf) &&
>> +        if ( (iommu->sbdf.seg == seg) && (iommu->sbdf.bdf == bdf) &&
> Perhaps something like
>
>             if ( (iommu->sbdf.sbdf == PCI_SBDF(seg, bdf).sbdf &&
>
> ?
>
>>                (iommu->cap_offset == cap_offset) )
>>               return iommu;
>>
>> @@ -297,13 +297,13 @@ static int __init register_range_for_iommu_devices(
>>       /* reserve unity-mapped page entries for devices */
>>       for ( bdf = rc = 0; !rc && bdf < ivrs_bdf_entries; bdf++ )
>>       {
>> -        if ( iommu != find_iommu_for_device(iommu->seg, bdf) )
>> +        if ( iommu != find_iommu_for_device(iommu->sbdf.seg, bdf) )
>>               continue;
>>
>> -        req = get_ivrs_mappings(iommu->seg)[bdf].dte_requestor_id;
>> -        rc = reserve_unity_map_for_device(iommu->seg, bdf, base, length,
>> +        req = get_ivrs_mappings(iommu->sbdf.seg)[bdf].dte_requestor_id;
>> +        rc = reserve_unity_map_for_device(iommu->sbdf.seg, bdf, base, length,
>>                                             iw, ir, false) ?:
>> -             reserve_unity_map_for_device(iommu->seg, req, base, length,
>> +             reserve_unity_map_for_device(iommu->sbdf.seg, req, base, length,
>>                                             iw, ir, false);
>>       }
>>
>> diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
>> index 83c525b84f..eefd626161 100644
>> --- a/xen/drivers/passthrough/amd/iommu_cmd.c
>> +++ b/xen/drivers/passthrough/amd/iommu_cmd.c
>> @@ -40,7 +40,7 @@ static void send_iommu_command(struct amd_iommu *iommu,
>>                        IOMMU_RING_BUFFER_PTR_MASK) )
>>       {
>>           printk_once(XENLOG_ERR "AMD IOMMU %pp: no cmd slot available\n",
>> -                    &PCI_SBDF(iommu->seg, iommu->bdf));
>> +                    &iommu->sbdf);
>>           cpu_relax();
>>       }
>>
>> @@ -85,7 +85,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
>>               threshold |= threshold << 1;
>>               printk(XENLOG_WARNING
>>                      "AMD IOMMU %pp: %scompletion wait taking too long\n",
>> -                   &PCI_SBDF(iommu->seg, iommu->bdf),
>> +                   &iommu->sbdf,
>>                      timeout_base ? "iotlb " : "");
>>               timeout = 0;
>>           }
>> @@ -95,7 +95,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
>>       if ( !timeout )
>>           printk(XENLOG_WARNING
>>                  "AMD IOMMU %pp: %scompletion wait took %lums\n",
>> -               &PCI_SBDF(iommu->seg, iommu->bdf),
>> +               &iommu->sbdf,
>>                  timeout_base ? "iotlb " : "",
>>                  (NOW() - start) / 10000000);
>>   }
>> @@ -300,7 +300,7 @@ void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
>>       if ( !iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) )
>>           return;
>>
>> -    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(pdev->bus, devfn));
>> +    req_id = get_dma_requestor_id(iommu->sbdf.seg, PCI_BDF(pdev->bus, devfn));
>>       queueid = req_id;
>>       maxpend = pdev->ats.queue_depth & 0xff;
>>
>> diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
>> index cede44e651..72cc554b08 100644
>> --- a/xen/drivers/passthrough/amd/iommu_detect.c
>> +++ b/xen/drivers/passthrough/amd/iommu_detect.c
>> @@ -162,8 +162,8 @@ int __init amd_iommu_detect_one_acpi(
>>       spin_lock_init(&iommu->lock);
>>       INIT_LIST_HEAD(&iommu->ats_devices);
>>
>> -    iommu->seg = ivhd_block->pci_segment_group;
>> -    iommu->bdf = ivhd_block->header.device_id;
>> +    iommu->sbdf = PCI_SBDF(ivhd_block->pci_segment_group,
>> +                           ivhd_block->header.device_id);
>>       iommu->cap_offset = ivhd_block->capability_offset;
>>       iommu->mmio_base_phys = ivhd_block->base_address;
>>
>> @@ -210,16 +210,16 @@ int __init amd_iommu_detect_one_acpi(
>>       /* override IOMMU HT flags */
>>       iommu->ht_flags = ivhd_block->header.flags;
>>
>> -    bus = PCI_BUS(iommu->bdf);
>> -    dev = PCI_SLOT(iommu->bdf);
>> -    func = PCI_FUNC(iommu->bdf);
>> +    bus = PCI_BUS(iommu->sbdf.bdf);
>> +    dev = PCI_SLOT(iommu->sbdf.bdf);
>> +    func = PCI_FUNC(iommu->sbdf.bdf);
>>
>> -    rt = get_iommu_capabilities(iommu->seg, bus, dev, func,
>> +    rt = get_iommu_capabilities(iommu->sbdf.seg, bus, dev, func,
> I would update signature of get_iommu_capabilities() so it takes pci_sbdf_t
> as an agument instead of disaggregated PCI address. I think it will simplify
> the code futher.
>
>>                                   iommu->cap_offset, iommu);
>>       if ( rt )
>>           goto out;
>>
>> -    rt = get_iommu_msi_capabilities(iommu->seg, bus, dev, func, iommu);
>> +    rt = get_iommu_msi_capabilities(iommu->sbdf.seg, bus, dev, func, iommu);
> ... and same idea for get_iommu_msi_capabilities()
>
> What do you think?
>
>>       if ( rt )
>>           goto out;
>>
>> @@ -228,10 +228,10 @@ int __init amd_iommu_detect_one_acpi(
>>       if ( !iommu->domid_map )
>>           goto out;
>>
>> -    rt = pci_ro_device(iommu->seg, bus, PCI_DEVFN(dev, func));
>> +    rt = pci_ro_device(iommu->sbdf.seg, bus, PCI_DEVFN(dev, func));
> There's not so many users of pci_ro_device(). I think it makes sense to update
> pci_ro_device() to something like:
>
>      int pci_ro_device(pci_sbdf_t pciaddr);
>
> But probably in a separate code change.
>
>>       if ( rt )
>>           printk(XENLOG_ERR "Could not mark config space of %pp read-only (%d)\n",
>> -               &PCI_SBDF(iommu->seg, iommu->bdf), rt);
>> +               &iommu->sbdf, rt);
>>
>>       list_add_tail(&iommu->list, &amd_iommu_head);
>>       rt = 0;
>> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
>> index bb25b55c85..58d657060a 100644
>> --- a/xen/drivers/passthrough/amd/iommu_init.c
>> +++ b/xen/drivers/passthrough/amd/iommu_init.c
>> @@ -409,9 +409,7 @@ static void iommu_reset_log(struct amd_iommu *iommu,
>>
>>   static void amd_iommu_msi_enable(struct amd_iommu *iommu, int flag)
>>   {
>> -    pci_sbdf_t sbdf = { .seg = iommu->seg, .bdf = iommu->bdf };
>> -
>> -    __msi_set_enable(sbdf, iommu->msi.msi_attrib.pos, flag);
>> +    __msi_set_enable(iommu->sbdf, iommu->msi.msi_attrib.pos, flag);
>>   }
>>
>>   static void cf_check iommu_msi_unmask(struct irq_desc *desc)
>> @@ -566,7 +564,7 @@ static void cf_check parse_event_log_entry(struct amd_iommu *iommu, u32 entry[])
>>
>>           printk(XENLOG_ERR "AMD-Vi: %s: %pp d%u addr %016"PRIx64
>>                  " flags %#x%s%s%s%s%s%s%s%s%s%s\n",
>> -               code_str, &PCI_SBDF(iommu->seg, device_id),
>> +               code_str, &PCI_SBDF(iommu->sbdf.seg, device_id),
>>                  domain_id, addr, flags,
>>                  (flags & 0xe00) ? " ??" : "",
>>                  (flags & 0x100) ? " TR" : "",
>> @@ -583,8 +581,8 @@ static void cf_check parse_event_log_entry(struct amd_iommu *iommu, u32 entry[])
>>               amd_iommu_print_entries(iommu, device_id, daddr_to_dfn(addr));
>>
>>           for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
>> -            if ( get_dma_requestor_id(iommu->seg, bdf) == device_id )
>> -                pci_check_disable_device(iommu->seg, PCI_BUS(bdf),
>> +            if ( get_dma_requestor_id(iommu->sbdf.seg, bdf) == device_id )
>> +                pci_check_disable_device(iommu->sbdf.seg, PCI_BUS(bdf),
>>                                            PCI_DEVFN(bdf));
>>       }
>>       else
>> @@ -643,7 +641,7 @@ static void cf_check parse_ppr_log_entry(struct amd_iommu *iommu, u32 entry[])
>>       struct pci_dev *pdev;
>>
>>       pcidevs_lock();
>> -    pdev = pci_get_real_pdev(PCI_SBDF(iommu->seg, device_id));
>> +    pdev = pci_get_real_pdev(PCI_SBDF(iommu->sbdf.seg, device_id));
>>       pcidevs_unlock();
>>
>>       if ( pdev )
>> @@ -752,12 +750,11 @@ static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
>>       }
>>
>>       pcidevs_lock();
>> -    iommu->msi.dev = pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf));
>> +    iommu->msi.dev = pci_get_pdev(NULL, iommu->sbdf);
>>       pcidevs_unlock();
>>       if ( !iommu->msi.dev )
>>       {
>> -        AMD_IOMMU_WARN("no pdev for %pp\n",
>> -                       &PCI_SBDF(iommu->seg, iommu->bdf));
>> +        AMD_IOMMU_WARN("no pdev for %pp\n", &iommu->sbdf);
>>           return 0;
>>       }
>>
>> @@ -779,7 +776,7 @@ static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
>>           hw_irq_controller *handler;
>>           u16 control;
>>
>> -        control = pci_conf_read16(PCI_SBDF(iommu->seg, iommu->bdf),
>> +        control = pci_conf_read16(iommu->sbdf,
>>                                     iommu->msi.msi_attrib.pos + PCI_MSI_FLAGS);
>>
>>           iommu->msi.msi.nvec = 1;
>> @@ -843,22 +840,22 @@ static void amd_iommu_erratum_746_workaround(struct amd_iommu *iommu)
>>            (boot_cpu_data.x86_model > 0x1f) )
>>           return;
>>
>> -    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
>> -    value = pci_conf_read32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4);
>> +    pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
>> +    value = pci_conf_read32(iommu->sbdf, 0xf4);
>>
>>       if ( value & (1 << 2) )
>>           return;
>>
>>       /* Select NB indirect register 0x90 and enable writing */
>> -    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90 | (1 << 8));
>> +    pci_conf_write32(iommu->sbdf, 0xf0, 0x90 | (1 << 8));
>>
>> -    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4, value | (1 << 2));
>> +    pci_conf_write32(iommu->sbdf, 0xf4, value | (1 << 2));
>>       printk(XENLOG_INFO
>>              "AMD-Vi: Applying erratum 746 workaround for IOMMU at %pp\n",
>> -           &PCI_SBDF(iommu->seg, iommu->bdf));
>> +           &iommu->sbdf);
>>
>>       /* Clear the enable writing bit */
>> -    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
>> +    pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
>>   }
>>
>>   static void enable_iommu(struct amd_iommu *iommu)
>> @@ -1095,7 +1092,7 @@ static int __init amd_iommu_init_one(struct amd_iommu *iommu, bool intr)
>>           goto error_out;
>>
>>       /* Make sure that the device table has been successfully allocated. */
>> -    ivrs_mappings = get_ivrs_mappings(iommu->seg);
>> +    ivrs_mappings = get_ivrs_mappings(iommu->sbdf.seg);
>>       if ( !IVRS_MAPPINGS_DEVTAB(ivrs_mappings) )
>>           goto error_out;
>>
>> @@ -1363,7 +1360,7 @@ static bool __init amd_sp5100_erratum28(void)
>>
>>   static int __init amd_iommu_prepare_one(struct amd_iommu *iommu)
>>   {
>> -    int rc = alloc_ivrs_mappings(iommu->seg);
>> +    int rc = alloc_ivrs_mappings(iommu->sbdf.seg);
>>
>>       if ( !rc )
>>           rc = map_iommu_mmio_region(iommu);
>> diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
>> index 9abdc38053..a7347fcbad 100644
>> --- a/xen/drivers/passthrough/amd/iommu_intr.c
>> +++ b/xen/drivers/passthrough/amd/iommu_intr.c
>> @@ -132,7 +132,7 @@ static int get_intremap_requestor_id(int seg, int bdf)
>>   static unsigned int alloc_intremap_entry(const struct amd_iommu *iommu,
>>                                            unsigned int bdf, unsigned int nr)
>>   {
>> -    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->seg);
>> +    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(iommu->sbdf.seg);
>>       unsigned long *inuse = ivrs_mappings[bdf].intremap_inuse;
>>       unsigned int nr_ents =
>>           intremap_table_entries(ivrs_mappings[bdf].intremap_table, iommu);
>> @@ -167,7 +167,7 @@ static union irte_ptr get_intremap_entry(const struct amd_iommu *iommu,
>>                                            unsigned int bdf, unsigned int index)
>>   {
>>       union irte_ptr table = {
>> -        .ptr = get_ivrs_mappings(iommu->seg)[bdf].intremap_table
>> +        .ptr = get_ivrs_mappings(iommu->sbdf.seg)[bdf].intremap_table
>>       };
>>
>>       ASSERT(table.ptr && (index < intremap_table_entries(table.ptr, iommu)));
>> @@ -184,7 +184,7 @@ static void free_intremap_entry(const struct amd_iommu *iommu,
>>                                   unsigned int bdf, unsigned int index)
>>   {
>>       union irte_ptr entry = get_intremap_entry(iommu, bdf, index);
>> -    struct ivrs_mappings *ivrs = get_ivrs_mappings(iommu->seg);
>> +    struct ivrs_mappings *ivrs = get_ivrs_mappings(iommu->sbdf.seg);
>>
>>       if ( iommu->ctrl.ga_en )
>>       {
>> @@ -281,8 +281,8 @@ static int update_intremap_entry_from_ioapic(
>>       unsigned int dest, offset;
>>       bool fresh = false;
>>
>> -    req_id = get_intremap_requestor_id(iommu->seg, bdf);
>> -    lock = get_intremap_lock(iommu->seg, req_id);
>> +    req_id = get_intremap_requestor_id(iommu->sbdf.seg, bdf);
>> +    lock = get_intremap_lock(iommu->sbdf.seg, req_id);
>>
>>       delivery_mode = rte->delivery_mode;
>>       vector = rte->vector;
>> @@ -419,10 +419,10 @@ static int update_intremap_entry_from_msi_msg(
>>       unsigned int dest, offset, i;
>>       bool fresh = false;
>>
>> -    req_id = get_dma_requestor_id(iommu->seg, bdf);
>> -    alias_id = get_intremap_requestor_id(iommu->seg, bdf);
>> +    req_id = get_dma_requestor_id(iommu->sbdf.seg, bdf);
>> +    alias_id = get_intremap_requestor_id(iommu->sbdf.seg, bdf);
>>
>> -    lock = get_intremap_lock(iommu->seg, req_id);
>> +    lock = get_intremap_lock(iommu->sbdf.seg, req_id);
>>       spin_lock_irqsave(lock, flags);
>>
>>       if ( msg == NULL )
>> @@ -486,10 +486,10 @@ static int update_intremap_entry_from_msi_msg(
>>        */
>>
>>       if ( ( req_id != alias_id ) &&
>> -         get_ivrs_mappings(iommu->seg)[alias_id].intremap_table != NULL )
>> +         get_ivrs_mappings(iommu->sbdf.seg)[alias_id].intremap_table != NULL )
>>       {
>> -        BUG_ON(get_ivrs_mappings(iommu->seg)[req_id].intremap_table !=
>> -               get_ivrs_mappings(iommu->seg)[alias_id].intremap_table);
>> +        BUG_ON(get_ivrs_mappings(iommu->sbdf.seg)[req_id].intremap_table !=
>> +               get_ivrs_mappings(iommu->sbdf.seg)[alias_id].intremap_table);
>>       }
>>
>>       return fresh;
>> @@ -498,16 +498,17 @@ static int update_intremap_entry_from_msi_msg(
>>   static struct amd_iommu *_find_iommu_for_device(int seg, int bdf)
>>   {
>>       struct amd_iommu *iommu;
>> +    pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
>>
>>       for_each_amd_iommu ( iommu )
>> -        if ( iommu->seg == seg && iommu->bdf == bdf )
>> +        if ( iommu->sbdf.sbdf == sbdf.sbdf )
>>               return NULL;
>>
>>       iommu = find_iommu_for_device(seg, bdf);
>>       if ( iommu )
>>           return iommu;
>>
>> -    AMD_IOMMU_DEBUG("No IOMMU for MSI dev = %pp\n", &PCI_SBDF(seg, bdf));
>> +    AMD_IOMMU_DEBUG("No IOMMU for MSI dev = %pp\n", &sbdf);
>>       return ERR_PTR(-EINVAL);
>>   }
>>
>> @@ -730,7 +731,7 @@ static void dump_intremap_table(const struct amd_iommu *iommu,
>>           if ( ivrs_mapping )
>>           {
>>               printk("  %pp:\n",
>> -                   &PCI_SBDF(iommu->seg, ivrs_mapping->dte_requestor_id));
>> +                   &PCI_SBDF(iommu->sbdf.seg, ivrs_mapping->dte_requestor_id));
>>               ivrs_mapping = NULL;
>>           }
>>
>> diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
>> index dde393645a..d28c475650 100644
>> --- a/xen/drivers/passthrough/amd/iommu_map.c
>> +++ b/xen/drivers/passthrough/amd/iommu_map.c
>> @@ -558,14 +558,14 @@ void amd_iommu_print_entries(const struct amd_iommu *iommu, unsigned int dev_id,
>>
>>       if ( !dt[dev_id].tv )
>>       {
>> -        printk("%pp: no root\n", &PCI_SBDF(iommu->seg, dev_id));
>> +        printk("%pp: no root\n", &PCI_SBDF(iommu->sbdf.seg, dev_id));
>>           return;
>>       }
>>
>>       pt_mfn = _mfn(dt[dev_id].pt_root);
>>       level = dt[dev_id].paging_mode;
>>       printk("%pp root @ %"PRI_mfn" (%u levels) dfn=%"PRI_dfn"\n",
>> -           &PCI_SBDF(iommu->seg, dev_id), mfn_x(pt_mfn), level, dfn_x(dfn));
>> +           &PCI_SBDF(iommu->sbdf.seg, dev_id), mfn_x(pt_mfn), level, dfn_x(dfn));
>>
>>       while ( level )
>>       {
>> diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> index d00697edb3..6b58e3380b 100644
>> --- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> +++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
>> @@ -43,7 +43,7 @@ struct amd_iommu *find_iommu_for_device(int seg, int bdf)
>>       {
>>           unsigned int bd0 = bdf & ~PCI_FUNC(~0);
>>
>> -        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->bdf != bdf )
>> +        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->sbdf.bdf != bdf )
>>           {
>>               struct ivrs_mappings tmp = ivrs_mappings[bd0];
>>
>> @@ -121,7 +121,7 @@ static bool use_ats(
>>   {
>>       return !ivrs_dev->block_ats &&
>>              iommu_has_cap(iommu, PCI_CAP_IOTLB_SHIFT) &&
>> -           pci_ats_device(iommu->seg, pdev->bus, pdev->devfn);
>> +           pci_ats_device(iommu->sbdf.seg, pdev->bus, pdev->devfn);
> Same idea about updating signature to take pci_sbdf_t.
>
>>   }
>>
>>   static int __must_check amd_iommu_setup_domain_device(
>> @@ -147,17 +147,17 @@ static int __must_check amd_iommu_setup_domain_device(
>>       if ( rc )
>>           return rc;
>>
>> -    req_id = get_dma_requestor_id(iommu->seg, pdev->sbdf.bdf);
>> -    ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
>> +    req_id = get_dma_requestor_id(iommu->sbdf.seg, pdev->sbdf.bdf);
>> +    ivrs_dev = &get_ivrs_mappings(iommu->sbdf.seg)[req_id];
>>       sr_flags = (iommu_hwdom_passthrough && is_hardware_domain(domain)
>>                   ? 0 : SET_ROOT_VALID)
>>                  | (ivrs_dev->unity_map ? SET_ROOT_WITH_UNITY_MAP : 0);
>>
>>       /* get device-table entry */
>> -    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
>> +    req_id = get_dma_requestor_id(iommu->sbdf.seg, PCI_BDF(bus, devfn));
>>       table = iommu->dev_table.buffer;
>>       dte = &table[req_id];
>> -    ivrs_dev = &get_ivrs_mappings(iommu->seg)[req_id];
>> +    ivrs_dev = &get_ivrs_mappings(iommu->sbdf.seg)[req_id];
>>
>>       if ( domain != dom_io )
>>       {
>> @@ -275,7 +275,7 @@ static int __must_check amd_iommu_setup_domain_device(
>>       ASSERT(pcidevs_locked());
>>
>>       if ( use_ats(pdev, iommu, ivrs_dev) &&
>> -         !pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
>> +         !pci_ats_enabled(iommu->sbdf.seg, bus, pdev->devfn) )
> ... and same for pci_ats_enabled()
>
>>       {
>>           if ( devfn == pdev->devfn )
>>               enable_ats_device(pdev, &iommu->ats_devices);
>> @@ -418,12 +418,12 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
>>
>>       ASSERT(pcidevs_locked());
>>
>> -    if ( pci_ats_device(iommu->seg, bus, pdev->devfn) &&
>> -         pci_ats_enabled(iommu->seg, bus, pdev->devfn) )
>> +    if ( pci_ats_device(iommu->sbdf.seg, bus, pdev->devfn) &&
>> +         pci_ats_enabled(iommu->sbdf.seg, bus, pdev->devfn) )
>>           disable_ats_device(pdev);
>>
>>       BUG_ON ( iommu->dev_table.buffer == NULL );
>> -    req_id = get_dma_requestor_id(iommu->seg, PCI_BDF(bus, devfn));
>> +    req_id = get_dma_requestor_id(iommu->sbdf.seg, PCI_BDF(bus, devfn));
>>       table = iommu->dev_table.buffer;
>>       dte = &table[req_id];
>>
>> @@ -578,7 +578,7 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
>>           return -EINVAL;
>>
>>       for_each_amd_iommu(iommu)
>> -        if ( pdev->seg == iommu->seg && pdev->sbdf.bdf == iommu->bdf )
>> +        if ( pdev->sbdf.sbdf == iommu->sbdf.sbdf )
>>               return is_hardware_domain(pdev->domain) ? 0 : -ENODEV;
>>
>>       iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
>> --
>> 2.49.0
>>
>>
I'll leave pci_ats_device and similar functions from directories above 
passthrough/amd for the next cleanup in a separate patch. Will change 
local functions like get_iommu.*_capabilities and resend.


Thank you!


