Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E655A72E62
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 12:03:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.929000.1331633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txl0X-0008BR-RQ; Thu, 27 Mar 2025 11:02:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 929000.1331633; Thu, 27 Mar 2025 11:02:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txl0X-00089z-OX; Thu, 27 Mar 2025 11:02:45 +0000
Received: by outflank-mailman (input) for mailman id 929000;
 Thu, 27 Mar 2025 11:02:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AFj9=WO=kernel.org=rafael@srs-se1.protection.inumbo.net>)
 id 1txl0V-00089t-T5
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 11:02:43 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fe8c5c3f-0afa-11f0-9ffa-bf95429c2676;
 Thu, 27 Mar 2025 12:02:38 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A036A4267D
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 10:57:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8BD4C4CEDD
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 11:02:36 +0000 (UTC)
Received: by mail-ot1-f50.google.com with SMTP id
 46e09a7af769-72c40235c34so277926a34.3
 for <xen-devel@lists.xenproject.org>; Thu, 27 Mar 2025 04:02:36 -0700 (PDT)
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
X-Inumbo-ID: fe8c5c3f-0afa-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743073356;
	bh=KycBfGkDC/ffdrmTGu72+/Q3uISnruqLt7VmIcVAtfc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZxwZiJAndOQzuhMcOTxzCVMUjBOiVwIHGk99CbSalXhzvGrJuH2RZDG0DxXhazyMx
	 cRimSXk6TGJrLWxLqm3lopy/8erGiflrxxsvrAlv9HTBe5p/UY1FClc1HPGzIffBSf
	 cPt7h90iOSumRCuB6RVCyVpqQu/XCSBaeT1y5ZDU2flDaFb8bxwipqwYc69hNWC5wK
	 T5LKCYXM3tBp/TWA5E76gTTcldPPB8NT/mpK/5ZgQ6IikUVhc5yDaVw6MBr2fqj6kj
	 YekOfDn2R9ADtqUpadiCl60XOXVNqyATL5/SOlMkwCZVur056RSmueUjUEyy10i1ml
	 DQ6a7GGRjT2aw==
X-Forwarded-Encrypted: i=1; AJvYcCWbltMHg9ckAEEWJPJO5H+syzYuiXklJq94eUsAK7u6uKFwKVx2oQe9OMbnAosuvsnrZy9uXvAqciQ=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwpibjG592DPUqYmjt9CiK2hcodQuhPfRNymLK7qvDF6jZoNs8z
	9uppV/SNy1hSf26Qw/aXm4jpRyYZYjXPe9+RoCjoF8AXxCkAKkxn3BjfUw9cDHIvqYxWLYFWsuM
	+EZRvJUIrYZVLBGXx220kZspEi00=
X-Google-Smtp-Source: AGHT+IHe8auTSWvnicaZa+CBt1EQ35ftbxVUkmn26GHSu5ft6JmVevRgocMBJwcwwlMJ8HrY4FOwUzBfnAIOpQw1jRA=
X-Received: by 2002:a05:6870:2012:b0:29f:97af:a1a0 with SMTP id
 586e51a60fabf-2c8481b2dfamr1388442fac.24.1743073355458; Thu, 27 Mar 2025
 04:02:35 -0700 (PDT)
MIME-Version: 1.0
References: <Z-ShAR59cTow0KcR@mail-itl> <3796f2d9-738f-4cdf-a4a2-61c4aa99c310@suse.com>
In-Reply-To: <3796f2d9-738f-4cdf-a4a2-61c4aa99c310@suse.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Mar 2025 12:02:24 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0jn_gv92ywZiTZDdGN3Z+GNW0BJ5=kBD=8MpQ0Pt+y8TQ@mail.gmail.com>
X-Gm-Features: AQ5f1JrRebIXAiv4lIfOtz-NN0gA4kEIc0Bg2UKWbFdxXV2wbKoCesQt-GE76b0
Message-ID: <CAJZ5v0jn_gv92ywZiTZDdGN3Z+GNW0BJ5=kBD=8MpQ0Pt+y8TQ@mail.gmail.com>
Subject: Re: NULL pointer dereference in cpufreq_update_limits(?) under Xen PV
 dom0 - regression in 6.13
To: Jan Beulich <jbeulich@suse.com>, 
	=?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, xen-devel <xen-devel@lists.xenproject.org>, 
	Juergen Gross <jgross@suse.com>, regressions@lists.linux.dev, 
	Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: multipart/mixed; boundary="0000000000002b914c063150e400"

