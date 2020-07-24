Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A78BE22CB5F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jul 2020 18:46:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jz0q4-00015i-Ta; Fri, 24 Jul 2020 16:46:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yL+a=BD=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1jz0q3-00015d-Gh
 for xen-devel@lists.xenproject.org; Fri, 24 Jul 2020 16:46:27 +0000
X-Inumbo-ID: 37062733-cdcd-11ea-a42a-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 37062733-cdcd-11ea-a42a-12813bfff9fa;
 Fri, 24 Jul 2020 16:46:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yEPjMYRXDOrpQZeJJKZcCUTT1ISgrZtcUBabCAotbw4=; b=Vh/IsxRqa2qnaf7BfqL9G01LiL
 wAb3BywGPlgB4DUhDq2jqht7kbFG4wxyCecgirLoPNNso5jlbGL8AI+e5GBRfRZvf1XS2b62B59BT
 d0vMb3ONymFIz+Nm6kN+eo2a2PBQL+my7jpGh+6QTE2Z7cD7/FvVEwT8qVU4Pu1X3kwk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q2-00053r-7M; Fri, 24 Jul 2020 16:46:26 +0000
Received: from host86-143-223-30.range86-143.btcentralplus.com
 ([86.143.223.30] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1jz0q1-0006WL-VB; Fri, 24 Jul 2020 16:46:26 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 0/6] IOMMU cleanup
Date: Fri, 24 Jul 2020 17:46:13 +0100
Message-Id: <20200724164619.1245-1-paul@xen.org>
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
Cc: Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

From: Paul Durrant <pdurrant@amazon.com>

Patches accumulated in my during 4.14 freeze...

Paul Durrant (6):
  x86/iommu: re-arrange arch_iommu to separate common fields...
  x86/iommu: add common page-table allocator
  iommu: remove iommu_lookup_page() and the lookup_page() method...
  remove remaining uses of iommu_legacy_map/unmap
  iommu: remove the share_p2m operation
  iommu: stop calling IOMMU page tables 'p2m tables'

 xen/arch/x86/mm.c                           |  22 ++-
 xen/arch/x86/mm/p2m-ept.c                   |  22 ++-
 xen/arch/x86/mm/p2m-pt.c                    |  17 +-
 xen/arch/x86/mm/p2m.c                       |  31 ++-
 xen/arch/x86/tboot.c                        |   4 +-
 xen/arch/x86/x86_64/mm.c                    |  27 ++-
 xen/common/grant_table.c                    |  36 +++-
 xen/common/memory.c                         |   7 +-
 xen/drivers/passthrough/amd/iommu.h         |  18 +-
 xen/drivers/passthrough/amd/iommu_guest.c   |   8 +-
 xen/drivers/passthrough/amd/iommu_map.c     |  22 +--
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 109 +++--------
 xen/drivers/passthrough/iommu.c             |  91 +--------
 xen/drivers/passthrough/vtd/iommu.c         | 206 ++++++--------------
 xen/drivers/passthrough/x86/iommu.c         |  42 +++-
 xen/include/asm-x86/iommu.h                 |  33 +++-
 xen/include/xen/iommu.h                     |  35 +---
 17 files changed, 303 insertions(+), 427 deletions(-)

-- 
2.20.1


