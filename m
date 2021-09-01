Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 338AB3FD794
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 12:22:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176276.320766 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLNNh-0002uq-1d; Wed, 01 Sep 2021 10:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176276.320766; Wed, 01 Sep 2021 10:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLNNg-0002rG-UC; Wed, 01 Sep 2021 10:22:08 +0000
Received: by outflank-mailman (input) for mailman id 176276;
 Wed, 01 Sep 2021 10:22:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mLNNf-0002r8-NB
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 10:22:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLNNd-0007zX-Co; Wed, 01 Sep 2021 10:22:05 +0000
Received: from [54.239.6.187] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mLNNd-00061t-6E; Wed, 01 Sep 2021 10:22:05 +0000
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
	bh=J5xaLmys0DZR5B87YG9hJdaXxyVbpOBZsGEg/stJC60=; b=aWti9DinL7kqLdmR6/NApgKp90
	akIy4rqjEAA6OrkcRX7JHprBmlesV4muG2yJ6hbRBQ4aPKMbNZ7AKxSpd2UwAApU1egBJd8Y62MF7
	J7BDU2zgRpPJrppbGcUIofyclo98wzOG/T+zB5Wu6LiJIMeU67wEaW1SoLPXX/UkgFj0=;
Subject: Re: Disable IOMMU in Dom0
To: Roman Skakun <Roman_Skakun@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrii Anisov <Andrii_Anisov@epam.com>, Roman Skakun <rm.skakun@gmail.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
References: <AM7PR03MB65936E5D0B25567D1B2FAECA85CC9@AM7PR03MB6593.eurprd03.prod.outlook.com>
 <alpine.DEB.2.21.2108311444310.18862@sstabellini-ThinkPad-T480s>
 <AM7PR03MB659358C0EBA9D71AEEF7A60885CD9@AM7PR03MB6593.eurprd03.prod.outlook.com>
From: Julien Grall <julien@xen.org>
Message-ID: <179e4b7f-38d9-991d-3f99-64a74559986d@xen.org>
Date: Wed, 1 Sep 2021 11:22:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <AM7PR03MB659358C0EBA9D71AEEF7A60885CD9@AM7PR03MB6593.eurprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Roman

On 01/09/2021 10:59, Roman Skakun wrote:
>> If you have a setup  where Dom0 is not 1:1 mapped (which is not currently
>> possible with upstream  Xen but it is possible with cache coloring) and
>> uses the IOMMU to make  device DMA work like regular DomUs, then passing
>> XENFEAT_not_direct_mapped  to Linux would make it work. Without
>> XENFEAT_not_direct_mapped,  Linux would try to use swiotlb-xen which has
>> code that relies on  Linux being 1:1 mapped to work properly.
> 
> I'm using 1:1 Dom0.
> According to your patch series, xen-swiotlb fops will be applied for all 
> devices
> because XENFEAT_direct_mapped is active, as shown here:
> https://elixir.bootlin.com/linux/v5.14/source/arch/arm64/mm/dma-mapping.c#L56 
> <https://elixir.bootlin.com/linux/v5.14/source/arch/arm64/mm/dma-mapping.c#L56>
> 
> I agreed, that xen-swiotlb should work correctly, but in my case, I 
> retrieved MFN here:
> https://elixir.bootlin.com/linux/v5.14/source/drivers/xen/swiotlb-xen.c#L366 
> <https://elixir.bootlin.com/linux/v5.14/source/drivers/xen/swiotlb-xen.c#L366>
> which is greater than 32bit and xen-swiotlb tries to use bounce buffer 
> as expected.
> It can lead to decrease a performance because I have a long buffer ~4MB.
> 
> I thought, that we can disable swiotlb fops for devices which are 
> controlled by IOMMU.

Yes you can disable swiotlb for devices which are controlled by the 
IOMMU. But this will not make your problem disappear, it simply hides 
until it bites you in a more subttle way.

 From what you wrote, you have a 32-bit DMA capable. So you always need 
to have an address below 4GB. For foreign mapping, there is no guarantee 
the Guest Physical Address will actually be below 4GB.

Today, the ballooning code only ask Linux to steal *a* RAM page for 
mapping the foreign page. This may or may not be below 4GB depending on 
how you assigned the RAM to dom0 (IIRC you had some RAM above 4GB).

But that's the current behavior. One of your work colleague is looking 
at avoid to steal RAM page to avoid exhausting the memory. So foreign 
mapping may end up to be a lot higher in memory.

IOW, you will need to be able to bounce the DMA buffer for your device. 
If you want to avoid bouncing, the proper way would be to rework the 
ballonning code so pages are allocated below 4GB.

Cheers,

-- 
Julien Grall

