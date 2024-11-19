Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F05DC9D27D5
	for <lists+xen-devel@lfdr.de>; Tue, 19 Nov 2024 15:13:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.840125.1255938 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz9-0008UL-14; Tue, 19 Nov 2024 14:13:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 840125.1255938; Tue, 19 Nov 2024 14:13:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tDOz8-0008RM-OS; Tue, 19 Nov 2024 14:13:42 +0000
Received: by outflank-mailman (input) for mailman id 840125;
 Tue, 19 Nov 2024 14:13:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PDt+=SO=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tDOz6-0007nQ-FZ
 for xen-devel@lists.xenproject.org; Tue, 19 Nov 2024 14:13:40 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78867ec2-a680-11ef-a0ca-8be0dac302b0;
 Tue, 19 Nov 2024 15:13:38 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a9ed49edd41so182977366b.0
 for <xen-devel@lists.xenproject.org>; Tue, 19 Nov 2024 06:13:38 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20df4e7bfsm655228166b.42.2024.11.19.06.13.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 06:13:37 -0800 (PST)
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
X-Inumbo-ID: 78867ec2-a680-11ef-a0ca-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzAiLCJoZWxvIjoibWFpbC1lajEteDYzMC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6Ijc4ODY3ZWMyLWE2ODAtMTFlZi1hMGNhLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyMDI1NjE4LjE1MTc0OSwic2VuZGVyIjoiY2FybG8ubm9uYXRvQG1pbmVydmFzeXMudGVjaCIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1732025617; x=1732630417; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fz8N6rEQmcVLhleWeld8+zl0xufNV5Tdqiws9rFy5Zo=;
        b=SK+Kge7YO8yDrGOZwpX96Jy91eB6LnqRmmimGxM2cVNknpGKeiL4c2vkYZqYfj1BDs
         qoAb4inyY82kUppdLJfFcozlImLQXrwNIjLg4uUmK6L9FH+T7cA9I3aA1bNb1WTRlEXr
         Z8tLgaBPpfl0ubNRX4XHuhgIiWhgO21N2lDcrkFCooYzrpaPD595j5FLtgaBHqupaEPY
         5yWWg8qczPmgfAJk15u0tZ8hq2raNyLEC92yEAJ0LPUfjHR0np5fLD4Rsp1sxeeok+9X
         hZZI/rEpNJtdsoGpDq+DOSVuoNadev3pqE9o1w84HWVUeA0tBfxuN/xvw1weFdCb8VTN
         5cOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732025617; x=1732630417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fz8N6rEQmcVLhleWeld8+zl0xufNV5Tdqiws9rFy5Zo=;
        b=ez6eIC/dsS62B6j9zAia2tkVQnNwBQCAFKKicMabDvqXuFNbveCCt8ds1Z4sWIRxoI
         P1zZEMXmYFyH0M83VkEExUBdTu1xGtvw5CcGOKLFtgJwKYC6e1yTZefk2tpwp81s1Hap
         x1I6RPsAZFy8zqyB+Npeax/1f6FLbQWiytPo6pNByTg39vtJNtQlQXlVvJ/O4MiSHvFT
         ho7nMNPLAxVjYvS2XdV4Ob83fKf0/j77xWQnMbxCbSn7+SW7qkCkwkXfEnJWgXANHomz
         htoLgP94H/DpB+vDIOIxhaYjBDKuCMTjy5yv1h8xPOQqu0LjThe0q6wSGv6yp69tq2OX
         E4kA==
X-Gm-Message-State: AOJu0Yyf2QBVZmN7aAyTAx0q87xT0yjfXMiWRZ589O3hKmFZWDrpUHQQ
	KLENvp3mQuRql8iGztxSDFGIek9VeLdOUBwMaqhOg2ZRHr0C9uCtUiGTILPHC4tcWgSvQ+5W6JH
	4
X-Google-Smtp-Source: AGHT+IEEpZYFR/dIQZ8v/Oem3QsH20f3XWA6b6hFh7bocPdOin1qegtrHWJf5/G1mP0ZwEMDRHSjXQ==
X-Received: by 2002:a17:906:c112:b0:a9a:9ab:6233 with SMTP id a640c23a62f3a-aa48348249bmr1232554866b.34.1732025617370;
        Tue, 19 Nov 2024 06:13:37 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v10 05/12] xen: extend domctl interface for cache coloring
Date: Tue, 19 Nov 2024 15:13:22 +0100
Message-ID: <20241119141329.44221-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
References: <20241119141329.44221-1-carlo.nonato@minervasys.tech>
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
index 740b5b9e4f..3cfd0ce78c 100644
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
@@ -104,8 +105,7 @@ static void print_colors(const unsigned int colors[], unsigned int num_colors)
     printk(" }\n");
 }
 
-static bool __init check_colors(const unsigned int colors[],
-                                unsigned int num_colors)
+static bool check_colors(const unsigned int colors[], unsigned int num_colors)
 {
     unsigned int i;
 
@@ -184,7 +184,7 @@ void domain_dump_llc_colors(const struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
-static void __init domain_set_default_colors(struct domain *d)
+static void domain_set_default_colors(struct domain *d)
 {
     printk(XENLOG_WARNING
            "LLC color config not found for %pd, using all colors\n", d);
@@ -221,6 +221,55 @@ int __init dom0_set_llc_colors(struct domain *d)
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
index 9cf49f574e..657f4d0a10 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -17,17 +17,21 @@ extern bool llc_coloring_enabled;
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


