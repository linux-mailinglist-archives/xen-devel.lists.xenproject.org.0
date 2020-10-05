Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C98A28339A
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2946.8427 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPN7L-0000bT-Pa; Mon, 05 Oct 2020 09:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2946.8427; Mon, 05 Oct 2020 09:49:15 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPN7L-0000b4-MB; Mon, 05 Oct 2020 09:49:15 +0000
Received: by outflank-mailman (input) for mailman id 2946;
 Mon, 05 Oct 2020 09:49:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kPN7J-0000a7-FF
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:13 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 455f9f3a-be08-41d9-971d-d689238c76cc;
 Mon, 05 Oct 2020 09:49:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7E-00018P-J6; Mon, 05 Oct 2020 09:49:08 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7E-0007gW-5C; Mon, 05 Oct 2020 09:49:08 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kPN7J-0000a7-FF
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:13 +0000
X-Inumbo-ID: 455f9f3a-be08-41d9-971d-d689238c76cc
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 455f9f3a-be08-41d9-971d-d689238c76cc;
	Mon, 05 Oct 2020 09:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=CY7G9pKcwkwHIqeom2cVCCCQbNB2Y8JOhpahS3c7oEw=; b=WEJhJ+M1fiy15yd9f7A4qUUk0q
	YGDPj8j3pEZ2vAz4QEjmZGRyF1L7S8iWjhUiEEIu+vdhG9ye7pUu0vh3nKBlmvkpc/QVDcmOYd7h5
	hDbwzIIBO+KXBXP9ihFuZIAaSjZ9I+pG1pNGhMrw8FaRzyvcdmWf4INHQGO2pyppF2f0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7E-00018P-J6; Mon, 05 Oct 2020 09:49:08 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7E-0007gW-5C; Mon, 05 Oct 2020 09:49:08 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <iwj@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 0/5] iommu page-table memory pool
Date: Mon,  5 Oct 2020 10:49:00 +0100
Message-Id: <20201005094905.2929-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This series introduces a pool of memory analogous to the shadow/HAP pool,
accounted to the guest domain, from which IOMMU page-tables are allocated.

Paul Durrant (5):
  libxl: remove separate calculation of IOMMU memory overhead
  iommu / domctl: introduce XEN_DOMCTL_iommu_ctl
  libxl / iommu / domctl: introduce XEN_DOMCTL_IOMMU_SET_ALLOCATION...
  iommu: set 'hap_pt_share' and 'need_sync' flags earlier in
    iommu_domain_init()
  x86 / iommu: create a dedicated pool of page-table pages

 tools/flask/policy/modules/dom0.te    |   2 +
 tools/libs/ctrl/include/xenctrl.h     |   5 +
 tools/libs/ctrl/xc_domain.c           |  16 ++++
 tools/libs/light/libxl_create.c       |  22 +----
 tools/libs/light/libxl_x86.c          |  10 ++
 xen/arch/x86/domain.c                 |   4 +-
 xen/drivers/passthrough/iommu.c       |  63 +++++++++---
 xen/drivers/passthrough/x86/iommu.c   | 132 ++++++++++++++++++++++----
 xen/include/asm-arm/iommu.h           |   6 ++
 xen/include/asm-x86/iommu.h           |   7 +-
 xen/include/public/domctl.h           |  22 +++++
 xen/include/xsm/dummy.h               |  17 +++-
 xen/include/xsm/xsm.h                 |  26 +++--
 xen/xsm/dummy.c                       |   6 +-
 xen/xsm/flask/hooks.c                 |  26 +++--
 xen/xsm/flask/policy/access_vectors   |   7 ++
 xen/xsm/flask/policy/security_classes |   1 +
 17 files changed, 300 insertions(+), 72 deletions(-)
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Anthony PERARD <anthony.perard@citrix.com>
Cc: Daniel De Graaf <dgdegra@tycho.nsa.gov>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


