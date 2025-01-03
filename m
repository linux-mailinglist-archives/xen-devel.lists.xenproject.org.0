Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D666CA00218
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jan 2025 01:43:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864525.1275755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTVmA-0005LT-2Z; Fri, 03 Jan 2025 00:42:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864525.1275755; Fri, 03 Jan 2025 00:42:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTVm9-0005JZ-WE; Fri, 03 Jan 2025 00:42:54 +0000
Received: by outflank-mailman (input) for mailman id 864525;
 Fri, 03 Jan 2025 00:42:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LdeY=T3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tTVm8-0005JR-Mh
 for xen-devel@lists.xenproject.org; Fri, 03 Jan 2025 00:42:52 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a815de86-c96b-11ef-99a4-01e77a169b0f;
 Fri, 03 Jan 2025 01:42:50 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.stl.internal (Postfix) with ESMTP id 8DDF211401F2;
 Thu,  2 Jan 2025 19:42:48 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 02 Jan 2025 19:42:48 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jan 2025 19:42:47 -0500 (EST)
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
X-Inumbo-ID: a815de86-c96b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1735864968;
	 x=1735951368; bh=cK2Plcfq49ZpIYB8enI2B4pjJnZHgchMCUL51EwqCcc=; b=
	dX97Ezy4O6p8x5jtGgNz//gukK0dIryLWpw/0IdKeQOhE1wvfV1KTfLGKv4W0j0m
	ExxNOeeIJ4Z1IpB2mPOblZkl7RSdLHrkvJZxo0ZHhzz+eRtVmx9p+gI3eU9NrD9t
	iZkBSC7Zpy+9vyrBjsCOV0+UhQrJfrR8wijBmR97t/lVeBYQ92ncTqNOtiTcLL6J
	12Q9UZJQ99C8sNz+D1tgmvLwu71XOZI4mzlqgC4s5vyT8qbuKRois363JWqhvAUY
	BlU4Lk0WA9zssBrkws7eJUlwXU1kWpqS+xN91MCUofoeHKH5B6HXfrMVZcPu9N12
	TwGbJEcWPt6ZVOwa1FAyTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735864968; x=1735951368; bh=cK2Plcfq49ZpIYB8enI2B4pjJnZHgchMCUL
	51EwqCcc=; b=Z5AXODBxLBIoiq85UpMmTbt9oyRewkTICL0hhTClW4AvmdtJrsz
	BMdHvnko2X2wnSpm14C91Er5pzznTIyud9G2mjkDzJUZG+rMfYozwBhqmFos5CoB
	IHwMKpttvpSEtfkq4BoyhVPpqZZ9J2J/ixjvK0JjYwbzx5urm+XCOcHQhjoac6CM
	z2a9hBArRzG7h5pB+8+SrVkaAKrJZ7hySzeRhzQ2O8pTb7yMMR1Yjq//N2H6V7/L
	bHEyjjZgKgVj09mJFwxbOHnHD4tHWWXOlVDWPEU4jorskg5Ob4dYUmpY4mgMFc3R
	VXwj5nLgbOCBg3RSr7R1yiLHyvuZr3OFy7Q==
X-ME-Sender: <xms:iDJ3Z1SKjEC8uivenJamJtwyfl93kPOtTucPpaaPqM4Bt-ncmF7Jmg>
    <xme:iDJ3Z-x5hGVFmTnIknLFg_WLJ2LGDA9Kfa3ng902DAjJAr_Nj5BaflR2Ohsjn3Z7Q
    kgvs8itq50PDg>
X-ME-Received: <xmr:iDJ3Z61J4kPLt1URZ493Y1ID8_kMn6F0u_4Hnnwjq1TfxNpt51RUvzuBGkgR45T12bKk7dxpGrbGbul5arIuZgKoa81dUSlxxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeffedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepjeejgfekudegheeivdeiffdvffegteektdfhudeljeeikefhteefke
    efgffgieegnecuffhomhgrihhnpehquhgsvghsqdhoshdrohhrghdpghhithhhuhgsrdgt
    ohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghr
    tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhhgrhhoshhsse
    hsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghn
    phhrohhjvggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestg
    hithhrihigrdgtohhm
X-ME-Proxy: <xmx:iDJ3Z9A46msdADfAL09nAl37dT-uI7rz10mM97bdxtVqfj3z2-L95g>
    <xmx:iDJ3Z-jUyF14bd1tVAeUC9zucZ8Xjs1Vyx6NOFZNCF0L680Wwe5TGg>
    <xmx:iDJ3ZxqzkVT3m-x555rrq8AqMonHsGh4NdN34g4aVLa08BlRg4k2JQ>
    <xmx:iDJ3Z5gviAMeESHwiMXHicbEDXzM3YAZSXP7GUs8U8ztUqEwrf4gyw>
    <xmx:iDJ3Z_uhb1PwZcehBGNZoOeNc2daP1QYzXskpkmkxl47cBfHkzmE25VO>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 3 Jan 2025 01:42:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
Message-ID: <Z3cyhdKu6M1vdBe_@mail-itl>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
 <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com>
 <Z3aFdrygLF9yK2EK@mail-itl>
 <Z3bg-gvaBEdSIuRW@mail-itl>
 <08f9604b-df23-4766-a290-ef9daa506f8d@suse.com>
 <Z3brZQmYhx-QTnga@mail-itl>
 <Z3cs1-wG5WJ9FrAR@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9rr+QR6SemhkxG7w"
Content-Disposition: inline
In-Reply-To: <Z3cs1-wG5WJ9FrAR@mail-itl>


--9rr+QR6SemhkxG7w
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 3 Jan 2025 01:42:45 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0

