Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0CA3767F2
	for <lists+xen-devel@lfdr.de>; Fri,  7 May 2021 17:29:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.124068.234151 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2PN-0002D8-1r; Fri, 07 May 2021 15:28:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 124068.234151; Fri, 07 May 2021 15:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lf2PM-0002Av-Sq; Fri, 07 May 2021 15:28:52 +0000
Received: by outflank-mailman (input) for mailman id 124068;
 Fri, 07 May 2021 15:28:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rJTn=KC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lf2PL-0002AF-A7
 for xen-devel@lists.xenproject.org; Fri, 07 May 2021 15:28:51 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1f40b92-7b39-49c7-b6dc-b29de329a397;
 Fri, 07 May 2021 15:28:50 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 80C62AC6A;
 Fri,  7 May 2021 15:28:49 +0000 (UTC)
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
X-Inumbo-ID: b1f40b92-7b39-49c7-b6dc-b29de329a397
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620401329; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qpu+bOi5Xpc3dDo4ngOHPAFA8yoMvUdr5hcWr7/Zdbw=;
	b=BnUC0RNoZLylqQEfVX9C+DYGNrejBMcsJX0TezJZiotIls856hfdaf0OKy0ajKQU1hST5Z
	J3in7jn15vuUUUe492U55Ows1a/ndgMaU9fSCv/yeRQPRDnhn49wX2npGInzXw2Ukj1Eeh
	fq8m3XeQ7WPl8gZODQ1KlRe/yqZbGGA=
Subject: Re: [PATCH RFC 1/2] docs/design: Add a design document for Live
 Update
To: "Xia, Hongyan" <hongyxia@amazon.com>
Cc: "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "Gul, Mahircan" <mahgul@amazon.co.uk>, "paul@xen.org" <paul@xen.org>,
 "Ning, Raphael" <raphning@amazon.com>, "wl@xen.org" <wl@xen.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 "Grall, Julien" <jgrall@amazon.co.uk>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "julien@xen.org" <julien@xen.org>
References: <20210506104259.16928-1-julien@xen.org>
 <20210506104259.16928-2-julien@xen.org>
 <f51b2ef6-3998-7371-cea9-502c5c9f8afa@suse.com>
 <2a497e4c-d5a3-1da2-699e-1e31740a81f0@xen.org>
 <324f10b9-2b1f-ec61-1816-44c960c285f8@suse.com>
 <28b31476e2044161f94bfd85d1d3c8b2f6dfb806.camel@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e161632-e558-039c-2a2a-398fe492a7fc@suse.com>
Date: Fri, 7 May 2021 17:28:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <28b31476e2044161f94bfd85d1d3c8b2f6dfb806.camel@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.05.2021 16:59, Xia, Hongyan wrote:
> On Fri, 2021-05-07 at 14:15 +0200, Jan Beulich wrote:
>> On 07.05.2021 13:44, Julien Grall wrote:
> [...]
>>>
>>> It is a known convenient place. It may be difficult to find a
>>> similar 
>>> spot on host that have been long-running.
>>
>> I'm not convinced: If it was placed in the kexec area at a 2Mb
>> boundary, it could just run from there. If the kexec area is
>> large enough, this would work any number of times (as occupied
>> ranges become available again when the next LU cycle ends).
> 
> To make sure the next Xen can be loaded and run anywhere in case kexec
> cannot find large enough memory under 4G, we need to:
> 
> 1. teach kexec to load the whole image contiguously. At the moment
> kexec prepares scattered 4K pages which are not runnable until they are
> copied to a contiguous destination. (What if it can't find a contiguous
> range?)
> 
> 2. teach Xen that it can be jumped into with some existing page tables
> which point to itself above 4G. We can't do real/protected mode entry
> because it needs to start below 4G physically. Maybe a modified version
> of the EFI entry path (my familiarity with Xen EFI entry is limited)?
> 
> 3. rewrite all the early boot bits that assume Xen is under 4G and its
> bundled page tables for below 4G.
> 
> These are the obstacles off the top of my head. So I think there is no
> fundamental reason why we have to place Xen #2 where Xen #1 was, but
> doing so is a massive reduction of pain which allows us to reuse much
> of the existing Xen code.
> 
> Maybe, this part does not have to be part of the ABI and we just
> suggest this as one way of loading the next Xen to cope with growth?
> This is the best way I can think of (loading Xen where it was and
> expand into the reserved bootmem if needed) that does not need to
> rewrite a lot of early boot code and can pretty much guarantee success
> even if memory is tight and fragmented.

Yeah, all of this as an initial implementation plan sounds fine to
me. But it should then be called out as such (rather than as part of
how things ought to [remain to] be).

Jan

