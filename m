Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CD9CBE7EF
	for <lists+xen-devel@lfdr.de>; Mon, 15 Dec 2025 16:07:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1187326.1508773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVAAT-0000GC-6n; Mon, 15 Dec 2025 15:07:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1187326.1508773; Mon, 15 Dec 2025 15:07:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vVAAT-0000BG-2S; Mon, 15 Dec 2025 15:07:21 +0000
Received: by outflank-mailman (input) for mailman id 1187326;
 Mon, 15 Dec 2025 15:07:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lpeD=6V=arm.com=kevin.brodsky@srs-se1.protection.inumbo.net>)
 id 1vVA8A-0003s4-30
 for xen-devel@lists.xenproject.org; Mon, 15 Dec 2025 15:04:58 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6b45298b-d9c7-11f0-b15b-2bf370ae4941;
 Mon, 15 Dec 2025 16:04:57 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62D991713;
 Mon, 15 Dec 2025 07:04:49 -0800 (PST)
Received: from e123572-lin.arm.com (e123572-lin.cambridge.arm.com
 [10.1.194.54])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41F803F73B;
 Mon, 15 Dec 2025 07:04:51 -0800 (PST)
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
X-Inumbo-ID: 6b45298b-d9c7-11f0-b15b-2bf370ae4941
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Woodhouse <dwmw2@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jann Horn <jannh@google.com>,
	Juergen Gross <jgross@suse.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Will Deacon <will@kernel.org>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	xen-devel@lists.xenproject.org,
	x86@kernel.org
Subject: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
Date: Mon, 15 Dec 2025 15:03:23 +0000
Message-ID: <20251215150323.2218608-15-kevin.brodsky@arm.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251215150323.2218608-1-kevin.brodsky@arm.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basic KUnit tests for the generic aspects of the lazy MMU mode:
ensure that it appears active when it should, depending on how
enable/disable and pause/resume pairs are nested.

Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 mm/Kconfig                     | 12 ++++++
 mm/Makefile                    |  1 +
 mm/tests/lazy_mmu_mode_kunit.c | 71 ++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 mm/tests/lazy_mmu_mode_kunit.c

diff --git a/mm/Kconfig b/mm/Kconfig
index 62073bd61544..ac48deb44884 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1471,6 +1471,18 @@ config ARCH_HAS_LAZY_MMU_MODE
 	  MMU-related architectural state to be deferred until the mode is
 	  exited. See <linux/pgtable.h> for details.
 
+config LAZY_MMU_MODE_KUNIT_TEST
+	tristate "KUnit tests for the lazy MMU mode" if !KUNIT_ALL_TESTS
+	depends on ARCH_HAS_LAZY_MMU_MODE
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
+	help
+	  Enable this option to check that the lazy MMU mode interface behaves
+	  as expected. Only tests for the generic interface are included (not
+	  architecture-specific behaviours).
+
+	  If unsure, say N.
+
 source "mm/damon/Kconfig"
 
 endmenu
diff --git a/mm/Makefile b/mm/Makefile
index 2d0570a16e5b..9175f8cc6565 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -147,3 +147,4 @@ obj-$(CONFIG_SHRINKER_DEBUG) += shrinker_debug.o
 obj-$(CONFIG_EXECMEM) += execmem.o
 obj-$(CONFIG_TMPFS_QUOTA) += shmem_quota.o
 obj-$(CONFIG_PT_RECLAIM) += pt_reclaim.o
+obj-$(CONFIG_LAZY_MMU_MODE_KUNIT_TEST) += tests/lazy_mmu_mode_kunit.o
diff --git a/mm/tests/lazy_mmu_mode_kunit.c b/mm/tests/lazy_mmu_mode_kunit.c
new file mode 100644
index 000000000000..2720eb995714
--- /dev/null
+++ b/mm/tests/lazy_mmu_mode_kunit.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <kunit/test.h>
+#include <linux/pgtable.h>
+
+static void expect_not_active(struct kunit *test)
+{
+	KUNIT_EXPECT_FALSE(test, is_lazy_mmu_mode_active());
+}
+
+static void expect_active(struct kunit *test)
+{
+	KUNIT_EXPECT_TRUE(test, is_lazy_mmu_mode_active());
+}
+
+static void lazy_mmu_mode_active(struct kunit *test)
+{
+	expect_not_active(test);
+
+	lazy_mmu_mode_enable();
+	expect_active(test);
+
+	{
+		/* Nested section */
+		lazy_mmu_mode_enable();
+		expect_active(test);
+
+		lazy_mmu_mode_disable();
+		expect_active(test);
+	}
+
+	{
+		/* Paused section */
+		lazy_mmu_mode_pause();
+		expect_not_active(test);
+
+		{
+			/* No effect (paused) */
+			lazy_mmu_mode_enable();
+			expect_not_active(test);
+
+			lazy_mmu_mode_disable();
+			expect_not_active(test);
+
+			lazy_mmu_mode_pause();
+			expect_not_active(test);
+
+			lazy_mmu_mode_resume();
+			expect_not_active(test);
+		}
+
+		lazy_mmu_mode_resume();
+		expect_active(test);
+	}
+
+	lazy_mmu_mode_disable();
+	expect_not_active(test);
+}
+
+static struct kunit_case lazy_mmu_mode_test_cases[] = {
+	KUNIT_CASE(lazy_mmu_mode_active),
+	{}
+};
+
+static struct kunit_suite lazy_mmu_mode_test_suite = {
+	.name = "lazy_mmu_mode",
+	.test_cases = lazy_mmu_mode_test_cases,
+};
+kunit_test_suite(lazy_mmu_mode_test_suite);
+
+MODULE_DESCRIPTION("Tests for the lazy MMU mode");
+MODULE_LICENSE("GPL");
-- 
2.51.2


