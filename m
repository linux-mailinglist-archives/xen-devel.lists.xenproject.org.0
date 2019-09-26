Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 39819BFAFC
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 23:38:45 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDbPH-0003uG-VK; Thu, 26 Sep 2019 21:34:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lLXC=XV=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iDbPG-0003uB-G2
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 21:34:34 +0000
X-Inumbo-ID: 6e5e4cd4-e0a5-11e9-bf31-bc764e2007e4
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by localhost (Halon) with ESMTPS
 id 6e5e4cd4-e0a5-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 21:34:33 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 96A3022095;
 Thu, 26 Sep 2019 17:34:33 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 26 Sep 2019 17:34:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=mpGzoGZaBcZejllcvXDiBX0zEOKwY
 HvnsNOMAHnvekI=; b=AmPOfO3uHFDGWpv8TZTuxzvoVtVqmSTE98YB8G7D0T+zW
 NhM1hZ77Nv1Qu6lSO0xotvvl7w3ADGHtPqT77KST6VMTB7XXKN78joDQsAG18vWL
 WqZebWHcte9quqEr+9eWXv9krUG38s2gd4kATzNsr8tS6l5AizVSYE9pPIhK0D5c
 0TOTcDjleM7qWciXGDhSlS5GcWM98qpjRwCrjlIQi01YlSdbbmMg4dg4KoA4VbED
 CdW+d3JR+XZa2yVApxBWI98ClSFL0pQypfCf+nFqBIqZMlw/qohGfGNTQ9unMX0q
 k/C/omYcfV0ueVMg1zdzjPO+sgVtxJo+NkVNVdyTg==
X-ME-Sender: <xms:6C6NXUoxkg2NTPDHOn9lx9msIYvH7Pz1dYopoXP13nUv7x_eJPSRYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeehucetufdoteggodetrfdotffvucfrrh
 hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
 lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
 epfffhvffukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgii
 hihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghr
 rghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhngh
 hslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:6C6NXbn29_f1V-mqjnebSEdDBMdTWzmUVYOlH58DgJ6cTVCvu9cwHA>
 <xmx:6C6NXZhIdxvToTTDWytf6Yp9hwfcmN6LJTblQIQ2zEe_WK-P6xzZvg>
 <xmx:6C6NXaVCpEYHt-87qY7MC-MhIOBqLWbxfihRhfaNDqzySNMLgxOQPA>
 <xmx:6S6NXZHChWewdd9huxa-TmS58WzUr82uCt8Rp98BngoDUDggtty3zw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 14B7FD6005F;
 Thu, 26 Sep 2019 17:34:31 -0400 (EDT)
Date: Thu, 26 Sep 2019 23:34:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xenproject.org
Message-ID: <20190926213428.GU8065@mail-itl>
MIME-Version: 1.0
Subject: [Xen-devel] VM_BUG_ON_PAGE(!PageOffline(page),
 page) in alloc_xenballooned_pages
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, David Hildenbrand <david@redhat.com>
Content-Type: multipart/mixed; boundary="===============7728576891950012202=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7728576891950012202==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZplOxUIsrEyrgofR"
Content-Disposition: inline


--ZplOxUIsrEyrgofR
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: VM_BUG_ON_PAGE(!PageOffline(page), page) in alloc_xenballooned_pages

Hi,

I've hit VM_BUG_ON_PAGE(!PageOffline(page), page) in
alloc_xenballooned_pages, when trying to use gnttab from userspace
application. It happens on Xen PV, but not on Xen PVH or HVM with the
same kernel. This happens at least with 5.1.6, but also 5.2.15
(as seen below). Based on this, it looks related to 0266def91377
(xen/balloon: Fix mapping PG_offline pages to user space) and probably
77c4adf6a6df (xen/balloon: mark inflated pages PG_offline).

Any idea? Below is full message.


