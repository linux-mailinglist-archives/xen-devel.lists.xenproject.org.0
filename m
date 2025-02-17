Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A147A37FC1
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:18:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890001.1299027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCj-0008Qg-OC; Mon, 17 Feb 2025 10:18:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890001.1299027; Mon, 17 Feb 2025 10:18:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCj-0008Nv-LX; Mon, 17 Feb 2025 10:18:21 +0000
Received: by outflank-mailman (input) for mailman id 890001;
 Mon, 17 Feb 2025 10:18:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w4gN=VI=bounce.vates.tech=bounce-md_30504962.67b30ce8.v1-1f2b238252fe47ad80f706973b3bd3fa@srs-se1.protection.inumbo.net>)
 id 1tjyCh-0008Nl-Hv
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:18:19 +0000
Received: from mail13.wdc04.mandrillapp.com (mail13.wdc04.mandrillapp.com
 [205.201.139.13]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80f9017b-ed18-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:18:17 +0100 (CET)
Received: from pmta16.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail13.wdc04.mandrillapp.com (Mailchimp) with ESMTP id 4YxJWr3KK3zNCd9S4
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 10:18:16 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 1f2b238252fe47ad80f706973b3bd3fa; Mon, 17 Feb 2025 10:18:16 +0000
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
X-Inumbo-ID: 80f9017b-ed18-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739787496; x=1740057496;
	bh=qlPp+jB8VBLIbB0yYS5fKXDPMGM/r8nqip5koUnElg0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=IzlFLGztd11tjJq2oDwOQfsfn+GdceLPiE0TznLvHz8lpB3TRpLxACiINgq/+Gy+4
	 Ut79pB9A7GR9XsnZw9vVKbRUForgpIA2uuEWII/qudDG+GuhUppd/TXAsPvCGsNIBT
	 jDGuKA/JJNgHs50zwQc4D1IGMeR9CPuh7fiJDG1sZyo3UYz/dOPbPW+W9UhjC0tRju
	 7/XNanW1vGflhrG3Pt9I4B5p0U/67v273offN+fRWZjnKS4sxOoSzrNuainPMOtsdN
	 JmriPT+gpQlbpPW/Yjic8y/q1rYh8w0aLlV5Ho7zqEzpd98Yttcb1NPaG8M2FDraDp
	 SJfDLyRP1aPSQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739787496; x=1740047996; i=teddy.astie@vates.tech;
	bh=qlPp+jB8VBLIbB0yYS5fKXDPMGM/r8nqip5koUnElg0=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=s2Ln421em8150/vDWcmurh2XfSJXiKLMpRFT5241APkhrh8XjgyTLlasK+C2WHe45
	 lXABQMpW/ZGutE+5hWEO9HFwlFlG6qzvjl8cpSqL2kP0mLV0y6zlIhb2PHznvfUaqM
	 hp+skIzRATS3nDiDf+2Zwfkm98AXo2Ra8t7hUgB+tiGgjUW/oWHjbaZgNzalJsRhse
	 OsKkCjCk7zrTIUYcOKFfbs7ZlwsfY9noIs3CBRFGOen0RRtc5QXhmVaQpR9Ug5NSpZ
	 TJwvy5UquEgP2qsr1iBnDROOL56csykjgIQ7fX57Rz8igRuS9/LyARW3qE1JRmsTKF
	 lJBnQ9r9L70Bw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v6=2000/11]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739787495396
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Mateusz=20M=C3=B3wka?=" <mateusz.mowka@intel.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <cover.1739785339.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.1f2b238252fe47ad80f706973b3bd3fa?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250217:md
Date: Mon, 17 Feb 2025 10:18:16 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This work has been presented at Xen Summit 2024 during the
  IOMMU paravirtualization and Xen IOMMU subsystem rework
design session.

Operating systems may want to have access to a IOMMU in order to do DMA
protection or implement certain features (e.g VFIO on Linux).

VFIO support is mandatory for framework such as SPDK, which can be useful t=
o
implement an alternative storage backend for virtual machines [1].

In this patch series, we introduce in Xen the ability to manage several
contexts per domain and provide a new hypercall interface to allow guests
to manage IOMMU contexts.

The VT-d and AMD-Vi driver is updated to support these new features.

[1] Using SPDK with the Xen hypervisor - FOSDEM 2023
---
Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

PCI Passthrough now work on my side, but things are still feels quite britt=
le.

Changed in v2 :
* fixed Xen crash when dumping IOMMU contexts (using X debug key)
with DomUs without IOMMU
* s/dettach/detach/
* removed some unused includes
* fix dangling devices in contexts with detach

Changed in v3 :
* lock entirely map/unmap in hypercall
* prevent IOMMU operations on dying contexts (fix race condition)
* iommu_check_context+iommu_get_context -> iommu_get_context and check for =
NULL

Changed in v4 :
* Part of initialization logic is moved to domain or toolstack (IOMMU_init)
  + domain/toolstack now decides on "context count" and "pagetable pool siz=
e"
  + for now, all domains are able to initialize PV-IOMMU
