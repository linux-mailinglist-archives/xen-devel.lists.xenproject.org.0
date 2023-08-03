Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFB876E58C
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 12:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576180.902060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUL-0005WU-R8; Thu, 03 Aug 2023 10:23:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576180.902060; Thu, 03 Aug 2023 10:23:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRVUL-0005Tu-NI; Thu, 03 Aug 2023 10:23:25 +0000
Received: by outflank-mailman (input) for mailman id 576180;
 Thu, 03 Aug 2023 10:23:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nYgs=DU=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qRVUJ-0004Rp-Ja
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 10:23:23 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c64a8d92-31e7-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 12:23:23 +0200 (CEST)
Received: from beta.station (net-188-218-251-179.cust.vodafonedsl.it
 [188.218.251.179])
 by support.bugseng.com (Postfix) with ESMTPSA id 765244EE0737;
 Thu,  3 Aug 2023 12:23:22 +0200 (CEST)
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
X-Inumbo-ID: c64a8d92-31e7-11ee-b268-6b7b168915f2
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH 04/13] x86/IOMMU: address violations of MISRA C:2012 Rule 7.3
Date: Thu,  3 Aug 2023 12:22:19 +0200
Message-Id: <ba2605e168cb65ca7f2e4fcc6b957b5ae0b3062a.1691053438.git.simone.ballarin@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1691053438.git.simone.ballarin@bugseng.com>
References: <cover.1691053438.git.simone.ballarin@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contain violations of MISRA C:2012 Rule 7.3 whose headline
states:
"The lowercase character 'l' shall not be used in a literal suffix".

Use the "L" suffix instead of the "l" suffix, to avoid potential ambiguity.
If the "u" suffix is used near "L", use the "U" suffix instead, for consistency.

The changes in this patch are mechanical.

Signed-off-by: Gianluca	Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
---
 xen/drivers/passthrough/x86/iommu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index d290855959..c85549ccad 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -576,16 +576,16 @@ struct page_info *iommu_alloc_pgtable(struct domain_iommu *hd,
 
         ASSERT((CONTIG_LEVEL_SHIFT & (contig_mask >> shift)) == CONTIG_LEVEL_SHIFT);
 
-        p[0] = (CONTIG_LEVEL_SHIFT + 0ull) << shift;
+        p[0] = (CONTIG_LEVEL_SHIFT + 0ULL) << shift;
         p[1] = 0;
-        p[2] = 1ull << shift;
+        p[2] = 1ULL << shift;
         p[3] = 0;
 
         for ( i = 4; i < PAGE_SIZE / sizeof(*p); i += 4 )
         {
-            p[i + 0] = (find_first_set_bit(i) + 0ull) << shift;
+            p[i + 0] = (find_first_set_bit(i) + 0ULL) << shift;
             p[i + 1] = 0;
-            p[i + 2] = 1ull << shift;
+            p[i + 2] = 1ULL << shift;
             p[i + 3] = 0;
         }
     }
-- 
2.34.1


