Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A05678063
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 16:48:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483026.748937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3V-0000z4-In; Mon, 23 Jan 2023 15:48:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483026.748937; Mon, 23 Jan 2023 15:48:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJz3V-0000wC-DQ; Mon, 23 Jan 2023 15:48:21 +0000
Received: by outflank-mailman (input) for mailman id 483026;
 Mon, 23 Jan 2023 15:48:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kihy=5U=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1pJz3T-00006V-H5
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 15:48:19 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5b4ebd1d-9b35-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 16:48:18 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id az20so31697997ejc.1
 for <xen-devel@lists.xenproject.org>; Mon, 23 Jan 2023 07:48:18 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 r2-20020a17090609c200b007bd28b50305sm22170978eje.200.2023.01.23.07.48.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 07:48:17 -0800 (PST)
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
X-Inumbo-ID: 5b4ebd1d-9b35-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnBfVoJg9BJDdsJ9FVXJ5loGQJGgvjA6ZxNM1ora6pg=;
        b=q0ghmJW9sJbCOkKZCuP6aqaXmTD2uOqfhnRw/qssKHan9iebRjVdoGXERWA6zE28VL
         kyWUFGZrSIbLlW4iSOxfZtBmIMuyDSjrtY78W63SB7OS6GrveHRmZS2AhdpwJUybfNlo
         ShBV2pNaWMC6Vmyg07pJN6WuJ9i8rYGxAhIpVpr5H4shJ4OWrFpMrZAE5pwUfwd7Woyn
         cdcZwWtwpRKacHM2DmMXYONt7zJIEHER5aA/O78dsmDcIwGktYM2JQaOwyYO4YzD1yjZ
         iE+7tXIBY+m0gjoS322LpIcARZ2H2d8fH+ON82+PPg6apuFDuK/9+YYE1ahhBYpnWp6+
         ToOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnBfVoJg9BJDdsJ9FVXJ5loGQJGgvjA6ZxNM1ora6pg=;
        b=zPT9JAP3MIYiT4bliIoWysJG5IZN8noGR9Wk8xAx48vXpCmGBneL3z3+W/XI0Blq4t
         iB3/ELhydpuxM5NRtfc63bMGneODq9du0hmztuW5LfrW98wU+Rquor48YKHYmurofjqm
         SAl4pH8stQ7RaRXUw+DcLf4Cq1PgNHTNGN8KqFmhH/q6ix5NuVOP33mrBLgsU4X+Kc9b
         wnNMumwdU5KCYRNEaG4UJsXf0yBEDkPR2MCB4oEl1hGs+GauiYistowSmryb0ib53ymv
         nllMjCmTCOQds+HrLJ3Ju85xrw4W+z5GIs77mLInTyR/0klcwh0thoOnbMOvg7+HsoES
         CEnw==
X-Gm-Message-State: AFqh2kobiOIoH4uVpC0YcuOuh3NCxY9j4AEbvy0lPypI903VV51jrIxK
	vfZ5wMsrEQauKRUeTT1S2uuDlkVj9/mB0dM8
X-Google-Smtp-Source: AMrXdXsmBdhNxcDwwp12asj0hXt0Q2CTR14/XB1lp++K8Dldee+U4brxt+QK7C4jD5PB3X87FgcFfg==
X-Received: by 2002:a17:906:4351:b0:84d:141f:6784 with SMTP id z17-20020a170906435100b0084d141f6784mr21893886ejm.29.1674488898062;
        Mon, 23 Jan 2023 07:48:18 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v4 04/11] xen: extend domctl interface for cache coloring
