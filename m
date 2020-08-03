Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 349AD23A4C1
	for <lists+xen-devel@lfdr.de>; Mon,  3 Aug 2020 14:30:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k2Zam-0007Nh-LY; Mon, 03 Aug 2020 12:29:24 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rQjY=BN=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1k2Zal-0007NV-3K
 for xen-devel@lists.xenproject.org; Mon, 03 Aug 2020 12:29:23 +0000
X-Inumbo-ID: f481e80d-d584-11ea-af26-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f481e80d-d584-11ea-af26-12813bfff9fa;
 Mon, 03 Aug 2020 12:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iVlV6A3h4X55OEXHk9G84ICiy3M1GOBVbr0WOEPJNIs=; b=YqY4ceW9mOdF8yT22X22X4jIiS
 hg7fD5rTfJRA0uOrnS9IetqU8eavQDL9HdaNbSYhmiJPsIJSjjoJ9cFBvt/KDK8uWm8Xsk/L0XNGj
 pK2XRV/nfS79WQgJ0+VC2yRTuEt9/KxlXCOJUyXU+J085UWKZlmvOQCmIYbg0AyMPBAQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zag-0000SG-Dv; Mon, 03 Aug 2020 12:29:18 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1k2Zag-0000zk-1r; Mon, 03 Aug 2020 12:29:18 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH v3 00/11] IOMMU cleanup
Date: Mon,  3 Aug 2020 13:29:03 +0100
Message-Id: <20200803122914.2259-1-paul@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Jan Beulich <jbeulich@suse.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Paul Durrant (11):
  x86/iommu: re-arrange arch_iommu to separate common fields...
  x86/iommu: add common page-table allocator
  x86/iommu: convert VT-d code to use new page table allocator
  x86/iommu: convert AMD IOMMU code to use new page table allocator
  iommu: remove unused iommu_ops method and tasklet
  iommu: flush I/O TLB if iommu_map() or iommu_unmap() fail
  iommu: make map, unmap and flush all take both an order and a count
  remove remaining uses of iommu_legacy_map/unmap
  common/grant_table: batch flush I/O TLB
  iommu: remove the share_p2m operation
  iommu: stop calling IOMMU page tables 'p2m tables'

 xen/arch/arm/p2m.c                          |   2 +-
 xen/arch/x86/domain.c                       |   9 +-
 xen/arch/x86/mm.c                           |  21 +-
 xen/arch/x86/mm/p2m-ept.c                   |  20 +-
 xen/arch/x86/mm/p2m-pt.c                    |  15 +-
 xen/arch/x86/mm/p2m.c                       |  29 ++-
 xen/arch/x86/tboot.c                        |   4 +-
 xen/arch/x86/x86_64/mm.c                    |  27 ++-
 xen/common/grant_table.c                    | 142 +++++++----
 xen/common/memory.c                         |   9 +-
 xen/drivers/passthrough/amd/iommu.h         |  20 +-
 xen/drivers/passthrough/amd/iommu_guest.c   |   8 +-
 xen/drivers/passthrough/amd/iommu_map.c     |  26 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 110 +++------
 xen/drivers/passthrough/arm/ipmmu-vmsa.c    |   2 +-
 xen/drivers/passthrough/arm/smmu.c          |   2 +-
 xen/drivers/passthrough/iommu.c             | 118 ++--------
 xen/drivers/passthrough/vtd/iommu.c         | 248 +++++++++-----------
 xen/drivers/passthrough/x86/iommu.c         |  53 ++++-
 xen/include/asm-x86/iommu.h                 |  34 ++-
 xen/include/xen/iommu.h                     |  37 +--
 21 files changed, 459 insertions(+), 477 deletions(-)
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>
Cc: Paul Durrant <paul@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


