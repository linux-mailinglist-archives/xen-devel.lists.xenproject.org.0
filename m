Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A6693CC34
	for <lists+xen-devel@lfdr.de>; Fri, 26 Jul 2024 03:02:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765196.1175785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX9Kg-0008Ev-Kd; Fri, 26 Jul 2024 01:01:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765196.1175785; Fri, 26 Jul 2024 01:01:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX9Kg-0008AP-Hr; Fri, 26 Jul 2024 01:01:18 +0000
Received: by outflank-mailman (input) for mailman id 765196;
 Fri, 26 Jul 2024 01:01:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XHFb=O2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sX9Ke-00059r-Qa
 for xen-devel@lists.xenproject.org; Fri, 26 Jul 2024 01:01:17 +0000
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a080a2b-4aea-11ef-8776-851b0ebba9a2;
 Fri, 26 Jul 2024 03:01:07 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.nyi.internal (Postfix) with ESMTP id 45F371380351;
 Thu, 25 Jul 2024 21:01:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Thu, 25 Jul 2024 21:01:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jul 2024 21:01:04 -0400 (EDT)
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
X-Inumbo-ID: 8a080a2b-4aea-11ef-8776-851b0ebba9a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721955666;
	 x=1722042066; bh=vMEFVFOBmxb1HtF7SEeR9nke0slxYCkVy8bbPz/CgoQ=; b=
	KQ2WtaqQrcn9tMX9La5NeuV5zz9y8a/L0veU9nefTcxUl41189n1jVcBKx2a7v8W
	YcsNFgKXN+zL7Lg1z9sXxEigVkl/4ppe7pq3YS25BI5yP9H+NvIQT3XR8hCL40Mu
	ONFPeFuH06rSQOESQBNPXJK5pDDweiExyo0TTArW3sIhzxC8kCX0dGtC7c6A1GsZ
	9uR4Qxl1uneAXJA13TGblN+fm7Jh+JHfWiUco3LySGGMt2O78NY+EUOe6XpQnryE
	b/zuvkIn/j/sFMM0KsdU3dJuU/jCQZ7FpWTvQGdg2mqvotGgnm744ijWkmAtwkWb
	LwES+y20Ne6MlKSTzReGpA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721955666; x=1722042066; bh=vMEFVFOBmxb1HtF7SEeR9nke0slx
	YCkVy8bbPz/CgoQ=; b=R65c60C5newhRbf30/1qG6FAHZmdGGi63FDU39ycfWKm
	uycRwgIzZPrqfEN0OHljJTKUzwtgXrAZAEkgNsCgiKzJC5wKkvPbU4HpXDyKNbfO
	rTktcQlu+6iOFL6r1/1yMtpSlJSMHKgMQx6nAGwIAXcJlUUHm5kSY2B1Fxlus0sB
	dkUymfW7QZtJtYEGkzKD3EP983C8IyZ8tIBb5uUF3SBGzWlD1fSbISMGgCiAce7m
	Wf9cMVm4520nvqsvS05rh0pH2jn/vqTHOFCusa+0kSDIQ1lXnF93An2lp7U9mkkF
	bNuCepEmD5Tkek/oWVvHGJb3eNrA8+kBxND+hlp1Cw==
X-ME-Sender: <xms:UfWiZmfmLenvZjmDm9O7o8iOzJ8Z4SiZH7x2dtPL6wHPOP97AFi6wg>
    <xme:UfWiZgPAdYbAmo4mFNzTGxC4TAtp1BlBVY2hgaxiqukdebAlF6sqz_a4eKDsQBDUg
    Scd_Qqd0G7WsQ>
