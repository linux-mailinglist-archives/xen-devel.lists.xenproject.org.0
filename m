Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB715814042
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 03:52:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654837.1022281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJi-0003sY-Sz; Fri, 15 Dec 2023 02:52:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654837.1022281; Fri, 15 Dec 2023 02:52:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDyJi-0003rI-Ll; Fri, 15 Dec 2023 02:52:46 +0000
Received: by outflank-mailman (input) for mailman id 654837;
 Fri, 15 Dec 2023 02:52:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onWf=H2=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rDyJg-0003SX-Ke
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 02:52:44 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04116fc3-9af5-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 03:52:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id AAB288285463;
 Thu, 14 Dec 2023 20:52:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id SN6EouxCpzyy; Thu, 14 Dec 2023 20:52:41 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 0BDBE8286129;
 Thu, 14 Dec 2023 20:52:41 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id Dw2MKnTmA0Dd; Thu, 14 Dec 2023 20:52:40 -0600 (CST)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id AB05D8285AE9;
 Thu, 14 Dec 2023 20:52:40 -0600 (CST)
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
X-Inumbo-ID: 04116fc3-9af5-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 0BDBE8286129
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1702608761; bh=A+G8Y/mAKwwr+YfqhBvn2P9VeSV+LGNGsCJ+HQ4NXzE=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=RNjC36g1Zwt5bABtXwyRXUrFADTeu2GyXlZh8G/cOfRuohZ7q/6KoC4A4axhjqA9c
	 nT+qGICCqdGia9B4M1B9cLa4sbwvA0oE0irLmwGyCjsp7OAAWpe23CgwflBJNOlF0E
	 sioJsuzlDE3OOeDITyC5UGf/hE76UTpEVVwrwgN0=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v2 1/7] xen/asm-generic: Introduce generic static-shmem.h
Date: Thu, 14 Dec 2023 20:43:56 -0600
Message-Id: <ea548f9c6cefff54dadf83446d4f5c721281f247.1702607884.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1702607884.git.sanastasio@raptorengineering.com>
References: <cover.1702607884.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Introduce static-shmem.h to asm-generic as a prerequisite for moving
ARM's bootfdt.c into xen/common.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/include/asm/Makefile      |  1 +
 xen/include/asm-generic/static-shmem.h | 12 ++++++++++++
 2 files changed, 13 insertions(+)
 create mode 100644 xen/include/asm-generic/static-shmem.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index 2da995bb2f..a711cfa856 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -6,4 +6,5 @@ generic-y += iocap.h
 generic-y += paging.h
 generic-y += percpu.h
 generic-y += random.h
+generic-y += static-shmem.h
 generic-y += vm_event.h
diff --git a/xen/include/asm-generic/static-shmem.h b/xen/include/asm-generic/static-shmem.h
new file mode 100644
index 0000000000..d45c44a419
--- /dev/null
+++ b/xen/include/asm-generic/static-shmem.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier:  GPL-2.0-only */
+
+#ifndef __ASM_GENERIC_STATIC_SHMEM_H__
+#define __ASM_GENERIC_STATIC_SHMEM_H__
+
+static inline int process_shm_node(const void *fdt, int node,
+                                   uint32_t address_cells, uint32_t size_cells)
+{
+    return -EINVAL;
+}
+
+#endif /* __ASM_GENERIC_STATIC_SHMEM_H__ */
-- 
2.30.2


