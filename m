Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6272FB9B5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 15:43:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.70430.126382 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sE3-0000FI-Bq; Tue, 19 Jan 2021 14:43:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 70430.126382; Tue, 19 Jan 2021 14:43:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1sE3-0000Et-8W; Tue, 19 Jan 2021 14:43:19 +0000
Received: by outflank-mailman (input) for mailman id 70430;
 Tue, 19 Jan 2021 14:43:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RhrS=GW=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1l1sE2-0000Eo-28
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 14:43:18 +0000
Received: from mail-lj1-x232.google.com (unknown [2a00:1450:4864:20::232])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a394f012-00fb-47d2-8008-be95c54cd6e7;
 Tue, 19 Jan 2021 14:43:16 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id 3so1980253ljc.4
 for <xen-devel@lists.xenproject.org>; Tue, 19 Jan 2021 06:43:16 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id h22sm2300293lfj.302.2021.01.19.06.43.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jan 2021 06:43:15 -0800 (PST)
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
X-Inumbo-ID: a394f012-00fb-47d2-8008-be95c54cd6e7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=9aKz+C6slIhx7sTE5ZJjlJMv63nfWkoTofTuUzyr3AY=;
        b=XMNhn6+RmkJezH8F1tdcPGS6n3h7o+x0dfvF03tzHd9rqNKBTqINoqa3crpPi4vTAh
         tPgI5BLuPruMVdZu1PRi68iAyKP1XaTnvOjciIVr74HyICUMkle9VsEQ3A/QHM6sJ1e+
         Wrk2vGTEtUeLngnG2rMcwj8tR2VPrzjO00hE/Cede4LLaO9aq87YXULMQs+dg6vQy706
         uqdWmTzc8/egslsv2NU89m8CG7IPANcL5vPJAynzHnW5XRAC6e6s3rZPLvXaTxD7uUxG
         zwRcMJTxcyyHGGBkWmrc5xY4qvRtR3jEvpKQsqCpd0x3AgQs8gggIK+NQgmmwnym4QDE
         elcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=9aKz+C6slIhx7sTE5ZJjlJMv63nfWkoTofTuUzyr3AY=;
        b=hHE0KmuHTePnuEAOwUDM5eWRq77avzVBm1qvsoX451EvtkC7hjzy6CrVhOraeoClSA
         LBjYHnw81ZewKLGcg124xq6yq3atSkMMb8SoLXCWcEJYKc0ZHeQRhz7DsFWw8+KegUoj
         AlH0zw56MRQNu8K5LkQTyWfvWwJPU4E23TMaVWM0xiG6yM1jpm+y4k6G8/DO1Elccfgv
         +pq64lOFyf6Rghia2JP864Kv5AatoCVdyfTGukDWE2rRIs+52BiTJ3nBL+pw5VQt4ajn
         c+kDiaXtVxYr7RI3TlopOcGMC7ZG0/sZX+7bkoylmuQLiSazYev9IDExBHjLwjVL8A5g
         Exag==
X-Gm-Message-State: AOAM533sA7pAz/1dIfuUj591nJK33ht3l/mL8U21m8pzsYCkTdEo04GT
	CxPT1HX67a1Im7r1AQE84EI=
X-Google-Smtp-Source: ABdhPJzqCAak6mSHU2AAbEaWAE+kvcfdXT2OQD8MmYb9e6ezHJeUiVo1YxlwWAhUXOt3hab2+6ngOg==
X-Received: by 2002:a05:651c:28f:: with SMTP id b15mr2041640ljo.348.1611067395697;
        Tue, 19 Jan 2021 06:43:15 -0800 (PST)
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
 <03135a22-676b-6642-0fb3-4e3bb62cf014@gmail.com>
 <5D0E2A07-4299-41D5-BB72-4D2A59E897AD@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <56877cfc-b2fe-3445-404e-60ff84cee195@gmail.com>
