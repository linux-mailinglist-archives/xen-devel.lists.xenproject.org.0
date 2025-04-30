Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B01A7AA494D
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 12:57:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973527.1361639 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA577-0000Dc-4L; Wed, 30 Apr 2025 10:56:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973527.1361639; Wed, 30 Apr 2025 10:56:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uA577-0000AS-1N; Wed, 30 Apr 2025 10:56:29 +0000
Received: by outflank-mailman (input) for mailman id 973527;
 Wed, 30 Apr 2025 10:56:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GHIQ=XQ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uA575-0000AM-Bk
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 10:56:27 +0000
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcccbc7d-25b1-11f0-9ffb-bf95429c2676;
 Wed, 30 Apr 2025 12:56:16 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id 323A31380E92;
 Wed, 30 Apr 2025 06:56:15 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Wed, 30 Apr 2025 06:56:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 30 Apr 2025 06:56:13 -0400 (EDT)
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
X-Inumbo-ID: bcccbc7d-25b1-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1746010575;
	 x=1746096975; bh=IAxGW6JA/FZzlRWj4x/Xypw1cEonIdLRp0X9GQQnIMI=; b=
	edDQgGlYacmIVWNicDiQDP4vkKwim3N4yJJvC+PRCyeAkTqCnYhX0DxPMXo6sHts
	Q3QMEjbWMM/VIy0JxxjTZO7eGlmd05KDIMxGEAuDoCq1GUkDNbVe66LrDtK7Ei6b
	dwScQJ/o5fpSQEB5Q86I3o0+uqGutU6zmBY9+TGR3P8RgP0FNKjmnPkDYSBlwTTc
	0veJ32RxpldgC4IpE8jsFNOSbE7k2ZK3/aVBVTcHkkuedp/M+29ZTJBWJ3wF6BUh
	GfCNUG9AVwmao2y3J74KxEsLn8D7DqbTBbrwxxz81ZaqXvxgYW/O5NP+EI8ohNlr
	IVeeZq6UXdQI2zS3GkMafg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746010575; x=1746096975; bh=IAxGW6JA/FZzlRWj4x/Xypw1cEonIdLRp0X
	9GQQnIMI=; b=HyYXf7Pjx8Ilc7SSZG67cGf8xM1qAdoKn63Ygdct4dLFYbl+me9
	/LxsaFigkHz/YqshRG8EfnSUsI4CxF9hXBXOkQhHJ4JDC6RENhwPniFmt2E+fDqr
	4QsufEKHKJRegpk5K1kQvjDDl77OO0waYMzrVvtNgqEoo1LbyrCwypa/qonxXNWi
	7Ud2Baf/7kEd2pzg1PEEA88Pa3wys0NHeN2p3eqGJ5lv2G6UkzKdyVapJz86IJiq
	bzqyLZxg8QgKt+CVDsBbr6WZBXBATQFkl95zRNq9qGpyV1cikRnB2WmjFk6RyxlA
	+hzRadTwSlvsi1b1jLegvZmippnzY8uqrEg==
X-ME-Sender: <xms:zgESaO37Ttxz7NMtH0GACdUnIw1dSGqLWwzNxGeBToH1Th3DtZzv_Q>
    <xme:zgESaBFOatAkEvCWlC0MzLbSP86WLvTRkOF4SwMxLjbGpdi8d69_eMAB4b0bqaAGR
    n_At_IYcV-ohA>
X-ME-Received: <xmr:zgESaG7bcuxnAFCrFBphWqqxp4zbNepellMRb_OX75gddLXwYL0XVTUNGJy_xRX91-2v20n7F-67_3axwmyn1C8IIfwX5fTiyA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvieeiheduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnhephfettdejhfehjeekgfdvudfhtdejlefghfehieeuteegveeitd
    dvgfetveekiefhnecuffhomhgrihhnpehophgvnhhsuhhsvgdrohhrghdpqhhusggvshdq
    ohhsrdhorhhgpdhgihhthhhusgdrtghomhdpkhgvrhhnvghlrdhorhhgnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgrnhgurhihuhhksehgmhgrihhlrdgt
    ohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepgigvnh
    dquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohep
    jhhgrhhoshhssehsuhhsvgdrtghomh
X-ME-Proxy: <xmx:zgESaP2tV9CrEiI74gpnWRFNjFx5YuNgW1OAVwnOTOe2bCsL5ozrRw>
    <xmx:zgESaBEnJoOdivdiGlHkvxNydtgh3CDiC91tTfcNIfaIjPefPAtBwQ>
    <xmx:zgESaI-E6mD0tJX_48Q_LjZ-gtuFIskid8kyc5C0FEITk2curcr8rQ>
    <xmx:zgESaGl8ZJ_Cvd8S4qFOwwb7NqBnJV72CcSYNNOEKP3FuTAYFaPd6Q>
    <xmx:zwESaMFhxJnQLEfwk0XK_iqUaWjmAWre1YPl7T-FYdFMylIRVMh-mkbh>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 30 Apr 2025 12:56:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Julien Grall <julien@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...
Message-ID: <aBIBy5eQPypM_UbJ@mail-itl>
References: <ZO0WrR5J0xuwDIxW@mail-itl>
 <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl>
 <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
 <ZlpTwbmDjNLkCNgH@mail-itl>
 <aAjgGKRAW95BnTiK@mail-itl>
 <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SSp5QTSPFzulJB5O"
Content-Disposition: inline
In-Reply-To: <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>


--SSp5QTSPFzulJB5O
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Apr 2025 12:56:11 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Julien Grall <julien@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...

On Tue, Apr 29, 2025 at 08:59:45PM -0400, Jason Andryuk wrote:
> Hi Marek,
>=20
> On Wed, Apr 23, 2025 at 8:42=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
> <marmarek@invisiblethingslab.com> wrote:
> >
> > On Sat, Jun 01, 2024 at 12:48:33AM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Tue, Mar 26, 2024 at 11:00:50AM +0000, Julien Grall wrote:
> > > > Hi Marek,
> > > >
> > > > +Juergen for visibility
> > > >
> > > > When sending a bug report, I would suggest to CC relevant people as
> > > > otherwise it can get lost (not may people monitors Xen devel if the=
y are not
> > > > CCed).
> > > >
> > > > Cheers,
> > > >
> > > > On 25/03/2024 16:17, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > On Sun, Oct 22, 2023 at 04:14:30PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > On Mon, Aug 28, 2023 at 11:50:36PM +0200, Marek Marczykowski-G=
=C3=B3recki wrote:
> > > > > > > Hi,
> > > > > > >
> > > > > > > I've noticed in Qubes's CI failure like this:
> > > > > > >
> > > > > > > [  871.271292] BUG: kernel NULL pointer dereference, address:=
 0000000000000000
> > > > > > > [  871.275290] #PF: supervisor read access in kernel mode
> > > > > > > [  871.277282] #PF: error_code(0x0000) - not-present page
> > > > > > > [  871.279182] PGD 106fdb067 P4D 106fdb067 PUD 106fdc067 PMD 0
> > > > > > > [  871.281071] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > > > > > [  871.282698] CPU: 1 PID: 28 Comm: xenbus Not tainted 6.1.43=
-1.qubes.fc37.x86_64 #1
> > > > > > > [  871.285222] Hardware name: QEMU Standard PC (i440FX + PIIX=
, 1996), BIOS rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
> > > > > > > [  871.288883] RIP: e030:__wake_up_common+0x4c/0x180
> > > > > > > [  871.292838] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 0=
1 04 0f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 3=
9 c3 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b=
 40
