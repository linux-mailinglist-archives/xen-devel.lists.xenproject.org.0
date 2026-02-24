Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iKmkH8TKnWmxSAQAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 16:59:00 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B9C189754
	for <lists+xen-devel@lfdr.de>; Tue, 24 Feb 2026 16:58:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1240164.1541653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuunx-0001eN-Lx; Tue, 24 Feb 2026 15:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1240164.1541653; Tue, 24 Feb 2026 15:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vuunx-0001bJ-JC; Tue, 24 Feb 2026 15:58:33 +0000
Received: by outflank-mailman (input) for mailman id 1240164;
 Tue, 24 Feb 2026 15:58:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Eudq=A4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vuunw-0001bD-Ai
 for xen-devel@lists.xenproject.org; Tue, 24 Feb 2026 15:58:32 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a98c268f-1199-11f1-b164-2bf370ae4941;
 Tue, 24 Feb 2026 16:58:30 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id CF26B7A0113;
 Tue, 24 Feb 2026 10:58:28 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 24 Feb 2026 10:58:28 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Feb 2026 10:58:27 -0500 (EST)
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
X-Inumbo-ID: a98c268f-1199-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1771948708;
	 x=1772035108; bh=Bna20Bj12AiheVoYQJIu6dwrne7lv6IBmdPM2U/hwhQ=; b=
	SpYM58I3T8gObDAgO+m3GFt57tBIq6J0puEA+Us0k0mJ59+7j+rrtoswZhnXVwnt
	UvbpXaKwhD5HNbvjAlL1UiCF7gPQgKGXwHtWtrpvoKDFPra9Y+wfKhtL1d1E0IIq
	yxxXQ2WvnTd85Ua/cHfnJIIKCFqAxAwBHxDx7IaFYGyBttaLIAStMoN4VF0HCiZx
	T2xOeBOpoT+3/1GaSD/f00KDbfMYlTkjzzhqJTyeGUHlaLkGTK8bKlZ7Z9WvX1gA
	yyWAyb1ag3ImN493MBM79OX7vvSTDmev4bTSwXqyR5ZxGe4SeqV8m2NSHTUHTX42
	lh2ml349RMuNYBBExxHGyA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771948708; x=1772035108; bh=Bna20Bj12AiheVoYQJIu6dwrne7lv6IBmdP
	M2U/hwhQ=; b=burfKRW5ZaM1YXiFZ8wd9dTe1d6cVRm8QFlhcpycNOfy0qQ2a1c
	X7naXtkQNgYOEIlvqIsj4Psb+a1OJCX9UEDUC2ByHX92v8jaiYlrbJbAmlTDAqpW
	l0bttOQmOYVTXED4pdAwW/cbcA6UgRyJFZSVIKVjrq71Xyq9nqP8W8TzvVHdJfz3
	8iixgB97qArRaJyyH6IiqVz2SqO74yvDMPcv0JbLHkr2e6PbZAs/wAM0J1Mqu2WW
	1WzitX5ehvw7wqK2Fpd9l/WT/UuTBNVK4kDt5hJEMpZUMNVXOB/w4hOB3DgFpFX3
	7h8F0PjwkcnSzQezyzAfAI+Sezc3V72mO0g==
X-ME-Sender: <xms:pMqdacs4xumYRFYXULbLrQ83Xa6Lp5q3NmU7ou0uGmgcQToeX4VWOw>
    <xme:pMqdaRMUW-5OT2sWnccXkbJIUfd5iGKCS61_T5QSlXpjxJaNswnS-1D-WpSsGK1Le
    7gKkFlV5GO_hV0-oMvhrjK0UDCa0rh0Bt143nY8QLfmizqnug>
X-ME-Received: <xmr:pMqdaa0ZtrZHhLDJlfjJdzcsvWm7RA8ieNC1AuvQedyoqJIp5D98CCutJEuhRQ_2QKMkKll_8HS1rFL28fEEpq351h6LQP-v258>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgedtheekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdehvedt
    ffeggeffgeetieevfeelvdfhjeekvdfhgfffvedvuedviedugefguedvnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhdpqhhusggvshdqohhsrdhorhhgnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepfedpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgtoh
    hmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtght
    rdhorhhgpdhrtghpthhtohepihhnthgvlhdqgigvsehlihhsthhsrdhfrhgvvgguvghskh
    htohhprdhorhhg
