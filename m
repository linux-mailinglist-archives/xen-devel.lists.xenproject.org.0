Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D27D7077D9
	for <lists+xen-devel@lfdr.de>; Thu, 18 May 2023 04:10:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.536152.834323 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzT5e-0005i8-Gh; Thu, 18 May 2023 02:10:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 536152.834323; Thu, 18 May 2023 02:10:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzT5e-0005fm-Ao; Thu, 18 May 2023 02:10:02 +0000
Received: by outflank-mailman (input) for mailman id 536152;
 Thu, 18 May 2023 02:10:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y6hQ=BH=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1pzT5c-0005YW-Tg
 for xen-devel@lists.xenproject.org; Thu, 18 May 2023 02:10:00 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16f49c97-f521-11ed-8611-37d641c3527e;
 Thu, 18 May 2023 04:09:58 +0200 (CEST)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-965a68abfd4so271164366b.2
 for <xen-devel@lists.xenproject.org>; Wed, 17 May 2023 19:09:58 -0700 (PDT)
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
X-Inumbo-ID: 16f49c97-f521-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684375798; x=1686967798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z50a9Kg5Zk3qOUOw9QwsrjSX3TOX4jrusUWVi33KFUg=;
        b=ORGup4/7ZVy5FGzIsi5RwciSWxM0IW5CBd7Hjchhqj7HoFaOXo5ik0IPAJY+XjLBG+
         69+qDmQf/OtAb3fIlR9hYTIBoJ5eaopf7+/X/slAvvBWwOkMyFh73zbPW71e3WoZButB
         31wDPVV5wbHeRAmC0y3VRpXujzvWx6Xu1iC+1xBXU6AGnPvl7tESXOvg9HYkm8fX26Ya
         j4C//yKZGvsnC1ed2WdhOcc2tTP4Ea9YSfPH3KFluLl9WfDognUARuwJkO9RE7mEWNbD
         Hl+KyYbvIetSY1qj2FKQ65tBKLZpdZTOb56uwhfV4O3SaLcVI3w9ywk+FHnw3lokWHJ3
         cjvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684375798; x=1686967798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z50a9Kg5Zk3qOUOw9QwsrjSX3TOX4jrusUWVi33KFUg=;
        b=JIvxqFObScX0mdmaBMabSn9IS/bj2Pyi3M+z1rRB5i9NOL7riWamgTQw8MHKYV5LI4
         t/Y1FYpevmGuP40txDb8i/Ds3S2UGNI3sFlHpaUG2BM3m6yiRbqtLBZz+t83GR90m4AR
         b85wtDXl5GVzG0D01KyD7iKI3DEq+EIg6HjK5g9jfp8iutcUdoQYInanTMnAfAMY4frI
         5rN+F31MHbIHYTJ5TuQOoBFx19dVQ0lGA9xLB1ZaA1rtLiCozBpZwUNJGBRr0naPIipe
         yXvxXJJEz8PFU2iGIhYCkzqoKMeHKjVEnUgN3j4syp0O2oUMSX9gPExoZrj2WOXzyqjP
         pVDw==
X-Gm-Message-State: AC+VfDweRrQjqiMyU1eVMZmNVTx1HRCToW/SlxIbQ//7DHCaNm5fnQMY
	vq59EGJ1Cf+wjEwlOtD2WyPztTAm/CJVusbgRGQ=
X-Google-Smtp-Source: ACHHUZ5Vejp5o9w3CIlmm6LuPL/4+Z5LjlPnX3IOXyW0yDsUrbLtJfQYNQlGMDq+laS6GFMrkykjnw2r+TGQiB7jzZE=
X-Received: by 2002:a17:906:9b8f:b0:96a:6c3:5e72 with SMTP id
 dd15-20020a1709069b8f00b0096a06c35e72mr29803714ejc.10.1684375798063; Wed, 17
 May 2023 19:09:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230320000554.8219-1-jandryuk@gmail.com> <48c55d33-aa16-4867-a477-f6df45c7d9d9@perard>
In-Reply-To: <48c55d33-aa16-4867-a477-f6df45c7d9d9@perard>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Wed, 17 May 2023 22:09:46 -0400
Message-ID: <CAKf6xpvzcR47oTcbyNWwTV9Bu2N0EaqjNh5CDv2XYTwGF5_qEA@mail.gmail.com>
Subject: Re: [PATCH] xen: Fix host pci for stubdom
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 15, 2023 at 11:04=E2=80=AFAM Anthony PERARD
<anthony.perard@citrix.com> wrote:
>
> On Sun, Mar 19, 2023 at 08:05:54PM -0400, Jason Andryuk wrote:
> > diff --git a/hw/xen/xen-host-pci-device.c b/hw/xen/xen-host-pci-device.=
c
> > index 8c6e9a1716..51a72b432d 100644
> > --- a/hw/xen/xen-host-pci-device.c
> > +++ b/hw/xen/xen-host-pci-device.c
> > @@ -33,13 +34,101 @@
> >  #define IORESOURCE_PREFETCH     0x00001000      /* No side effects */
> >  #define IORESOURCE_MEM_64       0x00100000
> >
> > +/*
> > + * Non-passthrough (dom0) accesses are local PCI devices and use the g=
iven BDF
> > + * Passthough (stubdom) accesses are through PV frontend PCI device.  =
Those
> > + * either have a BDF identical to the backend's BFD (xen-backend.passt=
hrough=3D1)
> > + * or a local virtual BDF (xen-backend.passthrough=3D0)
> > + *
> > + * We are always given the backend's BDF and need to lookup the approp=
riate
> > + * local BDF for sysfs access.
> > + */
> > +static void xen_host_pci_fill_local_addr(XenHostPCIDevice *d, Error **=
errp)
> > +{
> > +    unsigned int num_devs, len, i;
> > +    unsigned int domain, bus, dev, func;
> > +    char *be_path;
> > +    char path[80];
> > +    char *msg;
> > +
> > +    be_path =3D qemu_xen_xs_read(xenstore, 0, "device/pci/0/backend", =
&len);
> > +    if (!be_path) {
> > +        /*
> > +         * be_path doesn't exist, so we are dealing with a local
> > +         * (non-passthough) device.
> > +         */
> > +        d->local_domain =3D d->domain;
> > +        d->local_bus =3D d->bus;
> > +        d->local_dev =3D d->dev;
> > +        d->local_func =3D d->func;
> > +
> > +        return;
> > +    }
> > +
> > +    snprintf(path, sizeof(path), "%s/num_devs", be_path);
>
> Is 80 bytes for `path` enough?
> What if the path is truncated due to the limit?
>
>
> There's xs_node_scanf() which might be useful. It does the error
> handling and call scanf(). But I'm not sure if it can be used here, in
> this file.

Thanks for the suggestion - I'll take a look.  Your other comments
sound good, too.

Also, for the next version, I plan to change the From: to Marek. I was
thinking of doing it earlier, but failed to do so when it was time to
send out the patch.  Most of the code is Marek's from his Qubes
stubdom repo.  My modifications were to make it work with non-stubdom
as well.

Thanks,
Jason

