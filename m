Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F50C327A91
	for <lists+xen-devel@lfdr.de>; Mon,  1 Mar 2021 10:17:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.91374.172716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGegL-0006Ui-81; Mon, 01 Mar 2021 09:17:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 91374.172716; Mon, 01 Mar 2021 09:17:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lGegL-0006UM-56; Mon, 01 Mar 2021 09:17:37 +0000
Received: by outflank-mailman (input) for mailman id 91374;
 Mon, 01 Mar 2021 09:17:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=m81q=H7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lGegJ-0006UC-Db
 for xen-devel@lists.xenproject.org; Mon, 01 Mar 2021 09:17:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66ec7c3f-2764-47f2-8de7-8cd5ccca5761;
 Mon, 01 Mar 2021 09:17:34 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 47EE3ADDD;
 Mon,  1 Mar 2021 09:17:33 +0000 (UTC)
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
X-Inumbo-ID: 66ec7c3f-2764-47f2-8de7-8cd5ccca5761
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1614590253; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M14uPrvFxLxc0/X3wB9P9zqSnpxas/vDs5aupFBoG5M=;
	b=ZppUbrP/P6jly3aXVhOiWV0QMXc/SNe/LDxy4GwgFZmyL3kEjfP8LP/bZ3IrWHqeosRFrX
	c4PoBuCZ92v0Lqg5Yp8uKlS5btd0SCK4jTa59Vb59jNasusoMxOzDlepp7dwE7YFM2GMCb
	oABZXHbd9KVts5Oqa7mcm1K8aCUyI1k=
Subject: Re: [PATCH for-4.15 2/3] firmware: provide a stand alone set of
 headers
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210226085908.21254-1-roger.pau@citrix.com>
 <20210226085908.21254-3-roger.pau@citrix.com>
 <2133ba4c-5120-30ca-1328-c8700fd2db94@suse.com>
 <YDyu3mWSgIIB6s91@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <445b205b-0a0b-da53-b7ba-98a1ac51aab4@suse.com>
Date: Mon, 1 Mar 2021 10:17:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YDyu3mWSgIIB6s91@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 01.03.2021 10:07, Roger Pau Monné wrote:
> On Fri, Feb 26, 2021 at 02:24:43PM +0100, Jan Beulich wrote:
>> On 26.02.2021 09:59, Roger Pau Monne wrote:
>>> The current build of the firmware relies on having 32bit compatible
>>> headers installed in order to build some of the 32bit firmware, but
>>> that usually requires multilib support and installing a i386 libc when
>>> building from an amd64 environment which is cumbersome just to get
>>> some headers.
>>>
>>> Usually this could be solved by using the -ffreestanding compiler
>>> option which drops the usage of the system headers in favor of a
>>> private set of freestanding headers provided by the compiler itself
>>> that are not tied to libc. However such option is broken at least
>>> in the gcc compiler provided in Alpine Linux, as the system include
>>> path (ie: /usr/include) takes precedence over the gcc private include
>>> path:
>>>
>>> #include <...> search starts here:
>>>  /usr/include
>>>  /usr/lib/gcc/x86_64-alpine-linux-musl/10.2.1/include
>>>
>>> Since -ffreestanding is currently broken on at least that distro, and
>>> for resilience against future compilers also having the option broken
>>> provide a set of stand alone 32bit headers required for the firmware
>>> build.
>>>
>>> This allows to drop the build time dependency on having a i386
>>> compatible set of libc headers on amd64.
>>>
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> with possibly small adjustments:
>>
>>> ---
>>> There's the argument of fixing gcc in Alpine and instead just use
>>> -ffreestanding. I think that's more fragile than providing our own set
>>> of stand alone headers for the firmware bits. Having the include paths
>>> wrongly sorted can easily make the system headers being picked up
>>> instead of the gcc ones, and then building can randomly fail because
>>> the system headers could be amd64 only (like the musl ones).
>>>
>>> I've also seen clang-9 on Debian with the following include paths:
>>>
>>> #include "..." search starts here:
>>> #include <...> search starts here:
>>>  /usr/local/include
>>>  /usr/lib/llvm-9/lib/clang/9.0.1/include
>>>  /usr/include/x86_64-linux-gnu
>>>  /usr/include
>>>
>>> Which also seems slightly dangerous as local comes before the compiler
>>> private path.
>>>
>>> IMO using our own set of stand alone headers is more resilient.
>>
>> I agree (in particular given the observations), but I don't view
>> this as an argument against use of -ffreestanding. In fact I'd
>> rather see this change re-based on top of Andrew's changes. Then ...
> 
> But doesn't using -nostdinc kind of defeats the purpose of
> -ffreestanding, as it would remove all default paths from the include
> search, and thus prevent using the gcc private headers?

I guess I don't understand: It is the purpose of this change here to
not use compiler provided headers (nor libc provided ones), so why
would it matter to retain any kind of built-in include paths?

>>> --- /dev/null
>>> +++ b/tools/firmware/include/stdint.h
>>> @@ -0,0 +1,39 @@
>>> +#ifndef _STDINT_H_
>>> +#define _STDINT_H_
>>> +
>>> +#ifdef __LP64__
>>> +#error "32bit only header"
>>> +#endif
>>
>> Could I talk you into extending this to also cover __P64__? (The
>> alternative I see would be to omit this altogether.)
> 
> Sure. I'm having a hard time finding any documentation for __P64__
> however. Does it stand for pointers are 64 bits, while longs are
> 32bits?

Yeah, it's uncommon in Linux/Unix, but it's the model Windows uses
for 64-bit environments.

Jan

