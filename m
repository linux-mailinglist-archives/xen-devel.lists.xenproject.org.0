Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C62A68302F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 12:58:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hux5v-0002Yn-Fi; Tue, 06 Aug 2019 10:53:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=G5oG=WC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hux5t-0002Yi-Sr
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 10:53:30 +0000
X-Inumbo-ID: 6a87c2e2-b838-11e9-b4b5-8bc3668b18cc
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6a87c2e2-b838-11e9-b4b5-8bc3668b18cc;
 Tue, 06 Aug 2019 10:53:25 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5049E1599;
 Tue,  6 Aug 2019 06:53:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 06 Aug 2019 06:53:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=nQOin3
 x7MUNic5+4VL6c7LmVyAxq+WNySyLblWyM5aY=; b=gi5lg3MvaPLkAW6bk0e346
 +CVU3LQp09X/auLjulKZxUoYYKRvkcd047FR4LdF+obuLlSwn5lzkh/yZ+CVbcxa
 91HlcdFTx9hCLoP9uLOErRzRPHJ4HqwHd87OmPFcSn4GjfPReAwJhFfRRlWaA0y4
 qEzf9oycXC63IPN7WGvxcEdS7fZkaZnrBfIzn2e+ozdOIDgXvu82SMJqUOfSynZK
 M7UozqPeMykZI6Y9Y/csWT/YxMKHjC6qeX9fotueHahbNNUKPWutoPsPdPkxssBH
 8KDjmQ1jnE5b1jCKC8P/WFcqI/tfsscJ4RfR9JJb0RSziKw1PhJrKEcDvQdHpjRA
 ==
X-ME-Sender: <xms:I1xJXY02_zhk-kH3nrehK6af_20YJTYbKfc8WDYoh3fl3zPl7p_4lg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddruddutddgfeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:I1xJXaBFjDSvQBd_7dHO_lEaCCBUII9iK6F3qvGy6dS-6h8kZrt2FQ>
 <xmx:I1xJXV-3tgdDuFYOw-xMkHHZmsQyeJKoNlV9ZtQ-eIEFGvapsNquWQ>
 <xmx:I1xJXY-l1QMpvjAylytftntJhn_VoODnyuyqII6oCezo6icvtdLqXw>
 <xmx:JVxJXU9-2cpQJJdbRiUuIO5WSnPjjcPTf7pIp4eakN9RgjPmXPvw3w>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D0C00380091;
 Tue,  6 Aug 2019 06:53:21 -0400 (EDT)
Date: Tue, 6 Aug 2019 12:53:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190806105317.GH1250@mail-itl>
References: <20190718134604.owj6l4hk7rjq72es@Air-de-Roger.citrite.net>
 <9d0c36b7-97d3-5da8-c35b-7073c2066841@suse.com>
 <20190718165212.rj23yh5bphtc2cq5@Air-de-Roger.citrite.net>
 <f5ff77af-d2d5-1a89-06d4-6049f607ec80@suse.com>
 <20190719090202.vzeernrydawwnzan@Air-de-Roger.citrite.net>
 <b7d4e591-a5e3-94f1-6870-f0b6e7e9daf7@suse.com>
 <20190805134424.GJ1549@mail-itl>
 <c16737dc-f5f1-45f7-e743-970016820aab@suse.com>
 <20190806094601.GG1250@mail-itl>
 <b62dcc6f-7239-b3a2-9c8b-bec931ee023c@suse.com>
MIME-Version: 1.0
In-Reply-To: <b62dcc6f-7239-b3a2-9c8b-bec931ee023c@suse.com>
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
Content-Type: multipart/mixed; boundary="===============2224396132523088443=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2224396132523088443==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ao0agQACI2PjKWpV"
Content-Disposition: inline


--ao0agQACI2PjKWpV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 06, 2019 at 12:33:39PM +0200, Jan Beulich wrote:
> On 06.08.2019 11:46, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Tue, Aug 06, 2019 at 07:56:39AM +0000, Jan Beulich wrote:
> > > On 05.08.2019 15:44, Marek Marczykowski-G=C3=B3recki  wrote:
> > > > On Fri, Jul 19, 2019 at 09:43:26AM +0000, Jan Beulich wrote:
> > > > > On 19.07.2019 11:02, Roger Pau Monn=C3=A9  wrote:
> > > > > > On Fri, Jul 19, 2019 at 08:04:45AM +0000, Jan Beulich wrote:
> > > > > > > On 18.07.2019 18:52, Roger Pau Monn=C3=A9  wrote:
> > > > > > > > On Thu, Jul 18, 2019 at 03:17:27PM +0000, Jan Beulich wrote:
> > > > > > > > > On 18.07.2019 15:46, Roger Pau Monn=C3=A9  wrote:
> > > > > > > > > > In fact I don't think INTx should be enabled when MSI(-=
X) is disabled,
> > > > > > > > > > QEMU already traps writes to the command register, and =
it will manage
> > > > > > > > > > INTx enabling/disabling by itself. I think the only che=
ck required is
> > > > > > > > > > that MSI(-X) cannot be enabled if INTx is also enabled.=
 In the same
