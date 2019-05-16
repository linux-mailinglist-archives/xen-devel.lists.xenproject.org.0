Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2744E20B7A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 17:48:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRIZP-0004oe-9c; Thu, 16 May 2019 15:45:23 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Eh32=TQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hRIZO-0004oX-8B
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 15:45:22 +0000
X-Inumbo-ID: 9c50b67f-77f1-11e9-8980-bc764e045a96
Received: from new3-smtp.messagingengine.com (unknown [66.111.4.229])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 9c50b67f-77f1-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 15:45:20 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3F92618355;
 Thu, 16 May 2019 11:45:20 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 16 May 2019 11:45:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=WOdRU2
 yzx5w1TQkeKEzxMKGhFhTeCXPQFFd3fgHtCY8=; b=Q3o66Wxi2ZHJvSswq4sXwf
 pPHOLMamXMfNQvcR+bu8ejdHWEWLixlYiRkEea6pqBcITOixa85KiyeNG5rliuJ8
 7w0f6Wqsq8+pbtatm+XSW/idB5HmChEA6ecpeUuDHW4n1YM0X1Kf830XoD9M6yZk
 tQqph78c0j3jPSbDafjNK4uJ0hyA8OeG94PSChleTCoH50vvsllUIpncoJ6rDEy1
 sKT5KvlVTv/lpPKyESixz596vqd685I63fOfk51w3JCnTyc+eEIlc+gdngtuHIuw
 CukY1CcuE8PhXXPG0QNiOq12YcgpiqMyKOYvbvsvK+ilJXCRa38+5+PV68o/BcYQ
 ==
X-ME-Sender: <xms:joXdXNCMpev9pRW1pYLXm7zGGyVinT914aGahFBkhTUAcMD7caNmZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddruddttddgkeelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvth
 hhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeefnecurfgrrhgr
 mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
 hlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:joXdXHoDYpqGC1-4cNdfi4C5gT1YfGzh67YviO03LjSQkAwnlie4OA>
 <xmx:joXdXEZjnfOMKI1eMPE3-4g8vNlrgvaxSprRtaTxNZwIISU07B2ZnA>
 <xmx:joXdXBHEGO2aggtTuyZWALpEZAvhdIxfA9Wyc6_70V06PWH_vMgX7A>
 <xmx:kIXdXIOvz0wIlJ6mXciv9cc4w3ht3wC2GIeJGgOj-0iSbumD21WIWA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 9149B8005A;
 Thu, 16 May 2019 11:45:16 -0400 (EDT)
Date: Thu, 16 May 2019 17:45:13 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190516154513.GS1502@mail-itl>
References: <cover.36e828561477c30a5472a8e9213ab0efc5484de8.1558015595.git-series.marmarek@invisiblethingslab.com>
 <cover.36e828561477c30a5472a8e9213ab0efc5484de8.1558015595.git-series.marmarek@invisiblethingslab.com>
 <93faeff91ee3e14320b5048818badc38460143e7.1558015595.git-series.marmarek@invisiblethingslab.com>
 <5CDD7AD8020000780022FC7B@prv1-mh.provo.novell.com>
MIME-Version: 1.0
In-Reply-To: <5CDD7AD8020000780022FC7B@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.11.1+94 (9b965fac) (2019-01-05)
Subject: Re: [Xen-devel] [PATCH v3 1/1] xen: fix handling framebuffer
 located above 4GB
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Roger Pau Monne <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0183971947327430213=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0183971947327430213==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4tkssvp36SW1tyIS"
Content-Disposition: inline


--4tkssvp36SW1tyIS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 16, 2019 at 08:59:36AM -0600, Jan Beulich wrote:
> >>> On 16.05.19 at 16:07, <marmarek@invisiblethingslab.com> wrote:
> > --- a/xen/drivers/video/vesa.c
> > +++ b/xen/drivers/video/vesa.c
> > @@ -40,6 +40,11 @@ static int __init parse_font_height(const char *s)
> >  }
> >  custom_param("font", parse_font_height);
> > =20
> > +static inline paddr_t lfb_base(void)
> > +{
> > +    return (paddr_t)((vlfb_info.ext_lfb_base) << 32) | vlfb_info.lfb_b=
ase;
>=20
> I'm afraid you've misplaced the parentheses here. I wonder if
> this has worked for you at all.

Indeed it's messed up...

>     return ((paddr_t)vlfb_info.ext_lfb_base << 32) | vlfb_info.lfb_base;

This works fine.

> > --- a/xen/include/public/xen.h
> > +++ b/xen/include/public/xen.h
> > @@ -923,6 +923,11 @@ typedef struct dom0_vga_console_info {
> >              /* Mode attributes (offset 0x0, VESA command 0x4f01). */
> >              uint16_t mode_attrs;
> >  #endif
> > +#if __XEN_INTERFACE_VERSION__ >=3D 0x00040d00
> > +            uint16_t _pad;

And also compat checker don't like this name. I've changed it to "pad"
(v4 upcoming).

> > +            /* high 32 bits of lfb_base */
> > +            uint32_t ext_lfb_base;
> > +#endif
>=20
> Strictly speaking the padding field belongs ahead of the earlier
> #endif.
>=20
> Both aspects can be fixed while committing, but confirmation on
> the first wrt it working for you would still be nice. With them in
> place
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--4tkssvp36SW1tyIS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzdhYkACgkQ24/THMrX
1yzlQQf5AdkV3enTF5zr50XdDaPnFTnE8fRQYAm5w2EXS16kzZCCmi1M3Zc6ccAZ
8nBknfvFziXafzVNShgMNxKLtPxaOAz6JAu+lTdzYSUOAW5DzVAxkmZkJcRiUpCw
m6ShTl1rrUEGSKd1gqQSRVv4Qw0RVNTewSQ7Z31T3sNGFvuHQTg2xa+WS6JiWB59
GfW3Rl8ZXBdBXZGDYLIf7SqeLkmckhONbHI5MhDb6F+AcWer+qSJNPfxVk/NnubF
jtDko8Nrw9JlWxu6KapfqoP2OHdTDWLhjOd8C29+Am5sX01FqCx6r9cyZUl7nXSj
4KMisfvuyTCJD6Yp3EF6aRt2NJMzMw==
=+I7K
-----END PGP SIGNATURE-----

--4tkssvp36SW1tyIS--


--===============0183971947327430213==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0183971947327430213==--

