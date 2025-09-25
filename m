Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6E0B9F0BC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Sep 2025 13:57:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1130431.1469994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1kax-0007UL-Im; Thu, 25 Sep 2025 11:57:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1130431.1469994; Thu, 25 Sep 2025 11:57:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1kax-0007S8-FP; Thu, 25 Sep 2025 11:57:07 +0000
Received: by outflank-mailman (input) for mailman id 1130431;
 Thu, 25 Sep 2025 11:57:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhi9=4E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v1kav-0007Rw-Ob
 for xen-devel@lists.xenproject.org; Thu, 25 Sep 2025 11:57:05 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba83920b-9a06-11f0-9809-7dc792cee155;
 Thu, 25 Sep 2025 13:56:54 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.phl.internal (Postfix) with ESMTP id 37D77EC01B4;
 Thu, 25 Sep 2025 07:56:53 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Thu, 25 Sep 2025 07:56:53 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Sep 2025 07:56:50 -0400 (EDT)
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
X-Inumbo-ID: ba83920b-9a06-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758801413;
	 x=1758887813; bh=zteHaL9KF3LqnN3cNTlk/wtnTwJ1Zyvgq0wx3UtS3b4=; b=
	bqroH2YxczKCnbOiVliGRCrT0vKN8w35hHddTPeZOf2pEcbF+Aq8e7lYn0S6nICl
	FmY8J2GWWJdWBNRMbhmtLlRlK6s2X49xTStJwE/LkXmurTbqgYZvQzrr8NMDY5gF
	mGw42mOwsTi5vstbfs49Dq+1frt1JKUkG7dGIkltcmZfJjB+W/JIN9ylsSJlzl/2
	95AuUVMKqywfkJs+eimg5nvSZCGqq078yq15cGjQQcJvF+vHJ7eEwZJEVx+XpSen
	TSKsXUse+glmzSg5sKzaMrivarom04waypq7aRB5iWdOyJJsDw/VYCMR0ZIiII14
	3KU8ING2fLg5LYHxVVvnEw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758801413; x=1758887813; bh=zteHaL9KF3LqnN3cNTlk/wtnTwJ1Zyvgq0w
	x3UtS3b4=; b=iFJ/RQwQXOis4PscnS8++c7tr+hIcLfqVmbYGQtJGIX/xVIMc96
	T3XB/XuplCJX04/e6dStDJi2o8x2369uIun4K5cUgQdu2kEmtSZ8J7ngN4tLoBVL
	iGOzGlsCXBGRSVYJrX7PzTLr/q6TQUbHQvScM+uI64emzHyu+R0/+ZFtU9YUGQFk
	9l2ICTYxhFH4reqpR7SdGlvc+LJocJi1tvhjH4eUhXiHfR77NdMNj1ETt7RjdcMc
	VAUoRpvRTg4177ZMNW99gF+L6Zp6P+jKNs3B0n/SsrW/uguvFk8NjVDAI5R3BACo
	EsJFPDKITeuNMa4J0oXQlZjPZuXa7pyKdAg==
X-ME-Sender: <xms:BC7VaCXoz5iEWS1JIdgq7kTkBbM_vZllXekF4j04mU5st-AkfNtjXQ>
    <xme:BC7VaAJT4SVRvLASDZ9VwqqAFkv_yGB8Jj_O-nWa5QK-ebrgiFIKW2drOGfqwVjkP
    rTpINaLBtG8a-sQxoWtsPGhWvudAPx18-czq4P_-AablhL->
X-ME-Received: <xmr:BC7VaFq65hlB17C8WDzBdey8DWIOLtlm6fPUpxHRa8t9lz90SXVBmDnwUYwYQNfqop_wbtmwQITPEbS67ihoRZ-PMCwwACRH2Hc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeiieegfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvgffhieeu
    tdevueelgeejgedvkeeuueetgedvhedvieehfeetkedvfefgkeetvdenucffohhmrghinh
    epuhgvfhhirdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
    homhdpnhgspghrtghpthhtohepuddvpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegrlhgvjhgrnhgurhhordhgrghrtghirghvrghllhgvjhhosegrmhgurdgtohhmpdhrtg
    hpthhtohepghgvrhgrlhgurdgvlhguvghrqdhvrghsshestghlohhuugdrtghomhdprhgt
    phhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
    dprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtgho
    mhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthhtoheprg
    hnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhht
    hhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrg
    hlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdho
    rhhg
X-ME-Proxy: <xmx:BC7VaPwFoVSs6_bEyqKuUG_RrvYvKWm12HrGjyQlDwnBp564pQIwHQ>
    <xmx:BC7VaBsC2YkEfEQ9Q8N3bJejrd2u7jX9aJBgI4lx6UdLZmFOrvMxnA>
    <xmx:BC7VaA2mmFYVMNegZnXFbhec21IdF0cocQjYd_Zy64Xd312Eouhg1A>
    <xmx:BC7VaBCDGtudI8XoA3IWiLpq3shEHQbXrvhoSW5UqtUwmYNh4n0XGQ>
    <xmx:BS7VaJq6iaDA1IYlgvpMfGsG-26wcdd44-99jN4wVy44-UMxxHfRlzkq>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 25 Sep 2025 13:56:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 2/3] efi: Protect against unnecessary image unloading
