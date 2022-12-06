Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E07F1644ABF
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 19:02:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455429.712895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cGR-00037S-4P; Tue, 06 Dec 2022 18:01:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455429.712895; Tue, 06 Dec 2022 18:01:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2cGR-00034N-1B; Tue, 06 Dec 2022 18:01:55 +0000
Received: by outflank-mailman (input) for mailman id 455429;
 Tue, 06 Dec 2022 18:01:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Feu=4E=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p2cGP-00034H-Kd
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 18:01:53 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0f315dfe-7590-11ed-91b6-6bf2151ebd3b;
 Tue, 06 Dec 2022 19:01:52 +0100 (CET)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id E106232000E5;
 Tue,  6 Dec 2022 13:01:48 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Tue, 06 Dec 2022 13:01:49 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 13:01:47 -0500 (EST)
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
X-Inumbo-ID: 0f315dfe-7590-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670349708; x=
	1670436108; bh=7TKPutgfX1qVC7yoQqpbumrlzzl0+7KLDJGInnylJvM=; b=R
	lwLtwXwBei9J6KKTQhVYpj/KESabPru0cMotyfekx24gNzjkqLaSiaLo8mwwe2ci
	nFO3q/z0ITPC5b8qfScHVGHGdup0ElqgHMQElOQp+6RyHId+xUJXOEJMu1W93w5o
	rgnRm1G7MjGtVaedY437F3giFO/oaN2aqf4dZBAsiEgOqNitRQFQLhcuC9U18+IB
	UlY4SCtwqYIcVQ1v/DQ/ZxxQWfseUwTX7BKN0kJnFhyxXaE8q6eut+pP7TZIiMWK
	xEWVbRuI/yHOhS2ZeynmcjcesrlcL3ztn3nnzo2EumvXTlcyR4OvCnH6Lr6ZWcED
	pXUp2nuVRg7Ovlvj79eDg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670349708; x=1670436108; bh=7TKPutgfX1qVC7yoQqpbumrlzzl0
	+7KLDJGInnylJvM=; b=vUAiWqSlEUdqFpnpwEBkTS38u7G8N4bsqHS0rzCzr9yW
	4TxoBgwCQT72y8vlwKfZoQlsjNtx/9zDWrX/a6Al1RuOeuDhY/xSJ8JVrcNsJBSE
	JPOsstk85NK6tQZBElF2+qMjba3hsH1wAq56A+L/sa3IlX4GVmNzt4TDi/tDJtsx
	nXzvkVJZPuwzSu1EnJgCxGfRycnrJVGvXNvYw/CK6HXdHunoSEbyjo5BoRpjO7Tx
	pYa6UcVMJ80p7lhXdF+UKTcQa8rpRHnRhd5yOFcSOcTwvn1+wibitrZ1UQ5Z/BkX
	yTszXhvTfzT3ndFbVh134OPkDG/xGGFvOBsrdSFTNg==
X-ME-Sender: <xms:i4OPYwvrMfZDHkhxtrk_0bvbQSsJ8oRDH_sTUIbOph-n07sFl9d2Tw>
    <xme:i4OPY9cRhyxQsP6m78CkX2p5SEdhhe6OLvTHBHK4A5SqEHGYCaXwMJh6bFJ9bH0f5
    Mo6tg8JKfcjxVg>
X-ME-Received: <xmr:i4OPY7waHisdhfaEK6IY8MMtMrJuOW-_QWXKvVFwYnDyO_3KbeElMArlSe6A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigddutdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:jIOPYzO2CVoObFM5ulruPzUdMKwAWDIXBBu0daP7_QDqMTYmbn-38A>
    <xmx:jIOPYw8qHH3yNnQnJa7Pxv6RE5e4481ZRT23i0VsdFCnCaidqJsIXw>
    <xmx:jIOPY7X-gdt-BUMrRXP6Z6Xn-a33PXGE2IuVmE0AAZDrkJqYv6mrwg>
    <xmx:jIOPYwwp7DIJYYJ0i8JyMEAW3FDWwuTDUOA-SNqHdGDIu27WQFIKWQ>
Feedback-ID: iac594737:Fastmail
Date: Tue, 6 Dec 2022 13:01:41 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT
Message-ID: <Y4+Die8lcZUwwGmK@itl-email>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <9f0bd911ba6c7fe1b7285f232154d42807145ced.1670300446.git.demi@invisiblethingslab.com>
 <4b2a87e1-89d1-b5fb-bd92-b891c8cea98a@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NUHuSEMEyFXVxeJM"
Content-Disposition: inline
In-Reply-To: <4b2a87e1-89d1-b5fb-bd92-b891c8cea98a@citrix.com>


--NUHuSEMEyFXVxeJM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2022 13:01:41 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT

On Tue, Dec 06, 2022 at 11:38:03AM +0000, Andrew Cooper wrote:
> On 06/12/2022 04:33, Demi Marie Obenour wrote:
> > This is purely for testing, to see if it works around a bug in i915.  It
> > is not intended to be merged.
> >
> > NOT-signed-off-by: DO NOT MERGE
>=20
> Following up on Marek's report on IRC/Matrix, you're saying that this
> change does actually fix screen corruption issues on AlderLake, and
> something on TigerLake too?

Correct

> If that is actually the case, then one of two things is happening.=C2=A0 =
Either,
>=20
> 1) Drivers in Linux are bypassing the regular caching APIs, or

This would not surprise me at all.

> 2) The translation logic between Linux's idea of cacheability and Xen's
> PAT values is buggy.

How could I check for this?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--NUHuSEMEyFXVxeJM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOPg4kACgkQsoi1X/+c
IsH6mQ/+N2W/QbFTLcZd7JvOxLTMLOQvCpFUoZK/5zYLYzRuvkG5J0QMHdeVYLL1
6m0wwavvQX3wz9qjaaeB1D71325dPFn24HhGLJsskUCBRtw+gK0vhc9GhMcDGIiY
KOfeMqqtwjQOYxsbCl5y9HXMhVHYK2ExEqhY1t1gT0JgCJFlZZXIqseh0PT2CMDa
aViNs0FRAsBZyuHhLPL+xwzJ8bJEvUZZvM8OJyIJp+//JAyrwe24Jku4STUoMJkr
Yg7k96RHEzDxSDXXKMFzwDc1eaLXWn+Zk2BwPRbgmDN9JyUtlvqYzNINcWlT35Id
8V9/HHrNCppFE6q7adGgiw4u1xmpbzS5P3/d/fbfX+C6JpYG1OvdiD62On8232Vb
jn1epZnBuxcqCo8OcZrAzPjuiO43KBlbjIX0PhDCrI+sOUVZfuIGrIcEyEAbZ049
YFeFThqKOieV78NMMHvQSJ6YHBipzAU4SxAvhnJmMGbOi6kuvpiekQX8bnKZafBC
xPGZ5pjMyt7LNA8MKBNItFxcSde15xjIpQq9RyofvsPu6Tk3pY55r/dJiS3ugZla
GQNK10I8UKWI1sLqGvLha/pYHqVYzefsaKt9lyOXpcAf3WgieS75DBzJ3wAnFVs1
+uZpMR9ZzV2xVasxoH2/ac3pRKH9f++5bFKzqp8SNZu57hygW3M=
=sFqD
-----END PGP SIGNATURE-----

--NUHuSEMEyFXVxeJM--

