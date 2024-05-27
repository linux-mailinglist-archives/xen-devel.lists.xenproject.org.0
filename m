Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C793D8D03A7
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 16:29:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730796.1136003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbLQ-000844-Hw; Mon, 27 May 2024 14:29:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730796.1136003; Mon, 27 May 2024 14:29:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBbLQ-00081l-FJ; Mon, 27 May 2024 14:29:00 +0000
Received: by outflank-mailman (input) for mailman id 730796;
 Mon, 27 May 2024 14:28:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ClYa=M6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sBbLO-00081f-UA
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 14:28:58 +0000
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 734ae4b3-1c35-11ef-b4bb-af5377834399;
 Mon, 27 May 2024 16:28:56 +0200 (CEST)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-579d02657abso1539364a12.3
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 07:28:56 -0700 (PDT)
Received: from [192.168.219.221] ([94.75.70.14])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-579c9424a83sm2466466a12.80.2024.05.27.07.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 May 2024 07:28:55 -0700 (PDT)
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
X-Inumbo-ID: 734ae4b3-1c35-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716820136; x=1717424936; darn=lists.xenproject.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=B5SsIbiB/UPq8UseSJXM17X13uGn/7XaU7r+r8SpVdI=;
        b=a930fbmihn8zqQGTcDWV53ap1EXavl3d7kRf0lJnhUTACAGBwkoabAZ2kK3qZqH7AE
         uzMJgr2ZAVDbrzTKpOca5WcPDb6tCKi/eBwEHuFv7vVBWnnFHMSFjNW5HRNS0HW/ZoWB
         +LIQOk8XWvleXREz1jKbYVQh5fZFAVu9lu61EPiOGgwx/z3rzrWh0Y2U7Vl1+YnsmLmj
         Cc2f1QCQdO/qjPxBBJ1YH9LvGd4boh/6ud48L3ClynchZuTW7DuxB0XHSsSQ7D12OneS
         y1ZQpucAL1pBJuSj8UufOyGmKsbU1Q+6/uYTsqVzQ4W/kib4W4vcw9+qbgSt7+2YBwux
         RskQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716820136; x=1717424936;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B5SsIbiB/UPq8UseSJXM17X13uGn/7XaU7r+r8SpVdI=;
        b=a1LKWBUEHaRjsZi0bZ94cox/yhdWNlgS04lWQT8zz+oEbbLJ1GgCUwHR4pCrwr5t+K
         wkxt31MUzJ6iHUhzJPzJeDVOyBFImH1jqpKZmESE9bP89zFGqNgkNYtKhpipfldKiKS7
         xyP1aI4Zici2m9YZTbnF8Iszm9IuDizdbcfSXa/QK8QyFnukZAXqkns7wgb8sV0hhwpg
         9kHRzp+vN9SiW8UqkTxheLFLGIxVwDH8u5+hQzL57axFzZUwybm5oqGq/ioBxeI6eJz6
         yU740TAVfc7lRNNIETjcGBA4eJBgc8toR6Hm8+jV7lR6SAQTaOg9BuFwfomVhsP7Hebr
         xLbA==
X-Forwarded-Encrypted: i=1; AJvYcCU3B4iwIRmoNj8fkQHYa0MNuFiyiKXvGiXOQ2Kx7sHgUTeMlFVWQIW8E1Rbt2Y8mqngB8oevwbbYW3sT53GqhyC36VxWHrOvoFQ/vx5/QM=
X-Gm-Message-State: AOJu0Yw1Vm33bZJRsHyejzpS6hVDz4YsQ/ABaWT7014nP3LtNTZzQ9dF
	wOQsJ0WDJBVfNrWtddIz0VIBkv0EV0P4hyB4x8Pb444jsNmDfJTi
X-Google-Smtp-Source: AGHT+IFCw2rKjS48GZrEfhVjk2bb8DLuVjUYBBAWWZlaZ5MUTGp2boy2Lq13OcWFYHesXUuNRP/ITQ==
X-Received: by 2002:a50:9fae:0:b0:578:60a6:7c60 with SMTP id 4fb4d7f45d1cf-57860a67f55mr8244202a12.12.1716820135882;
        Mon, 27 May 2024 07:28:55 -0700 (PDT)
