Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B339AA679F
	for <lists+xen-devel@lfdr.de>; Fri,  2 May 2025 02:01:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.974377.1362268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAdqL-0008U8-BB; Fri, 02 May 2025 00:01:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 974377.1362268; Fri, 02 May 2025 00:01:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uAdqL-0008Qz-71; Fri, 02 May 2025 00:01:29 +0000
Received: by outflank-mailman (input) for mailman id 974377;
 Fri, 02 May 2025 00:01:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dYCr=XS=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uAdqJ-0008Qt-2f
 for xen-devel@lists.xenproject.org; Fri, 02 May 2025 00:01:27 +0000
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 955ccef9-26e8-11f0-9eb4-5ba50f476ded;
 Fri, 02 May 2025 02:01:24 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 55EBA1380858;
 Thu,  1 May 2025 20:01:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 01 May 2025 20:01:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 1 May 2025 20:01:21 -0400 (EDT)
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
X-Inumbo-ID: 955ccef9-26e8-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1746144082;
	 x=1746230482; bh=Sryq4Gx8hf4xx/wbwXSC6RxO3c4ZAsYR6NIt+JLwuCU=; b=
	mb+g/ycFfsDat5z6tjYx9NBsNJIYpKL8nXTkd91ha968bzdGpC5N1ozrB+kNDDOg
	MUKGg+Aw/u5HnFO/woKhpx34EpBQUXHWftcyBp0lFoUFLTZIGAGOOCDgnAj7iqZk
	f1O0FSWub9QokxS98FHyTPIuWyqHfXwvAYPWmttK+71byKtdlgEJo15ztcMCHLuu
	F21C2htTFm999JCIavwUmd/RE+3K8XBXCWAqpk5kOTPC7YTzeblQu57H7Nbqc+mQ
	UWW25dvHQAG1FkCZOjtbjr2xjxAtzdYP0zQ4OBTuYFJGxdyuXqlWH66ptsznJHK2
	k8fECMke8YpzMrPoaZwHHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1746144082; x=1746230482; bh=Sryq4Gx8hf4xx/wbwXSC6RxO3c4ZAsYR6NI
	t+JLwuCU=; b=JcEl6etDL5eB60YdXKCFvxVw15BXIGYwVLMmrsdEHDTAvOh2My3
	Cfk4LTpS33d9cy6VgpymXmf0JMl/4Z4YFvPCbbPz+tJlnW983DhUXktop8DcnrNC
	GQJjKChZPglEd0vo438Hqle80KNDabwbSBCp1KUaId00Og2YFN9IZIWcIO5ULNmJ
	erjICYL3/3V6Rov+IOZyTy3cej3SgSD10uEBzR00oXW2BNUVQXvYTdswKfLcg9hR
	5fb4fF5UUCTofIctvH00F3DtuRrktYLE6MExKcQ5QxiPsrXzBaVtf90zVlOSWuej
	yZFwm4/tbh5hqSXvkAD0Dn2hOkOtcQJD3NA==
X-ME-Sender: <xms:UQsUaHOrfEHMsWlqxSDEkHGCSuqeJJzHpx-kFJFGcQJ6U10nN4tX8w>
    <xme:UQsUaB9uGPTnaKcOzK2igNtcBIHr6In-Ie3lDeTd8VyMcN_UtwfwKV8WnWZSHLpfa
    RiFlsyiS0aYLA>
X-ME-Received: <xmr:UQsUaGQVSz9eHvfre4DH3Pvc91vlgSIwSRvg-LGTOwq87oxi5D9oYp-8o585qf4RwNGtQQtZS1To8BV3tsndABwg5o04yvMz1w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtleeiucetufdoteggodetrf
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
X-ME-Proxy: <xmx:UQsUaLtfQx0cy8Ht3HOimcMqo82WzeIGIrpHoimTiedtFjNcQfElSw>
    <xmx:UQsUaPeIWaTjyT78hAuWlABFnsTja9rUCfM9SCAUlof3p6U5wwKUKw>
    <xmx:UQsUaH3Xx2HxPE-xwhLi5tY0S3wZgmo7OUbeOlLgg1oqsQccnvgIAA>
    <xmx:UQsUaL-fiq2eHkhjAvF2IbTOHPPVGUKJT_BggmdOVkCh5GEUcVhUpg>
    <xmx:UgsUaIfqeS1G641qyll1aSvAGIk8n5wzDmmc3j36IAQv_lSg9pN1YVqs>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 2 May 2025 02:01:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jason Andryuk <jandryuk@gmail.com>
