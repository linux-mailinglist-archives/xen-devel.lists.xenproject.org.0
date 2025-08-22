Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA57B32260
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 20:43:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090428.1447660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upWio-0007uq-Pa; Fri, 22 Aug 2025 18:42:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090428.1447660; Fri, 22 Aug 2025 18:42:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upWio-0007tE-Lt; Fri, 22 Aug 2025 18:42:42 +0000
Received: by outflank-mailman (input) for mailman id 1090428;
 Fri, 22 Aug 2025 18:42:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RLTp=3C=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1upWin-0007t8-8n
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 18:42:41 +0000
Received: from fout-b1-smtp.messagingengine.com
 (fout-b1-smtp.messagingengine.com [202.12.124.144])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c451909e-7f87-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 20:42:34 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id 591DA1D0015B;
 Fri, 22 Aug 2025 14:42:33 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Fri, 22 Aug 2025 14:42:33 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Aug 2025 14:42:31 -0400 (EDT)
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
X-Inumbo-ID: c451909e-7f87-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755888153;
	 x=1755974553; bh=VVGrmRlRJJSa4oJiuTW1lYsVWBBaILvOMPtNofRG1JM=; b=
	rwfoBOr0AWQxEybwJZfDflhEgufm9hQGxbOG203JTQnwS6egygcn27doVbXqCBRN
	owvrS4h1tvXcliT06GFI67yWXamPgmt1oQIEkJIozncUXYkpyccebuul5htv3Q4y
	pqkdFf67O6GdQrYFK8RefwF1lOxuf1/mgQbhO2AxLw/BMWRx6zPTu/Lr2kSo6VY2
	0y3WRTqkRnOH/TsBsqRxkWBx8F1FtOM5VtQZikzebkWE+lME0N6vul7CrOqt1phj
	cm3aQR3I+zpJlWv/zE6/7z5cQ61pHVJfoH6KpN17QVs7eUO2NZbKqDZmjwJHF7j5
	jzSqbPHKBqYFPLjAP6WJKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755888153; x=1755974553; bh=VVGrmRlRJJSa4oJiuTW1lYsVWBBaILvOMPt
	NofRG1JM=; b=jRBp4lsHTw8YjPvDThFY6aonifNYT4p4mKkNzsxauzsgxU6Ii0O
	wNRTmyC6WBRIFAHiq6cxCl+oVeI8rfr9Cn2a2kdMoVfluu8UcVy7p+3MYafef/3B
	BYLmAsZwj0fiJC2f5sghNwGVEmzJymWMq0OcABIlWwytgeP+c9rGlgrk1RFM6l+w
	d8G3+vSm2LydSgDg1xo4e5EkPnHM+NHbOB6UGRUZh8M1wl3XaO4UhQ/j/LVv+8Ke
	kOTtiVoiZGGnVA3J3ZsxBMPW3l2W1kxZQx35Wj9PQcR1KZ8BExDQddPUKk0eDyEa
	ssN8L6hFME7L16CjkOxf1gOfjfYOxzmkz8Q==
X-ME-Sender: <xms:GLqoaOnYdLY5rER0dSr34Nngb9azj-I-hXKNqWaSPnds3aGm4kd29w>
    <xme:GLqoaBVEgFIPgSqr05FFoTXscPFzVSGPdubyvPNDciLZFjrr7OXshx2b6tmZWe4mv
    aJGwf6zrx6Ppw>
X-ME-Received: <xmr:GLqoaDEFxdz3IOIwpmDnfc2G_NqO_TUePBkTYkDuZiAGfdpOZQzhlDPlPAu-8PAosARx9FRacENBkhMJh0kXKOwn3OrzdNOls48>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieeghedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueekteet
    gefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlh
    eslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlvghkshgrnhgurhgpth
    ihshhhtghhvghnkhhosegvphgrmhdrtghomhdprhgtphhtthhopegsohhrihhsrdhoshht
    rhhovhhskhihsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:GLqoaNf4zn5YbX0ybIKZ0caBEciDEkbJ_YHzL6J3rEm19gYBoZgUkA>
    <xmx:GLqoaEJ34c0Vo9hU4rjeQDlmxzsNjJmKzg7UjqrHJPxoZqADcfIBVQ>
    <xmx:GLqoaCFbNr1Qx6EDM8aVtPS9UjtGckMBWVOhcV5LVI8JAlAnhSwu1g>
    <xmx:GLqoaHC04f1Vpekpgt7IRSTC1CcaOnH8sTSwayEOpDMkdolBqD0vVg>
    <xmx:GbqoaGrhAz2s27RHxNiESRMmL9sMGkWpERilaJ_ivYOnV_ziQ6IpwrMo>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 22 Aug 2025 20:42:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
