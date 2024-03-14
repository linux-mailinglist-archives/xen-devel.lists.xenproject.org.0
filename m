Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F84987C509
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:16:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693514.1081711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMx-0000wH-Mz; Thu, 14 Mar 2024 22:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693514.1081711; Thu, 14 Mar 2024 22:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMx-0000tu-Je; Thu, 14 Mar 2024 22:16:11 +0000
Received: by outflank-mailman (input) for mailman id 693514;
 Thu, 14 Mar 2024 22:16:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y43E=KU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rktMv-0000X2-NA
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:16:09 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe7b67b-e250-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 23:16:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 88409828543D;
 Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id In-F3fzw0PDH; Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 24B9F8286CAE;
 Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id 6m4HiXoewgMk; Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id C418182869D5;
 Thu, 14 Mar 2024 17:15:58 -0500 (CDT)
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
X-Inumbo-ID: 6fe7b67b-e250-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 24B9F8286CAE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710454559; bh=XvBjwwSLExGOWxlieVRFHyENhmyN7ighTk2ZoHF8cvc=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=kzYlWCFu8fsxDTKu4dg75848JNYpHBKKuXv1BDVBx0LGLdqcqWDBYB1gzTRaT9kbQ
	 xMy88qpLIRHHxLYrXEzTv7r6sEmtfIAvNeU3XdXv3krFY5J3q/2wSzrT7uMJ9geHKq
	 6l4U2CvGyXA3Ext0MzkTDP6tq3DnYpXXBKd9G7G4=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: [PATCH v3 3/9] xen/ppc: Introduce stub asm/static-shmem.h
Date: Thu, 14 Mar 2024 17:15:41 -0500
Message-Id: <0cf8286269a1c5cdc63e2c19d832a4923cd14f39.1710443965.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1710443965.git.sanastasio@raptorengineering.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Required for bootfdt.c to build.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/include/asm/static-shmem.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 xen/arch/ppc/include/asm/static-shmem.h

diff --git a/xen/arch/ppc/include/asm/static-shmem.h b/xen/arch/ppc/include/asm/static-shmem.h
new file mode 100644
index 0000000000..84370d6e6c
--- /dev/null
+++ b/xen/arch/ppc/include/asm/static-shmem.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier:  GPL-2.0-only */
+
+#ifndef __ASM_PPC_STATIC_SHMEM_H__
+#define __ASM_PPC_STATIC_SHMEM_H__
+
+static inline int process_shm_node(const void *fdt, int node,
+                                   uint32_t address_cells, uint32_t size_cells)
+{
+    return -EINVAL;
+}
+
+#endif /* __ASM_PPC_STATIC_SHMEM_H__ */
-- 
2.30.2


