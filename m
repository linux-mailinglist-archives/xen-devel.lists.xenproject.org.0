Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77DEC73A1A
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166856.1493279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Xw-0001SP-QG; Thu, 20 Nov 2025 11:09:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166856.1493279; Thu, 20 Nov 2025 11:09:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Xw-0001PJ-MJ; Thu, 20 Nov 2025 11:09:52 +0000
Received: by outflank-mailman (input) for mailman id 1166856;
 Thu, 20 Nov 2025 11:09:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=O4pg=54=bounce.vates.tech=bounce-md_30504962.691ef6f7.v1-3a7b79b5db2c42199b36281b832d96ce@srs-se1.protection.inumbo.net>)
 id 1vM2Xu-0001P8-Gh
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:09:50 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6b1c68ef-c601-11f0-980a-7dc792cee155;
 Thu, 20 Nov 2025 12:09:45 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwbq1Nx6zCf9P17
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:09:43 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 3a7b79b5db2c42199b36281b832d96ce; Thu, 20 Nov 2025 11:09:43 +0000
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
X-Inumbo-ID: 6b1c68ef-c601-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763636983; x=1763906983;
	bh=HcGtXUeNdCp+wbDiufqVXTOGkEfP6WR8yDN0dbvMJLY=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=h4dcy7Y/rNCT16HgaNyADBMbaEjIco6RmPunr+wwOSJGlnjvCBNITuEMxafAzSuRi
	 fmHr3wqGFy+sKSwcnTuLTNYRsVPE1uCKFrwO2eLwzUgciUBPICEH52DNDebgBIu48N
	 yMjFrybCfDZWOJfdAfr0ltMWy9GsXrD5TExQ3zy4q5nvKyYPlxBHRlaWZoH8TK8c2o
	 uZJC9INX4iAdWrINrY8hPBK/scVnSYjcetPwJf9kzxCnhAPsJSDOIp9xTN9bnFaXKw
	 v6ZpcfA/T6T2XwSdDLsuXYVAFCLr0O8B2RZOYPEvGT5VMiBIqYro1oGUNhe8N2ld07
	 qu9qhCA/P3zyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763636983; x=1763897483; i=teddy.astie@vates.tech;
	bh=HcGtXUeNdCp+wbDiufqVXTOGkEfP6WR8yDN0dbvMJLY=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=horE0Y9oNUhGBIc6/Hpcfc2TVcqCoS8czwNyFd0aVBsm5Ccx6eiVhcHrPgn+w1O8x
	 iNaB2Rk0FFQ+B5wnnZG6Kf9NU40hl+8ahygWwcRVuNHjPuN+Mi1Q5GISQRv8KSfXBs
	 ZXBe39CS4xsRYvzTkAJ0/iy8MqUoUVuZZVZR23AsFPXoFluwSu5QsQRMvd8pwZW0ij
	 OfXiJuy/MSaKt4CXBCOr2iqknuy6MSPpElf/bCmq4XOCNOPOZ4rv2mcN0jSw3BCDpV
	 4t1G/jOiXIShdDp+syf4XCoJg5p7zMKIr+wH8SEloMqxSlEX3PQ4JgT9Rqf5Fjd5fV
	 Es0YRUNs3f4hQ==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2000/14]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763636982365
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Anthony PERARD" <anthony.perard@vates.tech>, "Michal Orzel" <michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Stefano Stabellini" <sstabellini@kernel.org>, "Bertrand Marquis" <bertrand.marquis@arm.com>, "Volodymyr Babchuk" <Volodymyr_Babchuk@epam.com>, "Timothy Pearson" <tpearson@raptorengineering.com>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Mateusz=20M=C3=B3wka?=" <mateusz.mowka@intel.com>, "Jason Andryuk" <jason.andryuk@amd.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.3a7b79b5db2c42199b36281b832d96ce?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:09:43 +0000
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
"IOMMU contexts" per domain and provide a new hypercall interface to allow
guests to manage IOMMU contexts.

The VT-d and AMD-Vi drivers are updated to support these new features.
Work still remain to do for ARM/PPC/RISC-V.

Assuming appropriate Dom0 drivers, aside the capability to use VFIO in Dom0=
,
it also changes the way Linux performs DMA with devices to rely on the "IOM=
MU"
(thus "PV-IOMMU") instead of assuming all of it is device-visible and event=
ually
relying on the swiotlb. (this behavior can be disabled with Linux's iommu=
=3Dpt).

In this case, address space of device is no longer tied to the p2m, causing=
 all
modifications of p2m (e.g grant, foreign) to no longer require a IOTLB flus=
h (usually
on unmap, when using Dom0 PVH or dom0-iommu=3Dstrict).
That makes virtualized I/O vastly better with PVH Dom0, at least on Intel p=
latform.

On a Intel i5-4670 platform

