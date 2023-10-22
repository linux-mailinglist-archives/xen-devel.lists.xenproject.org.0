Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCA07D2352
	for <lists+xen-devel@lfdr.de>; Sun, 22 Oct 2023 16:16:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.620649.966217 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quZE1-0004Nk-6t; Sun, 22 Oct 2023 14:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 620649.966217; Sun, 22 Oct 2023 14:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1quZE1-0004M5-4C; Sun, 22 Oct 2023 14:14:41 +0000
Received: by outflank-mailman (input) for mailman id 620649;
 Sun, 22 Oct 2023 14:14:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XLQu=GE=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1quZDz-0004Lz-UM
 for xen-devel@lists.xenproject.org; Sun, 22 Oct 2023 14:14:40 +0000
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 530abefa-70e5-11ee-9b0e-b553b5be7939;
 Sun, 22 Oct 2023 16:14:35 +0200 (CEST)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailout.nyi.internal (Postfix) with ESMTP id CF8895C03AA
 for <xen-devel@lists.xenproject.org>; Sun, 22 Oct 2023 10:14:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sun, 22 Oct 2023 10:14:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Sun, 22 Oct 2023 10:14:33 -0400 (EDT)
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
X-Inumbo-ID: 530abefa-70e5-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1697984073; x=1698070473; bh=06taFp+Vp84R27lLelcTMDeAJPz5/W+8xYJ
	vQfdEFYg=; b=PwpXjym7xHa4g3mZjYIQepHu4QrygKWiq9M2415qXbVoipVKUSC
	KjqirqB7qkZyXjTk+MfwCap5UK0K/x6tYPNjO/SFTW1daqs8elxouiUTCbf1kidQ
	i4faYPPmqqo26F9vtBfPDD5pW99RjEp6FYcn+s95cULFPgg+VJsTcRS1kehjqFL2
	dHuK0jpbK7MTg4PLRw1hw1Kv6Y8iXTa4jMcG8lrobbnEV9GOI+TZJxL3LqMvFzMa
	ogfv7v8JzQlMprB6ucKHbExIcFGygV9c9+TeBoFFr4K1NvUGGyuwn8Gv06yWQo0s
	SLAUdbA1UcGHVyubMiFg4Snoa3YlXK4T0qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1697984073; x=1698070473; bh=06taFp+Vp84R2
	7lLelcTMDeAJPz5/W+8xYJvQfdEFYg=; b=hBs1Ss7gzzLGm2rEz/u8nXhzBdzQt
	mz1OCDbdGIC2n2yNFR8wRcL4G+ZNEyvUvNI26cFh06WGizQlZmU4G77rwE9IdUwL
	4fKqwYl4nyt771c0yqsuj737iylScWWsN6UjZk4E6tIHxtLKl2Sw0NmDrEdTK+ZL
	iyUwz0u7uO1IxC9Rs/ysokRcZzyaQIwIfxgacYsra8ff1/2wVKb4AKVQFTRu787f
	XwxjxmwkA4hqvgIA7yKU3uKpMg90ttMkL7enaTm6bSX+idTFFxzlr980py6veSMK
	wCH3BTK0nrKjVuKX0al1Nh8VbD7FpCyC+3O8qJSXJG+Pko8Rh+5hUGiUA==
X-ME-Sender: <xms:SS41ZXoVGzM8mbrAuHPXN39Q51wrGZI7EIUN33KP9oDmLUfHKWPSAQ>
    <xme:SS41ZRrdQfhpt988mgz-ssXkV_rV4OtzkdY75zBiOlFhQb_nQovqzoJprjes_Tu3S
    9AAYkTw6Kij4A>
