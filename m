Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBCA4CA46B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Mar 2022 13:06:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.282205.480823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPNk6-0004do-Ks; Wed, 02 Mar 2022 12:06:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 282205.480823; Wed, 02 Mar 2022 12:06:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPNk6-0004bz-H9; Wed, 02 Mar 2022 12:06:06 +0000
Received: by outflank-mailman (input) for mailman id 282205;
 Wed, 02 Mar 2022 12:06:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nPNk4-0004br-5V
 for xen-devel@lists.xenproject.org; Wed, 02 Mar 2022 12:06:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPNk3-0004YF-UH; Wed, 02 Mar 2022 12:06:03 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=[192.168.10.166]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nPNk3-0000nK-Ob; Wed, 02 Mar 2022 12:06:03 +0000
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
	bh=EZTvUrI4SHfZq+qVhAYlWXuSyOijr38hSdYkgsbLe2Y=; b=xRm3kzE2FzQrxrYg4xtUcV/yqb
	BPA1JqbzqAqjBVDkx02v0dY/4AqDhnSNeAPf4APksTLNyH7K+0RpH4coTGAhI3ghiPbmLhVT6avUX
	sRnZvCzS8y7X5KfNuqKkDcsigK4VRddwHghLP2ZsU9q20zR4k0gBi8aVUKeFFx2YXq5Y=;
Message-ID: <8b24027f-b659-098b-6faa-3591621fa0a1@xen.org>
Date: Wed, 2 Mar 2022 12:06:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Proposal for Porting Xen to Armv8-R64 - DraftA
To: Penny Zheng <Penny.Zheng@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Henry Wang <Henry.Wang@arm.com>, nd <nd@arm.com>
References: <PAXPR08MB7420A01809B84E04E196793F9E3D9@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <04db7e8b-2f04-41d7-1deb-d8bda3625c04@xen.org>
 <PAXPR08MB7420BF1299A1577B98211C1A9E029@PAXPR08MB7420.eurprd08.prod.outlook.com>
 <DU2PR08MB73257F1F8FFB2BF8F3384F66F7039@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB73257F1F8FFB2BF8F3384F66F7039@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/03/2022 07:21, Penny Zheng wrote:
> Hi julien

Hi Penny,

>>>>
>>>>     So if the unpaused guests start executing the context switch at this
>>>>     point, then its MPU context will base on the boot-time MPU
>>> configuration.
>>>
>>> Can you explain why you want to switch the MPU configuration that late?
>>>
>>
> 
> It is more related to the implementation.
> 
> In the boot stage, we allocate MPU regions in sequence until the max.
> Since a few MPU region will get removed along the way, it leaves hole there.
> Such like when heap is ready, fdt will be reallocated in the heap, which means the
> MPU region for device tree is in no need. And also in free_init_memory, although we
> do not give back init memory to the heap, we will also destroy according MPU
> regions to make them inaccessible.
> Without ordering, we need a bitmap to record such information.
> 
> In context switch, the memory layout is quite different for guest mode and
> hypervisor mode. When switching to guest mode, only guest RAM, emulated/passthrough
> devices, etc could be seen, but in hypervisor mode, all guests RAM and device memory
> shall be seen. And without reordering, we need to iterate all MPU regions to find
> according regions to disable during runtime context switch, that's definitely a overhead.
> 
> So we propose an ordering at the tail of the boot time, to put all fixed MPU region
> in the head, like xen text/data, etc, and put all flexible ones at tail, like device memory,
> guests RAM.
> Then later in context switch,  we could easily just disable ones from tail and inserts new
> ones in the tail.

Thank you for the clarification. This makes sense to me. I would suggest 
to update the proposal to reflect this decision.

>> For PMSA, we still enforce WnX. For your use case, I assume it's alternative.
>> It still may have some possibility to avoid vmap(). But there may be some
>> security issues. We had thought to disable MPU -> update xen text -> enable
>> MPU to copy VMSA alternative's behavior. The problem with this, however,
>> is that at some point, all memory is RWX. There maybe some security risk.
>> But because it's in init stage, it probably doesn't matter as much as I thought.
>>
> 
> In MMU system, we use vmap() to change requested xen text codes(a few lines) temporarily
> to RW to apply the alternative codes, the granularity for it could be 4KB.
> 
> But on MPU system, we give the whole XEN text code a MPU region, so otherwise we disable
> the whole MPU to make it happen, which leads to a little risk for running c codes where MPU
> disabled, or all text memory becoming RWX at this alternative time.

See my answer to Wei. So long the code is compliant with the Arm Arm, it 
would be acceptable to have boot code running with RWX for a short 
period of time.

Cheers,

-- 
Julien Grall

