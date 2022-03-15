Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3804DA2D7
	for <lists+xen-devel@lfdr.de>; Tue, 15 Mar 2022 20:02:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290926.493585 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUCQ7-00084c-E7; Tue, 15 Mar 2022 19:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290926.493585; Tue, 15 Mar 2022 19:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nUCQ7-00081e-9f; Tue, 15 Mar 2022 19:01:23 +0000
Received: by outflank-mailman (input) for mailman id 290926;
 Tue, 15 Mar 2022 19:01:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nUCQ6-00081Y-MJ
 for xen-devel@lists.xenproject.org; Tue, 15 Mar 2022 19:01:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUCQ6-0001yj-9A; Tue, 15 Mar 2022 19:01:22 +0000
Received: from [54.239.6.190] (helo=[192.168.16.242])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nUCQ6-0004js-2F; Tue, 15 Mar 2022 19:01:22 +0000
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
	bh=SP0tmeUyzxwICiIUGW9GoHAi0WHMnqWubiNtTK5JWJI=; b=bWFbb11sqYo1v2pDNARdxbVCgN
	ZBjnZZnpKZIGVCSRNHk2mRBzK+oYUHW+GOw6FIhOkIfzvnoi+R73LfkwO6nu6oXCNi0E3Pz5lyetJ
	AkZguHXfB2kZqMwJqnuVyFu8rkurrqBia8kE/PVGqpRmKE1BPYJxgsXyzQxdi715DlvA=;
Message-ID: <26d41f77-085a-62e4-088b-49dcda63c100@xen.org>
Date: Tue, 15 Mar 2022 19:01:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH early-RFC 4/5] xen/arm: mm: Rework switch_ttbr()
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, marco.solieri@minervasys.tech,
 lucmiccio@gmail.com, Julien Grall <jgrall@amazon.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220309112048.17377-1-julien@xen.org>
 <20220309112048.17377-5-julien@xen.org>
 <alpine.DEB.2.22.394.2203111721130.3497@ubuntu-linux-20-04-desktop>
 <ece8f698-0abd-42eb-625e-693f69f02e27@xen.org>
 <alpine.DEB.2.22.394.2203141459360.3497@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2203141459360.3497@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 14/03/2022 23:48, Stefano Stabellini wrote:
>>> - we save the current mapping
>>> - update it with the Xen 1:1
>>> - switch_ttbr
>>> - remove Xen 1:1
>>> - restore mapping
>>>
>>> It should work, right? Basically, a mapping conflict shouldn't be an
>>> issue given that the mapping has only to live long enough to call
>>> switch_ttbr_id.
>>
>> Today switch_ttbr() is called before we initialized most of the memory layout.
>> So clashing with the VMAP and frametable is not a problem.
>>
>> However, the identity mapping may also clash with the region used to map Xen.
>> That said, technically, we are not able to handle Xen when its start address
>> is in region 2MB + 4K to 4MB (Xen is loaded at a 4KB aligned address).
>>
>> The trouble is some features (e.g. UBSAN, GCOV) can generate Xen image over
>> 2MB. IOW, the range where Xen cannot be loaded will increase.
>>
>> This is an issue because AFAIK, there is no away to tell GRUB "You can't load
>> Xen at this region". But even if there were one, I feel this restriction is
>> sort of random.
>>
>> I already wrote a patch to get rid of the restriction. The code is not too bad
>> (we only need an extra indirection). But I haven't sent it yet because it is
>> less critical with the re-shuffling of the memory layout.
> 
> Interesting! I am curious: how did you manage to do it?

When the identity mapping is clashing with Xen runtime address, I am 
creating a temporary mapping for Xen at a different fixed address.

Once the MMU is turned on, we can jump to the temporary mapping. After 
that we are safe to remove the identity mapping and create the runtime 
Xen mapping. The last step is to jump on the runtime mapping and then 
remove the temporary mapping.

> 
> For now and for this series the current approach and the 512GB limit are
> fine. My replies here are brainstorming to see if there are potential
> alternatives in the future in case the need arises.

On Arm64, we have 256TB worth of virtual address. So I think we can 
easily spare 512GB for the foreseeable :).

If we are at the point where we can't space 512GB, then we would need to 
have a more dynamic layout as I plan on arm32.

Xen would still be mapped at a specific virtual address so we don't need 
to update the relocations. But we could decide at runtime the position 
of other large mappings (e.g. vmap, domheap).

Probably the safest way is to link Xen at a very high address. It is 
quite unlikely that Xen will be loaded at such high address.

If it is, we could exceptionally relocate Xen (with this series it 
should be safer to do). That said, I would like to avoid relocating Xen 
until we see a use for that.

> 
> I can see that a clash with Xen mapping could be problematic and the
> chances of that happening are low but non-zero. We could make sure that
> ImageBuilder always picks safe addresses and that would help but
> wouldn't remove the issue if someone is not using ImageBuilder.

AFAIU, ImageBuilder is here to cater U-boot users. I am not too worry 
about those setups because a user can pick any address they want. So as 
long as Xen print an error during the clash (already the case), the user 
can easily update their scripts.

This is more a problem for UEFI/GRUB where, AFAICT, we can't control 
where Xen will be loaded.

Cheers,

-- 
Julien Grall