Message-ID: <aNUuAYB-XzRxaT4v@mail-itl>
References: <cover.1757519202.git.gerald.elder-vass@cloud.com>
 <1f7b5737d4b36623af2734d525c895b77fef08fc.1757519202.git.gerald.elder-vass@cloud.com>
 <DCQ56M1S1EH6.ASTCL1OINQWY@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O4Zuhw5ZLN64wCwi"
Content-Disposition: inline
In-Reply-To: <DCQ56M1S1EH6.ASTCL1OINQWY@amd.com>


--O4Zuhw5ZLN64wCwi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Sep 2025 13:56:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Xen-devel <xen-devel@lists.xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Xen-devel <xen-devel-bounces@lists.xenproject.org>
Subject: Re: [PATCH 2/3] efi: Protect against unnecessary image unloading

On Thu, Sep 11, 2025 at 07:20:33PM +0200, Alejandro Vallejo wrote:
> On Thu Sep 11, 2025 at 10:24 AM CEST, Gerald Elder-Vass wrote:
> > Commit 59a1d6d3ea1e introduced Shim's LoadImage protocol and unloads the
> > image after loading it (for verification purposes) regardless of the
> > returned status. The protocol API implies this is the correct behaviour
> > but we should add a check to protect against the unlikely case this
> > frees any memory in use.
>=20
> Any what memory in use? The function loads an image, it's not a consumer.
>=20
> It can't free anything because it doesn't know where it came from. It mig=
ht've
> been embedded in your own binary, and it can't compromise its integrity l=
ike
> that.
>=20
> >
> > Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> > ---
> > CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> > CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> > CC: Jan Beulich <jbeulich@suse.com>
> > CC: Andrew Cooper <andrew.cooper3@citrix.com>
> > CC: Anthony PERARD <anthony.perard@vates.tech>
> > CC: Michal Orzel <michal.orzel@amd.com>
> > CC: Julien Grall <julien@xen.org>
> > CC: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> > CC: Stefano Stabellini <sstabellini@kernel.org>
> > ---
> >  xen/common/efi/boot.c | 11 ++++++-----
> >  1 file changed, 6 insertions(+), 5 deletions(-)
> >
> > diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> > index 69fc022c18ab..ca162db0d8d3 100644
> > --- a/xen/common/efi/boot.c
> > +++ b/xen/common/efi/boot.c
> > @@ -1062,7 +1062,7 @@ static void __init efi_verify_kernel(EFI_HANDLE I=
mageHandle)
> >      static EFI_GUID __initdata shim_image_guid =3D SHIM_IMAGE_LOADER_G=
UID;
> >      static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_G=
UID;
> >      SHIM_IMAGE_LOADER *shim_loader;
> > -    EFI_HANDLE loaded_kernel;
> > +    EFI_HANDLE loaded_kernel =3D NULL;
>=20
> This isn't required if unloading checks for the success case or the only =
error case
> that has a successful load. See below.
>=20
> Furthermore, you don't really know if the callee clobbered it.
>=20
> >      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> >      EFI_STATUS status;
> >      bool verified =3D false;
> > @@ -1078,11 +1078,12 @@ static void __init efi_verify_kernel(EFI_HANDLE=
 ImageHandle)
> >              verified =3D true;
> > =20
> >          /*
> > -         * Always unload the image.  We only needed LoadImage() to per=
form
> > -         * verification anyway, and in the case of a failure there may=
 still
> > -         * be cleanup needing to be performed.
> > +         * If the kernel was loaded, unload it. We only needed LoadIma=
ge() to
> > +         * perform verification anyway, and in the case of a failure t=
here may
> > +         * still be cleanup needing to be performed.
> >           */
> > -        shim_loader->UnloadImage(loaded_kernel);
> > +        if ( loaded_kernel )
>=20
> Not sure this is what you want. The image needs unloading only when there=
's no
> error OR the error is EFI_SECURITY_VIOLATION. See section 7.4.1:
>=20
> https://uefi.org/specs/UEFI/2.11/07_Services_Boot_Services.html#efi-boot-=
services-loadimage
>=20
> ... and shim being a drop-in replacement, it's meant to be spec-compliant.
>=20
> Trying to unload based on the assumption that loaded_image will remain un=
disturbed is
> an assumption waiting to be broken.
>=20
> IMO, this wants to be instead:
>=20
>   if ( !EFI_ERROR(status) || (status =3D=3D EFI_SECURITY_VIOLATION) )
>       // unload

I agree, this version would be better.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--O4Zuhw5ZLN64wCwi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjVLgAACgkQ24/THMrX
1ywxmQf/SjhzScRx9o9ZI/dlYVm14fUlIrw4U+y4u92wFEm++l7fuphwAAiM1DxR
4hVH/2EAwuVzLIdEFOBb0SGPfb7+5LwhKDeb5QxPpDW6P8f6/LKLHKp23k5nWW31
c1M3V7yFRoOOkhsQnoigxkkfXjza6igocxw6xXs0LYRaEoW1II/qKZQHbZBz3yWu
UBroXr70pBZ2Yu1R8+wqMN+i8EaaSWSSS8DaV2gaAVW+uhS0mEwPzMoETQKxO/ON
WQ+AXpEkqztvOtSaAY4yI3mdGSWbXySL2m8rZndPK3zDmiFXHpXSwz8tSVI8/n/7
C1TzpEpPx1gH2KcRpk00VuZX+s7sGQ==
=3Rs7
-----END PGP SIGNATURE-----

--O4Zuhw5ZLN64wCwi--

