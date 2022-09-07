Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DBB5B0626
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 16:11:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401844.643796 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvlE-000668-VH; Wed, 07 Sep 2022 14:10:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401844.643796; Wed, 07 Sep 2022 14:10:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvlE-00062t-S2; Wed, 07 Sep 2022 14:10:36 +0000
Received: by outflank-mailman (input) for mailman id 401844;
 Wed, 07 Sep 2022 14:10:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVvlD-00062n-LK
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 14:10:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVvlD-0007HR-4u; Wed, 07 Sep 2022 14:10:35 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVvlC-0005Z9-Ut; Wed, 07 Sep 2022 14:10:35 +0000
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
	bh=+Z2DMwkFJM9om9r+RdWsRVQfrxklIv4IIiveJ7fJ/yw=; b=J9oXjK/AeFI5K/xxyurJysmvGo
	8ihdKsaU/l3EQ0UN+bZuvJJqb92pU4kI8YGp0nYI8U1kekDFewoPXnfJzPBB7WT3L25Q6CuF602Ds
	MBwBZjQmL3LgAsKJ23W+TO+rnZVfPlC2yPQylTu7LxIUHKoKMqd9NUAQl9fc7BwY2jXs=;
Message-ID: <885dd861-0596-adbf-0bd6-8634f207009b@xen.org>
Date: Wed, 7 Sep 2022 15:10:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
 <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com>
 <eed26206-9684-4010-278c-14ed3602582b@amd.com>
 <759E29A4-AADA-4678-A88B-E96C5C15A462@arm.com>
 <AS8PR08MB79916A5189182179F6BEB29192419@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <39862a75-ed08-1289-0a0d-a2580f27fdf1@xen.org>
In-Reply-To: <39862a75-ed08-1289-0a0d-a2580f27fdf1@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 07/09/2022 15:04, Julien Grall wrote:
> Hi Henry,
> 
> On 07/09/2022 14:49, Henry Wang wrote:
>>> -----Original Message-----
>>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>>>>> But in any case we should only add one pair here for sure, as you 
>>>>>>> say
>>> the
>>>>>>> only implication is to add a couple of 0 in the worst case.
>>>>>> I agree. The only drawback is the need to modify the already 
>>>>>> introduced
>>> properties
>>>>>> to be coherent.
>>>>>
>>>>> Agree, someone will need to do a pass on the whole doc which might be
>>> easier with all things in.
>>>>>
>>>> Well, not only docs. If we decide to use a single pair of 
>>>> #address-cells and
>>> #size-cells, then
>>>> we need to modify the code that expects different properties e.g.
>>> xen,static-mem-{address/size}-cells.
>>>
>>> Right I forgot that some parts are already in.
>>> So we will need an extra patch to handle those.
>>
>> I think I've addressed all comments from Julien regarding my series,
> 
> If it is not too late for you would you be able to resend your series 
> without the 'address-cells'/'size-cells' change? This will give me the 
> opportunity to have an other review today.
> 
>> so I think I've got some bandwidth to do the clean-up patch tomorrow
>> after the agreement, unless someone would like to do it himself?
> 
> Renaming "xen,static-mem-..." is a bit tricky because they have been 
> defined in Xen 4.16.
> 
> I couldn't find any support statement specific to the static memory 
> feature. So it would technically fall under the "dom0less" section which 
> is security supported.
> 
> That said, I don't think we can consider that the static memory feature 
> is even supported because, until yesterday, the code wasn't properly 
> handling request to balloon in/out. So I would view this is a tech 
> preview (Could someone send a patch to clarify SUPPORT.MD)?

Ah. I was using the 4.16 branch. There is a patch for 4.17 to confirm 
this is tech preview. I think we should consider to backport it.

Stefano can you add it in your backport list?

Cheers,

-- 
Julien Grall

