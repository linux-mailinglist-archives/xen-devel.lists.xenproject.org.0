Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCB12F61DD
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 14:25:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67007.119258 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l02cf-00031D-PK; Thu, 14 Jan 2021 13:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67007.119258; Thu, 14 Jan 2021 13:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l02cf-00030o-Lq; Thu, 14 Jan 2021 13:25:09 +0000
Received: by outflank-mailman (input) for mailman id 67007;
 Thu, 14 Jan 2021 13:25:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l02ce-00030j-45
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 13:25:08 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4c2c7990-1ceb-4701-b7fb-526cdf302985;
 Thu, 14 Jan 2021 13:25:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 90879B903;
 Thu, 14 Jan 2021 13:25:05 +0000 (UTC)
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
X-Inumbo-ID: 4c2c7990-1ceb-4701-b7fb-526cdf302985
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610630705; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rAwVeNMXzhXU5SGrj9Qy/T8CPYs85agFRWD0mZadIK0=;
	b=jogh95Fk/45c4KUEiQE/ztHB2e1w7PVOTAD7NHzISSagLTn5vkI9J6KjumVpfGx+Pj3WOE
	ZxrbkbT1nSU+NNvHkwVKRAFXJ4M7t50GESEE57z2gEDLXvV8XR/PJPU1EQAswuvXA7yuv4
	qiNHT/8jXtEu7p2YMXik82zG8p0yrB0=
Subject: Re: [PATCH] Fix error: array subscript has type 'char'
To: Manuel Bouyer <bouyer@antioche.eu.org>
Cc: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20210112181242.1570-1-bouyer@antioche.eu.org>
 <574d9ed8-c827-6864-4732-4e1b813fc3e3@suse.com>
 <20210114122912.GA2522@antioche.eu.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <1af2b532-4dce-29cf-94ae-ad0c399ecbce@suse.com>
Date: Thu, 14 Jan 2021 14:25:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210114122912.GA2522@antioche.eu.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 14.01.2021 13:29, Manuel Bouyer wrote:
> On Thu, Jan 14, 2021 at 11:53:20AM +0100, Jan Beulich wrote:
>> On 12.01.2021 19:12, Manuel Bouyer wrote:
>>> From: Manuel Bouyer <bouyer@netbsd.org>
>>>
>>> Use unsigned char variable, or cast to (unsigned char), for
>>> tolower()/islower() and friends. Fix compiler error
>>> array subscript has type 'char' [-Werror=char-subscripts]
>>
>> Isn't this something that wants changing in your ctype.h instead?
>> the functions (or macros), as per the C standard, ought to accept
>> plain char aiui, and if they use the input as an array subscript,
>> it should be their implementation suitably converting type first.
> 
> I asked for inputs from NetBSD developers familiar with this part.
> 
> Although the parameter is an int, only a subset of values is valid,
> as stated in ISO C 2018 (Section 7.4 paragrah 1):
>> In all cases the argument is an int, the value of which shall be
>> representable as an unsigned char or shall equal the value of the
>> macro EOF.  If the argument has any other value, the behavior is 
>> undefined.                               

Which means you're shifting the undefined-ness from the implementation
(using the value as array index) to the callers (truncating values, or
converting value range). In particular I do not think that the
intention behind the standard's wording is for every caller to need to
cast to unsigned char, when e.g. character literals are of type char
and string literals are of type const char[].

> As stated by NetBSD's ctype(3) manual page, NetBSD and glibc took different
> approach. NetBSD emits a compile-time warning if the input may lead to
> undefined behavior. quoting the man page:
>      Some implementations of libc, such as glibc as of 2018, attempt to avoid
>      the worst of the undefined behavior by defining the functions to work for
>      all integer inputs representable by either unsigned char or char, and
>      suppress the warning.  However, this is not an excuse for avoiding
>      conversion to unsigned char: if EOF coincides with any such value, as it
>      does when it is -1 on platforms with signed char, programs that pass char
>      will still necessarily confuse the classification and mapping of EOF with
>      the classification and mapping of some non-EOF inputs.
> 
> 
> So, although no warning is emmited on linux, it looks like to me that the
> cast to unsigned char is needed anyway, and relying on glibc's behavior
> is not portable.

I fully agree we shouldn't rely on glibc's behavior (I'm sure
you've looked at xen/include/xen/ctype.h to see how we address
this it Xen itself, but I will admit this is to a degree comparing
apples and oranges, not the least because the lack of a need to
consider EOF in Xen). At least in xen/tools/symbols.c I don't
think we're at risk of running into "undefined" space. Casts are
generally desirable to avoid whenever possible, as they come with
their own set of risks. Granted this is "only" user space code,
but still.

Jan

