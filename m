Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00710250F03
	for <lists+xen-devel@lfdr.de>; Tue, 25 Aug 2020 04:31:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAOj5-0001vB-Ur; Tue, 25 Aug 2020 02:30:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qmWW=CD=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kAOj4-0001v6-8n
 for xen-devel@lists.xenproject.org; Tue, 25 Aug 2020 02:30:18 +0000
X-Inumbo-ID: e28b49ef-eba4-4587-bc01-64500d68e2f3
Received: from mail-qt1-x82b.google.com (unknown [2607:f8b0:4864:20::82b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e28b49ef-eba4-4587-bc01-64500d68e2f3;
 Tue, 25 Aug 2020 02:30:17 +0000 (UTC)
Received: by mail-qt1-x82b.google.com with SMTP id p36so4633161qtd.12
 for <xen-devel@lists.xenproject.org>; Mon, 24 Aug 2020 19:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hEdAzLuqaz9bXBUMPJgnyKXaHhCghkh4EeUSuXP7LHM=;
 b=kVoTD9ioR+jKJjWP8LZYxfd7LNO+q+2gnc20ZJA6kmXd3DtYe6oFHMWrYl9w8ULbMv
 DIFPSAdok4oPmG8yIMjdQYWhS8EGMgxVRreBa8gjexQbcleyHaIgeGYyquUBo6Gv+1Zx
 OUzP5TiT572YeI1gYcn1qlPS8TG6Q8Wvg7/R8CSpGa8oeN6CrCqnDCc4YT0hmw2TZojD
 335S6EdNYE7YsNdhZu6/1wSSjcrnLvOn6idPIokvXaTPftAb3lcUokqh9XVvolfY5i1i
 68+UY35XarWv1HKjBPxS81VJ7yJjOBUVoaeasPewsMUYgK0QG9NSZOeb1/oAyYV/EuDp
 bNxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hEdAzLuqaz9bXBUMPJgnyKXaHhCghkh4EeUSuXP7LHM=;
 b=D27LVxCH4twmzYNHi4XOddocuuZYiSH/dqiC9vyvYK0viXFBIRIzqWu3/ukZc9k874
 NfqyTsf1KEk1q4PJXN6eCuTUVCImyAwyDY2aPckKaa4THEekFjJIx3gNVxW7hS4kE9oI
 /xr0wZBeMgJ3mFHOeWknK1h0gFnroviz/q0l7naJYHVecNSzbQVEL+il4r7iNc0nWTN7
 lRpWZ1K9edwZfHFlX0b6eJO8eBxhUSPlKfa2Gk5krf4nrZeIOcfrhZKWIyeUYHhNjoqL
 v//9YW6xPWdVEb3xfSc2QdqikdshZPUI9ayB0UcAyZkZbp67/eZuIEWc+R+Ud2lbLizb
 roNQ==
X-Gm-Message-State: AOAM5326tM4MmCzbLEkZaHgeTSTgtPf3iGU9sjNladWFOBYfSJAChyBs
 WOvMT3x7aIrU7aY50bDXykFO0Hv3H8F7EL9TRKxWWQ==
X-Google-Smtp-Source: ABdhPJyOXTIgl4MJS7coPBW28imZPlub4MFBGplZF+i8bXHP9AU/SUh2cYhIqKygGAVJfq/0pI/hnypkwGG/IgDcJck=
X-Received: by 2002:ac8:6898:: with SMTP id m24mr7521018qtq.77.1598322616806; 
 Mon, 24 Aug 2020 19:30:16 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
 <CAMmSBy-dfc4PsYvmK+-=gTVqZbCsNUM=T_DVUC+aFU=riDrkpg@mail.gmail.com>
 <7e26e305-18f7-5ebc-1c8c-0e46f12d8f11@suse.com>
 <CAMmSBy8gJgZWGvgsiVd3Uo7egpyBY3_iw+cgMrcDehVPzRZ6ew@mail.gmail.com>
 <b82d6d15-b006-52f6-c638-d95b72c08975@suse.com>
In-Reply-To: <b82d6d15-b006-52f6-c638-d95b72c08975@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 24 Aug 2020 19:30:05 -0700
Message-ID: <CAMmSBy92R3_SwOZOqNm3nfX=4x2rvSRP2Tf1DO-Y+V9j-nwyTg@mail.gmail.com>
Subject: Re: Xen 4.14.0 fails on Dell IoT Gateway without efi=no-rs
To: Jan Beulich <jbeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, Aug 21, 2020 at 1:23 AM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 21.08.2020 09:38, Roman Shaposhnik wrote:
> > On Thu, Aug 20, 2020 at 11:47 PM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 20.08.2020 21:31, Roman Shaposhnik wrote:
> >>> Well, default is overloaded. What I would like to see (and consider it
> >>> a void of a small downstream/distro) is a community-agreed and
> >>> maintained way of working around these issues. Yes, I'd love to see
> >>> it working by default -- but if we can at least agree on an officially
> >>> supported knob that is less of a hammer than efi=attr=uc -- that'd
> >>> be a good first step.
> >>>
> >>> Makes sense?
> >>
> >> Sure, just that I don't see what less heavyweight alternatives
> >> to "efi=attr=uc" there are (short of supplying an option to
> >> provide per-range memory attributes, which would end up ugly
> >> to use). For the specific case here, "efi=attr=wp" could be
> >> made work, but might not be correct for all of the range (it's
> >> a EfiMemoryMappedIO range, after all); in the majority of cases
> >> of lacking attribute information that I've seen, UC was indeed
> >> what was needed.
> >
> > I think we're talking slightly past each other here -- you seem to be
> > more after trying to figure out how to make this box look like a dozen
> > killobucks worth a server, I'm after trying to figure out what callsites
> > in Xen tickle that region.
>
> What I'm trying is to understand what exactly is wrong in the firmware,
> as that'll likely allow determining a minimal workaround.

Fair enough. So let me start with a major update. After a bit of trial and
error it became apparent that a combination of efi=attr=uc AND
removing the call to efi_get_time as per:
    https://lists.archive.carbon60.com/xen/devel/408709
allows Xen to boot just fine and function properly on that device.

I'm not sure if that answers your question around what's wrong with
this firmware, but perhaps it suggests that the point from that old
thread above still maybe valid: perhaps avoiding GetTime() altogether
may help a lot of downstream users (especially those running on
more consumer-like h/w -- since this issue seems to come up in
QubesOS context as well).

Btw, just out of curiosity -- I poked around GetTime() disassembly
and while it is pretty convoluted my hunch is that it is indeed broken
for some internal reasons, not something as simple as page mapping.

So I guess a short version of answering your question would be:
GetTime() seems to be broken on this firmware.

> Figuring out
> the call sites is certainly also an approach, but the stack trace
> provided isn't enough for doing so, I'm afraid. Even the raw hex stack
> dump contains only two pointers into Xen's .text, and to figure what
> they represent one would need the xen.efi that was used. Possibly even
> a deeper stack dump might be needed.

Agreed. I was mostly using it to poke around possible reasons for it
failing.

> > I appreciate and respect your position, but please hear mine as well:
> > yes we're clearly into the "workaround" territory here, but clearly
> > Linux is fully capable of these workaround and I would like to understand
> > how expensive it will be to teach Xen those tricks as well.
>
> My prime example here is their blanket avoiding of the time related
> runtime services, despite the EFI spec saying the exact opposite.

Well, to be fair, it seems that the practical experience with various
bits of hardware suggests that in this particular case avoidance
may be the lesser of all the evils.

Or to ask a complimentary question: what's the danger of making that
patch (in a cleaned up form) the default behaviour? Will there be any
instances of hardware where it may actually hurt?

> "efi=no-rs" is just a wider scope workaround of this same kind.

The problem with "efi=no-rs" is that it is actually unbounded.

IOW, compare two cases:
   1. disable a single call to GetTime()
   2. disable all calls to EFI RS?
Case #1 I can reason about -- case #2 -- not so much (unless somebody
explains to me the full scope of what gets disabled when efi=no-rs).

Now, you may say (and seems like you do ;-)) that if a small part of
the implementation can't be trusted -- the entire thing shouldn't be
trusted -- I don't think I will buy into that policy -- but it is a policy.

> The reasoning I see behind this is that if the time related runtime
> services are problematic, how likely is it that others are fine to
> use? And how would an admin know without first having run into some
> crash? If there are fair reasons to have finer grained disabling of
> runtime services - why not? But it'll still take a command line
> option to do so, unless (as was proposed) a build-time option of
> enabling all (common?) workarounds by default gets made use of.

Well, policy (and trust issues) aside -- I think the real question
is -- it seems that there's quite a bit of downstream that agrees
that avoiding GetTime() is a good idea. What options do we have
to make that possible without each downstream carrying a custom
patch (which I'm adding to EVE as we speak)?

> > Now, whether you'd accept these tricks upstream or not is an entirely
> > orthogonal question.
>
> Well, I'd say "separate", not "orthogonal", because the nature of
> such workarounds qualifies (to me) what is or is not acceptable as
> default behavior.

Good point.

Thanks,
Roman.

