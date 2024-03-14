Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 356E187C50F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 23:16:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693516.1081737 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktN0-0001d7-1y; Thu, 14 Mar 2024 22:16:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693516.1081737; Thu, 14 Mar 2024 22:16:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rktMz-0001VZ-OO; Thu, 14 Mar 2024 22:16:13 +0000
Received: by outflank-mailman (input) for mailman id 693516;
 Thu, 14 Mar 2024 22:16:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y43E=KU=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1rktMx-0000X2-NM
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 22:16:11 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe46582-e250-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 23:16:00 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 744238285564;
 Thu, 14 Mar 2024 17:15:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id UdD9ZEYWtjvs; Thu, 14 Mar 2024 17:15:58 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C9F65828543D;
 Thu, 14 Mar 2024 17:15:58 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id cyxb2cIHxSnA; Thu, 14 Mar 2024 17:15:58 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 59AF78285564;
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
X-Inumbo-ID: 6fe46582-e250-11ee-a1ee-f123f15fe8a2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com C9F65828543D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1710454558; bh=WG1KE8M9PlKZmebhXqBSnvpa7eeG1otWt/lFqFW0d9Y=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=QdMUGUkCD+q3TmBTdELez63waXReD0+ItPQ79RX5QY1KVhCQIReBKI4zu55IQBuKb
	 JGLOT/a0fn19U8QfHHXqDq5C5aGKq6qBvclRdkyENdNkL1UTPMFoFlixWxvXAh4SM9
	 LFNtDX8ur+NgPeR+KknSxUn2PyfhoKT+41VMBkW8=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 2/9] xen/asm-generic: Introduce generic acpi.h
Date: Thu, 14 Mar 2024 17:15:40 -0500
Message-Id: <794e46b16475c0b4f482cdc8560ebb2f37875715.1710443965.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1710443965.git.sanastasio@raptorengineering.com>
References: <cover.1710443965.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Introduce a generic acpi.h header that provides the required definitions
to allow files including xen/acpi.h to be compiled. The definitions were
largely derived from the !CONFIG_ACPI parts of ARM's acpi.h.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/arch/ppc/include/asm/Makefile |  1 +
 xen/include/asm-generic/acpi.h    | 20 ++++++++++++++++++++
 2 files changed, 21 insertions(+)
 create mode 100644 xen/include/asm-generic/acpi.h

diff --git a/xen/arch/ppc/include/asm/Makefile b/xen/arch/ppc/include/asm/Makefile
index ced02e26ed..a4faa0f2aa 100644
--- a/xen/arch/ppc/include/asm/Makefile
+++ b/xen/arch/ppc/include/asm/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
+generic-y += acpi.h
 generic-y += altp2m.h
 generic-y += device.h
 generic-y += div64.h
diff --git a/xen/include/asm-generic/acpi.h b/xen/include/asm-generic/acpi.h
new file mode 100644
index 0000000000..ae9ed83ba8
--- /dev/null
+++ b/xen/include/asm-generic/acpi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_ACPI_H
+#define __ASM_GENERIC_ACPI_H
+
+#include <asm/page.h>
+#include <xen/types.h>
+
+#ifdef CONFIG_ACPI
+#error "asm-generic acpi.h can't be used with CONFIG_ACPI set"
+#endif
+
+#define COMPILER_DEPENDENT_INT64   int64_t
+#define COMPILER_DEPENDENT_UINT64  uint64_t
+#define ACPI_MAP_MEM_ATTR          PAGE_HYPERVISOR
+
+#define acpi_disabled (true)
+#define disable_acpi()
+#define enable_acpi()
+
+#endif /* __ASM_GENERIC_ACPI_H */
-- 
2.30.2


