Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0642EADB3
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 15:47:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62025.109531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwnc5-0002z2-A0; Tue, 05 Jan 2021 14:47:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62025.109531; Tue, 05 Jan 2021 14:47:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwnc5-0002yd-6i; Tue, 05 Jan 2021 14:47:09 +0000
Received: by outflank-mailman (input) for mailman id 62025;
 Tue, 05 Jan 2021 14:47:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hFWs=GI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kwnc3-0002yW-SV
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 14:47:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id add2f3be-5470-4337-9f4a-c6785c01104b;
 Tue, 05 Jan 2021 14:47:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 167DEAA7C;
 Tue,  5 Jan 2021 14:47:06 +0000 (UTC)
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
X-Inumbo-ID: add2f3be-5470-4337-9f4a-c6785c01104b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1609858026; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eKe8X2YEOx6i+NnPh2d4vzoW4AVTKnJD+NJ4Y7ik2z0=;
	b=kdz+dHsG2J1LdnPWTOfXKCS3QFtikXWRN8o25ceUIoyMox8wmrIkTLfs1KqL4bl/W6GA6H
	6wj8opiXAgBQUSz0qnuKsQH5jtmziY8TvjraFvUcsDKak2GzfbDasLGcKY8AedRFwOqs4v
	jsk3za9sGqnVityeXObgUDuWOdf8ReU=
Subject: Re: [PATCH RFC] lib: extend ASSERT()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <8afb661c-a2eb-3188-8351-01de16ff1b22@suse.com>
 <4d46370c-44a5-07de-9e7d-ab4611e941bf@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5d032a58-c79c-e8b7-1caa-1e229e14e866@suse.com>
Date: Tue, 5 Jan 2021 15:47:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <4d46370c-44a5-07de-9e7d-ab4611e941bf@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 05.01.2021 14:56, Andrew Cooper wrote:
> On 05/01/2021 12:45, Jan Beulich wrote:
>> The increasing amount of constructs along the lines of
>>
>>     if ( !condition )
>>     {
>>         ASSERT_UNREACHABLE();
>>         return;
>>     }
>>
>> is not only longer than necessary, but also doesn't produce incident
>> specific console output (except for file name and line number). Allow
>> the intended effect to be achieved with ASSERT(), by giving it a second
>> parameter allowing specification of the action to take in release builds
>> in case an assertion would have triggered in a debug one. The example
>> above then becomes
>>
>>     ASSERT(condition, return);
>>
>> Make sure the condition will continue to not get evaluated when just a
>> single argument gets passed to ASSERT().
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> RFC: The use of a control flow construct as a macro argument may be
>>      controversial.
> 
> So I had been putting some consideration towards this.  I agree that the
> current use of ASSERT_UNREACHABLE() isn't great, and that we ought to do
> something to improve the status quo.
> 
> However, the more interesting constructs to consider are the ones with
> printk()'s and/or domain_crash().  While a straight return or goto in
> alt... is perhaps acceptable, anything more complicated probably isn't.

Since syntactically this is no problem, it is up to us whether we
consider this unacceptable. Personally I wouldn't mind as long as
the set of statements doesn't get excessive. Otoh I'm not sure
the more complex uses are in need of such a transformation - the
relatively simple ones are where the current arrangement has most
significant impact.

> I also found, with my still-pending domain_crash() cleanup series, that
> domain_crash()/ASSERT_UNREACHABE()/return/goto became an increasingly
> common combination.

Which may call for further abstraction along the lines of what I'm
doing here?

>> --- a/xen/include/xen/lib.h
>> +++ b/xen/include/xen/lib.h
>> @@ -55,12 +55,14 @@
>>  #endif
>>  
>>  #ifndef NDEBUG
>> -#define ASSERT(p) \
>> +#define ASSERT(p, ...) \
>>      do { if ( unlikely(!(p)) ) assert_failed(#p); } while (0)
>>  #define ASSERT_UNREACHABLE() assert_failed("unreachable")
>>  #define debug_build() 1
>>  #else
>> -#define ASSERT(p) do { if ( 0 && (p) ) {} } while (0)
>> +#define ASSERT(p, alt...) do { \
>> +        if ( !count_args(alt) || unlikely(!(p)) ) { alt; } \
> 
> I'd strongly recommend naming this failsafe... rather than alt, to make
> it clear what its purpose is.

No problem. Albeit I wonder whether "failsafe" is really better -
maybe "fallback"?

> Also, we really can't have (p) conditionally evaluated depending on
> whether there are any failsafe arguments or not.  It is already bad
> enough that its state of evaluation differs between debug and release
> builds.

Are you suggesting to evaluate it unconditionally, producing
unnecessary binary code in release builds _and_ diverging from the
C standard's assert()? I'm not outright against, but I'm also not
sure this is a good idea. But like you I also don't really like
the new asymmetry, but I thought it would be best to leave
existing uses of ASSERT() entirely unchanged in their behavior.

Jan

