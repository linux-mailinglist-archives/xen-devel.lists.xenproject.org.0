Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF39D223755
	for <lists+xen-devel@lfdr.de>; Fri, 17 Jul 2020 10:49:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jwM2D-0000ta-4s; Fri, 17 Jul 2020 08:48:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T3hc=A4=gmail.com=andr2000@srs-us1.protection.inumbo.net>)
 id 1jwM2B-0000tG-Tf
 for xen-devel@lists.xenproject.org; Fri, 17 Jul 2020 08:47:59 +0000
X-Inumbo-ID: 36bebfa0-c80a-11ea-bb8b-bc764e2007e4
Received: from mail-lf1-x143.google.com (unknown [2a00:1450:4864:20::143])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36bebfa0-c80a-11ea-bb8b-bc764e2007e4;
 Fri, 17 Jul 2020 08:47:58 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y13so5601175lfe.9
 for <xen-devel@lists.xenproject.org>; Fri, 17 Jul 2020 01:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=+cjpQErgu64AMMblDNbZsWCTAraG+7PnGSTM25MPtPo=;
 b=nVUOUvlK1FjIf3AHNf/KHr9I2WXBkPAeHkzaHbmHK/41R7p9uNUdE68mJXuH/MSlih
 7i4AK4LQFYq1vhuASxj7R5q/JAgQvV8ED06Uqqa22dPo7IiBpBfG0BgUxtUdnkPE09DZ
 fvvnCoGMq+EQoWbivLoZaECDO43TBCdaFrsee6fqpMEgTGH+HilolNe5In0SQIW604ZO
 XSavuiaNvRQ9e4scaqrnjlOjCvH8FLFHyBywICiKsF9UamDCbyblgsutwf39B1WReZlF
 bslVHAwxyGv1IA4q1iKLVetJa302gib5+j4zy2qAcxRUGVj6X4rV+95yalX0U5rdqzPv
 E4SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=+cjpQErgu64AMMblDNbZsWCTAraG+7PnGSTM25MPtPo=;
 b=ILv+tZYbLwf+t4gad+gpU1f1yVMzwHPI79wUy2fATDKz4ElNzYyBJUPuHsntWkNoMx
 FJevksm/gm7zbezVDaGuajiLvonwHEgUbFN8f72467LCJHuA7NHaEQrSCozo9pQns5tH
 EfXA6GWoKpeiYD0Jm2GZ8SSiNi9SwxppNNtLgUvCATIXl8OUC2a2LVkU08SAhVLAclaG
 nEqi6DyvAy2IowojvpkJhvBVEh4DgHnjPzUva1ACSOwjOcHKNix9ysbNBLFlcvPGSHTh
 iqnjefW+gjE2N7ZqGXoOC71CQy1jqY7EnMTho1usG+HiP6gH7aYAHD7T633Rb42yqPFb
 /o9A==
X-Gm-Message-State: AOAM530t1edKkRerApJJGpXbBPVhBJeTxp9PxrW5QkcQUoEwVYX2pVN/
 mrox/+IJIlZSWIfOLo7wmiI=
X-Google-Smtp-Source: ABdhPJxHrjs4ruDWsJIEWsI2FyFYHbirRkItJqAOiGnkUrjeog0tvOHSrsQJbkXW7sGyHWccAPEwtg==
X-Received: by 2002:ac2:51a1:: with SMTP id f1mr4219703lfk.173.1594975677602; 
 Fri, 17 Jul 2020 01:47:57 -0700 (PDT)
Received: from [192.168.10.4] ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id l12sm1531346ljj.43.2020.07.17.01.47.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Jul 2020 01:47:56 -0700 (PDT)
Subject: Re: RFC: PCI devices passthrough on Arm design proposal
To: Jan Beulich <jbeulich@suse.com>, Rahul Singh <Rahul.Singh@arm.com>
References: <3F6E40FB-79C5-4AE8-81CA-E16CA37BB298@arm.com>
 <BD475825-10F6-4538-8294-931E370A602C@arm.com>
 <E9CBAA57-5EF3-47F9-8A40-F5D7816DB2A4@arm.com>
 <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
From: Oleksandr Andrushchenko <andr2000@gmail.com>
Message-ID: <6b4cadff-ffdc-848a-2b57-be55f61f5bc7@gmail.com>
Date: Fri, 17 Jul 2020 11:47:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a50c714c-1642-0354-3f19-5a6f7278d8aa@suse.com>
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


