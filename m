Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHQrDzhypWlsBQYAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:19:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F841D758F
	for <lists+xen-devel@lfdr.de>; Mon, 02 Mar 2026 12:19:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1244163.1543626 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1It-0005g4-5d; Mon, 02 Mar 2026 11:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1244163.1543626; Mon, 02 Mar 2026 11:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vx1It-0005da-2n; Mon, 02 Mar 2026 11:19:11 +0000
Received: by outflank-mailman (input) for mailman id 1244163;
 Mon, 02 Mar 2026 11:19:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cp9A=BC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vx1Is-00056V-2K
 for xen-devel@lists.xenproject.org; Mon, 02 Mar 2026 11:19:10 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a181654d-1629-11f1-b164-2bf370ae4941;
 Mon, 02 Mar 2026 12:19:09 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id D07FEEC0572;
 Mon,  2 Mar 2026 06:19:07 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Mon, 02 Mar 2026 06:19:07 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Mar 2026 06:19:06 -0500 (EST)
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
X-Inumbo-ID: a181654d-1629-11f1-b164-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772450347;
	 x=1772536747; bh=bY05i/GjZaw5/I4RKcGeiDPQv4mupjxmU/TsxnBo4pg=; b=
	FAViYZk7P8cQ5QKQj5oTiJqlHbUBrgabRd2dqSXJWnGT+3G6sm23c8bZBmB4FUoZ
	5NJaPVUZ4lBZERUFgbS0Qw9/xhEASUEpaR2eUtOtkyrlc9BsaDU9aXN91OoLQFXU
	0ZUPFM+2gEGHJ6L/YhhhieLTIEFyCw6XYmBZeCj43/D6UlpwhKsq4wDfNL6n1ugT
	MMWTGVkD6D4pcJRn/lJUdIvHnG83OFkmcMcPS/JtLEmUJfcrXjiU1bjbzmU+bCqE
	Ql7gRUiSJL/qBSL+offf65xVdDgqtyPN5X8g+AAss9gUhBhkfF4m+ao+XPTBNvYN
	hy46qXtzdk/EwI41jznchw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1772450347; x=1772536747; bh=bY05i/GjZaw5/I4RKcGeiDPQv4mupjxmU/T
	sxnBo4pg=; b=zROQEehHXc0vtPL8x5aYaOHzP2+SbHMvp3iLw3IvbcwvMTViksk
	BqRjwJgp6SXgVVqcRC1LK9LNpK8/GcbalaSXWZQeZi7J/Pg5Ge481kb7HH6k0Otb
	ee6lwETcmzT8tuFi9EBBr6lKE1+b4CmW0AZYUjQpZ/6ldlrVh6QNdGw5rhlWhzNG
	MBbmt2fHFSTBLIa7MABh1Xux7nNunTJ6/JdKb62m1IzQYPIxdCLi1bhFhZDpjcwb
	4Tcf0uCwr9wV49+63wuN2Yz7FafZRl2tUSWYQgIvaFnjDidjDmOq2Z21M1OlHhXd
	JF296+BxBQmeKn/YVvCoyYZUurKkQFC637Q==
X-ME-Sender: <xms:K3KlaRND_q9jjg7rxcn822HnhgzVR2BeWb4fLcy_FmWPrQ4DKqnTrw>
    <xme:K3Klabsk1Jfu5fAg9Z3pMUoqxosmkIUO1BXJfz54YztplX_EbAp2SFCza9tigs_hk
    I1rCetCtUEc3rJ6WB74u3jCT042NMMRRtwiK8tEMxzwPfrIjw>
X-ME-Received: <xmr:K3KlaTUhGa-8Vjp4u_Ch5NGQIx3VYJs0U8BKvyrIOQOytxbfXWj0tZ_oXw_6ohBJid3Em1HBk-l_Zit9ztC20__mgmCTc43XfgI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheejheefucetufdoteggodetrf
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
X-ME-Proxy: <xmx:K3KlabtC9r6FGdQFhTcKbTOFE3Ce7o4HgUvWiojRMl9F4QzQ1OhxXg>
    <xmx:K3KlaXV1Bavo4iOEeUPVy9mj3pe7DkrLBU_1p9DKc4wAp0fmQ5ZbLw>
    <xmx:K3KlaWnh5NmCo_jhLAS1P2slfTKRkNFz0pxKBpF9aqju2SsV62iq8A>
    <xmx:K3KlaYZdrrEBGIaYSvM5dXmTjbFLYMj3U2-nZjBV7Mm6AAN2Vs9MdQ>
    <xmx:K3Klabz6ExESttmkQasThpbzfLp3hC3w0cZUz65ScP6V4LezttAf-y85>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Mar 2026 12:19:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19
