Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECE2606334
	for <lists+xen-devel@lfdr.de>; Thu, 20 Oct 2022 16:35:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.426856.675586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWdV-0000Jk-2Y; Thu, 20 Oct 2022 14:35:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 426856.675586; Thu, 20 Oct 2022 14:35:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1olWdU-0000H0-Uy; Thu, 20 Oct 2022 14:35:04 +0000
Received: by outflank-mailman (input) for mailman id 426856;
 Thu, 20 Oct 2022 14:35:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pNAa=2V=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1olWdT-0000GP-5k
 for xen-devel@lists.xenproject.org; Thu, 20 Oct 2022 14:35:03 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5fbaf5b9-5084-11ed-8fd0-01056ac49cbb;
 Thu, 20 Oct 2022 16:35:00 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 96C495C010A;
 Thu, 20 Oct 2022 10:34:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 20 Oct 2022 10:34:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Oct 2022 10:34:58 -0400 (EDT)
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
X-Inumbo-ID: 5fbaf5b9-5084-11ed-8fd0-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1666276499; x=
	1666362899; bh=M2YOLwha2ja59yQIzvd0K5jAGGswBOvDyJHTaUljHQI=; b=M
	7/B9NNjyZ3Rz1VP0841yh1xB2YXKT+3cyRuAbccRLy5oNSaE0s+ZsKkwZ/j5EEs7
	Ik8z2G0jacShs6k9gVPPGJ5hbHtbBHa56dZOor+UpaKXgBV0fHCS1neEN7H8sers
	qeEAC1/hxhrufxBHb60034ESnVX/gy/R9EnJx2ecEFDsKyOruC0VpuGhLZunJTvq
	MWSjvZ9imsHRhnW09c7bPYuH14gXQLHH1UjidXIGkWahJSOdpmoAWgC75RIcvGu6
	FkLQ0fhFJmQ+ADlw9ec/t+acthCJsFtMEdIWd2WG2G/s7vYQkXN7c4lCICh50ehR
	4SFISb68ZDEj0blS1OoZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1666276499; x=1666362899; bh=M2YOLwha2ja59yQIzvd0K5jAGGsw
	BOvDyJHTaUljHQI=; b=jglGp3C0yfaC//P6LfC2dVUf1bzqZZ92nUsvG22VFJSj
	NDTqqJqJU5RiXaffRL5AUHcR9sQC9ug1VeYRM7rgMIBopsTP93ZYmfCaeyyGFBge
	rLtfO/pXLO005tTK7hMEaxQQhUIt87boFryghX1dW5WPJ+AunhmpZn0QAClhiYpe
	iFjZcf7GhCbbZc3AvsJ/cJqPIQTDzpGFJzwTDsnfF/xVIWx6w4wiHNHbKjNHXGoy
	uhGohsMJLRXJApDieYm51Yyh9B4X3jjAHUZpVM0/nYc2CZcNps/GsFaM8DBiqTRl
	qk17xdkd/aGd45Th/eFjrzQ0u29WcIlZrSTo0AoBag==
X-ME-Sender: <xms:k1xRY8TLCrKaTshqimzoYkDKpL9u2pwHHCvQ3DIVlS10z-OdR85h6Q>
    <xme:k1xRY5z2UJq3k8yhdlITJ7UuV-zqlI1f72yWTbdDgO986c76T_yfURqPGMc5Ph0aN
    wYpIBPCZ053aQ>
X-ME-Received: <xmr:k1xRY52AOQnH_X0_SqbnnImUrWqESC-hhbfogrD3LxxrKRloTS8mMPjwGrkJZ3UJQ14pLrqklMfEDg9kkjEQWs8wxiNHStvzDUAv>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeeliedgjeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:k1xRYwA9qJJkbm32dYzYia42ZLZT96bp3gnMoSa4qAipdpbUQGGZ-A>
    <xmx:k1xRY1i9sxDSiRfo9RI8MoXiei5r0SLM-oDniehL3L-PNXxD5XLWiw>
    <xmx:k1xRY8pKq_YXkzIhLzhjv0FhTmDZJeXLYWYGup-blOzqTDtqvX2akA>
    <xmx:k1xRY1bo6VHGkTZIyprqqcAumz9m2Xg6z1Xmyd9bzCoQSP1i_IjLgQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 20 Oct 2022 16:34:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] Use direct I/O for loop devices
Message-ID: <Y1FckIT6OHJ/x0Ri@mail-itl>
References: <20220817204634.1886-1-demi@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3GrwXgwMqQJNlss4"
Content-Disposition: inline
In-Reply-To: <20220817204634.1886-1-demi@invisiblethingslab.com>


--3GrwXgwMqQJNlss4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 20 Oct 2022 16:34:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Xen developer discussion <xen-devel@lists.xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH] Use direct I/O for loop devices

On Wed, Aug 17, 2022 at 04:46:34PM -0400, Demi Marie Obenour wrote:
> This is a huge performance improvement for two reasons:
>=20
> 1. It uses the filesystem=E2=80=99s asynchronous I/O support, rather than=
 using
>    synchronous I/O.
> 2. It bypasses the page cache, removing a redundant layer of caching and
>    associated overhead.

Cross-posting here just in case: this patch breaks block script on
devices with 4k block size, at least with some util-linux versions.
More details at https://github.com/QubesOS/qubes-issues/issues/7828

> ---
>  tools/hotplug/Linux/block | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/tools/hotplug/Linux/block b/tools/hotplug/Linux/block
> index 2691b56951c9b82094471a141b9e0bed04abb929..75785f3a5422c4a5f962a4cd4=
f6acae5080d036d 100644
> --- a/tools/hotplug/Linux/block
> +++ b/tools/hotplug/Linux/block
> @@ -330,7 +330,7 @@ mount it read-write in a guest domain."
>          else
>            roflag=3D''
>          fi
> -        do_or_die losetup $roflag "$loopdev" "$file"
> +        do_or_die losetup --direct-io=3Don $roflag "$loopdev" "$file"
>          xenstore_write "$XENBUS_PATH/node" "$loopdev"
>          write_dev "$loopdev"
>          release_lock "block"
> --=20
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--3GrwXgwMqQJNlss4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmNRXJAACgkQ24/THMrX
1yzTSwf+NrQBIPlt+6CU7Yr751HmGxyzYb19e1YB5oQUk2UgKMuVYhAJK3m4uZEH
kchcO+83pB4p2/s8cSoxs6Fet8eG+lzYcjQI7oHU0giV9KJODbQJoBQv127CWeQs
rKgm5PudpyKPcaKFexF7dnPa01FubL0kp4qIJkPZUP0uXwrtZLwHGeMOJlf1St7M
2l8EKBAROkp/gydRidhTWfiP3zEtq3dfx5hjRqpbWHsl9/JKq/C71ULTAv7i9mAB
iEWGrflN2dqGTtXE37zaYNQLrsO/xg0V3459V+67vVce1GoL5W/y76jpQ4zIdImA
ccx408YNTwoOsRsO3LlyWieoU3QdPA==
=xFc5
-----END PGP SIGNATURE-----

--3GrwXgwMqQJNlss4--

