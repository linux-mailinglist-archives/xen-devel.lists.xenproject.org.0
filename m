Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F3B2CF1A6
	for <lists+xen-devel@lfdr.de>; Fri,  4 Dec 2020 17:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.44929.80367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDi3-0003zm-5z; Fri, 04 Dec 2020 16:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 44929.80367; Fri, 04 Dec 2020 16:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1klDi3-0003zN-2h; Fri, 04 Dec 2020 16:13:27 +0000
Received: by outflank-mailman (input) for mailman id 44929;
 Fri, 04 Dec 2020 16:13:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6t4/=FI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1klDi2-0003zI-3Q
 for xen-devel@lists.xenproject.org; Fri, 04 Dec 2020 16:13:26 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f2400642-fd5d-48c1-a86d-3a76832761c1;
 Fri, 04 Dec 2020 16:13:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6AB46AC9A;
 Fri,  4 Dec 2020 16:13:23 +0000 (UTC)
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
X-Inumbo-ID: f2400642-fd5d-48c1-a86d-3a76832761c1
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1607098403; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=egCyZgLYx3Tnyw2SefDaCVUfzeMrdZiWee7v5HfqyzQ=;
	b=MWQhxv3+R0Df10vNILBoIACHS2uyTSouIOOr+msMH1hQpiyf0Ouyd0lwbDajvKgpRYvLBp
	g1SwxnuAiDkZzHIsy8BP+/uH1oks22b3UeRmvu+sIc1AiZgQTs5Ef7VuTHTFY1msppw5r0
	j5G3H9mt7/Imz4vopnzkL89BkyOYrpw=
Message-ID: <fe0b6924122aa9dff2095403738f111750cc815a.camel@suse.com>
Subject: Re: [PATCH v2 05/17] xen/cpupool: switch cpupool list to normal
 list interface
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
	 <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Date: Fri, 04 Dec 2020 17:13:21 +0100
In-Reply-To: <a812d9a9-a701-bb58-01bf-9375ad4feb50@suse.com>
References: <20201201082128.15239-1-jgross@suse.com>
	 <20201201082128.15239-6-jgross@suse.com>
	 <54301d8c-2d69-3206-6c42-d2638b7e7aa3@suse.com>
	 <a812d9a9-a701-bb58-01bf-9375ad4feb50@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-eaXWRjy1PlWl36Kv9g80"
User-Agent: Evolution 3.38.2 (by Flathub.org) 
MIME-Version: 1.0


--=-eaXWRjy1PlWl36Kv9g80
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-12-01 at 10:18 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 01.12.20 10:12, Jan Beulich wrote:
> > What guarantees that you managed to find an unused ID, other
> > than at current CPU speeds it taking too long to create 4
> > billion pools? Since you're doing this under lock, wouldn't
> > it help anyway to have a global helper variable pointing at
> > the lowest pool followed by an unused ID?
>=20
> An admin doing that would be quite crazy and wouldn't deserve better.
>=20
> For being usable a cpupool needs to have a cpu assigned to it. And I
> don't think we are coming even close to 4 billion supported cpus. :-)
>=20
> Yes, it would be possible to create 4 billion empty cpupools, but for
> what purpose? There are simpler ways to make the system unusable with
> dom0 root access.
>=20
Yes, I agree. I don't think it's worth going through too much effort
for trying to deal with that.

What I'd do is:
 - add a comment here, explaining quickly exactly this fact, i.e.,=C2=A0
   that it's not that we've forgotten to deal with this and it's all=C2=A0
   on=C2=A0purpose. Actually, it can be either a comment here or it can be=
=C2=A0
   mentioned in the changelog. I'm fine either way
 - if we're concerned about someone doing:
     for i=3D1...N { xl cpupool-create foo bar }
   with N ending up being some giant number, e.g., by mistake, I don't=C2=
=A0
   think it's unreasonable to come up with an high enough (but=C2=A0
   certainly not in the billions!) MAX_CPUPOOLS, and stop creating new
   ones when we reach that level.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-eaXWRjy1PlWl36Kv9g80
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl/KYCEACgkQFkJ4iaW4
c+4qvQ//bmq57+Rg88bsY3hi0xINfUp53ri8kl/5aY3cyMtbsYZ1f2THdAW7Tf8m
no4lRnUus/EvkbvkaPnEJqMS6e0ngNgNmLIKgA+VWUnP/yb/jI5G/vpeVW6IR3OR
kDcEcEkxLIXOGobAK/LzKtzUj8hvkBva+C4QHs/lzwD+Kx/HWiwcZb1mNM0WKr2v
C94yQUxeL78sVu8eQVbakjGrReDN1WmlMh5mxJhAh66N8Peeeq8SvrEInKfTyxBu
bNaDP6Ek+S+hZCvJ7JZmzQPk4YXDkz0q8IHUR/B+SLhUeKsw6fvW7aw1rsLbLlwF
cBhjbpUMezw4Vidt0AHkaPHFy6lAiEg5eqh7SXzveEhpAW8Myx8qddfQe+tlrefv
YAM5BUijILZfdVjCNyfrggIUE6SN12sCB4g53csj9RVf8ntpyAoqLAosybdV//MK
wqZAkOhnepEyvSgNRN7HLwgdDd0sCIe+qW/pdhtAJKxfAReWFQmI0nXshFuew2ss
kSEAmJIoyx2Bczl+XhHRUn/NpZhB6I0mAg84FHExbw2z9SMFeEW/6KWobFLmq187
HFkoZn7qJdensuyUisKt/BZwYU1V/E2PikTQg/sgx5sbBgz2mSFtQc5Sgn5Hwa74
WE7jo6MfAmowo0NK8aApQYpOwVOVw1OkgjsEQIWZx2TTD/1zzvs=
=QNI8
-----END PGP SIGNATURE-----

--=-eaXWRjy1PlWl36Kv9g80--


