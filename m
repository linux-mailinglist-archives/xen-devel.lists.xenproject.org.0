Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADk6FG6cj2mxRwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 22:49:34 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0636139AD1
	for <lists+xen-devel@lfdr.de>; Fri, 13 Feb 2026 22:49:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1231903.1536832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr12N-0005JM-QJ; Fri, 13 Feb 2026 21:49:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1231903.1536832; Fri, 13 Feb 2026 21:49:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vr12N-0005GR-MY; Fri, 13 Feb 2026 21:49:19 +0000
Received: by outflank-mailman (input) for mailman id 1231903;
 Fri, 13 Feb 2026 21:49:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y0jx=AR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1vr12M-0005GL-BP
 for xen-devel@lists.xenproject.org; Fri, 13 Feb 2026 21:49:18 +0000
Received: from fout-a3-smtp.messagingengine.com
 (fout-a3-smtp.messagingengine.com [103.168.172.146])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d4f1dbb5-0925-11f1-9ccf-f158ae23cfc8;
 Fri, 13 Feb 2026 22:49:12 +0100 (CET)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfout.phl.internal (Postfix) with ESMTP id 4EED7EC0053;
 Fri, 13 Feb 2026 16:49:11 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Fri, 13 Feb 2026 16:49:11 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Feb 2026 16:49:10 -0500 (EST)
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
X-Inumbo-ID: d4f1dbb5-0925-11f1-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1771019351;
	 x=1771105751; bh=uFxZUYKidy9G3wI7ub9tn8R9QXzhn4ORbEiZ+gPQ2PE=; b=
	uhWkBlNmkoxKar+s1I4bxcerH5hAgK3ULXJmVpRKPUdO+iPageop3aFLv7TrliBc
	rl+SIpFO6xeNIQt7eTaKzt60KFSeS+xo/f7c6K0Wo2wg0pcWXWTjsSFhj2IhK/e0
	k668MJGP8OlaV/QIt+qXzNblqWkgnmiTTYLswz67Eecq0Rd9Yo7T76cGzQWMlIdv
	GCDt91aYwz4gQewIE//SFAtIBQw/KtchD22WzLXQlcS2MciAWGH7+XXKL8sUyBTF
	V+QCUmgjrh6UUEiXCfc2sb+u0J/VuWg+v7sI8SREcr+UcM0VcE+Wta7a3A+6Fn5h
	br4CM8k9GQNzkNShsN226w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1771019351; x=1771105751; bh=uFxZUYKidy9G3wI7ub9tn8R9QXzhn4ORbEi
	Z+gPQ2PE=; b=pyL5sGxEnJnWFjIlyjj+bpYAzY3GrSK4B0G3c3bQvIzD9K3dJI3
	VDB9BGs57dRH4ZGhl+0zG7HGA4AOGDok1zrJ0ZKSuT8IececKCJUJ1Q537yP3rOu
	uXAHm1pL6kGKnZqsJ5WxfoaxqjaMj7EateZdjyQnOO+662A+NyFqAWDlgRRrreYH
	howjo+ZfMrgBMJkBzL1i83bd4XfwX3/FNeSlFxz7Bri3nUq/cWdpMtFtK9/dUqnp
	/hwekLf/1Q5L7thEk5wKFSy0qimW4iVZHNVBJtS9On0G81kduWWryxCG7tuVA0wP
	cbhZsZkDlEUu6gQgyMGvPcynveBFgdrV7Iw==
X-ME-Sender: <xms:V5yPadkPclBz3FOyqxgqMvK3odC4ujZjDaqHap5TLdvzGUyyqTbDbg>
    <xme:V5yPaQStqzbgyslVK1Bz27eof-BmVDfzDASLfWW5lDH_CjsLYQNWMdViTrz4XC2oK
    UuvyXgQYdLw2-P-SbCxhzblx3Tee8QV7PI6jBZOS6Q4nyOWCJ8>
