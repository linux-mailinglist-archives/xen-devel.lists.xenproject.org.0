Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D1C7F0AAE
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 03:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.636357.991778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRH-0000Io-My; Mon, 20 Nov 2023 02:55:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 636357.991778; Mon, 20 Nov 2023 02:55:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r4uRH-0000FC-IM; Mon, 20 Nov 2023 02:55:07 +0000
Received: by outflank-mailman (input) for mailman id 636357;
 Mon, 20 Nov 2023 02:55:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N0Aw=HB=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r4uRF-0007WE-Rj
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 02:55:05 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 3450e288-8750-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 03:55:04 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA8631042;
 Sun, 19 Nov 2023 18:55:49 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 19D183F6C4;
 Sun, 19 Nov 2023 18:55:00 -0800 (PST)
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
X-Inumbo-ID: 3450e288-8750-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v6 04/17] xen/arm: use arch_get_ram_range to get memory ranges from bootinfo
Date: Mon, 20 Nov 2023 10:54:18 +0800
Message-Id: <20231120025431.14845-5-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231120025431.14845-1-Henry.Wang@arm.com>
References: <20231120025431.14845-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Implement the same helper "arch_get_ram_range" as x86 for NUMA
code to get memory bank from Arm bootinfo.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v2 -> v6:
- Rebase on top of staging without code changes.
v1 -> v2:
- Use arch_get_ram_range instead of arch_get_memory_map.
---
 xen/arch/arm/numa.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 31332a6ea7..e9b2ec93bc 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -99,3 +99,14 @@ unsigned char __node_distance(nodeid_t from, nodeid_t to)
 
     return node_distance_map[from][to];
 }
+
+int __init arch_get_ram_range(unsigned int idx, paddr_t *start, paddr_t *end)
+{
+    if ( idx >= bootinfo.mem.nr_banks )
+        return -ENOENT;
+
+    *start = bootinfo.mem.bank[idx].start;
+    *end = *start + bootinfo.mem.bank[idx].size;
+
+    return 0;
+}
-- 
2.25.1


