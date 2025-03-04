Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B168A4DC3D
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 12:18:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.900960.1308947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQHe-0003i0-0v; Tue, 04 Mar 2025 11:17:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 900960.1308947; Tue, 04 Mar 2025 11:17:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpQHd-0003fs-UY; Tue, 04 Mar 2025 11:17:57 +0000
Received: by outflank-mailman (input) for mailman id 900960;
 Tue, 04 Mar 2025 11:17:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBId=VX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tpQHc-0003fm-G6
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 11:17:56 +0000
Received: from mail-oa1-x29.google.com (mail-oa1-x29.google.com
 [2001:4860:4864:20::29])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5173c512-f8ea-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 12:17:55 +0100 (CET)
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-2c1caacc1f7so912778fac.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 03:17:55 -0800 (PST)
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
X-Inumbo-ID: 5173c512-f8ea-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741087074; x=1741691874; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m4D96EQXl67ri2pgCBKKvBD5hLWDh2YbWr2AAz4A2QA=;
        b=CYsJZahJcokylR4+kWLmwrw/kg/04fDQ2avoZpse0Q+pwUX1WWzfjOZHuMVO+o74A5
         xvqeHGg6ZNwBrTP3RmF+yL02aJqNyJzFSnAVDp0WrYK/u2vh6Hy3Pfu8pkhyiM8PXHp9
         GheTrrYQP+jnFKZcI1VmeVgQ3OLFbzh8X89UE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741087074; x=1741691874;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m4D96EQXl67ri2pgCBKKvBD5hLWDh2YbWr2AAz4A2QA=;
        b=C5A4ppFh3VJ9rjXpZqRm8dHys1jBuILZny5kY+u7N4IRjYu56HFQOm1TeNpxUo3JUX
         qloUiLm2lohH9wLlUXNdNMunA2L1z58oa5Jw2ekdhTO4yJ8XToJtwIrzWGLFOH2qGF6x
         Jf982UVWSb+PYRPUy2XsowrlprmNUA0IjXSwD6NQay427Kn70PY5MsjKZoi86vIyYtbP
         YR2sBwOHg47gzbaz2uvSDrUdsI+QSGOHcd9xHfOhCNyQY3SX17Jit7amWIBCAkIhUy93
         wrKwN79qsQ5C4I6FypiBDu/Hhfal/YPkb/G5APXmUdqiUT/pYyHLXApIpXLItdClcQGy
         VVnA==
X-Forwarded-Encrypted: i=1; AJvYcCUThaMITAMrWQxRfM5CBo7ZVOebzhaWR2YIYatO40knUBQfotU1W1GnO87J7d3glaBj0mRt0poXUHM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxOK0RwVc+I9EyLezD9Rd0Y+o06ulSfzchtrgOCIV7stcBwJh4H
	otFaCvl+R4NqhKZzzVfrM1JLK+0HCtd4ilsatqkQt3mnlrW0l5sufieHjc2LDgOH5POv9kGcsVY
	apJFbAPRfg7GK5oG/vRWd6LP6coPNi459YcsZpw==
X-Gm-Gg: ASbGncsdiQpxrpMuzJBznCL+bXjVgBp4kQGdlwngZOtEJETbD9Lguz+9Tq1bbKqHkgF
	HDu3rinxdEE4XPJZEogCfFq5EnG5Y2XwCTqTmAiduzxonhcQKjZqVphCbWcPwP/2c85bOEvv/EF
	SK8ZmEHYKCfIVnV8x7buIAiwEKbw==
X-Google-Smtp-Source: AGHT+IFTBBwixaq7tXg7UdQbrszllUhsHUK7Do0YEFoSnrxLDPaBBcCxfVoHj39ao2zJ6PC+LhZDWvZM1VL903QQTPI=
X-Received: by 2002:a05:6871:205:b0:29e:1cd8:4a0f with SMTP id
 586e51a60fabf-2c17841757dmr9458027fac.17.1741087073885; Tue, 04 Mar 2025
 03:17:53 -0800 (PST)
