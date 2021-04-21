Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DB6366F39
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 17:32:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114857.218972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEpn-0004iQ-Il; Wed, 21 Apr 2021 15:32:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114857.218972; Wed, 21 Apr 2021 15:32:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZEpn-0004i1-FU; Wed, 21 Apr 2021 15:32:11 +0000
Received: by outflank-mailman (input) for mailman id 114857;
 Wed, 21 Apr 2021 15:32:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=4TWb=JS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lZEpl-0004hf-PW
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 15:32:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3147aad3-d6a6-48f3-94b3-c5162557d85d;
 Wed, 21 Apr 2021 15:32:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8062FB505;
 Wed, 21 Apr 2021 15:32:07 +0000 (UTC)
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
X-Inumbo-ID: 3147aad3-d6a6-48f3-94b3-c5162557d85d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619019127; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZwW4pbJtzmhfr4vQ/5MmCYKtIQuv6Dn+2d2rO5MCdio=;
	b=DCsEZGEmtDxEL14Gj9ym7xLujYuxi5PuYwk3s9umhY6W0McCY07J90BGTU0KS5zrnnyzc3
	U9QG5vxgtopY3aFm9haOnW/eiO9321lkd2oGrMz/6DMzfkhA0AcVx9b+U8jdrsDnZcgILs
	0tAoRX/42e/EkBzhPg3A1MCLbGS1Dm4=
Subject: Re: [PATCH v2 0/8] assorted replacement of x[mz]alloc_bytes()
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <091b4b91-712f-3526-78d1-80d31faf8e41@suse.com>
 <40d373eb-d7c2-27f9-df20-a7fecbe519a5@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6afd9e45-ad71-5b39-6bec-c8d37ef56157@suse.com>
Date: Wed, 21 Apr 2021 17:32:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <40d373eb-d7c2-27f9-df20-a7fecbe519a5@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 21.04.2021 17:23, Andrew Cooper wrote:
> On 21/04/2021 15:54, Jan Beulich wrote:
>> In the long run I think we want to do away with these type-unsafe
>> interfaces, the more that they also request (typically) excess
>> alignment. This series of entirely independent patches is
>> eliminating the instances where it's relatively clear that they're
>> not just "blob" allocations.
>>
>> v2 only has commit messages extended.
>>
>> 1: x86/MCE: avoid effectively open-coding xmalloc_array()
>> 2: x86/HVM: avoid effectively open-coding xmalloc_array()
>> 3: x86/oprofile: avoid effectively open-coding xmalloc_array()
>> 4: x86/IRQ: avoid over-alignment in alloc_pirq_struct()
>> 5: EFI/runtime: avoid effectively open-coding xmalloc_array()
>> 6: kexec: avoid effectively open-coding xzalloc_flex_struct()
>> 7: video/lfb: avoid effectively open-coding xzalloc_array()
>> 8: Arm/optee: don't open-code xzalloc_flex_struct()
> 
> I'm tempted to nack this, but for now will go with a firm -2 to the
> whole series.
> 
> It is unreasonable, at an API level, for *lloc_bytes(...) to not be
> interchangeable *alloc_array(char, ...), and the former is the clearer
> way of writing code.
> 
> The alignment details are internal properties, dubious at best, and
> totally unreasonable for maintainer to know or care about as far as the
> API is concerned.  There is also no type safety to be gained by making
> the transformation.
> 
> If you want to improve the alignment, fix the allocator and the
> behind-the-scenes semantics.  Don't make every callsite more complicated
> to follow, and definitely don't introduce perf problems from cacheline
> sharing in the name of typesafey.

So you firmly think x*alloc_bytes() is a good interface to have and to
keep? As said above, I'm of the clear opinion that we should get rid
of it (with what you say in the first sentence of the second from last
paragraph being one of the reasons). The fact that it may be a
shorthand when allocating char[] is really, really minor (and violates
consistency of the code base as a whole).

Also, just to make this explicit, patch 4 really is somewhat different
from the others, and hence would better not fall into a general "I don't
like this and won't look at it" bucket. Granted I'm not sure you'll
flame me for other reasons there ...

Jan

