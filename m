Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7299FFF7B
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 20:39:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864493.1275725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTR2S-0000iO-Mx; Thu, 02 Jan 2025 19:39:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864493.1275725; Thu, 02 Jan 2025 19:39:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTR2S-0000gi-KO; Thu, 02 Jan 2025 19:39:24 +0000
Received: by outflank-mailman (input) for mailman id 864493;
 Thu, 02 Jan 2025 19:39:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4GO/=T2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tTR2R-0000gG-4V
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 19:39:23 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42c0fda3-c941-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 20:39:21 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id C2795138025C;
 Thu,  2 Jan 2025 14:39:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Thu, 02 Jan 2025 14:39:19 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jan 2025 14:39:18 -0500 (EST)
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
X-Inumbo-ID: 42c0fda3-c941-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1735846759;
	 x=1735933159; bh=AOJKkoWdqLRCfxD4AzfEHgkJlNyrpBNHvppGXkCF0gY=; b=
	jzIIzNeBd9bCxPcGju5Jy+XQf/3cHa6Uj23e6qiJoJDo7+MTT6z8P3IlvbFDamUe
	D97B5fbXdG9f7/aVyA7TbQiykVeZ6Hd2zL2HVXLO6jAMyLlVN5v4ANDybp13juQI
	uJtz15D98J2XkxMeJ+G09M/gs0/Udv15h2yQHIOjvSe4mltvRsr5QbCAhjh0dqlg
	7mskOd1X6NnDCYv9Sfn21ZEOzOFlcWluMSWyGODtF2DpWlVkfGJtq+pmWGe4fwmM
	JdG4Mc/fmDcr8rlexePpKZPlU4Aw+i3DU5ji2qayUQfxEAi43HRlKLP0VRBI31jK
	mDzCubE3m4XGSmBM/bS8Ug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735846759; x=1735933159; bh=AOJKkoWdqLRCfxD4AzfEHgkJlNyrpBNHvpp
	GXkCF0gY=; b=l0TXYLb/9OzXd2FhMHBfuTGAPc0Rym9g3qdxsj4EyaSndUwWGkH
	sjNNrigACsbumH2jIlGxz3ZdwWRVBZS3vxefS2qYABIl32U2CE8Azy82V/0mUNwB
	jcjPao2c3VlK5lwJzHDVBChJ5mW/a1oWJ0OI9GwXRQVgR8OQXFZt6TQfk302YB35
	fT+sLrFjrFLJqvZN6OnGWiHpoVq56IoJmQF5pmHFH/umK6UnaUyHqAdZCzfAmtl1
	PxmneV1kvaOeiQq2IrS7VxzZjuj5LtcltPcg74EcphpXb2hRDn2lPqyUtxE0LiPx
	giddIWI4oiR5s9AwWh8/PvLlzSKxGqP21wg==
X-ME-Sender: <xms:Z-t2Z1hjVsy1MyCBUrBIkmSQYPkTJJTF0AI0m-jivTou8nfKN7SNUw>
    <xme:Z-t2Z6B4H8sS1ZBqPeyC3BV3w-ZlXb8D8_gCppgnqWAjJyEpKpEifM9zdsdPnjP7r
    ouV_ggfhiBwng>
X-ME-Received: <xmr:Z-t2Z1F0pq3JSrm43yt5tu-H2lAoJMjLHOhXlRJvTKMkMTrBanozLqyZkneSnhbUYUPdVu77_VsGjWJZFa-mVztJuGaiyYQBSw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefvddguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvf
    evuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiih
    khhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepjeejgfekudegheeivdei
    ffdvffegteektdfhudeljeeikefhteefkeefgffgieegnecuffhomhgrihhnpehquhgsvg
    hsqdhoshdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepvddpmhhouggvpehsmhhtphho
    uhhtpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopeigvg
    hnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:Z-t2Z6S47zk6ntDpRQNVcQ3Af0tbi1q83fEnbgYqUdAP42-6Pw9A4g>
    <xmx:Z-t2Zyy6aLahAk0gA4k1ogNxQPdiFqO7qSLO1NARH6Me4uMjR4MM3w>
    <xmx:Z-t2Zw5pUQsxENhM9Vkt3PvdKh10Q7oKYRy6TB3MXPVWyn65he_hAA>
    <xmx:Z-t2Z3zgkWUyb5k66RaUPWcfyeRPGjWf9nnN-Cb28d8KpIdis_xg4g>
    <xmx:Z-t2Z99gSIgj2dLwBJqPT7uBRsSTYmRX70QWDPZkJoOu_S2LR8EPsEJP>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Jan 2025 20:39:16 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
Message-ID: <Z3brZQmYhx-QTnga@mail-itl>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
 <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com>
 <Z3aFdrygLF9yK2EK@mail-itl>
 <Z3bg-gvaBEdSIuRW@mail-itl>
 <08f9604b-df23-4766-a290-ef9daa506f8d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y+Pros9Mh0d2c3u3"
