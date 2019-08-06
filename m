Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F0831BD
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 14:47:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huyop-0001qS-5u; Tue, 06 Aug 2019 12:43:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G5oG=WC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1huyon-0001qN-V2
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 12:43:58 +0000
X-Inumbo-ID: da879af6-b847-11e9-8980-bc764e045a96
Received: from new2-smtp.messagingengine.com (unknown [66.111.4.224])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id da879af6-b847-11e9-8980-bc764e045a96;
 Tue, 06 Aug 2019 12:43:56 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id BE3E11D0B;
 Tue,  6 Aug 2019 08:43:55 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 06 Aug 2019 08:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=ccBLzL
 DtxrytI7wgKCF++YxweyfWudJPl72RJc2/Q1Q=; b=pTD8dD1aATl9KV31ltW/Wo
 64d7tzYfRVKVBjlx4eB8sTFCsQc9nwV6FLXYFlED3ZVOoyDlxnxvhftaX7N3CrVM
 tg14PYY78XLWyxf5dJj2/O+HSa9W8E7HStnEfwgwCvRJpMP5I0pYyN4PsabEaj8f
 VQ3RcD8mRvorCfTQyl1gkVvEUQquW1BLEDkx1rCPIFv1tekYu0JWQyrXIAQd4lDU
 AtQIgj5c2d5JfBB6EpY1hichE3H+vkGZgrac10TEAFqda3iMbNJ1+M0crBKxFhms
 GlaYqDmkAJ0qjYnXPdunBEEA5CQQXUsrjfDjKLNaIA8CDINT4LUJxvvcDT1LcQNg
 ==
X-ME-Sender: <xms:CnZJXSV6Y8aWwYMnDeMAWgR-E6q5j2kJU1gyZBF11jsDFCCYBv8rWA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddutddgheehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffhomhgrihhnpeigvghnphhr
 ohhjvggtthdrohhrghenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrg
 hilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
 tghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:CnZJXabf-jTBv2kwJ1iLXjvLECmVmBnUg3k4dPxYvHJJ5pOhAj9Reg>
 <xmx:CnZJXc2BLzAbHTdRZAuMqg5zjhdIGAZsPNdAnLIHSd6706tQoooaeA>
 <xmx:CnZJXWB3_zXw6IoyFuBBsPUup7de0bE1ylzG5Wv9675XCseeSV61rw>
 <xmx:C3ZJXeppzZ3BDZv7M8qCDtQWaYCHNF0jOIjSEOvVDOFN_c4TRb7HZA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 685C7380094;
 Tue,  6 Aug 2019 08:43:52 -0400 (EDT)
Date: Tue, 6 Aug 2019 14:43:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190806124349.GI1250@mail-itl>
References: <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
 <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
 <20190805134424.GJ1549@mail-itl>
 <c16737dc-f5f1-45f7-e743-970016820aab@suse.com>
 <20190806094601.GG1250@mail-itl>
 <b62dcc6f-7239-b3a2-9c8b-bec931ee023c@suse.com>
 <20190806105317.GH1250@mail-itl>
 <d9021dde-efa3-1ba8-bb63-98e99d424a32@suse.com>
MIME-Version: 1.0
In-Reply-To: <d9021dde-efa3-1ba8-bb63-98e99d424a32@suse.com>
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
Content-Type: multipart/mixed; boundary="===============7852662398187491294=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7852662398187491294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Q+W+CH9ft+eKPnpy"
Content-Disposition: inline