Message-ID: <b9c8e762af9ca04d9194fdaa0379f2fe9096af29.camel@gmail.com>
Subject: Re: [PATCH v4 2/4] xen/arm: Alloc XenStore page for Dom0less DomUs
 from hypervisor
From: "Oleksii K." <oleksii.kurochko@gmail.com>
To: Julien Grall <julien@xen.org>, Stefano Stabellini
	 <stefano.stabellini@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com, 
 Volodymyr_Babchuk@epam.com, Henry Wang <xin.wang2@amd.com>, Alec Kwapis
 <alec.kwapis@medtronic.com>, "Daniel P . Smith"
 <dpsmith@apertussolutions.com>
Date: Mon, 27 May 2024 16:28:54 +0200
In-Reply-To: <697aadfd-a8c1-4f1b-8806-6a5acbf343ba@xen.org>
References: 
	<alpine.DEB.2.22.394.2405241552240.2557291@ubuntu-linux-20-04-desktop>
	 <20240524225522.2878481-2-stefano.stabellini@amd.com>
	 <697aadfd-a8c1-4f1b-8806-6a5acbf343ba@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.1 (3.52.1-1.fc40) 
MIME-Version: 1.0

On Sat, 2024-05-25 at 00:06 +0100, Julien Grall wrote:
> Hi Stefano,
>=20
> You have sent a new version. But you didn't reply to Juergen's
> comment.
>=20
> While he is not the maintainer of the Arm code, he is the Xenstore=20
> maintainer. Even if I agree with this approach I don't feel this is=20
> right to even ack this patch without pending questions addressed.
>=20
> In this case, we are changing yet another time the sequence for=20
> initializing Xenstore dom0less domain. I would rather not want to
> have=20
> to change a 4th time...
>=20
> I don't think it is a big problem if this is not merged for the code=20
> freeze as this is technically a bug fix.
Agree, this is not a problem as it is still looks to me as a bug fix.

~ Oleksii