MIME-Version: 1.0
References: <20250228152100.23105-1-frediano.ziglio@cloud.com>
 <D87ENZNEBN2Z.1E8WKX6K8EUE1@cloud.com> <Z8bfMmM5CJ5PQdhm@macbook.local>
In-Reply-To: <Z8bfMmM5CJ5PQdhm@macbook.local>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 4 Mar 2025 11:17:42 +0000
X-Gm-Features: AQ5f1JobzKbY_0O9tm8jGi3IVLE3dCZlf4zCKSPTXw0n6QtanX47J91x8v9sj1A
Message-ID: <CACHz=ZgmBxNKjA7KFktk-5jcPvWDn6DWpwCUEFzGO9qyJYuZsA@mail.gmail.com>
Subject: Re: [PATCH] docs: Add some details on XenServer PCI devices
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org, 
	Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 11:08=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
>
> On Tue, Mar 04, 2025 at 10:21:52AM +0000, Alejandro Vallejo wrote:
> > Hi,
> >
> > On Fri Feb 28, 2025 at 3:21 PM GMT, Frediano Ziglio wrote:
> > > Describe the usage of devices 5853:0002 and 5853:C000.
> > >
> > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > ---
> > >  docs/man/xen-pci-device-reservations.7.pod | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/docs/man/xen-pci-device-reservations.7.pod b/docs/man/xe=
n-pci-device-reservations.7.pod
> > > index 9ddf3a18ad..62f3bd2105 100644
> > > --- a/docs/man/xen-pci-device-reservations.7.pod
> > > +++ b/docs/man/xen-pci-device-reservations.7.pod
> > > @@ -10,6 +10,8 @@ use of this is with device ID 0x0001 to advertise t=
he Xen Platform PCI
> > >  device - the presence of this virtual device enables a guest Operati=
ng
> > >  System (subject to the availability of suitable drivers) to make use=
 of
> > >  paravirtualisation features such as disk and network devices etc.
> > > +XenServer, for Windows machines, presents Xen Platform device with d=
evice
> > > +ID 0x0002 instead of 0x0001.
> >
> > nit: in the interest of future-proofing the doc 's/presents/may present=
/'?
> >
> > >
> > >  Some Xen vendors wish to provide alternative and/or additional guest=
 drivers
> > >  that can bind to virtual devices[1]. This may be done using the Xen =
PCI
> > > @@ -86,4 +88,11 @@ and unplug protocol.
> > >  libxl provides support for creation of a single additional xen-pvdev=
ice.
> > >  See the vendor_device parameter in xl.cfg(5).
> > >
> > > +=3Ditem 2.
> > > +
> > > +XenServer, for Windows machines, presents a device with ID 0xC000.
> > > +This device is a placeholders for Windows update.
> > > +Device 0xC000 is presented with a Xen Platform PCI device, usually w=
ith ID
> > > +0x0002.
> > > +
> > >  =3Dback
> >
> > Wouldn't this be better covered under "=3Ditem 1"? Device 0xc000 is a
> > xen-pvdevice, so it could be simplified to a single line of "XenServer =
uses
> > device-id=3D0xc000 for its pvdevice on Windows guests", or something li=
ke that.
>
> I think it's important to note that c000 always appears in conjunction
> with 0001 or 0002, and it's not a replacement for either of those
> devices.
>

Do you have something more precise in mind? Can you suggest what to write?

> Likewise it's important to note that 0001 and 0002 are to my
> understanding mutually exclusive, and only one of those must be
> exposed.

Not exactly sure if this is a must or a should. From my testing,
presenting 2 devices (well, they are mostly the same) works. But, as
they do the same things it seems reasonable to avoid the duplication.
It looks like a good recommendation.

>
> Thanks, Roger.

Frediano

