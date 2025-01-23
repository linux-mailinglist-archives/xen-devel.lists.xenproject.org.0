Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18262A1A558
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 14:59:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876261.1286641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taxj7-0008Dt-FF; Thu, 23 Jan 2025 13:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876261.1286641; Thu, 23 Jan 2025 13:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taxj7-0008Bo-Bx; Thu, 23 Jan 2025 13:58:33 +0000
Received: by outflank-mailman (input) for mailman id 876261;
 Thu, 23 Jan 2025 13:58:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AE9i=UP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1taxj5-0008Bi-Qi
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 13:58:31 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f3e3082-d992-11ef-99a4-01e77a169b0f;
 Thu, 23 Jan 2025 14:58:29 +0100 (CET)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id ED8961140086;
 Thu, 23 Jan 2025 08:58:27 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-11.internal (MEProxy); Thu, 23 Jan 2025 08:58:27 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 08:58:25 -0500 (EST)
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
X-Inumbo-ID: 1f3e3082-d992-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737640707;
	 x=1737727107; bh=YNgtDN8MyYrnS0ZAXV//Lsh9jHzupvOzKZGjbiEleBU=; b=
	T/t1zQyZccRUNHXJnOa7D9aKvisiWF/NirT/F4M1mfRjJRmsj0sS3VU05Hw9QFMN
	znnaoQreoB5H1JYxKUVpSQsooFHBlTV5cCFV9sGTLFtCMUka8fiGNGM1214xVomV
	COgO403NpAwyh2rMd12xZg7vN9czKTFhK/hN/GWehEXRRHhiriUxuPb0RnK4DZl7
	DOpib/gU0E1xs6Gc1gaWXYsNY/3cHjLKZwVbOvxgBm/O2/xba4XPq0PogIMN45tu
	6NlKuNqURzGerxN8yEykA0yBcYcWDnsFL73vxDVuPkXaE9ZjVkeUrK+YVF4Cy15J
	+P7XLUIkuydRe64eFLRH3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1737640707; x=1737727107; bh=YNgtDN8MyYrnS0ZAXV//Lsh9jHzupvOzKZG
	jbiEleBU=; b=d+m58byQe4dTIPQhd65N1GZElII5lgFW9SycyderwUs3purGdQO
	L/t0iwyfyEG2li1QVi2N6gVHQTJwQtymnS1w1ZyXDWOHrSId/HylrQ4koh5xvcBN
	Tw02JMElUjp4ST8bH+sU09B6u4UKCHEXRTM1fe0IWVcCOY9l5r+M1dLN/EUiyCh3
	pRG5V/KadO7ncle6ka0UvkIa4Asd17tK61sOkW9kuWK/srlug29JzftlyA6iEaNV
	v2MWADO/c8G9JknIdLZ3Nds2McdEryF9XAMTDB6AS2rs4D8dsqY4X3ZXzm730oBl
	qJ/MVC/4ZMf5pZEKrJkJxz13u6Tl3bgG0Mg==
X-ME-Sender: <xms:A0uSZ-kKP9xjkDnfEO77mkVJuQz6OZZRfSLJxwbLRkO6rWf3e3QO4A>
    <xme:A0uSZ10XZ88kAbPQLwT74IW99q776qzdA0RXIzvUczXnT9XY7E-REsZhFGEaCAPGB
    FpERzAzeq-Lcw>
X-ME-Received: <xmr:A0uSZ8rY_hTn6TjUnwEv7QrJYVYuhsHm73s6wATf8HwZG5mIinnbQoAQhUNc6ajNlatdZEP6gLnHJSD9iRdYTWZb2MSwIQaizw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudekgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeevueejteegleelteduueevhfetgfffjeevtddvgfeiveehteehle
    egueelvdejveenucffohhmrghinhepghhithhlrggsrdgtohhmnecuvehluhhsthgvrhfu
    ihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddtpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehtvgguugihrdgrshhtihgvsehvrghtvghsrd
    htvggthhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhj
    vggtthdrohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrih
    igrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphht
    thhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehsshhtrggsvghllhhinh
    hisehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhi
    gidrtghomhdprhgtphhtthhopehluhhkrghsiieshhgrfihrhihlkhhordhplhdprhgtph
    htthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomh
