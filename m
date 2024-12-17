Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EE89F51AA
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 18:07:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859577.1271733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb21-00075p-56; Tue, 17 Dec 2024 17:06:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859577.1271733; Tue, 17 Dec 2024 17:06:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNb20-0006zN-Ta; Tue, 17 Dec 2024 17:06:48 +0000
Received: by outflank-mailman (input) for mailman id 859577;
 Tue, 17 Dec 2024 17:06:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+zK=TK=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1tNb1z-0006B0-Fj
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 17:06:47 +0000
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [2a00:1450:4864:20::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4c32b1cb-bc99-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 18:06:46 +0100 (CET)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-aa68b513abcso922175566b.0
 for <xen-devel@lists.xenproject.org>; Tue, 17 Dec 2024 09:06:46 -0800 (PST)
Received: from carlo-ubuntu.home.arpa
 (host-95-230-250-178.business.telecomitalia.it. [95.230.250.178])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aab963910f7sm461362666b.166.2024.12.17.09.06.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Dec 2024 09:06:45 -0800 (PST)
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
X-Inumbo-ID: 4c32b1cb-bc99-11ef-a0d6-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1734455206; x=1735060006; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2S4/V5E4tJ5kPAHOqK5areTT6H+4uOWSSoM5Y54F91A=;
        b=kLKS3ZqO0+C1WxMX+JokFh0/ol3RC9DazhZAkAGkWH/AjZvjNZ8DQR3uB8dWDFB74q
         +6zAO2wjdZVJ4ntiko4f3jMUAkuaTvfnynCVMJnribqzfTcquNVibpm/bQtSU8+9osQX
         IATked7CPNzg5I9DrD7VYSiFWvCd1l5P1xYK7KVnNorNKQswR4aYYoOx+dvHw69VXwa1
         9H5Hqt900HtpjMW5yeOxkqRX5w8mBe0H3vfBezR2QLt3YUBwrm/67XKqw8gHYZt+ZTsR
         ebfwC9QlTJZm2f0AqVgJIeCKJm3DoNAmOINx+1vq6b5GY++2lcMAEU6pxaPKdDIhpWo6
         CVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734455206; x=1735060006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2S4/V5E4tJ5kPAHOqK5areTT6H+4uOWSSoM5Y54F91A=;
        b=kO2uRMVnWEsDqBvolkhxDQCcunRtWWeIpxwefPqT4tE+YsK/VfMlV4hspEhIUvCWfl
         nFYr+l539i9P70d5yFx/Q+VofNKZH/4VrKNy/X1za8XLHavYqic/Ve1TSYChPFVgzjnp
         LnhoR4IvMxv6dimcoL74UJIzjvT6Y6RSlMrrEn3wn12rs0NDE4or6BB+fhP92CdGAhFX
         sirRJoMWW15VEr/mSHJE+J/MQlBeuX60HFWXeAecZO58P6BZvoAn6oSAcRRztluf2lTh
         EqzY6p9VjMFU+fmud3sAyNA4xPlSSnkYH6Au1pSvhEAy5w3aul2Dg7jDhzy9l1CWHt40
         jQcA==
X-Gm-Message-State: AOJu0YwdI3KJLcvCRcrmvzC+pBJBNUAHx/i//LtMnLnb7J4ty9gXtkDJ
	H09UxB8OySgjVrZEpsSIvaF+RoD1joyGFE9khaI9zMX9mu4T6x565rDLgNz7/LmafbR1cyu0B29
	5IWA=
X-Gm-Gg: ASbGncszokdC59ezyoXC24mr1IWK29wa2//izRkqn4m0XNyykpuNe7+egB4tzz5lepH
	/OcmWhC/oxM6O1/nR6GFwaPbtA1tgFOqS1N6JDbzm8Q+e3/XWBfMdSONn84e2xrbEV3bdgRNFuT
	aj9sMzUNFSrQe6pHn3f+xjD7Ti5ieNGerdIduAXaQhe+lMn44FggjJVRbHKvcI84Yb1NwWPS/ry
	ntqeiTsJDNRDdl+vidVGcfAKwZICGLYxT4kWgA57b7BbolEVD86xVzOqUFEr1SQA1TyhXDre3XM
	7Rtz8/Pn4YanqVNQzx6hjdCD0t9xztsVYp+w0P0DxlVJgPY1P9uBpWkom1g=
X-Google-Smtp-Source: AGHT+IExagnqRoh8QBrUeufotoNpy1yEQfm4ChjJPBuVBy8EYoooKITYLw1dG1jy7T5JMA1rOaQFgw==
X-Received: by 2002:a17:907:d15:b0:aa6:8f39:5c with SMTP id a640c23a62f3a-aab7792cff5mr2000325166b.17.1734455205778;
        Tue, 17 Dec 2024 09:06:45 -0800 (PST)
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
Subject: [PATCH v13 05/12] xen: extend domctl interface for cache coloring
Date: Tue, 17 Dec 2024 18:06:30 +0100
Message-ID: <20241217170637.233097-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
References: <20241217170637.233097-1-carlo.nonato@minervasys.tech>
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
v13:
- no changes
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
index e33a0a5a21..0c4cc77111 100644
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
@@ -1303,6 +1304,8 @@ void domain_destroy(struct domain *d)
 {
     BUG_ON(!d->is_dying);
 
+    domain_llc_coloring_free(d);
+
     /* May be already destroyed, or get_domain() can race us. */
     if ( atomic_cmpxchg(&d->refcnt, 0, DOMAIN_DESTROYED) != 0 )
         return;
diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 444e072fdc..05abb581a0 100644
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
index 5984ae82e7..3dd1aaa4df 100644
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


