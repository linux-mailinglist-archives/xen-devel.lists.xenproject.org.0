Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111AAA1A488
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jan 2025 13:45:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.876224.1286600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawaj-0004ow-OE; Thu, 23 Jan 2025 12:45:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 876224.1286600; Thu, 23 Jan 2025 12:45:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tawaj-0004nB-LZ; Thu, 23 Jan 2025 12:45:49 +0000
Received: by outflank-mailman (input) for mailman id 876224;
 Thu, 23 Jan 2025 12:45:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AE9i=UP=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tawai-0004n3-Kn
 for xen-devel@lists.xenproject.org; Thu, 23 Jan 2025 12:45:48 +0000
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f69ceb7c-d987-11ef-a0e5-8be0dac302b0;
 Thu, 23 Jan 2025 13:45:46 +0100 (CET)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 2B4CD11401D2;
 Thu, 23 Jan 2025 07:45:45 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-09.internal (MEProxy); Thu, 23 Jan 2025 07:45:45 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 07:45:42 -0500 (EST)
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
X-Inumbo-ID: f69ceb7c-d987-11ef-a0e5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1737636345;
	 x=1737722745; bh=TofuWM/fl1i1a2ILH9a2CAZzsCjC8894mdpIvVDFors=; b=
	G5bWwLAqhkIMmHYH4NcSlOzKVL5ZQc9THB+qvoxChNpymTE29Wo0tuvf/Keyek4a
	HYWgaMKYYQDtaDafA+dr7cztILUobfwRuSGu9gmZdib7s083RheLmZJi0rArWEX1
	TB0d4Lf6Mz4hB6QgmKAtZ0Vly6eyY+l+hnywfqnL8NVkb2c3x7W/FqrskiMecDyA
	TJkxFqVo3kEktaPpYXR/nx7wyA1GiuQ6stYr1jE8n8uVTq/SiAxT3o3kh0R4WnIg
	bhd4VBeKjYETMOzAsrayX0wpJSv27lTcOwUS349NMkXwW0lgPpeu51yF5bQweqzY
	4f4HmIudEEU6zYdTFucqpg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1737636345; x=1737722745; bh=TofuWM/fl1i1a2ILH9a2CAZzsCjC8894mdp
	IvVDFors=; b=XLpV2HmQSds/RKll3XcSGmGv3tXcJDTJd+USTvwhiey5e7R5uNJ
	heCW/xuV97sTEzUsrqw+yTUs/h//In6gtOivVgHsBsu5RIH5u3XIIxZseaHDD5Jf
	ercjqsiqUiTghPGCQA1jeU3N6B2AxgdU2x1wn4gaEJkwB32FUpiSjHk84SiJBrtO
	Ooo0dOV5tv3aElq/fk/vkhXVa8+klSX/2rJlf7ajTB4Uc7gFPvahVhzeMeklj1/d
	xmJVoc1BYYHCZvPlu604HNFPjzUst3iGIFrcepwTjs2uAgxxlx/Inlta0dgExGWP
	xXwmwWxFxM2Ig5kSkSAhuCzC2sElWrwMv4Q==
X-ME-Sender: <xms:-DmSZ0SwfLolv3InxvjN8ZB-qsYk31AKWPQNOWKuIBH3E7KVJOPe3A>
    <xme:-DmSZxxBGizebaBvs7LC68RSf7ZCFyj9pFaTgufBPImY4DpTJGSZcyk8w4DE3Du3y
    AC93Uw3ShqrHw>
X-ME-Received: <xmr:-DmSZx053aJVoZqGD6eZCoS0MedSuQf3d3JzSXSmUheJ8Q0qg6doA1tQh9aZtIBxqSN7rQ6Q4fDTGzOL9HhBNUXFg7qq9edkPg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgudejtdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:-DmSZ4DLICvu5itXTjjk7XALaw7IkvXG0aklmPDNmeH5bOg0cq1QXg>
    <xmx:-DmSZ9hpD6oD0Kt9WdZJwUeGoawQOOL1wNulKTpsoWGRYGa1I0NuPQ>
    <xmx:-DmSZ0q9rqV61EsK0Si1KXKs7fMMqHLTXC5EqUjK0g-WLEFaFDQlng>
    <xmx:-DmSZwimTKg6LEDwoz3viP1cORbZCgFey3IcViO1bhLQ4XRZkof8Kg>
    <xmx:-TmSZyYiBNO9xT_AkTzyb_TlnmQm7CilKGi9e3MrtBluCStLgj51_pLg>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 23 Jan 2025 13:45:40 +0100
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
Message-ID: <Z5I59HC77QxpPtJG@mail-itl>
References: <cover.1737470269.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="32bNM4k22C4EMmMr"
Content-Disposition: inline
In-Reply-To: <cover.1737470269.git.teddy.astie@vates.tech>


