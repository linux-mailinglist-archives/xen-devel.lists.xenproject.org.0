Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA6E1A1B38
	for <lists+xen-devel@lfdr.de>; Wed,  8 Apr 2020 07:05:53 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jM2uH-0002q1-5b; Wed, 08 Apr 2020 05:05:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=sdaI=5Y=oracle.com=ankur.a.arora@srs-us1.protection.inumbo.net>)
 id 1jM2uF-0002oQ-53
 for xen-devel@lists.xenproject.org; Wed, 08 Apr 2020 05:05:43 +0000
X-Inumbo-ID: 8dca44f3-7956-11ea-81bb-12813bfff9fa
Received: from userp2130.oracle.com (unknown [156.151.31.86])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8dca44f3-7956-11ea-81bb-12813bfff9fa;
 Wed, 08 Apr 2020 05:05:24 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03854h69013027;
 Wed, 8 Apr 2020 05:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2020-01-29;
 bh=8QxNSgJ0TIVxhxX6u30CrqzHaWwQp1Js8M95AGUtpXc=;
 b=vI5EI8HOwXwI5eQetVqe1UeC1FDR5h2Wq2Yc4V02ynbY+QJ5s5gshLf87NcS/xzV5QOo
 Gxmf6Vle0gmY8WBM7etujGZBUqGtXtK1X6cQzgXXz0qUt/rOZqrM4I7h/EmNpLtA8kVU
 rXTBt/ChGhsl6vAhJJASdRwQwK0zmTX9YsmKvblCa/Y0h7xD3BPSovfFcl/75PqYbkD7
 gBYSc9aJ+v3Rzov2jFcgMCyVPXAvnQL5E3hd1TQJY93DhmCkgtqATrczQaTw63J/BWNy
 UpTY/JGIya+qIoWXiyPI34jM69Qs0NZVo5Y/v2bge1U6jQZnHztNJNjgbCHjywWIB7PE /A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 3091m390xf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:05:18 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 03852XTl062344;
 Wed, 8 Apr 2020 05:05:17 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 3091mh1kmn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Apr 2020 05:05:17 +0000
Received: from abhmp0012.oracle.com (abhmp0012.oracle.com [141.146.116.18])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 03855GdY007447;
 Wed, 8 Apr 2020 05:05:16 GMT
Received: from monad.ca.oracle.com (/10.156.75.81)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 07 Apr 2020 22:05:16 -0700
From: Ankur Arora <ankur.a.arora@oracle.com>
To: linux-kernel@vger.kernel.org, x86@kernel.org
Subject: [RFC PATCH 12/26] x86/alternatives: Use __get_unlocked_pte() in
 text_poke()
Date: Tue,  7 Apr 2020 22:03:09 -0700
Message-Id: <20200408050323.4237-13-ankur.a.arora@oracle.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200408050323.4237-1-ankur.a.arora@oracle.com>
References: <20200408050323.4237-1-ankur.a.arora@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 suspectscore=0 bulkscore=0
 mlxlogscore=702 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004080037
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9584
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=763
 priorityscore=1501 clxscore=1015 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004080037
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: jgross@suse.com, xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 peterz@infradead.org, hpa@zytor.com, Ankur Arora <ankur.a.arora@oracle.com>,
 virtualization@lists.linux-foundation.org, pbonzini@redhat.com,
 namit@vmware.com, mhiramat@kernel.org, jpoimboe@redhat.com,
 mihai.carabas@oracle.com, bp@alien8.de, vkuznets@redhat.com,
 boris.ostrovsky@oracle.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

text_poke() uses get_locked_pte() to map poking_addr. However, this
introduces a dependency on locking code which precludes using
text_poke() to modify qspinlock primitives.

