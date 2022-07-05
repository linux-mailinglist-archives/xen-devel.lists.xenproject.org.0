Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342E55664B5
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jul 2022 10:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360670.590090 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8dcd-0004Z7-Fk; Tue, 05 Jul 2022 08:09:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360670.590090; Tue, 05 Jul 2022 08:09:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8dcd-0004XH-Cv; Tue, 05 Jul 2022 08:09:27 +0000
Received: by outflank-mailman (input) for mailman id 360670;
 Tue, 05 Jul 2022 08:09:26 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o8dcc-0004XB-CI
 for xen-devel@lists.xenproject.org; Tue, 05 Jul 2022 08:09:26 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8dcc-0007bs-4I; Tue, 05 Jul 2022 08:09:26 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.0.187])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o8dcb-0000Ow-U8; Tue, 05 Jul 2022 08:09:26 +0000
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
	bh=Jj7tSBcIfDp8cmv6dKZdNQK/tyXjHeaCtGdb8D86sGE=; b=OL+RB3YC72wMF4a/iUiIJAAmc2
	J39OX85JDjtrgwCursN8mjIXqy7p1hSovpQeEbIbYfFlXP8n0/aJWhpznbyB7zXcj2nAYaEODnygs
	mXKXz57plsE8IKy/9XXuyeSgJcA2BiqSGXIX5/VrYsgehg5xZCNDUF4thUwnQegUE408=;
Message-ID: <721ef265-7b3f-80cc-3d26-bd88b9971d26@xen.org>
Date: Tue, 5 Jul 2022 09:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v5 7/8] xen/arm: create shared memory nodes in guest
 device tree
To: Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Chen <Wei.Chen@arm.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-8-Penny.Zheng@arm.com>
 <84641d6e-202d-934c-9ea9-bbf090e29bdb@xen.org>
 <alpine.DEB.2.22.394.2206241448040.2410338@ubuntu-linux-20-04-desktop>
 <DU2PR08MB7325CB781C338947D0576A19F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <DU2PR08MB7325CB781C338947D0576A19F7BE9@DU2PR08MB7325.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/07/2022 08:45, Penny Zheng wrote:
> Hi Stefano and Julien

Hi Penny,

>> -----Original Message-----
>> From: Stefano Stabellini <sstabellini@kernel.org>
>>>> +        res = fdt_property_cell(fdt, "xen,id", shm_id);
>>>
>>> Looking at the Linux binding, "xen,id" is meant to be a string. But
>>> here you are writing it as an integer.
>>
>> Good catch!
>>
>>
>>> Given that the Linux binding is already merged, I think the Xen
>>> binding should be changed.
>>
>> We would be compliant with both bindings (xen and linux) just by writing
>> shm_id as string here, but if it is not too difficult we might as well harmonize
>> the two bindings and also define xen,shm-id as a string.
>>
>> On the Xen side, I would suggest to put a clear size limit so that the string is
>> easier to handle.
> 
> I've already made the xen,shm-id parsed as a string too, seeing the below code:
> "
>      prop_id = fdt_get_property(fdt, node, "xen,shm-id", NULL);
>      if ( !prop_id )
>          return -ENOENT;
>      shm_id = simple_strtoul(prop_id->data, NULL, 10);

Why do you want to convert the string to a number?


>      if ( shm_id >= NR_MEM_BANKS )

IIRC, you are not using "shm_id" to index any bank. So why do you want 
to check against NR_MEM_BANKS?

>      {
>          printk("fdt: invalid `xen,shm-id` %lu for static shared memory node.\n",
>                 shm_id);
>          return -EINVAL;
>      }
> "
> The size limit is smaller than 256, just as stated in doc:
> "
> - xen,shm-id
> 
>      A string that represents the unique identifier of the shared memory
>      region. The maximum identifier shall be "xen,shm-id = 255".

The first sentence reads as the xen,shm-id can a free form string. But 
then the second sentence suggests a number (not a string).

In any case, it is still unclear why you want to convert the string to 
an ID. From my understanding, Stefano was suggested a limit on the 
characters rather than a limit on the number.

If the latter is desirable, then the documentation should be a bit 
clearer and you need to validate the input provided by the user.

Cheers,

-- 
Julien Grall