PVH Dom0 with current Xen behavior or with iommu=3Dpt:
iperf VM -> Dom0: ~600 Mbps

PVH Dom0 with Dom0 IOMMU driver and iommu=3Dnopt (usually default):
iperf VM -> Dom0: ~7 Gbps (~11x performance increase)

Dom0 driver branch (until a make a new patch):
https://gitlab.com/xen-project/people/tsnake41/linux/-/tree/xen-pviommu-6.1=
8

[1] Using SPDK with the Xen hypervisor - FOSDEM 2023
---
This is a RFC, things are still experimental at this state.

Cc: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

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

Changed in v7 :
* Proper AMD-Vi support for PV-IOMMU, mostly works with some quirks (e.g 'A=
MD IOMMU' devices
  that are visible for Dom0, but doesn't exist from PV-IOMMU point of view)
* splitted some parts of patches to smaller ones
* fixed numerous issues
 * a notable one being a ASSERT in PV-IOMMU map operation due to problemati=
c foreign page
   reference counting
* fixed typo in design document
* introduce a transient "invalid context" ID for devices that aren't handle=
d yet
* add proper "no-dma" documentation

TODO:
* Proper cleanup of AMD-Vi mappings (for ctx_no !=3D 0)
* consider per-iommu domid limit (allocate did on first attach/reattach ?)
* ARM implementation
* properly define nested mode and PASID support
* define how PV-IOMMU should behave in DomUs (e.g they don't see machine bd=
f) 
 * especially regarding how to expose "no-dma" mode

* better quarantine code (e.g isolate devices with different reserved regio=
ns
  regions using separate 'contexts')
* there are corner cases with PV-IOMMU and to-domain Xen PCI Passthrough
  (e.g pci-assignable-remove will reassign to context 0, while the driver
   expects the device to to be in context X)

Teddy Astie (14):
  docs/designs: Add a design document for IOMMU subsystem redesign
  docs/designs: Add a design document for PV-IOMMU
  x86/domain: Defer domain iommu initialization.
  iommu: Move IOMMU domain related structures to (arch_)iommu_context
  iommu: Simplify quarantine logic
  vtd: Remove MAP_ERROR_RECOVERY code path in domain_context_mapping_one
  iommu: Simplify hardware did management
  iommu: Introduce redesigned IOMMU subsystem
  iommu: Provide 'X' debug key to dump IOMMU context infos
  amd/iommu: Introduce lookup implementation
  iommu: Introduce iommu_get_max_iova
  x86/iommu: Introduce IOMMU arena
  iommu: Introduce PV-IOMMU
  iommu: Introduce no-dma feature

 docs/designs/iommu-contexts.md              |  403 +++++
 docs/designs/pv-iommu.md                    |  118 ++
 docs/misc/xen-command-line.pandoc           |   16 +-
 xen/arch/arm/include/asm/iommu.h            |    4 +
 xen/arch/ppc/include/asm/iommu.h            |    3 +
 xen/arch/x86/domain.c                       |   10 +-
 xen/arch/x86/include/asm/arena.h            |   54 +
 xen/arch/x86/include/asm/iommu.h            |   59 +-
 xen/arch/x86/include/asm/pci.h              |   17 -
 xen/arch/x86/mm/p2m-ept.c                   |    2 +-
 xen/arch/x86/pv/dom0_build.c                |    6 +-
 xen/arch/x86/tboot.c                        |    3 +-
 xen/arch/x86/x86_64/mm.c                    |    3 +-
 xen/common/Makefile                         |    1 +
 xen/common/memory.c                         |    4 +-
 xen/common/pv-iommu.c                       |  554 +++++++
 xen/drivers/passthrough/amd/iommu.h         |   23 +-
 xen/drivers/passthrough/amd/iommu_cmd.c     |   20 +-
 xen/drivers/passthrough/amd/iommu_init.c    |   57 +-
 xen/drivers/passthrough/amd/iommu_map.c     |  307 ++--
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  411 +++--
 xen/drivers/passthrough/iommu.c             |  751 ++++++++-
 xen/drivers/passthrough/pci.c               |  394 ++---
 xen/drivers/passthrough/vtd/extern.h        |   19 +-
 xen/drivers/passthrough/vtd/iommu.c         | 1623 ++++++-------------
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
 xen/include/xen/iommu.h                     |  122 +-
 xen/include/xen/pci.h                       |    3 +
 37 files changed, 3777 insertions(+), 2040 deletions(-)
 create mode 100644 docs/designs/iommu-contexts.md
 create mode 100644 docs/designs/pv-iommu.md
 create mode 100644 xen/arch/x86/include/asm/arena.h
 create mode 100644 xen/common/pv-iommu.c
 create mode 100644 xen/drivers/passthrough/x86/arena.c
 create mode 100644 xen/include/public/pv-iommu.h

-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech



