Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C98972AF410
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 15:52:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.24977.52493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrTY-0004pf-C2; Wed, 11 Nov 2020 14:51:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 24977.52493; Wed, 11 Nov 2020 14:51:56 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrTY-0004pG-91; Wed, 11 Nov 2020 14:51:56 +0000
Received: by outflank-mailman (input) for mailman id 24977;
 Wed, 11 Nov 2020 14:51:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kcrTW-0004pB-SR
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:51:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 47ba78ac-5a81-4ae2-9a08-3dde48a67035;
 Wed, 11 Nov 2020 14:51:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7AF06ADE1;
 Wed, 11 Nov 2020 14:51:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kcrTW-0004pB-SR
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 14:51:54 +0000
X-Inumbo-ID: 47ba78ac-5a81-4ae2-9a08-3dde48a67035
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 47ba78ac-5a81-4ae2-9a08-3dde48a67035;
	Wed, 11 Nov 2020 14:51:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605106312;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=UNjrdRt/ztAhXZ8xI+j0cukdzNTlJhIIGI4KDIJIORI=;
	b=pAkFazOWexMPr/3uoMhrLk4UV61wuzBQEqME4fwl+DlCnkwU8qE/hTk7dx1R706EIjkEKb
	z+qd10v5hcfm142W4MpHTlmlQlgK+8tOnYAdmTqyjSZqIOeWATjSUhGbjHpD+hQkk4IcOZ
	r3qYlCa4rEG7mOOPstHB0K8DXVtHHGI=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 7AF06ADE1;
	Wed, 11 Nov 2020 14:51:52 +0000 (UTC)
Message-ID: <c5b12f33b4e3feb0d6f6bc51d5474b36fa42d881.camel@suse.com>
Subject: Re: [PATCH 10/12] xen/hypfs: add cpupool directories
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	 <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini
	 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Date: Wed, 11 Nov 2020 15:51:51 +0100
In-Reply-To: <20201026091316.25680-11-jgross@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
	 <20201026091316.25680-11-jgross@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-94siXGnfjUpn5qHrf8Yi"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-94siXGnfjUpn5qHrf8Yi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2020-10-26 at 10:13 +0100, Juergen Gross wrote:
> Add /cpupool/<cpupool-id> directories to hypfs. Those are completely
> dynamic, so the related hypfs access functions need to be
> implemented.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
So, I'm almost sold... Just one comment:

> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -999,6 +1073,10 @@ static int __init cpupool_init(void)
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 cpupool_gran_init();
> =C2=A0
> +#ifdef CONFIG_HYPFS
> +=C2=A0=C2=A0=C2=A0 hypfs_add_dir(&hypfs_root, &cpupool_dir, true);
> +#endif
> +
What would you think about doing this in an helper function
(hypfs_cpupool_init() ?), implemented inside the above #ifdef and as an
empty stub if !CONFIG_HYPFS ?

That will save us from having the #ifdef-s again here.

I'm asking because it's certainly not critical and I don't have a too
strong opinion about it. But I do think the code would look better.

> =C2=A0=C2=A0=C2=A0=C2=A0 cpupool0 =3D cpupool_create(0, 0, &err);
> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON(cpupool0 =3D=3D NULL);
> =C2=A0=C2=A0=C2=A0=C2=A0 cpupool_put(cpupool0);

--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-94siXGnfjUpn5qHrf8Yi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+r+ocACgkQFkJ4iaW4
c+7f6Q//cDF51AAtUXs+fcwLE2i1VIeWooYluhioIgx4qPjp9b6hcVZSQXYpbjeh
f7QQ2J8dxs7XIqWZc0TlZ6L8BswscTlNoIE2CRxK7YFSHkPFaXHmX0DJjzVZGBh5
R6JMhMXZoauIr+EKa2GZXdXoTumuGPyUs+fbmTr8iQQrY4Umbcwwy6R3oUqUIzNg
8+yLwceE1P7ry0pfbujN2dWqOK5TaqDMZwGimT9jwFVxlDnWEoENBbrIZ7lzPSET
YYcJi0hTDa2NsywWCEKd2EuBsrx7nt61a1TZyKggGCvtP4JFuUbEsem5Te1Xf07J
WRwz5kctL8xN+SknZDO+5zTWQm2rYKMOrF55z2QWKnDjGbB35AgHOO90XakQRlKu
1kLKogFm+C4R715K0gkFwRJM9aCM2z6c1y627ZxtrrlbWs++xewdiEz9qKQ1KWRx
U7757LrkgefDG5AAbBLldpxKMF69U7djqq3pE5vK4afBbqJkum1Jc6q2+QavAlPf
7YP0CAFfNTHv8aiL/SVFQPAJ6I1F2y7Sy/9SYOozgRhUZxO4661co6VS51XwZbZS
LdUXthv1uA3SznJEiRhjilqpWjNlP8ENMxiLbzuhLbKRsholpuvPI82x+ET2vNtb
okyiS2T/2CNoWRU29MP0ZAS7XiWbLpptEfcQakktCLqlF6/irlA=
=wo9T
-----END PGP SIGNATURE-----

--=-94siXGnfjUpn5qHrf8Yi--


