Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F8A3C4629
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jul 2021 10:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.154442.285395 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2rmn-0008Tt-Uv; Mon, 12 Jul 2021 08:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 154442.285395; Mon, 12 Jul 2021 08:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m2rmn-0008RH-Rk; Mon, 12 Jul 2021 08:59:33 +0000
Received: by outflank-mailman (input) for mailman id 154442;
 Mon, 12 Jul 2021 08:59:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1m2rmm-0008RB-Ls
 for xen-devel@lists.xenproject.org; Mon, 12 Jul 2021 08:59:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m2rml-0001il-Dv; Mon, 12 Jul 2021 08:59:31 +0000
Received: from [54.239.6.189] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1m2rml-0003Ij-7X; Mon, 12 Jul 2021 08:59:31 +0000
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
	bh=d+bCJYDqjlfJMW5H6z+eJhNAcZKBVzhukXJibUgBzfY=; b=wn+/wICYuTHVa/EVynTjQvbCY1
	rbqKJVZOmyktdH8yQnODqVb5+BZZLzjayXeWRcJnRnrpJjXVnq1xtFNJSONXIeZo/mQ+q24plcRYw
	5AUeoejMj+x4Vs9FbMVuIIfp0h9cX1M2vdTRm0063VPQZrhbXwA9VQAfhQg4/quInZNE=;
Subject: Re: [PATCH] tools/libxc: use uint32_t for pirq in
 xc_domain_irq_permission
To: Igor Druzhinin <igor.druzhinin@citrix.com>,
 Jan Beulich <jbeulich@suse.com>
Cc: iwj@xenproject.org, wl@xen.org, andrew.cooper3@citrix.com,
 george.dunlap@citrix.com, sstabellini@kernel.org, jgross@suse.com,
 christian.lindig@citrix.com, dave@recoil.org, xen-devel@lists.xenproject.org
References: <1625619764-23537-1-git-send-email-igor.druzhinin@citrix.com>
 <b1720313-d636-9c8c-3109-748dbe311187@xen.org>
 <5e454ba6-3d3f-9402-140d-f576f9124402@suse.com>
 <927c1c59-734a-4013-9286-137fd7026c26@xen.org>
 <e2def3e5-8e00-8b52-2d0f-5231963607ee@suse.com>
 <54b5ff4b-09ae-429b-4468-c1b4691079ed@xen.org>
 <3aa3fa32-f17b-507c-aafa-66ec3d41d29c@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <eed93e60-6394-458e-14b9-16c77ab993db@xen.org>
Date: Mon, 12 Jul 2021 09:59:28 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <3aa3fa32-f17b-507c-aafa-66ec3d41d29c@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Igor,

On 08/07/2021 03:06, Igor Druzhinin wrote:
> On 07/07/2021 14:21, Julien Grall wrote:
>> On 07/07/2021 14:14, Jan Beulich wrote:
>>> On 07.07.2021 14:59, Julien Grall wrote:
>>>> On 07/07/2021 13:54, Jan Beulich wrote:
>>>>> On 07.07.2021 14:51, Julien Grall wrote:
>>>>>> On 07/07/2021 02:02, Igor Druzhinin wrote:
>>>>>>> Current unit8_t for pirq argument in this interface is too 
>>>>>>> restrictive
>>>>>>> causing failures on modern hardware with lots of GSIs. That 
>>>>>>> extends down to
>>>>>>> XEN_DOMCTL_irq_permission ABI structure where it needs to be 
>>>>>>> fixed up
>>>>>>> as well. Internal Xen structures appear to be fine. Existing 
>>>>>>> users of
>>>>>>> the interface in tree (libxl, ocaml and python bindings) are 
>>>>>>> already using
>>>>>>> int for pirq representation that should be wide enough.
>>>>>>
>>>>>> By "int", I am assuming you imply "signed int", is that correct?
> 
> Yes, just "int" in the meaning "signed int" - I can clarify that in the 
> description.
> 
>>>>>> If so, should the function xc_domain_irq_permission() interface 
>>>>>> take an
>>>>>> int in parameter and check it is not negative?
>>>>>
>>>>> Please let's not make things worse than they are, the more that
>>>>
>>>> Well, what I am trying to prevent is surprise where the caller
>>>> mistakenly pass a negative value that will be interpreted as a positive
>>>> value...
>>>
>>> This happens all the time when converting from signed to unsigned
>>> perhaps just internally.
>>
>> I am not sure what's your point... Yes there are place in Xen that 
>> switch between signed and unsigned. We likely have some (latent) 
>> problem because of that...
> 
> Callers of libxc interface shouldn't have been using signed int at all.
> They just happen to do it at least in-tree - that's what I found and 
> mentioned
> in the description. At the same time "int" type is for now wide enough 
> so there
> is no immediate rush to fix them up.
> 
> That gets a little bit tricky with bindings - they themselves expose pirq
> as int. So a negative value could be passed by the caller and, given other
> similar interace functions like xc_physdev_map_pirq() are using "int pirq"
> to signal an error as negative value, that could be misinterpreted by lower
> levels.
> 
> We can add extra checks in bindings to avoid passing all negative values to
> libxc level. Would this be good enough?
> 
>>>> Such issues are beyong annoying to debug...
>>>
>>> No worse than any other out-of-bounds value, I would say.
>>>
>>>>   > ./CODING_STYLE is unambiguous in cases like this one.
>>>>
>>>> Hmmm... The coding style mention the fixed size but nothing about the
>>>> signedness of the type...
>>>
>>> Oh, sorry, yes. The adjustment for this even pre-dates the two
>>> patches to ./CODING_STYLE that I've on record as pending for
>>> nearly two years.
>>>
>>>> The alternative suggestion is to keep a unsigned type but check the bit
>>>> 31 is not set.
>>>
>>> Why? Why not bit 30 or bit 27? There's nothing special about
>>> bit 31 in an unsigned number.
>>
>> Bit 31 is the signed bit for signed number. The check would make sure 
>> that:
>>   1) The value will fit other hypercall (the PIRQ is described as int 
>> in a few of the structure)
>>   2) Catch potentially caller that would use the number that could 
>> potentially be interpreted as negative by other part of the hypervisor.
>>
>> That said, I can live with the implicit signed -> unsigned convertion, 
>> however the commit message should at least be clarified because it is 
>> misleading.
> 
> Could you specify which statement exactly is misleading (or needs 
> clariying)
> in the commit message?

The commit message is mentioning that all the callers are using "signed 
int" but then the patch will use "uint32_t" without really saying why...

I think adding something along the line to:

"While all the callers are using signed int, PIRQ indexes are not meant 
to be negative. Switch the type to unsigned 32-bit and leave the caller 
clean-up for future follow-up."

Cheers,

-- 
Julien Grall

