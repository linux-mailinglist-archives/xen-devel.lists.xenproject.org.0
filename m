Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305068C0736
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 00:11:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719000.1121616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4pVE-0005eV-Kg; Wed, 08 May 2024 22:11:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719000.1121616; Wed, 08 May 2024 22:11:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s4pVE-0005bj-Gh; Wed, 08 May 2024 22:11:08 +0000
Received: by outflank-mailman (input) for mailman id 719000;
 Wed, 08 May 2024 22:11:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s4pVD-0005bd-2s
 for xen-devel@lists.xenproject.org; Wed, 08 May 2024 22:11:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4pVC-0001NQ-GV; Wed, 08 May 2024 22:11:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s4pVC-0005S7-A5; Wed, 08 May 2024 22:11:06 +0000
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
	bh=m1VVijBiFDc7GUlCDpqW1KovSksostA44Er1BhD/AXE=; b=JpjmK9fZpel7QCM2qTdy4LrgTn
	NSVK039078kJZTRmx0BxKvTw3Jxk+gc+eRAZr8daaTK48QS82My1zmMb9Bd+LbZsoi5Wd1bnaXMRG
	cZT04h42uup5FSYMdNLoVJ6Z1Elj3FBe8LaruWpBEico1KdXlEH6PagLro2nn4EcjoYM=;
Message-ID: <64648f8c-3eea-47c5-bdc5-6d4fc6531c60@xen.org>
Date: Wed, 8 May 2024 23:11:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
 <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
 <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
 <0857d348-1305-40d2-9596-e0e5f4490c4a@xen.org>
In-Reply-To: <0857d348-1305-40d2-9596-e0e5f4490c4a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

CC-ing Roger as he is working on adding support for the foreign mapping 
on x86. Although, I am not expecting any implication as only 4KB mapping 
should be supported.

On 08/05/2024 22:05, Julien Grall wrote:
> On 07/05/2024 14:30, Luca Fancellu wrote:
>>> On 7 May 2024, at 14:20, Julien Grall <julien@xen.org> wrote:
>>>
>>> Hi Luca,
>>>
>>> On 23/04/2024 09:25, Luca Fancellu wrote:
>>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>> But today, p2m_put_l3_page could not handle superpages.
>>>
>>> This was done on purpose. Xen is not preemptible and therefore we 
>>> need to be cautious how much work is done within the p2m code.
>>>
>>> With the below proposal, for 1GB mapping, we may end up to call 
>>> put_page() up to 512 * 512 = 262144 times. put_page() can free 
>>> memory. This could be a very long operation.
>>>
>>> Have you benchmark how long it would take?
>>
>> I did not, since its purpose was unclear to me and was not commented 
>> in the last serie from Penny.
> 
> Honestly, I can't remember why it wasn't commented.

I skimmed through the code to check what we currently do for preemption.

{decrease, increase}_reservation() will allow to handle max_order() 
mapping at the time. On a default configuration, the max would be 4MB.

relinquish_p2m_mapping() is preempting every 512 iterations. One 
iteration is either a 4KB/2MB/1GB mapping.

relinquish_memory() is checking for preemption after every page.

So I think, it would be ok to allow 2MB mapping for static shared memory 
but not 1GB. relinquish_p2m_mapping() would also needs to be updated to 
take into account the larger foreign mapping.

I would consider to check for preemption if 't' is p2m_map_foreign and 
the order is above 9 (i.e. 2MB).

Cheers,

-- 
Julien Grall

