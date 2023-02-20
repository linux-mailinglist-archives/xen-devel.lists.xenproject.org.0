Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C26B469CF23
	for <lists+xen-devel@lfdr.de>; Mon, 20 Feb 2023 15:16:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498153.768972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU6x0-00028t-0o; Mon, 20 Feb 2023 14:15:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498153.768972; Mon, 20 Feb 2023 14:15:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pU6wz-00026Q-TY; Mon, 20 Feb 2023 14:15:29 +0000
Received: by outflank-mailman (input) for mailman id 498153;
 Mon, 20 Feb 2023 14:15:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pU6wy-00026K-2e
 for xen-devel@lists.xenproject.org; Mon, 20 Feb 2023 14:15:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pU6wx-0001Zn-0f; Mon, 20 Feb 2023 14:15:27 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231] helo=[10.95.98.51])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pU6ww-00006y-Om; Mon, 20 Feb 2023 14:15:26 +0000
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
	bh=QMsLr1C+LnFAyEtyEki6LwbJg1Un3IlzvmAULNT/j24=; b=dTYyNeyYCuMMjYlkd9OUj4P0W7
	Ft8bOTpkidciiowO75cUOWMKxpOoas1Mgy7QNgTkbnriAaApoCeMEnCMV82Za4Al0Z0bgywylPGAP
	VE4BzrAPg73AB8nn7ETree5tNchMpCOEBdTsSvthIg6s6aHVCDWuUFWJSoj3MQMdzbec=;
Message-ID: <a0431ac1-4d1a-23c4-cb31-1d9d8812fc94@xen.org>
Date: Mon, 20 Feb 2023 14:15:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH v2 01/13] tools/xenstore: don't allow creating too many
 nodes in a transaction
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
References: <20230120100028.11142-1-jgross@suse.com>
 <20230120100028.11142-2-jgross@suse.com>
 <2131198f-f54b-2c38-8104-1c8b63e9990c@xen.org>
 <c203062e-fd76-3aa1-8014-bf7d13eae1aa@suse.com>
 <bd355c4c-b3a9-ac79-8522-5ff227ae26ab@xen.org>
 <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <adae39fe-1b72-e4ac-eb17-8bbfb28011f2@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/02/2023 13:49, Juergen Gross wrote:
> On 20.02.23 13:07, Julien Grall wrote:
>> Hi Juergen,
>>
>> On 20/02/2023 11:04, Juergen Gross wrote:
>>> On 20.02.23 10:46, Julien Grall wrote:
>>>> Hi Juergen,
>>>>
>>>> On 20/01/2023 10:00, Juergen Gross wrote:
>>>>> The accounting for the number of nodes of a domain in an active
>>>>> transaction is not working correctly, as it allows to create arbitrary
>>>>> number of nodes. The transaction will finally fail due to exceeding
>>>>> the number of nodes quota, but before closing the transaction an
>>>>> unprivileged guest could cause Xenstore to use a lot of memory.
>>>>
>>>> I know I said I would delay my decision on this patch. However, I 
>>>> was still expecting the commit message to be updated based on our 
>>>> previous discussion.
>>>
>>> As said before, I was waiting on the settlement of our discussion before
>>> doing the update.
>>
>> This is not a very good practice to resend a patch without recording 
>> the disagreement because new reviewers may not be aware of the 
>> disagreement and this could end up to be committed by mistake...
> 
> You said you wanted to look into this patch in detail after the previous
> series, so I move it into this series. The wording update would strongly
> depend on the outcome of the discussion IMO, so I didn't do it yet.
This could have been mentioned after ---. This could allow people to 
understand the concern and then participate.

> 
>>>> Also thinking more about it, "The transaction will finally fail due 
>>>> to exceeding the number of nodes quota" may not be true for a couple 
>>>> of reasons:
>>>>    1) The transaction may removed a node afterwards.
>>>
>>> Yes, and? Just because it is a transaction, this is still a violation of
>>> the quota. Even outside a transaction you could use the same reasoning,
>>> but you don't (which is correct, of course).
>>
>> I can understand your point. However, to me, the goal of the 
>> transaction is to commit everything in one go at the end. So the 
>> violations in the middle should not matter.
> 
> Of course they should.
> 
> We wouldn't allow to write over-sized nodes, even if they could be 
> rewritten in
> the same transaction with a smaller size.

I view the two different.

> We wouldn't allow to create nodes which would violate overall memory
> consumption.
> 
> We wouldn't allow nodes with more permission entries than allowed, even 
> if they
> could be reduced in the same transaction again.
> 
> I don't see why the number of nodes shouldn't be taken into account.
> 
>> Furthermore, I would expect a transaction to work on a snapshot of the 
>> system. So it feels really strange to me that we are constantly 
>> checking the quota with the updated values rather than the initial one.
> 
> You are aware that the code without this patch is just neglecting the nodes
> created in the transaction? It just is using the current number of nodes
> outside any transaction for quota check.

Are you referring to the quota check within the transaction?

> So I could easily create a 
> scenario
> where my new code will succeed, but the current one is failing:
> Assume node quota is 1000, and at start of the transaction the guest is 
> owning
> 999 nodes. In the transaction the guest is deleting 10 nodes, then dom0 is
> creating 5 additional nodes owned by the guest. The central node counter 
> is now
> 1004 (over quota), while the in-transaction count is 994.
> In the 
> transaction the
> guest can now happily create a new node (#995) with my patch, but will 
> fail to
> do so without (it sees the 1004 due to the transaction count being 
> ignored).

This doesn't sound correct. To do you have any test I could use to check 
the behavior?

Cheers,

-- 
Julien Grall

