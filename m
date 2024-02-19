Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094F285A1B5
	for <lists+xen-devel@lfdr.de>; Mon, 19 Feb 2024 12:14:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.682767.1061913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc1aY-00084Q-0K; Mon, 19 Feb 2024 11:13:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 682767.1061913; Mon, 19 Feb 2024 11:13:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rc1aX-00082B-Tl; Mon, 19 Feb 2024 11:13:33 +0000
Received: by outflank-mailman (input) for mailman id 682767;
 Mon, 19 Feb 2024 11:13:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DP9f=J4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rc1aW-000825-Bn
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2024 11:13:32 +0000
Received: from wfhigh1-smtp.messagingengine.com
 (wfhigh1-smtp.messagingengine.com [64.147.123.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7e1e7ee-cf17-11ee-98f5-efadbce2ee36;
 Mon, 19 Feb 2024 12:13:29 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailfhigh.west.internal (Postfix) with ESMTP id DD1B0180006E;
 Mon, 19 Feb 2024 06:13:25 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 19 Feb 2024 06:13:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Feb 2024 06:13:23 -0500 (EST)
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
X-Inumbo-ID: e7e1e7ee-cf17-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1708341205;
	 x=1708427605; bh=YV1OZ/13ji+yvYE/2Z7Ylqtj9sAs1WitQLDbBMED/jc=; b=
	T76nZuRRrrLBk5GwrS9nHrpk3Z+GX11Rj5ip+cqxbCz65TTMguJ+XZFTz2Hg2t1f
	xlRZjjCPfbd+IUb5fbodnUOMy13Nby+hhsu5YlndTl2ljs99JgD9YN+KXaUvfi6C
	kftCUxxkBxdZV6oC8w65Vj4V9VLzG6TI/Zie8+xKsdKzgIVZ/crEU68Jfsxg7p8Q
	bQkAt8u+dsKKumjDYhWXOJikjmd27xFBELgzqE/B+ULuHIS7z94Woi51pkWpQ7v8
	sYRz3Cr8st5xEOCJz/RA1pravLtOVP+CG/xsFu+jD8U76u+PQwg+SQTgyMNeIGlk
	jokBmHwJbjlPqCHNEG+vag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1708341205; x=1708427605; bh=YV1OZ/13ji+yvYE/2Z7Ylqtj9sAs
	1WitQLDbBMED/jc=; b=e3QvTleVRNgoEpioasp20JUmRu7xZ5baMwCYgER9ulvU
	2dOvNlo/A9n2Jwr7DZBA69D7LFqxuKA66ZsfyrjvIjWR8uUomGlnI2lZFZDCR43c
	Yd8l2LVNrVws4vNNsJZu6CPc4wCd6hgT5EhWowbKEdzpb/0IV/g7BmXZqfHTzS8j
	lpeazkxCHu08jgsiX6OM/QcxNjTxl3r0lfN3GIUwQ1s4WFQQM8lGw4WkJ2zZ0lCt
	01fG2eRk6bLCo6YnqVCmCilF7yFTzPYR86k0YRWQnehHuA/MkfGVZoAW+oOUDybP
	oVXrPFEka7NELZmnmDuoZfccOFIlzVOxIaqzy5XpxA==
X-ME-Sender: <xms:1DfTZVsV5_eQKjlK17znjzB4f8iFrf7gyG7do3O-YZ8qRZk2Y-SddA>
    <xme:1DfTZef1bQwIoH4pMj4IGofSneXZdomHs463ugyUfFcgSF6P1aBW62WdGnDtUopIv
    PiRvOHM24DU7g>
X-ME-Received: <xmr:1DfTZYyVExCKXNJcioXWBpfGHeg-_zlILLwWWpva1TzizmSioyy06r88FBE6CHTCrLtBDnS2m1nq59LMKk0tFHM36GzwRyYxdg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekgddvgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:1TfTZcPgpfqVkxlW2XqcD7dEdS1vXsy0Nt8lMuifrwDz8Jlh-gkyUw>
    <xmx:1TfTZV-pl0pWvQOnYY6lxehr70qCG5XSrLDZdWyoyEFnncMM83xBDA>
    <xmx:1TfTZcUTOQu4bg-duyJmhnishJvNRZT4M50FYaIQoltzB1nczHw7-g>
    <xmx:1TfTZVyHgDh0L9Uefr5YtdbONhNb0PKUrYFNt_6rbQSzmR6NLWdbycCa5iE>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 19 Feb 2024 12:13:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: add Asix AX99100 serial card
Message-ID: <ZdM30PNnmlkwW2ZG@mail-itl>
References: <20240218013431.274451-1-marmarek@invisiblethingslab.com>
 <7b60cf83-4d08-46ef-a937-911e42fd9e5d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q6sRfocV+a/6R/xc"
Content-Disposition: inline
In-Reply-To: <7b60cf83-4d08-46ef-a937-911e42fd9e5d@suse.com>


--Q6sRfocV+a/6R/xc
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Feb 2024 12:13:18 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] ns16550: add Asix AX99100 serial card

On Mon, Feb 19, 2024 at 09:57:49AM +0100, Jan Beulich wrote:
> On 18.02.2024 02:34, Marek Marczykowski-G=C3=B3recki wrote:
> > @@ -1170,6 +1177,11 @@ static const struct ns16550_config __initconst u=
art_config[] =3D
> >          .dev_id =3D 0x7adc,
> >          .param =3D param_intel_lpss
> >      },
> > +    {
> > +        .vendor_id =3D PCI_VENDOR_ID_ASIX,
> > +        .dev_id =3D 9100,
>=20
> As per Linux this is 0x9100.

Right... but then, maybe the patch isn't needed at all, as it does work
for me. Maybe what's needed instead is some other patch already in
staging. Initial attempt that did not work was with 4.17.something.
I guess setting the fifo size isn't that important.

> > +        .param =3D param_asix_ax99100
> > +    },
> >  };
> > =20
> >  static int __init
> > diff --git a/xen/include/xen/pci_ids.h b/xen/include/xen/pci_ids.h
> > index e798477a7e23..2a19f4ab7872 100644
> > --- a/xen/include/xen/pci_ids.h
> > +++ b/xen/include/xen/pci_ids.h
> > @@ -11,3 +11,5 @@
> >  #define PCI_VENDOR_ID_BROADCOM           0x14e4
> > =20
> >  #define PCI_VENDOR_ID_INTEL              0x8086
> > +
> > +#define PCI_VENDOR_ID_ASIX               0x125b
>=20
> Please insert such that numeric sorting is retained.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Q6sRfocV+a/6R/xc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXTN9AACgkQ24/THMrX
1yx19Qf+Pm0vIbG+tD/SXB+dhZBoJ3xa4DDVrUtP/qy7gztFY6G3Kw+ugkVQvON2
5qdQf14HzPiaLJyTTGTnw9NYx4KoxT3VIGNhdx2qCMCgz25jGoNVXSTjsVibweJM
vQPT1iTdJbnrUEUAFBTtAhpmUvSF1XZmKI3q6wPg7uvQbNWOSGE1HY9PGUlPrExP
a1Al2UsmWxNyeXypgcLZkEZh/8bJqOdBtkRrpLatLTN8/STy4+pSzYdlP6hAf8GT
/rrYt/6mZruhXW+pIIftN+qO6LOGekMdqZ1EOFXZrWSZWEGBtsjSZuoZXeKbtz8P
vVHwCUyPKM+YIrbtbgPPQG/kQ6x1WQ==
=9bWI
-----END PGP SIGNATURE-----

--Q6sRfocV+a/6R/xc--

