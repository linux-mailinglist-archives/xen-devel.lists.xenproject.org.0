Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF06A989FF
	for <lists+xen-devel@lfdr.de>; Wed, 23 Apr 2025 14:42:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.964584.1355337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZQY-0001X6-7w; Wed, 23 Apr 2025 12:42:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 964584.1355337; Wed, 23 Apr 2025 12:42:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7ZQY-0001Ui-5H; Wed, 23 Apr 2025 12:42:10 +0000
Received: by outflank-mailman (input) for mailman id 964584;
 Wed, 23 Apr 2025 12:42:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mwje=XJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u7ZQW-0001Ub-Ou
 for xen-devel@lists.xenproject.org; Wed, 23 Apr 2025 12:42:09 +0000
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c578fac-2040-11f0-9eb0-5ba50f476ded;
 Wed, 23 Apr 2025 14:42:05 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 479F825401BE;
 Wed, 23 Apr 2025 08:42:04 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Wed, 23 Apr 2025 08:42:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Apr 2025 08:42:02 -0400 (EDT)
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
X-Inumbo-ID: 5c578fac-2040-11f0-9eb0-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745412124;
	 x=1745498524; bh=+FhDc80nqA9Z+6EjdE9I6no7eFp09OfAK/45bAiFApA=; b=
	eacT8XikwDqH9TOz9N6Y6orWwYjzuk510/HOBx1jqj5rlSUb2CmJnoYUlmDtQ3ev
	nYVdhGao4md0PzNFyTcoiXIrAI1aGfKE12YDK9Yk3s8wkB7AqekG0NW+MU7drPcs
	C4VOj/60C+4ycAZxs0Q13FCHxi5x6e+Vl4ijr0PoYR30+CG2zG1lW+OJFwiV3tS9
	QACqsvIdDNyU4B79i4peU5rXM/mtprcEKjfD+c2UTETlnszTWU6Lzajk5edj7RVD
	zAh2GDQEB3ieG9nGEssBFC8bGkFEb7u2sRIBpY2JaXY47R9xNggAZuyH7QSaimsc
	9OaLy6YND1AsTqgmwawNDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1745412124; x=1745498524; bh=+FhDc80nqA9Z+6EjdE9I6no7eFp09OfAK/4
	5bAiFApA=; b=tEtReem+EZvdoDvG5WX4rGVMg/qWVA4jtTpnqUEsIUX1joJg+tx
	aqDneA0w49cD+2xAlNHsJNmSeQr1bAOUdE2EHHvAjexMkzCSo1zT78NZmm/4H8j7
	zRdlc3tZlaZM6T6Z052toywwEocNaW+P39rz4yQA6vqE9Wqho/U2a4EJZ+a3s58U
	paYJ/Pii7xnk5RDz8NQoL65aGf0TUPtquHUOPs+nOBBBSRI7+DUsI6zBdwk2iOCQ
	E1a8P390+ScOrw58FsfG5oo7nOxgywaLlWuUNo1NRAZi/GQ0hNNFZ1qkjiDaonJl
	5nV5lpEVUlqJHBwxUsxu8MK/3R9uilbiM2g==
X-ME-Sender: <xms:G-AIaN2xmV9oTAO_aHF4XZS5rd_QlPBWxY3YUbeu6eYqGxoxNVLC1g>
    <xme:G-AIaEFl76-Q64X2qkUX3hNkmF5KPC5vlhuTvCB4lkoKEEOH1CQLDdEhhevCSkP_7
    kcVXVThvetLHA>
X-ME-Received: <xmr:G-AIaN7aMqux7qeJVURw2hTGa05TNnwEJXI_3QnZ1ONHanXACA7tYTEp32q_FxvT6-stBPjhB2cGArPuhJpjyd98SMBIEfbVyg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeeiiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhepfeeuveeuvedvleelgedtfedtffeliedtjedthedvlefhleegfe
    ekueejvdetueehnecuffhomhgrihhnpehophgvnhhsuhhsvgdrohhrghdpqhhusggvshdq
    ohhsrdhorhhgpdhgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhi
    nhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuth
    dprhgtphhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopeigvghnqdgu
    vghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehjgh
    hrohhsshesshhushgvrdgtohhm
X-ME-Proxy: <xmx:G-AIaK0Q1iJtTu4ppxpA_4t4mmothB8ePoXK5xxbR5lUD-R_50GYRA>
    <xmx:G-AIaAFM4Mm8x1hmPs5OcTZN2y-kNTRYtUIUd5WQadBX2I0cHXxzGA>
    <xmx:G-AIaL_em-jB7x9Y2uaRHedUuOA-jl6r26zZdIGWDEZOxVPbEwrV4Q>
    <xmx:G-AIaNkCL4EwrWMbcu9XbnjAhermoe31ljqUgd0Tgq2_Hbuukk_T1w>
    <xmx:HOAIaAFTplFEvsPG-QPKcEz7t4sVVuWGZdYuYgwySsOVRH9znwekLFsa>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 23 Apr 2025 14:41:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...
