Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF54264BCB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 19:49:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGQhg-0006gA-H5; Thu, 10 Sep 2020 17:49:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S6nR=CT=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kGQhe-0006eD-Ri
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 17:49:46 +0000
X-Inumbo-ID: 1fb04329-0a6e-4cbb-ac05-8e8416b5e5b9
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1fb04329-0a6e-4cbb-ac05-8e8416b5e5b9;
 Thu, 10 Sep 2020 17:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From;
 bh=L3wQjm0BWcDvbfseZDCM9loN+Btr3JrbUImIEDUMW1Y=; b=EVVsyNNuZR2Yfq/SJGBiZrlqQ1
 zXj+c9uZ/GZbDnzqW3Hdgd4js0GY1qGBnAUzHwMwcGVx8lzb3fFgoYoOD/uW1y+D5KeAegyNdWHcE
 XfDRg3pxVKb+3SqU8i8o7TPojr2UMtn+FW1zAXlSjxNYOUtR9MFaEIUd+JouPtg4rxmI=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGQhW-0002iI-IV; Thu, 10 Sep 2020 17:49:38 +0000
Received: from host86-176-94-160.range86-176.btcentralplus.com
 ([86.176.94.160] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kGQhW-000111-7b; Thu, 10 Sep 2020 17:49:38 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
 Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v7 0/8] IOMMU cleanup
Date: Thu, 10 Sep 2020 18:49:27 +0100
Message-Id: <20200910174935.9518-1-paul@xen.org>
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
 xen/drivers/passthrough/arm/smmu.c          |   2 +-
 xen/drivers/passthrough/iommu.c             | 120 +++--------
 xen/drivers/passthrough/vtd/extern.h        |   2 +-
 xen/drivers/passthrough/vtd/iommu.c         | 225 +++++++++-----------
 xen/drivers/passthrough/vtd/x86/vtd.c       |   2 +-
 xen/drivers/passthrough/x86/iommu.c         |   2 +-
 xen/include/xen/iommu.h                     |  36 +---
 17 files changed, 372 insertions(+), 364 deletions(-)
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


