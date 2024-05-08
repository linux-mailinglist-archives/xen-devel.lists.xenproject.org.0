Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 707C98C0606
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2024 23:06:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.718959.1121534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4oTw-0006zM-Vy; Wed, 08 May 2024 21:05:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 718959.1121534; Wed, 08 May 2024 21:05:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4oTw-0006wP-T8; Wed, 08 May 2024 21:05:44 +0000
Received: by outflank-mailman (input) for mailman id 718959;
 Wed, 08 May 2024 21:05:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4oTv-0006wJ-8X
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 21:05:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4oTu-0000HW-Qn; Wed, 08 May 2024 21:05:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4oTu-0001Ah-LQ; Wed, 08 May 2024 21:05:42 +0000
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
	bh=uMKXVQiv+rd0LyM0gDIWnH+cpu+xUY0PsuYtzul+dEE=; b=lvMUbxF+GCm3t1/ndJtXpWaNQK
	ciz1SRMoxOAS0fHiK2xLNz4LbFbTASPG1bSbtzPinWzTj8qTxcMChJIqHQYQZPsFiO5UM8x0OsEE8
	CbaUd1tF0zaYeNLB3aW2C0VCm9E18k7Qpj1Lu42FIR4F5K7H2PZuORzO31yhnHSycLvM=;
Message-ID: <0857d348-1305-40d2-9596-e0e5f4490c4a@xen.org>
Date: Wed, 8 May 2024 22:05:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Content-Language: en-GB
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
 <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
 <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/05/2024 14:30, Luca Fancellu wrote:
> Hi Julien,

Hi Luca,

>> On 7 May 2024, at 14:20, Julien Grall <julien@xen.org> wrote:
>>
>> Hi Luca,
>>
>> On 23/04/2024 09:25, Luca Fancellu wrote:
>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>> We are doing foreign memory mapping for static shared memory, and
>>> there is a great possibility that it could be super mapped.
>>
>> Is this because we are mapping more than one page at the time? Can you point me to the code?
> 
> So, to be honest this patch was originally in Penny’s serie, my knowledge of this side of the codebase
> is very limited and so I pushed this one basically untouched.
> 
>  From what I can see in the serie the mappings are made in handle_shared_mem_bank, and map_regions_p2mt
> is called for one page at the time (allocated through the function allocate_domheap_memory (new function introduced in
> the serie).
> 
> So is that the case that this patch is not needed?

I looked at the code and, if I am not mistake, we are passing 
PFN_DOWN(psize) to map_regions_p2mt. At the moment, it is unclear to me 
why would psize be < PAGE_SIZE.

>>> But today, p2m_put_l3_page could not handle superpages.
>>
>> This was done on purpose. Xen is not preemptible and therefore we need to be cautious how much work is done within the p2m code.
>>
>> With the below proposal, for 1GB mapping, we may end up to call put_page() up to 512 * 512 = 262144 times. put_page() can free memory. This could be a very long operation.
>>
>> Have you benchmark how long it would take?
> 
> I did not, since its purpose was unclear to me and was not commented in the last serie from Penny.

Honestly, I can't remember why it wasn't commented.

Cheers,

-- 
Julien Grall

