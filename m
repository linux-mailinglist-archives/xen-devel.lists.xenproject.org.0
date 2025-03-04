Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FB4A4DF08
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 14:18:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901132.1309114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpSA2-0005F5-Bk; Tue, 04 Mar 2025 13:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901132.1309114; Tue, 04 Mar 2025 13:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpSA2-0005DN-8f; Tue, 04 Mar 2025 13:18:14 +0000
Received: by outflank-mailman (input) for mailman id 901132;
 Tue, 04 Mar 2025 13:18:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QBId=VX=cloud.com=frediano.ziglio@srs-se1.protection.inumbo.net>)
 id 1tpSA1-0005DH-1t
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 13:18:13 +0000
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [2001:4860:4864:20::33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1ee26c42-f8fb-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 14:18:12 +0100 (CET)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-2c19509639eso660518fac.0
 for <xen-devel@lists.xenproject.org>; Tue, 04 Mar 2025 05:18:11 -0800 (PST)
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
X-Inumbo-ID: 1ee26c42-f8fb-11ef-9ab4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1741094290; x=1741699090; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjhupSRthIewKVU6xizNO2GzUe9kIDLQKoXcQLy3CAM=;
        b=QoaQ5WwOAcMT/cy2SNvuHVDpQvKBnpfHQFumKOwQSJqB4cif4rSPmEi5/rSKLhf1Rx
         772gZUKXJSt3JXMR9yd3a2B4D4Ryfzbkj1jqkeV3hObO5ET6qxMgPAUzMPlrcqQI4kM0
         rgTVyc1KDSl+5BjPOHxZJNsJhEOXiioqYJPnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741094290; x=1741699090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cjhupSRthIewKVU6xizNO2GzUe9kIDLQKoXcQLy3CAM=;
        b=nRvEp+DIYn4R5fxOVQALiMWNtW/CEt1/zErEvYTlEUpFFGGqt08CBNw9l8dyTWAzRs
         XZy17tCSx1lKkicTOJP25F6mLwu6GbR4YKvIcAmDFgF6Og88hEUtr6qe2Ri8HkFEeTjk
         JnoNcLWPxuFZ61h7sesHRECkNlZwvdQoUQdDFcvlUJ2X1/3RBTtsnpZrMO8K4GHurUV6
         eDV0QUB5TsFhjnzbN3OdKJFqr66kJH4KCbyHTE0kK00RrdWmJQLS3uFzD7SNwVmrmiUO
         7wNrJNW6/46JHDNW+J6uVWfYcf7P8ObdcFg7k0TIN9xkVVtNrznYIwRsx+Cf+k2qMY/B
         KqCA==
X-Forwarded-Encrypted: i=1; AJvYcCWPsq4RZ7Xou+spmpXSvP5g4f7AwA/x5I2CqHaEm2x3UZzR9zt7clWleefakQgX70tsaOaWQ6AAbzU=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxIH8mg9n4NywysfQvJV3ykMeo6MMNsBhzAU16tO+MIZt3IrrRI
	ukICrstlUetpDSNsHPDzXdkx2rknT71ewVBztdREwEku9NBLSdoF131vuYLnnFyZ7DAWYBMFuoh
	SHVo4IUz1ao5+j36ZUSojmjffzlodUySIV/keug==
X-Gm-Gg: ASbGnctcggocFGtLQW4CUUrWgwJ3tMTKRHcLwIo8JQdz7hXZT9rDfaD8NNqZ6xDjdud
	/hkRYeQKU0qSELdf7UbhrP+kMrwUAy30sNztRULW+B7R0hTu3j8GlBNQIxHZn/t355gUA17xMDc
	njTA+LIpE4IpQqWGAvU7m4KY8b
X-Google-Smtp-Source: AGHT+IE5RZIuJUdNzds0TsdmVE0L47YKdf0cbIo1Q6UdOVq7ZHnAGO7fY3ZLTKtxO64NqkI1mdHA+J5lpOFp5RjrxSk=
X-Received: by 2002:a05:6870:65a0:b0:2c1:b217:59ac with SMTP id
 586e51a60fabf-2c1b2177f4fmr5760953fac.23.1741094290413; Tue, 04 Mar 2025
 05:18:10 -0800 (PST)
MIME-Version: 1.0
References: <20250228152100.23105-1-frediano.ziglio@cloud.com>
 <D87ENZNEBN2Z.1E8WKX6K8EUE1@cloud.com> <Z8bfMmM5CJ5PQdhm@macbook.local>
 <CACHz=ZgmBxNKjA7KFktk-5jcPvWDn6DWpwCUEFzGO9qyJYuZsA@mail.gmail.com> <Z8byRwON4Oc23dxS@macbook.local>
In-Reply-To: <Z8byRwON4Oc23dxS@macbook.local>
From: Frediano Ziglio <frediano.ziglio@cloud.com>
Date: Tue, 4 Mar 2025 13:17:58 +0000
X-Gm-Features: AQ5f1JqKgF0tnyWQT7YjQCTfXXrOGbJWa6XEDRkEezhS8jHqQImGI3lrGzPrvjk
Message-ID: <CACHz=ZgTBf_=x8-myVHRnCYqF+VBCVwZ8rd83E9r=Ec8tLL+hw@mail.gmail.com>
Subject: Re: [PATCH] docs: Add some details on XenServer PCI devices
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>, xen-devel@lists.xenproject.org, 
	Anthony PERARD <anthony.perard@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 4, 2025 at 12:30=E2=80=AFPM Roger Pau Monn=C3=A9 <roger.pau@cit=
rix.com> wrote:
>
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
> > >
> >
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
>

No, the device is correct, it should be C000. 0002 is a xen platform
device, C000 is a xen-pvdevice device.
Apparently device 0002 was the first attempt to make Windows update
pick up Citrix drivers on Windows, C000 is the final attempt.
Note that recently released XCP-ng signed drivers are supporting both
devices 0001 and 0002 (I hope this sentence does not cause more
questions than answers).

> > > Likewise it's important to note that 0001 and 0002 are to my
> > > understanding mutually exclusive, and only one of those must be
> > > exposed.
> >
> > Not exactly sure if this is a must or a should. From my testing,
> > presenting 2 devices (well, they are mostly the same) works. But, as
> > they do the same things it seems reasonable to avoid the duplication.
> > It looks like a good recommendation.
>
> I was expecting it to not work, as I imagined Linux would then attempt
> to initialize the grant tables twice for example.
>

That's the reason why not to present 2 of these devices. But one would
override the other and everything should work even on Linux.

> Thanks, Roger.

Preparing a v2.

Frediano