Content-Disposition: inline
In-Reply-To: <08f9604b-df23-4766-a290-ef9daa506f8d@suse.com>


--Y+Pros9Mh0d2c3u3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Jan 2025 20:39:16 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0

On Thu, Jan 02, 2025 at 08:17:00PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 02.01.25 19:54, Marek Marczykowski-G=C3=B3recki wrote:
> > On Thu, Jan 02, 2025 at 01:24:21PM +0100, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Thu, Jan 02, 2025 at 12:30:10PM +0100, Juergen Gross wrote:
> > > > On 02.01.25 11:20, J=C3=BCrgen Gro=C3=9F wrote:
> > > > > On 19.12.24 17:14, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > It crashes on boot like below, most of the times. But sometimes=
 (rarely)
> > > > > > it manages to stay alive. Below I'm pasting few of the crashes =
that look
> > > > > > distinctly different, if you follow the links, you can find mor=
e of
> > > > > > them. IMHO it looks like some memory corruption bug somewhere. =
I tested
> > > > > > also Linux 6.13-rc2 before, and it had very similar issue.
> > > > >=20
> > > > > ...
> > > > >=20
> > > > > >=20
> > > > > > Full log:
> > > > > > https://openqa.qubes-os.org/tests/122879/logfile?filename=3Dser=
ial0.txt
> > > > >=20
> > > > > I can reproduce a crash with 6.13-rc5 PV dom0.
> > > > >=20
> > > > > What is really interesting in the logs: most crashes seem to happ=
en right
> > > > > after a module being loaded (in my reproducer it was right after =
loading
> > > > > the first module).
> > > > >=20
> > > > > I need to go through the 6.13 commits, but I think I remember hav=
ing seen
> > > > > a patch optimizing module loading by using large pages for addres=
sing the
> > > > > loaded modules. Maybe the case of no large pages being available =
isn't
> > > > > handled properly.
> > > >=20
> > > > Seems I was right.
> > > >=20
> > > > For me the following diff fixes the issue. Marek, can you please co=
nfirm
> > > > it fixes your crashes, too?
> > >=20
> > > Thanks for looking into it!
> > > Will do, I've pushed it to
> > > https://github.com/QubesOS/qubes-linux-kernel/pull/662, CI will build=
 it
> > > and then I'll post it to openQA.
> >=20
> > It is much better!
> >=20
> > Tests are still running, but I already see that many are green.
>=20
> So are you fine with me adding your "Tested-by:"?

Yes.

> > There is
> > one issue (likely unrelated to this change) - sys-usb (HVM domU with USB
> > controllers passed through) crashes on a system with Raptor Lake CPU
> > (only, others, including ADL and MTL look fine):
> >=20
> > [   75.770849] Bluetooth: Core ver 2.22
> > [   75.770866] Oops: general protection fault, probably for non-canonic=
al address 0xc9d2315bc82c3bbd: 0000 [#1] PREEMPT SMP NOPTI
> > [   75.770880] CPU: 0 UID: 0 PID: 923 Comm: (udev-worker) Not tainted 6=
=2E13.0-0.rc5.2.qubes.1.fc41.x86_64 #1
> > [   75.770890] Hardware name: Xen HVM domU, BIOS 4.19.0 01/02/2025
> > [   75.770897] RIP: 0010:msft_monitor_device_del+0x93/0x170 [bluetooth]
> > [   75.770924] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0 65 21=
 <26> 2b 8b ad 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>=20
> This code is looking suspicious. Large areas of binary 0 in a normal func=
tion?
> And the code itself is nonsense, as it is using a memory access via ES:, =
which
> doesn't make any sense in 64-bit kernel.

Could it be still something related to modules layout in memory?
It seems it's not 100% reliable crash, I see in at least one instance
sys-usb remained running (unfortunately I don't have collected full
sys-usb console log from successful test...).

I just checked again that this crash didn't happen with any 6.12 or 6.11
kernels.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Y+Pros9Mh0d2c3u3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd262QACgkQ24/THMrX
1yx0NQf+LajgMA2io7pgUJDZmPQOSOoVUHUFuATAfRxIEH9QeRXe6LvOAOotInFb
rUuo9RM5S8GNfPhArFr7Penz3J8V+u4t/xz2NheCGhaZFSENkOi6fiW83BVLmmGu
oR+c0homnK9dqV9FaqNLPjSiM7Ej7NcKuzVtceSPAuRihhq+OnNxKI0Bue0DXIP7
1vTK8Uj08KFfdJMJ2rGCr2aGFRbYe0BchRSRVH7zX6Op4SInYYUBE5vxQ5ViktHI
UEfQ3Z1eiBJAObp67ewWk4KbrMmXktJazdtiX2bw25MeN1LhLabVGobYknlkSqvi
3ng6g6tlWeIGvnGiEsa4N2zaYqwFMg==
=Pnj/
-----END PGP SIGNATURE-----

--Y+Pros9Mh0d2c3u3--

