Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39956925C3
	for <lists+xen-devel@lfdr.de>; Fri, 10 Feb 2023 19:49:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493558.763550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYS6-0003vl-Gd; Fri, 10 Feb 2023 18:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493558.763550; Fri, 10 Feb 2023 18:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQYS6-0003sJ-DZ; Fri, 10 Feb 2023 18:48:54 +0000
Received: by outflank-mailman (input) for mailman id 493558;
 Fri, 10 Feb 2023 18:48:53 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQYS5-0003s4-LR
 for xen-devel@lists.xenproject.org; Fri, 10 Feb 2023 18:48:53 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQYS5-0006pz-CM; Fri, 10 Feb 2023 18:48:53 +0000
Received: from [54.239.6.186] (helo=[192.168.26.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQYS5-0008Se-6u; Fri, 10 Feb 2023 18:48:53 +0000
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
	bh=QwYFujgDUIOUFVIzvX71PlEI78uZdq3MdNYbJwHkR9Y=; b=veFaRSvXm+99hXWlBAfrmxJKdg
	znGqA6eijd1+PnQqE6nxWmyCjd0WcrdGFBhOEr+OAtKtiOJTUweXiBgURNxbpr5Ysk/vX6Onzxio7
	KJAV/Ena+fAJsdsGLBUKIr5dP1y+oa/dMmXrIslXgOCveGWGFgUF/2YyDkXTob1Hqyp0=;
Message-ID: <44ccfe42-2dd2-9739-bbf1-fe39ce63ae33@xen.org>
Date: Fri, 10 Feb 2023 18:48:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [XEN][RFC PATCH v4 11/16] common/device_tree: Add rwlock for
 dt_host
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Luca.Fancellu@arm.com
References: <20221207061815.7404-1-vikram.garhwal@amd.com>
 <20221207061815.7404-5-vikram.garhwal@amd.com>
 <9560a124-020c-6a5c-d4ce-c26e52413bd2@xen.org>
 <796a88a8-03d2-14f8-be50-10085d785eed@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <796a88a8-03d2-14f8-be50-10085d785eed@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 01/02/2023 17:05, Vikram Garhwal wrote:
> On 12/7/22 8:31 AM, Julien Grall wrote:
>>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>>> ---
>>>   xen/common/device_tree.c      | 27 +++++++++++++++++++++++++++
>>>   xen/include/xen/device_tree.h |  6 ++++++
>>>   2 files changed, 33 insertions(+)
>>>
>>> diff --git a/xen/common/device_tree.c b/xen/common/device_tree.c
>>> index acf26a411d..51ee2a5edf 100644
>>> --- a/xen/common/device_tree.c
>>> +++ b/xen/common/device_tree.c
>>> @@ -140,6 +140,8 @@ const struct dt_property *dt_find_property(const 
>>> struct dt_device_node *np,
>>>       if ( !np )
>>>           return NULL;
>>>   +    read_lock(&dt_host->lock);
>>> +
>>>       for ( pp = np->properties; pp; pp = pp->next )
>>>       {
>>>           if ( dt_prop_cmp(pp->name, name) == 0 )
>>> @@ -150,6 +152,7 @@ const struct dt_property *dt_find_property(const 
>>> struct dt_device_node *np,
>>>           }
>>>       }
>>>   +    read_unlock(&dt_host->lock);
>>>       return pp;
>>>   }
>>>   @@ -336,11 +339,14 @@ struct dt_device_node 
>>> *dt_find_node_by_name(struct dt_device_node *from,
>>>       struct dt_device_node *np;
>>>       struct dt_device_node *dt;
>>>   +    read_lock(&dt_host->lock);
>>> +
>>>       dt = from ? from->allnext : dt_host;
>>>       dt_for_each_device_node(dt, np)
>>>           if ( np->name && (dt_node_cmp(np->name, name) == 0) )
>>>               break;
>>>   +    read_unlock(&dt_host->lock);
>>>       return np;
>>
>> ... I was expecting the read lock to also protect the value returned 
>> from being freed. But this is not the case.
>>
> Okay. Shall I remove the lock from here and perhaps add it when 
> dt_find_node_by_name() and other related functions are called?

It is a possibility. I would need to see the end result to be sure a 
lock is actually suitable.

Maybe we will end up to need a refcounting instead if we keep the DT 
node for longer.

Cheers,

-- 
Julien Grall

