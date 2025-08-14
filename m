Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B20DB270D4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 23:28:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082583.1442390 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umfTq-0002kC-5M; Thu, 14 Aug 2025 21:27:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082583.1442390; Thu, 14 Aug 2025 21:27:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umfTq-0002hs-1y; Thu, 14 Aug 2025 21:27:26 +0000
Received: by outflank-mailman (input) for mailman id 1082583;
 Thu, 14 Aug 2025 21:27:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QQqN=22=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1umfTo-0002hm-Uj
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 21:27:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 772316e2-7955-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 23:27:22 +0200 (CEST)
Received: from support.bugseng.com (support.bugseng.com [162.55.131.47])
 (Authenticated sender: nicola)
 by support.bugseng.com (Postfix) with ESMTPA id A28304EE3C04;
 Thu, 14 Aug 2025 23:27:21 +0200 (CEST)
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
X-Inumbo-ID: 772316e2-7955-11f0-b898-0df219b8e170
Authentication-Results: bugseng.com; arc=none smtp.remote-ip=162.55.131.47
ARC-Seal: i=1; d=bugseng.com; s=openarc; a=rsa-sha256; cv=none; t=1755206841;
	b=DCSHo0LKi2g3zD4PyGCXR9mlIQm9Zmm+J93eNTXs8EtxvIqjnRzDQOgLHm+h3WIYxYr6
	 ecUNk2RcasAmqQxCHrK5wpW76UfJVbTsvmKCv+zYbny192vFrWPtkpU2uGsnTqE5nP1ex
	 XcL45/eRjoRLg7b5F0xLtJFx/VCxhMQNiV8V55oo5L3n5l2glGxLuLyg04sNGSEkK7VvR
	 z23tsY/gIqzGJD9hL5M1gv5Cg0+DQwHmT2kiMKCI92Ogozq8G2tsWmq1Cxi91s805omAV
	 Prkim2CQ2TOBvaBpxuWhTNtW+0lGlQzR/oCXZpai/7GjMX2g83rzPhNnUonhxrhYWpeK4
	 9Y6tdXek/IIVoZJonuV+rUBFWXV1FQlWqhPQ4KSV8l9SHP48ze3V5OLOfuG3SZa7L/BLw
	 qSmTToBYnURm+owCXzkVzddtwZkDSIPFYem/4Ikflo5UhBqp6aQg4cI5vmx0gGLknB0Cd
	 89zdPsRA1VhOlp11zQiNCucXZO1yPPnuGTkpQxYoxODYlI0U4IxFEnuTs54p30CE+VnbK
	 hWKipJRTWOE/IGpsoWKifN5C8usUsX5mzhCPiBgwMww3odQ+XtTG2RoxwfKRV+erxiO6v
	 W23k3WMWwwtLEQOpEvx+0yFgmPlnGjgyWGOgu02qwNCSA9iRqNRfcKGud4Q4oCE=
ARC-Message-Signature: i=1; d=bugseng.com; s=openarc; a=rsa-sha256;
	c=relaxed/relaxed; t=1755206841;
	h=DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:
	 References:Message-ID:X-Sender:Organization:Content-Type:
	 Content-Transfer-Encoding;
	bh=YcEOhaBAHRv6Gh+reAkJBHW4l0+xSdsTx3IN3DpZN6I=;
	b=ulvDD/Dufp6wyYyd3ieUMm255/3uPBMJHi4OtEpzzRXLWZLQNAR1I+gAyo+zPm3n3w8/
	 y6ntiroGEEFeKB/QPETwc7CSGu8XrhZzm8w/pRNfj/GDHE0l7cChYF2ajsWp6IW8k4WD0
	 G10hLqAZsgTeN863hkbug+qC9wzbEHTWNEwewrNwe8f8JDAbGpn9EH1/pheKWSTU1bEoD
	 7iuWOlItlRbGtgeZlPMwiYT50dkyARTqr+Kqr5ysmRhWl/2Z8zlPJlCQCXG3asYK7E3ZZ
	 tFISykQYR1Fbn8f7VWCMZ4gmEiuNNyKVSFyJZ1bE/UMYq4m1Pz95e0dCjBdGKJdms6igJ
	 PcqR3Q5t0uplZ6iWm1uDtsWMVSf9371b2yMgGCTijBwTO/iG7+x6h/KuEDYXGuZsp36Ez
	 5/ZVONlxJWncD7rEdrzv3uaa5FO7wv9yaQLjkj5Ie/iVfOtgS9UfTfubQki02HzKl3iO1
	 6NHnB9CRN6GBvGEOea3eDYbTQtPAicLvU5hXl2CfcKr95a9WUdI6bzHY1QGOJzFRIWA7p
	 nbAB7B68AMLiUMroEez1osW9TBIRLLRgGPJr8+ZLIyTz7IIww5rLoCQGgf6tiXrYPNj5K
	 4WDISAoaQb5pH9nvek9RUl1O1ZfsGLgs1joLDmageQkqE2ws3TyoOajj/WMFIxc=
