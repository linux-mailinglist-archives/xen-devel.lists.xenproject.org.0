Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6B9215448
	for <lists+xen-devel@lfdr.de>; Mon,  6 Jul 2020 10:59:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jsMxm-0004iE-7L; Mon, 06 Jul 2020 08:58:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bUWB=AR=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jsMxk-0004i9-PN
 for xen-devel@lists.xenproject.org; Mon, 06 Jul 2020 08:58:56 +0000
X-Inumbo-ID: ec0b7134-bf66-11ea-bb8b-bc764e2007e4
Received: from mail-wr1-x436.google.com (unknown [2a00:1450:4864:20::436])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ec0b7134-bf66-11ea-bb8b-bc764e2007e4;
 Mon, 06 Jul 2020 08:58:56 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id o11so39957699wrv.9
 for <xen-devel@lists.xenproject.org>; Mon, 06 Jul 2020 01:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=CT+DD/fXzPNoLaHHSA10MB/yxeCwip5ti2swWOmLce0=;
 b=j5rMHMOsHl4Ap9tUpLJ4fvtmnJd7rVfmQ4kOSYrK89zyCVbCCIO9eit8tLrwm9V2Ya
 T7553C4aH2oTlpJ1w1d5iqfY1R86OBLuFE8mQ9AMcGEEUFrG0V2LzhuEoyxhHI9sxB/C
 xgx2ZUKjeQ3A0rFLaH6bx8QA2+jOtAKTtQeKDCjyFHaYYhHUpuzpc/ubIDd0BeUe+p7s
 4TgSZhCAh+2qK0kSmYeL1lECkazd3lGrCFjzFrxn6sKRRigEOL0g3Rx3UIicJzAcLtrk
 JcCejstrHNtgVD9TOM1Yq2Fz2roHT3eMo1LRlRQjy7o4IDai0k+8PL+Rgj/Vsm4feZ88
 coFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=CT+DD/fXzPNoLaHHSA10MB/yxeCwip5ti2swWOmLce0=;
 b=TmQ9F6/tcwV3+NZ7iBI7Ycguuio1fg/rPuAqugtwTpWf+8FGSKpmM0z0PU5t1hhK7H
 b/MOqI7XJAHUpgIsS7oqvvR4pQesXKcVYzoXJQ3XY8gnKgnOBJ6vcGeEWDUu15r0cMRu
 c76KEE7P1fKVZ3e5EgfhmxlQpg9cbGDnPWMrrBVIATjyzcB2trjiBLpcK7i/Kn04mV/W
 JjpMuylJGbMTQTB0UjHahoiTl+sTUGrJtNyWfTnK4KHkBWy82PF/s0S5KVFQTNz5iG+L
 z4Ch+/o2HqfPfmOODRaZ0n1lsupiIineH/A0tqFJvwsReVocuLbcP3ckjCFYkl4aN3Hr
 3oWg==
X-Gm-Message-State: AOAM5309+9gb1U0Fsl1Wp2CoK4xn90Fe2A4ZKSawGH+6kfho3x5rGd3j
 IuLpg5LBvXNkbXdngmKxeyc=
X-Google-Smtp-Source: ABdhPJwQfwCCHY/BjH1xQMiwDEzhh0Cw7WoPu30xrPvfPmaC/+mcmD3bsxtyU1V9zws8Za6uaD0Z2A==
X-Received: by 2002:adf:e908:: with SMTP id f8mr46683602wrm.3.1594025935274;
 Mon, 06 Jul 2020 01:58:55 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-232.amazon.com. [54.240.197.232])
 by smtp.gmail.com with ESMTPSA id u186sm23195974wmu.10.2020.07.06.01.58.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 06 Jul 2020 01:58:54 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <20200701090210.GN735@Air-de-Roger>
 <f89a158a-416e-1939-597a-075ff97f2b02@suse.com>
 <af13fa01-db36-784d-dfaf-b9905defc7fd@citrix.com>
 <007a01d65363$9ab7c1d0$d0274570$@xen.org> <20200706083131.GA735@Air-de-Roger>
