Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZSJeNiFzjmnnCQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 01:41:05 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 113161321DC
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 01:41:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1230029.1535635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqhE8-00006X-N0; Fri, 13 Feb 2026 00:40:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1230029.1535635; Fri, 13 Feb 2026 00:40:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vqhE8-00004z-Gz; Fri, 13 Feb 2026 00:40:08 +0000
Received: by outflank-mailman (input) for mailman id 1230029;
 Fri, 13 Feb 2026 00:40:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vqhE6-0008Ti-Tz
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 00:40:07 +0000
Received: from fout-a5-smtp.messagingengine.com
 (fout-a5-smtp.messagingengine.com [103.168.172.148])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86dceb19-0874-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 01:40:00 +0100 (CET)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfout.phl.internal (Postfix) with ESMTP id 20B9EEC057B;
 Thu, 12 Feb 2026 19:39:59 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-04.internal (MEProxy); Thu, 12 Feb 2026 19:39:59 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Feb 2026 19:39:57 -0500 (EST)
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
X-Inumbo-ID: 86dceb19-0874-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1770943199;
	 x=1771029599; bh=l6+dvC7oQGsMRXxJoZgkw0cTdmvgFwVtF/N7w1xuTZc=; b=
	jkhUik0TFL7rBmTsWfWaAfxFxbK1vammbvdxtNvfwhOpfglCjuuWX/Wc2myAlbl4
	U/YKbU/OdS+P8eB9MLq+L7a5nuICg8luOH69rDSwsOsojUvHCY/r6AT8OzSGW67U
	GXmHLNHsg0i5H1qsgby0hjx03HkD+XuNhQtaySg4+NwahuFHDqQ0Sr8K4OFqAg0U
	8nn8x+bIBYbv2PkicTPFJPsTNML/S+hCuacVbd19gC1Zh5tLCDL26sN3MQqwxghk
	bwWpmZCkkVsj8kTj2tFE+NIyvipav9gmxo1xyq2wm2B0V7jf8qgBzgzKW5l1U6cw
	jpV+v2/wYN5pYmIGfz6Ttg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1770943199; x=1771029599; bh=l6+dvC7oQGsMRXxJoZgkw0cTdmvgFwVtF/N
	7w1xuTZc=; b=tT111+l+MYZqd6ylHZG5dV18KwlKSLPmT/BdduxNsMCmdXyY1/5
	xlPfgjSXOgdlCRBdR6lq+1TYNfIFo7KKUk+qS9N0YcOHhxZDQn9foryymKNpYPFp
	xWgjkNqbWo6I1EH/bBvKldgebBVD8cIlPW9qP+BingxNvO0frzMovbpEYuiUwB+d
	JKhOtSlNQ3iT8zvcPhCpaE85qKlbOyPMdRQ4YtBtPE1znbIoyc2YzTqyIjJs8wJR
	NgZ3cSLKEevh3EANHFTHXfxPmRbHDPj0zSJZrij21XxBQzc7rVqrbABRDQG8WP7v
	ZDDhVtXe/CfKHYxDbEkTArEajDyU2xTjiAg==
X-ME-Sender: <xms:3nKOafgxzarHjh-e494y3pTYBXxsrYV-felWB_clqln4KPTDRmHDCw>
    <xme:3nKOaS79D1DYfkmwvYETYvRlgK049I0Y8DyedogE-V88HrB3nSywKq4U9-CaomPQQ
    C71ikZe6VFE_SoC5kJfw7Mda4UlD543nFEIeVvqGymitED4Nw>
X-ME-Received: <xmr:3nKOaXazwGE6tlL53sO62T_Rh8MuJdYU6Oigc0ERoEgdy5e-rCaDfpmG_6gi6jYGexdVKidefhvpulyVP9CTxIoKsGOVSXaPFe4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdeikeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohephedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojh
    gvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgt
    phhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtghpth
    htohepfihlseigvghnrdhorhhg
X-ME-Proxy: <xmx:3nKOaX6XsQrx83e4iRPoxE96KeY3QIPY8ErrmV6RTHkX448Ca6khTA>
    <xmx:3nKOaaBx9jw-3YACsXyhte8Q2JN1yz55uZJjz4n8pPCk6B1iNFSmTA>
    <xmx:3nKOadd6gOKEUYHH-n9wWiJAhUww_Z16oDq_8QSPs5Dq8HxShrt96A>
    <xmx:3nKOaZK_fuULe10vNS814krRQ-jpNJci1vUWkSb7k8gG7x9hDOOHRA>
    <xmx:33KOaTIDq_gDcNAhsCAoxEh0x2FF2KoQkth51UKH47fB_EgYD1nbYgVk>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Feb 2026 01:39:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Message-ID: <aY5y3GdZyd4j213N@mail-itl>
