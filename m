Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9172F1B28
	for <lists+xen-devel@lfdr.de>; Mon, 11 Jan 2021 17:40:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.65051.115117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0ER-00048l-2A; Mon, 11 Jan 2021 16:39:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 65051.115117; Mon, 11 Jan 2021 16:39:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kz0EQ-00048M-Uy; Mon, 11 Jan 2021 16:39:50 +0000
Received: by outflank-mailman (input) for mailman id 65051;
 Mon, 11 Jan 2021 16:39:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oy8T=GO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kz0EP-00048H-Gj
 for xen-devel@lists.xenproject.org; Mon, 11 Jan 2021 16:39:49 +0000
Received: from mail-ed1-x52e.google.com (unknown [2a00:1450:4864:20::52e])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4e9fbe4b-3776-4299-8f74-363055d4a5b4;
 Mon, 11 Jan 2021 16:39:48 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id cm17so401858edb.4
 for <xen-devel@lists.xenproject.org>; Mon, 11 Jan 2021 08:39:48 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id rl7sm42118ejb.107.2021.01.11.08.39.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Jan 2021 08:39:47 -0800 (PST)
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
X-Inumbo-ID: 4e9fbe4b-3776-4299-8f74-363055d4a5b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=2Gy7EmZI3EtcWre72ptyZVNlV/L/CJ/wfVKh+OpgwQs=;
        b=DCpvqut1wp5FiVV4juBo6BRsQRNcvHPKFSc3L4Xs2BBHpxht/C398f6O6wXXmVgaYi
         7yb0FbcophylIN2ERTiRV1FSnxg/m0JOSRzfnaaO8fJZCm9bBd+GE7ch33dCyLKxkOfC
         HJPWCA5FvYmHRvOfOu1Tk/PilL8zV/veoLi2b1DicA4RhgdbPU1HBKrsOV88YIKAK0gT
         wZf/xC+ROkaoMOZZst3/2cR+d9IdORsfhey/8ALSmbIo1UTnah0ZGKUhqUD1pDtCwwZT
         IrlPlw6RjMqv4xCBSFXERgJuZ8JSmux9axrJZq/z2f1GFV0e6klK5LfBWv0yZ3HduODS
         j5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=2Gy7EmZI3EtcWre72ptyZVNlV/L/CJ/wfVKh+OpgwQs=;
        b=gQaWvxuW8j6dIhTxGjnzoFy/BhifPsUuLL3JDKqqOSGKiWqXi8srEr6H9uClNSsvUV
         0CTbovwu8s1VbsMhSLAqf6Nr7a+lFj5a/hAipuieBMrKCn0qju9ronUShH6FRprQI+na
         PbIRVOdYc5faM4NOMb8Ry1xML6XYm9Jkkdto5zbupfrDcZrFI4U6oef1vL0F5R41era1
         GZ0SJv5L0IN9BtlgoG7ysxW77zuv2A9lZoUdB5wGLsaMfeHomgM+ONyynVo8YncXqr4j
         3fdWBnrICAsNFSeU6oXFL2YqM+EcBCodKA14gmyoG3iCXSykkRQV/VfdVpxdi7LsnqhZ
         yQiA==
X-Gm-Message-State: AOAM532YhFk6ztccGJJ3Sk+hU84ccTKsV2ALGiTzr55tb1S/2nDnd7pr
	znWLK6nOMLS3EeKnZ1aGLe4=
X-Google-Smtp-Source: ABdhPJy0llp8S53zx7rPNf/woSOZ4gfRCcX2s4x7Werj+y3za/Hg7ZXkG5tRGtpNZXvxijt1redxdQ==
X-Received: by 2002:a50:c209:: with SMTP id n9mr165168edf.123.1610383187737;
        Mon, 11 Jan 2021 08:39:47 -0800 (PST)
Subject: Re: [PATCH v4 11/11] xen/arm: smmuv3: Add support for SMMUv3 driver
From: Oleksandr <olekstysh@gmail.com>
To: Rahul Singh <rahul.singh@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1610115608.git.rahul.singh@arm.com>
 <9ba174516e01e2a53390420fa957ea563219141f.1610115608.git.rahul.singh@arm.com>
 <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
