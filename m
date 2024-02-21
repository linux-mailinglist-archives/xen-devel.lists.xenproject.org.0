Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 606E685D3BD
	for <lists+xen-devel@lfdr.de>; Wed, 21 Feb 2024 10:35:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.683913.1063538 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcizo-0000dI-BN; Wed, 21 Feb 2024 09:34:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 683913.1063538; Wed, 21 Feb 2024 09:34:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rcizo-0000aw-7f; Wed, 21 Feb 2024 09:34:32 +0000
Received: by outflank-mailman (input) for mailman id 683913;
 Wed, 21 Feb 2024 09:34:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rcizm-0000aq-Rd
 for xen-devel@lists.xenproject.org; Wed, 21 Feb 2024 09:34:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcizl-0007R0-3l; Wed, 21 Feb 2024 09:34:29 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rcizk-0003uX-Uo; Wed, 21 Feb 2024 09:34:29 +0000
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
	bh=HpeaWn16Dj4m5UJcWha4wY7PV7aKK81DpJk4qFhDKNg=; b=PsjWQzK0x2EGofoUHScOpvCOPw
	P5gw6RwPf0brJKFwJ1Oq9xOeGDKenTvcG/YpeZoF2IfgenUfyntrKDhP8BoIHFTLl1uvKHMytSgs/
	DjL11mDG8SOopkadzAoTr7xvTYl3DuMFNfcEV4b7lao1U2ZP6EU2b+rB2taw9mLedQW8=;
Message-ID: <3a277c20-462d-44f1-bedb-dc0adba04224@xen.org>
Date: Wed, 21 Feb 2024 09:34:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] almost fully ignore zero-size flush requests
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a0a7fa35-4615-4a9b-9887-569353f05e33@suse.com>
 <26ff8f42-2a76-4f8d-9af6-5830b0aae739@suse.com>
 <7dd78c97-b82f-4ae1-a257-98f612c6bad2@xen.org>
 <6466155e-9883-4743-a897-ef565f14fdf0@suse.com>
 <a2348c5f-39ce-42f3-ad2a-a5edf88352e9@xen.org>
 <d0090122-c013-4dbf-97a2-3003352433a1@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <d0090122-c013-4dbf-97a2-3003352433a1@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 20/02/2024 12:25, Jan Beulich wrote:
> On 20.02.2024 12:52, Julien Grall wrote:
>> Hi Jan,
>>
>> On 20/02/2024 08:26, Jan Beulich wrote:
>>> On 19.02.2024 23:22, Julien Grall wrote:
>>>> Title: I would add 'gnttab:' to clarify which subsystem you are modifying.
>>>
>>> That's how I actually have it here; it's not clear to me why I lost the
>>> prefix when sending.
>>>
>>>> On 05/02/2024 11:03, Jan Beulich wrote:
>>>>> Along the line with observations in the context of XSA-448, besides
>>>>> "op" no field is relevant when the range to be flushed is empty, much
>>>>> like e.g. the pointers passed to memcpy() are irrelevant (and would
>>>>> never be "validated") when the passed length is zero. Split the existing
>>>>> condition validating "op", "offset", and "length", leaving only the "op"
>>>>> part ahead of the check for length being zero (or no flushing to be
>>>>> performed).
>>>>
>>>> I am probably missing something here. I understand the theory behind
>>>> reducing the number of checks when len == 0. But an OS cannot rely on it:
>>>>      1) older hypervisor would still return an error if the check doesn't
>>>> pass)
>>>
>>> Right, but that's no reason to keep the bogus earlier behavior.
>>
>> Hmmm... I am not sure why you say the behavior is bogus. From the commit
>> message, it seems this is just an optimization that have side effect
>> (ignoring the other fields).
> 
> I don't view this as primarily an optimization; I'm in particular after
> not raising errors for cases where there is no error to be raised.
> Hence the comparison to memcpy(), which you can pass "bogus" pointers
> so long as you pass zero size.

The part I am missing is why this approach is better than what we have. 
So far what you described is just a matter of taste.

To give a concrete example, if tomorrow a contributor decides to send a 
patch undoing what you did (IOW enforcing the check for zero-length or 
replace | with two branches), then on what grounds I will be able to 
refuse their patch?

Cheers,

-- 
Julien Grall

