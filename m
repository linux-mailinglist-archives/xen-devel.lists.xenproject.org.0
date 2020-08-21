Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9A824CF68
	for <lists+xen-devel@lfdr.de>; Fri, 21 Aug 2020 09:38:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k91dF-0000jz-9U; Fri, 21 Aug 2020 07:38:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8eW/=B7=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1k91dE-0000ju-HL
 for xen-devel@lists.xenproject.org; Fri, 21 Aug 2020 07:38:36 +0000
X-Inumbo-ID: 51705112-bc61-49f4-b0b8-31131cf79c11
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 51705112-bc61-49f4-b0b8-31131cf79c11;
 Fri, 21 Aug 2020 07:38:35 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id 144so643671qkl.5
 for <xen-devel@lists.xenproject.org>; Fri, 21 Aug 2020 00:38:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0iQNhUql6lXaBdJf/CoI22UqzZHXfrSSFxorcPOqjLs=;
 b=VkCieuv4pG6KjpGVWol89I5xH11ByIso+ozNYGxNB3TX0vkwPScvP/MIoPLxpmHp5q
 IsnWGif97smiMJQYmUPwNyuuT6W58ILcEK40f1xFwzRgjxWaSKsfPEEz5udPwbYdtFQa
 5swFzLZ3V65rAvJPlhWMTgKy6Q1HRdlh+yGkVHd29k2wqJPHzpl+O3epWBRRWSTVZzNi
 +/AgjYG5lmffwp7uvqcIIQT3PhR0zwN/l7im+4ugp2K6npCtsVGTFCfAWZRVTxAuCKGP
 AKye1ESYhJ5kec2f0VO2DVCZwRwS5UVqWEBQnAZJXC3LjM7an10QT1CdoThYMww/WYC4
 pMEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0iQNhUql6lXaBdJf/CoI22UqzZHXfrSSFxorcPOqjLs=;
 b=qWpAp8IDuy/idrcvBLrv7hBe9Z4oMdaHo8xpEjJ8xHdfAR/OuNHs2GhHeBp4qUm1ED
 nRKLdgnmd1E9c0ZoJDt6Ls+vL6eazAghxS9uuFnaIjxqGC5ipp4nAXMiiKi+HI4qIfSD
 YZ4/Ea3x16KwTAf+WFKGXCI677D+E16rwX/xRVHIJL1R8geHFsIHxEuRtoM1y2Bo6TtE
 R6DJr8qGKwFWYGcrSip4+6Mrm9QvapTxZIIX14Li2oAnRByme7IV6UmRMD/fArf4kb6O
 V7RwNmojOdrwdovFneDcLVdFMGjzpDV/Qfy5tOkBzuoMCccxw4n6McRCmMfTjvUBeO0Z
 gmzw==
X-Gm-Message-State: AOAM533znT33ee7i+WtyX4ECq2f5dZOlgtnhwGt04ARyqQY2pCHJk1nj
 oz4Wz9xwuRTR+1CPzZSJz72u5owgO2ugxyhl22bu4Q==
X-Google-Smtp-Source: ABdhPJycSUKABFIM/S7mucZ9aMAqdFfdWXqv+SSpRjONkfKHB1LMDK05YKEiz3HaN+KjetBM/QeWHFCUiCMSb0vnwko=
X-Received: by 2002:a37:9f48:: with SMTP id i69mr1635165qke.267.1597995515218; 
 Fri, 21 Aug 2020 00:38:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9UUr0T0wT4gG_zAVTa6q=1yVL+js5ciOAnNZyvmAeaPA@mail.gmail.com>
 <8b0e088c-baa9-93db-02f8-369acb008b69@suse.com>
 <CAMmSBy-dfc4PsYvmK+-=gTVqZbCsNUM=T_DVUC+aFU=riDrkpg@mail.gmail.com>
 <7e26e305-18f7-5ebc-1c8c-0e46f12d8f11@suse.com>
In-Reply-To: <7e26e305-18f7-5ebc-1c8c-0e46f12d8f11@suse.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Fri, 21 Aug 2020 00:38:24 -0700
Message-ID: <CAMmSBy8gJgZWGvgsiVd3Uo7egpyBY3_iw+cgMrcDehVPzRZ6ew@mail.gmail.com>
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

On Thu, Aug 20, 2020 at 11:47 PM Jan Beulich <jbeulich@suse.com> wrote:
>
> On 20.08.2020 21:31, Roman Shaposhnik wrote:
> > On Thu, Aug 20, 2020 at 1:34 AM Jan Beulich <jbeulich@suse.com> wrote:
> >> On 20.08.2020 00:50, Roman Shaposhnik wrote:
> >>> (XEN) Unknown cachability for MFNs 0xff900-0xfffff
> >>
> >> The fault address falling in this range suggests you can use a less
> >> heavy workaround: "efi=attr=uc". (Quite possibly "efi=no-rs" or yet
> >> some other workaround may still be needed for your subsequent reboot
> >> hang.)
> >
> > I just tried and efi=attr=uc and it is, indeed, a workaround. I can get to
> > Dom0 booting far enough (and then I hit the other issue).
> >
> > However, since efi=attr=uc has always struck me as a bit of a hammer
> > still I tried the good ol':
> >      https://lists.archive.carbon60.com/xen/devel/408709
> >
> > And then Xen crashed in an interesting way (see below). Now, this
> > is with CONFIG_EFI_SET_VIRTUAL_ADDRESS_MAP -- so not sure
> > if it is related.
>
> Why "interesting way" - it's the same as before, you're
> hitting the range reported by "Unknown cachability for MFNs
> 0xff900-0xfffff"

It is interesting because it is a different call site -- that's what I'm after.

But you're right, of course, it fails because of the same range.

Why it is interesting to me -- see below.

> >> As far as making cases like this work by default, I'm afraid it'll
> >> need to be proposed to replace me as the maintainer of EFI code in
> >> Xen. I will remain on the position that it is not acceptable to
> >> apply workarounds for firmware issues by default unless they're
> >> entirely benign to spec-conforming systems. DMI data based enabling
> >> of workarounds, for example, is acceptable in the common case, as
> >> long as the matching pattern isn't unreasonably wide.
> >
> > Well, default is overloaded. What I would like to see (and consider it
> > a void of a small downstream/distro) is a community-agreed and
> > maintained way of working around these issues. Yes, I'd love to see
> > it working by default -- but if we can at least agree on an officially
> > supported knob that is less of a hammer than efi=attr=uc -- that'd
> > be a good first step.
> >
> > Makes sense?
>
> Sure, just that I don't see what less heavyweight alternatives
> to "efi=attr=uc" there are (short of supplying an option to
> provide per-range memory attributes, which would end up ugly
> to use). For the specific case here, "efi=attr=wp" could be
> made work, but might not be correct for all of the range (it's
> a EfiMemoryMappedIO range, after all); in the majority of cases
> of lacking attribute information that I've seen, UC was indeed
> what was needed.

I think we're talking slightly past each other here -- you seem to be
more after trying to figure out how to make this box look like a dozen
killobucks worth a server, I'm after trying to figure out what callsites
in Xen tickle that region.

I appreciate and respect your position, but please hear mine as well:
yes we're clearly into the "workaround" territory here, but clearly
Linux is fully capable of these workaround and I would like to understand
how expensive it will be to teach Xen those tricks as well.

Now, whether you'd accept these tricks upstream or not is an entirely
orthogonal question.

Thanks,
Roman.

P.S. And yes, ultimately, settling for efi=no-rs is what I did before
at least once.
So maybe shaving the callsite yak won't be that much fun after all.

