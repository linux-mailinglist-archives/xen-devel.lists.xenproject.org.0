Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 177AB9BB7C9
	for <lists+xen-devel@lfdr.de>; Mon,  4 Nov 2024 15:29:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.830027.1244941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7y4U-0006Z5-J3; Mon, 04 Nov 2024 14:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 830027.1244941; Mon, 04 Nov 2024 14:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t7y4U-0006Xe-Fm; Mon, 04 Nov 2024 14:28:46 +0000
Received: by outflank-mailman (input) for mailman id 830027;
 Mon, 04 Nov 2024 14:28:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vci5=R7=bounce.vates.tech=bounce-md_30504962.6728da16.v1-c2a022822c8b471b9422ea789444521b@srs-se1.protection.inumbo.net>)
 id 1t7y4T-0006XR-R3
 for xen-devel@lists.xenproject.org; Mon, 04 Nov 2024 14:28:45 +0000
Received: from mail133-1.atl131.mandrillapp.com
 (mail133-1.atl131.mandrillapp.com [198.2.133.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 163448e9-9ab9-11ef-a0c5-8be0dac302b0;
 Mon, 04 Nov 2024 15:28:41 +0100 (CET)
Received: from pmta13.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail133-1.atl131.mandrillapp.com (Mailchimp) with ESMTP id
 4Xhv3B6LpYzBsThh9
 for <xen-devel@lists.xenproject.org>; Mon,  4 Nov 2024 14:28:38 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 c2a022822c8b471b9422ea789444521b; Mon, 04 Nov 2024 14:28:38 +0000
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
X-Inumbo-ID: 163448e9-9ab9-11ef-a0c5-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE5OC4yLjEzMy4xIiwiaGVsbyI6Im1haWwxMzMtMS5hdGwxMzEubWFuZHJpbGxhcHAuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjE2MzQ0OGU5LTlhYjktMTFlZi1hMGM1LThiZTBkYWMzMDJiMCIsInRzIjoxNzMwNzMwNTIxLjQ0MDcyNCwic2VuZGVyIjoiYm91bmNlLW1kXzMwNTA0OTYyLjY3MjhkYTE2LnYxLWMyYTAyMjgyMmM4YjQ3MWI5NDIyZWE3ODk0NDQ1MjFiQGJvdW5jZS52YXRlcy50ZWNoIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1730730518; x=1730991018;
	bh=RoSAtnJfw1cEYNC93zFobpr3kWwShUZYpgY8h54ln+8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=IAI+VmTHFBMuSLeUuuzX87KcSO8+P7bu4Xw7WfXzAIbH1n8wmNdwnxCBEkfikvJDn
	 bRVa4cMX88yft3z1TdS7Jz7T3KKFQbzD0hEZBWzoN/3i8P8NsmMW0WIIODCJCW+yyx
	 ISP8d5R3SWkamOcACw5AmoUbtAE8Sv6sSyADukWDtK1AOlc1ZU5Vz6zgiYpuiRfm9w
	 9RVSYVhK2qOP6++Z+HFkbTgWZphNt4K8VlY00JJJRskNoVJpTJZr5HD1lfPIfvNCZn
	 x+ryENl1S2Ft7McjTA8P7A5ec8+gBtgYs0YqCWuE397Q/MPCBuKE+h+jya01kvSwUM
	 TWryF+RX4XWvw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1730730518; x=1730991018; i=teddy.astie@vates.tech;
	bh=RoSAtnJfw1cEYNC93zFobpr3kWwShUZYpgY8h54ln+8=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=N/goh2IGiAkJC8th+v8dUVwV2a3vAnwmSx5ix+k0oobSL+9q+58xgUrgbmz/X7jfj
	 C5xO8kWpBiYTR2uLD7wawat6D2iUDeYbMcf+iT44Pu0UKam3WiSzi+jEJYMB2Ipzi7
	 rg0bqZ/8eDdsWuE3UO08ewR+ee8G+FW6Zcp6pVezjo6plsY53NeO3c7wHKd9wcvyKu
	 rbKrmWW8/zwnEd7mF1XGDYZ4q+ZPHFT7lFv0O64D/Pfi2f787YCFdSBdHP0n1Ps3Qk
	 UWZwHjpO8jp368w7rJgEpjBdFVj77evf9gjkvOHfnViuvJZJuw1zqHjNF6WhwAnSdP
	 419RZG82DJSTw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v4=200/5]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1730730516687
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "Jan Beulich" <jbeulich@suse.com>, "Julien Grall" <julien@xen.org>, "Stefano Stabellini" <sstabellini@kernel.org>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Lukasz Hawrylko" <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, =?utf-8?Q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <cover.1730718102.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.c2a022822c8b471b9422ea789444521b?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20241104:md
Date: Mon, 04 Nov 2024 14:28:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

This work has been presented at Xen Summit 2024 during the
  IOMMU paravirtualization and Xen IOMMU subsystem rework
design session.

Operating systems may want to have access to a IOMMU in order to do DMA
protection or implement certain features (e.g VFIO on Linux).

VFIO support is mandatory for framework such as SPDK, which can be useful to
implement an alternative storage backend for virtual machines [1].

In this patch series, we introduce in Xen the ability to manage several
contexts per domain and provide a new hypercall interface to allow guests
to manage IOMMU contexts.

The VT-d driver is updated to support these new features.

[1] Using SPDK with the Xen hypervisor - FOSDEM 2023
---
Changed in v2 :
* fixed Xen crash when dumping IOMMU contexts (using X debug key)
with DomUs without IOMMU
* s/dettach/detach/
* removed some unused includes
* fix dangling devices in contexts with detach

Changed in v3 :
* lock entirely map/unmap in hypercall
* prevent IOMMU operations on dying contexts (fix race condition)
* iommu_check_context+iommu_get_context -> iommu_get_context and check for NULL

Changed in v4 :
* Part of initialization logic is moved to domain or toolstack (IOMMU_init)
  + domain/toolstack now decides on "context count" and "pagetable pool size"
  + for now, all domains are able to initialize PV-IOMMU
* introduce "dom0-iommu=no-dma" to make default context block all DMA
  (disables HAP and sync-pt), enforcing usage of PV-IOMMU for DMA
  Can be used to expose properly "Pre-boot DMA protection"
* redesigned locking logic for contexts
  + contexts are accessed using iommu_get_context and released with iommu_put_context

TODO:
* add stub implementations for bissecting needs and non-ported IOMMU implementations
* fix some issues with no-dma+PV and grants
* complete "no-dma" mode (expose to toolstack, add documentation, ...)
* properly define nested mode and PASID support

Teddy Astie (5):
  docs/designs: Add a design document for PV-IOMMU
  docs/designs: Add a design document for IOMMU subsystem redesign
  IOMMU: Introduce redesigned IOMMU subsystem
  VT-d: Port IOMMU driver to new subsystem
  xen/public: Introduce PV-IOMMU hypercall interface

 docs/designs/iommu-contexts.md       |  403 +++++++
 docs/designs/pv-iommu.md             |  116 ++
 xen/arch/x86/domain.c                |    2 +-
 xen/arch/x86/include/asm/arena.h     |   54 +
 xen/arch/x86/include/asm/iommu.h     |   58 +-
 xen/arch/x86/include/asm/pci.h       |   17 -
 xen/arch/x86/mm/p2m-ept.c            |    2 +-
 xen/arch/x86/pv/dom0_build.c         |    4 +-
 xen/arch/x86/tboot.c                 |    4 +-
 xen/common/Makefile                  |    1 +
 xen/common/memory.c                  |    4 +-
 xen/common/pv-iommu.c                |  539 ++++++++++
 xen/drivers/passthrough/Makefile     |    3 +
 xen/drivers/passthrough/context.c    |  711 +++++++++++++
 xen/drivers/passthrough/iommu.c      |  396 +++----
 xen/drivers/passthrough/pci.c        |  117 +-
 xen/drivers/passthrough/quarantine.c |   49 +
 xen/drivers/passthrough/vtd/Makefile |    2 +-
 xen/drivers/passthrough/vtd/extern.h |   14 +-
 xen/drivers/passthrough/vtd/iommu.c  | 1478 +++++++++-----------------
 xen/drivers/passthrough/vtd/quirks.c |   20 +-
 xen/drivers/passthrough/x86/Makefile |    1 +
 xen/drivers/passthrough/x86/arena.c  |  157 +++
 xen/drivers/passthrough/x86/iommu.c  |  270 +++--
 xen/include/hypercall-defs.c         |    6 +
 xen/include/public/pv-iommu.h        |  341 ++++++
 xen/include/public/xen.h             |    1 +
 xen/include/xen/iommu.h              |  117 +-
 xen/include/xen/pci.h                |    3 +
 29 files changed, 3423 insertions(+), 1467 deletions(-)
 create mode 100644 docs/designs/iommu-contexts.md
 create mode 100644 docs/designs/pv-iommu.md
 create mode 100644 xen/arch/x86/include/asm/arena.h
 create mode 100644 xen/common/pv-iommu.c
 create mode 100644 xen/drivers/passthrough/context.c
 create mode 100644 xen/drivers/passthrough/quarantine.c
 create mode 100644 xen/drivers/passthrough/x86/arena.c
 create mode 100644 xen/include/public/pv-iommu.h

-- 
2.45.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

