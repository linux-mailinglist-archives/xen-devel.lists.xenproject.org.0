Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305C2740AF7
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 10:16:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556352.868810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQKI-0007Yg-24; Wed, 28 Jun 2023 08:14:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556352.868810; Wed, 28 Jun 2023 08:14:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEQKH-0007W7-VO; Wed, 28 Jun 2023 08:14:57 +0000
Received: by outflank-mailman (input) for mailman id 556352;
 Wed, 28 Jun 2023 08:14:56 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qEQKG-0007W1-4b
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 08:14:56 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEQKE-0004n7-G5; Wed, 28 Jun 2023 08:14:54 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qEQKE-0003sh-9p; Wed, 28 Jun 2023 08:14:54 +0000
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
	bh=aZuHNlETlWi5/9MaP1VGmdktDM8z7JBZrXhEMNTRI94=; b=ctRTqj6eCwCVjVXeXnBpqEvKN+
	ae/wII85kIgt4cmLeWgvPgLIzeCNT0EsFSrMfkwqjd4jxY3Ji9SPLFZqu2YN33Tf2V12IJk0MPZXg
	TjuCLdTolesYL1RVjTIu6+yg68iA7RRdwh53wea6F72YDcBWdx9QgMoU6QTcy/77PaxM=;
Message-ID: <2731b06d-4a54-f51c-2285-ea2cf1fac3ba@xen.org>
Date: Wed, 28 Jun 2023 09:14:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v4 0/7] SMMU handling for PCIe Passthrough on ARM
Content-Language: en-US
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20230607030220.22698-1-stewart.hildebrand@amd.com>
 <1f5aa53c-a9ed-41c3-2a4d-38538912cdd5@xen.org>
 <4b08b38e-3beb-6b72-83fb-6dd8c8702718@amd.com>
 <5f0b5a38-710f-f820-1dc7-345ae16047ad@xen.org>
 <CEDEAB6E-3790-476C-A260-F0AFDD863116@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CEDEAB6E-3790-476C-A260-F0AFDD863116@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Rahul,

On 25/06/2023 15:28, Rahul Singh wrote:
>> On 25 Jun 2023, at 1:56 pm, Julien Grall <julien@xen.org> wrote:
>> On 15/06/2023 22:05, Stewart Hildebrand wrote:
>>> On 6/7/23 03:19, Julien Grall wrote:
>>>> On 07/06/2023 04:02, Stewart Hildebrand wrote:
>>>>> This series introduces SMMU handling for PCIe passthrough on ARM. These patches
>>>>> are independent from (and don't depend on) the vPCI reference counting/locking
>>>>> work in progress, and should be able to be upstreamed independently.
>>>>
>>>> Can you clarify how this code was tested? Does this require code not yet
>>>> upstreamed?
>>> I'm testing the series standalone (+ config changes) by using a PCI device in dom0, and also in combination with the vPCI series [3] [4] for passthrough to a domU.
>>> Here are some more details on the test cases I'm using.
>>
>> Thanks that's helpful! One comment about the first test case.
>>
>>> 1. Using the PCI device in dom0 with the pci-passthrough=yes arg. In this case a couple of additional config changes [1] [2] are needed to select CONFIG_HAS_PCI=y, CONFIG_HAS_VPCI=y, and make has_vpci() return true. Aside from this series itself and the config changes, nothing else not-yet-upstreamed is required for this test case. It is on my TODO list to upstream these config changes, which I think will be useful on their own, not necessarily as part of any other series.
>>
>> I find a bit confusing that the IOMMU support for dom0 is gated behind 'pci-passthrough'. I was expecting that the iommu would also be properly configured for PCI if we using 'iommu=yes'.
> 
> As per my understanding Xen can configure the iommus for PCI device without "pci-passthrough” enabled
> if we follow below path:
> 
>     1) PCI host bridge is already enumerated and powered on in firmware before Xen boot
>     2) PCI devices are scanned in Xen.
>         (https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/commit/bce463e1588a45e1bfdf59fc0d5f88b16604e439)
>     3) After scanning the PCI devices add PCI devices to iommu ( iommu_add_device() )
> 
> If PCI host bridge is not enumerated then we need "pci-passthrough” enabled to allow Linux to do
> enumeration and to inform Xen via PHYSDEVOP_pci_device_add hyper call to add PCI devices in Xen
> This is implemented as part of PCI passthrough feature.
Right, but selecting "pci-passthrough" to be able to use the IOMMU in 
dom0 is confusing. We already support PCI in dom0 and adding the support 
(IOMMU + PCI) has no relation with assigning a device to the guest. IOW 
one may want to use IOMMU in dom0 without assigning devices to the guest.

I think part of the code gated by "pci-passthrough" should also be 
available when the IOMMU is enabled. This would allow users to use IOMMU 
+ PCI in dom0 without any extra patches and/or command line option.

Cheers,

-- 
Julien Grall

