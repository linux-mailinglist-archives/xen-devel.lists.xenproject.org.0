Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC7B31C36
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 16:42:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1090249.1447596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSy6-0001BX-Fk; Fri, 22 Aug 2025 14:42:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1090249.1447596; Fri, 22 Aug 2025 14:42:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upSy6-00018f-Aj; Fri, 22 Aug 2025 14:42:14 +0000
Received: by outflank-mailman (input) for mailman id 1090249;
 Fri, 22 Aug 2025 14:42:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RLTp=3C=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1upSy5-0000k8-6S
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 14:42:13 +0000
Received: from fout-b7-smtp.messagingengine.com
 (fout-b7-smtp.messagingengine.com [202.12.124.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fcdb944-7f66-11f0-a32b-13f23c93f187;
 Fri, 22 Aug 2025 16:42:12 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.stl.internal (Postfix) with ESMTP id 0A8F11D0022E;
 Fri, 22 Aug 2025 10:42:11 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-06.internal (MEProxy); Fri, 22 Aug 2025 10:42:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 22 Aug 2025 10:42:09 -0400 (EDT)
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
X-Inumbo-ID: 2fcdb944-7f66-11f0-a32b-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1755873730;
	 x=1755960130; bh=jYHN8OO0m+mwe/TF93sSSPHNfUHgf4leS3FzqTm3H2o=; b=
	PesU9phwOvGOrgq7WtuZaT+r3cB+LyA2zeVW9iz05o5aG3HGbr7qqHG52zuFuYWh
	a6hSpCwHCIInrQnTKMushZlMYUOC9lru+pnsDe/hk9tIhOX4zulSOsKWS5VAlcmy
	Hl/wfIYrsajjO78glHksB2s+bcGdHV1Jt7DMzlWXZEVCpKKN3+7IY1uth/XVBopF
	RIxYMsXBo4z7D26WsBy0tiZiQuih2S1IfubAajRaN+xTEOjl4UaJrA8WxpKd8+gq
	No+gSwm0k+k9wNqKDzaFvzq8m2/P5h7vUgErdWf+hrjpZ6hpsm3cZ4MmzDPQCvBx
	SAwUtsDPCtKMMOuQVb4OUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1755873730; x=1755960130; bh=jYHN8OO0m+mwe/TF93sSSPHNfUHgf4leS3F
	zqTm3H2o=; b=F0w/PLozxPyhVA+28oBzdZn4gStbIjfydFEykLP0XP+z5OS1g3t
	+swPKtmoFVr2+0s8UUoyrcA9ZKhXWfhs2M+UwWzm+33lgZXY8SWAMkBkMKjqxlMC
	05amULMYsQcaTkz7Yc7UVCXWScor8h6GCOaGInGcO1gRmkcYFF66NqF/Ev0muCKs
	sIG/o29ayiNqKwcWfvhlvo18c7gq6nJv2qh+M0Vu0vsOlFi0EFwC9CEwiA4KCLf/
	mVOX1TT/d1ja2G5pMmd4lohMWUDAiYHP3wptB2JJcd2DIwvoYSRblMJpWNWEPSyL
	AAGCXt27rGIW9DR292e2yKb0q6itZ68vG5g==
X-ME-Sender: <xms:woGoaH7s0IFEiOBuks5KCT_Ve_ZFJ3m6z3MSdum0Xoi6pJsSzs8qBQ>
    <xme:woGoaOYPN8hjE5Sp3x8A79J9GwLodw6Q3SJDEKafHa8iiyXF-vrtgMn52CXVABd7D
    od2GuSxmAl1-w>
X-ME-Received: <xmr:woGoaOgl2AhtFYPk8pzL_Xa3M2Z-rpbNc2-U8-3oZ8Zt5ePDdnMErwmopnC9PIjMj8lfP-GR0opj7Os17DJ_Pqyn43TZeppEOHE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduieegtddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueekteet
    gefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprh
    gtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhrtghpthhtohepshhsthgrsggv
    lhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhlvghkshgrnhgurhgpth
    ihshhhtghhvghnkhhosegvphgrmhdrtghomhdprhgtphhtthhopegsohhrihhsrdhoshht
    rhhovhhskhihsehorhgrtghlvgdrtghomh
X-ME-Proxy: <xmx:woGoaH_t8hvKo-zBtbGjc57L0qV-3seOHIHSO-Mm9z0KwFngdOv9qQ>
    <xmx:woGoaBqBHJFoDuy7M1-CfWvr6Pkcxq4jFasWqAO-yvrp7putDHy0KA>
    <xmx:woGoaHWViewGl6abm7LYUk56oFUOThk2sXKMrmpydhC8tjib4BIzpA>
    <xmx:woGoaIAbe9nBNnsecffW1nL1gTarZFf_gnpOj4HvmpB0ViWe_zrX5Q>
    <xmx:woGoaH2KVBz29jqvOkEWI7aHrMoNK4BUFzsy724dWAFEPFmGv6KZeE89>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 22 Aug 2025 16:42:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
Message-ID: <aKiBwEsogK420kwo@mail-itl>
References: <aKiBJeqsYx_4Top5@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="clAqg1t6X9s2sdLz"
Content-Disposition: inline
In-Reply-To: <aKiBJeqsYx_4Top5@mail-itl>


--clAqg1t6X9s2sdLz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 Aug 2025 16:42:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16

On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> When suspending domU I get the following issue:
>=20
>     Freezing user space processes
>     Freezing user space processes failed after 20.004 seconds (1 tasks re=
fusing to freeze, wq_busy=3D0):
>     task:xl              state:D stack:0     pid:466   tgid:466   ppid:1 =
     task_flags:0x400040 flags:0x00004006
>     Call Trace:
>      <TASK>
>      __schedule+0x2f3/0x780
>      schedule+0x27/0x80
>      schedule_preempt_disabled+0x15/0x30
>      __mutex_lock.constprop.0+0x49f/0x880
>      unregister_xenbus_watch+0x216/0x230
>      xenbus_write_watch+0xb9/0x220
>      xenbus_file_write+0x131/0x1b0
>      vfs_writev+0x26c/0x3d0
>      ? do_writev+0xeb/0x110
>      do_writev+0xeb/0x110
>      do_syscall_64+0x84/0x2c0
>      ? do_syscall_64+0x200/0x2c0
>      ? generic_handle_irq+0x3f/0x60
>      ? syscall_exit_work+0x108/0x140
>      ? do_syscall_64+0x200/0x2c0
>      ? __irq_exit_rcu+0x4c/0xe0
>      entry_SYSCALL_64_after_hwframe+0x76/0x7e
>     RIP: 0033:0x79b618138642
>     RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 0000000000000014
>     RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b618138642
>     RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 0000000000000014
>     RBP: 00007fff9a193000 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000014
>     R13: 00007fff9a193120 R14: 0000000000000003 R15: 0000000000000000
>      </TASK>
>     OOM killer enabled.
>     Restarting tasks: Starting
>     Restarting tasks: Done
>     xen:manage: do_suspend: freeze processes failed -16
>=20
> The process in question is `xl devd` daemon. It's a domU serving a
> xenvif backend.
>=20
> I noticed it on 6.16.1, but looking at earlier test logs I see it with
> 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels weird given
> seemingly no relevant changes between rc2 and rc6).

I forgot to include link for (a little) more details:
https://github.com/QubesOS/qubes-linux-kernel/pull/1157

Especially, there is another call trace with panic_on_warn enabled -
slightly different, but looks related.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--clAqg1t6X9s2sdLz
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiogcAACgkQ24/THMrX
1ywkGwgAghYvaKickGgpl6GwVjbZnYATV9BBbgLx1Pf0uZUFjrh8E1lQMyF0cWPq
EwkIDeJFP7lP5WThSxziHqwYVFuvoE1KvAe9Lt6Zu99dKPKK+0+dt/1uJSWCN5vK
6VilS9BT5+ykZAXg6W+l0n1I0Xkh6tH+APvmLKONo5CLRr9kpIbluOv+8uXcvntN
5VL+MPxJoPFd5tfzeJxVrptBpvh9YY79ttVgCxUvy1AzPblVorReGGbP5/NedDJW
J0AhQ1XNFHOv4ohmh07H66kIvK+Wub+SFZ4ejpW2WUGqOBSVM2dKzVWwOCxEEEgZ
4WIkFjDK/R1W7KyLt145NH+dF1oLOA==
=SaV5
-----END PGP SIGNATURE-----

--clAqg1t6X9s2sdLz--

