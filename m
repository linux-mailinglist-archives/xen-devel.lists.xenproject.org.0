Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FB163F4F3
	for <lists+xen-devel@lfdr.de>; Thu,  1 Dec 2022 17:13:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.451003.708575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mBn-0001MM-9x; Thu, 01 Dec 2022 16:13:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 451003.708575; Thu, 01 Dec 2022 16:13:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p0mBn-0001JE-6p; Thu, 01 Dec 2022 16:13:31 +0000
Received: by outflank-mailman (input) for mailman id 451003;
 Thu, 01 Dec 2022 16:13:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ShmB=37=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1p0mBl-0008UE-6q
 for xen-devel@lists.xenproject.org; Thu, 01 Dec 2022 16:13:29 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 171bfda8-7193-11ed-8fd2-01056ac49cbb;
 Thu, 01 Dec 2022 17:13:28 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 417E5D6E;
 Thu,  1 Dec 2022 08:13:34 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D2B1C3F73B;
 Thu,  1 Dec 2022 08:13:26 -0800 (PST)
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
X-Inumbo-ID: 171bfda8-7193-11ed-8fd2-01056ac49cbb
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH 13/21] xen/arm: vsmmuv3: Add "iommus" property node for dom0 devices
Date: Thu,  1 Dec 2022 16:02:37 +0000
Message-Id: <d7cbb7afd9e2480e5febbcb15846d15a07e2600a.1669888522.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1669888522.git.rahul.singh@arm.com>
References: <cover.1669888522.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"iommus" property will be added for dom0 devices to virtual
IOMMU node to enable the dom0 linux kernel to configure the IOMMU

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/arch/arm/domain_build.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index abbaf37a2e..a5295e8c3e 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1172,9 +1172,12 @@ static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
             continue;
         }
 
-        if ( iommu_node )
+        /*
+         * Expose IOMMU specific properties to hwdom when vIOMMU is
+         * enabled.
+         */
+        if ( iommu_node && !is_viommu_enabled() )
         {
-            /* Don't expose IOMMU specific properties to hwdom */
             if ( dt_property_name_is_equal(prop, "iommus") )
                 continue;
 
-- 
2.25.1


