Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A9D96029B9
	for <lists+xen-devel@lfdr.de>; Tue, 18 Oct 2022 12:57:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424846.672581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okkGz-0007R5-Cp; Tue, 18 Oct 2022 10:56:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424846.672581; Tue, 18 Oct 2022 10:56:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okkGz-0007PE-92; Tue, 18 Oct 2022 10:56:37 +0000
Received: by outflank-mailman (input) for mailman id 424846;
 Tue, 18 Oct 2022 10:56:35 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okkGx-0007P8-Mp
 for xen-devel@lists.xenproject.org; Tue, 18 Oct 2022 10:56:35 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okkGw-0007Km-Nx; Tue, 18 Oct 2022 10:56:34 +0000
Received: from [15.248.2.52] (helo=[10.24.67.27])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okkGw-0004zM-HD; Tue, 18 Oct 2022 10:56:34 +0000
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
	bh=EAoh4xPEOs9HbyFwRm1j5W/DubrhLm9PeOLwpJwIbVQ=; b=rFhBQlJIj8kWMC1VZtUXurWfzt
	GXfk51LnYwDhr5ryJw0hLC3Ws+BRqjUmmeO0PuUh6FPmo+o26H3qNAoFhc29tBdIahOei8xqIWoGu
	pvBEcHeC8VOFChTHSRXw/n/f1hEbitBVDNVdfQA3VlVQwlDX0LVYOqgoTB3xe64U05ws=;
Message-ID: <fbc42d87-e96f-3343-cc63-a14564549c02@xen.org>
Date: Tue, 18 Oct 2022 11:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
Subject: Re: [PATCH] xen/arm: p2m: fix pa_range_info for 52-bit pa range
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>,
 Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221017173209.236781-1-burzalodowa@gmail.com>
 <ddef5ab7-c217-546d-0e5d-294465a49586@amd.com>
 <65b46c0e-3499-ce6c-dcd6-76c506115c6e@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <65b46c0e-3499-ce6c-dcd6-76c506115c6e@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Xenia,

On 18/10/2022 11:27, Xenia Ragiadakou wrote:
> On 10/18/22 12:02, Michal Orzel wrote:
> 
> Hi Michal,
> 
>> Hi Xenia,
>>
>> On 17/10/2022 19:32, Xenia Ragiadakou wrote:
>>>
>>>
>>> Currently the pa_range_info for the 52-bit pa range advertizes that the
>>> p2m root table consists of 8 concatenated tables at level 3, which does
>>> not make much sense.
>> I think the current code advertises 8 concatenated tables at level -1 
>> (sl0=3 -> root_level=-1)
>> which is obviously incorrect, but the commit msg should be updated.
> 
> I did the same mistake in my email but I did not want to hijack the 
> thread that 's why I did not come back to correct my error.
> According to the manual, to support 52-bit pa range with 4KB granule 
> with the root table at level -1, you need to set SL2=1 and SL0=0.
> SL0=3 configures the root table at level 3.

Which section are you reading? Looking at the definition of VTCR_EL2.SL0 
(D17-6375, ARM DDI 0487I.a), the field has different meaning depending 
on whether the feature TTST (Small translation table) is present.

SL0 would be reserved when TTST is not present. That said, it looks like 
LPA requires TTST.

> 
>> Funnily enough p2m_root_level is unsigned so it would lead to overflow

Did you mean underflow rather than overflow?

>> (p2m_root_level would end up with (1 << 32) - 1 instead of -1).
> 
> Actually, currently, there is no support at all in XEN neither for LPA 
> (LPA support for 4KB is not checked, VCTR DS and SL2 are not set etc) 
> nor level -1 (the root table level is determined only based on sl0, the 
> number of possible levels is hardcoded to 4 in many places etc). I don't 
> think that there is even support for accessing other than the first 
> table of concatenated root tables but I need to verify that (I assume 
> this based on the way LPAE_TABLE_INDEX_GS is implemented).

I am not sure I understand this. Are you saying that concatenation can 
be used for non-root table?

> 
> This entry is populated in the pa_range_info table just to prevent XEN 
> from falling into this
> if ( pa_range >= ARRAY_SIZE(pa_range_info) || 
> !pa_range_info[pa_range].pabits )
>          panic("Unknown encoding of ID_AA64MMFR0_EL1.PARange %x\n", 
> pa_range);

I think it would be worth to point out in the commit message that the 
value is not used so far. So this is only update for correctness.

Cheers,

-- 
Julien Grall

