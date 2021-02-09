Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0858F3152CC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Feb 2021 16:28:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.83285.154591 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwH-00078c-7w; Tue, 09 Feb 2021 15:28:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 83285.154591; Tue, 09 Feb 2021 15:28:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l9UwH-000787-1m; Tue, 09 Feb 2021 15:28:29 +0000
Received: by outflank-mailman (input) for mailman id 83285;
 Tue, 09 Feb 2021 15:28:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l9UwF-00077q-0W
 for xen-devel@lists.xenproject.org; Tue, 09 Feb 2021 15:28:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwC-0000to-Ln; Tue, 09 Feb 2021 15:28:24 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l9UwC-0007gX-9V; Tue, 09 Feb 2021 15:28:24 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Message-Id:Date:Subject:Cc:To:From;
	bh=EIpfkEBAlcm//25TrsQzpn+MKemTXRwxfnqy6YF6Oj0=; b=nQc2NjtVgDfQ3i7O8ci9/9LfGY
	K7umk4ka3BTksaG+wPTU9nteLBjhGmgt0c5+Gs2sI0Q8xGC6re4FoEpT8qqWnDDk0WvvWm/0BNCBX
	pHyOOjTHNSa35kAIVNPArXe+ZX4sZSyAPdbqVuatpxC44SnLHGeKereLIT+MwgTroA4o=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>,
	Paul Durrant <paul@xen.org>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [for-4.15][PATCH v2 0/5] xen/iommu: Collection of bug fixes for IOMMU teadorwn
Date: Tue,  9 Feb 2021 15:28:11 +0000
Message-Id: <20210209152816.15792-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series is a collection of bug fixes for the IOMMU teardown code.
All of them are candidate for 4.15 as they can either leak memory or
lead to host crash/host corruption.

This is sent directly on xen-devel because all the issues were either
introduced in 4.15 or happen in the domain creation code.

Cheers,

Julien Grall (5):
  xen/x86: p2m: Don't map the special pages in the IOMMU page-tables
  xen/iommu: Check if the IOMMU was initialized before tearing down
  xen/iommu: iommu_map: Don't crash the domain if it is dying
  xen/iommu: x86: Don't leak the IOMMU page-tables
  xen/iommu: x86: Clear the root page-table before freeing the
    page-tables

 xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 +++++-
 xen/drivers/passthrough/iommu.c             |  9 ++++-
 xen/drivers/passthrough/vtd/iommu.c         | 12 +++++-
 xen/drivers/passthrough/x86/iommu.c         | 42 ++++++++++++++++++++-
 xen/include/asm-x86/p2m.h                   |  4 ++
 xen/include/xen/iommu.h                     |  1 +
 6 files changed, 76 insertions(+), 4 deletions(-)

-- 
2.17.1


