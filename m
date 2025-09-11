Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E46EB53704
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 17:11:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1120413.1465363 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwixG-00030W-C6; Thu, 11 Sep 2025 15:11:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1120413.1465363; Thu, 11 Sep 2025 15:11:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwixG-0002yL-9A; Thu, 11 Sep 2025 15:11:22 +0000
Received: by outflank-mailman (input) for mailman id 1120413;
 Thu, 11 Sep 2025 15:11:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WJvt=3W=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uwixF-0002yF-4P
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 15:11:21 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 90fedb2e-8f21-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 17:11:18 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 40E717A0316;
 Thu, 11 Sep 2025 11:11:17 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 11 Sep 2025 11:11:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Sep 2025 11:11:16 -0400 (EDT)
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
X-Inumbo-ID: 90fedb2e-8f21-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1757603477; x=1757689877; bh=Op
	BV2oIANtjlUKd2RvH8eUWtuy1HmwEUDQuIs61cuGk=; b=G453LlSFIk2lR+OVsi
	A0BvzRcYK9kO15aqEBKIYjK0CKA5Hh9OG/nV6Hllr8pE+a4wiLeVsIfB8DbXCPMS
	ajAXpOlYoal2J7GomN9Q2ozhu/kgWWL7e8rfKbD6YKarpEZ3wDfGOkc0Znri6Bj7
	hFgemAZw355EN2LQX50oKaSFvErB8/JRJ2/k844iMBvMXFso3bGXA2PtgWmAEddr
	2hqcYsbHbvXrLmgoIrFfQGTUaw/VofPzxjH9K/BUmljWGOv72ou6AcqWyziSY34Q
	wNEWtIAA95AKN9qmPv6RPMoNmeEtN0e1ZNB8kHoQPBq/yslcLIcKpHsalE0Nl6/E
	lxDQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757603477; x=
	1757689877; bh=OpBV2oIANtjlUKd2RvH8eUWtuy1HmwEUDQuIs61cuGk=; b=P
	SteqXSoNJOR5oo3TjOUB8hS/qduXgkPT3cDSMMwfpqRuo4BLL1wWauvUcm32wN8X
	b5DW8bCgF+4OIlQjZsEG0nQAQCieqrFSlNGWv7TG8zoc/FNc9csay2P6dzDbPucO
	82D3wZ9BfDOTbl+gI/u1iFR10cEB5Dq8FIMDX9QYnb4MtXioY8xosIRCjzx47QNp
	qnVBKnUSF6U0msnk6V4tIkqpVnL9nPVWK3y614saLfuqvnrGeqTIkXWIz9fR4hpv
	/Cpj1t174tOMKTrE6RxwBIuf39dQ2Ew/J0A8fuoub9OIvffhk1kgkgLPjrET1Pee
	s0zGT2orMkHOAVCyuoh5g==
X-ME-Sender: <xms:lObCaHt7x9UUTckJ4VLz9QK5Bt7_W6JC0Vl8eYvItUJzhgrJF0fJ6w>
    <xme:lObCaIoLjfIiBoiXQq0Vl5rWpj_4Sg241xEeCb-g6Mw1krcR6zqmpjJUPujP_Ve2B
    lVyxGz45EFsuA>
X-ME-Received: <xmr:lObCaMkufnWLmt9xbL_VlUT0mLAR2gebcfEL8vwD42wXg9N_sr569544UHXrc6wLrtMkuv_yiJZmPKTBiItLpIo_lSx3xe5pR9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvieeglecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecunecujfgurhepfffhvfevuffkgggtugesghdtreertddtje
    enucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceo
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecugg
    ftrfgrthhtvghrnhephfetuefhiefgtddtlefggffggeevhedtvdefffeugfeiieeiheef
    teefgefggeejnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedvpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghn
    phhrohhjvggtthdrohhrghdprhgtphhtthhopehjghhrohhsshesshhushgvrdgtohhm
X-ME-Proxy: <xmx:lObCaEz_1L3ZcTEHqV3sHAC_WNVRFYRU-th_IxBaBL9Gqdqy9BVWRw>
    <xmx:lObCaMnmthCy9uYiz6t7GZdXB2WA8H__4nR3NEotNMtvfrUPCICqvw>
    <xmx:lObCaFeMGVyHf_YMkewJrv7C39UTepm9i4XgViVmfUphMOXaXBwF7A>
    <xmx:lObCaKri_K7RaG8Rc4920Hp3iN5BvoLh0yXQwguA7lVnjERpLwB8Mg>
    <xmx:lebCaDbLCI8KFASTa3vbXWAB1OKAput4JGGRyDTngfr_Fn17aFb_XE5_>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 11 Sep 2025 17:11:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: WARN in xennet_disconnect_backend when frontend is paused during
 backend shutdown
Message-ID: <aMLmkjui9kdEuiy2@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x55zhp3nHLq16CA6"
Content-Disposition: inline


--x55zhp3nHLq16CA6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Sep 2025 17:11:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Subject: WARN in xennet_disconnect_backend when frontend is paused during
 backend shutdown

Hi,

