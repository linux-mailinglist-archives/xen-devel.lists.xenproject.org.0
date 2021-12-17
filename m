Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 307C54794F2
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 20:39:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248881.429300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myJ4c-0003xT-Pj; Fri, 17 Dec 2021 19:39:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248881.429300; Fri, 17 Dec 2021 19:39:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1myJ4c-0003uf-M8; Fri, 17 Dec 2021 19:39:22 +0000
Received: by outflank-mailman (input) for mailman id 248881;
 Fri, 17 Dec 2021 19:39:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qR5E=RC=apertussolutions.com=dpsmith@srs-se1.protection.inumbo.net>)
 id 1myIze-0007M8-AB
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 19:34:14 +0000
Received: from sender3-of-o51.zoho.com (sender3-of-o51.zoho.com
 [136.143.184.51]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fb49dad-5f70-11ec-9e60-abaf8a552007;
 Fri, 17 Dec 2021 20:34:13 +0100 (CET)
Received: from sisyou.hme. (static-72-81-132-2.bltmmd.fios.verizon.net
 [72.81.132.2]) by mx.zohomail.com
 with SMTPS id 1639769536692979.2933938584735;
 Fri, 17 Dec 2021 11:32:16 -0800 (PST)
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
X-Inumbo-ID: 4fb49dad-5f70-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; t=1639769538; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=RDK9IwhFyLlcrau1HLkiCLie1koVD68x2sxkYoIienDSzl0T5QeSv85CMMBq0dlzN6O4nyMS9oB8MV9CSuLp0z098cUrbpY/1IQRxdDO0AykeBgcZd5SU5uI6lP7Oc0z7D0fZnmTejPaDCcKm2uOOFnJlxX9lioZC2lmqPlSGV0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1639769538; h=Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=1+rH6E1T2X2GXGjtweKYSNPXNycy0FvEQLaaEz+oWec=; 
	b=mS9lXSLSCN/7pBwxZs/wY+XHHQu1yfNx0xtU0jHjNWk9rx3HwqE6427IFEkhW4xa15wh2hYuh5I1dwzolT4gawqSF+J4j1v5yB79V0mgezkrTtkakD2/t2goTRUEv0CzqXOkVFi93UptEHs48PurzO1dqBjdTnvSPYTkqyPlmxg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=apertussolutions.com;
	spf=pass  smtp.mailfrom=dpsmith@apertussolutions.com;
	dmarc=pass header.from=<dpsmith@apertussolutions.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1639769538;
	s=zoho; d=apertussolutions.com; i=dpsmith@apertussolutions.com;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=1+rH6E1T2X2GXGjtweKYSNPXNycy0FvEQLaaEz+oWec=;
	b=D5L0hz30hKsnOfgdwYKqhAawyQ1rRzL4ODgjTMERvyW/9hGTNCrlmuJmNcI6xiYY
	rzo05LpNV3f66ZRmIfYW/FjYCAtZAFfWIm0N3AIGQQRY4QSsnuA7FQwZ6KAMCm/mGLQ
	HtW0Bln9Ut7a1TVDGIaRp4UiKZVIu4hCpEyEv4TM=
From: "Daniel P. Smith" <dpsmith@apertussolutions.com>
To: xen-devel@lists.xenproject.org
Cc: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Christopher Clark <christopher.clark@starlab.io>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [RFC 09/10] hyperlaunch: add domain creation logic
Date: Fri, 17 Dec 2021 18:34:35 -0500
Message-Id: <20211217233437.13791-10-dpsmith@apertussolutions.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211217233437.13791-1-dpsmith@apertussolutions.com>
References: <20211217233437.13791-1-dpsmith@apertussolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

This commit introduces the skeleton of hyperlaunch domain construction
mechanics and adds the preliminary ability to construct dom0.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Christopher Clark <christopher.clark@starlab.io>
---
 xen/common/setup.c      | 77 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/setup.h | 16 +++++++++
 2 files changed, 93 insertions(+)

diff --git a/xen/common/setup.c b/xen/common/setup.c
index af2b1a422d..cd24f60297 100644
--- a/xen/common/setup.c
+++ b/xen/common/setup.c
@@ -1,3 +1,4 @@
+#include <asm/bzimage.h> /* for bzimage_headroom */
 #include <xen/pci.h> /* needed by device_tree.h */
 #include <xen/device_tree.h>
 #include <xen/init.h>
@@ -368,6 +369,82 @@ bool __init hyperlaunch_mb_init(module_t *mods)
 
     return ret;
 }