Message-ID: <aAjgGKRAW95BnTiK@mail-itl>
References: <ZO0WrR5J0xuwDIxW@mail-itl>
 <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl>
 <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
 <ZlpTwbmDjNLkCNgH@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uA3h3C1LK1Wh2sS5"
Content-Disposition: inline
In-Reply-To: <ZlpTwbmDjNLkCNgH@mail-itl>


--uA3h3C1LK1Wh2sS5
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Apr 2025 14:41:59 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...

On Sat, Jun 01, 2024 at 12:48:33AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Mar 26, 2024 at 11:00:50AM +0000, Julien Grall wrote:
> > Hi Marek,
> >=20
> > +Juergen for visibility
> >=20
> > When sending a bug report, I would suggest to CC relevant people as
> > otherwise it can get lost (not may people monitors Xen devel if they ar=
e not
> > CCed).
> >=20
> > Cheers,
> >=20
> > On 25/03/2024 16:17, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Sun, Oct 22, 2023 at 04:14:30PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Mon, Aug 28, 2023 at 11:50:36PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > Hi,
> > > > >=20
> > > > > I've noticed in Qubes's CI failure like this:
> > > > >=20
> > > > > [  871.271292] BUG: kernel NULL pointer dereference, address: 000=
0000000000000
> > > > > [  871.275290] #PF: supervisor read access in kernel mode
> > > > > [  871.277282] #PF: error_code(0x0000) - not-present page
> > > > > [  871.279182] PGD 106fdb067 P4D 106fdb067 PUD 106fdc067 PMD 0
> > > > > [  871.281071] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > > > [  871.282698] CPU: 1 PID: 28 Comm: xenbus Not tainted 6.1.43-1.q=
ubes.fc37.x86_64 #1
> > > > > [  871.285222] Hardware name: QEMU Standard PC (i440FX + PIIX, 19=
96), BIOS rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
> > > > > [  871.288883] RIP: e030:__wake_up_common+0x4c/0x180
> > > > > [  871.292838] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04=
 0f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3=
 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
> > > > > [  871.299776] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > > > > [  871.301656] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 0=
000000000000000
> > > > > [  871.304255] RDX: 0000000000000001 RSI: 0000000000000003 RDI: f=
fff88810541ce90
> > > > > [  871.306714] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: f=
fffc900400f7e68
> > > > > [  871.309937] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: f=
fffc900400f7e68
> > > > > [  871.312326] R13: 0000000000000000 R14: 0000000000000000 R15: 0=
000000000000000
> > > > > [  871.314647] FS:  0000000000000000(0000) GS:ffff88813ff00000(00=
00) knlGS:0000000000000000
> > > > > [  871.317677] CS:  10000e030 DS: 0000 ES: 0000 CR0: 000000008005=
0033
> > > > > [  871.319644] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 0=
000000000040660
> > > > > [  871.321973] Call Trace:
> > > > > [  871.322782]  <TASK>
> > > > > [  871.323494]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > > [  871.324901]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > > [  871.326310]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > > [  871.327721]  ? __wake_up_common_lock+0x82/0xd0
> > > > > [  871.329147]  ? __die_body.cold+0x8/0xd
> > > > > [  871.330378]  ? page_fault_oops+0x163/0x1a0
> > > > > [  871.331691]  ? exc_page_fault+0x70/0x170
> > > > > [  871.332946]  ? asm_exc_page_fault+0x22/0x30
> > > > > [  871.334454]  ? __wake_up_common+0x4c/0x180
> > > > > [  871.335777]  __wake_up_common_lock+0x82/0xd0
> > > > > [  871.337183]  ? process_writes+0x240/0x240
> > > > > [  871.338461]  process_msg+0x18e/0x2f0
> > > > > [  871.339627]  xenbus_thread+0x165/0x1c0
> > > > > [  871.340830]  ? cpuusage_read+0x10/0x10
> > > > > [  871.342032]  kthread+0xe9/0x110
> > > > > [  871.343317]  ? kthread_complete_and_exit+0x20/0x20
> > > > > [  871.345020]  ret_from_fork+0x22/0x30
> > > > > [  871.346239]  </TASK>
> > > > > [  871.347060] Modules linked in: snd_hda_codec_generic ledtrig_a=
udio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hd=
a_core snd_hwdep snd_seq snd_seq_device joydev snd_pcm intel_rapl_msr ppdev=
 intel_rapl_common snd_timer pcspkr e1000e snd soundcore i2c_piix4 parport_=
pc parport loop fuse xenfs dm_crypt crct10dif_pclmul crc32_pclmul crc32c_in=
tel polyval_clmulni polyval_generic floppy ghash_clmulni_intel sha512_ssse3=
 serio_raw virtio_scsi virtio_console bochs xhci_pci xhci_pci_renesas xhci_=
