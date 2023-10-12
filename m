Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 902D27C71EB
	for <lists+xen-devel@lfdr.de>; Thu, 12 Oct 2023 17:58:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615897.957445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqy4N-0007g3-Ea; Thu, 12 Oct 2023 15:57:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615897.957445; Thu, 12 Oct 2023 15:57:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqy4N-0007ci-Ba; Thu, 12 Oct 2023 15:57:51 +0000
Received: by outflank-mailman (input) for mailman id 615897;
 Thu, 12 Oct 2023 15:57:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oWZW=F2=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qqy4L-000777-Ua
 for xen-devel@lists.xenproject.org; Thu, 12 Oct 2023 15:57:49 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1711a1ca-6918-11ee-9b0e-b553b5be7939;
 Thu, 12 Oct 2023 17:57:48 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id B5B874EE0747;
 Thu, 12 Oct 2023 17:57:46 +0200 (CEST)
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
X-Inumbo-ID: 1711a1ca-6918-11ee-9b0e-b553b5be7939
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
Subject: [XEN PATCH][for-4.19 2/2] xen/iommu: use LOWEST_BIT to wrap a violation of Rule 10.1
Date: Thu, 12 Oct 2023 17:57:39 +0200
Message-Id: <26399294316ff7f468c05d7e8a8433227afb3177.1697125949.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697125949.git.nicola.vetrini@bugseng.com>
References: <cover.1697125949.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/drivers/passthrough/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index f9a9f53dbd44..558700788d4a 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -560,7 +560,7 @@ int __init iommu_setup(void)
         rc = iommu_hardware_setup();
         if ( !rc )
             ops = iommu_get_ops();
-        if ( ops && (ops->page_sizes & -ops->page_sizes) != PAGE_SIZE )
+        if ( ops && (LOWEST_BIT(ops->page_sizes)) != PAGE_SIZE )
         {
             printk(XENLOG_ERR "IOMMU: page size mask %lx unsupported\n",
                    ops->page_sizes);
-- 
2.34.1


