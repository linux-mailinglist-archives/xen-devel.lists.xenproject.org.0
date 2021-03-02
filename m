Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5A53298F1
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 11:02:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92235.174025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1rB-0007vT-FU; Tue, 02 Mar 2021 10:02:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92235.174025; Tue, 02 Mar 2021 10:02:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH1rB-0007v4-C5; Tue, 02 Mar 2021 10:02:21 +0000
Received: by outflank-mailman (input) for mailman id 92235;
 Tue, 02 Mar 2021 10:02:19 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vttA=IA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lH1r9-0007uy-ML
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 10:02:19 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2ba1421b-d65f-424b-bb0d-582ced201441;
 Tue, 02 Mar 2021 10:02:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1AD8AD74;
 Tue,  2 Mar 2021 10:02:17 +0000 (UTC)
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
X-Inumbo-ID: 2ba1421b-d65f-424b-bb0d-582ced201441
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614679337; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a6g4Mjjf8sjhNeIrAXR0tJkEZNDVJRke9j41eMR8MCk=;
	b=TEHOQTBYl9UOLfd/tdAjm8OykW7MOM8OXBqBbf36B5zOUUa1tMty+qL2D8NK0CyHb0/I+4
	KBGm3Zz5UTDaJRZpFbgSgE2mutwWXfp1UwZzU1l7TCTyN/jCNJgpLrSMPF5/IzfnFUr7pP
	p1wlmh/UUDvNYnffjlESh9z0HGAyDJw=
Subject: Re: [PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1
To: Ian Jackson <iwj@xenproject.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>
References: <ad59eaf9-747c-f60e-16b7-121c9f86a1e0@suse.com>
 <1d8d5089-32a9-9c42-5949-8f9cd20f33e0@suse.com>
 <24637.4165.400955.400473@mariner.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7b4c0c51-5a3c-b9bb-7c9c-62285095183b@suse.com>
Date: Tue, 2 Mar 2021 11:02:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <24637.4165.400955.400473@mariner.uk.xensource.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 01.03.2021 17:03, Ian Jackson wrote:
> Jan Beulich writes ("[PATCH 2/2][4.15?] x86: fix build when NR_CPUS == 1"):
>> In this case the compiler is recognizing that no valid array indexes
>> remain (in x2apic_cluster()'s access to per_cpu(cpu_2_logical_apicid,
>> ...)), but oddly enough isn't really consistent about the checking it
>> does (see the code comment).
> ...
>> -        if (this_cpu == cpu || x2apic_cluster(this_cpu) != x2apic_cluster(cpu))
>> +        if ( this_cpu == cpu )
>> +            continue;
>> +        /*
>> +         * Guard in particular against the compiler suspecting out-of-bounds
>> +         * array accesses below when NR_CPUS=1 (oddly enough with gcc 10 it
>> +         * is the 1st of these alone which actually helps, not the 2nd, nor
>> +         * are both required together there).
>> +         */
>> +        BUG_ON(this_cpu >= NR_CPUS);
>> +        BUG_ON(cpu >= NR_CPUS);
>> +        if ( x2apic_cluster(this_cpu) != x2apic_cluster(cpu) )
>>              continue;
> 
> Is there some particular reason for not putting the BUG_ON before the
> if test ?  That would avoid the refactoring.

I want it to be as close as possible to the place where the issue
is. I also view the refactoring as a good thing, since it allows
a style correction as a side effect.

> Of course putting it in next to the array indexing would address that
> too.

See my earlier reply to Roger's similar remark (which still was
along the lines of what I've said above).

Jan

