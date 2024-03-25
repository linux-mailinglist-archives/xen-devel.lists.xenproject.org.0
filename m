Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C5C88A8BC
	for <lists+xen-devel@lfdr.de>; Mon, 25 Mar 2024 17:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.697815.1088957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ron0c-0007qX-Kb; Mon, 25 Mar 2024 16:17:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 697815.1088957; Mon, 25 Mar 2024 16:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ron0c-0007oL-HU; Mon, 25 Mar 2024 16:17:14 +0000
Received: by outflank-mailman (input) for mailman id 697815;
 Mon, 25 Mar 2024 16:17:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZfXo=K7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ron0a-0007nx-AF
 for xen-devel@lists.xenproject.org; Mon, 25 Mar 2024 16:17:12 +0000
Received: from wfhigh5-smtp.messagingengine.com
 (wfhigh5-smtp.messagingengine.com [64.147.123.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2064b01c-eac3-11ee-a1ef-f123f15fe8a2;
 Mon, 25 Mar 2024 17:17:09 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfhigh.west.internal (Postfix) with ESMTP id 49B7F18000E4
 for <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 12:17:06 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 25 Mar 2024 12:17:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 25 Mar 2024 12:17:05 -0400 (EDT)
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
X-Inumbo-ID: 2064b01c-eac3-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1711383425;
	 x=1711469825; bh=+4KN1/QbA1tmpIA3PCvp2PBb4ilCi4RWpfddFhSMt/0=; b=
	a2VQWWYMFp+O5a41kT4u8rP3bW6PAH/XpFp6Kiz8pUh2ptbRUIPh7yRvRGEi3RdI
	4A5tElZ0b2T7/gOxoEwZrbAJCnjWlf06naT7zUV/XYlM46sLqsm6fM4kp+eKOPXK
	g9HKAUdlp1D6yJrf0jF+oYCiNu3FThYXvsAqi3fDgHlLDDVd/ehmmnrTB1mScvrr
	mRNkInBz0qfJHEBTeex4YogKWu0LAwU84XcKfIym9Q4zflaTGuGLdud3ryAX9r7m
	pnQOaJWzHHjHcAL/B4jYuNv/d2SOGRSNPZ4shCldS7tBHI0Oc4KGk+9zxsrE/24P
	TZ+PNVIHBY7UxIF506DdXw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711383425; x=1711469825; bh=+4KN1/QbA1tmpIA3PCvp2PBb4ilC
	i4RWpfddFhSMt/0=; b=pmmCXAJmNl5qHs0Z5LsP1X8sUV+XYecX843Bnt280REc
	ez+c9pfY5JMUzjyjPVMobIs3EEWFM7mhXxPKcGQP7okwfRspW1OE37mK4nGuYaFg
	8sbcWG091WNCvWLG2To7K+UkZoy6wCXv8HaCBO+kPbMci0h3VDn85GkVUY/hTRuZ
	MgOhvTZKB7byoUG/aurwxvcxg4YdaHTjX2RYCgct6nk4xlx1g38CRTpgLW0wxpPI
	Oxm4JhntbLngHKxFErhxaPCDkaUCPOmEIq+gj3zpWCGJOt7CtJf6AefA2Co86dqN
	P2RUV4kB1UYfheBcGb6SptjEcPJk7j1/xVVRy5xjtg==
X-ME-Sender: <xms:gaMBZksLQq7EozWVesQOhGEgIWP0PIjGBhcS3nWTWZL3A_FvWfBldQ>
    <xme:gaMBZhdNXkP-jFZ5ntXETj0B4_IUWoqTpOHOVTFJVuu4EQ47Rdg-7V1lkfCvzC5AX
    UYVASPrYhhNLA>
X-ME-Received: <xmr:gaMBZvzU_WLsd_fber81IUDu0cthtf4xkW9PYL2Qp9Y9tHsyNtb5tWEB4JY44T9TA7Ft6qcw2NijkUdaQH5MC4lHjsvnNflkpQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduuddgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
    ertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepjedutdeivdduleeikeevveeggfeivdefgfejfefgteej
    teefleeileelieektddvnecuffhomhgrihhnpehophgvnhhsuhhsvgdrohhrghdpqhhusg
    gvshdqohhsrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedt
    necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
    hthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:gaMBZnODoVjx52qrSQnqeJSDe7-XNk1aeCakWPBGd_yNn4Q2RDyY_w>
    <xmx:gaMBZk8OJv0jqaNNYuqwHE7yksioO3aImGUf4lmzP1RYrcT7pDgSVA>
    <xmx:gaMBZvWtyS10SYBZX0qd_IEYjd5H--lp52-dVy6sWZWV4IW982iHNw>
    <xmx:gaMBZtfAove1MBpSlpG_DuBO1txdeiWOvsZe-UT4pJMZSDmnz1SA7A>
    <xmx:gaMBZilqbEUTJzQ3F6CTAyPQIExc2C-d4fpN7Y0xvqY7sWvTtN0DJW2oQH8>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 25 Mar 2024 17:17:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: NULL pointer dereference in xenbus_thread->...
Message-ID: <ZgGjf3hpLHXXtb8z@mail-itl>
References: <ZO0WrR5J0xuwDIxW@mail-itl>
 <ZTUuRj6e5x5xFVqb@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QFJG0LqIoqPJKlrM"
Content-Disposition: inline
In-Reply-To: <ZTUuRj6e5x5xFVqb@mail-itl>


--QFJG0LqIoqPJKlrM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 Mar 2024 17:17:02 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: NULL pointer dereference in xenbus_thread->...

On Sun, Oct 22, 2023 at 04:14:30PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Aug 28, 2023 at 11:50:36PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Hi,
> >=20
> > I've noticed in Qubes's CI failure like this:
> >=20
> > [  871.271292] BUG: kernel NULL pointer dereference, address: 000000000=
0000000
> > [  871.275290] #PF: supervisor read access in kernel mode
> > [  871.277282] #PF: error_code(0x0000) - not-present page
> > [  871.279182] PGD 106fdb067 P4D 106fdb067 PUD 106fdc067 PMD 0=20
> > [  871.281071] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > [  871.282698] CPU: 1 PID: 28 Comm: xenbus Not tainted 6.1.43-1.qubes.f=
c37.x86_64 #1
> > [  871.285222] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), B=
IOS rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
> > [  871.288883] RIP: e030:__wake_up_common+0x4c/0x180
> > [  871.292838] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0f 85=
 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 74 5b=
 <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
> > [  871.299776] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > [  871.301656] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 0000000=
000000000
> > [  871.304255] RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffff888=
10541ce90
> > [  871.306714] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: ffffc90=
0400f7e68
> > [  871.309937] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: ffffc90=
0400f7e68
> > [  871.312326] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000=
000000000
> > [  871.314647] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000) kn=
lGS:0000000000000000
> > [  871.317677] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  871.319644] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 0000000=
000040660
> > [  871.321973] Call Trace:
> > [  871.322782]  <TASK>
> > [  871.323494]  ? show_trace_log_lvl+0x1d3/0x2ef
> > [  871.324901]  ? show_trace_log_lvl+0x1d3/0x2ef
> > [  871.326310]  ? show_trace_log_lvl+0x1d3/0x2ef
> > [  871.327721]  ? __wake_up_common_lock+0x82/0xd0
> > [  871.329147]  ? __die_body.cold+0x8/0xd
> > [  871.330378]  ? page_fault_oops+0x163/0x1a0
> > [  871.331691]  ? exc_page_fault+0x70/0x170
> > [  871.332946]  ? asm_exc_page_fault+0x22/0x30
> > [  871.334454]  ? __wake_up_common+0x4c/0x180
> > [  871.335777]  __wake_up_common_lock+0x82/0xd0
> > [  871.337183]  ? process_writes+0x240/0x240
> > [  871.338461]  process_msg+0x18e/0x2f0
> > [  871.339627]  xenbus_thread+0x165/0x1c0
> > [  871.340830]  ? cpuusage_read+0x10/0x10
> > [  871.342032]  kthread+0xe9/0x110
> > [  871.343317]  ? kthread_complete_and_exit+0x20/0x20
> > [  871.345020]  ret_from_fork+0x22/0x30
> > [  871.346239]  </TASK>
> > [  871.347060] Modules linked in: snd_hda_codec_generic ledtrig_audio s=
nd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core=
 snd_hwdep snd_seq snd_seq_device joydev snd_pcm intel_rapl_msr ppdev intel=
