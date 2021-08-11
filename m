Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E52E93E8E9D
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165684.302779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVL-0001OZ-Se; Wed, 11 Aug 2021 10:30:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165684.302779; Wed, 11 Aug 2021 10:30:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVL-0001M8-Ph; Wed, 11 Aug 2021 10:30:35 +0000
Received: by outflank-mailman (input) for mailman id 165684;
 Wed, 11 Aug 2021 10:30:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mDlVK-0001M2-9N
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:30:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDlVJ-0003IG-9k; Wed, 11 Aug 2021 10:30:33 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDlVJ-0002hp-3A; Wed, 11 Aug 2021 10:30:33 +0000
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
	bh=doX3rW6A7vyFUVbwpJR4jR128Hja/+6PxiGKxV8dehg=; b=Xj/saa4SV2Jd1OhiPMeqhGmw+W
	rcOwHYqLD++cnQJjaO2Nc9lkMxXJp75UGj1jakvkIDLXWMBKztIX/TDU4koi76QLx5EQ4TOAv2r85
	CHzZMMrtpxwbqwR42B1RMSLyGB4UbjW/UD4osielmf6pR6q5d5DqzxP+EBUYNuk8st9s=;
Subject: Re: Disable swiotlb for Dom0
To: Roman Skakun <Roman_Skakun@epam.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Roman Skakun <rm.skakun@gmail.com>, Jan Beulich <jbeulich@suse.com>
References: <AM7PR03MB6593B4461B99297C8650CF1C85F79@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org>
 <AM7PR03MB65932619505158E3930D8E8785F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <d616081a-8c60-dcda-ac54-58c5be0c21ce@xen.org>
Date: Wed, 11 Aug 2021 11:30:30 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <AM7PR03MB65932619505158E3930D8E8785F89@AM7PR03MB6593.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 11/08/2021 09:49, Roman Skakun wrote:
> Hi, Julien!

Hi Roman,

>> > I have observed your patch here:
>> >https://urldefense.com/v3/__https://patchwork.kernel.org/project/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad->>T480s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2B5XBqZlW$ <https://urldefense.com/v3/__https://patchwork.kernel.org/project/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad->T480s/__;!!GF_29dbcQIUBPA!kH5gzG1mxcIgDqMu2cVjTD3ggN9LiPN4OVinOnqrhLQrNr-mRb72udp2B5XBqZlW$>[patchwork[.]kernel[.]org]
>> >
>> > And I collided with the same issue, when Dom0 device trying to use
>> > swiotlb fops for devices which are controlled by IOMMU.
>>
>>The issue Stefano reported was when the dom0 is not direct mapped.
>>However...
> 
> I applied these patches:
> https://github.com/torvalds/linux/commit/f5079a9a2a31607a2343e544e9182ce35b030578 
> <https://github.com/torvalds/linux/commit/f5079a9a2a31607a2343e544e9182ce35b030578>
> https://github.com/xen-project/xen/commit/d66bf122c0ab79063a607d6cf68edf5e91d17d5e 
> <https://github.com/xen-project/xen/commit/d66bf122c0ab79063a607d6cf68edf5e91d17d5e>
> to check this more pragmatically.
> 
> Also, I added the log in xen_swiotlb_detect() and can see that swiotlb 
> still used (other devices within dom0 used too), when dom0 is direct mapped:
> 
> [    1.870363] xen_swiotlb_detect() dev: rcar-fcp, 
> XENFEAT_direct_mapped, use swiotlb
> [    1.878352] xen_swiotlb_detect() dev: rcar-fcp, 
> XENFEAT_direct_mapped, use swiotlb
> [    1.886309] xen_swiotlb_detect() dev: rcar-fcp, 
> XENFEAT_direct_mapped, use swiotlb
> 
> This means, that all devices are using swiotlb-xen DMA fops.
> By the way, before applying this patches, dom0 always used swiotlb-xen 
> fops for initial domain by design.

This is expected because your domain is direct mapped.

> 
> 
>> Any reason to not use  the stable branch for 5.10? I don't know whether
>> your issue will be  fixed there, but the stable branch usually contains a
>> lot of bug fixes (including  security one). So it is a good idea to use
>> it over the first release  of a kernel version.
> 
> Yes, sure, current BSP release based on 5.10 kernel:
> https://github.com/xen-troops/linux/tree/v5.10/rcar-5.0.0.rc4-xt0.1 
> <https://github.com/xen-troops/linux/tree/v5.10/rcar-5.0.0.rc4-xt0.1>
> based on https://github.com/renesas-rcar/linux-bsp 
> <https://github.com/renesas-rcar/linux-bsp/tree/v5.10.41/rcar-5.1.0.rc2>
> BTW, I specified the wrong kernel URL in the previous massage, sorry.
> 
>> > Issue caused in xen_swiotlb_map_page():
>> > ```
>> > dev: rcar-fcp, cap: 0, dma_mask: ffffffff, page: fffffe00180c7400, 
> page_to_phys: 64b1d0000,
>> > xen_phys_to_dma(phys): 64b1d0000
>> > ```
>>
>>I can't seem to find this printk in Linux 5.10. Did you add it yourself?
> 
> Yes, it's my own log.

Ok. Would you be able to provide more information on where the dom0 
memory is allocated and the list of host RAM?

> 
> 
>>This line suggests that the SWIOTLB tried to bounce the DMA buffer. In
>>general, the use of the bounce buffer should be rare. So I would suggest
>>to find out why this is used.
>>
>>Looking at the code, this suggests that one of the following check is false:
>>
>>/*
>>        * If the address happens to be in the device's DMA window,
>>* we can safely return the device addr and not worry about bounce
>>* buffering it.
>>*/
>>if (dma_capable(dev, dev_addr, size, true) &&
>>!range_straddles_page_boundary(phys, size) &&
>>!xen_arch_need_swiotlb(dev, phys, dev_addr) &&
>>swiotlb_force != SWIOTLB_FORCE)
>>goto done;
> 
> I checked this earlier and saw that dma_capable(dev, dev_addr, size, 
> true)returns false as expected because
> we got dev_addr equals 64b1d0000 and according to this expression under 
> dma_capable():
> 
> ```
> dma_addr_t end = dev_addr + size - 1;
> return end <= min_not_zero(*dev->dma_mask, dev->bus_dma_limit);
> ```
> As result, DMA mask more than 32bit.
>> Let me start with that I agree we should disable swiotlb when we know
>> the device is protected. However, from what you describe, it sounds like
>> the same issue would appear if the IOMMU was disabled.
> 
> Yes, it looks like a potential issue. This means that swiotlb should be 
> worked correctly, when it's needed, agreed.
> But this is also potential improvement, and I presented this idea to 
> discuss and create some patches.

You might be able to remove the Xen swiotlb but I am not sure you will 
be able to remove the swiotlb completely if you have a device that only 
supports 32-bit DMA.

> 
>> Therefore, I think we should first find out why Linux wants to bounce
>> the DMA buffer.
> 
> We retrieved dev_addr(64b1d0000) + size > 32bit mask, but fcp driver 
> wants to use only 32 bit boundary address, but that's consequence.

Ok. So your device is only capable to do a 32-bit DMA. Is that correct?

> I think, the main reason of using bounce buffer is MFN address, not DMA 
> phys address.

I don't understand this sentence. Can you clarify it?

Cheers,

-- 
Julien Grall

