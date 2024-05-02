Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5442F8B9F08
	for <lists+xen-devel@lfdr.de>; Thu,  2 May 2024 18:56:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.715950.1117974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zik-0007Y6-3L; Thu, 02 May 2024 16:55:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 715950.1117974; Thu, 02 May 2024 16:55:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s2Zij-0007TA-Pb; Thu, 02 May 2024 16:55:45 +0000
Received: by outflank-mailman (input) for mailman id 715950;
 Thu, 02 May 2024 16:55:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8/Nh=MF=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1s2Zih-0006N3-VT
 for xen-devel@lists.xenproject.org; Thu, 02 May 2024 16:55:43 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cfab38dc-08a4-11ef-b4bb-af5377834399;
 Thu, 02 May 2024 18:55:42 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51f3a49ff7dso919918e87.2
 for <xen-devel@lists.xenproject.org>; Thu, 02 May 2024 09:55:42 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 mq30-20020a170907831e00b00a5987fbfb83sm29103ejc.152.2024.05.02.09.55.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 09:55:41 -0700 (PDT)
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
X-Inumbo-ID: cfab38dc-08a4-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1714668942; x=1715273742; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9lNNmDdINfoHlllIflrjGEio9WD33GRBGAZScKnxGPA=;
        b=vIo2zAhWo5eT4uj4bhJHsRWmJ96FC1KhMzNfgWUQHJRriW1+BZI6M9DL5NQbPrNtcZ
         5fKhFpddbpBBcuVtO8QgeExlq0N6fSh8Sd7z9JW5vTH8PtYCI9v9wV9fdbwsXQWy0PAl
         MXLAeUNhdQ/nl9v229ZGa6vDLMob3/X0JgFumCdMMCOLjMntwpit5KZTINPC5t6uQ+e2
         +f3hwH2CXU+vepsngrNG++7j366Pv8af7st6jUbto74wfFD5cMp+I9iEefraM2e/T4BC
         gmgcD8QKw/Zp28T3EiS2W2YI7z8PdYWeGawI1q9fCNDBAqHhBVcmiKzhCT6h8prqYLn2
         8I0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714668942; x=1715273742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9lNNmDdINfoHlllIflrjGEio9WD33GRBGAZScKnxGPA=;
        b=Cx366My83m+MdyBKQgu+MEFX20N4SOVNJLrKvWYk4sWryJZcYn2JhYAto2SBL7sr/h
         /hQCGfxLGHnE3o9blCCX7niJ1BFWwntkiFsqrYmc8xFZ+WJrJ0pLu2aYzELjl5bCOwdd
         QppQmVCFPjne/Ixz+h6mg+EFelGFyCbUkygwL8xzIWs5g+4wlDXXto7SU0Bwtv/pQduI
         2f45dBbyzpbAH+miKHH3GqoLEVFRrGn7Wajb77sGXjLbjhICzvN4Jo0Q7+JHlGfBuzeo
         gPamylXEAvm5gsJtd1IBvQyaFVKxt8yTAp9JjNvFc+5lXzsDCkJc+fSridXuOdeN677T
         laTA==
X-Gm-Message-State: AOJu0YwnSCx5BeznvdWMGV1Zk8g1/cZ+uyLTwbmbzUBf+/In6h4QLcuG
	pGXcyD3DxYMZS63xYtvI9TgFt6vmP4OoatVrNV41Tp7QJSWxWxFK0QDZjQti69nasA89t4/exIo
	I
X-Google-Smtp-Source: AGHT+IFE87a06WYupkqdQKi0ZTarJY7Cax3giuwXsFKojmeBItsHdWnxzl4JvHy/bNxWSAvrjg0bwg==
X-Received: by 2002:a05:6512:32b9:b0:51e:11d5:bca5 with SMTP id q25-20020a05651232b900b0051e11d5bca5mr224999lfe.54.1714668941569;
        Thu, 02 May 2024 09:55:41 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v8 05/13] xen: extend domctl interface for cache coloring
Date: Thu,  2 May 2024 18:55:25 +0200
Message-Id: <20240502165533.319988-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
References: <20240502165533.319988-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new domctl hypercall to allow the user to set LLC coloring
configurations. Colors can be set only once, just after domain creation,
since recoloring isn't supported.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
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
 xen/common/domctl.c            | 10 ++++++++
 xen/common/llc-coloring.c      | 46 +++++++++++++++++++++++++++++++---
 xen/include/public/domctl.h    |  9 +++++++
 xen/include/xen/llc-coloring.h |  2 ++
 4 files changed, 64 insertions(+), 3 deletions(-)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index 2c0331bb05..30cca9a4ae 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -8,6 +8,7 @@
 
 #include <xen/types.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/err.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
@@ -864,6 +865,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
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
index 26270cda9c..ecfeb0ce82 100644
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
@@ -226,6 +226,46 @@ void domain_llc_coloring_free(struct domain *d)
     xfree(__va(__pa(d->llc_colors)));
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
+        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
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
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..d44eac8775 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1190,6 +1190,13 @@ struct xen_domctl_vmtrace_op {
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
 
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
@@ -1277,6 +1284,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_set_llc_colors                87
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1339,6 +1347,7 @@ struct xen_domctl {
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
         struct xen_domctl_paging_mempool    paging_mempool;
+        struct xen_domctl_set_llc_colors    set_llc_colors;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index ee82932266..b3801fca00 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -29,6 +29,8 @@ static inline void domain_llc_coloring_free(struct domain *d) {}
 unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
+int domain_set_llc_colors(struct domain *d,
+                          const struct xen_domctl_set_llc_colors *config);
 
 #endif /* __COLORING_H__ */
 
-- 
2.34.1


