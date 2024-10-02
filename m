Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C08C98E45B
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2024 22:46:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809019.1221139 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw6Ee-0004Xw-PC; Wed, 02 Oct 2024 20:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809019.1221139; Wed, 02 Oct 2024 20:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw6Ee-0004VN-LP; Wed, 02 Oct 2024 20:46:12 +0000
Received: by outflank-mailman (input) for mailman id 809019;
 Wed, 02 Oct 2024 20:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3lMz=Q6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sw6Ec-0004Uh-FK
 for xen-devel@lists.xenproject.org; Wed, 02 Oct 2024 20:46:10 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58f635f4-80ff-11ef-99a2-01e77a169b0f;
 Wed, 02 Oct 2024 22:46:07 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 5AA4C11401E3;
 Wed,  2 Oct 2024 16:46:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Wed, 02 Oct 2024 16:46:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 16:46:05 -0400 (EDT)
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
X-Inumbo-ID: 58f635f4-80ff-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727901966;
	 x=1727988366; bh=f8RVdOvD6pkS+P1XAvOXJVNXM1/cRZszEc8tkSfGUnk=; b=
	ibB6LGxtefdpeQ9KRZYitu/ssY0mGoazBt8sDB4ccnhFFOvOsOHpxMSzwWe2yKVm
	k/FGQjpEICqAlj/pA+F7v8GiT/dcDAcD9EulEpCAaDNaekWyeQnbs7YJfEGiHHJA
	26IwpU2KIaQSmUKLKloR+XIhcEqBPvs3laDtBDYr/eF0EbI8XL/nVfonSB2dUJ/r
	9Vt/r4iGqXiLSxF3x96sgpswuygeqooKVQRvcF8H7BnRUj9fZ9n/hL1FdAK7LRTQ
	6yz2w58efXSwnhaXwo00t4dQiSuMaYW+Vw+ghIczV1sD3KAXIfQuOsyvj75kLTWy
	wZWaZ+yZgK/RgOGSDGZ5vA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727901966; x=1727988366; bh=f8RVdOvD6pkS+P1XAvOXJVNXM1/c
	RZszEc8tkSfGUnk=; b=Yjg1NRA6rXZ+D0It7sg2AFTeSkP0Xv3xzdMn91XSwO+J
	Azbw2Bmi/418S7R7WmaX31J5axjaeumiOXRoEKSS30uIM1veJ8nWPGgw1+5r6z0b
	tT+OdvhvK1vEmMllBEFEogLGIHh83SOF2WA6FrTB/DSmR0jDtAGv1ssYgCWYTvfb
	x7dr7vnEXWGYhfz8IdOXyZ+8UdUmnn6RurN02/R+MTrfWHVmCFruLcNAZtHzjSS4
	YbQGjyiTtFFkSbkUskDND+w0VK2zrhXk4ztgEvlRzZfkL09mou4IivwkEEr4kYem
	3vLvBgUfRErbRt6d++bj6NUUP1ezF47C598QiF2Duw==
X-ME-Sender: <xms:DrH9Zhm_qzY01QyXOGPmzAu4SjeFRMl-JG-OwhcJ5Yveoj3AkKMORA>
    <xme:DrH9Zs3v0rX29NA4suRj5vmsYXbhGqPiV-EAgIcaW4-g4_kYchquzUnyhLvWVMlom
    ibFngbBlUgeRw>
X-ME-Received: <xmr:DrH9ZnqgnryKFeRh3XV7ak9Du2S7c3FoVAONMWElVv4NJSkZohlDgrvDdsjLFZ_030O-xEWUKpgOQoM9dd-9DYB0Kn8Jw6vpOA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdduledgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvd
    egueetfeejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhr
    ohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpd
    hnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrnhgu
    rhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheptggr
    rhguohgvsegtrghrughovgdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhise
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:DrH9ZhlcE9VOnFrW6POQytneyEnDAC9z6bRtux2eQPkxRR5F6hvFUQ>
    <xmx:DrH9Zv1wTO9XAJH6FykmKH0tOuNlaNl_o8n3hrMmoTAH0x5pu1vnLQ>
    <xmx:DrH9ZgsGMqEilDxDA6dW1tCepBSQuIKVsanav5aAenIU4Z_kpKmI9Q>
    <xmx:DrH9ZjUGfCKH6KGZxh91ZXvMi0rB8BxGiKBiSlv9H5GeUwBIXYsvEQ>
    <xmx:DrH9ZgwCc3N3h_NTlZmK8BJ549Re7Tw0PcAApvI2iY44oXIaxhN9StEU>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 2 Oct 2024 22:46:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] automation: preserve built xen.efi