* introduce "dom0-iommu=3Dno-dma" to make default context block all DMA
  (disables HAP and sync-pt), enforcing usage of PV-IOMMU for DMA
  Can be used to expose properly "Pre-boot DMA protection"
* redesigned locking logic for contexts
  + contexts are accessed using iommu_get_context and released with iommu_p=
ut_context

Changed in v5 :
* various PCI Passthrough related fixes
  + rewrote parts of PCI Passthrough logic
  + various other related bug fixes
* simplified VT-d DID (for hardware) management by only having one map inst=
ead of two
  (pseudo_domid map was previously used for old quarantine code then recycl=
ed for PV-IOMMU
   in addition to another map also tracing Domain<->VT-d DID, now there is =
only one
   map tracking both making things simpler)
* reworked parts of Xen quarantine logic (needed for PCI Passthrough)
* added cf_check annotations
* some changes to PV-IOMMU headers (Alejandro)

Changed in v6 :
* reorganized the patch series to allow bissecting
   * it is splitted in various smaller patches
* initial AMD-Vi port (it doesn't completely work with PV-IOMMU though, but=
 builds at
  least)
   * AMD-Vi lacks support for iommu_lookup_page (needed for several PV-IOMM=
U ops)

TODO:
* fix some issues with no-dma+PV and grants
* complete "no-dma" mode (expose to toolstack, add documentation, ...)
* properly define nested mode and PASID support
* consider per-iommu domid limit (allocate did on first attach/reattach ?)
* fix ARM/PPC build issues

* make new quarantine code more unity region aware (isolate devices with
  different reserved regions regions using separate 'contexts')
* find a way to make PV-IOMMU work in DomUs (they don't see machine bdf)
* there are corner cases with PV-IOMMU and to-domain Xen PCI Passthrough
  (e.g pci-assignable-remove will reassign to context 0, while the driver
   expects the device to to be in context X)

Teddy Astie (11):
  docs/designs: Add a design document for IOMMU subsystem redesign
  docs/designs: Add a design document for PV-IOMMU
  x86/domain: Defer domain iommu initialization.
  iommu: Move IOMMU domain related structures to (arch_)iommu_context
  iommu: Simplify quarantine logic
  vtd: Remove MAP_ERROR_RECOVERY code path in domain_context_mapping_one
  iommu: Simplify hardware did management
  iommu: Introduce redesigned IOMMU subsystem
  x86/iommu: Introduce IOMMU arena
  iommu: Introduce PV-IOMMU
  iommu: Introduce no-dma feature

 docs/designs/iommu-contexts.md              |  403 +++++
 docs/designs/pv-iommu.md                    |  116 ++
 xen/arch/arm/include/asm/iommu.h            |    4 +
 xen/arch/ppc/include/asm/iommu.h            |    3 +
 xen/arch/x86/domain.c                       |   10 +-
 xen/arch/x86/include/asm/arena.h            |   54 +
 xen/arch/x86/include/asm/iommu.h            |   59 +-
 xen/arch/x86/include/asm/pci.h              |   17 -
 xen/arch/x86/mm/p2m-ept.c                   |    2 +-
 xen/arch/x86/pv/dom0_build.c                |    6 +-
 xen/arch/x86/tboot.c                        |    3 +-
 xen/common/Makefile                         |    1 +
 xen/common/memory.c                         |    4 +-
 xen/common/pv-iommu.c                       |  539 +++++++
 xen/drivers/passthrough/amd/iommu.h         |   21 +-
 xen/drivers/passthrough/amd/iommu_cmd.c     |   20 +-
 xen/drivers/passthrough/amd/iommu_init.c    |   13 +-
 xen/drivers/passthrough/amd/iommu_map.c     |  217 +--
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  346 ++--
 xen/drivers/passthrough/iommu.c             |  735 ++++++++-
 xen/drivers/passthrough/pci.c               |  404 ++---
 xen/drivers/passthrough/vtd/extern.h        |   19 +-
 xen/drivers/passthrough/vtd/iommu.c         | 1612 ++++++-------------
 xen/drivers/passthrough/vtd/iommu.h         |    2 -
 xen/drivers/passthrough/vtd/qinval.c        |    2 +-
 xen/drivers/passthrough/vtd/quirks.c        |   21 +-
 xen/drivers/passthrough/vtd/vtd.h           |    3 +-
 xen/drivers/passthrough/x86/Makefile        |    1 +
 xen/drivers/passthrough/x86/arena.c         |  157 ++
 xen/drivers/passthrough/x86/iommu.c         |  294 +++-
 xen/include/hypercall-defs.c                |    6 +
 xen/include/public/pv-iommu.h               |  343 ++++
 xen/include/public/xen.h                    |    1 +
 xen/include/xen/iommu.h                     |  117 +-
 xen/include/xen/pci.h                       |    3 +
 35 files changed, 3585 insertions(+), 1973 deletions(-)
 create mode 100644 docs/designs/iommu-contexts.md
 create mode 100644 docs/designs/pv-iommu.md
 create mode 100644 xen/arch/x86/include/asm/arena.h
 create mode 100644 xen/common/pv-iommu.c
 create mode 100644 xen/drivers/passthrough/x86/arena.c
 create mode 100644 xen/include/public/pv-iommu.h

-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


