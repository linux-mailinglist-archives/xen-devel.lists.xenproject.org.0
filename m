Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFBwELmypWlMEgAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:54:33 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 915221DC383
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 16:54:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244430.1543873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5b4-0001xP-4u; Mon, 02 Mar 2026 15:54:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244430.1543873; Mon, 02 Mar 2026 15:54:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx5b4-0001uf-1R; Mon, 02 Mar 2026 15:54:14 +0000
Received: by outflank-mailman (input) for mailman id 1244430;
 Mon, 02 Mar 2026 15:54:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vx5b2-0001uW-R0
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 15:54:12 +0000
Received: from fhigh-b8-smtp.messagingengine.com
 (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0cbe06f4-1650-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 16:54:10 +0100 (CET)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 506227A013F;
 Mon,  2 Mar 2026 10:54:08 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 02 Mar 2026 10:54:08 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Mar 2026 10:54:05 -0500 (EST)
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
X-Inumbo-ID: 0cbe06f4-1650-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772466848;
	 x=1772553248; bh=o9cpGhld9lKXfSpgy3pgdi3vK+UFWbk2cVYvl3BrPTE=; b=
	qoujYvowuv0hlW6ILJCddnCZk39UxGyVdesGfyKns062zK89BtQWw13lINoXjF9A
	oiS5ZgBVGsGxSESKilaajAP2x8WOo9ATJRDKOCe7mtx9mAMrOWY0wTFKoFV3v55e
	K1tQh5/GyWZ2RaL1TW4oJNmNRao7549DDI2g1RgHAcdZ1M2I7rWLcALLx4ekByhR
	aoxz3jsBlwvJKgmS9kcnNQlnDb6KX7gyQZPhAJPYN1VflMHvW8S8GvmGWUk5w5G5
	rq9jn19ipNvwls5dfNn/NflHVpFA+VYSAVu0ZmpGsO1g+0N0fKiK+ZZGGMOzHWMa
	Mojhceauqp9e2mXvsVlWCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772466848; x=1772553248; bh=o9cpGhld9lKXfSpgy3pgdi3vK+UFWbk2cVY
	vl3BrPTE=; b=f1Ya3sPAczrvg7ue54hXKyb+bNEgut0Gs2BemEz4JipZDHJrES9
	9fL/afWtsSU0iLQadwUhoaXkHP3CiH1ny4LWzE6+xJHkjC1VarCuusNjBTGOIbTA
	Klh5gc647k0928ZDAB67BmcS38zCciBY9+RJCEXXKb/lDelco43+wW7u4DXGHEKw
	O4LbgF4/Ly8ONwWym8NJzPliDYn8XTd0T6hPH3iq/Rx7aSlkixsHsyLGhEZhzTi1
	U5acSQ/jSYy1NnuSN6OoPynEiISOZgxTbvwFOMNZ1pel9BSd3I7S/ORrXYX+QSHc
	Z4jKHMtakqUAYf3Kbn9JNbacD+SIEr1F9gA==
X-ME-Sender: <xms:n7KlaZ3FspZV3KNRW8DCHWN2647vIhXJuPyrXCVqpESrqFuamvn7TA>
    <xme:n7KlacoYMZL_v4D0PRiOwP9Nw54_dOScRgeFT8sPCPbhFIuwI_q_nirRm-yRtOE-P
    nbRNJFJ9f2esJQplGfN70pL_paZW4Hp8Do5YrL13Q_K_3qa1g>
X-ME-Received: <xmr:n7KlaeVCC9UXKSFekSR-S2Un06MQ4vHL1NpIaM6wq8DekM1Zfr4YAhDfZ8OB_VfAcbvrRD5hbRPVgOrWDVi0OmTlgmJ204eSfQE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheektdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddtpd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrghsohhnrdgrnhgurhihuhhksegr
    mhgurdgtohhmpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtohhmpd
    hrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdho
    rhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrd
    gtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthho
    pegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpthhtoheprg
    hnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtthhopehmihgt
    hhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjuhhlihgvnhesgigvnh
    drohhrgh
X-ME-Proxy: <xmx:n7Klado6dkUdhUjz6yB7cTmRKM2bRB_SpREdJ6r78bzK4CzcNqZkOw>
    <xmx:n7KladDCTHUb0wFHTfJcEus0z29VMz-3tWrCvTOXB-a9GjbkcQehBA>
    <xmx:n7KlaRhKeLmpjg7ReTiW7TiNbsd2iJYU5OD6swJhOZfHLVa25xYgXQ>
    <xmx:n7KlaTaFqbyURNmgGJ8mJa553U2m-j8isg13FRjpqA9lBKUSsORCOA>
    <xmx:oLKladZDmgsj96m8_IFiNXsDLxA-Jr1CTAzipjwvmC0yY1FcbIrEz2DL>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Mar 2026 16:54:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/efi: remove unreachable efi_halt_system() function
Message-ID: <aaWynPgeN3ffCekp@mail-itl>
References: <20260224200708.51120-1-roger.pau@citrix.com>
 <c0241f4d-98ba-4b35-94d0-53938b85c6ee@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="r+mswVBtSV8/6BKu"
Content-Disposition: inline
In-Reply-To: <c0241f4d-98ba-4b35-94d0-53938b85c6ee@amd.com>
X-Rspamd-Queue-Id: 915221DC383
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,lists.xenproject.org:rdns,lists.xenproject.org:helo,citrix.com:email,messagingengine.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jason.andryuk@amd.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:dpsmith@apertussolutions.com,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:julien@xen.org,m:sstabellini@kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action


--r+mswVBtSV8/6BKu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Mar 2026 16:54:03 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jason.andryuk@amd.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] x86/efi: remove unreachable efi_halt_system() function

On Tue, Feb 24, 2026 at 02:05:10PM -0500, Jason Andryuk wrote:
> On 2026-02-24 15:07, Roger Pau Monne wrote:
> > After e4c3755d4dd7 the function efi_halt_system() is unreachable, remov=
e it
> > from the file.
> >=20
> > No functional change expected, as the function is not called.
> >=20
> > Fixes: e4c3755d4dd7 ("x86-64/EFI: don't call EfiResetSystem() from mach=
ine_halt()")
> > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>=20
> Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--r+mswVBtSV8/6BKu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmlspsACgkQ24/THMrX
1yzhgAf/aH/IgRfFV9MYPW+CFSrrBrHtkIu3i4EqN1ph/3vWl8wGAlImUbcl9Z+C
ZPhTxFiUkhFXqfeuTC7H/cn/RvH7NC0rafeuuKmT8KBVDpSnhNjJxe/9giX/B6VV
g2mW+eCHnz5UaXfWWrO/wODv+lrCzoIa3Yqr/bezA5wKm8V8P4BPbIsx0mkfybvl
GcLpwa7zBjgN4P76MxsliCJ/rpIRdJ3QFA7gJ0vYSwxQCx9r81d8jUeWHGqECrY5
DF4z3nvmNVUnwwVL5ZI/2rwD6HfWmrJb55+y3FTiOsZ7/GZjDM82a1Nal4FnuRk/
6WSackBOB8xY7C+KB0KH+AEI6kBhbw==
=7DhU
-----END PGP SIGNATURE-----

--r+mswVBtSV8/6BKu--

