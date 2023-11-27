Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB5A7F9E91
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 12:27:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.641992.1001018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ZlX-0000pK-JH; Mon, 27 Nov 2023 11:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 641992.1001018; Mon, 27 Nov 2023 11:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7ZlX-0000mg-Fk; Mon, 27 Nov 2023 11:27:03 +0000
Received: by outflank-mailman (input) for mailman id 641992;
 Mon, 27 Nov 2023 11:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a1Fr=HI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r7ZlV-0000kL-Nq
 for xen-devel@lists.xen.org; Mon, 27 Nov 2023 11:27:01 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dda89fd1-8d17-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 12:26:57 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 93E883200AC7;
 Mon, 27 Nov 2023 06:26:52 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 27 Nov 2023 06:26:52 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Nov 2023 06:26:51 -0500 (EST)
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
X-Inumbo-ID: dda89fd1-8d17-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1701084412; x=1701170812; bh=Ahovy3dTMQY5oV7FRTgjhhNH+Fxl2JWmSk3
	tOMjcAbA=; b=xIN8yc7w11iqT8MNuarkF581B/CkDLiNCTKVQjNImWlTFPabBAx
	ZpnfYAfk42mnIHpzNTVeUTNgE1Dnn8ll4SWDZuQG1fi+FXmlVeO4U6DFvfk3B33y
	Nu+mZ1rlk/CMS8HREPU+NUeWR7MXzWyKNgP9YqelcbReRdwBv3jnJVGSRbjNjhzX
	3K8ODBAAbSTQOZwfuPUet+90Bj6AWcH9x0e1lVBFdcvmZQJvPiPjMcx1u3oSZt2S
	5kl6iQjLkn6XuY55qgtky9LUxB99t0knRIzYRBX95hXxFToMnKsD13+guzpD1A50
	iyljFu0WdwkS/w393gaLsHVVJ3/NXnp9lVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701084412; x=1701170812; bh=Ahovy3dTMQY5o
	V7FRTgjhhNH+Fxl2JWmSk3tOMjcAbA=; b=p6VBWOTlWzOaTIV+uCn5kyTc0VfpK
	x92rkoWfWfSejZujfVD3eYQzPWDp68/FhULi+LggKpu2ym5Il+s0zm58HdnlvQeS
	K+U7LYbkOfUaULNdQaOJCG/4FhGeDfNP6kzlfNNtcrZ+A+lVA309Ko5r39+oUJ99
	yrSpAmDcnHkDdxhAvnAOReqqozWbCmdm/dSJrSIhsOY2GPembMvlYp73Fzj/y98H
	X3b3nVGIlWjZ+rjJiAAoVZkGKZ81185U1CrELrYJE38ON5PePZkjlEGO4OgTM/B5
	yqWeAxpRMydMT5lH4GOZm9pRGVLPwRp30NtXZCyRclHr635piCXm/zajQ==
X-ME-Sender: <xms:-3xkZfrbMq8Ucmsu8ZYVIuzl5UML5j3uo48aX0I8MCV9QE7VHaacrw>
    <xme:-3xkZZphuChcbE4Fi8ZIgnTJCzHi0lXmZahEahVOAId90xxjj5u9i2z8gJfEQU8IM
    co7znHF1CEPog>
X-ME-Received: <xmr:-3xkZcNCintfLtlVWhtZwCEAapTgkrFB1JWpY-5VsqFdhPOBMQYyruACa1QZ7n7UBn32-MYHWOJFUrONFUtnyeGkxy10rYmRG_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeiuddgvdekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueek
    teetgefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomh
    grihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:-3xkZS4Lgbxs6VG4CEJvJ7k8ZXxyLBlqcSBf2bj7PAKFBQ5b_k3luQ>
    <xmx:-3xkZe7aqKH94eliv7uonD1vIgzxQE4vDTG056QCaoYePIOeQe2G0g>
    <xmx:-3xkZain5UFzw_rC20dzKnYMx7yzjnm9fM6VgpIcWv3uNLGM1pFGDg>
    <xmx:_HxkZbVtafVarH342kXUEQE2dJTjHOxjQWvIxMN-4ag_MBVItpQY6w>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 27 Nov 2023 12:26:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Subject: Re: [Xen-devel] PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF
