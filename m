Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C3C59F644
	for <lists+xen-devel@lfdr.de>; Wed, 24 Aug 2022 11:32:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.392325.630599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmjm-0003TV-JD; Wed, 24 Aug 2022 09:31:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 392325.630599; Wed, 24 Aug 2022 09:31:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oQmjm-0003QM-GD; Wed, 24 Aug 2022 09:31:50 +0000
Received: by outflank-mailman (input) for mailman id 392325;
 Wed, 24 Aug 2022 09:31:49 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oQmjl-0003QG-QU
 for xen-devel@lists.xenproject.org; Wed, 24 Aug 2022 09:31:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQmjh-0000jF-1L; Wed, 24 Aug 2022 09:31:45 +0000
Received: from [54.239.6.185] (helo=[192.168.29.89])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oQmjg-0001DA-QU; Wed, 24 Aug 2022 09:31:44 +0000
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
	bh=URDNVEULvuO8FVqb8qmpd+UDlBSg5udN1317EIL/nVw=; b=T1qKc3IhKr6R+4b/LB1kD1iMSw
	+vMYXDR/cnFbk7ffozTcX+mTVkiKwgc00xGAu/eSZQEosy93ImSpN1nnpNVwWhkmZ8l1jL7LpWlcx
	3IBR/iBCTaN8jSG868r3XKnYCc+++iDy79A7Av+06WGKJQ3FSPkCLax67g3Q7BdWQWK0=;
Message-ID: <bea39396-43ba-9d21-7ada-00dd70614fd2@xen.org>
Date: Wed, 24 Aug 2022 10:31:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.2
Subject: Re: [PATCH v10 2/9] xen: do not free reserved memory into heap
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>,
 Penny Zheng <Penny.Zheng@arm.com>
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20220816023658.3551936-1-Penny.Zheng@arm.com>
 <20220816023658.3551936-3-Penny.Zheng@arm.com>
 <6c2d0111-3ac3-83aa-145f-432f5fae0167@suse.com>
 <8430ec87-bbd2-d074-b313-84d5f31def1e@xen.org>
 <677b1763-7cd2-e867-9e28-db0779bb6785@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <677b1763-7cd2-e867-9e28-db0779bb6785@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 24/08/2022 10:27, Juergen Gross wrote:
> On 24.08.22 11:03, Julien Grall wrote:
>> Hi,
>>
>> On 16/08/2022 07:40, Jan Beulich wrote:
>>> On 16.08.2022 04:36, Penny Zheng wrote:
>>>> +void free_domstatic_page(struct page_info *page)
>>>> +{
>>>> +    struct domain *d = page_get_owner(page);
>>>> +    bool drop_dom_ref;
>>>> +
>>>> +    if ( unlikely(!d) )
>>>> +    {
>>>> +        ASSERT_UNREACHABLE();
>>>> +        printk("The about-to-free static page %"PRI_mfn" must be 
>>>> owned by a domain\n",
>>>> +               mfn_x(page_to_mfn(page)));
>>>> +        return;
>>>> +    }
>>>
>>> For the message to be useful as a hint if the assertion triggers, it
>>> wants printing ahead of the assertion. I also think it wants to be a
>>> XENLOG_G_* kind of log level, so it would be rate limited by default
>>> in release builds. Just to be on the safe side.
>>
>> +1
>>
>>> (I'm not in favor of
>>> the log message in the first place, but I do know that Julien had
>>> asked for one.)
>> TBH, I think all ASSERT_UNREACHABLE() paths should be accompanied with 
>> a printk(). This would also allow us to catch issue in production 
>> rather than in only in debug.
> 
> What about something like the following then?

That could be a first step. I still think a message like Penny has added 
in the patch is useful.

Cheers,

-- 
Julien Grall

