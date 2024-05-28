Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC918D2064
	for <lists+xen-devel@lfdr.de>; Tue, 28 May 2024 17:30:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731195.1136568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymC-0001JZ-Bc; Tue, 28 May 2024 15:30:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731195.1136568; Tue, 28 May 2024 15:30:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBymC-0001FH-71; Tue, 28 May 2024 15:30:12 +0000
Received: by outflank-mailman (input) for mailman id 731195;
 Tue, 28 May 2024 15:30:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5inG=M7=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1sBymB-00018F-6L
 for xen-devel@lists.xenproject.org; Tue, 28 May 2024 15:30:11 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2accabe2-1d07-11ef-90a1-e314d9c70b13;
 Tue, 28 May 2024 17:30:09 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-a6341cf2c99so98851466b.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 08:30:09 -0700 (PDT)
Received: from fhilly.citrite.net ([160.101.139.1])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c937444sm621673366b.61.2024.05.28.08.30.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 May 2024 08:30:08 -0700 (PDT)
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
X-Inumbo-ID: 2accabe2-1d07-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716910208; x=1717515008; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bJX73ZmntNKRAs0BEZRhybEqHcJwu5VuVHE4B8+pY60=;
        b=jsH+tYRG95sELT8cWmsfGHEKCkPHYDNU3TW66Xhd9e98bau26M3lUVmgGOsC5GKd5m
         iLneUP35aqUVOdJkUOawonZiMCtloe9/+7D1B/kwKdD+flGQ50Ft56fS61TkqKFajSOA
         7vSqM+qFtDmfgQMqZ3KwmBHMP5KWaoDy4cNQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716910208; x=1717515008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bJX73ZmntNKRAs0BEZRhybEqHcJwu5VuVHE4B8+pY60=;
        b=Eh4PuwG0b4G7cGw3bmb766wb1N6DFYSygO5MnYEVKbB/BXNIrWGIPYo2PnK6PPTMV0
         ZfILHwDUmZR8MGxlAqvYPIPoJUBIawN2xwlM56ffgGUV7tFr1SkpD38KXAl8FVrvpEXk
         5sdY3XPhuQnXU+S0IYZyJvDSjg7aFBl47QQJNmJLOgJ3uc82MCwc2BTyd+DmZhUvyaWB
         T5ZV1wb51zOfngWOSVX5Dyw48yQC+MQ78KzNkuhCWd7hLmaNWj0OGO6tDs9+D9FptV6M
         OOLcKBzlOjpHlRx6frUUoW5KDN2wAzyOYYt4gN9cMVaHBczBI8Js1IzOJVmvlUNOKDYa
         QkgA==
X-Gm-Message-State: AOJu0Yx87t1DNWHPTAp4KSCxodswAWOx/5HE0Q4V+SsmTbJ4m55P9sSx
	9yl7pH/UcdORY25+lupDdXO5nIVd2RGFjNk32ofg9QyP7g9wxE9OrV+CM6w4yWxJc7YoIYSyElX
	9U48=
X-Google-Smtp-Source: AGHT+IHzLvVpGVHVUdhsRJaFBLhxIExE5P2Hb13QIBulTEa2VIkMdvPfsb8s3kG1g7MR5q0a2ZRzUg==
X-Received: by 2002:a17:906:3741:b0:a5a:1f4f:cb4c with SMTP id a640c23a62f3a-a62641b4532mr886848066b.7.1716910208404;
        Tue, 28 May 2024 08:30:08 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 1/4] x86/ucode: Introduce PF_microcode_update2 with flags parameter
Date: Tue, 28 May 2024 16:29:40 +0100
Message-ID: <20240528152943.3915760-2-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240528152943.3915760-1-fouad.hilly@cloud.com>
References: <20240528152943.3915760-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor microcode_update() by adding flags field.
struct xenpf_microcode_update2 added with uint32_t flags field.
Introduce XENPF_microcode_update2 hypercall with flags field.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
[v4]
1- Commit message and description updated.
2- Changing the order of the patches.
[v3]
1- Updated Commit message description.
2- Revereted changes to a stable ABI and introduced a new struct.
3- ucode_force_flag updated from static to a local variable.
4- microcode_update() updated to reject unsupported flags yet.