--Q+W+CH9ft+eKPnpy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2019 at 02:05:48PM +0200, Jan Beulich wrote:
> On 06.08.2019 12:53, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Tue, Aug 06, 2019 at 12:33:39PM +0200, Jan Beulich wrote:
> > > On 06.08.2019 11:46, Marek Marczykowski-G=C3=B3recki  wrote:
> > > > On Tue, Aug 06, 2019 at 07:56:39AM +0000, Jan Beulich wrote:
> > > > > On 05.08.2019 15:44, Marek Marczykowski-G=C3=B3recki  wrote:
> > > > > > I'm trying to get it working and it isn't clear to me what shou=
ld I
> > > > > > check for "INTx is also enabled". I assumed PCI_COMMAND_INTX_DI=
SABLE
> > > > > > bit, but it looks like guest has no control over this bit, even=
 in
> > > > > > permissive mode.  This means enabling MSI(-X) always fails beca=
use guest
> > > > > > has no way to set PCI_COMMAND_INTX_DISABLE bit before.
> > > > >=20
> > > > > Well, the guest has no control, but in order to enable MSI{,-X} I=
'd
> > > > > have expected qemu or the Dom0 kernel to set this bit up front.
> > > >=20
> > > > qemu would do that, when running in dom0. But in PV stubdomain it t=
alks
> > > > to pciback, which filters it out.
> > >=20
> > > Filtering out the guest attempt is fine, but it should then set the
> > > bit while preparing MSI/MSI-X for the guest. (I'm not sure it would
> > > need to do so explicitly, or whether it couldn't rely on code
> > > elsewhere in the kernel doing so.)
> > ...
> > > Well, I think I've made my position clear: So far we use pci_intx()
> > > only on devices used by Xen itself. I think this should remain to be
> > > that way. Devices in possession of domains (including Dom0) should
> > > be under Dom0's control in this regard.
> >=20
> > The thing is, in case of using stubdomain, it's mostly stubdomain
> > handling it. Especially all the config space interception and applying
> > logic to it is done by qemu in stubdomain. Do you suggest duplicating /
> > moving that part to dom0 instead? What would be the point for stubdomain
> > then?
>=20
> Nothing should be moved between components if possible (and if placed
> sensibly). But isn't stubdom (being a PV DomU) relying on pciback in
> Dom0 anyway? And hence doesn't the flow of events include
> pci_enable_msi{,x}() invoked by pciback? I'd have expected that to
> (also) take care of INTx.

This was discussed in v2 of this series[1], where you also responded.
Relevant part of Roger's email:

    Oh great, that's unfortunate. Both pciback functions end up calling
    into msi_capability_init in the Linux kernel, which does indeed more
    than just toggling the PCI config space enable bit.

    OTOH adding a bypass to pciback so the stubdom is able to write to the
    PCI register in order to toggle the enable bit seems quite clumsy. Not
    to mention that you would be required to update Dom0 kernel in order to
    fix the issue.

    Do you think it makes sense to add a domctl to enable/disable MSI(X)?

    This way the bug could be fixed by just updating Xen (and the
    stubdomain).

[1] https://lists.xenproject.org/archives/html/xen-devel/2019-01/msg01271.h=
tml

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--Q+W+CH9ft+eKPnpy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1JdgQACgkQ24/THMrX
1yzchQf+OTzHIpv0CpOj4wvVUifRe0hAXBN7yBWeGfXs+SBiTV79LPKnIbIRp8C2
l8/RLJnJsQc8gu5DcjnnEc5tFd702hkrY8gLDtp2ji3EyBULtNU7IHLfkgoc+DW2
AFn5shsN0Purfzpy0q3TqGCIntOEXuOdE/YByCZKtSfyGF8HVMEBnX0kGnxw+q32
l+lnQ4Vep0AaNVgnJFcdRw4OBxbssoj8B2uw68DPCgplVowKoHd1h98bPYe3TibG
XxVm7UDIdyu4A+qfzkYW6vra3xrpzbBRjeXxWZDzWPeyTZcXQnDvQsyLMUTloyBb
h1RqD/8QoJtm9ZBPqsxhfdkwYpYwyA==
=PLPG
-----END PGP SIGNATURE-----

--Q+W+CH9ft+eKPnpy--


--===============7852662398187491294==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7852662398187491294==--

