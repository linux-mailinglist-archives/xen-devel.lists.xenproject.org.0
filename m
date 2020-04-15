Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B5E1A9007
	for <lists+xen-devel@lfdr.de>; Wed, 15 Apr 2020 03:03:24 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jOWRY-00019B-44; Wed, 15 Apr 2020 01:02:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NGac=57=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1jOWRW-000196-Rl
 for xen-devel@lists.xenproject.org; Wed, 15 Apr 2020 01:02:18 +0000
X-Inumbo-ID: c087bf1a-7eb4-11ea-b58d-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c087bf1a-7eb4-11ea-b58d-bc764e2007e4;
 Wed, 15 Apr 2020 01:02:18 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1DCAD2072D;
 Wed, 15 Apr 2020 01:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1586912537;
 bh=ZdE3Xo7+81xPuHaeUJizVXRE+i9VJW2i2pT0cGASjhE=;
 h=Date:From:To:cc:Subject:From;
 b=tlt0r1zGAOh0hyzkI9DICiMFiAP7AjQQ6YAwtd/yokfCYm47mJ3cB+QZ4SjwIhgym
 NxN7TWClBKCikxMaFzvcjvnGEvgW59txqu7F6pZlezEExwvw2tdTkRyZn7NX6X91V8
 MRUQ4J/s5quYD+aVpP0KuFeTjVa4QSmlXDqeoAFA=
Date: Tue, 14 Apr 2020 18:02:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/12] direct-map DomUs
Message-ID: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Artem_Mygaiev@epam.com, peng.fan@nxp.com, sstabellini@kernel.org,
 julien@xen.org, andrew.cooper3@citrix.com, George.Dunlap@citrix.com,
 Bertrand.Marquis@arm.com, jbeulich@suse.com, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi all,

This series adds support for 1:1 mapping (guest physical == physical)
the memory of dom0less domUs. The memory ranges assigned to a domU can be
explicitly chosen by the user at boot time.

This is desirable in cases where an IOMMU is not present in the system,
or it cannot be used. For instance, it might not be usable because it
doesn't cover a specific device, or because it doesn't have enough
bandwidth, or because it adds too much latency. In these cases, the user
should use a MPU to protect the memory in the system (e.g. the Xilinx
XMPU), configuring it with the chosen address ranges.

Cheers,

Stefano



The following changes since commit 7372466b21c3b6c96bb7a52754e432bac883a1e3:

  x86/mem_sharing: Fix build with !CONFIG_XSM (2020-04-10 15:20:10 +0100)

are available in the Git repository at:

  http://xenbits.xenproject.org/git-http/people/sstabellini/xen-unstable.git direct-map-1

for you to fetch changes up to 43503720ab6851a28a66fdd067f592d5354ae83a:

  xen/arm: call iomem_permit_access for passthrough devices (2020-04-14 17:42:21 -0700)

----------------------------------------------------------------
Stefano Stabellini (12):
      xen: introduce xen_dom_flags
      xen/arm: introduce arch_xen_dom_flags and direct_map
      xen/arm: introduce 1:1 mapping for domUs
      xen: split alloc_heap_pages in two halves for reusability
      xen: introduce reserve_heap_pages
      xen/arm: reserve 1:1 memory for direct_map domUs
      xen/arm: new vgic: rename vgic_cpu/dist_base to c/dbase
      xen/arm: if is_domain_direct_mapped use native addresses for GICv2
      xen/arm: if is_domain_direct_mapped use native addresses for GICv3
      xen/arm: if is_domain_direct_mapped use native UART address for vPL011
      xen/arm: if xen_force don't try to setup the IOMMU
      xen/arm: call iomem_permit_access for passthrough devices

 docs/misc/arm/device-tree/booting.txt |  13 +++
 docs/misc/arm/passthrough-noiommu.txt |  35 ++++++++
 xen/arch/arm/domain.c                 |   4 +-
 xen/arch/arm/domain_build.c           | 141 ++++++++++++++++++++++++++----
 xen/arch/arm/setup.c                  |   3 +-
 xen/arch/arm/vgic-v2.c                |  12 +--
 xen/arch/arm/vgic-v3.c                |  18 +++-
 xen/arch/arm/vgic/vgic-init.c         |   4 +-
 xen/arch/arm/vgic/vgic-v2.c           |  18 ++--
 xen/arch/arm/vpl011.c                 |  12 ++-
 xen/arch/x86/domain.c                 |   3 +-
 xen/arch/x86/setup.c                  |   3 +-
 xen/common/domain.c                   |  13 +--
 xen/common/domctl.c                   |   3 +-
 xen/common/page_alloc.c               | 158 +++++++++++++++++++++++++---------
 xen/common/sched/core.c               |   3 +-
 xen/include/asm-arm/domain.h          |  10 ++-
 xen/include/asm-arm/new_vgic.h        |   4 +-
 xen/include/asm-arm/vgic.h            |   1 +
 xen/include/asm-x86/domain.h          |   2 +
 xen/include/xen/domain.h              |   8 +-
 xen/include/xen/mm.h                  |   2 +
 xen/include/xen/sched.h               |   2 +-
 23 files changed, 373 insertions(+), 99 deletions(-)
 create mode 100644 docs/misc/arm/passthrough-noiommu.txt

