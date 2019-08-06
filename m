Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0282F07
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 11:49:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huw2m-00061I-RA; Tue, 06 Aug 2019 09:46:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G5oG=WC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1huw2k-00061D-SF
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 09:46:11 +0000
X-Inumbo-ID: 046d024a-b82f-11e9-8980-bc764e045a96
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 046d024a-b82f-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 09:46:09 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id AB76B16B7;
 Tue,  6 Aug 2019 05:46:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 06 Aug 2019 05:46:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=gdOzlA
 v5spwvmN+dbYAQS4RYl4bVA+hxdgh3DUguyqQ=; b=LWmFZpSTyPkz0l28b2E0sc
 5ODin3LTdAanVSGPXVuyzlP4fbs+cy5i+NToz65d10tj31Yz4jSYTSoIohAoIwKg
 xdHijZhOuDlF1FiMc7feiY4shZYfZKgRvNINCgdnqMsvThzI76utcXHLbgf0n/iN
 agANy2ucnzt8cox4LiuZ2p5sWnTRNAAiKfBzKrIuCoKqzCIW/QttKEcT75crBSG6
 ZdLqbZk23817EkImGIrZ8Fiqu82WxxvqdMBr4+Qne7nV/76562tcKcETS1WrgGwP
 06Slr8sUSQLNh+PfIF7CjlOZicKLLI9yL/JdOS+cxMv80GTbgMqxldW2F1T7XLdg
 ==
X-ME-Sender: <xms:XkxJXfsiCOtXGJxWSdvrqcAG7ur06wZCHk-C79Hukz3Ytj3mMQmcag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddutddgudelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:XkxJXVU-GsjwZMVkyC375zkuMofMToWkGHLweNxmOqOzllRM0y9GZA>
 <xmx:XkxJXbUw1SZzmx9qgnpU4XLDuFAUvycZiWwOsmRuuoU4mgTEqGNhYQ>
 <xmx:XkxJXfepZ8v7_i76d0M1E54A4lfvzxDWRvP-NRyBKct3hVw-LRi69w>
 <xmx:YExJXShN3prjagC16ZAb7PBIYfK7Fehp2mxPBb8ADfnvpVgqdqEiog>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D44AF8005C;
 Tue,  6 Aug 2019 05:46:04 -0400 (EDT)
Date: Tue, 6 Aug 2019 11:46:01 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190806094601.GG1250@mail-itl>
References: <20190717101843.2nmigl4dt4kekuax@Air-de-Roger.citrite.net>
 <20190717235426.GX1250@mail-itl>
 <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
 <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
 <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
 <20190805134424.GJ1549@mail-itl>
 <c16737dc-f5f1-45f7-e743-970016820aab@suse.com>
MIME-Version: 1.0
In-Reply-To: <c16737dc-f5f1-45f7-e743-970016820aab@suse.com>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH v5 5/6] xen/x86: add PHYSDEVOP_msi_control
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 AndrewCooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, TimDeegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0998472458319103732=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0998472458319103732==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5yI2NvEZ36o0Huwo"
Content-Disposition: inline


