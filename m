Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4578275C2
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jan 2024 17:50:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.663660.1033730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsp6-0004E5-Ta; Mon, 08 Jan 2024 16:50:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 663660.1033730; Mon, 08 Jan 2024 16:50:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rMsp6-0004C2-QA; Mon, 08 Jan 2024 16:50:00 +0000
Received: by outflank-mailman (input) for mailman id 663660;
 Mon, 08 Jan 2024 16:49:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rMsp5-0004Bu-AP
 for xen-devel@lists.xenproject.org; Mon, 08 Jan 2024 16:49:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMsp4-0001Bg-PA; Mon, 08 Jan 2024 16:49:58 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rMsp4-0004zI-HD; Mon, 08 Jan 2024 16:49:58 +0000
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
	bh=hOuTYi7gsAh3MunWe4T6PZaqyoEg+Vd7eYli0lTEJ1Y=; b=tKD4BTzj7G/Dgr/inCwUIBas5O
	VLadIVhtS3Eh6xX/QRqvyPfXepPY3yWyo8n7VkuW360XJm7aDOV3ta9n9do3DtVFmPQMKwOr/s4zR
	nRzJ0Xa2D5b5vI/eNSXTlrGSxxyREABfIkr+qYRDEB27rBtVzO3tdRyIX/keJ40PVttM=;
Message-ID: <b0283817-b8d4-4326-af5b-e2595af8d868@xen.org>
Date: Mon, 8 Jan 2024 16:49:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
Content-Language: en-GB
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Marco Solieri <marco.solieri@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
 <20240102095138.17933-5-carlo.nonato@minervasys.tech>
 <99295edf-6c9c-4d06-ba20-86db67100561@xen.org>
 <CAG+AhRWd9E5sQPY-sxN+WGTSWtvRXGN2FnZC2Vy6LPyynKGLcQ@mail.gmail.com>
 <4675a541-b9dc-476a-a6ff-0247a4403292@xen.org>
 <CAG+AhRX6Y2U6A1v=27KgUeWip115R1o+csEWcyCCooxE2Tac6w@mail.gmail.com>
 <33061994-0b49-4e4e-8698-d6901b9130dc@xen.org>
 <CAG+AhRXPt_e4+OUxbRLhf6W0reH1nmO7cC9-XoFKe_G8BVxt7w@mail.gmail.com>
 <e7029592-57e6-4c2a-ab11-f843047ce7f2@xen.org>
 <CAG+AhRV8B4dcoVHXbP2KW5xsB8BQRt4NpPuXsmjc1X149GZRRw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAG+AhRV8B4dcoVHXbP2KW5xsB8BQRt4NpPuXsmjc1X149GZRRw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Carlo,

On 08/01/2024 16:31, Carlo Nonato wrote:
> On Mon, Jan 8, 2024 at 4:32 PM Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 08/01/2024 15:18, Carlo Nonato wrote:
>>>> No. I am saying that that we should not be able to allow changing the
>>>> colors after the memory has been allocated. To give an example, your
>>>> current code would allow:
>>>>
>>>>      1) Setup the P2M pools or allocate RAM
>>>>      2) Set the color
>>>>
>>>> This would render the coloring configuration moot.
>>>>
>>>> Whether we want to allow changing the coloring before hand is a
>>>> different question and as I wrote earlier on, I don't mind if you want
>>>> to forbid that.
>>>
>>> At the moment I'm relying on the toolstack in the sense that I know that it
>>> will set colors right after domain creation and before memory allocation.
>>> Calling alloc_domheap_pages() without a coloring configuration makes Xen
>>> crash, so it's mandatory to have the configuration done before any allocation.
>>> I know that we shouldn't rely on the toolstack this much, but I didn't
>>> find a better way. Given this assumption, looking for an already existing
>>> color configuration of a domain is sufficient to avoid what you are saying.
>>>
>>> Is it possible to enforce such a constraint with domctl? > I mean to be sure that this domctl will be called at a precise time.
>>
>> Yes. You can...
>>
>>>
>>> Thanks.
>>>
>>>>> I don't know what to check that.
>>>>
>>>> You can check the size of the P2M pool (d->arch.paging.p2m_total_pages)
>>>> is still 0. I think for RAM, you can check d->tot_pages == 0.
>>
>> ... reject the call if either of the two fields are not zero.
> 
> What I'm saying is that Xen would crash before even reaching this point if no
> colors were provided. Let's say that the toolstack or whatever hypercall user
> isn't calling this domctl at all (or not at the right time), then the domain
> colored allocator would always return null pages since there are no colors.
> We would have a crash and your if (or mine) would be useless.

Really? I can believe that NULL may be returned but a crash... If that's 
the case, then this should be fixed.

> 
> Let's say that now the domctl is called at the right time (no p2m,
> no tot_pages, no colors) then we can set the colors and everything works.
>  From this point other calls to this domctl would be skipped because of your
> if which is equivalent to mine (checking for colors existence).

So I misunderstood the implementation of is_domain_llc_colored(). I 
would have thought it was based on whether the domain has colors. But 
instead, it is based on whether coloring is enabled globally.

So I agree that the checks are not necessary today. But if 
is_domain_llc_colored() is changed, then this may not be correct anymore.

So I think there are some clarifications required. If the 'd' will never 
matter, then probably is_domain_llc_colored() should be removed. If not, 
then we want to add the check in the domctl (or at minimum document it).

> 
> Also bringing in checks on p2m would require arch specific code which I was
> trying to avoid.

Fair enough. But the first step is to make the sure the code is correct 
and Xen doesn't crash. We can then discuss about avoiding arch specific 
code.

BTW, all your LLC code is implemented in arch/arm. So if it is really 
intended to contain zero arch specific code, then shouldn't it be 
implemented in common/?

Cheers,

-- 
Julien Grall