page:ffffea0003e7ffc0 refcount:1 mapcount:0 mapping:0000000000000000 index:=
0x0
flags: 0xffffe00001000(reserved)
raw: 000ffffe00001000 dead000000000100 dead000000000200 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: VM_BUG_ON_PAGE(!PageOffline(page))
------------[ cut here ]------------
kernel BUG at include/linux/page-flags.h:744!
invalid opcode: 0000 [#1] SMP NOPTI
CPU: 0 PID: 551 Comm: qubesdb-daemon Tainted: G        W         5.2.15-200=
=2Efc30.x86_64 #1
RIP: e030:alloc_xenballooned_pages+0xef/0x110
Code: c0 0c 10 00 e8 b2 fa ff ff 85 c0 0f 84 60 ff ff ff 41 89 dd b8 f4 ff =
ff ff eb b0 48 c7 c6 e8 af 14 82 48 89 c7 e8 31 32 ca ff <0f> 0b 48 c7 c7 4=
0 f 0 4d 82 e8 13 85 3f 00 31 c0 48 83 c4 08 5b 5d
RSP: e02b:ffffc90001113d98 EFLAGS: 00010246
RAX: 0000000000000037 RBX: 0000000000000000 RCX: 0000000000000149
RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff82143bbc
RBP: 0000000000000001 R08: 0000000000000181 R09: 0000000000000149
R10: 000000000000000a R11: ffffc90001113c38 R12: ffff88800d670960
R13: 00007fffdff236a0 R14: 00007fffdff236a0 R15: ffff8880108bd000
FS:  00007f30e205e7c0(0000) GS:ffff888013e00000(0000) knlGS:0000000000000000
CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f30e2082000 CR3: 000000000c920000 CR4: 0000000000040660
Call Trace:
 ? __kmalloc+0x16c/0x210
 gnttab_alloc_pages+0x11/0x40
 gntdev_alloc_map+0xe7/0x180 [xen_gntdev]
 gntdev_ioctl+0x203/0x530 [xen_gntdev]
 do_vfs_ioctl+0x405/0x660
 ksys_ioctl+0x5e/0x90
 __x64_sys_ioctl+0x16/0x20
 do_syscall_64+0x5f/0x1a0
 ? page_fault+0x8/0x30
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x7f30e239b3bb
Code: 0f 1e fa 48 8b 05 cd ca 0c 00 64 c7 00 26 00 00 00 48 c7 c0 ff ff ff =
ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00 00 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 8b 0d 9d ca 0c 00 f7 d8 64 89 01 48
RSP: 002b:00007fffdff23698 EFLAGS: 00000202 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f30e239b3bb
RDX: 00007fffdff236a0 RSI: 0000000000184700 RDI: 000000000000000b
RBP: 00007fffdff23730 R08: 00007fffdff2375c R09: 00007fffdff23758
R10: fffffffffffffcc9 R11: 0000000000000202 R12: 00007fffdff236a0
R13: 0000000000001000 R14: 000000000000000b R15: 0000000000000001
Modules linked in: xenfs ip_tables crct10dif_pclmul crc32_pclmul crc32c_int=
el ghash_clmulni_intel xen_blkfront xen_scsiback target_core_mod xen_netbac=
k xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ZplOxUIsrEyrgofR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2NLuQACgkQ24/THMrX
1yz+hwf8C2I/1ol/x+AdDS05ArYPIwzb4cdZI5k+1dQsBAJUk+JI0OjOQcwh/ONg
/hBnK65cRBtp2zlWfA/K0gCcVBl3MbKMqLH+8DIgT/ACKznHvGUPQCy1QTFKOWCj
+LInx56MUqs10b6oCqW3528C+Qq20TgFactOT+dI5rLp1EJNgM8kQnsBm1afSIZi
gLAnIlw3g6PdrAJI/MZdVn8FBMoPx/RSrW5MsbIOxTrZqIJ28MBupVrSHWuo0CuQ
AwVTvamVZj4hYeUUMxSN0s0OONui9EU7U34RmgqRvldRTWALTTMQt2jPlS3TudPp
urJjj9xnkaZpMVVUYwwHzFA7g41dqg==
=g19Z
-----END PGP SIGNATURE-----

--ZplOxUIsrEyrgofR--


--===============7728576891950012202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7728576891950012202==--

