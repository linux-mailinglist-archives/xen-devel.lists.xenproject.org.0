Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uBJZLLxK2Gm0bAgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 02:56:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB993D0F06
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 02:56:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1278241.1563160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB0A9-00041q-MD; Fri, 10 Apr 2026 00:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1278241.1563160; Fri, 10 Apr 2026 00:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wB0A9-000401-Ix; Fri, 10 Apr 2026 00:55:57 +0000
Received: by outflank-mailman (input) for mailman id 1278241;
 Fri, 10 Apr 2026 00:55:55 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wB0A7-0003zv-D3
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 00:55:55 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wB0A5-0072Z5-Vu
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 02:55:54 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d84a94-bab6-0a2a0a5309dd-0a2a450bd66c-2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:55:53 +0200
Received: from [103.168.172.148] (helo=fout-a5-smtp.messagingengine.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d84a98-bca8-0a2a450b0019-67a8ac9483c1-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 02:55:53 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id D4F12EC010A;
 Thu,  9 Apr 2026 20:55:51 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Thu, 09 Apr 2026 20:55:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Apr 2026 20:55:50 -0400 (EDT)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=fm2 header.d=invisiblethingslab.com header.i="@invisiblethingslab.com" header.h="Cc:Content-Type:Date:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To"; dkim=pass header.s=fm2 header.d=messagingengine.com header.i="@messagingengine.com" header.h="Cc:Content-Type:Date:Feedback-ID:From:In-Reply-To:Message-ID:MIME-Version:References:Subject:To:X-ME-Proxy:X-ME-Sender"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775782551;
	 x=1775868951; bh=b87heE5fmUBkJe8ZsnevojmlzceS4TdE1O/6Hxi/swI=; b=
	FyO+kM1Pxg511InjiwLSQi/yX9ezzs6xNeA70udBExbB90am/jWd8r6CI0eFxnzF
	bPsrGpTZN76/weNHpIBmdb+4fSoZxpqkE83TkahOpGWbK/U2lLyL81D5Vq0YqVy0
	l9gVbcFAQqY0ehGs62NnBmdVMz+ujhBwsqBNmUsAjJZ1W4CgWxWYoQQItTuDv4K1
	qja3xmDG8PNxq+bmZPdyRYksrPE03mGweK0EdAa4Stvo3dhspIVwdVGTP8+eKZZj
	68LeVD725W2qZc0EvLMUN5I2zb0qM8Hw7+JnALjNoeaQL22rxXOD1o+6zdhH4qvJ
	K3ec35R9IPyLZ2oUaEr4rw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775782551; x=1775868951; bh=b87heE5fmUBkJe8ZsnevojmlzceS4TdE1O/
	6Hxi/swI=; b=ro+5f0veQnIGOfHaAhkvetqn2l5TfGo0GePutMmJ0RVFe5zvRf7
	Ghf/v1zm5t/W7KGYfjjGH+jZRYwgAZ5kL9hPacMsxGUZFI/yQsZKKqr6Y7jZT6y9
	1JMMjiVXDU0bdaGy/MYqjbqnVjiZ0rcW6YeBt319dAFd1FMbchUb1iHLV/IcG4eI
	YqmBVm+N4Gw/MfWlSYgOpqa37XA7stZ4k4dbnSFatR4hDlan5+r2GHsqz+LgnbON
	EAhfKoDb6E1Tqf0pi69QMef2AFjqJK3DNFj26/svFC0C3CRViSU4EyT/DINboLxP
	MNFrlyiYlWbvWhYOLI/0U0nXBwpjN6ltpCw==
X-ME-Sender: <xms:l0rYaffAoELOq7t2sIIms9mHC-qlYQwSU3XMyCfx9bxMlXXxY3rOiA>
    <xme:l0rYacH5sPyGLSfmS7Ngz3TO2o-73ROB2eYey5J3vDdBuRNNNAsKelaUHiGsjVdFe
    y_wJJcTa137IILSwimCALe76gQW0PTByhQS0aGJR63VuJ9QmQ>
X-ME-Received: <xmr:l0rYaQ1QvNbRvwZ_jPCEFP3DpsnRhp2leav3dICTD97sgMCkxulfCYuHhSndg-NPXGwqVPxGdCy6Qo1TgM3SKykk_8xg9lggKPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddvkedttdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelhfefudel
    jeelgefhieeuudeiffehvdeuudfgfffhueekudeihfetvedvudehueenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhenucevlhhushhtvghrufhiiigv
    pedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
    hlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhm
    thhpohhuthdprhgtphhtthhopehthhhivghrrhihrdgvshgtrghnuggvsehvrghtvghsrd
    htvggthhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhj
    vggtthdrohhrghdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrugesvhgrthgvsh
    drthgvtghhpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthho
    pegsvghrrhgrnhhgvgesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:l0rYacnttjWs_rcHvMOTR7OxT3sVqksAf4lxJqnMwZpIEcyMib87AQ>
    <xmx:l0rYaY-R5_B4lwNfkGPDpZIuRrKn45Beu6Q7_HSVSjmGHjVV4qyCWw>
    <xmx:l0rYaZrNL9XXtlKXCjk0NvWP3iaJNGUmAJogjO3b3BE2FM685q3MEQ>
    <xmx:l0rYaZkuRCSmgUM2Phm5PSUNLBLCM-h8bEyZFNeR-5KlAf59kLYmNA>
    <xmx:l0rYaYIbwiEggfomRHbA4y6xbM07-G8N1j8z8QnUSMs1swnCrRDIulwg>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 10 Apr 2026 02:55:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 0/3] xl: Allow PCI devices to be passthrough'd via
 Qemu command line