[v2]
1- Update message description to highlight interface change.
2- Removed extra empty lines.
3- removed unnecessary define.
4- Corrected long lines.
5- Removed ternary operator.
6- Introduced static ucode_update_flags, which will be used later to determine local ucode_force_flag.
---
 xen/arch/x86/cpu/microcode/core.c    | 11 ++++++++---
 xen/arch/x86/include/asm/microcode.h |  3 ++-
 xen/arch/x86/platform_hypercall.c    | 13 ++++++++++++-
 xen/include/public/platform.h        | 14 ++++++++++++++
 4 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index e90055772acf..8a9e744489b9 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -40,6 +40,8 @@
 #include <asm/processor.h>
 #include <asm/setup.h>
 
+#include <public/platform.h>
+
 #include "private.h"
 
 /*
@@ -570,6 +572,7 @@ static int cf_check do_microcode_update(void *patch)
 }
 
 struct ucode_buf {
+    unsigned int flags;
     unsigned int len;
     char buffer[];
 };
@@ -708,13 +711,14 @@ static long cf_check microcode_update_helper(void *data)
     return ret;
 }
 
-int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
+int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
+                     unsigned long len, unsigned int flags)
 {
     int ret;
     struct ucode_buf *buffer;
 
-    if ( len != (uint32_t)len )
-        return -E2BIG;
+    if ( flags & ~XENPF_UCODE_FORCE )
+        return -EINVAL;
 
     if ( !ucode_ops.apply_microcode )
         return -EINVAL;
@@ -730,6 +734,7 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
         return -EFAULT;
     }
     buffer->len = len;
+    buffer->flags = flags;
 
     /*
      * Always queue microcode_update_helper() on CPU0.  Most of the logic
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 8f59b20b0289..57c08205d475 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -22,7 +22,8 @@ struct cpu_signature {
 DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 
 void microcode_set_module(unsigned int idx);
-int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len);
+int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
+                     unsigned long len, unsigned int flags);
 int early_microcode_init(unsigned long *module_map,
                          const struct multiboot_info *mbi);
 int microcode_init_cache(unsigned long *module_map,
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 95467b88ab64..7e3278109300 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -311,7 +311,18 @@ ret_t do_platform_op(
 
         guest_from_compat_handle(data, op->u.microcode.data);
 
-        ret = microcode_update(data, op->u.microcode.length);
+        ret = microcode_update(data, op->u.microcode.length, 0);
+        break;
+    }
+
+    case XENPF_microcode_update2:
+    {
+        XEN_GUEST_HANDLE(const_void) data;
+
+        guest_from_compat_handle(data, op->u.microcode2.data);
+
+        ret = microcode_update(data, op->u.microcode2.length,
+                               op->u.microcode2.flags);
         break;
     }
 
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 15777b541690..2725b8d1044f 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -624,6 +624,19 @@ struct xenpf_ucode_revision {
 typedef struct xenpf_ucode_revision xenpf_ucode_revision_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_ucode_revision_t);
 
+/* Hypercall to microcode_update with flags */
+#define XENPF_microcode_update2    66
+struct xenpf_microcode_update2 {
+    /* IN variables. */
+    uint32_t flags;                   /* Flags to be passed with ucode. */
+/* Force to skip microcode version check */
+#define XENPF_UCODE_FORCE           1
+    uint32_t length;                  /* Length of microcode data. */
+    XEN_GUEST_HANDLE(const_void) data;/* Pointer to microcode data */
+};
+typedef struct xenpf_microcode_update2 xenpf_microcode_update2_t;
+DEFINE_XEN_GUEST_HANDLE(xenpf_microcode_update2_t);
+
 /*
  * ` enum neg_errnoval
  * ` HYPERVISOR_platform_op(const struct xen_platform_op*);
@@ -656,6 +669,7 @@ struct xen_platform_op {
         xenpf_symdata_t               symdata;
         xenpf_dom0_console_t          dom0_console;
         xenpf_ucode_revision_t        ucode_revision;
+        xenpf_microcode_update2_t     microcode2;
         uint8_t                       pad[128];
     } u;
 };
-- 
2.42.0


