Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CD64D6023
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 11:52:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288969.490195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScsT-0003ZI-VL; Fri, 11 Mar 2022 10:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288969.490195; Fri, 11 Mar 2022 10:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nScsT-0003XR-Rs; Fri, 11 Mar 2022 10:52:09 +0000
Received: by outflank-mailman (input) for mailman id 288969;
 Fri, 11 Mar 2022 10:52:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3NWv=TW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nScsS-00036B-L9
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 10:52:08 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4af11c12-a129-11ec-853a-5f4723681683;
 Fri, 11 Mar 2022 11:52:07 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 239735C016D;
 Fri, 11 Mar 2022 05:52:06 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 11 Mar 2022 05:52:06 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 11 Mar 2022 05:52:04 -0500 (EST)
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
X-Inumbo-ID: 4af11c12-a129-11ec-853a-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CAoG9oHN8iIZCxSg/
	7uN6wFgpkb/G/E+2v0gqZ+qy0c=; b=E+rTaGPJqBxdvkwx0Pdb9unWEQvABI5Nh
	wFfsMl5H/VW+E3xZcaP8VrAL/S4hUjc51iZqOdfpPyNoHfic218r5XkV3T5iuCU6
	599tUM5GW1ZMvCDtewMe4ZvuAWcPg7KxZiYfebc08B2BEkPFZGqGJccExjNjKOUk
	BsVeDF/TxHNvXKyBi74PbhUwjnAWxOmCizrHI4qzw51tASzScX1MI624+4sGLoVN
	kHf//3v18SvW0ySyRXLV3JkOPscTSeLP8opjp26L8A1ey5Vm6FEGXbMHcB3P3QsP
	u28iPjtcLlTH0S6ArZf7GBlRer0xl3k/UtqW92UHffOXXjRMR+XMw==
X-ME-Sender: <xms:1SkrYhZH-5Y7F9Yz-UcaW75WCK0WeEYZEDwk_UFl1tPW-uEAGc9Dsw>
    <xme:1SkrYoYkGe_2o3aScjbbKZXPXA8u-1PtSdnW46DlSttEDtwvIThoRO419_N61zQnU
    kTxMtBb-SwPUA>
X-ME-Received: <xmr:1SkrYj9JbTuFQuup5zEt_-iQ_oo6XC407WewzX41UvmEK0-g20zk6NIofcdMjbu1UjzHb-PMZIa3ypZUWzXBFf2W-rUAsk0PWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvvddgudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:1SkrYvo1Tur6w7nfVbeMDn1fs2S_KvZ-tmpxEE4Mg1AKomS4zknefA>
    <xmx:1SkrYspbh9I-wqw4JhsnRSQGTWuElwHQ34fiX9W_8CqwoZ3Wxhijbg>
    <xmx:1SkrYlQtOItCqbN1HwALx8aaoqCWCimbcOkKklyLyP7P3g1BuNEeOA>
    <xmx:1ikrYhDmGt3Cx7AEDeWawjslZERPaNbTWjxqtbbeJ18JZvg6mYrn8A>
Date: Fri, 11 Mar 2022 11:52:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs
Message-ID: <Yisp0Q/cNGbgsO/7@mail-itl>
References: <20220310143403.50944-1-marmarek@invisiblethingslab.com>
 <7acb2915-5a9d-c1f1-4b7b-2bc6c2055ea3@suse.com>
 <YioddbNor6w/U9ed@Air-de-Roger>
 <53361d65-2bd8-c07b-938c-91b95f2d68ad@suse.com>
 <Yiojgxgd4amSjHog@Air-de-Roger>
 <3055b4a5-2d55-9cf1-1069-8c57208bf0af@xen.org>
 <YiopXU65pAlnNVNI@mail-itl>
 <d2c63630-6ab3-b4dd-128e-72f871fb9e08@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r+5BN2em9Kwd9k2b"
Content-Disposition: inline
In-Reply-To: <d2c63630-6ab3-b4dd-128e-72f871fb9e08@xen.org>


--r+5BN2em9Kwd9k2b
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Mar 2022 11:52:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/2] ns16550: reject IRQ above nr_irqs

