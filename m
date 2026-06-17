Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DxjzHSMEM2pX8gUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 22:31:31 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B36CC69C5E0
	for <lists+xen-devel@lfdr.de>; Wed, 17 Jun 2026 22:31:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=dXV79D8i;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b=b18YDWA+;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com
Received: from list by lists.xenproject.org with outflank-mailman.1340678.1601518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZwts-0008Oq-2W; Wed, 17 Jun 2026 20:30:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1340678.1601518; Wed, 17 Jun 2026 20:30:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wZwtr-0008MM-S1; Wed, 17 Jun 2026 20:30:15 +0000
Received: by outflank-mailman (input) for mailman id 1340678;
 Wed, 17 Jun 2026 20:30:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1wZwtq-0008MG-VN
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 20:30:15 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wZwtp-00EfKn-GD
 for xen-devel@lists.xenproject.org; Wed, 17 Jun 2026 22:30:14 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a33034f-bab6-0a2a0a5309dd-0a2a450ab28a-44
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 22:30:13 +0200
Received: from [202.12.124.158] (helo=fhigh-b7-smtp.messagingengine.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a3303d3-56b3-0a2a450a0019-ca0c7c9eea35-3
 for <xen-devel@lists.xenproject.org>; Wed, 17 Jun 2026 22:30:12 +0200
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 166057A0149;
 Wed, 17 Jun 2026 16:30:11 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Wed, 17 Jun 2026 16:30:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Jun 2026 16:30:09 -0400 (EDT)
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
	:references:reply-to:subject:subject:to:to; s=fm1; t=1781728210;
	 x=1781814610; bh=nQ3cOxa4IJfVezEa2HBSlbxmNTUbGLfjuqtIqDIYaPY=; b=
	dXV79D8iR1N7Oz3hZHjLyALnv2m91IqsiutxsvSOT8NSGpdNM80MUFuF7hDFn+f2
	Z+twpvAKB5/fJMAuBiHDW87W9aGv85W5n4h967KI1gqVTpYQ8hiEWT2+OLQm0shO
	/w/M7wRHmCBAd1TzCTsEx9RXKS83b5EO/DxEpRhkWHK4+/o9NqDsGdC+qUP+RyjF
	vTrL5XOSftyqcGwu5I7rHe4vh4cx6OP3LoHUXak5GpJ+3ylCaGaGyVnDHQtHrl4f
	dPNc1qEg2cpwDgYdApyZyslxWyzLUMnrWf2R5+NBMlkN3yJep4QUSDi3WbYycZ6/
	BokFWCvn9NprgoDRuGhtCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1781728210; x=1781814610; bh=nQ3cOxa4IJfVezEa2HBSlbxmNTUbGLfjuqt
	IqDIYaPY=; b=b18YDWA+PQqYgAvCvvqoVjKnBy1OzHeDl6D3i4K8VscgDZvGVKt
	yJjnRTaqX27TD6e8DzqEOLxS0GWMyRj4EyJF7YUKzzeoMfISmxUt7Q8zd01JzzTh
	W7YCNYwkIQ22xh/jfoM4a5BdomNsOs6HKMMylSuNU+XeGbt1TXGR/JZS8E4rm0OI
	dlluGsCaHocfdfa9W0yLaiyStflVyXAG7oAmeuRoj5XPnpqnpGNUpb18b1X3L7xG
	TStaVkuFHslZUguYw5lk5CC467Ie3wukq4OPznpQsMuTl7uGkLtXkxAiNSItopmM
	AjmNoMCqkEs1ShlLy6J93pVbrmzDXOktyFw==
X-ME-Sender: <xms:0gMzao4ToFfZoiigwY430LkL3FU8hsut6O5eu_qVbiKDwEleQpuLlA>
    <xme:0gMzahprbDR_QR3CiG4gtt1CR2_gkZM6_-NE2sHj_UBHevLGfSW_ck94ZO8AEfa-0
    00aq_zsD6SMUFX46Owu20Y4dCBrDrtwTKMBEnQIxDJ5hT4DoA>
X-ME-Received: <xmr:0gMzaqhxvGzMANtJyPoB-McDODMT-DwYLGv9r8ORyaWAu-yuqIToI2YAKBUR392EDpEe0ibqQKYbZ6mG5zI3d56OL0px1di7SD4>
X-ME-Proxy-Cause: dmFkZTFwBnQPaP9WPTtPaROfPtnBHMTyhvNJw2ar9oD2/Ek+QDJEzCKFDOCZD8BOvSXawW
    DamGfv5dofJDwPTbAaoDsgol/BYmKaFsXyYvhe0IbrpIBG0C33baNrPSnB1HeVKaw4kl+O
    LRffK/Lq2QoOt/UN6X/RMRdF0D6ZmWwdHuo9613C+/bJ/zsgahmOIwiEf69OZQOuVPvJf1
    q3nT0+B+zfBZonxT1uQi4aydeCvlOWUIsqwoUXZtmaK0UNi6NMxJRpszlgtU97jTrWGm7n
    E9xiFVusiamKS+Ai4JVZdpv1Y+AziiggvGZM6U2vtXYPWS4dCMyjzmZCiVPM8/zvjXLZoK
    u+6iEC8LmXfV6YAWuRPfNw0loRodA0cK7Ok5v505BoCInycga3GIZm4BTVy7OI1KEPsYGX
    gcU4sM5w3LbpEnbT/fDd71uYvjwx4wNQjaRbdWwGYMKnmn1Gt6eSsyEsLezecavPgozoKg
    bNXE5N/3cRHtT4tOkNGLvLddqtsj2/7vP3H1qFcMv51h29VvEorEEJ17CfV6/jBpX0KhTj
    awYBwQ2PcF6/N//WMnwmxn3h9RpPU05yXuRgXHwEukCrRaH0k1u3O2LPI1zttXdq/bvg0Q
    Q30wuzSU4z4Yi3TA/C+DROwYP9kMMRsF4sYkqW28h4mKo7q32U1awqjthGlg
X-ME-Proxy: <xmx:0gMzarLVyhtKwl26p_RCB72FYJu5K1aKQWULjXbVxkiAV3yf5dFFzw>
    <xmx:0gMzaqDyRdvfgNGY5Vn07eZhHGTKFSIg3vUXCboIRYK6BvME5qduhA>
    <xmx:0gMzarjOcgMCrj6oGhitgp4pgPEmUxKJPx_ARfLnDEmfw8j94cok8g>
    <xmx:0gMzailiJS1iouK4XqospJ6Hc8AVvubtfo8DnBvg25jTL6zmFW09BQ>
    <xmx:0gMzavC3QsWzAOZr6Jy4gcaqjrK3dGUiOCG0WC4vha4z_d8ZbSFyHdgC>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 17 Jun 2026 22:30:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <ajMD0Jsml3ytlWOY@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY58-gyarcVoBS2a@mail-itl>
 <aZ3KoSlIzru0Uumu@mail-itl>
 <aaVyKFaCSuhJufW2@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uNgrZ1r0QgDtWsL3"
Content-Disposition: inline
In-Reply-To: <aaVyKFaCSuhJufW2@mail-itl>
X-purgate-ID: tlsNG-4011c0/1781728213-6FB5F8B7-E6D31A7A/0/0
X-purgate-type: clean
X-purgate-size: 8428
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm1];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	SUBJECT_HAS_QUESTION(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim,invisiblethingslab.com:from_mime,mail-itl:mid,qubes-os.org:url];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B36CC69C5E0


