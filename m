Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 939D1449FF2
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 01:48:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223659.386450 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkFJC-0002aW-0C; Tue, 09 Nov 2021 00:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223659.386450; Tue, 09 Nov 2021 00:48:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkFJB-0002YZ-S9; Tue, 09 Nov 2021 00:48:17 +0000
Received: by outflank-mailman (input) for mailman id 223659;
 Tue, 09 Nov 2021 00:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=i2Q5=P4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1mkFJB-0002YT-3x
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 00:48:17 +0000
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7cc76d4-40f6-11ec-9787-a32c541c8605;
 Tue, 09 Nov 2021 01:48:15 +0100 (CET)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A7E761167;
 Tue,  9 Nov 2021 00:48:12 +0000 (UTC)
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
X-Inumbo-ID: b7cc76d4-40f6-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1636418892;
	bh=TrtiRf/jbn1eppoSVzKa2iW99vW6lQ7QCO5L2IMDUHE=;
	h=From:To:Cc:Subject:Date:From;
	b=Q8alWq82akG41dbfi0CUWKW5S8CjKptuR0IVdlWZlCaZZBba2Y16Clsq3vx3CanTx
	 OKvElavpF+tDG6dekANq/Hy8OGb6O/e8MXbdYfrwLfS4UTH/HISl9+R7vi4H6tz0cx
	 DaoHgI6hV89U+EYH+LIQnuFBV1XlvH7J9TuFYNVyKKflKYa17SP8pYhFFaRFFbhRLw
	 FUOp5UuhInjEkzAL86KrPQ9y/AJWfqt5OeWzlhOhl2lsquzs18bYjEdaHDZJzZrK5s
	 UFOXKF2Bb8/0muoCHwqXdjJt941MJzpFNXZdfnFWkzaOug/RArcl6CkqNpyjdvN2Tx
	 ojo+eICCCbQFA==
From: Stefano Stabellini <sstabellini@kernel.org>
To: julien@xen.org
Cc: Penny.Zheng@arm.com,
	Bertrand.Marquis@arm.com,
	Wei.Chen@arm.com,
	sstabellini@kernel.org,
	iwj@xenproject.org,
	Volodymyr_Babchuk@epam.com,
	xen-devel@lists.xenproject.org,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH for-4.16] xen/arm: don't assign domU static-mem to dom0 as reserved-memory
Date: Mon,  8 Nov 2021 16:48:08 -0800
Message-Id: <20211109004808.115906-1-sstabellini@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

DomUs static-mem ranges are added to the reserved_mem array for
accounting, but they shouldn't be assigned to dom0 as the other regular
reserved-memory ranges in device tree.

In make_memory_nodes, fix the error by skipping banks with xen_domain
set to true in the reserved-memory array. Also make sure to use the
first valid (!xen_domain) start address for the memory node name.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---

This patch should be considered for 4.16 as it fixes an incorrect
behavior.

The risk is low for two reasons:
- the change is simple
- make_memory_node is easily tested because it gets called at every
  boot, e.g. gitlab-ci and OSSTest exercise this path

I tested this patch successfully with and without xen,static-mem.

---
 xen/arch/arm/domain_build.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 1fbafeaea8..56d3ff9d08 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -874,11 +874,17 @@ static int __init make_memory_node(const struct domain *d,
     if ( mem->nr_banks == 0 )
         return -ENOENT;
 
+    for ( i = 0; i < mem->nr_banks && mem->bank[i].xen_domain; i++ )
+        ;
+    /* No reserved-memory ranges to expose to Dom0 */
+    if ( i == mem->nr_banks )
+        return 0;
+
     dt_dprintk("Create memory node (reg size %d, nr cells %d)\n",
                reg_size, nr_cells);
 
     /* ePAPR 3.4 */
-    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[0].start);
+    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
     res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
@@ -888,11 +894,14 @@ static int __init make_memory_node(const struct domain *d,
         return res;
 
     cells = &reg[0];
-    for ( i = 0 ; i < mem->nr_banks; i++ )
+    for ( ; i < mem->nr_banks; i++ )
     {
         u64 start = mem->bank[i].start;
         u64 size = mem->bank[i].size;
 
+        if ( mem->bank[i].xen_domain )
+            continue;
+
         dt_dprintk("  Bank %d: %#"PRIx64"->%#"PRIx64"\n",
                    i, start, start + size);
 
-- 
2.25.1


