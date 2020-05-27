Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 740511E39BF
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 09:02:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdq4G-0004RG-BU; Wed, 27 May 2020 07:01:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+pkZ=7J=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jdq4E-0004RB-Bi
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 07:01:34 +0000
X-Inumbo-ID: e5a76760-9fe7-11ea-9dbe-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5a76760-9fe7-11ea-9dbe-bc764e2007e4;
 Wed, 27 May 2020 07:01:33 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id EDD8BACD5;
 Wed, 27 May 2020 07:01:34 +0000 (UTC)
Subject: Re: [PATCH 03/16] x86/traps: Factor out exception_fixup() and make
 printing consistent
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-4-andrew.cooper3@citrix.com>
 <f7cb696a-5c2c-4aa6-d379-ed77772b7c35@suse.com>
 <a397dd69-2384-a4af-d127-9189a730a554@citrix.com>
 <afd75bde-9adf-d8cf-f8cf-24cb1b753253@suse.com>
 <9c939815-a4f9-75d7-3b6b-b8921de6cdb9@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0d19ed8a-d1f5-930c-3958-a34a69b7a24e@suse.com>
Date: Wed, 27 May 2020 09:01:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <9c939815-a4f9-75d7-3b6b-b8921de6cdb9@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 26.05.2020 20:06, Andrew Cooper wrote:
> On 12/05/2020 14:05, Jan Beulich wrote:
>> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
>>
>> On 11.05.2020 17:14, Andrew Cooper wrote:
>>> On 04/05/2020 14:20, Jan Beulich wrote:
>>>> On 02.05.2020 00:58, Andrew Cooper wrote:
>>>>> --- a/xen/arch/x86/traps.c
>>>>> +++ b/xen/arch/x86/traps.c
>>>>> @@ -774,10 +774,27 @@ static void do_reserved_trap(struct cpu_user_regs *regs)
>>>>>            trapnr, vec_name(trapnr), regs->error_code);
>>>>>  }
>>>>>  
>>>>> +static bool exception_fixup(struct cpu_user_regs *regs, bool print)
>>>>> +{
>>>>> +    unsigned long fixup = search_exception_table(regs);
>>>>> +
>>>>> +    if ( unlikely(fixup == 0) )
>>>>> +        return false;
>>>>> +
>>>>> +    /* Can currently be triggered by guests.  Make sure we ratelimit. */
>>>>> +    if ( IS_ENABLED(CONFIG_DEBUG) && print )
>>>> I didn't think we consider dprintk()-s a possible security issue.
>>>> Why would we consider so a printk() hidden behind
>>>> IS_ENABLED(CONFIG_DEBUG)? IOW I think one of XENLOG_GUEST and
>>>> IS_ENABLED(CONFIG_DEBUG) wants dropping.
>>> Who said anything about a security issue?
>> The need to rate limit is (among other aspects) to prevent a
>> (logspam) security issue, isn't it?
> 
> Rate limiting (from a security aspect) is a stopgap solution to relieve
> incidental pressure on the various global spinlocks involved.
> 
> It specifically does not prevent a guest from trivially filling the
> console ring with junk, or for that junk to be written to
> /var/log/xen/hypervisor.log at an alarming rate, both of which are
> issues in production setups, but not security issues.

IOW you assert that e.g. XSA-141 should not have been issued?

> Technical solutions to these problems do exist, such as deleting the
> offending printk(), or maintaining per-guest console rings, but both
> come with downsides in terms of usability, which similarly impacts
> production setups.
> 
> 
> What ratelimiting even in debug builds gets you is a quick spate of
> printks() (e.g. any new sshd connection on an AMD system where the
> MSR_VIRT_SPEC_CTRL patch is still uncommitted, and the default WRMSR
> behaviour breaking wrmsr_safe() logic in Linux) not wasting an
> unreasonable quantity of space in the console ring.

Hmm, okay, I can accept this perspective. Since the other comment I
gave has been taken care of by re-arrangements in a separate patch:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