X-ME-Proxy: <xmx:pMqdadPdpyJOVHrinY0wT42bJHVMsropT2Y_12z8vP_e09p-LDRuuA>
    <xmx:pMqdaa0OHHl7N3qcQ3UbCpafnZd03c1YmrbCAelwDCP-aRWu5xL7SQ>
    <xmx:pMqdaUFuzLYIZXUWhRJNlUcVBzhekcFXkeubMLjrtfGz0eXF4Z8ZgA>
    <xmx:pMqdaX5l7-_1Eo00mW6_KPwjwcglI2E9ZKV-79yIRBwDJqyB1fYoHg>
    <xmx:pMqdaRTP4OLmehqNqTlviki1o78K7fG_a_rjMpEam2Enc4SiH5uQPI-F>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Feb 2026 16:58:25 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aZ3KoSlIzru0Uumu@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY58-gyarcVoBS2a@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z+Qs3uEx07rIKHpf"
Content-Disposition: inline
In-Reply-To: <aY58-gyarcVoBS2a@mail-itl>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	SUBJECT_HAS_QUESTION(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,invisiblethingslab.com:dkim,qubes-os.org:url];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: E3B9C189754
X-Rspamd-Action: no action


--z+Qs3uEx07rIKHpf
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Feb 2026 16:58:25 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Fri, Feb 13, 2026 at 02:23:06AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > Hi,
> > >=20
> > > Recently I started testing compatibility with Intel Lunar Lake. This =
is
> > > the first one that uses "xe" instead of "i915" Linux driver for iGPU.
> > > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 running
> > > Linux 6.17.9 in this test.
> >=20
> > Not sure it's going to help a lot, but does using a PVH dom0 make any
> > difference?
>=20
> Ok, now with the correct Xen version, it's better with PVH dom0. At
> least on the login screen and few applications (from both dom0 and domU)
> I don't see the glitches anymore. I can't do a full test, because PCI
> passthrough doesn't seem to work with PVH dom0 on Xen 4.19 - and I need
> it to start most VMs.
>=20
> So, if the above test is representative, it's only about PV dom0.

Some further observations:

1. My initial impression that Xen 4.17.6 is not affected is false.
Apparently I got lucky and didn't waited long enough for glitches to
appear. Unfortunately this means I have no way to bisect this...

1a. Updated test procedure - either:
  - start Qubes OS in full (including default system domUs) and try to
    open an app in one of them (for example file manager or pdf viewer)
  - start Linux up to lightdm login page, log in, log out, click on a
    few lightdm menus (session type selector, poewroff menu etc)

The second version works even if toolstack version in dom0 doesn't match
Xen version. If no glitches are observed after doing either of those
procedures, assume it's good.

2. Xen staging is affected too. As well as Xen staging-4.19 without
any qubes patches.

3. After enabling CONFIG_DEBUG in Xen, the xe.ko fails to load firmware:

    xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/lnl_guc_7=
0.bin version 70.53.0
    xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status =3D 0x40=
000056, time =3D 0ms, freq =3D 1850MHz (req 1850MHz), done =3D -1
    xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status: Reset =
=3D 0, BootROM =3D 0x2B, UKernel =3D 0x00, MIA =3D 0x00, Auth =3D 0x01
    xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: firmware production part che=
ck failure
    xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Failed to initialize uC (-EP=
ROTO)
    xe 0000:00:02.0: probe with driver xe failed with error -71

CONFIG_DEBUG is the only change between "xe.ko loads fine but there are
glitches later on" and "xe.ko fails to load at all". Full console logs:
https://gist.github.com/marmarek/47b5e62a2cdbae6678c2aecc5283cd3f, there
are 3 files:
  - CONFIG_DEBUG=3Dn
  - CONFIG_DEBUG=3Dy
  - CONFIG_DEBUG=3Dy + iommu=3Ddebug

4. Updating to Linux 7.0-rc1 doesn't help, for example:
https://openqa.qubes-os.org/tests/168119#step/desktop_linux_manager_create_=
qube/11

Generally, it does feel like a bug in xe.ko, but I can't exclude some issue
on Xen side too (especially given point 3 above).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--z+Qs3uEx07rIKHpf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmdyqEACgkQ24/THMrX
1yz3NAf/Ss4zXqST+hrVe6//Y8nAtTjAfSKUnpUzjknj9A02rhVJMq7H4VTiQV91
ZM2lHu3JR+ye6J51t+fBtc27eJ1kBWWkPguco5pEaLm3UzlIAzDDTBntLg2M3qTe
XSLl2lc3L9cYmXpS2It1jTj+QnoATccFG1Y90SiypjL/yZQwL8lRFZVgdmHHbN9k
+Ts7gnNfSLXV22Wj/HKJPpn9v+rZLPFoXYT2ECMoOU4L8GcihAQ07kfyG9Zk0scE
Fay2icmTVi3NjBlYSn/UZvfIKDXTT/KuRuL43TVuqKA7OuVoAM+WVWxhf7FfZMf+
fOIDtJsnT+0Q2tPqAbT8100EC1ndGg==
=gWO7
-----END PGP SIGNATURE-----

--z+Qs3uEx07rIKHpf--

