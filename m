Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A02A7E392
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 17:12:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940330.1340146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1o8f-0005l9-DS; Mon, 07 Apr 2025 15:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940330.1340146; Mon, 07 Apr 2025 15:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1o8f-0005jc-AH; Mon, 07 Apr 2025 15:11:53 +0000
Received: by outflank-mailman (input) for mailman id 940330;
 Mon, 07 Apr 2025 15:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XdEV=WZ=linux.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1u1o8e-0005V9-2g
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 15:11:52 +0000
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9fd8cb33-13c2-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 17:11:48 +0200 (CEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378eCst023081;
 Mon, 7 Apr 2025 15:11:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v0spm8qy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Apr 2025 15:11:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 537FBZII019687;
 Mon, 7 Apr 2025 15:11:35 GMT
Received: from ppma13.dal12v.mail.ibm.com
 (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45v0spm8qw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Apr 2025 15:11:35 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
 by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 537Ehxeh017825;
 Mon, 7 Apr 2025 15:11:34 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
 by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45uh2ke5uh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Apr 2025 15:11:32 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com
 [10.20.54.105])
 by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 537FBVTb14156090
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Apr 2025 15:11:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B32320049;
 Mon,  7 Apr 2025 15:11:31 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E98012004D;
 Mon,  7 Apr 2025 15:11:30 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
 Mon,  7 Apr 2025 15:11:30 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
 id 85284E1613; Mon, 07 Apr 2025 17:11:30 +0200 (CEST)
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
X-Inumbo-ID: 9fd8cb33-13c2-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=ngcqzYVpe7xkxjw37
	TRZ0RrIQbWfDyVW1WAk2hgrGY8=; b=WCNS4jwcRyfhgA/oGV/C7ufKUl5usySJY
	JBkrPpB0Kj0xSv0oPCKUqsc+vBFB8dZYewnwf47Zz4FOayaQxY3jaFKQUDjdWPJt
	ugxuydo8+0yZUmA+ohR403/w5zwKv2CqsgJbjNB2KabEV+JDdelbBoH8nco6FKOT
	R5XE4tzipG+fY4VoyLYwQ+3uN9XzGnan0j6xdebHv5sDZ2LfDdbtnEUN2Il+RJjB
	cmqGM+BCXcv4bJsoArQ7K3cEPEa9kiS4jW2g+IRmJx8IwWMG+l59zFFBzIXRlwbd
	208F8LABLveUmxIFtMSBQJf8LY6ozCLBM9y7Hx9SlNJ6+MvGB6fBA==
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, kasan-dev@googlegroups.com,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org
Subject: [PATCH v1 3/4] mm: Protect kernel pgtables in apply_to_pte_range()
Date: Mon,  7 Apr 2025 17:11:29 +0200
Message-ID: <11dbe3ac88130dbd2b8554f9369cd93fe138c655.1744037648.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1744037648.git.agordeev@linux.ibm.com>
References: <cover.1744037648.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Gsml-lqe4-oFygMCgc_o4kWGTfpeXFVg
X-Proofpoint-ORIG-GUID: 9HS87Mcesg4PbHflITRoaij8qwSTG9RL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 bulkscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 mlxlogscore=828
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504070104

The lazy MMU mode can only be entered and left under the protection
of the page table locks for all page tables which may be modified.
Yet, when it comes to kernel mappings apply_to_pte_range() does not
take any locks. That does not conform arch_enter|leave_lazy_mmu_mode()
semantics and could potentially lead to re-schedulling a process while
in lazy MMU mode or racing on a kernel page table updates.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 mm/kasan/shadow.c | 7 ++-----
 mm/memory.c       | 5 ++++-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/mm/kasan/shadow.c b/mm/kasan/shadow.c
index edfa77959474..6531a7aa8562 100644
--- a/mm/kasan/shadow.c
+++ b/mm/kasan/shadow.c
@@ -308,14 +308,14 @@ static int kasan_populate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 	__memset((void *)page, KASAN_VMALLOC_INVALID, PAGE_SIZE);
 	pte = pfn_pte(PFN_DOWN(__pa(page)), PAGE_KERNEL);
 
-	spin_lock(&init_mm.page_table_lock);
 	if (likely(pte_none(ptep_get(ptep)))) {
 		set_pte_at(&init_mm, addr, ptep, pte);
 		page = 0;
 	}
-	spin_unlock(&init_mm.page_table_lock);
+
 	if (page)
 		free_page(page);
+
 	return 0;
 }
 
@@ -401,13 +401,10 @@ static int kasan_depopulate_vmalloc_pte(pte_t *ptep, unsigned long addr,
 
 	page = (unsigned long)__va(pte_pfn(ptep_get(ptep)) << PAGE_SHIFT);
 
-	spin_lock(&init_mm.page_table_lock);
-
 	if (likely(!pte_none(ptep_get(ptep)))) {
 		pte_clear(&init_mm, addr, ptep);
 		free_page(page);
 	}
-	spin_unlock(&init_mm.page_table_lock);
 
 	return 0;
 }
diff --git a/mm/memory.c b/mm/memory.c
index f0201c8ec1ce..1f3727104e99 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -2926,6 +2926,7 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 			pte = pte_offset_kernel(pmd, addr);
 		if (!pte)
 			return err;
+		spin_lock(&init_mm.page_table_lock);
 	} else {
 		if (create)
 			pte = pte_alloc_map_lock(mm, pmd, addr, &ptl);
@@ -2951,7 +2952,9 @@ static int apply_to_pte_range(struct mm_struct *mm, pmd_t *pmd,
 
 	arch_leave_lazy_mmu_mode();
 
-	if (mm != &init_mm)
+	if (mm == &init_mm)
+		spin_unlock(&init_mm.page_table_lock);
+	else
 		pte_unmap_unlock(mapped_pte, ptl);
 
 	*mask |= PGTBL_PTE_MODIFIED;
-- 
2.45.2


