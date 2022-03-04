Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B794CDC08
	for <lists+xen-devel@lfdr.de>; Fri,  4 Mar 2022 19:17:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.284419.483740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUA-0003tL-Bl; Fri, 04 Mar 2022 18:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 284419.483740; Fri, 04 Mar 2022 18:17:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nQCUA-0003by-1j; Fri, 04 Mar 2022 18:17:02 +0000
Received: by outflank-mailman (input) for mailman id 284419;
 Fri, 04 Mar 2022 17:48:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=WvCO=TP=xt3.it=ms@srs-se1.protection.inumbo.net>)
 id 1nQC27-0005R4-GZ
 for xen-devel@lists.xenproject.org; Fri, 04 Mar 2022 17:48:03 +0000
Received: from radon.xt3.it (radon.xt3.it [2a01:4f8:190:4055::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3ced96da-9be3-11ec-8eba-a37418f5ba1a;
 Fri, 04 Mar 2022 18:48:02 +0100 (CET)
Received: from nb2assolieri.mat.unimo.it ([155.185.4.56] helo=localhost)
 by radon.xt3.it with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <ms@xt3.it>)
 id 1nQC25-0008Sl-Vu; Fri, 04 Mar 2022 18:48:02 +0100
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
X-Inumbo-ID: 3ced96da-9be3-11ec-8eba-a37418f5ba1a
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
Subject: [PATCH 12/36] xen/arm: initialize cache coloring data for Dom0/U
Date: Fri,  4 Mar 2022 18:46:37 +0100
Message-Id: <20220304174701.1453977-13-marco.solieri@minervasys.tech>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Luca Miccio <lucmiccio@gmail.com>

Initialize cache coloring configuration during domain creation. If no
colors assignment is provided by the user, use the default one.
The default configuration is the one assigned to Dom0. The latter is
configured as a standard domain with default configuration.

Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
 xen/arch/arm/domain.c       | 53 +++++++++++++++++++++++++++++++++++++
 xen/arch/arm/domain_build.c |  5 +++-
 2 files changed, 57 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 8110c1df86..33471b3c58 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -38,6 +38,7 @@
 #include <asm/vfp.h>
 #include <asm/vgic.h>
 #include <asm/vtimer.h>
+#include <asm/coloring.h>
 
 #include "vpci.h"
 #include "vuart.h"
@@ -782,6 +783,58 @@ int arch_domain_create(struct domain *d,
     if ( (rc = domain_vpci_init(d)) != 0 )
         goto fail;
 
+    d->max_colors = 0;
+#ifdef CONFIG_COLORING
+    /* Setup domain colors */
+    if ( !config->arch.colors.max_colors )
+    {
+        if ( !is_hardware_domain(d) )
+            printk(XENLOG_INFO "Color configuration not found for dom%u, using default\n",
+                   d->domain_id);
+        d->colors = setup_default_colors(&d->max_colors);
+        if ( !d->colors )
+        {
+            rc = -ENOMEM;
+            printk(XENLOG_ERR "Color array allocation failed for dom%u\n",
+                   d->domain_id);
+            goto fail;
+        }
+    }
+    else
+    {
+        int i, k;
+
+        d->colors = xzalloc_array(uint32_t, config->arch.colors.max_colors);
+        if ( !d->colors )
+        {
+            rc = -ENOMEM;
+            printk(XENLOG_ERR "Failed to alloc colors for dom%u\n",
+                   d->domain_id);
+            goto fail;
+        }
+
+        d->max_colors = config->arch.colors.max_colors;
+        for ( i = 0, k = 0;
+              k < d->max_colors && i < sizeof(config->arch.colors.colors) * 8;
+              i++ )
+        {
+            if ( config->arch.colors.colors[i / 32] & (1 << (i % 32)) )
+                d->colors[k++] = i;
+        }
+    }
+
+    printk("Dom%u colors: [ ", d->domain_id);
+    for ( int i = 0; i < d->max_colors; i++ )
+        printk("%u ", d->colors[i]);
+    printk("]\n");
+
+    if ( !check_domain_colors(d) )
+    {
+        rc = -EINVAL;
+        printk(XENLOG_ERR "Failed to check colors for dom%u\n", d->domain_id);
+        goto fail;
+    }
+#endif
     return 0;
 
 fail:
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 8be01678de..9630d00066 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3344,7 +3344,10 @@ void __init create_dom0(void)
         printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
     dom0_cfg.arch.tee_type = tee_get_type();
     dom0_cfg.max_vcpus = dom0_max_vcpus();
-
+#ifdef CONFIG_COLORING
+    /* Colors are set after domain_create */
+    dom0_cfg.arch.colors.max_colors = 0;
+#endif
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-- 
2.30.2


