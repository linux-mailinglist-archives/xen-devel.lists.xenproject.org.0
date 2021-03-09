Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B50DE332E1F
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 19:21:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95658.180596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJgxw-00009s-D3; Tue, 09 Mar 2021 18:20:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95658.180596; Tue, 09 Mar 2021 18:20:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJgxw-00009U-9m; Tue, 09 Mar 2021 18:20:20 +0000
Received: by outflank-mailman (input) for mailman id 95658;
 Tue, 09 Mar 2021 18:20:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w89V=IH=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lJgxu-00009P-Jj
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 18:20:18 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 91cb705f-1054-43c4-a5e1-7594f8d59ff1;
 Tue, 09 Mar 2021 18:20:16 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5436031B;
 Tue,  9 Mar 2021 10:20:16 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A48F3F73C;
 Tue,  9 Mar 2021 10:20:15 -0800 (PST)
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
X-Inumbo-ID: 91cb705f-1054-43c4-a5e1-7594f8d59ff1
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/5] xen/arm: smmuv1: Fix stream match conflict issue
Date: Tue,  9 Mar 2021 18:19:24 +0000
Message-Id: <cover.1615312254.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch is the work to fix the stream match conflict issue when two devices
have the same stream-id.

Approach taken is to merge the below commit from Linux driver to fix the
issue.

1. "iommu/arm-smmu: Handle stream IDs more dynamically"
    commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
2. "iommu/arm-smmu: Consolidate stream map entry state"
    commit 1f3d5ca43019bff1105838712d55be087d93c0da
3. "iommu/arm-smmu: Keep track of S2CR state"
    commit 8e8b203eabd8b9e96d02d6339e4abce3e5a7ea4b
4. "iommu/arm-smmu: Add a stream map entry iterator"
    commit d3097e39302083d58922a3d1032d7d59a63d263d
5. "iommu/arm-smmu: Intelligent SMR allocation"
    commit 588888a7399db352d2b1a41c9d5b3bf0fd482390

Rahul Singh (5):
  xen/arm: smmuv1: Handle stream IDs more dynamically
  xen/arm: smmuv1: Consolidate stream map entry state
  xen/arm: smmuv1: Keep track of S2CR state
  xen/arm: smmuv1: Add a stream map entry iterator
  xen/arm: smmuv1: Intelligent SMR allocation

 xen/drivers/passthrough/arm/smmu.c | 423 ++++++++++++++++++-----------
 1 file changed, 262 insertions(+), 161 deletions(-)

-- 
2.17.1


