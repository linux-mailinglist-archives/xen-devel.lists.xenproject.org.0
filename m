Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F919FFEEC
	for <lists+xen-devel@lfdr.de>; Thu,  2 Jan 2025 19:55:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864401.1275608 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQLS-0005tD-Uc; Thu, 02 Jan 2025 18:54:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864401.1275608; Thu, 02 Jan 2025 18:54:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTQLS-0005rY-RX; Thu, 02 Jan 2025 18:54:58 +0000
Received: by outflank-mailman (input) for mailman id 864401;
 Thu, 02 Jan 2025 18:54:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4GO/=T2=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tTQLR-0005rS-O5
 for xen-devel@lists.xenproject.org; Thu, 02 Jan 2025 18:54:57 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0da0035f-c93b-11ef-99a4-01e77a169b0f;
 Thu, 02 Jan 2025 19:54:54 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.phl.internal (Postfix) with ESMTP id 8691613801E6;
 Thu,  2 Jan 2025 13:54:53 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 02 Jan 2025 13:54:53 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 2 Jan 2025 13:54:52 -0500 (EST)
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
X-Inumbo-ID: 0da0035f-c93b-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1735844093;
	 x=1735930493; bh=py7bMEXCkmOwoyNrLMBn3B5MiAvMSOofM6suwigFQBg=; b=
	2bvWa9uS+3AJCZLJQNfVXLvvrFsqllZ7JVLfBePWN9DXmnnB7e+zR5vFh28JD9L5
	tBov6ZIVUQZ08VRdfPrpWvUq5dXbeZ2tYpsekklN5jW8wJP4CfJ7sG00+U3VFETr
	KZq6Widgrir2tBSG0JzfiADCg8Q9gVlUldlJaFITBwQ8oVKA1tfUpzR1u65Omn74
	7zgGuKiLX549VxKXGyxjauYZeey8OICLaom1T+jHsW5l+Ycs5kR5svfmZVJhCszX
	E+r4nBGQ6zVnx9nbW2+5vtXa/3eKyUmkNk4ov/+Schjzqplz6DuCtTDYqgOT8EF2
	CtSBte/TKkZ30wTBzoc/6A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1735844093; x=1735930493; bh=py7bMEXCkmOwoyNrLMBn3B5MiAvMSOofM6s
	uwigFQBg=; b=bcJrh/yC13PAMJeaW2pTGQS/iiYsRjKCb78EqucA/QDZE8Mfrn8
	i4gQK5tcsm38ovib3xtU2p4A7dL7uMltT5BVwKHxLmNA5xyDec6OlauWBk/KYUDz
	BiiWN0J9CilOPMg8FGSUrDvO4wc97F5Fq41+oGkrMb2fafZDOL8NVGPQ3IovUGUD
	ZhQTSWlnBmG7s04sbi24i9v85KzcYtQHpBqbgGsZdOs/g08xNm+1Rohr3PlPTEVn
	o8VlsPyvzzAYpX1twMWrzhJYdaefxvzYn99nNzALihe2EEgrRI9ZQzgKUmHoAqu7
	SBVqdA4Qt0SZheo56mKDZRvKEvtpWJzUvrw==
X-ME-Sender: <xms:_eB2Z97DLM8MgxjhcQWMBaJoHAK5bMeopH-iICtoelv6XgL9OgDR8g>
    <xme:_eB2Z671psqlXZi_Ow-dHNL93VtfFn0DLrugDbTOKc__FYm66c_B8QnTg2c06cjHK
    5nv9Wcz-EGJIQ>