X-ME-Received: <xmr:V5yPaRBLuLDhwALmQkFTrcqk2ZpMSeAIzJXSL88683pOyCadf5K3lMOAYeV14MOSPMUxlaDOVFPCYv1UIVSZX6_XYh6xJt7WAcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvtdelfeejucetufdoteggodetrf
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
X-ME-Proxy: <xmx:V5yPaXTZcs1qb8ojSQXOYZMID0fs1rQwiDMqIzA4njCbC_Ro3CCrCA>
    <xmx:V5yPafpJliKMUjC8wwLR5RQzJvqKWJmqDa17hWtsT50EQ8y63xEVAg>
    <xmx:V5yPaZycfcniAHL7GvzL-L5AOiAC7z6BdM_KuyeTOyQAfb6bHXyIeQ>
    <xmx:V5yPaULg0rrlsVLYukOLulW1AgPHmlFu7h4zAsPnYbwSmXT1mGgF3g>
    <xmx:V5yPaXMLxYDHUCfLRtE_6Qpau_0hrfcj9wY2EVyZhdVjmD3nCCDbS7qu>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 13 Feb 2026 22:49:08 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Cannot boot PVH dom0 with big initrd
Message-ID: <aY-cVHLqLk2BqsnC@mail-itl>
References: <aY6iVr990vWeO2p5@mail-itl>
 <440f94be-77c0-4b28-b107-6efc3623a92f@suse.com>
 <aY9Jt1-jCWhStcxB@Mac.lan>
 <aY-MPz-HpZVkmhob@Mac.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y9wcupkv4ec30jr7"
Content-Disposition: inline
In-Reply-To: <aY-MPz-HpZVkmhob@Mac.lan>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.79 / 15.00];
	SIGNED_PGP(-2.00)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:roger.pau@citrix.com,m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[mailman];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: B0636139AD1
X-Rspamd-Action: no action


--Y9wcupkv4ec30jr7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Feb 2026 22:49:08 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Cannot boot PVH dom0 with big initrd

On Fri, Feb 13, 2026 at 09:40:31PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Fri, Feb 13, 2026 at 04:56:39PM +0100, Roger Pau Monn=C3=A9 wrote:
> > On Fri, Feb 13, 2026 at 09:56:42AM +0100, Jan Beulich wrote:
> > > On 13.02.2026 05:02, Marek Marczykowski-G=C3=B3recki wrote:
> > > > Hi,
> > > >=20
> > > > After fixing the xhci crash, I hit another issue - booting with 236=
MB
> > > > initrd doesn't work, I get:
> > > >=20
> > > >     (XEN) [    3.151856] *** Building a PVH Dom0 ***
> > > >     ...
> > > >     (XEN) [    3.593940] Unable to allocate memory with order 0!
> > > >     (XEN) [    3.597110] Failed to setup Dom0 physical memory map
> > > >     (XEN) [    3.599884]=20
> > > >     (XEN) [    3.602482] ****************************************
> > > >     (XEN) [    3.605272] Panic on CPU 0:
> > > >     (XEN) [    3.607928] Could not construct d0
> > > >     (XEN) [    3.610692] ****************************************
> > > >     (XEN) [    3.613463]=20
> > > >     (XEN) [    3.616035] Reboot in five seconds...
> > > >     (XEN) [    8.626565] Resetting with ACPI MEMORY or I/O RESET_RE=
G.
> > > >=20
> > > > Full console log: https://gist.github.com/marmarek/c9dbc87bf07b76f2=
899781755762f565
> > > >=20
> > > > If I skip initrd, then it boots just fine (but dom0 is not happy ab=
out
> > > > that). 164MB initrd failed too, but 13MB started ok.
> > > > Just in case, I tried skipping XHCI console, but it didn't change
> > > > anything.
> > > >=20
> > > > Host has 16GB of memory, and there is no dom0_mem=3D parameter. Xen=
 is
