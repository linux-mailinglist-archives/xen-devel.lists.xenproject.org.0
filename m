Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4774C2FE718
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 11:07:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71978.129315 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Wrc-0004dB-F8; Thu, 21 Jan 2021 10:06:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71978.129315; Thu, 21 Jan 2021 10:06:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2Wrc-0004cp-By; Thu, 21 Jan 2021 10:06:52 +0000
Received: by outflank-mailman (input) for mailman id 71978;
 Thu, 21 Jan 2021 10:06:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iH6i=GY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2Wrb-0004ck-NT
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 10:06:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3fb25da8-e468-4450-b2cc-5fcb40aea4e4;
 Thu, 21 Jan 2021 10:06:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 001E6ACF5;
 Thu, 21 Jan 2021 10:06:49 +0000 (UTC)
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
X-Inumbo-ID: 3fb25da8-e468-4450-b2cc-5fcb40aea4e4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611223610; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Di3ZUCkdIRH94z3meBVl1g0TmZRdWd46FWZfQFcA9fk=;
	b=CQmrBLEiBj25tQYpPKLZ9EM0QgpLO5oRv8ifNE3UQQtJWArzT5H2JDvETuP0RrHdliZvM7
	pYYeXqmpB34J2JwfBaA9ZA8q35Je2m5trVrvtZ9tKuvp0yCg0foAhCItlYYpTYDg9dkIMO
	Ly/wbwn4pA637X0aWuBZEdP6DrpfBoE=
Subject: Re: [PATCH v6 1/3] xen/arm: add support for
 run_in_exception_handler()
To: Julien Grall <julien@xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org,
 Juergen Gross <jgross@suse.com>
References: <20210116103339.21708-1-jgross@suse.com>
 <20210116103339.21708-2-jgross@suse.com>
 <4e8cc6e6-dc55-6dda-ffbc-6487e45d5aaf@xen.org>
 <9437a37b-a32c-c8c9-a539-fcc1ac3bfc3d@suse.com>
 <2bb155b0-52ec-e1c7-a511-3285646c0ed8@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2b11249a-4a5d-3fcd-b208-74f1f264e3b9@suse.com>
Date: Thu, 21 Jan 2021 11:06:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <2bb155b0-52ec-e1c7-a511-3285646c0ed8@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 21.01.2021 10:50, Julien Grall wrote:
> Hi Jan,
> 
> On 21/01/2021 07:55, Jan Beulich wrote:
>> On 20.01.2021 19:20, Julien Grall wrote:
>>> On 16/01/2021 10:33, Juergen Gross wrote:
>>>> Add support to run a function in an exception handler for Arm. Do it
>>>> as on x86 via a bug_frame, but pass the function pointer via a
>>>> register (this needs to be done that way, because inline asm support
>>>> for 32-bit Arm lacks the needed functionality to reference an
>>>> arbitrary function via the bugframe).
>>>
>>> I was going to commit the series, but then realized the commit message
>>> and comment needs some tweaking because technically GCC is supporting
>>> 'i' (I managed to get it working with -fno-pie).
>>>
>>> So how about:
>>>
>>> "This is needed to be done that way because GCC complains about invalid
>>> constraint when using a function pointer with "i" and PIE is enabled
>>> (default on most of GCC shipped with distro). Clang happily accepts it,
>>> so it may be a bug in GCC."
>>
>> May I ask why you think it's a bug in gcc? I'd rather consider it
>> a bug in clang. Taking the address of a symbol doesn't yield a
>> constant in PIC or PIE code, aiui.
> 
> I consider it a bug because we were using it as:
> 
> .pushsection .bug.frame
> 2b:
> .long (%0 - 2b)
> 
> So I expect the compiler to be able to find the displacement in both 
> cases as we don't need to know the exact address.
> 
> I think Clang is just clever enough to figure out we want a displacement.

If they take apart the contents of the asm(), this may be possible,
yes. (Did you try with -no-integrated-as, btw?) But taking apart
the asm() is a very risky game a compiler would play, as it may
easily break the programmer's intentions (or still fail to recognize
whether the use is okay, for the containing construct being too
complex).

> Do you have a suggestion of constraint that could resolve the issue?

No. Don't use -fpie (but I guess that's not an option for other
reasons).

Jan

