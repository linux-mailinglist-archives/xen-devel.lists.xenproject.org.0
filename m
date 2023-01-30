Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C7F6809C1
	for <lists+xen-devel@lfdr.de>; Mon, 30 Jan 2023 10:40:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486733.754170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQdk-0001rt-8Y; Mon, 30 Jan 2023 09:39:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486733.754170; Mon, 30 Jan 2023 09:39:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMQdk-0001qB-5k; Mon, 30 Jan 2023 09:39:52 +0000
Received: by outflank-mailman (input) for mailman id 486733;
 Mon, 30 Jan 2023 09:39:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pMQdi-0001q5-Hy
 for xen-devel@lists.xenproject.org; Mon, 30 Jan 2023 09:39:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMQdi-0004Ru-2X; Mon, 30 Jan 2023 09:39:50 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.10.117]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pMQdh-0000zo-RR; Mon, 30 Jan 2023 09:39:49 +0000
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
	bh=v6TdHBz16Es+9YR2QApBuXa/DHFCu0kf9+5sfD+y4J8=; b=ULxjKcAwb7ehfBM+ImRinZlyVO
	lgf8EoW+98D8IoN3FH5SFHfO7nwYkGHsddgE3OqcLMGQ492PK79Yr1985P+pEdTcRx/n8rFDSpHwZ
	k1Hw6WdXh+1mZPkHTDO35KByHukils11oq3hEzO5SBn2SIQa6fNnPUwB83D/S8W3yBtw=;
Message-ID: <3c915633-ddb8-d1e4-f42e-064aaff168b2@xen.org>
Date: Mon, 30 Jan 2023 09:39:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Chen <Wei.Chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
 <c30b4458-b5f6-f996-0c3c-220b18bfb356@xen.org>
 <AM0PR08MB453083B74DB1D00BDF469331F7D29@AM0PR08MB4530.eurprd08.prod.outlook.com>
 <7931e70f-3754-363c-28d8-5fde3198d70f@xen.org>
 <AM0PR08MB45308D5CD69EBB5FE85A4B88F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB45308D5CD69EBB5FE85A4B88F7D39@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 30/01/2023 05:45, Penny Zheng wrote:
>   There are three types of MPU regions during boot-time:
> 1. Fixed MPU region
> Regions like Xen text section, Xen heap section, etc.
> 2. Boot-only MPU region
> Regions like Xen init sections, etc. It will be removed at the end of booting.
> 3.   Regions need switching in/out during vcpu context switch
> Region like system device memory map.
> For example, for FVP_BaseR_AEMv8R, we have [0x80000000, 0xfffff000) as
> the whole system device memory map for Xen(idle vcpu) in EL2,  when
> context switching to guest vcpu, it shall be replaced with guest-specific
> device mapping, like vgic, vpl011, passthrough device, etc.
> 
> We don't have two mappings for different stage translations in MPU, like we had in MMU.
> Xen stage 1 EL2 mapping and stage 2 mapping are both sharing one MPU memory mapping(xen_mpumap)
> So to save the trouble of hunting down each switching regions in time-sensitive context switch, we
> must re-order xen_mpumap to keep fixed regions in the front, and switching ones in the heels of them.

 From my understanding, hunting down each switching regions would be a 
matter to loop over a bitmap. There will be a slight increase in the 
number of instructions executed, but I don't believe it will be noticeable.

> 
> In Patch Serie v1, I was adding MPU regions in sequence,  and I introduced a set of bitmaps to record the location of
> same type regions. At the end of booting, I need to *disable* MPU to do the reshuffling, as I can't
> move regions like xen heap while MPU on.
> 
> And we discussed that it is too risky to disable MPU, and you suggested [1]
> "
>> You should not need any reorg if you map the boot-only section towards in
>> the higher slot index (or just after the fixed ones).
> "

Right, looking at the new code. I realize that this was probably a bad 
idea because we are adding complexity in the assembly code.

> 
> Maybe in assembly, we know exactly how many fixed regions are, boot-only regions are, but in C codes, we parse FDT
> to get static configuration, like we don't know how many fixed regions for xen static heap is enough.
> Approximation is not suggested in MPU system with limited MPU regions, some platform may only have 16 MPU regions,
> IMHO, it is not worthy wasting in approximation.

I haven't suggested to use approximation anywhere here. I will answer 
about the limited number of entries in the other thread.

> 
> So I take the suggestion of putting regions in the higher slot index. Putting fixed regions in the front, and putting
> boot-only and switching ones at tail. Then, at the end of booting, when we reorg the mpu mapping, we remove
> all boot-only regions, and for switching ones, we disable-relocate(after fixed ones)-enable them. Specific codes in [2].

 From this discussion, it feels to me that you are trying to make the 
code more complicated just to keep the split and save a few cycles (see 
above).

I would suggest to investigate the cost of "hunting down each section". 
Depending on the result, we can discuss what the best approach.

Cheers,

-- 
Julien Grall

