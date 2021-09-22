Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF28414630
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 12:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192455.342904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzUG-0000YB-He; Wed, 22 Sep 2021 10:28:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192455.342904; Wed, 22 Sep 2021 10:28:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mSzUG-0000Vt-Di; Wed, 22 Sep 2021 10:28:24 +0000
Received: by outflank-mailman (input) for mailman id 192455;
 Wed, 22 Sep 2021 10:28:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mSzUF-0000Vn-64
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 10:28:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mSzUE-0004mO-CB; Wed, 22 Sep 2021 10:28:22 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mSzUD-0001fQ-Gd; Wed, 22 Sep 2021 10:28:22 +0000
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
	bh=CPMr5A/aryLVbQ2Idr7tUHKgDUVUTrk5R3/EN889HlU=; b=liPhpRWuzeS1lH6J2x93akwJmM
	ksdPwY2QOyIXqtk1z5O41lOEOorTd119bdZUcVAdbaNcXnKQmFY2Ub6nC4l+wc/h3LvbflRBnMkQ4
	ku6dFlSJ3pcO/cnibhV9OaWVE36MX3UX+Ipwi34y0Srrj6Y3PQ89sui2njV/CcFZQrxQ=;
Subject: Re: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call from
 gnttab_map_frame()
To: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
 <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
 <YUmYpzhJrBZkSYyd@MacBook-Air-de-Roger.local>
 <ae0fb20c-b7c9-2467-0951-b84b2f647382@suse.com>
 <YUr2zZL3kV4/nBQp@MacBook-Air-de-Roger.local>
 <8fd9e2d5-b875-ef7d-d80a-15b6ba2948b5@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <b7947619-3520-174c-f5ec-49564ee048a1@xen.org>
Date: Wed, 22 Sep 2021 15:28:15 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <8fd9e2d5-b875-ef7d-d80a-15b6ba2948b5@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi,

On 22/09/2021 14:42, Jan Beulich wrote:
> On 22.09.2021 11:26, Roger Pau Monné wrote:
>> On Tue, Sep 21, 2021 at 12:12:05PM +0200, Jan Beulich wrote:
>>> On 21.09.2021 10:32, Roger Pau Monné wrote:
>>>> On Mon, Sep 20, 2021 at 05:27:17PM +0200, Jan Beulich wrote:
>>>>> On 20.09.2021 12:20, Roger Pau Monné wrote:
>>>>>> On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
>>>>>>> --- a/xen/include/asm-arm/grant_table.h
>>>>>>> +++ b/xen/include/asm-arm/grant_table.h
>>>>>>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||           \
>>>>>>
>>>>>> I'm slightly confused by this checks, don't you need to check for
>>>>>> gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
>>>>>> guest_physmap_remove_page?
>>>>>
>>>>> Why? It's ogfn which gets passed to the function. And it indeed is the
>>>>> prior GFN's mapping that we want to remove here.
>>>>>
>>>>>> Or assuming that ogfn is not invalid can be used to imply a removal?
>>>>>
>>>>> That implication can be (and on x86 is) used for the incoming argument,
>>>>> i.e. "gfn". I don't think "ogfn" can serve this purpose.
>>>>
>>>> I guess I'm confused due to the ogfn checks done on the Arm side that
>>>> are not performed on x86. So on Arm you always need to explicitly
>>>> unhook the previous GFN before attempting to setup a new mapping,
>>>> while on x86 you only need to do this when it's a removal in order to
>>>> clear the entry?
>>>
>>> The difference isn't with guest_physmap_add_entry() (both x86 and
>>> Arm only insert a new mapping there), but with
>>> xenmem_add_to_physmap_one(): Arm's variant doesn't care about prior
>>> mappings. And gnttab_map_frame() gets called only from there. This
>>> is effectively what the first paragraph of the description is about.
>>
>> OK, sorry, it wasn't clear to me from the description. Could you
>> explicitly mention in the description that the removal is moved into
>> gnttab_set_frame_gfn on Arm in order to cope with the fact that
>> xenmem_add_to_physmap_one doesn't perform it.
> 
> Well, it's not really "in order to cope" - that's true for the placement
> prior to this change as well, so not a justification for the change.
> Nevertheless I've tried to make this more clear by changing the 1st
> paragraph to:
> 
> "Without holding appropriate locks, attempting to remove a prior mapping
>   of the underlying page is pointless, as the same (or another) mapping
>   could be re-established by a parallel request on another vCPU. Move the
>   code to Arm's gnttab_set_frame_gfn(); it cannot be dropped there since
>   xenmem_add_to_physmap_one() doesn't call it either (unlike on x86). Of
>   course this new placement doesn't improve things in any way as far as
>   the security of grant status frame mappings goes (see XSA-379). Proper
>   locking would be needed here to allow status frames to be mapped
>   securely."
> 
>> TBH I think it would be in our best interest to try to make
>> xenmem_add_to_physmap_one behave as close as possible between arches.
>> This discrepancy between x86 and Arm regarding page removal is just
>> going to bring more trouble in the long term, and hiding the
>> differences inside gnttab_set_frame_gfn just makes it even more
>> obscure.
> 
> Stefano, Julien?

This would be ideal as I don't particular like the approach taken in 
this patch. But AFAICT, this would require us to implement an M2P. Or is 
there another way to do it?

In another context, I saw the suggestion to bring an M2P on Arm. But I 
am still somewhat split whether this is really worth it for the current use.

Cheers,

-- 
Julien Grall

