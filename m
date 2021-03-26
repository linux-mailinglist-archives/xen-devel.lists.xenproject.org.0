Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F2834A821
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 14:32:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101808.194958 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmZW-0006q4-W0; Fri, 26 Mar 2021 13:32:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101808.194958; Fri, 26 Mar 2021 13:32:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPmZW-0006pf-Sg; Fri, 26 Mar 2021 13:32:18 +0000
Received: by outflank-mailman (input) for mailman id 101808;
 Fri, 26 Mar 2021 13:32:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPmZV-0006pa-UY
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 13:32:17 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f830677-4a15-4b24-976f-a69c4126cdc8;
 Fri, 26 Mar 2021 13:32:16 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 166F9AB8A;
 Fri, 26 Mar 2021 13:32:16 +0000 (UTC)
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
X-Inumbo-ID: 7f830677-4a15-4b24-976f-a69c4126cdc8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616765536; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nIxbWxTsUYfQxuH91g1XjA854G7xJRDLBl5wUqUhFfc=;
	b=V9ezvvhQi3VVOXyrivFNSEz8OnsEJsXmpqRZf1GlfP9a/O8KSCpyCwIN07iD2B59RO1ZJB
	4nWFYe0Y5VO3IWTf3JMY8CuFwsrM7kheDGAM3x9ge/cSXt83YAJc+4wfljiny4i7CAWEqA
	czHkSh66ZgpwB0MJuFh2D8oKP97j3Fk=
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <24669.52641.499147.88002@mariner.uk.xensource.com>
 <24669.54213.173154.400771@mariner.uk.xensource.com>
 <CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6077715e-8ea6-7dc6-c226-ccfad2b8f3ba@suse.com>
Date: Fri, 26 Mar 2021 14:31:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CABfawh=O1hdycEr0+=JXU6USZ8DAzQvKoXQOnRnoWL643FTa+g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 26.03.2021 14:03, Tamas K Lengyel wrote:
> On Fri, Mar 26, 2021 at 8:30 AM Ian Jackson <iwj@xenproject.org> wrote:
>>
>> I wrote:
>>> I'm sorry, but I think it is too late for 4.15 to do this.  I prefer
>>> Jan's patch which I have alread release-acked.
>>>
>>> Can someone qualified please provide a maintainer review for this,
>>> ideally today ?
>>
>> I asked Andrew on IRC:
>>
>> 12:08 <Diziet> andyhhp__: Are you prepared to maintainer-ack Jan's
>>                more-minimal hpet workaround approach ?
>> 12:16 <andyhhp__> Diziet: honestly, no.  I don't consider that
>>                   acceptable behaviour, and it is a fairly big "f you"
>>                   (this was literally feedback I got in private) to
>>                   the downstreams who've spent years trying to get us
>>                   to fix this bug, and have now backported the first
>>                   version.
>> 12:16 <andyhhp__> I'm looking into the feedback on my series
>> 12:17 <andyhhp__> one way or another, the moment we enter the fallback
>>                   path for interrupt routing, something is very broken
>>                   on the system
>> 12:19 <andyhhp__> so the tradeoff is an unspecified bug on one ancient
>>                   laptop which can't be tested now, vs 5 years of Atom
>>                   CPUs, 2 years of latop CPUs, and the forthcoming
>>                   Server line of Intel CPUs
>> 12:19 <andyhhp__> or whatever other compromise we can work on
>>
>> I'm sorry that this bug is going to continue to be not properly fixed.
>> As I understand it the practical impact is that users of those
>> affected systems (the newer ones you mention) will have to add a
>> command-line option.  That is, unfortunately, the downside of
>> time-based releases.  If we had been having this conversation two
>> weeks ago I would have very likely had a different answer.
> 
> The problem from my perspective is that the end-users have no way to
> determine when that boot option is needing to be set. Having an
> installation step of "check if things explode when you reboot" is just
> plain bad. Many times you don't even have access to a remote serial
> console to check why Xen didn't boot.

I guess I don't see the serial console aspect here: This sort of
boot issue can be seen on the normal screen as well. It occurs
neither too early nor too late to be visible. We could amend the
output by a hint towards this option.

Jan

