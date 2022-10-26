Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD5260E245
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 15:37:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430584.682435 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongaF-00073B-SW; Wed, 26 Oct 2022 13:36:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430584.682435; Wed, 26 Oct 2022 13:36:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ongaF-000713-PV; Wed, 26 Oct 2022 13:36:39 +0000
Received: by outflank-mailman (input) for mailman id 430584;
 Wed, 26 Oct 2022 13:36:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ongaE-00070x-Fa
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 13:36:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ongaE-0003mA-36; Wed, 26 Oct 2022 13:36:38 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.28.184]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ongaD-0005iI-S2; Wed, 26 Oct 2022 13:36:38 +0000
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
	bh=98F6bgrjz7sIeL9FPPRZjNKw97p6xD7EaVybNoD0hmI=; b=yxKhq42WtteIzmJDJSuwsxMXKd
	28vDZ88KQT/DyquAwtrS5IDeGhi1lekcl9Fo9uJzQMrUmGS8JX0RZhF2Ysbr7Tbjd+vaL78o51mgn
	2qemw2aqPOTZMm14kxgUofCaZUOetmjOk1+f1eZ2dOlGCo6FeIBQxKO67WNVws+/T1Ko=;
Message-ID: <75b7665f-66aa-2e11-35a0-edf20a9c0139@xen.org>
Date: Wed, 26 Oct 2022 14:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: Proposal for virtual IOMMU binding b/w vIOMMU and passthrough
 devices
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DD70007C-300F-44D3-B314-A5F8C4582CD3@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 26/10/2022 14:17, Rahul Singh wrote:
> Hi All,

Hi Rahul,

> At Arm, we started to implement the POC to support 2 levels of page tables/nested translation in SMMUv3.
> To support nested translation for guest OS Xen needs to expose the virtual IOMMU. If we passthrough the
> device to the guest that is behind an IOMMU and virtual IOMMU is enabled for the guest there is a need to
> add IOMMU binding for the device in the passthrough node as per [1]. This email is to get an agreement on
> how to add the IOMMU binding for guest OS.
> 
> Before I will explain how to add the IOMMU binding let me give a brief overview of how we will add support for virtual
> IOMMU on Arm. In order to implement virtual IOMMU Xen need SMMUv3 Nested translation support. SMMUv3 hardware
> supports two stages of translation. Each stage of translation can be independently enabled. An incoming address is logically
> translated from VA to IPA in stage 1, then the IPA is input to stage 2 which translates the IPA to the output PA. Stage 1 is
> intended to be used by a software entity( Guest OS) to provide isolation or translation to buffers within the entity, for example,
> DMA isolation within an OS. Stage 2 is intended to be available in systems supporting the Virtualization Extensions and is
> intended to virtualize device DMA to guest VM address spaces. When both stage 1 and stage 2 are enabled, the translation
> configuration is called nesting.
> 
> Stage 1 translation support is required to provide isolation between different devices within the guest OS. XEN already supports
> Stage 2 translation but there is no support for Stage 1 translation for guests. We will add support for guests to configure
> the Stage 1 transition via virtual IOMMU. XEN will emulate the SMMU hardware and exposes the virtual SMMU to the guest.
> Guest can use the native SMMU driver to configure the stage 1 translation. When the guest configures the SMMU for Stage 1,
> XEN will trap the access and configure the hardware accordingly.
> 
> Now back to the question of how we can add the IOMMU binding between the virtual IOMMU and the master devices so that
> guests can configure the IOMMU correctly. The solution that I am suggesting is as below:
> 
> For dom0, while handling the DT node(handle_node()) Xen will replace the phandle in the "iommus" property with the virtual
> IOMMU node phandle.
Below, you said that each IOMMUs may have a different ID space. So 
shouldn't we expose one vIOMMU per pIOMMU? If not, how do you expect the 
user to specify the mapping?

> 
> For domU guests, when passthrough the device to the guest as per [2],  add the below property in the partial device tree
> node that is required to describe the generic device tree binding for IOMMUs and their master(s)
> 
> "iommus = < &magic_phandle 0xvMasterID>
> 	• magic_phandle will be the phandle ( vIOMMU phandle in xl)  that will be documented so that the user can set that in partial DT node (0xfdea).

