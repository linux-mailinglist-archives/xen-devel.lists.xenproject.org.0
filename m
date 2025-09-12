Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 799CEB54A73
	for <lists+xen-devel@lfdr.de>; Fri, 12 Sep 2025 12:56:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1121832.1465891 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux1Rn-0005iz-2e; Fri, 12 Sep 2025 10:56:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1121832.1465891; Fri, 12 Sep 2025 10:56:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ux1Rm-0005fs-WA; Fri, 12 Sep 2025 10:56:06 +0000
Received: by outflank-mailman (input) for mailman id 1121832;
 Fri, 12 Sep 2025 10:56:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TRZT=3X=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ux1KS-0004Xd-D1
 for xen-devel@lists.xenproject.org; Fri, 12 Sep 2025 10:48:32 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02a68c82-8fc6-11f0-9809-7dc792cee155;
 Fri, 12 Sep 2025 12:48:26 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id 75D50EC050D;
 Fri, 12 Sep 2025 06:48:25 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Fri, 12 Sep 2025 06:48:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 12 Sep 2025 06:48:24 -0400 (EDT)
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
X-Inumbo-ID: 02a68c82-8fc6-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757674105;
	 x=1757760505; bh=963dbPAOfs1Spm78yUqe9iLdVpRYccnJ2wC05EW06cM=; b=
	SUuq3aS4iqe281VP+BIdwelOv2uHMX5CCNZRW0ohyMunNzvlBqAnkxWZWpTduVOf
	bmh/O0OeTUPkEZHo/jMYrME3U47ghIlCzacsx3/EVKLHT1gF/5jOjSxLrVcAVA+E
	WOfcymR3YZhAnMVWAwRvJi0UKe4emYBlrBY0sobftuqOdLba6x3aP6bhJVdJVWlY
	3uEEp9s025bYES8oto0s3735lKxjMC+OMcRYY1/mkR0hyXy5m1tXxoXNFe1bIfH+
	Wf4sz29UpwWYSm+0VGb+YXVgBqOKWmenQHtakQcuoWvAOt3gIVFhupqcomhYPubt
	XTodhP7IB/2Mis63H7C40Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757674105; x=1757760505; bh=963dbPAOfs1Spm78yUqe9iLdVpRYccnJ2wC
	05EW06cM=; b=fre0adLlGUCb+Hqa290EeD311pTb9Nb3Whyq9B7/y4dmzkjHO66
	3EAkGJFwT3oHcxtHXW5wFOin/VmFCtbUvXKuIxbyspfa7coBO7+EhgEsvuTFyyW5
	9SXXRCcWPWtb93/g92WJ+M7yvgPDd530DpMSCDkEsyicr6Ffdd0lDpriRAyE7yYS
	1GllVCUWal4uNpmOmrqVcNnGlpDDNSKxQM/lZOpj11MIR9VW7kRPXrbnWPUp6vXh
	pWYx+9q6DkZYHwlSETr8M7OXd6OPR6TpkMeqM+7ai43KJMoYWGuXK7fwan8/4KL4
	5OetOkFAd4bJG2YoKq782n9EvpH6odvLr/A==
X-ME-Sender: <xms:efrDaNfwZRM8a40t6kTx2gilkrVEBtDO9eNrFqbDW95BAio3nOwPww>
    <xme:efrDaLarRYUhvOsJYY_sbkdzOM7wcFeYf6QCsrvCAobgAA2B7SHSMrtPah2zPPcB4
    tBDunkXZtIduw>
X-ME-Received: <xmr:efrDaIXpkZ41U90zRQ7Sayi2AsLXH_HCv5tacN3jftFzWuL4B4s9xP9yTlJTH3QOa0z7EX5LVRDr812Px-qyiNwX8yzYIbd4wa0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvkeekhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkfhggtggujgesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepueekteetgefggfekudehteegieeljeejieeihfejgeevhfet
    gffgteeuteetueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhmpdhr
    tghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorh
    hg
