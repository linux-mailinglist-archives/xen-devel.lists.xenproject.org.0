Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 016C13A9B53
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jun 2021 14:59:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142972.263779 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV8P-0001VZ-WE; Wed, 16 Jun 2021 12:59:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142972.263779; Wed, 16 Jun 2021 12:59:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ltV8P-0001Tf-Sf; Wed, 16 Jun 2021 12:59:09 +0000
Received: by outflank-mailman (input) for mailman id 142972;
 Wed, 16 Jun 2021 12:59:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qy3q=LK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1ltV8O-0001TZ-Iy
 for xen-devel@lists.xenproject.org; Wed, 16 Jun 2021 12:59:08 +0000
Received: from mo4-p04-ob.smtp.rzone.de (unknown [81.169.146.176])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8b2af396-d96c-4737-963e-f6fd63c1ca17;
 Wed, 16 Jun 2021 12:59:06 +0000 (UTC)
Received: from sender by smtp.strato.de (RZmta 47.27.2 AUTH)
 with ESMTPSA id j0415bx5GCwwtp4
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 16 Jun 2021 14:58:58 +0200 (CEST)
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
X-Inumbo-ID: 8b2af396-d96c-4737-963e-f6fd63c1ca17
ARC-Seal: i=1; a=rsa-sha256; t=1623848339; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=mUVmRMntJsGRjZRwHGWeMiQoTiSeKxc+wsihjAkpFMeXty7uVslwQquXyJIHleUFjv
    B+COnkeLtXZ8MPVaaCJtFAeLRYxfFOaQXD/Edx/GZgiCHUN+gxXvsXSyzbo10KEab+B/
    kClxNjWYzJCPUbRaWC8re2069a7W6UWQSzO+XwN6H4JV73nt6F+fKWqEYxqOSaoU3XUD
    ve0JVCAC0D5P6bmRdAPIhMx+BHZ5Y2wxVQxoWzmkgZGQZPZ5kpstE7Odx04q+at/GUEv
    nd8Ry7Cp8/OVzo9IEY0YIoEBSPmrZEwlCxmN+2N7TaBWMGEfvblo299Pu5AnBgc2UvwK
    4j8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1623848339;
    s=strato-dkim-0002; d=strato.com;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=sOq0vE76oOysPkPAtwQ2V9NTvbVQfVVkGBXRa8pF8jM=;
    b=mWWdSsHYs9DDQoOtVQbkMDWWrh6z6PQrmr1h2alFm6bxgvETZMbNCjq7sC8LGBsW5S
    HlyBEdX/STLLF880+YEJRPl2BWvjI1QMVQ3EUTAZPL2gbH20YjlYvUNrOlQn98q9GXcK
    P/wGAegj9FnOUgResdaRootSSJG0/HMF9b1ukcnNuSfZ5D/mgnqH/yl3l4ztN8YvkeNz
    7nRNRRrWZDTAAQdU6BOAxBlCxcjvnX2IQZrEao9vpcD2JCcjVBGOlQIoWZbsdwXei3vN
    tW9Jum8o5Y8ACt4DWsGy6kYGhL97oxt0P1C+W6X1kGVLuBlqaFX6AR0lCggTe4jXPKsl
    VLEA==
ARC-Authentication-Results: i=1; strato.com;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1623848339;
    s=strato-dkim-0002; d=aepfle.de;
    h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Cc:Date:
    From:Subject:Sender;
    bh=sOq0vE76oOysPkPAtwQ2V9NTvbVQfVVkGBXRa8pF8jM=;
    b=doUICSDiq2DM4BcvpF/+jFEI467WTKOCNfxeALhiX8hGovATYPevGqEm6ctYt1hFFQ
    Id3vIahGwZ4aFjvxFAAOPpywWmrWbTZKea4aVmw6XegGNe5DNXud6QfTawWXu4m8j+gl
    p5cH2bdg+yy9foCjUj6uXrbT4m2flQuLnZrd3Aujb2cR6cNmAN4KkVxqGhbWh+rLN2qp
    N8nbOQjxU2EdNcvC4/aS+EpMnqMhz9nD1CsQ/cOSb3Z4sZl34JP5PxCLtPtH0EMQnl+j
    IA/S5FtRgtLUqYcorrCGyP85D8WIqnvvq537Ftp7+/Z0Tqec3sL3UmeHsXBK0C+KRCVG
    hxEA==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QLpd5ylWvMDX3y/OuD5rXVisQsVxSIbR7sf0kebs4Z3Zpqv+Sabl5o7CzRq+Ps8Q=="
X-RZG-CLASS-ID: mo00
Date: Wed, 16 Jun 2021 14:58:46 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Michael Brown <mcb30@ipxe.org>, "Bernhard M. Wiedemann"
 <bwiedemann@suse.de>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 <xen-devel@lists.xenproject.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu
 <wl@xen.org>