--0000000000002b914c063150e400
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 27, 2025 at 11:14=E2=80=AFAM Jan Beulich <jbeulich@suse.com> wr=
ote:
>
> On 27.03.2025 01:51, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >
> > I've got a report[1] that 6.13.6 crashes as listed below. It worked fin=
e in
> > 6.12.11. We've tried few simple things to narrow the problem down, but
> > without much success.
> >
> > This is running in Xen 4.17.5, PV dom0, which probably is relevant here=
.
> > This is running on AMD Ryzen 9 7950X3D, with ASRock X670E Taichi
> > motherboard.
> > There are few more details in the original report (link below).
> >
> > The kernel package (including its config saved into /boot) is here:
> > https://yum.qubes-os.org/r4.2/current/host/fc37/rpm/kernel-latest-6.13.=
6-1.qubes.fc37.x86_64.rpm
> > https://yum.qubes-os.org/r4.2/current/host/fc37/rpm/kernel-latest-modul=
es-6.13.6-1.qubes.fc37.x86_64.rpm
> >
> > The crash message:
> > [    9.367048] BUG: kernel NULL pointer dereference, address: 000000000=
0000070
> > [    9.368251] #PF: supervisor read access in kernel mode
> > [    9.369273] #PF: error_code(0x0000) - not-present page
> > [    9.370346] PGD 0 P4D 0
> > [    9.371222] Oops: Oops: 0000 [#1] PREEMPT SMP NOPTI
> > [    9.372114] CPU: 0 UID: 0 PID: 128 Comm: kworker/0:2 Not tainted 6.1=
3.6-1.qubes.fc37.x86_64 #1
> > [    9.373184] Hardware name: ASRock X670E Taichi/X670E Taichi, BIOS 3.=
20 02/21/2025
> > [    9.374183] Workqueue: kacpi_notify acpi_os_execute_deferred
> > [    9.375124] RIP: e030:cpufreq_update_limits+0x10/0x30
> > [    9.375840] Code: 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 05 98 e4 21 02=
 <48> 8b 40 70 48 85 c0 74 06 e9 a2 36 38 00 cc e9 ec fe ff ff 66 66
> > [    9.377009] RSP: e02b:ffffc9004058be28 EFLAGS: 00010246
> > [    9.377667] RAX: 0000000000000000 RBX: ffff888005bf4800 RCX: ffff888=
05d635fa8
> > [    9.378415] RDX: ffff888005bf4800 RSI: 0000000000000085 RDI: 0000000=
000000000
> > [    9.379127] RBP: ffff888005cd7800 R08: 0000000000000000 R09: 8080808=
080808080
> > [    9.379887] R10: ffff88800391abc0 R11: fefefefefefefeff R12: ffff888=
004e8aa00
> > [    9.380669] R13: ffff88805d635f80 R14: ffff888004e8aa15 R15: ffff888=
0059baf00
> > [    9.381514] FS:  0000000000000000(0000) GS:ffff88805d600000(0000) kn=
lGS:0000000000000000
> > [    9.382345] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    9.383045] CR2: 0000000000000070 CR3: 000000000202c000 CR4: 0000000=
000050660
> > [    9.383786] Call Trace:
> > [    9.384335]  <TASK>
> > [    9.384886]  ? __die+0x23/0x70
> > [    9.385456]  ? page_fault_oops+0x95/0x190
> > [    9.386036]  ? exc_page_fault+0x76/0x190
> > [    9.386636]  ? asm_exc_page_fault+0x26/0x30
> > [    9.387215]  ? cpufreq_update_limits+0x10/0x30
> > [    9.387805]  acpi_processor_notify.part.0+0x79/0x150
> > [    9.388402]  acpi_ev_notify_dispatch+0x4b/0x80
> > [    9.389013]  acpi_os_execute_deferred+0x1a/0x30
> > [    9.389610]  process_one_work+0x186/0x3b0
> > [    9.390205]  worker_thread+0x251/0x360
> > [    9.390765]  ? srso_alias_return_thunk+0x5/0xfbef5
> > [    9.391376]  ? __pfx_worker_thread+0x10/0x10
> > [    9.391957]  kthread+0xd2/0x100
> > [    9.392493]  ? __pfx_kthread+0x10/0x10
> > [    9.393043]  ret_from_fork+0x34/0x50
> > [    9.393575]  ? __pfx_kthread+0x10/0x10
> > [    9.394090]  ret_from_fork_asm+0x1a/0x30
> > [    9.394621]  </TASK>
> > [    9.395106] Modules linked in: gpio_generic amd_3d_vcache acpi_pad(-=
) loop fuse xenfs dm_thin_pool dm_persistent_data dm_bio_prison amdgpu amdx=
cp i2c_algo_bit drm_ttm_helper ttm crct10dif_pclmul drm_exec crc32_pclmul g=
pu_sched
> > crc32c_intel drm_suballoc_helper polyval_clmulni drm_panel_backlight_qu=
irks polyval_generic drm_buddy ghash_clmulni_intel sha512_ssse3 drm_display=
_helper sha256_ssse3 sha1_ssse3 xhci_pci cec nvme sp5100_tco xhci_hcd nvme_=
core nvme_auth
> > video wmi xen_acpi_processor xen_privcmd xen_pciback xen_blkback xen_gn=
talloc xen_gntdev xen_evtchn scsi_dh_rdac scsi_dh_emc scsi_dh_alua uinput d=
m_multipath
> > [    9.398698] CR2: 0000000000000070
> > [    9.399266] ---[ end trace 0000000000000000 ]---
> > [    9.399880] RIP: e030:cpufreq_update_limits+0x10/0x30
> > [    9.400528] Code: 84 00 00 00 00 00 0f 1f 40 00 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 05 98 e4 21 02=
 <48> 8b 40 70 48 85 c0 74 06 e9 a2 36 38 00 cc e9 ec fe ff ff 66 66