Message-ID: <aKi6Foj-Lx_n0L6l@mail-itl>
References: <aKiBJeqsYx_4Top5@mail-itl>
 <aKiBwEsogK420kwo@mail-itl>
 <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="awCzYWA5QtUvFfQA"
Content-Disposition: inline
In-Reply-To: <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com>


--awCzYWA5QtUvFfQA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Aug 2025 20:42:30 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16

On Fri, Aug 22, 2025 at 05:27:20PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 22.08.25 16:42, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > Hi,
> > >=20
> > > When suspending domU I get the following issue:
> > >=20
> > >      Freezing user space processes
> > >      Freezing user space processes failed after 20.004 seconds (1 tas=
ks refusing to freeze, wq_busy=3D0):
> > >      task:xl              state:D stack:0     pid:466   tgid:466   pp=
id:1      task_flags:0x400040 flags:0x00004006
> > >      Call Trace:
> > >       <TASK>
> > >       __schedule+0x2f3/0x780
> > >       schedule+0x27/0x80
> > >       schedule_preempt_disabled+0x15/0x30
> > >       __mutex_lock.constprop.0+0x49f/0x880
> > >       unregister_xenbus_watch+0x216/0x230
> > >       xenbus_write_watch+0xb9/0x220
> > >       xenbus_file_write+0x131/0x1b0
> > >       vfs_writev+0x26c/0x3d0
> > >       ? do_writev+0xeb/0x110
> > >       do_writev+0xeb/0x110
> > >       do_syscall_64+0x84/0x2c0
> > >       ? do_syscall_64+0x200/0x2c0
> > >       ? generic_handle_irq+0x3f/0x60
> > >       ? syscall_exit_work+0x108/0x140
> > >       ? do_syscall_64+0x200/0x2c0
> > >       ? __irq_exit_rcu+0x4c/0xe0
> > >       entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > >      RIP: 0033:0x79b618138642
> > >      RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 0000000000=
000014
> > >      RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b618138642
> > >      RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 0000000000000014
> > >      RBP: 00007fff9a193000 R08: 0000000000000000 R09: 0000000000000000
> > >      R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000014
> > >      R13: 00007fff9a193120 R14: 0000000000000003 R15: 0000000000000000
> > >       </TASK>
> > >      OOM killer enabled.
> > >      Restarting tasks: Starting
> > >      Restarting tasks: Done
> > >      xen:manage: do_suspend: freeze processes failed -16
> > >=20
> > > The process in question is `xl devd` daemon. It's a domU serving a
> > > xenvif backend.
> > >=20
> > > I noticed it on 6.16.1, but looking at earlier test logs I see it with
> > > 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels weird gi=
ven
> > > seemingly no relevant changes between rc2 and rc6).
> >=20
> > I forgot to include link for (a little) more details:
> > https://github.com/QubesOS/qubes-linux-kernel/pull/1157
> >=20
> > Especially, there is another call trace with panic_on_warn enabled -
> > slightly different, but looks related.
> >=20
>=20
> I'm pretty sure the PV variant for suspending is just wrong: it is calling
> dpm_suspend_start() from do_suspend() without taking the required
> system_transition_mutex, resulting in the WARN() in pm_restrict_gfp_mask(=
).
>=20
> It might be as easy as just adding the mutex() call to do_suspend(), but =
I'm
> really not sure that will be a proper fix.

Hm, this might explain the second call trace, but not the freeze failure
quoted here above, I think?


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--awCzYWA5QtUvFfQA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiouhYACgkQ24/THMrX
1yyeOAf8DlxDU2rLWlfovE1aW5/bXNrm4vvUF8OAZt65c21d+InnZgyS6SPuFFiz
zV+4qh6MBcZM2l3VUjZ+vBUwmIB2lu7hagCaCkGhGs+3aDKqKy4atXQ7D22kicsr
4aFI09BjhD0tlLLBb1cPS+EyTesWNT6YqBFWTQ6TLI6LDfH8pK/UaHCFMLVpY8jx
VQQCoVmMJ7R+Hg/JlRWZsUqJyDu8stsvKoekGd3kTEY2KLL1p1Mt+DOBecdsMmdl
WLUObRG4Fom7jJdot9IgoPk7MljHH1Rq38w/3Yhg/mIutAMDyaAww9zdu946kmcp
fe3x+YnsI2YXpIXbOyUN7UbxPT/96g==
=xw0a
-----END PGP SIGNATURE-----

--awCzYWA5QtUvFfQA--