--uNgrZ1r0QgDtWsL3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Jun 2026 22:30:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Mon, Mar 02, 2026 at 12:19:04PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Feb 24, 2026 at 04:58:25PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Fri, Feb 13, 2026 at 02:23:06AM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > > On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > Hi,
> > > > >=20
> > > > > Recently I started testing compatibility with Intel Lunar Lake. T=
his is
> > > > > the first one that uses "xe" instead of "i915" Linux driver for i=
GPU.
> > > > > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 ru=
nning
> > > > > Linux 6.17.9 in this test.
> > > >=20
> > > > Not sure it's going to help a lot, but does using a PVH dom0 make a=
ny
> > > > difference?
> > >=20
> > > Ok, now with the correct Xen version, it's better with PVH dom0. At
> > > least on the login screen and few applications (from both dom0 and do=
mU)
> > > I don't see the glitches anymore. I can't do a full test, because PCI
> > > passthrough doesn't seem to work with PVH dom0 on Xen 4.19 - and I ne=
ed
> > > it to start most VMs.
> > >=20
> > > So, if the above test is representative, it's only about PV dom0.
> >=20
> > Some further observations:
> >=20
> > 1. My initial impression that Xen 4.17.6 is not affected is false.
> > Apparently I got lucky and didn't waited long enough for glitches to
> > appear. Unfortunately this means I have no way to bisect this...
> >=20
> > 1a. Updated test procedure - either:
> >   - start Qubes OS in full (including default system domUs) and try to
> >     open an app in one of them (for example file manager or pdf viewer)
> >   - start Linux up to lightdm login page, log in, log out, click on a
> >     few lightdm menus (session type selector, poewroff menu etc)
> >=20
> > The second version works even if toolstack version in dom0 doesn't match
> > Xen version. If no glitches are observed after doing either of those
> > procedures, assume it's good.
> >=20
> > 2. Xen staging is affected too. As well as Xen staging-4.19 without
> > any qubes patches.
> >=20
> > 3. After enabling CONFIG_DEBUG in Xen, the xe.ko fails to load firmware:
> >=20
> >     xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/lnl_g=
uc_70.bin version 70.53.0
> >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status =3D =
0x40000056, time =3D 0ms, freq =3D 1850MHz (req 1850MHz), done =3D -1
> >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status: Res=
et =3D 0, BootROM =3D 0x2B, UKernel =3D 0x00, MIA =3D 0x00, Auth =3D 0x01
> >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: firmware production part=
 check failure
