Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9A1265B6D
	for <lists+xen-devel@lfdr.de>; Fri, 11 Sep 2020 10:21:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGeId-0006mB-OP; Fri, 11 Sep 2020 08:20:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p+pG=CU=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kGeIc-0006hn-AZ
 for xen-devel@lists.xenproject.org; Fri, 11 Sep 2020 08:20:50 +0000
X-Inumbo-ID: d7126929-e3ae-41d6-89e4-8ff155d658dc
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d7126929-e3ae-41d6-89e4-8ff155d658dc;
 Fri, 11 Sep 2020 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=MCM+ElgeqpraBtIBkjLTyu740JoAiYFRpUiZVENYrek=; b=ndd6va96rzWQK1g0WqspdPGYvk
 vQ0o2RS+/DYIDWHsr6ItSV5E2pYS5Fa1PrJ8O7i93kZEcA8w/bnkhVWP1dMxylFh6he0J10c6Y57V
 bj2gQTn1vyjYp3BhsnoIRd/Na3lXuhLsYwCr0WMWm7tXaMeJqQDZBXlHruLhTyLBYTaQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGeIN-0002t5-NM; Fri, 11 Sep 2020 08:20:35 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGeIN-0006YQ-Al; Fri, 11 Sep 2020 08:20:35 +0000
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
Subject: [PATCH v8 0/8] IOMMU cleanup
Date: Fri, 11 Sep 2020 09:20:24 +0100
Message-Id: <20200911082032.1466-1-paul@xen.org>
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
 xen/drivers/passthrough/iommu.c             | 120 +++--------
 xen/drivers/passthrough/vtd/extern.h        |   2 +-
 xen/drivers/passthrough/vtd/iommu.c         | 225 +++++++++-----------
 xen/drivers/passthrough/vtd/x86/vtd.c       |   2 +-
 xen/drivers/passthrough/x86/iommu.c         |   2 +-
 xen/include/xen/iommu.h                     |  36 +---
 18 files changed, 373 insertions(+), 365 deletions(-)
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


