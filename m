Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ACA7F7BB323
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 10:26:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613309.953832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogAF-0008Qb-EC; Fri, 06 Oct 2023 08:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613309.953832; Fri, 06 Oct 2023 08:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qogAF-0008L1-6L; Fri, 06 Oct 2023 08:26:27 +0000
Received: by outflank-mailman (input) for mailman id 613309;
 Fri, 06 Oct 2023 08:26:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bl8M=FU=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qogAC-0006Fk-LE
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 08:26:24 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 085ea74b-6422-11ee-98d3-6d05b1d4d9a1;
 Fri, 06 Oct 2023 10:26:22 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id DEEA04EE0C88;
 Fri,  6 Oct 2023 10:26:21 +0200 (CEST)
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
X-Inumbo-ID: 085ea74b-6422-11ee-98d3-6d05b1d4d9a1
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
	Paul Durrant <paul@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH][for-4.19 8/9] xen/types: address Rule 10.1 for DECLARE_BITMAP use
Date: Fri,  6 Oct 2023 10:26:11 +0200
Message-Id: <9642dcb4ab51ec9eaeedf16056fbcd946a3efbea.1696514677.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696514677.git.nicola.vetrini@bugseng.com>
References: <cover.1696514677.git.nicola.vetrini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Given its use in the declaration
'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
'bits' has essential type 'enum iommu_feature', which is not
allowed by the Rule as an operand to the addition operator
in macro 'BITS_TO_LONGS'.

A comment in BITS_TO_LONGS is added to make it clear that
values passed are meant to be positive.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/iommu.h | 2 +-
 xen/include/xen/types.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 0e747b0bbc1c..34aa0b9b5b81 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -360,7 +360,7 @@ struct domain_iommu {
 #endif
 
     /* Features supported by the IOMMU */
-    DECLARE_BITMAP(features, IOMMU_FEAT_count);
+    DECLARE_BITMAP(features, (int)IOMMU_FEAT_count);
 
     /* Does the guest share HAP mapping with the IOMMU? */
     bool hap_pt_share;
diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index aea259db1ef2..936e83d333a0 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -22,6 +22,7 @@ typedef signed long ssize_t;
 
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
 
+/* Users of this macro are expected to pass a positive value */
 #define BITS_TO_LONGS(bits) \
     (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
 #define DECLARE_BITMAP(name,bits) \
-- 
2.34.1


