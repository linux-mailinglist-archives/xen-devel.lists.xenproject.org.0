Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B6C9AFEE2
	for <lists+xen-devel@lfdr.de>; Fri, 25 Oct 2024 11:51:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.825709.1240044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Gy7-0006va-OR; Fri, 25 Oct 2024 09:50:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 825709.1240044; Fri, 25 Oct 2024 09:50:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t4Gy7-0006rh-Hm; Fri, 25 Oct 2024 09:50:55 +0000
Received: by outflank-mailman (input) for mailman id 825709;
 Fri, 25 Oct 2024 09:50:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=r3YV=RV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1t4Gy5-0006YL-Ra
 for xen-devel@lists.xenproject.org; Fri, 25 Oct 2024 09:50:53 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ee8349c-92b6-11ef-99a3-01e77a169b0f;
 Fri, 25 Oct 2024 11:50:52 +0200 (CEST)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-5c96df52c52so2405614a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 25 Oct 2024 02:50:52 -0700 (PDT)
Received: from carlo-ubuntu.home
 (dynamic-adsl-94-34-131-227.clienti.tiscali.it. [94.34.131.227])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5cbb629e17dsm446938a12.34.2024.10.25.02.50.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 02:50:50 -0700 (PDT)
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
X-Inumbo-ID: 9ee8349c-92b6-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1729849851; x=1730454651; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTdYd5K2CTjFCeSluro77ToeU6d5yg4QCK/iJOgalpA=;
        b=Llm0q+RDYM++Lw99V+I4ejs/nfJPA/9f8AP0t3rzH0ZC426uIw69Yw5YR8oSgoZKWb
         uMDjvP+xjNAHDHcP0HdFJSoPgKtuVFz9oGDhVl6uGPprlrRTDRf3nudbItNL6OUXphxh
         8BD4R+u6qlA0H4Tj54UnYDBPItFhmMYMVg0Z2zXF64aZ2bQEOH3gPaDKs0zMFXZ0cpaH
         7SOKuOevuhkBaD0hEaNQNKSFWptKEZ+VvQ3Smc0FNgY7rshEwNWzpz+3mASH7tSsriyD
         w7fp6m3dHuVwEE9jSzGAUnuxt9wBxR+IJeof+lHKnHYkWwT8CoieVHqFpgP38fGpp9nK
         41MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729849851; x=1730454651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uTdYd5K2CTjFCeSluro77ToeU6d5yg4QCK/iJOgalpA=;
        b=cUBihtziQvcaISiI0VLgDC/WfiEaLT+aqN4rcdmtv2K9oq3BLdeFsYXHASLL34qsXj
         ywrXblYs/UWTvIjI5xpeJcwxL4B9s6JWlLNE5GVX/tKyqTYxQt5r243jjBu/BOYaINUo
         KC9TJ4Yf/N0wC6YBU41/fuFIVeCd6OgOzJ1a8WIaCdF7anTb84fHMZJG8mG/eRpoog0Z
         /qoSugE1FNjYn5UHQjZTvC4BVAMExQS4EerNtizGUp2OlA6s7I7MCvOL7fLzB2lXbvNE
         7irXVskLjpR761zaI1LSGhO/4wMcO99dTuElOHPKzomoTu27iJxfsfXfuJQH0UXBm7no
         3tIA==
X-Gm-Message-State: AOJu0Yx1T0Jh6IO5EMa9MTPCCoKkFfZ+6x5Kt91EZm8wP6ykcc5Imp2C
	XFNUPiZIiympX/uCHj5vTGCFYoUfaWcgkJbSgZnOGMlZnhiFT7oDwF34S5Oth2rHB5OZ+xai8R2
	ZGXw=
X-Google-Smtp-Source: AGHT+IEmCBs2qBB8c5FwlYPtMWhhk9p/JN0qNrprgQm1RFKjE9KbnkVFpYdlviBCfm8v+pWRtROdjw==
X-Received: by 2002:a05:6402:3888:b0:5c9:36c4:cead with SMTP id 4fb4d7f45d1cf-5cb8b26f218mr5771064a12.34.1729849851098;
        Fri, 25 Oct 2024 02:50:51 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v9 05/13] xen: extend domctl interface for cache coloring
Date: Fri, 25 Oct 2024 11:50:06 +0200
Message-ID: <20241025095014.42376-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
References: <20241025095014.42376-1-carlo.nonato@minervasys.tech>
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
 xen/include/xen/llc-coloring.h |  4 +++
 5 files changed, 78 insertions(+), 3 deletions(-)

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
index 35c6c36280..2ab0bb10a3 100644
--- a/xen/common/llc-coloring.c
+++ b/xen/common/llc-coloring.c
@@ -4,6 +4,7 @@
  *
  * Copyright (C) 2022 Xilinx Inc.
  */
+#include <xen/guest_access.h>
 #include <xen/keyhandler.h>
 #include <xen/llc-coloring.h>
 #include <xen/param.h>
@@ -103,8 +104,7 @@ static void print_colors(const unsigned int *colors, unsigned int num_colors)
     printk(" }\n");
 }
 
-static bool __init check_colors(const unsigned int *colors,
-                                unsigned int num_colors)
+static bool check_colors(const unsigned int *colors, unsigned int num_colors)
 {
     unsigned int i;
 
@@ -180,7 +180,7 @@ void domain_dump_llc_colors(const struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
-static void __init domain_set_default_colors(struct domain *d)
+static void domain_set_default_colors(struct domain *d)
 {
     printk(XENLOG_WARNING
            "LLC color config not found for %pd, using all colors\n", d);
@@ -217,6 +217,55 @@ int __init dom0_set_llc_colors(struct domain *d)
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
index baf6d4add1..b3801fca00 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -16,17 +16,21 @@ extern bool llc_coloring_enabled;
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
 
 #endif /* __COLORING_H__ */
 
-- 
2.43.0


