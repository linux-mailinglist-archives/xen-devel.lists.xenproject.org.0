Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8626A2488
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 23:56:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501606.773443 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVgyI-0002WZ-Un; Fri, 24 Feb 2023 22:55:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501606.773443; Fri, 24 Feb 2023 22:55:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVgyI-0002TV-Rn; Fri, 24 Feb 2023 22:55:22 +0000
Received: by outflank-mailman (input) for mailman id 501606;
 Fri, 24 Feb 2023 22:55:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UorL=6U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1pVgyG-0002TO-J9
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 22:55:21 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a25df9e-b496-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 23:55:13 +0100 (CET)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 1171C32001FC;
 Fri, 24 Feb 2023 17:55:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Fri, 24 Feb 2023 17:55:08 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 24 Feb 2023 17:55:06 -0500 (EST)
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
X-Inumbo-ID: 4a25df9e-b496-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677279307; x=
	1677365707; bh=r6mRCtJbpT5pH/gblfSbXLBdrg/beZ0d2UEnWnlbKoM=; b=n
	b3qvZpEAGDh313g5eN4kb52xk0TUbDKJS7/DFp3sf3/f/P5g0FC/BE/p+ap4HXGQ
	ste3+rh7ux4RXNNlSO/WA18bvJpe9yZANft74zlQ9rswHGH1Y7osMJ0OGIn1F+4i
	SsUZSEDZejdAmEUFCGVRCOplGQnVQaBsix8JHJJvhy/MF+8eHPTPxSivBLRTI12X
	FYai4EvhShR6ck17VIulSbQStoRMjfOrnpxrCEUR/5cmp5B5LtQuXQa1TOuuSWS/
	CQ5ujN6Z1FPIf0KM0iWRreB9cv4WNhWrds1hnV3xP9dIrdT9YQB4+XdIHIvwfVuw
	wMoAMAuuuaIo2f/Pc0v3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677279307; x=1677365707; bh=r6mRCtJbpT5pH/gblfSbXLBdrg/b
	eZ0d2UEnWnlbKoM=; b=iAceGtl9sMXi2gYyRduMD6uEKPwktBBffr7dRrqFa3/I
	Oot1eFer9CJ6aX09MYs2Z+chAPz5BUe3phlUA9k9hD8lbDW2o+WTdltKaZ6bi+Fc
	2j9nKG82Q8QuZCyurzgnTvw+smdjOTOyWlOYP/qEKQhyNLySLsEFeXzFB0/xiKZx
	4LIsmJYGk/p2+artgCWSOiENlZBy/VLw1NTEtJoWvSRgzvXGB82c/pVF6o+P3fII
	v7tD87qvJx2UksQARulVPNr8fIVyVYeUlrlwsHIt3mwBr9g1nVChcGre41QTqsWX
	YA+3q8rHKV4XVB5DEq+MwqimNpjTucH0Rps4ZdVzcQ==
X-ME-Sender: <xms:S0D5Yz1GPn3enwam0BcxNL5uP2PHPtZbf6I4few5U3cXqOvPYdkfrQ>
    <xme:S0D5YyHS0DRg66jAEd6DCd79J7gv5h497JN5kpNgmLlIaqTUV288eLKCwNcXW9lUv
    cf8NKdhO32Z2w8>
X-ME-Received: <xmr:S0D5Yz52f2XHNBCPlf8yiU_fQTB-d86NEOPUD0MJZksP29TrhRvtcl4ItDYL>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekgedgtddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepveffgeduudffveeiteegvdefuedt
    ledugefgjeehudehueeiuedtfeevkeeuhfeknecuffhomhgrihhnpeiilhhisgdrnhgvth
    enucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghm
    ihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:S0D5Y414jMXOgqdhZ5ZOcng36xGz31w5rlyZbQMn-Dkf8VGKRhhQCA>
    <xmx:S0D5Y2HGXfXw2UsxrKYnr17zT9SXCu237Cj8eSWVJckMxhEee2neeg>
    <xmx:S0D5Y585ezn_VX1TbIeSknANAzaFBVly6Vm27wW0_7fKFUCk7l6xxA>
    <xmx:S0D5Y50mB5Qrdn5rZw_h4-wHNM0EbNhHBwwa2vbS1r4VdlLIyRCCrg>