>=20
> Cheers,
>=20
> On 24/05/2024 23:55, Stefano Stabellini wrote:
> > From: Henry Wang <xin.wang2@amd.com>
> >=20
> > There are use cases (for example using the PV driver) in Dom0less
> > setup that require Dom0less DomUs start immediately with Dom0, but
> > initialize XenStore later after Dom0's successful boot and call to
> > the init-dom0less application.
> >=20
> > An error message can seen from the init-dom0less application on
> > 1:1 direct-mapped domains:
> > ```
> > Allocating magic pages
> > memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
> > Error on alloc magic pages
> > ```
> >=20
> > The "magic page" is a terminology used in the toolstack as reserved
> > pages for the VM to have access to virtual platform capabilities.
> > Currently the magic pages for Dom0less DomUs are populated by the
> > init-dom0less app through populate_physmap(), and
> > populate_physmap()
> > automatically assumes gfn =3D=3D mfn for 1:1 direct mapped domains.
> > This
> > cannot be true for the magic pages that are allocated later from
> > the
> > init-dom0less application executed in Dom0. For domain using
> > statically
> > allocated memory but not 1:1 direct-mapped, similar error "failed
> > to
> > retrieve a reserved page" can be seen as the reserved memory list
> > is
> > empty at that time.
> >=20
> > Since for init-dom0less, the magic page region is only for
> > XenStore.
> > To solve above issue, this commit allocates the XenStore page for
> > Dom0less DomUs at the domain construction time. The PFN will be
> > noted and communicated to the init-dom0less application executed
> > from Dom0. To keep the XenStore late init protocol, set the
> > connection
> > status to XENSTORE_RECONNECT.
> >=20
> > Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
> > Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> > Signed-off-by: Henry Wang <xin.wang2@amd.com>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> > ---
> > =C2=A0 xen/arch/arm/dom0less-build.c | 55
> > ++++++++++++++++++++++++++++++++++-
> > =C2=A0 1 file changed, 54 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-
> > build.c
> > index 74f053c242..2963ecc0b3 100644
> > --- a/xen/arch/arm/dom0less-build.c
> > +++ b/xen/arch/arm/dom0less-build.c
> > @@ -1,5 +1,6 @@
> > =C2=A0 /* SPDX-License-Identifier: GPL-2.0-only */
> > =C2=A0 #include <xen/device_tree.h>
> > +#include <xen/domain_page.h>
> > =C2=A0 #include <xen/err.h>
> > =C2=A0 #include <xen/event.h>
> > =C2=A0 #include <xen/grant_table.h>
> > @@ -10,6 +11,8 @@
> > =C2=A0 #include <xen/sizes.h>
> > =C2=A0 #include <xen/vmap.h>
> > =C2=A0=20
> > +#include <public/io/xs_wire.h>
> > +
> > =C2=A0 #include <asm/arm64/sve.h>
> > =C2=A0 #include <asm/dom0less-build.h>
> > =C2=A0 #include <asm/domain_build.h>
> > @@ -739,6 +742,53 @@ static int __init alloc_xenstore_evtchn(struct
> > domain *d)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
> > =C2=A0 }
> > =C2=A0=20
> > +#define XENSTORE_PFN_OFFSET 1
> > +static int __init alloc_xenstore_page(struct domain *d)
> > +{
> > +=C2=A0=C2=A0=C2=A0 struct page_info *xenstore_pg;
> > +=C2=A0=C2=A0=C2=A0 struct xenstore_domain_interface *interface;
> > +=C2=A0=C2=A0=C2=A0 mfn_t mfn;
> > +=C2=A0=C2=A0=C2=A0 gfn_t gfn;
> > +=C2=A0=C2=A0=C2=A0 int rc;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( (UINT_MAX - d->max_pages) < 1 )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 printk(XENLOG_ERR "%pd: Ove=
r-allocation for d->max_pages
> > by 1 page.\n",
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 d);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -EINVAL;
> > +=C2=A0=C2=A0=C2=A0 }
> > +=C2=A0=C2=A0=C2=A0 d->max_pages +=3D 1;
> > +=C2=A0=C2=A0=C2=A0 xenstore_pg =3D alloc_domheap_page(d, MEMF_bits(32)=
);
> > +=C2=A0=C2=A0=C2=A0 if ( xenstore_pg =3D=3D NULL && is_64bit_domain(d) =
)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 xenstore_pg =3D alloc_domhe=
ap_page(d, 0);
> > +=C2=A0=C2=A0=C2=A0 if ( xenstore_pg =3D=3D NULL )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> > +
> > +=C2=A0=C2=A0=C2=A0 mfn =3D page_to_mfn(xenstore_pg);
> > +=C2=A0=C2=A0=C2=A0 if ( !mfn_x(mfn) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;
> > +
> > +=C2=A0=C2=A0=C2=A0 if ( !is_domain_direct_mapped(d) )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfn =3D gaddr_to_gfn(GUEST_=
MAGIC_BASE +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 (XENSTORE_PFN_OFFSET << PAGE_SHIFT));
> > +=C2=A0=C2=A0=C2=A0 else
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfn =3D gaddr_to_gfn(mfn_to=
_maddr(mfn));
> > +
> > +=C2=A0=C2=A0=C2=A0 rc =3D guest_physmap_add_page(d, gfn, mfn, 0);
> > +=C2=A0=C2=A0=C2=A0 if ( rc )
> > +=C2=A0=C2=A0=C2=A0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 free_domheap_page(xenstore_=
pg);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
> > +=C2=A0=C2=A0=C2=A0 }
> > +
> > +=C2=A0=C2=A0=C2=A0 d->arch.hvm.params[HVM_PARAM_STORE_PFN] =3D gfn_x(g=
fn);
> > +=C2=A0=C2=A0=C2=A0 interface =3D map_domain_page(mfn);
> > +=C2=A0=C2=A0=C2=A0 interface->connection =3D XENSTORE_RECONNECT;
> > +=C2=A0=C2=A0=C2=A0 unmap_domain_page(interface);
> > +
> > +=C2=A0=C2=A0=C2=A0 return 0;
> > +}
> > +
> > =C2=A0 static int __init construct_domU(struct domain *d,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct d=
t_device_node
> > *node)
> > =C2=A0 {
> > @@ -839,7 +889,10 @@ static int __init construct_domU(struct domain
> > *d,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D alloc_xen=
store_evtchn(d);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc < 0 )
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return rc;
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d->arch.hvm.params[HVM_PARA=
M_STORE_PFN] =3D ~0ULL;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D alloc_xenstore_page(=
d);
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( rc < 0 )
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret=
urn rc;
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > =C2=A0=20
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
>=20


