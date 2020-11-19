Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6E12B8FF9
	for <lists+xen-devel@lfdr.de>; Thu, 19 Nov 2020 11:15:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.30560.60665 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgy4-0007EU-Mk; Thu, 19 Nov 2020 10:15:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 30560.60665; Thu, 19 Nov 2020 10:15:08 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kfgy4-0007E5-JV; Thu, 19 Nov 2020 10:15:08 +0000
Received: by outflank-mailman (input) for mailman id 30560;
 Thu, 19 Nov 2020 10:15:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kfgy3-0007E0-C9
 for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:15:07 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b04b3bfc-8725-4286-906c-f697c260d042;
 Thu, 19 Nov 2020 10:15:06 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A4B4DACB0;
 Thu, 19 Nov 2020 10:15:05 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=PWQs=EZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kfgy3-0007E0-C9
	for xen-devel@lists.xenproject.org; Thu, 19 Nov 2020 10:15:07 +0000
X-Inumbo-ID: b04b3bfc-8725-4286-906c-f697c260d042
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id b04b3bfc-8725-4286-906c-f697c260d042;
	Thu, 19 Nov 2020 10:15:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605780905; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zwjH+Q6gVheDBgDgInqsbs9iYCY0+7bMWEZay4ju2Sc=;
	b=EYKE7pudBUD6tSYDnGE/lqbXYz6Jkintb16fsPYCfvvscgm2+8CxHpGxEFOz2g6z/TTpBA
	gmovmwaXredKK9t+/MwIfw7H35Svdy94fAweUhPdmelvDAufvC5seGOIW2PruhK9ZPUpTZ
	ush+ORAfKn7dzgImU8S5laNr3j2Pi/o=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id A4B4DACB0;
	Thu, 19 Nov 2020 10:15:05 +0000 (UTC)
Subject: Re: [PATCH v2 2/8] lib: collect library files in an archive
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <aa1ca5da-3ecf-8721-63f9-b86ebbc64330@suse.com>
 <78dccec2-064f-d4b1-1865-eb3f1f14247a@suse.com>
 <67740969-1ab1-db7f-5e3c-b15a20c1be8b@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <49c2f770-b101-2eea-b9ae-2a9e2f1bfc52@suse.com>
Date: Thu, 19 Nov 2020 11:15:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.3
MIME-Version: 1.0
In-Reply-To: <67740969-1ab1-db7f-5e3c-b15a20c1be8b@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 18.11.2020 18:06, Julien Grall wrote:
> On 23/10/2020 11:17, Jan Beulich wrote:
>> In order to (subsequently) drop odd things like CONFIG_NEEDS_LIST_SORT
>> just to avoid bloating binaries when only some arch-es and/or
>> configurations need generic library routines, combine objects under lib/
>> into an archive, which the linker then can pick the necessary objects
>> out of.
>>
>> Note that we can't use thin archives just yet, until we've raised the
>> minimum required binutils version suitably.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>>   xen/Rules.mk          | 33 +++++++++++++++++++++++++++------
>>   xen/arch/arm/Makefile |  6 +++---
>>   xen/arch/x86/Makefile |  8 ++++----
>>   xen/lib/Makefile      |  3 ++-
> 
> IIRC, Anthony worked on the build systems. If I am right, it would be 
> good to get a review from him.

I'll try to remember next time round.

>> --- a/xen/lib/Makefile
>> +++ b/xen/lib/Makefile
>> @@ -1,2 +1,3 @@
>> -obj-y += ctype.o
>>   obj-$(CONFIG_X86) += x86/
>> +
>> +lib-y += ctype.o
> 
> May I ask why all the code movement by ctype was done after this patch?

I'm sorry, but I'm afraid I don't understand the question.

Jan

