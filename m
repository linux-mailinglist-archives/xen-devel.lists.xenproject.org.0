Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E23A787104
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 16:05:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590114.922220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZAx5-0001zW-GJ; Thu, 24 Aug 2023 14:04:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590114.922220; Thu, 24 Aug 2023 14:04:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZAx5-0001xP-Cy; Thu, 24 Aug 2023 14:04:47 +0000
Received: by outflank-mailman (input) for mailman id 590114;
 Thu, 24 Aug 2023 14:04:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NBmp=EJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qZAx3-0001x0-Nf
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 14:04:46 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a35541b-4287-11ee-8783-cb3800f73035;
 Thu, 24 Aug 2023 16:04:42 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F9F35C004D
 for <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 10:04:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Thu, 24 Aug 2023 10:04:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 24 Aug 2023 10:04:37 -0400 (EDT)
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
X-Inumbo-ID: 2a35541b-4287-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1692885878; x=1692972278; bh=T2KUNO/NlxeFoxK8BG3y8ThTZyaDCrX3+W1
	L/KN9878=; b=poJzwy8STUo9KD0IYjjLfQkm32+Oyy4kxcK/tdYk+dZ6SzdGYrb
	61pApgiGmnGwZyLDZQsG/XPBHs2I4vk5WKBI0R3ea1XihWSgcevX0v1lHF4JBJtr
	XgbWs8xmVRWMAKBaUDT7ISHuOyAgPyVJoyjsKz9L+ewB49lobcZuMJB/v1eBAAqw
	6LGRg0gCC/0Fo0t3AtGXFhgGlMTN6QuQE1iTXQP1MnHb9RDEYL7VeJhx7lubDKEl
	gjXdSKvTgxC/Ca5DS2Du82TQqpKoUElEUIcOnZGwTiPtCdJt9WfDfqFQrPrJq/mS
	w02z7AR5o+Gah5QipsMgyDr9ZeeNDCRFtqA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692885878; x=1692972278; bh=T2KUNO/NlxeFo
	xK8BG3y8ThTZyaDCrX3+W1L/KN9878=; b=IrBImL45hN5zKF0wBKkqLkniRr55T
	mBtCb0ZhehtwpGEwhukJK0viIStP+uxTHTiWpdLWZnh8znkViE50c+dtlKSE10NA
	K9kMpxOXQS3JKH0R1Z9Kjy4PlAZjP4jA7joZiVcB8jhuRPlnUHck79Un5Ja5A9M6
	oLv+lt9WDPHJ5ENFegc/RNN6EzyOqfPotx7QX6oGenHvMUGjxD8zS+aCwWXltwdG
	9YoC8S/MyrVIZK+06K1VrNDJuEKSYM/GM3HV2MpxvxaYQDQzO59CHFJ4VA6Ga7hG
	oTQUVhdwqItF7oQt58xgVcpRWgIJ6YVwSwn3ogWUsFToPHqhpKetsd90w==
X-ME-Sender: <xms:dWPnZJs9-Wh3H00XTOPCqQOcocipgdpsTpt8HZ6AkG8SfegdN23fNg>
    <xme:dWPnZCeZUhxhgLWOONMNprTsxsWcpfWRIrm0DVZ6ApRzMtuD0qvm9_zhDlbheJk8K
    7kbY1cLYJveDw>
X-ME-Received: <xmr:dWPnZMyXGD4P8l0FTpYgOVE_BmUFM2L0lzwx98EHQK61X0kCRAgJ0AIZxXFnh_g9YBDM70E9DF_2LwdmnB31LGcyquW9XBWycCc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddviedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
    ertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
    khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    eqnecuggftrfgrthhtvghrnhepkeegtdfgvdeihefhhedtvdelieeiueetveehteffjeej
    jedvieejvefhueeffeegnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:dmPnZANWzaVm9f6Nn1zElHczovCCj58zBgfsTorx9rpMCd4ezCJgww>
    <xmx:dmPnZJ8VvDSuz6FLFTgsD62Y3jxD-3EpZ_RHmk6UtsGOPPKwE-at2A>
    <xmx:dmPnZAWr_MAENuxQK1YVs9GZ0Ax0wkaCmk5AkNkOqFxU-BEl-N7H2Q>
    <xmx:dmPnZMKgGw45Ix2L63rhaqZk9zr9-MDolXZURMdvGJrQ8yZI85w7_A>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 24 Aug 2023 16:04:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: "rcu_preempt detected stalls" with xen_free_irq involved
