Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DE0A06BEA
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jan 2025 04:14:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.867789.1279345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVizA-0000AN-89; Thu, 09 Jan 2025 03:13:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 867789.1279345; Thu, 09 Jan 2025 03:13:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tVizA-00007r-5A; Thu, 09 Jan 2025 03:13:28 +0000
Received: by outflank-mailman (input) for mailman id 867789;
 Thu, 09 Jan 2025 03:13:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eYg4=UB=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tViz8-00006B-Ar
 for xen-devel@lists.xenproject.org; Thu, 09 Jan 2025 03:13:26 +0000
Received: from fout-b2-smtp.messagingengine.com
 (fout-b2-smtp.messagingengine.com [202.12.124.145])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aeb9fdde-ce37-11ef-99a4-01e77a169b0f;
 Thu, 09 Jan 2025 04:13:23 +0100 (CET)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.stl.internal (Postfix) with ESMTP id 76D671140115;
 Wed,  8 Jan 2025 22:13:21 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Wed, 08 Jan 2025 22:13:21 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jan 2025 22:13:18 -0500 (EST)
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
X-Inumbo-ID: aeb9fdde-ce37-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1736392401;
	 x=1736478801; bh=cR6ccP5DFYB7kn+Faf0luNzEduPpGXKTNSRDekWDv3c=; b=
	NwIEOslt+RQZPmtHMJY/DRbg4wBDysINA5Yn+oGTQ4aCtaxCt4tCyukBse+0lTqW
	QOjXQjC9fTeVbnWX226KkO1vHaVwp+/mCr11kXCvJdlCIY78xV+MmKMzs8H9tAMm
	OvEGDEHAUHZvQdpr1m+SxOY47Kn1s9aXKmZ4awRaGZhdgF3GwmHGbHykot9fKW+P
	5pJIs+2PY8CD8N00KYDP5JUZlsOnipDoZh+P9tVwd5R09iGBGX9yhM/dOe5lyKWx
	cgXS86q09J3/T8d0utHYOTdUXfC+gwnchv/9uEGCoblwza6ePQQMVzbFCnLDfLCT
	U5fa1BYO5tECsWnHzJZBIg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1736392401; x=1736478801; bh=cR6ccP5DFYB7kn+Faf0luNzEduPpGXKTNSR
	DekWDv3c=; b=CLxVdFPH3wllyngzUCs+it0uNrlH1ZQQhs/1Fo7JrWHD9PEiXFV
	IEy+vG4QWlcnWAQcy6aKrpnZU21GELTZcIOxVjWLQvgoBw45Su5xYPWKX+9ZUhxz
	ruWr+Pz10o+abmhHkBOKAgbCXM07hFi/6Zbkr1NjFkcrQ5pc39vlO9xflyoOnvqd
	Ah1D2v8gdjTOKik2whd9QSqkCJqtPAg8J9URFWTbBxcx2VpCvqb4KUYwvwoamUNs
	ExRuxN63HAMeDiYfkeFHYf7NbFcGX9J+glfd7vSBrVZpzgwb7Xb1Y3vb4JqEMMCe
	TGF7Wm6xKJPaFudCNHdl5WFo+Z5pZVMzIfw==
X-ME-Sender: <xms:0D5_Z5jciJsjkjxlEW-J6nKXEUEHRr9SfKJ7qvQmYv8yRxWG0I2orQ>
    <xme:0D5_Z-CYjKMWp4wwwWooYsBuqhTxhsz1iecqrAX-XkxtH8TwEtQF5KE5l0u-tWLur
    3Lv_JeP4KSOhA>
X-ME-Received: <xmr:0D5_Z5GvFhpo1BLXNqriMnT9NmCrfP-siTtAUpA4Bgw_e0ObRC1tbEZvqUrng6dGMJhSFnQpa-aJU1VhtnOfnX4O92OUEAcjRw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeghedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepueekteetgefggfekudehteegieeljeejieeihfejgeevhfetgffgte
    euteetueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedutddpmhhouggv
    pehsmhhtphhouhhtpdhrtghpthhtohepthgvugguhidrrghsthhivgesvhgrthgvshdrth
    gvtghhpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgv
    tghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgvrhefsegtihhtrhhigi
    drtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhmpdhrtghpthht
    ohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohepshhsthgrsggvlhhlihhnih
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihig
    rdgtohhmpdhrtghpthhtoheplhhukhgrshiisehhrgifrhihlhhkohdrphhlpdhrtghpth
    htohepughpshhmihhthhesrghpvghrthhushhsohhluhhtihhonhhsrdgtohhm
