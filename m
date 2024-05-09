Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C48FE8C0DCC
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 11:52:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719148.1121749 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s50QX-0007p3-OF; Thu, 09 May 2024 09:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719148.1121749; Thu, 09 May 2024 09:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s50QX-0007mt-LU; Thu, 09 May 2024 09:51:01 +0000
Received: by outflank-mailman (input) for mailman id 719148;
 Thu, 09 May 2024 09:51:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1s50QW-0007mn-1b
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 09:51:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s50QV-0006mv-KT; Thu, 09 May 2024 09:50:59 +0000
Received: from [15.248.2.239] (helo=[10.24.67.31])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1s50QV-0005CT-9s; Thu, 09 May 2024 09:50:59 +0000
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
	bh=Dbv5TjkeWmyORyLfXsOMt6XuaLjwJnv/029oy+C3QXQ=; b=eWHgfLsBmAaXDogX8myHRQDeRZ
	oH2QjOhP4C+GbdfSbsj/5w2elTG3BrfZlMV36vHFCpW/bkR1RmJ6cY6I7TMow1s8ijqksA419p0Oj
	NYhrfEeo1c1rrISV0ZYpXKJRdrLuuwqCAE+BoKfW6kT4nXgKIPDnGnAjHnvElWSwNz7Q=;
Message-ID: <bd463f7a-eadf-441f-96e3-3a39f647f160@xen.org>
Date: Thu, 9 May 2024 10:50:56 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZjyFxrvHJ04ZlBGg@macbook>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/05/2024 09:13, Roger Pau Monné wrote:
> On Wed, May 08, 2024 at 11:11:04PM +0100, Julien Grall wrote:
>> Hi,
>>
>> CC-ing Roger as he is working on adding support for the foreign mapping on
>> x86. Although, I am not expecting any implication as only 4KB mapping should
>> be supported.
> 
> I don't think we have plans on x86 to support foreign mappings with
> order != 0 ATM.
> 
> We would need a new interface to allow creating such mappings, and
> it's also not clear to me how the domain that creates such mappings
> can identify super-pages on the remote domain.  IOW: the mapping
> domain could request a super-page in the foreign domain gfn space,
> but that could end up being a range of lower order mappings.

I agree with this. But ...

> 
> Also the interactions with the remote domain would need to be audited,
> as the remote domain shattering the superpage would need to be
> replicated in the mapping side in order to account for the changes.

... I don't understand this one. How is this different from today's 
where a domain can foreign map a 2MB which may be using a superpage in 
the remote domain?

> 
>> On 08/05/2024 22:05, Julien Grall wrote:
>>> On 07/05/2024 14:30, Luca Fancellu wrote:
>>>>> On 7 May 2024, at 14:20, Julien Grall <julien@xen.org> wrote:
>>>>>
>>>>> Hi Luca,
>>>>>
>>>>> On 23/04/2024 09:25, Luca Fancellu wrote:
>>>>>> From: Penny Zheng <Penny.Zheng@arm.com>
>>>>>> But today, p2m_put_l3_page could not handle superpages.
>>>>>
>>>>> This was done on purpose. Xen is not preemptible and therefore
>>>>> we need to be cautious how much work is done within the p2m
>>>>> code.
>>>>>
>>>>> With the below proposal, for 1GB mapping, we may end up to call
>>>>> put_page() up to 512 * 512 = 262144 times. put_page() can free
>>>>> memory. This could be a very long operation.
>>>>>
>>>>> Have you benchmark how long it would take?
>>>>
>>>> I did not, since its purpose was unclear to me and was not commented
>>>> in the last serie from Penny.
>>>
>>> Honestly, I can't remember why it wasn't commented.
>>
>> I skimmed through the code to check what we currently do for preemption.
>>
>> {decrease, increase}_reservation() will allow to handle max_order() mapping
>> at the time. On a default configuration, the max would be 4MB.
>>
>> relinquish_p2m_mapping() is preempting every 512 iterations. One iteration
>> is either a 4KB/2MB/1GB mapping.
>>
>> relinquish_memory() is checking for preemption after every page.
>>
>> So I think, it would be ok to allow 2MB mapping for static shared memory but
>> not 1GB. relinquish_p2m_mapping() would also needs to be updated to take
>> into account the larger foreign mapping.
> 
> FWIW, relinquish_p2m_mapping() likely does more than what's strictly
> needed, as you could just remove foreign mappings while leaving other
> entries as-is?  The drain of the p2m pool and release of domain pages
> should take care of dropping references to the RAM domain memory?
I believe the code was written in a way we could easily introduce 
reference for all the mappings. This has been discussed a few times in 
the past but we never implemented it.

> 
>> I would consider to check for preemption if 't' is p2m_map_foreign and the
>> order is above 9 (i.e. 2MB).
> 
> How can those mappings be removed?

 From any p2m_* functions. On Arm we don't (yet) care about which 
mapping is replaced.

>  Is it possible for the guest to
> modify such foreign super-pages?

Yes.

>  Not sure all paths will be easy to
> audit for preemption if it's more than relinquish_p2m_mapping() that
> you need to adjust.

I thought about it yesterday. But I came to the conclusion that if we 
have any concern about removing 1GB foreign superpage then we would 
already have the problem today as a domain can map contiguously 1GB 
worth of foreign mapping using small pages.

I went through the various code paths and, I believe, the only concern 
would be if an admin decides to change the values from max_order() using 
the command line option "memop-max-order".

Cheers,

-- 
Julien Grall