X-ME-Proxy: <xmx:A0uSZyk2YzID61H9CVcihBzIxEtYKcI8KqdOqJk1IdEGxcX60ImCRw>
    <xmx:A0uSZ82p9k56l4nichfAm1jeqTH5dcoe6ENbmUB67bhSKC3rPl5RLw>
    <xmx:A0uSZ5sWdwsFOT12akfe4ZFQeSPA-y0dIkp5iBk3MYDmwCeJd3dF2g>
    <xmx:A0uSZ4VzhZM-sm5ls4n_9TrRRfUWq8DaI6qQsyLWW7loJOeCt3-HgA>
    <xmx:A0uSZ1tJP1tsDUp3StNq9lcMNq_qA9XEfiXm1dWKW7LgAJojXD2y6qwh>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 23 Jan 2025 14:58:23 +0100
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
Subject: Re: [XEN RFC PATCH v5 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface
Message-ID: <Z5JK_xHjIqvk25VE@mail-itl>
References: <cover.1737470269.git.teddy.astie@vates.tech>
 <Z5I59HC77QxpPtJG@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rwOvWbJJcpXuwh6q"
Content-Disposition: inline
In-Reply-To: <Z5I59HC77QxpPtJG@mail-itl>


--rwOvWbJJcpXuwh6q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jan 2025 14:58:23 +0100
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
Subject: Re: [XEN RFC PATCH v5 0/5] IOMMU subsystem redesign and PV-IOMMU
 interface

On Thu, Jan 23, 2025 at 01:45:40PM +0100, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Jan 21, 2025 at 04:13:20PM +0000, Teddy Astie wrote:
> > This work has been presented at Xen Summit 2024 during the
> >   IOMMU paravirtualization and Xen IOMMU subsystem rework
> > design session.
> >=20
> > Operating systems may want to have access to a IOMMU in order to do DMA
> > protection or implement certain features (e.g VFIO on Linux).
> >=20
> > VFIO support is mandatory for framework such as SPDK, which can be usef=
ul to
> > implement an alternative storage backend for virtual machines [1].
> >=20
> > In this patch series, we introduce in Xen the ability to manage several
> > contexts per domain and provide a new hypercall interface to allow gues=
ts
> > to manage IOMMU contexts.
> >=20
> > The VT-d driver is updated to support these new features.
> >=20
> > [1] Using SPDK with the Xen hypervisor - FOSDEM 2023
> > ---
> > Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> >=20
> > PCI Passthrough now work on my side, but things are still feels quite b=
rittle.
> >=20
> > Changed in v2 :
> > * fixed Xen crash when dumping IOMMU contexts (using X debug key)
> > with DomUs without IOMMU
> > * s/dettach/detach/
> > * removed some unused includes
> > * fix dangling devices in contexts with detach
> >=20
> > Changed in v3 :
> > * lock entirely map/unmap in hypercall
> > * prevent IOMMU operations on dying contexts (fix race condition)
> > * iommu_check_context+iommu_get_context -> iommu_get_context and check =
for NULL
> >=20
> > Changed in v4 :
> > * Part of initialization logic is moved to domain or toolstack (IOMMU_i=
nit)
> >   + domain/toolstack now decides on "context count" and "pagetable pool=
 size"
> >   + for now, all domains are able to initialize PV-IOMMU
> > * introduce "dom0-iommu=3Dno-dma" to make default context block all DMA
> >   (disables HAP and sync-pt), enforcing usage of PV-IOMMU for DMA
> >   Can be used to expose properly "Pre-boot DMA protection"
> > * redesigned locking logic for contexts
> >   + contexts are accessed using iommu_get_context and released with iom=
mu_put_context
> >=20
> > Changed in v5 :
> > * various PCI Passthrough related fixes
> >   + rewrote parts of PCI Passthrough logic
> >   + various other related bug fixes
> > * simplified VT-d DID (for hardware) management by only having one map =
instead of two
> >   (pseudo_domid map was previously used for old quarantine code then re=
cycled for PV-IOMMU
> >    in addition to another map also tracing Domain<->VT-d DID, now there=
 is only one
> >    map tracking both making things simpler)
> > * reworked parts of Xen quarantine logic (needed for PCI Passthrough)
> > * added cf_check annotations
> > * some changes to PV-IOMMU headers (Alejandro)
> >=20
> > TODO:
> > * add stub implementations for bissecting needs and non-ported IOMMU im=
plementations
> > * fix some issues with no-dma+PV and grants
> > * complete "no-dma" mode (expose to toolstack, add documentation, ...)
> > * properly define nested mode and PASID support
> >=20
> > * make new quarantine code more unity region aware (isolate devices with
> >   different reserved regions regions using separate 'contexts')
> > * find a way to make PV-IOMMU work in DomUs (they don't see machine bdf)
> > * there are corner cases with PV-IOMMU and to-domain Xen PCI Passthrough
> >   (e.g pci-assignable-remove will reassign to context 0, while the driv=
er
> >    expects the device to to be in context X)
>=20
> Thanks for the updated patches. I have run them through gitlab-ci, and
> here are some observations:
> - I needed to disable CONFIG_AMD_IOMMU (it fails to build, as expected at=
 this point)
> - I needed to disable pvshim (it fails to build)
> - fails to build with clang: https://gitlab.com/xen-project/people/marmar=
ek/xen/-/jobs/8931373789/viewer#L3525
> - gcc-ibt build fails: https://gitlab.com/xen-project/people/marmarek/xen=
/-/jobs/8931373785#L1314
> - fails to build for ARM (both 32 and 64) and PPC64
> - QEMU smoke test panic with PV dom0, looks like it runs on AMD, so it
>   may be related to the disabled CONFIG_AMD_IOMMU, but I wouldn't expect
>   it to panic on _PV_ dom0 boot...
> - PVH dom0 fails to boot (on real hw) with a lot of VT-d faults: https://=
gitlab.com/xen-project/people/marmarek/xen/-/jobs/8931373875
> - PCI passthrough (with PV dom0) results in a lot of VT-d faults: https:/=
/gitlab.com/xen-project/people/marmarek/xen/-/jobs/8931373881
>=20
> Note this uses only this series, but plain Linux (appears to be 6.1.19).
> IIUC if one doesn't try to configure PV-IOMMU specifically (non-default
> contexts) it should still work.
>=20
> BTW Linux says it detected "Xen version 4.19." - shouldn't it report
> 4.20 already at this point in release cycle?
>=20
> All results:
> https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1637849303

FWIW the test run rebased on staging looks similar:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1638019332

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--rwOvWbJJcpXuwh6q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmeSSv8ACgkQ24/THMrX
1yxJLwf8Dk+VwjjB9TlbQysRYZLQGSCvu+D2io17gZlwLZf2sFTfU0eQw93aWdo2
+qoglODNxc2Z3mW0LwbFAo2rkP01LOt9+TumPMeQ5bl7HboqGW5Q5QpNAtOO5h+O
QZqZcNEjNWX1enG8yyFcEuoDHt9Br9JBOZsijfMUtyxYqQC9baElo71J4PBvdzWc
g3HeEhcvbsjIqHCPjRUV30+AbPl8MtZUer4/Tc0+yjJl9fJDMsCjW2FBGSMjcKD8
ZRCPLaVn8W6Oqj6nZx/9T4uhslcWGmYbu+79jCDVnYsG0VxyVwyS3ooIcsIa1wfs
CNaGQBwi6u88PPBEpGiKD1vkeSnWFw==
=vzyZ
-----END PGP SIGNATURE-----

--rwOvWbJJcpXuwh6q--

