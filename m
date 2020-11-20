Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B02522BAB0B
	for <lists+xen-devel@lfdr.de>; Fri, 20 Nov 2020 14:25:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.32185.63153 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kg6P9-0001iY-Rz; Fri, 20 Nov 2020 13:24:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 32185.63153; Fri, 20 Nov 2020 13:24:47 +0000
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
	id 1kg6P9-0001iC-OQ; Fri, 20 Nov 2020 13:24:47 +0000
Received: by outflank-mailman (input) for mailman id 32185;
 Fri, 20 Nov 2020 13:24:46 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kg6P8-0001hx-FG
 for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6P5-0007Cp-KX; Fri, 20 Nov 2020 13:24:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kg6P5-00028m-9S; Fri, 20 Nov 2020 13:24:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6P8-0001hx-FG
	for xen-devel@lists.xenproject.org; Fri, 20 Nov 2020 13:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From;
	bh=oVnrEEire8FyLNYRbm2ismIr24k0ZF76I8uW1Vm4pKk=; b=gsWXffCRYU0/jGWsED+wTkY+0v
	QdekzfpikN32H9YHmeTe9gEhJFw80FTZUkt50mqhPwH8VytkyivnGVXupGfRPOriI5U5mqa0UfbQq
	PS6Akecd5F5XnuhsjvjbbxdFlNVS+wcxLCeFt9PZN6rDkHHH8t4IeuucM50xCtZQca3U=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6P5-0007Cp-KX; Fri, 20 Nov 2020 13:24:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kg6P5-00028m-9S; Fri, 20 Nov 2020 13:24:43 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Ian Jackson <ian.jackson@eu.citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <jgrall@amazon.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v10 0/7] IOMMU cleanup
Date: Fri, 20 Nov 2020 13:24:33 +0000
Message-Id: <20201120132440.1141-1-paul@xen.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

This is the remainder of the cleanup series deferred until XSA-346 and
XSA-347 were publicly disclosed.

Paul Durrant (7):
  remove remaining uses of iommu_legacy_map/unmap
  common/grant_table: batch flush I/O TLB
  iommu: remove the share_p2m operation
  iommu: stop calling IOMMU page tables 'p2m tables'
  vtd: use a bit field for root_entry
  vtd: use a bit field for context_entry
  vtd: use a bit field for dma_pte

 xen/arch/x86/mm.c                           |  26 ++-
 xen/arch/x86/mm/p2m-ept.c                   |  20 +-
 xen/arch/x86/mm/p2m-pt.c                    |  16 +-
 xen/arch/x86/mm/p2m.c                       |  28 ++-
 xen/arch/x86/x86_64/mm.c                    |  20 +-
 xen/common/grant_table.c                    | 208 ++++++++++++------
 xen/common/memory.c                         |   6 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  20 +-
 xen/drivers/passthrough/iommu.c             |  52 +----
 xen/drivers/passthrough/vtd/extern.h        |   2 +-
 xen/drivers/passthrough/vtd/iommu.c         | 220 +++++++++++---------
 xen/drivers/passthrough/vtd/iommu.h         | 113 ++++------
 xen/drivers/passthrough/vtd/utils.c         |  22 +-
 xen/drivers/passthrough/vtd/x86/ats.c       |  29 +--
 xen/drivers/passthrough/vtd/x86/vtd.c       |   2 +-
 xen/include/xen/iommu.h                     |  26 +--
 16 files changed, 429 insertions(+), 381 deletions(-)
---
Cc: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: George Dunlap <george.dunlap@citrix.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>
Cc: Kevin Tian <kevin.tian@intel.com>
Cc: "Roger Pau Monné" <roger.pau@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Wei Liu <wl@xen.org>
-- 
2.20.1


