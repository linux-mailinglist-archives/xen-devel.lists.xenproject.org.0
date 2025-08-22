Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 588DFB31C23
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 16:40:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090221.1447562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSve-00071Q-DJ; Fri, 22 Aug 2025 14:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090221.1447562; Fri, 22 Aug 2025 14:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSve-0006yc-AR; Fri, 22 Aug 2025 14:39:42 +0000
Received: by outflank-mailman (input) for mailman id 1090221;
 Fri, 22 Aug 2025 14:39:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RLTp=3C=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1upSvc-0006yQ-Bl
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 14:39:40 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d3fdc7a4-7f65-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 16:39:38 +0200 (CEST)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B8F7A7A0257;
 Fri, 22 Aug 2025 10:39:36 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Fri, 22 Aug 2025 10:39:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Aug 2025 10:39:35 -0400 (EDT)
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
X-Inumbo-ID: d3fdc7a4-7f65-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm3; t=1755873576; x=1755959976; bh=kd
	Xg7r5TeKLnxqQDTga7nMcsb3wgYffRcJfOgxqZuHI=; b=l0pzjSbnIg83PHap8/
	mUVFTGIpapYWMWdN2qdEzlsAoHrnNErXGYjwQsW6qEgekUTuNL9P6z5qiZuXYiac
	bAFKO1XRny7H4d5qx20XGkaFnLF19ljru/QliFSRMwHctnuFU3a6LpxhbYcbR7HG
	s6IbxIY1jAG6CH7YnAkMIW2qErkMPHA4FD71FmIhna7kB3YyYNr7yPq1en3x3yMv
	HgvE06KNA9U5KFtaewPdcEKUSd1gnXNlF8bwiCWzQo51wFq8wxKroZczCf3NmAnd
	OmQRWIF4iusgiFzvLfKvWgqQWUAT0cZCKoZsim2RkDYQc8EFauGFYlQDgv9cJV0E
	1OCA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1755873576; x=
	1755959976; bh=kdXg7r5TeKLnxqQDTga7nMcsb3wgYffRcJfOgxqZuHI=; b=f
	oBKvsahrK3g1+hNcAuJdGgBv/UgMyY0j3YhG3foxxRf/C0G5IsDaGd1C2YVr8PpR
	fYqN3AqP+hoVMbI6gY+2ge0TjmFN5YjxOElNANyASjNIw3hjPLxbBZhATCOJ0nYA
	aUz9ccDaZQdfAr6pjIvcoslxqQp+BCaQaQnOJ4ngTpJOQDirykevE8hFKxVQEa3H
	GnxP130X1T3/ii66nqki7umD/8TlVVEV5iO+8svp35zvwORZ8cZG9pe00EQIo08G
	08M5eRXoeT7KGya/KRurOLY0b/FP4aoB/lY3LIwFDZQ5AMfk3Up+nJZlr59Sn7Ux
	EO9VG1442zcMzPHYBVeNQ==
X-ME-Sender: <xms:KIGoaCZ7wm0p5lUeVvTeAqL4t2r5p0TWOJ_Jp_6_1mCFKPyuKda2zA>
    <xme:KIGoaA4mjZSqEL3vtGZvgphT6Mmec0hSafziNLUl8vy8Ftgy3AK2LxPSuLE4MwbEv
    dli-RQOjgYB7A>
