Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4713DA39FD3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Feb 2025 15:31:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.891593.1300686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOd8-0002vI-AA; Tue, 18 Feb 2025 14:31:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 891593.1300686; Tue, 18 Feb 2025 14:31:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tkOd8-0002rp-6U; Tue, 18 Feb 2025 14:31:22 +0000
Received: by outflank-mailman (input) for mailman id 891593;
 Tue, 18 Feb 2025 14:31:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rcAO=VJ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1tkOYv-0001OR-CI
 for xen-devel@lists.xenproject.org; Tue, 18 Feb 2025 14:27:01 +0000
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 68c229ee-ee04-11ef-9896-31a8f345e629;
 Tue, 18 Feb 2025 15:26:58 +0100 (CET)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 1AE2C1380A7C;
 Tue, 18 Feb 2025 09:26:57 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Tue, 18 Feb 2025 09:26:57 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 18 Feb 2025 09:26:53 -0500 (EST)
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
X-Inumbo-ID: 68c229ee-ee04-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1739888817;
	 x=1739975217; bh=226vxmhVdYXXGsS5GDnCqdREsA2/b+fdnfGCgVg1yIc=; b=
	kyiZ6RAfAHUgfLnHnHgxp5YjP3rEx+G0vkUlrG0J/+r9/KYw0PrcLK9GJLzmX4Fj
	WOcY+bxt3Or0qsAd9W9rgz7J5lm1jhDK3BaMg0zDMudSuQbvUBJj7pDlPbs6powA
	UEiVH7JnK8yviQkq3scynwaZlGeyPPMlkpS+O6D4qxWfj1ERSsUvupntuWFaUKke
	uVC3KbuoNL+AIa8Fq8bP4Bdmrw9V90d6cfCT1y1V++Yu4DrgSI8K8AMHfJeLuc26
	+OkKKJxXL5eVPdT497Wo8jQ/5qJEsfjMjV8i6sURe4WedfNNnX2TQ6fyx7JPIjdm
	LLGmuwlhX3akIvKFdppA3g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1739888817; x=1739975217; bh=226vxmhVdYXXGsS5GDnCqdREsA2/b+fdnfG
	CgVg1yIc=; b=Yph/YAVTochZYsBvlZqssTb27/zGX4t3JJEhwtZa2R81nBmNKYx
	fSVts8tsYFhcUQ6zqFsdBdmRMDmfZZsCZhSVzhGOlQFTz0GM1hB+XiJq/vhRCSki
	kdh2mn0ivDuQGWeeFib2RODL6F8qTXwCVjYB1571GBiXx8ASgvrk1QoVaC5yMupq
	o+sg22fkdyR0BN9y3UhYTi0tnH7q3ufSwJhdUV0umLup2Ovw3UYN5NMzfPF8wr3/
	Mei5cle/LET+cF6XbIllgxl2go7KAVtOPq2mUHaSSUCi/8T8K9Ukf8/fPxoSfCqB
	11OXoK/CWsM9mSZXd6lc2KCrHf8tR30CHDA==
X-ME-Sender: <xms:r5i0Z97qRZ1AJDDa-gen_MSulc6B3QSVOT0W_tSVzEgwQBbjkuUvUg>
    <xme:r5i0Z66QZhiWnKKw43sUkpxMAIsWytfOFioIe_jPVi7tJSh-oJc4sNVFM0n0cCbzF
    8NRzvy4fhSzJQ>
X-ME-Received: <xmr:r5i0Z0dGcMVL-21OpmB-HmsEavyeSuKcZsMAY3bju00ae0OED7Vn-EPCxgPU5MKZwPmgzkQHSYc2IxHIkK0XpNKwDtF9GP0D7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeiudehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoe
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucgg
    tffrrghtthgvrhhnpeefkedvvdeiheelkeehvefhledthfetfffgfeetvdetlefhtdegud
    euffffvdfgffenucffohhmrghinhepghhithhlrggsrdgtohhmpdhvrghtvghsrdhtvggt
    hhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgt
    phhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthgvugguhidrrg
    hsthhivgesvhgrthgvshdrthgvtghhpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhi
    shhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtoh
    hophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghr
    rghrugesvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlse
    grmhgurdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgt
    phhtthhopehjuhhlihgvnhesgigvnhdrohhrghdprhgtphhtthhopehrohhgvghrrdhprg
    husegtihhtrhhigidrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghr
    nhgvlhdrohhrgh
