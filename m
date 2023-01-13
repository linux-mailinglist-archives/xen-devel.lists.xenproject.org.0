Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB2F8669358
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 10:53:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.477007.739494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGkR-0006nE-Pl; Fri, 13 Jan 2023 09:53:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 477007.739494; Fri, 13 Jan 2023 09:53:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGGkR-0006kK-MQ; Fri, 13 Jan 2023 09:53:19 +0000
Received: by outflank-mailman (input) for mailman id 477007;
 Fri, 13 Jan 2023 09:53:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pGGkQ-0006jP-HQ
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 09:53:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGGkP-00069C-VS; Fri, 13 Jan 2023 09:53:17 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.6.109]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pGGkP-0004RR-Li; Fri, 13 Jan 2023 09:53:17 +0000
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
	bh=8pfgQl2mn9F5L7jLw/qzo0IU8snzgpXloGwCpRa8eD8=; b=eNLFxcc0Wfhq3218pS9vIwq92j
	vCKHOfVXK3bMTlZT49GjoBO9p9dOXn/2d6FbwQ7OAuDQTIXJbg4SigZ96eV5FqoUN1AGV2e4XArSz
	StiWxX0cp8jabo/+KYleOTlgESLtltw0RUeSoi0cS4xqN7xAR3mu3SaWcsIunCXpKZzs=;
Message-ID: <009d00d8-4ba9-167d-271f-0dde655415fa@xen.org>
Date: Fri, 13 Jan 2023 09:53:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 10/19] tools/xenstore: change per-domain node
 accounting interface
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20221213160045.28170-1-jgross@suse.com>
 <20221213160045.28170-11-jgross@suse.com>
 <da814fed-c177-b0ee-32be-ef0656692c82@xen.org>
 <05871696-1638-82d0-8d55-9088b4bb9a18@suse.com>
 <e9eeee72-ecd1-faaa-dc63-b57d50162bbf@xen.org>
 <7ba1b191-ef89-1e0d-0e1b-0b24159a9eb9@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <7ba1b191-ef89-1e0d-0e1b-0b24159a9eb9@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Juergen,

On 12/01/2023 05:49, Juergen Gross wrote:
> On 11.01.23 18:48, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 11/01/2023 08:59, Juergen Gross wrote:
>>>> ... to make sure domain_nbentry_add() is not returning a negative 
>>>> value. Then it would not work.
>>>>
>>>> A good example imagine you have a transaction removing nodes from 
>>>> tree but not adding any. Then the "ret" would be negative.
>>>>
>>>> Meanwhile the nodes are also removed outside of the transaction. So 
>>>> the sum of "d->nbentry + ret" would be negative resulting to a 
>>>> failure here.
>>>
>>> Thanks for catching this.
>>>
>>> I think the correct way to handle this is to return max(d->nbentry + 
>>> ret, 0) in
>>> domain_nbentry_add(). The value might be imprecise, but always >= 0 
>>> and never
>>> wrong outside of a transaction collision.
>>
>> I am bit confused with your proposal. If the return value is 
>> imprecise, then what's the point of returning max(...) instead of 
>> simply 0?
> 
> Please have a look at the use case especially in domain_nbentry(). 
> Returning
> always 0 would clearly break quota checks.

I am a bit concerned that we would have a code checking the quota based 
on an imprecise value.

At the moment, I don't have a better suggestion. But we should at least 
document in the code when we think the value is imprecise and explain 
why bypassing the quota check is OK (IOW who will check it?).

Cheers,

-- 
Julien Grall

