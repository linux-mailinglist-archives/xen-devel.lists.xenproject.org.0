Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A63491A3D8
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 12:32:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749950.1158196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMmQS-0000D9-JL; Thu, 27 Jun 2024 10:32:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749950.1158196; Thu, 27 Jun 2024 10:32:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMmQS-0000B1-Fw; Thu, 27 Jun 2024 10:32:24 +0000
Received: by outflank-mailman (input) for mailman id 749950;
 Thu, 27 Jun 2024 10:32:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sMmQQ-0000Au-FO
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 10:32:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sMmQQ-0007fR-2a; Thu, 27 Jun 2024 10:32:22 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sMmQP-0004AN-Qp; Thu, 27 Jun 2024 10:32:21 +0000
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
	bh=Xa4o4u7u8I6QXsWixHCkdQsoG4fvPOsklXckdvOUVJU=; b=OJ0uUzPupBFsNJclQvY+m3l1uo
	a/cWCRGK9dNQsA0nhKYeensHcbFe7Vvx9oD0wyzQfIxOTNwxcC59yaaPXae8G6IDHVpGcPZ3Y8HR7
	7FwESsWkz/ZJ1HCzwXw3S7qdY3Fh5Gsp/rElHj9eNxBRbtzi9fP6lNjjVNYuKkBTknic=;
Message-ID: <ae447b0b-f791-4ca8-8b33-3600ae059b47@xen.org>
Date: Thu, 27 Jun 2024 11:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory node
 probing
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, oleksii.kurochko@gmail.com
References: <20240626080428.18480-1-michal.orzel@amd.com>
 <766b260e-204c-423f-b0e1-c21957b6d169@xen.org>
 <b5c861a4-1431-44c5-a1ec-bc859ea011c3@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b5c861a4-1431-44c5-a1ec-bc859ea011c3@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2024 08:40, Michal Orzel wrote:
> Hi Julien,
> 
> On 26/06/2024 22:13, Julien Grall wrote:
>>
>>
>> Hi Michal,
>>
>> On 26/06/2024 09:04, Michal Orzel wrote:
>>> Memory node probing is done as part of early_scan_node() that is called
>>> for each node with depth >= 1 (root node is at depth 0). According to
>>> Devicetree Specification v0.4, chapter 3.4, /memory node can only exists
>>> as a top level node. However, Xen incorrectly considers all the nodes with
>>> unit node name "memory" as RAM. This buggy behavior can result in a
>>> failure if there are other nodes in the device tree (at depth >= 2) with
>>> "memory" as unit node name. An example can be a "memory@xxx" node under
>>> /reserved-memory. Fix it by introducing device_tree_is_memory_node() to
>>> perform all the required checks to assess if a node is a proper /memory
>>> node.
>>>
>>> Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM location and size")
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> ---
>>> 4.19: This patch is fixing a possible early boot Xen failure (before main
>>> console is initialized). In my case it results in a warning "Shattering
>>> superpage is not supported" and panic "Unable to setup the directmap mappings".
>>>
>>> If this is too late for this patch to go in, we can backport it after the tree
>>> re-opens.
>>
>> The code looks correct to me, but I am not sure about merging it to 4.19.
>>
>> This is not a new bug (in fact has been there since pretty much Xen on
>> Arm was created) and we haven't seen any report until today. So in some
>> way it would be best to merge it after 4.19 so it can get more testing.
>>
>> In the other hand, I guess this will block you. Is this a new platform?
>> Is it available?
> Stefano answered this question. Also, IMO this change is quite straightforward
> and does not introduce any engineering doubt, so I'm not really sure if it needs
> more testing.

At this stage of the release we should think whether the bug is critical 
enough (rather than the risk is low enough) to be merged. IMHO, it is 
not because this has been there for the past 12 years...

But if we focus on the "riskness". We are rightly changing an interface 
which possibly someone may have (bogusly) relied on. So there is a 
lowish risk that you may end up to break use-case late in the release 
(we are a couple of weeks away) for use-case that never worked in the 
past 12 years.

We should also think what the worse that can happen if there is a bug in 
your series. The worse is we would not be able to boot on already 
supported platform. This would be quite a bad regression this late in 
the release. For Device-Tree parsing, I don't think it is enough to just 
test on just a handful of platforms this late in the release.

Which is why to me the answer to "It should be in 4.19" is not 
straightforward. If we merge post 4.19, then we give the chance to 
people to test, update & adjust their setup if needed.

Anyway, ultimately this is Oleksii's decision as the release manager.

[...]

>>> +/*
>>> + * Check if a node is a proper /memory node according to Devicetree
>>> + * Specification v0.4, chapter 3.4.
>>> + */
>>> +static bool __init device_tree_is_memory_node(const void *fdt, int node,
>>> +                                              int depth)
>>> +{
>>> +    const char *type;
>>> +    int len;
>>> +
>>> +    if ( depth != 1 )
>>> +        return false;
>>> +
>>> +    if ( !device_tree_node_matches(fdt, node, "memory") )
>>> +        return false;
>>> +
>>> +    type = fdt_getprop(fdt, node, "device_type", &len);
>>> +    if ( !type )
>>> +        return false;
>>> +
>>> +    if ( (len <= 0) || strcmp(type, "memory") )
>>
>> I would consider to use strncmp() to avoid relying on the property to be
>> well-formed (i.e. nul-terminated).
> Are you sure? AFAIR, libfdt returns NULL and -FDT_ERR_TRUNCATED as len if a string is non null terminated.

I can't find such code in path. Do you have any pointer?

> Also, let's suppose it is somehow not terminated. In that case how could libfdt set len to be > 0?

The FDT will store the length of the property otherwise you would not be 
able to encode property that are just a list of cells (i.e. numbers).

> It needs to know where is the end of the string to calculate the length.

For the name and the description, it is unclear to why would 
fdt_getprop() would only work for string property.

Cheers,

-- 
Julien Grall

