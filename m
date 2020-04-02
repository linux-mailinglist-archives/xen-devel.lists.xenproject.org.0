Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C54519BEEB
	for <lists+xen-devel@lfdr.de>; Thu,  2 Apr 2020 11:52:39 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJwU0-0006cx-2D; Thu, 02 Apr 2020 09:49:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=/k1p=5S=gmail.com=xadimgnik@srs-us1.protection.inumbo.net>)
 id 1jJwTy-0006cs-TQ
 for xen-devel@lists.xenproject.org; Thu, 02 Apr 2020 09:49:54 +0000
X-Inumbo-ID: 4d682c64-74c7-11ea-9e09-bc764e2007e4
Received: from mail-ed1-x532.google.com (unknown [2a00:1450:4864:20::532])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4d682c64-74c7-11ea-9e09-bc764e2007e4;
 Thu, 02 Apr 2020 09:49:53 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id a43so3346499edf.6
 for <xen-devel@lists.xenproject.org>; Thu, 02 Apr 2020 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:reply-to:to:cc:references:in-reply-to:subject:date:message-id
 :mime-version:content-transfer-encoding:thread-index
 :content-language;
 bh=8BXW3HQ9jIN1PK8/Ynmi2J5s9ajXZ+eaVpPcKxTAcNk=;
 b=nBZH0rn0E81F+R2nez36gvWmYGOU2otGb3GoyXWSHIiUIaFomyPmCPd7IIMzZOfpHZ
 lgZaO63OsuspTtdBhmUMgtUZgdDvAYpNTIYlOp8+WR8dz6UTljWpIqNkM/5CJNbP5SXR
 DEUTwy4kcc00Alfysne0FyLXDreE8pQZ+UCRC0OWv6XwBmeb/ypzoVyrqbQApuDtuDYT
 oHWFNrsUBDciPvrAn1/Mq46L0QTsWISeau508A9XP8g1RX0BFqqxiyOrml6iMYkWCxzf
 /2ubLC4SWwprYT+UJE0c0PrGiM3trIwA3+DkSS1u3uPHQz2v94+uysInvjXaZqX49Flc
 6X6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:reply-to:to:cc:references:in-reply-to
 :subject:date:message-id:mime-version:content-transfer-encoding
 :thread-index:content-language;
 bh=8BXW3HQ9jIN1PK8/Ynmi2J5s9ajXZ+eaVpPcKxTAcNk=;
 b=bakTd4lYKPlXa1oQYgBiGgPWCayr/smgjP7C9vhtQ3Q14Y9dz24IsJ13arkl3T+rxF
 srf4BS8hJpA9zI2ZUF47reXMFRLS/hcNI6UXNtY+U7VwJ5ZHNDKmu+1+nMRK4btEiriQ
 TQE6k8wwgDXBTCBPyJy5QJ6u3b28moi3eed/qhimPmPU85d0AsdQns7hLY9XVDFyNI8U
 5iOLp+lrMb5HPpqqaQNlgyb6zP3UWoqOyfSqOzUEcKDwQpmzAPq98WUTFaMjAbkOicX4
 NCOZDLm7hekgZoEZSW5eA3op6MRhvo+4Eubc9VwTYZjDrH4gfDoNNzwvovJc4jseSbsU
 ugAg==
X-Gm-Message-State: AGi0PubsubDEDCgyPZJEjT0zqN5vaHKNOiK0L7UDnIKoQpstPsObWkEx
 tMIqlMpev1/vcX6Hvb3Uz3k=
X-Google-Smtp-Source: APiQypJOhfeBLGylZMLkCkD7FprWLkParhrlxdKSMnXiT455KLlyVMHvvgdKy8q5UQl8VbbnorBYig==
X-Received: by 2002:aa7:c413:: with SMTP id j19mr2074824edq.100.1585820993093; 
 Thu, 02 Apr 2020 02:49:53 -0700 (PDT)
Received: from CBGR90WXYV0 ([54.239.6.186])
 by smtp.gmail.com with ESMTPSA id d20sm851821edn.12.2020.04.02.02.49.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 02 Apr 2020 02:49:52 -0700 (PDT)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: "Paul Durrant" <paul@xen.org>
To: =?utf-8?Q?'Philippe_Mathieu-Daud=C3=A9'?= <philmd@redhat.com>,
 "'Anthony PERARD'" <anthony.perard@citrix.com>, <qemu-devel@nongnu.org>
References: <20190114135154.16826-1-anthony.perard@citrix.com>
 <20190114135154.16826-7-anthony.perard@citrix.com>
 <772fab5a-59ab-050f-9fef-f3b050cfc5cd@redhat.com>
In-Reply-To: <772fab5a-59ab-050f-9fef-f3b050cfc5cd@redhat.com>
Subject: RE: [Qemu-devel] [PULL 06/25] xen: create xenstore areas for
 XenDevice-s
Date: Thu, 2 Apr 2020 10:49:50 +0100
Message-ID: <001001d608d4$0e7b9f40$2b72ddc0$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AQLkG+zb+BC6iV9CP7Z29unUmtxq1wLn4V7uAn6DrKimHjyY8A==
Content-Language: en-gb
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Reply-To: paul@xen.org
Cc: xen-devel@lists.xenproject.org, 'Markus Armbruster' <armbru@redhat.com>,
 'Peter Maydell' <peter.maydell@linaro.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

