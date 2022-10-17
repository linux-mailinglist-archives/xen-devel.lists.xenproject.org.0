Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 298F460113C
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 16:37:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424453.671877 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okRFB-000120-7a; Mon, 17 Oct 2022 14:37:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424453.671877; Mon, 17 Oct 2022 14:37:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okRFB-0000yd-4i; Mon, 17 Oct 2022 14:37:29 +0000
Received: by outflank-mailman (input) for mailman id 424453;
 Mon, 17 Oct 2022 14:37:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okRFA-0000yX-DQ
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 14:37:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okRF6-0000fo-LA; Mon, 17 Oct 2022 14:37:24 +0000
Received: from [15.248.2.60] (helo=[10.24.67.16])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okRF6-000200-Ew; Mon, 17 Oct 2022 14:37:24 +0000
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
	bh=8b037JLSQJc43HxROy4cDNwcV4xuknK+443YRIWVIC4=; b=mfMh9HPqDCq2jwLngJbDyPqJ7M
	E4QtFETu7F7H9XKz4/0vsJQ673lzKx4mOYwjsc6yaRLW9PKODAPcegR79EOtwAUXYoNQJqp6XE/Yi
	hVQUn+XbWIBdmAiSES+YY/mkIQq22S2kTyQNwTiaVCG0Fa/P1zK5d5kQRzlYeZbHe3Ug=;
Message-ID: <4060025b-c155-c4e3-1a40-bb772d772d8d@xen.org>
Date: Mon, 17 Oct 2022 15:37:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH V7 2/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Jan Beulich <jbeulich@suse.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org,
 Henry Wang <Henry.Wang@arm.com>, Oleksandr Tyshchenko <olekstysh@gmail.com>
References: <20220716145658.4175730-1-olekstysh@gmail.com>
 <20220716145658.4175730-2-olekstysh@gmail.com>
 <df56f268-59d8-4b9a-52a6-40bfd0b91414@suse.com>
 <acedd354-9050-5340-ffd8-259aeb95b101@xen.org>
 <77349d2b-de72-3e68-362a-493f350eeec4@suse.com>
 <d297735d-771e-22f2-1b46-9c390ebb5afd@xen.org>
 <fc706330-d014-0fd6-4e99-27773f1d78af@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <fc706330-d014-0fd6-4e99-27773f1d78af@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 17/10/2022 14:46, Jan Beulich wrote:
> On 11.10.2022 15:33, Julien Grall wrote:
>> On 11/10/2022 14:28, Jan Beulich wrote:
>>> On 11.10.2022 15:01, Julien Grall wrote:
>>>> On 11/10/2022 12:59, Jan Beulich wrote:
>>>>> On 16.07.2022 16:56, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>
>>>>>> Rework Arm implementation to store grant table frame GFN
>>>>>> in struct page_info directly instead of keeping it in
>>>>>> standalone status/shared arrays. This patch is based on
>>>>>> the assumption that a grant table page is a xenheap page.
>>>>>>
>>>>>> To cover 64-bit/40-bit IPA on Arm64/Arm32 we need the space
>>>>>> to hold 52-bit/28-bit + extra bit value respectively. In order
>>>>>> to not grow the size of struct page_info borrow the required
>>>>>> amount of bits from type_info's count portion which current
>>>>>> context won't suffer (currently only 1 bit is used on Arm).
>>>>>
>>>>> I'm afraid this isn't true: There's no requirement for a guest to pass
>>>>> all different GFNs to VCPUOP_register_vcpu_info, yet map_vcpu_info()
>>>>> tries to obtain a reference for every vCPU.
>>>>
>>>> AFAIU, this would be a reference of the **count_info** not **type_info**
>>>> (which BTW will never be incremented on Arm because we have no type
>>>> support).
>>>
>>> I should have said "obtain a writable type reference".
>>
>> Thanks for the clarification.
>>
>>>
>>>> The commit message is only referring to the 'type_info's count'. So...
>>>>
>>>>> With my adding of GFN
>>>>> (really gaddr) based registration of the runstate area (already
>>>>> looking towards 4.18) the maximum possible count is to further grow.
>>>>
>>>> ... I am not sure which problem you are referring too.
>>>
>>> Wow - a mere stub (but not inline) function to make the build happy.
>>> Then why is the description talking about one bit that's needed on
>>> Arm?
>>
>> Because share_xen_page_with_guest() will always set the type info's
>> count to 1.
>>
>> TBH I don't exactly know why we set it. I always assumed this was a
>> requirement for the common code but never checked.
> 
> So my first thought was that this type-ref handling all being no-ops
> would be an issue with gnttab v2, but besides that not being security
> supported on Arm the code also passes SHARE_rw (for a reason that
> escapes me) when sharing the status pages.

Probably because grant-table v2 was never tested on Arm.

> 
> It does however mean that Dom0 can map the trace buffers r/w (unless
> there's some special code in Arm preventing that), despite them being
> shared with SHARE_ro. Not a big problem considering all the power Dom0
> has, but still against the intentions.

We don't use the refcounting but still use the flag PGT_writable_page to 
indicate whether the mapping is writeable or read-only.

The code to map the trace buffers will look at the flag and decide the 
attribute in the P2M.

Cheers,

-- 
Julien Grall

