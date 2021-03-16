Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCE533D46A
	for <lists+xen-devel@lfdr.de>; Tue, 16 Mar 2021 13:57:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98278.186323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM9Ff-0007eJ-9X; Tue, 16 Mar 2021 12:56:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98278.186323; Tue, 16 Mar 2021 12:56:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lM9Ff-0007du-6I; Tue, 16 Mar 2021 12:56:47 +0000
Received: by outflank-mailman (input) for mailman id 98278;
 Tue, 16 Mar 2021 12:56:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QY9G=IO=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1lM9Fd-0007dp-71
 for xen-devel@lists.xenproject.org; Tue, 16 Mar 2021 12:56:45 +0000
Received: from mail-lf1-x135.google.com (unknown [2a00:1450:4864:20::135])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id af5b446d-10d4-466b-88fb-338cefbc446e;
 Tue, 16 Mar 2021 12:56:44 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id n16so62317801lfb.4
 for <xen-devel@lists.xenproject.org>; Tue, 16 Mar 2021 05:56:44 -0700 (PDT)
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
X-Inumbo-ID: af5b446d-10d4-466b-88fb-338cefbc446e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=LRp0Gn/s4sstafJyNalG8Ny8BaROlPuhfcdfOAjqlnI=;
        b=l7psML7/Xh2uRJ9hVhEd9SfjK99X5Fvh0zcyO/VW8YjDh/2Tcp3NoM4tEGolqBlPXe
         XAonTXlNTMiUgHFT37snTmJT67Gb5OoMwOkU/Ltnkp+bpoKs8vG3eP2BDghfvRw2ww8M
         mPVf7waSDTZ9ERXYOPBybkzefRcUJ6ahiv7FrmIK5Ddok0CDQxKHKQlJoNcVg80VbnG8
         ctWL0ANcKGe/IX+joymhS1ZcvHFyCfqajiReRvj/3as4F6qUz4Ou9rniuGl0QfUVJ6bV
         JGsKPPDTmcWcPGh+C3HoX6HNNFPGxHrHY2IW1Qa+Jb5l59R4MqddGe5roafDimfHgEvm
         /e9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=LRp0Gn/s4sstafJyNalG8Ny8BaROlPuhfcdfOAjqlnI=;
        b=N4tjUVCYQ5Bx1BuTKbD1Uq6L4gvehEtVJupUk0mzuSFLtavLXS407hu+jIVu7QI7Ij
         hjea6TwXx+Xzzppw/D+4qmPQ8vEcRWMewF11Q/aY35hvYRnqOfWTXvi7H+9xAh8a+gFD
         qSSjhJFK3YWZVBkA1p+t3KHi4Rq9ffro4M5meDPi1EBs9vE8v363ZnO13XwkeuMw32iD
         qfG/+8JseXYrivL3w98Y2CAB+K/T4zO5Pi66Fg0euPN7umU4OfpRwFvOuw4rOxfJMN8a
         02Bt0GW7OJRqsWGVPVDnCNfJGNOZFl5qSmE8EUNbZgg3wff+5OpzUQoaeL4UckYLWSjU
         gnNg==
X-Gm-Message-State: AOAM5319K5sSxeSHFggeDt4pzqiT2Pp03/W1Ez85ITt04I+icA7wt/0A
	HKaG27X0Cp37m1GEnm/HN8fFPEb7hGPvwC5b44g=
X-Google-Smtp-Source: ABdhPJxzFcDQ/TJqf3OouuxOYGTNdBGMtM1McRMAAvTzfvKMkKelJqakjw0Hs9iFxyenMB+loRwtaHHL/IrI3Od06q4=
X-Received: by 2002:ac2:5932:: with SMTP id v18mr11467951lfi.659.1615899402966;
 Tue, 16 Mar 2021 05:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAKf6xpuRADfXfC2JA_D==-k+RTHF90h3+um1uiBf9-QXGFk+zA@mail.gmail.com>
 <e2020ca3-4dfb-793e-f37b-d33b77cfae88@xen.org> <YEny0OzZvJZybY30@Air-de-Roger>
In-Reply-To: <YEny0OzZvJZybY30@Air-de-Roger>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 16 Mar 2021 08:56:31 -0400
Message-ID: <CAKf6xpuTgRT0M2aP=uHYnfUUu+2LZesPPFonpE39+-V4Cx9T3A@mail.gmail.com>
Subject: Re: xen-blkfront: BUG_ON(info->nr_rings)
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Paul Durrant <paul@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 11, 2021 at 5:37 AM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>=
 wrote:
>
> On Thu, Mar 11, 2021 at 09:01:51AM +0000, Paul Durrant wrote:
> > On 10/03/2021 14:58, Jason Andryuk wrote:
> > > Hi,
> > >
> > > I was running a loop of `xl block-attach ; xl block-detach` and I
> > > triggered a BUG in xen-blkfront, drivers/block/xen-blkfront.c:1917
> > > This is BUG_ON(info->nr_rings) in negotiate_mq called by blkback_chan=
ged.
> > >
> > > I'm using Linux 5.4.103 and blktap3 on Xen 4.12 (OpenXT), though I
> > > don't think that matters.  The backtrace and some preceding logs (fro=
m
> > > the reproducer) are below.
> > >
> > > I just repro-ed with this:
> > > path=3D<backend path/state>
> > > xenstore-write $path 5 ; xenstore-write $path 4
> > >
> > > info->nr_rings is still set because of the unexpected transition
> > > XenbusStateClosing -> XenbusStateConnected:
> > > dom7: [ 2866.574853] vbd vbd-51728: blkfront:blkback_changed to state=
 5.
> > > dom7: [ 2866.578385] vbd vbd-51728: blkfront:blkback_changed to state=
 4.
> > >
> > > I'm not totally sure how to handle this.  The XenbusStateConnected
> > > event should be creating a new blkfront device, but instead it's seen
> > > by the old one which hasn't been cleaned up yet.
>
> IIRC xenbus state changes (like you perform above) never trigger the
> creation or destruction of devices on the bus. See
> xenbus_otherend_changed.
>
> xl block-detach however should indeed remove the device. We should add
> an option to `xl block-detach -w` to wait for the device to actually
> be removed before returning (or exit with a timeout).

I didn't realize `xl block-detach` didn't wait.  There is some timeout
logic with detaching devices, but I have to investigate this more.

> > >
> >
> > Sounds like blkfront needs to be fixed. Once it is in state 5 the only =
state
> > it should go to should be 6. From there it can cycle back to 4.

Ok, thanks for the feedback.  So blocking 5->6 is straight forward.
6->4 triggered the same BUG, so I'm still investigating.

> Indeed, there's likely some logic to be improved in blkfront so it
> doesn't get messed up so badly on state changes by blkback.
>
> I'm happy to review patch for both blkfront and libxl/xl in order to
> make this better :).

Okay.

Regards,
Jason