> > > > started from GRUB, using MB2+EFI.
> > >=20
> > > Hmm, yes, there's an ordering issue: Of course we free initrd space (=
as used
> > > for passing from the boot loader to Xen) only after copying to the de=
signated
> > > guest area. Yet dom0_compute_nr_pages(), intentionally, includes the =
space in
> > > its calculation (adding initial_images_nrpages()'s return value). PV =
Dom0
> > > isn't affected because to load huge initrd there, the kernel has to r=
equest
> > > the initrd to not be mapped into the initial allocation.
> >=20
> > Right, on PV dom0 we do not copy the image to a new set of pages, we
> > simply assign the pages where the initrd resides to the domain.  We
> > can't populate those pages in the p2m as-is, otherwise we would
> > shatter super pages.
> >=20
> > I think the fix below should do it, it's likely the best we can do.
> > Can you please give it a try Marek?
> >=20
> > Thanks, Roger.
> > ---
> > diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
> > index 0b467fd4a4fc..8e3cb5d0db76 100644
> > --- a/xen/arch/x86/dom0_build.c
> > +++ b/xen/arch/x86/dom0_build.c
> > @@ -343,7 +343,7 @@ unsigned long __init dom0_compute_nr_pages(
> > =20
> >      for_each_node_mask ( node, dom0_nodes )
> >          avail +=3D avail_domheap_pages_region(node, 0, 0) +
> > -                 initial_images_nrpages(node);
> > +                 is_pv_domain(d) ? initial_images_nrpages(node) : 0;
> > =20
> >      /* Reserve memory for further dom0 vcpu-struct allocations... */
> >      avail -=3D (d->max_vcpus - 1UL)
>=20
> I'm working on a more complex patch, that attempts to account the
> memory used by the init images towards the reserved amount that's kept
> by Xen.  This should make accounting a bit better, in that we won't
> end up reserving the Xen memory plus the memory used by the init
> images.
>=20
> It's still however a WIP, but would you mind giving it a try?

This one worked :)

    (XEN) [    4.014243] Dom0 memory allocation stats:
    (XEN) [    4.017378] order  0 allocations: 4
    (XEN) [    4.020111] order  1 allocations: 3
    (XEN) [    4.022758] order  2 allocations: 4
    (XEN) [    4.025406] order  3 allocations: 4
    (XEN) [    4.028150] order  4 allocations: 3
    (XEN) [    4.030886] order  5 allocations: 2
    (XEN) [    4.033602] order  6 allocations: 2
    (XEN) [    4.036305] order  7 allocations: 6
    (XEN) [    4.039020] order  8 allocations: 6
    (XEN) [    4.041597] order  9 allocations: 5
    (XEN) [    4.044261] order 10 allocations: 9
    (XEN) [    4.046831] order 11 allocations: 7
    (XEN) [    4.049493] order 12 allocations: 9
    (XEN) [    4.052147] order 13 allocations: 7
    (XEN) [    4.054799] order 14 allocations: 6
    (XEN) [    4.057447] order 15 allocations: 7
    (XEN) [    4.060080] order 16 allocations: 7
    (XEN) [    4.062609] order 17 allocations: 5
    (XEN) [    4.065227] order 18 allocations: 9
    (XEN) [    4.921719] ELF: phdr: paddr=3D0x200000 memsz=3D0x1ff3928
    (XEN) [    4.924403] ELF: phdr: paddr=3D0x2200000 memsz=3D0x1c00000
    (XEN) [    4.927079] ELF: memory: 0x200000 -> 0x3e00000
    (XEN) [    4.929759] ELF: note: PHYS32_RELOC align: 0x200000 min: 0x200=
000 max: 0x3fffffff
    (XEN) [    4.932884] ELF: note: PHYS32_ENTRY =3D 0x16a2ca0
    (XEN) [    4.935921] ELF: note: GUEST_OS =3D "linux"
    (XEN) [    4.938953] ELF: note: GUEST_VERSION =3D "2.6"
    (XEN) [    4.942005] ELF: note: XEN_VERSION =3D "xen-3.0"
    (XEN) [    4.945077] ELF: note: VIRT_BASE =3D 0xffffffff80000000
    (XEN) [    4.948133] ELF: note: INIT_P2M =3D 0x8000000000
    (XEN) [    4.951203] ELF: note: ENTRY =3D 0xffffffff82d3c160
    (XEN) [    4.954221] ELF: note: FEATURES =3D "!writable_page_tables"
    (XEN) [    4.957229] ELF: note: PAE_MODE =3D "yes"
    (XEN) [    4.960175] ELF: note: L1_MFN_VALID
    (XEN) [    4.962775] ELF: note: MOD_START_PFN =3D 0x1
    (XEN) [    4.965675] ELF: note: PADDR_OFFSET =3D 0
    (XEN) [    4.968540] ELF: note: SUPPORTED_FEATURES =3D 0x8801
    (XEN) [    4.971420] ELF: note: LOADER =3D "generic"
    (XEN) [    4.974303] ELF: note: SUSPEND_CANCEL =3D 0x1
    (XEN) [    4.977186] ELF: Found PVH image
    (XEN) [    4.979910] ELF: addresses:
    (XEN) [    4.982237]     virt_base        =3D 0x0
    (XEN) [    4.984694]     elf_paddr_offset =3D 0x0
    (XEN) [    4.987141]     virt_offset      =3D 0x0
    (XEN) [    4.989599]     virt_kstart      =3D 0x200000
    (XEN) [    4.992044]     virt_kend        =3D 0x3e00000
    (XEN) [    4.994498]     virt_entry       =3D 0x16a2ca0
    (XEN) [    4.996966]     p2m_base         =3D 0x8000000000
    (XEN) [    4.999415] ELF: phdr 0 at 0x200000 -> 0x21f3928
    (XEN) [    5.007160] ELF: phdr 1 at 0x2200000 -> 0x3e00000
    (XEN) [    5.055448] Dom0 memory map:
    (XEN) [    5.057763]  [0000000000000000, 000000000009efff] (usable)
    (XEN) [    5.060281]  [000000000009f000, 00000000000fffff] (reserved)
    (XEN) [    5.062812]  [0000000000100000, 000000005471afff] (usable)
    (XEN) [    5.065324]  [000000005471b000, 000000005475bfff] (reserved)
    (XEN) [    5.067891]  [000000005475c000, 0000000063c2dfff] (usable)
    (XEN) [    5.070446]  [0000000063c2e000, 000000006d17afff] (reserved)
    (XEN) [    5.073036]  [000000006d17b000, 000000006d22bfff] (ACPI data)
    (XEN) [    5.075649]  [000000006d22c000, 000000006d2ebfff] (ACPI NVS)
    (XEN) [    5.078267]  [000000006d2ec000, 000000006fffefff] (reserved)
    (XEN) [    5.080908]  [000000006ffff000, 000000006ffffdcb] (usable)
    (XEN) [    5.083560]  [000000006ffffdcc, 000000006ffffe97] (ACPI data)
    (XEN) [    5.086243]  [0000000070000000, 00000000807fffff] (reserved)
    (XEN) [    5.088943]  [00000000c0000000, 00000000cfffffff] (reserved)
    (XEN) [    5.091662]  [00000000fe000000, 00000000fe010fff] (reserved)
    (XEN) [    5.094413]  [00000000fec00000, 00000000fec00fff] (reserved)
    (XEN) [    5.097193]  [00000000fed00000, 00000000fed00fff] (reserved)
    (XEN) [    5.099976]  [00000000fed20000, 00000000fed7ffff] (reserved)
    (XEN) [    5.102779]  [00000000fee00000, 00000000fee00fff] (reserved)
    (XEN) [    5.105615]  [00000000ff000000, 00000001023fffff] (reserved)
    (XEN) [    5.108487]  [0000000102400000, 000000045c89cfff] (usable)
    (XEN) [    5.111354]  [000000045c89d000, 000000047f7fffff] (unusable)
    (XEN) [    5.114263] Initial low memory virq threshold set at 0x4000 pa=
ges.
    (XEN) [    5.117108] Scrubbing Free RAM in background

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Y9wcupkv4ec30jr7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmmPnFQACgkQ24/THMrX
1yytRwf8CbkE+uwZMD5qsnWWXFu72COmXFjCJCoEOQUvb/0PkFXxuFzOgX7oK2fF
zEY0KfyRUxje8lo5SsM2zhWkXAZL24L/F9EdVVU7TgbFkIe1lewbrOpdHGFxlXTu
nGkgDewq4gDufxMaXXFbZ9UksvY+cFNJqc8yE4fsFltC1GBy5HREPVtqQpLJl+0B
YJuy9wdXPQHMfTg6BPskiEaN3pAz6++0O1Hw1gEcEekBCF/StjcejGb6/dztVF5I
w5NlUf9rmCHH1eYYDknbQEPHBVECt04bH+35+ym3/7f2hQ2s+/hQOoATyGq58xRg
H7sIXo76fREm4uWOp9d88DjmCuEE0A==
=OOSS
-----END PGP SIGNATURE-----

--Y9wcupkv4ec30jr7--

