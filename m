Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 648B93E7D44
	for <lists+xen-devel@lfdr.de>; Tue, 10 Aug 2021 18:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165423.302289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDUQw-000095-QY; Tue, 10 Aug 2021 16:16:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165423.302289; Tue, 10 Aug 2021 16:16:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDUQw-00005n-Mc; Tue, 10 Aug 2021 16:16:54 +0000
Received: by outflank-mailman (input) for mailman id 165423;
 Tue, 10 Aug 2021 16:16:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mDUQu-00005f-D9
 for xen-devel@lists.xenproject.org; Tue, 10 Aug 2021 16:16:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDUQt-0001LV-Ap; Tue, 10 Aug 2021 16:16:51 +0000
Received: from [54.239.6.184] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mDUQt-0002fr-4A; Tue, 10 Aug 2021 16:16:51 +0000
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
	bh=C6sFonpPeCIvhGKFsRDlTl8vzERYo0lkY63jvdTn7Ns=; b=Cv3UqnJ413Kd1/RAVmS6l7BKUf
	3kvO9bkX/nZJSXZ/BDuEcICjymVc0/o0QbQleSzrv1PotSR26CjyrYVjrRT3CREUaHwAxSlcJ554b
	Mn836NVxWjz5nFr78Mj9YXr19JZztrJm4vsvJ5vElnD4aqKlSbQJzLfFYxEkA4ghBM6A=;
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
From: Julien Grall <julien@xen.org>
Message-ID: <060b5741-922c-115c-7e8c-97d8aa5f46f4@xen.org>
Date: Tue, 10 Aug 2021 17:16:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <AM7PR03MB6593B4461B99297C8650CF1C85F79@AM7PR03MB6593.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 10/08/2021 16:38, Roman Skakun wrote:
> Hi, Stefano!

Hi,

> I have observed your patch here:
> https://patchwork.kernel.org/project/xen-devel/patch/alpine.DEB.2.21.2102161333090.3234@sstabellini-ThinkPad-T480s/
> 
> And I collided with the same issue, when Dom0 device trying to use
> swiotlb fops for devices which are controlled by IOMMU.

The issue Stefano reported was when the dom0 is not direct mapped. 
However...

> 
> Prerequisites:
> https://github.com/xen-project/xen/tree/stable-4.15

... if you are really using 4.15, then the domain will always be direct 
mapped. So I think this is a different one.

> https://github.com/torvalds/linux/tree/v5.10

Any reason to not use the stable branch for 5.10? I don't know whether 
your issue will be fixed there, but the stable branch usually contains a 
lot of bug fixes (including security one). So it is a good idea to use 
it over the first release of a kernel version.

> Issue caused in xen_swiotlb_map_page():
> ```
>   dev: rcar-fcp, cap: 0, dma_mask: ffffffff, page: fffffe00180c7400, page_to_phys: 64b1d0000,
> xen_phys_to_dma(phys): 64b1d0000
> ```

I can't seem to find this printk in Linux 5.10. Did you add it yourself?

> 
> There is retrieved MFN(0x64b1d0000), which belongs to DomU. Dom0
> swiotlb couldn't proceed to this address and throws the log:
> 
> ```
> [   99.504990] rcar-fcp fea2f000.fcp: swiotlb buffer is full (sz: 3686400 bytes), total 32768 (slots), used 64 (slots)
> ```

This line suggests that the SWIOTLB tried to bounce the DMA buffer. In 
general, the use of the bounce buffer should be rare. So I would suggest 
to find out why this is used.

Looking at the code, this suggests that one of the following check is false:

         /*
          * If the address happens to be in the device's DMA window,
          * we can safely return the device addr and not worry about bounce
          * buffering it.
          */
         if (dma_capable(dev, dev_addr, size, true) &&
             !range_straddles_page_boundary(phys, size) &&
                 !xen_arch_need_swiotlb(dev, phys, dev_addr) &&
                 swiotlb_force != SWIOTLB_FORCE)
                 goto done;

> 
> Temporary, I resolved this issue by disabling swiotlb for dom0 at all
> because sure that all devices goes through IOMMU, but this mention can
> be true only for me.
> 
> But, I think of a more reliable way is to declare a special IOMMU
> property in xen dts for each device. If the device controlled by IOMMU
> not need to set swiotlb fops in arch_setup_dma_ops.
> What do you think about it?

Let me start with that I agree we should disable swiotlb when we know 
the device is protected. However, from what you describe, it sounds like 
the same issue would appear if the IOMMU was disabled.

Therefore, I think we should first find out why Linux wants to bounce 
the DMA buffer. Does your device have any DMA restriction?

Cheers,

-- 
Julien Grall

