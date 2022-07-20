Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA8557BF1F
	for <lists+xen-devel@lfdr.de>; Wed, 20 Jul 2022 22:18:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.372298.604138 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEG92-00054c-4x; Wed, 20 Jul 2022 20:18:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 372298.604138; Wed, 20 Jul 2022 20:18:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oEG92-00052U-0d; Wed, 20 Jul 2022 20:18:08 +0000
Received: by outflank-mailman (input) for mailman id 372298;
 Wed, 20 Jul 2022 20:18:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kTCF=XZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oEG90-00052O-AX
 for xen-devel@lists.xenproject.org; Wed, 20 Jul 2022 20:18:06 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ea0037f-0869-11ed-bd2d-47488cf2e6aa;
 Wed, 20 Jul 2022 22:18:04 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 2D5F732005C1;
 Wed, 20 Jul 2022 16:18:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 20 Jul 2022 16:18:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Jul 2022 16:17:58 -0400 (EDT)
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
X-Inumbo-ID: 0ea0037f-0869-11ed-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1658348280; x=
	1658434680; bh=HVYsngPy5VNH6lbULNvEzsWa3kU3SKBpPH9qjsV1bAI=; b=x
	lZ/MtMo/5DywHqlZsbIPWtnvVukotEL0unwcvH0c+jle2bUHM38wRGQLe1/HYFjD
	8GZwLsIDb8Kx/0Bd82gayb37GNedFmdoNer0xZilVhPnsbIEzJZJxr4rIHGc0Bbr
	zzeyEXl290FSGaXEwyo8ofSLto+b6fPL2ocxUE93AvJ1zhGveeCTA8NzF325+x6s
	a3Ge9zIuy/6DNWo2qj1L59SHV/9bHA5KeSgao2qBvnzqfO+Rv0viRJ1CxGCO5C+2
	xBXlc6tSaIuNnMmUC2maWmLst5EEdgoPtvTBHpWevbsLpuUXZRyQcTsATlVY+EW7
	zzHJAxC0DBVQ1Lm0gmRxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1658348280; x=1658434680; bh=HVYsngPy5VNH6lbULNvEzsWa3kU3
	SKBpPH9qjsV1bAI=; b=x18k/06QPP3t/50/Nmzdg2WPjem/zCyhznGLS7ovr8VD
	bm0wUP8oz6CZ4FWtzFlvnkSohCbJAJkby679SQp2On1ZYm17YrUk6AeSZnOFr1ub
	a/cC/pHkdS4Uv5CkZOVQ5T50H/tmyfrkA3jjaLLyGTVzGu1AcOZRwCMtwEmJFFaN
	vMVEySfrJO2uvCu6Lyv8o6tLlO7/n1LM8DWtKQV/7CjnJN7WJZl85tUO/Ruiglpi
	KI4j5tGPeQ3R07fxocvEpIBhQMukEE9p8TMYrHzWv6QYkvCw5Bde1SweMT5cpxZ+
	3uyveiwas0l6ElAb6C2YmecwKwJVlHrNnlumfIZpvw==
X-ME-Sender: <xms:-GLYYglHRAuZ0VuCmPd27SqdDX4gmI5sUWVMH8Uzh-uqdwhp-Iayag>
    <xme:-GLYYv1wJrZaEa4aTUEPGZ7SAgOw3rLzMX2cFY5sDfti4O_1Z1k1ovA6-CVlGQsgB
    -Kao3LfBLv3Nw>
X-ME-Received: <xmr:-GLYYurBfZ6I7meMkV-E33V705AlBDEoFBgQMfFNIIRmOcm7keVibAnqceIsFjPcCv42DT3ob7Y98n3qcXjOtod6fRucsmOPqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudelvddgudehtdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:-GLYYsk4X2z2duaRiu8ZNDaSdRJCvBm4ruM7K9fcReEGTzjA24JQoA>
    <xmx:-GLYYu2HH5Xsk5R3azy9xc_xhMKClmmJ-cmJS_3vZNfhZhtRWUujnA>
    <xmx:-GLYYjtq7icsJ8yBFbbePOF9D97wAQkCVPL8SKkCEASx_dMB7lB92g>
    <xmx:-GLYYq-f7HngmYyb1xQyFB6kmkN-gXZfM-lTlOSrScrgng37R68hQA>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 20 Jul 2022 22:17:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 8/9] xue: mark DMA buffers as reserved for the device
