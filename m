Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 901E57D9A22
	for <lists+xen-devel@lfdr.de>; Fri, 27 Oct 2023 15:37:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.624411.973018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwN1N-0005sR-RI; Fri, 27 Oct 2023 13:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 624411.973018; Fri, 27 Oct 2023 13:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qwN1N-0005mE-LA; Fri, 27 Oct 2023 13:37:05 +0000
Received: by outflank-mailman (input) for mailman id 624411;
 Fri, 27 Oct 2023 13:37:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bjPi=GJ=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qwN1M-0005Xh-G3
 for xen-devel@lists.xenproject.org; Fri, 27 Oct 2023 13:37:04 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e9d4b4ab-74cd-11ee-98d6-6d05b1d4d9a1;
 Fri, 27 Oct 2023 15:37:03 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id AEC5D4EE0C81;
 Fri, 27 Oct 2023 15:37:02 +0200 (CEST)
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
X-Inumbo-ID: e9d4b4ab-74cd-11ee-98d6-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH][for-4.19 v2 2/2] xen/iommu: use ISOLATE_LOW_BIT to wrap a violation of Rule 10.1
Date: Fri, 27 Oct 2023 15:36:56 +0200
Message-Id: <6a1590b0d002641fe8dc53a2368ab8c2973e4bb3.1698413073.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1698413073.git.nicola.vetrini@bugseng.com>
References: <cover.1698413073.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v2:
- Changed macro name
---
 xen/drivers/passthrough/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index f9a9f53dbd44..894e4fd2f43b 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -560,7 +560,7 @@ int __init iommu_setup(void)
         rc = iommu_hardware_setup();
         if ( !rc )
             ops = iommu_get_ops();
-        if ( ops && (ops->page_sizes & -ops->page_sizes) != PAGE_SIZE )
+        if ( ops && (ISOLATE_LOW_BIT(ops->page_sizes)) != PAGE_SIZE )
         {
             printk(XENLOG_ERR "IOMMU: page size mask %lx unsupported\n",
                    ops->page_sizes);
-- 
2.34.1


