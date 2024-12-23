Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 728CE9FAD47
	for <lists+xen-devel@lfdr.de>; Mon, 23 Dec 2024 11:45:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.862832.1274370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPfwQ-0001Td-EU; Mon, 23 Dec 2024 10:45:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 862832.1274370; Mon, 23 Dec 2024 10:45:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tPfwQ-0001QU-Bj; Mon, 23 Dec 2024 10:45:38 +0000
Received: by outflank-mailman (input) for mailman id 862832;
 Mon, 23 Dec 2024 10:45:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1tPfwP-0001QM-HB
 for xen-devel@lists.xenproject.org; Mon, 23 Dec 2024 10:45:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tPfwO-000Xw0-2W;
 Mon, 23 Dec 2024 10:45:37 +0000
Received: from [2a02:8012:3a1:0:ed95:e074:2d19:de59]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1tPfwO-00FJcY-2u;
 Mon, 23 Dec 2024 10:45:37 +0000
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
	bh=J1VyzV/Ne3aw5wEaILUlVH7egrpSzzGTxmc4mXrBQCI=; b=hhDslAD2wJL84SgwhWFGTVevc7
	X2WbFhgb8BSO5DI1RPcIUEppF7LAIYhxWz6/itsn6xTuf+ZTSR0REHFHyz1VYyd0qnFSS2WgIFuQn
	A+70FZw0hvOY6/4t3u4VjN9nsnBUNC1No4nV8sMwLGb8YOVnV82jBfyFmDhCVLDsya6o=;
Message-ID: <7b7d4606-86fe-45c1-9aa0-48ddfacabafb@xen.org>
Date: Mon, 23 Dec 2024 10:45:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: Initialise memory type for struct kernel_info
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, Luca Fancellu
 <luca.fancellu@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241220151941.4192864-1-luca.fancellu@arm.com>
 <2a7ac358-7f43-4e32-9e1e-9ce1cd45304a@amd.com>
 <c39709e1-bbdb-4995-b507-212eec7c84e6@xen.org>
 <a9df74ea-38ef-4f20-be26-1c519bb9c269@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a9df74ea-38ef-4f20-be26-1c519bb9c269@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 23/12/2024 10:42, Michal Orzel wrote:
> 
> 
> On 23/12/2024 11:06, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 23/12/2024 07:58, Michal Orzel wrote:
>>>
>>>
>>> On 20/12/2024 16:19, Luca Fancellu wrote:
>>>>
>>>>
>>>> Commit a14593e3995a ("xen/device-tree: Allow region overlapping with
>>>> /memreserve/ ranges") introduced a type in the 'struct membanks_hdr'
>>>> but forgot to update the 'struct kernel_info' initialiser, while
>>>> it doesn't lead to failures because the field is not currently
>>>> used while managing kernel_info structures, it's good to have it
>>>> for completeness.
>>> The last part "good to have it" does not sound like we need a Fixes tag.
>>
>> Reading the discussion, it sounds like ".type" is not always set and
>> this is not properly documented. This means that in the future we may
>> write a patch that requires to use ".type" and needs backported.
>>
>> But this would depend on this patch which was not tagged appropriately.
>> Therefore, I would argue it needs a fixes tag (even though this is a
>> latent bug) or at least a backport request.
> Setting explicitly a type for structures not requiring it, does not seem beneficial for me.

I have to disagree. If we set type everywhere, then the developer 
doesn't need to think whether ".type" is garbagge or not.

Cheers,

-- 
Julien Grall