Subject: Re: [PATCH v1] tools: ipxe: update for fixing build with GCC11
Message-ID: <20210616145846.305d3ce1.olaf@aepfle.de>
In-Reply-To: <b78ccdf3-9898-c903-4d9f-4d25bd27182e@citrix.com>
References: <20210615212613.6270-1-olaf@aepfle.de>
	<b78ccdf3-9898-c903-4d9f-4d25bd27182e@citrix.com>
X-Mailer: Claws Mail 2021.05.24 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/wrElCStfx.hA2l3F1hAu_2R";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/wrElCStfx.hA2l3F1hAu_2R
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Please revert bf4ccd4265ac614fbfa38bf168b6eeaf4c17d51e in ipxe.git, CentOS =
7 apparently fails to handle '-D'.

It worked in my testing with SLE12SP5 and SLE15SP3 as a base system.

See below.


I guess for xen.git, updating to just bf4ccd4265ac614fbfa38bf168b6eeaf4c17d=
51e^ will be good enough.

Olaf

Am Wed, 16 Jun 2021 13:33:52 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> On 15/06/2021 22:26, Olaf Hering wrote:
> > Use a snapshot which includes commit
> > f3f568e382a5f19824b3bfc6081cde39eee661e8 ("[crypto] Add
> > memory output constraints for big-integer inline assembly"),
> > which fixes build with gcc11.
> >
> > Signed-off-by: Olaf Hering <olaf@aepfle.de>
> > ---
> >  tools/firmware/etherboot/Makefile | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/tools/firmware/etherboot/Makefile b/tools/firmware/etherbo=
ot/Makefile
> > index ed9e11305f..23b3f6ca9d 100644
> > --- a/tools/firmware/etherboot/Makefile
> > +++ b/tools/firmware/etherboot/Makefile
> > @@ -10,7 +10,8 @@ else
> >  IPXE_GIT_URL ?=3D git://git.ipxe.org/ipxe.git
> >  endif
> > =20
> > -IPXE_GIT_TAG :=3D 988d2c13cdf0f0b4140685af35ced70ac5b3283c
> > +# put an updated tar.gz on xenbits after changes to this variable
> > +IPXE_GIT_TAG :=3D bf4ccd4265ac614fbfa38bf168b6eeaf4c17d51e
>=20
> CI says no.
>=20
> Gitlab CI is currently fairly red because of a clang build fix which
> hasn't made its way into master yet, but this job:
>=20
> =C2=A0 https://gitlab.com/xen-project/patchew/xen/-/jobs/1349871230
>=20
> shows a real failure on CentOS 7.
>=20
> ...
> =C2=A0 [VERSION] bin/version.rtl8139.rom.o
> =C2=A0 [AR] bin/blib.a
> ar: creating bin/blib.a
> objcopy: invalid option -- 'D'
> Usage: objcopy [option(s)] in-file [out-file]
> ...
>=20
> ~Andrew


--Sig_/wrElCStfx.hA2l3F1hAu_2R
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAmDJ9YYACgkQ86SN7mm1
DoBPrA/+Ktxxob0B0BOkxe4M/DZb5YAnFq1eEZUfbSgXloG3KhIt6Ozfw4vLiQp4
FSexyAlMY2vSZr9ws4LKmkRiL090tcf67Y3mRrp6Qnu7ZL3tVehzirqYSrGLnq08
4V8OFkI5Daxo+Ls4LNLx/ZhPRsB5dk7MhgrB2BlOhK2wkbiXgcXIx1m+fK5PHIUr
vBk0wDFsh0z68RKfOTDOva2CAscBqBzPzRUBkFid6qsbEj4kHTzVxxk76qkM92iY
RrNqkLEH0HKKN0Djl1dRa9pp6y8UXxK2cnWbjOTo72oInJ9JBsVjdTMLF7qpjmSx
XnLD0UzH9+/Hc5Sde9RJ+/38/HknEuLn/HeMDVWGRc2ixRzq0CzDpiMRftu3aBUt
KEPpZr/DDIuQxWTwm6ush2nVBFSJAn4HhcMkhmcPFdULiWhowqh/aNvAb2ZU+r1+
ywzXPh0a7hkjxYBRS/QnYNq05hZhKIBJMyOiHIZG1wmPzPx5XCk8BvJ5JTK/FKsC
J7a5y8Uf18i8zP1WQ0Idom1+PnrOreeJBoEUIbN7V8nRaWywiKy+AFxdsP/1vzTF
VjS9tTH+dtLd58aGTOR/HXFnALV5fl4v1Tv/oiit2p74Kbfj0KZ0tuhbyye+9Byk
WLUCmzY+Ymt+UkBY/K+25lQWUBkYF4kkLhKhmXQiLv6Wx2pYOuQ=
=9a8r
-----END PGP SIGNATURE-----

--Sig_/wrElCStfx.hA2l3F1hAu_2R--