The steps:
1. Have domU netfront ("untrusted" here) and domU netback
("sys-firewall-alt" here).
2. Pause frontend
3. Shutdown backend
4. Unpause frontend
5. Detach network (in my case attaching another one follows just after,
but I believe it's not relevant).

This gives the following on the frontend side:

    ------------[ cut here ]------------
    WARNING: CPU: 1 PID: 141 at include/linux/mm.h:1328 xennet_disconnect_b=
ackend+0x1be/0x590 [xen_netfront]
    Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd=
_timer snd soundcore nft_reject_ipv6 nf_reject_ipv6 nft_reject_ipv4 nf_reje=
ct_ipv4 nft_reject nft_ct nft_masq nft_chain_nat nf_nat nf_conntrack nf_def=
rag_ipv6 nf_defrag_ipv4 nf_tables intel_rapl_msr intel_rapl_common intel_un=
core_frequency_common intel_pmc_core pmt_telemetry pmt_discovery pmt_class =
intel_pmc_ssram_telemetry intel_vsec polyval_clmulnighash_clmulni_intel xen=
_netfront pcspkr xen_scsiback target_core_mod xen_netback xen_privcmd xen_g=
ntdev xen_gntalloc xen_blkback xen_evtchn i2c_dev loop fuse nfnetlink overl=
ay xen_blkfront
    CPU: 1 UID: 0 PID: 141 Comm: xenwatch Not tainted 6.17.0-0.rc5.1.qubes.=
1.fc41.x86_64 #1 PREEMPT(full)
    RIP: 0010:xennet_disconnect_backend+0x1be/0x590 [xen_netfront]
    Code: 00 0f 83 93 03 00 00 48 8b 94 dd 90 10 00 00 48 8b 4a 08 f6 c1 01=
 75 79 66 90 0f b6 4a 33 81 f9 f5 00 00 00 0f 85 f3 fe ff ff <0f> 0b 49 81 =
ff 00 01 00 00 0f 82 01 ff ff ff 4c 89 fe 48 c7 c7 e0
    RSP: 0018:ffffc90001123cf8 EFLAGS: 00010246
    RAX: 0000000000000010 RBX: 0000000000000001 RCX: 00000000000000f5
    RDX: ffffea0000a05200 RSI: 0000000000000001 RDI: ffffffff82528d60
    RBP: ffff888041400000 R08: ffff888005054c80 R09: ffff888005054c80
    R10: 0000000000150013 R11: ffff88801851cd80 R12: 0000000000000000
    R13: ffff888053619000 R14: ffff888005d61a80 R15: 0000000000000001
    FS:  0000000000000000(0000) GS:ffff8880952c6000(0000) knlGS:00000000000=
00000
    CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
    CR2: 00006182a11f3328 CR3: 000000001084c006 CR4: 0000000000770ef0
    PKRU: 55555554
    Call Trace:
     <TASK>
     xennet_remove+0x1e/0x80 [xen_netfront]
     xenbus_dev_remove+0x6e/0xf0
     device_release_driver_internal+0x19c/0x200
     bus_remove_device+0xc6/0x130
     device_del+0x160/0x3e0
     ? _raw_spin_unlock+0xe/0x30
     ? klist_iter_exit+0x18/0x30
     ? __pfx_xenwatch_thread+0x10/0x10
     device_unregister+0x17/0x60
     xenbus_dev_changed+0x1d7/0x240
     xenwatch_thread+0x8f/0x1c0
     ? __pfx_autoremove_wake_function+0x10/0x10
     kthread+0xf9/0x240
     ? __pfx_kthread+0x10/0x10
     ret_from_fork+0x152/0x180
     ? __pfx_kthread+0x10/0x10
     ret_from_fork_asm+0x1a/0x30
     </TASK>
    ---[ end trace 0000000000000000 ]---
    xen_netfront: backend supports XDP headroom
    vif vif-0: bouncing transmitted data to zeroed pages

The last two are likely related to following attach, not detach.

The same happens on 6.15 too, so it isn't new thing.

Shutting down backend without detaching first is not really a normal
operation, and doing that while frontend is paused is even less so. But
is the above expected outcome? If I read it right, it's
WARN_ON_ONCE(folio_test_slab(folio)) in get_page(), which I find
confusing.

Originally reported at https://github.com/QubesOS/qubes-core-agent-linux/pu=
ll/603#issuecomment-3280953080

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--x55zhp3nHLq16CA6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjC5pIACgkQ24/THMrX
1yzJJQgAmAjqLnEPVaJSeYfoos6u0fhu2ziAdmtCzMkQEEAsbcozZionCqKy2Tzy
uF0Db7aLOiG9P/WXLwIaaZQLQ3kOHQbvcJsL5z7onFgbsisQFAB27QKC4sk4R2sB
/de4lxFGxutRmpl15q5RvyvBybcjBmw9qKGWTjBbwBOYOvVMPkSQivFOgPuCaQMd
+UkdMtEBsUDBvw7dWSxMoKIWGDOvJY9pIs2GvMm0ErtYFfAT84WqZELozQvJ2htI
P7eupj04AZZbiFaMn7Mu7htOBEC3QVxfzA13k86DLRetat4fCfrz5EE7FMGmqylG
Ms9csQwCERXFiI5oa0Ql8/d6WpK8Hw==
=Eqh1
-----END PGP SIGNATURE-----

--x55zhp3nHLq16CA6--