X-ME-Proxy: <xmx:efrDaFhpUCKgNJ6L6YQXclrbxFctBgT15x66SXQrcS492W4CqaDdag>
    <xmx:efrDaOXVmeUj743teW9X584sGIPh7hwCKkKrbrk2Lk95EwyqcDK95g>
    <xmx:efrDaEODXJlCGUKX0NUdMQHLXMbv00mXg8vjOguXYPn64eYQnoFJgA>
    <xmx:efrDaCYN6Dfacbv3XvngUokE3uzEtOhyfiT_31KLt6t26ex9OUpEeg>
    <xmx:efrDaDL3iiwVhE5HZA1qFF6B6RAtblYRLnn6yR2jlZXr9IXv_y1ss_-6>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 12 Sep 2025 12:48:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: WARN in xennet_disconnect_backend when frontend is paused during
 backend shutdown
Message-ID: <aMP6dr2Z-G0_9ySk@mail-itl>
References: <aMLmkjui9kdEuiy2@mail-itl>
 <776ba15a-f922-407d-b1f2-2a2186c4729e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xdPowR8pAYgmS1+l"
Content-Disposition: inline
In-Reply-To: <776ba15a-f922-407d-b1f2-2a2186c4729e@suse.com>


--xdPowR8pAYgmS1+l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Sep 2025 12:48:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: WARN in xennet_disconnect_backend when frontend is paused during
 backend shutdown