On 7/17/20 11:10 AM, Jan Beulich wrote:
> On 16.07.2020 19:10, Rahul Singh wrote:
>> # Discovering PCI devices:
>>
>> PCI-PCIe enumeration is a process of detecting devices connected to its host. It is the responsibility of the hardware domain or boot firmware to do the PCI enumeration and configure the BAR, PCI capabilities, and MSI/MSI-X configuration.
>>
>> PCI-PCIe enumeration in XEN is not feasible for the configuration part as it would require a lot of code inside Xen which would require a lot of maintenance. Added to this many platforms require some quirks in that part of the PCI code which would greatly improve Xen complexity. Once hardware domain enumerates the device then it will communicate to XEN via the below hypercall.
>>
>> #define PHYSDEVOP_pci_device_add        25
>> struct physdev_pci_device_add {
>>      uint16_t seg;
>>      uint8_t bus;
>>      uint8_t devfn;
>>      uint32_t flags;
>>      struct {
>>      	uint8_t bus;
>>      	uint8_t devfn;
>>      } physfn;
>>      /*
>>      * Optional parameters array.
>>      * First element ([0]) is PXM domain associated with the device (if * XEN_PCI_DEV_PXM is set)
>>      */
>>      uint32_t optarr[XEN_FLEX_ARRAY_DIM];
>>      };
>>
>> As the hypercall argument has the PCI segment number, XEN will access the PCI config space based on this segment number and find the host-bridge corresponding to this segment number. At this stage host bridge is fully initialized so there will be no issue to access the config space.
>>
>> XEN will add the PCI devices in the linked list maintain in XEN using the function pci_add_device(). XEN will be aware of all the PCI devices on the system and all the device will be added to the hardware domain.
> Have you had any thoughts about Dom0 re-arranging the bus numbering?
> This is, afaict, a still open issue on x86 as well.

This can get even trickier as we may have PCI enumerated at boot time

by the firmware and then Dom0 may perform the enumeration differently.

So, Xen needs to be aware of what is going to be used as the source of the

enumeration data and be ready to re-build its internal structures in order

to be aligned with that entity: e.g. compare Dom0 and Dom0less use-cases

>
>> Limitations:
>> * When PCI devices are added to XEN, MSI capability is not initialized inside XEN and not supported as of now.
> I think this is a pretty severe limitation, as modern devices tend to
> not support pin based interrupts anymore.
>
>> # Emulated PCI device tree node in libxl:
>>
>> Libxl is creating a virtual PCI device tree node in the device tree to enable the guest OS to discover the virtual PCI during guest boot. We introduced the new config option [vpci="pci_ecam"] for guests. When this config option is enabled in a guest configuration, a PCI device tree node will be created in the guest device tree.
> I support Stefano's suggestion for this to be an optional thing, i.e.
> there to be no need for it when there are PCI devices assigned to the
> guest anyway. I also wonder about the pci_ prefix here - isn't
> vpci="ecam" as unambiguous?
>
>> A new area has been reserved in the arm guest physical map at which the VPCI bus is declared in the device tree (reg and ranges parameters of the node). A trap handler for the PCI ECAM access from guest has been registered at the defined address and redirects requests to the VPCI driver in Xen.
>>
>> Limitation:
>> * Only one PCI device tree node is supported as of now.
>>
>> BAR value and IOMEM mapping:
>>
>> Linux guest will do the PCI enumeration based on the area reserved for ECAM and IOMEM ranges in the VPCI device tree node. Once PCI	device is assigned to the guest, XEN will map the guest PCI IOMEM region to the real physical IOMEM region only for the assigned devices.
>>
>> As of now we have not modified the existing VPCI code to map the guest PCI IOMEM region to the real physical IOMEM region. We used the existing guest “iomem” config option to map the region.
>> For example:
>> 	Guest reserved IOMEM region:  0x04020000
>>      	Real physical IOMEM region:0x50000000
>>      	IOMEM size:128MB
>>      	iomem config will be:   iomem = ["0x50000,0x8000@0x4020"]
> This surely is planned to go away before the code hits upstream? The
> ranges really should be read out of the BARs, as I see the
> "limitations" section further down suggests, but it's not clear
> whether "limitations" are items that you plan to take care of before
> submitting your code for review.
>
> Jan
>

