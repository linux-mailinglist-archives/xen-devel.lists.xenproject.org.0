Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312636CC01B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Mar 2023 15:04:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.515793.798973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph909-0003fq-J5; Tue, 28 Mar 2023 13:04:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 515793.798973; Tue, 28 Mar 2023 13:04:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ph909-0003dL-Ey; Tue, 28 Mar 2023 13:04:37 +0000
Received: by outflank-mailman (input) for mailman id 515793;
 Tue, 28 Mar 2023 13:04:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B75i=7U=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ph907-0003dB-Ah
 for xen-devel@lists.xenproject.org; Tue, 28 Mar 2023 13:04:35 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 153fb636-cd69-11ed-85db-49a42c6b2330;
 Tue, 28 Mar 2023 15:04:34 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AED355C00AE;
 Tue, 28 Mar 2023 09:04:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Tue, 28 Mar 2023 09:04:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 28 Mar 2023 09:04:31 -0400 (EDT)
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
X-Inumbo-ID: 153fb636-cd69-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1680008672; x=1680095072; bh=pL0tLrc9qM4OsGACRy2e5LYzD34JTezhh9/
	AUatTcTg=; b=k8Z4pm1s/MV7EX4yG/c7iIUuzZOrMnuW/zO75he9eFa96AbMMdc
	904+H1wHIZym6tGIaenIhuwPN1LA7Y0YckBYyi+gS7ndXYeBgdwS85rCcW20c3SJ
	k/gDr+yY+uq94TU5AGjyJ/m05QzTdGY1cKqboCqWHJMlrilgDmgodu5ag/YC18HS
	1Z6pT//dtVHrNyek5rCi+/eGqZSRLWWRMd7XkyDzAsk/79pDMuDZH+P557okhSPk
	p4Muy+JLarSVHRmV1I2eXxz01iABt+SzuGFrgC0D6LBxgZAcZWUlDux1fLiivh3H
	Qp2UAA6+zbBfYNDjszEP2t+5KqqUYsgVshg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680008672; x=1680095072; bh=pL0tLrc9qM4Os
	GACRy2e5LYzD34JTezhh9/AUatTcTg=; b=ZbcJkeUjwgXcUo7frujIpjg3uQNSm
	JjiVkQ1Gp8s61sVNtgOHYI+4hLMiqUBo8DxeiwsJVGzZoxC3xpJX9/PevtkEcXgo
	syMijTkjSIjzdOzHdXpi5tYmXyEefGmEzuAzSdrSCU4q9viG208gDh7rj3AXUjMs
	I/c947cJeF2+5p0c4XFwKHkzOMKKtwXVBTMEm3n8L59COiInM9wEVQePpweSMjhu
	0Dw1eywo+JLRI970ypVMvNpMppKxKu+EY1Sog6vRlZ8vhR7s58wwAQtpnWRdRQA3
	oPm23HkrMJN7c3EU5VAa1JtS5835exSN/4PV4+Dl7Wzl3oagEp8PTNiBQ==
X-ME-Sender: <xms:4OUiZHfPek84W-55uAJZT46o5_8yoQI_5a6DyPw5NueIKMALZu9rTg>
    <xme:4OUiZNNbWeniZkQxncTfk_IaLPOELVYdSPgKQyZW6bPLAPTyxULbJ0zNpw_Th_fUa
    OsAeQIkhDQVOA>
X-ME-Received: <xmr:4OUiZAgDcDs5viQaicLOlso-uPkQ4Vx9lPaNVi9JkNLL8yJ3Uy8hXIM4BOyRLo_eAqHcOG5MREFVTSNhG8K6YCQXDhCNcpuMhmM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehgedgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:4OUiZI_mrfFktsxx-GoZyWv13k3l6WOcDwUkRyQP_ZSss1S8D2cQAg>
    <xmx:4OUiZDtpR-5zfmq4oJW_t33Tkurx1ZYrk_pcr1YrenES5sDHS06VeA>
    <xmx:4OUiZHFsPUp7J3RjCijDK1RSLA0LwPHxV9RM91QMEC1f_cLrm03p3g>
    <xmx:4OUiZM5C4qh9grm1UdM_h0i_jQBfubhNKXuO10PJ-bepyEa_gHhsbA>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 28 Mar 2023 15:04:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot
