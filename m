Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C80C408B55
	for <lists+xen-devel@lfdr.de>; Mon, 13 Sep 2021 14:50:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.185662.334346 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPlPX-0002Z3-52; Mon, 13 Sep 2021 12:50:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 185662.334346; Mon, 13 Sep 2021 12:50:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mPlPX-0002WE-1k; Mon, 13 Sep 2021 12:50:11 +0000
Received: by outflank-mailman (input) for mailman id 185662;
 Mon, 13 Sep 2021 12:50:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6NeP=OD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mPlPW-0002W7-0A
 for xen-devel@lists.xenproject.org; Mon, 13 Sep 2021 12:50:10 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 203fb624-1491-11ec-b3af-12813bfff9fa;
 Mon, 13 Sep 2021 12:50:09 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 53C05320089C;
 Mon, 13 Sep 2021 08:50:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Mon, 13 Sep 2021 08:50:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 13 Sep 2021 08:50:04 -0400 (EDT)
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
X-Inumbo-ID: 203fb624-1491-11ec-b3af-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=+ThLjayzZvSuiYey9xMndGiL316IC
	WP/XAzfhhK/XQ4=; b=QST6alfCdjmOCJeMGPiFrbgPY5XjwFUFGqt7uplIpJaKM
	eOo5VPdGZNeqchyNdUioX5D59OJCHQqjuJCpn2yZfUjxMNzZqYGD7oXSBKnRlcjE
	+/gBKlFfB7clEc1X4X896LpSW/ZoR4FZo6+ZIEP9esVsj2Qq+gb+T8IoxBfdT04P
	X2jATdlr+XyVZ8O8jnV7F7Uc7jsdp2zzPvBBMDH10d1WtW/EkERxHxOB0wKokST/
	9ONDWkrRpMjK6EHU8xe6DkOtmwcq6+WkrTki4K8XG8VLVZR6wlzcA7pA6vhnFAL7
	gDgFNGUrdNlU1rCoW3NxnbG8NlC5AxEv/yKdGmB9g==
X-ME-Sender: <xms:_Ug_YVjbwJME2flgxQg8EG093FJAH83V1xzhn76vfmBOLlFvuaxKmA>
    <xme:_Ug_YaCQRPtXrpy7VzQWGhl_XYYb_YlsubjGJ1vSMh2vP8xTq-Sbre4U-GEjRxBEv
    wVz2QKMwT043A>
X-ME-Received: <xmr:_Ug_YVGsAaE2InIUPwj3dgND8IpwphXc8FmKrBTuYzv_3DfKuvzMB8Pxefk6zQndbuDuZmQsp9s_wWWOogPMwsLD7lvsSISN>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudegjedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeklefhveej
    teeghfeiteevtddtueffieehgfelgfevffejveeuffdvgeffgeevkeenucffohhmrghinh
    epghhithhhuhgsuhhsvghrtghonhhtvghnthdrtghomhdpkhgvrhhnvghlrdhorhhgnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrg
    hrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:_Ug_YaSQFmzELwJQ2aSVEWDx7qZEoBEyqr_jL6D1ADJBgxCRc7i0eA>
    <xmx:_Ug_YSyyAhfr6QgEpqJxG_ocJvrppdZHVEYD8tMGUqArflpMLv12tw>
    <xmx:_Ug_YQ4BsCHyuxb-pgCDS-0OxvAT3jIcCHPKuiVIxyMb8_SUuo5KAQ>
    <xmx:_kg_Ycs6Dm-J7IrZ6PdbMG6iQzxNcuEsMbjYTyjRniYXwvkgwF4JyQ>
Date: Mon, 13 Sep 2021 14:50:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux 5.13+ as Xen dom0 crashes on Ryzen CPU (ucode loading related?)
Message-ID: <YT9I+Xs9wOPVCIVd@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5CWEI5nLGyVosQus"
Content-Disposition: inline


--5CWEI5nLGyVosQus
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Sep 2021 14:50:00 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Mike Rapoport <rppt@linux.ibm.com>
Cc: Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>, x86@kernel.org,
	linux-kernel@vger.kernel.org,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux 5.13+ as Xen dom0 crashes on Ryzen CPU (ucode loading related?)