X-ME-Received: <xmr:_eB2Z0dHmaGH-W7wyxyWr4DZGb9oYySBGup9AAKdRu5-nHzHIkuaamswn97jZDQOUrXq91yeLTksjUnXKxnsguOLGdbDH2tHUw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefvddguddulecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeejjefgkedugeehiedvieffvdffgeetkedthfduleejieekhfetfe
    ekfefggfeigeenucffohhmrghinhepqhhusggvshdqohhsrdhorhhgpdhgihhthhhusgdr
    tghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggp
    rhgtphhtthhopedvpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjghhrohhssh
    esshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:_eB2Z2KPpBDpEeHpOS_2nWOaKu85X1x6dmSqhEoo2AuO8uCz7nhpIQ>
    <xmx:_eB2ZxLdflU3k2HSopZEg7G3x-zI7hYnh_DTCCnXp2JY1b7doRVnAg>
    <xmx:_eB2Z_zoIEsx0CHhrJM1TAG_Fz5YPu6HE9eRkdRBdxwit7seUfuG8A>
    <xmx:_eB2Z9IsQ1FPffIBTtYkFNOZkayzJvyPfKI6aIGsW8ifJqINwpirWA>
    <xmx:_eB2Z4W6Da_e-zETSAcRPv7KXchLROHbhsuKBbyovUNjfHibDLHYORLL>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 2 Jan 2025 19:54:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0
Message-ID: <Z3bg-gvaBEdSIuRW@mail-itl>
References: <Z2RGfpJkO0z_nKV6@mail-itl>
 <ab9c27d5-f3f2-4b8a-960d-f880ec136199@suse.com>
 <6bb03333-74ca-4c2c-85a8-72549b85a5b4@suse.com>
 <Z3aFdrygLF9yK2EK@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="fRL8aTYga7dpRTxH"
Content-Disposition: inline
In-Reply-To: <Z3aFdrygLF9yK2EK@mail-itl>


--fRL8aTYga7dpRTxH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 2 Jan 2025 19:54:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Linux 6.13-rc3 many different panics in Xen PV dom0

On Thu, Jan 02, 2025 at 01:24:21PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Jan 02, 2025 at 12:30:10PM +0100, Juergen Gross wrote:
> > On 02.01.25 11:20, J=C3=BCrgen Gro=C3=9F wrote:
> > > On 19.12.24 17:14, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >=20
> > > > It crashes on boot like below, most of the times. But sometimes (ra=
rely)
> > > > it manages to stay alive. Below I'm pasting few of the crashes that=
 look
> > > > distinctly different, if you follow the links, you can find more of
> > > > them. IMHO it looks like some memory corruption bug somewhere. I te=
sted
> > > > also Linux 6.13-rc2 before, and it had very similar issue.
> > >=20
> > > ...
> > >=20
> > > >=20
> > > > Full log:
> > > > https://openqa.qubes-os.org/tests/122879/logfile?filename=3Dserial0=
=2Etxt
> > >=20
> > > I can reproduce a crash with 6.13-rc5 PV dom0.
> > >=20
> > > What is really interesting in the logs: most crashes seem to happen r=
ight
> > > after a module being loaded (in my reproducer it was right after load=
ing
> > > the first module).
> > >=20
> > > I need to go through the 6.13 commits, but I think I remember having =
seen
> > > a patch optimizing module loading by using large pages for addressing=
 the
> > > loaded modules. Maybe the case of no large pages being available isn't
> > > handled properly.
> >=20
> > Seems I was right.
> >=20
> > For me the following diff fixes the issue. Marek, can you please confirm
> > it fixes your crashes, too?
>=20
> Thanks for looking into it!
> Will do, I've pushed it to
> https://github.com/QubesOS/qubes-linux-kernel/pull/662, CI will build it
> and then I'll post it to openQA.

It is much better!

Tests are still running, but I already see that many are green. There is
one issue (likely unrelated to this change) - sys-usb (HVM domU with USB
controllers passed through) crashes on a system with Raptor Lake CPU
(only, others, including ADL and MTL look fine):

