Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMmADdOZj2lQRwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 22:38:27 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E87D139A41
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 22:38:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231884.1536811 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr0qt-000378-JW; Fri, 13 Feb 2026 21:37:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231884.1536811; Fri, 13 Feb 2026 21:37:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr0qt-00035X-GL; Fri, 13 Feb 2026 21:37:27 +0000
Received: by outflank-mailman (input) for mailman id 1231884;
 Fri, 13 Feb 2026 21:37:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vr0qs-00035R-6l
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 21:37:26 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ecd5bb2-0924-11f1-b163-2bf370ae4941;
 Fri, 13 Feb 2026 22:37:24 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id B64BDEC0567;
 Fri, 13 Feb 2026 16:37:22 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 13 Feb 2026 16:37:22 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Feb 2026 16:37:21 -0500 (EST)
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
X-Inumbo-ID: 2ecd5bb2-0924-11f1-b163-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1771018642;
	 x=1771105042; bh=O6jHHUVsnoUSNGl0mp7ZdgncM209k3vxT25kXidpJZo=; b=
	dvySc9e22qcjMlq99bbzRbYhTCP3J+yI4hPEw/LME+K5/v5cryDJIbas8bJLWsL+
	Sx6axIiOrwOzQCgobHYbBBMBRlzP98CUKIsAjDJ5rPnglt6YmIWQPNMqugTrCAaB
	NdKZNhapXXwuHeiBo2o+GbkO7P8ynjdDXjRTkEWdp/iWImXfPVHwPVtWaohJYKyp
	g4P8RFi50vGvAWge9dgptBvx24vf76ObnkHAXGfKPZ5FwjiiCX7RYLTu3Vz/6NXE
	kzalpoDBrojOZFOhtfNTlCl3O/r9gJsyRwPDwVL4dMaSZqY9Ipcdo9tX1V8aGXpG
	b86Qx83oF0uzztKctYAfxA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771018642; x=1771105042; bh=O6jHHUVsnoUSNGl0mp7ZdgncM209k3vxT25
	kXidpJZo=; b=jxBcoQX1IEv8f83Y61J6yL1RhfnFC1VORX7IWgIobJBUpB8HNQX
	rk8zK0/81eNXF9KGRNh1YDmqCtsW4QR3FPaA8YOB1RqBRIX7fM87tCYcJ/dRGipE
	75f6yspjJA66Z9USUtYLwRMKbywBAmDnJdPqedO1OMHjvEaLp3yCiz6xAz5NEWRG
	3pQ19CCPsVRtTDz1J2H/Mx2IYwukK+H3nv7WZ71mJi5URBS8p4xmmY3ezoHUHvg0
	b/bbV8DG1xwR0k1ex3feSaDyTd0yZAFcoOg5CqFcg79UdmO/l3aWvoaMDyhDCWy7
	CV07fe2ezWM6CqaxEFcEDsDz0dZh22AjOkw==
X-ME-Sender: <xms:kpmPacOIHmcWNE9uGBV_9VkSMxj5OEv-EM3WxNlxIHJkLVZ7dT0XSQ>
    <xme:kpmPaaZkdTbLps6u6L3Aw3X_4DMv6_GnURGmxWsBoNNh18MnsNhMHYCnrpxd0shdQ
    rRw-APKQbOvAqcxZa0De8zr9d0e8Q8NYqvF9jSDS5HSWM2Uk8o>
X-ME-Received: <xmr:kpmPaQoH75nWGNNg97kiCx7zJUHid-Czxw3H4dYKh7ZTiZ4T523Y54QMFBBZ7fWRRc-1vBbpPV6Q0uWh8mgBMZ6yfZfuRFYhHhY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdelfeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepueekteet
    gefggfekudehteegieeljeejieeihfejgeevhfetgffgteeuteetueetnecuffhomhgrih
    hnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
    mhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhopehjsggvuh
    hlihgthhesshhushgvrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishht
    shdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:kpmPaeZ-G118TDhXmeEBXteF8ELBV2iiL9hp7IHcnS9Tl1LdppWyDg>
    <xmx:kpmPaYQnITPa48UdEz09DemgNz_7ljMDkVb722PqAq-jrJfHOJk31A>
    <xmx:kpmPaV7s337ojuWHBCXOPd2xpjv4RrIhxT6oq0rVbE39ZiVGokl1rg>
    <xmx:kpmPadwhLwwzWDaNp4PwedhnTkHsKflMW-1hETsKByrUQ-emAWNxsQ>
    <xmx:kpmPadVqyLZV0uWOaOes3Lv6OsAAiBqUuFNzWZHpfwwAs3jS59DfZyXb>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Feb 2026 22:37:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Cannot boot PVH dom0 with big initrd