Message-ID: <81983272-f423-f24d-3094-1f4ba7568e1b@gmail.com>
Date: Mon, 11 Jan 2021 18:39:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7762de2c-da11-5643-8f70-fdd87a7583eb@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


Hi Rahul


>> -
>>   static int arm_smmu_device_probe(struct platform_device *pdev)
>>   {
>>       int irq, ret;
>> -    struct resource *res;
>> -    resource_size_t ioaddr;
>> +    paddr_t ioaddr, iosize;
>>       struct arm_smmu_device *smmu;
>> -    struct device *dev = &pdev->dev;
>> -    bool bypass;
>>   -    smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>> +    smmu = xzalloc(struct arm_smmu_device);
>>       if (!smmu) {
>> -        dev_err(dev, "failed to allocate arm_smmu_device\n");
>> +        dev_err(pdev, "failed to allocate arm_smmu_device\n");
>>           return -ENOMEM;
>>       }
>> -    smmu->dev = dev;
>> +    smmu->dev = pdev;
>>   -    if (dev->of_node) {
>> +    if (pdev->of_node) {
>>           ret = arm_smmu_device_dt_probe(pdev, smmu);
>> +        if (ret)
>> +            return -EINVAL;
>>       } else {
>>           ret = arm_smmu_device_acpi_probe(pdev, smmu);
>>           if (ret == -ENODEV)
>>               return ret;
>>       }
>>   -    /* Set bypass mode according to firmware probing result */
>> -    bypass = !!ret;
>> -
>>       /* Base address */
>> -    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> -    if (resource_size(res) < arm_smmu_resource_size(smmu)) {
>> -        dev_err(dev, "MMIO region too small (%pr)\n", res);
>> +    ret = dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
>> +    if (ret)
>> +        return -ENODEV;
>> +
>> +    if (iosize < arm_smmu_resource_size(smmu)) {
>> +        dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
>>           return -EINVAL;
>>       }
>> -    ioaddr = res->start;
>>         /*
>>        * Don't map the IMPLEMENTATION DEFINED regions, since they may 
>> contain
>> -     * the PMCG registers which are reserved by the PMU driver.
>> +     * the PMCG registers which are optional and currently not 
>> supported.
>>        */
>> -    smmu->base = arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
>> +    smmu->base = ioremap_nocache(ioaddr, ARM_SMMU_REG_SZ);
>>       if (IS_ERR(smmu->base))
>>           return PTR_ERR(smmu->base);
>>   -    if (arm_smmu_resource_size(smmu) > SZ_64K) {
>> -        smmu->page1 = arm_smmu_ioremap(dev, ioaddr + SZ_64K,
>> +    if (iosize > SZ_64K) {
>> +        smmu->page1 = ioremap_nocache(ioaddr + SZ_64K,
>>                              ARM_SMMU_REG_SZ);
>>           if (IS_ERR(smmu->page1))
>>               return PTR_ERR(smmu->page1);
>> @@ -2765,14 +3101,262 @@ static int arm_smmu_device_probe(struct 
>> platform_device *pdev)
>>           return ret;
>>         /* Reset the device */
>> -    ret = arm_smmu_device_reset(smmu, bypass);
>> +    ret = arm_smmu_device_reset(smmu);
>>       if (ret)
>>           return ret;
>>   +    /*
>> +     * Keep a list of all probed devices. This will be used to query
>> +     * the smmu devices based on the fwnode.
>> +     */
>> +    INIT_LIST_HEAD(&smmu->devices);
>> +
>> +    spin_lock(&arm_smmu_devices_lock);
>> +    list_add(&smmu->devices, &arm_smmu_devices);
>> +    spin_unlock(&arm_smmu_devices_lock);

Looks like that we need some kind of manual roll-back logic here in case 
of error during probe (there is no real devm_*):

iounmap, xfree, etc.


>>
>> +
>>       return 0;
>>   }
>
-- 
Regards,

Oleksandr Tyshchenko


