Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAHeEbN812mXOggAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:17:23 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1223C915C
	for <lists+xen-devel@lfdr.de>; Thu, 09 Apr 2026 12:17:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1276940.1562255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAmRO-0007F3-0z; Thu, 09 Apr 2026 10:16:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1276940.1562255; Thu, 09 Apr 2026 10:16:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wAmRN-0007DH-Ud; Thu, 09 Apr 2026 10:16:49 +0000
Received: by outflank-mailman (input) for mailman id 1276940;
 Thu, 09 Apr 2026 10:16:48 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wAmRL-0007DB-Pp
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 10:16:48 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wAmRK-00BmoY-BZ
 for xen-devel@lists.xenproject.org; Thu, 09 Apr 2026 12:16:46 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d77c7f-5cb7-0a2a0a5109dd-0a2a4504bdde-12
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:16:46 +0200
Received: from [103.168.172.144] (helo=fout-a1-smtp.messagingengine.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d77c8d-bb33-0a2a45040019-67a8ac90c9cb-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Apr 2026 12:16:46 +0200
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id D13A9EC006A;
 Thu,  9 Apr 2026 06:16:44 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 09 Apr 2026 06:16:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Apr 2026 06:16:43 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775729804;
	 x=1775816204; bh=LvFJD7kaqB4yI+OTi31V6yKJ10VSs1gSZn5u+SUryTQ=; b=
	rl5OzLSS5w4UZv+7Ww20Vqw5t8IcB+AdlzU+Wcjch5jtNOvW/s6hXXOKtSiRVDdd
	IV1b9vSAQzgVA5bJQZkD/6PeKtpIfC2UpwFNdQ5uEgBDu9xEYhJvB0BipGlXsUij
	Tzy16P/vmTCIKvSXDBAVhcxeTzrDtkfsUZJOXm20qZKBdKd82el6ImWv73K9Xczi
	sFEQj4T4OyGLeFQAR8//+eZVkCO7CQzZXT0m3qQrBDLtifk85TzzqXhgB2t6Bsoc
	9julA26ZGGmm4BP+/0dX4WwNGui8DxbdmlWd7+tOsqpLSYobe2EHc9pHQqkkRKTq
	ysnW9TlrYFVhNr6aWwkj8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775729804; x=1775816204; bh=LvFJD7kaqB4yI+OTi31V6yKJ10VSs1gSZn5
	u+SUryTQ=; b=GlBrI2+ocf2b/CKy50jLzkIRhVeBZRdnQvwdjORItnXfVavxz7O
	9/NtzpbohP0ZpVWFjV8qn+J8YmzwD2DzSKWFtfxuGQFG6q8IsSu+BXs8sMX3oAqv
	Oj04quvasiPWYZX4SpFFfDfc0vohR0nVY8BrFgYgApsMK7gDhN2D374U0pid0v+N
	T8tAoDhXTunvlpnwhQYZnJEy2QYmyyT/8tIFqn7kt+aSTKWihNj74KCtajwyYLH4
	blBVjbDoUtg1DJTxHXYkxTFnk5g6Mt5L6xKIAvJji7VreVtuhVSFi/7fOyQD+vnc
	nkhWnBG03k4Zkd361XywH3lF5ZcFZFPX2DA==
X-ME-Sender: <xms:jHzXadI1ror2yE9t56689iO507sAb_6Kl-ps8RTvB3X8uZXNiW4HZQ>
    <xme:jHzXaQB9TGWXdI0maFzkZi9FkGAZJfzwY3RdMaDhKlWncZM3xfjw3oremjgLGtaus
    IsdKs6OLlySN1tv_KEFesyDNnyyX4xmkyLfs_ZLVRkqqeM5Mg>
X-ME-Received: <xmr:jHzXaeDL8bi0ZLSHsd0dEz-ReENd-AE3RDkZ08Tenn6Ew6eh0UnaqLM_sJEcHFla8KgOGf4yBpogBV_0zXIwG-OL7y9bpozU9tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddviedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeevueejteeg
    leelteduueevhfetgfffjeevtddvgfeiveehteehleegueelvdejveenucffohhmrghinh
    epghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepthhhihgvrhhrhidrvghstggrnhguvgesvhgrthgvshdrthgvtghhpdhrtghpthhtoh
    epgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghp
    thhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphhtth
    hopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepsggvrhhrrghnghgvsehr
    vgguhhgrthdrtghomh
X-ME-Proxy: <xmx:jHzXaaA4QLRj0eGW3T_r9zMwqS2NwgFZEmQqBPCDa3jF8ZSWOqKSEw>
    <xmx:jHzXaRqZzZpkyCEWzxjV67UTVToEgNyz9FMIHx1GfWDqTJDtXVXdJA>
    <xmx:jHzXacnlC1Vxecp5W2JnWR5ARa4TmZT-rsFnesSGvjmOc0Og16lQOw>
    <xmx:jHzXaZy0CGCp174TLGQ_WmB29wUXqkqDrZUy3PambhM0eRO4OQ3faw>
    <xmx:jHzXaREeqdAhrbvDooMeeZM_688dXdvWxtgM2Axcljegll2JfYvvJmUH>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 9 Apr 2026 12:16:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 0/3] xl: Allow PCI devices to be passthrough'd via
 Qemu command line
Message-ID: <add8iXLvyWlYkrpM@mail-itl>
References: <20260408172320.539750-1-thierry.escande@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FadDhAgw7qA4OlbR"
Content-Disposition: inline
In-Reply-To: <20260408172320.539750-1-thierry.escande@vates.tech>
X-purgate-ID: tlsNG-ebf023/1775729806-B273A51B-FEEC0ED7/0/0
X-purgate-type: clean
X-purgate-size: 3168
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm2,messagingengine.com:s=fm2];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS(0.00)[m:thierry.escande@vates.tech,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:jgross@suse.com,m:berrange@redhat.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,gitlab.com:url];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: 8D1223C915C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--FadDhAgw7qA4OlbR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Apr 2026 12:16:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH 0/3] xl: Allow PCI devices to be passthrough'd via
 Qemu command line

On Wed, Apr 08, 2026 at 05:23:39PM +0000, Thierry Escande wrote:
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

Generally I like the approach, and it looks sensible on the first look.
But CI says it fails to build:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2439831766

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FadDhAgw7qA4OlbR
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnXfIkACgkQ24/THMrX
1yzVtggAko25WLiGketDYodE72dV9YuvzZw0tInQPk3pi2jOkPQqOHb5kfKDaWP6
oH54OtYXWeFKIs6nWcbimJOEdQjIJGo/S/ZXxLUIDodxWnqQYTakG/II3fFBpcUB
cS0SwE/eCyrmGJ44++XfYuVvoqHH2aAOsWpDGnO4Yra0wb4c9vf/MCHr11wJO4Ic
PSY9Vpf5rmFGXKLCiKEZqSd/Qe3EMo+LJPXk3pmelZaa58KOWh1m+dU6iz34rl/u
3iAeSUFNi3ThazMLvQ9XznZsUZB2GlwBQ3p60CdYpF7VCIYXSYuGpJpM+xTl2+mm
SYQCXFr9xQBvaLM5Z0Xwzo2jOTbh9Q==
=hZBM
-----END PGP SIGNATURE-----

--FadDhAgw7qA4OlbR--