Accesses to this pte (and poking_addr) are protected by text_mutex
so we can safely switch to __get_unlocked_pte() here. Note that
we do need to be careful that we do not try to modify the poking_addr
from multiple contexts simultaneously (ex. INT3 or NMI context.)

Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
---
 arch/x86/kernel/alternative.c |  9 ++++-----
 include/linux/mm.h            | 16 ++++++++++++++--
 mm/memory.c                   |  9 ++++++---
 3 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/arch/x86/kernel/alternative.c b/arch/x86/kernel/alternative.c
index 8c79a3dc5e72..0344e49a4ade 100644
--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -812,7 +812,6 @@ static void __text_poke(void *addr, const void *opcode, size_t len)
 	temp_mm_state_t prev;
 	unsigned long flags;
 	pte_t pte, *ptep;
-	spinlock_t *ptl;
 	pgprot_t pgprot;
 
 	/*
@@ -846,10 +845,11 @@ static void __text_poke(void *addr, const void *opcode, size_t len)
 	pgprot = __pgprot(pgprot_val(PAGE_KERNEL) & ~_PAGE_GLOBAL);
 
 	/*
-	 * The lock is not really needed, but this allows to avoid open-coding.
+	 * text_poke() might be used to poke spinlock primitives so do this
+	 * unlocked. This does mean that we need to be careful that no other
+	 * context (ex. INT3 handler) is simultaneously writing to this pte.
 	 */
-	ptep = get_locked_pte(poking_mm, poking_addr, &ptl);
-
+	ptep = __get_unlocked_pte(poking_mm, poking_addr);
 	/*
 	 * This must not fail; preallocated in poking_init().
 	 */
@@ -904,7 +904,6 @@ static void __text_poke(void *addr, const void *opcode, size_t len)
 	 */
 	BUG_ON(memcmp(addr, opcode, len));
 
-	pte_unmap_unlock(ptep, ptl);
 	local_irq_restore(flags);
 }
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 7dd5c4ccbf85..d4a652c2e269 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -1895,8 +1895,20 @@ static inline int pte_devmap(pte_t pte)
 
 int vma_wants_writenotify(struct vm_area_struct *vma, pgprot_t vm_page_prot);
 
-extern pte_t *__get_locked_pte(struct mm_struct *mm, unsigned long addr,
-			       spinlock_t **ptl);
+pte_t *__get_pte(struct mm_struct *mm, unsigned long addr, spinlock_t **ptl);
+
+static inline pte_t *__get_unlocked_pte(struct mm_struct *mm,
+					unsigned long addr)
+{
+	return __get_pte(mm, addr, NULL);
+}
+
+static inline pte_t *__get_locked_pte(struct mm_struct *mm,
+				      unsigned long addr, spinlock_t **ptl)
+{
+	return __get_pte(mm, addr, ptl);
+}
+
 static inline pte_t *get_locked_pte(struct mm_struct *mm, unsigned long addr,
 				    spinlock_t **ptl)
 {
diff --git a/mm/memory.c b/mm/memory.c
index 586271f3efc6..7acfe9512084 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1407,8 +1407,8 @@ void zap_vma_ptes(struct vm_area_struct *vma, unsigned long address,
 }
 EXPORT_SYMBOL_GPL(zap_vma_ptes);
 
-pte_t *__get_locked_pte(struct mm_struct *mm, unsigned long addr,
-			spinlock_t **ptl)
+pte_t *__get_pte(struct mm_struct *mm, unsigned long addr,
+		 spinlock_t **ptl)
 {
 	pgd_t *pgd;
 	p4d_t *p4d;
@@ -1427,7 +1427,10 @@ pte_t *__get_locked_pte(struct mm_struct *mm, unsigned long addr,
 		return NULL;
 
 	VM_BUG_ON(pmd_trans_huge(*pmd));
-	return pte_alloc_map_lock(mm, pmd, addr, ptl);
+	if (likely(ptl))
+		return pte_alloc_map_lock(mm, pmd, addr, ptl);
+	else
+		return pte_alloc_map(mm, pmd, addr);
 }
 
 /*
-- 
2.20.1


