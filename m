Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F658AB6A
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 15:12:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381235.615832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJx7Z-0005Lk-1U; Fri, 05 Aug 2022 13:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381235.615832; Fri, 05 Aug 2022 13:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJx7Y-0005Ir-Uw; Fri, 05 Aug 2022 13:12:08 +0000
Received: by outflank-mailman (input) for mailman id 381235;
 Fri, 05 Aug 2022 13:12:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3gIk=YJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJx7X-0005Il-NG
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 13:12:07 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 33a40cd9-14c0-11ed-bd2e-47488cf2e6aa;
 Fri, 05 Aug 2022 15:12:06 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 18C8932008C3;
 Fri,  5 Aug 2022 09:12:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 05 Aug 2022 09:12:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Aug 2022 09:12:00 -0400 (EDT)
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
X-Inumbo-ID: 33a40cd9-14c0-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659705122; x=
	1659791522; bh=bx1uynbDvPEOaeRQsheEo3fUrtNzutH+a0nifpI6Ek8=; b=c
	L10tn/4ozEbYqxYqysVsNPofRDrtlbPvFPVeVScvsDYADR7WtHb73DPTQNERrdJs
	PQoTvRTRQS77WHS6yvzulWJBs4SS3RPz/p1CvzUxDRbA+WFjvdC6Dw0R6ByBnAh+
	TX4PJGCgcYACEnDY7N6L3Lr+57EEs6SvhU692TUiLCPENvuInT3cZu110WIcCHRs
	ed6Fj7xqCMmNtgxMu6kp17phth74HggQ1e2FocHARCfw4fUm+vULqC2kH6/eH0eY
	Ktb0oaTmSilkcyPGiJ6nxDc/XZz/d3S+m1e0lHVarvp/R+EE1N+4px+stb5ooD7G
	UjhXw7PvcMLEe0KdYMjNA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659705122; x=1659791522; bh=bx1uynbDvPEOaeRQsheEo3fUrtNz
	utH+a0nifpI6Ek8=; b=SsQ6M7QJuHGHcukY3mKWHUW6VvohsxO+UzEuCIc4WULW
	W+BBnFsq1qLTTPONldMSQcCFRj23LCxZALLZN3mWCn3nmYqm8UkWw0ZxS97QdWQU
	aCLT4do8gzSlJcxVxTK/bZOxqTFQTYoz+8Z5Ept7mZFgiggO6arHoJzhMyuWGWl2
	dr9QOu90aAZtFBYg6HgjrLwWn7NKmk0QtaAsVQ19iDjdUXcfMQYyyZOhwtx5wKi/
	+9gb+1ETTT3OWTol6lLtb6TjTLsYCH5s9K7GjNs3LBTVuRcz4Ev867NXC7HN7Z+A
	JZvlY7gz6Dsf7J0Uok1biUOTtiFXL+AY4WqpHWDMtw==
X-ME-Sender: <xms:IRftYk-s9glKhaJLMnr14lGA795QYqrTReVwABz1BtNudkUw0hQbEA>
    <xme:IRftYstzoH8KPIsaZ4Q7ftBLU6BLrJv50efJ_bRDkIxHcW6CeT1svWyoe2_1QZTaq
    Ae40m6AvTW5qQ>
X-ME-Received: <xmr:IRftYqAH3j_zglcNbcE9MXlPgwm_yym44uFn2v3iyJO1EEPO1ln5mWqnAi8WvFL59yxre_VhcDMFsVWb9P8W--8ARyX4zdYs3Ohn>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdefuddgieegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:IRftYkdrxrhGcFUrdYC7mLhmrOqtCXUY6akdjwBlZka7RdibEH7_gQ>
    <xmx:IRftYpM7laRMUhh5K6RXhYTeoDl6gnhiMahex7kOvgyqLN7ASqbkyQ>
    <xmx:IRftYukLew3UG70nD1tFTCuIa8lDUDI2F88A0Klv2lli9gywlC9ekA>
    <xmx:IhftYurksyIvl7Rqevggqo25ynQWwsMEW1Ckc5sqcXswq9lG_fma6g>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Aug 2022 15:11:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 04/10] console: support multiple serial console
 simultaneously
Message-ID: <Yu0XHUhsebE+WG0g@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <14411aa674b61d22d9626a3455206454793b6a37.1658804819.git-series.marmarek@invisiblethingslab.com>
 <48ec7c43-d9cc-e6da-dd06-1119d5a909e1@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iL6KS72HvcTwiigy"
Content-Disposition: inline
In-Reply-To: <48ec7c43-d9cc-e6da-dd06-1119d5a909e1@suse.com>


--iL6KS72HvcTwiigy
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Aug 2022 15:11:57 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 04/10] console: support multiple serial console
 simultaneously

On Fri, Aug 05, 2022 at 09:41:09AM +0200, Jan Beulich wrote:
> On 26.07.2022 05:23, Marek Marczykowski-G=C3=B3recki wrote:
> > Previously only one serial console was supported at the same time. Using
> > console=3Dcom1,dbgp,vga silently ignored all but last serial console (in
> > this case: only dbgp and vga were active).
> >=20
> > Fix this by storing not a single sercon_handle, but an array of them, up
> > to MAX_SERCONS entries. The value of MAX_SERCONS can be chosen in
> > kconfig, the default (4) is arbitrary, inspired by the number of
> > SERHND_IDX values.
> >=20
> > Make console_steal() aware of multiple consoles too. It can now either
> > steal output from specific console (for gdbstub), or from all of them at
> > once (for console suspend).
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Actually I should have clarified yesterday that despite my effort to
> review this change, I'm not convinced of its need. I simply don't see
> the use case of having multiple serial consoles at a time, and afaict
> console and gdb connection can already be run over different channels.

I agree the usefulness is limited. I needed this only to debug the xhci
console driver itself. But since I did this change already, I figured
I'd share it as it might be useful for others in similar situation.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--iL6KS72HvcTwiigy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLtFx0ACgkQ24/THMrX
1ywCqwf+L8TOcTbsS9UtWNKvvaSbITWjqyXOg17F0oaWLNs+D2yPuJ2Blmk0/xw/
3Rk1uGEkIr4SZnv0n2RwplAdh5JgJFA9xVQt+oiqJrui3Gsdzagou1Dpy3gWtEx4
6VJd4xJZrXG/7gaDbsNkc/sAwMsWkwPgo7qgVktvFxKSK9hc2IAPr5YfSg4lEhQr
ijblvXGnL4AdeRQpSxnIKxC3OVgVVmcbP5APUabnpdoEXelYmQcXGeCl5Xj824jV
JowXGxNVb+nhsu1vnrElyn2uAKt344bRExsrdxH+/BaVAzuLOPVD3oIaa2XjEG9w
/k4ukUc+Jg2kCV1fOjnSWPa5xiRe0w==
=a7hR
-----END PGP SIGNATURE-----

--iL6KS72HvcTwiigy--

