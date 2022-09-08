Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 007605B1A6E
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 12:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403105.645089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWF4C-0005dO-Jk; Thu, 08 Sep 2022 10:47:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403105.645089; Thu, 08 Sep 2022 10:47:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWF4C-0005aV-GK; Thu, 08 Sep 2022 10:47:28 +0000
Received: by outflank-mailman (input) for mailman id 403105;
 Thu, 08 Sep 2022 10:47:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oWF4B-0005aP-9w
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 10:47:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWF4A-00055i-Uo; Thu, 08 Sep 2022 10:47:26 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.18.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oWF4A-0003DN-O1; Thu, 08 Sep 2022 10:47:26 +0000
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
	bh=RiJWc34ZiZkVyhJlfbItavLbR9Y0PlPQsZkTzrilhP0=; b=ED7ZExRzii35L3ef3lv4dP+lh6
	AmyAeFloPVQNtTuxIqZre6g6BPr+DSl6guFTXrmmsT87Oa787MU1xRwNVWuVBFxAfe7I3R3VDs6ck
	4PD/lWy0c7Al9/hUbJ194YfFoX0hx2QbEYjAbk1Ht3XQTBv4LRWCn4LuBHzIquz7Fyk0=;
Message-ID: <b8db4fa3-f7b8-6585-67a9-62e246b3f441@xen.org>
Date: Thu, 8 Sep 2022 11:47:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v7 7/9] xen/arm: create shared memory nodes in guest
 device tree
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
 <20220906085941.944592-8-Penny.Zheng@arm.com>
 <ca8eeff8-f40f-0cf9-bde3-a733b61e3712@xen.org>
 <alpine.DEB.2.22.394.2209071710470.157835@ubuntu-linux-20-04-desktop>
 <AM0PR08MB4530B8CC3BFA44FF638BB38DF7409@AM0PR08MB4530.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AM0PR08MB4530B8CC3BFA44FF638BB38DF7409@AM0PR08MB4530.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,


Replying to Penny and Stefano answer in the same e-mail.

On 08/09/2022 04:21, Penny Zheng wrote:
> 
>> -----Original Message-----
>> From: Stefano Stabellini <sstabellini@kernel.org>
>> Sent: Thursday, September 8, 2022 8:16 AM
>> To: Julien Grall <julien@xen.org>
>> Cc: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> Wei Chen <Wei.Chen@arm.com>; Stefano Stabellini
>> <sstabellini@kernel.org>; Bertrand Marquis <Bertrand.Marquis@arm.com>;
>> Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
>> Subject: Re: [PATCH v7 7/9] xen/arm: create shared memory nodes in guest
>> device tree
>>
>> On Wed, 7 Sep 2022, Julien Grall wrote:
>>> On 06/09/2022 09:59, Penny Zheng wrote:
>>>> We expose the shared memory to the domU using the "xen,shared-
>> memory-v1"
>>>> reserved-memory binding. See
>>>> Documentation/devicetree/bindings/reserved-memory/xen,shared-
>> memory.
>>>> txt in Linux for the corresponding device tree binding.
>>>>
>>>> To save the cost of re-parsing shared memory device tree
>>>> configuration when creating shared memory nodes in guest device
>>>> tree, this commit adds new field "shm_mem" to store shm-info per
>>>> domain.
>>>>
>>>> For each shared memory region, a range is exposed under the
>>>> /reserved-memory node as a child node. Each range sub-node is named
>>>> xen-shmem@<address> and has the following properties:
>>>> - compatible:
>>>>           compatible = "xen,shared-memory-v1"
>>>> - reg:
>>>>           the base guest physical address and size of the shared
>>>> memory region
>>>> - xen,id:
>>>>           a string that identifies the shared memory region.
>>>
>>> So technically, there is a property "xen,offset" that should be
>>> specified for the borrowers.
>>>
>>> TBH, I don't quite understand what this property is used for. So it is
>>> not quite clear why this is skipped.
>>>
>>> The Stefano is the author of the binding. So maybe he can explain the
>>> purpose of the property and help to document it in the commit message
>>> why this is ignored.
>>
>> It looks like it is something we introduced to handle the case where memory
>> from the owner is shared with multiple borrowers. Each borrower would
>> have its own offset within the region shared by the owner:
>>
>> https://marc.info/?l=xen-devel&m=154110446604365&w=2

Thanks for the pointer :). Now, I remember what this was meant for.

>>
> 
> IMHO, "xen,offset" more fits in the xen dts? We configure it in borrower memory node,
> then later we shall only set up foreign memory map starting at the offset?

Yes and Yes.

> '''
>          domU1-shared-mem@10000000 {
>              compatible = "xen,domain-shared-memory-v1";
>              role = "borrower";
>              xen,shm-id = "my-shared-mem-0";
>              xen,shared-mem = <0x10000000 0x50000000 0x10000000>;
>              xen,offset = <0x0 0x01000000>;
>          }
> '''
> For borrower domain, only [0x11000000, 0x20000000) need to get mapped...
> Of course, we could limit the memory map in related Linux driver, but for safety,
> it should be at Xen?

Correct.

>   
>>
>> The use-case is a bit of a corner case but it looks valid. If I had to do it now, I
>> would at least mark "xen,offset" as "optional".
>>
>> I think we have two options here and I am happy with either one:
>>
>> 1) we add xen,offset = <0x0>;
>>
> 
> I will let v8 stay with this configuration, and a TODO for actual implementation.
Agree. It sounds the best approach for now.

Cheers,

-- 
Julien Grall

