Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 070037504D6
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 12:37:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562282.878939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXDs-00054k-3S; Wed, 12 Jul 2023 10:37:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562282.878939; Wed, 12 Jul 2023 10:37:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJXDr-00050E-VF; Wed, 12 Jul 2023 10:37:27 +0000
Received: by outflank-mailman (input) for mailman id 562282;
 Wed, 12 Jul 2023 10:37:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M0TT=C6=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qJXAW-00061z-SE
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 10:34:00 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9c701b74-209f-11ee-8611-37d641c3527e;
 Wed, 12 Jul 2023 12:33:59 +0200 (CEST)
Received: from beta.bugseng.com (unknown [37.161.151.90])
 by support.bugseng.com (Postfix) with ESMTPSA id 4138E4EE0C8D;
 Wed, 12 Jul 2023 12:33:58 +0200 (CEST)
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
X-Inumbo-ID: 9c701b74-209f-11ee-8611-37d641c3527e
From: Simone Ballarin <simone.ballarin@bugseng.com>
To: xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com,
	Gianluca Luparini <gianluca.luparini@bugseng.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Simone Ballarin <simone.ballarin@bugseng.com>
Subject: [XEN PATCH v3 11/15] xen/vpci: fix violations of MISRA C:2012 Rule 7.2
Date: Wed, 12 Jul 2023 12:32:12 +0200
Message-Id: <83741ce06872850e1e3126c1cab056ebc12b97ea.1689152719.git.gianluca.luparini@bugseng.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689152719.git.gianluca.luparini@bugseng.com>
References: <cover.1689152719.git.gianluca.luparini@bugseng.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gianluca Luparini <gianluca.luparini@bugseng.com>

The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
headline states:
"A 'u' or 'U' suffix shall be applied to all integer constants
that are represented in an unsigned type".

Add the 'U' suffix to integers literals with unsigned type and also to other
literals used in the same contexts or near violations, when their positive
nature is immediately clear. The latter changes are done for the sake of
uniformity.

Signed-off-by: Gianluca Luparini <gianluca.luparini@bugseng.com>
Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in v3:
- change 'Signed-off-by' ordering
- add 'uint32_t' casts in 'msi.c' and 'msix.c'

Changes in v2:
- minor change to commit title
- change commit message
---
 xen/drivers/vpci/msi.c  | 2 +-
 xen/drivers/vpci/msix.c | 2 +-
 xen/drivers/vpci/vpci.c | 6 +++---
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
index 8f2b59e61a..bf5fe2f981 100644
--- a/xen/drivers/vpci/msi.c
+++ b/xen/drivers/vpci/msi.c
@@ -124,7 +124,7 @@ static void cf_check address_hi_write(
     struct vpci_msi *msi = data;
 
     /* Clear and update high part. */
-    msi->address &= 0xffffffff;
+    msi->address  = (uint32_t)msi->address;
     msi->address |= (uint64_t)val << 32;
 
     update_msi(pdev, msi);
diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index 25bde77586..2090168f42 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -531,7 +531,7 @@ static int cf_check msix_write(
 
     case PCI_MSIX_ENTRY_UPPER_ADDR_OFFSET:
         entry->updated = true;
-        entry->addr &= 0xffffffff;
+        entry->addr  = (uint32_t)entry->addr;
         entry->addr |= (uint64_t)data << 32;
         break;
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index d73fa76302..3bec9a4153 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -319,7 +319,7 @@ static void vpci_write_hw(pci_sbdf_t sbdf, unsigned int reg, unsigned int size,
 static uint32_t merge_result(uint32_t data, uint32_t new, unsigned int size,
                              unsigned int offset)
 {
-    uint32_t mask = 0xffffffff >> (32 - 8 * size);
+    uint32_t mask = 0xffffffffU >> (32 - 8 * size);
 
     return (data & ~(mask << (offset * 8))) | ((new & mask) << (offset * 8));
 }
@@ -402,7 +402,7 @@ uint32_t vpci_read(pci_sbdf_t sbdf, unsigned int reg, unsigned int size)
         data = merge_result(data, tmp_data, size - data_offset, data_offset);
     }
 
-    return data & (0xffffffff >> (32 - 8 * size));
+    return data & (0xffffffffU >> (32 - 8 * size));
 }
 
 /*
@@ -427,7 +427,7 @@ static void vpci_write_helper(const struct pci_dev *pdev,
         data = merge_result(val, data, size, offset);
     }
 
-    r->write(pdev, r->offset, data & (0xffffffff >> (32 - 8 * r->size)),
+    r->write(pdev, r->offset, data & (0xffffffffU >> (32 - 8 * r->size)),
              r->private);
 }
 
-- 
2.41.0


