Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D96606192
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 15:26:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426785.675471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVYU-0004Ko-9J; Thu, 20 Oct 2022 13:25:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426785.675471; Thu, 20 Oct 2022 13:25:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olVYU-0004Hs-63; Thu, 20 Oct 2022 13:25:50 +0000
Received: by outflank-mailman (input) for mailman id 426785;
 Thu, 20 Oct 2022 13:25:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1olVYS-0004H2-Hn
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 13:25:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olVYQ-0008NQ-5U; Thu, 20 Oct 2022 13:25:46 +0000
Received: from [54.239.6.185] (helo=[192.168.1.74])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1olVYP-00051R-VP; Thu, 20 Oct 2022 13:25:46 +0000
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
	bh=Z83FGAYtnjKsvqfju3zJYZ++2A5BC6NbzUFcINsFP4g=; b=vrhY8mDUMvebQBnaXs3mWR/H9I
	cO29H+uzR/GYHKmUDyRBjqZ9P9ANA9YMQHiotCAodhbcvBckNndtyWQu68MhgMdgYrTGNSTvQCyCr
	5E3cim4yDl8JgnaI/H6vk2Ei+C7+9Wlx6HG7PxRjhUq0eeCr1GXeWMvwhou0s7mYKEUw=;
Message-ID: <a87302d7-c9b0-d6b9-9d8d-ebbf6b85f389@xen.org>
Date: Thu, 20 Oct 2022 14:25:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: Policy: A release acks for the release manager's patches (was Re:
 [PATCH v5 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in p2m_init())
To: Jan Beulich <jbeulich@suse.com>, George Dunlap <dunlapg@umich.edu>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 George Dunlap <george.dunlap@citrix.com>, Henry Wang <Henry.Wang@arm.com>
References: <20221018142346.52272-1-Henry.Wang@arm.com>
 <20221018142346.52272-3-Henry.Wang@arm.com>
 <CAFLBxZZ59zkuNJM1vQSv_Syv8i0Q_dAFk0p-JXY4oFs0cCUSnQ@mail.gmail.com>
 <adc567a7-c338-477d-bf8d-b73300c36f6a@suse.com>
Content-Language: en-US
From: Julien Grall <julien@xen.org>
In-Reply-To: <adc567a7-c338-477d-bf8d-b73300c36f6a@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 20/10/2022 14:12, Jan Beulich wrote:
> On 19.10.2022 17:28, George Dunlap wrote:
>> On Tue, Oct 18, 2022 at 3:24 PM Henry Wang <Henry.Wang@arm.com> wrote:
>>
>>> Hardware using GICv2 needs to create a P2M mapping of 8KB GICv2 area
>>> when the domain is created. Considering the worst case of page tables
>>> which requires 6 P2M pages as the two pages will be consecutive but not
>>> necessarily in the same L3 page table and keep a buffer, populate 16
>>> pages as the default value to the P2M pages pool in p2m_init() at the
>>> domain creation stage to satisfy the GICv2 requirement. For GICv3, the
>>> above-mentioned P2M mapping is not necessary, but since the allocated
>>> 16 pages here would not be lost, hence populate these pages
>>> unconditionally.
>>>
>>> With the default 16 P2M pages populated, there would be a case that
>>> failures would happen in the domain creation with P2M pages already in
>>> use. To properly free the P2M for this case, firstly support the
>>> optionally preemption of p2m_teardown(), then call p2m_teardown() and
>>> p2m_set_allocation(d, 0, NULL) non-preemptively in p2m_final_teardown().
>>> As non-preemptive p2m_teardown() should only return 0, use a
>>> BUG_ON to confirm that.
>>>
>>> Since p2m_final_teardown() is called either after
>>> domain_relinquish_resources() where relinquish_p2m_mapping() has been
>>> called, or from failure path of domain_create()/arch_domain_create()
>>> where mappings that require p2m_put_l3_page() should never be created,
>>> relinquish_p2m_mapping() is not added in p2m_final_teardown(), add
>>> in-code comments to refer this.
>>>
>>> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M
>>> pool")
>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
>>>
>>
>>
>> Henry brought this patch to my attention because it needs a release ack,
>> but it doesn't seem proper for Henry to be the one to release-ack his own
>> patches. :-)
>>
>> I propose that a suitable rule would be:
>>
>> "If the release manager themselves have submitted a patch which needs a
>> release ack, then the patch needs a release ack from one of the Committers
>> who is not involved in the patch."
> 
> Like Andrew I think a self-release-ack, as was common practice in the past,
> is quite fine. These are entirely different hats that the person would be
> wearing.

I have done it a few times when I was RM and I remember been unease in 
some cases.

I can understand that some release manager may not want to do it to 
avoid any conflict of interest.

IMHO, it would be better to have a policy similar to what George 
suggested. So the way the patches are deal is consistent across all 
release cycles.

Cheers,

-- 
Julien Grall

