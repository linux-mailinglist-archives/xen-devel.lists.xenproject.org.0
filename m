Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B8F32A10B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 14:37:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92365.174261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH5Cz-0005aa-Dd; Tue, 02 Mar 2021 13:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92365.174261; Tue, 02 Mar 2021 13:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH5Cz-0005aB-AY; Tue, 02 Mar 2021 13:37:05 +0000
Received: by outflank-mailman (input) for mailman id 92365;
 Tue, 02 Mar 2021 13:37:04 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lH5Cx-0005a6-Vx
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 13:37:04 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66384db7-8090-4698-b605-773ada8995cc;
 Tue, 02 Mar 2021 13:37:02 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BB811ABF4;
 Tue,  2 Mar 2021 13:37:01 +0000 (UTC)
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
X-Inumbo-ID: 66384db7-8090-4698-b605-773ada8995cc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614692221; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uupFA4C/fn0xh5XLyYOHw8bwB3n8qy4DmkdFn37v9VQ=;
	b=mbEvQB7Eya4rDU8W3pf+ztp/vCfGJ7T3oKaxxqAYwerqdkH6g9niijgI4DVIKinb0vtoR6
	OHuHk1V0aeG3wtZADQSy5pJHwm5sT2CjmODzo5sBHGCkgspAUr8c372spP9G4vPGYLSAgH
	MsNUFnUSmu/x7RW44SP00/SrnjPVwuo=
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
 <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
 <24637.4165.400955.400473@mariner.uk.xensource.com>
 <7b4c0c51-5a3c-b9bb-7c9c-62285095183b@suse.com>
 <24638.12124.687863.290191@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b2277907-b629-b398-858c-6bc5c4e2a0a0@suse.com>
Date: Tue, 2 Mar 2021 14:37:01 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24638.12124.687863.290191@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 02.03.2021 13:28, Ian Jackson wrote:
> Jan Beulich writes ("Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1"):
>> On 01.03.2021 17:03, Ian Jackson wrote:
>>> Jan Beulich writes ("[PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1"):
>>>> In this case the compiler is recognizing that no valid array indexes
>>>> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
>>>> ...)), but oddly enough isn't really consistent about the checking it
>>>> does (see the code comment).
>>> ...
>>>> -        if (this_cpu == cpu || x2apic_cluster(this_cpu) != x2apic_cluster(cpu))
>>>> +        if ( this_cpu == cpu )
>>>> +            continue;
>>>> +        /*
>>>> +         * Guard in particular against the compiler suspecting out-of-bounds
>>>> +         * array accesses below when NR_CPUS=1 (oddly enough with gcc 10 it
>>>> +         * is the 1st of these alone which actually helps, not the 2nd, nor
>>>> +         * are both required together there).
>>>> +         */
>>>> +        BUG_ON(this_cpu >= NR_CPUS);
>>>> +        BUG_ON(cpu >= NR_CPUS);
>>>> +        if ( x2apic_cluster(this_cpu) != x2apic_cluster(cpu) )
>>>>              continue;
>>>
>>> Is there some particular reason for not putting the BUG_ON before the
>>> if test ?  That would avoid the refactoring.
>>
>> I want it to be as close as possible to the place where the issue
>> is. I also view the refactoring as a good thing, since it allows
>> a style correction as a side effect.
> 
> I'm afraid that at this stage of the release I would prefer changes to
> be as small as reasonably sensible.  So unless there is some
> reason, other than taste, style or formatting, could we please just
> introduce the new BUG_ON and not also do other refactoring.

FAOD: That's fine - I'll keep this queued for 4.16 then. I did put
a question mark behind the version anyway.

Jan