> > [    9.401673] RSP: e02b:ffffc9004058be28 EFLAGS: 00010246
> > [    9.402316] RAX: 0000000000000000 RBX: ffff888005bf4800 RCX: ffff888=
05d635fa8
> > [    9.403060] RDX: ffff888005bf4800 RSI: 0000000000000085 RDI: 0000000=
000000000
> > [    9.403819] RBP: ffff888005cd7800 R08: 0000000000000000 R09: 8080808=
080808080
> > [    9.404581] R10: ffff88800391abc0 R11: fefefefefefefeff R12: ffff888=
004e8aa00
> > [    9.405332] R13: ffff88805d635f80 R14: ffff888004e8aa15 R15: ffff888=
0059baf00
> > [    9.406063] FS:  0000000000000000(0000) GS:ffff88805d600000(0000) kn=
lGS:0000000000000000
> > [    9.406830] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    9.407561] CR2: 0000000000000070 CR3: 000000000202c000 CR4: 0000000=
000050660
> > [    9.408318] Kernel panic - not syncing: Fatal exception
> > [    9.409022] Kernel Offset: disabled
> > (XEN) Hardware Dom0 crashed: 'noreboot' set - not rebooting.
> >
> > Looking at the call trace, it's likely related to ACPI, and Xen too, so
> > I'm adding relevant lists too.
> >
> > Any ideas?
> >
> > #regzbot introduced: v6.12.11..v6.13.6
>
> That code looks to have been introduced for 6.9, so I wonder if so far yo=
u merely
> were lucky not to have observed any "highest perf changed" notification. =
See
> 9c4a13a08a9b ("ACPI: cpufreq: Add highest perf change notification"), whi=
ch imo
> merely adds a 2nd path to a pre-existing problem: cpufreq_update_limits()=
 assumes
> that cpufreq_driver is non-NULL, and only checks cpufreq_driver->update_l=
imits.
> But of course the assumption there may be legitimate, and it's logic else=
where
> which is or has become flawed.

cpufreq_update_limits() needs to ensure that the driver is there.

The attached patch should address this issue, Marek please verify.

--0000000000002b914c063150e400
Content-Type: text/x-patch; charset="US-ASCII"; name="cpufreq-update-limits-fix.patch"
Content-Disposition: attachment; filename="cpufreq-update-limits-fix.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_m8r8tx2z0>
X-Attachment-Id: f_m8r8tx2z0

LS0tCiBkcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jIHwgICAgOCArKysrKysrKwogMSBmaWxlIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKQoKLS0tIGEvZHJpdmVycy9jcHVmcmVxL2NwdWZyZXEuYwor
KysgYi9kcml2ZXJzL2NwdWZyZXEvY3B1ZnJlcS5jCkBAIC0yNzgxLDEwICsyNzgxLDE4IEBACiAg
Ki8KIHZvaWQgY3B1ZnJlcV91cGRhdGVfbGltaXRzKHVuc2lnbmVkIGludCBjcHUpCiB7CisJc3Ry
dWN0IGNwdWZyZXFfcG9saWN5ICpwb2xpY3k7CisKKwlwb2xpY3kgPSBjcHVmcmVxX2NwdV9nZXQo
Y3B1KTsKKwlpZiAoIXBvbGljeSkKKwkJcmV0dXJuOworCiAJaWYgKGNwdWZyZXFfZHJpdmVyLT51
cGRhdGVfbGltaXRzKQogCQljcHVmcmVxX2RyaXZlci0+dXBkYXRlX2xpbWl0cyhjcHUpOwogCWVs
c2UKIAkJY3B1ZnJlcV91cGRhdGVfcG9saWN5KGNwdSk7CisKKwljcHVmcmVxX2NwdV9wdXQocG9s
aWN5KTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGNwdWZyZXFfdXBkYXRlX2xpbWl0cyk7CiAK
--0000000000002b914c063150e400--

