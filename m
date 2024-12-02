Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 328D99E093E
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 18:00:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846766.1261947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9ll-0007xQ-Mp; Mon, 02 Dec 2024 16:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846766.1261947; Mon, 02 Dec 2024 16:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tI9ll-0007rJ-Gu; Mon, 02 Dec 2024 16:59:33 +0000
Received: by outflank-mailman (input) for mailman id 846766;
 Mon, 02 Dec 2024 16:59:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=no4W=S3=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tI9lk-0006x4-7h
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 16:59:32 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbf9f788-b0ce-11ef-99a3-01e77a169b0f;
 Mon, 02 Dec 2024 17:59:30 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53dd59a2bc1so4860354e87.2
 for <xen-devel@lists.xenproject.org>; Mon, 02 Dec 2024 08:59:30 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa5998e64c4sm526802666b.97.2024.12.02.08.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 08:59:29 -0800 (PST)
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
X-Inumbo-ID: cbf9f788-b0ce-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1733158770; x=1733763570; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPDYDU9V+cT61NhOvEC9qVLU2fWBxFfDL0pDRFCfADs=;
        b=rxbhCpqgZafgQaWYMqPWpKNqw/+AHnJePzclEdzJd8CifIzEQUIjpXlieg9czVp7/3
         6Tp4LdaC1hJY5nL93ERx6L7pJ2gVoKWwc1ugerBSDW1hXKERLW4xyd620l05rz9mFl7z
         AmV3/D1/21g2gkJtRsXUTjMz9MVhrsYTIPpjwdQ8z/jAbfjgw68+vTXCYewMXDbQOdO4
         1VN0mYWuThCOJCcyNx/z6D5CRg/AxWWAlcu3LyLd97aHLGV9ChHsGRX8lnjn+w4/yB8p
         DHGe/YESaPN98a8/VmSZCVheQUCjzt3yoTP18n20o8WGoEQfuxyU3Hqa4A+5WUQPBzkk
         sFHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733158770; x=1733763570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uPDYDU9V+cT61NhOvEC9qVLU2fWBxFfDL0pDRFCfADs=;
        b=UATpVOX/3ZL2uRae7Bkm/6CUASA+VBsxjVHGNAjFUFfqs1Ev80yQsI4rgC+Wmc/QQQ
         WlNCYDagXnUbohNoTmAqi+Ej+P3ULyK837vZvssviBw1Kw+nG/pDtlNkDioyscv1+1sZ
         q5c03qQDFMerBcoqH9EnwtH8Ds0e18G03MgBOFID2BBjQ+ZqdO95dwqujpouWmD9Kqq1
         qcGUGx6mIstCzKqAfpUB4fvCrDL83ujHWGZ51m95/N4lIA4xeXORIcG3RpmPE6P1KPYc
         e7H997EC6xZRo1Tl045JO4HbPMT03Xd2ywvHO8d4ej05r42aBVgTfbzgTy4nkCiGSq3j
         +fmQ==
X-Gm-Message-State: AOJu0Ywa+GwoMbWKiwnPO6pPVg6j/6rac7ULnHjz2obvBzLTSLYvIpFL
	9VWrq1hLLrO6lzTPLZtqAKA5bJAdXZopJJGGGg7VuQ+6PU+OmSCQDkNpb+dquyS+C5XUMaeKqrn
	u
X-Gm-Gg: ASbGncvZPIMtNYuedDV4ywY1qUg9qB/lETg4VPzoydzvj7a/8cISwsBf5ntS8DGdYXJ
	7U/ILhX9ky+FgB+nzBYB8//+7oKwtPs22fqj93pFO+FkoLe273ByKv7dxpP7/0xYM2wBJJ8kmEg
	2zl9YHnUry/ExGCJ3Pm9c2nwLW0GpEFqOuovmwSZFwJWRpl+AlWuRJadF3YH94bozC/dzMir60i
	FXYnA9X6U2p64Zgsqq07vfAxqk27l1aXiVkClAAvVWEoNZ+CQRVrQxG6MiOAqsTdVGopoA2jLyU
	klSK2njhcufH+sduFTNL/g9O53dUcelj3Loo2aCJ9EgBBj/HUke6
