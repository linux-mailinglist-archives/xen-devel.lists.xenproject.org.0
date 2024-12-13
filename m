Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 594E19F121D
	for <lists+xen-devel@lfdr.de>; Fri, 13 Dec 2024 17:28:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856854.1269419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wp-0005QC-JG; Fri, 13 Dec 2024 16:28:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856854.1269419; Fri, 13 Dec 2024 16:28:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tM8Wp-0005Lj-CU; Fri, 13 Dec 2024 16:28:35 +0000
Received: by outflank-mailman (input) for mailman id 856854;
 Fri, 13 Dec 2024 16:28:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4bZM=TG=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tM8Wn-0003wJ-My
 for xen-devel@lists.xenproject.org; Fri, 13 Dec 2024 16:28:33 +0000
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [2a00:1450:4864:20::52f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4adafeec-b96f-11ef-99a3-01e77a169b0f;
 Fri, 13 Dec 2024 17:28:32 +0100 (CET)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-5d0ac27b412so2739946a12.1
 for <xen-devel@lists.xenproject.org>; Fri, 13 Dec 2024 08:28:32 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech ([193.207.202.156])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa673474d96sm841759266b.96.2024.12.13.08.28.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 08:28:30 -0800 (PST)
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
X-Inumbo-ID: 4adafeec-b96f-11ef-99a3-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734107311; x=1734712111; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9mv5REGWn6ITbuAUP9LZySGEqnq/G3R/fSnXpuq2iqc=;
        b=c8U+9A1nPCz4dWS6bZz94mUkfJMCCiSZ+vUT8t2KrE4SJ53VLX2JuhSDbHhq6zUU85
         sjLExwKQoV3X+6smW9cfT1hVqwXi4OL7c8T7lF0UyDDAd74vI2hBkN1mWYVWNAKbYKAg
         75YjAdSfgNPeZsUZqCsO0rfWSH0SgpUlsQAI/kD5ImG4P1PEOJvz9v0n20XWVqiCQCQh
         jkBh1U5E0a8dHmx/GDpgNKNP4PGhkUXuCBwuIANkEuB84ueFaSS8ohuUN3bJmTAE7iDN
         a7P2MpaYF8LrHjXMh37rB3Wcg4Kq569Tra9RDn3/ukzOOSAIVxO3zmzvGBB1Ib5Ttozj
         6jSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734107311; x=1734712111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9mv5REGWn6ITbuAUP9LZySGEqnq/G3R/fSnXpuq2iqc=;
        b=btsd31E0N7Cb0Vg+HUUDRd9bQ+y9lcTenIENWi4RAiuPV4gV7jWwotqtkBLi+L9PLg
         qacayBX2Eyv8yIz+EOxXBKkji+JBduYvaOkVro22m2rkeyHVXC4h8WfAmrWfaKsRnM4M
         KEQ5Ee/VXSBVeqGLUFRhuxGQTrySXY2QodKvcqCaZmnoFRFqHZPzomUwmD3ppoTRGyRW
         bktYcHRPu5Hx4Ji1Y0MWzqCB4a0DoS/+6gYO2KbjHdCvmiycRhwFuZyJ/wm8CWPTYsx2
         c3whQP6PVMY9JSwQb/jgffnpLz6xOHgxPejZjie75l1Xt371fC2UkVI04diPnWj0QYZR
         NJRQ==
X-Gm-Message-State: AOJu0YwkIj4KaHbgYmONDobcHUdShApU0FfaBRZNJVNXArKjZNWGWgXV
	Wa5jYdcEVhP/RWWBbFBVmA1+NFvz86AYjXoOU15vKDYDj70B+GXZ+0k4oWpPNV3CfFrR1zkyt+a
	Io/8=
X-Gm-Gg: ASbGncsbByrhTbopTCKajmsmO7oWxHIkIC8KemDAooyMwyQzKtEJHfaWpKp4qgWyc8Z
	wOFcunoD8Fobv7v2y6W1RIHsZvhATSlRyyfDAaWDkcwCD9cciPOkQ7+Qh5/bjTugtzqiF3u8/Nr
	H1fKaELNxxVmsgcAjV/2Ct5F8jZGkMT2A7Bf7k5yn1eECmf8geiakKkQjusjqzbD+ttTbkTIkB7
	jN69dD7Ok9dpUZNMF9zLYzVYCJQ37p4qY4MNCeQfGGqIdo175b/PJ+rsA6J2srEpJN/ANTbLDK5
	b4CmMRHpmfoYNZuR
X-Google-Smtp-Source: AGHT+IHLvy+xSQ6XzQpoGWPxGKXwZQaj6T50KXQYfEs2Ftvx/fAc8we8jDrgCSlT5a1VjeryysAZgw==
X-Received: by 2002:a17:906:6bd4:b0:aab:9268:2626 with SMTP id a640c23a62f3a-aab92682666mr54602166b.25.1734107311184;
        Fri, 13 Dec 2024 08:28:31 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	marco.solieri@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v12 05/12] xen: extend domctl interface for cache coloring
Date: Fri, 13 Dec 2024 17:28:08 +0100
Message-ID: <20241213162815.9196-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
References: <20241213162815.9196-1-carlo.nonato@minervasys.tech>
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
v12:
- no changes
v11:
- minor changes
v10:
- fixed array type for colors parameter in check_colors()
v9:
- moved domain_llc_coloring_free() in next patch cause it's never used for dom0
v8:
- added bound check on dom0_num_colors
- default colors array set just once
v7:
- parse_color_config() doesn't accept leading/trailing commas anymore
- removed alloc_colors() helper
v6:
- moved domain_llc_coloring_free() in this patch
- removed domain_alloc_colors() in favor of a more explicit allocation
- parse_color_config() now accepts the size of the array to be filled
- allocate_memory() moved in another patch
v5:
- Carlo Nonato as the new author
- moved dom0 colors parsing (parse_colors()) in this patch
- added dom0_set_llc_colors() to set dom0 colors after creation
- moved color allocation and checking in this patch
- error handling when allocating color arrays
- FIXME: copy pasted allocate_memory() cause it got moved
v4:
- dom0 colors are dynamically allocated as for any other domain
  (colors are duplicated in dom0_colors and in the new array, but logic
  is simpler)
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
index 1eb733285e..d7d797e4d2 100644
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
@@ -113,8 +114,7 @@ static void print_colors(const unsigned int colors[], unsigned int num_colors)
     printk(" }\n");
 }
 
-static bool __init check_colors(const unsigned int colors[],
-                                unsigned int num_colors)
+static bool check_colors(const unsigned int colors[], unsigned int num_colors)
 {
     unsigned int i;
 
@@ -196,7 +196,7 @@ void domain_dump_llc_colors(const struct domain *d)
     print_colors(d->llc_colors, d->num_llc_colors);
 }
 
-static void __init domain_set_default_colors(struct domain *d)
+static void domain_set_default_colors(struct domain *d)
 {
     printk(XENLOG_WARNING
            "LLC color config not found for %pd, using all colors\n", d);
@@ -233,6 +233,55 @@ int __init dom0_set_llc_colors(struct domain *d)
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
index d29ebeb4c5..26353c808a 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -11,6 +11,7 @@
 #include <xen/types.h>
 
 struct domain;
+struct xen_domctl_set_llc_colors;
 
 #ifdef CONFIG_LLC_COLORING
 extern bool llc_coloring_enabled;
@@ -18,17 +19,21 @@ extern bool llc_coloring_enabled;
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