References: <20230915074347.94712-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9/b+4XTVAfR7TSOW"
Content-Disposition: inline
In-Reply-To: <20230915074347.94712-1-roger.pau@citrix.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:wl@xen.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORWARDED(0.00)[mailman];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 113161321DC
X-Rspamd-Action: no action


--9/b+4XTVAfR7TSOW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Feb 2026 01:39:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference

On Fri, Sep 15, 2023 at 09:43:47AM +0200, Roger Pau Monne wrote:
> The current logic to chose the preferred reboot method is based on the mo=
de Xen
> has been booted into, so if the box is booted from UEFI, the preferred re=
boot
> method will be to use the ResetSystem() run time service call.
>=20
> However, that method seems to be widely untested, and quite often leads t=
o a
> result similar to:
>=20
> Hardware Dom0 shutdown: rebooting machine
> ----[ Xen-4.18-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
> CPU:    0
> RIP:    e008:[<0000000000000017>] 0000000000000017
> RFLAGS: 0000000000010202   CONTEXT: hypervisor
> [...]
> Xen call trace:
>    [<0000000000000017>] R 0000000000000017
>    [<ffff83207eff7b50>] S ffff83207eff7b50
>    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
>    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
>    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
>    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
>    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
>    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
>    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x1=
13/0x129
>    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x=
3eb/0x5f7
>    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
>=20
> ****************************************
> Panic on CPU 0:
> FATAL TRAP: vector =3D 6 (invalid opcode)
> ****************************************
>=20
> Which in most cases does lead to a reboot, however that's unreliable.

It's not relevant anymore, but posting just for the posterity: I
just found yet another system where EFI ResetSystem() crashes. What's
interesting about it, it's rather new system - NUC 14 with Lunar Lake.
It crashes as follows:

    (XEN) ----[ Xen-4.17.6  x86_64  debug=3Dn  Not tainted ]----
    (XEN) CPU:    0
    (XEN) RIP:    e008:[<0000000063907504>] 0000000063907504
    (XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor
    (XEN) rax: 000000006ff4da98   rbx: 000000006ff4dad0   rcx: 000000000000=
0001
    (XEN) rdx: 000000000311100a   rsi: 0000000000000000   rdi: 000000006ffb=
5080
    (XEN) rbp: 0000000000000001   rsp: ffff82d0403ef958   r8:  000000000000=
0000
    (XEN) r9:  000000006ffb5080   r10: 0000000000000836   r11: 000000000000=
0835
    (XEN) r12: 0000000000000000   r13: 000000000311100a   r14: 000000006ffb=
5080
    (XEN) r15: 000000000000001f   cr0: 0000000080050033   cr4: 0000000000d5=
26e0
    (XEN) cr3: 000000046d4e5000   cr2: 0000000063907504
    (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 000000000000=
0000
    (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
    (XEN) Xen code around <0000000063907504> (0000000063907504):
    (XEN)  00 00 00 00 00 00 00 00 <00> 00 00 00 00 00 00 00 00 00 00 00 00=
 00 00 00
    (XEN) Xen stack trace from rsp=3Dffff82d0403ef958:
    (XEN)    000000006fff5b56 ffff82d04059c400 ffff83046f90eed0 00000000000=
00000
    (XEN)    0000000000000014 0000000000000000 0000000000000002 00000000000=
00000
    (XEN)    0000000000000086 0000000000000000 0000000000000001 00000000000=
00000
    (XEN)    ffff82d0403efb00 000000006ffb5080 000000006fff5bde ffff82d0000=
00001
    (XEN)    0000000000000000 000000000311100a 0000000000000000 00000000000=
00000
    (XEN)    ffff83046d500770 ffff83046d44d1f8 0000000000000000 00000000000=
00000
    (XEN)    000000006ffb4844 0000000000000000 0000000000000000 00000000000=
00000
    (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
    (XEN)    000000006ffb4498 0000000000000001 0000000000000001 00000000000=
00046
    (XEN)    ffff83046f90ef84 0000000000000000 0000000000000000 00000000000=
00000
    (XEN)    000000006ffad650 0000000000000000 0000000000000000 00000000000=
00000
    (XEN)    ffff82d0403efb00 0000000000000000 ffff82d0402884c9 ffff8300000=
00000
    (XEN)    ffff82d0402888ac 0000000000000000 ffff82d0403efb40 00000000000=
00004
    (XEN)    000000046d4e5000 000000005484f000 0000000000000004 ffff82d0404=
44b20
    (XEN)    0000000000000046 ffff82d040317b76 ffff82d040317c85 00000000000=
00000
    (XEN)    0000000000000065 ffff83046d44d000 ffff82d0403172e7 00001388403=
efb58
    (XEN)    000082d0403efb60 0000000000000000 0000000000000003 ffff83046d4=
4d000
    (XEN)    0000000000000003 ffff83046d44d1f8 0000000000000000 ffff82d0402=
277d5
    (XEN)    ffff82d040227851 ffff82d040206c27 ffff83046d44d000 00000000000=
54894
    (XEN)    0000000000000000 0000000000054894 ffff82d0402d0a58 00000000004=
6bb48
    (XEN) Xen call trace:
    (XEN)    [<0000000063907504>] R 0000000063907504
    (XEN)    [<000000006fff5b56>] S 000000006fff5b56
    (XEN)    [<ffff82d0402884c9>] S runtime.c#efi_rs_enter.part.0+0xc9/0x120
    (XEN)    [<ffff82d0402888ac>] S efi_reset_system+0x4c/0x90
    (XEN)    [<ffff82d040317b76>] S __stop_this_cpu+0x16/0x40
    (XEN)    [<ffff82d040317c85>] S smp_send_stop+0xc5/0xe0
    (XEN)    [<ffff82d0403172e7>] S machine_restart+0x247/0x330
    (XEN)    [<ffff82d0402277d5>] S shutdown.c#maybe_reboot+0x35/0x40
    (XEN)    [<ffff82d040227851>] S hwdom_shutdown+0x71/0xc0
    (XEN)    [<ffff82d040206c27>] S domain_shutdown+0x47/0x100
    (XEN)    [<ffff82d0402d0a58>] S p2m_add_page+0x4f8/0x7d0
    (XEN)    [<ffff82d0403cb1a4>] S dom0_construct_pvh+0x3b4/0x1300
    (XEN)    [<ffff82d040250e00>] S xhci-dbc.c#dbc_uart_flush+0x50/0x60
    (XEN)    [<ffff82d04022974f>] S timer.c#add_entry+0x4f/0xc0
    (XEN)    [<ffff82d04031af7b>] S time.c#read_counter+0x1b/0x40
    (XEN)    [<ffff82d04031b10c>] S time.c#platform_time_calibration+0x1c/0=
x90
    (XEN)    [<ffff82d0403e5b23>] S construct_dom0+0x63/0xe0
    (XEN)    [<ffff82d0403dbd87>] S __start_xen+0x21a7/0x264a
    (XEN)    [<ffff82d040277284>] S __high_start+0x94/0xa0
    (XEN)=20
    (XEN) Pagetable walk from 0000000063907504:
    (XEN)  L4[0x000] =3D 000000046d4e4063 ffffffffffffffff
    (XEN)  L3[0x001] =3D 0000000054848063 ffffffffffffffff
    (XEN)  L2[0x11c] =3D 80000000638001e3 ffffffffffffffff (PSE)
    (XEN)=20
    (XEN) ****************************************
    (XEN) Panic on CPU 0:
    (XEN) FATAL PAGE FAULT
    (XEN) [error_code=3D0011]
    (XEN) Faulting linear address: 0000000063907504
    (XEN) ****************************************

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9/b+4XTVAfR7TSOW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmOctwACgkQ24/THMrX
1yxEcwf+JxFSB5QCEZQV5WFf1vHNrRKyH6ogOsN0zJ+/F4MGI96TtWdbiWApydEA
0RfzTNV1anx+VPjBWtJlm8zmJn5bKDf3u1QOb2iqWlTprX8v4uYkGWUteyOzYZz3
vgbS9OkzSpUSWHZPX5ogCWVFcd6SXml6ayNgpiMrVFACA/orF0UC0A1fZAoKsUwU
JW161sY8uhs3v1OQZPjgUJi2hjMbFRgpVlooNZ50yxZDLV7nQwykGRTzZ7HuXHFw
7GqrZPLc5PbTlumjRukFx+qYkgQYN8Gdus9LKiGTubCs3xXE3a7OG9YHI10IP496
Ja/7bzMZAMrLYH1V14Eo5kko18qdMw==
=hjwC
-----END PGP SIGNATURE-----

--9/b+4XTVAfR7TSOW--