X-Google-Smtp-Source: AGHT+IGU9K5UrKiaW80g16K3SmuTHJjnReFkYfE1nN+bAa8o8fbCMxAm+qhH44scGK11AjAKmyVRag==
X-Received: by 2002:a05:6512:3ba3:b0:53d:cf93:8072 with SMTP id 2adb3069b0e04-53df00ff250mr12783810e87.38.1733158769685;
        Mon, 02 Dec 2024 08:59:29 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v11 05/12] xen: extend domctl interface for cache coloring
Date: Mon,  2 Dec 2024 17:59:14 +0100
Message-ID: <20241202165921.249585-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
References: <20241202165921.249585-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new domctl hypercall to allow the user to set LLC coloring
configurations. Colors can be set only once, just after domain creation,
since recoloring isn't supported.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
v11:
- no changes
v10:
- no changes
v9:
- minor printk message changes
- moved domain_llc_coloring_free() in this patch
v8:
- fixed memory leak on error path of domain_set_llc_colors()
v7:
- -EOPNOTSUPP returned in case of hypercall called without llc_coloring_enabled
- domain_set_llc_colors_domctl() renamed to domain_set_llc_colors()
- added padding and input bound checks to domain_set_llc_colors()
- removed alloc_colors() helper usage from domain_set_llc_colors()
v6:
- reverted the XEN_DOMCTL_INTERFACE_VERSION bump
- reverted to uint32 for the guest handle
- explicit padding added to the domctl struct
- rewrote domain_set_llc_colors_domctl() to be more explicit
v5:
- added a new hypercall to set colors
- uint for the guest handle
v4:
- updated XEN_DOMCTL_INTERFACE_VERSION
---
 xen/common/domain.c            |  3 ++
 xen/common/domctl.c            | 10 +++++++
 xen/common/llc-coloring.c      | 55 ++++++++++++++++++++++++++++++++--
 xen/include/public/domctl.h    |  9 ++++++
 xen/include/xen/llc-coloring.h |  5 ++++
 5 files changed, 79 insertions(+), 3 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 92263a4fbd..842a23751a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -34,6 +34,7 @@
 #include <xen/xenoprof.h>
 #include <xen/irq.h>
 #include <xen/argo.h>
+#include <xen/llc-coloring.h>
 #include <asm/p2m.h>
 #include <asm/processor.h>
 #include <public/sched.h>
@@ -1276,6 +1277,8 @@ void domain_destroy(struct domain *d)
 {
     BUG_ON(!d->is_dying);
 
+    domain_llc_coloring_free(d);
+
     /* May be already destroyed, or get_domain() can race us. */
     if ( atomic_cmpxchg(&d->refcnt, 0, DOMAIN_DESTROYED) != 0 )
         return;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index ea16b75910..6387dddbcd 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -8,6 +8,7 @@
 
 #include <xen/types.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/err.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
@@ -866,6 +867,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
                 __HYPERVISOR_domctl, "h", u_domctl);
         break;
 
+    case XEN_DOMCTL_set_llc_colors:
+        if ( op->u.set_llc_colors.pad )
+            ret = -EINVAL;
+        else if ( llc_coloring_enabled )
+            ret = domain_set_llc_colors(d, &op->u.set_llc_colors);
+        else
+            ret = -EOPNOTSUPP;
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 8f076849c1..2a0ee695c8 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -5,6 +5,7 @@
  * Copyright (C) 2024, Advanced Micro Devices, Inc.
  * Copyright (C) 2024, Minerva Systems SRL
  */
+#include <xen/guest_access.h>
 #include <xen/keyhandler.h>
 #include <xen/llc-coloring.h>
 #include <xen/param.h>
@@ -109,8 +110,7 @@ static void print_colors(const unsigned int colors[], unsigned int num_colors)
     printk(" }\n");
 }
 
