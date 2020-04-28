Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AB71BB8C5
	for <lists+xen-devel@lfdr.de>; Tue, 28 Apr 2020 10:24:55 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTLXp-0003B9-Si; Tue, 28 Apr 2020 08:24:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jTLXo-0003B0-E0
 for xen-devel@lists.xenproject.org; Tue, 28 Apr 2020 08:24:44 +0000
X-Inumbo-ID: b5f9de78-8929-11ea-b07b-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5f9de78-8929-11ea-b07b-bc764e2007e4;
 Tue, 28 Apr 2020 08:24:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6948AAC2C;
 Tue, 28 Apr 2020 08:24:41 +0000 (UTC)
Subject: Re: [PATCH] x86/ioemul: Rewrite stub generation
To: Andrew Cooper <andrew.cooper3@citrix.com>
References: <20200427122041.7162-1-andrew.cooper3@citrix.com>
 <ca3374ed-6e00-7ab2-8255-f74c16b5ad3d@suse.com>
 <ec073c8d-61a2-79ef-1ffe-d34e26a5319d@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <76b879d9-c3b5-900d-55d9-60b48e98adfa@suse.com>
Date: Tue, 28 Apr 2020 10:24:33 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <ec073c8d-61a2-79ef-1ffe-d34e26a5319d@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 28.04.2020 00:20, Andrew Cooper wrote:
> On 27/04/2020 16:28, Jan Beulich wrote:
>> On 27.04.2020 14:20, Andrew Cooper wrote:
>>> The logic is completely undocumented and almost impossible to follow.  It
>>> actually uses return oriented programming.  Rewrite it to conform to more
>>> normal call mechanics, and leave a big comment explaining thing.  As well as
>>> the code being easier to follow, it will execute faster as it isn't fighting
>>> the branch predictor.
>>>
>>> Move the ioemul_handle_quirk() function pointer from traps.c to
>>> ioport_emulate.c.  There is no reason for it to be in neither of the two
>>> translation units which use it.  Alter the behaviour to return the number of
>>> bytes written into the stub.
>>>
>>> Access the addresses of the host/guest helpers with extern const char arrays.
>>> Nothing good will come of C thinking they are regular functions.
>> I agree with the C aspect, but imo the assembly routines should,
>> with the changes you make, be marked as being ordinary functions.
> 
> Despite the changes, they are still very much not ordinary functions,
> and cannot be used by C.
> 
> I have no objection to marking them as STT_FUNCTION (as this doesn't
> mean C function), but...
> 
>> A reasonable linker would then warn about the C file wanting an
>> STT_OBJECT while the assembly file provides an STT_FUNC. I'd
>> therefore prefer, along with marking the functions as such, to
>> have them also declared as functions in C.
> 
> ... there is literally nothing safe which C can do with them other than
> manipulate their address.
> 
> Writing it like this is specifically prevents something from compiling
> which will explode at runtime, is someone is naive enough to try using
> the function from C.

Besides being certain that such an attempt, if it made it into a
submitted patch in the first place, would be caught by review, I
don't see you addressing my main counter argument. Preventing a
declared function to be called can be had by other means, e.g.
__attribute__((__warning__())).

>>> @@ -19,18 +22,16 @@ static bool ioemul_handle_proliant_quirk(
>>>          0xa8, 0x80, /*    test $0x80, %al */
>>>          0x75, 0xfb, /*    jnz 1b          */
>>>          0x9d,       /*    popf            */
>>> -        0xc3,       /*    ret             */
>>>      };
>>>      uint16_t port = regs->dx;
>>>      uint8_t value = regs->al;
>>>  
>>>      if ( (opcode != 0xee) || (port != 0xcd4) || !(value & 0x80) )
>>> -        return false;
>>> +        return 0;
>>>  
>>>      memcpy(io_emul_stub, stub, sizeof(stub));
>>> -    BUILD_BUG_ON(IOEMUL_QUIRK_STUB_BYTES < sizeof(stub));
>> So you treat a build failure for a runtime crash.
> 
> I presume you mean s/treat/trade/ here, and the answer is no, not really.
> 
> There is nothing which actually forced a connection between the build
> time checks and runtime behaviour, so it was only a facade of safety,
> not real safety.

I'm not following, I'm afraid: The above together with

    BUILD_BUG_ON(STUB_BUF_SIZE / 2 < MAX(9, /* Default emul stub */
                                         5 + IOEMUL_QUIRK_STUB_BYTES));

(where the literal numbers live next to what they describe)
did very well provide some level of guarding.

>>  I can see the
>> advantages of the new approach, but the original got away with
>> less stub space.
> 
> Stub space doesn't matter, so long as it fits.  In particular, ...
> 
>> If our L1_CACHE_SHIFT wasn't hard coded to 7
>> just to cover some unusual CPUs, your new approach would, if I
>> got the counting and calculations right, not work (with a value
>> resulting in a 64-byte cache line size).
> 
> ... the SYSCALL stubs use 64 bytes so Xen cannot function with a shift
> less than 7.

Oh, my fault - I read the STUB_BUF_SHIFT expression as min() when
it really is max(). So yes, we can rely on there being 64 bytes.
(Everything further down therefore becomes moot afaict.)

>> Introducing a Kconfig
>> option for this should imo not come with a need to re-work the
>> logic here again. Therefore I'd like us to think about a way
>> to make the space needed not exceed 32 bytes.
> 
> And why would we ever want an option like that?  (I know how you're
> going to answer this, so I'm going to pre-emptively point out that there
> are hundreds of kilobytes of easier-to-shrink per-cpu data structures
> than this one).

Not sure what per-CPU data structures you talk about. I wasn't
thinking of space savings in particular, but rather about getting
our setting in sync with actual hardware. Its value is, afaics,
used in a far more relevant way by xmalloc() and friends.

Jan

> Honestly, this suggestion is a total waste of time and effort.  It is an
> enormous amount of complexity to micro-optimise a problem which doesn't
> exist in the first place.
> 
> The stubs are already 128 bytes per CPU and cannot be made smaller. 
> Attempting to turn this particular stub into <32 has no benefit (the
> stubs don't actually get smaller), and major costs.
> 
> ~Andrew
> 


