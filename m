Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7A08527DC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 04:44:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679741.1057387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZjiD-00050v-BA; Tue, 13 Feb 2024 03:44:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679741.1057387; Tue, 13 Feb 2024 03:44:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZjiD-0004yP-6s; Tue, 13 Feb 2024 03:44:01 +0000
Received: by outflank-mailman (input) for mailman id 679741;
 Tue, 13 Feb 2024 03:43:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zAib=JW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rZjiB-0004yJ-50
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 03:43:59 +0000
Received: from wfout2-smtp.messagingengine.com
 (wfout2-smtp.messagingengine.com [64.147.123.145])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1b0a1464-ca22-11ee-8a4d-1f161083a0e0;
 Tue, 13 Feb 2024 04:43:56 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.west.internal (Postfix) with ESMTP id BAE641C00091;
 Mon, 12 Feb 2024 22:43:50 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 12 Feb 2024 22:43:51 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 Feb 2024 22:43:48 -0500 (EST)
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
X-Inumbo-ID: 1b0a1464-ca22-11ee-8a4d-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707795830;
	 x=1707882230; bh=96KYMZfSEqyIRUJtvm5SXgTmTOy/Iu9skirSS8EXVb4=; b=
	DPQgQPdtfTlaJyhbGKM4tr/ZhScmN6LhBk+Xw/P/lVo4iEMjxp3yeFVeY2HWVl8s
	qEUgNwBtiA4td7gOLOaNEcXu6KUN4zgs+FuL8APSD47WwqYxe7U5x+VtE5uhnr1J
	uNtpPnaUY8f2BAStdtUFr2+Al/drQdDFtX/NVP8+YNeYe68/9EaGaA6FPSjP3T4z
	9cZrlJH3J0+vUCTV4T7OBwoBA2cDl+sKeBCRs4m3rQTcVoVManHyCmNK9R8SM92X
	4Sof+3V4lcvpmD9/LybVohtWOvQxzVCZQR8lJdx31CO76mwHjzurvMmcHgSfBR+b
	hqaln//SfXZfSW5yCtPmSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707795830; x=1707882230; bh=96KYMZfSEqyIRUJtvm5SXgTmTOy/
	Iu9skirSS8EXVb4=; b=dQRgZojgePfM8Oyemh8Qg/L5RmwccRzn/CniCfJ4g+uu
	4srrUEGKwmqzoDSYQdtPLrLDvudrfuDJ2L5TC4IK4bwsYqbTT5gOPxe+6C5xJ4wC
	gGg1oNRhfu/loUo5tMDwYd5mxIUwt+guHylIOSmmG7k7Cw/2cUnGVxmuSpaCrSFB
	dqUS+Ly4IQAqD1LT6zAsYE+b3iCnfa8km59bvIZo8EzjM51NAECJPGflBqlhNoZr
	MY3Qm/L0DxWU2SGI6Eii0s/9HY2VlCwH/P9LFZbvogO6MMgmXM5G77AVwIJEY6v2
	n5t2LHCoQywUHPLNEQUJgp59vNLFUjATqgf5sch9eQ==
X-ME-Sender: <xms:deXKZTQVoadRmEaaulA5DuREve69b0Rr_uutm0ByHcLxRSTs9VYN7A>
    <xme:deXKZUzbiATMMGB9kwQsZRhgSmMAB7jmMifiuALrVRm6z4YwBy-X27eG9Oh_I7rqk
    p3nISuErc0dPw>
