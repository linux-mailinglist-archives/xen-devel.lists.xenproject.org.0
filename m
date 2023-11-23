Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C30987F596A
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 08:38:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639378.996695 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64Hr-0006k7-5G; Thu, 23 Nov 2023 07:38:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639378.996695; Thu, 23 Nov 2023 07:38:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r64Hr-0006gk-1a; Thu, 23 Nov 2023 07:38:11 +0000
Received: by outflank-mailman (input) for mailman id 639378;
 Thu, 23 Nov 2023 07:38:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FfzT=HE=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1r64Hp-0004t9-FC
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 07:38:09 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f0c32bb-89d3-11ee-98e2-6d05b1d4d9a1;
 Thu, 23 Nov 2023 08:38:08 +0100 (CET)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id A73B14EE0C89;
 Thu, 23 Nov 2023 08:38:07 +0100 (CET)
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
X-Inumbo-ID: 3f0c32bb-89d3-11ee-98e2-6d05b1d4d9a1
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: nicola.vetrini@bugseng.com,
	xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger.pau@citrix.com,
	Paul Durrant <paul@xen.org>
Subject: [XEN PATCH v3 2/2] xen/iommu: use ISOLATE_LSB to wrap a violation of Rule 10.1
Date: Thu, 23 Nov 2023 08:37:55 +0100
Message-Id: <864df3cff95b6dde17ebd7af6d814f79a0ab2044.1700724699.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700724699.git.nicola.vetrini@bugseng.com>
References: <cover.1700724699.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No functional change.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v2:
- Changed macro name
Changes in v3:
- Changed macro name
---
 xen/drivers/passthrough/iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index f9a9f53dbd44..996c31be1284 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -560,7 +560,7 @@ int __init iommu_setup(void)
         rc = iommu_hardware_setup();
         if ( !rc )
             ops = iommu_get_ops();
-        if ( ops && (ops->page_sizes & -ops->page_sizes) != PAGE_SIZE )
+        if ( ops && (ISOLATE_LSB(ops->page_sizes)) != PAGE_SIZE )
         {
             printk(XENLOG_ERR "IOMMU: page size mask %lx unsupported\n",
                    ops->page_sizes);
-- 
2.34.1