X-ME-Proxy: <xmx:0D5_Z-Ry9FksaEFI8JORpLUUzhay7-zs2_QoZeWwsZH-AbWg9wPzpw>
    <xmx:0D5_Z2yHwcpVqLnXiVnhXxcaRs-vb6DV091HdrxquSD1W1PA3nNFZA>
    <xmx:0D5_Z05NiDTuQImtMMJ8NGH98bJxw8qXb6vZsrDp_aaClSaPE98OMw>
    <xmx:0D5_Z7yPAi4xxNfNY2CWj3Z0FfzDfkBdrh8-PkVV_YJKrhWVzEjyZg>
    <xmx:0T5_Z7rMiGtrMZoFnWft8fCqyXLVIzi5qkb9XsQhZ5SvhKQqrpfYV4YX>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 9 Jan 2025 04:13:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v4 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface
Message-ID: <Z38-y9xR-6C_sARJ@mail-itl>
References: <cover.1730718102.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2eaxd8hbGHv9qt/u"
Content-Disposition: inline
In-Reply-To: <cover.1730718102.git.teddy.astie@vates.tech>


--2eaxd8hbGHv9qt/u
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 9 Jan 2025 04:13:15 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v4 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface

On Mon, Nov 04, 2024 at 02:28:38PM +0000, Teddy Astie wrote:
> This work has been presented at Xen Summit 2024 during the
>   IOMMU paravirtualization and Xen IOMMU subsystem rework
> design session.
>=20
> Operating systems may want to have access to a IOMMU in order to do DMA
> protection or implement certain features (e.g VFIO on Linux).
>=20
> VFIO support is mandatory for framework such as SPDK, which can be useful=
 to
> implement an alternative storage backend for virtual machines [1].
>=20
> In this patch series, we introduce in Xen the ability to manage several
> contexts per domain and provide a new hypercall interface to allow guests
> to manage IOMMU contexts.
>=20
> The VT-d driver is updated to support these new features.
>=20
> [1] Using SPDK with the Xen hypervisor - FOSDEM 2023
> ---
> Changed in v2 :
> * fixed Xen crash when dumping IOMMU contexts (using X debug key)
> with DomUs without IOMMU
> * s/dettach/detach/
> * removed some unused includes
> * fix dangling devices in contexts with detach
>=20
> Changed in v3 :
> * lock entirely map/unmap in hypercall
> * prevent IOMMU operations on dying contexts (fix race condition)
> * iommu_check_context+iommu_get_context -> iommu_get_context and check fo=
r NULL
>=20
> Changed in v4 :
> * Part of initialization logic is moved to domain or toolstack (IOMMU_ini=
t)
>   + domain/toolstack now decides on "context count" and "pagetable pool s=
ize"
>   + for now, all domains are able to initialize PV-IOMMU
> * introduce "dom0-iommu=3Dno-dma" to make default context block all DMA
>   (disables HAP and sync-pt), enforcing usage of PV-IOMMU for DMA
>   Can be used to expose properly "Pre-boot DMA protection"
> * redesigned locking logic for contexts
>   + contexts are accessed using iommu_get_context and released with iommu=
_put_context
>=20
> TODO:
> * add stub implementations for bissecting needs and non-ported IOMMU impl=
ementations
> * fix some issues with no-dma+PV and grants
> * complete "no-dma" mode (expose to toolstack, add documentation, ...)
> * properly define nested mode and PASID support

Hi,

I finally got time to try this revision (sorry it took so long!). My
goal was to test it this time with some HVM domU too. I didn't get very
far...

Issues I hit:

