Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9549A9CDDD2
	for <lists+xen-devel@lfdr.de>; Fri, 15 Nov 2024 12:53:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.837181.1253215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut3-0000jr-2s; Fri, 15 Nov 2024 11:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 837181.1253215; Fri, 15 Nov 2024 11:53:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tBut2-0000eC-E1; Fri, 15 Nov 2024 11:53:16 +0000
Received: by outflank-mailman (input) for mailman id 837181;
 Fri, 15 Nov 2024 11:53:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Akm3=SK=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1tBusy-0005U9-St
 for xen-devel@lists.xenproject.org; Fri, 15 Nov 2024 11:53:12 +0000
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [2a00:1450:4864:20::634])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2efe3c0a-a348-11ef-99a3-01e77a169b0f;
 Fri, 15 Nov 2024 12:53:09 +0100 (CET)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-a9a68480164so223660666b.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Nov 2024 03:53:09 -0800 (PST)
Received: from localhost.localdomain (0545937c.skybroadband.com.
 [5.69.147.124]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aa20e0860afsm173492766b.188.2024.11.15.03.53.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 03:53:08 -0800 (PST)
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
X-Inumbo-ID: 2efe3c0a-a348-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjo2MzQiLCJoZWxvIjoibWFpbC1lajEteDYzNC5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjJlZmUzYzBhLWEzNDgtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxNjcxNTg5LjUwMTUyMiwic2VuZGVyIjoiYWxlamFuZHJvLnZhbGxlam9AY2xvdWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1731671588; x=1732276388; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GrIHjPwvtOnEhff76Ju8/6PKjtLppyVwNCD/uVKVYE8=;
        b=fKOsiw+rO5IC6+bPaugvZJ5qJVCnT+LEps7fKjVr/aDb1QF4bYb9ymhf07rRgpbrNJ
         0n3q6kk8NqxKb3nx/0M/6tJatp8+L5UOGI4JK3XQNKZJjOYEvZF2sl4SsA0WAk8j5gxR
         kHUK2yUshZYV1h1goSi6CKrBPzU/j0JeIsKXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731671588; x=1732276388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GrIHjPwvtOnEhff76Ju8/6PKjtLppyVwNCD/uVKVYE8=;
        b=cyEB+QFj0YvuHLCqP/ATiOcXZ4p9KSUWUugE3Co3UAAbC12lCfezZCSFFR5ritSutj
         2DKXVieK5+sIYljHF7YBzqhxEZQTufj8ns9GaBC1CznOcaDnP2UCp/IY9s9EmxdbWf7O
         skzJwdZNz7Up61J0QPFdBupaD3S8zvatTFiVH4njs91ovrmIYSU/AKojC39bH3fvcpYy
         xdYMOMbrhxIOB7voUJTWHVVd4dK4xCZdGcwjFidEgnGTRXRx9sKukRXHKr3QoaKDQR6b
         9qtnFbfOUhDlAJJqlvWx+QOQyomJz2gFjc2z5dKyaA7U7vFDbo/coVpQGfWZrFT1t1cz
         WIqg==
X-Gm-Message-State: AOJu0YwFpW1hSjf9bHPGpi/fFPS3sgJHQsj25wpbGLnWfc0qILHxhPm8
	h5+UhNJ/ZWQIHDWSqj6cimGrW5iGYCz0HcuHQzo+FiI7ngcDLT+4r2qXtkPElSqnoxcMqXlir69
	U
X-Google-Smtp-Source: AGHT+IEX15jlu4tYQg3JcLosn63SAFy8FOsWQhMW7RzMOpxh14W+k1b5IUPSYiyNyuPeP2WSUad3HA==
X-Received: by 2002:a17:907:2dac:b0:a9a:ad8:fc56 with SMTP id a640c23a62f3a-aa483529cb4mr212134566b.44.1731671588564;
        Fri, 15 Nov 2024 03:53:08 -0800 (PST)
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
To: xen-devel@lists.xenproject.org
Cc: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: [RFC PATCH 13/25] xen: Replace hand-crafted altp2m_mode descriptions with autogenerated ones
Date: Fri, 15 Nov 2024 11:51:42 +0000
Message-ID: <20241115115200.2824-14-alejandro.vallejo@cloud.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
References: <20241115115200.2824-1-alejandro.vallejo@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
---
 tools/libs/light/libxl_create.c               |  8 +++----
 .../xenbindgen/extra/domctl/createdomain.toml | 24 +++++++++++++++++++
 xen/arch/x86/hvm/hvm.c                        |  8 +++----
 xen/include/public/autogen/domctl.h           | 22 +++++++++++++++++
 xen/include/public/domctl.h                   | 18 +++-----------
 5 files changed, 57 insertions(+), 23 deletions(-)
 create mode 100644 tools/rust/xenbindgen/extra/domctl/createdomain.toml
 create mode 100644 xen/include/public/autogen/domctl.h

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 3ae922e8931b..791b0fac0601 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -676,19 +676,19 @@ int libxl__domain_make(libxl__gc *gc, libxl_domain_config *d_config,
         LOG(DETAIL, "altp2m: %s", libxl_altp2m_mode_to_string(b_info->altp2m));
         switch(b_info->altp2m) {
         case LIBXL_ALTP2M_MODE_MIXED:
-            create.altp2m_mode = XEN_DOMCTL_ALTP2M_mixed;
+            create.altp2m_mode = XEN_DOMCTL_ALTP2M_MODE_MIXED;
             break;
 
         case LIBXL_ALTP2M_MODE_EXTERNAL:
-            create.altp2m_mode = XEN_DOMCTL_ALTP2M_external;
+            create.altp2m_mode = XEN_DOMCTL_ALTP2M_MODE_EXTERNAL;
             break;
 
         case LIBXL_ALTP2M_MODE_LIMITED:
-            create.altp2m_mode = XEN_DOMCTL_ALTP2M_limited;
+            create.altp2m_mode = XEN_DOMCTL_ALTP2M_MODE_LIMITED;
             break;
 
         case LIBXL_ALTP2M_MODE_DISABLED:
-            create.altp2m_mode = XEN_DOMCTL_ALTP2M_disabled;
+            create.altp2m_mode = XEN_DOMCTL_ALTP2M_MODE_DISABLED;
             break;
         }
 
diff --git a/tools/rust/xenbindgen/extra/domctl/createdomain.toml b/tools/rust/xenbindgen/extra/domctl/createdomain.toml
new file mode 100644
index 000000000000..097dc202f352
--- /dev/null
+++ b/tools/rust/xenbindgen/extra/domctl/createdomain.toml
@@ -0,0 +1,24 @@
+[[enums]]
+name = "xen_domctl_altp2m_mode"
+description = "Content of the `altp2m_mode` field of the domain creation hypercall."
+typ = { tag = "u8" }
+
+[[enums.variants]]
+name = "disabled"
+description = "Keep altp2m disabled"
+value = 0
+
+[[enums.variants]]
+name = "mixed"
+description = "Use mixed-mode for the altp2m (not yet evaluated for safety)."
+value = 1
+
+[[enums.variants]]
+name = "external"
+description = "Use external mode for the altp2m."
+value = 2
+
+[[enums.variants]]
+name = "limited"
+description = "Use limited mode for the altp2m."
+value = 3
diff --git a/xen/arch/x86/hvm/hvm.c b/xen/arch/x86/hvm/hvm.c
index e30c3026479e..35caf6131190 100644
--- a/xen/arch/x86/hvm/hvm.c
+++ b/xen/arch/x86/hvm/hvm.c
@@ -661,19 +661,19 @@ int hvm_domain_initialise(struct domain *d,
     /* Set altp2m based on domctl flags. */
     switch ( config->altp2m_mode )
     {
-    case XEN_DOMCTL_ALTP2M_mixed:
+    case XEN_DOMCTL_ALTP2M_MODE_MIXED:
         d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_mixed;
         break;
 
-    case XEN_DOMCTL_ALTP2M_external:
+    case XEN_DOMCTL_ALTP2M_MODE_EXTERNAL:
         d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_external;
         break;
 
-    case XEN_DOMCTL_ALTP2M_limited:
+    case XEN_DOMCTL_ALTP2M_MODE_LIMITED:
         d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_limited;
         break;
 
-    case XEN_DOMCTL_ALTP2M_disabled:
+    case XEN_DOMCTL_ALTP2M_MODE_DISABLED:
         d->arch.hvm.params[HVM_PARAM_ALTP2M] = XEN_ALTP2M_disabled;
         break;
     }
diff --git a/xen/include/public/autogen/domctl.h b/xen/include/public/autogen/domctl.h
new file mode 100644
index 000000000000..00202f5e65b9
--- /dev/null
+++ b/xen/include/public/autogen/domctl.h
@@ -0,0 +1,22 @@
+/*
+ * domctl
+ *
+ * AUTOGENERATED. DO NOT MODIFY
+ */
+#ifndef __XEN_AUTOGEN_DOMCTL_H
+#define __XEN_AUTOGEN_DOMCTL_H
+
+/* Content of the `altp2m_mode` field of the domain creation hypercall. */
+enum xen_domctl_altp2m_mode {
+    /* Keep altp2m disabled */
+    XEN_DOMCTL_ALTP2M_MODE_DISABLED = 0,
+    /* Use mixed-mode for the altp2m (not yet evaluated for safety). */
+    XEN_DOMCTL_ALTP2M_MODE_MIXED = 1,
+    /* Use external mode for the altp2m. */
+    XEN_DOMCTL_ALTP2M_MODE_EXTERNAL = 2,
+    /* Use limited mode for the altp2m. */
+    XEN_DOMCTL_ALTP2M_MODE_LIMITED = 3,
+};
+
+#endif /* __XEN_AUTOGEN_DOMCTL_H */
+
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index 95a3b6769f7f..95d62c859302 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -21,6 +21,8 @@
 #include "hvm/save.h"
 #include "memory.h"
 
+#include "autogen/domctl.h"
+
 /*
  * The interface version needs to be incremented by 1 in case the interface
  * is modified in an incompatible way AND if the version hasn't been
@@ -103,21 +105,7 @@ struct xen_domctl_createdomain {
     /* Unused. Reserved to zero. */
     uint8_t rsvd0_a[3];
 
-/* Keep altp2m disabled */
-#define XEN_DOMCTL_ALTP2M_disabled   (0U)
-/*
- * Enable altp2m mixed mode.
- *
- * Note that 'mixed' mode has not been evaluated for safety from a security
- * perspective.  Before using this mode in a security-critical environment,
- * each subop should be evaluated for safety, with unsafe subops blacklisted in
- * XSM.
- */
-#define XEN_DOMCTL_ALTP2M_mixed      (1U)
-/* Enable altp2m external mode. */
-#define XEN_DOMCTL_ALTP2M_external   (2U)
-/* Enable altp2m limited mode. */
-#define XEN_DOMCTL_ALTP2M_limited    (3U)
+    /* See xen_domctl_altp2m_mode */
     uint8_t altp2m_mode;
 
     /* Unused. Reserved to zero. */
-- 
2.47.0


