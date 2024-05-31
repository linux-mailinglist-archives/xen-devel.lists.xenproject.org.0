Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D374A8D6C99
	for <lists+xen-devel@lfdr.de>; Sat,  1 Jun 2024 00:49:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.733893.1140174 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDB3F-00015l-QN; Fri, 31 May 2024 22:48:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 733893.1140174; Fri, 31 May 2024 22:48:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sDB3F-00013J-N5; Fri, 31 May 2024 22:48:45 +0000
Received: by outflank-mailman (input) for mailman id 733893;
 Fri, 31 May 2024 22:48:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xPZo=NC=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sDB3E-00013B-KH
 for xen-devel@lists.xenproject.org; Fri, 31 May 2024 22:48:44 +0000
Received: from wfhigh2-smtp.messagingengine.com
 (wfhigh2-smtp.messagingengine.com [64.147.123.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ec5b1f42-1f9f-11ef-90a1-e314d9c70b13;
 Sat, 01 Jun 2024 00:48:42 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailfhigh.west.internal (Postfix) with ESMTP id 7095718000BA;
 Fri, 31 May 2024 18:48:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 31 May 2024 18:48:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 31 May 2024 18:48:36 -0400 (EDT)
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
X-Inumbo-ID: ec5b1f42-1f9f-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1717195718;
	 x=1717282118; bh=xBqG5KeyHw6loZw0/cyADHLe7k/DxHhcD0woNr8hcJM=; b=
	rx9u5Qp02zYTx6ZIMxPXsbNxEH6kV5FDLGJ+kpgezKK3bf/3WXtF205FFj4sChwG
	dhzSis//Zktvmiie9lDbiHaCafj1UXUJMWM3EyuQ82jhzjx2c7vaC8O/dxZdfjG8
	5msK8j56il9t4jc0iP/EQ41Wt659h9bssY7vsKi05GHaXrJ3YpkNUs9fp5vtxfLw
	Kwfh3kdEbgu4pO/R/G3HO/YLaQkClWXQOAbs3FEqAVnmGvFeRJU2dnkNWEio0XWP
	aiBimquILN4flQ7Xf56zln3/pvkklm8hd9S1Y6hv1Ho6xJUHHb2MMFpjlMv4rU8x
	FgpNDkb96/GoOHvpaXRxuA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1717195718; x=1717282118; bh=xBqG5KeyHw6loZw0/cyADHLe7k/D
	xHhcD0woNr8hcJM=; b=oU2Qun8Wz3C+AVTKd/Kx0pvKv+XFaWc1n/fobD2akB6Y
	UEZNHy2n0/CVgIuXtKZUur4+3KPW8hVJujbbmE/GXhNEtKhtudUOrBCmQHo0UvD2
	grw3sVONIvhl18h3+DGqy85e7dcnbG4B56Mbl1fdyE1mLBPvSftbSJY2q+X+9sBC
	wXDREWoqmcjuKUWwq9vcSk9sHzw0bHVh9X3AqTjkN+rdj0FgVonf3PnP3D+Y6QkV
	gjADxry3b0tW4Z7mByUB72mTuR3qweTJjn8KKeNAwX5FN/SKJQX1RY3CCQjykxfV
	Oscm21Lv1xxQfnfSse7Z0MMHnf1pwXxkueafQU5XjQ==
X-ME-Sender: <xms:xVNaZuqUeSGShb2KukS9kjKwHP9-ZfVSlyk4ZPB4zua9AOwhic1fmg>
    <xme:xVNaZsq_PPhi5u0Iy_4jWZTQFfo0Q7rvZCVNt1HbElnT20lWRBvKr5Lb-XbIXcZFQ
    lPEHCeMcgUB3g>
X-ME-Received: <xmr:xVNaZjN9xTcEvAkS0cUrSfUpk94mStUZ6tu_qW-R6cRA9QZ4tovhvfUuuh8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdekjedgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepheeh
    ueektedufeelvddvffeghedtjeeludehffeuuddugfettdelvdffjeduheevnecuffhomh
    grihhnpehophgvnhhsuhhsvgdrohhrghdpqhhusggvshdqohhsrdhorhhgpdhgihhthhhu
    sgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:xVNaZt6MeRd7BmAMHdrDT4gwwgfdXWJrddEgo6dS7RDYoMfccDqLfg>
    <xmx:xVNaZt4yPNABCzf5cI8gsyctWE6w6IJUX_RxeaY2PsbB60wnIBw-og>
    <xmx:xVNaZti446jogTuRrPrg6OIpKRvBzOA4Z9pFe4CXzmmsq5NXkQKNrg>
    <xmx:xVNaZn5VxapMr8BMG2di-BVVm6HuWMb3YmJOkYDij5GNm9SXDscpzw>
    <xmx:xlNaZtF9OzQnnI6oAkjg0Z4j11NWOVQiKdeypRocfaYWFhA2YnBzlqXl>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 1 Jun 2024 00:48:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...
Message-ID: <ZlpTwbmDjNLkCNgH@mail-itl>
References: <ZO0WrR5J0xuwDIxW@mail-itl>
 <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl>
 <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4ybz0eHqAMeE41R+"
Content-Disposition: inline
In-Reply-To: <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>


--4ybz0eHqAMeE41R+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 1 Jun 2024 00:48:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Juergen Gross <jgross@suse.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...

On Tue, Mar 26, 2024 at 11:00:50AM +0000, Julien Grall wrote:
> Hi Marek,
>=20
> +Juergen for visibility
>=20
> When sending a bug report, I would suggest to CC relevant people as
> otherwise it can get lost (not may people monitors Xen devel if they are =
not
> CCed).
>=20
> Cheers,
>=20
> On 25/03/2024 16:17, Marek Marczykowski-G=C3=B3recki wrote:
> > On Sun, Oct 22, 2023 at 04:14:30PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Mon, Aug 28, 2023 at 11:50:36PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hi,
> > > >=20
> > > > I've noticed in Qubes's CI failure like this:
> > > >=20
> > > > [  871.271292] BUG: kernel NULL pointer dereference, address: 00000=
00000000000
> > > > [  871.275290] #PF: supervisor read access in kernel mode
> > > > [  871.277282] #PF: error_code(0x0000) - not-present page
> > > > [  871.279182] PGD 106fdb067 P4D 106fdb067 PUD 106fdc067 PMD 0
> > > > [  871.281071] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > > [  871.282698] CPU: 1 PID: 28 Comm: xenbus Not tainted 6.1.43-1.qub=
es.fc37.x86_64 #1
> > > > [  871.285222] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996=
), BIOS rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
> > > > [  871.288883] RIP: e030:__wake_up_common+0x4c/0x180
> > > > [  871.292838] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0=
f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 7=
4 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
> > > > [  871.299776] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > > > [  871.301656] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 000=
0000000000000
> > > > [  871.304255] RDX: 0000000000000001 RSI: 0000000000000003 RDI: fff=
f88810541ce90
> > > > [  871.306714] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: fff=
fc900400f7e68
> > > > [  871.309937] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: fff=
fc900400f7e68
> > > > [  871.312326] R13: 0000000000000000 R14: 0000000000000000 R15: 000=
0000000000000
> > > > [  871.314647] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000=
) knlGS:0000000000000000
> > > > [  871.317677] CS:  10000e030 DS: 0000 ES: 0000 CR0: 00000000800500=
33
> > > > [  871.319644] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 000=
0000000040660
> > > > [  871.321973] Call Trace:
> > > > [  871.322782]  <TASK>
> > > > [  871.323494]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > [  871.324901]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > [  871.326310]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > [  871.327721]  ? __wake_up_common_lock+0x82/0xd0
> > > > [  871.329147]  ? __die_body.cold+0x8/0xd
> > > > [  871.330378]  ? page_fault_oops+0x163/0x1a0
> > > > [  871.331691]  ? exc_page_fault+0x70/0x170
> > > > [  871.332946]  ? asm_exc_page_fault+0x22/0x30
> > > > [  871.334454]  ? __wake_up_common+0x4c/0x180
> > > > [  871.335777]  __wake_up_common_lock+0x82/0xd0
> > > > [  871.337183]  ? process_writes+0x240/0x240
> > > > [  871.338461]  process_msg+0x18e/0x2f0
> > > > [  871.339627]  xenbus_thread+0x165/0x1c0
> > > > [  871.340830]  ? cpuusage_read+0x10/0x10
> > > > [  871.342032]  kthread+0xe9/0x110
> > > > [  871.343317]  ? kthread_complete_and_exit+0x20/0x20
> > > > [  871.345020]  ret_from_fork+0x22/0x30
> > > > [  871.346239]  </TASK>
> > > > [  871.347060] Modules linked in: snd_hda_codec_generic ledtrig_aud=
io snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_hda_=
core snd_hwdep snd_seq snd_seq_device joydev snd_pcm intel_rapl_msr ppdev i=
ntel_rapl_common snd_timer pcspkr e1000e snd soundcore i2c_piix4 parport_pc=
 parport loop fuse xenfs dm_crypt crct10dif_pclmul crc32_pclmul crc32c_inte=