Date: Tue, 19 Jan 2021 16:43:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5D0E2A07-4299-41D5-BB72-4D2A59E897AD@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 18.01.21 18:57, Rahul Singh wrote:
> Hello Oleksandr,

Hi Rahul


>
>> On 18 Jan 2021, at 4:20 pm, Oleksandr <olekstysh@gmail.com> wrote:
>>
>>
>> On 18.01.21 17:33, Rahul Singh wrote:
>>> Hello Oleksandr,
>>>
>>>> On 11 Jan 2021, at 4:39 pm, Oleksandr <olekstysh@gmail.com> wrote:
>>>>
>>>>
>>>> Hi Rahul
>> Hi Rahul
>>
>>
>>>>
>>>>>> -
>>>>>>    static int arm_smmu_device_probe(struct platform_device *pdev)
>>>>>>    {
>>>>>>        int irq, ret;
>>>>>> -    struct resource *res;
>>>>>> -    resource_size_t ioaddr;
>>>>>> +    paddr_t ioaddr, iosize;
>>>>>>        struct arm_smmu_device *smmu;
>>>>>> -    struct device *dev = &pdev->dev;
>>>>>> -    bool bypass;
>>>>>>    -    smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
>>>>>> +    smmu = xzalloc(struct arm_smmu_device);
>>>>>>        if (!smmu) {
>>>>>> -        dev_err(dev, "failed to allocate arm_smmu_device\n");
>>>>>> +        dev_err(pdev, "failed to allocate arm_smmu_device\n");
>>>>>>            return -ENOMEM;
>>>>>>        }
>>>>>> -    smmu->dev = dev;
>>>>>> +    smmu->dev = pdev;
>>>>>>    -    if (dev->of_node) {
>>>>>> +    if (pdev->of_node) {
>>>>>>            ret = arm_smmu_device_dt_probe(pdev, smmu);
>>>>>> +        if (ret)
>>>>>> +            return -EINVAL;
>>>>>>        } else {
>>>>>>            ret = arm_smmu_device_acpi_probe(pdev, smmu);
>>>>>>            if (ret == -ENODEV)
>>>>>>                return ret;
>>>>>>        }
>>>>>>    -    /* Set bypass mode according to firmware probing result */
>>>>>> -    bypass = !!ret;
>>>>>> -
>>>>>>        /* Base address */
>>>>>> -    res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>>>>>> -    if (resource_size(res) < arm_smmu_resource_size(smmu)) {
>>>>>> -        dev_err(dev, "MMIO region too small (%pr)\n", res);
>>>>>> +    ret = dt_device_get_address(dev_to_dt(pdev), 0, &ioaddr, &iosize);
>>>>>> +    if (ret)
>>>>>> +        return -ENODEV;
>>>>>> +
>>>>>> +    if (iosize < arm_smmu_resource_size(smmu)) {
>>>>>> +        dev_err(pdev, "MMIO region too small (%lx)\n", iosize);
>>>>>>            return -EINVAL;
>>>>>>        }
>>>>>> -    ioaddr = res->start;
>>>>>>          /*
>>>>>>         * Don't map the IMPLEMENTATION DEFINED regions, since they may contain
>>>>>> -     * the PMCG registers which are reserved by the PMU driver.
>>>>>> +     * the PMCG registers which are optional and currently not supported.
>>>>>>         */
>>>>>> -    smmu->base = arm_smmu_ioremap(dev, ioaddr, ARM_SMMU_REG_SZ);
>>>>>> +    smmu->base = ioremap_nocache(ioaddr, ARM_SMMU_REG_SZ);
>>>>>>        if (IS_ERR(smmu->base))
>>>>>>            return PTR_ERR(smmu->base);
>>>>>>    -    if (arm_smmu_resource_size(smmu) > SZ_64K) {
>>>>>> -        smmu->page1 = arm_smmu_ioremap(dev, ioaddr + SZ_64K,
>>>>>> +    if (iosize > SZ_64K) {
>>>>>> +        smmu->page1 = ioremap_nocache(ioaddr + SZ_64K,
>>>>>>                               ARM_SMMU_REG_SZ);
>>>>>>            if (IS_ERR(smmu->page1))
>>>>>>                return PTR_ERR(smmu->page1);
>>>>>> @@ -2765,14 +3101,262 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
>>>>>>            return ret;
>>>>>>          /* Reset the device */
>>>>>> -    ret = arm_smmu_device_reset(smmu, bypass);
>>>>>> +    ret = arm_smmu_device_reset(smmu);
>>>>>>        if (ret)
>>>>>>            return ret;
>>>>>>    +    /*
>>>>>> +     * Keep a list of all probed devices. This will be used to query
>>>>>> +     * the smmu devices based on the fwnode.
>>>>>> +     */
>>>>>> +    INIT_LIST_HEAD(&smmu->devices);
>>>>>> +
>>>>>> +    spin_lock(&arm_smmu_devices_lock);
>>>>>> +    list_add(&smmu->devices, &arm_smmu_devices);
>>>>>> +    spin_unlock(&arm_smmu_devices_lock);
>>>> Looks like that we need some kind of manual roll-back logic here in case of error during probe (there is no real devm_*):
>>>>
>>>> iounmap, xfree, etc.
>>> I agree with you that manual roll-back logic is good to have clean code but in this scenario what I have found out that if there is an error during probe arm_smmu_device_probe() will return and XEN will not continue to boot (call panic function) , in that case if we free the memory also there is no much difference. That why I decided not to modify the code that we ported from Linux.
>>>
>>> XEN) I/O virtualisation disabled
>>> (XEN)
>>> (XEN) ****************************************
>>> (XEN) Panic on CPU 0:
>>> (XEN) Couldn't configure correctly all the IOMMUs.
>>> (XEN) ****************************************
>>> (XEN)
>>> (XEN) Manual reset required ('noreboot' specified)
>>>
>>> Do we have a requirement to continue to boot the XEN if there is an IOMMU available in the system and IOMMU probe is failed? If yes then I will modify the code to free all the resources if there is error during probe.
>> Xen won't call panic if IOMMU driver returns -ENODEV and will continue to boot. For example, if the IOMMU is present but cannot be used in Xen for some reason (doesn't support page table sharing, etc)
> Yes you are right in case of IOMMU driver probe failed and return -ENODEV XEN will continue to boot.
>
> I am thinking of if there is a problem with configuring the IOMMU HW and return -ENODEV or  for some reason if IOMMU is present cannot not be used in XEN why we are silently allows XEN to boot and make the system insecure.
> As end user might miss the error logs during boot and will think IOMMU is enabled and system is secure but IOMMU is either disable or is working in bypass mode.

But, wouldn't end user notice that device passthrough is not functional 
then?


>   
>
> I might be wrong, in that case as per my understanding we should return error and call panic and let user decide either to fix the issue on next boot or boot XEN with cmdline option "iommu=no”
I got your point, but I am not sure I can answer precisely how Xen 
should behave in the situation above, I will let the maintainers comment 
on that. Just a note, the -ENODEV is also returned by the framework if 
the IOMMU is not present (please see iommu_hardware_setup() in 
drivers/passthrough/arm/iommu.c for the details), either Xen doesn't 
have a suitable driver for it or the IOMMU H/W is not available in the 
target SoC, etc. I am not quite sure we should call panic in such cases.


Regarding the cleanup my point is that driver should be responsible of 
doing it if there is an error during initialization (and it cannot 
continue) regardless on how the common code would handle that (returned 
by driver) error. Now it panics on some conditions, tomorrow it will act 
differently, etc. If driver called panic by itself, it could _probably_ 
be in a position to leave resources unreleased then... This is my 
viewpoint which might be wrong.


>
> Regards,
> Rahul
>
>>
>> -- 
>> Regards,
>>
>> Oleksandr Tyshchenko

-- 
Regards,

Oleksandr Tyshchenko


