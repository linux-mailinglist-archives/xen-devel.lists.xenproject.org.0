Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C514840EDF
	for <lists+xen-devel@lfdr.de>; Mon, 29 Jan 2024 18:19:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.673066.1047265 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI5-0006zP-M9; Mon, 29 Jan 2024 17:19:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 673066.1047265; Mon, 29 Jan 2024 17:19:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rUVI5-0006vQ-Hd; Mon, 29 Jan 2024 17:19:25 +0000
Received: by outflank-mailman (input) for mailman id 673066;
 Mon, 29 Jan 2024 17:19:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vh+I=JH=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rUVI4-0005vY-30
 for xen-devel@lists.xenproject.org; Mon, 29 Jan 2024 17:19:24 +0000
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [2a00:1450:4864:20::22d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b101d2e-beca-11ee-8a43-1f161083a0e0;
 Mon, 29 Jan 2024 18:19:22 +0100 (CET)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2cf1fd1cc5bso35531751fa.3
 for <xen-devel@lists.xenproject.org>; Mon, 29 Jan 2024 09:19:22 -0800 (PST)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 eo15-20020a056402530f00b005598ec568dbsm3970494edb.59.2024.01.29.09.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jan 2024 09:19:20 -0800 (PST)
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
X-Inumbo-ID: 8b101d2e-beca-11ee-8a43-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1706548761; x=1707153561; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQCxn/qSiO+Xlc2kHildMd99iJ3B4U7/tWBy/pimbzo=;
        b=l0ayDZ6B4oUSrK3TsvSHfF9bvVR6a2iQ2OSAKbpGy2zwMTIzG+l9qNqt1uq16x8UOL
         77T3knYMAZybK9YgGNVHvr3Fcu3zl5s86XfRnsvsoVfbpDXE5+xL5b61SRmoL50MTFNN
         zO+c9Py3/wk30PO1bJdmO7/YJoLuP+w+GTKfc9/pT2O5rppOl2YH8B6v+aEuFZhs3vrA
         pDrC4Pzhv1IBFkEE2rsV5MqbbhVb0zTZjIanhU25lBLMtoxrCukUHNvTMqVWR3N8Kzhe
         cYQGSfYntCnROZM33FYzQLIoj6oiX8q+FWjLBAyU+efiTuMXTMohq/Tj9xjcthwd3bQd
         gfMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548761; x=1707153561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQCxn/qSiO+Xlc2kHildMd99iJ3B4U7/tWBy/pimbzo=;
        b=oeY6zNPcuiSIo0T917r/cO1jkYrt57NHBSgeyTbQ6sArpVYoR2IuUXap0Q5B9/nC7r
         lky38PCpP3jv2xjifKsIqTS6HsAwuRmigJOLqzRL7rXZSzNtla8qo/ydqhqNMcRBM6lP
         beQCsfQh2mfBCAoNTYToicAUdSQHmdz/mI0oepzy+MWQ7XwvcSGgwhmWWv3BKBgYlNry
         R0GjQzx1Kqxz15uz/Kx+kfcwIT5m23c7LVQ38E6UvJV3wCHb0vOYlX0djKTCZQQS/8xq
         QbarUbPYGXqJoE4jgpDjQKtk2SvBP+mX48pN6jP3z7qbV24Pj4sVAOoV64ga9QHPvXVJ
         I+iQ==
X-Gm-Message-State: AOJu0YxnthTL8U85hyoEaLeV1cnNuAD6wQ0VwPnJ45pVAIdXgd6hOhH/
	dpu+Q5Q+oIetMDZud4X0dYF0qtNd8OTA7rweowSfvEuN3SOhurZX8kIGJUcN/ohLJQXpGnUZ4Nz
	q4vg=
X-Google-Smtp-Source: AGHT+IGXbU38Oy5XxZbVKZaWzBhOGFgRSdo5hfBtuIrJ1TbygxIFo+z/zFGXI1MhvagzFR4/Nmytew==
X-Received: by 2002:a2e:86ca:0:b0:2cd:c811:6a24 with SMTP id n10-20020a2e86ca000000b002cdc8116a24mr5419271ljj.18.1706548761240;
        Mon, 29 Jan 2024 09:19:21 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: andrea.bastoni@minervasys.tech,
	Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v6 05/15] xen: extend domctl interface for cache coloring
Date: Mon, 29 Jan 2024 18:18:01 +0100
Message-Id: <20240129171811.21382-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
References: <20240129171811.21382-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the domctl interface to allow the user to set coloring configurations
from the toolstack.

Implement also the functionality for arm64.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
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
 xen/common/domctl.c            | 11 +++++++++++
 xen/common/llc-coloring.c      | 25 +++++++++++++++++++++++++
 xen/include/public/domctl.h    |  9 +++++++++
 xen/include/xen/llc-coloring.h |  3 +++
 4 files changed, 48 insertions(+)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f5a71ee5f7..b6867d0602 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -8,6 +8,7 @@
 
 #include <xen/types.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/err.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
@@ -858,6 +859,16 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
                 __HYPERVISOR_domctl, "h", u_domctl);
         break;
 
+    case XEN_DOMCTL_set_llc_colors:
+        if ( !llc_coloring_enabled )
+            break;
+
+        ret = domain_set_llc_colors_domctl(d, &op->u.set_llc_colors);
+        if ( ret == -EEXIST )
+            printk(XENLOG_ERR
+                   "Can't set LLC colors on an already created domain\n");
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index 983de44a47..aaf0606c00 100644
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
@@ -229,6 +230,30 @@ int __init dom0_set_llc_colors(struct domain *d)
     return domain_check_colors(d);
 }
 
+int domain_set_llc_colors_domctl(struct domain *d,
+                                 const struct xen_domctl_set_llc_colors *config)
+{
+    unsigned int *colors;
+
+    if ( d->num_llc_colors )
+        return -EEXIST;
+
+    if ( !config->num_llc_colors )
+        return domain_set_default_colors(d);
+
+    colors = alloc_colors(config->num_llc_colors);
+    if ( !colors )
+        return -ENOMEM;
+
+    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_colors) )
+        return -EFAULT;
+
+    d->llc_colors = colors;
+    d->num_llc_colors = config->num_llc_colors;
+
+    return domain_check_colors(d);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..d090cdb2dd 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1190,6 +1190,13 @@ struct xen_domctl_vmtrace_op {
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
 
+struct xen_domctl_set_llc_colors {
+    /* IN LLC coloring parameters */
+    uint32_t num_llc_colors;
+    uint32_t padding;
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
index 1a73080c98..a82081367f 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -28,6 +28,9 @@ unsigned int get_llc_way_size(void);
 void arch_llc_coloring_init(void);
 int dom0_set_llc_colors(struct domain *d);
 
+int domain_set_llc_colors_domctl(struct domain *d,
+                                 const struct xen_domctl_set_llc_colors *config);
+
 #endif /* __COLORING_H__ */
 
 /*
-- 
2.34.1