> -----Original Message-----
> From: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> Sent: 01 April 2020 17:14
> To: Anthony PERARD <anthony.perard@citrix.com>; qemu-devel@nongnu.org
> Cc: xen-devel@lists.xenproject.org; Peter Maydell =
<peter.maydell@linaro.org>; Paul Durrant
> <paul@xen.org>; Markus Armbruster <armbru@redhat.com>
> Subject: Re: [Qemu-devel] [PULL 06/25] xen: create xenstore areas for =
XenDevice-s
>=20
> Hi Anthony, Paul.
>=20
> Cc'ing Markus too.
>=20
> On 1/14/19 2:51 PM, Anthony PERARD wrote:
> > From: Paul Durrant <paul.durrant@citrix.com>
> >
> > This patch adds a new source module, xen-bus-helper.c, which builds =
on
> > basic libxenstore primitives to provide functions to create (setting
> > permissions appropriately) and destroy xenstore areas, and functions =
to
> > 'printf' and 'scanf' nodes therein. The main xen-bus code then uses
> > these primitives [1] to initialize and destroy the frontend and =
backend
> > areas for a XenDevice during realize and unrealize respectively.
> >
> > The 'xen-block' implementation is extended with a 'get_name' method =
that
> > returns the VBD number. This number is required to 'name' the =
xenstore
> > areas.
> >
> > NOTE: An exit handler is also added to make sure the xenstore areas =
are
> >        cleaned up if QEMU terminates without devices being =
unrealized.
> >
> > [1] The 'scanf' functions are actually not yet needed, but they will =
be
> >      needed by code delivered in subsequent patches.
> >
> > Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
> > Reviewed-by: Anthony Perard <anthony.perard@citrix.com>
> > Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
> > ---
> >   hw/block/xen-block.c            |   9 +
> >   hw/xen/Makefile.objs            |   2 +-
> >   hw/xen/trace-events             |  12 +-
> >   hw/xen/xen-bus-helper.c         | 150 +++++++++++++++
> >   hw/xen/xen-bus.c                | 321 =
+++++++++++++++++++++++++++++++-
> >   include/hw/xen/xen-bus-helper.h |  39 ++++
> >   include/hw/xen/xen-bus.h        |  12 ++
> >   7 files changed, 540 insertions(+), 5 deletions(-)
> >   create mode 100644 hw/xen/xen-bus-helper.c
> >   create mode 100644 include/hw/xen/xen-bus-helper.h
> >
> [...]
> > +static void xen_device_exit(Notifier *n, void *data)
> > +{
> > +    XenDevice *xendev =3D container_of(n, XenDevice, exit);
> > +
> > +    xen_device_unrealize(DEVICE(xendev), &error_abort);
> >   }
> >
> >   static void xen_device_realize(DeviceState *dev, Error **errp)
> >   {
> >       XenDevice *xendev =3D XEN_DEVICE(dev);
> >       XenDeviceClass *xendev_class =3D XEN_DEVICE_GET_CLASS(xendev);
> > +    XenBus *xenbus =3D =
XEN_BUS(qdev_get_parent_bus(DEVICE(xendev)));
> >       const char *type =3D object_get_typename(OBJECT(xendev));
> >       Error *local_err =3D NULL;
> >
> > -    trace_xen_device_realize(type);
> > +    if (xendev->frontend_id =3D=3D DOMID_INVALID) {
> > +        xendev->frontend_id =3D xen_domid;
> > +    }
> > +
> > +    if (xendev->frontend_id >=3D DOMID_FIRST_RESERVED) {
> > +        error_setg(errp, "invalid frontend-id");
> > +        goto unrealize;
> > +    }
> > +
> > +    if (!xendev_class->get_name) {
> > +        error_setg(errp, "get_name method not implemented");
> > +        goto unrealize;
> > +    }
> > +
> > +    xendev->name =3D xendev_class->get_name(xendev, &local_err);
> > +    if (local_err) {
> > +        error_propagate_prepend(errp, local_err,
> > +                                "failed to get device name: ");
> > +        goto unrealize;
> > +    }
> > +
> > +    trace_xen_device_realize(type, xendev->name);
> > +
> > +    xen_device_backend_create(xendev, &local_err);
> > +    if (local_err) {
> > +        error_propagate(errp, local_err);
> > +        goto unrealize;
> > +    }
> > +
> > +    xen_device_frontend_create(xendev, &local_err);
> > +    if (local_err) {
> > +        error_propagate(errp, local_err);
> > +        goto unrealize;
> > +    }
> >
> >       if (xendev_class->realize) {
> >           xendev_class->realize(xendev, &local_err);
> > @@ -72,18 +364,43 @@ static void xen_device_realize(DeviceState =
*dev, Error **errp)
> >           }
> >       }
> >
> > +    xen_device_backend_printf(xendev, "frontend", "%s",
> > +                              xendev->frontend_path);
> > +    xen_device_backend_printf(xendev, "frontend-id", "%u",
> > +                              xendev->frontend_id);
> > +    xen_device_backend_printf(xendev, "online", "%u", 1);
> > +    xen_device_backend_printf(xendev, "hotplug-status", =
"connected");
> > +
> > +    xen_device_backend_set_state(xendev, XenbusStateInitWait);
> > +
> > +    xen_device_frontend_printf(xendev, "backend", "%s",
> > +                               xendev->backend_path);
> > +    xen_device_frontend_printf(xendev, "backend-id", "%u",
> > +                               xenbus->backend_id);
> > +
> > +    xen_device_frontend_set_state(xendev, XenbusStateInitialising);
> > +
> > +    xendev->exit.notify =3D xen_device_exit;
> > +    qemu_add_exit_notifier(&xendev->exit);
> >       return;
> >
> >   unrealize:
> >       xen_device_unrealize(dev, &error_abort);
>=20
> It seems if unrealize() fails, the error stored in &local_err is never
> reported. Not sure if this can be improved although.

In this case that's essentially a "don't care". We want to know why the =
realize failed but if the unrealize fails something is probably pretty =
seriously screwed (hence the error_abort).

  Paul


