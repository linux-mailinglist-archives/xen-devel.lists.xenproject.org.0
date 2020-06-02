Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0B5E1EC54D
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 00:51:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgFjx-0008NE-Nj; Tue, 02 Jun 2020 22:50:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3oJT=7P=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jgFjw-0008N8-2p
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2020 22:50:36 +0000
X-Inumbo-ID: 789a3f62-a523-11ea-81bc-bc764e2007e4
Received: from mail-qv1-xf42.google.com (unknown [2607:f8b0:4864:20::f42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 789a3f62-a523-11ea-81bc-bc764e2007e4;
 Tue, 02 Jun 2020 22:50:35 +0000 (UTC)
Received: by mail-qv1-xf42.google.com with SMTP id r16so170055qvm.6
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2020 15:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+QEXNvJJupTq9Fc0kGu/z00JuIQCytaVsg1Z3JMDJMA=;
 b=R+iMx6576lqXbvTX7zjBl3MzVXvF0W07XF0DORDTwG3EeJc0alRMOoWM9J8L5uiR/X
 ERjiqDTuGkAEjLgT/T2C8+EmwtnQJDWzPiloifdVDgRQ6BEPmlKHb63yavV3LKB95C61
 RJ0ujxieuY18YgHGlzBo/4iw8LXJJwoINUCB5LPfpjApUewRpN1jYL4q3Hyli4osw2EM
 R3pfcYgRsgqObbiE2P+AQvj7cmSwKzIHTjE8UZhz0v5TTCHAnyU9r1IPNWXrZEz8/LPM
 K7KIjFraKeBCxhRhBrTGyUJlu5RyhmvFlW1cvLEuYsSOP+88HymMVhvQ3Msn1dtIjxz0
 e6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+QEXNvJJupTq9Fc0kGu/z00JuIQCytaVsg1Z3JMDJMA=;
 b=r4ru9bI+JJIyBNIWI2S/j39oUcwjw7qIOqo3YuE9X7R8H8MRqzmI3twMvr4fNUDAc5
 0efjciNVZWoOUkf98envq7Gm6GD19wCSlo4F0ojLAEG6AzwEqAsvGLnBnkrcq7mbXSC1
 OLJBYua1WYSIbisoih3OYMcCXycKXzBndROpmDLB7shjvZDjL4sXR9h4EMy6YThCBcfc
 NgFYZLbbYykbjuszEQo5mhyzDCrVJaweTBu3IRjdbQQYNqbW8S4n7M7jUoVYT7OE+6mI
 2ULKgYpDPS3r2VRDtmjeEn2dgxxpAwGVcVglSL1BSK9ZAcefJfrRnLSpjDYNVxBrDpUc
 EoJA==
X-Gm-Message-State: AOAM532vxucB9o7WzYsLPCNBnlyLY8AQOS29aGdHd7yudBrajvR/RXpo
 o486OqokgAIIVlie1Z3JEvK56zK96GHpjp+aj/IIRw==
X-Google-Smtp-Source: ABdhPJw8DGBoajL9Xc6Q0k3mRpFLrhh3tCCY8P3rcRZoSmZcEatzWPCSRxiO8ttQtySl31mh0yoNksAmh0O4czSNgPU=
X-Received: by 2002:a0c:8386:: with SMTP id k6mr28319468qva.213.1591138235133; 
 Tue, 02 Jun 2020 15:50:35 -0700 (PDT)
MIME-Version: 1.0
References: <CAMmSBy9R57ntWmzNZDvwcvJM1f1wwD7ogWvCshipAcPX4x-TmQ@mail.gmail.com>
 <CAJ=z9a2B1+A8jPXiE9adNSTWHENtULnmAxq2M5v6MxB5thZLfw@mail.gmail.com>
 <CAMmSBy_djgfQ1NT2TGo+1=7c20PyX-mzf6JiPx5ibnRkFT_5BQ@mail.gmail.com>
 <alpine.DEB.2.21.2006010911260.12801@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2006010911260.12801@sstabellini-ThinkPad-T480s>
From: Roman Shaposhnik <roman@zededa.com>
Date: Tue, 2 Jun 2020 15:50:24 -0700
Message-ID: <CAMmSBy_Phfrxdjw1sSxpz-J2Q8h1n9ovp6k9a7Eiqj6HJQUNNA@mail.gmail.com>
Subject: Re: UEFI support in ARM DomUs
To: Stefano Stabellini <sstabellini@kernel.org>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>,
 Nataliya Korovkina <malus.brandywine@gmail.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 1, 2020 at 9:12 AM Stefano Stabellini
<sstabellini@kernel.org> wrote:
>
> + George
>
> On Sun, 31 May 2020, Roman Shaposhnik wrote:
> > Hi Julien!
> >
> > On Sun, May 31, 2020 at 3:24 PM Julien Grall <julien.grall.oss@gmail.com> wrote:
> > >
> > > On Sun, 31 May 2020 at 23:05, Roman Shaposhnik <roman@zededa.com> wrote:
> > > > Hi!
> > > >
> > > > with a lot of help from Stefano, we're getting RPi4 support in
> > > > Project EVE pretty much on par between KVM and Xen.
> > > >
> > > > One big area that still remains is supporting UEFI boot sequence
> > > > for DomUs. With KVM, given the qemu virt device model this is
> > > > as simple as using either stock UEFI build for arm or even U-Boot
> > > > EFI emulation environment and passing it via -bios option.
> > > >
> > > > Obviously with Xen on ARM we don't have the device model so
> > > > my understanding is that the easiest way we can support it would
> > > > be to port UEFI's OvmfPkg/OvmfXen target to ARM (it seems to
> > > > be currently exclusively X64).
> > >
> > > EDK2 has been supporting Xen on Arm for the past 5 years. We don't use
> > > OvmfPkg/OvmfXen but ArmVirtPkg/ArmVirtXen (see [1]).
> > > I haven't tried to build it recently, but I should be able to help if
> > > there is any issue with it.
> > >
> > > Cheers,
> > >
> > > [1] https://github.com/tianocore/edk2/blob/master/ArmVirtPkg/ArmVirtXen.fdf
> >
> > This is really, really awesome -- I guess it would be really helpful to document
> > this someplace on the ARM/Xen wiki (I can volunteer if someone can grant
> > me the karma).
>
> Regarding the wiki: yes please! Let George know if you don't have write access.

Hey Geroge -- FWIW: my wiki account name is rvs -- please let me know
once you enable whatever needs to be enabled for my write access.

Thanks,
Roman.

