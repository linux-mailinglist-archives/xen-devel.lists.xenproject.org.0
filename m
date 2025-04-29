Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 424BDAA0373
	for <lists+xen-devel@lfdr.de>; Tue, 29 Apr 2025 08:33:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.971404.1359868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eX9-0007aL-Id; Tue, 29 Apr 2025 06:33:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 971404.1359868; Tue, 29 Apr 2025 06:33:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u9eX9-0007Tn-DC; Tue, 29 Apr 2025 06:33:35 +0000
Received: by outflank-mailman (input) for mailman id 971404;
 Tue, 29 Apr 2025 04:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGTB=XP=kernel.org=devnull+chenlinxuan.uniontech.com@srs-se1.protection.inumbo.net>)
 id 1u9cEo-0003mv-BC
 for xen-devel@lists.xenproject.org; Tue, 29 Apr 2025 04:06:30 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d076249-24af-11f0-9ffb-bf95429c2676;
 Tue, 29 Apr 2025 06:06:18 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 77AD9A4BA30;
 Tue, 29 Apr 2025 04:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF675C4CEEE;
 Tue, 29 Apr 2025 04:06:16 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id AC846C369D1;
 Tue, 29 Apr 2025 04:06:16 +0000 (UTC)
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
X-Inumbo-ID: 4d076249-24af-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745899576;
	bh=94UzipiV219n1Nsds3GgUffrYhVWmSEuqNwCotvgHTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=umnHgPjx/uswvCkSmQAtfNXwh0J1RgCPXPtU15EJ3BJrGMr9TeAkv+02Hx8/aJrZP
	 B9pids9hDCCRiksaveqMrCaUIPjjT40xeYtCj3KLeve1mYRGk57NEeo0YsYHn7kloJ
	 Wb5lXlJ1ICFfjMDI7QXO7ihYek6tuetYOzZNrzvuaGAxSxtzS6wFaDjCD1KHmLlOpd
	 mGs+bcfHf0EcMQwc5GWPCv3Q+hydECGq09BD3DqCK5uZZKY6iXbfQpCANImiozP2H4
	 ry6PlbZas22d5KF1Q/sW5U8JGsO3qzDZZJpJ9Sos51pOgukjAw6CGW4cOv/pPGGvJh
	 2wpUI2Qi0eYHg==
From: Chen Linxuan via B4 Relay <devnull+chenlinxuan.uniontech.com@kernel.org>
Date: Tue, 29 Apr 2025 12:06:05 +0800
Subject: [PATCH RFC v3 1/8] nvme: add __always_inline for
 nvme_pci_npages_prp
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-noautoinline-v3-1-4c49f28ea5b5@uniontech.com>
References: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
In-Reply-To: <20250429-noautoinline-v3-0-4c49f28ea5b5@uniontech.com>
To: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
 Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, 
 Kevin Tian <kevin.tian@intel.com>, 
 Alex Williamson <alex.williamson@redhat.com>, 
 Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Peter Zijlstra <peterz@infradead.org>, 
 "Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Juergen Gross <jgross@suse.com>, 
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
 linux-integrity@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, Winston Wen <wentao@uniontech.com>, 
 kasan-dev@googlegroups.com, xen-devel@lists.xenproject.org, 
 Chen Linxuan <chenlinxuan@uniontech.com>, 
 Changbin Du <changbin.du@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2975;
 i=chenlinxuan@uniontech.com; h=from:subject:message-id;
 bh=Z0QiTYLHzEeebaywUqCSW16Ny4EMqCsjjX+KS5KBMNU=;
 b=owEBbQKS/ZANAwAKAXYe5hQ5ma6LAcsmYgBoEFAukhIgTV0U3xfinuIjd2L0FB1AExqdCchlv
 A3ri9QFLWiJAjMEAAEKAB0WIQTO1VElAk6xdvy0ZVp2HuYUOZmuiwUCaBBQLgAKCRB2HuYUOZmu
 i9PbD/0bxMLZB/tZ4Ta8gMq1WIv38DYhUP3aWnHRrfHrBmcZmF3pYKgj7U3bQhz1rGgW21/5jLf
 O6iQHC8JkszMXt7z43locXuD3D2XLaMzfIjJ4SYSBJJCUhLDwTO0hXO+SgM8VdRdhmjZUc1WhnK
 MotrwNb7+YScOJV7UKO27QZ4mEX9QtP1og5KDtG4fX2A4elJ/oUz5VyPu1ZVWaZIPGpR6UfQu2W
 3V96onZcmtcYOTu7m+Q4YYn57iocabwdiYGXp9u6+muG1V36fqjgCWLFdJ87b10fBGpqSdLd78K
 Np/ZrE3r79VyFTS10nLQwcH5emDVtRsUooPidOTFB5RbtCiWZVwNXbzPXeUAOlpo1fud6r4VWu6
 qQumY8DgxrRS5yYkJuqNuYsyMje5EqNF0cT9ACHUWaiTx2mc4D4GMZxmlK0Gb/i6H6b5Nn2r2Xj
 wAaoImxclHPRalFdhXU+KjoIiAQ+6sz9E+8WePUUrBdVGKfCKQPnIoZrmz83bxpZtjB8fQ0tEQM
 iAAaovwAWgBfxfbUHIa8VeSzTs5I5aHhO+aY/5Sd1k2ttkBswHZJumET7aNiQoPsJoewmJYilGQ
 jL21aH2TLLnbAvvZ8tf8QpXJtxzRSYrmcdb8wsQqvI0rVPoHUhioggOtX3jm+SKC+ApmPIpQr8u
 b//ZkECSNX3jkKQ==
