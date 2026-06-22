Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TMUzJgInOWogngcAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 14:13:54 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6F16AF57A
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jun 2026 14:13:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=GAr4VZGH;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=a7eMJ83F;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1343697.1602937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbdWz-0006DB-Qy; Mon, 22 Jun 2026 12:13:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1343697.1602937; Mon, 22 Jun 2026 12:13:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wbdWz-0006Aj-Ns; Mon, 22 Jun 2026 12:13:37 +0000
Received: by outflank-mailman (input) for mailman id 1343697;
 Mon, 22 Jun 2026 12:13:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wbdWy-0006Ad-63
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 12:13:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wbdWw-004UuH-C0
 for xen-devel@lists.xenproject.org; Mon, 22 Jun 2026 14:13:34 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3926dc-e002-0a2a0a5209dd-0a2a4503c3de-36
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 14:13:34 +0200
Received: from [103.168.172.146] (helo=fout-a3-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.0)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3926ec-a3da-0a2a45030019-67a8ac92b31d-3
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jun 2026 14:13:33 +0200
Received: from phl-compute-10.internal (phl-compute-10.internal [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 88EEDEC03D2;
 Mon, 22 Jun 2026 08:13:32 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Mon, 22 Jun 2026 08:13:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Jun 2026 08:13:30 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1782130412;
	 x=1782216812; bh=vfjZr+4FnTcu0PUmGlLJGPBXVmgwF1vg8QgkeU+w4Gk=; b=
	GAr4VZGHa0ulOKxtTsm+9BPgX5jtJ8h8oXktHCEqaWwtEYTD9kyNWrXHijpJQelT
	kcAUr92HwrzzrSR+gtQQo0wnC6yQ9kw6J91gNqV0bfg4ANFPhXlvRM0TeKMlVQ+g
	yOvc/x0k9mMT29Ae+2dK1bTJGUsTnYiQrwYPppqkioBs3vYyzaiMLUhFFRPeraIL
	99JLB8gUEQos4BCyZPYCIwzq5zuHD4M1k2daqxlDPisR6q8bL7N2b1cYXfCiqXab
	gg9YOW2D9lXc0PMDTmyIaxY9ZeHd7eupGzvaaCfVQr8YfHBxuhVc7QJQ4DiodSu3
	rqoMfk7YQ5tRI+w1YQEAVg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1782130412; x=1782216812; bh=vfjZr+4FnTcu0PUmGlLJGPBXVmgwF1vg8Qg
	keU+w4Gk=; b=a7eMJ83FS652s8VQ3t5EuNIoIPNyMIe+gCwszIcffJIrvZVFcUM
	lem/qXZ9AQCAzmTgOp9tD3fOeL4sEzF4u3V4TUAmsT0qQPATfin26V8ELrObneyt
	arJ/sZMrrsADkybqVLJfja7yetTxsraISl0r9/zBWXYM8cN1OUvaU+HcpDTEe/VW
	CjRGSR2815zJg7K0+/KkkFUydS1y3TDPPK+O/pb3qn95o7jbJlnQSUitnkwEOhzp
	BxxQEIH3ZaW+6IcxhoN6BIA6c3XtcsZsepjjOslw83zjx4+ectrQMzt1j+dzGtPP
	Z/kkjvr7vM0OuZlcMtg/Aa4TDsYM0pKbkJA==
X-ME-Sender: <xms:6yY5ah0ucIM9klqFTy-nxgetGXtvinndBAQdpoD_LwuD2x1XNcOTJQ>
    <xme:6yY5apnaju7VgIWFhHaqXkBW5U_cGT_hsmS6Qiai7IlkNQj84QLmPN44wLrR059Zh
    b3zCSnSVGPn8ska8pjJ0Y86rIIaZkl9O8vwp4xWoHcsfd3oZw>
X-ME-Received: <xmr:6yY5ah9GWlPKHVJl_EkVY3Zw2aJCuh7kyUys2jYs0gyRV9ttAV2RbCLx>
X-ME-Proxy-Cause: dmFkZTERqzvLcHKMxH8zx79I6BPKj5MJjiNhkPe8bKgfbSPg3rmDgaqpgBMetq8XTR/xj4
    7dl+vN+91b/R0rRyI2Vftj/ukU2x7/wQIwsddpLWdBLXMuxSeSItpnAki+IS+Zl2Zda7f4
    e4ejdSzqS68AMxuBS+FWMBxeEe/tP8m3FPH7ps+jCqds62adNqJ+ay8D/TWcgdSRnhHdpK
    wB1PVnbycbVg3INa/XG22O/mGoujtnFl6u/t5b+Rm+ky2ZokuyMAcvJ56IxW/L9VIhBsKF
    vuztLoF7qSGCPDUAgWVyu0nydAic5f4t8Bv7TmcOBX4POep3xYLv5s1j/KKdylERSFCJYV
    Tx0wr/+5cRXCw1pZWRkdBCpLoV3S0AYHW/mmiGhLRkgN4BgyUPSYdgzf3UkqYo1aYke3eu
    8zg4gYG6zNHJaNzIIl1/7ZX2v90cK49cA6bU44c3S25UAylwbpAOpWI8hQ/XXXRB9HipiC
    ER5EPq2Yt60Svu7Y2eSusoQiW2s669qKkyGhbJuh1k/9HWvfreMYfvwnRKE34GpkNaG6tP
    bF/En+aCNFAmO3uvXO47cj9uOirjUOP/ikBjy5c5/8URxey+yoyY6id9RS0yV94iFIET4e
    UJ4IiqW7504bWYSYc3XAy2fIQTwuevlI1Z8/2hrz44TV3xh0ZxqnJWnTvnCg
X-ME-Proxy: <xmx:6yY5auoOACMoyvOEJPd8-cJOGVTAnISwWZljlMO0U7FHJlO6leuVqQ>
    <xmx:6yY5aqndXfbIUvofhFjtqBiYjacD_cfc_m8KGSg0-QrMOvd-MtgO7g>
    <xmx:6yY5alh4WhgGOUG1d-XkTqXmaffQRBUrSzuWordvQ5eOiGHO2qXGvw>
    <xmx:6yY5aieohzAYDUKh4g2Z3Q1pKyEX1aj24D17QqIKOGv4dOLYIMnT-A>
    <xmx:7CY5aky-q9uX36BJ5KE-mU6ovnhw6zXZPpm4eoePXQlrhKNdFnEsRWkS>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 22 Jun 2026 14:13:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <ajkm52RUk2T5P53J@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY58-gyarcVoBS2a@mail-itl>
 <aZ3KoSlIzru0Uumu@mail-itl>
 <aaVyKFaCSuhJufW2@mail-itl>
 <ajMD0Jsml3ytlWOY@mail-itl>
 <ajMs2lkXmTppifK7@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YHlKVsH+wm+43+zg"
Content-Disposition: inline
In-Reply-To: <ajMs2lkXmTppifK7@gsse-cloud1.jf.intel.com>
X-purgate-ID: tlsNG-33051d/1782130414-E3DD7D84-AF9148E2/0/0
X-purgate-type: clean
X-purgate-size: 9941
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:matthew.brost@intel.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,m:jani.nikula@intel.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:from_mime,qubes-os.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp,gitlab.freedesktop.org:url,mail-itl:mid];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	SUBJECT_HAS_QUESTION(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BB6F16AF57A


--YHlKVsH+wm+43+zg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 14:13:27 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Wed, Jun 17, 2026 at 04:25:14PM -0700, Matthew Brost wrote:
> On Wed, Jun 17, 2026 at 10:30:08PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Mon, Mar 02, 2026 at 12:19:04PM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Tue, Feb 24, 2026 at 04:58:25PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Fri, Feb 13, 2026 at 02:23:06AM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wr=
ote:
> > > > > > On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=
=C3=B3recki wrote:
> > > > > > > Hi,
> > > > > > >=20
> > > > > > > Recently I started testing compatibility with Intel Lunar Lak=
e. This is
> > > > > > > the first one that uses "xe" instead of "i915" Linux driver f=
or iGPU.
> > > > > > > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom=
0 running
> > > > > > > Linux 6.17.9 in this test.
> > > > > >=20
> > > > > > Not sure it's going to help a lot, but does using a PVH dom0 ma=
ke any
> > > > > > difference?
> > > > >=20
> > > > > Ok, now with the correct Xen version, it's better with PVH dom0. =
At
> > > > > least on the login screen and few applications (from both dom0 an=
d domU)
> > > > > I don't see the glitches anymore. I can't do a full test, because=
 PCI
> > > > > passthrough doesn't seem to work with PVH dom0 on Xen 4.19 - and =
I need
> > > > > it to start most VMs.
> > > > >=20
> > > > > So, if the above test is representative, it's only about PV dom0.
> > > >=20
> > > > Some further observations:
> > > >=20
> > > > 1. My initial impression that Xen 4.17.6 is not affected is false.
> > > > Apparently I got lucky and didn't waited long enough for glitches to
> > > > appear. Unfortunately this means I have no way to bisect this...
> > > >=20
> > > > 1a. Updated test procedure - either:
> > > >   - start Qubes OS in full (including default system domUs) and try=
 to
> > > >     open an app in one of them (for example file manager or pdf vie=
wer)
> > > >   - start Linux up to lightdm login page, log in, log out, click on=
 a
> > > >     few lightdm menus (session type selector, poewroff menu etc)
> > > >=20
> > > > The second version works even if toolstack version in dom0 doesn't =
match
> > > > Xen version. If no glitches are observed after doing either of those
> > > > procedures, assume it's good.
> > > >=20
> > > > 2. Xen staging is affected too. As well as Xen staging-4.19 without
> > > > any qubes patches.
> > > >=20
> > > > 3. After enabling CONFIG_DEBUG in Xen, the xe.ko fails to load firm=
ware:
> > > >=20
> > > >     xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/l=
nl_guc_70.bin version 70.53.0
> > > >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status =
=3D 0x40000056, time =3D 0ms, freq =3D 1850MHz (req 1850MHz), done =3D -1
> > > >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status:=
 Reset =3D 0, BootROM =3D 0x2B, UKernel =3D 0x00, MIA =3D 0x00, Auth =3D 0x=
01
> > > >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: firmware production =
part check failure
> > > >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Failed to initialize=
 uC (-EPROTO)
> > > >     xe 0000:00:02.0: probe with driver xe failed with error -71
> > > >=20
> > > > CONFIG_DEBUG is the only change between "xe.ko loads fine but there=
 are
> > > > glitches later on" and "xe.ko fails to load at all". Full console l=
ogs:
> > > > https://gist.github.com/marmarek/47b5e62a2cdbae6678c2aecc5283cd3f, =
there
> > > > are 3 files:
> > > >   - CONFIG_DEBUG=3Dn
> > > >   - CONFIG_DEBUG=3Dy
> > > >   - CONFIG_DEBUG=3Dy + iommu=3Ddebug
> > > >=20
> > > > 4. Updating to Linux 7.0-rc1 doesn't help, for example:
> > > > https://openqa.qubes-os.org/tests/168119#step/desktop_linux_manager=
_create_qube/11
> > > >=20
> > > > Generally, it does feel like a bug in xe.ko, but I can't exclude so=
me issue
> > > > on Xen side too (especially given point 3 above).
> > >=20
> > > After waiting some time (Linux 6.19.5 this time), Xen CONFIG_DEBUG=3D=
n, I get some timeout messages:
> > >=20
> > >     [    8.122120] xe 0000:00:02.0: [drm] [ENCODER:204:DDI A/PHY A] f=
ailed to retrieve link info, disabling eDP
> > >     [    8.148476] xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmw=
are from xe/lnl_guc_70.bin version 70.53.0
> > >     [    8.803845] xe 0000:00:02.0: [drm] Tile0: GT0: ccs1 fused off
> > >     [    8.804208] xe 0000:00:02.0: [drm] Tile0: GT0: ccs2 fused off
> > >     [    8.804556] xe 0000:00:02.0: [drm] Tile0: GT0: ccs3 fused off
> > >     [    8.822426] xe 0000:00:02.0: [drm] Tile0: GT1: Using GuC firmw=
are from xe/lnl_guc_70.bin version 70.53.0
> > >     [    8.827140] xe 0000:00:02.0: [drm] Tile0: GT1: Using HuC firmw=
are from xe/lnl_huc.bin version 9.4.13
> > >     [    8.829478] xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmw=
are from xe/lnl_gsc_1.bin version 104.0.5.1429
> > >     [    8.852923] xe 0000:00:02.0: [drm] Tile0: GT1: vcs1 fused off
> > >     [    8.853513] xe 0000:00:02.0: [drm] Tile0: GT1: vcs2 fused off
> > >     [    8.854090] xe 0000:00:02.0: [drm] Tile0: GT1: vcs3 fused off
> > >     [    8.854706] xe 0000:00:02.0: [drm] Tile0: GT1: vcs4 fused off
> > >     [    8.855310] xe 0000:00:02.0: [drm] Tile0: GT1: vcs5 fused off
> > >     [    8.855904] xe 0000:00:02.0: [drm] Tile0: GT1: vcs6 fused off
> > >     [    8.856495] xe 0000:00:02.0: [drm] Tile0: GT1: vcs7 fused off
> > >     [    8.857079] xe 0000:00:02.0: [drm] Tile0: GT1: vecs1 fused off
> > >     [    8.857675] xe 0000:00:02.0: [drm] Tile0: GT1: vecs2 fused off
> > >     [    8.858272] xe 0000:00:02.0: [drm] Tile0: GT1: vecs3 fused off
> > >     [    8.975881] xe 0000:00:02.0: [drm] Registered 3 planes with dr=
m panic
> > >     [    8.976586] [drm] Initialized xe 1.1.0 for 0000:00:02.0 on min=
or 0
> > >     [    8.980882] ACPI: video: Video Device [GFX0] (multi-head: yes =
 rom: no  post: no)
> > >     [    9.033754] xe 0000:00:02.0: [drm] Tile0: GT1: found GSC cv104=
=2E1.0
> > >     ...
> > >     [ 1218.319232] xe 0000:00:02.0: [drm] Tile0: GT0: Engine reset: e=
ngine_class=3Drcs, logical_mask: 0x1, guc_id=3D3
> > >     [ 1218.319890] xe 0000:00:02.0: [drm] Tile0: GT0: Timedout job: s=
eqno=3D9883, lrc_seqno=3D9883, guc_id=3D3, flags=3D0x0 in Xorg [3245]
> > >     [ 1218.320736] xe 0000:00:02.0: [drm] Xe device coredump has been=
 created
> > >     [ 1218.321140] xe 0000:00:02.0: [drm] Check your /sys/class/drm/c=
ard0/device/devcoredump/data
> > >     [ 1222.285626] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] fl=
ip_done timed out
> > >     [ 1232.525685] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
> > >     [ 1232.526280] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] co=
mmit wait timed out
> > >     [ 1242.765717] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] fl=
ip_done timed out
> > >     [ 1253.005696] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
> > >     [ 1253.006248] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] co=
mmit wait timed out
> > >     [ 1263.245599] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] fl=
ip_done timed out
> > >=20
> > > The glitches appear much earlier, though.
> > > Would content of /sys/class/drm/card0/device/devcoredump/data be usef=
ul
> > > for debugging this?
>=20
> Yes, it would. Jobs hanging can be a bug anywhere in the stack (e.g.,
> Hardware bug, KMD bug, UMD bug, application bug, etc...) but the
> devcoredump would give us some hints.
>=20
> > >=20
> > > Full log at https://openqa.qubes-os.org/tests/168813/file/serial0.txt
> > > (warning, almost 200MB of those errors...)
> >=20
> > The issue still happens with Linux 7.0.12. Current log (quite similar to
> > the previous one):
> > https://openqa.qubes-os.org/tests/184602/logfile?filename=3Dserial0.txt
>=20
> Hmm, the 'not started' messages in the dmesg are a bit concerning as
> this really shouldn't be possible to trigger even if user space is doing
> something wrong.
>=20
> Can you file a gitlab issue against Xe here: https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/new
>=20
> TBH, I have no idea if running Xen / Qubes OS + Xe is something anyone
> at Intel has tried out, so please include instructions on to how
> reproduce and we will see in someone on engineering team can take a look
> at this and if issues in Xe KMD exist, try to get these fixed.

I've opened https://gitlab.freedesktop.org/drm/xe/kernel/-/work_items/8382
including the crashdump and fresh logs.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YHlKVsH+wm+43+zg
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmo5JucACgkQ24/THMrX
1yzI1wf5AU1sEiz6RYblyOrWAq7ESWDwbarF056r2jimgjKzRofAyCh7c0fjg7b+
uHbSwR/yJXhwKBHT39EWyrDgfHgJlPkzlvxX0WiAZ12e9XBgjwL5utrqpq7iLJeP
32Xp3kEVXsaO6LYK3/SU4JgruW6JtHIzOTEoxeTh2VuwKEgQMLuMPuV2yo2ABi+P
nXi6NSwyk64GMfr+QtiCie+DEI5RTl6MDDNwujX6j/fND7IfTl46dPf+hEqBHFGv
M7rQGfd8UJ9Qtm2tX7ujj5h+xRMbbL4s7K4UEnbIEmI7U7omqtUyI+aAQpLIfiYX
sym+i/MaIYbyjw24T0WDeZYVwFs2kw==
=x/cx
-----END PGP SIGNATURE-----

--YHlKVsH+wm+43+zg--

