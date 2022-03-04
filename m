Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E85D4CDC0D
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284428.483782 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUH-0005A2-DO; Fri, 04 Mar 2022 18:17:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284428.483782; Fri, 04 Mar 2022 18:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUF-0004kL-FV; Fri, 04 Mar 2022 18:17:07 +0000
Received: by outflank-mailman (input) for mailman id 284428;
 Fri, 04 Mar 2022 17:48:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC29-0005R4-OD
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:05 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3e5b054b-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:05 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC28-0008UZ-AX; Fri, 04 Mar 2022 18:48:04 +0100
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
X-Inumbo-ID: 3e5b054b-9be3-11ec-8eba-a37418f5ba1a
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
Subject: [PATCH 15/36] tools: add support for cache coloring configuration
Date: Fri,  4 Mar 2022 18:46:40 +0100
Message-Id: <20220304174701.1453977-16-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Add a new "colors" parameter that defines the color assignment for a
domain. The user can specify one or more color ranges using the same
syntax as the command line color selection (e.g. 0-4).
The parameter is defined as a list of strings that represent the
color ranges.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
---
 tools/libs/light/libxl_arm.c     | 11 ++++++
 tools/libs/light/libxl_types.idl |  1 +
 tools/xl/xl_parse.c              | 59 ++++++++++++++++++++++++++++++--
 3 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
index eef1de0939..8944b250d9 100644
--- a/tools/libs/light/libxl_arm.c
+++ b/tools/libs/light/libxl_arm.c
@@ -101,6 +101,17 @@ int libxl__arch_domain_prepare_config(libxl__gc *gc,
         return ERROR_FAIL;
     }
 
+    config->arch.colors.max_colors = d_config->b_info.num_colors;
+    for (i = 0; i < sizeof(config->arch.colors.colors) / 4; i++)
+        config->arch.colors.colors[i] = 0;
+    for (i = 0; i < d_config->b_info.num_colors; i++) {
+        unsigned int j = d_config->b_info.colors[i] / 32;
+        if (j > sizeof(config->arch.colors.colors) / 4)
+            return ERROR_FAIL;
+        config->arch.colors.colors[j] |= (1 << (d_config->b_info.colors[i] % 32));
+    }
+    LOG(DEBUG, "Setup domain colors");
+
     return 0;
 }
 
diff --git a/tools/libs/light/libxl_types.idl b/tools/libs/light/libxl_types.idl
index 2a42da2f7d..2a39012369 100644
--- a/tools/libs/light/libxl_types.idl
+++ b/tools/libs/light/libxl_types.idl
@@ -545,6 +545,7 @@ libxl_domain_build_info = Struct("domain_build_info",[
     ("ioports",          Array(libxl_ioport_range, "num_ioports")),
     ("irqs",             Array(uint32, "num_irqs")),
     ("iomem",            Array(libxl_iomem_range, "num_iomem")),
+    ("colors",           Array(uint32, "num_colors")),
     ("claim_mode",	     libxl_defbool),
     ("event_channels",   uint32),
     ("kernel",           string),
diff --git a/tools/xl/xl_parse.c b/tools/xl/xl_parse.c
index 117fcdcb2b..9b6ab1c2e4 100644
--- a/tools/xl/xl_parse.c
+++ b/tools/xl/xl_parse.c
@@ -1216,8 +1216,9 @@ void parse_config_data(const char *config_source,
     XLU_ConfigList *cpus, *vbds, *nics, *pcis, *cvfbs, *cpuids, *vtpms,
                    *usbctrls, *usbdevs, *p9devs, *vdispls, *pvcallsifs_devs;
     XLU_ConfigList *channels, *ioports, *irqs, *iomem, *viridian, *dtdevs,
-                   *mca_caps;
-    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps;
+                   *mca_caps, *colors;
+    int num_ioports, num_irqs, num_iomem, num_cpus, num_viridian, num_mca_caps,
+                    num_colors;
     int pci_power_mgmt = 0;
     int pci_msitranslate = 0;
     int pci_permissive = 0;
@@ -1366,6 +1367,60 @@ void parse_config_data(const char *config_source,
     if (!xlu_cfg_get_long (config, "maxmem", &l, 0))
         b_info->max_memkb = l * 1024;
 
+    if (!xlu_cfg_get_list(config, "colors", &colors, &num_colors, 0)) {
+        int ret, k, p, cur_index;
+
+        b_info->num_colors = 0;
+        /* Get number of colors based on ranges */
+        for (i = 0; i < num_colors; i++) {
+            uint32_t start, end;
+
+            buf = xlu_cfg_get_listitem (colors, i);
+            if (!buf) {
+                fprintf(stderr,
+                    "xl: Unable to get element %d in colors range list\n", i);
+                exit(1);
+            }
+
+            ret = sscanf(buf, "%u-%u", &start, &end);
+            if (ret < 2) {
+                fprintf(stderr,
+                    "xl: Invalid argument parsing colors range: %s\n", buf);
+                exit(1);
+            }
+
+            if (start > end) {
+                fprintf(stderr,
+                    "xl: invalid range: S:%u > E:%u \n", start,end);
+                exit(1);
+            }
+
+            /*
+             * Alloc a first array and then increase its size with realloc based
+             * on the number of ranges
+             */
+
+            /* Check for overlaps */
+            for (k = start; k <= end; k++) {
+                 for (p = 0; p < b_info->num_colors; p++)
+                    if(b_info->colors[p] == k) {
+                        fprintf(stderr,
+                            "xl: overlapped ranges not allowed\n");
+                        exit(1);
+                    }
+            }
+
+            cur_index = b_info->num_colors;
+            b_info->num_colors += (end - start) + 1;
+            b_info->colors = (uint32_t *)realloc(b_info->colors,
+                             sizeof(*b_info->colors) * b_info->num_colors);
+
+            for (k = start; cur_index < b_info->num_colors;
+                cur_index++, k++)
+                b_info->colors[cur_index] = k;
+        }
+    }
+
     if (!xlu_cfg_get_long (config, "vcpus", &l, 0)) {
         vcpus = l;
         if (libxl_cpu_bitmap_alloc(ctx, &b_info->avail_vcpus, l)) {
-- 
2.30.2


