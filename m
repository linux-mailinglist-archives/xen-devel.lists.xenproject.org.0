Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 810193607E8
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 13:02:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111037.212237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWzlU-0001sr-NS; Thu, 15 Apr 2021 11:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111037.212237; Thu, 15 Apr 2021 11:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lWzlU-0001sU-K8; Thu, 15 Apr 2021 11:02:28 +0000
Received: by outflank-mailman (input) for mailman id 111037;
 Thu, 15 Apr 2021 11:02:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x7n8=JM=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lWzlT-0001sM-4U
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 11:02:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id edfcb0fc-9513-4558-9271-cdde0f896783;
 Thu, 15 Apr 2021 11:02:25 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 04BE0AE20;
 Thu, 15 Apr 2021 11:02:25 +0000 (UTC)
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
X-Inumbo-ID: edfcb0fc-9513-4558-9271-cdde0f896783
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618484545; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fnBw5AmjMcypZK2aM256O5v0FMYFa84ebyQvoKu1egY=;
	b=h03NqA+eGI03Cs6J7bxrGTv1Fpgic9hCz4XprlltCxL6NosZiCLmvNrtkKSHZt5EVsLKW7
	TwP2IOZcsA/7+X+fIl30e/x6Aq1o3EEZMCio6P/eaIape+4BMTYPKEG8ZDaUH8n3BTPXT8
	63jNbdl41kmLkFQ5JsZ1Cs68xJLRDyk=
Subject: Re: [PATCH 11/11] Arm/optee: don't open-code xzalloc_flex_struct()
To: Julien Grall <julien@xen.org>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <a3fef3b0-c9f3-208e-3728-62ca9cff70ba@suse.com>
 <aad23304-c727-2921-59fe-ab3763f5da03@suse.com>
 <9f95c37b-dc4a-d2cf-01c1-98d2108fae88@xen.org>
 <1c9229ac-5491-313e-f053-bc5bee01c3de@suse.com>
 <7945a56e-337d-3c84-ecfd-2be759adda4a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3b0bd499-2f1a-904c-2383-c301cad2608d@suse.com>
Date: Thu, 15 Apr 2021 13:02:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <7945a56e-337d-3c84-ecfd-2be759adda4a@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.04.2021 12:26, Julien Grall wrote:
> Hi Jan,
> 
> On 14/04/2021 08:03, Jan Beulich wrote:
>> On 13.04.2021 20:19, Julien Grall wrote:
>>> On 08/04/2021 13:23, Jan Beulich wrote:
>>>> There is a difference in generated code: xzalloc_bytes() forces
>>>> SMP_CACHE_BYTES alignment. I think we not only don't need this here, but
>>>> actually don't want it.
>>>
>>> So I think moving to xmalloc_flex_struct() is a pretty good move. But I
>>> am actually a bit confused with the argument used.
>>>
>>> Could you provide some details why you think forcing the array to be
>>> aligned to the maximum cache line supported (128 bytes on Arm) is wrong?
>>
>> It is not "wrong" in that sense, but if this is intended it shouldn't
>> be arranged via use of xmalloc_bytes().
> 
> This is not very clear from the commit message (or even the cover 
> letter). How about:
> 
> "
> The current use xzalloc_bytes() in optee is nearly an open-coded version 
> of xzalloc_flex_struct() which was introduced after the driver was merged.
> 
> The main difference is xzalloc_bytes() will also force the allocation to 
> be SMP_CACHE_BYTES aligned and therefore avoid sharing the cache line.
> 
> While sharing the cache line can have an impact on the performance, this 
> is also true for most of the other users of  x*alloc_flex_struct(). So 
> if we want to prevent sharing a cache line, it should be part of 
> x*alloc_flex_struct().
> 
> In this case, we don't need stricter alignment than what the allocator 
> does. So the call to xzalloc_bytes() is now replaced with a call 
> xzalloc_flex_Struct().
> "

Well, okay, I've inserted a slightly edited version of this into
the patch. But ...

> Ideally, we want the same sort of the commit message in the other patches.

... I disagree here: In particular because of the recurring
pattern, I dislike repeated overly verbose descriptions. I could
perhaps see them as being not seen as overly verbose when looking
at every commit on its own (like would happen when someone tries
to do some archaeology later on), but in the context of such a
series this is potentially harmful: If almost a dozen patches
have almost the same sufficiently verbose description, possible
differences may not be paid attention to.

Plus, granted possibly controversial as well, I'm afraid I'm not
happy to (repeatedly) state obvious facts. The abuse (in almost
all cases) of x[mz]alloc_bytes() is, afaict, in no way attributed
to the resulting higher alignment, but rather in the desire to
get away easily without needing to think about using a type-safe
flavor. This said I will admit that prior to the introduction of
x[mz]alloc_flex_struct() I can see how alternatives could quickly
have got quite ugly. And for the few (if any) users which
actually care about this higher alignment, it should have been
noted at the time of introducing the use that the specific need
for certain alignment shouldn't be implied by using this function,
but rather be made explicit. This is even more so as it's not
written down anywhere that x[mz]alloc_bytes() guarantees a certain
alignment (i.e. if the plan wasn't anyway to phase out its use, it
should have been permissible to change the alignment it requests
from the underlying implementation without first auditing all
users).

Jan

