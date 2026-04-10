Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mUzAIEZb2WmEowgAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 22:19:18 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B732E3DC733
	for <lists+xen-devel@lfdr.de>; Fri, 10 Apr 2026 22:19:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1279759.1563988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBIIo-000565-NO; Fri, 10 Apr 2026 20:18:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1279759.1563988; Fri, 10 Apr 2026 20:18:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wBIIo-00053j-Ji; Fri, 10 Apr 2026 20:18:06 +0000
Received: by outflank-mailman (input) for mailman id 1279759;
 Fri, 10 Apr 2026 20:18:05 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wBIIn-00053d-1k
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 20:18:05 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wBIIm-00FXQG-E0
 for xen-devel@lists.xenproject.org; Fri, 10 Apr 2026 22:18:04 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d95aad-bab6-0a2a0a5309dd-0a2a45038a4a-44
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 22:18:04 +0200
Received: from [103.168.172.156] (helo=fhigh-a5-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 69d95afa-02b3-0a2a45030019-67a8ac9cc257-3
 for <xen-devel@lists.xenproject.org>; Fri, 10 Apr 2026 22:18:03 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 33F521400161;
 Fri, 10 Apr 2026 16:18:02 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Fri, 10 Apr 2026 16:18:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Apr 2026 16:18:00 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm2; t=1775852282;
	 x=1775938682; bh=mGDEtK3MXDPdp3zrvnUbDrYfoAW9k0bQWVHW1FuAp9o=; b=
	VtKIWuaRYoDpmS392cem5g0dVfqdJqXPFBXmHENQiImE9TJ8tCFYmq8hmeyA4n4O
	eIRxGgRfpGa+0Ioc90B3LbiPL2iFwbki5ITJ8WHYeHC8SM/VffSnD2TjUFL6hAL0
	GxM3yw9G0hzlQp7P40KlgVxGjDFc5XZpTpRtMSGwOMp27nWz92BbcL86/HW7mnca
	5kAVo/RkhUc5zSxwEPTDA31/VCA3rZsRL/EDK8+LcEWhibAACNHP1T4quw7eKV0y
	n3vkqOBnxinJGfNApnK9szZlnk4yyheLg3jivGnO18TgkDHikPNMgn1fynJMMu/m
	AGuhzoK9eoMal8i0MC0L8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1775852282; x=1775938682; bh=mGDEtK3MXDPdp3zrvnUbDrYfoAW9k0bQWVH
	W1FuAp9o=; b=qhaDvUsCVRTvt11d0cL0/3NEdki6RB3nCEmyS0hQ4XAMGrm7M/6
	J0jk+m1NoqsNKI0/laeZBb3bZlcxFYQuWJdjhlhQn/xNndnstHSqvMxjwIoMArwF
	XTjZR1VR6rsXFNaiYzHOX/FTpkhSfGjsF9Z2Qq/TA1e6FtLHvWtiZNGFyRoF/2+K
	Ud1MOx0F7K8AOz1p1IEyh1onySWqp7DnVuPuv51sTZ42cROe1556rmFd4d9BOnVo
	7aqQs7XEl4JpTCrfC0ViQx3mgH0irzs8t4imDbRLB0DVMlx8oVcsWiGS1S5S2K3I
	YYFqO4fmYH3O41F/ToZ3WBpPRqVtOjM14Ew==
X-ME-Sender: <xms:-VrZaZQH5Z8cuuwh4rsQqeXtUm4vJZjTH7vTUbP92RCMQmAkayFFig>
    <xme:-VrZaZoY8EhIgCVCrW9AKD5aSaKwSGZ-6ULRh8hv-UE0RZYgCjLlSIcDvtFBMwnhp
    9bUa5hGZl9B39NjtckefdOFVoMCmORAMKa0x_1gNCod3W05>
X-ME-Received: <xmr:-VrZaXJoX6FSkDzsifeD5C7AYEfFNzNG7tRg6Hod1y9N7MEqfOMclGsmsJi1os9fVOdeaDb8wZuF-7F5ssDnbGXyYXHvN9AwIQM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeftdefhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehhfevhfek
    tdeujedvgfehvdeffeeikeffjeehffehkeefjeeiiedtkedvgfelhfenucffohhmrghinh
    epkhgvrhhnvghlrdhorhhgpdhgihhtlhgrsgdrtghomhdpphhougdrihhnpdhvrghtvghs
    rdhtvggthhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhn
    sggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehthhhivg
    hrrhihrdgvshgtrghnuggvsehvrghtvghsrdhtvggthhdprhgtphhtthhopeigvghnqdgu
    vghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopegrnh
    hthhhonhihrdhpvghrrghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepjhhgrhho
    shhssehsuhhsvgdrtghomhdprhgtphhtthhopegsvghrrhgrnhhgvgesrhgvughhrghtrd
    gtohhm
X-ME-Proxy: <xmx:-VrZacoOLxgtOI3y-MPCxk9zyYBp4eI-4ejZ1qtciYGxZiLXZS5ZqA>
    <xmx:-VrZafyEoJaKPyzizTiR4qJ5C4NIGsg8uwS5VX7w2OaU_A6DSQ-8Vw>
    <xmx:-VrZaQNhH34DuO3a_sNGM_oc4YMyGaveptKEPQHQkhU-2egmCNp5Ig>
    <xmx:-VrZaU5IgkNeRfjSRtO3KmS3SK9DUwaSUhkxJKvdAHPAUby0Davc7A>
    <xmx:-lrZaYvLJlX0kZC2gtNYq--TcvzPw79ktFDA4mn0wv9P0LTK3l_bAeod>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 10 Apr 2026 22:17:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v3 0/3] xl: Allow PCI devices to be passthrough'd via
 Qemu command line