Does this mean only one IOMMU will be supported in the guest?

> 	• vMasterID will be the virtual master ID that the user will provide.
> 
> The partial device tree will look like this:
> /dts-v1/;
>   
> / {
>      /* #*cells are here to keep DTC happy */
>      #address-cells = <2>;
>      #size-cells = <2>;
>   
>      aliases {
>          net = &mac0;
>      };
>   
>      passthrough {
>          compatible = "simple-bus";
>          ranges;
>          #address-cells = <2>;
>          #size-cells = <2>;
>          mac0: ethernet@10000000 {
>              compatible = "calxeda,hb-xgmac";
>              reg = <0 0x10000000 0 0x1000>;
>              interrupts = <0 80 4  0 81 4  0 82 4>;
>             iommus = <0xfdea 0x01>;
>          };
>      };
> };
>   
> In xl.cfg we need to define a new option to inform Xen about vMasterId to pMasterId mapping and to which IOMMU device this
> the master device is connected so that Xen can configure the right IOMMU. This is required if the system has devices that have
> the same master ID but behind a different IOMMU.

In xl.cfg, we already pass the device-tree node path to passthrough. So 
Xen should already have all the information about the IOMMU and 
Master-ID. So it doesn't seem necessary for Device-Tree.

For ACPI, I would have expected the information to be found in the IOREQ.

So can you add more context why this is necessary for everyone?

>   
> iommu_devid_map = [ “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS” , “PMASTER_ID[@VMASTER_ID],IOMMU_BASE_ADDRESS”]
> 
> 	• PMASTER_ID is the physical master ID of the device from the physical DT.
> 	• VMASTER_ID is the virtual master Id that the user will configure in the partial device tree.
> 	• IOMMU_BASE_ADDRESS is the base address of the physical IOMMU device to which this device is connected.

Below you give an example for Platform device. How would that fit in the 
context of PCI passthrough?

>   
> Example: Let's say the user wants to assign the below physical device in DT to the guest.
>   
> iommu@4f000000 {
>                  compatible = "arm,smmu-v3";
>               	interrupts = <0x00 0xe4 0xf04>;
>                  interrupt-parent = <0x01>;
>                  #iommu-cells = <0x01>;
>                  interrupt-names = "combined";
>                  reg = <0x00 0x4f000000 0x00 0x40000>;
>                  phandle = <0xfdeb>;
>                  name = "iommu";
> };

So I guess this node will be written by Xen. How will you the case where 
there are extra property to added (e.g. dma-coherent)?

>   
> test@10000000 {
> 	compatible = "viommu-test”;
> 	iommus = <0xfdeb 0x10>;

I am a bit confused. Here you use 0xfdeb for the phandle but below...

> 	interrupts = <0x00 0xff 0x04>;
> 	reg = <0x00 0x10000000 0x00 0x1000>;
> 	name = "viommu-test";
> };
>   
> The partial Device tree node will be like this:
>   
> / {
>      /* #*cells are here to keep DTC happy */
>      #address-cells = <2>;
>      #size-cells = <2>;
>   
>      passthrough {
>          compatible = "simple-bus";
>          ranges;
>          #address-cells = <2>;
>          #size-cells = <2>;
> 
> 	test@10000000 {
>              	compatible = "viommu-test";
>              	reg = <0 0x10000000 0 0x1000>;
>              	interrupts = <0 80 4  0 81 4  0 82 4>;
>              	iommus = <0xfdea 0x01>;

... you use 0xfdea. Does this mean 'xl' will rewrite the phandle?

>          };
>      };
> };
>   
>   iommu_devid_map = [ “0x10@0x01,0x4f000000”]
> 	• 0x10 is the real physical master id from the physical DT.
> 	• 0x01 is the virtual master Id that the user defines as a partial device tree.
> 	• 0x4f000000 is the base address of the IOMMU device.

Cheers,

-- 
Julien Grall

