Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111B5B41BBB
	for <lists+xen-devel@lfdr.de>; Wed,  3 Sep 2025 12:23:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1108054.1458200 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkeb-0001SP-IR; Wed, 03 Sep 2025 10:23:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1108054.1458200; Wed, 03 Sep 2025 10:23:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utkeb-0001Qw-F0; Wed, 03 Sep 2025 10:23:49 +0000
Received: by outflank-mailman (input) for mailman id 1108054;
 Wed, 03 Sep 2025 10:23:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cO1L=3O=rein-hpcbdc09=jahan@srs-se1.protection.inumbo.net>)
 id 1utkeZ-0001Ah-Km
 for xen-devel@lists.xenproject.org; Wed, 03 Sep 2025 10:23:47 +0000
Received: from rein-hpcbdc09 (unknown [1.6.89.6])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 120b53b1-88b0-11f0-9809-7dc792cee155;
 Wed, 03 Sep 2025 12:23:45 +0200 (CEST)
Received: by rein-hpcbdc09 (Postfix, from userid 1000)
 id 6175880C06CE; Wed,  3 Sep 2025 15:53:44 +0530 (IST)
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
X-Inumbo-ID: 120b53b1-88b0-11f0-9809-7dc792cee155
From: Jahan Murudi <jahan.murudi.zg@renesas.com>
To: xen-devel@lists.xenproject.org
Cc: Jahan Murudi <jahan.murudi.zg@renesas.com>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 1/4] xentop: add pcpu header and basic infrastructure
Date: Wed,  3 Sep 2025 15:53:20 +0530
Message-Id: <20250903102323.2553142-2-jahan.murudi.zg@renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
References: <20250903102323.2553142-1-jahan.murudi.zg@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a new header (pcpu.h) which defines the interfaces
for physical CPU statistics collection. This provides the
basic infrastructure needed to track per-CPU usage and will
be used in subsequent patches.

Signed-off-by: Jahan Murudi <jahan.murudi.zg@renesas.com>
---
 tools/xentop/pcpu.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 tools/xentop/pcpu.h

diff --git a/tools/xentop/pcpu.h b/tools/xentop/pcpu.h
new file mode 100644
index 0000000000..a528177476
--- /dev/null
+++ b/tools/xentop/pcpu.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2025 Renesas Electronics Corporation
+ */
+
+#ifndef __XENTOP_PCPU_H__
+#define __XENTOP_PCPU_H__
+
+#include <sys/time.h>
+
+int update_pcpu_stats(const struct timeval *now, unsigned int delay);
+int get_pcpu_count(void);
+float get_pcpu_usage(int cpu_index);
+int has_pcpu_data(void);
+void free_pcpu_stats(void);
+
+#endif /* __XENTOP_PCPU_H__ */
-- 
2.34.1


