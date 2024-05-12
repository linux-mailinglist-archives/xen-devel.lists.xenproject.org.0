Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B708C34DE
	for <lists+xen-devel@lfdr.de>; Sun, 12 May 2024 04:17:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720484.1123513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5ylO-0005fE-In; Sun, 12 May 2024 02:16:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720484.1123513; Sun, 12 May 2024 02:16:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5ylO-0005dF-G0; Sun, 12 May 2024 02:16:34 +0000
Received: by outflank-mailman (input) for mailman id 720484;
 Sun, 12 May 2024 02:16:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UWbV=MP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s5ylN-0005d9-Au
 for xen-devel@lists.xenproject.org; Sun, 12 May 2024 02:16:33 +0000
Received: from wfhigh2-smtp.messagingengine.com
 (wfhigh2-smtp.messagingengine.com [64.147.123.153])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2ad942b-1005-11ef-909d-e314d9c70b13;
 Sun, 12 May 2024 04:16:30 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfhigh.west.internal (Postfix) with ESMTP id 110D51800154
 for <xen-devel@lists.xenproject.org>; Sat, 11 May 2024 22:16:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Sat, 11 May 2024 22:16:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Sat, 11 May 2024 22:16:23 -0400 (EDT)
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
X-Inumbo-ID: a2ad942b-1005-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1715480184; x=1715566584; bh=BGbSvIgpus
	qPh4LxVAhAAPKBQ9harTdkfHymlMQv7vQ=; b=2ZY0YASdmxee2YuWIcHO1h5wc8
	rJla1BjcSJYgGmPTZZ4kAtMjFfWtCWLkkdyvKTjk/N63HlLfsgf2R2aMKVsrKk0v
	R6TO2YYBCo2alpezppT74DQY7WNKH2OhkKxsGbqHu3Ytyrj5ew2ke1F6NP4Nj66T
	iBNgH9aC0yFmyIjYQkCrA8VytH6fRXNHdE4t/mJKRLGzQPU60ngLi+xMnMJycJ6v
	zIUsQIbsWVkMQ00I/+v5BwVqdv10KI/lihNplGYpTH7JKR6PGr58qsV4y9IUjc5c
	G2bS2cOseDDisA+H0XSr3U/vnh2cva/XfpNTB3kl1rKcRo0PtHH+BarMKyXg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1715480184; x=1715566584; bh=BGbSvIgpusqPh4LxVAhAAPKBQ9harTdkfHy
	mlMQv7vQ=; b=Z9HfXRMBoXxjvxXXiAyUXB6IjmKEAiQQZKPfGV+jW2Fw0HgmZkP
	6jJ2e1sxoxjqu/7vd518nQolxzRQDMXGm1xLNeIeyQE5x82o5kR4s04oL2+lM9R4
	bA5lfZWdXNZfn2KVzZbicsLbJ4u3eyDAmHc8vZUk+qeJJfLL0IdtIQYjrcb7UrYL
	CgKDh+zjAPYjVrLhLZ7KL4SvydEyFBi+93gIGC6X1ik5+vpHSrUKl3nYnPtLqoeF
	RxmK/1r/vOVnDVO+EIlhlUZmYHdZVLt/SU+v+abmIDKp6RTNO+m9c/TyDPrBAkQZ
	Hmyei65zTxhEwweOjnEOpa7cRieKsBcCRiQ==
X-ME-Sender: <xms:eCZAZoo9dQu48THlg7L5Mq8QFMb3gDMpoKba-YQhtSxZQxFjIiZoRg>
    <xme:eCZAZupLY-WUee0w6b6FM5nAt46PI6r2YiYo5MJUKUpTSVmGd73JJuCJwk0L2TB8s
    aB8N_dX0I4KxQ>
X-ME-Received: <xmr:eCZAZtPmk8DhW3zo7h6wxyJP5KXxE-acpm4KeOk0OnwXNESfT1aG1H-W0Y7UpJIsV5ZFBFC9pt4uP7Aad0VP3DFVFDB15Gm2Xw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdeguddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepteduteeiudevkeegvefhtdekhfelgffhhedukedvvdeuuddv
    jeehvddtieehudfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:eCZAZv5FwulNRyhWrZQJ0YMCKB-YM8rYX-1BZjN88XKBPov6YqGHVA>
    <xmx:eCZAZn7FBRmfoHTdjQcHyEG7sgjKZaLeTknVFmEB6P9Z_mYknwOLCQ>
    <xmx:eCZAZvjm8quJUoskxxkahEEWJJXN7PhEDbtFUCMfpZrWrmGC9RNFmg>
    <xmx:eCZAZh65LOHE51jhuSgmX-L9X5TcNjyAzd2kJrbaIy_VIB5JmT8Wzg>
    <xmx:eCZAZkjrOUGPpLTdPYRJQBksJnQfPTZFT9UraI0iNusxKJyIC3UHFL8N>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 12 May 2024 04:16:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux HVM fails to start with PANIC: early exception 0x00 IP
 0010:clear_page_orig+0x12/0x40 error 0
