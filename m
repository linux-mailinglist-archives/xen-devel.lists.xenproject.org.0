Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9D6A4E145
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 15:41:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901180.1309169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpTRt-0006T0-2g; Tue, 04 Mar 2025 14:40:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901180.1309169; Tue, 04 Mar 2025 14:40:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpTRs-0006Ri-Vb; Tue, 04 Mar 2025 14:40:44 +0000
Received: by outflank-mailman (input) for mailman id 901180;
 Tue, 04 Mar 2025 14:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wukS=VX=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tpTRr-0006Db-HA
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 14:40:43 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a39e1a8b-f906-11ef-9898-31a8f345e629;
 Tue, 04 Mar 2025 15:40:38 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e55ec94962so3346702a12.3
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 06:40:38 -0800 (PST)
Received: from localhost (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abf5d0bcb77sm541310566b.49.2025.03.04.06.40.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Mar 2025 06:40:37 -0800 (PST)
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
X-Inumbo-ID: a39e1a8b-f906-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741099238; x=1741704038; darn=lists.xenproject.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kL61Stni3IrXucg0ZRqrKuzdxsPSeZvZsyfQDm82Qwc=;
        b=E3f1KwfeBViCQI8RzFPLO53PkQ3hs2PJnWtq4hDnd38zwRR8GLpxJo9dlnxsnZR0Zq
         pqmI1/YAcK051vOxMMb9YdpabCA/WiRefmoZs8/yFACgbMUpyh5xmMQmnaHK63x7x/lH
         RTryZdTb41GBxbRCPZE5jdEHlRMl1cBd+exhY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741099238; x=1741704038;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kL61Stni3IrXucg0ZRqrKuzdxsPSeZvZsyfQDm82Qwc=;
        b=JrrgFwGAZcHdYTiOaQXwiDm/LTdNf9uEQivY1tPgZebWnklL3iuT/Wtj5MJI/wITYv
         62T59jH+T4HBQOfJvk0uYrXUXqTyGzizVPJuJ1GfT7wn2C1d93ZOUoMHw1Y+rzlID3nX
         Y5zkc2jkx/8LY7DQFnGaNQCYFtHOXbSm/otn8x9AvzTzlR4sxBrlxWQSymmXRuGgLBQn
         VRpl/cFnO8oftCxRxVhstlgeKxeYa+At19Oi6dL19Leetel/GjE4G5X2LBA6FmnioTHd
         GUshPsWFU9cOZBk2di9V0jDr+p96hVGlZd2xtzN9z3ndpuz+uFgH1q+jactdCtZDfREr
         3feQ==
X-Gm-Message-State: AOJu0YzxIWCnJa5DTY3JyV/qEZBhioyUaddIUYupJAfv/gSkb0HkjEbb
	phR3ZkeMC9oLMw8XvPjJKLZaXckyD/rcai67qvaO/YiEsjM0q2sS7Pb5tgjTEm63UnSAyob1V3q
	u
X-Gm-Gg: ASbGnctoJ8nQdJH6FW9vHML4aVgvgYuGFv28hXB9oxju3t7kdg8+bHpdy0fVhDWEFOQ
	rVcGIxd5lQlPjhGEASWzom0fVtj7XZ0Xal7kbdIVbTH7uGTrlBcfV1KEoJb6PJPFTNIfETVzPLS
	v/fbov2SvubsvIOdUTqjIyv2RMA5kdjsZV9hJLtyuAlxFEPxQtqdOgnoeMG+oJyVk1A4Dtke6Np
	RaVU++FSphsVUVeN81JgXUpfXTdMADVru1vDogljB9ENOuU9/5Oof1WhfdnGYDBeB1hTLpq8cfZ
	IN4xUPT4fFAHFWhs14wnbIdjUEVpHQGm73UkOGJRcIz6Vf/itHfw/HQIaY3gmyXuc4PR9BsWNFU
	=
X-Google-Smtp-Source: AGHT+IHVl+DOhwvmy+TgvcH64AyYIYxjb/lu8PRHRo+n8sCGgzieZallPrV0voVjEgOXWOEySXruxg==
X-Received: by 2002:a17:907:d90:b0:ac1:e332:b1ec with SMTP id a640c23a62f3a-ac1e332b41dmr678308666b.10.1741099237764;
        Tue, 04 Mar 2025 06:40:37 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Mar 2025 14:40:32 +0000
Message-Id: <D87K61FQGB1E.28MJY4MPV0KLV@cloud.com>
Cc: <xen-devel@lists.xenproject.org>, "Anthony PERARD"
 <anthony.perard@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] docs: Add some details on XenServer PCI devices
From: "Alejandro Vallejo" <alejandro.vallejo@cloud.com>
To: =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, "Frediano
 Ziglio" <frediano.ziglio@cloud.com>
X-Mailer: aerc 0.18.2
References: <20250228152100.23105-1-frediano.ziglio@cloud.com>
 <D87ENZNEBN2Z.1E8WKX6K8EUE1@cloud.com> <Z8bfMmM5CJ5PQdhm@macbook.local>
 <CACHz=ZgmBxNKjA7KFktk-5jcPvWDn6DWpwCUEFzGO9qyJYuZsA@mail.gmail.com>
 <Z8byRwON4Oc23dxS@macbook.local>
In-Reply-To: <Z8byRwON4Oc23dxS@macbook.local>

For the record, my remarks are fairly inconsequential. This patch is a net
positive addition to the man page and I think it should go in.

