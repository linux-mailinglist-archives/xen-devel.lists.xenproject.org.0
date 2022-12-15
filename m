Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0EE64DA4C
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 12:31:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463289.721455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mSR-0005Dt-Um; Thu, 15 Dec 2022 11:31:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463289.721455; Thu, 15 Dec 2022 11:31:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5mSR-0005B2-RC; Thu, 15 Dec 2022 11:31:23 +0000
Received: by outflank-mailman (input) for mailman id 463289;
 Thu, 15 Dec 2022 11:31:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p5mSQ-0005Au-3u
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 11:31:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mSO-0000O5-RN; Thu, 15 Dec 2022 11:31:20 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224] helo=[10.85.36.201])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p5mSO-0007HI-LZ; Thu, 15 Dec 2022 11:31:20 +0000
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
	bh=p9WTWEvDp9ow7fo8j5qQi5TAMVs3MvV1ewbzynRdL0k=; b=YhJ1SrAwAvVOwEdc8VInP8l8oR
	9YJZiyw5Bln4FyCdhT4eyX32JsNdbo+B7Y6AK0dqzqaMnQGcSuNX6LEbuVrRfkSqxPWWPYTkKFMBv
	3EFIA7TXobdzpLuTgBwPC0hhIjv7qhW4jAxm5TFKqittokv2FXhy9aZDzMQrUpJvpBhs=;
Message-ID: <84ecad1e-2670-f6e0-ef74-cde5c9aaf496@xen.org>
Date: Thu, 15 Dec 2022 11:31:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [BUG]Add PCIE devie to SMMUv3 fail
Content-Language: en-US
To: sisyphean <sisyphean@zlw.email>, Rahul Singh <Rahul.Singh@arm.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <793eb471-e68b-c3ff-52e8-20d77252c0bf@zlw.email>
 <A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com>
 <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
 <5BCFEC7E-85B6-4464-A2B1-EA08C6E2EB20@arm.com>
 <340463d2-528e-848f-0ec2-a4cc7ba04399@zlw.email>
 <9478D04C-9BD6-44C1-ADBD-EAA688897811@arm.com>
 <d0f62d31-5673-e804-6e38-6e552989f249@zlw.email>
 <3e124fa6-84ba-d507-82d9-8e8a5aa74c73@zlw.email>
From: Julien Grall <julien@xen.org>
In-Reply-To: <3e124fa6-84ba-d507-82d9-8e8a5aa74c73@zlw.email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 15/12/2022 08:53, sisyphean wrote:
> Hi,

Hi,

