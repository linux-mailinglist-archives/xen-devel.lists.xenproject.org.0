Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2641824237
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 14:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661787.1031494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNN0-000061-Lw; Thu, 04 Jan 2024 13:02:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661787.1031494; Thu, 04 Jan 2024 13:02:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLNN0-0008Vw-JD; Thu, 04 Jan 2024 13:02:46 +0000
Received: by outflank-mailman (input) for mailman id 661787;
 Thu, 04 Jan 2024 13:02:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bqCR=IO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1rLNMz-0008Vq-I6
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 13:02:45 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a5ec5c6-ab01-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 14:02:43 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 849063200A74;
 Thu,  4 Jan 2024 08:02:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 04 Jan 2024 08:02:38 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Jan 2024 08:02:36 -0500 (EST)
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
X-Inumbo-ID: 8a5ec5c6-ab01-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1704373358;
	 x=1704459758; bh=zPx0OILoY20c1cPR6PBAV8PCQwNt0l5e11x0PpcZyGA=; b=
	p4Un+SUqAa7mMHsyAvqE6rsvid6OLWu6kP0w98WBgJUDuuhkTu2j/7WR68x9aLvH
	ACOoAvxJvPI/HGPNr/M40W6TeSvqDBR/VC2yRetd/Pr7doNMvFs0tNYD5TLXSttE
	ZZpiKkJIfAn282JVaxLrKzszxG31ha448nmToOhBOGAhChq1e5qLjVWPplZ0bsa8
	W0bjorc1EA0AD3z6Qojy5DNjlZFoob4+okj5qAdkP0zu5Karb3AbgI4wBGSnjBXy
	tumcJMEtL3bRn7j0YMj6GjXaR2JsCl3VjfV2F152g9M8qSpFmDBv+8COQEjmb/MM
	XLRkDaBwsMRE/cdElEzNTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1704373358; x=1704459758; bh=zPx0OILoY20c1cPR6PBAV8PCQwNt
	0l5e11x0PpcZyGA=; b=MTPoG/o8qScyHXqQoECWGHuq056iOTKI2ah6F1BjLKvT
	IBU1AmQBr5hrx9xEvA7bQkECde4DVsp9l03A78UlDi+rXmMIR9dTpZ8Opvll1QZP
	CNFVTjZGDa7ri6UWiSK50FTQqrHg/naKGrT7Y6Xm9igjsYuNyILA9lCs+CeWrK7P
	rO0BWJY30PqEe90z/uJfocMLstMOV/5GkC8bbe/k+xKvdsibOs2Lkqct1Bui+yaf
	/1augszcCW/mal6P4Gl3WMbASHqlU0mzcKvoma2275+ELFtidU3julnReZvW/CNc
	YI8oHq9zej7UXJHUvudE1Xxwtc/tHbL9t/SLLN4lXw==
X-ME-Sender: <xms:bayWZdQyA3LtLSofejKj7Oy67raukR06FtvCUCd7HGIOh2gaZXL2wA>
    <xme:bayWZWw4bWY5B8VgxJwAVWPbxOfHaBeUCNqFGV1YRUqWs3klOwu1E7QmoHoNK-vVd
    7Czdtk9ym8qww>
X-ME-Received: <xmr:bayWZS1mImDM2z7ITjx0vu5reRMjFU74D1mVJgkz-qHGe7dsI8RxTeWwny22TErn2cVHbicxEbhloTXiU6t7hpeDskzy3d70mA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrvdegjedggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:bayWZVBb0VJQkRKMQtXtle9DxacAwNwLyJyxd0l-TlwXSsWDbAl-oA>
    <xmx:bayWZWiFMSWkq8HNkB_dUiauKlnhk_a_RNqq8przmC6KsFWc5t2R4w>
    <xmx:bayWZZrZtwCsTDEFo9xUNsGHf1GuV1QoEVFDkqqQaXoMidx7cfH1IQ>
    <xmx:bqyWZceMf7V-DIZgOHagR2wEIV32CgpfIqKR9EWxNLni6ufJkeyzEQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 4 Jan 2024 14:02:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Serial console stuck during boot, unblocked with xl debug-key
Message-ID: <ZZasam3zMBtrGvte@mail-itl>
References: <ZY6WdQlbdQxb1UR2@mail-itl>
 <7d5ecc76-ecd3-4940-b658-fee60e3ab740@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TCsDXA/P7EK/jcos"
Content-Disposition: inline
In-Reply-To: <7d5ecc76-ecd3-4940-b658-fee60e3ab740@suse.com>