X-ME-Received: <xmr:deXKZY3_u-xjzpSan45SkMadHxlkHl7ItRMFkVCPN3N2OHsVUf3W4gcugYXqSuoo-Q0SVsISEImyT54uzskyxBlgpgp9dAXyYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudeggdeihecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeihfelhfekhefgveejjeet
    vedtgfduveelgeekteehueeufeefudegveejueefhfenucffohhmrghinhepghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:deXKZTDpg9T_hG2IRhBUkDmCkij6tIT_aom9wYLD2UaYU6i-Gf1Ohg>
    <xmx:deXKZcgtL9SmBpZq91hS0trEUg4y1m3rWieQ9hMYJ-X-18yMxj0JwA>
    <xmx:deXKZXrKfuA0EUe3r9AzHBjr8HGJp6V23qgMpKMJ0PzP1rJMZV5iNw>
    <xmx:duXKZXUvDpmU-uZmB8GsmfleiRGV0ZwdnKY4xTr36PtakUV7D-FsUzXG_CM>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 13 Feb 2024 04:43:46 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Message-ID: <ZcrlcuNU9y8WymiK@mail-itl>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
 <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
 <4530606b-1b5e-47a4-aa41-e12e9178b06d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VRYmdlhezWG4ObHs"
Content-Disposition: inline
In-Reply-To: <4530606b-1b5e-47a4-aa41-e12e9178b06d@suse.com>


--VRYmdlhezWG4ObHs
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Feb 2024 04:43:46 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers

On Mon, Feb 12, 2024 at 10:04:38AM +0100, Jan Beulich wrote:
> On 08.02.2024 23:00, Julien Grall wrote:
> > On 05/02/2024 13:27, Jan Beulich wrote:
> >> In preparation of dropping the register parameters from
> >> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
> >> register state needs making available another way for the few key
> >> handlers which need it. Fake IRQ-like state.
> >>
> >> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> ---
> >> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsistent wi=
th
> >> other console poll functions we have, and it's unclear whether that's
> >> actually generally correct.
> >=20
> > Is it? Looking at ns16550_poll() we would pass guest_user_regs() if=20
> > run_in_exception() doesn't exist. But looking at the caller, no-on seem=
s=20
> > to care about the 'regs'. So is this just a latent bug?
>=20
> What do you mean by "doesn't exist"? ns16550_poll() assumes it exists.
> And I can spot any use of guest_user_regs() on the respective generic
> or Arm-specific bug.c paths.
>=20
> > BTW, do you have an idea why the poll function is not run in an=20
> > exception handler?
>=20
> "The poll function" being which one? If you mean the one in xhci-dbc.c
> then that's why I had Cc-ed Marek. Moving him to To: - maybe that
> manages to finally catch his attention.

TBH, I don't know. That's part of the original xue patch at
https://github.com/connojd/xue/blob/master/patches/xen-xue-dbgp.patch
and it works for me as it is.

> >> Andrew suggested to move set_irq_regs() to BUGFRAME_run_fn handling;
> >> it's not clear to me whether that would be (a) correct from an abstract
> >> pov (that's exception, not interrupt context after all)=20
> >=20
> > I agree with that.
> >=20
> >> and (b) really beneficial.
> >=20
> > I guess this could help to reduce the amount of churn. I can't really=
=20
> > make my mind whether this is worth it or not. So I would keep it as you=
 did.
>=20
> Good, thanks.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VRYmdlhezWG4ObHs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXK5XIACgkQ24/THMrX
1yxyxQf/fYWlS65gDO42ftVko/W0ePGo4k8FIO3VFzxzBulu0VIh3Lf+L9CxIjgj
1flsR3OZ9r06z6CvcZocuBRnb6miXJzB0LrcLjroLVLrGvrMVpUfukTVrDSxfty4
XM0AFAFnyAwe60XMjmWdKjBW6r8a5pSA56jCNuwpiH4vlMK2kyAUhOPwwl1QU0vd
D4qo2ufxzJ2zEgcFjTg7JEEmiUhoSM46rNteCC84lT8+nl04msauN9UlWkDIKdhw
yJ67zRtAJ80k1RJY/ZSaHOqqZIAE6nw7dkXOFLQV+kE9J+2ZXqPinHZ3IGEmQCMq
9w/Tus0VKAIKiuX/OpI0bZVwHVRJlQ==
=dVoS
-----END PGP SIGNATURE-----

--VRYmdlhezWG4ObHs--