X-ME-Received: <xmr:SS41ZUPYCDj4hkHb10N2KWH4rB7a6s5LlnnA3GMas2O4-2-X8G9zkykIALSx9ShOPWScCxzyKJEs2QGY_IkBv1UbpCldjsm88VQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkeefgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
    dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeejuddtiedvudelieekveevgefgiedvfefgjeefgfetjeet
    feelieelleeikedtvdenucffohhmrghinhepohhpvghnshhushgvrdhorhhgpdhquhgsvg
    hsqdhoshdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptden
    ucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvth
    hhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:SS41Za6yt4qUIQZKo4h5nGhzn3YLFU0pAk-d8S80KhV093rsz8CeNQ>
    <xmx:SS41ZW4sa_N_w4Au-jIph4K9Mi1P7bzB57Av5jatVbZi3fl0HO_rkg>
    <xmx:SS41ZShb28gdg3VWtdr6s8JkeYEoqpkuoF7ZscBqqnqN2HjvFZ8nEQ>
    <xmx:SS41ZYH1xtXAJ8nwDJaPtoc9UYlHoH7Gjg1SRxXruoXgFvS8hv16aQ>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 22 Oct 2023 16:14:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: NULL pointer dereference in xenbus_thread->...
Message-ID: <ZTUuRj6e5x5xFVqb@mail-itl>
References: <ZO0WrR5J0xuwDIxW@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="TdbMmzv9Y12EVP5G"
Content-Disposition: inline
In-Reply-To: <ZO0WrR5J0xuwDIxW@mail-itl>


--TdbMmzv9Y12EVP5G
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 22 Oct 2023 16:14:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: NULL pointer dereference in xenbus_thread->...

