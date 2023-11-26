Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3A47F9334
	for <lists+xen-devel@lfdr.de>; Sun, 26 Nov 2023 15:52:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641388.1000047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7GTd-0006bw-Or; Sun, 26 Nov 2023 14:51:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641388.1000047; Sun, 26 Nov 2023 14:51:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7GTd-0006ZY-Ly; Sun, 26 Nov 2023 14:51:17 +0000
Received: by outflank-mailman (input) for mailman id 641388;
 Sun, 26 Nov 2023 14:51:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TSke=HH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r7GTb-0006ZS-Ez
 for xen-devel@lists.xen.org; Sun, 26 Nov 2023 14:51:15 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b7ea015-8c6b-11ee-98e2-6d05b1d4d9a1;
 Sun, 26 Nov 2023 15:51:12 +0100 (CET)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id BAF385C0089;
 Sun, 26 Nov 2023 09:51:07 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Sun, 26 Nov 2023 09:51:07 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 26 Nov 2023 09:51:06 -0500 (EST)
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
X-Inumbo-ID: 3b7ea015-8c6b-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1701010267; x=1701096667; bh=yMTiAU4nKA5KvLWbdyh3fJCHXXfE6402iU9
	CsmAyGxY=; b=GoqxoBYcpSLW4mszRZ1y0ESXuEwTe2s/TJW64sxQLIy9JGm83bi
	3jesmz24nzoBmXuv2KHRFKEmEhiqLdD3HzEw5Hlqc8+VMILRF0PNWmoymeW87ckl
	U0dx8hAbmgEYJjmd1V7pEKDz+SeqGRUABjtXHO66HVTp4CPlnI6HYXEnFgacYeFj
	1W0fxNE9EyIVJOXH4OYyykUAxQ+6BrMLT4uQ1uPNtAJa8voE47BLmybdC1jpoMuE
	g+lTBcS/xMFlBlVI8zi9Xtu5RK8MhTSwqKmCOuVl3AiBsGL4FSPkF+5zY893JRvN
	wQawrq0BrvaLYd1K/i5R+J2E/Pb2yFTBuDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701010267; x=1701096667; bh=yMTiAU4nKA5Kv
	LWbdyh3fJCHXXfE6402iU9CsmAyGxY=; b=h8qe7o/lxrv+hRoc4aMjfMSvGSmpF
	hDnG9mg6C7bxQXPXK5TPA9hFqbPpJwQ6HC3ScWkgjE/J6C0f8UCIFz+IeSoDotSz
	UT+6ksST7ZtgLSUyRT+V4ytV84jSL4y0e5O3JAw0RCJQf5Wz0QxRsa09tBG/r4hw
	2en7S6WkcdMjnFgqhJa2Jm3I8MJChIPjOz5YBNl/x0zPhJOnvGU4KPOEuaTD4QxT
	/fyFD00ZxBZ5mCfe9OTcWspeHkvSK5BHS3djy68//+dUyFBNG+pDixFyubdOeX9U
	Pa6rwpsCTlyjZ/ixA+CYexjpbSL+6gu8NRsExzvTXw23lbVRBSxjM+glw==
X-ME-Sender: <xms:W1tjZaZBVnbE0gj8LK9aDILsxeyMPNzEQ7wUwriw7UYD1RG8JykE6g>
    <xme:W1tjZdYzs6IwUK6e8E4XXQYwV3ptQd1gaePY7Su4YqerOuCo6A0mSyw9wEFWds4sG
    SHAxtWeCPz4rQ>
X-ME-Received: <xmr:W1tjZU-uh5sAfGemYVemlwPaGFQ-Bn2hZ1cOtQGj_ZGVf3rYNCJZKcu8HwgthkQ2vw3QlpUq5hvxKcjbniR45ljZdWJ1_m84NXQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudehledgjedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:W1tjZcqdF5ebH4bLI5OUyyqw3Epw9BiyPYwBPep9mCjzwfFNYu-LPw>
    <xmx:W1tjZVpvTWuoLvlDN9L0g-C-746-VDOn5bvhFQxTSmN-xGp5doXLqQ>
    <xmx:W1tjZaTh4XV6oxvymY34wuBApXRJEXpCE-RvDu6DeaB27dJUa2Nxnw>
    <xmx:W1tjZUSmeLxTyP5CB7uUCIjPbOKCInpRPhWX7AuIbGcYhokGIbseLg>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 26 Nov 2023 15:51:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xen.org>
Subject: Re: [Xen-devel] PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
Message-ID: <ZWNbWPkKsLI1q8+D@mail-itl>
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl>
 <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
 <01e7d219-5a2f-58cb-bb30-59f31749f019@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="I23C6JJ1Z6HK3fb1"
Content-Disposition: inline
In-Reply-To: <01e7d219-5a2f-58cb-bb30-59f31749f019@suse.com>


--I23C6JJ1Z6HK3fb1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 26 Nov 2023 15:51:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel <xen-devel@lists.xen.org>
Subject: Re: [Xen-devel] PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF

On Mon, Feb 19, 2018 at 06:30:14PM +0100, Juergen Gross wrote:
> On 16/02/18 20:02, Andrew Cooper wrote:
> > On 16/02/18 18:51, Marek Marczykowski-G=C3=B3recki wrote:
> >> On Fri, Feb 16, 2018 at 05:52:50PM +0000, Andrew Cooper wrote:
> >>> On 16/02/18 17:48, Marek Marczykowski-G=C3=B3recki wrote:
> >>>> Hi,
> >>>>
> >>>> As in the subject, the guest crashes on boot, before kernel output
> >>>> anything. I've isolated this to the conditions below:
> >>>>  - PV guest have PCI device assigned (e1000e emulated by QEMU in thi=
s case),
> >>>>    without PCI device it works
> >>>>  - Xen (in KVM) is started through OVMF; with seabios it works
> >>>>  - nested HVM is disabled in KVM
> >>>>  - AMD IOMMU emulation is disabled in KVM; when enabled qemu crashes=
 on
