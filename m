Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E43971306
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 11:12:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794053.1202722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaR7-0001jV-KC; Mon, 09 Sep 2024 09:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794053.1202722; Mon, 09 Sep 2024 09:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snaR7-0001h4-Gl; Mon, 09 Sep 2024 09:11:53 +0000
Received: by outflank-mailman (input) for mailman id 794053;
 Mon, 09 Sep 2024 09:11:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1snaR6-0001gx-61
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 09:11:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snaR5-0001op-MR; Mon, 09 Sep 2024 09:11:51 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snaR5-0006yX-D6; Mon, 09 Sep 2024 09:11:51 +0000
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
	bh=Y7qKGDGLYuqoBvMzcUxrMCFEXhrR/f6zskNUO+fvTqo=; b=M27KKCRfmnzbMkDtaZdJf35Am5
	3xwYKmJzPFK+GtxuoV4fXT8pnNFjQk9Q/5vYwZvcfm11jkiiaGa7YDCwJYmgX5XCtZnhfulIOjDRK
	v4d3vAbVyXqEjZ5d/97eH5PKVIKoIzzLBzHHONOj21oj2Llfou97/OrUNdmDKk2Gq9H4=;
Message-ID: <5de31172-8319-4cd3-9486-a6992a5cdc22@xen.org>
Date: Mon, 9 Sep 2024 10:11:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add Assumption of Use (AOU)
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20240906101318.1419954-1-ayan.kumar.halder@amd.com>
 <57632c2f-82e6-49bb-b989-e75c95070b03@xen.org>
 <46b9567e-d27c-467b-b21d-65d63b6cd1e2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <46b9567e-d27c-467b-b21d-65d63b6cd1e2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 09/09/2024 09:56, Michal Orzel wrote:
> Hi Julien,
> 
> On 08/09/2024 23:05, Julien Grall wrote:
>>
>>
>> Hi Ayan,
>>
>> On 06/09/2024 11:13, Ayan Kumar Halder wrote:
>>> From: Michal Orzel <michal.orzel@amd.com>
>>>
>>> AOU are the assumptions Xen relies on other components (eg platform, domains)
>>
>> Searching online, I think the abbrevition is AoU rather than AOU. This
>> would also match how we abbreviate in Xen (IOW if we use a lower case
>> letter from the expanded name, then the letter in the acronym is also
>> lower case).
>>
>>> to fulfill its requirements. In our case, platform means a combination of
>>> hardware, firmware and bootloader.
>>>
>>> We have defined AOU in the intro.rst and added AOU for the generic timer.
>>>
>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>> ---
>>>    .../reqs/design-reqs/arm64/generic-timer.rst  | 19 +++++++++++++++++++
>>>    docs/fusa/reqs/intro.rst                      | 10 ++++++++++
>>>    2 files changed, 29 insertions(+)
>>>
>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> index f2a0cd7fb8..9df87cf4e0 100644
>>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>> @@ -116,6 +116,25 @@ Rationale:
>>>
>>>    Comments:
>>>
>>> +Covers:
>>> + - `XenProd~emulated_timer~1`
>>> +
>>> +Assumption of Use on the Platform
>>> +=================================
>>> +
>>> +Expose system timer frequency via register
>>> +------------------------------------------
>>> +
>>> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
>>> +
>>> +Description:
>>> +Underlying platform shall ensure that CNTFRQ_EL0 register contains the system
>>> +timer frequency.
>>
>> The wording in [1] (not yet merged) implies that CNTFRQ_EL0 may be
> It is merged:
> https://xenbits.xen.org/gitweb/?p=xen.git;a=commit;h=51ad2c57a2d21b583a5944a0dc21c709af022f3c
> 
>> invalid. This seems to contradict the Assumption of Use. Can you explain
>> the difference?
> The requirement you refer to is written from a domain perspective and is about Xen exposing the frequency
> to domains via CNTFRQ and/or dt property. In case of a presence of dt property in the host dtb, Xen could for instance decide
> to emulate CNTFRQ instead of relying on the domain to parse the dt at runtime.

AFAICT, you can't trap CNTFRQ access. So what you suggest would not work.

> 
> The AoU on the platform (hw/firmware/bootloader) is written from Xen perspective and is about the platform
> exposing the correct frequency via register. This is Xen expected behavior on the platform. In other words, the platform should
> expose the correct frequency via register.

Xen is able to deal with broken CNTFRQ_EL0. So I don't understand why we 
we would want to make an assumption that it shall not be broken. What do 
you gain?


> 
> 
> 
>>
>>> +
>>> +Rationale:
>>
>> This seems to be a bit odd to have an empty section. Can you explain why?
> That's the format we decided to go with. It's been documented in docs/fusa/reqs/intro.rst.
> While AFAICT it is not strictly required for OFT, in the future we can decide to write our own parser to
> present the requirements in a nicer form that OFT exporter. Then, it will be easier for use if each
> requirement defines the same fields (I agree it's a matter of opinion but that's what we decided to use).

So this is explaining why you decided to add a section "Rationale", but 
this doesn't explain why you left it empty. Surely, if you write an 
assumption, you want to explain why.

Cheers,

-- 
Julien Grall


