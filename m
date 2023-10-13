Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE9E7C8204
	for <lists+xen-devel@lfdr.de>; Fri, 13 Oct 2023 11:28:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.616340.958266 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrERw-0004mP-M9; Fri, 13 Oct 2023 09:27:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 616340.958266; Fri, 13 Oct 2023 09:27:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qrERw-0004ji-Iu; Fri, 13 Oct 2023 09:27:16 +0000
Received: by outflank-mailman (input) for mailman id 616340;
 Fri, 13 Oct 2023 09:27:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qrERv-0004jc-MU
 for xen-devel@lists.xenproject.org; Fri, 13 Oct 2023 09:27:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrERv-0003Z4-1q; Fri, 13 Oct 2023 09:27:15 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qrERu-0004WZ-T7; Fri, 13 Oct 2023 09:27:15 +0000
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
	bh=FDgLVysHtO91TYsdClVbd7flP0a3/hrBKpzeEw4nO9w=; b=PDYQUp7LU/Tw28hemozZGQKhvt
	UWzNuBOmdU5I5rZNF1OE2XDCYvJJ2IXMAo7JXOqVNiaSQnHWzwi0U3DNEvkFMRzbY4EcqdE0ChcI3
	CpFeMTlYLESgYdz41m0I/UrNkzYXUgnrq4IVaZRilUq2z9NCw9tYTM+qojfqYZrGvYHo=;
Message-ID: <75a00257-c062-4d82-9b64-1707ce4566e6@xen.org>
Date: Fri, 13 Oct 2023 10:27:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: MISRA C:2012 D4.11 caution on staging
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, consulting@bugseng.com,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich
 <jbeulich@suse.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 roger.pau@citrix.com, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>
References: <7972c20f361126022fa97f6b51ca2d9c@bugseng.com>
 <61f04d4b-34d9-4fd1-a989-56b042b4f3d8@citrix.com>
 <baa73fa24385b39bc6e82c4ccb08bd13@bugseng.com>
 <26f09702-9340-41ae-afcc-808becb67876@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <26f09702-9340-41ae-afcc-808becb67876@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 11/10/2023 08:51, Andrew Cooper wrote:
> On 11/10/2023 3:47 pm, Nicola Vetrini wrote:
>> On 11/10/2023 02:15, Andrew Cooper wrote:
>>> On 10/10/2023 5:31 pm, Nicola Vetrini wrote:
>>>> Hi,
>>>>
>>>> as you can see from [1], there's a MISRA C guideline, D4.11, that is
>>>> supposed to be clean
>>>> (i.e., have no reports), but has a caution on an argument to memcpy
>>>> (the second argument might be null according to the checker, given a
>>>> set of assumptions on
>>>> the control flow). To access the report just click on the second link
>>>> in the log, which should take you to a webpage with a list of
>>>> MISRA guidelines. Click on D4.11 and you'll see the full report, which
>>>> I pasted below for convenience.
>>>>
>>>> If the finding is genuine, then some countermeasure needs to be taken
>>>> against this
>>>> possible bug, otherwise it needs to be motivated why the field
>>>> config->handle can't
>>>> be null at that point.
>>>> The finding is likely the result of an improvement made to the
>>>> checker, because the first
>>>> analysis I can see that spots it happened when rc1 has been tagged,
>>>> but that commit does not
>>>> touch the involved files.
>>>>
>>>> [1] https://gitlab.com/xen-project/xen/-/jobs/5251222578
>>>
>>> That's a false positive, but I'm not entirely surprised that the checker
>>> struggled to see it.
>>>
>>> First,
>>>
>>> ASSERT(is_system_domain(d) ? config == NULL : config != NULL);
>>>
>>> All system domains (domid >= 0x7ff0, inc IDLE) pass a NULL config.  All
>>> other domains pass a real config.
>>>
>>> Next,
>>>
>>> /* DOMID_{XEN,IO,etc} (other than IDLE) are sufficiently constructed. */
>>> if ( is_system_domain(d) && !is_idle_domain(d) )
>>>      return d;
>>>
>>> So at this point we only have the IDLE domain and real domains.
>>>
>>> And finally, the complained-about construct is inside an:
>>>
>>> if ( !is_idle_domain(d) )
>>>      ...
>>>
>>> hence config cannot be NULL, but only because of the way in which
>>> is_{system,idle}_domain() interact.
>>>
>>> ~Andrew
>>
>> Ok. I think this should be documented as a false positive using the
>> comment deviation mechanism
>> in the false-positive-eclair.json file (once a name for the prefix is
>> settled on in the
>> other thread).
>>
> 
> Yeah - I was expecting that.
> 
> This code is mid-cleanup (in my copious free time, so not for several
> releases now...) but even when it is rearranged sufficiently for IDLE to
> have an earlier exit, I still wouldn't expect a static analyser to be
> able to recognise this as being safe.

Looking through the analysis, I think Eclair properly detect the IDLE 
domain. But it thinks the domain ID has changed mid function (see my 
other reply to Stefano).

So we can return early for the IDLE domain, then this should silence 
Eclair. That said, it is unclear to me why it thinks the domain_id can 
change...

A simple way to fix it would be to have a local boolean that will be 
used in place of is_idle_domain(d). This should help Eclair to detect 
that a domain cannot change its ID in the middle of domain construction.

Cheers,

-- 
Julien Grall

