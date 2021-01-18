Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D512FA5F0
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jan 2021 17:21:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.69869.125207 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1XGw-0001tX-UK; Mon, 18 Jan 2021 16:20:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 69869.125207; Mon, 18 Jan 2021 16:20:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1XGw-0001t8-QM; Mon, 18 Jan 2021 16:20:54 +0000
Received: by outflank-mailman (input) for mailman id 69869;
 Mon, 18 Jan 2021 16:20:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hh0t=GV=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1XGu-0001t3-TT
 for xen-devel@lists.xenproject.org; Mon, 18 Jan 2021 16:20:52 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6bd43e65-dec3-4531-b5c3-33a3d8812e5c;
 Mon, 18 Jan 2021 16:20:51 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id w26so18823205ljo.4
 for <xen-devel@lists.xenproject.org>; Mon, 18 Jan 2021 08:20:51 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id b3sm2001464lff.190.2021.01.18.08.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Jan 2021 08:20:50 -0800 (PST)
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
X-Inumbo-ID: 6bd43e65-dec3-4531-b5c3-33a3d8812e5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=5Nchn9ZKxrOhwFcYQqDCiFYtkN0tDN3H5bZTcvhAcdM=;
        b=DjwT81lHBfItWAmBKJVLRv/NY2jrB9S3j28CBHFL+hsxQA+SchzzBVaw6iKWeAbxCk
         TOQl166VFCFu3QHpRsQhHyxpiuByIwEZ7AFZescEdTDm9jxgUqJ4BJMCiLEFKG9UHgF8
         hSz3kMuv9TmJOSrlmKeQiFDc0t1Ulgyi8YVqVJ8pt0ru7tvjbg36pmn+lkg4p6KmCij8
         n8aeRooMEa6SVy6RwImegKV0yCmfnXu2xnAt6CaYAf+omnUjkpycqM0idoLIz9HjoL0d
         OGsx+oC3V/OCcxQGnVsCNxiMiwPwS+1yxgDeo9zk9A1IN5eePCUNeQ+DgSw7nuB4ntgs
         vtmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=5Nchn9ZKxrOhwFcYQqDCiFYtkN0tDN3H5bZTcvhAcdM=;
        b=mYwAGn2Snj7kgkxReTjwpkEn/W++Im2TlIS3NTK/uRmSYq8nvKfupdJ+Ct/HF+phOA
         7OCBq7vtmrRngzUrBpmZVkRU0RkQfsCWoWewXbId60dinFkX3rNaQU6vhRtvOuaibJVQ
         YODueUwtnlo0+Fp58RqD825ToK5UTV8no0PYgbOdgE3yrSmAj4FuqJ/sgs44/MpwhB6z
         cDb8XyGV3v/pckx4wKELgwqXeFUTcgnqv3tn2A8KEdxW2PZaTfdWepyvgwpDXJ6N6LbQ
         d+eeRJxMJwHIv5DLrt8eH9CFOiXgnOtrfSO+LAB2QDKPcMlmO/9atrLej6doO2LRsQcF
         2Baw==
X-Gm-Message-State: AOAM532C99gp9UUtM07uVjmLfl8ZcgnH8k9SeqfsFd2B4vKWZffSajmO
	NBUJz2ZVI949nj+mlEF9hrY=
X-Google-Smtp-Source: ABdhPJwd0AZmzadcg+Xbw81BLOKce/rJxAadXix3iFATAmRHNfm53L0nJO4T75WO+9b+QM/ySgrGvw==
X-Received: by 2002:a2e:8748:: with SMTP id q8mr174071ljj.428.1610986850725;
        Mon, 18 Jan 2021 08:20:50 -0800 (PST)
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
 <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
 <81983272-f423-f24d-3094-1f4ba7568e1b@gmail.com>
 <5405ECAE-F22F-4893-B302-5D48C57A8847@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <03135a22-676b-6642-0fb3-4e3bb62cf014@gmail.com>
Date: Mon, 18 Jan 2021 18:20:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5405ECAE-F22F-4893-B302-5D48C57A8847@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 18.01.21 17:33, Rahul Singh wrote:
> Hello Oleksandr,
>
>> On 11 Jan 2021, at 4:39 pm, Oleksandr <olekstysh@gmail.com> wrote:
>>
>>
>> Hi Rahul

Hi Rahul