Feedback-ID: iac594737:Fastmail
Date: Fri, 24 Feb 2023 17:55:01 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/3] Build system: Replace git:// and http:// with
 https://
Message-ID: <Y/lASQDDXEZY5qDB@itl-email>
References: <cover.1676750305.git.demi@invisiblethingslab.com>
 <944d212b0047339e4c15f7f85d74ff7fbfe96912.1676750305.git.demi@invisiblethingslab.com>
 <8c4aa332-07ee-e91a-50f1-ced9e36db2a1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oGO/5wPBSPi5N4Jr"
Content-Disposition: inline
In-Reply-To: <8c4aa332-07ee-e91a-50f1-ced9e36db2a1@suse.com>


--oGO/5wPBSPi5N4Jr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Feb 2023 17:55:01 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v4 2/3] Build system: Replace git:// and http:// with
 https://

On Tue, Feb 21, 2023 at 11:07:58AM +0100, Jan Beulich wrote:
> On 19.02.2023 03:46, Demi Marie Obenour wrote:
> > --- a/stubdom/configure
> > +++ b/stubdom/configure
> > @@ -3535,7 +3535,7 @@ if test "x$ZLIB_URL" =3D "x"; then :
> >  	if test "x$extfiles" =3D "xy"; then :
> >    ZLIB_URL=3D\$\(XEN_EXTFILES_URL\)
> >  else
> > -  ZLIB_URL=3D"http://www.zlib.net"
> > +  ZLIB_URL=3D"https://www.zlib.net"
> >  fi
>=20
> In v3 you said that this URL can't be used anymore for the version we're
> trying to fetch (which I can confirm). Leaving aside the question of why
> stubdom was never updated in that regard, what use is it to update URL
> (without even mentioning the aspect in the description) in such a case?
> (I haven't gone through any of the other URLs again, so there may well
> be more similar cases.)

Main advantage is that it will fail securely rather than downloading
whatever random code an MITM attacker put in there.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--oGO/5wPBSPi5N4Jr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmP5QEkACgkQsoi1X/+c
IsGqbBAAq32mtEi4QdTDBCgsz//16HrrG3NsPsHCsxfQkMHdFcGHzWRH1upZr3Ik
RiAUgKAFQ7G94BuzLGxUre8wiQAwh3rgen8AM+/6xl9Oa86zXuDj1afLb+waLGMh
JT6RgCprF6ez4xeBnP5dQU+rVUDv/+MG5v1djZctn5rplWEhMZ0Bb8ON8XqYluen
XGqamyum4ya1wjwxATCD3OQlScl42sMGoatIQLXRCydFtSPwVpjihvtggqFm9GW6
bzDpnUhHVc8bImLavpCGb1etTZt04mmUSyOjXeht0XSTFuPhx3vjWj4nxksCw/PL
YVUj3HUg11XH97U7gSFHTwtwhLczDSDWqPl/4fCiE4VB5lJP2jzGH4WiwoHPcMtY
1Memjv7dX85zFSS9EkB0OfKXE5tNm3P5/8I8V5t8Fw1lc28Ik4BPge4SFbykMR+s
NVSw2esdxNOMeYZWfR9Z25hOKjE59Q/feffbDzmo9QSHRMkheAehakPhnC3wUasa
2B6YMjUHyVQMSqdJ4lT3K8jAbWUqYdahC0g8KcdtK/cTwW/YQpsl3wdB2e0FCGlL
zb8bRPnZMPYHDs9P4gsG5cobfnyKWA1zbMbsZt6SjfV3J019sAiZtIhIrOT94F1H
KpSzMNhThu3DTGk9IpDR497qJHGT6/cMxB3vx8WsqRCAAzC+bFs=
=2DgU
-----END PGP SIGNATURE-----

--oGO/5wPBSPi5N4Jr--

