Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 608D664D587
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 04:21:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462991.721079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5emk-000718-Rl; Thu, 15 Dec 2022 03:19:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462991.721079; Thu, 15 Dec 2022 03:19:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5emk-0006yq-Oq; Thu, 15 Dec 2022 03:19:50 +0000
Received: by outflank-mailman (input) for mailman id 462991;
 Thu, 15 Dec 2022 03:19:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=urv3=4N=zlw.email=sisyphean@srs-se1.protection.inumbo.net>)
 id 1p5emi-0006yi-NZ
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 03:19:49 +0000
Received: from mail.zlw.email (unknown [103.181.164.111])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4bb99ffd-7c27-11ed-8fd2-01056ac49cbb;
 Thu, 15 Dec 2022 04:19:44 +0100 (CET)
Received: from localhost (unknown [127.0.0.1])
 by mail.zlw.email (Postfix) with ESMTP id ECEA7174183;
 Thu, 15 Dec 2022 03:19:52 +0000 (UTC)
Received: from mail.zlw.email ([127.0.0.1])
 by localhost (mail.zlw.email [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bZAy-OM7TXjQ; Thu, 15 Dec 2022 11:19:46 +0800 (CST)
Received: from [192.168.66.233] (OpenWrt.lan [192.168.66.1])
 by mail.zlw.email (Postfix) with ESMTPSA id 16475174169;
 Thu, 15 Dec 2022 11:19:45 +0800 (CST)
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
X-Inumbo-ID: 4bb99ffd-7c27-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=zlw.email; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:references:to:from:from:content-language:subject:subject
	:user-agent:mime-version:date:date:message-id; s=dkim; t=
	1671074386; x=1673666387; bh=mqAJqMuSwym8RSpQzzA8NCvzBOyV6x6TAZz
	eSczqg7U=; b=gz3siLL5DDl0GAkNp8sB6j3SzRasWS5z1WvW6Gf+EsCi38PHcRD
	SP5CrRq+ETl/pVXcd5kx9NSs882UEP4U7WU0+bR3vqyTUCwdkx42XvG3yhir6Z+x
	1hOIPjJWP3hC8m9D7SA2g4Rq5SB7At9I5j2Hl6ADEBT6U+2MlhodBcDc=
X-Virus-Scanned: amavisd-new at zlw.email
Message-ID: <eec8c135-b2b6-09cf-3786-8c57723a92d4@zlw.email>
Date: Thu, 15 Dec 2022 11:19:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [BUG]Add PCIE devie to SMMUv3 fail
Content-Language: en-US
From: sisyphean <sisyphean@zlw.email>
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <793eb471-e68b-c3ff-52e8-20d77252c0bf@zlw.email>
 <A9FCD688-3CA2-484A-ADC1-F1235F18890F@arm.com>
 <75bbfc8c-b89f-9478-63af-c37fda0ad3c0@zlw.email>
 <5BCFEC7E-85B6-4464-A2B1-EA08C6E2EB20@arm.com>
 <340463d2-528e-848f-0ec2-a4cc7ba04399@zlw.email>
 <9478D04C-9BD6-44C1-ADBD-EAA688897811@arm.com>
 <d0f62d31-5673-e804-6e38-6e552989f249@zlw.email>
In-Reply-To: <d0f62d31-5673-e804-6e38-6e552989f249@zlw.email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2022/12/15 09:30, sisyphean 写道:
> Hi,
>
> 在 2022/12/14 21:05, Rahul Singh 写道:
>> Hi Sisphean,
>>
>>> On 13 Dec 2022, at 1:18 am, sisyphean <sisyphean@zlw.email> wrote:
>>>
>>> Hi,
>>>
>>> 在 2022/12/13 00:30, Rahul Singh 写道:
>>>> Hi Sisyphean,
>>>>
>>>>> On 12 Dec 2022, at 5:49 am, sisyphean <sisyphean@zlw.email> wrote:
>>>>>
>>>>> Hi,
>>>>> 在 2022/12/9 17:50, Rahul Singh 写道:
>>>>>> Hi Sisyphean,
>>>>>>
>>>>>>> On 9 Dec 2022, at 6:15 am, sisyphean <sisyphean@zlw.email> wrote:
>>>>>>>
>>>>>>> Hi,
>>>>>>>
>>>>>>> I try to run XEN on my ARM board(Sorry, for some commercial 
>>>>>>> reasons, I can't tell you
>>>>>>> on which platform I run XEN)  and add PCIE device passthrough to 
>>>>>>> DomU.But an error
>>>>>>> occurred while adding the PCIE device to SMMUv3.
>>>>>> PCI passthrough support is not fully upstream to Xen on ARM. We 
>>>>>> have working
>>>>>> PCI passthrough branch that you can use to test it.
>>>>>>
>>>>>> https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough 
>>>>>>
>>>>>>
>>>>>>> Through reading the code and tracing debugging, the error is 
>>>>>>> found in the function
>>>>>>> arm_smmu_add_device, which will obtain and determine whether the 
>>>>>>> fwspec of the
>>>>>>> device to be added to SMMU exists.But for the XEN of arm, the 
>>>>>>> fwspec of the device is
>>>>>>> created and added by judging whether the iommu field exists in 
>>>>>>> the device node when
>>>>>>> XEN parses the device tree.However, the PCIE device does not 
>>>>>>> appear in the device tree,
>>>>>>> so there will be no fwspec for all PCIE devices. When attempting 
>>>>>>> to add a PCIE device to
>>>>>>> SMMU, a ENODEV error will be returned.
>>>>>> As of now Xen doesn’t support to add PCI device to IOMMU on ARM.
>>>>>>> In addition, the code at xen/drivers/passthrough/pci.c also 
>>>>>>> verifies the above view.
>>>>>>> For PCIE devices, pdev is alloc in function pci_add_device by 
>>>>>>> alloc_pdev.However,
>>>>>>> the function alloc_pdev does not create and add fwspec to the 
>>>>>>> PCIE device.Therefore,
>>>>>>> when function pci_add_device executes to iommu_add_device,it 
>>>>>>> will get the error
>>>>>>> return of ENODEV.
>>>>>>>
>>>>>>> How can I resolve the above errors?
>>>>>> If you want to test the PCI passthrough please follow below steps.
>>>>>>
>>>>>> Xen setup:
>>>>>>      • A checkout of the “integration/pci-passthrough” branch 
>>>>>> from the  gitlab 
>>>>>> https://gitlab.com/xen-project/fusa/xen-integration/-/commits/integration/pci-passthrough
>>>>>>      • Pass iommu=yes  and pci-passthrough=on to Xen command line 
>>>>>> to enable PCI passthrough.
>>>>>>
>>>>>>   Linux Kernel setup:
>>>>>>        • Some changes are required for the kernel to work with 
>>>>>> PCI passthrough. First are some configuration options, enable 
>>>>>> them in kernel config.
>>>>>>           CONFIG_XEN=y
>>>>>>           CONFIG_XEN_BACKEND=y
>>>>>>           CONFIG_XEN_PCIDEV_BACKEND=y
>>>>>>      • Then a patch needs to be applied for enabling the pciback 
>>>>>> driver. Patch is attached in this email.
>>>>>>   Using PCI passthrough:
>>>>>>        • In order to pass a device to a guest, you first need its 
>>>>>> PCI address(SBDF). You can either get it from a bare-metal
>>>>>>        Linux running on the platform or by having pciutils  
>>>>>> installed (if you are using a yocto-based dom0 or have apt 
>>>>>> available), which provides lspci.
>>>>>>         For example, let's pass one ethernet interface to the 
>>>>>> guest. Running lspci gives us this output (truncated) :
>>>>>>         0000:00:00.0 Host bridge: Ampere Computing, LLC Device e100
>>>>>>         0000:00:01.0 PCI bridge: Ampere Computing, LLC Device 
>>>>>> e101 (rev 04)
>>>>>>         0000:01:00.0 Ethernet controller: Intel Corporation 
>>>>>> Ethernet Controller X710/X557-AT 10GBASE-T (rev 01)
>>>>>>                 [...]
>>>>>>         We will pass one of the ethernet from the PCI network 
>>>>>> card : 0000:01:00.0 .
>>>>>>        • Add the following line to the guest configuration file :
>>>>>>            pci = ['0000:01:00.0']
>>>>>>        • Run the following command before starting the guest :
>>>>>>             xl pci-assignable-add 0000:01:00.0
>>>>>>      • Start the guest. The network interface should appear as 
>>>>>> 00:00.0  in the guest and be usable.
>>>>>>   Please let me know if you need more info.
>>>>>>
>>>>>>
>>>>>>
>>>>>> Regards,
>>>>>> Rahul
>>>>>>
>>>>> Thank you for your reply.
>>>>> After setting XEN and kernel as above, I tried the following two 
>>>>> methods to add a PCIE device passthrough:
>>>>> 1. According to your suggestion, use the command xl 
>>>>> pci-assignable-add 0002:21:00.0 to set in the Dom0. But in function
>>>>> iommu_do_pci_domctl,  after device_assigned is called, ENODEV 
>>>>> error is obtained.
>>>>> 2. Add xen-pciback.hide=(0002:21:00.0) to dom0-bootargs in the 
>>>>> device tree, I encountered the same problem as before
>>>>> when initializing the kernel. In function pci_add_device, PCIE 
>>>>> devices cannot be added to SMMUv3.
>>>> It is hard to find what is happening without logs. Could you please 
>>>> share the Xen and Linux boot logs so that I can
>>>> check what is the root cause of this issue.
>>>>
>>>>> The kernel version I use is 5.10. Does this have an impact?
>>>> I am using the Linux version 5.15.44 but I don’t think is because 
>>>> of Linux.
>>>>
>>>> Regards,
>>>> Rahul
>>> The attachment is a log file. I have to delete some content that may 
>>> involve commercial. Please forgive me.
>>>
>>> In addition, I have forgotten to tell you a very important 
>>> information. The PCIE controller used on my board
>>> is DesignWare. I referred to the code of ECAM under XEN and added 
>>> some support related to DesignWare
>>> (DBI space mapping and PCIE read/write).
>>>
> The kernel.log file is from Dom0 boot. The PCIE device I trying to 
> assign to domU is working fine in dom0.
>> What I understood from the logs is you shared the logs for domU boot. 
>> Could you please confirm that dom0 booted
>> fine with the PCI passthrough branch and the PCI device you trying to 
>> assign to domU is working fine in dom0.
>>
>> In that case we can confirm that code you added to support DesignWare 
>> PCIE controller is fine.
>>
>>> In addition, if needed ,I can pre initialized PCIE controller in the 
>>> uboot stage, so  I can scan the PCIE device
>>> in the uboot command line.
>
>
> In order to verify my previous conjecture (there is no fwspec for the 
> PCIE device,
> which makes it impossible to passthrough), I used the following code 
> to test.
> The result is that the PCIE device can passthrough to the DomU, but 
> the DomU kernel
> appears Data Abort when trying to read the PCIE device. This may be 
> because I directly add
> the fwspec of the PCIE controller to the PCIE device, which leads to 
> memory mapping problems.
>
> diff --git a/xen/drivers/passthrough/device_tree.c 
> b/xen/drivers/passthrough/device_tree.c
> index 98f2aa0..28283d2 100644
> --- a/xen/drivers/passthrough/device_tree.c
> +++ b/xen/drivers/passthrough/device_tree.c
> @@ -127,6 +127,7 @@ int iommu_release_dt_devices(struct domain *d)
>      return 0;
>  }
>
> +struct device *smmu_dev_for_test;
>  int iommu_add_dt_device(struct dt_device_node *np)
>  {
>      const struct iommu_ops *ops = iommu_get_ops();
> @@ -167,7 +168,8 @@ int iommu_add_dt_device(struct dt_device_node *np)
>          rc = iommu_fwspec_init(dev, &iommu_spec.np->dev);
>          if ( rc )
>              break;
> -
> +        else
> +            smmu_dev_for_test = &iommu_spec.np->dev;
>          /*
>           * Provide DT IOMMU specifier which describes the IOMMU master
>           * interfaces of that device (device IDs, etc) to the driver.
>
>
> diff --git a/xen/drivers/passthrough/pci.c 
> b/xen/drivers/passthrough/pci.c
> index da4ecda..cf8a099 100644
> --- a/xen/drivers/passthrough/pci.c
> +++ b/xen/drivers/passthrough/pci.c
> @@ -1316,6 +1316,8 @@ static int __init setup_dump_pcidevs(void)
>  }
>  __initcall(setup_dump_pcidevs);
>
> +extern int iommu_fwspec_init(struct device *dev, struct device 
> *iommu_dev);
> +extern struct device *smmu_dev_for_test;;
>  static int iommu_add_device(struct pci_dev *pdev)
>  {
>      const struct domain_iommu *hd;
> @@ -1331,6 +1333,10 @@ static int iommu_add_device(struct pci_dev *pdev)
>      if ( !is_iommu_enabled(pdev->domain) )
>          return 0;
>
> +    if (pdev->bus != 0x20)
> +    {
> +        iommu_fwspec_init(pci_to_dev(pdev), smmu_dev_for_test);
> +    }
>      rc = hd->platform_ops->add_device(pdev->devfn, pci_to_dev(pdev));
>      if ( rc || !pdev->phantom_stride )
>          return rc;
> @@ -1401,6 +1407,7 @@ static int device_assigned(u16 seg, u8 bus, u8 
> devfn)
>
>      ASSERT(pcidevs_locked());
>      pdev = pci_get_pdev(seg, bus, devfn);
> +    printk("%s:%p,%p,%p\n",__FUNCTION__, pdev->domain, 
> hardware_domain, dom_io);
>
>      if ( !pdev )
>          rc = -ENODEV;
>
The pci-passthrough  branch is xen-4.17-unstable, the xen tools does not 
work properly.
I can't use xl create command to create DomU. After the command is 
executed, it seems
to be suspended, and the kernel and terminal have no output.

> I will test the use of pci-passthrough  branch to verify the PCIE 
> passthrough function
>
>> Yes, we can try that and use the below branch to check if it works. 
>> Below branch supports to add PCI device
>>   during Xen boot as compared to previous branch where Linux inform 
>> Xen to add PCI devices.
>>
>> You need to add "pci-scan=on” in Xen command line to add PCI devices 
>> during Xen boot.
>>
>> https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/tree/poc/pci-passthrough 
>>
>>
>> Regards,
>> Rahul
>
> Cheers,
> -- 
> Sisyphean
>

