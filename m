Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2A47141F2
	for <lists+xen-devel@lfdr.de>; Mon, 29 May 2023 04:20:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.540436.842202 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3SUB-0006ah-Tc; Mon, 29 May 2023 02:19:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 540436.842202; Mon, 29 May 2023 02:19:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q3SUB-0006Yi-Pz; Mon, 29 May 2023 02:19:51 +0000
Received: by outflank-mailman (input) for mailman id 540436;
 Mon, 29 May 2023 02:19:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x08u=BS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1q3SUA-0006GL-9U
 for xen-devel@lists.xenproject.org; Mon, 29 May 2023 02:19:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 490f5575-fdc7-11ed-8611-37d641c3527e;
 Mon, 29 May 2023 04:19:48 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 40520C14;
 Sun, 28 May 2023 19:20:33 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9BFF03F64C;
 Sun, 28 May 2023 19:19:45 -0700 (PDT)
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
X-Inumbo-ID: 490f5575-fdc7-11ed-8611-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v5 04/17] xen/arm: use arch_get_ram_range to get memory ranges from bootinfo
Date: Mon, 29 May 2023 10:19:08 +0800
Message-Id: <20230529021921.2606623-5-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230529021921.2606623-1-Henry.Wang@arm.com>
References: <20230529021921.2606623-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Implement the same helper "arch_get_ram_range" as x86 for NUMA
code to get memory bank from Arm bootinfo.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v4 -> v5:
1. No change.
v3 -> v4:
1. No change.
v2 -> v3:
1. No change.
v1 -> v2:
1. Use arch_get_ram_range instead of arch_get_memory_map.
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


