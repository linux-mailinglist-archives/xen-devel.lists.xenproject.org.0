Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F274B1F9C91
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 18:05:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkrba-0003sn-1T; Mon, 15 Jun 2020 16:05:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8mLd=74=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jkrbZ-0003si-3H
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 16:05:01 +0000
X-Inumbo-ID: f6ebf056-af21-11ea-b7bb-bc764e2007e4
Received: from mail-ed1-x542.google.com (unknown [2a00:1450:4864:20::542])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f6ebf056-af21-11ea-b7bb-bc764e2007e4;
 Mon, 15 Jun 2020 16:05:00 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id t21so11914879edr.12
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 09:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:content-language
 :thread-index; bh=r8Uw0NEWGA4mNyeaEWdZRA2DF+M+XYvNd7arhcyLIPg=;
 b=YH8MbmfZT5l1CxsHbFPjVFNxFFmzH8bLHGSJlFNR/lb273PQi0wsklznSZ+8l/hpFb
 a3L3x80UvWgodBeUxyRAXXGZZSUH5scVA+XCHYn+b6H8eOgWfv9Stk3SifqFeyJZjZ8+
 oIpzOXxbTPSGmWx3aSOp3CRIC+Ma2wlzlqmo3XUVmjSRrdIhK77bxiRgQXlqIg+6hb5y
 MlrpYTX6rBdauqvOZTnvlW5EJdzNyVvvxvYCDef0Guqhn9V8IG3kYvaHvfnsGvjFluY0
 2Iy5DRXiiCXJIHZEBGgM1GfinItXpCEDQftdAjc3PZ6spWI8dTTuv/1g3XF047LgQC7j
 /oSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :content-language:thread-index;
 bh=r8Uw0NEWGA4mNyeaEWdZRA2DF+M+XYvNd7arhcyLIPg=;
 b=mfiUnhfhPApXTXsiwI4iWVz0MOHGV8h5qf5x5b2VOp484P28LH4Mc2RBA+25pswcXg
 aFEs41wnoN9cJm1cZnyvZ89Cnp71On23hiXYlBP5RdrE4jqi495Mn+OClpj08xA9RL91
 mX6igz88sVZi5uk/Lh+ZbE40rOH7Bm+Ma6P2uKtKB8eZh275Hxn0aNFF79KA7BCAJBrJ
 UPJvKf25eln49iyadIp3yHh+mJ2T271QXmXnqtfb0Jo+94BNlUxWNEV3uj9GrooDrCTT
 DZGXWeE0D4zClmuVkke2Cm9JCT78dO7nLc9sXNOLsQNmvgxYSeTv7GGUhUMQMBwjCIR/
 6+ow==
X-Gm-Message-State: AOAM531aFBtmgVAvRBsC1MrUCv+wrEcdbSr6hh3bXWThw4nPYxAxkgRc
 CGU3kWKspAyuus1Z5b5FOiw=
X-Google-Smtp-Source: ABdhPJzMR2aoI/ot0cCAz4BNCYeiMpqDNIl7Z+V8x15JvqUclNNUEm4rrqbUKaE4483jmSty5OGgbw==
X-Received: by 2002:a50:f289:: with SMTP id f9mr23897856edm.188.1592237099627; 
 Mon, 15 Jun 2020 09:04:59 -0700 (PDT)
Received: from CBGR90WXYV0 (54-240-197-234.amazon.com. [54.240.197.234])
 by smtp.gmail.com with ESMTPSA id n35sm8751903edc.11.2020.06.15.09.04.58
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jun 2020 09:04:58 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?UTF-8?Q?'Roger_Pau_Monn=C3=A9'?= <roger.pau@citrix.com>,
 "'Ian Jackson'" <ian.jackson@citrix.com>
References: <ebdcefb5ab4b9053dee7c090b4e6562e597b3474.1592151144.git.gorbak25@gmail.com>
 <24295.36070.945693.791220@mariner.uk.xensource.com>
 <20200615155646.GI735@Air-de-Roger>