l polyval_clmulni polyval_generic floppy ghash_clmulni_intel sha512_ssse3 s=
erio_raw virtio_scsi virtio_console bochs xhci_pci xhci_pci_renesas xhci_hc=
d qemu_fw_cfg drm_vram_helper drm_ttm_helper ttm ata_generic pata_acpi xen_=
privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi_dh_=
rdac scsi_dh_emc scsi_dh_alua uinput dm_multipath
> > > > [  871.368892] CR2: 0000000000000000
> > > > [  871.370160] ---[ end trace 0000000000000000 ]---
> > > > [  871.371719] RIP: e030:__wake_up_common+0x4c/0x180
> > > > [  871.373273] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 04 0=
f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 c3 7=
4 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 40
> > > > [  871.379866] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > > > [  871.381689] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX: 000=
0000000000000
> > > > [  871.383971] RDX: 0000000000000001 RSI: 0000000000000003 RDI: fff=
f88810541ce90
> > > > [  871.386235] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09: fff=
fc900400f7e68
> > > > [  871.388521] R10: 0000000000007ff0 R11: ffff888100ad3000 R12: fff=
fc900400f7e68
> > > > [  871.390789] R13: 0000000000000000 R14: 0000000000000000 R15: 000=
0000000000000
> > > > [  871.393101] FS:  0000000000000000(0000) GS:ffff88813ff00000(0000=
) knlGS:0000000000000000
> > > > [  871.395671] CS:  10000e030 DS: 0000 ES: 0000 CR0: 00000000800500=
33
> > > > [  871.397863] CR2: 0000000000000000 CR3: 00000001067fe000 CR4: 000=
0000000040660
> > > > [  871.400441] Kernel panic - not syncing: Fatal exception
> > > > [  871.402171] Kernel Offset: disabled
> > > > (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
> > > >=20
> > > > It isn't the first time I see similar crash, but I can't really
> > > > reproduce it reliably. Restarted test usually passes.
> > > > Note this is Xen nested in KVM, so it could very well be some oddity
> > > > about nested virt, although looking at the stack trace, it's unlike=
ly
> > > > and more likely some race condition hit only on slower system.
> > >=20
> > > Recently I've got the same crash on a real system in domU too. And al=
so
> > > on nested on newer kernel 6.1.57 (here it happened in dom0). So, this=
 is
> > > still an issue and affects not only nested case :/
> > >=20
> > > > Unfortunately I don't have symbols for this kernel handy, but there=
 is a
> > > > single wake_up() call in process_writes(), so it shouldn't be an is=
sue.
> > > >=20
> > > > Any ideas?
> > > >=20
> > > > Full log at https://openqa.qubes-os.org/tests/80779/logfile?filenam=
e=3Dserial0.txt
> > >=20
> > > More links at https://github.com/QubesOS/qubes-issues/issues/8638,
> > > including more recent stack trace.
> >=20
> > Happens on 6.1.75 too (new stack trace I've added to the issue above,
> > but it's pretty similar).

Recently I've got a report from another user about similar issue, on
6.6.29 this time. I also still encounter this issue once a month or so,
but the user claims they get it much more often:
https://github.com/QubesOS/qubes-issues/issues/8638#issuecomment-2135419896
The extra conditions reported by the user are:
- old AMD system (KGPE-D16 with Opteron 6282 SE) requiring
  `spec-ctrl=3Dibpb-entry=3Dno-pv` to remain usable=20
- Whonix domU, which has a bunch of sysctl parameters changed, listed
  at:
  - https://github.com/Kicksecure/security-misc
  - https://github.com/Kicksecure/security-misc/blob/master/usr/lib/sysctl.=
d/990-security-misc.conf
  (unsure which are relevant, maybe `vm.swappiness=3D1`?)


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--4ybz0eHqAMeE41R+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZaU8EACgkQ24/THMrX
1yzlBQf/U9j0tGuo4A2afz3xwZ7iglL8ZWb6RE7/XS33u15Be96Zpbi4LkzVEXAl
lz9Qyl1wbS3OHMvXeuv+HerZWNXIWOe6lqIonlQBlrFkJn/aC7QHhh0BGb1+S1i9
0DcPMjtxVTfzBDBD6qSi3WlkQgr+GKSChxUqYCAQiQTBzQOrZj9V5AlK4uXSTj+T
E4hxGJRQO229qfFPe81C1SSTUhJ72Y+kcfFvagKRveHxRoJLas1sq82G9v42w5dt
I3rxLAQwrWfTuAQtnl3LrPYUvqIK473AS3J/TGlWv4fUJsyWr+F6Sg+jw21sIXoZ
GrQNSzqTh6+FubfuZmLmZw/64yX4TQ==
=l/kf
-----END PGP SIGNATURE-----

--4ybz0eHqAMeE41R+--

