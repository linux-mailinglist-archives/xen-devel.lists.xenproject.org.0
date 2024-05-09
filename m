Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB18F8C0F64
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 14:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719232.1121850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s52d2-00079H-RR; Thu, 09 May 2024 12:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719232.1121850; Thu, 09 May 2024 12:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s52d2-00076Z-Ny; Thu, 09 May 2024 12:12:04 +0000
Received: by outflank-mailman (input) for mailman id 719232;
 Thu, 09 May 2024 12:12:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s52d0-00076T-W5
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 12:12:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s52d0-0000zu-Mw; Thu, 09 May 2024 12:12:02 +0000
Received: from [15.248.2.239] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s52d0-0005lf-B8; Thu, 09 May 2024 12:12:02 +0000
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
	bh=rkPAf+otm3SjNAG5343agvv9UQeGDPXADvf0hs0GFd4=; b=DZzWHSLAi9fENydgKe3YbzY4us
	NpgY/vE9Lc1InQanWHOOC6cJ/E1AU+cAWNeKQSDGgxhK7WH07rucuUVdo6nQm96CJqNGbVnM1ZEAJ
	wDMYx01CLEa0X8hahkSsttRr+WWM3sIimFRUiCv5OyOztKVL0vaXiPGytw75wKve7mkc=;
Message-ID: <37b842c7-c46e-4948-8139-a07bfc2a6f37@xen.org>
Date: Thu, 9 May 2024 13:12:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] xen/p2m: put reference for superpage
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Luca Fancellu <Luca.Fancellu@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Penny Zheng
 <Penny.Zheng@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-4-luca.fancellu@arm.com>
 <b7d1d40b-c634-4830-aa4b-b0475bdff8fc@xen.org>
 <9F196831-D294-4227-B86F-E8EEACB5B076@arm.com>
 <0857d348-1305-40d2-9596-e0e5f4490c4a@xen.org>
 <64648f8c-3eea-47c5-bdc5-6d4fc6531c60@xen.org> <ZjyFxrvHJ04ZlBGg@macbook>
 <bd463f7a-eadf-441f-96e3-3a39f647f160@xen.org> <ZjyzTCOSeNvPq2Np@macbook>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZjyzTCOSeNvPq2Np@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 09/05/2024 12:28, Roger Pau Monné wrote:
> On Thu, May 09, 2024 at 10:50:56AM +0100, Julien Grall wrote:
>>
>>
>> On 09/05/2024 09:13, Roger Pau Monné wrote:
>>> On Wed, May 08, 2024 at 11:11:04PM +0100, Julien Grall wrote:
>>> Also the interactions with the remote domain would need to be audited,
>>> as the remote domain shattering the superpage would need to be
>>> replicated in the mapping side in order to account for the changes.
>>
>> ... I don't understand this one. How is this different from today's where a
>> domain can foreign map a 2MB which may be using a superpage in the remote
>> domain?
> 
> Hm, right, I was wrong with that I think, as long as proper references
> as taken for the superpage entries it should be fine.
> 
>>>   Not sure all paths will be easy to
>>> audit for preemption if it's more than relinquish_p2m_mapping() that
>>> you need to adjust.
>>
>> I thought about it yesterday. But I came to the conclusion that if we have
>> any concern about removing 1GB foreign superpage then we would already have
>> the problem today as a domain can map contiguously 1GB worth of foreign
>> mapping using small pages.
> 
> Yeah, but in that case addition or removal is done in 4K chunks, and
> hence we can preempt during the operation.

I am not entirely sure how that would work. From my understand, today, 
most of the users of the P2M code expects the operation to complete in 
one go and if preemption is needed then the caller is responsible to 
handle it by breaking up the happy.

With your suggestion, it sounds like you want to rework how the 
preemption today and push it to the P2M code. This would mean we would 
need to modify all the callers to check for -EERESTART (or similar) and 
also tell them how many pages were handled so the call can be restarted 
where it stopped. Is it what you had in mind?

I don't expect the work to be trivial, so I wonder if this is really 
worth it to try to change the way we preempt.

> 
> OTOH for 1GB given the code here the page could be freed in one go,
> without a chance of preempting the operation.
> 
> Maybe you have to shatter superpages into 4K entries and then remove
> them individually, as to allow for preemption to be possible by
> calling put_page() for each 4K chunk?
This would require to allocate some pages from the P2M pool for the 
tables. As the pool may be exhausted, it could be problematic when 
relinquishing the resources.

It may be possible to find a way to have memory available by removing 
other mappings first. But it feels a bit hackish and I would rather 
prefer if we avoid allocating any memory when relinquishing.

So I think we want to allow at most 2MB superpages for foreign mapping.

Cheers,

-- 
Julien Grall

