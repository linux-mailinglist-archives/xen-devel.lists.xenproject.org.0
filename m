Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 538003EF139
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 20:00:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168009.306748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG3NX-0001ig-1u; Tue, 17 Aug 2021 17:59:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168009.306748; Tue, 17 Aug 2021 17:59:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG3NW-0001gs-UB; Tue, 17 Aug 2021 17:59:58 +0000
Received: by outflank-mailman (input) for mailman id 168009;
 Tue, 17 Aug 2021 17:59:57 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mG3NV-0001gm-O6
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 17:59:57 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mG3NM-0003Ig-7m; Tue, 17 Aug 2021 17:59:48 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mG3NM-0006Pd-06; Tue, 17 Aug 2021 17:59:48 +0000
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
	bh=2T3iSOV73BT2tnxZyTVcuGR/w5rMH5CGtVR/b1Vl9JA=; b=XF52QKGJj9mbyt6uastrLOlZhT
	T4wGveSIOwZOp7fA1MTtmaB0wCKwXMYhoEmO96M/FScsiBdWBkrzdkWpqpzDyr89QN7HQoVcndPW5
	q14hYC7m7C2T8aH20lVaDihyeJIO/BouglEM8M+U0JbU3YwBBgxmKHf69kzrClh/u9lU=;
Subject: Re: [RFC PATCH] xen/memory: Introduce a hypercall to provide
 unallocated space
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
References: <1627489110-25633-1-git-send-email-olekstysh@gmail.com>
 <80fafc01-f063-d6e5-1c08-7ad64550310c@citrix.com>
 <e8db3021-78a5-e040-a70b-62ca5b500149@xen.org>
 <4de5ed21-379e-b618-44c8-924d88b1a519@citrix.com>
 <bbc7f597-5249-20a0-cac9-13f594268299@xen.org>
 <5176e91c-1971-9004-af65-7a4aefc7eb78@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <0d71ddd2-d947-9495-c70a-eec18f9b5a94@xen.org>
Date: Tue, 17 Aug 2021 18:59:44 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <5176e91c-1971-9004-af65-7a4aefc7eb78@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Jan,

On 03/08/2021 13:49, Jan Beulich wrote:
>>>>> Once a safe range (or ranges) has been chosen, any subsequent action
>>>>> which overlaps with the ranges must be rejected, as it will violate the
>>>>> guarantees provided.
>>>>>
>>>>> Furthermore, the ranges should be made available to the guest via normal
>>>>> memory map means.  On x86, this is via the E820 table, and on ARM I
>>>>> presume the DTB.  There is no need for a new hypercall.
>>>>
>>>> Device-Tree only works if you have a guest using it. How about ACPI?
>>>
>>> ACPI inherits E820 from x86 (its a trivial format), and UEFI was also
>>> based on it.
>>>
>>> But whichever...  All firmware interfaces have a memory map.
>>
>> This will be UEFI memory map. However, I am a bit confused how we can
>> tell the OS the region will be used for grant/foreign mapping. Is it
>> possible to reserved a new type?
> 
> As with about any non-abandoned specification it is in principle
> possible to define/reserve new types. Question how practical it is,
> i.e. in particular how long it may take to get to the point where
> we have a firmly reserved type. Short of this I wonder whether you,
> Andrew, were thinking to re-use an existing type (in which case the
> question of disambiguation arises).

Copying/pasting the IRC discussion related to this:

[11:32:19] <Diziet> julieng: I have skimread the thread "[RFC PATCH] 
xen/memory: Introduce a hypercall to provide unallocated space"
[11:32:56] <Diziet> My impression is that it is converging on a workable 
solution but I am not sure.  Does it need any help ?
[12:20:32] <julieng> Diziet: I think we have a solution for Arm and DT. 
We are waiting on andyhhp for the ACPI part. He suggested to use the 
memory map but it is unclear how we could describe the safe region.
[13:01:49] <andyhhp> that's easy, seeing as we already have hypercall to 
convay that information, but feel free to skip the x86 side for v1 if 
that helps
[13:02:15] <andyhhp> it wants an extention to the PVH spec to define a 
new memory type
[13:04:09] <julieng> andyhhp: This doesn't really address the question 
to how we can define the memory type because this is not a spec we own. 
See 5176e91c-1971-9004-af65-7a4aefc7eb78@suse.com for more details..
[13:04:27] <andyhhp> after which it wants to appear in XENMEM_memory_map
[13:04:32] <andyhhp> this is a spec we own
[13:04:43] <julieng> We don't own the E820.
[13:05:19] <julieng> Nor the UEFI memory map.
[13:05:24] <andyhhp> no, we don't, but that's not the spec in question
[13:06:06] <andyhhp> the spec in question is the PVH start info and/or 
XENMEM_memory_map, both of which are "in the format of the E820" table, 
not "is an E820 table"
[13:06:27] <andyhhp> with almost 4 billion type identifiers avaialble
[13:07:03] <julieng> So what you are saying is let's pick up a random 
number and hope no-one will use it?
[13:07:34] <julieng> Because neither XENMEM_memory_map nor PVH start 
info exist for ACPI on Arm.
[13:08:17] <andyhhp> we (xen) are the source of this information, via a 
Xen specified API/ABI
[13:08:41] <andyhhp> we are entirely within our rights to document an 
extention, which has defined meaning under Xen
[13:09:03] <andyhhp> and yeah - you choose some Xen specific constant to 
go in the high bits of the type id or something
[13:09:04] <julieng> I agree for a domU. But for dom0, the memory map is 
the same as the host. So we have to make sure the number doesn't clash.
[13:09:49] <andyhhp> the chance of actually having a collision is 0, 
because in 30 years or so, about 10 types have been declared and handed out
[13:10:15] <andyhhp> and if a collision does occur, we add a second 
hypercall saying "this is a raw non-xenified E820 table, and here is the 
xenified one"

> 
> As a result I wonder whether a "middle" approach wouldn't be better:
> Have the range be determined up front (by tool stack or Xen), but
> communicate it to the guest by PV means (hypercall, shared info,
> start info, or yet some other table).
> 
> Jan
> 

-- 
Julien Grall