[   75.770849] Bluetooth: Core ver 2.22
[   75.770866] Oops: general protection fault, probably for non-canonical a=
ddress 0xc9d2315bc82c3bbd: 0000 [#1] PREEMPT SMP NOPTI
[   75.770880] CPU: 0 UID: 0 PID: 923 Comm: (udev-worker) Not tainted 6.13.=
0-0.rc5.2.qubes.1.fc41.x86_64 #1
[   75.770890] Hardware name: Xen HVM domU, BIOS 4.19.0 01/02/2025
[   75.770897] RIP: 0010:msft_monitor_device_del+0x93/0x170 [bluetooth]
[   75.770924] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0 65 21 <26=
> 2b 8b ad 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   75.770943] RSP: 0000:ffffad644108fa40 EFLAGS: 00010246
[   75.770950] RAX: ffff93da8a149600 RBX: c9d2315bc82c3810 RCX: 00000001000=
00000
[   75.770958] RDX: 0000000000000001 RSI: ffff93da905e9180 RDI: ffff93da814=
04598
[   75.770967] RBP: ffffad644108fa58 R08: 0000000000000064 R09: 00000000000=
012ab
[   75.770975] R10: ffff93da81207000 R11: 0000000000000286 R12: ffffad64410=
8fb00
[   75.770983] R13: ffffad644108fa68 R14: ffff93da9089b840 R15: ffff93da8c2=
65100
[   75.770991] FS:  000078fa4cec4bc0(0000) GS:ffff93da97000000(0000) knlGS:=
0000000000000000
[   75.771000] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   75.771007] CR2: 000074fa64aadc08 CR3: 00000000105d2006 CR4: 00000000007=
70ef0
[   75.771016] PKRU: 55555554
[   75.771019] Call Trace:
[   75.771024]  <TASK>
[   75.771028]  ? show_trace_log_lvl+0x1b0/0x2f0
[   75.771036]  ? show_trace_log_lvl+0x1b0/0x2f0
[   75.771042]  ? do_one_initcall+0x58/0x310
[   75.771048]  ? __die_body.cold+0x8/0x12
[   75.771053]  ? die_addr+0x3c/0x60
[   75.771059]  ? exc_general_protection+0x17d/0x400
[   75.771066]  ? asm_exc_general_protection+0x26/0x30
[   75.771074]  ? msft_monitor_device_del+0x93/0x170 [bluetooth]
[   75.771095]  ? bt_init+0x54/0x1d0 [bluetooth]
[   75.771114]  ? __pfx_bt_init+0x10/0x10 [bluetooth]
[   75.771131]  ? do_one_initcall+0x58/0x310
[   75.771137]  ? do_init_module+0x90/0x250
[   75.771142]  ? init_module_from_file+0x86/0xc0
[   75.771149]  ? idempotent_init_module+0x115/0x310
[   75.771156]  ? __x64_sys_finit_module+0x65/0xc0
[   75.771163]  ? do_syscall_64+0x82/0x160
[   75.771168]  ? backing_file_read_iter+0x156/0x1f0
[   75.771176]  ? ovl_read_iter+0x94/0xa0 [overlay]
[   75.771189]  ? __pfx_ovl_file_accessed+0x10/0x10 [overlay]
[   75.771199]  ? rseq_get_rseq_cs+0x1d/0x220
[   75.771205]  ? rseq_ip_fixup+0x8d/0x1d0
[   75.771210]  ? __seccomp_filter+0x303/0x520
[   75.771216]  ? syscall_exit_to_user_mode_prepare+0x15e/0x1a0
[   75.771224]  ? syscall_exit_to_user_mode+0x10/0x210
[   75.771231]  ? do_syscall_64+0x8e/0x160
[   75.771236]  ? do_sys_openat2+0x9c/0xe0
[   75.771241]  ? syscall_exit_to_user_mode_prepare+0x15e/0x1a0
[   75.771249]  ? syscall_exit_to_user_mode+0x10/0x210
[   75.771255]  ? do_syscall_64+0x8e/0x160
[   75.771260]  ? do_user_addr_fault+0x1ec/0x7b0
[   75.771267]  ? entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   75.771274]  </TASK>
[   75.771277] Modules linked in: bluetooth(+) rfkill snd_seq_dummy snd_hrt=
imer snd_seq snd_seq_device snd_timer snd soundcore nft_reject_ipv6 nf_reje=
ct_ipv6 nft_reject_ipv4 nf_reject_ipv4 nft_reject intel_rapl_msr intel_rapl=
_common nft_ct intel_uncore_frequency_common intel_pmc_core intel_vsec joyd=
ev nft_masq pmt_telemetry pmt_class nft_chain_nat nf_nat nf_conntrack nf_de=
frag_ipv6 nf_defrag_ipv4 crct10dif_pclmul crc32_pclmul crc32c_intel polyval=
_clmulni xhci_pci polyval_generic ghash_clmulni_intel xhci_hcd sha512_ssse3=
 sha256_ssse3 nf_tables sha1_ssse3 ehci_pci mei_me ehci_hcd pcspkr mei ata_=
