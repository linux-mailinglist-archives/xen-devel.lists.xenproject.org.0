Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1250B4CDC25
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:18:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284476.484001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCV6-0007pf-Tr; Fri, 04 Mar 2022 18:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284476.484001; Fri, 04 Mar 2022 18:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCV4-0007Ki-74; Fri, 04 Mar 2022 18:17:58 +0000
Received: by outflank-mailman (input) for mailman id 284476;
 Fri, 04 Mar 2022 17:56:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC2E-0005R5-Lr
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:10 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40c746f5-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:48:09 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC2C-00006k-F1; Fri, 04 Mar 2022 18:48:08 +0100
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
X-Inumbo-ID: 40c746f5-9be3-11ec-8539-5f4723681683
From: Marco Solieri <marco.solieri@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Marco Solieri <marco.solieri@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@unimore.it>,
	Andrea Bastoni <andrea.bastoni@minervasys.tech>,
	Luca Miccio <lucmiccio@gmail.com>
Subject: [PATCH 20/36] xen/common: introduce buddy required reservation
Date: Fri,  4 Mar 2022 18:46:45 +0100
Message-Id: <20220304174701.1453977-21-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

When cache coloring is enabled, a certain amount of memory is reserved
for buddy allocation because current coloring implementation does not
support Xen heap memory. As of this commit, the colored allocator is used
for dom0, domUs, while the buddy manages only Xen memory. The memory
reserved to the buddy is thus lowered to a reasonably small value.
Introduce a new variable that specifies the amount of memory reserved
for the buddy allocator.
The current default value will be enough even when we will add
coloring for Xen in the following patches.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/common/page_alloc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 82f6e8330a..fffa438029 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -230,6 +230,13 @@ static bool __read_mostly scrub_debug;
 #define scrub_debug    false
 #endif
 
+#ifdef CONFIG_COLORING
+/* Minimum size required for buddy allocator to work with colored one */
+unsigned long buddy_required_size __read_mostly = MB(64);
+#else
+unsigned long buddy_required_size __read_mostly = 0;
+#endif
+
 /*
  * Bit width of the DMA heap -- used to override NUMA-node-first.
  * allocation strategy, which can otherwise exhaust low memory.
@@ -678,6 +685,13 @@ static void dump_col_heap(unsigned char key)
 
     printk("Total number of pages: %lu\n", total_avail_col_pages);
 }
+static int __init parse_buddy_required_size(const char *s)
+{
+    buddy_required_size = simple_strtoull(s, &s, 0);
+
+    return *s ? -EINVAL : 0;
+}
+custom_param("buddy_size", parse_buddy_required_size);
 #else /* !CONFIG_COLORING */
 #define init_col_heap_pages(x, y) init_heap_pages(x, y)
 
-- 
2.30.2


