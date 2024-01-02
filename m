Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB02B821925
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jan 2024 10:52:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.660562.1030065 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbR9-0006cw-Qc; Tue, 02 Jan 2024 09:51:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 660562.1030065; Tue, 02 Jan 2024 09:51:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rKbR9-0006ZZ-Ml; Tue, 02 Jan 2024 09:51:51 +0000
Received: by outflank-mailman (input) for mailman id 660562;
 Tue, 02 Jan 2024 09:51:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpFB=IM=minervasys.tech=carlo.nonato@srs-se1.protection.inumbo.net>)
 id 1rKbR8-00060C-QX
 for xen-devel@lists.xenproject.org; Tue, 02 Jan 2024 09:51:50 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c456ca3-a954-11ee-9b0f-b553b5be7939;
 Tue, 02 Jan 2024 10:51:49 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a26f73732c5so591225166b.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jan 2024 01:51:49 -0800 (PST)
Received: from carlo-ubuntu.minervasys.tech (nonato.mo54.unimo.it.
 [155.185.85.8]) by smtp.gmail.com with ESMTPSA id
 s4-20020a1709066c8400b00a1f7ab65d3fsm11541845ejr.131.2024.01.02.01.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jan 2024 01:51:47 -0800 (PST)
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
X-Inumbo-ID: 8c456ca3-a954-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minervasys-tech.20230601.gappssmtp.com; s=20230601; t=1704189108; x=1704793908; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VQRNz81fimbLLr0I8jJGaXDeWrq4/HkqdivnNzazx98=;
        b=iz4mGAwapK8tT/WcRGthefgxpQYI6rDQ6qeIqNIbXNNmqGhienYGAIDDSYIb69hzQl
         CsnozwKsrkBwBO5imJ9ARim2WabG5KARqy52k7iXxP5nVxikWzikBS0AuvQZkhiqxJjH
         /PTVy6bssUg2CZiCF4cUZKoeumlYVGjb4nbHEOt98tKSc2cFWuNj9lDCts3B0RgqKDSj
         yDpL5LayUGEhwxHaICorJIE7RAJtkv3XE0az/uv8Jdbmn3zCV+isah8Ok4RSELZVhP9G
         T5W1r572ac0YoSJMKAMKPBkGVyQuBOBUWV2W2kz7t1mIpu82u2M5wnu7M0fxqQJvuRnS
         Btnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704189108; x=1704793908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VQRNz81fimbLLr0I8jJGaXDeWrq4/HkqdivnNzazx98=;
        b=XM8oL9Qo7KaZ8Nv7mti38Vq82FARQaerfs8P/xvYgDqXL3sm7J2XHgRTAeXDqDtn8E
         ndANyjdysqm80KiYMS4OT5RRc1JzpejzvRL4X0HHs+9Srqq296rLVl8/eZDER1lViFyg
         tjDHJHeNWPkkC1D7og4D1oAecwUYJKgBuDBe3NnJeyG+m2l6mBja2eIUHXCi/ywTygi+
         UaU6Z3SmgrMwNt2r0QrSzNbDkoBiKxfN2Ut02K/OPepk8C7S9VT4N/AFmlLnlQ5At94k
         NaPfW9lxNnxUFLqEuQwTS0+293HoceV0LWtBobn26x9HdnigtrHDZnnXeSfKw1RLHAXg
         9jgQ==
X-Gm-Message-State: AOJu0YzvmUGlieIvIDJ8XG19h/GfqoPpg9k7OcbegG+nUYKyxOseZGGM
	TW25MfYQO8aX9tyHCIDl+Ao/tx9F92u56UgW/zAy/XGs7e8=
X-Google-Smtp-Source: AGHT+IELXlZfIdw0RuAD1JY9Yn7d1evpLkgyhlQamNfyEMCkS/VP7srlA2A17TbDyWOsMYFbYDBIhQ==
X-Received: by 2002:a17:906:b3a1:b0:a1d:15ac:14fc with SMTP id uh33-20020a170906b3a100b00a1d15ac14fcmr6335287ejc.22.1704189108303;
        Tue, 02 Jan 2024 01:51:48 -0800 (PST)
From: Carlo Nonato <carlo.nonato@minervasys.tech>
To: xen-devel@lists.xenproject.org
Cc: Carlo Nonato <carlo.nonato@minervasys.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>,
	Marco Solieri <marco.solieri@minervasys.tech>