X-ME-Proxy: <xmx:r5i0Z2IiSZC-DaXfjKp97fHLlQhZfhC2vGZIcIYaV91se4TiikTkyA>
    <xmx:r5i0ZxJ0ow5SFNffOIn21zCujcn3l_aFGY11NlKCB-7a24nBGtgakQ>
    <xmx:r5i0Z_wzXzNanYrt_s9pVNukg_p44Cejs3aizI8OirPWlZc5ZfaQqA>
    <xmx:r5i0Z9IbK0-AHNRU39VIw5F_Di1I30Go--OU_eUjPmuamJfd_4exZw>
    <xmx:sZi0Z67RMT3XNyGwKNzBtueykWBS_e6A2Mg2K1_M6LGEfStbm2owMIOd>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 18 Feb 2025 15:26:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v6 00/11] IOMMU subsystem redesign and PV-IOMMU
 interface
Message-ID: <Z7SYq869AxUr1aqd@mail-itl>
References: <cover.1739785339.git.teddy.astie@vates.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ggEpUawUb1LpMzIj"
Content-Disposition: inline
In-Reply-To: <cover.1739785339.git.teddy.astie@vates.tech>


--ggEpUawUb1LpMzIj
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Feb 2025 15:26:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Teddy Astie <teddy.astie@vates.tech>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Lukasz Hawrylko <lukasz@hawrylko.pl>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Mateusz =?utf-8?B?TcOzd2th?= <mateusz.mowka@intel.com>
Subject: Re: [XEN RFC PATCH v6 00/11] IOMMU subsystem redesign and PV-IOMMU
 interface

On Mon, Feb 17, 2025 at 10:18:17AM +0000, Teddy Astie wrote:
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
> The VT-d and AMD-Vi driver is updated to support these new features.
>=20
> [1] Using SPDK with the Xen hypervisor - FOSDEM 2023
> ---
> Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> PCI Passthrough now work on my side, but things are still feels quite bri=
ttle.

Pipeline:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/1676457780

The passthrough tests on Intel are green, but not on AMD. I don't see
any specific crash, but the device doesn't work (DHCP timeout). Likely
an issue with interrupts.