Message-ID: <ZkAmdiHI-DfUMiOV@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="J6SyACfGTN/1W6hE"
Content-Disposition: inline


--J6SyACfGTN/1W6hE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 May 2024 04:16:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux HVM fails to start with PANIC: early exception 0x00 IP
 0010:clear_page_orig+0x12/0x40 error 0

Hi,

I've got a report[1] that after some update Linux HVM fails to start with t=
he
error as in the subject. It looks to be caused by some change between
Xen 4.17.3 and 4.17.4. Here the failure is on Linux 6.6.25 (both dom0
and domU), but the 6.1.62 that worked with older Xen before, now fails
too. The full error (logged via earlyprintk=3Dxen) is:

    [    0.009500] Using GB pages for direct mapping
    PANIC: early exception 0x00 IP 10:ffffffffb01c32e2 error 0 cr2 0xffffa0=
8649801000
    [    0.009606] CPU: 0 PID: 0 Comm: swapper Not tainted 6.6.25-1.qubes.f=
c37.x86_64 #1
    [    0.009665] Hardware name: Xen HVM domU, BIOS 4.17.4 04/26/2024
    [    0.009710] RIP: 0010:clear_page_orig+0x12/0x40
    [    0.009766] Code: 84 00 00 00 00 00 66 90 90 90 90 90 90 90 90 90 90=
 90 90 90 90 90 90 90 f3 0f 1e fa 31 c0 b9 40 00 00 00 0f 1f 44 00 00 ff c9=
 <48> 89 07 48 89 47 08 48 89 47 10 48 89 47 18 48 89 47 20 48 89 47
    [    0.009862] RSP: 0000:ffffffffb0e03d58 EFLAGS: 00010016 ORIG_RAX: 00=
00000000000000
    [    0.009915] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000=
00000003f
    [    0.009967] RDX: 0000000000009801 RSI: 0000000000000000 RDI: ffffa08=
649801000
    [    0.010015] RBP: 0000000000000001 R08: 0000000000000001 R09: 6b7f283=
562d74b16
    [    0.010063] R10: 0000000000000000 R11: 0000000000000000 R12: 0000000=
000000001
    [    0.010112] R13: 0000000000000000 R14: ffffffffb0e22a08 R15: ffffa08=
640000000
    [    0.010161] FS:  0000000000000000(0000) GS:ffffffffb16ea000(0000) kn=
lGS:0000000000000000
    [    0.010214] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    [    0.010257] CR2: ffffa08649801000 CR3: 0000000008e80000 CR4: 0000000=
0000000b0
    [    0.010310] Call Trace:
    [    0.010341]  <TASK>
    [    0.010372]  ? early_fixup_exception+0xf7/0x190
    [    0.010416]  ? early_idt_handler_common+0x2f/0x3a
    [    0.010460]  ? clear_page_orig+0x12/0x40
    [    0.010501]  ? alloc_low_pages+0xeb/0x150
    [    0.010541]  ? __kernel_physical_mapping_init+0x1d2/0x630
    [    0.010588]  ? init_memory_mapping+0x83/0x160
    [    0.010631]  ? init_mem_mapping+0x9a/0x460
    [    0.010669]  ? memblock_reserve+0x6d/0xf0
    [    0.010709]  ? setup_arch+0x796/0xf90
    [    0.010748]  ? start_kernel+0x63/0x420
    [    0.010787]  ? x86_64_start_reservations+0x18/0x30
    [    0.010828]  ? x86_64_start_kernel+0x96/0xa0
    [    0.010868]  ? secondary_startup_64_no_verify+0x18f/0x19b
    [    0.010918]  </TASK>

I'm pretty sure the exception 0 is misleading here, I don't see how it
could be #DE.

More logs (including full hypervisor log) are attached to the linked
issue.

This is on HP 240 g7, and my educated guess is it's Intel Celeron N4020
CPU. I cannot reproduce the issue on different hardware.

PVH domains seems to work.

Any ideas what could have happened here?

[1] https://github.com/QubesOS/qubes-issues/issues/9217

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--J6SyACfGTN/1W6hE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmZAJnYACgkQ24/THMrX
1yxdpwf/bGl6gTGNA66alI8MrlzcQQm4jb9JZFQRY9yKJITI7/RbhJOv13tr4TaC
pv9udiaMzYkflGkUEC/9yyUq2EGV9G+6yK2GQ7e9gZYL7642pBiabx5OjNkLk8eo
yOsKUPe6HAYF0BBEURLL8PMrBua/+LN5qMI4XfrenmPzUdwhOcJ8DO1hfU/ueO68
Rjt9zSG4N1L8TRmXy0zxc1uxiIZpz5nzCGCLRJNbo1X36CZ7wQd2VW0mIakysSJk
/j49P1F24zNWD9R5mxM9NZFwVwvxQhpqjkeR2ieXRea/rDuNBvkVxPHpWzpUsrAe
chKFaq+3pOZCC30Hztg79uZ97EKUoA==
=9pf0
-----END PGP SIGNATURE-----

--J6SyACfGTN/1W6hE--