Cc: Julien Grall <julien@xen.org>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...
Message-ID: <aBQLT2g4XQfK2dwh@mail-itl>
References: <ZO0WrR5J0xuwDIxW@mail-itl>
 <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl>
 <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
 <ZlpTwbmDjNLkCNgH@mail-itl>
 <aAjgGKRAW95BnTiK@mail-itl>
 <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="al3d5CqgWeK2TatU"
Content-Disposition: inline
In-Reply-To: <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>


--al3d5CqgWeK2TatU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 May 2025 02:01:18 +0200
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

This worked:

    BUG: kernel NULL pointer dereference, address: 0000000000000000
    #PF: supervisor read access in kernel mode
    #PF: error_code(0x0000) - not-present page
    PGD 0 P4D 0
    Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
    RIP: 0010:__wake_up_common (kernel/sched/wait.c:85)=20
    Code: 0f 1f 44 00 00 41 57 41 56 41 55 41 54 55 53 48 89 fb 48 83 c3 08=
 48 83 ec 08 48 8b 47 08 89 54 24 04 48 39 c3 74 55 4d 89 c7 <4c> 8b 00 41 =
89 f5 41 89 ce 48 8d 78 e8 4d 8d 60 e8 eb 27 74 0c 83
    All code
    =3D=3D=3D=3D=3D=3D=3D=3D
       0:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
       5:	41 57                	push   %r15
       7:	41 56                	push   %r14
       9:	41 55                	push   %r13
       b:	41 54                	push   %r12
       d:	55                   	push   %rbp
       e:	53                   	push   %rbx
       f:	48 89 fb             	mov    %rdi,%rbx
      12:	48 83 c3 08          	add    $0x8,%rbx
      16:	48 83 ec 08          	sub    $0x8,%rsp
      1a:	48 8b 47 08          	mov    0x8(%rdi),%rax
      1e:	89 54 24 04          	mov    %edx,0x4(%rsp)
      22:	48 39 c3             	cmp    %rax,%rbx
      25:	74 55                	je     0x7c
      27:	4d 89 c7             	mov    %r8,%r15
      2a:*	4c 8b 00             	mov    (%rax),%r8		<-- trapping instruction
      2d:	41 89 f5             	mov    %esi,%r13d
      30:	41 89 ce             	mov    %ecx,%r14d
      33:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
      37:	4d 8d 60 e8          	lea    -0x18(%r8),%r12
      3b:	eb 27                	jmp    0x64
      3d:	74 0c                	je     0x4b
      3f:	83                   	.byte 0x83

    Code starting with the faulting instruction
    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
       0:	4c 8b 00             	mov    (%rax),%r8
       3:	41 89 f5             	mov    %esi,%r13d
       6:	41 89 ce             	mov    %ecx,%r14d
       9:	48 8d 78 e8          	lea    -0x18(%rax),%rdi
       d:	4d 8d 60 e8          	lea    -0x18(%r8),%r12
      11:	eb 27                	jmp    0x3a
      13:	74 0c                	je     0x21
      15:	83                   	.byte 0x83
    RSP: 0018:ffffc900009f7e40 EFLAGS: 00010082
    RAX: 0000000000000000 RBX: ffff8880109c0798 RCX: 0000000000000000
    RDX: 0000000000000001 RSI: 0000000000000003 RDI: ffff8880109c0790
    RBP: ffff8880109c0790 R08: 0000000000000000 R09: 0000000000000003
    R10: ffffc900009f7eb0 R11: ffffc9000003d000 R12: 0000000000000003
    R13: 0000000000000246 R14: 0000000000000000 R15: 0000000000000000
    FS:  0000000000000000(0000) GS:ffff888018500000(0000) knlGS:00000000000=