Message-ID: <ZOdjcurhtb7eQNYe@mail-itl>
References: <ZOV8zMeie3oprrGg@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kt9j1wOK963h20Qo"
Content-Disposition: inline
In-Reply-To: <ZOV8zMeie3oprrGg@mail-itl>


--kt9j1wOK963h20Qo
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Aug 2023 16:04:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: "rcu_preempt detected stalls" with xen_free_irq involved

On Wed, Aug 23, 2023 at 05:28:12AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> Since updating from 5.15.124 to 6.1.43, I observe rather often an issue
> like in the subject. This happens on a domU with heavy vchan usage
> (several connections established and released per second).
>=20
> The domain in question is a PVH with 16 vCPUs and generally is rather
> busy (CPU time, but also some noticeable network and disk I/O), but I've
> seen this happening also in less intensive times (but still several
> vchan connections being handled).
>=20
> This is running on Xen 4.17.2, AMD EPYC (Zen3), with smt=3Doff.
>=20
> Any ideas?
>=20
> Full message:
>=20
>     rcu: INFO: rcu_preempt detected stalls on CPUs/tasks:
>     rcu:       9-...0: (0 ticks this GP) idle=3D2364/1/0x4000000000000000=
 softirq=3D20505/20505 fqs=3D11999                                         =
                                                       =20
>        (detected by 12, t=3D60004 jiffies, g=3D79009, q=3D1863 ncpus=3D16=
)                                                                          =
                                                         =20
>     Sending NMI from CPU 12 to CPUs 9:                                   =
                                                                           =
                                                 =20
>     NMI backtrace for cpu 9                                              =
                                                                           =
                                                 =20
>     CPU: 9 PID: 18266 Comm: qrexec-agent Not tainted 6.1.43-1.qubes.fc37.=
x86_64 #1                                                                  =
                                                 =20
>     RIP: 0010:queued_write_lock_slowpath+0x64/0x124                      =
                                                                           =
                                                 =20
>     Code: ff 90 0f 1f 44 00 00 5b 5d c3 cc cc cc cc f0 81 0b 00 01 00 00 =
ba ff 00 00 00 b9 00 01 00 00 8b 03 3d 00 01 00 00 74 0b f3 90 <8b> 03 3d 0=
0 01 00 00 75 f5 89 c8 f0 0f b1 13 74 be eb e2 65=20
>                                                                          =
                                                                           =
                                                 =20
>     RSP: 0018:ffffc9000229fd30 EFLAGS: 00000006                          =
                                                                           =
                                                 =20
>     RAX: 0000000000000500 RBX: ffffffff8468de60 RCX: 0000000000000100    =
                                                                           =
                                                 =20
>     RDX: 00000000000000ff RSI: ffff8881004b86d8 RDI: ffffffff8468de60    =
                                                                           =
                                                 =20
>     RBP: ffffffff8468de64 R08: ffff8881004b8860 R09: ffffffff82d47600    =
                                                                           =
                                                 =20
>     R10: 0000000000000000 R11: 0000000000000000 R12: ffff88810464e3e0    =
                                                                           =
                                                 =20
>     R13: ffff8881012a76a0 R14: ffff88838d1f5a90 R15: 0000000000000000    =
                                                                           =
                                                 =20
>     FS:  0000716dc7f6b780(0000) GS:ffff8883dc040000(0000) knlGS:000000000=
0000000                                                                    =
                                                 =20
>     CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033                    =
                                                                           =
                                                 =20
>     CR2: 0000716dc7f7c060 CR3: 00000001e3d0c001 CR4: 0000000000770ee0    =
                                                                           =
                                                 =20
>     PKRU: 55555554                                                       =
                                                                           =
                                                 =20
>     Call Trace:                                                          =
                                                                           =
                                                 =20
>      <NMI>                                                               =
                                                                           =
                                                 =20
>      ? show_trace_log_lvl+0x1d3/0x2ef                                    =
                                                                           =
                                                 =20
