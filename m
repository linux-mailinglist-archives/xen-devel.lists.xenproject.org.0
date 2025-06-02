Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCDC4ACAD41
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 13:33:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003242.1382768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3Pv-0006lp-Rc; Mon, 02 Jun 2025 11:33:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003242.1382768; Mon, 02 Jun 2025 11:33:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM3Pv-0006j8-OV; Mon, 02 Jun 2025 11:33:23 +0000
Received: by outflank-mailman (input) for mailman id 1003242;
 Mon, 02 Jun 2025 11:33:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XkTG=YR=oracle.com=harshvardhan.j.jha@srs-se1.protection.inumbo.net>)
 id 1uM3Pu-0005Pz-92
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 11:33:22 +0000
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 61ee9dc0-3fa5-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 13:33:20 +0200 (CEST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5525uQTG002330;
 Mon, 2 Jun 2025 11:33:15 GMT
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46ytawjcbr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Jun 2025 11:33:14 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5529VABB030620; Mon, 2 Jun 2025 11:33:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 46yr77uujv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 02 Jun 2025 11:33:11 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 552BXAUl020033;
 Mon, 2 Jun 2025 11:33:11 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com
 [10.129.136.47])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 46yr77uuhu-2; Mon, 02 Jun 2025 11:33:11 +0000
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
X-Inumbo-ID: 61ee9dc0-3fa5-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=gayvE
	A2rVtsXvkFiJ3V1oEC2mGeCkmsqwcTLVgBGcnU=; b=cwrSisxuL3SydVLeYypgp
	R+CWudHLz95hzRmFVNhqRZORVzAGzdcoFAUSYD2gbotJ7Nz8ybo3Yy64bEM5im/T
	fVBh/lFcU0H+FGeaL7Z44dTSCNg1Y7anLI3RYSZtQnoQFsR8mtUtlIgNF33AEKcV
	6r3W1ajAV4ea8LUReU2x9rLIGs5U//5lBiHH0+jo44RL8RrQN7LQtY6q1ke76uyt
	b2iucf/aana75SBAXL7p2uimHUssAhwxvpCQZHyJ4lDwKkwTKOSMl7YYEXMDvvnG
	S5kMhu73hsQtvkU2CCCKX3J67GVbWPxoNsLNTGqfHZWYFztedE2b2CwnBYJCkYk/
	w==
From: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
To: jgross@suse.com, sstabellini@kernel.org, boris.ostrovsky@oracle.com
Cc: harshvardhan.j.jha@oracle.com, xen-devel@lists.xenproject.org,
        iommu@lists.linux.dev, stable@vger.kernel.org
Subject: [PATCH 5.4.y 1/1] xen/swiotlb: relax alignment requirements
Date: Mon,  2 Jun 2025 04:33:08 -0700
Message-ID: <20250602113308.3475836-2-harshvardhan.j.jha@oracle.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250602113308.3475836-1-harshvardhan.j.jha@oracle.com>
References: <20250602113308.3475836-1-harshvardhan.j.jha@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-02_05,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506020099
X-Proofpoint-GUID: TduUfKGbuxsukIBDwRYM4gyTx9y4tmCM
X-Proofpoint-ORIG-GUID: TduUfKGbuxsukIBDwRYM4gyTx9y4tmCM
X-Authority-Analysis: v=2.4 cv=ctObk04i c=1 sm=1 tr=0 ts=683d8bfb b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=iox4zFpeAAAA:8 a=yPCof4ZbAAAA:8 a=E5hRKjw2lWykmI9IJP0A:9 a=WzC6qhA0u3u7Ye7llzcV:22 cc=ntf
 awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAyMDEwMCBTYWx0ZWRfXwLSOvWaaOpvw /9NGPMepObrOY+QYEypxiCckoPETYx0oNPJkwRzfn/4TqftXcO1+irEyoGFAjnQMAXIB/QpCwHr KLg8cA0yOnt9yYoNXYZjxIjJSKDdIwA0ykcTmivx0sCJsPE6ZxZMAGMMJ26RBhcs4HMDtyx4vHC
 MsFpj8FWiavKM92wjcSsC0b2+DhhXNJPEjzV/QvwUfVkdWthzgRojsXuTJHhO9r80qZSnsoRZx0 gRNmNaitmu9OMppw1W7ZF0IZ5d/VXYM1SmZ+Wgd5EnLHQ6l7Y3hHdxNnXyunHSvyetGWtkhbxnJ 4fDqsStL2toaf6uzjvS66TrUwj7pk5R/V4KeHrT4hJ+66J6FL1qyknT83gfMi23E79/2yACnYGV
 gIMVSyyY3Gn7sWPl2LdZ4Wk9ogB6n1zL8GjgtQirONaV1qifV4btqSIJTjERMtGLTrqnE+CC

