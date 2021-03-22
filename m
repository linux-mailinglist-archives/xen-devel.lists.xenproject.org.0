Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155C8344AC4
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 17:12:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100321.191079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lON9o-00022L-PA; Mon, 22 Mar 2021 16:11:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100321.191079; Mon, 22 Mar 2021 16:11:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lON9o-00021w-Lu; Mon, 22 Mar 2021 16:11:56 +0000
Received: by outflank-mailman (input) for mailman id 100321;
 Mon, 22 Mar 2021 16:11:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0JfP=IU=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lON9n-00021r-CS
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 16:11:55 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 528b16e0-b123-458d-a83c-84fab25a6446;
 Mon, 22 Mar 2021 16:11:53 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 059B31042;
 Mon, 22 Mar 2021 09:11:53 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F3BE43F719;
 Mon, 22 Mar 2021 09:11:51 -0700 (PDT)
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
X-Inumbo-ID: 528b16e0-b123-458d-a83c-84fab25a6446
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/5] xen/arm: smmuv1: Fix stream match conflict issue
Date: Mon, 22 Mar 2021 16:11:34 +0000
Message-Id: <cover.1616428314.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1

This patch is the work to fix the stream match conflict issue when two devices
have the same stream-id.

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

Changes since v2:
 - Updated commit message to show the original author of the patch.
 - Added  Acked-by: Stefano Stabellini <sstabellini@kernel.org>
 - Addded Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
  
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


