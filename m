Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE5C22F5CC4
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 10:05:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.66874.118964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyYI-0001qW-QK; Thu, 14 Jan 2021 09:04:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 66874.118964; Thu, 14 Jan 2021 09:04:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kzyYI-0001q7-MY; Thu, 14 Jan 2021 09:04:22 +0000
Received: by outflank-mailman (input) for mailman id 66874;
 Thu, 14 Jan 2021 09:04:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=J1hy=GR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kzyYG-0001q2-Vd
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 09:04:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 19e10b9c-10a2-49d3-8424-a8dc84325e5f;
 Thu, 14 Jan 2021 09:04:19 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 15185ABD6;
 Thu, 14 Jan 2021 09:04:19 +0000 (UTC)
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
X-Inumbo-ID: 19e10b9c-10a2-49d3-8424-a8dc84325e5f
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610615059; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xkE1MJYhLMEQL1mwg5JHFAexjm+do2Uyv21YZGsmsEU=;
	b=j7/5AShPnJa/dTBUA8Cfr4CIZk6gD0qwFnHaGrkPNmoSnC6gMfIct+cGjjkmBkh6QZSLp0
	It+wkMQKTAkOYPeB0CIio9S2t+YAtF9DpbjD0GXgdO19GN/NHEtiIoEA3CXH0/3jJfxB1H
	WaLiFOZkjZ0mwRl0No/0ylnGdbGt+Ec=
Subject: Re: [PATCH v4 08/11] xen/compiler: import 'fallthrough' keyword from
 linux
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <rahul.singh@arm.com>, bertrand.marquis@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1610115608.git.rahul.singh@arm.com>
 <aab15a158f6acb5f5a1cfd0dad1d4493b1fcace9.1610115608.git.rahul.singh@arm.com>
 <9dd27a7d-a77a-14ff-c62c-c813b21fb34e@suse.com>
 <alpine.DEB.2.21.2101121521500.2495@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ce896f84-917b-14e8-40e4-46b5ce3cb2f6@suse.com>
Date: Thu, 14 Jan 2021 10:04:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.21.2101121521500.2495@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 13.01.2021 00:30, Stefano Stabellini wrote:
> On Tue, 12 Jan 2021, Jan Beulich wrote:
>> On 08.01.2021 15:46, Rahul Singh wrote:
>>> -Wimplicit-fallthrough warns when a switch case falls through. Warning
>>> can be suppress by either adding a /* fallthrough */ comment, or by
>>> using a null statement: __attribute__ ((fallthrough))
>>
>> Why is the comment variant (which we use in many places already,
>> albeit with varying wording) not the route of choice?
> 
> See previous discussion:
> 
> https://marc.info/?l=xen-devel&m=160707274517270
> https://marc.info/?l=xen-devel&m=160733742810605
> https://marc.info/?l=xen-devel&m=160733852011023
> 
> We thought it would be best to introduce "fallthrough" and only resort
> to comments as a plan B. The usage of the keyword should allow GCC to do
> better checks.

Hmm, this earlier discussion was on an Arm-specific thread, and I
have to admit I can't see arguments there pro and/or con either
of the two alternatives.

>>> Define the pseudo keyword 'fallthrough' for the ability to convert the
>>> various case block /* fallthrough */ style comments to null statement
>>> "__attribute__((__fallthrough__))"
>>>
>>> In C mode, GCC supports the __fallthrough__ attribute since 7.1,
>>> the same time the warning and the comment parsing were introduced.
>>>
>>> fallthrough devolves to an empty "do {} while (0)" if the compiler
>>> version (any version less than gcc 7) does not support the attribute.
>>
>> What about Coverity? It would be nice if we wouldn't need to add
>> two separate constructs everywhere to make both compiler and static
>> code checker happy.
> 
> I don't think I fully understand your reply here: Coverity doesn't come
> into the picture. Given that GCC provides a special keyword to implement
> fallthrough, it makes sense to use it when available. When it is not
> available (e.g. clang or older GCC) we need to have an alternative to
> suppress the compiler warnings. Hence the need for this check:
> 
>   #if (!defined(__clang__) && (__GNUC__ >= 7))

I'm not sure how this interacts with Coverity. My point bringing up
that one is that whatever gets done here should _also_ result in
Coverity recognizing the fall-through as intentional, or else we'll
end up with many unwanted reports of new issues once the pseudo-
keyword gets made use of. The comment model is what we currently
use to "silence" Coverity; I'd like it to be clear up front that
any new alternative to be used is also going to "satisfy" it.

Jan

