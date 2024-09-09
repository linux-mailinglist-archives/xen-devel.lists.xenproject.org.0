Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82281971CFD
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 16:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794613.1203621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfe6-0001Ms-6w; Mon, 09 Sep 2024 14:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794613.1203621; Mon, 09 Sep 2024 14:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snfe6-0001Kn-4B; Mon, 09 Sep 2024 14:45:38 +0000
Received: by outflank-mailman (input) for mailman id 794613;
 Mon, 09 Sep 2024 14:45:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1snfe4-0001Kh-A8
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 14:45:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snfe3-0008PQ-T2; Mon, 09 Sep 2024 14:45:35 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snfe3-0004Ra-K1; Mon, 09 Sep 2024 14:45:35 +0000
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
	bh=8LOinqn36eTHa9S3MIOV12l/VLbvT/uSN99+Jh7dhUY=; b=1kZqnhstdNEuo5VHnFGnRL2tA1
	eayClQBtJEaZ+w/JYoyY6mXlDUvH5LKznA3SIRL6c+IACGz6Z38tV2cDthRRm4A+eNiCAns4vmmyV
	2D2nIMMWqKb57cpGZtmQTbTm1NVWMJE7jbaOHqd0iKlHh5x1jnzO0uxfmW0v+tjoIfMc=;
Message-ID: <0533aee4-1b08-4714-b497-a4df70703895@xen.org>
Date: Mon, 9 Sep 2024 15:45:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] xen/arm: mpu: Define Xen start address for MPU
 systems
Content-Language: en-GB
To: Ayan Kumar Halder <ayankuma@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Jiamei . Xie" <jiamei.xie@arm.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
 <20240823163127.3443404-3-ayan.kumar.halder@amd.com>
 <efc024ad-1e1c-45d0-9511-cc0c082dfef7@xen.org>
 <c0de7e6c-43d0-46ec-8cf7-ba1855caac82@amd.com>
 <c375468f-fc1d-42d2-91bb-7878f0300c55@xen.org>
 <7021af49-a409-46c1-993b-4ddd7975564d@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7021af49-a409-46c1-993b-4ddd7975564d@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ayan,

On 09/09/2024 11:29, Ayan Kumar Halder wrote:
> 
> On 08/09/2024 22:13, Julien Grall wrote:
>> Hi,
> Hi Julien,
>>
>> On 02/09/2024 15:48, Ayan Kumar Halder wrote:
> 
>>> I will rephrase this as ...
>>>
>>> "Used to set customized address at which which Xen will be linked
>>>
>>> on MPU systems. This address must be aligned to a page size.
>>> 0xFFFFFFFF is used as the default value to indicate that user hasn't
>>> customized this address."
>>
>> Reading this comment, I would like to ask some clarification. In the 
>> context of the MPU how do you define a page size? The definition is 
>> pretty clear when using the MMU because the granularity if defined by 
>> the HW. But for the MPU, it is a bit blur. Is it still 4KB? If so, is 
>> it actually realistic (we don't have that many MPU regions)?
> 
>  From ARM DDI 0600A.d ID120821, C1.1.1 Protection regions
> 
> "Protection regions have a minimum size of 64 bytes."
> 
> Thus, I would infer that the minimum page size (in context of MPU) is 64 
> bytes.
 > > Also, if you see the register fields of PRBAR and PRLAR, the lower 6
> bits are 0 extended to provide the address.
> 
> So, may be I should say
> 
> ".... address must be aligned to the minimum region size (ie 64 bytes). 
> 0xFFFFFFFF is used ...."
> 
> 
> Let me know if this sounds ok.

So what you provided is a minimum size/alignment of a region from the HW 
point of view. How about Xen? Will it be able to cope if Xen is booted 
at a 64-byte alignment?

Asking because it is unclear how the allocator will work with the MPU. 
Are we going to continue to allocate 4KB chunk at the time? Will it be 
smaller/larger?

Cheers,

-- 
Julien Grall