--32bNM4k22C4EMmMr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jan 2025 13:45:40 +0100
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

On Tue, Jan 21, 2025 at 04:13:20PM +0000, Teddy Astie wrote:
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
> Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> PCI Passthrough now work on my side, but things are still feels quite bri=
ttle.
>=20
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
> Changed in v5 :
> * various PCI Passthrough related fixes
>   + rewrote parts of PCI Passthrough logic
>   + various other related bug fixes
> * simplified VT-d DID (for hardware) management by only having one map in=
stead of two
>   (pseudo_domid map was previously used for old quarantine code then recy=
cled for PV-IOMMU
>    in addition to another map also tracing Domain<->VT-d DID, now there i=
s only one
>    map tracking both making things simpler)
> * reworked parts of Xen quarantine logic (needed for PCI Passthrough)
> * added cf_check annotations
> * some changes to PV-IOMMU headers (Alejandro)
>=20
> TODO:
> * add stub implementations for bissecting needs and non-ported IOMMU impl=
ementations
> * fix some issues with no-dma+PV and grants
> * complete "no-dma" mode (expose to toolstack, add documentation, ...)
> * properly define nested mode and PASID support
>=20
> * make new quarantine code more unity region aware (isolate devices with
>   different reserved regions regions using separate 'contexts')
> * find a way to make PV-IOMMU work in DomUs (they don't see machine bdf)
> * there are corner cases with PV-IOMMU and to-domain Xen PCI Passthrough
>   (e.g pci-assignable-remove will reassign to context 0, while the driver
>    expects the device to to be in context X)

Thanks for the updated patches. I have run them through gitlab-ci, and
here are some observations:
- I needed to disable CONFIG_AMD_IOMMU (it fails to build, as expected at t=
his point)
- I needed to disable pvshim (it fails to build)
- fails to build with clang: https://gitlab.com/xen-project/people/marmarek=
/xen/-/jobs/8931373789/viewer#L3525
- gcc-ibt build fails: https://gitlab.com/xen-project/people/marmarek/xen/-=
/jobs/8931373785#L1314
- fails to build for ARM (both 32 and 64) and PPC64
- QEMU smoke test panic with PV dom0, looks like it runs on AMD, so it
  may be related to the disabled CONFIG_AMD_IOMMU, but I wouldn't expect
  it to panic on _PV_ dom0 boot...
- PVH dom0 fails to boot (on real hw) with a lot of VT-d faults: https://gi=
tlab.com/xen-project/people/marmarek/xen/-/jobs/8931373875
- PCI passthrough (with PV dom0) results in a lot of VT-d faults: https://g=
itlab.com/xen-project/people/marmarek/xen/-/jobs/8931373881

Note this uses only this series, but plain Linux (appears to be 6.1.19).
IIUC if one doesn't try to configure PV-IOMMU specifically (non-default
contexts) it should still work.

BTW Linux says it detected "Xen version 4.19." - shouldn't it report
4.20 already at this point in release cycle?

All results:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1637849303

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--32bNM4k22C4EMmMr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmeSOfQACgkQ24/THMrX
1yy23Qf/VqNuCnbQxBHQKAHSWNWRUK0dvuqV2bJy4fuSf3Bgmeg/Sz/Z/gC18wlE
8j2L0Er75l83wtLmBHBotoRbDgvV63sLraXxxUoG3JLBwTvW41p1ls+gYIDaGP3k
qW1poGb2kFmCHg2KchpIkM6MnKaYSIM3vqcTrnENx4KD02PyBrrhL7kOb154Qy2E
bgIEDKmerrgiZ17FsV6VIUUk1KVuX5uiWPmSGQl9hWD78A1wlmhrY7uOKXzzGn3t
+b4Qz/ybU0JMg6+eShGECJ0tMD65eCdEo98JSk6nGhVIuQA0H4FZC5KcF6IB5zag
hHipWqLBnfs9rFNrQaXpQpdwjvpTdQ==
=D+Ls
-----END PGP SIGNATURE-----

--32bNM4k22C4EMmMr--

