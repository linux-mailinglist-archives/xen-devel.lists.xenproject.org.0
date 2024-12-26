Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0409FCD2B
	for <lists+xen-devel@lfdr.de>; Thu, 26 Dec 2024 19:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.863383.1274810 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQsuJ-0005WM-F8; Thu, 26 Dec 2024 18:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 863383.1274810; Thu, 26 Dec 2024 18:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tQsuJ-0005UP-C2; Thu, 26 Dec 2024 18:48:27 +0000
Received: by outflank-mailman (input) for mailman id 863383;
 Thu, 26 Dec 2024 18:48:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HQxm=TT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tQsuH-0005TY-Ev
 for xen-devel@lists.xenproject.org; Thu, 26 Dec 2024 18:48:25 +0000
Received: from fhigh-a3-smtp.messagingengine.com
 (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5672c49-c3b9-11ef-99a3-01e77a169b0f;
 Thu, 26 Dec 2024 19:48:13 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 1D78F114016C
 for <xen-devel@lists.xenproject.org>; Thu, 26 Dec 2024 13:48:12 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Thu, 26 Dec 2024 13:48:12 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 26 Dec 2024 13:48:11 -0500 (EST)
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
X-Inumbo-ID: f5672c49-c3b9-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1735238892;
	 x=1735325292; bh=z6ILCZyKYEYu/+df/UDnQYY4VydKA+78DiVS/BSI4U8=; b=
	pqVNCawzbtaV2PCSU0fvKXkgFUPI9leZcixVVzZe9+gl31OVnY9kApjS7/bDgQuv
	FtaBcwhnJheupnRDiq1oW9WsPMOKgHbxWaLfBQiZL3FSARtfzsOWKUk6jqQJYVNW
	I6qf6nowqgpTL5D9gHU5thFvxHgMvyM7v8bMK0jleZ1Lp/ZaoNexbe+FN2OZXiKo
	mlvWDNOMoJz3cc/kUAFfniIIBlq1ns9XgTjB+TlnImrIDjp7H5IN9bVnG6Z49Ji6
	+vywJ1rCyaJEcFZQZI1PXVcYWIsX/cYnfSNSs8Bo4nt5Yt5z9/qMzVwXD+JiQDvE
	aukFjvcOSHwfUPHYsnUABw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735238892; x=1735325292; bh=z6ILCZyKYEYu/+df/UDnQYY4VydKA+78DiV
	S/BSI4U8=; b=i6vkS5R506QNXYDO4YaT+2cK/qjY8qznTfIguIZ9LGbf3eB0UVp
	bq84dBxV4BZODNQYZh4CZRv9oZV023g1mavlRgADHYrsc1Ur0/XWLFLk1QyTlXgZ
	pUV5DwB+ffva2tmt6c+yZ00vYzxQRcUDiQihe6SNXbr8c9zjvFWIbq9QvJ1ymH09
	hpIMQJlOYSCJ9ZzyVCNA0U36rsFQf1o6znez4imnCL8bobfTfuyJrGbH/G4tSynI
	xbieTweshlWT3v5jDBAISY3jfU2MnZPEEViSMAb+V7GmRjYaaWJ1bXykloB74vLN
	nRnViRmqhUtJmKJmLGhtZdHj7B7Mgyhhn7A==
X-ME-Sender: <xms:66RtZyYzZ7zx5CLmhrVqzOPPDZkxNrI9yY2d5K93bkBxzfpfww5FQw>
    <xme:66RtZ1YH41LItpeVJnvkLarlu9HDki9nn9-oAh6FS_oQZXpAty0cOQijGJKYMuIDo
    PkFfOkEJzwWBg>
X-ME-Received: <xmr:66RtZ8-76ZFCGKueK6z4IGCvKoXJwJmfwnHpXnvdG1R5rzWfsZDT9JghzJA6LMw4a3bbGIyCPafi7VrThxkVVdqi5HRa6F9bbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddukedguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecunecujfgurhepfffhvf
    fukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihk
    ohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveffiefghfekhffggeef
    fffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghl
    vghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedupdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhj
    vggtthdrohhrgh
X-ME-Proxy: <xmx:66RtZ0pd-AiKwZMKgpcDaASv-Y0E1x7VBgllg_K1SQjLMHepkx0SjA>
    <xmx:66RtZ9r4C15xc8h34GZedWpcqw4K_eVtPAOT0K1S5Qwkiu2JN8xOyA>
    <xmx:66RtZyRti8KzsXylVd9P6SdmaSOkFxr3jRsRTKNLDGp7M5nrDQUnmg>
    <xmx:66RtZ9phOWEtfQ-afi86xR_s71ONR-IONXbTstE--NneUdnBzj1mJQ>
    <xmx:7KRtZ-AH_vbpHuP4TG61wRLK4yNe1NvjMa8h5nZ8jSngVts7qVyL9EJQ>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 26 Dec 2024 19:48:08 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
Message-ID: <Z22k6fH7SxbvQB7X@mail-itl>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <Z2TNBPXj6DXDaonD@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="q8zuvRHPgZ9sUEen"
Content-Disposition: inline
In-Reply-To: <Z2TNBPXj6DXDaonD@mail-itl>


--q8zuvRHPgZ9sUEen
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Dec 2024 19:48:08 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0

On Fri, Dec 20, 2024 at 02:48:52AM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Dec 19, 2024 at 05:14:52PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > It crashes on boot like below, most of the times. But sometimes (rarely)
> > it manages to stay alive. Below I'm pasting few of the crashes that look
> > distinctly different, if you follow the links, you can find more of
> > them. IMHO it looks like some memory corruption bug somewhere. I tested
> > also Linux 6.13-rc2 before, and it had very similar issue.
> >=20
> > The traces below are all from nested virt (Xen inside KVM), tests with
> > Xen directly on the hardware are still in progress. But -rc2 failed all
> > of them too, so if it's the same issue, I guess they will looks similar.
>=20
> Yes, on real hardware it crashes too.

6.13-rc4 fails the same way.

> I tried to enable KASAN, but that didn't worked out:
>=20
> (XEN) d0 has maximum 416 PIRQs
> (XEN) *** Building a PV Dom0 ***
> (XEN)  Xen  kernel: 64-bit, lsb
> (XEN)  Dom0 kernel: 64-bit, lsb, paddr 0x200000 -> 0x7600000
> (XEN) PHYSICAL MEMORY ARRANGEMENT:
> (XEN)  Dom0 alloc.:   0000000260000000->0000000268000000 (1005377 pages t=
o be allocated)
> (XEN)  Init. ramdisk: 000000027d741000->000000027ffff207
> (XEN) VIRTUAL MEMORY ARRANGEMENT:
> (XEN)  Loaded kernel: ffffffff80200000->ffffffff87600000
> (XEN)  Phys-Mach map: 0000008000000000->0000008000800000
> (XEN)  Start info:    ffffffff87600000->ffffffff876004b8
> (XEN)  Page tables:   ffffffff87601000->ffffffff87640000
> (XEN)  Boot stack:    ffffffff87640000->ffffffff87641000
> (XEN)  TOTAL:         ffffffff80000000->ffffffff87800000
> (XEN)  ENTRY ADDRESS: ffffffff8615da50
> (XEN) Dom0 has maximum 2 VCPUs
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Scrubbing Free RAM in background
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 684kB init memory
> (XEN) d0v0 Unhandled: vec 14, #PF[0002]
> (XEN) Pagetable walk from fffffbfff0900fc6:
> (XEN)  L4[0x1f7] =3D 0000000000000000 ffffffffffffffff
> (XEN) domain_crash_sync called from entry.S: fault at ffff82d0402ebdec x8=
6_64/entry.S#create_bounce_frame+0x14c/0x170
> (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
> (XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Not tainted ]----
> (XEN) CPU:    0
> (XEN) RIP:    e033:[<ffffffff8614ff32>]
> (XEN) RFLAGS: 0000000000000286   EM: 1   CONTEXT: pv guest (d0v0)
> (XEN) rax: ffffffff860d8000   rbx: ffffffff87600000   rcx: 00000000c00001=
01
> (XEN) rdx: 3be9e05ee5ed7ef7   rsi: ffffffff87600000   rdi: fffffbfff0900f=
c6
> (XEN) rbp: ffffffff84807f48   rsp: ffffffff84807df0   r8:  00000000000000=
00
> (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 00000000000000=
00
> (XEN) r12: dffffc0000000000   r13: 0000000000000000   r14: 00000000000000=
00
> (XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003406=
60
> (XEN) cr3: 0000000267601000   cr2: fffffbfff0900fc6
> (XEN) fsb: 0000000000000000   gsb: ffffffff860d8000   gss: 00000000000000=
00
> (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
> (XEN) Guest stack trace from rsp=3Dffffffff84807df0:
> (XEN)    00000000c0000101 0000000000000000 0000000000000002 ffffffff8614f=
f32
> (XEN)    000000010000e030 0000000000010086 ffffffff84807e30 000000000000e=
02b
> (XEN)    0000000041b58ab3 ffffffff845f8030 ffffffff8614fed0 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    ffffffff8615da6f 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000=
000
> (XEN)    0000000000000000 0000000000000000
> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
> (XEN) Resetting with ACPI MEMORY or I/O RESET_REG.
>=20
> > Who should I CC here? The failures are all over the place... linux-mm?
>=20
> --=20
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--q8zuvRHPgZ9sUEen
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmdtpOkACgkQ24/THMrX
1ywhsAgAluf3fe1wc+P+ETc/JmgZkJ94iuT2WlK3mqFd7ncRbd67LVSiiF2BHu7o
oz+km7wyBF8sUwcThh8UUqyipPudHii0hy0/lRIkVHiwIfcAfG5wdH4oo1yaEQhK
mPkbBnFBtaguA0MaSJwYxggKT715oxLQHDCFIo3YwWbxnfoGeXTLRSd4naqmF5fR
AIZGClv9xr8JpZL36LJKF41ku/8wqJt/wNNv2qGw70GkMeyVOF208PCsbMiPTySt
4spMh7Yj+rhITB3+5UU+buXmgEpBq3uXv4LUmZ6pChdBpjy3mRltIfmO7i9Je0ZR
bNmDQimmNApwUcljjnVrq/ZNwR8c5g==
=kA3n
-----END PGP SIGNATURE-----

--q8zuvRHPgZ9sUEen--