Message-ID: <aY-Zj8MbM3_HyV3E@mail-itl>
References: <aY6iVr990vWeO2p5@mail-itl>
 <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com>
 <aY9Jt1-jCWhStcxB@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JsQupDVTPitSrll8"
Content-Disposition: inline
In-Reply-To: <aY9Jt1-jCWhStcxB@Mac.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_ALL(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,invisiblethingslab.com:dkim];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
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
X-Rspamd-Queue-Id: 4E87D139A41
X-Rspamd-Action: no action


--JsQupDVTPitSrll8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Feb 2026 22:37:19 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Cannot boot PVH dom0 with big initrd

On Fri, Feb 13, 2026 at 04:56:39PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 13, 2026 at 09:56:42AM +0100, Jan Beulich wrote:
> > On 13.02.2026 05:02, Marek Marczykowski-G=C3=B3recki wrote:
> > > Hi,
> > >=20
> > > After fixing the xhci crash, I hit another issue - booting with 236MB
> > > initrd doesn't work, I get:
> > >=20
> > >     (XEN) [    3.151856] *** Building a PVH Dom0 ***
> > >     ...
> > >     (XEN) [    3.593940] Unable to allocate memory with order 0!
> > >     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
> > >     (XEN) [    3.599884]=20
> > >     (XEN) [    3.602482] ****************************************
> > >     (XEN) [    3.605272] Panic on CPU 0:
> > >     (XEN) [    3.607928] Could not construct d0
> > >     (XEN) [    3.610692] ****************************************
> > >     (XEN) [    3.613463]=20
> > >     (XEN) [    3.616035] Reboot in five seconds...
> > >     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_REG.
> > >=20
> > > Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f289=
9781755762f565
> > >=20
> > > If I skip initrd, then it boots just fine (but dom0 is not happy about
> > > that). 164MB initrd failed too, but 13MB started ok.
> > > Just in case, I tried skipping XHCI console, but it didn't change
> > > anything.
> > >=20
> > > Host has 16GB of memory, and there is no dom0_mem=3D parameter. Xen is
> > > started from GRUB, using MB2+EFI.
> >=20
> > Hmm, yes, there's an ordering issue: Of course we free initrd space (as=
 used