Message-ID: <Zv2xC7JPBEs1-aue@mail-itl>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com>
 <3ca5faa7-2276-4c85-a4ee-cc6ad5af3238@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2POoGM53L96abNgx"
Content-Disposition: inline
In-Reply-To: <3ca5faa7-2276-4c85-a4ee-cc6ad5af3238@citrix.com>


--2POoGM53L96abNgx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 2 Oct 2024 22:46:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH 1/2] automation: preserve built xen.efi

On Wed, Oct 02, 2024 at 09:42:13PM +0100, Andrew Cooper wrote:
> On 02/10/2024 1:42 pm, Marek Marczykowski-G=C3=B3recki wrote:
> > It will be useful for further tests.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > ---
> >  automation/scripts/build | 7 ++++++-
> >  1 file changed, 6 insertions(+), 1 deletion(-)
> >
> > diff --git a/automation/scripts/build b/automation/scripts/build
> > index b3c71fb6fb60..4cd41cb2c471 100755
> > --- a/automation/scripts/build
> > +++ b/automation/scripts/build
> > @@ -47,6 +47,7 @@ if [[ "${CPPCHECK}" =3D=3D "y" ]] && [[ "${HYPERVISOR=
_ONLY}" =3D=3D "y" ]]; then
> > =20
> >      # Preserve artefacts
> >      cp xen/xen binaries/xen
> > +    if [[ -f xen/xen.efi ]]; then cp xen/xen.efi binaries/xen.efi; fi
>=20
> Wouldn't
>=20
> =C2=A0=C2=A0=C2=A0 # Preserve xen and optionally xen.efi
> =C2=A0=C2=A0=C2=A0 cp -f xen/xen xen/xen.efi binaries/
>=20
> do this in a more concise way?

I don't think so, `cp -f` still fails if the source cannot be found.

> Alternatively, what about this:
>=20
> diff --git a/automation/scripts/build b/automation/scripts/build
> index b3c71fb6fb60..14815ea7ad9c 100755
> --- a/automation/scripts/build
> +++ b/automation/scripts/build
> @@ -41,6 +41,15 @@ cp xen/.config xen-config
> =C2=A0# Directory for the artefacts to be dumped into
> =C2=A0mkdir -p binaries
> =C2=A0
> +collect_xen_artefacts ()
> +{
> +=C2=A0=C2=A0=C2=A0 for A in xen/xen xen/xen.efi; do
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if [[ -f $A ]]; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cp $A=
 binaries/
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 fi
> +=C2=A0=C2=A0=C2=A0 done
> +}
> +
> =C2=A0if [[ "${CPPCHECK}" =3D=3D "y" ]] && [[ "${HYPERVISOR_ONLY}" =3D=3D=
 "y" ]]; then
> =C2=A0=C2=A0=C2=A0=C2=A0 # Cppcheck analysis invokes Xen-only build
> =C2=A0=C2=A0=C2=A0=C2=A0 xen/scripts/xen-analysis.py --run-cppcheck --cpp=
check-misra --
> -j$(nproc)
> @@ -53,7 +62,7 @@ elif [[ "${HYPERVISOR_ONLY}" =3D=3D "y" ]]; then
> =C2=A0=C2=A0=C2=A0=C2=A0 make -j$(nproc) xen
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0 # Preserve artefacts
> -=C2=A0=C2=A0=C2=A0 cp xen/xen binaries/xen
> +=C2=A0=C2=A0=C2=A0 collect_xen_artefacts
> =C2=A0else
> =C2=A0=C2=A0=C2=A0=C2=A0 # Full build.=C2=A0 Figure out our ./configure o=
ptions
> =C2=A0=C2=A0=C2=A0=C2=A0 cfgargs=3D()
>=20
> so we don't triplicate the handling?

That may be a better idea indeed.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2POoGM53L96abNgx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb9sQsACgkQ24/THMrX
1yw1lgf/Yzg1QnkGsyIHTQj3SRzbO2Nyl6gVMfDpC+EKFUzxW7XPGPZvi8CHV7fh
jcpMJWWvml2aCE1dnBqD6kVK2m8GrhwPq2qS/IoVjO6PLu86a0R58OU0k5q+R7Uw
JQgt3mbXarc7rQxLHybOqbyWWMIjK7etw/jH7n+vl/O2L985zA1G02gHCFKUZkUC
oC8c51rMfBU2xwm1FzSPRqNx4JobbGNWXCYJgDaxGCG3LnPPsXCFe+Y+zmwGHlQR
ffFhxyyp89xKGz59U5abRoh5r5E0psFx0dxrsf47Gxp1tBYX+3M6XT5nZ02C5ND4
diuoM5JntPTk7DILjerVCFFbNB81Pw==
=BZUn
-----END PGP SIGNATURE-----

--2POoGM53L96abNgx--