Message-ID: <aaVyKFaCSuhJufW2@mail-itl>
References: <aYtznP_tT6xNPwf-@mail-itl>
 <aY3ttvtxGCPTNgsj@Mac.lan>
 <aY58-gyarcVoBS2a@mail-itl>
 <aZ3KoSlIzru0Uumu@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zu0C4HM+umfEjDpa"
Content-Disposition: inline
In-Reply-To: <aZ3KoSlIzru0Uumu@mail-itl>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.79 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm1];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:intel-xe@lists.freedesktop.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,qubes-os.org:url];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	NEURAL_HAM(-0.00)[-0.989];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: A2F841D758F
X-Rspamd-Action: no action


--zu0C4HM+umfEjDpa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Mar 2026 12:19:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	intel-xe@lists.freedesktop.org
Subject: Re: Graphical glitches (not refreshing?) with Linux's xe driver +
 Xen 4.19

On Tue, Feb 24, 2026 at 04:58:25PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Feb 13, 2026 at 02:23:06AM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Feb 12, 2026 at 04:11:50PM +0100, Roger Pau Monn=C3=A9 wrote:
> > > On Tue, Feb 10, 2026 at 07:06:20PM +0100, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hi,
> > > >=20
> > > > Recently I started testing compatibility with Intel Lunar Lake. Thi=
s is
> > > > the first one that uses "xe" instead of "i915" Linux driver for iGP=
U.
> > > > I test it with Qubes OS 4.3, which uses Xen 4.19.4 and PV dom0 runn=
ing
> > > > Linux 6.17.9 in this test.
> > >=20
> > > Not sure it's going to help a lot, but does using a PVH dom0 make any
> > > difference?
> >=20
> > Ok, now with the correct Xen version, it's better with PVH dom0. At
> > least on the login screen and few applications (from both dom0 and domU)
> > I don't see the glitches anymore. I can't do a full test, because PCI
> > passthrough doesn't seem to work with PVH dom0 on Xen 4.19 - and I need
> > it to start most VMs.
> >=20
> > So, if the above test is representative, it's only about PV dom0.
>=20
> Some further observations:
>=20
> 1. My initial impression that Xen 4.17.6 is not affected is false.
> Apparently I got lucky and didn't waited long enough for glitches to
> appear. Unfortunately this means I have no way to bisect this...
>=20
> 1a. Updated test procedure - either:
>   - start Qubes OS in full (including default system domUs) and try to
>     open an app in one of them (for example file manager or pdf viewer)
>   - start Linux up to lightdm login page, log in, log out, click on a
>     few lightdm menus (session type selector, poewroff menu etc)
>=20
> The second version works even if toolstack version in dom0 doesn't match
> Xen version. If no glitches are observed after doing either of those
> procedures, assume it's good.
>=20
> 2. Xen staging is affected too. As well as Xen staging-4.19 without
> any qubes patches.
>=20
> 3. After enabling CONFIG_DEBUG in Xen, the xe.ko fails to load firmware:
>=20
>     xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware from xe/lnl_guc=
_70.bin version 70.53.0
>     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status =3D 0x=
40000056, time =3D 0ms, freq =3D 1850MHz (req 1850MHz), done =3D -1
>     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: load failed: status: Reset=
 =3D 0, BootROM =3D 0x2B, UKernel =3D 0x00, MIA =3D 0x00, Auth =3D 0x01
>     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: firmware production part c=
heck failure
>     xe 0000:00:02.0: [drm] *ERROR* Tile0: GT0: Failed to initialize uC (-=
EPROTO)
>     xe 0000:00:02.0: probe with driver xe failed with error -71
>=20
> CONFIG_DEBUG is the only change between "xe.ko loads fine but there are
> glitches later on" and "xe.ko fails to load at all". Full console logs:
> https://gist.github.com/marmarek/47b5e62a2cdbae6678c2aecc5283cd3f, there
> are 3 files:
>   - CONFIG_DEBUG=3Dn
>   - CONFIG_DEBUG=3Dy
>   - CONFIG_DEBUG=3Dy + iommu=3Ddebug
>=20
> 4. Updating to Linux 7.0-rc1 doesn't help, for example:
> https://openqa.qubes-os.org/tests/168119#step/desktop_linux_manager_creat=
e_qube/11
>=20
> Generally, it does feel like a bug in xe.ko, but I can't exclude some iss=
ue
> on Xen side too (especially given point 3 above).

After waiting some time (Linux 6.19.5 this time), Xen CONFIG_DEBUG=3Dn, I g=
et some timeout messages:

    [    8.122120] xe 0000:00:02.0: [drm] [ENCODER:204:DDI A/PHY A] failed =
to retrieve link info, disabling eDP
    [    8.148476] xe 0000:00:02.0: [drm] Tile0: GT0: Using GuC firmware fr=