-static bool __init check_colors(const unsigned int colors[],
-                                unsigned int num_colors)
+static bool check_colors(const unsigned int colors[], unsigned int num_colors)
 {
     unsigned int i;
 
@@ -191,7 +191,7 @@ void domain_dump_llc_colors(const struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
-static void __init domain_set_default_colors(struct domain *d)
+static void domain_set_default_colors(struct domain *d)
 {
     printk(XENLOG_WARNING
            "LLC color config not found for %pd, using all colors\n", d);
@@ -228,6 +228,55 @@ int __init dom0_set_llc_colors(struct domain *d)
     return 0;
 }
 
+int domain_set_llc_colors(struct domain *d,
+                          const struct xen_domctl_set_llc_colors *config)
+{
+    unsigned int *colors;
+
+    if ( d->num_llc_colors )
+        return -EEXIST;
+
+    if ( !config->num_llc_colors )
+    {
+        domain_set_default_colors(d);
+        return 0;
+    }
+
+    if ( config->num_llc_colors > max_nr_colors )
+        return -EINVAL;
+
+    colors = xmalloc_array(unsigned int, config->num_llc_colors);
+    if ( !colors )
+        return -ENOMEM;
+
+    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_colors) )
+    {
+        xfree(colors);
+        return -EFAULT;
+    }
+
+    if ( !check_colors(colors, config->num_llc_colors) )
+    {
+        printk(XENLOG_ERR "%pd: bad LLC color config\n", d);
+        xfree(colors);
+        return -EINVAL;
+    }
+
+    d->llc_colors = colors;
+    d->num_llc_colors = config->num_llc_colors;
+
+    return 0;
+}
+
+void domain_llc_coloring_free(struct domain *d)
+{
+    if ( !llc_coloring_enabled || d->llc_colors == default_colors )
+        return;
+
+    /* free pointer-to-const using __va(__pa()) */
+    xfree(__va(__pa(d->llc_colors)));
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 353f831e40..e2d392d1e5 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1236,6 +1236,13 @@ struct xen_domctl_dt_overlay {
 };
 #endif
 
+struct xen_domctl_set_llc_colors {
+    /* IN LLC coloring parameters */
+    uint32_t num_llc_colors;
+    uint32_t pad;
+    XEN_GUEST_HANDLE_64(uint32) llc_colors;
+};
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1325,6 +1332,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_set_paging_mempool_size       86
 #define XEN_DOMCTL_dt_overlay                    87
 #define XEN_DOMCTL_gsi_permission                88
+#define XEN_DOMCTL_set_llc_colors                89
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1391,6 +1399,7 @@ struct xen_domctl {
 #if defined(__arm__) || defined(__aarch64__)
         struct xen_domctl_dt_overlay        dt_overlay;
 #endif
+        struct xen_domctl_set_llc_colors    set_llc_colors;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index 4ce14e4e4a..cbebe0816c 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -9,6 +9,7 @@
 #define __XEN_LLC_COLORING_H__
 
 struct domain;
+struct xen_domctl_set_llc_colors;
 
 #ifdef CONFIG_LLC_COLORING
 extern int8_t llc_coloring_enabled;
@@ -16,17 +17,21 @@ extern int8_t llc_coloring_enabled;
 void llc_coloring_init(void);
 void dump_llc_coloring_info(void);
 void domain_dump_llc_colors(const struct domain *d);
+void domain_llc_coloring_free(struct domain *d);
 #else
 #define llc_coloring_enabled false
 
 static inline void llc_coloring_init(void) {}
 static inline void dump_llc_coloring_info(void) {}
 static inline void domain_dump_llc_colors(const struct domain *d) {}
+static inline void domain_llc_coloring_free(struct domain *d) {}
 #endif
 
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
+int domain_set_llc_colors(struct domain *d,
+                          const struct xen_domctl_set_llc_colors *config);
 
 #endif /* __XEN_LLC_COLORING_H__ */
 
-- 
2.43.0