On Fri, Sep 12, 2025 at 11:49:12AM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 11.09.25 17:11, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > The steps:
> > 1. Have domU netfront ("untrusted" here) and domU netback
> > ("sys-firewall-alt" here).
> > 2. Pause frontend
> > 3. Shutdown backend
> > 4. Unpause frontend
> > 5. Detach network (in my case attaching another one follows just after,
> > but I believe it's not relevant).
> >=20
> > This gives the following on the frontend side:
> >=20
> >      ------------[ cut here ]------------
> >      WARNING: CPU: 1 PID: 141 at include/linux/mm.h:1328 xennet_disconn=
ect_backend+0x1be/0x590 [xen_netfront]
> >      Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_devic=
e snd_timer snd soundcore nft_reject_ipv6 nf_reject_ipv6 nft_reject_ipv4 nf=
_reject_ipv4 nft_reject nft_ct nft_masq nft_chain_nat nf_nat nf_conntrack n=
f_defrag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr intel_rapl_common int=
el_uncore_frequency_common intel_pmc_core pmt_telemetry pmt_discovery pmt_c=
lass intel_pmc_ssram_telemetry intel_vsec polyval_clmulnighash_clmulni_inte=
l xen_netfront pcspkr xen_scsiback target_core_mod xen_netback xen_privcmd =
xen_gntdev xen_gntalloc xen_blkback xen_evtchn i2c_dev loop fuse nfnetlink =
overlay xen_blkfront
> >      CPU: 1 UID: 0 PID: 141 Comm: xenwatch Not tainted 6.17.0-0.rc5.1.q=
ubes.1.fc41.x86_64 #1 PREEMPT(full)
> >      RIP: 0010:xennet_disconnect_backend+0x1be/0x590 [xen_netfront]
> >      Code: 00 0f 83 93 03 00 00 48 8b 94 dd 90 10 00 00 48 8b 4a 08 f6 =
c1 01 75 79 66 90 0f b6 4a 33 81 f9 f5 00 00 00 0f 85 f3 fe ff ff <0f> 0b 4=
9 81 ff 00 01 00 00 0f 82 01 ff ff ff 4c 89 fe 48 c7 c7 e0
> >      RSP: 0018:ffffc90001123cf8 EFLAGS: 00010246
> >      RAX: 0000000000000010 RBX: 0000000000000001 RCX: 00000000000000f5
> >      RDX: ffffea0000a05200 RSI: 0000000000000001 RDI: ffffffff82528d60
> >      RBP: ffff888041400000 R08: ffff888005054c80 R09: ffff888005054c80
> >      R10: 0000000000150013 R11: ffff88801851cd80 R12: 0000000000000000
> >      R13: ffff888053619000 R14: ffff888005d61a80 R15: 0000000000000001
> >      FS:  0000000000000000(0000) GS:ffff8880952c6000(0000) knlGS:000000=
0000000000
> >      CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> >      CR2: 00006182a11f3328 CR3: 000000001084c006 CR4: 0000000000770ef0
> >      PKRU: 55555554
> >      Call Trace:
> >       <TASK>
> >       xennet_remove+0x1e/0x80 [xen_netfront]
> >       xenbus_dev_remove+0x6e/0xf0
> >       device_release_driver_internal+0x19c/0x200
> >       bus_remove_device+0xc6/0x130
> >       device_del+0x160/0x3e0
> >       ? _raw_spin_unlock+0xe/0x30
> >       ? klist_iter_exit+0x18/0x30
> >       ? __pfx_xenwatch_thread+0x10/0x10
> >       device_unregister+0x17/0x60
> >       xenbus_dev_changed+0x1d7/0x240
> >       xenwatch_thread+0x8f/0x1c0
> >       ? __pfx_autoremove_wake_function+0x10/0x10
> >       kthread+0xf9/0x240
> >       ? __pfx_kthread+0x10/0x10
> >       ret_from_fork+0x152/0x180
> >       ? __pfx_kthread+0x10/0x10
> >       ret_from_fork_asm+0x1a/0x30
> >       </TASK>
> >      ---[ end trace 0000000000000000 ]---
> >      xen_netfront: backend supports XDP headroom
> >      vif vif-0: bouncing transmitted data to zeroed pages
> >=20
> > The last two are likely related to following attach, not detach.
> >=20
> > The same happens on 6.15 too, so it isn't new thing.
> >=20
> > Shutting down backend without detaching first is not really a normal
> > operation, and doing that while frontend is paused is even less so. But
> > is the above expected outcome? If I read it right, it's
> > WARN_ON_ONCE(folio_test_slab(folio)) in get_page(), which I find
> > confusing.
> >=20
> > Originally reported at https://github.com/QubesOS/qubes-core-agent-linu=
x/pull/603#issuecomment-3280953080
> >=20
>=20
> Hmm, with this scenario I imagine you could manage to have
> xennet_disconnect_backend() running multiple times for the same device
> concurrently.
>=20
> How reliable can this be reproduced? How many vcpus does the guest have?

Quite reliably (always?). And there are 2 vcpus.
Interestingly, it doesn't happen on 6.12.42, but does on 6.15.10 and
later.

> Maybe the fix is as simple as adding a lock in xennet_disconnect_backend(=
).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--xdPowR8pAYgmS1+l
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjD+nYACgkQ24/THMrX
1yzH3gf9H0GtaM1G+79g7rdizX7K6Hx+Wkj/G9zH9oyho9bpFvQ895KfCmknv71J
SICv63F5k4FDJMf/9D9DI3lecoeB4f8UnsPxEd/sNGCEAA9Rq9eer2IYgAdKaC1Y
5X74NigWJDo4jHwjPysEtFwCQJ0Ssmbz3jf8ulXsbisopX4CtlypIQbOcMgp2oi+
ebSrfOlkO9iaYsOSrRHT6GiI0qTdBRY0yC1BGzjMh/hzbQWLvWPGrFpfWIbnTzER
A7vbdxi4e1lxo+ao1djN94nmeTifTqI3Hg4OP8r3G+y+2jhj/AyPk6YeY9gK9SDX
huMCPYYK9Sz5/Dg8gB3MvsE0w4G4vw==
=thhx
-----END PGP SIGNATURE-----

--xdPowR8pAYgmS1+l--

