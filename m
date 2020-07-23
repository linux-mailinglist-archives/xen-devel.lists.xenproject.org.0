Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C5C22B0D1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jul 2020 15:54:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jybgK-00039k-Rw; Thu, 23 Jul 2020 13:54:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9kJt=BC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jybgJ-00039f-QY
 for xen-devel@lists.xenproject.org; Thu, 23 Jul 2020 13:54:43 +0000
X-Inumbo-ID: 0e4275fb-ccec-11ea-871b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0e4275fb-ccec-11ea-871b-bc764e2007e4;
 Thu, 23 Jul 2020 13:54:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 09757AB3D;
 Thu, 23 Jul 2020 13:54:50 +0000 (UTC)
Subject: Re: [PATCH] xen/x86: irq: Avoid a TOCTOU race in
 pirq_spin_lock_irq_desc()
To: Julien Grall <julien@xen.org>
References: <20200722165300.22655-1-julien@xen.org>
 <c9863243-0b5e-521f-80b8-bc5673f895a6@suse.com>
 <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d3ba0dad-63db-06ad-ff3f-f90fe8649845@suse.com>
Date: Thu, 23 Jul 2020 15:54:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <5bd56ef4-8bf5-3308-b7db-71e41ac45918@xen.org>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 23.07.2020 15:22, Julien Grall wrote:
> On 23/07/2020 12:23, Jan Beulich wrote:
>> On 22.07.2020 18:53, Julien Grall wrote:
>>> --- a/xen/arch/x86/irq.c
>>> +++ b/xen/arch/x86/irq.c
>>> @@ -1187,7 +1187,7 @@ struct irq_desc *pirq_spin_lock_irq_desc(
>>>   
>>>       for ( ; ; )
>>>       {
>>> -        int irq = pirq->arch.irq;
>>> +        int irq = read_atomic(&pirq->arch.irq);
>>
>> There we go - I'd be fine this way, but I'm pretty sure Andrew
>> would want this to be ACCESS_ONCE(). So I guess now is the time
>> to settle which one to prefer in new code (or which criteria
>> there are to prefer one over the other).
> 
> I would prefer if we have a single way to force the compiler to do a 
> single access (read/write).

Ideally yes. I'm unconvinced though that either construct fits all
needs (for {read,write}_atomic() there may be reasons why the
compiler is allowed to produce multiple generated code instances
from a single source instance, while for *_ONCE() the compiler may
be allowed to split the access into pieces (as can be easily seen
for an access to a uint64_t variable on 32-bit x86 at least, and
by deduction I then can't see why it shouldn't be allowed to use
byte-wise accesses).

> The existing implementation of ACCESS_ONCE() can only work on scalar 
> type. The implementation is based on a Linux, although we have an extra 
> check. Looking through the Linux history, it looks like it is not 
> possible to make ACCESS_ONCE() work with non-scalar types:
> 
>      ACCESS_ONCE does not work reliably on non-scalar types. For
>      example gcc 4.6 and 4.7 might remove the volatile tag for such
>      accesses during the SRA (scalar replacement of aggregates) step
>      https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145)
> 
> I understand that our implementation of read_atomic(), write_atomic() 
> would lead to less optimized code.

I.e. you see ways for the compiler to be more clever than using
a single "move" instruction for a single move? Or are you referring
to insn scheduling by the compiler (which my gut feeling would say
is impacted as much by an asm volatile() as by accessing a volatile
object).

> So maybe we want to import 
> READ_ONCE() and WRITE_ONCE() from Linux?

So far I was under the impression that our ACCESS_ONCE() is the
result of folding (older) Linux'es READ_ONCE() and WRITE_ONCE()
into a single construct.

> As a side note, I have seen suggestion only (see [1]) which suggest that 
> they those helpers wouldn't be portable:
> 
> "One relatively unimportant misunderstanding is due to the fact that the 
> standard only talks about accesses to volatile objects. It does not talk 
> about accesses via volatile qualified pointers. Some programmers believe 
> that using a pointer-to-volatile should be handled as though it pointed 
> to a volatile object. That is not guaranteed by the standard and is 
> therefore not portable. However, this is relatively unimportant because 
> gcc does in fact treat a pointer-to-volatile as though it pointed to a 
> volatile object."
> 
> I would assume that the use is OK on CLang and GCC given that Linux has 
> been using it.

Then again your change here is exactly to drop such assumptions of
ours on compiler behavior.

>> And this is of course besides the fact that I think we have many
>> more instances where guaranteeing a single access would be
>> needed, if we're afraid of the described permitted compiler
>> behavior. Which then makes me wonder if this is really something
>> we should fix one by one, rather than by at least larger scope
>> audits (in order to not suggest "throughout the code base").
> 
> It depends how much the contributor can invest on chasing the rest of 
> the issues. The larger the scope is, the less likely you will find 
> someone that has bandwith to allocate for fixing it completely.

I certainly understand that.

> If the scope is "a field", then I think it is a reasonable suggesting.
> 
> In this case, I had a look at arch.irq and wasn't able to spot other 
> potential issue.

That's good to know, and may be worth mentioning - if not in the
description, then maybe in a post-commit-message remark?

Jan

