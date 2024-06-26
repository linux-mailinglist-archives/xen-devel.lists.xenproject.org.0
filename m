Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 386DE91859F
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jun 2024 17:23:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749165.1157235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUU1-0007l4-K9; Wed, 26 Jun 2024 15:22:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749165.1157235; Wed, 26 Jun 2024 15:22:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMUU1-0007f7-G5; Wed, 26 Jun 2024 15:22:53 +0000
Received: by outflank-mailman (input) for mailman id 749165;
 Wed, 26 Jun 2024 15:22:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5KNd=N4=bounce.vates.tech=bounce-md_30504962.667c3248.v1-460b1dca485c473b8721c62f5cc8620a@srs-se1.protection.inumbo.net>)
 id 1sMUTz-00076j-FK
 for xen-devel@lists.xenproject.org; Wed, 26 Jun 2024 15:22:51 +0000
Received: from mail134-3.atl141.mandrillapp.com
 (mail134-3.atl141.mandrillapp.com [198.2.134.3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f25d3673-33cf-11ef-b4bb-af5377834399;
 Wed, 26 Jun 2024 17:22:49 +0200 (CEST)
Received: from pmta10.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail134-3.atl141.mandrillapp.com (Mailchimp) with ESMTP id
 4W8QS851l0zDRJ1Wx
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jun 2024 15:22:48 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 460b1dca485c473b8721c62f5cc8620a; Wed, 26 Jun 2024 15:22:48 +0000
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
X-Inumbo-ID: f25d3673-33cf-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1719415368; x=1719675868;
	bh=6vHCzN+AeDCbgU+wI/BOz1emQQdsYN01V8bF1TOnwzE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=ML0YNSm3eQqqV6+dNFYMqFaKr/10E7ejZUdJzfZwPURkKVfCaPIkqQIsJhsa+gg4J
	 oKVPvw6IEImQHZBsNBGJ9pGoyhXCskeNOixjDO1tsSStXyB89DpkgHAO/heBIqu2Cp
	 451IY76nhlCJ1kgWPkkE+CQSQUQEu2SvQnc7rHzb0dC/DdAwnuU94mdlKkrGLiVexQ
	 2IghSKJhsaMH/j5KhQGiIHffgUHAWHytVW4SZdIl19EQPoBAMBYpWXfzJRjGnUL8uF
	 elRsByf9Y38uTCYq6BxjZdHCIJlbD4LOLKn4y8EN7H5XhIcUeLeOawWegUxFkBeRGh
	 YZQKrxeSWvmXQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1719415368; x=1719675868; i=teddy.astie@vates.tech;
	bh=6vHCzN+AeDCbgU+wI/BOz1emQQdsYN01V8bF1TOnwzE=;
	h=From:Subject:To:Cc:Message-Id:Feedback-ID:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:CC:Date:Subject:From;
	b=Q1TOOXUY1+tWUIkFV0NTBijgotOkxAOb3qmgbts63hBFLgpYBYuHWJfGKneWAdhd+
	 Q5B4wj7cqEL1gKgpiiSu2RM+nkFD/bzEwo3jKS2aLEFXNRYFLLAunRAIHnADZgiJzb
	 Kt8SifRSvYq5OQAxjlf4YcjXBiRGDUioLq6Vt8XImdpGS3O+SYJT/U293/XOsUm88c
	 cWUmR3hz4CFZ80sdKWMD6B0K5bQWUh0vhgGESl4UMwBvsRf1uYvGxuw+zBjLtvdiLK
	 k+ZdkqTDldg9gffcW2sONIuWwUpoaoC5jhzWg0FllPZGrNC6fKEHmXPP8dOEA0Wr9Y
	 tpLjAIWdvG5nw==
From: TSnake41 <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20XEN=20PATCH=20v2=200/5]=20IOMMU=20subsystem=20redesign=20and=20PV-IOMMU=20interface?=
X-Mailer: git-send-email 2.45.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1719415358935
To: xen-devel@lists.xenproject.org
Cc: TSnake41 <teddy.astie@vates.tech>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, =?utf-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Lukasz Hawrylko <lukasz@hawrylko.pl>, "Daniel P. Smith" <dpsmith@apertussolutions.com>, =?utf-8?Q?Mateusz=20M=C3=B3wka?= <mateusz.mowka@intel.com>, =?utf-8?Q?Marek=20Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Message-Id: <cover.1719414736.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.460b1dca485c473b8721c62f5cc8620a?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20240626:md
Date: Wed, 26 Jun 2024 15:22:48 +0000
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

Teddy Astie (5):
  docs/designs: Add a design document for PV-IOMMU
  docs/designs: Add a design document for IOMMU subsystem redesign
  IOMMU: Introduce redesigned IOMMU subsystem
  VT-d: Port IOMMU driver to new subsystem
  xen/public: Introduce PV-IOMMU hypercall interface

 docs/designs/iommu-contexts.md       |  398 +++++++
 docs/designs/pv-iommu.md             |  105 ++
 xen/arch/x86/domain.c                |    2 +-
 xen/arch/x86/include/asm/arena.h     |   54 +
 xen/arch/x86/include/asm/iommu.h     |   44 +-
 xen/arch/x86/include/asm/pci.h       |   17 -
 xen/arch/x86/mm/p2m-ept.c            |    2 +-
 xen/arch/x86/pv/dom0_build.c         |    4 +-
 xen/arch/x86/tboot.c                 |    4 +-
 xen/common/Makefile                  |    1 +
 xen/common/memory.c                  |    4 +-
 xen/common/pv-iommu.c                |  320 ++++++
 xen/drivers/passthrough/Kconfig      |   14 +
 xen/drivers/passthrough/Makefile     |    3 +
 xen/drivers/passthrough/context.c    |  626 +++++++++++
 xen/drivers/passthrough/iommu.c      |  337 ++----
 xen/drivers/passthrough/pci.c        |   49 +-
 xen/drivers/passthrough/quarantine.c |   49 +
 xen/drivers/passthrough/vtd/Makefile |    2 +-
 xen/drivers/passthrough/vtd/extern.h |   14 +-
 xen/drivers/passthrough/vtd/iommu.c  | 1557 +++++++++++---------------
 xen/drivers/passthrough/vtd/quirks.c |   21 +-
 xen/drivers/passthrough/x86/Makefile |    1 +
 xen/drivers/passthrough/x86/arena.c  |  157 +++
 xen/drivers/passthrough/x86/iommu.c  |  104 +-
 xen/include/hypercall-defs.c         |    6 +
 xen/include/public/pv-iommu.h        |  114 ++
 xen/include/public/xen.h             |    1 +
 xen/include/xen/iommu.h              |  118 +-
 xen/include/xen/pci.h                |    3 +
 30 files changed, 2822 insertions(+), 1309 deletions(-)
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



Teddy Astie | Vates XCP-ng Intern

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

