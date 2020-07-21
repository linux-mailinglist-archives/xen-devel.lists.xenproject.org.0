Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B19682280BD
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jul 2020 15:15:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jxs6J-00051l-Fm; Tue, 21 Jul 2020 13:14:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JDR4=BA=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jxs6H-00051g-AZ
 for xen-devel@lists.xenproject.org; Tue, 21 Jul 2020 13:14:29 +0000
X-Inumbo-ID: 1aa4952c-cb54-11ea-8510-bc764e2007e4
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1aa4952c-cb54-11ea-8510-bc764e2007e4;
 Tue, 21 Jul 2020 13:14:27 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id b6so21141522wrs.11
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jul 2020 06:14:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=Oe3hdXJ/7JYTMaU8YwiS32I4gQHoup1kwePMxKDuzqc=;
 b=gSQeeNWxkmrCIaXDf8RlIdEkg3RuheSVYJGZvZUUOcE9V9+ng6of0buRkiKBjxdHT1
 q9FtejgTgeL/ogpC+YbS16YnhAEbJAz0ZhZ4ZSu1E89ovlbD2xC6IJwHtoOZ/BPT89rX
 PO+KQs6tjFFnrJR9vUUCleIjsiEjHp44l2lvQQZ3OK49JS/G/nIOOsxtpB5YuzX34njd
 8HahN/i3+DiUNm927YfGaQjwn98aRPAhBkcf8ZIUtokp7O+7tTR3DT72SivcTWpPKlHK
 VzuipiWHkfSYC+LXu8LnnDw9nlqCX7sds1+zeprbp/yJcj31uK8zxrjxW72hsMmbvaSm
 5rVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=Oe3hdXJ/7JYTMaU8YwiS32I4gQHoup1kwePMxKDuzqc=;
 b=dV5PEHbjHfkTiEO8oSFsCSIFH6EE/R1r77P1hRam1nJxRWJaJO3jWMXxUDHB7hJN1z
 Qwm7Dgh2MnbAVXwGZUhRzmtu9+5IuVsSqV3OPpR4DmZ0svD3RERCMWg5Dyb4ivEzhoea
 AEfaJyu3NZT9m2kZvqXlu6d2FP8+vGgnKKEg/o1Qso82wNqUJJPTD7WC3yZkVTq6Fipo
 RNEwUC0aGDXQyeaYFVjHqkd3bWyUgJbcIh1I7FMNsj9SQ1QEXo8rlGf77izkKhv9Jwh3
 GmUoC1B1TxIZYT4w9jydjKAyJYu0ufcKAJZhzNxa5rjR5UjUkTuJBR+1wwVfIJ4YjJrb
 I5lg==
X-Gm-Message-State: AOAM531e7gI+0TJ1UGbYhKfSVUx9kTS+ftp6vtnSs5cGLJeaSeF08ixr
 mBS6nIboDSmTRsbsi13smsY=
X-Google-Smtp-Source: ABdhPJyxLQ+dyHO3WYqONEWDuQLNHOB4CU/sS93NdZMDlnMqbXntGQWDyVCkJsuLp4W04LU4WabMqg==
X-Received: by 2002:adf:f3cb:: with SMTP id g11mr9131227wrp.268.1595337266926; 
 Tue, 21 Jul 2020 06:14:26 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-233.amazon.com. [54.240.197.233])
 by smtp.gmail.com with ESMTPSA id l15sm36325555wro.33.2020.07.21.06.14.25
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 21 Jul 2020 06:14:25 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>
References: <20200701090210.GN735@Air-de-Roger>
 <f89a158a-416e-1939-597a-075ff97f2b02@suse.com>
 <af13fa01-db36-784d-dfaf-b9905defc7fd@citrix.com>
 <007a01d65363$9ab7c1d0$d0274570$@xen.org> <20200706083131.GA735@Air-de-Roger>
 <007c01d65373$ad3c4140$07b4c3c0$@xen.org>
 <20200721115327.GO7191@Air-de-Roger>
