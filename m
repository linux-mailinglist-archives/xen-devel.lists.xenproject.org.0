Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1B31262C6
	for <lists+xen-devel@lfdr.de>; Thu, 19 Dec 2019 14:00:56 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihvMv-0006N4-N8; Thu, 19 Dec 2019 12:57:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qt5P=2J=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ihvMu-0006Mz-PS
 for xen-devel@lists.xenproject.org; Thu, 19 Dec 2019 12:57:29 +0000
X-Inumbo-ID: 17509fea-225f-11ea-a914-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 17509fea-225f-11ea-a914-bc764e2007e4;
 Thu, 19 Dec 2019 12:57:20 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 915335F2;
 Thu, 19 Dec 2019 07:57:18 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 19 Dec 2019 07:57:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eR/Pmc
 P3bQk1KT9Fv/nt7QdlQoB3fl3IxnvuMZlbLD8=; b=tDA+RhaNwZyvVPXukcGg+S
 ZtiJk34oASmk3VwHnTGJYHRwnqPNP/i7G+hbpGXehIICN2urKoz6eMVHN0fy3A0B
 rT90xiCM7cqocXRWqaV6yPxcHU2HjSlh/PXNud9z3XVADcjLJwNtvpXfWI8aUuAd
 tHKjDWwg1Qly696SPwBlNthFjS4SwJuWJHr9Z9FMVdoST5iPOs3bA9QJCXkjHN5N
 8vi2f2Se1gU971GYRtCgWerlOEby9ub7tRV1Lug0CHXgSAnPEnUvAi5nIL2AB84c
 HTd0eRbBfeWSKVb8f5hQ0c9uQmBPamC8OhS0AG1aMSk40l/MvpvqmNVBLLyI5dbw
 ==
X-ME-Sender: <xms:rXP7XRbeyp7Qwbk_BygmIHgrLFSMrI7zGP6gcz1rzjFImywq0ZZoNg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdduuddggeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:rXP7XZ590TX1tFKn-_DHkJ9rqOro_f_Cl69Y3WCntxnVyEC2oWDBsw>
 <xmx:rXP7XUAtzCeQA8K3-HmK8aR8_3oeuBBvqjoQawJ1ZqXWIdPJLF7x0A>
 <xmx:rXP7Xfcdk50MaQE0TtG8ooI4PXRXKjUM8VcVoeZ_oBcYZqOmCrDvWw>
 <xmx:rnP7XZdU_GDb4mvZysqY_4CYbYqvazBoMoFiRMZWjhI0unAiDhnUPw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4CE5880061;
 Thu, 19 Dec 2019 07:57:16 -0500 (EST)
Date: Thu, 19 Dec 2019 13:57:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191219125713.GN25235@mail-itl>
References: <20191219034941.19141-1-marmarek@invisiblethingslab.com>
 <c0e27fbe-e2f7-22ca-c3f4-bafb252c7bcc@suse.com>
MIME-Version: 1.0
In-Reply-To: <c0e27fbe-e2f7-22ca-c3f4-bafb252c7bcc@suse.com>
Subject: Re: [Xen-devel] [PATCH v2] xen-pciback: optionally allow interrupt
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
 Simon Gaiser <simon@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5972267714247507168=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5972267714247507168==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="D9sZ58tf58331Q5M"
Content-Disposition: inline


--D9sZ58tf58331Q5M
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] xen-pciback: optionally allow interrupt enable flag
 writes

On Thu, Dec 19, 2019 at 12:20:24PM +0100, Jan Beulich wrote:
> On 19.12.2019 04:49, Marek Marczykowski-G=C3=B3recki  wrote:
> > +enum interrupt_type xen_pcibk_get_interrupt_type(struct pci_dev *dev)
> > +{
> > +	int err;
> > +	u16 val;
> > +
> > +	err =3D pci_read_config_word(dev, PCI_COMMAND, &val);
> > +	if (err)
> > +		return INTERRUPT_TYPE_ERR;
> > +	if (!(val & PCI_COMMAND_INTX_DISABLE))
> > +		return INTERRUPT_TYPE_INTX;
> > +
> > +	/* Do not trust dev->msi(x)_enabled here, as enabling could be done
> > +	 * bypassing the pci_*msi* functions, by the qemu.
> > +	 */
>=20
> Judging from this comment, how can you assume only one of the
> three variants is actually enabled? It's against the spec, yes,
> but it's not at all impossible afaict. I think you want the
> return value here to be
> - negative errno values (no need to discard the actual error
>   codes) or
> - a non-negative bitmap indicating which of the interrupt types
>   is/are currently enabled.

Good idea, I'll change that.

> That way ...
>=20
> > +static int msi_msix_flags_write(struct pci_dev *dev, int offset, u16 n=
ew_value,
> > +				void *data)
> > +{
> > +	int err;
> > +	u16 old_value;
> > +	const struct msi_msix_field_config *field_config =3D data;
> > +	const struct xen_pcibk_dev_data *dev_data =3D pci_get_drvdata(dev);
> > +
> > +	if (xen_pcibk_permissive || dev_data->permissive)
> > +		goto write;
> > +
> > +	err =3D pci_read_config_word(dev, offset, &old_value);
> > +	if (err)
> > +		return err;
> > +
> > +	if (new_value =3D=3D old_value)
> > +		return 0;
> > +
> > +	if (!dev_data->allow_interrupt_control ||
> > +	    (new_value ^ old_value) & ~field_config->enable_bit)
> > +		return PCIBIOS_SET_FAILED;
> > +
> > +	if (new_value & field_config->enable_bit) {
> > +		/* don't allow enabling together with other interrupt types */
> > +		const enum interrupt_type int_type =3D xen_pcibk_get_interrupt_type(=
dev);
> > +		if (int_type =3D=3D INTERRUPT_TYPE_NONE ||
> > +		    int_type =3D=3D field_config->int_type)
>=20
> ... equality comparisons like this one will actually become safe.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--D9sZ58tf58331Q5M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl37c6oACgkQ24/THMrX
1yx2tQf/XZes/aHUFlMPeDhciYxLI4xPYvF0dQuJgQsY4ffyPZUERevQ8NaEJmDd
8rMXFRVKzhmjjr+zeRtaiH+qdUKttLuSgPE6ezsiP2kNSQ2iATacV61mPT4q1REr
YzqFUQOVUQpl9StWWwbyTpsOA2yiwhkDQKpBmVSRHmhR7YZ+R2LX4+yvGAAvP3sd
svvdTkOs8WJCDJig4gCv6vqZy5bBZfDd7Azn/IXc8rvOU2HKSTMsvqz+fHKL57YG
bGnGb9vTIeShWk5dHmn5JhkEXGNHqKuhuYrGI2EBEpyXepgA2K1YZn0A8iY5hX5j
3A89KK+cJrDjUY/uZvjG8H0lBcRVcA==
=SMFN
-----END PGP SIGNATURE-----

--D9sZ58tf58331Q5M--


--===============5972267714247507168==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5972267714247507168==--