Subject: [PATCH v5 04/13] xen: extend domctl interface for cache coloring
Date: Tue,  2 Jan 2024 10:51:29 +0100
Message-Id: <20240102095138.17933-5-carlo.nonato@minervasys.tech>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
References: <20240102095138.17933-1-carlo.nonato@minervasys.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit updates the domctl interface to allow the user to set cache
coloring configurations from the toolstack.
It also implements the functionality for arm64.

Based on original work from: Luca Miccio <lucmiccio@gmail.com>

Signed-off-by: Carlo Nonato <carlo.nonato@minervasys.tech>
Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
---
v5:
- added a new hypercall to set colors
- uint for the guest handle
v4:
- updated XEN_DOMCTL_INTERFACE_VERSION
---
 xen/arch/arm/llc-coloring.c    | 17 +++++++++++++++++
 xen/common/domctl.c            | 11 +++++++++++
 xen/include/public/domctl.h    | 10 +++++++++-
 xen/include/xen/llc-coloring.h |  3 +++
 4 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/llc-coloring.c b/xen/arch/arm/llc-coloring.c
index 5ce58aba70..a08614ec36 100644
--- a/xen/arch/arm/llc-coloring.c
+++ b/xen/arch/arm/llc-coloring.c
@@ -9,6 +9,7 @@
  *    Carlo Nonato <carlo.nonato@minervasys.tech>
  */
 #include <xen/errno.h>
+#include <xen/guest_access.h>
 #include <xen/keyhandler.h>
 #include <xen/llc-coloring.h>
 #include <xen/param.h>
@@ -278,6 +279,22 @@ int dom0_set_llc_colors(struct domain *d)
     return domain_check_colors(d);
 }
 
+int domain_set_llc_colors_domctl(struct domain *d,
+                                 const struct xen_domctl_set_llc_colors *config)
+{
+    if ( d->num_llc_colors )
+        return -EEXIST;
+
+    if ( domain_alloc_colors(d, config->num_llc_colors) )
+        return -ENOMEM;
+
+    if ( copy_from_guest(d->llc_colors, config->llc_colors,
+                         config->num_llc_colors) )
+        return -EFAULT;
+
+    return domain_check_colors(d);
+}
+
 /*
  * Local variables:
  * mode: C
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
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index a33f9ec32b..2b12069294 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,7 +21,7 @@
 #include "hvm/save.h"
 #include "memory.h"
 
-#define XEN_DOMCTL_INTERFACE_VERSION 0x00000016
+#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
 
 /*
  * NB. xen_domctl.domain is an IN/OUT parameter for this operation.
@@ -1190,6 +1190,12 @@ struct xen_domctl_vmtrace_op {
 typedef struct xen_domctl_vmtrace_op xen_domctl_vmtrace_op_t;
 DEFINE_XEN_GUEST_HANDLE(xen_domctl_vmtrace_op_t);
 
+struct xen_domctl_set_llc_colors {
+    /* IN LLC coloring parameters */
+    unsigned int num_llc_colors;
+    XEN_GUEST_HANDLE_64(uint) llc_colors;
+};
+
 struct xen_domctl {
     uint32_t cmd;
 #define XEN_DOMCTL_createdomain                   1
@@ -1277,6 +1283,7 @@ struct xen_domctl {
 #define XEN_DOMCTL_vmtrace_op                    84
 #define XEN_DOMCTL_get_paging_mempool_size       85
 #define XEN_DOMCTL_set_paging_mempool_size       86
+#define XEN_DOMCTL_set_llc_colors                87
 #define XEN_DOMCTL_gdbsx_guestmemio            1000
 #define XEN_DOMCTL_gdbsx_pausevcpu             1001
 #define XEN_DOMCTL_gdbsx_unpausevcpu           1002
@@ -1339,6 +1346,7 @@ struct xen_domctl {
         struct xen_domctl_vuart_op          vuart_op;
         struct xen_domctl_vmtrace_op        vmtrace_op;
         struct xen_domctl_paging_mempool    paging_mempool;
+        struct xen_domctl_set_llc_colors    set_llc_colors;
         uint8_t                             pad[128];
     } u;
 };
diff --git a/xen/include/xen/llc-coloring.h b/xen/include/xen/llc-coloring.h
index cedd97d4b5..fa2edc8ad8 100644
--- a/xen/include/xen/llc-coloring.h
+++ b/xen/include/xen/llc-coloring.h
@@ -33,6 +33,9 @@ extern bool llc_coloring_enabled;
 void domain_llc_coloring_free(struct domain *d);
 void domain_dump_llc_colors(struct domain *d);
 
+int domain_set_llc_colors_domctl(struct domain *d,
+                                 const struct xen_domctl_set_llc_colors *config);
+
 #endif /* __COLORING_H__ */
 
 /*
-- 
2.34.1