generic pata_acpi i2c_piix4 i2c_smbus serio_raw xen_scsiback target_core_mo=
d xen_netback xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn lo=
op fuse nfnetlink overlay xen_blkfront
[   75.771370] ---[ end trace 0000000000000000 ]---
[   75.771376] RIP: 0010:msft_monitor_device_del+0x93/0x170 [bluetooth]
[   75.771397] Code: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 d0 65 21 <26=
> 2b 8b ad 03 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   75.771416] RSP: 0000:ffffad644108fa40 EFLAGS: 00010246
[   75.771422] RAX: ffff93da8a149600 RBX: c9d2315bc82c3810 RCX: 00000001000=
00000
[   75.771431] RDX: 0000000000000001 RSI: ffff93da905e9180 RDI: ffff93da814=
04598
[   75.771439] RBP: ffffad644108fa58 R08: 0000000000000064 R09: 00000000000=
012ab
[   75.771446] R10: ffff93da81207000 R11: 0000000000000286 R12: ffffad64410=
8fb00
[   75.771454] R13: ffffad644108fa68 R14: ffff93da9089b840 R15: ffff93da8c2=
65100
[   75.771463] FS:  000078fa4cec4bc0(0000) GS:ffff93da97000000(0000) knlGS:=
0000000000000000
[   75.771471] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   75.771477] CR2: 000074fa64aadc08 CR3: 00000000105d2006 CR4: 00000000007=
70ef0
[   75.771485] PKRU: 55555554
[   75.771488] Kernel panic - not syncing: Fatal exception
[   75.771519] Kernel Offset: 0x3b800000 from 0xffffffff80200000 (relocatio=
n range: 0xffffffff80000000-0xffffffffbfffffff)

Full log inside
https://openqa.qubes-os.org/tests/124736/file/usbvm-var_log.tar.gz
(log/xen/console/guest-sys-usb.log)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--fRL8aTYga7dpRTxH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd24PoACgkQ24/THMrX
1ywTjAf/aSTmAu0wt8aelLNPGqdFCFbUTw1bM8CNyuob4Ui1b4ntin9ClHjj+mXX
EPa+J2ub7hqw8l5QjPDEIgsW2TDNR0bGahlzr+FBqEngx1/Nopudj2tCvzPu1tkU
4w/wL4EOFTbTRSzOy0Gi1Jx54xRk4JM6/xAtDmjPDHGs1SRozQJfwIAfO8KO5lCi
KT1eRfYvUNiPoiKhR7ARKWglfSr/o4518VimKumbpIvGDZl9eSb059gMKoTTqfZd
0+jZXsgMUsbcj4lqejQpL/c4k8vEy1cUXh8dFkQwk07CN7kpE7magJj9iwrUsixZ
Jh0w2Pc7EBaN/LFEme5BarkhqQBuxw==
=3yxV
-----END PGP SIGNATURE-----

--fRL8aTYga7dpRTxH--