om xe/lnl_guc_70.bin version 70.53.0
    [    8.803845] xe 0000:00:02.0: [drm] Tile0: GT0: ccs1 fused off
    [    8.804208] xe 0000:00:02.0: [drm] Tile0: GT0: ccs2 fused off
    [    8.804556] xe 0000:00:02.0: [drm] Tile0: GT0: ccs3 fused off
    [    8.822426] xe 0000:00:02.0: [drm] Tile0: GT1: Using GuC firmware fr=
om xe/lnl_guc_70.bin version 70.53.0
    [    8.827140] xe 0000:00:02.0: [drm] Tile0: GT1: Using HuC firmware fr=
om xe/lnl_huc.bin version 9.4.13
    [    8.829478] xe 0000:00:02.0: [drm] Tile0: GT1: Using GSC firmware fr=
om xe/lnl_gsc_1.bin version 104.0.5.1429
    [    8.852923] xe 0000:00:02.0: [drm] Tile0: GT1: vcs1 fused off
    [    8.853513] xe 0000:00:02.0: [drm] Tile0: GT1: vcs2 fused off
    [    8.854090] xe 0000:00:02.0: [drm] Tile0: GT1: vcs3 fused off
    [    8.854706] xe 0000:00:02.0: [drm] Tile0: GT1: vcs4 fused off
    [    8.855310] xe 0000:00:02.0: [drm] Tile0: GT1: vcs5 fused off
    [    8.855904] xe 0000:00:02.0: [drm] Tile0: GT1: vcs6 fused off
    [    8.856495] xe 0000:00:02.0: [drm] Tile0: GT1: vcs7 fused off
    [    8.857079] xe 0000:00:02.0: [drm] Tile0: GT1: vecs1 fused off
    [    8.857675] xe 0000:00:02.0: [drm] Tile0: GT1: vecs2 fused off
    [    8.858272] xe 0000:00:02.0: [drm] Tile0: GT1: vecs3 fused off
    [    8.975881] xe 0000:00:02.0: [drm] Registered 3 planes with drm panic
    [    8.976586] [drm] Initialized xe 1.1.0 for 0000:00:02.0 on minor 0
    [    8.980882] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: =
no  post: no)
    [    9.033754] xe 0000:00:02.0: [drm] Tile0: GT1: found GSC cv104.1.0
    ...
    [ 1218.319232] xe 0000:00:02.0: [drm] Tile0: GT0: Engine reset: engine_=
class=3Drcs, logical_mask: 0x1, guc_id=3D3
    [ 1218.319890] xe 0000:00:02.0: [drm] Tile0: GT0: Timedout job: seqno=
=3D9883, lrc_seqno=3D9883, guc_id=3D3, flags=3D0x0 in Xorg [3245]
    [ 1218.320736] xe 0000:00:02.0: [drm] Xe device coredump has been creat=
ed
    [ 1218.321140] xe 0000:00:02.0: [drm] Check your /sys/class/drm/card0/d=
evice/devcoredump/data
    [ 1222.285626] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] flip_don=
e timed out
    [ 1232.525685] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
    [ 1232.526280] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] commit w=
ait timed out
    [ 1242.765717] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] flip_don=
e timed out
    [ 1253.005696] xe 0000:00:02.0: [drm] *ERROR* flip_done timed out
    [ 1253.006248] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] commit w=
ait timed out
    [ 1263.245599] xe 0000:00:02.0: [drm] *ERROR* [CRTC:88:pipe A] flip_don=
e timed out

The glitches appear much earlier, though.
Would content of /sys/class/drm/card0/device/devcoredump/data be useful
for debugging this?

Full log at https://openqa.qubes-os.org/tests/168813/file/serial0.txt
(warning, almost 200MB of those errors...)


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zu0C4HM+umfEjDpa
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmlcigACgkQ24/THMrX
1yxbnAf8CLqovdVUHy5Z9g4mb1xXRlYtk5W3BzX2l8m7XATXQU50WCZ70jFB3IVI
731vgifDlcnRiY1/bHU851bc1fHHKKq1KeqL+jmSYEVlxixO9N7Et/o1VDVJdsql
wq6sWj2BByyyFvbhOxfUmIfPG/aOqJrBNxMH2QVhTnyUrnWEyX6oUI9jXiA8FX7h
a836dOQOkY+zTaypRg85iXbHBjxjj7Kyj8qPFGfyFj5TRw/vgtiMfU1yzPxOo7QT
/t47KCoDCwcz4g99iacx3Ly60/x18oyvebrov4KGvAHW75VVlJSG9Zob2as4GH+X
wySLcUiG8BkWOu9O57PwH3xGv04dww==
=pqlU
-----END PGP SIGNATURE-----

--zu0C4HM+umfEjDpa--