[ Upstream commit 85fcb57c983f423180ba6ec5d0034242da05cc54 ]

When mapping a buffer for DMA via .map_page or .map_sg DMA operations,
there is no need to check the machine frames to be aligned according
to the mapped areas size. All what is needed in these cases is that the
buffer is contiguous at machine level.

So carve out the alignment check from range_straddles_page_boundary()
and move it to a helper called by xen_swiotlb_alloc_coherent() and
xen_swiotlb_free_coherent() directly.

Fixes: 9f40ec84a797 ("xen/swiotlb: add alignment check for dma buffers")
Signed-off-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Harshvardhan Jha <harshvardhan.j.jha@oracle.com>
---
 drivers/xen/swiotlb-xen.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
index 5bd29d0bffa2e..382ee7dc3d5d9 100644
--- a/drivers/xen/swiotlb-xen.c
+++ b/drivers/xen/swiotlb-xen.c
@@ -85,19 +85,21 @@ static inline dma_addr_t xen_virt_to_bus(void *address)
 	return xen_phys_to_bus(virt_to_phys(address));
 }
 
+static inline bool range_requires_alignment(phys_addr_t p, size_t size)
+{
+	phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
+	phys_addr_t bus_addr = pfn_to_bfn(XEN_PFN_DOWN(p)) << XEN_PAGE_SHIFT;
+
+	return IS_ALIGNED(p, algn) && !IS_ALIGNED(bus_addr, algn);
+}
+
 static inline int range_straddles_page_boundary(phys_addr_t p, size_t size)
 {
 	unsigned long next_bfn, xen_pfn = XEN_PFN_DOWN(p);
 	unsigned int i, nr_pages = XEN_PFN_UP(xen_offset_in_page(p) + size);
-	phys_addr_t algn = 1ULL << (get_order(size) + PAGE_SHIFT);
 
 	next_bfn = pfn_to_bfn(xen_pfn);
 
-	/* If buffer is physically aligned, ensure DMA alignment. */
-	if (IS_ALIGNED(p, algn) &&
-	    !IS_ALIGNED((phys_addr_t)next_bfn << XEN_PAGE_SHIFT, algn))
-		return 1;
-
 	for (i = 1; i < nr_pages; i++)
 		if (pfn_to_bfn(++xen_pfn) != ++next_bfn)
 			return 1;
@@ -320,7 +322,8 @@ xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
 	phys = *dma_handle;
 	dev_addr = xen_phys_to_bus(phys);
 	if (((dev_addr + size - 1 <= dma_mask)) &&
-	    !range_straddles_page_boundary(phys, size))
+	    !range_straddles_page_boundary(phys, size) &&
+	    !range_requires_alignment(phys, size))
 		*dma_handle = dev_addr;
 	else {
 		if (xen_create_contiguous_region(phys, order,
@@ -360,6 +363,7 @@ xen_swiotlb_free_coherent(struct device *hwdev, size_t size, void *vaddr,
 
 	if (!WARN_ON((dev_addr + size - 1 > dma_mask) ||
 		     range_straddles_page_boundary(phys, size)) &&
+	    !range_requires_alignment(phys, size) &&
 	    TestClearPageXenRemapped(page))
 		xen_destroy_contiguous_region(phys, order);
 
-- 
2.47.1