hcd qemu_fw_cfg drm_vram_helper drm_ttm_helper ttm ata_generic pata_acpi xe=
n_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_d=
h_rdac scsi_dh_emc scsi_dh_alua uinput dm_multipath
> > > > > [  871.368892] CR2: 0000000000000000
> > > > > [  871.370160] ---[ end trace 0000000000000000 ]---
> > > > > [  871.371719] RIP: e030:__wake_up_common+0x4c/0x180
> > > > > [  871.373273] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04=
 0f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3=
 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
> > > > > [  871.379866] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > > > > [  871.381689] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 0=
000000000000000
> > > > > [  871.383971] RDX: 0000000000000001 RSI: 0000000000000003 RDI: f=
fff88810541ce90
> > > > > [  871.386235] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: f=
fffc900400f7e68
> > > > > [  871.388521] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: f=
fffc900400f7e68
> > > > > [  871.390789] R13: 0000000000000000 R14: 0000000000000000 R15: 0=
000000000000000
> > > > > [  871.393101] FS:  0000000000000000(0000) GS:ffff88813ff00000(00=
00) knlGS:0000000000000000
> > > > > [  871.395671] CS:  10000e030 DS: 0000 ES: 0000 CR0: 000000008005=
0033
> > > > > [  871.397863] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 0=
000000000040660
> > > > > [  871.400441] Kernel panic - not syncing: Fatal exception
> > > > > [  871.402171] Kernel Offset: disabled
> > > > > (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
> > > > >=20
> > > > > It isn't the first time I see similar crash, but I can't really
> > > > > reproduce it reliably. Restarted test usually passes.
> > > > > Note this is Xen nested in KVM, so it could very well be some odd=
ity
> > > > > about nested virt, although looking at the stack trace, it's unli=
kely
> > > > > and more likely some race condition hit only on slower system.
> > > >=20
> > > > Recently I've got the same crash on a real system in domU too. And =
also
> > > > on nested on newer kernel 6.1.57 (here it happened in dom0). So, th=
is is
> > > > still an issue and affects not only nested case :/
> > > >=20
> > > > > Unfortunately I don't have symbols for this kernel handy, but the=
re is a
> > > > > single wake_up() call in process_writes(), so it shouldn't be an =
issue.
> > > > >=20
> > > > > Any ideas?
> > > > >=20
> > > > > Full log at https://openqa.qubes-os.org/tests/80779/logfile?filen=
ame=3Dserial0.txt
> > > >=20
> > > > More links at https://github.com/QubesOS/qubes-issues/issues/8638,
> > > > including more recent stack trace.
> > >=20
> > > Happens on 6.1.75 too (new stack trace I've added to the issue above,
> > > but it's pretty similar).
>=20
> Recently I've got a report from another user about similar issue, on
> 6.6.29 this time. I also still encounter this issue once a month or so,
> but the user claims they get it much more often:
> https://github.com/QubesOS/qubes-issues/issues/8638#issuecomment-21354198=
96
> The extra conditions reported by the user are:
> - old AMD system (KGPE-D16 with Opteron 6282 SE) requiring
>   `spec-ctrl=3Dibpb-entry=3Dno-pv` to remain usable=20
> - Whonix domU, which has a bunch of sysctl parameters changed, listed
>   at:
>   - https://github.com/Kicksecure/security-misc
>   - https://github.com/Kicksecure/security-misc/blob/master/usr/lib/sysct=
l.d/990-security-misc.conf
>   (unsure which are relevant, maybe `vm.swappiness=3D1`?)

I've got some more report confirming it's still happening on Linux
6.12.18. Is there anything I can do to help fixing this? Maybe ask users
to enable some extra logging?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--uA3h3C1LK1Wh2sS5
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgI4BgACgkQ24/THMrX
1yyQBAf8D7f65wbZUtO4YalAr6PhZYm1DhkE0BxUVDqawo/RChapo9A7WhAxomiS
POyiqlbW5nnQVOykwoV7cAiu5LBnspC2UPtzyy76VxBoyGRWXKr+S8lEVbx9uFki
uQOe9oRom7VIsoUg5BRYswbNb+1urUyp3UU9hikczp/GDbDbgzGvbEkxSIy/19lx
a4xgTYZ6sXXuAcC4QxUemuglPYeP1mwsTWYS9cDW0PMB83+hLTNw+aE3/o14mPTL
mxEw0gN/sjLH0blxZjowyLSWV2Xmp3I9FMGt+f3yOn+VQ4zOHHyxK+2oqqO4ZN5k
iuvxlktyTmUtc2jBQvRHMnJgJIUbOQ==
=b/on
-----END PGP SIGNATURE-----

--uA3h3C1LK1Wh2sS5--

