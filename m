Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D885D87CBBF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Mar 2024 11:59:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693752.1082254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Hu-0001uc-5z; Fri, 15 Mar 2024 10:59:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693752.1082254; Fri, 15 Mar 2024 10:59:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rl5Ht-0001qr-Vj; Fri, 15 Mar 2024 10:59:45 +0000
Received: by outflank-mailman (input) for mailman id 693752;
 Fri, 15 Mar 2024 10:59:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WnwS=KV=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rl5Hs-0000xG-01
 for xen-devel@lists.xenproject.org; Fri, 15 Mar 2024 10:59:44 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 203480fb-e2bb-11ee-a1ee-f123f15fe8a2;
 Fri, 15 Mar 2024 11:59:42 +0100 (CET)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a468004667aso114424566b.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Mar 2024 03:59:42 -0700 (PDT)
Received: from carlo-ubuntu.mo54.unimo.it (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 en6-20020a17090728c600b00a465a012cf1sm1621493ejc.18.2024.03.15.03.59.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 03:59:40 -0700 (PDT)
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
X-Inumbo-ID: 203480fb-e2bb-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1710500382; x=1711105182; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IC3TyEtibJD75zpZ0IhFnt1yswFb6xMybexaSNsbLU0=;
        b=S2jWAS5ed8AmzQGWbYvL3pIy3IErB351gE884DFupXsyNOczxcj+tBpg9CZe9qJw+N
         61NPLJhimFLDT3sQLtj1UUjzJ+wFlcNzz1zcMqVmINU8XMJrMS/g9BiU8Le269176uMx
         9/R4YNCe1iW3RsPqzYv6qkg7bykYhufAxosyeYspsyVdncSLm6GVpRvplBxFOTPOevIG
         i3plOdZcAtf6QiYkEncN1Ackj2LyjoxL0verslnakwYj2lC3Kph3VDf1WjKmNMjWxNG+
         2a2OdZfZ8S4Vn89CglV0j1daJH7tfad+IudrTavRzVhdWoscT/VNO6DP17qNv+mx7VoM
         H/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710500382; x=1711105182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IC3TyEtibJD75zpZ0IhFnt1yswFb6xMybexaSNsbLU0=;
        b=Jf0WYsA8faLTVnMFMe2oyJCrH4dF/PD0hRyF8FGtTYHFh7Z7tmL7rngV3y4Re0zhfZ
         62Jj/V4K0uVEPgIixVsnhGWYc8fkcn50qS1zg1u3l3JuDPWV9eZspluzDIiqNrEP4vfp
         5+yKN7iF/sOFzcNq74p//bRSwYwxotmKjfiZGWobnJyueNzsJTQe20sDcrloAP4IuGHx
         b/oXI4vEvzIRMCM7JKGs99P3txkqF9GDdKeDpNLwve3cPMw1liDLEpa5AVvMAcRVcqrm
         noagN+e953kh92LcRB2nlCaw7qjcFI57jqJsMa6iuLMU1P6cMeBffdL9YK2mUI2hSYDD
         wJhQ==
X-Gm-Message-State: AOJu0YxW9iLCuexcY797MI6Cdqw8vNgOHFCk5PTH+yK2twg3U4wUJQ8f
	XLARi9ekwjjRiKYOQd2Tfv1Eqst4KxfWYUoVtC9rjhjvXIT1KKPZ7ewAwAZFUYBTQv46oNAOuZU
	ItkM=
X-Google-Smtp-Source: AGHT+IFcPZ4YeaeLnZKZdbdcuJWgPQ0ngX5yOAq9oJjhTwcqxTMdBH22sUfXDBtkFRjEWudJT6Eliw==
X-Received: by 2002:a17:907:cbc7:b0:a46:7933:9839 with SMTP id vk7-20020a170907cbc700b00a4679339839mr2732511ejc.71.1710500381583;
        Fri, 15 Mar 2024 03:59:41 -0700 (PDT)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v7 05/14] xen: extend domctl interface for cache coloring
Date: Fri, 15 Mar 2024 11:58:53 +0100
Message-Id: <20240315105902.160047-6-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
References: <20240315105902.160047-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new domctl hypercall to allow the user to set LLC coloring
configurations. Colors can be set only once, just after domain creation,
since recoloring isn't supported.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
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
 xen/common/domctl.c            |  8 ++++++++
 xen/common/llc-coloring.c      | 34 ++++++++++++++++++++++++++++++++++
 xen/include/public/domctl.h    |  9 +++++++++
 xen/include/xen/llc-coloring.h |  2 ++
 4 files changed, 53 insertions(+)

diff --git a/xen/common/domctl.c b/xen/common/domctl.c
index f5a71ee5f7..6c940ac833 100644
--- a/xen/common/domctl.c
+++ b/xen/common/domctl.c
@@ -8,6 +8,7 @@
 
 #include <xen/types.h>
 #include <xen/lib.h>
+#include <xen/llc-coloring.h>
 #include <xen/err.h>
 #include <xen/mm.h>
 #include <xen/sched.h>
@@ -858,6 +859,13 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
                 __HYPERVISOR_domctl, "h", u_domctl);
         break;
 
+    case XEN_DOMCTL_set_llc_colors:
+        if ( llc_coloring_enabled )
+            ret = domain_set_llc_colors(d, &op->u.set_llc_colors);
+        else
+            ret = -EOPNOTSUPP;
+        break;
+
     default:
         ret = arch_do_domctl(op, d, u_domctl);
         break;
diff --git a/xen/common/llc-coloring.c b/xen/common/llc-coloring.c
index ebd7087dc2..9c1f152b96 100644
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
@@ -219,6 +220,39 @@ void domain_llc_coloring_free(struct domain *d)
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
+        return domain_set_default_colors(d);
+
+    if ( config->num_llc_colors > max_nr_colors || config->pad )
+        return -EINVAL;
+
+    colors = xmalloc_array(unsigned int, config->num_llc_colors);
+    if ( !colors )
+        return -ENOMEM;
+
+    if ( copy_from_guest(colors, config->llc_colors, config->num_llc_colors) )
+        return -EFAULT;
+
+    if ( !check_colors(colors, config->num_llc_colors) )
+    {
+        printk(XENLOG_ERR "Bad LLC color config for %pd\n", d);
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


