Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312E73F0345
	for <lists+xen-devel@lfdr.de>; Wed, 18 Aug 2021 14:07:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.168225.307135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKLp-0002AH-NH; Wed, 18 Aug 2021 12:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 168225.307135; Wed, 18 Aug 2021 12:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mGKLp-00027h-KI; Wed, 18 Aug 2021 12:07:21 +0000
Received: by outflank-mailman (input) for mailman id 168225;
 Wed, 18 Aug 2021 12:07:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jWQ4=NJ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mGKLo-00027Z-Dv
 for xen-devel@lists.xenproject.org; Wed, 18 Aug 2021 12:07:20 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c327e345-55a0-4359-b603-ed8104de5f8a;
 Wed, 18 Aug 2021 12:07:19 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id 385775C0166;
 Wed, 18 Aug 2021 08:07:19 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 18 Aug 2021 08:07:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Aug 2021 08:07:17 -0400 (EDT)
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
X-Inumbo-ID: c327e345-55a0-4359-b603-ed8104de5f8a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=oKowFU
	LHPXbYycTSY8Bupo1v97GqawWPmeZvxW+w1go=; b=E+juIwywF90keSvzg+4Q5K
	XQDhIy4NRNOqQ/bHS7bzJIZGmXtMvxgr3BAGBKgDijo1V6ZWiWyvPQ6wNh9bU1GT
	3YZjt3BUxQenr2SaYQ+c4okYqzgeNdWm0PIhwQf6t2eCu5QYm6vtZeRgJY6KeiB2
	sHv1v0sIcalquDcjb20Q66FaMbz99FefOHOStqLmLBcnVjwFYZ/5OuRxQtByrQnU
	VBjDRHfcsL46TO+URiczD/zCeic0faPmWDsBDk1UgsvlNgkXwdYC2HOrKLJKIprj
	sXJ143DGkLBmDQtwkL5MKHdieRqGRTz1FoXl4iNNjzbroNQnBrOEaXEeiMnn10yA
	==
X-ME-Sender: <xms:9vccYRtYjCA0tGrTsr1fMUxHKSr1QDdveNLZcDP7JO9ojJONiVx8qw>
    <xme:9vccYafhw93CCmZpt9iPmV8NcxVtOYA7vK9_jlL0o45_zJwigs7QaMt6fR2WgC6YN
    AxTvax5tHEhKg>
X-ME-Received: <xmr:9vccYUx2dzh5gXOjigPIycOMwrwW3rXMY8-jFSgQeOPnjVYP02J6PnAvWsaOKF5gmbzX4eaoMbz6nc6KiIUcm7WxJc1bUjR3>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleehgdegkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:9vccYYMSGZo2w5RXC-nb7fOVsRvJmzJQYOQ8ZQKyp8jNAlbJgaFqAw>
    <xmx:9vccYR9YVgrnFPyU9Y3T9_wZSFH3Q5YwbgXONk5Bg6b8aOa9ytXaJQ>
    <xmx:9vccYYX7aZnfPYbzccLOt1T02J_nhYfY6X0AkFBlCkU6d1pktm9JHQ>
    <xmx:9_ccYTKqIrDBoGP_2kwOgi7Q-aFdQbiJcl7XM4p0vkG1EX1CMvKIjA>
Date: Wed, 18 Aug 2021 14:07:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume
Message-ID: <YRz38nFJpQ8hawC8@mail-itl>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <ed21b560-a52f-829b-e494-6d48438b6c3a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="k8l2YMpQcVkz8cJN"
Content-Disposition: inline
In-Reply-To: <ed21b560-a52f-829b-e494-6d48438b6c3a@suse.com>


--k8l2YMpQcVkz8cJN
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Aug 2021 14:07:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/xstate: reset cached register values on resume

On Wed, Aug 18, 2021 at 02:05:05PM +0200, Jan Beulich wrote:
> On 18.08.2021 13:30, Marek Marczykowski-G=C3=B3recki wrote:
> > --- a/xen/arch/x86/xstate.c
> > +++ b/xen/arch/x86/xstate.c
> > @@ -642,6 +642,13 @@ void xstate_init(struct cpuinfo_x86 *c)
> >          return;
> >      }
> > =20
> > +    /*
> > +     * Clear the cached value to make set_xcr0() and set_msr_xss() rea=
lly
> > +     * write it.
> > +     */
> > +    this_cpu(xcr0) =3D 0;
>=20
> While XCR0 cannot be successfully written with 0, ...
>=20
> > +    this_cpu(xss) =3D 0;
>=20
> ... XSS can. XSS can't be written with various other values; I'd
> suggest using ~0 here. Then
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> and I'd be happy to make the adjustment while committing, so long
> as you agree.

Yes, makes sense. Thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--k8l2YMpQcVkz8cJN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEc9/IACgkQ24/THMrX
1yzRpwgAgRDlRanRthkZVY5hffkzrUy5gUoo7W7B8sweSvfrFV3sTMyCTwEw5FQH
kO3fswuIE4HEiXZ/geiGi9LVBPNYZxPp4MomydpRS6C6l6J4Nru9ad5JPCTLTkYe
8FYSwWVE15CBmu9fM4TssleU8rwqsu/FReP1irua5yGgdDV5ARzfdywrkdrI9xs5
lpt2pX3FN99q5C+s904qAOmrLWETKANjvwsmQtShZ0rEX3R4QfmGvwCOYrMV/cU/
mEWtuZoq5vr44r5LKeecVZ+DE2DCvURVcy+2mCGazCtAguow6Py9LpabDowbSf7D
E98sYYvTSrMl0E9D+H92zABLPZbLIQ==
=yhSV
-----END PGP SIGNATURE-----

--k8l2YMpQcVkz8cJN--

