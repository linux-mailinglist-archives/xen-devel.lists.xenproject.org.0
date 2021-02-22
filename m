Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B790B321787
	for <lists+xen-devel@lfdr.de>; Mon, 22 Feb 2021 13:50:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88037.165377 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEAei-0007mJ-TR; Mon, 22 Feb 2021 12:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88037.165377; Mon, 22 Feb 2021 12:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEAei-0007le-QC; Mon, 22 Feb 2021 12:49:40 +0000
Received: by outflank-mailman (input) for mailman id 88037;
 Mon, 22 Feb 2021 12:49:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+pG5=HY=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lEAeh-0007lZ-6d
 for xen-devel@lists.xenproject.org; Mon, 22 Feb 2021 12:49:39 +0000
Received: from mail-lj1-x22b.google.com (unknown [2a00:1450:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 15126312-c21f-45db-8972-33c8c130575b;
 Mon, 22 Feb 2021 12:49:38 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id y7so55435342lji.7
 for <xen-devel@lists.xenproject.org>; Mon, 22 Feb 2021 04:49:38 -0800 (PST)
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
X-Inumbo-ID: 15126312-c21f-45db-8972-33c8c130575b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q1DxJj8swHEeWTeo4fAZR8P2RH2Uf8viG+/8tvr60tA=;
        b=sQWPyYDh5UPyg28k4b98VvetcT/u5cqyMYfGY8M56nJqb4fl0gZwWb6k4BuAr15i4w
         +iICfEgHtFxHmiWMxRsgLNrnaaw6qACh6s3T+huC9wzVxHo+um3T6yAx6ZS6qEvKYQhb
         WrOV9iI+hPsOjjQT8VunpIZZ0DHdHY/NAhmb9NNaXfKgEEPJpoxP1nrslY9rqxnAbTqZ
         olv8uJUjARfNRjd0inEyf35SrOXXs9osa91zqleVARHz7TmzRAzMuTuYWSKLaaxCWiFI
         sEfj/bU+O5FjztLIRCgk81nipAaPqMLQiMWwxGlKtP/YBxEWq1bc3Dk771YmOY6DsW7w
         ozqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q1DxJj8swHEeWTeo4fAZR8P2RH2Uf8viG+/8tvr60tA=;
        b=FWeNkpujNDrzJXJxjaYi0ApMJ9Z4qEMAm7jr9yiKT7Tc0DRYxmIITJrTxToiZCy9Mb
         NDtvsMYOE+FeuW8ChyODsre/3V5QLueFDE15Og5vnL30hylsqM59UJ9S3TebbjLc0UVW
         hMyn92z3JvZou/dIYTd+Jp4gKpk1YZ23gGAuLbAE31CC6C3b2CcB4mG5/2hz7wTGB+ww
         7ddJmgooIMZByHeHjH9aTNssHJ3VUr8IjOxfNaUIMKt7cIn5T7Mv4mTAX7SlTpE/35J0
         Ne/GzE2esgQE/3y50OFTy1sv2vXX3OXmri+Xn2IR68ZDY5QkgLcjSMR8HXzmUNJow35D
         Ny5w==
X-Gm-Message-State: AOAM530TxRg1Lsdeis/waOsaD7VeNyJgsNLbsrIvVrIRIyni7RtAr+1L
	oz+rsHFX0m07U9DO0yoXATwin5CVur64DfX7cPs=
X-Google-Smtp-Source: ABdhPJy9vJjFJ/Jr5h1qILzD/nDIRxWypyGDc05UhEIQd3n0S1GjaBpSMNlADzg96SFwGF6RGQ/miGcKYbNsoiSApik=
X-Received: by 2002:a2e:9ec6:: with SMTP id h6mr6095597ljk.12.1613998177145;
 Mon, 22 Feb 2021 04:49:37 -0800 (PST)
MIME-Version: 1.0
References: <1a3b90f4-564e-84d3-fd6a-3454e8753579@citrix.com>
 <20201015113109.GA68032@Air-de-Roger> <CAKf6xpsJYT7VCeaf6TxPNK1QD+3U9E8ST7E+mWtfDjw0k9L9dA@mail.gmail.com>
 <CAKf6xps1q9zMBeFg7C7ZhD-JcwQ6EG6+bYvvA9QT8PzzxKqMNg@mail.gmail.com>
 <20201021095809.o53b6hpvjl2lbqsi@Air-de-Roger> <CAKf6xpuTE4gBNe4YXPYh_hAMLaJduDuKL5_6aC4H=y6DRxaxvw@mail.gmail.com>
 <a4dd7778-9bd4-00c1-3056-96d435b70d70@suse.com> <CAKf6xpvKiWiU5Wsv2C1EiEFr77nMZTd+VHgkdk7qcKw1OFD8Vg@mail.gmail.com>
 <9bbf6768-a39e-2b3c-c4de-fd883cc9ef85@suse.com> <CAKf6xpuTbvGtTRHPK9Ock7rxJk4DfCumgTW7-2_PADm9cSaUBg@mail.gmail.com>
 <YDOE35zhQYwgaxke@Air-de-Roger>
In-Reply-To: <YDOE35zhQYwgaxke@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Mon, 22 Feb 2021 07:49:25 -0500
Message-ID: <CAKf6xpvoKmFVp2HtsTVZS8w+GntpAEKXan8fB72JEy1rrWgC1A@mail.gmail.com>
Subject: Re: i915 dma faults on Xen
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	intel-gfx@lists.freedesktop.org, xen-devel <xen-devel@lists.xenproject.org>, 
	eric chanudet <eric.chanudet@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2021 at 5:18 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Fri, Feb 19, 2021 at 12:30:23PM -0500, Jason Andryuk wrote:
> > On Wed, Oct 21, 2020 at 9:59 AM Jan Beulich <jbeulich@suse.com> wrote:
> > >
> > > On 21.10.2020 15:36, Jason Andryuk wrote:
> > > > On Wed, Oct 21, 2020 at 8:53 AM Jan Beulich <jbeulich@suse.com> wro=
te:
> > > >>
> > > >> On 21.10.2020 14:45, Jason Andryuk wrote:
> > > >>> On Wed, Oct 21, 2020 at 5:58 AM Roger Pau Monn=C3=A9 <roger.pau@c=
itrix.com> wrote:
> > > >>>> Hm, it's hard to tell what's going on. My limited experience wit=
h
> > > >>>> IOMMU faults on broken systems there's a small range that initia=
lly
> > > >>>> triggers those, and then the device goes wonky and starts access=
ing a
> > > >>>> whole load of invalid addresses.
> > > >>>>
> > > >>>> You could try adding those manually using the rmrr Xen command l=
ine
> > > >>>> option [0], maybe you can figure out which range(s) are missing?
> > > >>>
> > > >>> They seem to change, so it's hard to know.  Would there be harm i=
n
> > > >>> adding one to cover the end of RAM ( 0x04,7c80,0000 ) to (
> > > >>> 0xff,ffff,ffff )?  Maybe that would just quiet the pointless faul=
ts
> > > >>> while leaving the IOMMU enabled?
> > > >>
> > > >> While they may quieten the faults, I don't think those faults are
> > > >> pointless. They indicate some problem with the software (less
> > > >> likely the hardware, possibly the firmware) that you're using.
> > > >> Also there's the question of what the overall behavior is going
> > > >> to be when devices are permitted to access unpopulated address
> > > >> ranges. I assume you did check already that no devices have their
> > > >> BARs placed in that range?
> > > >
> > > > Isn't no-igfx already letting them try to read those unpopulated ad=
dresses?
> > >
> > > Yes, and it is for the reason that the documentation for the
> > > option says "If specifying `no-igfx` fixes anything, please
> > > report the problem." I imply from in in particular that one
> > > better wouldn't use it for non-development purposes of whatever
> > > kind.
> >
> > I stopped seeing these DMA faults, but I didn't know what made them go
> > away.  Then when working with an older 5.4.64 kernel, I saw them
> > again.  Eric bisected down to the 5.4.y version of mainline linux
> > commit:
> >
> > commit 8195400f7ea95399f721ad21f4d663a62c65036f
> > Author: Chris Wilson <chris@chris-wilson.co.uk>
> > Date:   Mon Oct 19 11:15:23 2020 +0100
> >
> >     drm/i915: Force VT'd workarounds when running as a guest OS
> >
> >     If i915.ko is being used as a passthrough device, it does not know =
if
> >     the host is using intel_iommu. Mixing the iommu and gfx causes a fe=
w
> >     issues (such as scanout overfetch) which we need to workaround insi=
de
> >     the driver, so if we detect we are running under a hypervisor, also
> >     assume the device access is being virtualised.
>
> So the commit above fixes the DMA faults seen on Linux when using a
> i915 gfx card?

Yes, DMA faults are not seen with this commit.  i915 behaves
differently when it detects VT-d active, and this commit sets the VT-d
behavior when running under any hypervisor.

Regards,
Jason