> >     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Failed to initialize uC =
(-EPROTO)
> >     xe 0000:00:02.0: probe with driver xe failed with error -71
> >=20
> > CONFIG_DEBUG is the only change between "xe.ko loads fine but there are
> > glitches later on" and "xe.ko fails to load at all". Full console logs:
> > https://gist.github.com/marmarek/47b5e62a2cdbae6678c2aecc5283cd3f, there
> > are 3 files:
> >   - CONFIG_DEBUG=3Dn
> >   - CONFIG_DEBUG=3Dy
> >   - CONFIG_DEBUG=3Dy + iommu=3Ddebug
> >=20
> > 4. Updating to Linux 7.0-rc1 doesn't help, for example:
> > https://openqa.qubes-os.org/tests/168119#step/desktop_linux_manager_cre=
ate_qube/11
> >=20
> > Generally, it does feel like a bug in xe.ko, but I can't exclude some i=
ssue
> > on Xen side too (especially given point 3 above).
>=20
> After waiting some time (Linux 6.19.5 this time), Xen CONFIG_DEBUG=3Dn, I=
 get some timeout messages:
>=20
>     [    8.122120] xe 0000:00:02.0: [drm] [ENCODER:204:DDI A/PHY A] faile=
d to retrieve link info, disabling eDP
>     [    8.148476] xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware =
=66rom xe/lnl_guc_70.bin version 70.53.0
>     [    8.803845] xe 0000:00:02.0: [drm] Tile0: GT0: ccs1 fused off
>     [    8.804208] xe 0000:00:02.0: [drm] Tile0: GT0: ccs2 fused off
>     [    8.804556] xe 0000:00:02.0: [drm] Tile0: GT0: ccs3 fused off
>     [    8.822426] xe 0000:00:02.0: [drm] Tile0: GT1: Using GuC firmware =
=66rom xe/lnl_guc_70.bin version 70.53.0
>     [    8.827140] xe 0000:00:02.0: [drm] Tile0: GT1: Using HuC firmware =
=66rom xe/lnl_huc.bin version 9.4.13
>     [    8.829478] xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmware =
=66rom xe/lnl_gsc_1.bin version 104.0.5.1429
>     [    8.852923] xe 0000:00:02.0: [drm] Tile0: GT1: vcs1 fused off
>     [    8.853513] xe 0000:00:02.0: [drm] Tile0: GT1: vcs2 fused off
>     [    8.854090] xe 0000:00:02.0: [drm] Tile0: GT1: vcs3 fused off
>     [    8.854706] xe 0000:00:02.0: [drm] Tile0: GT1: vcs4 fused off
>     [    8.855310] xe 0000:00:02.0: [drm] Tile0: GT1: vcs5 fused off
>     [    8.855904] xe 0000:00:02.0: [drm] Tile0: GT1: vcs6 fused off
>     [    8.856495] xe 0000:00:02.0: [drm] Tile0: GT1: vcs7 fused off
>     [    8.857079] xe 0000:00:02.0: [drm] Tile0: GT1: vecs1 fused off
>     [    8.857675] xe 0000:00:02.0: [drm] Tile0: GT1: vecs2 fused off
>     [    8.858272] xe 0000:00:02.0: [drm] Tile0: GT1: vecs3 fused off
>     [    8.975881] xe 0000:00:02.0: [drm] Registered 3 planes with drm pa=
nic
>     [    8.976586] [drm] Initialized xe 1.1.0 for 0000:00:02.0 on minor 0
>     [    8.980882] ACPI: video: Video Device [GFX0] (multi-head: yes  rom=
: no  post: no)
>     [    9.033754] xe 0000:00:02.0: [drm] Tile0: GT1: found GSC cv104.1.0
>     ...
>     [ 1218.319232] xe 0000:00:02.0: [drm] Tile0: GT0: Engine reset: engin=
e_class=3Drcs, logical_mask: 0x1, guc_id=3D3
>     [ 1218.319890] xe 0000:00:02.0: [drm] Tile0: GT0: Timedout job: seqno=
=3D9883, lrc_seqno=3D9883, guc_id=3D3, flags=3D0x0 in Xorg [3245]
>     [ 1218.320736] xe 0000:00:02.0: [drm] Xe device coredump has been cre=
ated
>     [ 1218.321140] xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0=
/device/devcoredump/data
>     [ 1222.285626] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] flip_d=
one timed out
>     [ 1232.525685] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
>     [ 1232.526280] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] commit=
 wait timed out