> >>>>    boot (looks like qemu bug, unrelated to this one)
> >>>>
> >>>> Version info:
> >>>>  - KVM host: OpenSUSE 42.3, qemu 2.9.1, ovmf-2017+git1492060560.b6d1=
1d7c46-4.1, AMD
> >>>>  - Xen host: Xen 4.8.3, dom0: Linux 4.14.13
> >>>>  - Xen domU: Linux 4.14.13, direct boot
> >>>>
> >>>> Not sure if relevant, but initially I've tried booting xen.efi /mapbs
> >>>> /noexitboot and then dom0 kernel crashed saying something about conf=
lict
> >>>> between e820 and kernel mapping. But now those options are disabled.
> >>>>
> >>>> The crash message:
> >>>> (XEN) d1v0 Unhandled invalid opcode fault/trap [#6, ec=3D0000]
> >>>> (XEN) domain_crash_sync called from entry.S: fault at ffff82d0802187=
20 entry.o#create_bounce_frame+0x137/0x146
> >>>> (XEN) Domain 1 (vcpu#0) crashed on cpu#1:
> >>>> (XEN) ----[ Xen-4.8.3  x86_64  debug=3Dn   Not tainted ]----
> >>>> (XEN) CPU:    1
> >>>> (XEN) RIP:    e033:[<ffffffff826d9156>]
> >>> This is #UD, which is most probably hitting a BUG().=C2=A0 addr2line =
this ^
> >>> to find some code to look at.
> >> addr2line failed me
> >=20
> > By default, vmlinux is stripped and compressed.=C2=A0 Ideally you want =
to
> > addr2line the vmlinux artefact in the root of your kernel build, which
> > is the plain elf with debugging symbols.
> >=20
> > Alternatively, use scripts/extract-vmlinux on the binary you actually
> > booted, which might get you somewhere.
> >=20
> >> , but System.map says its xen_memory_setup. And it
> >> looks like the BUG() is the same as I had in dom0 before:
> >> "Xen hypervisor allocated kernel memory conflicts with E820 map".
> >=20
> > Juergen: Is there anything we can do to try and insert some dummy
> > exception handlers right at PV start, so we could at least print out a
> > oneliner to the host console which is a little more helpful than Xen
> > saying "something unknown went wrong" ?
>=20
> You mean something like commit 42b3a4cb5609de757f5445fcad18945ba9239a07
> added to kernel 4.15?
>=20
> >=20
> >>
> >> Disabling e820_host in guest config solved the problem. Thanks!
> >>
> >> Is this some bug in Xen or OVMF, or is it expected behavior and e820_h=
ost
> >> should be avoided?
> >=20
> > I don't really know.=C2=A0 e820_host is a gross hack which shouldn't re=
ally
> > be present.=C2=A0 The actually problem is that Linux can't cope with the
> > memory layout it was given (and I can't recall if there is anything
> > Linux could potentially to do cope).=C2=A0 OTOH, the toolstack, which k=
new
> > about e820_host and chose to lay the guest out in an overlapping way is
> > probably also at fault.
>=20
> The kernel can cope with lots of E820 scenarios (e.g. by relocating
> initrd or the p2m map), but moving itself out of the way is not
> possible.

I'm afraid I need to resurrect this thread...

With recent kernel (6.6+), the host_e820=3D0 workaround is not an option
anymore. It makes Linux not initialize xen-swiotlb (due to
f9a38ea5172a3365f4594335ed5d63e15af2fd18), so PCI passthrough doesn't
work at all. While I can add yet another layer of workaround (force
xen-swiotlb with iommu=3Dsoft), that's getting unwieldy.

Furthermore, I don't get the crash message anymore, even with debug
hypervisor and guest_loglvl=3Dall. Not even "Domain X crashed" in `xl
dmesg`. It looks like the "crash" shutdown reason doesn't reach Xen, and
it's considered clean shutdown (I can confirm it by changing various
`on_*` settings (via libvirt) and observing which gets applied).

Most tests I've done with 6.7-rc1, but the issue I observed on 6.6.1
already.

This is on Xen 4.17.2. And the L0 is running Linux 6.6.1, and then uses
QEMU 8.1.2 + OVMF 202308 to run Xen as L1.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--I23C6JJ1Z6HK3fb1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmVjW1gACgkQ24/THMrX
1yzhJgf/SoYPLSLh7ifQ0C6Fr8cZPbDnHSjUqWi9SHDvSBBsB1nbnQ91zyxwNfAS
fGvkOJB8k8zGzt5tNojmB914ysHyBpq6wkAzfamz6xhwugzDb/zscjtA1hXvH3Fu
GaQMg64HBhsJymd9eUq76JUBAW8h/6gjw3a5OuCgnmmobTmgO94NrL/he0FdS/b1
GoVwR53ax1Ge/qQL5vNDYMAquhzyK8JSAOn3ypw/vT1Nxpku+8/1vOwwOizAw2+P
y5aMpRIDneun9jbgK78oktbhkbH0BM5d5IieuKV5lTRaEqXRsC1a8EoUQoW5pGy4
BLWa6aMgLltssRQiZTLmER1Y2CnZ9w==
=uSQz
-----END PGP SIGNATURE-----

--I23C6JJ1Z6HK3fb1--

