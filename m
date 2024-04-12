Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F808A248D
	for <lists+xen-devel@lfdr.de>; Fri, 12 Apr 2024 05:56:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.704315.1100647 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv80n-0003ex-UI; Fri, 12 Apr 2024 03:55:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 704315.1100647; Fri, 12 Apr 2024 03:55:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rv80n-0003cZ-Pr; Fri, 12 Apr 2024 03:55:37 +0000
Received: by outflank-mailman (input) for mailman id 704315;
 Fri, 12 Apr 2024 03:55:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cvpr=LR=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rv80m-0003cM-3I
 for xen-devel@lists.xenproject.org; Fri, 12 Apr 2024 03:55:36 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 83b9b8eb-f880-11ee-b908-491648fe20b8;
 Fri, 12 Apr 2024 05:55:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 05FD68285611;
 Thu, 11 Apr 2024 22:55:34 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id hVfuiZoSChIF; Thu, 11 Apr 2024 22:55:33 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C3BC48286D98;
 Thu, 11 Apr 2024 22:55:32 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AXGpxrF1BjZr; Thu, 11 Apr 2024 22:55:32 -0500 (CDT)
Received: from raptor-ewks-026.2lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 653B7828560C;
 Thu, 11 Apr 2024 22:55:32 -0500 (CDT)
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
X-Inumbo-ID: 83b9b8eb-f880-11ee-b908-491648fe20b8
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C3BC48286D98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1712894132; bh=h6QhePaFuDvespR2wWM7QXtyi8l5kFrGXTzysLGgKXk=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=pUXKyaB2ltLSDrvQ9QIx0ybpheNbIifDDTbK4RgI8yh10Wio1Fmh6HEShhYWRRlH7
	 uiIF7PT4S/jbeFkiGwooQ/rF5KXKeLuXyrkjuTUTNqMMOL+tx8LU+4JCudUWUK+I3F
	 HqyJsb+pkl3KN4ZZ0uAYS0BXVWD2o4J0mw1nX4Do=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v4 1/6] xen/ppc: Introduce stub asm/static-shmem.h
Date: Thu, 11 Apr 2024 22:55:18 -0500
Message-Id: <feadb431b4c7a13e803c342ed00c60a6415f2ceb.1712893887.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1712893887.git.sanastasio@raptorengineering.com>
References: <cover.1712893887.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Required for bootfdt.c to build.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
Changes in v4: none

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