On Tue Mar 4, 2025 at 12:29 PM GMT, Roger Pau Monn=C3=A9 wrote:
> On Tue, Mar 04, 2025 at 11:17:42AM +0000, Frediano Ziglio wrote:
> > On Tue, Mar 4, 2025 at 11:08=E2=80=AFAM Roger Pau Monn=C3=A9 <roger.pau=
@citrix.com> wrote:
> > >
> > > On Tue, Mar 04, 2025 at 10:21:52AM +0000, Alejandro Vallejo wrote:
> > > > Hi,
> > > >
> > > > On Fri Feb 28, 2025 at 3:21 PM GMT, Frediano Ziglio wrote:
> > > > > Describe the usage of devices 5853:0002 and 5853:C000.
> > > > >
> > > > > Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> > > > > ---
> > > > >  docs/man/xen-pci-device-reservations.7.pod | 9 +++++++++
> > > > >  1 file changed, 9 insertions(+)
> > > > >
> > > > > diff --git a/docs/man/xen-pci-device-reservations.7.pod b/docs/ma=
n/xen-pci-device-reservations.7.pod
> > > > > index 9ddf3a18ad..62f3bd2105 100644
> > > > > --- a/docs/man/xen-pci-device-reservations.7.pod
> > > > > +++ b/docs/man/xen-pci-device-reservations.7.pod
> > > > > @@ -10,6 +10,8 @@ use of this is with device ID 0x0001 to adverti=
se the Xen Platform PCI
> > > > >  device - the presence of this virtual device enables a guest Ope=
rating
> > > > >  System (subject to the availability of suitable drivers) to make=
 use of
> > > > >  paravirtualisation features such as disk and network devices etc=
.
> > > > > +XenServer, for Windows machines, presents Xen Platform device wi=
th device
> > > > > +ID 0x0002 instead of 0x0001.
> > > >
> > > > nit: in the interest of future-proofing the doc 's/presents/may pre=
sent/'?
> > > >
> > > > >
> > > > >  Some Xen vendors wish to provide alternative and/or additional g=
uest drivers
> > > > >  that can bind to virtual devices[1]. This may be done using the =
Xen PCI
> > > > > @@ -86,4 +88,11 @@ and unplug protocol.
> > > > >  libxl provides support for creation of a single additional xen-p=
vdevice.
> > > > >  See the vendor_device parameter in xl.cfg(5).
> > > > >
> > > > > +=3Ditem 2.
> > > > > +
> > > > > +XenServer, for Windows machines, presents a device with ID 0xC00=
0.
> > > > > +This device is a placeholders for Windows update.
> > > > > +Device 0xC000 is presented with a Xen Platform PCI device, usual=
ly with ID
> > > > > +0x0002.
> > > > > +
> > > > >  =3Dback
> > > >
> > > > Wouldn't this be better covered under "=3Ditem 1"? Device 0xc000 is=
 a
> > > > xen-pvdevice, so it could be simplified to a single line of "XenSer=
ver uses
> > > > device-id=3D0xc000 for its pvdevice on Windows guests", or somethin=
g like that.
> > >
> > > I think it's important to note that c000 always appears in conjunctio=
n
> > > with 0001 or 0002, and it's not a replacement for either of those
> > > devices.

That's already stated in the item1 description.

  Note that the presence of the Xen Platform PCI device is generally a
  pre-requisite for an additional xen-pvdevice as it is the platform
  device that provides that IO ports necessary for unplugging emulated
  devices. See hvm-emulated-unplug.markdown for details of the IO ports
  and unplug protocol.

> > >
> >=20
> > Do you have something more precise in mind? Can you suggest what to wri=
te?
>
> I'm fine with your proposed text, my reply was to Alejandro to note
> that I think his proposed text was missing information that was on
> your original proposal.
>
> "XenServer might present a device with ID 0xC000.  Such device is a
> placeholder for Windows update usage and is always exposed in
> conjunction with a Xen Platform PCI device, usually with ID 0x0002."
>
> I don't care much whether this is on a separate item or not.  My
> preference would be for adding a second item, as to prevent cluttering
> the first one.
>
> I've also looked at xl.cfg, and it mentions:
>
> vendor_device=3D"VENDOR_DEVICE"
>
> Selects which variant of the QEMU xen-pvdevice should be used for this
> guest. Valid values are:
>
>   none The xen-pvdevice should be omitted. This is the default.
>
>   xenserver The xenserver variant of the xen-pvdevice (device-id=3DC000)
>   will be specified, enabling the use of XenServer PV drivers in the
>   guest.
>
> Isn't this wrong, as selecting `xenserver` should instead use
> device-id=3D0002 but not C000?  Maybe I'm not understanding how this is
> supported to work.

I think there's some confusion going on.

xen-pvdevice !=3D xen-platformdevice

pvdevice is 0xc000. platformdevice is 0001 or 0002.

platformdevice is the PCI device used for device unplug, grant table
initialization and so on. pvdevice is a true dummy device present for the
sole purpose of letting Windows bind the drivers to an actual device that
can't be 0002 for (afaiui) very, very, very stupid and non-technical reason=
s.

The man page HINTS at this when talking about binding drivers to devices.

>
> > > Likewise it's important to note that 0001 and 0002 are to my
> > > understanding mutually exclusive, and only one of those must be
> > > exposed.
> >=20
> > Not exactly sure if this is a must or a should. From my testing,
> > presenting 2 devices (well, they are mostly the same) works. But, as
> > they do the same things it seems reasonable to avoid the duplication.
> > It looks like a good recommendation.
>
> I was expecting it to not work, as I imagined Linux would then attempt
> to initialize the grant tables twice for example.
>
> Thanks, Roger.

It may very well be a case of "happens to work, but it really shouldn't". T=
he
code does go through `gnttab_init()` twice if the probe succeeds twice. Not
that it couldn't be changed to behave differently, but it currently doesn't=
.

Anyhow, I think you're right in that 0001 and 0002 must not coexist even if
mechanically they may be able to. In the name of everyone's sanity.

Cheers,
Alejandro

