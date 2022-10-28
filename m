Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD2361124F
	for <lists+xen-devel@lfdr.de>; Fri, 28 Oct 2022 15:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.432054.684747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooP4C-0006av-Ud; Fri, 28 Oct 2022 13:06:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 432054.684747; Fri, 28 Oct 2022 13:06:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ooP4C-0006Xr-Rd; Fri, 28 Oct 2022 13:06:32 +0000
Received: by outflank-mailman (input) for mailman id 432054;
 Fri, 28 Oct 2022 13:06:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ooP4B-0006Xl-0o
 for xen-devel@lists.xenproject.org; Fri, 28 Oct 2022 13:06:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooP4A-0003G3-Lt; Fri, 28 Oct 2022 13:06:30 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.25.146]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ooP4A-00065N-F5; Fri, 28 Oct 2022 13:06:30 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=vzMW9JF0pgkWt3b0mjgKiSrLS6OHC8sI9pYFu4gNpEw=; b=U2Iku+5Ye5yuySZgIcdCHQz5hM
	/hAxKMhccTUa4j+64NgJwGegf7Vvm/7G3V0o7XPltAchqHFXo51LO54Y8JrSTGgj4yNnJVkNgO75y
	dQKNJVdzX7rhmWcNBDo12asnkaOSS2rcNcBvC1oUSsnsC9eGnXnXdb/JX2kz8VMXnkNk=;
Message-ID: <f777b164-54c6-6091-79ce-fac3dd603b8c@xen.org>
Date: Fri, 28 Oct 2022 14:06:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
 <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
 <99E954B0-50F5-4D7B-A7D2-50D1B7B3657C@arm.com>
 <60b9cc07-c0ec-756b-802b-5fc96f253dbf@xen.org>
 <EDDD0430-0BFF-4C95-B9CE-402487C2E5DE@arm.com>
 <fde8c845-8d35-83cd-d4fd-bb2c5fd1a7ed@xen.org>
 <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <227AD28E-DFB8-4EB3-9E0E-61C70A0D19EB@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 28/10/2022 13:54, Rahul Singh wrote:
>>>>>> For ACPI, I would have expected the information to be found in the IOREQ.
>>>>>>
>>>>>> So can you add more context why this is necessary for everyone?
>>>>> We have information for IOMMU and Master-ID but we don’t have information for linking vMaster-ID to pMaster-ID.
>>>>
>>>> I am confused. Below, you are making the virtual master ID optional. So shouldn't this be mandatory if you really need the mapping with the virtual ID?
>>> vMasterID is optional if user knows pMasterID is unique on the system. But if pMasterId is not unique then user needs to provide the vMasterID.
>>
>> So the expectation is the user will be able to know that the pMasterID is uniq. This may be easy with a couple of SMMUs, but if you have 50+ (as suggested above). This will become a pain on larger system.
>>
>> IHMO, it would be much better if we can detect that in libxl (see below).
> 
> We can make the vMasterID compulsory to avoid complexity in libxl to solve this

In general, complexity in libxl is not too much of problem.

> 
>>
>>>>
>>>>> The device tree node will be used to assign the device to the guest and configure the Stage-2 translation. Guest will use the
>>>>> vMaster-ID to configure the vIOMMU during boot. Xen needs information to link vMaster-ID to pMaster-ID to configure
>>>>> the corresponding pIOMMU. As I mention we need vMaster-ID in case a system could have 2 identical Master-ID but
>>>>> each one connected to a different SMMU and assigned to the guest.
>>>>
>>>> I am afraid I still don't understand why this is a requirement. Libxl could have enough knowledge (which will be necessarry for the PCI case) to know the IOMMU and pMasterID associated with a device.
>>>>
>>>> So libxl could allocate the vMasterID, tell Xen the corresponding mapping and update the device-tree.
>>>>
>>>> IOW, it doesn't seem to be necessary to involve the user in the process here.
>>> Yes, libxl could allocate the vMasterID but there is no way we can find the link b/w vMasterID created to pMasterID from dtdev.
>>> What I understand from the code is that there is no link between the passthrough node and dtdev config option. The passthrough
>>> node is directly copied to guest DT without any modification. Dtdev is used to add and assign the device to IOMMU.
>>> Let's take an example if the user wants to assign two devices to the guest via passthrough node.
>>> /dts-v1/;
>>> / {
>>>     /* #*cells are here to keep DTC happy */
>>>     #address-cells = <2>;
>>>     #size-cells = <2>;
>>>     aliases {
>>>         net = &mac0;
>>>     };
>>>     passthrough {
>>>         compatible = "simple-bus";
>>>         ranges;
>>>         #address-cells = <2>;
>>>         #size-cells = <2>;
>>>         mac0: ethernet@10000000 {
>>>             compatible = "calxeda,hb-xgmac";
>>>             reg = <0 0x10000000 0 0x1000>;
>>>             interrupts = <0 80 4  0 81 4  0 82 4>;
>>>         };
>>>       mac1: ethernet@20000000 {
>>>             compatible = “r8169";
>>>             reg = <0 0x10000000 0 0x1000>;
>>>             interrupts = <0 80 4  0 81 4  0 82 4>;
>>>         };
>>>     };
>>> };
>>> dtdev = [ "/soc/ethernet@10000000”, “/soc/ethernet@f2000000” ]
>>> There is no link which dtdev entry belongs to which node. Therefor there is no way to link the vMasterID created to pMasterID.
>>
>> I agree there is no link today. But we could add a property in the partial device-tree to mention which physical device is associated.
>>
>> With that, I think all, the complexity is moved to libxl and it will be easier for the user to use vIOMMU.
>>
>> [...]
> 
> As of now libxl directly coping the partial DT to guest DT without any modification. If we have to go to this route libxl has to modify
> the partial DT in libxl to include “iommus” or "iommu-map”. Is that okay to modify the partial DT in libxl 

I am not aware of any issue to modify the partial device-tree. In fact, 
I am strongly in favor of libxl to modify it if it greatly improve the 
user experience.

Cheers,

-- 
Julien Grall