On Mon, Aug 28, 2023 at 11:50:36PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> I've noticed in Qubes's CI failure like this:
>=20
> [  871.271292] BUG: kernel NULL pointer dereference, address: 00000000000=
00000
> [  871.275290] #PF: supervisor read access in kernel mode
> [  871.277282] #PF: error_code(0x0000) - not-present page
> [  871.279182] PGD 106fdb067 P4D 106fdb067 PUD 106fdc067 PMD 0=20
> [  871.281071] Oops: 0000 [#1] PREEMPT SMP NOPTI
> [  871.282698] CPU: 1 PID: 28 Comm: xenbus Not tainted 6.1.43-1.qubes.fc3=
7.x86_64 #1
> [  871.285222] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIO=
S rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
> [  871.288883] RIP: e030:__wake_up_common+0x4c/0x180
> [  871.292838] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0f 85 a=
3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 74 5b <=
49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
> [  871.299776] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> [  871.301656] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 000000000=
0000000
> [  871.304255] RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffff88810=
541ce90
> [  871.306714] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: ffffc9004=
00f7e68
> [  871.309937] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: ffffc9004=
00f7e68
> [  871.312326] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [  871.314647] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000) knlG=
S:0000000000000000
> [  871.317677] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  871.319644] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 000000000=
0040660
> [  871.321973] Call Trace:
> [  871.322782]  <TASK>
> [  871.323494]  ? show_trace_log_lvl+0x1d3/0x2ef
> [  871.324901]  ? show_trace_log_lvl+0x1d3/0x2ef
> [  871.326310]  ? show_trace_log_lvl+0x1d3/0x2ef
> [  871.327721]  ? __wake_up_common_lock+0x82/0xd0
> [  871.329147]  ? __die_body.cold+0x8/0xd
> [  871.330378]  ? page_fault_oops+0x163/0x1a0
> [  871.331691]  ? exc_page_fault+0x70/0x170
> [  871.332946]  ? asm_exc_page_fault+0x22/0x30
> [  871.334454]  ? __wake_up_common+0x4c/0x180
> [  871.335777]  __wake_up_common_lock+0x82/0xd0
> [  871.337183]  ? process_writes+0x240/0x240
> [  871.338461]  process_msg+0x18e/0x2f0
> [  871.339627]  xenbus_thread+0x165/0x1c0
> [  871.340830]  ? cpuusage_read+0x10/0x10
> [  871.342032]  kthread+0xe9/0x110
> [  871.343317]  ? kthread_complete_and_exit+0x20/0x20
> [  871.345020]  ret_from_fork+0x22/0x30
> [  871.346239]  </TASK>
> [  871.347060] Modules linked in: snd_hda_codec_generic ledtrig_audio snd=
_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_core s=
nd_hwdep snd_seq snd_seq_device joydev snd_pcm intel_rapl_msr ppdev intel_r=
apl_common snd_timer pcspkr e1000e snd soundcore i2c_piix4 parport_pc parpo=
rt loop fuse xenfs dm_crypt crct10dif_pclmul crc32_pclmul crc32c_intel poly=
val_clmulni polyval_generic floppy ghash_clmulni_intel sha512_ssse3 serio_r=
aw virtio_scsi virtio_console bochs xhci_pci xhci_pci_renesas xhci_hcd qemu=
_fw_cfg drm_vram_helper drm_ttm_helper ttm ata_generic pata_acpi xen_privcm=
d xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_rdac s=
csi_dh_emc scsi_dh_alua uinput dm_multipath
> [  871.368892] CR2: 0000000000000000
> [  871.370160] ---[ end trace 0000000000000000 ]---
> [  871.371719] RIP: e030:__wake_up_common+0x4c/0x180
> [  871.373273] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0f 85 a=
3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 74 5b <=
49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
> [  871.379866] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> [  871.381689] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 000000000=
0000000
> [  871.383971] RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffff88810=
541ce90
> [  871.386235] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: ffffc9004=
00f7e68
> [  871.388521] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: ffffc9004=
00f7e68
> [  871.390789] R13: 0000000000000000 R14: 0000000000000000 R15: 000000000=
0000000
> [  871.393101] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000) knlG=
S:0000000000000000
> [  871.395671] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  871.397863] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 000000000=
0040660
> [  871.400441] Kernel panic - not syncing: Fatal exception
> [  871.402171] Kernel Offset: disabled
> (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
>=20
> It isn't the first time I see similar crash, but I can't really
> reproduce it reliably. Restarted test usually passes.
> Note this is Xen nested in KVM, so it could very well be some oddity
> about nested virt, although looking at the stack trace, it's unlikely
> and more likely some race condition hit only on slower system.

Recently I've got the same crash on a real system in domU too. And also
on nested on newer kernel 6.1.57 (here it happened in dom0). So, this is
still an issue and affects not only nested case :/

> Unfortunately I don't have symbols for this kernel handy, but there is a
> single wake_up() call in process_writes(), so it shouldn't be an issue.
>=20
> Any ideas?
>=20
> Full log at https://openqa.qubes-os.org/tests/80779/logfile?filename=3Dse=
rial0.txt

More links at https://github.com/QubesOS/qubes-issues/issues/8638,
including more recent stack trace.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--TdbMmzv9Y12EVP5G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmU1LkYACgkQ24/THMrX
1yx6/Qf7BB4hqrKbO5flbvi8JG5DkYGgXAJvYa3qBwUty96YgIUCA6u8reYm387F
4v/pgIhW9gJLZ4BgB0Lz5qYqKrWbHoeLIG2tvVEDrXVqi1AQh7Q6CDtHwualmbO1
UdUdSSDNNcUZc6x0C3iY+kKi5i0GdYD6sK7IXHMkgt+VcNBDv55LmLR7C6J+/vDZ
OHwVJhobm9FGmKxAS6im9C4oFSz0DEeO/Aa/GO36hEADLyPdJtLoRO7PsaHsKpiG
mei2BM92KWETiSdL8BEiwmwiXwI1n+v5TMncxbhMpN66HawIWsIGpKP1D04NPwfm
//FwBl+tXCvkvrHdNFcZkTd+qMzH/w==
=EvVK
-----END PGP SIGNATURE-----

--TdbMmzv9Y12EVP5G--

