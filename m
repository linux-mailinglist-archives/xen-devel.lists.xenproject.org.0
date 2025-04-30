Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89251AA3FF0
	for <lists+xen-devel@lfdr.de>; Wed, 30 Apr 2025 03:00:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.973273.1361432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9vns-0004c0-5Y; Wed, 30 Apr 2025 01:00:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 973273.1361432; Wed, 30 Apr 2025 01:00:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9vns-0004aY-2m; Wed, 30 Apr 2025 01:00:00 +0000
Received: by outflank-mailman (input) for mailman id 973273;
 Wed, 30 Apr 2025 00:59:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JBcp=XQ=gmail.com=jandryuk@srs-se1.protection.inumbo.net>)
 id 1u9vnr-0004aS-6T
 for xen-devel@lists.xenproject.org; Wed, 30 Apr 2025 00:59:59 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f0c7f9f-255e-11f0-9eb4-5ba50f476ded;
 Wed, 30 Apr 2025 02:59:57 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-707d3c12574so3608677b3.1
 for <xen-devel@lists.xenproject.org>; Tue, 29 Apr 2025 17:59:57 -0700 (PDT)
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
X-Inumbo-ID: 6f0c7f9f-255e-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745974796; x=1746579596; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acOH5nfbZ+d3+OyynxWnsBin2PkLpg8dVfdF6VR2ZxA=;
        b=FpxItR3Jlyp2eNBX0uKx65pELgj3gbwQ/U5vv67yejLiIRgvZZFa05gcE67dJNPgVe
         XISZT2Ogee4tTEHp0XlNJnHFqhMCpjGLolFaBbTL9CW8zEvCjTN13+103wIiDStkz6eE
         6QtMLrxKCUJLs/JlpZ/7fgPGjFytN2J9FAYZEphuIl37iPD5cs00O99SPBF2hRNqZw0o
         w4QXx9/FcdTNOci/jgZ8Bacb/0vn/L0Ite7dhktRKTPENOzoy6SMfW6IxRuNb9Gixj3y
         IIvTJfDBNuHguXCVTFcN//93DpkilAiwhnnw4fUxDNV8pDIsJ7ohcwY61Xj4bNV1inE9
         VGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745974796; x=1746579596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acOH5nfbZ+d3+OyynxWnsBin2PkLpg8dVfdF6VR2ZxA=;
        b=C4j0xU5fYbEaQIs1OQF3uDN9Nm6bjf+5GFC8OmB9jNjglv24nNnUd2DhnkhqdFm3Jj
         HIdraONmSqxLXqUjl8+oW/KeYavPQGLWhUO31gcnzl0oolGf+eWVxHJrlgnxEPJXTIH8
         F0ZFZlfim1eRhK1wIicp9qd4Og7uX+gX5oX0VKwzvq/jVfN3IrASqNZZAKlWrgUFXUW5
         Zmn5QhI2KHVO8cRxpYugetpkVvkK8xz1OqN68YGhi0csWRfz5aTS3i9GitH59uCJ9hKO
         mLKTFSk2ZjrcvOUQaqA3z0bPPjLG/ounlUm4haQfkN6rcF16Ei5S6ICJQpq6ir+vUQWa
         XRCg==
X-Forwarded-Encrypted: i=1; AJvYcCVoXpvuiQZ1dsRFrxIVuCJRuuIl9qdpkeQkVkPgRKgOgRYhBCiQaLHjo4my1294+ySkCFKdheIKUoA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyzKMBdFOPuMXLX9RwFhwBiQR+8RvmgAHivp68AWio3sPFm9BKk
	3S0FNEunF72A3yX7pjTSRcSU1/9t98ne4TvS7bUF3JHyoDORrj4EnLFT/0VAqz8higTiDUFdNqV
	B1dfNMrKTKbniZyu46HOtAB3YAnXlwDNj
X-Gm-Gg: ASbGncsY7VutucfsQwdwag7jy9W4HM8ANCUzWA1hWsyqrt9Mh51Ryc0EQ8B55IW+Ody
	ENme00YE51xelzPVW5c42yBY6YT4RcKY8iWbRWg+LjJ1YRzpySBwFjPt/I+tlAFRc7FE/2zIPyk
	PyleBfIrDH89NK7aXj3SVG8NwTCRsnyg==
