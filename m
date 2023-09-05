Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7A7920BD
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 09:32:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595371.928909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQXH-0002tR-CC; Tue, 05 Sep 2023 07:31:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595371.928909; Tue, 05 Sep 2023 07:31:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdQXH-0002rT-9c; Tue, 05 Sep 2023 07:31:43 +0000
Received: by outflank-mailman (input) for mailman id 595371;
 Tue, 05 Sep 2023 07:31:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0K8l=EV=bugseng.com=nicola.vetrini@srs-se1.protection.inumbo.net>)
 id 1qdQXF-0002rN-Pa
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 07:31:41 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 40a05c4d-4bbe-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 09:31:40 +0200 (CEST)
Received: from nico.bugseng.com (unknown [147.123.100.131])
 by support.bugseng.com (Postfix) with ESMTPSA id 98AE84EE0737;
 Tue,  5 Sep 2023 09:31:38 +0200 (CEST)
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
X-Inumbo-ID: 40a05c4d-4bbe-11ee-8783-cb3800f73035
From: Nicola Vetrini <nicola.vetrini@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org,
	michal.orzel@amd.com,
	xenia.ragiadakou@amd.com,
	ayan.kumar.halder@amd.com,
	consulting@bugseng.com,
	Nicola Vetrini <nicola.vetrini@bugseng.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Wei Liu <wl@xen.org>
Subject: [XEN PATCH] xen/types: address Rule 10.1 for macro BITS_TO_LONGS
Date: Tue,  5 Sep 2023 09:31:16 +0200
Message-Id: <b3aaaf5265c7e7ce6228ba2146f57aaae09f55e6.1693899008.git.nicola.vetrini@bugseng.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Given its use in the declaration
'DECLARE_BITMAP(features, IOMMU_FEAT_count)' the argument
'bits' has essential type 'enum iommu_feature', which is not
allowed by the Rule as an operand to the addition operator.
Given that its value can be represented by a signed integer,
the explicit cast resolves the violation.

Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
---
 xen/include/xen/types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/xen/types.h b/xen/include/xen/types.h
index aea259db1ef2..2ff8f243908d 100644
--- a/xen/include/xen/types.h
+++ b/xen/include/xen/types.h
@@ -23,7 +23,7 @@ typedef signed long ssize_t;
 typedef __PTRDIFF_TYPE__ ptrdiff_t;
 
 #define BITS_TO_LONGS(bits) \
-    (((bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
+    (((int)(bits)+BITS_PER_LONG-1)/BITS_PER_LONG)
 #define DECLARE_BITMAP(name,bits) \
     unsigned long name[BITS_TO_LONGS(bits)]
 
-- 
2.34.1


