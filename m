Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E06A181C8
	for <lists+xen-devel@lfdr.de>; Tue, 21 Jan 2025 17:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.875531.1285977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGsZ-0001qf-DY; Tue, 21 Jan 2025 16:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 875531.1285977; Tue, 21 Jan 2025 16:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1taGsZ-0001pj-8s; Tue, 21 Jan 2025 16:13:27 +0000
Received: by outflank-mailman (input) for mailman id 875531;
 Tue, 21 Jan 2025 16:13:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SGjB=UN=bounce.vates.tech=bounce-md_30504962.678fc7a0.v1-142299a20ea043b8a0073e531c53c474@srs-se1.protection.inumbo.net>)
 id 1taGsX-0001oY-5o
 for xen-devel@lists.xenproject.org; Tue, 21 Jan 2025 16:13:25 +0000
Received: from mail187-20.suw11.mandrillapp.com
 (mail187-20.suw11.mandrillapp.com [198.2.187.20])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2441a15-d812-11ef-a0e4-8be0dac302b0;
 Tue, 21 Jan 2025 17:13:22 +0100 (CET)
Received: from pmta09.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail187-20.suw11.mandrillapp.com (Mailchimp) with ESMTP id
 4Ycsh06F2yzFCWYww
 for <xen-devel@lists.xenproject.org>; Tue, 21 Jan 2025 16:13:20 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 142299a20ea043b8a0073e531c53c474; Tue, 21 Jan 2025 16:13:20 +0000
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
X-Inumbo-ID: a2441a15-d812-11ef-a0e4-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1737476000; x=1737746000;
	bh=QNm5/FdxziH0dgBZNhQT9Vh/itVkKAAaHUfT5p3fmhI=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=GrDHO6bglyJLi8vnC98zxgKqJqxem8aSI6b/1646hpQiMEfPWRBVCWzoCPEY7JxUI
	 Drrowom3whjLVBLbWrSoefM4iZ+wBw5MOPqv3X5rF+qfmTHWkMwKc1Adkz/S+iMhms
	 xcPgscUBmIKw2C7uMgXih+PPRfzN7t6eRWhLLydb4vvhTPGe1AMUCasenv7iC3dGDS
	 3od/fw1t2eD74wNjSmFuYbiAAY/hKQsHGLC4UMdgDF4GDWFvw2CEIAJaQ6wTFoelT5
	 Quu26CdVNqPUYgznak6eGM/Bc95NIghh8cZCzGzd0uYGkbu3TP/Cu5mv1BFAXrqVrM
	 hQ5yT9rEpw5WQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1737476000; x=1737736500; i=teddy.astie@vates.tech;
	bh=QNm5/FdxziH0dgBZNhQT9Vh/itVkKAAaHUfT5p3fmhI=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=vxYYTIVeGWEwTojCPG6mqwTgcQnwIHuHnHP+gT2cc6ec0KYdgDk3AkmXeJqsD/sGA
	 PoXY4fYwiGufFZ0tgXaja40wA98x8UoN7SYmuayh3z+CXHci4nqRbm2AnyvvWHHf/l
	 Yaz+Zg5yFxwfz3kacFubFGnlfO6t3tRSeLsLBxKi3YzywIBlnB+ZWZPZ1v9QqH0NEm
	 hBpyzUH60UsNcVRQh5Pea6FnuI/t2+i0vN7YscMJNz+fVkoRi/6tqyBTJAtMSG9PcN
	 VGVNT1aKRIcpfq3e5t/p/zCm72DZcFA/GPTZ+dvDd4/QkPoeoHUNDvQnSrk22TGp+f
	 S74SI6jIhfCGw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v5=200/5]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Mailer: git-send-email 2.45.3
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1737475999126
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, "=?utf-8?Q?Mateusz=20M=C3=B3wka?=" <mateusz.mowka@intel.com>, "=?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?=" <marmarek@invisiblethingslab.com>
Message-Id: <cover.1737470269.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.142299a20ea043b8a0073e531c53c474?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250121:md
Date: Tue, 21 Jan 2025 16:13:20 +0000
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

The VT-d driver is updated to support these new features.

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

TODO:
* add stub implementations for bissecting needs and non-ported IOMMU implem=
entations
* fix some issues with no-dma+PV and grants
* complete "no-dma" mode (expose to toolstack, add documentation, ...)
* properly define nested mode and PASID support

* make new quarantine code more unity region aware (isolate devices with
  different reserved regions regions using separate 'contexts')
* find a way to make PV-IOMMU work in DomUs (they don't see machine bdf)
* there are corner cases with PV-IOMMU and to-domain Xen PCI Passthrough
  (e.g pci-assignable-remove will reassign to context 0, while the driver
   expects the device to to be in context X)

Teddy Astie (5):
  docs/designs: Add a design document for IOMMU subsystem redesign
  docs/designs: Add a design document for PV-IOMMU
  xen/public: Introduce PV-IOMMU hypercall interface
  IOMMU: Introduce redesigned IOMMU subsystem
  VT-d: Port IOMMU driver to new subsystem

 docs/designs/iommu-contexts.md       |  403 ++++++
 docs/designs/pv-iommu.md             |  116 ++
 xen/arch/x86/domain.c                |    2 +-
 xen/arch/x86/include/asm/arena.h     |   54 +
 xen/arch/x86/include/asm/iommu.h     |   58 +-
 xen/arch/x86/include/asm/pci.h       |   17 -
 xen/arch/x86/mm/p2m-ept.c            |    2 +-
 xen/arch/x86/pv/dom0_build.c         |    6 +-
 xen/arch/x86/tboot.c                 |    4 +-
 xen/common/Makefile                  |    1 +
 xen/common/memory.c                  |    4 +-
 xen/common/pv-iommu.c                |  539 ++++++++
 xen/drivers/passthrough/Makefile     |    3 +
 xen/drivers/passthrough/context.c    |  740 +++++++++++
 xen/drivers/passthrough/iommu.c      |  431 +++----
 xen/drivers/passthrough/pci.c        |  379 ++----
 xen/drivers/passthrough/quarantine.c |   49 +
 xen/drivers/passthrough/vtd/Makefile |    2 +-
 xen/drivers/passthrough/vtd/extern.h |   16 +-
 xen/drivers/passthrough/vtd/iommu.c  | 1692 ++++++++------------------
 xen/drivers/passthrough/vtd/iommu.h  |    4 +-
 xen/drivers/passthrough/vtd/qinval.c |    2 +-
 xen/drivers/passthrough/vtd/quirks.c |   20 +-
 xen/drivers/passthrough/x86/Makefile |    1 +
 xen/drivers/passthrough/x86/arena.c  |  157 +++
 xen/drivers/passthrough/x86/iommu.c  |  299 +++--
 xen/include/hypercall-defs.c         |    6 +
 xen/include/public/pv-iommu.h        |  343 ++++++
 xen/include/public/xen.h             |    1 +
 xen/include/xen/iommu.h              |  119 +-
 xen/include/xen/pci.h                |    3 +
 31 files changed, 3606 insertions(+), 1867 deletions(-)
 create mode 100644 docs/designs/iommu-contexts.md
 create mode 100644 docs/designs/pv-iommu.md
 create mode 100644 xen/arch/x86/include/asm/arena.h
 create mode 100644 xen/common/pv-iommu.c
 create mode 100644 xen/drivers/passthrough/context.c
 create mode 100644 xen/drivers/passthrough/quarantine.c
 create mode 100644 xen/drivers/passthrough/x86/arena.c
 create mode 100644 xen/include/public/pv-iommu.h

-- 
2.45.3



 | Vates 

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