X-Google-Smtp-Source: AGHT+IHnLrZmkSmjRrOPN6hq9H6IGVw9X2TtGhUvckF3sgIARHuGKzAdUJ11nvZxmrrSMWH/4LBeBvsNfFdUlqK1qRE=
X-Received: by 2002:a05:690c:748a:b0:708:7099:c544 with SMTP id
 00721157ae682-708ad0a1d07mr12938207b3.8.1745974796230; Tue, 29 Apr 2025
 17:59:56 -0700 (PDT)
MIME-Version: 1.0
References: <ZO0WrR5J0xuwDIxW@mail-itl> <ZTUuRj6e5x5xFVqb@mail-itl>
 <ZgGjf3hpLHXXtb8z@mail-itl> <0f8c0e27-e60d-4e64-bc8a-6cb407c67ab2@xen.org>
 <ZlpTwbmDjNLkCNgH@mail-itl> <aAjgGKRAW95BnTiK@mail-itl>
In-Reply-To: <aAjgGKRAW95BnTiK@mail-itl>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 29 Apr 2025 20:59:45 -0400
X-Gm-Features: ATxdqUF_jNDd0mbtrCs0Oy_iFD5PTwFKJLBa-4O38Q5Cb4cRi8GuUKEKNGdjwRg
Message-ID: <CAKf6xpu7=2O96XK88WL02c-4po3qX-4P4i=2JbD2=o2JcM+_EQ@mail.gmail.com>
Subject: Re: NULL pointer dereference in xenbus_thread->...
To: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Julien Grall <julien@xen.org>, xen-devel <xen-devel@lists.xenproject.org>, 
	Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marek,

On Wed, Apr 23, 2025 at 8:42=E2=80=AFAM Marek Marczykowski-G=C3=B3recki
<marmarek@invisiblethingslab.com> wrote:
>
> On Sat, Jun 01, 2024 at 12:48:33AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Tue, Mar 26, 2024 at 11:00:50AM +0000, Julien Grall wrote:
> > > Hi Marek,
> > >
> > > +Juergen for visibility
> > >
> > > When sending a bug report, I would suggest to CC relevant people as
> > > otherwise it can get lost (not may people monitors Xen devel if they =
are not
> > > CCed).
> > >
> > > Cheers,
> > >
> > > On 25/03/2024 16:17, Marek Marczykowski-G=C3=B3recki wrote:
> > > > On Sun, Oct 22, 2023 at 04:14:30PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Mon, Aug 28, 2023 at 11:50:36PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > Hi,
> > > > > >
> > > > > > I've noticed in Qubes's CI failure like this:
> > > > > >
> > > > > > [  871.271292] BUG: kernel NULL pointer dereference, address: 0=
000000000000000
> > > > > > [  871.275290] #PF: supervisor read access in kernel mode
> > > > > > [  871.277282] #PF: error_code(0x0000) - not-present page
> > > > > > [  871.279182] PGD 106fdb067 P4D 106fdb067 PUD 106fdc067 PMD 0
> > > > > > [  871.281071] Oops: 0000 [#1] PREEMPT SMP NOPTI
> > > > > > [  871.282698] CPU: 1 PID: 28 Comm: xenbus Not tainted 6.1.43-1=
.qubes.fc37.x86_64 #1
> > > > > > [  871.285222] Hardware name: QEMU Standard PC (i440FX + PIIX, =
1996), BIOS rel-1.16.0-0-gd239552-rebuilt.opensuse.org 04/01/2014
> > > > > > [  871.288883] RIP: e030:__wake_up_common+0x4c/0x180
> > > > > > [  871.292838] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 =
04 0f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 =
c3 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 4=
0
> > > > > > [  871.299776] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > > > > > [  871.301656] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX:=
 0000000000000000
> > > > > > [  871.304255] RDX: 0000000000000001 RSI: 0000000000000003 RDI:=
 ffff88810541ce90
> > > > > > [  871.306714] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09:=
 ffffc900400f7e68
> > > > > > [  871.309937] R10: 0000000000007ff0 R11: ffff888100ad3000 R12:=
 ffffc900400f7e68
> > > > > > [  871.312326] R13: 0000000000000000 R14: 0000000000000000 R15:=
 0000000000000000
> > > > > > [  871.314647] FS:  0000000000000000(0000) GS:ffff88813ff00000(=
0000) knlGS:0000000000000000
> > > > > > [  871.317677] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> > > > > > [  871.319644] CR2: 0000000000000000 CR3: 00000001067fe000 CR4:=
 0000000000040660
> > > > > > [  871.321973] Call Trace:
> > > > > > [  871.322782]  <TASK>
> > > > > > [  871.323494]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > > > [  871.324901]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > > > [  871.326310]  ? show_trace_log_lvl+0x1d3/0x2ef
> > > > > > [  871.327721]  ? __wake_up_common_lock+0x82/0xd0
> > > > > > [  871.329147]  ? __die_body.cold+0x8/0xd
> > > > > > [  871.330378]  ? page_fault_oops+0x163/0x1a0
> > > > > > [  871.331691]  ? exc_page_fault+0x70/0x170
> > > > > > [  871.332946]  ? asm_exc_page_fault+0x22/0x30
> > > > > > [  871.334454]  ? __wake_up_common+0x4c/0x180
> > > > > > [  871.335777]  __wake_up_common_lock+0x82/0xd0
> > > > > > [  871.337183]  ? process_writes+0x240/0x240
> > > > > > [  871.338461]  process_msg+0x18e/0x2f0
> > > > > > [  871.339627]  xenbus_thread+0x165/0x1c0
> > > > > > [  871.340830]  ? cpuusage_read+0x10/0x10
> > > > > > [  871.342032]  kthread+0xe9/0x110
> > > > > > [  871.343317]  ? kthread_complete_and_exit+0x20/0x20
> > > > > > [  871.345020]  ret_from_fork+0x22/0x30
> > > > > > [  871.346239]  </TASK>
> > > > > > [  871.347060] Modules linked in: snd_hda_codec_generic ledtrig=
_audio snd_hda_intel snd_intel_dspcfg snd_intel_sdw_acpi snd_hda_codec snd_=
hda_core snd_hwdep snd_seq snd_seq_device joydev snd_pcm intel_rapl_msr ppd=
ev intel_rapl_common snd_timer pcspkr e1000e snd soundcore i2c_piix4 parpor=
t_pc parport loop fuse xenfs dm_crypt crct10dif_pclmul crc32_pclmul crc32c_=
intel polyval_clmulni polyval_generic floppy ghash_clmulni_intel sha512_sss=
e3 serio_raw virtio_scsi virtio_console bochs xhci_pci xhci_pci_renesas xhc=
i_hcd qemu_fw_cfg drm_vram_helper drm_ttm_helper ttm ata_generic pata_acpi =
xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn scsi=
_dh_rdac scsi_dh_emc scsi_dh_alua uinput dm_multipath
> > > > > > [  871.368892] CR2: 0000000000000000
> > > > > > [  871.370160] ---[ end trace 0000000000000000 ]---
> > > > > > [  871.371719] RIP: e030:__wake_up_common+0x4c/0x180
> > > > > > [  871.373273] Code: 24 0c 89 4c 24 08 4d 85 c9 74 0a 41 f6 01 =
04 0f 85 a3 00 00 00 48 8b 43 08 4c 8d 40 e8 48 83 c3 08 49 8d 40 18 48 39 =
c3 74 5b <49> 8b 40 18 31 ed 4c 8d 70 e8 45 8b 28 41 f6 c5 04 75 5f 49 8b 4=
0
> > > > > > [  871.379866] RSP: e02b:ffffc900400f7e10 EFLAGS: 00010082
> > > > > > [  871.381689] RAX: 0000000000000000 RBX: ffff88810541ce98 RCX:=
 0000000000000000
> > > > > > [  871.383971] RDX: 0000000000000001 RSI: 0000000000000003 RDI:=
 ffff88810541ce90
> > > > > > [  871.386235] RBP: ffffc900400f0280 R08: ffffffffffffffe8 R09:=
 ffffc900400f7e68
> > > > > > [  871.388521] R10: 0000000000007ff0 R11: ffff888100ad3000 R12:=
 ffffc900400f7e68
> > > > > > [  871.390789] R13: 0000000000000000 R14: 0000000000000000 R15:=
 0000000000000000
> > > > > > [  871.393101] FS:  0000000000000000(0000) GS:ffff88813ff00000(=
0000) knlGS:0000000000000000
> > > > > > [  871.395671] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080=
050033
> > > > > > [  871.397863] CR2: 0000000000000000 CR3: 00000001067fe000 CR4:=
 0000000000040660
> > > > > > [  871.400441] Kernel panic - not syncing: Fatal exception
> > > > > > [  871.402171] Kernel Offset: disabled
> > > > > > (XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
> > > > > >
> > > > > > It isn't the first time I see similar crash, but I can't really
> > > > > > reproduce it reliably. Restarted test usually passes.
> > > > > > Note this is Xen nested in KVM, so it could very well be some o=
ddity
> > > > > > about nested virt, although looking at the stack trace, it's un=
likely
> > > > > > and more likely some race condition hit only on slower system.
> > > > >
> > > > > Recently I've got the same crash on a real system in domU too. An=
d also
> > > > > on nested on newer kernel 6.1.57 (here it happened in dom0). So, =
this is
> > > > > still an issue and affects not only nested case :/
> > > > >
> > > > > > Unfortunately I don't have symbols for this kernel handy, but t=
here is a
> > > > > > single wake_up() call in process_writes(), so it shouldn't be a=
n issue.
> > > > > >
> > > > > > Any ideas?
> > > > > >
> > > > > > Full log at https://openqa.qubes-os.org/tests/80779/logfile?fil=
ename=3Dserial0.txt
> > > > >
> > > > > More links at https://github.com/QubesOS/qubes-issues/issues/8638=
,
> > > > > including more recent stack trace.
> > > >
> > > > Happens on 6.1.75 too (new stack trace I've added to the issue abov=
e,
> > > > but it's pretty similar).
> >
> > Recently I've got a report from another user about similar issue, on
> > 6.6.29 this time. I also still encounter this issue once a month or so,
> > but the user claims they get it much more often:
> > https://github.com/QubesOS/qubes-issues/issues/8638#issuecomment-213541=
9896
> > The extra conditions reported by the user are:
> > - old AMD system (KGPE-D16 with Opteron 6282 SE) requiring
> >   `spec-ctrl=3Dibpb-entry=3Dno-pv` to remain usable
> > - Whonix domU, which has a bunch of sysctl parameters changed, listed
> >   at:
> >   - https://github.com/Kicksecure/security-misc
> >   - https://github.com/Kicksecure/security-misc/blob/master/usr/lib/sys=
ctl.d/990-security-misc.conf
> >   (unsure which are relevant, maybe `vm.swappiness=3D1`?)
>
> I've got some more report confirming it's still happening on Linux
> 6.12.18. Is there anything I can do to help fixing this? Maybe ask users
> to enable some extra logging?

Have you been able to capture a crash with debug symbols and run it
through scripts/decode_stacktrace.sh?

I'm curious what process_msg+0x18e/0x2f0 is.  process_writes() has a
direct call to wake_up(), but process_msg() calling req->cb(req) may
be xs_wake_up() which is a thin wrapper over wake_up().

They make me wonder if req has been free()ed and at least partially
zero-ed, but it still has wake_up() called.  The call stack here is
reminiscent of the one here
https://lore.kernel.org/xen-devel/Z_lJTyVipJJEpWg2@mail-itl/ and the
unexpected value there is 0.

I haven't actually figured out a scenario where req would be kfree()ed
early.  But the handling of kfree(req) being split between
process_msg/writes() and xs_wait_for_reply() makes me a little uneasy.

Regards,
Jason