00000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 0000000000000000 CR3: 00000000432a0000 CR4: 00000000000406f0
    Call Trace:
    <TASK>
    ? __die (arch/x86/kernel/dumpstack.c:421 arch/x86/kernel/dumpstack.c:43=
4)=20
    ? page_fault_oops (arch/x86/mm/fault.c:715)=20
    ? exc_page_fault (arch/x86/include/asm/paravirt.h:693 arch/x86/mm/fault=
=2Ec:1489 arch/x86/mm/fault.c:1539)=20
    ? asm_exc_page_fault (arch/x86/include/asm/idtentry.h:623)=20
    ? __wake_up_common (kernel/sched/wait.c:85)=20
    ? __pfx_xenbus_thread (drivers/xen/xenbus/xenbus_comms.c:411)=20
    __wake_up (include/linux/spinlock.h:406 kernel/sched/wait.c:108 kernel/=
sched/wait.c:127)=20
    process_msg (drivers/xen/xenbus/xenbus_comms.c:311)=20
    xenbus_thread (drivers/xen/xenbus/xenbus_comms.c:418)=20
    ? __pfx_autoremove_wake_function (kernel/sched/wait.c:383)=20
    kthread (kernel/kthread.c:389)=20
    ? __pfx_kthread (kernel/kthread.c:342)=20
    ret_from_fork (arch/x86/kernel/process.c:153)=20
    ? __pfx_kthread (kernel/kthread.c:342)=20
    ret_from_fork_asm (arch/x86/entry/entry_64.S:257)=20
    </TASK>
    Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd=
_timer snd soundcore xenfs nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nf=
t_reject nft_ct nf_conntrack nf_defrag_ipv6 nf_defrag_ipv4 nf_tables nfnetl=
ink binfmt_misc crct10dif_pclmul crc32_pclmul crc32c_intel polyval_clmulni =
polyval_generic ghash_clmulni_intel sha512_ssse3 sha256_ssse3 xen_netfront =
sha1_ssse3 xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn loop =
fuse ip_tables overlay xen_blkfront
    CR2: 0000000000000000
    ---[ end trace 0000000000000000 ]---

> I'm curious what process_msg+0x18e/0x2f0 is.  process_writes() has a
> direct call to wake_up(), but process_msg() calling req->cb(req) may
> be xs_wake_up() which is a thin wrapper over wake_up().

So, it's req->cb(req).

> They make me wonder if req has been free()ed and at least partially
> zero-ed, but it still has wake_up() called.  The call stack here is
> reminiscent of the one here
> https://lore.kernel.org/xen-devel/Z_lJTyVipJJEpWg2@mail-itl/ and the
> unexpected value there is 0.
>=20
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

--al3d5CqgWeK2TatU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgUC08ACgkQ24/THMrX
1ywsggf7BCywUk6bpFTW5Y8Mq6sqOekKP9fm5Wg56MT+nqY08zpJWAj2nufOEqok
HrCQgOHhLtgGKshhXYnw0cI12EaHZlod5L/8nC+dZvwJ9/3zXhWLNBLk3CnEm7j1
JF17Ajsf+iOW1EnjUBroGNuhv9yFwGSIQYQ0fjv4HvHRJXC2I3pE8YOKDLWwP0Mw
QdSKPDtJYdOfaekvBB8jbiYgPSkzuSePtJrfspSToIyDlfMKtjnTPGOfQlp7E/Wp
b8Q+G0KhmbF1rwWbE+wmkzVTco6pexr8x/CoGx0j/bRNB3T8F1eYsvc2xTdnhOSQ
EI61XcwyRJiuGcixYvomDBg9fO85FA==
=Dw1a
-----END PGP SIGNATURE-----

--al3d5CqgWeK2TatU--