>     [ 1242.765717] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] flip_d=
one timed out
>     [ 1253.005696] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
>     [ 1253.006248] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] commit=
 wait timed out
>     [ 1263.245599] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] flip_d=
one timed out
>=20
> The glitches appear much earlier, though.
> Would content of /sys/class/drm/card0/device/devcoredump/data be useful
> for debugging this?
>=20
> Full log at https://openqa.qubes-os.org/tests/168813/file/serial0.txt
> (warning, almost 200MB of those errors...)

The issue still happens with Linux 7.0.12. Current log (quite similar to
the previous one):
https://openqa.qubes-os.org/tests/184602/logfile?filename=3Dserial0.txt

Not long after GPU errors, nvme driver fails due to full swiotlb.

Any ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uNgrZ1r0QgDtWsL3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmozA88ACgkQ24/THMrX
1yyq+wf/bEtASp768/AYv+EbDMh+837ZW5p9z2UDro8wq2O7Q3+QcU0X28Vd1uvy
Bnun06E68x863J5YKsRdUbdIQ5fLXcWphPx5IBMmJYVYWfnnb8EKQxd3WQmwDD8n
EImFomdtLgBdsLVSZDi5aiIpWXmIAJ3fssOZv0cripsIDHrzNwQ+9M2vO3iIpyLM
lYR42khFChpiYuiSqjrGe8JhueBldxD3fPAo9FRP0JcEue3+cmgn04FKPo4Jshdh
J9ppBrthfjQSVxYCnhNMGUEjIE8h0RaqMASKa9ti3NNJ0BtLU+29kUUCOVw7dZY+
H9QwxAr4ylkktAbK5FkWoEnpQMI6JQ==
=UgAf
-----END PGP SIGNATURE-----

--uNgrZ1r0QgDtWsL3--

