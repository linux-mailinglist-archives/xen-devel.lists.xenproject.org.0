Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id T0PeMZ6ijmm2DQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 05:03:42 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE0F132C9C
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 05:03:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230184.1535746 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqkO6-0003rI-9b; Fri, 13 Feb 2026 04:02:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230184.1535746; Fri, 13 Feb 2026 04:02:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqkO6-0003nk-6Y; Fri, 13 Feb 2026 04:02:38 +0000
Received: by outflank-mailman (input) for mailman id 1230184;
 Fri, 13 Feb 2026 04:02:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vqkO4-0003nb-Fu
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 04:02:36 +0000
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2ca8490-0890-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 05:02:34 +0100 (CET)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 7044914001BF
 for <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 23:02:32 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Thu, 12 Feb 2026 23:02:32 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 12 Feb 2026 23:02:31 -0500 (EST)
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
X-Inumbo-ID: d2ca8490-0890-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:content-type:date:date
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm3; t=1770955352; x=1771041752; bh=LqrcbKpEE6
	zHzzKRIki+3SO+v23akbpECGlbHWTncSE=; b=Zt7zEccvyORKA5Ene7AUUEw9EM
	SHRmUp5ZAwdv31WEUbauWpLL6GhQPq8VCdkQUNXoXxDOPnknM694LMPoorIKgqXw
	U7bngfx7Hjt9gQIvNYkqcPs1vUhuOh0kFTZp/QQ5k37XKq9wI84itXiasxOuNiab
	sxqUpScthYoBjRzatlxyqWSvrxIxoXIyeZL/62ZEI3L5g9+awBMntRclofAsk79X
	1q2GNT6czidxyu+UpckXmwbBuhqbYz7pC7siwrLHMrZhSpF1gnZ5C2atRu6zCEKK
	bs+Hx0DfX+XjLO7RMjmBcGO2iryiyc8gGdhxd4ukM2KFds2FHkSlr2CBUr5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770955352; x=
	1771041752; bh=LqrcbKpEE6zHzzKRIki+3SO+v23akbpECGlbHWTncSE=; b=o
	yMG81pSfNlINJFaeQrZ2rpZ7zv2nJYbU6eoMaRgWEPf1yQvZHTIkCoDZBx4O7Sbp
	QLES6BVlvMl90CHVk/k1CRTRhz88emru9oJpsE1HmdN1+ZCz1PochOMQ7T5AUsTJ
	oo3rf37MQzTDZmPEFEbABYJiY4KZ7jJ/WpsyCcFZsEryR1HfauhptZgarnmcBOkI
	vmb2pXku3nrbyZej1MuHZg7EaEC+lIfRZAJQrpmv9ze3xCWCJE4rSrQsvvEky5Fj
	+p8C0x8hSY9GUvPXjMrctjRBoUbxW+G57S6PKk3b6b+gVhm9WZ2Xixj5UCYtvHmu
	jkh+yMj9VfOmEE7iP+x8A==
X-ME-Sender: <xms:WKKOaYA5D7iihkvr5BkzDa1iZjGugIF-UVsHfoh0rxBKCmqPRdrwZw>
    <xme:WKKOaReQxLRqdjxz6fdlaIkb6-LrBZFUfUCkvQUQggldtD6blGCFbDnJ45iG_HQaN
    gm6yH6JHDCw69wvyP7K8H4nwYr2hZB8gv_Lw-fXwOE_foi0Vg>
X-ME-Received: <xmr:WKKOaRNvfNS7etPT1mz2mN6DED9Ce_8OgHp0f4dn8DLqoFppM38Dfri-euN-LKMzhQkRR-2I7NeZ79PG196ilQiazv1yGJl91cQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdejvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertddtje
    enucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceo
    mhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecugg
    ftrfgrthhtvghrnhepteduteeiudevkeegvefhtdekhfelgffhhedukedvvdeuuddvjeeh
    vddtieehudfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedupdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghn
    phhrohhjvggtthdrohhrgh
X-ME-Proxy: <xmx:WKKOaT7ev4y00zy2VSaqiOCXPqYUif_aVBeEUTShStzAaHMNKFt1Wg>
    <xmx:WKKOadJJqpW0159k_nZ88xTDPSd0JXH6bVnQAaYDAeMzW6Qre6c1jg>
    <xmx:WKKOaVcHF6PHuKE-smiz_8Rm1lYODyStkSkngPTXZklrJj4XwBO7YA>
    <xmx:WKKOaYdTmWacaFycbQeDQB8_rX_0ZkheNMXbEJ2w6-8a2he_ucoeXA>
    <xmx:WKKOaSyzGI_LbFXrYOJeGSOOOaovF196MFOAsNKYR3Wr5PX8qgjAq91F>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Feb 2026 05:02:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Cannot boot PVH dom0 with big initrd
