Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A31139BC7
	for <lists+xen-devel@lfdr.de>; Mon, 13 Jan 2020 22:42:28 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ir7Qs-00077m-Tt; Mon, 13 Jan 2020 21:39:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RLTp=3C=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ir7Qr-00077h-Fz
 for xen-devel@lists.xenproject.org; Mon, 13 Jan 2020 21:39:33 +0000
X-Inumbo-ID: 2ad7d284-364d-11ea-b89f-bc764e2007e4
Received: from out5-smtp.messagingengine.com (unknown [66.111.4.29])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ad7d284-364d-11ea-b89f-bc764e2007e4;
 Mon, 13 Jan 2020 21:39:24 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8128322381;
 Mon, 13 Jan 2020 16:39:24 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 13 Jan 2020 16:39:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=sRsJAg
 8ZUGuoEr5eig5Q2wKujidhSajKzfN34M/sB2I=; b=ydAJaAstkfI+YKCCNwYi8U
 CxFyVEpIAsoMkex7qaq8O9Wsq2N3KdhcwMKarx9IstyMVN03hSOTLzABp2mvnzSO
 vbgc/4k86evr4YW57FsQnononccYTbQGVcpACfvzsboWx9bdPeYTelDvv2gCGC2s
 qgZWnyCQT4DI2YsPYDIsJgsGnmk+DcRzGuh1IozOX73t8lCg/OtxO1cYj3Hd1ZDn
 bRAoC889OPj1/ygjI0zaUVcDCgKn8/cAnFC/THfjmcie1fkR0gmm3227UNOuQTz4
 hQoIMjsKXuliUgS4l0dLGQWoGxgsEg01EP2J84HpS5XRdOGF/n2TJbrbyfw2dJqQ
 ==
X-ME-Sender: <xms:i-McXvqzGVyxAJkFSbnYi99jLm_q2xrRDCIxJu-gSDyx7ymIeidpWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdejtddgudeglecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:i-McXqYMkmvCfnU-W6BEzl5iTjGjD6pG-NHgakIQ7_9KGwLduk6I9Q>
 <xmx:i-McXoWlxDCmZhv4BxK3KyUywBI0WZt_N5OGugtlEI0xo4S3uRqYkw>
 <xmx:i-McXj9uFGuclEjqdD5uHKQmY_77k0znT0WxUBPSETJlLvdPwAV4tg>
 <xmx:jOMcXjYKzIvuyi6aSvYyEDULbH4CGEdb9MBf9ZAjYs8hckIOyZ8kAg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 676CC80063;
 Mon, 13 Jan 2020 16:39:22 -0500 (EST)
Date: Mon, 13 Jan 2020 22:39:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Message-ID: <20200113213917.GD1314@mail-itl>
References: <20200111034347.5270-1-marmarek@invisiblethingslab.com>
 <9ea42829-6a1a-09eb-9d59-67a0487980b6@oracle.com>
MIME-Version: 1.0
In-Reply-To: <9ea42829-6a1a-09eb-9d59-67a0487980b6@oracle.com>
Subject: Re: [Xen-devel] [PATCH v3] xen-pciback: optionally allow interrupt
 enable flag writes
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
Cc: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 YueHaibing <yuehaibing@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Simon Gaiser <simon@invisiblethingslab.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1019963773218143203=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1019963773218143203==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6nSyB+bcl/pT7+kx"
Content-Disposition: inline


--6nSyB+bcl/pT7+kx
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] xen-pciback: optionally allow interrupt enable flag
 writes

On Mon, Jan 13, 2020 at 04:25:02PM -0500, Boris Ostrovsky wrote:
>=20
>=20
> On 1/10/20 10:43 PM, Marek Marczykowski-G=C3=B3recki wrote:
> > @@ -117,6 +117,24 @@ static int command_write(struct pci_dev *dev, int =
offset, u16 value, void *data)
> >   		pci_clear_mwi(dev);
> >   	}
> > +	if (dev_data && dev_data->allow_interrupt_control) {
> > +		if ((cmd->val ^ val) & PCI_COMMAND_INTX_DISABLE) {
> > +			if (value & PCI_COMMAND_INTX_DISABLE) {
> > +				pci_intx(dev, 0);
> > +			} else {
> > +				/* Do not allow enabling INTx together with MSI or MSI-X. */
> > +				switch (xen_pcibk_get_interrupt_type(dev)) {
> > +				case INTERRUPT_TYPE_NONE:
> > +				case INTERRUPT_TYPE_INTX:
> > +					pci_intx(dev, 1);
>=20
> If INTERRUPT_TYPE_INTX , why call pci_intx(1)?

Not needed indeed.

>=20
> (I think I asked this last time as well).
>=20
>=20
> -boris
>=20
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--6nSyB+bcl/pT7+kx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4c44YACgkQ24/THMrX
1yz3pwf/X/M+UeKPbeYyYWubauScH6sB8Rm5cDdkP9ytWSdbqBJQnZHtKjta+gh2
yydiIOmPlVtcQeEgt+0ReyzL8bulfWPne3rRaZFFJPWxTy4KT4009UKEMAe2Rkl9
QbL8JjpmIJdzps5JacX7cYB3zn9h+p+CzgI9GUpyq9BM1JjHGWsNyIzgj6Vhcq4V
n80vE9lOkUqFknyj44HVAj0AfvQ/9cB0MxalKveZB5fpc5qe8jlQwlP/6EluoEya
W9LqR7KJdnK72nHi2O1Ch7YTLtaxT6anCHtzuvmef8pBhkaWjudnTd90MkEVWaDz
VTuvQx2FgNnJEcekPCHg8ve+5/0z/A==
=SAeV
-----END PGP SIGNATURE-----

--6nSyB+bcl/pT7+kx--


--===============1019963773218143203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1019963773218143203==--