X-ME-Received: <xmr:UfWiZnjLyZ5sVdRbfu2G_6erJi0UYbx1WS14LCOkmXARlDnvXaFxGHlUnwStv6JCm5vGwoLzShKUAvTxPLX0mujb_YdeGad1Ww>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrieeggdegtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:UvWiZj_ePNCIfe7LSZEg5KBC_9S3WDwz1lLOViEi7Hy8Bfn7Dr2fow>
    <xmx:UvWiZiv_7hkqD8bW4B3DYAGHg2NDcnb-DNqIobEHFPIbk0WrkleMfA>
    <xmx:UvWiZqHjjcqPT4DI1UdA3OChi8dBtU43aQjQ0mBC3t_vOeD1vFvrAw>
    <xmx:UvWiZhMj9qG2bCWfbr5aM52Tvl4ZNjVTYgte2mW4o8wDkA_AS4wyvw>
    <xmx:UvWiZmK8mAcVLnoAJmB6SxL10g4m2q-EW6AgMgywgU6CEjsyCrbSqLxU>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 26 Jul 2024 03:01:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 2/3] x86/mm: add API for marking only part of a MMIO
 page read only
Message-ID: <ZqL1TBOezvBgMQso@mail-itl>
References: <cover.66bd16d0134f9664ea3e0f4d56f7c127afc308c8.1721704980.git-series.marmarek@invisiblethingslab.com>
 <4bea5034cda37f35cd04115bebcccb52e3ea719e.1721704980.git-series.marmarek@invisiblethingslab.com>
 <7588feb4-dc42-4bf3-85db-7aaac201a2ff@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1j2XPxvC1isC58oq"
Content-Disposition: inline
In-Reply-To: <7588feb4-dc42-4bf3-85db-7aaac201a2ff@suse.com>


--1j2XPxvC1isC58oq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Jul 2024 03:01:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 2/3] x86/mm: add API for marking only part of a MMIO
 page read only

On Thu, Jul 25, 2024 at 11:26:31AM +0200, Jan Beulich wrote:
> On 23.07.2024 05:24, Marek Marczykowski-G=C3=B3recki wrote:
> > +     * so tolerate it.
> > +     * But unaligned size would result in smaller area, so deny it.
> > +     */
> > +    ASSERT(IS_ALIGNED(start, MMIO_RO_SUBPAGE_GRAN));
> > +    ASSERT(IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN));
> > +    if ( !IS_ALIGNED(size, MMIO_RO_SUBPAGE_GRAN) )
> > +        return -EINVAL;
>=20
> I hoped you would, when adding the comment, recall an earlier comment of
> mine: If you want to tolerate mis-aligned start in release builds, you
> need to make further adjustments to the subsequent logic (at which
> point the respective assertion may become pointless); see below. While
> things may work okay without (I didn't fully convince myself either way),
> the main point here is that you want to make sure we test in debug builds
> what's actually used in release one. Hence subtleties like this would
> better be dealt with uniformly between release and debug builds.

Right, and I think this is a good argument to not try to accept
unaligned size either, even if it would be possible here.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--1j2XPxvC1isC58oq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmai9UwACgkQ24/THMrX
1yytbQf/ZvSfv6BxnYZLGS6L0Gjx1bhRO5xzwkGEXbcQgLdzhEsGFi3TcpNXJmGA
Mq46erMm2EFMkHSeHwiyboXay3F0tYLrEelRuWvJV5kTZ6V94Ws1bPhbwPZJ9VqG
Uig8ESaQr7XzNX98MxRm6rQtSfFbAJxSLmV8Qd1bGHQFhP+HA26P4gbVb4YIwFOC
b68C2+IJOIjsFMzsuXg6CvlQMXppSwBowce+cnT49oMVq/8YFTBfAlkb3bevyIkj
HLc/Bs7/NtKaZNP1L2ojeQGk9DQPxMQirYKeE2BKPLZBIj3nTXy+OlGDyE95dt2B
CzD1Y/QG5Mp/ok8KmA/P43zf5QR45w==
=sydp
-----END PGP SIGNATURE-----

--1j2XPxvC1isC58oq--