On Fri, Jan 03, 2025 at 01:18:31AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Jan 02, 2025 at 08:39:16PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Jan 02, 2025 at 08:17:00PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 02.01.25 19:54, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Thu, Jan 02, 2025 at 01:24:21PM +0100, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Thu, Jan 02, 2025 at 12:30:10PM +0100, Juergen Gross wrote:
> > > > > > On 02.01.25 11:20, J=C3=BCrgen Gro=C3=9F wrote:
> > > > > > > On 19.12.24 17:14, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > > > Hi,
> > > > > > > >=20
> > > > > > > > It crashes on boot like below, most of the times. But somet=
imes (rarely)
> > > > > > > > it manages to stay alive. Below I'm pasting few of the cras=
hes that look
> > > > > > > > distinctly different, if you follow the links, you can find=
 more of
> > > > > > > > them. IMHO it looks like some memory corruption bug somewhe=
re. I tested
> > > > > > > > also Linux 6.13-rc2 before, and it had very similar issue.
> > > > > > >=20
> > > > > > > ...
> > > > > > >=20
> > > > > > > >=20
> > > > > > > > Full log:
> > > > > > > > https://openqa.qubes-os.org/tests/122879/logfile?filename=
=3Dserial0.txt
> > > > > > >=20
> > > > > > > I can reproduce a crash with 6.13-rc5 PV dom0.
> > > > > > >=20
> > > > > > > What is really interesting in the logs: most crashes seem to =
happen right
> > > > > > > after a module being loaded (in my reproducer it was right af=
ter loading
> > > > > > > the first module).
> > > > > > >=20
> > > > > > > I need to go through the 6.13 commits, but I think I remember=
 having seen
> > > > > > > a patch optimizing module loading by using large pages for ad=
dressing the
> > > > > > > loaded modules. Maybe the case of no large pages being availa=
ble isn't
> > > > > > > handled properly.
> > > > > >=20
> > > > > > Seems I was right.
> > > > > >=20
> > > > > > For me the following diff fixes the issue. Marek, can you pleas=
e confirm
> > > > > > it fixes your crashes, too?
> > > > >=20
> > > > > Thanks for looking into it!
> > > > > Will do, I've pushed it to
> > > > > https://github.com/QubesOS/qubes-linux-kernel/pull/662, CI will b=
uild it
> > > > > and then I'll post it to openQA.
> > > >=20
> > > > It is much better!
> > > >=20
> > > > Tests are still running, but I already see that many are green.
> > >=20
> > > So are you fine with me adding your "Tested-by:"?
> >=20
> > Yes.
> >=20
> > > > There is
> > > > one issue (likely unrelated to this change) - sys-usb (HVM domU wit=
h USB
> > > > controllers passed through) crashes on a system with Raptor Lake CPU
> > > > (only, others, including ADL and MTL look fine):
>=20
> Correction, it does happen on some others too, just got the crash on the =
ADL
> system, although looks a bit different ("Corrupted page table at ..."):

I've collected some more of them at https://github.com/QubesOS/qubes-issues=
/issues/9681

Should I start new thread for this? On one hand, it's a different domain
type (HVM), but on the other hand, many of the crashes are around
loading modules too.

> > > > [   75.770849] Bluetooth: Core ver 2.22
> > > > [   75.770866] Oops: general protection fault, probably for non-can=
onical address 0xc9d2315bc82c3bbd: 0000 [#1] PREEMPT SMP NOPTI
> > > > [   75.770880] CPU: 0 UID: 0 PID: 923 Comm: (udev-worker) Not taint=
ed 6.13.0-0.rc5.2.qubes.1.fc41.x86_64 #1
> > > > [   75.770890] Hardware name: Xen HVM domU, BIOS 4.19.0 01/02/2025
> > > > [   75.770897] RIP: 0010:msft_monitor_device_del+0x93/0x170 [blueto=
oth]
> > > > [   75.770924] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 0=
0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0 6=
5 21 <26> 2b 8b ad 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
> > >=20
> > > This code is looking suspicious. Large areas of binary 0 in a normal =
function?
> > > And the code itself is nonsense, as it is using a memory access via E=
S:, which
> > > doesn't make any sense in 64-bit kernel.
> >=20
> > Could it be still something related to modules layout in memory?
> > It seems it's not 100% reliable crash, I see in at least one instance
> > sys-usb remained running (unfortunately I don't have collected full
> > sys-usb console log from successful test...).
> >=20
> > I just checked again that this crash didn't happen with any 6.12 or 6.11
> > kernels.
> >=20
> > --=20
> > Best Regards,
> > Marek Marczykowski-G=C3=B3recki
> > Invisible Things Lab
>=20
>=20
>=20
> --=20
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9rr+QR6SemhkxG7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd3MoUACgkQ24/THMrX
1ywetwf/QgxgN60A7zYRYpRF1vnTepqX3Juvr11mC4Ek9Lasl7cp59PTiNZArPmZ
RbtWL14u85wlyXLlZx49QfotkEolF+6uq+PlpcTHSNto32I68NO07yUiK9m7K4x5
sz+3x0j1Js6QF+Ip9VyUCNHMeHzeYucPZ3iP4MWf1HZXCzJVFLiudtgGiJA486wl
bMQh1IAUI5P2zF+cupWhnL4clXarlghCl16Qr87mmcE0mminyxIoWaqApVW51MbD
3H3NgxY06PdUQffOb4b/GAX8+E7RE+Xw1JLR7D9fdAdCfyKBr9IUnGmKZeG4x45S
4v1dzU8qRU5MIBiIXTVVDiEEniXtUw==
=7XeS
-----END PGP SIGNATURE-----

--9rr+QR6SemhkxG7w--

