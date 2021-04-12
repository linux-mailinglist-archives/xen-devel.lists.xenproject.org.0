Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D42D35CA78
	for <lists+xen-devel@lfdr.de>; Mon, 12 Apr 2021 17:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.109337.208726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyqP-0000ho-FU; Mon, 12 Apr 2021 15:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 109337.208726; Mon, 12 Apr 2021 15:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lVyqP-0000hP-CR; Mon, 12 Apr 2021 15:51:21 +0000
Received: by outflank-mailman (input) for mailman id 109337;
 Mon, 12 Apr 2021 15:51:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q596=JJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lVyqO-0000hK-JA
 for xen-devel@lists.xenproject.org; Mon, 12 Apr 2021 15:51:20 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 07ebdc7f-00d7-4b53-89cc-fc8fe4beda37;
 Mon, 12 Apr 2021 15:51:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 469AEB317;
 Mon, 12 Apr 2021 15:51:18 +0000 (UTC)
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
X-Inumbo-ID: 07ebdc7f-00d7-4b53-89cc-fc8fe4beda37
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618242678; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ySzFyc2m+/hF5QuiGBCAs6tV9dvl6k34txaxGc4Ri7Y=;
	b=hoRfPgcrSFTW/gKUPo1Nwjegb53qSEWZmjU92mGry0y8gzRhn7ej1yDcw3xepgIOnyiW5+
	CvqQt5L5Zy1Xp9pI2cA5P3IGn6JDCQllad5f8qk35q3D9fE10iIWLm4Gdq845B8QDdul0K
	eNkvltxPHJdeGoPbWzGnhUpyYQj3nVY=
Subject: Re: [PATCH 1/2] x86: correct is_pv_domain() when !CONFIG_PV
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <7c040eff-2746-59e3-b657-64f5df3c9085@suse.com>
 <54013074-1fc4-1047-0d00-2762fcbc9ade@suse.com>
 <YHQUJw8H2tgNy5iY@Air-de-Roger>
 <169d6a5b-81ec-f347-8edc-60ba6ab0864f@suse.com>
 <YHReAkwZPnnh2itL@Air-de-Roger>
 <9571d2ac-e8ae-4105-5f92-0a81728f44d2@suse.com>
 <YHRqCh3zjUh1l2Kt@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8ea77cd-acab-c899-5bc2-416f4d784943@suse.com>
Date: Mon, 12 Apr 2021 17:51:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YHRqCh3zjUh1l2Kt@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 12.04.2021 17:40, Roger Pau Monné wrote:
> On Mon, Apr 12, 2021 at 05:24:41PM +0200, Jan Beulich wrote:
>> On 12.04.2021 16:49, Roger Pau Monné wrote:
>>> On Mon, Apr 12, 2021 at 12:07:12PM +0200, Jan Beulich wrote:
>>>> On 12.04.2021 11:34, Roger Pau Monné wrote:
>>>>> On Fri, Nov 27, 2020 at 05:54:57PM +0100, Jan Beulich wrote:
>>>>>> --- a/xen/include/xen/sched.h
>>>>>> +++ b/xen/include/xen/sched.h
>>>>>> @@ -985,7 +985,7 @@ static always_inline bool is_control_dom
>>>>>>  
>>>>>>  static always_inline bool is_pv_domain(const struct domain *d)
>>>>>>  {
>>>>>> -    return IS_ENABLED(CONFIG_PV) &&
>>>>>> +    return IS_ENABLED(CONFIG_X86) &&
>>>>>>          evaluate_nospec(!(d->options & XEN_DOMCTL_CDF_hvm));
>>>>>>  }
>>>>>>  
>>>>>> @@ -1011,7 +1011,7 @@ static always_inline bool is_pv_32bit_vc
>>>>>>  
>>>>>>  static always_inline bool is_pv_64bit_domain(const struct domain *d)
>>>>>>  {
>>>>>> -    if ( !is_pv_domain(d) )
>>>>>> +    if ( !IS_ENABLED(CONFIG_PV) || !is_pv_domain(d) )
>>>>>>          return false;
>>>>>
>>>>> I think overall is confusing to have a domain that returns true for
>>>>> is_pv_domain but false for both is_pv_{64,32}bit_domain checks.
>>>>>
>>>>> I know those are only the system domains, but it feels confusing and
>>>>> could cause mistakes in the future IMO, as then we would have to
>>>>> carefully think where to use ( is_pv_64bit_domain(d)
>>>>> || is_pv_32bit_domain(d) ) vs just using is_pv_domain(d), or
>>>>> IS_ENABLED(CONFIG_PV) && is_pv_domain(d)
>>>>
>>>> Imo it's not "then we would have to carefully think where to use ..."
>>>> but instead this patch is an indication that we should have been for
>>>> quite some time. For this reason (coming back to your first comment
>>>> at the top) I'm not sure adding a comment _there_ is actually useful.
>>>> Every use of is_pv_*() needs carefully considering which domains are
>>>> really meant.
>>>
>>> Maybe we shouldn't have used is_pv_domain as a way to hide code from
>>> the compiler and instead always provide dummy functions, as even with
>>> PV support compiled out we still need some of it for system domains.
>>>
>>> I'm not sure I have a good proposal to make, but it seems wrong to me
>>> that is_pv_domain(d) could be different than is_pv_64bit_domain(d) ||
>>> is_pv_32bit_domain(d).
>>
>> Hmm, so we're of opposite opinions - not sure what to do. Short of
>> having / introducing is_system_domain() or some such (with all the
>> needed auditing) I can't see how assuming the two would mean the
>> same could ever have been true. With what we have is_pv_domain() is
>> legitimately true for them, and both is_pv_{32,64}bit_domain() ought
>> to be false (as there's no specific bitness associated with them)
>> imo _at least_ when !PV.
> 
> It's all quite ugly, but I wasn't really getting your reasoning that
> system domains can be considered PV domains without a bitness.
> 
> I think we both agree that long term having is_system_domain would be
> the cleanest solution, but it needs a lot of auditing.

Yes.

> I think I would
> be fine if you could add a comment somewhere noting that system
> domains can be identified as PV domains without a bitness, so that
> it's likely less confusing in the future.

I've added

/*
 * Note that is_pv_domain() can return true (for system domains) even when
 * both is_pv_64bit_domain() and is_pv_32bit_domain() return false. IOW
 * system domains can be considered PV without specific bitness.
 */

immediately ahead of is_pv_domain(). Does this sound okay?

Jan