There are also build failures on ARM...

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
> Changed in v6 :
> * reorganized the patch series to allow bissecting
>    * it is splitted in various smaller patches
> * initial AMD-Vi port (it doesn't completely work with PV-IOMMU though, b=
ut builds at
>   least)
>    * AMD-Vi lacks support for iommu_lookup_page (needed for several PV-IO=
MMU ops)
>=20
> TODO:
> * fix some issues with no-dma+PV and grants
> * complete "no-dma" mode (expose to toolstack, add documentation, ...)
> * properly define nested mode and PASID support
> * consider per-iommu domid limit (allocate did on first attach/reattach ?)
> * fix ARM/PPC build issues
>=20
> * make new quarantine code more unity region aware (isolate devices with
>   different reserved regions regions using separate 'contexts')
> * find a way to make PV-IOMMU work in DomUs (they don't see machine bdf)
> * there are corner cases with PV-IOMMU and to-domain Xen PCI Passthrough
>   (e.g pci-assignable-remove will reassign to context 0, while the driver
>    expects the device to to be in context X)
>=20
> Teddy Astie (11):
>   docs/designs: Add a design document for IOMMU subsystem redesign
>   docs/designs: Add a design document for PV-IOMMU
>   x86/domain: Defer domain iommu initialization.
>   iommu: Move IOMMU domain related structures to (arch_)iommu_context
>   iommu: Simplify quarantine logic
>   vtd: Remove MAP_ERROR_RECOVERY code path in domain_context_mapping_one
>   iommu: Simplify hardware did management
>   iommu: Introduce redesigned IOMMU subsystem
>   x86/iommu: Introduce IOMMU arena
>   iommu: Introduce PV-IOMMU
>   iommu: Introduce no-dma feature
>=20
>  docs/designs/iommu-contexts.md              |  403 +++++
>  docs/designs/pv-iommu.md                    |  116 ++
>  xen/arch/arm/include/asm/iommu.h            |    4 +
>  xen/arch/ppc/include/asm/iommu.h            |    3 +
>  xen/arch/x86/domain.c                       |   10 +-
>  xen/arch/x86/include/asm/arena.h            |   54 +
>  xen/arch/x86/include/asm/iommu.h            |   59 +-
>  xen/arch/x86/include/asm/pci.h              |   17 -
>  xen/arch/x86/mm/p2m-ept.c                   |    2 +-
>  xen/arch/x86/pv/dom0_build.c                |    6 +-
>  xen/arch/x86/tboot.c                        |    3 +-
>  xen/common/Makefile                         |    1 +
>  xen/common/memory.c                         |    4 +-
>  xen/common/pv-iommu.c                       |  539 +++++++
>  xen/drivers/passthrough/amd/iommu.h         |   21 +-
>  xen/drivers/passthrough/amd/iommu_cmd.c     |   20 +-
>  xen/drivers/passthrough/amd/iommu_init.c    |   13 +-
>  xen/drivers/passthrough/amd/iommu_map.c     |  217 +--
>  xen/drivers/passthrough/amd/pci_amd_iommu.c |  346 ++--
>  xen/drivers/passthrough/iommu.c             |  735 ++++++++-
>  xen/drivers/passthrough/pci.c               |  404 ++---
>  xen/drivers/passthrough/vtd/extern.h        |   19 +-
>  xen/drivers/passthrough/vtd/iommu.c         | 1612 ++++++-------------
>  xen/drivers/passthrough/vtd/iommu.h         |    2 -
>  xen/drivers/passthrough/vtd/qinval.c        |    2 +-
>  xen/drivers/passthrough/vtd/quirks.c        |   21 +-
>  xen/drivers/passthrough/vtd/vtd.h           |    3 +-
>  xen/drivers/passthrough/x86/Makefile        |    1 +
>  xen/drivers/passthrough/x86/arena.c         |  157 ++
>  xen/drivers/passthrough/x86/iommu.c         |  294 +++-
>  xen/include/hypercall-defs.c                |    6 +
>  xen/include/public/pv-iommu.h               |  343 ++++
>  xen/include/public/xen.h                    |    1 +
>  xen/include/xen/iommu.h                     |  117 +-
>  xen/include/xen/pci.h                       |    3 +
>  35 files changed, 3585 insertions(+), 1973 deletions(-)
>  create mode 100644 docs/designs/iommu-contexts.md
>  create mode 100644 docs/designs/pv-iommu.md
>  create mode 100644 xen/arch/x86/include/asm/arena.h
>  create mode 100644 xen/common/pv-iommu.c
>  create mode 100644 xen/drivers/passthrough/x86/arena.c
>  create mode 100644 xen/include/public/pv-iommu.h
>=20
> --
> 2.47.2
>=20
>=20
>=20
> Teddy Astie | Vates XCP-ng Developer
>=20
> XCP-ng & Xen Orchestra - Vates solutions
>=20
> web: https://vates.tech
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ggEpUawUb1LpMzIj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAme0mKsACgkQ24/THMrX
1yxSRwf/Uop08/qtTKtOL/4mITtoVGhknY8a493D6pX8m9kmGDiuwUFEnP8+2tSa
O/yOSHY6cjz/xmkJhsP2FSxrw++T39HoDFYk6q8lD+54S7YBneFAg4hdUMXAv3mk
wNT/4AIjea7fmZnJ2wQ3BhFip5cpOTGN1Fpj3NPtuEeJgifQrQCMa3xi0hBCfXeA
QKEYUIPfKn+mkr2de+vDM0wVDrnFHE0/PcvlX33Mlj2ImHh4/0vpXRzaWGsZcPKX
G2xK+oNFFg5Km0agWmfZ6c5j4puq1S48ak38Z2+f3xP/DW5Jn/iYbYlpcJJew63b
3FwUE1tOgNqcTvqzMsNX2vRkj0k/cw==
=N7BE
-----END PGP SIGNATURE-----

--ggEpUawUb1LpMzIj--