1. AMD IOMMU driver is not converted (fails to build), for now disabled
   CONFIG_AMD_IOMMU.
2. PV shim build fails (linker fails to find p2m_add_identity_entry
   symbol referenced from iommu.c)
3. Xen complains on boot about missing endbr64 (surprisingly, it didn't
   exploded):

    (XEN) alt table ffff82d0404234d8 -> ffff82d040432d82
    (XEN) altcall iommu_get_max_iova+0x11/0x30 dest iommu.c#intel_iommu_get=
_max_iova has no endbr64
    (XEN) altcall context.c#iommu_reattach_phantom+0x30/0x50 dest iommu.c#i=
ntel_iommu_add_devfn has no endbr64
    (XEN) altcall context.c#iommu_detach_phantom+0x25/0x40 dest iommu.c#int=
el_iommu_remove_devfn has no endbr64
    (XEN) altcall iommu_context_init+0x27/0x40 dest iommu.c#intel_iommu_con=
text_init has no endbr64
    (XEN) altcall iommu_attach_context+0x3c/0xd0 dest iommu.c#intel_iommu_a=
ttach has no endbr64
    (XEN) altcall context.c#iommu_attach_context.cold+0x1d/0x53 dest iommu.=
c#intel_iommu_detach has no endbr64
    (XEN) altcall iommu_detach_context+0x37/0xa0 dest iommu.c#intel_iommu_d=
etach has no endbr64
    (XEN) altcall iommu_reattach_context+0x95/0x240 dest iommu.c#intel_iomm=
u_reattach has no endbr64
    (XEN) altcall context.c#iommu_reattach_context.cold+0x29/0x110 dest iom=
mu.c#intel_iommu_reattach has no endbr64
    (XEN) altcall iommu_context_teardown+0x3f/0xa0 dest iommu.c#intel_iommu=
_context_teardown has no endbr64
    (XEN) altcall pci.c#deassign_device+0x99/0x270 dest iommu.c#intel_iommu=
_add_devfn has no endbr64

4. Starting a HVM domU with PCI device fails with:

    libxl: libxl_pci.c:1552:pci_add_dm_done: Domain 1:xc_assign_device fail=
ed: No space left on device
    libxl: libxl_pci.c:1875:device_pci_add_done: Domain 1:libxl__device_pci=
_add failed for PCI device 0:aa:0.0 (rc -3)
    libxl: libxl_create.c:2061:domcreate_attach_devices: Domain 1:unable to=
 add pci devices

I didn't change anything in the toolstack - maybe default context needs
to be initialized somehow? But the docs suggest the default context
should work out of the box. On the other hand, changelog for v4 says
some parts are moved to the toolstack, but I don't see any changes in
tools/ in this series...

FWIW The exact version I tried is this (this series, on top of staging +
qubes patches):
https://github.com/QubesOS/qubes-vmm-xen/pull/200
At this stage, dom0 kernel didn't have PV-IOMMU driver included yet.

Full Xen log, with some debug info collected:
https://gist.github.com/marmarek/e7ac2571df033c7181bf03f21aa5f9ab

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2eaxd8hbGHv9qt/u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmd/PssACgkQ24/THMrX
1ywr9wf/Qv4RzieRjyc+zxLq8Klw4GrZRFE7/iQyidtypTBufGCju0g3JVwROHpC
p1C3+NL08uNdzwzxbqWu9gfj0J6pHWIZRlkSEMTi7rGkAXt0t6oU5LEAPMQTMc+g
tM5koEKqemkMrdknlmr2wKEfLEZaok73yjj2KEMCG4Fq6wx0oc/TpsM+JcpcY8jt
wofvIJQccAoRi2P9agLySXE0JlVWyssnCI2kkVhezc0U8wmYnPXOKZIbqNNWh9FH
EYmvRsysKdA/WuWsc0kM+81lfUvqA1F36DL0NiA2HoWBz9mwAwPdNJhKWlcFACpb
U0evuzJtKE0OBc9+FRvY1EkE4lmbMw==
=1XLc
-----END PGP SIGNATURE-----

--2eaxd8hbGHv9qt/u--

