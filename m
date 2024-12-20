Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E291B9F89B7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Dec 2024 02:49:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.861606.1273569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOS8q-0008Hb-5v; Fri, 20 Dec 2024 01:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 861606.1273569; Fri, 20 Dec 2024 01:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tOS8q-0008Fo-3P; Fri, 20 Dec 2024 01:49:24 +0000
Received: by outflank-mailman (input) for mailman id 861606;
 Fri, 20 Dec 2024 01:49:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lf2i=TN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tOS8o-0008Fg-9R
 for xen-devel@lists.xenproject.org; Fri, 20 Dec 2024 01:49:22 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fe39b15-be74-11ef-99a3-01e77a169b0f;
 Fri, 20 Dec 2024 02:49:18 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 5F19C1380193
 for <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 20:49:17 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Thu, 19 Dec 2024 20:49:17 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 19 Dec 2024 20:49:16 -0500 (EST)
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
X-Inumbo-ID: 9fe39b15-be74-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734659357;
	 x=1734745757; bh=g14WTCMBoTbKiC3sBIPswkQshMBVMEBAMyalDlYrpzM=; b=
	hEK6Ijd+52TWbJIa+aEoikpmsfTPXENR+PkaBbIsu+szccQq/5/zY6ErXh0XvEeh
	b1GjFRiv9ghdiMW1R7LCN4HJUxvyM/F+JWRBo+8vOF3gyPnF9/3H4GrAd936PvI/
	QhlsL9Oj8kctUs+HLubHUO+pyqPD/XZREyBVIodL6VOQf7tynSKVhaT0ss02reGK
	U/Pm1BVOwwsqJNGrbiVMWEsk0r1RONCnujj9nAv6aMac0lqUCax9QqwqpVPM6ieo
	rYcR91z5p7C1WeJaBPZBI2QYgJ4wikFcTdFEkwvKlJg6xM4Qy+H0NLI2tTXGR1WX
	vRpLSFgl+nwETlRZt1GtDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1734659357; x=1734745757; bh=g14WTCMBoTbKiC3sBIPswkQshMBVMEBAMya
	lDlYrpzM=; b=DJaVvbNwUM7ns9+EaXl5MkX1XlVTpIgX3mzUPI2Nh/fnB/qRUO7
	LwaMfl7br7x2sjNkpxrwf1Ni5AT5+4MIH7ByDTwptnBynY36dZBre4G4SzvymUR/
	WPxUruacOUOBAhNXi7kFienOW5P5OoECJV0S1qroE2+qIhBDue6c/s5Lz2UHzxvB
	p6eR8YbtTLmyx6aGogibQxbPHt5Dafw+MpZrkvp3GFYdkPUIrpo0H22xL9Xtu8LO
	ISXdrdfNvO6WUmFQUs0b6WJo72q+xxI8gOiKnUuJZOS5wzIHG3mGRaV5T3eP5G4U
	wxefC+idDOAZQ2ZVCPSAOz70xIpFoxr/+gg==
X-ME-Sender: <xms:Hc1kZ4Tk3e8bLl1nOh09_zGPHsCsf9ObALFk6yK5aloTegqk5mKjBg>
    <xme:Hc1kZ1wAb-awRAmEh1G5s7ELE20_z_cA7Z8JfxnVmAUW_pjGQNe46qjVAvxkidW_H
    yHYQlKTnRwEvA>
X-ME-Received: <xmr:Hc1kZ10nxuvA3TwnEYtgI7euQfT0-IiESfWfkLKDiq88cSo0bQTp-oI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddruddtuddgfeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuf
    fkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhho
    fihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
    hnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffeigffhkefhgfegfeff
    hfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgv
    thhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgv
    tghtrdhorhhg
X-ME-Proxy: <xmx:Hc1kZ8C8W58Gmcj1iZrrX-1wIJfkYKg91UJ-33x0G3hO7o0nQU1SWw>
    <xmx:Hc1kZxii5wJ4oh7uVltnXak_A7mxhh9-PF5QyDkFcLLGFrOaiW8Img>
    <xmx:Hc1kZ4owSBfYlPqqcYxoHxPwWYNk8Q4ZhPyAYs87rvt0AebNKzT8Mw>
    <xmx:Hc1kZ0g4LqOVt9gTm_bVyUUX5WTe62o65ESyjTxiD-dVmVvUoxnQ4Q>
    <xmx:Hc1kZxagJSjYr2XI3i5BF5XCKy9LjVa2ZWjwfrhZKdhyyxp2HFlKgoMk>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 20 Dec 2024 02:48:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