Message-ID: <aY6iVr990vWeO2p5@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rAuO+Q0Dl2rqoauD"
Content-Disposition: inline
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,messagingengine.com:dkim,invisiblethingslab.com:dkim];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 1FE0F132C9C
X-Rspamd-Action: no action


--rAuO+Q0Dl2rqoauD
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Feb 2026 05:02:30 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Cannot boot PVH dom0 with big initrd

Hi,

After fixing the xhci crash, I hit another issue - booting with 236MB
initrd doesn't work, I get:

    (XEN) [    3.151856] *** Building a PVH Dom0 ***
    ...
    (XEN) [    3.593940] Unable to allocate memory with order 0!
    (XEN) [    3.597110] Failed to setup Dom0 physical memory map
    (XEN) [    3.599884]=20
    (XEN) [    3.602482] ****************************************
    (XEN) [    3.605272] Panic on CPU 0:
    (XEN) [    3.607928] Could not construct d0
    (XEN) [    3.610692] ****************************************
    (XEN) [    3.613463]=20
    (XEN) [    3.616035] Reboot in five seconds...
    (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.

Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f289978175=
5762f565

If I skip initrd, then it boots just fine (but dom0 is not happy about
that). 164MB initrd failed too, but 13MB started ok.
Just in case, I tried skipping XHCI console, but it didn't change
anything.

Host has 16GB of memory, and there is no dom0_mem=3D parameter. Xen is
started from GRUB, using MB2+EFI.

When it works (12MB initrd), I get the following info:

    (XEN) [    4.123843] Dom0 memory allocation stats:
    (XEN) [    4.126636] order  0 allocations: 4
    (XEN) [    4.129278] order  1 allocations: 3
    (XEN) [    4.132027] order  2 allocations: 4
    (XEN) [    4.134776] order  3 allocations: 3
    (XEN) [    4.137527] order  4 allocations: 3
    (XEN) [    4.140252] order  5 allocations: 3
    (XEN) [    4.142966] order  7 allocations: 2
    (XEN) [    4.145663] order  8 allocations: 3
    (XEN) [    4.148358] order  9 allocations: 3
    (XEN) [    4.151035] order 10 allocations: 4
    (XEN) [    4.153709] order 11 allocations: 7
    (XEN) [    4.156277] order 12 allocations: 9
    (XEN) [    4.158940] order 13 allocations: 6
    (XEN) [    4.161604] order 14 allocations: 6
    (XEN) [    4.164251] order 15 allocations: 7
    (XEN) [    4.166892] order 16 allocations: 6
    (XEN) [    4.169521] order 17 allocations: 4
    (XEN) [    4.172048] order 18 allocations: 10
    (XEN) [    4.994309] ELF: phdr: paddr=3D0x200000 memsz=3D0x1ff3928
    (XEN) [    4.997011] ELF: phdr: paddr=3D0x2200000 memsz=3D0x1c00000
    (XEN) [    4.999686] ELF: memory: 0x200000 -> 0x3e00000
    (XEN) [    5.002404] ELF: note: PHYS32_RELOC align: 0x200000 min: 0x200=
000 max: 0x3fffffff
    (XEN) [    5.005451] ELF: note: PHYS32_ENTRY =3D 0x16a2ca0
    (XEN) [    5.008519] ELF: note: GUEST_OS =3D "linux"
    (XEN) [    5.011562] ELF: note: GUEST_VERSION =3D "2.6"
    (XEN) [    5.014634] ELF: note: XEN_VERSION =3D "xen-3.0"
    (XEN) [    5.017712] ELF: note: VIRT_BASE =3D 0xffffffff80000000
    (XEN) [    5.020795] ELF: note: INIT_P2M =3D 0x8000000000
    (XEN) [    5.023856] ELF: note: ENTRY =3D 0xffffffff82d3c160
    (XEN) [    5.026924] ELF: note: FEATURES =3D "!writable_page_tables"
    (XEN) [    5.029976] ELF: note: PAE_MODE =3D "yes"
    (XEN) [    5.032882] ELF: note: L1_MFN_VALID
    (XEN) [    5.035516] ELF: note: MOD_START_PFN =3D 0x1
    (XEN) [    5.038442] ELF: note: PADDR_OFFSET =3D 0
    (XEN) [    5.041250] ELF: note: SUPPORTED_FEATURES =3D 0x8801
    (XEN) [    5.044169] ELF: note: LOADER =3D "generic"
    (XEN) [    5.047048] ELF: note: SUSPEND_CANCEL =3D 0x1
    (XEN) [    5.049931] ELF: Found PVH image
    (XEN) [    5.052712] ELF: addresses:
    (XEN) [    5.055090]     virt_base        =3D 0x0
    (XEN) [    5.057552]     elf_paddr_offset =3D 0x0
    (XEN) [    5.060007]     virt_offset      =3D 0x0
    (XEN) [    5.062476]     virt_kstart      =3D 0x200000
    (XEN) [    5.064924]     virt_kend        =3D 0x3e00000
    (XEN) [    5.067380]     virt_entry       =3D 0x16a2ca0
    (XEN) [    5.069841]     p2m_base         =3D 0x8000000000
    (XEN) [    5.072319] ELF: phdr 0 at 0x200000 -> 0x21f3928
    (XEN) [    5.080076] ELF: phdr 1 at 0x2200000 -> 0x3e00000
    (XEN) [    5.090182] Dom0 memory map:
    (XEN) [    5.092531]  [0000000000000000, 000000000009efff] (usable)
    (XEN) [    5.095086]  [000000000009f000, 00000000000fffff] (reserved)
    (XEN) [    5.097625]  [0000000000100000, 000000005471afff] (usable)
    (XEN) [    5.100156]  [000000005471b000, 000000005475bfff] (reserved)
    (XEN) [    5.102704]  [000000005475c000, 0000000063c2dfff] (usable)
    (XEN) [    5.105259]  [0000000063c2e000, 000000006d17afff] (reserved)
    (XEN) [    5.107853]  [000000006d17b000, 000000006d22bfff] (ACPI data)
    (XEN) [    5.110459]  [000000006d22c000, 000000006d2ebfff] (ACPI NVS)
    (XEN) [    5.113082]  [000000006d2ec000, 000000006fffefff] (reserved)
    (XEN) [    5.115726]  [000000006ffff000, 000000006ffffdcb] (usable)
    (XEN) [    5.118388]  [000000006ffffdcc, 000000006ffffe97] (ACPI data)
    (XEN) [    5.121080]  [0000000070000000, 00000000807fffff] (reserved)
    (XEN) [    5.123776]  [00000000c0000000, 00000000cfffffff] (reserved)
    (XEN) [    5.126498]  [00000000fe000000, 00000000fe010fff] (reserved)
    (XEN) [    5.129244]  [00000000fec00000, 00000000fec00fff] (reserved)
    (XEN) [    5.132001]  [00000000fed00000, 00000000fed00fff] (reserved)
    (XEN) [    5.134797]  [00000000fed20000, 00000000fed7ffff] (reserved)
    (XEN) [    5.137619]  [00000000fee00000, 00000000fee00fff] (reserved)
    (XEN) [    5.140436]  [00000000ff000000, 00000001023fffff] (reserved)
    (XEN) [    5.143271]  [0000000102400000, 0000000468b34fff] (usable)
    (XEN) [    5.146131]  [0000000468b35000, 000000047f7fffff] (unusable)
    (XEN) [    5.149015] Initial low memory virq threshold set at 0x4000 pa=
ges.
    (XEN) [    5.151852] Scrubbing Free RAM in background
    (XEN) [    5.154667] Std. Loglevel: All
    (XEN) [    5.157465] Guest Loglevel: All
    (XEN) [    5.160250] Xen is relinquishing VGA console.
    (XEN) [    5.166762] *** Serial input to DOM0 (type 'CTRL-a' three time=
s to switch input)
    (XEN) [    5.167550] Re-running stub recovery selftests...
    (XEN) [    5.167692] Fixup #UD[0000]: ffff82d07fffe044 [ffff82d07fffe04=
4] -> ffff82d0403b8753
    (XEN) [    5.167914] Fixup #GP[0000]: ffff82d07fffe045 [ffff82d07fffe04=