ARC-Authentication-Results: i=1; bugseng.com; arc=none smtp.remote-ip=162.55.131.47
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bugseng.com; s=mail;
	t=1755206841; bh=Eh9tldxbP/zhRe2/SLk12oOw3e0TiFibZU8eGhqSobY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=JOv2/BexPOKtqTmYsD8o3UPeCfnqbg1OkeDf8Adh51EOGU/wLKT6G/J2TzIAFBDm8
	 oUBXa4cMnh0F9mmDbOoyguw85DCEQpGeDGvxzPRp8KQhOWd2XyJzDdRyy0B6rvU0t3
	 +dlsmAkqt6VmAygiVFqaVrH3N4KBABcB+dYSm3TLk4bCIiiO3bq/B4tSjO4vjFc6Nn
	 boC0BegtaRJNVBlJ8JM3oePzLd2F9Dpx2Cyd8bjEQXJ1sTLyZuN8xt3OdjMOPRCJ3/
	 bVam0t7sPhchzoPOJxMb3axociMsSZJMomWUqBoTb9kY0DhDZiFU1SHiZBEhcdw5bR
	 N17obeMwSBrUw==
MIME-Version: 1.0
Date: Thu, 14 Aug 2025 23:27:21 +0200
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 13/22] x86: FRED enumerations
In-Reply-To: <c325aa24-d0e1-4895-89d3-3f7ec196407c@citrix.com>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-14-andrew.cooper3@citrix.com>
 <9b4da5b3-dd68-4052-92cc-fe322164eaa5@suse.com>
 <9cc46920-b1a6-4085-8481-abf0f1cd0aab@citrix.com>
 <c7e82bee-1b38-41e1-89c6-d1d3717087b2@suse.com>
 <b058cb18-7a03-403d-b0c4-402fc0353da2@citrix.com>
 <e3416a404c78156ff33de829c7b4b664@bugseng.com>
 <c325aa24-d0e1-4895-89d3-3f7ec196407c@citrix.com>
Message-ID: <6dc480fc8b508eb934cd937d3a438df3@bugseng.com>
X-Sender: nicola.vetrini@bugseng.com
Organization: BUGSENG s.r.l.
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-08-14 21:44, Andrew Cooper wrote:
> On 14/08/2025 8:37 pm, Nicola Vetrini wrote:
>> On 2025-08-14 13:47, Andrew Cooper wrote:
>>> On 14/08/2025 12:44 pm, Jan Beulich wrote:
>>>> On 14.08.2025 13:42, Andrew Cooper wrote:
>>>>> On 14/08/2025 12:20 pm, Jan Beulich wrote:
>>>>>> On 08.08.2025 22:23, Andrew Cooper wrote:
>>>>>>> --- a/xen/arch/x86/include/asm/x86-defns.h
>>>>>>> +++ b/xen/arch/x86/include/asm/x86-defns.h
>>>>>>> @@ -75,6 +75,7 @@
>>>>>>>  #define X86_CR4_PKE        0x00400000 /* enable PKE */
>>>>>>>  #define X86_CR4_CET        0x00800000 /* Control-flow
>>>>>>> Enforcement Technology */
>>>>>>>  #define X86_CR4_PKS        0x01000000 /* Protection Key
>>>>>>> Supervisor */
>>>>>>> +#define X86_CR4_FRED      0x100000000 /* Fast Return and Event
>>>>>>> Delivery */
>>>>>> ... a UL suffix added here for Misra.
>>>>> I was surprised, but Eclair is entirely fine with this.
>>>> And there is a use of the identifier in a monitored C file?
>>> 
>>> Yes.  traps-setup.c which definitely has not been added to an 
>>> exclusion
>>> list.
>>> 
>> 
>> Might look into it before the end of the week, if time allows. Is [1]
>> the right branch to look at?
>> 
>> [1]
>> https://gitlab.com/xen-project/hardware/xen-staging/-/commits/andrew/fred
> 
> Yes, although I am force pushing this with fixes as I find them.
> 
> In the latest run at the time of writing, I had one trivial R8.4
> violation to fix, and all other clean rules came up fine.  I expect the
> next run to be clean.
> 
> One thing that might be relevant, IIRC it's implementation defined
> behaviour what happens to constants which are wider than int to begin 
> with.
> 

See my other reply in this thread; the rule is concerned with the type 
of the constant present after preprocessing, which is defined in C99 
6.4.4.1.5 . As such, I'm not sure what you're hinting at regarding IDB 
here. Of course I might be wrong.

> ~Andrew

-- 
Nicola Vetrini, B.Sc.
Software Engineer
BUGSENG (https://bugseng.com)
LinkedIn: https://www.linkedin.com/in/nicola-vetrini-a42471253