--TCsDXA/P7EK/jcos
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Jan 2024 14:02:32 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Serial console stuck during boot, unblocked with xl debug-key

On Thu, Jan 04, 2024 at 12:59:28PM +0100, Jan Beulich wrote:
> On 29.12.2023 10:50, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > This is continuation from matrix chat. There is an occasional failure on
> > qubes-hw2 gitlab runner that console become stuck during boot. I can now
> > reproduce it _much_ more often on another system, and the serial consol=
e output
> > ends with:
> >=20
> >     (XEN) Allocated console ring of 256 KiB.
> >     (XEN) Using HWP for cpufreq
> >     (XEN) mwait-idle: does not run on family 6
> >=20
> > It should be:
> >=20
> >     (XEN) Allocated console ring of 256 KiB.
> >     (XEN) Using HWP for cpufreq
> >     (XEN) mwait-idle: does not run on family 6 model 183
> >     (XEN) VMX: Supported advanced features:
> >     (XEN)  - APIC MMIO access virtualisation
> >     (XEN)  - APIC TPR shadow
> >     ...
> >=20
> >=20
> > Otherwise the system works perfectly fine, the logs are available in
> > full via `xl dmesg` etc. Doing (any?) `xl debug-key` unblocks the
> > console and missing logs gets dumped there too. I narrowed it down to
> > the serial console tx buffer and collected some info with the attacked
> > patch (it collects info still during boot, after the place where it
> > usually breaks). When it works, I get:
> >=20
> >     (XEN) SERIAL DEBUG: txbufc: 0x5b5, txbufp: 0x9f7, uart intr_works: =
1, serial_txbufsz: 0x4000, tx_ready: 0, lsr_mask: 0x20, msi: 0, io_size: 8,=
 skipped_interrupts: 0
> >=20
> > And when it breaks, I get:
> >=20
> >     (XEN) SERIAL DEBUG: txbufc: 0x70, txbufp: 0x9fd, uart intr_works: 1=
, serial_txbufsz: 0x4000, tx_ready: 16, lsr_mask: 0x20, msi: 0, io_size: 8,=
 skipped_interrupts: 0
>=20
> The only meaningful difference is tx_ready then. Looking at
> ns16550_tx_ready() I wonder whether the LSR reports inconsistent
> values on successive reads (there are at least three separate calls
> to the function out of serial_tx_interrupt() alone). What you didn't
> log is the LSR value itself; from the tx_ready value one can conclude
> though that in the bad case fifo_size was returned, while in the good
> case 0 was passed back. At the first glance this looks backwards, or
> in other words I can't explain why it would be this way round. (I
> assume you've had each case multiple times, and the output was
> sufficiently consistent; that doesn't go without saying as your
> invocation of serial_debug() is competing with the asynchronous
> transmitting of data [if any].) It being this way round might suggest
> that we lost an interrupt.

That is my current hypothesis too. Either at the hw level (being masked
for some reason at some point?) or on sw level (somehow not calling the
handler - that's why adding skipped_interrupts).

> Is this a real serial port, or one mimicked
> by a BMC (SoL or alike)?

This one is a real serial port. It isn't fully reproducible, but
happened sufficiently often that I'm quite sure of the above info.
Yes, my serial_debug() can interfere with data transfer, but I
intentionally added it significantly later than the issue happens (I
realize that console output end may not directly coincide with actual
time of the problem due to async sending, but still IMO should
be good enough). I later moved it to keyhandler, but that didn't give
any more info.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TCsDXA/P7EK/jcos
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmWWrGoACgkQ24/THMrX
1yzoXAf/TA87SDCCPz8xEaFXrLERP7ZYylNyi+9JSIf86ChblIaA5HYCfyhKI+YN
NAYP3RXJcX6hu8C7IaeSdx8i0xHJ15QSgw7EEXxZTiRbqvUK8p5P2C0HwHuIC2c2
FGCinajaY0TTk1nd+wpFBLZulZxjT8ZsNWX7yWSVBhbgJxstybcr5sOtdGGezRa3
hDjR3KKo2WKTqAe3AExCi7xa6pcKT2qDth2TkXElj47w98pShVdP2dzokq7i1aYO
Yco0lCwsPLPs+wZZ30hQmInBBLJ+OlE17d5wNF+q6aTzfi5+fKzNlniUjCXljH96
GsUtE3/MSoLRKubFzDQ9kyVRUpFf2w==
=eCqL
-----END PGP SIGNATURE-----

--TCsDXA/P7EK/jcos--