--5yI2NvEZ36o0Huwo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2019 at 07:56:39AM +0000, Jan Beulich wrote:
> On 05.08.2019 15:44, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Fri, Jul 19, 2019 at 09:43:26AM +0000, Jan Beulich wrote:
> >> On 19.07.2019 11:02, Roger Pau Monn=C3=A9  wrote:
> >>> On Fri, Jul 19, 2019 at 08:04:45AM +0000, Jan Beulich wrote:
> >>>> On 18.07.2019 18:52, Roger Pau Monn=C3=A9  wrote:
> >>>>> On Thu, Jul 18, 2019 at 03:17:27PM +0000, Jan Beulich wrote:
> >>>>>> On 18.07.2019 15:46, Roger Pau Monn=C3=A9  wrote:
> >>>>>>> In fact I don't think INTx should be enabled when MSI(-X) is disa=
bled,
> >>>>>>> QEMU already traps writes to the command register, and it will ma=
nage
> >>>>>>> INTx enabling/disabling by itself. I think the only check require=
d is
> >>>>>>> that MSI(-X) cannot be enabled if INTx is also enabled. In the sa=
me
> >>>>>>> way both MSI caspabilities cannot be enabled simultaneously. The
> >>>>>>> function should not explicitly disable any of the other capabilit=
ies,
> >>>>>>> and just return -EBUSY if the caller attempts for example to enab=
le
> >>>>>>> MSI while INTx or MSI-X is enabled.
> >>>>>>
> >>>>>> You do realize that pci_intx() only ever gets called for Xen
> >>>>>> internally used interrupts, i.e. mainly the serial console one?
> >>>>>
> >>>>> You will have to bear with me because I'm not sure I understand why
> >>>>> it does matter. Do you mean to point out that dom0 is the one in fu=
ll
> >>>>> control of INTx, and thus Xen shouldn't care of whether INTx and
> >>>>> MSI(-X) are enabled at the same time?
> >>>>>
> >>>>> I still think that at least a warning should be printed if a caller
> >>>>> tries to enable MSI(-X) while INTx is also enabled, but unless ther=
e's
> >>>>> a reason to have both MSI(-X) and INTx enabled at the same time (ma=
ybe
> >>>>> a quirk for some hardware issue?) it shouldn't be allowed on this n=
ew
> >>>>> interface.
> >>>>
> >>>> I don't mind improvements to the current situation (i.e. such a
> >>>> warning may indeed make sense); I merely stated how things currently
> >>>> are. INTx treatment was completely left aside when MSI support was
> >>>> introduced into Xen.
> >>>
> >>> In order to give Marek a more concise reply, would you agree to return
> >>> -EBUSY (or some error code) and print a warning message if the caller
> >>> attempts to enable MSI(-X) while INTx is also enabled?
> >>
> >> As to returning an error - I think so, yes. I'm less sure about logging
> >> a message.
> >=20
> > I'm trying to get it working and it isn't clear to me what should I
> > check for "INTx is also enabled". I assumed PCI_COMMAND_INTX_DISABLE
> > bit, but it looks like guest has no control over this bit, even in
> > permissive mode.  This means enabling MSI(-X) always fails because guest
> > has no way to set PCI_COMMAND_INTX_DISABLE bit before.
>=20
> Well, the guest has no control, but in order to enable MSI{,-X} I'd
> have expected qemu or the Dom0 kernel to set this bit up front.=20

qemu would do that, when running in dom0. But in PV stubdomain it talks
to pciback, which filters it out.

> If
> that's not the case, then of course neither checking nor logging a
> message is appropriate at this point in time. It may be worthwhile
> calling out this anomaly then in the description.

Ok, so I'll go back to setting PCI_COMMAND_INTX_DISABLE instead of just
verification.

Just to clarify: should I also clear PCI_COMMAND_INTX_DISABLE when
disabling MSI? Now I think yes, because nothing else would do that
otherwise, but I would like to double check.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--5yI2NvEZ36o0Huwo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1JTFoACgkQ24/THMrX
1yzp6AgAkdWEsmgrzX0C9Eit8FegLM3n/nPK9VeStbbLfngPkuSJPQDI2GYPTbEf
kQeYnS7PYmHyTWReyvIxNFl13QerYkzJEXRmM2/lM+ANA/lxt9CaswW3o9XW5309
3kKRCrZeBcJ2vyioXFFa+ImPwdBnalAitVqZGKRmIchQJxsBuC9YLkHA3k8KHfX5
pliSMdqaramclU+lw1p9/V0ilbOa9RlQC0a8V2yzg1Psl7lREYNGnRonb0jFT3EH
aXKU7K4GTuTLtKAuJZ8JUxsNtffkWYeHJEcZa70fwPMj3u1v8lGdAEByM2I5Z6CK
kxPoQnwGkg6bwYXfU51crsHdYAF0KQ==
=/TLT
-----END PGP SIGNATURE-----

--5yI2NvEZ36o0Huwo--


--===============0998472458319103732==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0998472458319103732==--