> > > > > > > [  871.299776] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > > > > > > [  871.301656] RAX: 0000000000000000 RBX: ffff88810541ce98 RC=
X: 0000000000000000
> > > > > > > [  871.304255] RDX: 0000000000000001 RSI: 0000000000000003 RD=
I: ffff88810541ce90
> > > > > > > [  871.306714] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R0=
9: ffffc900400f7e68
> > > > > > > [  871.309937] R10: 0000000000007ff0 R11: ffff888100ad3000 R1=
2: ffffc900400f7e68
> > > > > > > [  871.312326] R13: 0000000000000000 R14: 0000000000000000 R1=
5: 0000000000000000
> > > > > > > [  871.314647] FS:  0000000000000000(0000) GS:ffff88813ff0000=
0(0000) knlGS:0000000000000000
> > > > > > > [  871.317677] CS:  10000e030 DS: 0000 ES: 0000 CR0: 00000000=
80050033
> > > > > > > [  871.319644] CR2: 0000000000000000 CR3: 00000001067fe000 CR=
4: 0000000000040660
> > > > > > > [  871.321973] Call Trace:
> > > > > > > [  871.322782]  <TASK>
> > > > > > > [  871.323494]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > > > > [  871.324901]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > > > > [  871.326310]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > > > > [  871.327721]  ? __wake_up_common_lock+0x82/0xd0
> > > > > > > [  871.329147]  ? __die_body.cold+0x8/0xd
> > > > > > > [  871.330378]  ? page_fault_oops+0x163/0x1a0
> > > > > > > [  871.331691]  ? exc_page_fault+0x70/0x170
> > > > > > > [  871.332946]  ? asm_exc_page_fault+0x22/0x30
> > > > > > > [  871.334454]  ? __wake_up_common+0x4c/0x180
> > > > > > > [  871.335777]  __wake_up_common_lock+0x82/0xd0
> > > > > > > [  871.337183]  ? process_writes+0x240/0x240
> > > > > > > [  871.338461]  process_msg+0x18e/0x2f0
> > > > > > > [  871.339627]  xenbus_thread+0x165/0x1c0
> > > > > > > [  871.340830]  ? cpuusage_read+0x10/0x10
> > > > > > > [  871.342032]  kthread+0xe9/0x110
> > > > > > > [  871.343317]  ? kthread_complete_and_exit+0x20/0x20
> > > > > > > [  871.345020]  ret_from_fork+0x22/0x30
> > > > > > > [  871.346239]  </TASK>
> > > > > > > [  871.347060] Modules linked in: snd_hda_codec_generic ledtr=
ig_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec sn=
d_hda_core snd_hwdep snd_seq snd_seq_device joydev snd_pcm intel_rapl_msr p=
pdev intel_rapl_common snd_timer pcspkr e1000e snd soundcore i2c_piix4 parp=
ort_pc parport loop fuse xenfs dm_crypt crct10dif_pclmul crc32_pclmul crc32=
c_intel polyval_clmulni polyval_generic floppy ghash_clmulni_intel sha512_s=
sse3 serio_raw virtio_scsi virtio_console bochs xhci_pci xhci_pci_renesas x=
hci_hcd qemu_fw_cfg drm_vram_helper drm_ttm_helper ttm ata_generic pata_acp=
i xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn sc=
si_dh_rdac scsi_dh_emc scsi_dh_alua uinput dm_multipath
> > > > > > > [  871.368892] CR2: 0000000000000000
> > > > > > > [  871.370160] ---[ end trace 0000000000000000 ]---
> > > > > > > [  871.371719] RIP: e030:__wake_up_common+0x4c/0x180
> > > > > > > [  871.373273] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 0=
1 04 0f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 3=
9 c3 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b=
 40
