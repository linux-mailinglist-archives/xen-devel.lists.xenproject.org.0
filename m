Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717083F7FE9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Aug 2021 03:29:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.172646.315042 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ4C4-0006aU-Sf; Thu, 26 Aug 2021 01:28:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 172646.315042; Thu, 26 Aug 2021 01:28:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJ4C4-0006Y3-OT; Thu, 26 Aug 2021 01:28:36 +0000
Received: by outflank-mailman (input) for mailman id 172646;
 Thu, 26 Aug 2021 01:28:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDkH=NR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mJ4C3-0006Xx-Rm
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 01:28:36 +0000
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 69fb0647-d033-4800-9414-b08567b5bf01;
 Thu, 26 Aug 2021 01:28:35 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 6BF9A320099D;
 Wed, 25 Aug 2021 21:28:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 25 Aug 2021 21:28:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Aug 2021 21:28:31 -0400 (EDT)
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
X-Inumbo-ID: 69fb0647-d033-4800-9414-b08567b5bf01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=l0Gosy
	gefn48r4uTH2ZI2zwepXeC3xLJDbpSKDLCccs=; b=uTKRSDE1kl4E+amDRSWl+m
	bzQXW29LSEZdugBn3LBxpHbhhxLbAFiTEv7CCQ1V+dUHqDvJJINnjiNYJSe0YBkJ
	4NNDTbdPnyrTXnLn+aszAvlZdMScuPqIH28Hk3ENxABA5KzqusSaSg11woeqlcA6
	QuHn321KgITvmRcvvwZfvGwgZw/SNdh35AKIvW/+blXQzzLZ7p2cCmtZ8mLwD/ff
	yS8xTl4LifH0vmZSWcmnpyJgOJvVbeJkaAvoeS1XO2DU+SX2U2MAryXLi+/mBLw7
	V8krRSUwd5b4haFzZFrf39IEM3pUs0JMa/OxJbF8GISiNLXzUOaR6c9j48aOCW0A
	==
X-ME-Sender: <xms:QO4mYQbvWyMmZHpIWYog-D9GhK0ogDos0m0kdM5UMxgV6k7eNNwM3g>
    <xme:QO4mYbZFYnyen2v2uAGpvC4_uLLMxT5vx89IsKFxtLaTWWxUum7ryFKqVGnnMkV5j
    20TyNiQpdYdbw>
X-ME-Received: <xmr:QO4mYa-KoU-OXuS_l7hodp4186juQn3Q7S8SURa6TKjcU4WOftuRIrHHv5IKBN35z_YHGNkLeqSq8sPzadn6SbbuCwLRXw5L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddruddutddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtdorredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeiieeh
    jeegteeggeeigffhkeekieefjeduhedvfffhiefgkefhvdevfeejffdvfeenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:QO4mYaqymOorF9cRLSCbl9wd3o_mpeAJD5Zo37AKEU9JJpZi9MwS6Q>
    <xmx:QO4mYbqShHDgdvGgFyCiFRMwWNk_hNgYGsMT2PRMHfS7yJXeV32thA>
    <xmx:QO4mYYQxpBRJbe2-fHoovMaZQEGjJTsHnT2Qxs6h_iUi86AFnMa8Uw>
    <xmx:Qe4mYaXDp62TzRdpSs5oZtS37xC_4f2vhvv-vAcD6TPNWQu92zqMEQ>
Date: Thu, 26 Aug 2021 03:28:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: linux-pci@vger.kernel.org, stable@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: Kernel panic in __pci_enable_msix_range on Xen PV with PCI
 passthrough
Message-ID: <YSbuPJSZxiKSSaqT@mail-itl>
References: <YSZgkQY1B+WNH50r@mail-itl>
 <3e72345b-d0e1-7856-de51-e74714474724@suse.com>
 <YSZmFMeVeO4Bupn+@mail-itl>
 <24d47a06-a887-05e5-0e3f-ed3cdd19490b@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UaYlySroUKN3Byia"
Content-Disposition: inline
In-Reply-To: <24d47a06-a887-05e5-0e3f-ed3cdd19490b@suse.com>


--UaYlySroUKN3Byia
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Aug 2021 03:28:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: linux-pci@vger.kernel.org, stable@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: Kernel panic in __pci_enable_msix_range on Xen PV with PCI
 passthrough

On Wed, Aug 25, 2021 at 05:55:09PM +0200, Jan Beulich wrote:
> On 25.08.2021 17:47, Marek Marczykowski-G=C3=B3recki wrote:
> > If so, I guess the issue is the kernel trying to write directly, instead
> > of via some hypercall, right?
>=20
> Indeed. Or to be precise - the kernel isn't supposed to be "writing" this
> at all. It is supposed to make hypercalls which may result in such writes.
> Such "mask everything" functionality imo is the job of the hypervisor
> anyway when talking about PV environments; HVM is a different thing here.

Ok, I dug a bit and found why it was working before: there is
pci_mask_ignore_mask variable, that is set to 1 for Xen PV (and only
then). This bypassed __pci_msi{x,}_desc_mask_irq(), but does not bypass the
new msix_mask_all().
Adding that check back fixes the issue - no crash, the device works,
although the driver doesn't seem to enable MSI/MSI-X (but that wasn't
the case before either).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UaYlySroUKN3Byia
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEm7jwACgkQ24/THMrX
1yyN/wf7BorSCX29k2HNQNmc90h4Hp54qa3SLXsTou5gLqJQXOwJAJz7saKR8UW1
QOgM3+ui1fGz+x3UBynQ6MM53+2hwBsO7f4kVGG/nGvgz+2TcckJOjAZRUap/Exz
8TCnIvcONjKKV7gMfc9Dg3JUSzvyqF3azpuiJQMZ7VWSHLpsMSenoKADIB+6EBHA
/fxABG6KsY4Mv0I82bS2NJ0Nk0xO1Da2EPWzqmQgKnbl1dma5PlGt4p3wKAGxOCp
Bozp7USuFSAvyHaq3+h1GV/2QIC/EMZxIw3jKlDgAnEi5bsIsb5y0rtYctqXULZy
e9Lwr5SCNjOc05VQdT0tm0fgHwqm5g==
=HlrS
-----END PGP SIGNATURE-----

--UaYlySroUKN3Byia--

