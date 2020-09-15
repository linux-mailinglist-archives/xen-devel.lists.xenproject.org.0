Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3261026A0E6
	for <lists+xen-devel@lfdr.de>; Tue, 15 Sep 2020 10:30:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kI6LU-0005a7-FR; Tue, 15 Sep 2020 08:29:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2OlW=CY=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kI6LT-0005Xx-A0
 for xen-devel@lists.xenproject.org; Tue, 15 Sep 2020 08:29:47 +0000
X-Inumbo-ID: 3419441f-ab46-4582-a1b9-4ff70afb1438
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3419441f-ab46-4582-a1b9-4ff70afb1438;
 Tue, 15 Sep 2020 08:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=d93BYfzE2uWnS39OYFLUZ7lR6m0fNuGMzSWP1E0VODc=; b=Ix9AjqxPwMeMyv9hlpkGMBjn/0
 5lur7SYy0tMtiEm3g3K9eygLsxIZrLaL0pYVGnWt0rydBCSG28aYuF17Wl8jpl9IS7LhHlFLHPIXO
 0oqcSIbVcCZcKF6CeIi67cs0eh3E/H4XCWjYKN8igRWfo+1fvn08LbzJtWVXQkDOf4Rg=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kI6LL-0004qC-OB; Tue, 15 Sep 2020 08:29:39 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kI6LL-0007Pl-BQ; Tue, 15 Sep 2020 08:29:39 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 Oleksandr Tyshchenko <olekstysh@gmail.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v9 0/8] IOMMU cleanup
Date: Tue, 15 Sep 2020 09:29:28 +0100
Message-Id: <20200915082936.23663-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (8):
  x86/iommu: convert VT-d code to use new page table allocator
  iommu: remove unused iommu_ops method and tasklet
  iommu: flush I/O TLB if iommu_map() or iommu_unmap() fail
  iommu: make map and unmap take a page count, similar to flush
  remove remaining uses of iommu_legacy_map/unmap
  common/grant_table: batch flush I/O TLB
  iommu: remove the share_p2m operation
  iommu: stop calling IOMMU page tables 'p2m tables'

 xen/arch/x86/mm.c                           |  22 +-
 xen/arch/x86/mm/p2m-ept.c                   |  21 +-
 xen/arch/x86/mm/p2m-pt.c                    |  16 +-
 xen/arch/x86/mm/p2m.c                       |  27 ++-
 xen/arch/x86/x86_64/mm.c                    |  20 +-
 xen/common/grant_table.c                    | 208 ++++++++++++------
 xen/common/memory.c                         |   7 +-
 xen/drivers/passthrough/amd/iommu.h         |   2 +-
 xen/drivers/passthrough/amd/iommu_map.c     |   4 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  20 +-
 xen/drivers/passthrough/arm/ipmmu-vmsa.c    |   2 +-
 xen/drivers/passthrough/arm/smmu.c          |   2 +-
 xen/drivers/passthrough/iommu.c             | 118 +++-------
 xen/drivers/passthrough/vtd/extern.h        |   2 +-
 xen/drivers/passthrough/vtd/iommu.c         | 225 +++++++++-----------
 xen/drivers/passthrough/vtd/x86/vtd.c       |   2 +-
 xen/drivers/passthrough/x86/iommu.c         |   2 +-
 xen/include/xen/iommu.h                     |  36 +---
 18 files changed, 372 insertions(+), 364 deletions(-)
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Oleksandr Tyshchenko <olekstysh@gmail.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


