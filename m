Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDDF64F84D
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 09:42:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465220.723850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Sln-000807-BO; Sat, 17 Dec 2022 08:42:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465220.723850; Sat, 17 Dec 2022 08:42:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6Sln-0007yG-8S; Sat, 17 Dec 2022 08:42:11 +0000
Received: by outflank-mailman (input) for mailman id 465220;
 Sat, 17 Dec 2022 08:42:09 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p6Sll-0007xp-7q
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 08:42:09 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6Slk-0007Wy-PL; Sat, 17 Dec 2022 08:42:08 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6Slk-0001WB-K2; Sat, 17 Dec 2022 08:42:08 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=m2oBSjp3Md63xNkIVbVLbrlH8PMJdDtLWnM6if9dxqQ=; b=coxEaOjv9pFKatN9J7TuIcqOgR
	GRdeBBKkRmQBBGyForimnvyh9YlAG4D8FVIlSxRMoGwZ1AzdQ5lN4ragJF4bhRFVSCv5KZieOajuk
	0OOCif4xiEY52+pH4lLpTxqQEiPjI1Vd3ZDnMWfidrHktD7PRwCavCzdnIzYWTW0pK8s=;
Message-ID: <74786a57-d99a-6cfe-f475-df11c0d93afa@xen.org>
Date: Sat, 17 Dec 2022 08:42:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221215193245.48314-1-ayan.kumar.halder@amd.com>
 <20221215193245.48314-3-ayan.kumar.halder@amd.com>
 <b58c6548-9e70-0ed9-07a9-e35084620c36@xen.org>
 <alpine.DEB.2.22.394.2212161643400.315094@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
Subject: Re: [XEN v1 2/9] xen/arm: Define translate_dt_address_size() for the
 translation between u64 and paddr_t
In-Reply-To: <alpine.DEB.2.22.394.2212161643400.315094@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/12/2022 00:46, Stefano Stabellini wrote:
> On Fri, 16 Dec 2022, Julien Grall wrote:
>> Hi Ayan,
>>
>> On 15/12/2022 19:32, Ayan Kumar Halder wrote:
>>> paddr_t may be u64 or u32 depending of the type of architecture.
>>> Thus, while translating between u64 and paddr_t, one should check that the
>>> truncated bits are 0. If not, then raise an appropriate error.
>>
>> I am not entirely convinced this extra helper is worth it. If the user can't
>> provide 32-bit address in the DT, then there are also a lot of other part that
>> can go wrong.
>>
>> Bertrand, Stefano, what do you think?
> 
> In general, it is not Xen's job to protect itself against bugs in device
> tree. However, if Xen spots a problem in DT and prints a helpful message
> that is better than just crashing because it gives a hint to the
> developer about what the problem is.

I agree with the principle. In practice this needs to be weight out with 
the long-term maintenance.

> 
> In this case, I think a BUG_ON would be sufficient.

BUG_ON() is the same as panic(). They both should be used only when 
there are no way to recover (see CODING_STYLE).

If we parse the device-tree at boot, then BUG_ON() is ok. However, if we 
need to parse it after boot (e.g. the DT overlay from Vikram), then we 
should definitely not call BUG_ON() for checking DT input.

The correct way is like Ayan did by checking returning an error and let
the caller deciding what to do.

My concern with his approach is the extra amount of code in each caller 
to check it (even with a new helper).

I am not fully convinced that checking the addresses in the DT is that 
useful. However, if you both want to do it, then I think it would be 
best to introduce wrappers over the Device-Tree ones that will check the 
truncation.

For example, we could introduce dt_device_get_address_checked()
that will call dt_device_get_address() and then check for 32-bit truncation.

For the function device_tree_get_reg(), this helper was aimed to deal 
with just Physical address 'reg' very early. So we can modify the 
prototype and update the function to check for 32-bit truncation.

Note that I am suggesting a different approach for the two helpers 
because the former is generic and it is not clear to me whether this 
could be used in another context than physical address.

Cheers,

-- 
Julien Grall