> > > > > > > [  871.379866] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > > > > > > [  871.381689] RAX: 0000000000000000 RBX: ffff88810541ce98 RC=
X: 0000000000000000
> > > > > > > [  871.383971] RDX: 0000000000000001 RSI: 0000000000000003 RD=
I: ffff88810541ce90
> > > > > > > [  871.386235] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R0=
9: ffffc900400f7e68
> > > > > > > [  871.388521] R10: 0000000000007ff0 R11: ffff888100ad3000 R1=
2: ffffc900400f7e68
> > > > > > > [  871.390789] R13: 0000000000000000 R14: 0000000000000000 R1=
5: 0000000000000000
> > > > > > > [  871.393101] FS:  0000000000000000(0000) GS:ffff88813ff0000=
0(0000) knlGS:0000000000000000
> > > > > > > [  871.395671] CS:  10000e030 DS: 0000 ES: 0000 CR0: 00000000=
80050033
> > > > > > > [  871.397863] CR2: 0000000000000000 CR3: 00000001067fe000 CR=
4: 0000000000040660
> > > > > > > [  871.400441] Kernel panic - not syncing: Fatal exception
> > > > > > > [  871.402171] Kernel Offset: disabled
> > > > > > > (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
> > > > > > >
> > > > > > > It isn't the first time I see similar crash, but I can't real=
ly
> > > > > > > reproduce it reliably. Restarted test usually passes.
> > > > > > > Note this is Xen nested in KVM, so it could very well be some=
 oddity
> > > > > > > about nested virt, although looking at the stack trace, it's =
unlikely
> > > > > > > and more likely some race condition hit only on slower system.
> > > > > >
> > > > > > Recently I've got the same crash on a real system in domU too. =
And also
> > > > > > on nested on newer kernel 6.1.57 (here it happened in dom0). So=
, this is
> > > > > > still an issue and affects not only nested case :/
> > > > > >
> > > > > > > Unfortunately I don't have symbols for this kernel handy, but=
 there is a
> > > > > > > single wake_up() call in process_writes(), so it shouldn't be=
 an issue.
> > > > > > >
> > > > > > > Any ideas?
> > > > > > >
> > > > > > > Full log at https://openqa.qubes-os.org/tests/80779/logfile?f=
ilename=3Dserial0.txt
> > > > > >
> > > > > > More links at https://github.com/QubesOS/qubes-issues/issues/86=
38,
> > > > > > including more recent stack trace.
> > > > >
> > > > > Happens on 6.1.75 too (new stack trace I've added to the issue ab=
ove,
> > > > > but it's pretty similar).
> > >
> > > Recently I've got a report from another user about similar issue, on
> > > 6.6.29 this time. I also still encounter this issue once a month or s=
o,
> > > but the user claims they get it much more often:
> > > https://github.com/QubesOS/qubes-issues/issues/8638#issuecomment-2135=
419896
> > > The extra conditions reported by the user are:
> > > - old AMD system (KGPE-D16 with Opteron 6282 SE) requiring
> > >   `spec-ctrl=3Dibpb-entry=3Dno-pv` to remain usable
> > > - Whonix domU, which has a bunch of sysctl parameters changed, listed
> > >   at:
> > >   - https://github.com/Kicksecure/security-misc
> > >   - https://github.com/Kicksecure/security-misc/blob/master/usr/lib/s=
ysctl.d/990-security-misc.conf
> > >   (unsure which are relevant, maybe `vm.swappiness=3D1`?)
> >
> > I've got some more report confirming it's still happening on Linux
> > 6.12.18. Is there anything I can do to help fixing this? Maybe ask users
> > to enable some extra logging?
>=20
> Have you been able to capture a crash with debug symbols and run it
> through scripts/decode_stacktrace.sh?

Not really, as I don't have debug symbols for this kernel. And I can't
reliably reproduce it myself (for me it happens about once in a
month...). I can try reproducing debug symbols, theoretically I should
have all ingredients for it.

> I'm curious what process_msg+0x18e/0x2f0 is.  process_writes() has a
> direct call to wake_up(), but process_msg() calling req->cb(req) may
> be xs_wake_up() which is a thin wrapper over wake_up().

There is a code dump in the crash message, does it help?

> They make me wonder if req has been free()ed and at least partially
> zero-ed, but it still has wake_up() called.  The call stack here is
> reminiscent of the one here
> https://lore.kernel.org/xen-devel/Z_lJTyVipJJEpWg2@mail-itl/ and the
> unexpected value there is 0.

That's interesting idea, the one above I've seen only on 6.15-rc1 (and
no latter rc). But maybe?

> I haven't actually figured out a scenario where req would be kfree()ed
> early.  But the handling of kfree(req) being split between
> process_msg/writes() and xs_wait_for_reply() makes me a little uneasy.
>=20
> Regards,
> Jason

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--SSp5QTSPFzulJB5O
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgSAcsACgkQ24/THMrX
1yy2Uwf+ME/9cs7PPGHqoIIrj14uguboY4L7Bvnna9/FgSx67fHkHdjeyvU9qATr
+KXs4CqfVuXdJmyIUu4DFOW2zXP72t+UwSMpOj7DgQnYLdOfsTuoCAZdl3l7bfEH
qR17NddFANPERJ9vg1aEG82qkmU791+pSCtYPaAGXNhQn5Lhm9iovfakQfLTRghV
D/Z3l0+LFl0jMRKgjC4VkB1CbeeXuF5IoP9HLRl60jeg4oTHR+eK5vUEvQ2DKX6s
6/arOfw12xCHuroRkQcO2J54vGBb50qaJyvc7zEwEA4pt9GNHpvxCVv+Qy8UAnWO
D/IkhqtM2yT0/cgAkblVdBz99H30jQ==
=1w3k
-----END PGP SIGNATURE-----

--SSp5QTSPFzulJB5O--

