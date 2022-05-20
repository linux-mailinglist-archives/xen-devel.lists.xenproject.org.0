Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A07052E9FB
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 12:34:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333723.557609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzxG-0002dO-Mv; Fri, 20 May 2022 10:33:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333723.557609; Fri, 20 May 2022 10:33:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrzxG-0002a9-JA; Fri, 20 May 2022 10:33:58 +0000
Received: by outflank-mailman (input) for mailman id 333723;
 Fri, 20 May 2022 10:33:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dOI6=V4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nrzxF-0002Zk-F4
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 10:33:57 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58fdbbb8-d828-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 12:33:55 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 58AE35C0265;
 Fri, 20 May 2022 06:33:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 20 May 2022 06:33:54 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 20 May 2022 06:33:52 -0400 (EDT)
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
X-Inumbo-ID: 58fdbbb8-d828-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1653042834; x=
	1653129234; bh=W11EzLqcSs3boOanI3c6p62+m8O8TTNeUza4fSvw0io=; b=K
	IUiyL4WlHdBVc/KYht4drBNHDg8gfLNQGuPLjVtnZeeOGin2w7JV7gHrc5smbJUp
	bl84S5cVxhsxq24BW8NMg3WWhp0R0Pd1dDSI1MGHfZFNlqLJ8kK2KDiO8aZ7LHBw
	xUxbFEh+73ihBnbR6AhGI2ixDxsfndn5k/P5Hi+HLiU8AGYaSMqiJcO3HPNN4AjY
	8AO3HosJSIgucq8rEvjamqvpBSiUpfxllWQRu7Ia9zxakKlNADkfWnETPeW+LY1L
	5mQlvI2wJJk4gGN41oBSVkR+qy95LnAZ524FF4ExxWEqi8sxob2gGDWcGl7v6SLD
	TUpzgygI0qSuJUvVurYMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1653042834; x=1653129234; bh=W11EzLqcSs3boOanI3c6p62+m8O8
	TTNeUza4fSvw0io=; b=PGHTcgB0O3byALFejWf6Jg/2qUJ+pWQBxLhee5RSfkT3
	HPE53fXCIz2bXpU51mX+TtHvLAd+g4BREVFgjbmrsarq5lJ/Czxxfa8DxW2SWDiu
	Be3Hs9LH94OqOvHS+6bSmd0e6Pp4toeD3veyYqZojruLoI3z0vc3EdconZDwLmAY
	1bmZYcG6H50C5q0RRP0fFWbw0wwEBWuq8rpL0T84vy+mFNMSp+FYjS6gpAtsipS9
	7FrEMF1fQ8JmDYsLOfWkRsQS6dOow2kz51N614Zp3WpNA21bFzLSYA/IEl7LHNYO
	8XWTkU0FO0CHVWjwQ5x/HRVP1Lne0BY9YKOUx2xj/A==
X-ME-Sender: <xms:km6HYuXniywlqoztIUGXXzjcE5UeMDiNvkHlAJBgl_zKSDVXhGiFtA>
    <xme:km6HYqmW-04BFa5cWpIN4e-w1Mj1syEiAk71kyO1ywpbuh7hBu9K4vv06lljgMUMT
    1qiwZCWclc_KQ>
X-ME-Received: <xmr:km6HYiZUpxNa5DGL5735uI4jDOtv2MaoknUtVQte3KXYQofaqQWddIzG50AXiVgIGoOYCigcs2T7jZOj_BnOOsBPK344DgKU7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrieefgddvkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:km6HYlVkxH8BnqZP_AKMMTr6B9BRwpInk1OYDUPpMa2RPIys1mT08Q>
    <xmx:km6HYonaYkmZ2xmdBHCctX9RHyuhapdwfoRjEm7coEuuuk5jRK72tA>
    <xmx:km6HYqe-oNR_6KL_ZR-YFdkUz9zHfbTDNsLUIC-9YQSuOzYTOGQrjA>
    <xmx:km6HYnu1S4q9GTIDcqvg9OXvU0eeN5UVJpXbBQbxKnWEK7qI5U36PA>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 20 May 2022 12:33:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff
Message-ID: <Yodujm43cJ2KBDBm@mail-itl>
References: <20220520085343.1835866-1-marmarek@invisiblethingslab.com>
 <825cbef2-2b1c-b05f-1c4e-cace2eef099e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="heNkV7qPBJb1kdKr"
Content-Disposition: inline
In-Reply-To: <825cbef2-2b1c-b05f-1c4e-cace2eef099e@suse.com>


--heNkV7qPBJb1kdKr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 May 2022 12:33:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/2] ns16550: use poll mode if INTERRUPT_LINE is 0xff

On Fri, May 20, 2022 at 11:47:02AM +0200, Jan Beulich wrote:
> On 20.05.2022 10:53, Marek Marczykowski-G=C3=B3recki wrote:
> > Intel LPSS has INTERRUPT_LINE set to 0xff by default, that is declared
> > by the PCI Local Bus Specification Revision 3.0 (from 2004) as
> > "unknown"/"no connection". Fallback to poll mode in this case.
> > The 0xff handling is x86-specific, the surrounding code is guarded with
> > CONFIG_X86 anyway.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
> > Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Thanks.

> > Changes in v6:
> >  - wrap the check in additional CONFIG_X86, with appropriate comment
>=20
> Thanks, albeit ...
>=20
> > --- a/xen/drivers/char/ns16550.c
> > +++ b/xen/drivers/char/ns16550.c
> > @@ -1238,6 +1238,17 @@ pci_uart_config(struct ns16550 *uart, bool_t ski=
p_amt, unsigned int idx)
> >                              pci_conf_read8(PCI_SBDF(0, b, d, f),
> >                                             PCI_INTERRUPT_LINE) : 0;
> > =20
> > +#ifdef CONFIG_X86
> > +                /* PCI Local Bus Specification Revision 3.0 defines 0x=
ff value
> > +                 * as special only for X86 */
>=20
> ... I'll have to remember to correct the style of the comment while
> committing ...
>=20
> > +                if ( uart->irq =3D=3D 0xff )
> > +                    uart->irq =3D 0;
> > +#endif
> > +                if ( !uart->irq )
> > +                    printk(XENLOG_INFO
> > +                           "ns16550: %pp no legacy IRQ, using poll mod=
e\n",
>=20
> ... and perhaps insert another colon after %pp here.

Both fine with me, thanks!

> Jan
>=20
> > +                           &PCI_SBDF(0, b, d, f));
> > +
> >                  return 0;
> >              }
> >          }
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--heNkV7qPBJb1kdKr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmKHbo4ACgkQ24/THMrX
1ywfVwf/boCSBqdGGsysRXii23Cj0VruqIoAHVpmFMtvb0Nw3CF4kogHKcgZG4/F
jatlHAueWPykLipeGLT/uAe7o6KI976oFxkj/kK6Cg4DPYTGpG10z0vSjotD+zYn
7mfWnUlCOzkoKyKlK9qPt8reLqwFd9gPODggDWTiK9vI9udebHEAd4Tn07mb3Rc8
BhS+K39SqRlgKer2IiPfvuTA90iDsAXFAt3CaUe+wNBotr+nNomYaeurjjqpEwYE
uIxt6LZdKPCJsgTsbFquX8a41FIY852V5czRla8p2U0mSM5txPQ7agIg9d8zGRXa
2baUGOurBMkmQ1nskBalimdjhpYxcA==
=lxEO
-----END PGP SIGNATURE-----

--heNkV7qPBJb1kdKr--

