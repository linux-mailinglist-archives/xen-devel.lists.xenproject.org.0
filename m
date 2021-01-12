Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B5E2F3BA8
	for <lists+xen-devel@lfdr.de>; Tue, 12 Jan 2021 21:59:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66021.117074 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQlX-0005La-91; Tue, 12 Jan 2021 20:59:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66021.117074; Tue, 12 Jan 2021 20:59:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzQlX-0005LB-60; Tue, 12 Jan 2021 20:59:47 +0000
Received: by outflank-mailman (input) for mailman id 66021;
 Tue, 12 Jan 2021 20:59:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OoN1=GP=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kzQlW-0005L6-6d
 for xen-devel@lists.xenproject.org; Tue, 12 Jan 2021 20:59:46 +0000
Received: from mail-lf1-x12d.google.com (unknown [2a00:1450:4864:20::12d])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 7bdd6ec0-f143-44b7-9e57-c8f8b009c81a;
 Tue, 12 Jan 2021 20:59:45 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id a12so5452704lfl.6
 for <xen-devel@lists.xenproject.org>; Tue, 12 Jan 2021 12:59:44 -0800 (PST)
Received: from [192.168.1.7] ([212.22.223.21])
 by smtp.gmail.com with ESMTPSA id a24sm525349lfg.256.2021.01.12.12.59.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 12:59:43 -0800 (PST)
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
X-Inumbo-ID: 7bdd6ec0-f143-44b7-9e57-c8f8b009c81a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=uRbkaCl6BSBOHmzEKK0ca04L7PbAGqtZ+HNYJ0/3r6w=;
        b=Cqt/s5A7BaGa+2EoWSQC9m2/nqr2oWNaBX32qJ+J3ExyPYoBrg+3MPZrllSnJXmQY0
         U+mbz19EmBKZVauZXpbyQRh6Vdd0YpFX+0JOdhcyvwRoHe8+3ndoBuJX6KjpMisji4On
         WGp8foRRz1agK77Rp61DS/jHvhgoR8Qyi9uIFAiCFyb/bEbKXLE4Ek3enikkoEMNboPY
         JRVGbtz1Um0B8bc45NWvrW4SiYY1oVro4aaY3IeKcAS+Uod+yZYtKJUp2QQqEXb5g7jS
         MK4H/1xBJewnGE4UevYnrs2oGG8zY56rJenKgx8Vxx5E/1NMDFf4eibPv0el02MEWIdA
         Ab5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=uRbkaCl6BSBOHmzEKK0ca04L7PbAGqtZ+HNYJ0/3r6w=;
        b=amya1encQrcC5A08JWRG+mJAvtLlIbNdFPMqeghtx1yTJNPwE+skt5LuLwjbjbd8+v
         0RSTle3ZF3d04Yn9mGy2fcsjAd3DIg0Jp1c2X1JT4Xp61p7NdLg0XtU2WWAwMQzNtnlQ
         qqWTBT5mQQBaSPYsgTMBxClCR0eFl1qzmBO04ppT1PQ0s5/vj+xI8Iu8/1DaXjkogoN8
         FN6ReDluQcb88bDOTbw1BP2o9vjTpjg+nM/y4bvIjCCrncTARuQSPQeYbnTxIyBfiROn
         3xg131TC5GYueeBMv8fvXaTdUvIiZEe8OuCi03NeG3LmKUR1FcwkaeIfpnLDF7oXzn7e
         gqcQ==
X-Gm-Message-State: AOAM5310vj9FzdDJ/ma/bDDGwwYiPPZ/ezqqxwzTbbx2TgOE1g195vu8
	LZqqKvaMGmc3e6oU3lx8fhk=
X-Google-Smtp-Source: ABdhPJw3nQ2uRPkqkGJeLs2KPXVa82d0yBEAQ+GCECGWTyLSFJ+QpfS8v8/cXjVRnJdoEyGLZsxbbA==
X-Received: by 2002:a19:cc52:: with SMTP id c79mr307951lfg.490.1610485183821;
        Tue, 12 Jan 2021 12:59:43 -0800 (PST)
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
 <A92B97AF-953C-4523-A438-CED1D8C1F1AC@arm.com>
From: Oleksandr <olekstysh@gmail.com>
Message-ID: <3485d705-9063-59b9-f282-9661883265f3@gmail.com>
Date: Tue, 12 Jan 2021 22:59:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <A92B97AF-953C-4523-A438-CED1D8C1F1AC@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 12.01.21 11:41, Rahul Singh wrote:

Hi Rahul


>
>>>   -static int arm_smmu_of_xlate(struct device *dev, struct of_phandle_args *args)
>>> +static int arm_smmu_dt_xlate(struct device *dev,
>>> +				const struct dt_phandle_args *args)
>>>   {
>>> -	return iommu_fwspec_add_ids(dev, args->args, 1);
>>> +	int ret;
>>> +	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
>> Please bear in mind I am not familiar with the SMMU, but don't we need to perform a some kind
>> of sanity check of passed DT IOMMU specifier here?
> I checked the code follow we will never hit the dt_xlate without IOMMU specifier but anyway I will add the sanity check.
By sanity check I meant to make sure that device ID (stream ID) is in 
allowed range (of course, if this is relevant for SMMU).
For example, for IPMMU-VMSA we have a check that device ID (uTLB) is 
less than max uTLB number.


>   
>
>
>>> +
>>> +static int arm_smmu_iommu_xen_domain_init(struct domain *d)
>>> +{
>>> +	struct arm_smmu_xen_domain *xen_domain;
>>> +
>>> +	xen_domain = xzalloc(struct arm_smmu_xen_domain);
>>> +	if (!xen_domain)
>>> +		return -ENOMEM;
>>> +
>>> +	spin_lock_init(&xen_domain->lock);
>>> +	INIT_LIST_HEAD(&xen_domain->contexts);
>>> +
>>> +	dom_iommu(d)->arch.priv = xen_domain;
>>> +	return 0;
>>> +
>>> +}
>>> +
>>> +static void __hwdom_init arm_smmu_iommu_hwdom_init(struct domain *d)
>>> +{
>> Both SMMUv2 and IPMMU perform some actions here. Any reason we don't need to do the same here?
>>
>>      /* Set to false options not supported on ARM. */
>>      if ( iommu_hwdom_inclusive )
>>          printk(XENLOG_WARNING
>>          "map-inclusive dom0-iommu option is not supported on ARM\n");
>>      iommu_hwdom_inclusive = false;
>>      if ( iommu_hwdom_reserved == 1 )
>>          printk(XENLOG_WARNING
>>          "map-reserved dom0-iommu option is not supported on ARM\n");
>>      iommu_hwdom_reserved = 0;
>>
>>      arch_iommu_hwdom_init(d);
> I will add the above code for SMMUv3 also.

Great.

I was thinking about it, this is the third IOMMU driver on Arm which has 
to disable the _same_ unsupported options, probably this code wants to 
be folded in arch_iommu_hwdom_init() to avoid duplication?

-- 
Regards,

Oleksandr Tyshchenko