Message-ID: <adla9tO0YedR3_Yx@mail-itl>
References: <20260410150333.1533568-1-thierry.escande@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bR36BRALjcUs3Tls"
Content-Disposition: inline
In-Reply-To: <20260410150333.1533568-1-thierry.escande@vates.tech>
X-purgate-ID: tlsNG-33051d/1775852284-C8530C9A-8A5E50DB/0/0
X-purgate-type: clean
X-purgate-size: 4624
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.com:url,lists.xenproject.org:helo,lists.xenproject.org:rdns];
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
X-Rspamd-Queue-Id: B732E3DC733
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--bR36BRALjcUs3Tls
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Apr 2026 22:17:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Thierry Escande <thierry.escande@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>
Subject: Re: [RFC PATCH v3 0/3] xl: Allow PCI devices to be passthrough'd via
 Qemu command line

On Fri, Apr 10, 2026 at 03:03:45PM +0000, Thierry Escande wrote:
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
>=20
> Also, to handle the assignable PCI device list, the function
> libxl_pci_assignable() is renamed as libxl_device_pci_assignable() and is
> made available from libxl.h for access in libxl_dm.c. 2 other functions a=
re
> also exported internally: libxl__pciback_dev_is_assigned() and
> libxl__device_pci_assignable_add().
>=20
> This has been successfully tested on Xen 4.22-dev and Qemu 10.0 running
> Debian VMs in both Bios and UEFI mode with a passthrough'd nvme disk.
> Disabling the hotplug mechanism might be made mandatory for Q35 machines
> later, once Q35 support is merged upstream.
>=20
> [1] https://lore.kernel.org/xen-devel/20260313163455.790692-1-thierry.esc=
ande@vates.tech/

Much better now:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2444612680

I get now something like this:
libxl: debug: libxl_dm.c:3044:device_model_launch: Domain 1:  -device
libxl: debug: libxl_dm.c:3044:device_model_launch: Domain 1:  {"driver":"xe=
n-pci-passthrough","id":"pci-pt-03_00.0","hostaddr":"0000:03:00.0"}

So, it works :)

> Changes in v2:
> - Add support for YAJL json parser
>=20
> Changes in v3:
> - Move code block of device command line parameters creation
> - Better handling of pci device assignation
>=20
> Thierry Escande (3):
>   xl: Add pci device hotplug option
>   libxl: Allow PCI device passthrough using -device Qemu command line
>   docs: provide description for pci hotplug option
>=20
>  docs/man/xl-pci-configuration.5.pod | 17 ++++++
>  docs/man/xl.cfg.5.pod.in            |  6 ++
>  tools/include/libxl.h               |  1 +
>  tools/libs/light/libxl_dm.c         | 85 +++++++++++++++++++++++++++++
>  tools/libs/light/libxl_internal.h   |  7 +++
>  tools/libs/light/libxl_pci.c        | 57 +++++++++++++------
>  tools/libs/light/libxl_types.idl    |  1 +
>  tools/libs/util/libxlu_pci.c        |  2 +
>  tools/xl/xl_parse.c                 |  5 ++
>  9 files changed, 163 insertions(+), 18 deletions(-)
>=20
> --=20
> 2.53.0
>=20
>=20
>=20
> --
> Thierry Escande | Vates XCP-ng Developer
>=20
> XCP-ng & Xen Orchestra - Vates solutions
>=20
> web: https://vates.tech
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--bR36BRALjcUs3Tls
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmnZWvYACgkQ24/THMrX
1yzh7gf/Ti5FQbyYKa+M+JuxgasvR8rTUfhVdhxEtcECHwrxU3OFiDJ7PD0CH9Vi
rovXaPYB5spW2vHt8SZKG6ms3isyxVcx/Is1zNwpDyra7V+DW4JS0f4T3ITPrn1G
meMHUeZ2AqsxWzxsn9f4LqUI7RV+jKfeoeHzLKPpsEQ285BTSOI/k6JH8DgSmSVk
ssLfOGhNBVWshzh8IUx5D3sKzQ0q9QUHlKCfkCJAP9DbNAvaYdr+2x1HRd94EIV2
Xy2SsqAmRPQ+VJsTvrCNVlvMJl2nMpX/eF0vF1QbMeDp+LLsM+rHiTM7lIcl2Ebi
zSIJ8alY3JyVRm96R1cBFrfVspnxJQ==
=+lVJ
-----END PGP SIGNATURE-----

--bR36BRALjcUs3Tls--