Message-ID: <Z2TNBPXj6DXDaonD@mail-itl>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zbwhSu/fNdCZgdzp"
Content-Disposition: inline
In-Reply-To: <Z2RGfpJkO0z_nKV6@mail-itl>


--zbwhSu/fNdCZgdzp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Dec 2024 02:48:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0

On Thu, Dec 19, 2024 at 05:14:52PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> It crashes on boot like below, most of the times. But sometimes (rarely)
> it manages to stay alive. Below I'm pasting few of the crashes that look
> distinctly different, if you follow the links, you can find more of
> them. IMHO it looks like some memory corruption bug somewhere. I tested
> also Linux 6.13-rc2 before, and it had very similar issue.
>=20
> The traces below are all from nested virt (Xen inside KVM), tests with
> Xen directly on the hardware are still in progress. But -rc2 failed all
> of them too, so if it's the same issue, I guess they will looks similar.

Yes, on real hardware it crashes too.

I tried to enable KASAN, but that didn't worked out:

(XEN) d0 has maximum 416 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN)  Xen  kernel: 64-bit, lsb
(XEN)  Dom0 kernel: 64-bit, lsb, paddr 0x200000 -> 0x7600000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   0000000260000000->0000000268000000 (1005377 pages to =
be allocated)
(XEN)  Init. ramdisk: 000000027d741000->000000027ffff207
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff80200000->ffffffff87600000
(XEN)  Phys-Mach map: 0000008000000000->0000008000800000
(XEN)  Start info:    ffffffff87600000->ffffffff876004b8
(XEN)  Page tables:   ffffffff87601000->ffffffff87640000
(XEN)  Boot stack:    ffffffff87640000->ffffffff87641000
(XEN)  TOTAL:         ffffffff80000000->ffffffff87800000
(XEN)  ENTRY ADDRESS: ffffffff8615da50
(XEN) Dom0 has maximum 2 VCPUs
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 684kB init memory
(XEN) d0v0 Unhandled: vec 14, #PF[0002]
(XEN) Pagetable walk from fffffbfff0900fc6:
(XEN)  L4[0x1f7] =3D 0000000000000000 ffffffffffffffff
(XEN) domain_crash_sync called from entry.S: fault at ffff82d0402ebdec x86_=
64/entry.S#create_bounce_frame+0x14c/0x170
(XEN) Domain 0 (vcpu#0) crashed on cpu#0:
(XEN) ----[ Xen-4.19.0  x86_64  debug=3Dn  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e033:[<ffffffff8614ff32>]
(XEN) RFLAGS: 0000000000000286   EM: 1   CONTEXT: pv guest (d0v0)
(XEN) rax: ffffffff860d8000   rbx: ffffffff87600000   rcx: 00000000c0000101
(XEN) rdx: 3be9e05ee5ed7ef7   rsi: ffffffff87600000   rdi: fffffbfff0900fc6
(XEN) rbp: ffffffff84807f48   rsp: ffffffff84807df0   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000000
(XEN) r12: dffffc0000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 0000000000340660
(XEN) cr3: 0000000267601000   cr2: fffffbfff0900fc6
(XEN) fsb: 0000000000000000   gsb: ffffffff860d8000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
(XEN) Guest stack trace from rsp=3Dffffffff84807df0:
(XEN)    00000000c0000101 0000000000000000 0000000000000002 ffffffff8614ff32
(XEN)    000000010000e030 0000000000010086 ffffffff84807e30 000000000000e02b
(XEN)    0000000041b58ab3 ffffffff845f8030 ffffffff8614fed0 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    ffffffff8615da6f 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
(XEN) Resetting with ACPI MEMORY or I/O RESET_REG.

> Who should I CC here? The failures are all over the place... linux-mm?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zbwhSu/fNdCZgdzp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmdkzQQACgkQ24/THMrX
1ywbwAf+KGtSOL+7T1Z1s20XvozsBxcfgNEB2B/vBMva72uhAKPZV397RerlQcvK
SndSj4PmUrraltBC6qSPLU1juUnY9kgFLtzu12LfXn1Zss4IeiOsVxXYgKTOPbBv
rp2j5BmOaxvq33FoSgUUKMgzTNfH0W1bhg5Ihhd0/DbNiwxCOsc1VzVWVZqaIDgN
5gZTHqxXQ/VNaF1lvV7CN79CR9UX6FvO0a7+SulMpb2a580TE04j8t9cpUfbIU0k
MxOn6hziAlOmM8CJB+aNy8828XB85Dobl8Qpi1IYYXjYGXloAy0fddPEjo7RTSJZ
0/6sX1V2DU6z1vdqEI9NhSPdVHRLYw==
=Rl2t
-----END PGP SIGNATURE-----

--zbwhSu/fNdCZgdzp--