> 在 2022/12/15 09:30, sisyphean 写道:
>> Hi,
>>
>> 在 2022/12/14 21:05, Rahul Singh 写道:
>>> Hi Sisphean,
>>>
>>>> On 13 Dec 2022, at 1:18 am, sisyphean <sisyphean@zlw.email> wrote:
>>>>
>>>> Hi,
>>>>
>>>> 在 2022/12/13 00:30, Rahul Singh 写道:
>>>>> Hi Sisyphean,
>>>>>
>>>>>> On 12 Dec 2022, at 5:49 am, sisyphean <sisyphean@zlw.email> wrote:
>>>>>>
>>>>>> Hi,
>>>>>> 在 2022/12/9 17:50, Rahul Singh 写道:
>>>>>>> Hi Sisyphean,
>>>>>>>
>>>>>>>> On 9 Dec 2022, at 6:15 am, sisyphean <sisyphean@zlw.email> wrote:
>>>>>>>>
>>>>>>>> Hi,
>>>>>>>>
>>>>>>>> I try to run XEN on my ARM board(Sorry, for some commercial 
>>>>>>>> reasons, I can't tell you
>>>>>>>> on which platform I run XEN)  and add PCIE device passthrough to 
>>>>>>>> DomU.But an error
>>>>>>>> occurred while adding the PCIE device to SMMUv3.
>>>>>>> PCI passthrough support is not fully upstream to Xen on ARM. We 
>>>>>>> have working
>>>>>>> PCI passthrough branch that you can use to test it.
>>>>>>>
>>>>>>> https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough
>>>>>>>
>>>>>>>> Through reading the code and tracing debugging, the error is 
>>>>>>>> found in the function
>>>>>>>> arm_smmu_add_device, which will obtain and determine whether the 
>>>>>>>> fwspec of the
>>>>>>>> device to be added to SMMU exists.But for the XEN of arm, the 
>>>>>>>> fwspec of the device is
>>>>>>>> created and added by judging whether the iommu field exists in 
>>>>>>>> the device node when
>>>>>>>> XEN parses the device tree.However, the PCIE device does not 
>>>>>>>> appear in the device tree,
>>>>>>>> so there will be no fwspec for all PCIE devices. When attempting 
>>>>>>>> to add a PCIE device to
>>>>>>>> SMMU, a ENODEV error will be returned.
>>>>>>> As of now Xen doesn’t support to add PCI device to IOMMU on ARM.
>>>>>>>> In addition, the code at xen/drivers/passthrough/pci.c also 
>>>>>>>> verifies the above view.
>>>>>>>> For PCIE devices, pdev is alloc in function pci_add_device by 
>>>>>>>> alloc_pdev.However,
>>>>>>>> the function alloc_pdev does not create and add fwspec to the 
>>>>>>>> PCIE device.Therefore,
>>>>>>>> when function pci_add_device executes to iommu_add_device,it 
>>>>>>>> will get the error
>>>>>>>> return of ENODEV.
>>>>>>>>
>>>>>>>> How can I resolve the above errors?
>>>>>>> If you want to test the PCI passthrough please follow below steps.
>>>>>>>
>>>>>>> Xen setup:
>>>>>>>      • A checkout of the “integration/pci-passthrough” branch 
>>>>>>> from the  gitlab 
>>>>>>> https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough
>>>>>>>      • Pass iommu=yes  and pci-passthrough=on to Xen command line 
>>>>>>> to enable PCI passthrough.
>>>>>>>
>>>>>>>   Linux Kernel setup:
>>>>>>>        • Some changes are required for the kernel to work with 
>>>>>>> PCI passthrough. First are some configuration options, enable 
>>>>>>> them in kernel config.
>>>>>>>           CONFIG_XEN=y
>>>>>>>           CONFIG_XEN_BACKEND=y
>>>>>>>           CONFIG_XEN_PCIDEV_BACKEND=y
>>>>>>>      • Then a patch needs to be applied for enabling the pciback 
>>>>>>> driver. Patch is attached in this email.
>>>>>>>   Using PCI passthrough:
>>>>>>>        • In order to pass a device to a guest, you first need its 
>>>>>>> PCI address(SBDF). You can either get it from a bare-metal
>>>>>>>        Linux running on the platform or by having pciutils 
>>>>>>> installed (if you are using a yocto-based dom0 or have apt 
>>>>>>> available), which provides lspci.
>>>>>>>         For example, let's pass one ethernet interface to the 
>>>>>>> guest. Running lspci gives us this output (truncated) :
>>>>>>>         0000:00:00.0 Host bridge: Ampere Computing, LLC Device e100
>>>>>>>         0000:00:01.0 PCI bridge: Ampere Computing, LLC Device 
>>>>>>> e101 (rev 04)
>>>>>>>         0000:01:00.0 Ethernet controller: Intel Corporation 
>>>>>>> Ethernet Controller X710/X557-AT 10GBASE-T (rev 01)
>>>>>>>                 [...]
>>>>>>>         We will pass one of the ethernet from the PCI network 
>>>>>>> card : 0000:01:00.0 .
>>>>>>>        • Add the following line to the guest configuration file :
>>>>>>>            pci = ['0000:01:00.0']
>>>>>>>        • Run the following command before starting the guest :
>>>>>>>             xl pci-assignable-add 0000:01:00.0
>>>>>>>      • Start the guest. The network interface should appear as 
>>>>>>> 00:00.0  in the guest and be usable.
>>>>>>>   Please let me know if you need more info.
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> Regards,
>>>>>>> Rahul
>>>>>>>
>>>>>> Thank you for your reply.
>>>>>> After setting XEN and kernel as above, I tried the following two 
>>>>>> methods to add a PCIE device passthrough:
>>>>>> 1. According to your suggestion, use the command xl 
>>>>>> pci-assignable-add 0002:21:00.0 to set in the Dom0. But in function
>>>>>> iommu_do_pci_domctl,  after device_assigned is called, ENODEV 
>>>>>> error is obtained.
>>>>>> 2. Add xen-pciback.hide=(0002:21:00.0) to dom0-bootargs in the 
>>>>>> device tree, I encountered the same problem as before
>>>>>> when initializing the kernel. In function pci_add_device, PCIE 
>>>>>> devices cannot be added to SMMUv3.
>>>>> It is hard to find what is happening without logs. Could you please 
>>>>> share the Xen and Linux boot logs so that I can
>>>>> check what is the root cause of this issue.
>>>>>
>>>>>> The kernel version I use is 5.10. Does this have an impact?
>>>>> I am using the Linux version 5.15.44 but I don’t think is because 
>>>>> of Linux.
>>>>>
>>>>> Regards,
>>>>> Rahul
>>>> The attachment is a log file. I have to delete some content that may 
>>>> involve commercial. Please forgive me.
>>>>
>>>> In addition, I have forgotten to tell you a very important 
>>>> information. The PCIE controller used on my board
>>>> is DesignWare. I referred to the code of ECAM under XEN and added 
>>>> some support related to DesignWare
>>>> (DBI space mapping and PCIE read/write).
>>>>
>> The kernel.log file is from Dom0 boot. The PCIE device I trying to 
>> assign to domU is working fine in dom0.
>>> What I understood from the logs is you shared the logs for domU boot. 
>>> Could you please confirm that dom0 booted
>>> fine with the PCI passthrough branch and the PCI device you trying to 
>>> assign to domU is working fine in dom0.
>>>
>>> In that case we can confirm that code you added to support DesignWare 
>>> PCIE controller is fine.
>>>
>>>> In addition, if needed ,I can pre initialized PCIE controller in the 
>>>> uboot stage, so  I can scan the PCIE device
>>>> in the uboot command line.
>>
>>
> The reason for Data Abort is that the DomU uses the PCIE driver of the 
> ecam instead of the PCIE frontend.
> At present, PCIE frontend only supports x86. I'll try to migrate to ARM.

The PV PCI frontend will not be used on Arm. Instead, we will use an 
emulated ECAM hostbridge in Xen. This will avoid extra modification in 
the guest OS to use PCI passthrough.

So you want to understand why you receive a data abort when accessing 
the ECAM. If it is not done yet, can you enable CONFIG_DEBUG=y in Xen 
and post the logs around the data abort?

Similarly, can you post the log from your guest?

Cheers,

-- 
Julien Grall

