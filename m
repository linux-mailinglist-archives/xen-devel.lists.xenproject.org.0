Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A61B40887
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 17:07:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1106946.1457550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSbB-0008Mf-7R; Tue, 02 Sep 2025 15:07:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1106946.1457550; Tue, 02 Sep 2025 15:07:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utSbB-0008JW-4U; Tue, 02 Sep 2025 15:07:05 +0000
Received: by outflank-mailman (input) for mailman id 1106946;
 Tue, 02 Sep 2025 15:07:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pCgk=3N=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1utSb9-00084u-FO
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 15:07:03 +0000
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7961e084-880e-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 17:07:00 +0200 (CEST)
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
 by mailfout.stl.internal (Postfix) with ESMTP id E164D1D0003A;
 Tue,  2 Sep 2025 11:06:58 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-12.internal (MEProxy); Tue, 02 Sep 2025 11:06:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Sep 2025 11:06:56 -0400 (EDT)
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
X-Inumbo-ID: 7961e084-880e-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1756825618;
	 x=1756912018; bh=yfqYL+PBKmmYIwNFYiESmGThgwEExBob7KGrn14byxE=; b=
	jVSWydQ/o6OLvlke6vChxYFhSLZFdeIFXRTLLb6ba4TSRHOla4X06BogtHXrguB0
	o/ei1EmaszBUocGoF1dAj8yY1rDltDslIMOm6pPKBU/Q5FO00pjYoP1bX39iXfqz
	Pohs4ugmC65ZBqHpNzKVCX48IgJc/AtqV10eaJUTwCRqVnPZOHDopssoHgT0OkN5
	6EzkzDmibdZ5QHaZ+XN3cpxytI00IHruLEV0MYr+w582o9TTgyH/5Wvj6O7+rmwz
	zE9PqviBHXHOxsg658KVBVMtBQwJ6WcckynryOR4kZEZaURXo4N3ziAE+UzJifUZ
	p/qvrDetX204TJjDlzo9xQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756825618; x=1756912018; bh=yfqYL+PBKmmYIwNFYiESmGThgwEExBob7KG
	rn14byxE=; b=AARCB/maEAmBWKVh47Ms7Y73sqYnK/zHLYEyEjXjsjjiWRZz8G8
	SNnUNQz7rAWXqAP8P31YTgyFoGxT9q7BXRfeTnpp89evComAOkc7hv4hHn97cmVS
	QRDiwYDtbK85BsvZxjqOeqsPkut6lBxKL0q8b46cWncIe8FkJ4wAN2lE/qqnv9i3
	Y/BFZvczqodor7dL0WahYYICWZFGWNz/uFF/UTRQpXmpA3Bjqbv7+iQFiMchMimN
	P1RrLgbfbLKq8F1Qzi4Sdey8rcPqrb9YY+sSB749cO0LGpsDz3mukLK8UPflPFb+
	4uqP1NZGABLA0frVzHL7FdBUuB+OGL6PzQA==
X-ME-Sender: <xms:Egi3aB4-7XWhobkLKTDlulMoDHp40V4QccJpJSxtrPmAycTs3sf2Rw>
    <xme:Egi3aOko9Swh5R6XpA7rLYFUFoAg6te52ojdz8vVuv68jiG3WuIAnTmr80tgIKOZG
    FM6CuQkinfEDw>
X-ME-Received: <xmr:Egi3aEFHaI7YdI6SKF2fbh9g_BdXTQ7PVuQc4zW5WuPR5JLgHTpeGLJn_pRiciag_yj-Y8ZmCtpWFJ8VacWlcky0TH5BalAEaqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucforghr
    tgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteefvefh
    feehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeduuddpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopehgvghrrghlugdrvghluggvrhdqvhgrshhssegtlhhouhgurdgtohhmpd
    hrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgt
    phhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpth
    htohepmhhitghhrghlrdhorhiivghlsegrmhgurdgtohhmpdhrtghpthhtohepjhhulhhi
    vghnseigvghnrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrd
    gtohhmpdhrtghpthhtohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepkhgvvhhinhdrlhgrmhhpihhssegtlhhouhgurdgtohhm
X-ME-Proxy: <xmx:Egi3aF8ApVc1-knb1EVssQ6OyLubOwyBmbsuAUghzJ5GTdu-w48dIg>
    <xmx:Egi3aFlVD0DeYOBdduu8P2eBhPvoSJH9FDI2DNsHAbB9hmm77kkTCw>
    <xmx:Egi3aABoDLnawE6PZqTVpTlACVi_UPmZjg4eIRj1Yst84F70YMlO4w>
    <xmx:Egi3aOWy6YyKMQDpTh8gF1-SkkXvzBSXfSdHct0Lz9G-Cr1B_UO4MA>
    <xmx:Egi3aO1jIrx-iDQ0JXFI51lucto9kf35Hd5f5S8qOuEm-kSqw5rLQvFc>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 2 Sep 2025 17:06:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] efi: Use Shim's LoadImage to verify the Dom0
 kernel
Message-ID: <aLcIDyO4Xfcfv_gD@mail-itl>
References: <7f2f88f0d857ed3f8d7e3fabe349a3b5d5815981.1756822290.git.gerald.elder-vass@cloud.com>
 <12dada9a-96eb-45db-bd1a-5a88e323a100@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I8OsBI9a2AT23IXC"
Content-Disposition: inline
In-Reply-To: <12dada9a-96eb-45db-bd1a-5a88e323a100@suse.com>


--I8OsBI9a2AT23IXC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 2 Sep 2025 17:06:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Gerald Elder-Vass <gerald.elder-vass@cloud.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [XEN PATCH v2] efi: Use Shim's LoadImage to verify the Dom0
 kernel

On Tue, Sep 02, 2025 at 05:00:52PM +0200, Jan Beulich wrote:
> On 02.09.2025 16:44, Gerald Elder-Vass wrote:
> > +        else
> > +        {
> > +            status =3D efi_bs->LocateProtocol(&shim_lock_guid, NULL, (=
void **)&shim_lock);
> > +            if ( EFI_ERROR(status) )
> > +                PrintErrMesg(L"Failed to locate SHIM_LOCK protocol", s=
tatus);
>=20
> This is a behavioral change not justified in the description. Imo, if
> the original code was wrong, that would want to be a separate change
> anyway, so right here you want to retain original behavior. Simply
> consider the case of a shim-free boot, where neither of the two
> protocols would be available.

Yes, as commented by Yann on v1, this change as is seems to break
shim-free boot (well, technically UKI is shim-free and remain working,
but you know what I mean). That needs to remain working, even if only in
SecureBoot-free case.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--I8OsBI9a2AT23IXC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi3CA8ACgkQ24/THMrX
1yyTYgf/UEaIwot3TP6biSclGrSbwmPHWwIgkUex9Cw82/xy8KPjxEai25KhUtoq
do06rU1hPQJ+c0MnhIb2A8Tbh5Zvf8ZoT68mX6vcD38fvLYt3ChiudZg/u5kDhXo
iwMWc6jgU+32+cqrLTXbPZ+b46AWqbKyiwsHQmndQf5h8Va/zybCm4G58kFl2/tp
4/gTfttwuA0+Wu1wVR1HufBvc5nMXQcMI0wYvBTQ/2BJDgMKoF5y3YELQPOdjzex
EyW7Wy/xw+7/CxwucqIwS9a1uytXu/brXaEG8jNO3GxlRRgXxv/uh3fDeV6ZrrNz
9VsNzEq72FnyaVIl23a5hD0et25Qdg==
=J25Q
-----END PGP SIGNATURE-----

--I8OsBI9a2AT23IXC--

