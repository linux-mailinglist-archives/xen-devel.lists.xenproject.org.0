Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DC0251318
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 09:24:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kATIs-0002pX-9h; Tue, 25 Aug 2020 07:23:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kATIq-0002pS-Sh
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 07:23:32 +0000
X-Inumbo-ID: d80dec2b-71d5-4110-9ca7-c7e42b05506b
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d80dec2b-71d5-4110-9ca7-c7e42b05506b;
 Tue, 25 Aug 2020 07:23:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BF404AE63;
 Tue, 25 Aug 2020 07:24:00 +0000 (UTC)
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Roman Shaposhnik <roman@zededa.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
 <CAMmSBy-dfc4PsYvmK+-=gTVqZbCsNUM=T_DVUC+aFU=riDrkpg@mail.gmail.com>
 <7e26e305-18f7-5ebc-1c8c-0e46f12d8f11@suse.com>
 <CAMmSBy8gJgZWGvgsiVd3Uo7egpyBY3_iw+cgMrcDehVPzRZ6ew@mail.gmail.com>
 <b82d6d15-b006-52f6-c638-d95b72c08975@suse.com>
 <CAMmSBy92R3_SwOZOqNm3nfX=4x2rvSRP2Tf1DO-Y+V9j-nwyTg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <21e3dbc2-8e48-7e2f-40ab-2023d4c5be2f@suse.com>
Date: Tue, 25 Aug 2020 09:23:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAMmSBy92R3_SwOZOqNm3nfX=4x2rvSRP2Tf1DO-Y+V9j-nwyTg@mail.gmail.com>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 25.08.2020 04:30, Roman Shaposhnik wrote:
> On Fri, Aug 21, 2020 at 1:23 AM Jan Beulich <jbeulich@suse.com> wrote:
>> On 21.08.2020 09:38, Roman Shaposhnik wrote:
>>> I think we're talking slightly past each other here -- you seem to be
>>> more after trying to figure out how to make this box look like a dozen
>>> killobucks worth a server, I'm after trying to figure out what callsites
>>> in Xen tickle that region.
>>
>> What I'm trying is to understand what exactly is wrong in the firmware,
>> as that'll likely allow determining a minimal workaround.
> 
> Fair enough. So let me start with a major update. After a bit of trial and
> error it became apparent that a combination of efi=attr=uc AND
> removing the call to efi_get_time as per:
>     https://lists.archive.carbon60.com/xen/devel/408709
> allows Xen to boot just fine and function properly on that device.

Interesting. I'd be curious of what results if just one of the
two is used (for both of them).

>>> I appreciate and respect your position, but please hear mine as well:
>>> yes we're clearly into the "workaround" territory here, but clearly
>>> Linux is fully capable of these workaround and I would like to understand
>>> how expensive it will be to teach Xen those tricks as well.
>>
>> My prime example here is their blanket avoiding of the time related
>> runtime services, despite the EFI spec saying the exact opposite.
> 
> Well, to be fair, it seems that the practical experience with various
> bits of hardware suggests that in this particular case avoidance
> may be the lesser of all the evils.
> 
> Or to ask a complimentary question: what's the danger of making that
> patch (in a cleaned up form) the default behaviour? Will there be any
> instances of hardware where it may actually hurt?

ACPI tables have a flag indicating that there's no CMOS clock in
the system. Without that, and without use of GetTime() there's no
wall clock source. Andrew keeps suggesting that we shouldn't
have a need to use the wall clock, but I'm afraid I haven't been
able to understand what the alternative (and still backwards
compatible) behavior would be, and hence I've been hoping for him
to put together patches carrying out the plan.

Of course in turn there are systems having the flag set despite
there being a CMOS clock, telling people that there are reasons
to ignore the flag (and still avoid GetTime()).

Apart from this case (which could be taken care of) there's the
collision with my underlying position here that I've described
before: Xen should be spec conformant on spec conformant
systems. This implies using GetTime() when running on EFI.

>> "efi=no-rs" is just a wider scope workaround of this same kind.
> 
> The problem with "efi=no-rs" is that it is actually unbounded.
> 
> IOW, compare two cases:
>    1. disable a single call to GetTime()
>    2. disable all calls to EFI RS?
> Case #1 I can reason about -- case #2 -- not so much (unless somebody
> explains to me the full scope of what gets disabled when efi=no-rs).
> 
> Now, you may say (and seems like you do ;-)) that if a small part of
> the implementation can't be trusted -- the entire thing shouldn't be
> trusted -- I don't think I will buy into that policy -- but it is a policy.

The common case is that parts of memory accessed by runtime services
aren't marked for runtime use in the memory map. Once there is _one_
such problem that the developers of the firmware allowed to slip in,
how can you trust there being exactly one such problem, or how can
you be certain of which of the runtime service functions are affected.

As to your question regarding the full scope - I'm pretty unclear
what you mean by this: No use of runtime services means exactly that.
Just go look at the EFI_RUNTIME_SERVICES struct (plus of course
whatever is wired up in the first place in Xen). If you're after
end user visible effects, I'm afraid this is the wrong forum to ask,
as those will depend on what is wired up (and hence expected to be
usable) in higher software layers.

>> The reasoning I see behind this is that if the time related runtime
>> services are problematic, how likely is it that others are fine to
>> use? And how would an admin know without first having run into some
>> crash? If there are fair reasons to have finer grained disabling of
>> runtime services - why not? But it'll still take a command line
>> option to do so, unless (as was proposed) a build-time option of
>> enabling all (common?) workarounds by default gets made use of.
> 
> Well, policy (and trust issues) aside -- I think the real question
> is -- it seems that there's quite a bit of downstream that agrees
> that avoiding GetTime() is a good idea. What options do we have
> to make that possible without each downstream carrying a custom
> patch (which I'm adding to EVE as we speak)?

If there is sufficient evidence that there's a large part of
systems with just the time interfaces broken, we can make a command
line option to suppress just their use. The argument I've been
hearing though behind avoiding these runtime service functions is
that they're broken mainly because Windows doesn't use them, and
hence them being broken doesn't get noticed when certifying these
systems. With this, we'd instead need to disable all runtime
services Windows doesn't use, which as an input requires us to know
which ones these are. As a result the possible command line option
wouldn't be "no-time" but "like-windows", which makes me shudder.

Of course the suggested Kconfig option to "enable common
workarounds" could then enable just this option rather than "no-rs",
if deemed more useful this way.

Jan