Message-ID: <Ythi9BXeKwcdmiOO@mail-itl>
References: <cover.991b72d99d9e5bd4c2c76791ceb49f1056ce5d1c.1657121519.git-series.marmarek@invisiblethingslab.com>
 <0a30e15d9195d0cd09a5ea94297dc8a74bc12c97.1657121519.git-series.marmarek@invisiblethingslab.com>
 <a259bc09-710c-0c19-60c8-f7fa310357bc@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0bWZJS4AZ60thrwW"
Content-Disposition: inline
In-Reply-To: <a259bc09-710c-0c19-60c8-f7fa310357bc@suse.com>


--0bWZJS4AZ60thrwW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 Jul 2022 22:17:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Kevin Tian <kevin.tian@intel.com>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 8/9] xue: mark DMA buffers as reserved for the device

On Thu, Jul 14, 2022 at 01:51:06PM +0200, Jan Beulich wrote:
> On 06.07.2022 17:32, Marek Marczykowski-G=C3=B3recki wrote:
> > +    /*
> > +     * Don't place anything else on this page - it will be
> > +     * DMA-reachable by the USB controller.
> > +     */
> > +    char _pad[0] __aligned(XUE_PAGE_SIZE);
>=20
> I don't think this is needed, due to sizeof() being required to be
> a multiple of alignof().

I'd prefer to be explicit about this, because if some future change
breaks this property (makes alignment smaller than a page size), the
result will be pretty bad.

> > +};
> > +static struct xue_dma_bufs xue_dma_bufs __aligned(XUE_PAGE_SIZE);
>=20
> I don't think the alignment here is needed, as the struct will
> already have suitable alignment (derived from the biggest field
> alignment value). Instead please consider putting this in
> .bss.page_aligned.

Ok.

> > @@ -990,16 +999,22 @@ void __init xue_uart_init(void)
> >          xue->sbdf =3D PCI_SBDF(0, bus, slot, func);
> >      }
> > =20
> > -    xue->dbc_ctx =3D &ctx;
> > -    xue->dbc_erst =3D &erst;
> > -    xue->dbc_ering.trb =3D evt_trb;
> > -    xue->dbc_oring.trb =3D out_trb;
> > -    xue->dbc_iring.trb =3D in_trb;
> > -    xue->dbc_owork.buf =3D wrk_buf;
> > -    xue->dbc_str =3D str_buf;
> > +    xue->dbc_ctx =3D &xue_dma_bufs.ctx;
> > +    xue->dbc_erst =3D &xue_dma_bufs.erst;
> > +    xue->dbc_ering.trb =3D xue_dma_bufs.evt_trb;
> > +    xue->dbc_oring.trb =3D xue_dma_bufs.out_trb;
> > +    xue->dbc_iring.trb =3D xue_dma_bufs.in_trb;
> > +    xue->dbc_owork.buf =3D xue_dma_bufs.wrk_buf;
> > +    xue->dbc_str =3D xue_dma_bufs.str_buf;
> > =20
> >      if ( xue_open(xue) )
> > +    {
> > +        iommu_add_extra_reserved_device_memory(
> > +                PFN_DOWN(virt_to_maddr(&xue_dma_bufs)),
>=20
> virt_to_pfn()?

Doesn't exist. Did you mean virt_to_mfn()?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--0bWZJS4AZ60thrwW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLYYvQACgkQ24/THMrX
1yzCrQf+KvN50WPUxk1WKxBLMBLU9Y/jLp1Cq8vyIgKQKqomIRBkSq4wqgtuXDUM
NbOEvuDqrueDvs3l6bDaYLRhdFvZYyngKi+kn7AHUK0DlguP0Qq+ul5PRkPYzWN3
3FR05YYPeZR9muNh/mu6XZdVFwrhNOCTJ5WBLYyyFQux8btz/pnuXHLdqTeoqRnd
b8TXwLAMMA5Y8rrxPy5h9b02AxFjTircaw9bDVk7hKWJrP2tzYCGSGeuZGgHiwN3
/p0vm3hpGj1i6xr1/3XSWY5pjhS/yAK3nyYbS5dKLaVGdtsxDb8k3/oSdEfCw4HM
q/JupD1gQtWKCUopunCZffhLu4YC8w==
=CCfM
-----END PGP SIGNATURE-----

--0bWZJS4AZ60thrwW--