Message-ID: <ZWR8+Xjm2K8eZpab@mail-itl>
References: <20180216174835.GJ4302@mail-itl>
 <3b6ce245-626d-a6db-b9fa-77dcf26a4ad6@citrix.com>
 <20180216185122.GK4302@mail-itl>
 <b8bb621f-1558-d207-4978-4dca46e350e6@citrix.com>
 <01e7d219-5a2f-58cb-bb30-59f31749f019@suse.com>
 <ZWNbWPkKsLI1q8+D@mail-itl>
 <CACHz=ZiWufUenyw_wg+QuK86+gU5RZNkuJNzX9-K1UM5P3m8+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="exY+4DKLQTsw8emk"
Content-Disposition: inline
In-Reply-To: <CACHz=ZiWufUenyw_wg+QuK86+gU5RZNkuJNzX9-K1UM5P3m8+Q@mail.gmail.com>


--exY+4DKLQTsw8emk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Nov 2023 12:26:49 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Subject: Re: [Xen-devel] PV guest with PCI passthrough crash on Xen 4.8.3
 inside KVM when booted through OVMF

On Mon, Nov 27, 2023 at 11:20:36AM +0000, Frediano Ziglio wrote:
> On Sun, Nov 26, 2023 at 2:51=E2=80=AFPM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Mon, Feb 19, 2018 at 06:30:14PM +0100, Juergen Gross wrote:
> > > On 16/02/18 20:02, Andrew Cooper wrote:
> > > > On 16/02/18 18:51, Marek Marczykowski-G=C3=B3recki wrote:
> > > >> On Fri, Feb 16, 2018 at 05:52:50PM +0000, Andrew Cooper wrote:
> > > >>> On 16/02/18 17:48, Marek Marczykowski-G=C3=B3recki wrote:
> > > >>>> Hi,
> > > >>>>
> > > >>>> As in the subject, the guest crashes on boot, before kernel outp=
ut
> > > >>>> anything. I've isolated this to the conditions below:
> > > >>>>  - PV guest have PCI device assigned (e1000e emulated by QEMU in=
 this case),