On Fri, Mar 11, 2022 at 10:23:03AM +0000, Julien Grall wrote:
> Hi Marek,
>=20
> On 10/03/2022 16:37, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Mar 10, 2022 at 04:21:50PM +0000, Julien Grall wrote:
> > > Hi,
> > >=20
> > > On 10/03/2022 16:12, Roger Pau Monn=C3=A9 wrote:
> > > > On Thu, Mar 10, 2022 at 05:08:07PM +0100, Jan Beulich wrote:
> > > > > On 10.03.2022 16:47, Roger Pau Monn=C3=A9 wrote:
> > > > > > On Thu, Mar 10, 2022 at 04:23:00PM +0100, Jan Beulich wrote:
> > > > > > > On 10.03.2022 15:34, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > --- a/xen/drivers/char/ns16550.c
> > > > > > > > +++ b/xen/drivers/char/ns16550.c
> > > > > > > > @@ -1221,6 +1221,9 @@ pci_uart_config(struct ns16550 *uart,=
 bool_t skip_amt, unsigned int idx)
> > > > > > > >                                pci_conf_read8(PCI_SBDF(0, b=
, d, f),
> > > > > > > >                                               PCI_INTERRUPT=
_LINE) : 0;
> > > > > > > > +                if (uart->irq >=3D nr_irqs)
> > > > > > > > +                    uart->irq =3D 0;
> > > > > > >=20
> > > > > > > Don't you mean nr_irqs_gsi here? Also (nit) please add the mi=
ssing blanks
> > > > > > > immediately inside the parentheses.
> > > > > >=20
> > > > > > If we use nr_irqs_gsi we will need to make the check x86 only A=
FAICT.
> > > > >=20
> > > > > Down the road (when Arm wants to select HAS_PCI) - yes. Not neces=
sarily
> > > > > right away. After all Arm wants to have an equivalent check here =
then,
> > > > > not merely checking against nr_irqs instead. So putting a conditi=
onal
> > > > > here right away would hide the need for putting in place an Arm-s=
pecific
> > > > > alternative.
> > > >=20
> > > > Oh, I always forget Arm doesn't have CONFIG_HAS_PCI enabled just ye=
t.
> > > The PCI code in ns16550.c is gated by CONFIG_HAS_PCI and CONFIG_X86. =
I am
> > > not sure we will ever see a support for PCI UART card in Xen on Arm.
> > >=20
> > > However, if it evers happens then neither nr_irqs or nr_irqs_gsi woul=
d help
> > > here because from the interrupt controller PoV 0xff may be a valid (G=
ICv2
> > > supports up to 1024 interrupts).
> > >=20
> > > Is there any reason we can't explicitely check 0xff?
> >=20
> > That's what my v0.1 did, but Roger suggested nr_irqs. And I agree,
> > because the value is later used (on x86) to access irq_desc array (via
> > irq_to_desc), which has nr_irqs size.
>=20
> I think it would be better if that check is closer to who access the
> irq_desc. This would be helpful for other users (I am sure this is not the
> only potential place where the IRQ may be wrong). So how about moving it =
in
> setup_irq()?

I don't like it, it's rather fragile approach (at least in the current
code base, without some refactor). There are a bunch of places using
uart->irq (even if just checking if its -1 or 0) before setup_irq()
call. This includes smp_intr_init(), which is what was the first thing
crashing with 0xff set there.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--r+5BN2em9Kwd9k2b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmIrKdIACgkQ24/THMrX
1ywonAf/ZcA+As+roYBZ9aCaQH4qRmNjkfOvTS0ic2QgFkrr+6UXUNLsvgbTNn5t
lYTb4YuFpbiRGecjnqP0EniqOCoGTU15R0/dRMozAAtjCAvcOgFFZ3HBCGsX6pHC
x5xtbF65jj+k1GJAuKoIAmUW5z3E3Z+J8R6cfZcc1XRVZ78V71aviN1M18jflugj
6avE+Cv2/vGx+wU8T+JPZ9k+E2aKXBpXr3zMjXfWg09ousJUqKqPX1OSLupOEc/0
ohB94/sXgjIqyvdMY+BaZFAxdYfF2erP7aP2wPhSw7mVUjJTtvmjfSe4ylVo5WoJ
U1Y9B1OpJcv7H3QgJP5wO7JBUOlPPg==
=RJqz
-----END PGP SIGNATURE-----

--r+5BN2em9Kwd9k2b--

