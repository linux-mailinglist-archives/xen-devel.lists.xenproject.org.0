Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41ADC1DD63E
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 20:46:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbqCn-0006cg-Gq; Thu, 21 May 2020 18:46:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/ZHf=7D=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jbqCm-0006ca-C7
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 18:46:08 +0000
X-Inumbo-ID: 543340c2-9b93-11ea-ab51-12813bfff9fa
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 543340c2-9b93-11ea-ab51-12813bfff9fa;
 Thu, 21 May 2020 18:46:06 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 281AC5C00B3;
 Thu, 21 May 2020 14:46:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 21 May 2020 14:46:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5vLYKu
 Xa+UUaGWnNM1CRpSE460GjOXDkyZjKCdT783g=; b=0KHI1XI5mrzKJUKfroMclt
 caUTTAnia0Qon+dGzPX/wRI2SOknY4bkod/GdNT2f0RxPuXNVd0BEtZgt55udaDf
 psD22x2ec17tAnU0Yj+HH7vbun1DKimUWva0SX98SBrnfc+r2A9QH3ZzG+BrXP3U
 wSI5kv86DwsKayk9LwQhW9Z83wimA2a0MyznQzwiCWiJmKaG+c+HaIoNpRDmcMWv
 5wC2CUwc1BUCrhGDOa1TjfPFI9i8lGEZZPI4D6IJhW3VxSgztcJ1E5h1UtxHNErt
 Z9PmKeo7z5/0/H28EerMW6KqkFT/1mvAlxwpsDO2UJH+ChYN2FkLCIIcZ7J/Ra0g
 ==
X-ME-Sender: <xms:bczGXqTWopXQpDgSc8qtXCEPUf9U7SAbPbN2Rnzhd_p09YKK_Zb8SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudduuddguddvtdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieek
 geeivdelkeejgeetkeelgeevgefhfeeghfffieehudeuteekueetgeetiefgnecuffhomh
 grihhnpehmrghrkhhmrghilhdrohhrghenucfkphepledurdeihedrfeegrdeffeenucev
 lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrh
 gvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:bczGXvzXUmL1HdDyECiX4Iav9VuYdxbb-p2Fq4JFeYjxLWIutkeGuQ>
 <xmx:bczGXn22Aufr2TGoqgHvvxB3f9Gf3f-jIO-8ISISerhrQgrSjhnrng>
 <xmx:bczGXmBtO7Jubmnk77hQyhgnyL6w0DxBlY7Uo1JBa5YjPDWzUs8HFg>
 <xmx:bszGXrbEzmw5gVwWBC4Tj0CHrR8SuUZbxOxzKVR3STZbQshtbYgJkQ>
Received: from mail-itl (unknown [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id C1469306645C;
 Thu, 21 May 2020 14:46:04 -0400 (EDT)
Date: Thu, 21 May 2020 20:46:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH] xen/events: avoid NULL pointer dereference in
 evtchn_from_irq()
Message-ID: <20200521184602.GP98582@mail-itl>
References: <20200319071428.12115-1-jgross@suse.com>
 <30719c35-6de7-d400-7bb8-cff4570f8971@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="KR/qxknboQ7+Tpez"
Content-Disposition: inline
In-Reply-To: <30719c35-6de7-d400-7bb8-cff4570f8971@oracle.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--KR/qxknboQ7+Tpez
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] xen/events: avoid NULL pointer dereference in
 evtchn_from_irq()

On Thu, May 21, 2020 at 01:22:03PM -0400, Boris Ostrovsky wrote:
> On 3/19/20 3:14 AM, Juergen Gross wrote:
> > There have been reports of races in evtchn_from_irq() where the info
> > pointer has been NULL.
> >
> > Avoid that case by testing info before dereferencing it.
> >
> > In order to avoid accessing a just freed info structure do the kfree()
> > via kfree_rcu().
>=20
>=20
> Looks like noone ever responded to this.
>=20
>=20
> This change looks fine but is there a background on the problem? I
> looked in the archives and didn't find the relevant discussion.

Here is the original bug report:
https://xen.markmail.org/thread/44apwkwzeme4uavo

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--KR/qxknboQ7+Tpez
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7GzGkACgkQ24/THMrX
1yygDAf/RzUmiuF2TM7HvZsoGQmZxnc+ZrcCx9F+FXoYyHUYYjyoj5hnMWPJit1g
GPLie+6PbPhjOyC+6tYK9TGgEv2HxyO8PNLTWDRDRnxrf8rBTqMKRvcbm8FYZV+J
9baXNldjf6TvgddPwik9bqetHX+e/QpyeovpcSOzbP1dXKWnxUbypEinsiNxtT97
vkiW/LfYtzb8arPdFVmVl/9YPmvk+080mm2eTQYARy7qVlM70zqsvtWBYQYFcxd2
N7OH7AoSARVyncbIT1B5bTrte9HTFB4ewJ1CvTvc3wOGDbUCiyVz7nDxNRQo6/S/
3x7RfR3nRBE3RwMeEj2cAdsgzOkI9g==
=oact
-----END PGP SIGNATURE-----

--KR/qxknboQ7+Tpez--