> > for passing from the boot loader to Xen) only after copying to the desi=
gnated
> > guest area. Yet dom0_compute_nr_pages(), intentionally, includes the sp=
ace in
> > its calculation (adding initial_images_nrpages()'s return value). PV Do=
m0
> > isn't affected because to load huge initrd there, the kernel has to req=
uest
> > the initrd to not be mapped into the initial allocation.
>=20
> Right, on PV dom0 we do not copy the image to a new set of pages, we
> simply assign the pages where the initrd resides to the domain.  We
> can't populate those pages in the p2m as-is, otherwise we would
> shatter super pages.
>=20
> I think the fix below should do it, it's likely the best we can do.
> Can you please give it a try Marek?

With this, it's different:

    (XEN) [    4.510345] Dom0 memory allocation stats:
    (XEN) [    4.513110] order  0 allocations: 1
    (XEN) [    4.515847] order  1 allocations: 1
    (XEN) [    4.518593] order  2 allocations: 2
    (XEN) [    4.521329] order  3 allocations: 2
    (XEN) [    4.524076] order  4 allocations: 1
    (XEN) [    4.526799] order  5 allocations: 1
    (XEN) [    4.529518] order  6 allocations: 1
    (XEN) [    4.532118] order  7 allocations: 2
    (XEN) [    4.534807] order  8 allocations: 2
    (XEN) [    4.537483] order  9 allocations: 1
    (XEN) [    4.540052] order 10 allocations: 2
    (XEN) [    4.542618] order 11 allocations: 2
    (XEN) [    4.545276] order 12 allocations: 1
    (XEN) [    4.547949] order 13 allocations: 1
    (XEN) [    4.550501] order 14 allocations: 1
    (XEN) [    4.553147] order 15 allocations: 1
    (XEN) [    5.393487] ELF: phdr: paddr=3D0x200000 memsz=3D0x1ff3928
    (XEN) [    5.396196] ELF: phdr: paddr=3D0x2200000 memsz=3D0x1c00000
    (XEN) [    5.398891] ELF: memory: 0x200000 -> 0x3e00000
    (XEN) [    5.401592] ELF: note: PHYS32_RELOC align: 0x200000 min: 0x200=
000 max: 0x3fffffff
    (XEN) [    5.404632] ELF: note: PHYS32_ENTRY =3D 0x16a2ca0
    (XEN) [    5.407695] ELF: note: GUEST_OS =3D "linux"
    (XEN) [    5.410748] ELF: note: GUEST_VERSION =3D "2.6"
    (XEN) [    5.413810] ELF: note: XEN_VERSION =3D "xen-3.0"
    (XEN) [    5.416891] ELF: note: VIRT_BASE =3D 0xffffffff80000000
    (XEN) [    5.419976] ELF: note: INIT_P2M =3D 0x8000000000
    (XEN) [    5.423062] ELF: note: ENTRY =3D 0xffffffff82d3c160
    (XEN) [    5.426155] ELF: note: FEATURES =3D "!writable_page_tables"
    (XEN) [    5.429260] ELF: note: PAE_MODE =3D "yes"
    (XEN) [    5.432343] ELF: note: L1_MFN_VALID
    (XEN) [    5.434952] ELF: note: MOD_START_PFN =3D 0x1
    (XEN) [    5.437975] ELF: note: PADDR_OFFSET =3D 0
    (XEN) [    5.440928] ELF: note: SUPPORTED_FEATURES =3D 0x8801
    (XEN) [    5.443871] ELF: note: LOADER =3D "generic"
    (XEN) [    5.446785] ELF: note: SUSPEND_CANCEL =3D 0x1
    (XEN) [    5.449696] ELF: Found PVH image
    (XEN) [    5.452574] ELF: addresses:
    (XEN) [    5.455002]     virt_base        =3D 0x0
    (XEN) [    5.457569]     elf_paddr_offset =3D 0x0
    (XEN) [    5.460102]     virt_offset      =3D 0x0
    (XEN) [    5.462569]     virt_kstart      =3D 0x200000
    (XEN) [    5.465049]     virt_kend        =3D 0x3e00000
    (XEN) [    5.467515]     virt_entry       =3D 0x16a2ca0
    (XEN) [    5.469983]     p2m_base         =3D 0x8000000000
    (XEN) [    5.472465] ELF: phdr 0 at 0x200000 -> 0x21f3928
    (XEN) [    5.480548] ELF: phdr 1 at 0x2200000 -> 0x3e00000
    (XEN) [    5.487915] Unable to find a memory region to load initrd and =
metadata
    (XEN) [    5.490466] Failed to load Dom0 kernel
    (XEN) [    5.492954]=20
    (XEN) [    5.495266] ****************************************
    (XEN) [    5.497755] Panic on CPU 0:
    (XEN) [    5.500065] Could not construct d0
    (XEN) [    5.502470] ****************************************
    (XEN) [    5.504897]=20
    (XEN) [    5.507134] Reboot in five seconds...
    (XEN) [   10.517191] Resetting with ACPI MEMORY or I/O RESET_REG.

FWIW memory map is in the full console dump linked earlier.

I'll test the other patch next.

> ---
> diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> index 0b467fd4a4fc..8e3cb5d0db76 100644
> --- a/xen/arch/x86/dom0_build.c
> +++ b/xen/arch/x86/dom0_build.c
> @@ -343,7 +343,7 @@ unsigned long __init dom0_compute_nr_pages(
> =20
>      for_each_node_mask ( node, dom0_nodes )
>          avail +=3D avail_domheap_pages_region(node, 0, 0) +
> -                 initial_images_nrpages(node);
> +                 is_pv_domain(d) ? initial_images_nrpages(node) : 0;
> =20
>      /* Reserve memory for further dom0 vcpu-struct allocations... */
>      avail -=3D (d->max_vcpus - 1UL)
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--JsQupDVTPitSrll8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmPmY8ACgkQ24/THMrX
1yygMwf+OViSapZ+FzO33whx5jKuHIuzKPziLofD8wwQkpUNqoGMfKA/QtJcgq8A
29SmyRRMvVjt6Xd8Rgc6a0nJBKOjmuli9NIiaPJ5Yvy0TLBHb7uGG0ypo8RwfM1b
wjrsm3v0bpyD2dzbN7mgBpywFtdNwgzGqHiFE7BPdd1nIEf+Z61ilqP/ygbFKIBf
kM7Mjlf0hPplMvxloqw8LeZ/ewI1SOepEuXpN4/wK8tO2kYtwPtZriq1dqhjaB3O
RXFFSQzNnhgTSIoLkXdrEXPWtSEmoaTwT+N/GuZA8mBMIY1oUH2ZJ9SS3VM6j+zz
IPa3jFF4lkXDcEn/U3xuUhF+b/qcrw==
=Qgaz
-----END PGP SIGNATURE-----

--JsQupDVTPitSrll8--