>      ? show_trace_log_lvl+0x1d3/0x2ef                                    =
                                                                           =
                                                 =20
>      ? show_trace_log_lvl+0x1d3/0x2ef                                    =
                                                                           =
                                                 =20
>      ? __raw_write_lock_irqsave+0x3d/0x50
>      ? nmi_cpu_backtrace.cold+0x1b/0x76
>      ? queued_write_lock_slowpath+0x64/0x124
>      ? nmi_cpu_backtrace_handler+0xd/0x20
>      ? nmi_handle+0x5d/0x120
>      ? queued_write_lock_slowpath+0x64/0x124
>      ? default_do_nmi+0x69/0x170
>      ? exc_nmi+0x13c/0x170
>      ? end_repeat_nmi+0x16/0x67
>      ? queued_write_lock_slowpath+0x64/0x124
>      ? queued_write_lock_slowpath+0x64/0x124
>      ? queued_write_lock_slowpath+0x64/0x124
>      </NMI>
>      <TASK>
>      __raw_write_lock_irqsave+0x3d/0x50
>      xen_free_irq+0x43/0x170
>      unbind_from_irqhandler+0x40/0x80
>      evtchn_release+0x27/0x8e [xen_evtchn]
>      __fput+0x91/0x250
>      task_work_run+0x59/0x90
>      exit_to_user_mode_loop+0x121/0x150
>      exit_to_user_mode_prepare+0xaf/0xc0
>      syscall_exit_to_user_mode+0x17/0x40
>      do_syscall_64+0x67/0x80
>      ? handle_mm_fault+0xdb/0x2d0
>      ? preempt_count_add+0x47/0xa0
>      ? up_read+0x37/0x70=20
>      ? do_user_addr_fault+0x1bb/0x570
>      ? exc_page_fault+0x70/0x170
>      entry_SYSCALL_64_after_hwframe+0x63/0xcd
>     RIP: 0033:0x716dc81077ea
>     Code: 48 3d 00 f0 ff ff 77 48 c3 0f 1f 80 00 00 00 00 48 83 ec 18 89 =
7c 24 0c e8 d3 ce f8 ff 8b 7c 24 0c 89 c2 b8 03 00 00 00 0f 05 <48> 3d 00 f=
0 ff ff 77 36 89 d7 89 44 24 0c e8 33 cf f8 ff 8b=20
>    =20
>     RSP: 002b:00007ffce6ce80e0 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
>     RAX: 0000000000000000 RBX: 000055aae7e8c150 RCX: 0000716dc81077ea
>     RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000014
>     RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
>     R10: 0000716dc80086b8 R11: 0000000000000293 R12: 000055aae7e8ad70
>     R13: 0000000000000003 R14: 0000716dc8020bf8 R15: 00007ffce6ce81a0
>      </TASK>
>=20
>=20
> I've seen also few other flavors of the above, for example:
> https://gist.github.com/marmarek/a8b79ef2a877443c7aa57fdca366a701

Unfortunately, I've got it happened on 5.15.124 too (updated the gist
above with that trace too). So, it isn't that clear regression. That
said, it still happens way less often on 5.15 than 6.1.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--kt9j1wOK963h20Qo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmTnY3IACgkQ24/THMrX
1yzcVQf/ROoxxS2uXsW2dTA/3l1zu7D5U8xMcVD7mP40Y5LAaoyOEQJgHk5oGnnp
2DFqCLrqGQcauJ3101IwjFNghtb7NrGTroVLYVS5kpHDXDG9MPR8U0eGMF8hL4zG
ZaZAbgC40Ps+2Lj8LntatQhs0mQY/pGSMfkURaIXlNSuhz7/f9ochQV6roiS0tTq
enKQXYtZA6OGuZXZgx8EFL1NKSYgOYYUiBCi1CIKegv2KrKq6AMQIREP7uU7YuTp
aVhVJ0jBaIySATvMSCJj4Y2G0tg0IK9oYvxZrntTYORFj9d9K7aLMtPkMwq/i8bv
6CjkARSBG3pKRrjLwrTM9+hHwpdsUA==
=qMN9
-----END PGP SIGNATURE-----

--kt9j1wOK963h20Qo--