> > > >>>>    without PCI device it works
> > > >>>>  - Xen (in KVM) is started through OVMF; with seabios it works
> > > >>>>  - nested HVM is disabled in KVM
> > > >>>>  - AMD IOMMU emulation is disabled in KVM; when enabled qemu cra=
shes on
> > > >>>>    boot (looks like qemu bug, unrelated to this one)
> > > >>>>
> > > >>>> Version info:
> > > >>>>  - KVM host: OpenSUSE 42.3, qemu 2.9.1, ovmf-2017+git1492060560.=
b6d11d7c46-4.1, AMD
> > > >>>>  - Xen host: Xen 4.8.3, dom0: Linux 4.14.13
> > > >>>>  - Xen domU: Linux 4.14.13, direct boot
> > > >>>>
> > > >>>> Not sure if relevant, but initially I've tried booting xen.efi /=
mapbs
> > > >>>> /noexitboot and then dom0 kernel crashed saying something about =
conflict
> > > >>>> between e820 and kernel mapping. But now those options are disab=
led.
> > > >>>>
> > > >>>> The crash message:
> > > >>>> (XEN) d1v0 Unhandled invalid opcode fault/trap [#6, ec=3D0000]
> > > >>>> (XEN) domain_crash_sync called from entry.S: fault at ffff82d080=
218720 entry.o#create_bounce_frame+0x137/0x146
> > > >>>> (XEN) Domain 1 (vcpu#0) crashed on cpu#1:
> > > >>>> (XEN) ----[ Xen-4.8.3  x86_64  debug=3Dn   Not tainted ]----
> > > >>>> (XEN) CPU:    1
> > > >>>> (XEN) RIP:    e033:[<ffffffff826d9156>]
> > > >>> This is #UD, which is most probably hitting a BUG().  addr2line t=
his ^
> > > >>> to find some code to look at.
> > > >> addr2line failed me
> > > >
> > > > By default, vmlinux is stripped and compressed.  Ideally you want to
> > > > addr2line the vmlinux artefact in the root of your kernel build, wh=
ich
> > > > is the plain elf with debugging symbols.
> > > >
> > > > Alternatively, use scripts/extract-vmlinux on the binary you actual=
ly
> > > > booted, which might get you somewhere.
> > > >
> > > >> , but System.map says its xen_memory_setup. And it
> > > >> looks like the BUG() is the same as I had in dom0 before:
> > > >> "Xen hypervisor allocated kernel memory conflicts with E820 map".
> > > >
> > > > Juergen: Is there anything we can do to try and insert some dummy
> > > > exception handlers right at PV start, so we could at least print ou=
t a
> > > > oneliner to the host console which is a little more helpful than Xen
> > > > saying "something unknown went wrong" ?
> > >
> > > You mean something like commit 42b3a4cb5609de757f5445fcad18945ba9239a=
07
> > > added to kernel 4.15?
> > >
> > > >
> > > >>
> > > >> Disabling e820_host in guest config solved the problem. Thanks!
> > > >>
> > > >> Is this some bug in Xen or OVMF, or is it expected behavior and e8=
20_host
> > > >> should be avoided?
> > > >
> > > > I don't really know.  e820_host is a gross hack which shouldn't rea=
lly
> > > > be present.  The actually problem is that Linux can't cope with the
> > > > memory layout it was given (and I can't recall if there is anything
> > > > Linux could potentially to do cope).  OTOH, the toolstack, which kn=
ew
> > > > about e820_host and chose to lay the guest out in an overlapping wa=
y is
> > > > probably also at fault.
> > >
> > > The kernel can cope with lots of E820 scenarios (e.g. by relocating
> > > initrd or the p2m map), but moving itself out of the way is not
> > > possible.
> >
> > I'm afraid I need to resurrect this thread...
> >
> > With recent kernel (6.6+), the host_e820=3D0 workaround is not an option
> > anymore. It makes Linux not initialize xen-swiotlb (due to
> > f9a38ea5172a3365f4594335ed5d63e15af2fd18), so PCI passthrough doesn't
> > work at all. While I can add yet another layer of workaround (force
> > xen-swiotlb with iommu=3Dsoft), that's getting unwieldy.
> >
> > Furthermore, I don't get the crash message anymore, even with debug
> > hypervisor and guest_loglvl=3Dall. Not even "Domain X crashed" in `xl
> > dmesg`. It looks like the "crash" shutdown reason doesn't reach Xen, and
> > it's considered clean shutdown (I can confirm it by changing various
> > `on_*` settings (via libvirt) and observing which gets applied).
> >
> > Most tests I've done with 6.7-rc1, but the issue I observed on 6.6.1
> > already.
> >
> > This is on Xen 4.17.2. And the L0 is running Linux 6.6.1, and then uses
> > QEMU 8.1.2 + OVMF 202308 to run Xen as L1.
> >
>=20
> So basically you start the domain and it looks like it's shutting down
> cleanly from logs.
> Can you see anything from the guest? Can you turn on some more
> debugging at guest level?

No, it crashes before printing anything to the console, also with
earlyprintk=3Dxen.

> I tried to get some more information from the initial crash but I
> could not understand which guest code triggered the bug.

I'm not sure which one is it this time (because I don't have Xen
reporting guest crash...) but last time it was here:
https://github.com/torvalds/linux/blob/master/arch/x86/xen/setup.c#L873-L874

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--exY+4DKLQTsw8emk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmVkfPkACgkQ24/THMrX
1yyHMgf6A8AxoFAloPh24/UoabFzFWqVwbwNXr0mL+HK/nCjf3MbOEUdzTiPOM39
91Pbywha5jf9FW6yFwssKCYwNAcFxNmyoCbFC0nxMvMrA1nBAnq3gsJBLLU7FkQs
EQqE7M47fYZJf1K6otwkKq+GTvKR5nheXCKpMIqEM5qRFvhNtdL3v8m4/071D8JG
VQpYxeBRT1Ad1Uwxbe1j5v+yksPk2CW8jztomb3ypQxs02R0hAXdBWF7VK0pJ43I
a94lluEI2T2TSeG6iX2k9+8sKIVdZldIbrtIk0sSiihkIFr3oROtUzhg3L13neoH
HOanUQSlGRwlZ9aQdf7yQt/Ok2z8Bg==
=0YKb
-----END PGP SIGNATURE-----

--exY+4DKLQTsw8emk--

