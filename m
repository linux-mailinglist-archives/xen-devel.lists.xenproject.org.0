Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78FF0AD7914
	for <lists+xen-devel@lfdr.de>; Thu, 12 Jun 2025 19:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1013362.1391860 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPlqu-0000JI-Ht; Thu, 12 Jun 2025 17:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1013362.1391860; Thu, 12 Jun 2025 17:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPlqu-0000DO-AW; Thu, 12 Jun 2025 17:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1013362;
 Thu, 12 Jun 2025 17:36:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JIJj=Y3=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1uPlqt-00008H-1L
 for xen-devel@lists.xenproject.org; Thu, 12 Jun 2025 17:36:35 +0000
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c787acf8-47b3-11f0-a309-13f23c93f187;
 Thu, 12 Jun 2025 19:36:33 +0200 (CEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CDVPIr012486;
 Thu, 12 Jun 2025 17:36:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474cxjmf0u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 17:36:17 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CHaHOc028261;
 Thu, 12 Jun 2025 17:36:17 GMT
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474cxjmf0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 17:36:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CE2lWZ014912;
 Thu, 12 Jun 2025 17:36:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4750rpdxe4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Jun 2025 17:36:15 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 55CHaEm611338160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Jun 2025 17:36:14 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00E3020040;
 Thu, 12 Jun 2025 17:36:14 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E100A2004B;
 Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
 id 9DA9BE198F; Thu, 12 Jun 2025 19:36:13 +0200 (CEST)
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
X-Inumbo-ID: c787acf8-47b3-11f0-a309-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Bzq6L693jOZBbQpnk
	olPJGXvQrWYd1fA+nYNAUkTJK4=; b=ESDJHNKEE5xuMiyIFUW6rYf02Me5a5lyb
	sWhbyWwUtgNFGu8PZLKdUv0/9qZAokrkZRb85d5PqBmzMqJaTlf6PYCK7ooXS42h
	Sq9hPT9J3MS2Gveds7bG8V2afGAi1+Bp71tEdFw4AjRsQPRDr1Umq+yV+i/+HxRz
	n29nAJUsXyZsJzo6atbehh0gZuHskVtQ+fWRjZb2/pbovS94Rs2p0L6Km7uhekrU
	1t3NzEXRsgT+51JGwOIO1WeLGZ6quB0XBM0mrJpvTTYoJ7Z5pR4AoRk4/Ge4a+HQ
	k5s7CGGTEeBuimVvxzeF5PeRGYrxNKHgZgbVs7HstYNamBwuMdVew==
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>,
        Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH 1/6] mm: Cleanup apply_to_pte_range() routine
Date: Thu, 12 Jun 2025 19:36:08 +0200
Message-ID: <b687f16961eaa285960d6b2c5e84360f1c3269df.1749747752.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1749747752.git.agordeev@linux.ibm.com>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GFSzaItUyEu6yP3gS3meeLbrZ9VQTNp2
X-Proofpoint-GUID: sqmBLLFPSau8kX6gstpm2ABJeaMXDzrY
X-Authority-Analysis: v=2.4 cv=fZWty1QF c=1 sm=1 tr=0 ts=684b1012 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=cw6LjJxz1Y3IMotYGxwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMiBTYWx0ZWRfX/1bjcnG+oHBr pQDvf9bYzabUNkDtJTPjUxbszAUvnuseyUY6yPMmqPawboY3JQdlIMe1zE8qPlqEMiTmIRm5hS1 dZl7AQt+DbprJCkJokCTDYCd0VMJnUOxqaxW//MoOIuKhE3bFMliw0UK15vBUQ0lRDM+mrJj2zC
 yUpjswXJHT+h6+EpfvFovs4dCh6L5u4Ykn2tCFCfD453NQH13H8nIpNRXk+HHxhvDrVWycEacW4 /2czHIQffp42M7ictd08dwUcFf3euUuwxOXSbJ5WuxC/Hv/Vzb/9Vv1wFBVJU+FMSP1gFiqJsd0 VvDwZoAVDaHgmVW6Mu34ZDZJ8Cw6qnhtSzv7T/Boq9y8bX+AMp7SzKTkfdMd9g5rnuiIrxSQFrI
 0E24jrpYAI52CuduE9GnxB2obbmRbpdrR9rNV8uM47GqJ34ZsBxm2r2PUC1QUcejP/SHofJr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=780
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120132

Reverse 'create' vs 'mm == &init_mm' conditions and move
page table mask modification out of the atomic context.
This is a prerequisite for locking kernel page tables.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 mm/memory.c | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/mm/memory.c b/mm/memory.c
index 8eba595056fe..71b3d3f98999 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -3006,24 +3006,28 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 				     pte_fn_t fn, void *data, bool create,
 				     pgtbl_mod_mask *mask)
 {
+	int err = create ? -ENOMEM : -EINVAL;
 	pte_t *pte, *mapped_pte;
-	int err = 0;
 	spinlock_t *ptl;
 
-	if (create) {
-		mapped_pte = pte = (mm == &init_mm) ?
-			pte_alloc_kernel_track(pmd, addr, mask) :
-			pte_alloc_map_lock(mm, pmd, addr, &ptl);
+	if (mm == &init_mm) {
+		if (create)
+			pte = pte_alloc_kernel_track(pmd, addr, mask);
+		else
+			pte = pte_offset_kernel(pmd, addr);
 		if (!pte)
-			return -ENOMEM;
+			return err;
 	} else {
-		mapped_pte = pte = (mm == &init_mm) ?
-			pte_offset_kernel(pmd, addr) :
-			pte_offset_map_lock(mm, pmd, addr, &ptl);
+		if (create)
+			pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
+		else
+			pte = pte_offset_map_lock(mm, pmd, addr, &ptl);
 		if (!pte)
-			return -EINVAL;
+			return err;
+		mapped_pte = pte;
 	}
 
+	err = 0;
 	arch_enter_lazy_mmu_mode();
 
 	if (fn) {
@@ -3035,12 +3039,14 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			}
 		} while (pte++, addr += PAGE_SIZE, addr != end);
 	}
-	*mask |= PGTBL_PTE_MODIFIED;
 
 	arch_leave_lazy_mmu_mode();
 
 	if (mm != &init_mm)
 		pte_unmap_unlock(mapped_pte, ptl);
+
+	*mask |= PGTBL_PTE_MODIFIED;
+
 	return err;
 }
 
-- 
2.48.1