> > > > > > > > > > way both MSI caspabilities cannot be enabled simultaneo=
usly. The
> > > > > > > > > > function should not explicitly disable any of the other=
 capabilities,
> > > > > > > > > > and just return -EBUSY if the caller attempts for examp=
le to enable
> > > > > > > > > > MSI while INTx or MSI-X is enabled.
> > > > > > > > >=20
> > > > > > > > > You do realize that pci_intx() only ever gets called for =
Xen
> > > > > > > > > internally used interrupts, i.e. mainly the serial consol=
e one?
> > > > > > > >=20
> > > > > > > > You will have to bear with me because I'm not sure I unders=
tand why
> > > > > > > > it does matter. Do you mean to point out that dom0 is the o=
ne in full
> > > > > > > > control of INTx, and thus Xen shouldn't care of whether INT=
x and
> > > > > > > > MSI(-X) are enabled at the same time?
> > > > > > > >=20
> > > > > > > > I still think that at least a warning should be printed if =
a caller
> > > > > > > > tries to enable MSI(-X) while INTx is also enabled, but unl=
ess there's
> > > > > > > > a reason to have both MSI(-X) and INTx enabled at the same =
time (maybe
> > > > > > > > a quirk for some hardware issue?) it shouldn't be allowed o=
n this new
> > > > > > > > interface.
> > > > > > >=20
> > > > > > > I don't mind improvements to the current situation (i.e. such=
 a
> > > > > > > warning may indeed make sense); I merely stated how things cu=
rrently
> > > > > > > are. INTx treatment was completely left aside when MSI suppor=
t was
> > > > > > > introduced into Xen.
> > > > > >=20
> > > > > > In order to give Marek a more concise reply, would you agree to=
 return
> > > > > > -EBUSY (or some error code) and print a warning message if the =
caller
> > > > > > attempts to enable MSI(-X) while INTx is also enabled?
> > > > >=20
> > > > > As to returning an error - I think so, yes. I'm less sure about l=
ogging
> > > > > a message.
> > > >=20
> > > > I'm trying to get it working and it isn't clear to me what should I
> > > > check for "INTx is also enabled". I assumed PCI_COMMAND_INTX_DISABLE
> > > > bit, but it looks like guest has no control over this bit, even in
> > > > permissive mode.  This means enabling MSI(-X) always fails because =
guest
> > > > has no way to set PCI_COMMAND_INTX_DISABLE bit before.
> > >=20
> > > Well, the guest has no control, but in order to enable MSI{,-X} I'd
> > > have expected qemu or the Dom0 kernel to set this bit up front.
> >=20
> > qemu would do that, when running in dom0. But in PV stubdomain it talks
> > to pciback, which filters it out.
>=20
> Filtering out the guest attempt is fine, but it should then set the
> bit while preparing MSI/MSI-X for the guest. (I'm not sure it would
> need to do so explicitly, or whether it couldn't rely on code
> elsewhere in the kernel doing so.)
=2E..
> Well, I think I've made my position clear: So far we use pci_intx()
> only on devices used by Xen itself. I think this should remain to be
> that way. Devices in possession of domains (including Dom0) should
> be under Dom0's control in this regard.

The thing is, in case of using stubdomain, it's mostly stubdomain
handling it. Especially all the config space interception and applying
logic to it is done by qemu in stubdomain. Do you suggest duplicating /
moving that part to dom0 instead? What would be the point for stubdomain
then?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ao0agQACI2PjKWpV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1JXB4ACgkQ24/THMrX
1yx36QgAi+O8daFQNwH+z+XW4XDQ3MSu0ARDlbWwQNmmB5CPvzk9losxvXFp6lto
UvO4Mw9kESncZyA044Ew5rgGR96BuqC9ZVGtZTVzj7qRKbdC+QmhZwtmRjpfRvR3
HAB6d6rYONKQkJajrRuDJggOImtZin5cdgy2voj3L46QZmL6wfxw0Dgsm6WTVgRd
HyfmbTIG4IAXwEK4PrQR3wR7Fe4NFkDFxXsT4lv2W6hICq3eZdfV8f297BGOkH6c
NlhsMSl6/esn8giLnAFQXYdcdM9jLGZ6FNpfwHARbMmB03FgkggLR2cpS1YOeOCR
pEySdU4CQzu2kJFoSVWYL2zbjNe95Q==
=ZMLD
-----END PGP SIGNATURE-----

--ao0agQACI2PjKWpV--


--===============2224396132523088443==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2224396132523088443==--

