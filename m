Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B76C214B413
	for <lists+xen-devel@lfdr.de>; Tue, 28 Jan 2020 13:18:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwPmx-0006EG-75; Tue, 28 Jan 2020 12:16:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fY/m=3R=cs.helsinki.fi=ilpo.jarvinen@srs-us1.protection.inumbo.net>)
 id 1iwPmu-0006E9-L1
 for xen-devel@lists.xenproject.org; Tue, 28 Jan 2020 12:16:13 +0000
X-Inumbo-ID: f781591a-41c7-11ea-b211-bc764e2007e4
Received: from script.cs.helsinki.fi (unknown [128.214.11.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f781591a-41c7-11ea-b211-bc764e2007e4;
 Tue, 28 Jan 2020 12:16:10 +0000 (UTC)
X-DKIM: Courier DKIM Filter v0.50+pk-2017-10-25 mail.cs.helsinki.fi Tue,
 28 Jan 2020 14:16:08 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs.helsinki.fi;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :mime-version:content-type; s=dkim20130528; bh=8yNqY9khbaXTyw/Tm
 0RElB9YmG16ZVPko/wk3Rbm4fw=; b=T0GM0/K8HAfSEeL82ZFjYloRTNcTQcqlv
 230ZQSpEYaA+FGXN6cP80Sc8AFR/xkEXwK5jCHiLl0GS4n9UNa491DcdAxEqa+RH
 ViccHSWmqS6FEJKOi2IQUTP1gJHgIx7GYj++XgGAXtat6tQt0sKF/BK35DE9NS3w
 gVnGAKa9Rw=
Received: from whs-18.cs.helsinki.fi (whs-18.cs.helsinki.fi [128.214.166.46])
 (TLS: TLSv1/SSLv3,256bits,AES256-GCM-SHA384)
 by mail.cs.helsinki.fi with ESMTPS; Tue, 28 Jan 2020 14:16:08 +0200
 id 00000000005A00CF.000000005E302608.00007DAF
Date: Tue, 28 Jan 2020 14:16:08 +0200 (EET)
From: "=?ISO-8859-15?Q?Ilpo_J=E4rvinen?=" <ilpo.jarvinen@cs.helsinki.fi>
X-X-Sender: ijjarvin@whs-18.cs.helsinki.fi
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
In-Reply-To: <517e2a5d-a43b-177e-1afd-119d84634af2@oracle.com>
Message-ID: <alpine.DEB.2.20.2001281412020.25113@whs-18.cs.helsinki.fi>
References: <alpine.DEB.2.20.2001271510110.7272@whs-18.cs.helsinki.fi>
 <c7acac38-e598-feec-e9c1-7c1599aba8cf@suse.com>
 <20200127213722.GC2995@mail-itl>
 <a486de72-c3bf-2d32-c86c-0e38d9d87f0a@oracle.com>
 <517e2a5d-a43b-177e-1afd-119d84634af2@oracle.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=_script-32199-1580213768-0001-2"
Subject: Re: [Xen-devel] Linux 5.5 fails to boot in VM
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
Cc: =?ISO-8859-15?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Jason Gunthorpe <jgg@mellanox.com>,
 =?ISO-8859-15?Q?Marek_Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_script-32199-1580213768-0001-2
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable

On Mon, 27 Jan 2020, Boris Ostrovsky wrote:

> RAX=3D0 most likely means that map->notifier is NULL (assuming your
> compiler generates code similar to mine).
>=20
> I believe you at least need
>=20
>=20
> diff --git a/drivers/xen/gntdev.c b/drivers/xen/gntdev.c
> index 4fc83e3f..d35cf0b 100644
> --- a/drivers/xen/gntdev.c
> +++ b/drivers/xen/gntdev.c
> @@ -1016,7 +1016,8 @@ static int gntdev_mmap(struct file *flip, struct
> vm_area_struct *vma)
> =A0=A0=A0=A0=A0=A0=A0=A0 * and we are holding it now, there is no need =
for the
> notifier_range
> =A0=A0=A0=A0=A0=A0=A0=A0 * locking pattern.
> =A0=A0=A0=A0=A0=A0=A0=A0 */
> -=A0=A0=A0=A0=A0=A0 mmu_interval_read_begin(&map->notifier);
> +=A0=A0=A0=A0=A0=A0 if (use_ptemod)
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mmu_interval_read_begin(&ma=
p->notifier);
> =A0
> =A0=A0=A0=A0=A0=A0=A0 if (use_ptemod) {
> =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 map->pages_vm_start =3D v=
ma->vm_start;
>=20
>=20
> and maybe more.=A0 Give that a try.

This one works, thank you!

Please let me know if you still want me to test also the revert.


--=20
 i.
--=_script-32199-1580213768-0001-2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--=_script-32199-1580213768-0001-2--

