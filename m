Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4938B7611
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2024 14:47:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.714808.1116143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtP-0005QD-F0; Tue, 30 Apr 2024 12:47:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 714808.1116143; Tue, 30 Apr 2024 12:47:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s1mtP-0005Id-7S; Tue, 30 Apr 2024 12:47:31 +0000
Received: by outflank-mailman (input) for mailman id 714808;
 Tue, 30 Apr 2024 12:47:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OGtk=MD=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1s1mtN-0005B4-Qw
 for xen-devel@lists.xenproject.org; Tue, 30 Apr 2024 12:47:29 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd38ed5c-06ef-11ef-909b-e314d9c70b13;
 Tue, 30 Apr 2024 14:47:28 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-a587831809eso676291566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 30 Apr 2024 05:47:28 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 e14-20020a170906504e00b00a558014ab2csm14165324ejk.145.2024.04.30.05.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Apr 2024 05:47:27 -0700 (PDT)
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
X-Inumbo-ID: cd38ed5c-06ef-11ef-909b-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1714481247; x=1715086047; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9wz3B6+A8lhOeY7j5+k4dVHqDybst4sg6UIDJkawnmo=;
        b=IbnB0jASRMYRdb9IRHzJaIpgfteLF8PAoWBZcLNnGdqizogHUESjHJEisQ7mqusvlp
         toNJ31SXZwPpMX4hDRds0DAvQcLKDoznoGk6QLmCKGFBNK51zRpbZgXjBTW1aQ9AcaU8
         YrYAcP/KBEWgze2JOd1aS91Js6QfHkEHmpm9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714481247; x=1715086047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9wz3B6+A8lhOeY7j5+k4dVHqDybst4sg6UIDJkawnmo=;
        b=GITH2oHyGGnLqIwk+jiZsaOD6ORC1IBL1uG7VZffdAyWknQmlVGrbpRTx/TdaJuIVM
         k4OpFpmmPPL2ZqKj03fwRBYmw51E9DUgReS2mVkkselv3Se5jJSwYlb1HZk6/qjV9as/
         Axv8oTlQ3nepU50e4JSppgzmx8wPVOssR51GvNNNHTmB+G5SQlDEs2OS1WLCizQQ9sms
         iYwvMeY1h4UNN2BCSRQOtci3eLMIf9bGyQFORuq3k5DV//5B5GuiEvC/b2KLlAruOQGf
         J52mLkIFVrp1BEmpweTacv+PD2lJeSpYaucrm5yhGMp4bgwtRCt0b+m8aViLGAAq8qf6
         yarA==
X-Gm-Message-State: AOJu0YxWbpJ01csmS/wFEjCee5RkxRqnkB9qium3cluULBdzzxKqd4LE
	uI/WVy2aFFouhs9+U7yXwil4WXuKZ74HciSKBV5lwaZABppgdSMizx4yLJmwnTpyHzRGP6P8FLn
	N
X-Google-Smtp-Source: AGHT+IFT7PZwNx8GQNYXEBmUxl3prPSWZyeNF8iQMPJam7XqVplZbEjnynY9LtbJ7JXqxK+WUnqmhg==
X-Received: by 2002:a17:906:f20e:b0:a58:fabc:4a02 with SMTP id gt14-20020a170906f20e00b00a58fabc4a02mr5124437ejb.39.1714481247604;
        Tue, 30 Apr 2024 05:47:27 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 2/5] x86: Refactor microcode_update() hypercall with flags
Date: Tue, 30 Apr 2024 13:47:06 +0100
Message-ID: <20240430124709.865183-3-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240430124709.865183-1-fouad.hilly@cloud.com>
References: <20240430124709.865183-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor microcode_update() by adding a flags field.
struct xenpf_microcode_update2 added with uint32_t flags field.
Introduce XENPF_microcode_update2 hypercall to handle flags field.
Introduce ucode_force_flag to microcode_update_helper.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
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
 xen/arch/x86/cpu/microcode/core.c    | 15 ++++++++++++---
 xen/arch/x86/include/asm/microcode.h |  3 ++-
 xen/arch/x86/platform_hypercall.c    | 12 +++++++++++-
 xen/include/public/platform.h        | 14 ++++++++++++++
 4 files changed, 39 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index e738a88f5cd1..4a18ddd2683b 100644
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
@@ -580,6 +583,7 @@ static long cf_check microcode_update_helper(void *data)
     struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
     struct microcode_patch *patch;
+    bool ucode_force_flag = buffer->flags == XENPF_UCODE_FLAG_FORCE_SET;
 
     /* cpu_online_map must not change during update */
     if ( !get_cpu_maps() )
@@ -633,12 +637,12 @@ static long cf_check microcode_update_helper(void *data)
                                   microcode_cache);
 
         if ( result != NEW_UCODE &&
-             !(opt_ucode_allow_same && result == SAME_UCODE) )
+             !((opt_ucode_allow_same || ucode_force_flag) && result == SAME_UCODE) )
         {
             spin_unlock(&microcode_mutex);
             printk(XENLOG_WARNING
                    "microcode: couldn't find any newer%s revision in the provided blob!\n",
-                   opt_ucode_allow_same ? " (or the same)" : "");
+                   (opt_ucode_allow_same || ucode_force_flag) ? " (or the same)" : "");
             microcode_free_patch(patch);
             ret = -ENOENT;
 
@@ -708,11 +712,15 @@ static long cf_check microcode_update_helper(void *data)
     return ret;
 }
 
-int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
+int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
+                     unsigned long len, unsigned int flags)
 {
     int ret;
     struct ucode_buf *buffer;
 
+    if ( flags > 1 )
+        return -EINVAL;
+
     if ( len != (uint32_t)len )
         return -E2BIG;
 
@@ -730,6 +738,7 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
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
index 95467b88ab64..a22f2929896e 100644
--- a/xen/arch/x86/platform_hypercall.c
+++ b/xen/arch/x86/platform_hypercall.c
@@ -311,7 +311,17 @@ ret_t do_platform_op(
 
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
+        ret = microcode_update(data, op->u.microcode2.length, op->u.microcode2.flags);
         break;
     }
 
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 15777b541690..a30de7153779 100644
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
+/* Force to skip microcode version check when set */
+#define XENPF_UCODE_FLAG_FORCE_SET     1
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


