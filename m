Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FC7313E06
	for <lists+xen-devel@lfdr.de>; Mon,  8 Feb 2021 19:50:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83033.153737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Bb9-0002b9-NT; Mon, 08 Feb 2021 18:49:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83033.153737; Mon, 08 Feb 2021 18:49:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9Bb9-0002aj-KT; Mon, 08 Feb 2021 18:49:23 +0000
Received: by outflank-mailman (input) for mailman id 83033;
 Mon, 08 Feb 2021 18:49:21 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9Bb7-0002ae-QT
 for xen-devel@lists.xenproject.org; Mon, 08 Feb 2021 18:49:21 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9Bb7-00023V-EX; Mon, 08 Feb 2021 18:49:21 +0000
Received: from [54.239.6.177] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9Bb7-0003uw-78; Mon, 08 Feb 2021 18:49:21 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=uoF8bUpJutlkFjnTMxiVf+Z7Q1WnD2lsQYRfAefm6VM=; b=KoxPTe+VS95MxpSvL31HtYeA9n
	4NzeCjdzwVYST6K7zFeE4uzgrrcqp8DSVDP0dGMhvvLPQ1cM2SINwU7LYY+TozxltwDVWN55Tqma9
	PbB7tIB4O7BFk8UzfE0rOuwyjROkJcptXTCYLnFgL86tkE3FuTa+UgexdFlBGgqx0YwQ=;
Subject: Re: [PATCH] xen/arm: fix gnttab_need_iommu_mapping
To: Rahul Singh <Rahul.Singh@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 "lucmiccio@gmail.com" <lucmiccio@gmail.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <alpine.DEB.2.21.2102051604320.29047@sstabellini-ThinkPad-T480s>
 <C36DCA9F-1212-4385-AE66-7D41C586A313@arm.com>
 <7e963696-a21f-4c79-5f35-a342982bee86@xen.org>
 <3EEEACBE-2028-4DE9-A3BD-053FF82CFC75@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bc7c3b13-88da-691f-8094-75502f06e882@xen.org>
Date: Mon, 8 Feb 2021 18:49:19 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <3EEEACBE-2028-4DE9-A3BD-053FF82CFC75@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 08/02/2021 18:19, Rahul Singh wrote:
> Hello Julien,

Hi Rahul,

> 
>> On 8 Feb 2021, at 6:11 pm, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 08/02/2021 18:06, Rahul Singh wrote:
>>>> On 6 Feb 2021, at 12:38 am, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>>
>>>> Commit 91d4eca7add broke gnttab_need_iommu_mapping on ARM.
>>>> The offending chunk is:
>>>>
>>>> #define gnttab_need_iommu_mapping(d)                    \
>>>> -    (is_domain_direct_mapped(d) && need_iommu(d))
>>>> +    (is_domain_direct_mapped(d) && need_iommu_pt_sync(d))
>>>>
>>>> On ARM we need gnttab_need_iommu_mapping to be true for dom0 when it is
>>>> directly mapped, like the old check did, but the new check is always
>>>> false.
>>>>
>>>> In fact, need_iommu_pt_sync is defined as dom_iommu(d)->need_sync and
>>>> need_sync is set as:
>>>>
>>>>     if ( !is_hardware_domain(d) || iommu_hwdom_strict )
>>>>         hd->need_sync = !iommu_use_hap_pt(d);
>>>>
>>>> iommu_hwdom_strict is actually supposed to be ignored on ARM, see the
>>>> definition in docs/misc/xen-command-line.pandoc:
>>>>
>>>>     This option is hardwired to true for x86 PVH dom0's (as RAM belonging to
>>>>     other domains in the system don't live in a compatible address space), and
>>>>     is ignored for ARM.
>>>>
>>>> But aside from that, the issue is that iommu_use_hap_pt(d) is true,
>>>> hence, hd->need_sync is false, and gnttab_need_iommu_mapping(d) is false
>>>> too.
>>>>
>>>> As a consequence, when using PV network from a domU on a system where
>>>> IOMMU is on from Dom0, I get:
>>>>
>>>> (XEN) smmu: /smmu@fd800000: Unhandled context fault: fsr=0x402, iova=0x8424cb148, fsynr=0xb0001, cb=0
>>>> [   68.290307] macb ff0e0000.ethernet eth0: DMA bus error: HRESP not OK
>>> I also observed the IOMMU fault when DOMU guest is created and great table is used when IOMMU is enabled. I fixed the error in different way but I am not sure if you also observing the same error. I submitted the patch to pci-passthrough integration branch. Please have a look once if that make sense.
>>
>> I belive this is the same error as Stefano has observed. However, your patch will unfortunately not work if you have a system with a mix of protected and non-protected DMA-capable devices.
> 
> Yes you are right thats what I though when I fixed the error but then I thought in different direction if IOMMU is enabled system wise every device should be protected by IOMMU.
I am not aware of any rule preventing a mix of protected and unprotected 
DMA-capable devices.

However, even if they are all protected by an IOMMU, some of the IOMMUs 
may have been disabled by the firmware tables for various reasons (e.g. 
performance, buggy SMMU...). For instance, this is the case on Juno 
where 2 out of 3 SMMUs are disabled in the Linux upstream DT.

As we don't know which device will use the grant for DMA, we always need 
to return the machine physical address.

Cheers,

-- 
Julien Grall

