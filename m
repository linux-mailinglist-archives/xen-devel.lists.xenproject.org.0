Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9881C2AF47A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Nov 2020 16:12:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.25034.52601 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcrmu-0007e8-5D; Wed, 11 Nov 2020 15:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 25034.52601; Wed, 11 Nov 2020 15:11:56 +0000
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
	id 1kcrmu-0007de-14; Wed, 11 Nov 2020 15:11:56 +0000
Received: by outflank-mailman (input) for mailman id 25034;
 Wed, 11 Nov 2020 15:11:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kcrms-0007dI-Ll
 for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:11:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0740b1c6-e2f5-4db0-84ab-b9693fc39eb6;
 Wed, 11 Nov 2020 15:11:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 59824ABD1;
 Wed, 11 Nov 2020 15:11:52 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=MbyH=ER=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kcrms-0007dI-Ll
	for xen-devel@lists.xenproject.org; Wed, 11 Nov 2020 15:11:54 +0000
X-Inumbo-ID: 0740b1c6-e2f5-4db0-84ab-b9693fc39eb6
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 0740b1c6-e2f5-4db0-84ab-b9693fc39eb6;
	Wed, 11 Nov 2020 15:11:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1605107512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uSPXpLEG8GOSyda/5PVaeleBjocKL/tOq+aKFv7VeqM=;
	b=dKI0r7JK35LFwj0ilmh6RRxVlyv0k0p9yWd/5A7bDxu99/X9F2xkY81YGoznX91IPgeIci
	cA6JgJ85xkK+lf61TMNMaech5tRRywFUGzHZQt6fQdX5SHyg6pzdElhQ9j0p6bfe71VxIe
	1mp1AZhrLbQjo7TfHyeYu2gMUrhte24=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 59824ABD1;
	Wed, 11 Nov 2020 15:11:52 +0000 (UTC)
Message-ID: <7012360df5addb6e7737e421562e7f6a1dfe3f75.camel@suse.com>
Subject: Re: [PATCH 10/12] xen/hypfs: add cpupool directories
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
	 <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	 <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Julien Grall
	 <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	 <wl@xen.org>, xen-devel@lists.xenproject.org
Date: Wed, 11 Nov 2020 16:11:51 +0100
In-Reply-To: <9aba12c7-f8ec-7670-2661-f82b05adf649@suse.com>
References: <20201026091316.25680-1-jgross@suse.com>
	 <20201026091316.25680-11-jgross@suse.com>
	 <c5b12f33b4e3feb0d6f6bc51d5474b36fa42d881.camel@suse.com>
	 <6b2cf5d0-9c6d-07bd-51d3-9fd34cd8d1a5@suse.com>
	 <9aba12c7-f8ec-7670-2661-f82b05adf649@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-T7tmYYHPs2F+VFT9IuPY"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-T7tmYYHPs2F+VFT9IuPY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-11-11 at 16:00 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 11.11.20 15:56, Jan Beulich wrote:
> > On 11.11.2020 15:51, Dario Faggioli wrote:
> >=20
> >=20
> > Having a hypfs_add_dir() stub would also allow to achieve this, and
> > then, going forward, perhaps also elsewhere.
>=20
> I thought about that. This would require to be macro for the stub
> case,
> but I don't think this is a major problem.
>=20
Yes, I thought about "stub-bing" at the hypfs_add_dir() level, but we
need a macro for that, for dealing with the parameters.

Also, it's not like having that stub would prevent having #ifdef-s at
all in this file. So that's why I thought about a local stub.

But sure, if you go for the generic macro stub, I'm fine with that too.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-T7tmYYHPs2F+VFT9IuPY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+r/zcACgkQFkJ4iaW4
c+4ydA//XGZ9rclNfsBWzdxmDng1m9P+PQNtkMiiDaPbIfybirqVR5KiNT1awYBB
O0dsdAmuJpIjWTJ1GGim04t+V4OCqVFTLqSMmeshncKmDffEJzNIA7I7jDQz+vnb
lqsttsom97nQ7+sfVFo9xzXkWKvCtQVIwqkdWgsN6+rIRtf9cy8pJqFn7Q7j168L
urmWZ8Go66UoDrLkZ2Sk4bDKrjZpdav/f3GBR2Lmghz28tL81X0IuFR7C9G5rUsI
nHnH1KAzQrlNCWvD+8cwUW2QmpG9E92gtaWrArpbcM0O62hJu4ZMwZxs6G/k0FwX
u4xnAsTZrpAK8BxUynPh9iEJ71iVJY+jHB5hY21GcbMtbCk8QhWUFdqbi9HZSc2O
ILRRyx9A1Z7PYxvGxcpw8zaVAdV61a9JcFgJC8FYLKkZZOpzmGxd8OUNqoRz3Lwq
pZ0+CFeoudLtX6Sh7z4s5mrCOEGdY+HoDJsBCz20mX6FXJ8kqggFKJQGuR8tGBeZ
/qbELZNTixOL5Lp1ZeLjRLzjq1UqIE+tWZPLyj6FXWZ24Xu54wDipoCLOdJqjZva
Grl4bnUmWqEJXbE7xR8Nk0IyDpmDkWcVGdAlaDAXeHENmt1oVt2HcxgeR/jkCiAV
8fPt5ZQoTC+NpGuqzBrgJJHVVD37H2ls+yE2/m6rF3fWE8wR/zs=
=NqJT
-----END PGP SIGNATURE-----

--=-T7tmYYHPs2F+VFT9IuPY--


