Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7C938A2DE
	for <lists+xen-devel@lfdr.de>; Thu, 20 May 2021 11:45:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.130854.244886 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljfFN-0003cg-Kn; Thu, 20 May 2021 09:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 130854.244886; Thu, 20 May 2021 09:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljfFN-0003af-Hh; Thu, 20 May 2021 09:45:41 +0000
Received: by outflank-mailman (input) for mailman id 130854;
 Thu, 20 May 2021 09:45:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ljfFL-0003aY-P4
 for xen-devel@lists.xenproject.org; Thu, 20 May 2021 09:45:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljfFL-0005QE-Iy; Thu, 20 May 2021 09:45:39 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ljfFL-0004CE-CY; Thu, 20 May 2021 09:45:39 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=BxH/GFn0fN7kXTcFiXRVG8uCM4g0mwU6q07w/M/m7Ig=; b=LQggWTT7QNPSJkC2L4mkw2h258
	ULqC1ytNIYweLOOH0uDGIzk4eq8TSPSfGzswD0cOxn8oVMQi8kekz3B80yoi4pn8OE7QakA+BMXkW
	1ld1H6ZzzmMjJ56sWY6OFpijZs1EJWuxMWJCy4ynRizhsXImMUQ3C/QrQ7AHzbR2lz9M=;
Subject: Re: [PATCH 03/10] xen/arm: introduce PGC_reserved
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@arm.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 nd <nd@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-4-penny.zheng@arm.com>
 <bc6a20ef-675d-bbd6-74f7-4ecc45805ee7@xen.org>
 <VE1PR08MB5215F3ECA8B5D9624E34A794F72B9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <2f4eb08e-261b-70c4-bcbc-e08db36a50a9@xen.org>
 <VE1PR08MB52155DD56E548E98AE937CE8F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <VE1PR08MB5215E19BFE3E7F329229D8E7F72A9@VE1PR08MB5215.eurprd08.prod.outlook.com>
 <44b46f35-cc51-9274-77f2-cfd18c998a38@xen.org>
 <b53c5ef5-ccab-a472-1edc-63082d89f09a@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4b36ce2c-e60f-8974-fa5b-b8f2261e25ad@xen.org>
Date: Thu, 20 May 2021 10:45:37 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <b53c5ef5-ccab-a472-1edc-63082d89f09a@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/05/2021 10:27, Jan Beulich wrote:
> On 20.05.2021 10:59, Julien Grall wrote:
>> On 20/05/2021 09:40, Penny Zheng wrote:
>>> Oh, Second thought on this.
>>> And I think you are referring to balloon in/out here, hmm, also, like
>>
>> Yes I am referring to balloon in/out.
>>
>>> I replied there:
>>> "For issues on ballooning out or in, it is not supported here.
>>
>> So long you are not using the solution in prod then you are fine (see
>> below)... But then we should make clear this feature is a tech preview.
>>
>>> Domain on Static Allocation and 1:1 direct-map are all based on
>>> dom0-less right now, so no PV, grant table, event channel, etc, considered.
>>>
>>> Right now, it only supports device got passthrough into the guest."
>>
>> So we are not creating the hypervisor node in the DT for dom0less domU.
>> However, the hypercalls are still accessible by a domU if it really
>> wants to use them.
>>
>> Therefore, a guest can easily mess up with your static configuration and
>> predictability.
>>
>> IMHO, this is a must to solve before "static memory" can be used in
>> production.
> 
> I'm having trouble seeing why it can't be addressed right away: 

It can be solved right away. Dom0less domUs don't officially know they 
are running on Xen (they could bruteforce it though), so I think it 
would be fine to merge without it for a tech preview.

> Such
> guests can balloon in only after they've ballooned out some pages,
> and such balloon-in requests would be satisfied from the same static
> memory that is associated by the guest anyway.

This would require some bookeeping to know the page was used previously. 
But nothing very challenging though.

Cheers,

-- 
Julien Grall

