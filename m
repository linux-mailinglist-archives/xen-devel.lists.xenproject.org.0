Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B426D786235
	for <lists+xen-devel@lfdr.de>; Wed, 23 Aug 2023 23:19:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.589587.921556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYvEl-0001Pl-2t; Wed, 23 Aug 2023 21:17:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 589587.921556; Wed, 23 Aug 2023 21:17:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYvEl-0001Nb-0M; Wed, 23 Aug 2023 21:17:59 +0000
Received: by outflank-mailman (input) for mailman id 589587;
 Wed, 23 Aug 2023 21:17:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYvEj-0001NR-DN
 for xen-devel@lists.xenproject.org; Wed, 23 Aug 2023 21:17:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYvEj-00041i-11; Wed, 23 Aug 2023 21:17:57 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYvEi-0000kM-Qd; Wed, 23 Aug 2023 21:17:56 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=ZRGDpuTDRWxPz1UzcFTFV1/LWNpLfTxqICK17Db/Uyw=; b=NDlQ+2RE+T+x1YUfxSXtMua+BX
	tvLVJe9WJ1wb2eqvH4wGWe2fs8b1Vlld7kxKSiXPaPiV1ZVWQCdC/sWnaZ/ODn1QCU3Tv95kWeFV/
	/ECJmq/5dwHqBtgSGj/+5qKF+wezxaWuhD/1wP4+02BPAwzsLTQVjbwWmj0jWGUhPRLM=;
Message-ID: <352bd670-ad44-4cf1-b73c-2f050a6b9a17@xen.org>
Date: Wed, 23 Aug 2023 22:17:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/13] xen/arm: mmu: move MMU specific P2M code to
 mmu/p2m.{c,h}
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Henry Wang <Henry.Wang@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <Wei.Chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-12-Henry.Wang@arm.com>
 <5356f905-4b14-46b4-b5b4-c236989e1ec8@xen.org>
 <AD09B38F-EE24-4163-8443-B6A86550F24D@arm.com>
 <9a0273a3-b7c0-46c9-8ba6-bfeaf57b91cb@xen.org>
In-Reply-To: <9a0273a3-b7c0-46c9-8ba6-bfeaf57b91cb@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 23/08/2023 19:08, Julien Grall wrote:
>>>> With the code movement, global variable max_vmid is used in multiple
>>>> files instead of a single file (and will be used in MPU P2M
>>>> implementation), declare it in the header and remove the "static" of
>>>> this variable.
>>>> Add #ifdef CONFIG_HAS_MMU to p2m_write_unlock() since future MPU
>>>> work does not need p2m_tlb_flush_sync().
>>>
>>> And there are no specific barrier required? Overall, I am not sure I 
>>> like the #ifdef rather than providing a stub helper.
>>
>> I think for MPU systems we don’t need to flush the TLB, hence the #ifdef.
> 
> I wasn't necessarily thinking about a TLB flush but instead a DSB/DMB. 
> At least for the MMU case, I think that in theory we need a DSB when the 
> there is no TLB flush to ensure new entry in the page-tables are seen 
> before p2m_write_unlock() completes.
> 
> So far we are getting away because write_pte() always have a barrier 
> after. But at some point, I would like to remove it as this is a massive 
> hammer.
> 
>> Do you mean we should
>> provide a stub helper of p2m_tlb_flush_sync() for MPU? If so I think 
>> maybe the naming of this stub
>> helper is not really ideal?
> 
> See above. I am trying to understand the expected sequence when updating 
> the MPU tables. Are you going to add barriers after every update to the 
> entry?

I have looked at your branch mpu_v5. In theory the P2M can be modified 
at any point of the life-cycle of the domain. This means that another 
pCPU may have the regions loaded.

If that's the case then you would likely want to ensure the entries are 
synchronized. The easiest way would be to pause/unpause the domain when 
taking/releasing the lock. There might be other way, but this indicates 
that helper would be needed for the MPU.

That said, it is not clear to me if there is any use-case where you 
would want to update the P2M at runtime. If you have known, then you 
might be able to simply return an error if the P2M is modified after the 
domain was created.

Cheers,

-- 
Julien Grall