In-Reply-To: <20200721115327.GO7191@Air-de-Roger>
Subject: RE: vPT rework (and timer mode)
Date: Tue, 21 Jul 2020 14:14:24 +0100
Message-ID: <004801d65f60$db70f300$9252d900$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQG+XT3UL7mtyhdM6X8x294LjZ1FmQGlQU2IApzoD8QCa8XKyQFu21K2ALaG9p4BeJJRUajvp4nQ
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
Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'Igor Druzhinin' <igor.druzhinin@citrix.com>, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 21 July 2020 12:53
> To: paul@xen.org
> Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Jan Beulich' =
<jbeulich@suse.com>; xen-
> devel@lists.xenproject.org; 'Wei Liu' <wl@xen.org>; Igor Druzhinin =
<igor.druzhinin@citrix.com>
> Subject: Re: vPT rework (and timer mode)
>=20
> On Mon, Jul 06, 2020 at 09:58:53AM +0100, Paul Durrant wrote:
> > > -----Original Message-----
> > > From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> > > Sent: 06 July 2020 09:32
> > > To: paul@xen.org
> > > Cc: 'Andrew Cooper' <andrew.cooper3@citrix.com>; 'Jan Beulich' =
<jbeulich@suse.com>; xen-
> > > devel@lists.xenproject.org; 'Wei Liu' <wl@xen.org>
> > > Subject: Re: vPT rework (and timer mode)
> > >
> > > On Mon, Jul 06, 2020 at 08:03:50AM +0100, Paul Durrant wrote:
> > > > > -----Original Message-----
> > > > > From: Andrew Cooper <andrew.cooper3@citrix.com>
> > > > > Sent: 03 July 2020 16:03
> > > > > To: Jan Beulich <jbeulich@suse.com>; Roger Pau Monn=C3=A9 =
<roger.pau@citrix.com>
> > > > > Cc: xen-devel@lists.xenproject.org; Wei Liu <wl@xen.org>; Paul =
Durrant <paul@xen.org>
> > > > > Subject: Re: vPT rework (and timer mode)
> > > > >
> > > > > On 03/07/2020 15:50, Jan Beulich wrote:
> > > > > > On 01.07.2020 11:02, Roger Pau Monn=C3=A9 wrote:
> > > > > >> It's my understanding that the purpose of pt_update_irq and
> > > > > >> pt_intr_post is to attempt to implement the "delay for =
missed ticks"
> > > > > >> mode, where Xen will accumulate timer interrupts if they =
cannot be
> > > > > >> injected. As shown by the patch above, this is all broken =
when the
> > > > > >> timer is added to a vCPU (pt->vcpu) different than the =
actual target
> > > > > >> vCPU where the interrupt gets delivered (note this can also =
be a list
> > > > > >> of vCPUs if routed from the IO-APIC using Fixed mode).
> > > > > >>
> > > > > >> I'm at lost at how to fix this so that virtual timers work =
properly
> > > > > >> and we also keep the "delay for missed ticks" mode without =
doing a
> > > > > >> massive rework and somehow keeping track of where injected =
interrupts
> > > > > >> originated, which seems an overly complicated solution.
> > > > > >>
> > > > > >> My proposal hence would be to completely remove the =
timer_mode, and
> > > > > >> just treat virtual timer interrupts as other interrupts, =
ie: they will
> > > > > >> be injected from the callback (pt_timer_fn) and the vCPU(s) =
would be
> > > > > >> kicked. Whether interrupts would get lost (ie: injected =
when a
> > > > > >> previous one is still pending) depends on the contention on =
the
> > > > > >> system. I'm not aware of any current OS that uses timer =
interrupts as
> > > > > >> a way to track time. I think current OSes know the =
differences between
> > > > > >> a timer counter and an event timer, and will use them =
appropriately.
> > > > > > Fundamentally - why not, the more that this promises to be a
> > > > > > simplification. The question we need to answer up front is =
whether
> > > > > > we're happy to possibly break old OSes (presumably ones =
no-one
> > > > > > ought to be using anymore these days, due to their support =
life
> > > > > > cycles long having ended).
> > > > >
> > > > > The various timer modes were all compatibility, and IIRC, =
mostly for
> > > > > Windows XP and older which told time by counting the number of =
timer
> > > > > interrupts.
> > > > >
> > > > > Paul - you might remember better than me?
> > > >
> > > > I think it is only quite recently that Windows has started =
favouring enlightened time sources
> rather
> > > than counting ticks but an admin may still turn all the viridian =
enlightenments off so just
> dropping
> > > ticks will probably still cause time to drift backwards.
> > >
> > > Even when not using the viridian enlightenments, Windows should =
rely
> > > on emulated time counters (or the TSC) rather than counting ticks?
> >
> > Microsoft implementations... sensible... two different things.
> >
> > >
> > > I guess I could give it a try with one of the emulated Windows =
versions
> > > that we test on osstest.
> > >
> >
> > Pick an old-ish version. I think osstest has copy of Windows 7.
>=20
> Tried on Windows 7 (with viridian disabled) setting
> timer_mode=3D"one_missed_tick_pending" and limiting the capacity of =
the
> domain to 1 (1% CPU utilization) in order to start missing ticks, and
> the clock does indeed start lagging behind.
>=20
> When not using one_missed_tick_pending mode and limiting the capacity
> to 1 the clock also lags a bit (I guess with 1% CPU utilization
> delayed ticks accumulate too much), but the clock doesn't seem to be
> skewed that much.
>=20
> Both modes will catch up at some point, I assume Windows does sync =
time
> periodically with the wallclock, but I don't think we want to resort
> to that.
>=20

IIRC it normally syncs once an hour or thereabouts. PV drivers will =
force a re-sync every 10 mins if they are installed.

> I will draft a plan about how to proceed in order to fix the emulated
> timers event delivery while keeping the accumulated ticks mode and
> send it to the list, as I would like to fix this.

Ok.

Cheers,

  Paul

>=20
> Roger.