Date: Mon, 23 Jan 2023 16:47:28 +0100
Message-Id: <20230123154735.74832-5-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit updates the domctl interface to allow the user to set cache
coloring configurations from the toolstack.
It also implements the functionality for arm64.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v4:
- updated XEN_DOMCTL_INTERFACE_VERSION
---
 xen/arch/arm/llc_coloring.c    | 14 ++++++++++++++
 xen/common/domctl.c            | 12 +++++++++++-
 xen/include/public/domctl.h    |  6 +++++-
 xen/include/xen/llc_coloring.h |  4 ++++
 4 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/llc_coloring.c b/xen/arch/arm/llc_coloring.c
index 51f057d7c9..2d0457cdbc 100644
--- a/xen/arch/arm/llc_coloring.c
+++ b/xen/arch/arm/llc_coloring.c
@@ -10,6 +10,7 @@
  */
 #include <xen/bitops.h>
 #include <xen/errno.h>
+#include <xen/guest_access.h>
 #include <xen/keyhandler.h>
 #include <xen/llc_coloring.h>
 #include <xen/param.h>
@@ -275,6 +276,19 @@ unsigned int *dom0_llc_colors(unsigned int *num_colors)
     return colors;
 }
 
+unsigned int *llc_colors_from_guest(struct xen_domctl_createdomain *config)
+{
+    unsigned int *colors;
+
+    if ( !config->num_llc_colors )
+        return NULL;
+
+    colors = alloc_colors(config->num_llc_colors);
+    copy_from_guest(colors, config->llc_colors, config->num_llc_colors);
+
+    return colors;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index ad71ad8a4c..505626ec46 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -8,6 +8,7 @@
 
 #include <xen/types.h>
 #include <xen/lib.h>
+#include <xen/llc_coloring.h>
 #include <xen/err.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
@@ -409,6 +410,7 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
     {
         domid_t        dom;
         static domid_t rover = 0;
+        unsigned int *llc_colors = NULL, num_llc_colors = 0;
 
         dom = op->domain;
         if ( (dom > 0) && (dom < DOMID_FIRST_RESERVED) )
@@ -434,7 +436,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
             rover = dom;
         }
 
-        d = domain_create(dom, &op->u.createdomain, false);
+        if ( llc_coloring_enabled )
+        {
+            llc_colors = llc_colors_from_guest(&op->u.createdomain);
+            num_llc_colors = op->u.createdomain.num_llc_colors;
+        }
+
+        d = domain_create_llc_colored(dom, &op->u.createdomain, false,
+                                      llc_colors, num_llc_colors);
+
         if ( IS_ERR(d) )
         {
             ret = PTR_ERR(d);
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 51be28c3de..49cccc8503 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000015
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -92,6 +92,10 @@ struct xen_domctl_createdomain {
     /* CPU pool to use; specify 0 or a specific existing pool */
     uint32_t cpupool_id;
 
+    /* IN LLC coloring parameters */
+    uint32_t num_llc_colors;
+    XEN_GUEST_HANDLE(uint32) llc_colors;
+
     struct xen_arch_domainconfig arch;
 };
 
diff --git a/xen/include/xen/llc_coloring.h b/xen/include/xen/llc_coloring.h
index 625930d378..2855f38296 100644
--- a/xen/include/xen/llc_coloring.h
+++ b/xen/include/xen/llc_coloring.h
@@ -24,6 +24,8 @@ int domain_llc_coloring_init(struct domain *d, unsigned int *colors,
 void domain_llc_coloring_free(struct domain *d);
 void domain_dump_llc_colors(struct domain *d);
 
+unsigned int *llc_colors_from_guest(struct xen_domctl_createdomain *config);
+
 #else
 
 #define llc_coloring_enabled (false)
@@ -36,6 +38,8 @@ static inline int domain_llc_coloring_init(struct domain *d,
 }
 static inline void domain_llc_coloring_free(struct domain *d) {}
 static inline void domain_dump_llc_colors(struct domain *d) {}
+static inline unsigned int *llc_colors_from_guest(
+    struct xen_domctl_createdomain *config) { return NULL; }
 
 #endif /* CONFIG_HAS_LLC_COLORING */
 
-- 
2.34.1