X-Developer-Key: i=chenlinxuan@uniontech.com; a=openpgp;
 fpr=D818ACDD385CAE92D4BAC01A6269794D24791D21
X-Endpoint-Received: by B4 Relay for chenlinxuan@uniontech.com/default with
 auth_id=380
X-Original-From: Chen Linxuan <chenlinxuan@uniontech.com>
Reply-To: chenlinxuan@uniontech.com

From: Winston Wen <wentao@uniontech.com>

On x86_64 with gcc version 13.3.0, I build drivers/nvme/host/pci.c
with:

  make defconfig
  ./scripts/kconfig/merge_config.sh .config <(
    echo CONFIG_BLK_DEV_NVME=m
  )
  make KCFLAGS="-fno-inline-small-functions -fno-inline-functions-called-once" \
    drivers/nvme/host/pci.o

Then I get a compile error:

    CALL    scripts/checksyscalls.sh
    DESCEND objtool
    INSTALL libsubcmd_headers
    CC      drivers/nvme/host/pci.o
  In file included from <command-line>:
  drivers/nvme/host/pci.c: In function 'nvme_init':
  ././include/linux/compiler_types.h:557:45: error: call to '__compiletime_assert_878' declared with attribute error: BUILD_BUG_ON failed: nvme_pci_npages_prp() > NVME_MAX_NR_ALLOCATIONS
    557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |                                             ^
  ././include/linux/compiler_types.h:538:25: note: in definition of macro '__compiletime_assert'
    538 |                         prefix ## suffix();                             \
        |                         ^~~~~~
  ././include/linux/compiler_types.h:557:9: note: in expansion of macro '_compiletime_assert'
    557 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
        |         ^~~~~~~~~~~~~~~~~~~
  ./include/linux/build_bug.h:39:37: note: in expansion of macro 'compiletime_assert'
     39 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
        |                                     ^~~~~~~~~~~~~~~~~~
  ./include/linux/build_bug.h:50:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     50 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
        |         ^~~~~~~~~~~~~~~~
  drivers/nvme/host/pci.c:3804:9: note: in expansion of macro 'BUILD_BUG_ON'
   3804 |         BUILD_BUG_ON(nvme_pci_npages_prp() > NVME_MAX_NR_ALLOCATIONS);
        |         ^~~~~~~~~~~~

Mark nvme_pci_npages_prp() with __always_inline make it can be computed
at compile time.

Co-developed-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Chen Linxuan <chenlinxuan@uniontech.com>
Signed-off-by: Winston Wen <wentao@uniontech.com>
---
 drivers/nvme/host/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/pci.c b/drivers/nvme/host/pci.c
index b178d52eac1b7f7286e217226b9b3686d07b7b6c..9ab070a9f0372bc6595c29a884ee9f2ffe5ae8e9 100644
--- a/drivers/nvme/host/pci.c
+++ b/drivers/nvme/host/pci.c
@@ -390,7 +390,7 @@ static bool nvme_dbbuf_update_and_check_event(u16 value, __le32 *dbbuf_db,
  * as it only leads to a small amount of wasted memory for the lifetime of
  * the I/O.
  */
-static int nvme_pci_npages_prp(void)
+static __always_inline int nvme_pci_npages_prp(void)
 {
 	unsigned max_bytes = (NVME_MAX_KB_SZ * 1024) + NVME_CTRL_PAGE_SIZE;
 	unsigned nprps = DIV_ROUND_UP(max_bytes, NVME_CTRL_PAGE_SIZE);

-- 
2.43.0



