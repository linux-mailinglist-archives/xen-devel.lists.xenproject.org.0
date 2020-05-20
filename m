Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8661DAFEA
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 12:17:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbLmq-0001do-Ch; Wed, 20 May 2020 10:17:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbLmp-0001dj-Kr
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 10:17:19 +0000
X-Inumbo-ID: 13ed24f9-9a83-11ea-a9e1-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 13ed24f9-9a83-11ea-a9e1-12813bfff9fa;
 Wed, 20 May 2020 10:17:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C04E5B1EF;
 Wed, 20 May 2020 10:17:17 +0000 (UTC)
Subject: Re: [PATCH v2] x86: use POPCNT for hweight<N>() when available
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <55a4a24d-7fac-527c-6bcf-8d689136bac2@suse.com>
 <20200514140522.GD54375@Air-de-Roger>
 <83534bf1-fa57-1d4a-c615-f656338a8457@suse.com>
 <20200520093106.GI54375@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <53fdfbe2-615a-72f9-7f2d-26402a0a64d0@suse.com>
Date: Wed, 20 May 2020 12:17:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520093106.GI54375@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 20.05.2020 11:31, Roger Pau Monné wrote:
> On Wed, May 20, 2020 at 10:31:38AM +0200, Jan Beulich wrote:
>> On 14.05.2020 16:05, Roger Pau Monné wrote:
>>> On Mon, Jul 15, 2019 at 02:39:04PM +0000, Jan Beulich wrote:
>>>> @@ -251,6 +255,10 @@ boot/mkelf32: boot/mkelf32.c
>>>>   efi/mkreloc: efi/mkreloc.c
>>>>   	$(HOSTCC) $(HOSTCFLAGS) -g -o $@ $<
>>>>   
>>>> +nocov-y += hweight.o
>>>> +noubsan-y += hweight.o
>>>> +hweight.o: CFLAGS += $(foreach reg,cx dx si 8 9 10 11,-ffixed-r$(reg))
>>>
>>> Why not use clobbers in the asm to list the scratch registers? Is it
>>> that much expensive?
>>
>> The goal is to disturb the call sites as little as possible. There's
>> no point avoiding the scratch registers when no call is made (i.e.
>> when the POPCNT insn can be used). Taking away from the compiler 7
>> out of 15 registers (that it can hold live data in) seems quite a
>> lot to me.
> 
> IMO using -ffixed-reg for all those registers is even worse, as that
> prevents the generated code in hweight from using any of those, thus
> greatly limiting the amount of registers and likely making the
> generated code rely heavily on pushing an popping from the stack?

Okay, that's the other side of the idea behind all this: Virtually no
hardware we run on will lack POPCNT support, hence the quality of
these fallback routines matters only the very old hardware, where we
likely don't perform optimally already anyway.

> This also has the side effect to limiting the usage of popcnt to gcc,
> which IMO is also not ideal.

Agreed. I don't know enough about clang to be able to think of
possible alternatives. In any event there's no change to current
behavior for hypervisors built with clang.

> I also wondered, since the in-place asm before patching is a call
> instruction, wouldn't inline asm at build time already assume that the
> scratch registers are clobbered?

That would imply the compiler peeks into the string literal of the
asm(). At least gcc doesn't, and even if it did it couldn't infer an
ABI from seeing a CALL insn.

Jan

