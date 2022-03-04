Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9454CDC01
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284411.483690 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU6-0002aa-0Z; Fri, 04 Mar 2022 18:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284411.483690; Fri, 04 Mar 2022 18:16:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCU5-0002TW-JT; Fri, 04 Mar 2022 18:16:57 +0000
Received: by outflank-mailman (input) for mailman id 284411;
 Fri, 04 Mar 2022 17:47:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC23-0005R5-Kk
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:47:59 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 399d2c12-9be3-11ec-8539-5f4723681683;
 Fri, 04 Mar 2022 18:47:57 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC1z-0008PV-Ji; Fri, 04 Mar 2022 18:47:56 +0100
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
X-Inumbo-ID: 399d2c12-9be3-11ec-8539-5f4723681683
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
	Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Subject: [PATCH 04/36] xen/arm: add parsing function for cache coloring configuration
Date: Fri,  4 Mar 2022 18:46:29 +0100
Message-Id: <20220304174701.1453977-5-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add three new bootargs allowing configuration of cache coloring support
for Xen:
- way_size: The size of a LLC way in bytes. This value is mainly used
  to calculate the maximum available colors on the platform.
- dom0_colors: The coloring configuration for Dom0, which also acts as
  default configuration for any DomU without an explicit configuration.
- xen_colors: The coloring configuration for the Xen hypervisor itself.

A cache coloring configuration consists of a selection of colors to be
assigned to a VM or to the hypervisor. It is represented by a set of
ranges. Add a common function that parses a string with a
comma-separated set of hyphen-separated ranges like "0-7,15-16" and
returns both: the number of chosen colors, and an array containing their
ids.
Currently we support platforms with up to 128 colors.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 xen/arch/arm/Kconfig                |   5 ++
 xen/arch/arm/Makefile               |   2 +-
 xen/arch/arm/coloring.c             | 131 ++++++++++++++++++++++++++++
 xen/arch/arm/include/asm/coloring.h |  28 ++++++
 4 files changed, 165 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/coloring.c
 create mode 100644 xen/arch/arm/include/asm/coloring.h

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..f0f999d172 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -97,6 +97,11 @@ config HARDEN_BRANCH_PREDICTOR
 
 	  If unsure, say Y.
 
+config COLORING
+	bool "L2 cache coloring"
+	default n
+	depends on ARM_64
+
 config TEE
 	bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
 	default n
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index c993ce72a3..581896a528 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -66,7 +66,7 @@ obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
 obj-y += vsmc.o
 obj-y += vpsci.o
 obj-y += vuart.o
-
+obj-$(CONFIG_COLORING) += coloring.o
 extra-y += xen.lds
 
 #obj-bin-y += ....o
diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
new file mode 100644
index 0000000000..8f1cff6efb
--- /dev/null
+++ b/xen/arch/arm/coloring.c
@@ -0,0 +1,131 @@
+/*
+ * xen/arch/arm/coloring.c
+ *
+ * Coloring support for ARM
+ *
+ * Copyright (C) 2019 Xilinx Inc.
+ *
+ * Authors:
+ *    Luca Miccio <lucmiccio@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#include <xen/init.h>
+#include <xen/types.h>
+#include <xen/lib.h>
+#include <xen/errno.h>
+#include <xen/param.h>
+#include <asm/coloring.h>
+
+/* Number of color(s) assigned to Xen */
+static uint32_t xen_col_num;
+/* Coloring configuration of Xen as bitmask */
+static uint32_t xen_col_mask[MAX_COLORS_CELLS];
+
+/* Number of color(s) assigned to Dom0 */
+static uint32_t dom0_col_num;
+/* Coloring configuration of Dom0 as bitmask */
+static uint32_t dom0_col_mask[MAX_COLORS_CELLS];
+
+static uint64_t way_size;
+
+/*************************
+ * PARSING COLORING BOOTARGS
+ */
+
+/*
+ * Parse the coloring configuration given in the buf string, following the
+ * syntax below, and store the number of colors and a corresponding mask in
+ * the last two given pointers.
+ *
+ * COLOR_CONFIGURATION ::= RANGE,...,RANGE
+ * RANGE               ::= COLOR-COLOR
+ *
+ * Example: "2-6,15-16" represents the set of colors: 2,3,4,5,6,15,16.
+ */
+static int parse_color_config(
+    const char *buf, uint32_t *col_mask, uint32_t *col_num)
+{
+    int start, end, i;
+    const char* s = buf;
+    unsigned int offset;
+
+    if ( !col_mask || !col_num )
+        return -EINVAL;
+
+    *col_num = 0;
+    for ( i = 0; i < MAX_COLORS_CELLS; i++ )
+        col_mask[i] = 0;
+
+    while ( *s != '\0' )
+    {
+        if ( *s != ',' )
+        {
+            start = simple_strtoul(s, &s, 0);
+
+            /* Ranges are hyphen-separated */
+            if ( *s != '-' )
+                goto fail;
+            s++;
+
+            end = simple_strtoul(s, &s, 0);
+
+            for ( i = start; i <= end; i++ )
+            {
+                offset = i / 32;
+                if ( offset > MAX_COLORS_CELLS )
+                    goto fail;
+
+                if ( !(col_mask[offset] & (1 << i % 32)) )
+                    *col_num += 1;
+                col_mask[offset] |= (1 << i % 32);
+            }
+        }
+        else
+            s++;
+    }
+
+    return *s ? -EINVAL : 0;
+fail:
+    return -EINVAL;
+}
+
+static int __init parse_way_size(const char *s)
+{
+    way_size = simple_strtoull(s, &s, 0);
+
+    return *s ? -EINVAL : 0;
+}
+custom_param("way_size", parse_way_size);
+
+static int __init parse_dom0_colors(const char *s)
+{
+    return parse_color_config(s, dom0_col_mask, &dom0_col_num);
+}
+custom_param("dom0_colors", parse_dom0_colors);
+
+static int __init parse_xen_colors(const char *s)
+{
+    return parse_color_config(s, xen_col_mask, &xen_col_num);
+}
+custom_param("xen_colors", parse_xen_colors);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/include/asm/coloring.h
new file mode 100644
index 0000000000..60958d1244
--- /dev/null
+++ b/xen/arch/arm/include/asm/coloring.h
@@ -0,0 +1,28 @@
+/*
+ * xen/arm/include/asm/coloring.h
+ *
+ * Coloring support for ARM
+ *
+ * Copyright (C) 2019 Xilinx Inc.
+ *
+ * Authors:
+ *    Luca Miccio <lucmiccio@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+#ifndef __ASM_ARM_COLORING_H__
+#define __ASM_ARM_COLORING_H__
+
+#define MAX_COLORS_CELLS 4
+
+#endif /* !__ASM_ARM_COLORING_H__ */
-- 
2.30.2


