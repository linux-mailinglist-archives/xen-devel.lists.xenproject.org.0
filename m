Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4AB01CD6BD
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2020 12:40:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jY5rS-0006Nw-VG; Mon, 11 May 2020 10:40:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4Y5i=6Z=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jY5rS-0006Nq-9J
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 10:40:38 +0000
X-Inumbo-ID: d9993bb8-9373-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d9993bb8-9373-11ea-b9cf-bc764e2007e4;
 Mon, 11 May 2020 10:40:37 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D24C7AC64;
 Mon, 11 May 2020 10:40:38 +0000 (UTC)
Subject: Re: [PATCH] x86/idle: prevent entering C6 with in service interrupts
 on Intel
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20200507132236.26010-1-roger.pau@citrix.com>
 <3d147b74-81dd-83b8-7035-67c5ceb72c5f@suse.com>
 <20200508172411.GM1353@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <991f9773-b173-b374-bb22-aff24a930630@suse.com>
Date: Mon, 11 May 2020 12:40:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200508172411.GM1353@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 08.05.2020 19:24, Roger Pau Monné wrote:
> On Fri, May 08, 2020 at 03:46:08PM +0200, Jan Beulich wrote:
>> On 07.05.2020 15:22, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/cpu/mwait-idle.c
>>> +++ b/xen/arch/x86/cpu/mwait-idle.c
>>> @@ -770,6 +770,9 @@ static void mwait_idle(void)
>>>  		return;
>>>  	}
>>>  
>>> +	if (cx->type == ACPI_STATE_C3 && errata_c6_isr_workaround())
>>> +		cx = power->safe_state;
>>
>> Here it becomes even more relevant I think that == not be
>> used, as the static tables list deeper C-states; it's just
>> that the SKX table, which also gets used for CLX afaict, has
>> no entries beyond C6-SKX. Others with deeper ones presumably
>> have the deeper C-states similarly affected (or not) by this
>> erratum.
>>
>> For reference, mwait_idle_cpu_init() has
>>
>> 		hint = flg2MWAIT(cpuidle_state_table[cstate].flags);
>> 		state = MWAIT_HINT2CSTATE(hint) + 1;
>>                 ...
>> 		cx->type = state;
>>
>> i.e. the value you compare against is derived from the static
>> table entries. For Nehalem/Westmere this means that what goes
>> under ACPI_STATE_C3 is indeed C6-NHM, and this looks to match
>> for all the non-Atoms, but for none of the Atoms. Now Atoms
>> could easily be unaffected, but (just to take an example) if
>> C6-SNB was affected, surely C7-SNB would be, too.
> 
> Yes, I've adjusted this to use cx->type >= 3 instead. I have to admit
> I'm confused by the name of the states being C6-* while the cstate
> value reported by Xen will be 3 (I would instead expect the type to be
> 6 in order to match the name).

Well, the problem is the disagreement in numbering between ACPI
and what the various CPU specs actually use.

Jan