5] -> ffff82d0403b8753
    (XEN) [    5.168139] Fixup #SS[0000]: ffff82d07fffe044 [ffff82d07fffe04=
4] -> ffff82d0403b8753
    (XEN) [    5.168359] Fixup #BP[0000]: ffff82d07fffe045 [ffff82d07fffe04=
5] -> ffff82d0403b8753
    (XEN) [    5.168662] Freed 720kB init memory
    (XEN) [    6.884758] d0v0: upcall vector f3

Interestingly, this appear to have worked on Xen 4.19.3.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rAuO+Q0Dl2rqoauD
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmOolYACgkQ24/THMrX
1yxVqwf9GfdG0bARTV/AM84KSWr2FdWr+RIUpTDW5FUr3OgWnwPokbO+StETmk+6
8rreqys8ODYbXaS+IWsJWosin7mA5B1tJcU4I7lvT4pAmbuT7nR/wPYmsBl0PTCB
dYSeI7b0OmXl/1XR0gTW5MPBLHSRmlLWHPdOR+KCPbxb20BWldSPlOqoIwfBT0aL
+3VwojIi1WBNNgiSKJ3x1REW/JAOuCwvtsC7rHmlHc4QaeuWhIv6/CN63q6fl+3o
I0dUfiR8w8F//6iyGFh1e9kT2kGrG53Pti0AGu9PTWJu1KKEiSoT40W2Ph7NOcqY
ImKublw9WKg/B4XfjxDjYpbZzZGN1A==
=+ykz
-----END PGP SIGNATURE-----

--rAuO+Q0Dl2rqoauD--