Message-ID: <ZCLl3ePLgrmFTViV@mail-itl>
References: <20230325024924.882883-1-marmarek@invisiblethingslab.com>
 <20230325024924.882883-3-marmarek@invisiblethingslab.com>
 <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2FN9AqTqpoC1MuGg"
Content-Disposition: inline
In-Reply-To: <5cfcfb7a-df50-fbe4-89e6-611a83991790@suse.com>


--2FN9AqTqpoC1MuGg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Mar 2023 15:04:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jason Andryuk <jandryuk@gmail.com>, Paul Durrant <paul@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2 3/3] x86/msi: clear initial MSI-X state on boot

On Tue, Mar 28, 2023 at 02:54:38PM +0200, Jan Beulich wrote:
> On 25.03.2023 03:49, Marek Marczykowski-G=C3=B3recki wrote:
> > Some firmware/devices are found to not reset MSI-X properly, leaving
> > MASKALL set. Xen relies on initial state being both disabled.
> > Especially, pci_reset_msix_state() assumes if MASKALL is set, it was Xen
> > setting it due to msix->host_maskall or msix->guest_maskall. Clearing
> > just MASKALL might be unsafe if ENABLE is set, so clear them both.
>=20
> But pci_reset_msix_state() comes into play only when assigning a device
> to a DomU. If the tool stack doing a reset doesn't properly clear the
> bit, how would it be cleared the next time round (i.e. after the guest
> stopped and then possibly was started again)? It feels like the issue
> wants dealing with elsewhere, possibly in the tool stack.

I may be misremembering some details, but AFAIR Xen intercepts
toolstack's (or more generally: accesses from dom0) attempt to clean
this up and once it enters an inconsistent state (or rather: starts with
such at the start of the day), there was no way to clean it up.

I have considered changing pci_reset_msix_state() to not choke on
MASKALL being set, but I'm a bit afraid of doing it, as there it seems
there is a lot of assumptions all over the place and I may miss some.

>=20
> > --- a/xen/drivers/passthrough/msi.c
> > +++ b/xen/drivers/passthrough/msi.c
> > @@ -48,6 +48,13 @@ int pdev_msi_init(struct pci_dev *pdev)
> >          ctrl =3D pci_conf_read16(pdev->sbdf, msix_control_reg(pos));
> >          msix->nr_entries =3D msix_table_size(ctrl);
> > =20
> > +        /*
> > +         * Clear both ENABLE and MASKALL, pci_reset_msix_state() relie=
s on this
> > +         * initial state.
> > +         */
>=20
> Please can comments be accurate at least at the time of writing?
> pci_reset_msix_state() doesn't care about ENABLE at all.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2FN9AqTqpoC1MuGg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQi5dwACgkQ24/THMrX
1yy2qwf+O7LltHLiXvyHxdz07WNEGXP6yOXyDd/KS1xmYHxklWaswAT31cwVROsF
Pez5/dyhaV61leAvJ7Y2DIIKXUWh+9/0hW3jXnGqhbTHolaqcxb40OhBmF2qjOoe
MAqQuVjAvXku5wxEqRYIukrehP0gEsU4D7qWZJGpdj+Xd5bkXiK8D6gPu2gtYoCx
Ov6GuMEc0dDrVwNLKWZtwhQ8BYHqSvpU6KFQok2jqUp2MDVxjGdaQ8UojDaZm/gg
X5foNfgSPVJIT05BeHjMMOsIwswlkVXsyEQ3qtwUdwxiUkRr/Oj+214yn0NJlR9u
tGdPmlAjgiTelxeWmKABAUxHjL+uVQ==
=NG7A
-----END PGP SIGNATURE-----

--2FN9AqTqpoC1MuGg--