Message-ID: <adhKlLvMB6PCRhwQ@mail-itl>
References: <20260409162000.1102680-1-thierry.escande@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s166KNew1RMNit10"
Content-Disposition: inline
In-Reply-To: <20260409162000.1102680-1-thierry.escande@vates.tech>
X-purgate-ID: tlsNG-42698a/1775782553-EE9492A1-F40B480D/0/0
X-purgate-type: clean
X-purgate-size: 3228
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: CDB993D0F06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--s166KNew1RMNit10
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Apr 2026 02:55:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v2 0/3] xl: Allow PCI devices to be passthrough'd via
 Qemu command line

On Thu, Apr 09, 2026 at 04:20:57PM +0000, Thierry Escande wrote:
> This series adds support for a new 'hotplug' option for PCI devices to be
> passthrough'd to guests.
>=20
> The current mechanism for device passthrough uses QMP device_add command
> to hot-plug PCI devices to the guest Qemu instance. This is an issue for
> guests running on Q35 chipset (preliminary support posted at [1]) since t=
he
> Q35 PCI root bus does not support hotplug. Devices could be hotplugged to
> a secondary PCI bus but Xen only support 1 PCI bus for now.
>=20
> The 'hotplug' option allows to control how devices are attached to the
> guest, either by using the legacy QMP mechanism (this is the default) or =
by
> passing it directly to the Qemu command line using xen-pci-passthrough
> device.
>=20
> Example usage in cfg file:
>  pci =3D [ "00:03.0,seize=3D1,hotplug=3D0" ]
>=20
> Since Qemu -device option accepts parameters in json format, this
> patchset adds a new internal function libxl__device_pci_get_qmp_json() th=
at
> generates the device json object used for both QMP hotplug and command li=
ne
> passing.
> Also, the function libxl_pci_assignable() is made available from libxl.h
> for access in libxl_dm.c. I don't know if it's ok to make it public or if
> it should stay private. Maybe it should be renamed as
> libxl_device_pci_assignable() to match the other PCI device APIs.
>=20
> This has been successfully tested on Xen 4.22-dev and Qemu 10.0 running
> Debian VMs in both Bios and UEFI mode with a passthrough'd nvme disk.
> Disabling the hotplug mechanism might be made mandatory for Q35 machines
> later, once Q35 support is merged upstream.
>=20
> [1] https://lore.kernel.org/xen-devel/20260313163455.790692-1-thierry.esc=
ande@vates.tech/

I don't see relevant device option added to the QEMU cmdline:
https://gitlab.com/xen-project/people/marmarek/xen/-/jobs/13860278916

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--s166KNew1RMNit10
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnYSpQACgkQ24/THMrX
1ywp+QgAlIu4U3xOIqcswI+Xglm1Big6NccmeqdmX5sknwC6JK5AGVuMWieGBhOb
F+QW+jBngPMi8adN3+wHcxUsha4hm5xV8ji9WtioMe4HuMa9erDQ9Sm6vdTUH1lD
SQBx6IN0mmFk7/sArRWaFfRlhdGmNp6MadA6pzNMsX6v2ZFK9Lc6tm4m/KyKlqcl
vVNS+9fn6B0Fj4aH3RGv+arpOX3dOI5xW1J7tT1HUoG2hFAcye2QxhGDXlLBzcWe
BcnRzktEaItarlKxleiohgACVC/NN3q9boiq0LsWvmb0IaviZfrumQ8WzOVqH2hK
JYhanOTSAD+RooNtVOsekmRKhnRSlQ==
=02cg
-----END PGP SIGNATURE-----

--s166KNew1RMNit10--