Hi,

Since 5.13, the Xen (PV) dom0 crashes on boot, before even printing the
kernel version.
Test environment:
 - Xen 4.14.2
 - AMD Ryzen 5 4500U (reported also on AMD Ryzen 7 4750U)
 - Linux 5.13.13, confirmed also on 5.14

The crash happens only if the initramfs has earlycpio with microcode.
I don't have a serial console, but I've got a photo with crash message
(from Xen, Linux doesn't managed to print anything):
https://user-images.githubusercontent.com/726704/133084966-5038f37e-001b-46=
88-9f90-83d09be3dc2d.jpg

Transcription of some of it:

    mapping kernel into physical memory
    about to get started
    (XEN) Pagetable walk from ffffffff82810888:
    (XEN)  L4[0x1ff] =3D 0000000332815067 0000000000002815
    (XEN)  L3[0x1fe] =3D 0000000332816067 0000000000002816
    (XEN)  L2[0x014] =3D 0000000334018067 0000000000004018
    (XEN)  L1[0x010] =3D 0000000332810067 0000000000002810
    (XEN) domain_crash_sync called from entry.S: fault at ffff82d04033e790 =
x86_64/entry.S#domain_crash_page_fault
    (XEN) Domain 0 (vcpu#0) crashed on cpu#0:
    (XEN) ----[ Xen-4.14.2  x86_64  debug=3Dn  Not tainted ]----
    (XEN) CPU:    0
    (XEN) RIP:    e033:[<0000000000000000>]

I've bisected it down to the commit a799c2bd29d19c565f37fa038b31a0a1d44d0e4d

    x86/setup: Consolidate early memory reservations

    The early reservations of memory areas used by the firmware, bootloader,
    kernel text and data are spread over setup_arch(). Moreover, some of th=
em
    happen *after* memblock allocations, e.g trim_platform_memory_ranges() =
and
    trim_low_memory_range() are called after reserve_real_mode() that alloc=
ates
    memory.

    There was no corruption of these memory regions because memblock always
    allocates memory either from the end of memory (in top-down mode) or ab=
ove
    the kernel image (in bottom-up mode). However, the bottom up mode is go=
ing
    to be updated to span the entire memory [1] to avoid limitations caused=
 by
    KASLR.

    Consolidate early memory reservations in a dedicated function to improve
    robustness against future changes. Having the early reservations in one
    place also makes it clearer what memory must be reserved before memblock
    allocations are allowed.

    Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
    Signed-off-by: Borislav Petkov <bp@suse.de>
    Reviewed-by: Baoquan He <bhe@redhat.com>
    Acked-by: Borislav Petkov <bp@suse.de>
    Acked-by: David Hildenbrand <david@redhat.com>
    Link: [1] https://lore.kernel.org/lkml/20201217201214.3414100-2-guro@fb=
=2Ecom
    Link: https://lkml.kernel.org/r/20210302100406.22059-2-rppt@kernel.org

Since this seems to affect Xen boot only, I'm copying xen-devel too.

Any ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--5CWEI5nLGyVosQus
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmE/SPgACgkQ24/THMrX
1yyKTAf/RFLXnOX6sQx74ErcNKHowyeAVTrcIbactKB5dIcODunG+9eHXFR/HSk/
7ywnpCcFHZCjha5xx+ShTaskQ89yDEiE9jLIFwR7sQKxucRXoCcAAkJufYYxRbbQ
qYHUrOFFXeNFtEc73mZrbfqguc3y8Xm6BYBdzcHcgVk+bZCD5BY8A+A0FdKbm0rM
1E+AfbfIdN5avDDxBgy3xa+DVF1ksmZwZ4tbKDizZ2azkK+WMgPL6h+Hk718OA86
9TAXsPlotdMBsYFcFDvXBkKDQYN42+y/A6DOFmasUTsGw0xFroU/YpfarKnWq9OZ
w7lWKDBmRMV8wH25LAIXltai+6G1tA==
=GguL
-----END PGP SIGNATURE-----

--5CWEI5nLGyVosQus--

