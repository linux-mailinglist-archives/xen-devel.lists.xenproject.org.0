Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FDF6EDD73
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 09:59:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525789.817261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDZq-0002Lv-0H; Tue, 25 Apr 2023 07:59:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525789.817261; Tue, 25 Apr 2023 07:59:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prDZp-0002GG-PF; Tue, 25 Apr 2023 07:59:05 +0000
Received: by outflank-mailman (input) for mailman id 525789;
 Tue, 25 Apr 2023 07:59:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1xGP=AQ=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1prDYh-00053E-HI
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 07:57:55 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id e206d91b-e33e-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 09:57:54 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79A8EFEC;
 Tue, 25 Apr 2023 00:58:37 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 272B63F587;
 Tue, 25 Apr 2023 00:57:50 -0700 (PDT)
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
X-Inumbo-ID: e206d91b-e33e-11ed-b223-6b7b168915f2
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v4 13/17] xen/arm: implement numa_node_to_arch_nid for device tree NUMA
Date: Tue, 25 Apr 2023 15:56:51 +0800
Message-Id: <20230425075655.4037980-14-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230425075655.4037980-1-Henry.Wang@arm.com>
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

Device tree based NUMA doesn't have the proximity domain like
ACPI. So we can return node id directly as arch nid.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v3 -> v4:
1. No change.
v2 -> v3:
1. No change.
v1 -> v2:
1. Use numa_node_to_arch_nid instead of dummy node_to_pxm.
---
 xen/arch/arm/include/asm/numa.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 55ac4665db..71b95a9a62 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -47,6 +47,15 @@ extern void numa_detect_cpu_node(unsigned int cpu);
 extern int numa_device_tree_init(const void *fdt);
 extern void numa_init(void);
 
+/*
+ * Device tree NUMA doesn't have architecural node id.
+ * So we can just return node id as arch nid.
+ */
+static inline unsigned int numa_node_to_arch_nid(nodeid_t n)
+{
+    return n;
+}
+
 #else
 
 /* Fake one node for now. See also node_online_map. */
-- 
2.25.1