In-Reply-To: <20200706083131.GA735@Air-de-Roger>
Subject: RE: vPT rework (and timer mode)
Date: Mon, 6 Jul 2020 09:58:53 +0100
Message-ID: <007c01d65373$ad3c4140$07b4c3c0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG+XT3UL7mtyhdM6X8x294LjZ1FmQGlQU2IApzoD8QCa8XKyQFu21K2qOlFFjA=
Content-Language: en-gb
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
Reply-To: paul@xen.org
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 06 July 2020 09:32
> To: paul@xen.org
> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Jan Beulich' =
<jbeulich@suse.com>; xen-
> devel@lists.xenproject.org; 'Wei Liu' <wl@xen.org>
> Subject: Re: vPT rework (and timer mode)
>=20
> On Mon, Jul 06, 2020 at 08:03:50AM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Andrew Cooper <andrew.cooper3@citrix.com>
> > > Sent: 03 July 2020 16:03
> > > To: Jan Beulich <jbeulich@suse.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> > > Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; Paul =
Durrant <paul@xen.org>
> > > Subject: Re: vPT rework (and timer mode)
> > >
> > > On 03/07/2020 15:50, Jan Beulich wrote:
> > > > On 01.07.2020 11:02, Roger Pau Monn=C3=A9 wrote:
> > > >> It's my understanding that the purpose of pt_update_irq and
> > > >> pt_intr_post is to attempt to implement the "delay for missed =
ticks"
> > > >> mode, where Xen will accumulate timer interrupts if they cannot =
be
> > > >> injected. As shown by the patch above, this is all broken when =
the
> > > >> timer is added to a vCPU (pt->vcpu) different than the actual =
target
> > > >> vCPU where the interrupt gets delivered (note this can also be =
a list
> > > >> of vCPUs if routed from the IO-APIC using Fixed mode).
> > > >>
> > > >> I'm at lost at how to fix this so that virtual timers work =
properly
> > > >> and we also keep the "delay for missed ticks" mode without =
doing a
> > > >> massive rework and somehow keeping track of where injected =
interrupts
> > > >> originated, which seems an overly complicated solution.
> > > >>
> > > >> My proposal hence would be to completely remove the timer_mode, =
and
> > > >> just treat virtual timer interrupts as other interrupts, ie: =
they will
> > > >> be injected from the callback (pt_timer_fn) and the vCPU(s) =
would be
> > > >> kicked. Whether interrupts would get lost (ie: injected when a
> > > >> previous one is still pending) depends on the contention on the
> > > >> system. I'm not aware of any current OS that uses timer =
interrupts as
> > > >> a way to track time. I think current OSes know the differences =
between
> > > >> a timer counter and an event timer, and will use them =
appropriately.
> > > > Fundamentally - why not, the more that this promises to be a
> > > > simplification. The question we need to answer up front is =
whether
> > > > we're happy to possibly break old OSes (presumably ones no-one
> > > > ought to be using anymore these days, due to their support life
> > > > cycles long having ended).
> > >
> > > The various timer modes were all compatibility, and IIRC, mostly =
for
> > > Windows XP and older which told time by counting the number of =
timer
> > > interrupts.
> > >
> > > Paul - you might remember better than me?
> >
> > I think it is only quite recently that Windows has started favouring =
enlightened time sources rather
> than counting ticks but an admin may still turn all the viridian =
enlightenments off so just dropping
> ticks will probably still cause time to drift backwards.
>=20
> Even when not using the viridian enlightenments, Windows should rely
> on emulated time counters (or the TSC) rather than counting ticks?

Microsoft implementations... sensible... two different things.

>=20
> I guess I could give it a try with one of the emulated Windows =
versions
> that we test on osstest.
>=20

Pick an old-ish version. I think osstest has copy of Windows 7.

Cheers,

  Paul


> Thanks, Roger.