In-Reply-To: <20200615155646.GI735@Air-de-Roger>
Subject: RE: [PATCH] libxl: tooling expects wrong errno
Date: Mon, 15 Jun 2020 17:04:57 +0100
Message-ID: <003001d6432e$b80d8a20$28289e60$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Content-Language: en-gb
Thread-Index: AQJRrVmR5Atw2cuOlpDTe0mFV6HHUQIpYa7PAtS50FGnuxEqwA==
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
Cc: 'Kevin Tian' <kevin.tian@intel.com>, 'Wei Liu' <wl@xen.org>,
 jakub@bartmin.ski, 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 marmarek@invisiblethingslab.com, 'Grzegorz Uriasz' <gorbak25@gmail.com>,
 'Anthony Perard' <anthony.perard@citrix.com>,
 'Jan Beulich' <jbeulich@suse.com>, j.nowak26@student.uw.edu.pl,
 xen-devel@lists.xenproject.org, contact@puzio.waw.pl
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> Sent: 15 June 2020 16:57
> To: Ian Jackson <ian.jackson@citrix.com>
> Cc: Grzegorz Uriasz <gorbak25@gmail.com>; Jan Beulich =
<jbeulich@suse.com>; Andrew Cooper
> <andrew.cooper3@citrix.com>; Kevin Tian <kevin.tian@intel.com>; Paul =
Durrant <paul@xen.org>; Wei Liu
> <wl@xen.org>; jakub@bartmin.ski; marmarek@invisiblethingslab.com; =
j.nowak26@student.uw.edu.pl; Anthony
> Perard <anthony.perard@citrix.com>; xen-devel@lists.xenproject.org; =
contact@puzio.waw.pl
> Subject: Re: [PATCH] libxl: tooling expects wrong errno
>=20
> On Mon, Jun 15, 2020 at 03:59:50PM +0100, Ian Jackson wrote:
> > Grzegorz Uriasz writes ("[PATCH] libxl: tooling expects wrong =
errno"):
> > > When iommu is not enabled for a given domain then pci passthrough
> > > hypercalls such as xc_test_assign_device return EOPNOTSUPP.
> > > The code responsible for this is in "iommu_do_domctl" inside
> > > xen/drivers/passthrough/iommu.c
> > > This patch fixes the error message reported by libxl when =
assigning
> > > pci devices to domains without iommu.
> > >
> > > Signed-off-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > > Tested-by: Grzegorz Uriasz <gorbak25@gmail.com>
> > > ---
> > >  tools/libxl/libxl_pci.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/tools/libxl/libxl_pci.c b/tools/libxl/libxl_pci.c
> > > index 957ff5c8e9..bc5843b137 100644
> > > --- a/tools/libxl/libxl_pci.c
> > > +++ b/tools/libxl/libxl_pci.c
> > > @@ -1561,7 +1561,7 @@ void libxl__device_pci_add(libxl__egc *egc, =
uint32_t domid,
> > >              LOGD(ERROR, domid,
> > >                   "PCI device %04x:%02x:%02x.%u %s?",
> > >                   pcidev->domain, pcidev->bus, pcidev->dev, =
pcidev->func,
> > > -                 errno =3D=3D ENOSYS ? "cannot be assigned - no =
IOMMU"
> > > +                 errno =3D=3D EOPNOTSUPP ? "cannot be assigned - =
no IOMMU"
> > >                   : "already assigned to a different guest");
> > >              goto out;
> > >          }
> >
> > Thanks.  I have addressed some Xen IOMMU maintainers.  Can you =
confirm
> > whether this is right ?
>=20
> Not an IOMMU maintainer myself, but I've taken a look at the code and
> I think Grzegorz is right. iommu_do_domctl will return -EOPNOTSUPP if
> the IOMMU is not enabled for the domain. Another option would be to
> check for EBUSY (which will certainly be returned when the device is
> busy) and log the error code with a message when it's different than
> EBUSY?
>=20
> There are many possible error here, for example the device itself
> might not be behind an IOMMU, in which case Xen will return -ENODEV at
> least on the Intel case.

ENOSYS is certainly wrong; it should only be used to indicate an =
unimplemented hypercall. I think Roger's suggestion of avoiding EBUSY =
and use LOGED would be better though.

  Paul

>=20
> Thanks, Roger.