X-ME-Received: <xmr:KIGoaDby0s6SBszHiR0BFLnFfFXaoRVJzkxw5iYuHfXS3DgJdASCWePeeUcofdF6GttC95tlFeIKf_2dVrdHiSr8-nSw8760B8c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieegtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepudfggfeileeu
    ueektdfhffelvdfhjeeffeehueeikefhleduleejjeelgeejudffnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmhhoug
    gvpehsmhhtphhouhhtpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigv
    nhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepjhhgrhhoshhssehsuhhsvgdrtghomh
    dprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrghdprhgtphht
    thhopeholhgvkhhsrghnughrpghthihshhgthhgvnhhkohesvghprghmrdgtohhmpdhrtg
    hpthhtohepsghorhhishdrohhsthhrohhvshhkhiesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:KIGoaPhhS-iFbnvewVDdWGGgpzwlPuSWLwM0Uk5XhvQkmbJ7iYLsGg>
    <xmx:KIGoaE_guQZFKaIodMmI2oYuN8lIHV4-E83GBj_lAYnI-BsoBkzX3w>
    <xmx:KIGoaKrDuH2OoXPp2jYdrSU4MMSWcIvP-AChxOLUz3UWKS63vDqt7A>
    <xmx:KIGoaMVMn0v_sFZYb2Oq1sXi6D1ydw7qJxKyOYaF8piW9ZO4gDqp7w>
    <xmx:KIGoaFN_oIjEvQTwJdi-WMTvpmgxDZcI_vK8JF_irBi5-lrk7XPAWG6U>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 22 Aug 2025 16:39:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: domU suspend issue - freeze processes failed - Linux 6.16
Message-ID: <aKiBJeqsYx_4Top5@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7NZxyHlq/zTlJ7mI"
Content-Disposition: inline


--7NZxyHlq/zTlJ7mI
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Aug 2025 16:39:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: domU suspend issue - freeze processes failed - Linux 6.16

Hi,

When suspending domU I get the following issue:

    Freezing user space processes
    Freezing user space processes failed after 20.004 seconds (1 tasks refu=
sing to freeze, wq_busy=3D0):
    task:xl              state:D stack:0     pid:466   tgid:466   ppid:1   =
   task_flags:0x400040 flags:0x00004006
    Call Trace:
     <TASK>
     __schedule+0x2f3/0x780
     schedule+0x27/0x80
     schedule_preempt_disabled+0x15/0x30
     __mutex_lock.constprop.0+0x49f/0x880
     unregister_xenbus_watch+0x216/0x230
     xenbus_write_watch+0xb9/0x220
     xenbus_file_write+0x131/0x1b0
     vfs_writev+0x26c/0x3d0
     ? do_writev+0xeb/0x110
     do_writev+0xeb/0x110
     do_syscall_64+0x84/0x2c0
     ? do_syscall_64+0x200/0x2c0
     ? generic_handle_irq+0x3f/0x60
     ? syscall_exit_work+0x108/0x140
     ? do_syscall_64+0x200/0x2c0
     ? __irq_exit_rcu+0x4c/0xe0
     entry_SYSCALL_64_after_hwframe+0x76/0x7e
    RIP: 0033:0x79b618138642
    RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
    RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b618138642
    RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 0000000000000014
    RBP: 00007fff9a193000 R08: 0000000000000000 R09: 0000000000000000
    R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000014
    R13: 00007fff9a193120 R14: 0000000000000003 R15: 0000000000000000
     </TASK>
    OOM killer enabled.
    Restarting tasks: Starting
    Restarting tasks: Done
    xen:manage: do_suspend: freeze processes failed -16

The process in question is `xl devd` daemon. It's a domU serving a
xenvif backend.

I noticed it on 6.16.1, but looking at earlier test logs I see it with
6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels weird given
seemingly no relevant changes between rc2 and rc6).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7NZxyHlq/zTlJ7mI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiogSUACgkQ24/THMrX
1yyBDQf/a5uCBB5JXsHfHfYq0z1m6pUmrF55CQ2lBlOnXJb+FDWAjfUL/1zpQRvM
0vHSZkqcPfm4RykqyPbEgShp7uUNlC9ioByTAZY0Sp+5I1S2n2Fp16QSqAxidQH/
LSx27zN5aShYdGRwd8uD1D+0fowN177q4U+Y0fievDx6EyTi98vPtYoGYxpfIp8b
Pr44Ei2HiudMgZ/aii9Z0Wey5LbttFAklvsMuwpmgAt+8ftwwCuPKalPVSzt0EWr
s+TRtLNzJLs4JwYYiFyax6UxsW2Ca66P4MLQHLL/9MjkF65BxvbuX9qjzZjKH5Ba
k1gnNgfQRo4WfdmEqQ9/WOEZ9xDzAg==
=z1Hm
-----END PGP SIGNATURE-----

--7NZxyHlq/zTlJ7mI--