+
+void __init hyperlaunch_mb_headroom(void)
+{
+    int i,j;
+
+    for( i = 0; i < hl_config.nr_doms; i++ )
+    {
+        for ( j = 0; j < hl_config.domains[i].nr_mods; j++ )
+        {
+            if ( hl_config.domains[i].modules[j].kind == BOOTMOD_KERNEL )
+            {
+                module_t *kern =
+                    (module_t *)_p(hl_config.domains[i].modules[j].start);
+
+                kern->headroom = bzimage_headroom(bootstrap_map(kern),
+                                                  kern->mod_end);
+                bootstrap_map(NULL);
+            }
+        }
+    }
+}
 #endif
 
+uint32_t __init hyperlaunch_create_domains(
+    struct domain **hwdom, const char *kextra, const char *loader)
+{
+    uint32_t dom_count = 0, functions_used = 0;
+    int i;
+
+    *hwdom = NULL;
+
+    for ( i = 0; i < hl_config.nr_doms; i++ )
+    {
+        struct bootdomain *d = &(hl_config.domains[i]);
+
+        /* build a legacy dom0 and set it as the hwdom */
+        if ( (d->functions & HL_FUNCTION_LEGACY_DOM0) &&
+             !(functions_used & HL_FUNCTION_LEGACY_DOM0) )
+        {
+            module_t *image = NULL, *initrd = NULL;
+            int j;
+
+            for ( j = 0; j < d->nr_mods; j++ )
+            {
+                if ( d->modules[j].kind == BOOTMOD_KERNEL )
+                    image = (module_t *)_p(d->modules[j].start);
+
+                if ( d->modules[j].kind == BOOTMOD_RAMDISK )
+                    initrd = (module_t *)_p(d->modules[j].start);
+
+                if ( image && initrd )
+                    break;
+            }
+
+            if ( image == NULL )
+                return 0;
+
+#ifdef CONFIG_MULTIBOOT
+            *hwdom = create_dom0(image, image->headroom, initrd, kextra,
+                                 loader);
+#endif
+            if ( *hwdom )
+            {
+                functions_used |= HL_FUNCTION_LEGACY_DOM0;
+                dom_count++;
+            }
+            else
+                panic("HYPERLAUNCH: "
+                      "Dom0 config present but dom0 construction failed\n");
+        }
+        else
+            printk(XENLOG_WARNING "hyperlaunch: "
+                   "currently only supports classic dom0 construction");
+    }
+
+    return dom_count;
+}
+
 #endif
diff --git a/xen/include/xen/setup.h b/xen/include/xen/setup.h
index fd4c23c08f..3833867470 100644
--- a/xen/include/xen/setup.h
+++ b/xen/include/xen/setup.h
@@ -93,8 +93,12 @@ int __init hyperlaunch_init(const void *fdt);
 
 #ifdef CONFIG_MULTIBOOT
 bool __init hyperlaunch_mb_init(module_t *mods);
+void __init hyperlaunch_mb_headroom(void);
 #endif
 
+uint32_t __init hyperlaunch_create_domains(
+    struct domain **hwdom, const char *kextra, const char *loader);
+
 #else /* CONFIG_HYPERLAUNCH */
 
 #define hyperlaunch_enabled false
@@ -109,7 +113,19 @@ static inline bool __init hyperlaunch_mb_init(module_t *mods)
 {
     return false;
 }
+
+void __init hyperlaunch_mb_headroom(void)
+{
+    return;
+}
 #endif
 
+static inline uint32_t __init hyperlaunch_create_domains(
+    struct domain **hwdom, const char *kextra, const char *loader)
+{
+    return 0;
+}
+
 #endif /* CONFIG_HYPERLAUNCH */
+
 #endif /* XEN_SETUP_H */
-- 
2.20.1


