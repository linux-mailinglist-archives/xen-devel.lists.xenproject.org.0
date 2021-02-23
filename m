Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0A0322A9D
	for <lists+xen-devel@lfdr.de>; Tue, 23 Feb 2021 13:34:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.88756.167034 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEWti-0008Su-7K; Tue, 23 Feb 2021 12:34:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 88756.167034; Tue, 23 Feb 2021 12:34:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEWti-0008SU-3D; Tue, 23 Feb 2021 12:34:38 +0000
Received: by outflank-mailman (input) for mailman id 88756;
 Tue, 23 Feb 2021 12:34:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lEWtg-0008SK-JG
 for xen-devel@lists.xenproject.org; Tue, 23 Feb 2021 12:34:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEWtg-0002ds-2m; Tue, 23 Feb 2021 12:34:36 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lEWtf-0000cJ-L5; Tue, 23 Feb 2021 12:34:35 +0000
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
	bh=qOQNybg5DTKGdQKuYPQV7s9nH2sOE4WF8M2drVNX3Xs=; b=ebwc4kLeSRiYVQ3DfWm/K1blnj
	iWdaXzpZnt7/Z5tbcNTB2eiWUGigmJ9zE/cJd1SsTLeEFq7yDrNqKRY9UnkJKzzfROx1l+a/sM3lE
	ojsk6amQCpRy44P95BxQ0ZBUteS6VWpeEhIcqh8hOxCMBy+N0xa+5h1KtiEhcSHumoPM=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>
Subject: [for-4.15][PATCH v4 0/2] xen/iommu: Collection of bug fixes for IOMMU teardown
Date: Tue, 23 Feb 2021 12:34:31 +0000
Message-Id: <20210223123433.19645-1-julien@xen.org>
X-Mailer: git-send-email 2.17.1

From: Julien Grall <jgrall@amazon.com>

Hi all,

This series is a collection of bug fixes for the IOMMU teardown code.
All of them are candidate for 4.15 as they can either leak memory or
lead to host crash/host corruption.

This is sent directly on xen-devel because all the issues were either
introduced in 4.15 or happen in the domain creation code.

Major changes since v3:
    - Remove patch #3 "xen/iommu: x86: Harden the IOMMU page-table
    allocator" as it is not strictly necessary for 4.15.
    - Re-order the patches to avoid on a follow-up patch to fix
    completely the issue.

Major changes since v2:
    - patch #1 "xen/x86: p2m: Don't map the special pages in the IOMMU
    page-tables" has been removed. This requires Jan's patch [1] to
    fully mitigate memory leaks.

Cheers,

[1] <90271e69-c07e-a32c-5531-a79b10ef03dd@suse.com>

Julien Grall (2):
  xen/x86: iommu: Ignore IOMMU mapping requests when a domain is dying
  xen/iommu: x86: Clear the root page-table before freeing the
    page-tables

 xen/drivers/passthrough/amd/iommu_map.c     | 12 +++++++++++
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 ++++++++++-
 xen/drivers/passthrough/vtd/iommu.c         | 24 ++++++++++++++++++++-
 xen/drivers/passthrough/x86/iommu.c         | 19 ++++++++++++++++
 xen/include/xen/iommu.h                     |  1 +
 5 files changed, 66 insertions(+), 2 deletions(-)

-- 
2.17.1