>>
>>
>>>> -
>>>>    static int arm_smmu_device_probe(struct platform_device *pdev)
>>>>    {
>>>>        int irq, ret;
>>>> -    struct resource *res;
>>>> -    resource_size_t ioaddr;
>>>> +    paddr_t ioaddr, iosize;
>>>>        struct arm_smmu_device *smmu;
>>>> -    struct device *dev = &pdev->dev;
>>>> -    bool bypass;
>>>>    -    smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>>>> +    smmu = xzalloc(struct arm_smmu_device);
>>>>        if (!smmu) {
>>>> -        dev_err(dev, "failed to allocate arm_smmu_device\n");
>>>> +        dev_err(pdev, "failed to allocate arm_smmu_device\n");
>>>>            return -ENOMEM;
>>>>        }
>>>> -    smmu->dev = dev;
>>>> +    smmu->dev = pdev;
>>>>    -    if (dev->of_node) {
>>>> +    if (pdev->of_node) {
>>>>            ret = arm_smmu_device_dt_probe(pdev, smmu);
>>>> +        if (ret)
>>>> +            return -EINVAL;
>>>>        } else {
>>>>            ret = arm_smmu_device_acpi_probe(pdev, smmu);
>>>>            if (ret == -ENODEV)
>>>>                return ret;
>>>>        }
>>>>    -    /* Set bypass mode according to firmware probing result */
>>>> -    bypass = !!ret;
>>>> -
>>>>        /* Base address */
>>>> -    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>> -    if (resource_size(res) < arm_smmu_resource_size(smmu)) {
>>>> -        dev_err(dev, "MMIO region too small (%pr)\n", res);
>>>> +    ret = dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
>>>> +    if (ret)
>>>> +        return -ENODEV;
>>>> +
>>>> +    if (iosize < arm_smmu_resource_size(smmu)) {
>>>> +        dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
>>>>            return -EINVAL;
>>>>        }
>>>> -    ioaddr = res->start;
>>>>          /*
>>>>         * Don't map the IMPLEMENTATION DEFINED regions, since they may contain
>>>> -     * the PMCG registers which are reserved by the PMU driver.
>>>> +     * the PMCG registers which are optional and currently not supported.
>>>>         */
>>>> -    smmu->base = arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
>>>> +    smmu->base = ioremap_nocache(ioaddr, ARM_SMMU_REG_SZ);
>>>>        if (IS_ERR(smmu->base))
>>>>            return PTR_ERR(smmu->base);
>>>>    -    if (arm_smmu_resource_size(smmu) > SZ_64K) {
>>>> -        smmu->page1 = arm_smmu_ioremap(dev, ioaddr + SZ_64K,
>>>> +    if (iosize > SZ_64K) {
>>>> +        smmu->page1 = ioremap_nocache(ioaddr + SZ_64K,
>>>>                               ARM_SMMU_REG_SZ);
>>>>            if (IS_ERR(smmu->page1))
>>>>                return PTR_ERR(smmu->page1);
>>>> @@ -2765,14 +3101,262 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>>>            return ret;
>>>>          /* Reset the device */
>>>> -    ret = arm_smmu_device_reset(smmu, bypass);
>>>> +    ret = arm_smmu_device_reset(smmu);
>>>>        if (ret)
>>>>            return ret;
>>>>    +    /*
>>>> +     * Keep a list of all probed devices. This will be used to query
>>>> +     * the smmu devices based on the fwnode.
>>>> +     */
>>>> +    INIT_LIST_HEAD(&smmu->devices);
>>>> +
>>>> +    spin_lock(&arm_smmu_devices_lock);
>>>> +    list_add(&smmu->devices, &arm_smmu_devices);
>>>> +    spin_unlock(&arm_smmu_devices_lock);
>> Looks like that we need some kind of manual roll-back logic here in case of error during probe (there is no real devm_*):
>>
>> iounmap, xfree, etc.
> I agree with you that manual roll-back logic is good to have clean code but in this scenario what I have found out that if there is an error during probe arm_smmu_device_probe() will return and XEN will not continue to boot (call panic function) , in that case if we free the memory also there is no much difference. That why I decided not to modify the code that we ported from Linux.
>
> XEN) I/O virtualisation disabled
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) Couldn't configure correctly all the IOMMUs.
> (XEN) ****************************************
> (XEN)
> (XEN) Manual reset required ('noreboot' specified)
>
> Do we have a requirement to continue to boot the XEN if there is an IOMMU available in the system and IOMMU probe is failed? If yes then I will modify the code to free all the resources if there is error during probe.

Xen won't call panic if IOMMU driver returns -ENODEV and will continue 
to boot. For example, if the IOMMU is present but cannot be used in Xen 
for some reason (doesn't support page table sharing, etc)


-- 
Regards,

Oleksandr Tyshchenko


