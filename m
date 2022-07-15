Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B115765A9
	for <lists+xen-devel@lfdr.de>; Fri, 15 Jul 2022 19:16:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.368392.599643 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOuZ-0006jx-Bd; Fri, 15 Jul 2022 17:15:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 368392.599643; Fri, 15 Jul 2022 17:15:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oCOuZ-0006gv-7h; Fri, 15 Jul 2022 17:15:31 +0000
Received: by outflank-mailman (input) for mailman id 368392;
 Fri, 15 Jul 2022 17:15:29 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oCOuX-0006gp-79
 for xen-devel@lists.xenproject.org; Fri, 15 Jul 2022 17:15:29 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOuW-0001UT-JZ; Fri, 15 Jul 2022 17:15:28 +0000
Received: from [54.239.6.188] (helo=[192.168.17.116])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oCOuW-0008Or-Di; Fri, 15 Jul 2022 17:15:28 +0000
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
	bh=jrJT0zNET/jrL2M1ahTkFOn4gMSsVaqUsxXHTqhaxs0=; b=bOc8OBGYtaB4BPVF7VnsgAKHlK
	nfx/nKEp1ZtcT5eBYVZSkEcvQyApPl5SqsQe6Tx6PQq+Mo8K9taO70yec3rG7nzzbjiuim+GC8qcC
	jCpVxHdoUN4mNL3z4M150urRzjSQ2CVCCr8wO/1u5dUCaaWX+UFHi4fitJBugRVIWn/Y=;
Message-ID: <f2e5a755-0f1e-ef18-21db-cbe6ef346886@xen.org>
Date: Fri, 15 Jul 2022 18:15:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH V6 2/2] xen/arm: Harden the P2M code in
 p2m_remove_mapping()
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
 <1652294845-13980-2-git-send-email-olekstysh@gmail.com>
 <42b0d343-a491-877c-3b5c-d9c95872774c@xen.org>
 <94afe35c-627c-8aba-37ce-1d017a2e4e3c@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <94afe35c-627c-8aba-37ce-1d017a2e4e3c@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 24/06/2022 16:31, Oleksandr wrote:
> 
> On 23.06.22 21:08, Julien Grall wrote:
>> Hi Oleksandr,
> 
> 
> Hello Julien

Hi Oleksandr,


> 
>>
>> On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>
>>> Borrow the x86's check from p2m_remove_page() which was added
>>> by the following commit: c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e
>>> "x86/p2m: don't assert that the passed in MFN matches for a remove"
>>> and adjust it to the Arm code base.
>>>
>>> Basically, this check is strictly needed for the xenheap pages only
>>> since there are several non-protected read accesses to our simplified
>>> xenheap based M2P approach on Arm (most calls to page_get_xenheap_gfn()
>>> are not protected by the P2M lock).
>>
>> To me, this read as you introduced a bug in patch #1 and now you are 
>> fixing it. So this patch should have been first.
> 
> 
> Sounds like yes, I agree. But, in that case I propose to rewrite this 
> text like the following:
> 
> 
> Basically, this check will be strictly needed for the xenheap pages only 
> *and* only after applying subsequent

NIT: s/only and only/, this is pretty clear that this patch is necessary 
for a follow-up patch.

Also please add "a" in from of subsequent because the two patches may 
not be committed together.

> commit which will introduce xenheap based M2P approach on Arm. But, it 
> will be a good opportunity
> to harden the P2M code for *every* RAM pages since it is possible to 
> remove any GFN - MFN mapping
> currently on Arm (even with the wrong helpers).

[...]

>>>
>>> Suggested-by: Julien Grall <jgrall@amazon.com>
>>> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>> ---
>>> You can find the corresponding discussion at:
>>> https://lore.kernel.org/xen-devel/82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org/ 
>>>
>>>
>>> Changes V5 -> V6:
>>>   - new patch
>>> ---
>>>   xen/arch/arm/p2m.c | 21 +++++++++++++++++++++
>>>   1 file changed, 21 insertions(+)
>>>
>>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>>> index f87b48e..635e474 100644
>>> --- a/xen/arch/arm/p2m.c
>>> +++ b/xen/arch/arm/p2m.c
>>> @@ -1311,11 +1311,32 @@ static inline int p2m_remove_mapping(struct 
>>> domain *d,
>>>                                        mfn_t mfn)
>>>   {
>>>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
>>> +    unsigned long i;
>>>       int rc;
>>>         p2m_write_lock(p2m);
>>> +    for ( i = 0; i < nr; )
>> One bit I really hate in the x86 code is the lack of in-code 
>> documentation. It makes really difficult to understand the logic.
>>
>> I know this code was taken from x86, but I would like to avoid making 
>> same mistake (this code is definitely not trivial). So can we document 
>> the logic?
> 
> 
> ok, I propose the following text right after acquiring the p2m lock:
> 
> 
>   /*
>    * Before removing the GFN - MFN mapping for any RAM pages make sure
>    * that there is no difference between what is already mapped and what
>    * is requested to be unmapped. If passed mapping doesn't match
>    * the existing one bail out early.

NIT: I would simply write "If they don't match bail out early".

Also, it would be good to explanation how this could happen. Something like:

"For instance, this could happen if two CPUs are requesting to unmap the 
same P2M concurrently."


>    */
> 
> 
> Could you please clarify, do you agree with both?

I have proposed some changes in both cases. I originally thought I would 
do the update in the commit. However, this is more than simple tweak, so 
would you mind to send a new version?

Cheers,

-- 
Julien Grall

