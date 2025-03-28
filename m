Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAB6A74619
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 10:14:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930367.1333039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mn-0002Na-Ol; Fri, 28 Mar 2025 09:13:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930367.1333039; Fri, 28 Mar 2025 09:13:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty5mn-0002EH-IB; Fri, 28 Mar 2025 09:13:57 +0000
Received: by outflank-mailman (input) for mailman id 930367;
 Fri, 28 Mar 2025 09:13:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HHkx=WP=li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com=agordeev@srs-se1.protection.inumbo.net>)
 id 1ty5mm-0001o1-54
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 09:13:56 +0000
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown
 [2a02:8070:a484:e780::f9cd])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f6e79da4-0bb4-11f0-9ffa-bf95429c2676;
 Fri, 28 Mar 2025 10:13:52 +0100 (CET)
Received: from agordeev by li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com
 with local (Exim 4.98.1)
 (envelope-from <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>)
 id 1ty5mY-00000001t9k-1nrE; Fri, 28 Mar 2025 10:13:42 +0100
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
X-Inumbo-ID: f6e79da4-0bb4-11f0-9ffa-bf95429c2676
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Hugh Dickins <hughd@google.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Juergen Gross <jgross@suse.com>,
	Jeremy Fitzhardinge <jeremy@goop.org>
Subject: [PATCH 2/4] mm: Allow detection of wrong arch_enter_lazy_mmu_mode() context
Date: Fri, 28 Mar 2025 10:13:40 +0100
Message-ID: <07d6b41231658e66a570b21f3ed6fc8cf57ee171.1743079720.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <cover.1743079720.git.agordeev@linux.ibm.com>
References: <cover.1743079720.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Alexander Gordeev <agordeev@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>

The lazy MMU batching may be only be entered and left under the
protection of the page table locks for all page tables which may
be modified. Yet, there were cases arch_enter_lazy_mmu_mode()
was called without the locks taken, e.g. commit b9ef323ea168
("powerpc/64s: Disable preemption in hash lazy mmu mode").

Make default arch_enter|leave|flush_lazy_mmu_mode() callbacks
complain at least in case the preemption is enabled to detect
wrong contexts.

Most platforms do not implement the callbacks, so to aovid a
performance impact allow the complaint when CONFIG_DEBUG_VM
option is enabled only.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 include/linux/pgtable.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 94d267d02372..6669f977e368 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -228,9 +228,18 @@ static inline int pmd_dirty(pmd_t pmd)
  * it must synchronize the delayed page table writes properly on other CPUs.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-#define arch_enter_lazy_mmu_mode()	do {} while (0)
-#define arch_leave_lazy_mmu_mode()	do {} while (0)
-#define arch_flush_lazy_mmu_mode()	do {} while (0)
+static inline void arch_enter_lazy_mmu_mode(void)
+{
+	VM_WARN_ON(preemptible());
+}
+static inline void arch_leave_lazy_mmu_mode(void)
+{
+	VM_WARN_ON(preemptible());
+}
+static inline void arch_flush_lazy_mmu_mode(void)
+{
+	VM_WARN_ON(preemptible());
+}
 #endif
 
 #ifndef pte_batch_hint
-- 
2.45.2