_rapl_common snd_timer pcspkr e1000e snd soundcore i2c_piix4 parport_pc par=
port loop fuse xenfs dm_crypt crct10dif_pclmul crc32_pclmul crc32c_intel po=
lyval_clmulni polyval_generic floppy ghash_clmulni_intel sha512_ssse3 serio=
_raw virtio_scsi virtio_console bochs xhci_pci xhci_pci_renesas xhci_hcd qe=
mu_fw_cfg drm_vram_helper drm_ttm_helper ttm ata_generic pata_acpi xen_priv=
cmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac=
 scsi_dh_emc scsi_dh_alua uinput dm_multipath
> > [  871.368892] CR2: 0000000000000000
> > [  871.370160] ---[ end trace 0000000000000000 ]---
> > [  871.371719] RIP: e030:__wake_up_common+0x4c/0x180
> > [  871.373273] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0f 85=
 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 74 5b=
 <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
> > [  871.379866] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > [  871.381689] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 0000000=
000000000
> > [  871.383971] RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffff888=
10541ce90
> > [  871.386235] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: ffffc90=
0400f7e68
> > [  871.388521] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: ffffc90=
0400f7e68
> > [  871.390789] R13: 0000000000000000 R14: 0000000000000000 R15: 0000000=
000000000
> > [  871.393101] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000) kn=
lGS:0000000000000000
> > [  871.395671] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [  871.397863] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 0000000=
000040660
> > [  871.400441] Kernel panic - not syncing: Fatal exception
> > [  871.402171] Kernel Offset: disabled
> > (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
> >=20
> > It isn't the first time I see similar crash, but I can't really
> > reproduce it reliably. Restarted test usually passes.
> > Note this is Xen nested in KVM, so it could very well be some oddity
> > about nested virt, although looking at the stack trace, it's unlikely
> > and more likely some race condition hit only on slower system.
>=20
> Recently I've got the same crash on a real system in domU too. And also
> on nested on newer kernel 6.1.57 (here it happened in dom0). So, this is
> still an issue and affects not only nested case :/
>=20
> > Unfortunately I don't have symbols for this kernel handy, but there is a
> > single wake_up() call in process_writes(), so it shouldn't be an issue.
> >=20
> > Any ideas?
> >=20
> > Full log at https://openqa.qubes-os.org/tests/80779/logfile?filename=3D=
serial0.txt
>=20
> More links at https://github.com/QubesOS/qubes-issues/issues/8638,
> including more recent stack trace.

Happens on 6.1.75 too (new stack trace I've added to the issue above,
but it's pretty similar).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--QFJG0LqIoqPJKlrM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYBo38ACgkQ24/THMrX
1ywnegf9GG8xk/ikGtyJTvfUknyYM41+prC5YEE1XkvzkDqICPweKbVgOcKQc7+j
iBIb63p7vD2aKZJLaRpsczhfQnC43VEUi4uSGbYpsZhO8HRq2dEosO/qNgtFxRPg
RyXTvdfRmbK502GaeD6rSKWWd/bodgTIv1kLWqOWFvFQD5uq1tStNWG+TBWWtvvB
IBbXmBSxX+OhpKaICxe2WoZwS8GGFLQa2RxZc6mhILBz3yj1e65ZxTSkPbCmqMSL
lsZeIFQAxiKINLkOg+BTS5RVxwPR9XGXa5ryXBhYFfKZbTxTeZN4F7RHDpTvS+K1
sQte0oE3QDX090KaHtTLGJv0QlrIQQ==
=op5g
-----END PGP SIGNATURE-----

--QFJG0LqIoqPJKlrM--

