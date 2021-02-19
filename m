Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0145831FB8E
	for <lists+xen-devel@lfdr.de>; Fri, 19 Feb 2021 16:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86915.163501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7Hr-0006Yl-9o; Fri, 19 Feb 2021 15:01:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86915.163501; Fri, 19 Feb 2021 15:01:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lD7Hr-0006YM-6q; Fri, 19 Feb 2021 15:01:43 +0000
Received: by outflank-mailman (input) for mailman id 86915;
 Fri, 19 Feb 2021 15:01:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Kvll=HV=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lD7Hq-0006YH-IS
 for xen-devel@lists.xenproject.org; Fri, 19 Feb 2021 15:01:42 +0000
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a22a2a18-20dc-4bae-8908-e5ff7b00e800;
 Fri, 19 Feb 2021 15:01:41 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 95582A3E;
 Fri, 19 Feb 2021 10:01:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 19 Feb 2021 10:01:40 -0500
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 31DC6108006B;
 Fri, 19 Feb 2021 10:01:37 -0500 (EST)
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
X-Inumbo-ID: a22a2a18-20dc-4bae-8908-e5ff7b00e800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=+FpTDQ
	EfJBhWk/fzo6gHGJpB659VTaavb2b6nZ7KaN8=; b=nPUmiRf4+tPkiMbhejTjkS
	ou2WbYuj+JJ9kxs1sbyxj4TnQbSgBqR1tEwdET6DK6Wvr1+Whta/9GFxxg2OJWlS
	ffvRYuyw+qocAqSu5k3kF7VgN/yfiCPdVboDYnu8xYPCbWo9CHYUMXxmYbPAFOB8
	0cu8G7Mph+gaGQdJSPzh09J8svJVSHXu6wggUkbKBOP95w8GxGUmz12HcRm+TT0+
	ep5RpsSQUJ1i2OqoHMX8AlWVaJxNknItMjFFzneuLQL9o2/Z3cD69O6Ovw1DyOsf
	Kj4LsvUqT7xnO2egw03HWtI0XMl9pvTJURxwoNJrmd55yS/ZNCT9dI/7PL+EhZuQ
	==
X-ME-Sender: <xms:0tIvYF17V1d2CsS1sTn8-aio2M_am4YW5vMw9BXYkMPUoeCpx2NyCw>
    <xme:0tIvYOtTxrxcn7MhoVZbQOSpqCPzB8C_sgUsbg3ltozBQZHdXTB2UT_GPbD4V8Dt6
    swMWnlhMRL-UA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjeeigdejudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieejrdejledrgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hm
X-ME-Proxy: <xmx:0tIvYFaLlBApEzCKae8Zko0URyEQYQCxHvX-NcBFJE9rreR2-v31Mw>
    <xmx:0tIvYEKLPDs0y_znpCvmRpAkSHCTIrAe8hP_2CWaQLor_ltEbeI7gQ>
    <xmx:0tIvYGi9Lh6zi8NItCMwefQ1hbQCQYcsBQfLRL66KNUi1BshY1SMXA>
    <xmx:0tIvYGaZgCXk61EVVZovYsq5CFrzCPH-A50vjWETY4-R47TygGyOnQ>
Date: Fri, 19 Feb 2021 16:01:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH-for-4.15] tools/libs/light: fix xl save -c handling
Message-ID: <YC/SzYyDP7e6830X@mail-itl>
References: <20210219141337.6934-1-jgross@suse.com>
 <1c02c3af-0a9b-6c68-e110-9d0963275e17@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kP/HQT7mM1GlbVAs"
Content-Disposition: inline
In-Reply-To: <1c02c3af-0a9b-6c68-e110-9d0963275e17@suse.com>


--kP/HQT7mM1GlbVAs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 19 Feb 2021 16:01:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Juergen Gross <jgross@suse.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH-for-4.15] tools/libs/light: fix xl save -c handling

On Fri, Feb 19, 2021 at 03:15:52PM +0100, Jan Beulich wrote:
> On 19.02.2021 15:13, Juergen Gross wrote:
> > libxl_domain_resume() won't work correctly for the case it was called
> > due to a "xl save -c" command, i.e. to continue the suspended domain.
> >=20
> > The information to do that is not saved in libxl__dm_resume_state for
> > non-HVM domains.
> >=20
> > Fixes: 6298f0eb8f443 ("libxl: Re-introduce libxl__domain_resume")
> > Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingsl=
ab.com>
> > Signed-off-by: Juergen Gross <jgross@suse.com>
>=20
> Reviewed-by: Jan Beulich <jbeulich@suse.com>

Works with both xl save and libvirt now.

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

Thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--kP/HQT7mM1GlbVAs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmAv0s4ACgkQ24/THMrX
1yyPDQf/RByCAYvl8/HxXGBaVwa6BocOwML2P3gW+MNEYZcEjojZmZHtX+3cii+g
sLSqlW5Pg7cuRhaNRM2x9UhEubpMhJM7hbgWrudvMPaIecp7poEH2gC7gImQfrdQ
SIzUwv889m313lou6qGii4P4rG5CzxxoPZMER8ddaerkaFIe+/cET/sEw1W/A1WY
IGOc1cz+mpg3fbePSSVvwmLQRzUyA7LvvofNZPF1V6SAvJ9Snx0rp67m6Z5MpumB
gXG4qpBWsQAKMUfsjbBN5qxVZO85jdmnur4WPCsnaalfSgokTPZ9ALhJuFbHQagw
5+9bOPbwjlb41QxIC0hpwu8oYD5Qcg==
=8xMO
-----END PGP SIGNATURE-----

--kP/HQT7mM1GlbVAs--

