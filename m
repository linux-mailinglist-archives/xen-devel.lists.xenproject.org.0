Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60F94AE4E35
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 22:39:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022710.1398536 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTnwI-00028X-Om; Mon, 23 Jun 2025 20:38:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022710.1398536; Mon, 23 Jun 2025 20:38:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTnwI-00026D-M1; Mon, 23 Jun 2025 20:38:50 +0000
Received: by outflank-mailman (input) for mailman id 1022710;
 Mon, 23 Jun 2025 20:38:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uTnwG-000267-RT
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 20:38:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTnwF-00GOnc-2O;
 Mon, 23 Jun 2025 20:38:47 +0000
Received: from [2a02:8012:3a1:0:fd5d:2703:c772:3074]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uTnwF-00FJBZ-1R;
 Mon, 23 Jun 2025 20:38:47 +0000
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
	bh=vSSI8v/6cKDAw0CxA+ZkPePwOfUQY8m9Sj3nQVam7rU=; b=wJC8tXDlgvS4CcDZRJNfnw0Q6g
	Zy+Z8Ui/zIjDTUmgOkcTr4VXKLDiEjHP0bph0+kD3cmvUWYL1AvvcywjYSOisLZSUwcLyjqRQg0b6
	5/2bTK26lafbFJb4GwfSjfaFrlSnxjp8shGJlaoI6cx/ZyyrUysKUD2Mdj/puRJcIS6A=;
Message-ID: <562748f1-13f5-4e84-a761-f251c6e0296a@xen.org>
Date: Mon, 23 Jun 2025 21:38:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v4 6/8] xen/arm: scmi: introduce SCI SCMI SMC
 multi-agent driver
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Michal Orzel <michal.orzel@amd.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com>
 <318044ae12f13b6b297b3f5fda577a1a6cd143da.1747669845.git.oleksii_moisieiev@epam.com>
 <alpine.DEB.2.22.394.2505231114050.147219@ubuntu-linux-20-04-desktop>
 <6080ff71-2634-4269-8a63-fdafdf03f01b@epam.com>
 <alpine.DEB.2.22.394.2506171556520.1780597@ubuntu-linux-20-04-desktop>
 <769aad0a-8bee-45c6-8c5c-35f9d47ed8ae@epam.com>
 <alpine.DEB.2.22.394.2506221432421.8066@ubuntu-linux-20-04-desktop>
 <bd09db53-2a99-420a-8a78-8bd9dee8c6b2@xen.org>
 <alpine.DEB.2.22.394.2506231225050.8066@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2506231225050.8066@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 23/06/2025 20:27, Stefano Stabellini wrote:
> On Mon, 23 Jun 2025, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 22/06/2025 23:15, Stefano Stabellini wrote:
>>> On Thu, 19 Jun 2025, Oleksii Moisieiev wrote:
>>>> On 18/06/2025 02:22, Stefano Stabellini wrote:
>>>>> On Thu, 12 Jun 2025, Oleksii Moisieiev wrote:
>>>>>> [1]:https://git.iliana.fyi/linux/patch/?id=d5141f37c42e0b833863f157ac4cee203b2ba3d2
>>>>> Keep in mind that [0] refers specifically to access to MMIO regions. I
>>>>> assume that the SCMI shared buffers are on normal memory? Regarding [1],
>>>>> it makes sense if Linux is trying to support shared memory over MMIO.
>>>>>
>>>>> Looking at one of your replies below, I am guessing the memory buffers
>>>>> are actually in normal memory but the issue is that TF-A is mapping them
>>>>> as uncacheable. Is that correct?
>>>>>
>>>>> In that case, I still don't understand why a simple memcpy would not be
>>>>> sufficient. Can you check?
>>>>>
>>>>> If yes, then for now I would just simplify it down to memcpy. When
>>>>> someone adds support for an SCMI server elsewhere we could look into
>>>>> adding a more sophisticated memcpy and we can look at the details at
>>>>> that point in time. Specifically, I am not convinced that memcpy_toio
>>>>> and memcpy_fromio would work if the SCMI server is on a separate
>>>>> non-coherent microcontroller.
>>>>>
>>>> According to the TF-A implementation  SCMI memory
>>>>
>>>> is mapped with the  flags: MT_DEVICE (like for  stm32mp1) or
>>>> MT_NON_CACHEABLE (for rpi3)
>>>>
>>>> So probably you're right. I will check with simple memcpy.
>>>
>>> There is a difference between MT_DEVICE and MT_NON_CACHEABLE: as far as
>>> I know MT_DEVICE requires aligned accesses while MT_NON_CACHEABLE does
>>> not.
>>>
>>> However, as I wrote in the other email, if I am not mistaken the current
>>> implementation of memcpy might work well for us anyway. (To be
>>> confirmed.)
>>
>> I am not entirely sure what exactly you want to confirm. I have already
>> mentioned several time that our memcpy() on arm64 is using unaligned access.
>> So it can't be used for copying data to/from device memory area.
> 
> I wrote it more clearly here:
> https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2506221438250.8066@ubuntu-linux-20-04-desktop/

Ah I missed that e-mail!

> 
> Assuming that the address passed to memcpy is 4K aligned, then it seems
> to me that our memcpy implementation is using only aligned accesses.

I didn't look at the mempcy() in details. But even if what you say is 
true, it seems to be me this will be very fragile because we would assume:
  * the addresses passed are always 4KB (I could not easily confirm it)
  * the mempcy implementation will not change (I see Linux has updated 
theirs in 2020 but we never did it...).

I can't think of a compiel time check that would help to confirm any 
assumptions above will always hold true.

I also don't see what we would gain with implementing memcpy_toio() with 
mempcy(). Maybe you can remind what's your concern with that?

So right now, I feel Oleksii approach is the best.

Cheers,

-- 
Julien Grall


