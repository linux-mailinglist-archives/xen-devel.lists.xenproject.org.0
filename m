Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6244D899C7D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Apr 2024 14:11:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701227.1095510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiPx-0007Xo-T2; Fri, 05 Apr 2024 12:11:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701227.1095510; Fri, 05 Apr 2024 12:11:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rsiPx-0007Si-Lx; Fri, 05 Apr 2024 12:11:37 +0000
Received: by outflank-mailman (input) for mailman id 701227;
 Fri, 05 Apr 2024 12:11:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Im47=LK=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rsiPw-0007Qe-K7
 for xen-devel@lists.xenproject.org; Fri, 05 Apr 2024 12:11:36 +0000
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [2a00:1450:4864:20::532])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a549315b-f345-11ee-a1ef-f123f15fe8a2;
 Fri, 05 Apr 2024 14:11:34 +0200 (CEST)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-56e1baf0380so2347475a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 05 Apr 2024 05:11:34 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 j13-20020a50ed0d000000b0056c4372c161sm729425eds.55.2024.04.05.05.11.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Apr 2024 05:11:32 -0700 (PDT)
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
X-Inumbo-ID: a549315b-f345-11ee-a1ef-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1712319093; x=1712923893; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jH3hIojWMAmkM0omSe+46fQQHwORwtgWu9bXbQQ2VU4=;
        b=eRJLiiVP0X78uIAv5WYl5lGIfjw8AmhEUvmgKFJLf9AjJkXjV8+ySCH5jAqp+lFNVY
         IHebFovBKAvizQRH/4FLf7y8jfyTxHQIrlZUnl0G65x13Vg5/otpZWszrf3gBDdXgowP
         2ql93WbnfI0Nxe9ti2MJTG451ATE2Tp0u1eAc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712319093; x=1712923893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jH3hIojWMAmkM0omSe+46fQQHwORwtgWu9bXbQQ2VU4=;
        b=kNlsuibq7ZjhosZxFTcgxcqCeISKRLinDcYivlvaCiWrPjFbIJ+cjszc1M5jtKDe9K
         hcnnQumfpE0X3Nk+cZCdEfaWH3tQ7tKkAYrzMq4H13RlvnQo3Xu8Gw2nq+tLXdWb/tks
         VPl4jpX/FORz05qWGCqMhochGHLQskYOhEZlQUPTPTJvHYz5E0SoNZv5NrkRYbW9ABoA
         KKW7v9MU4ApzCflN50oKU7lpgQUC8RV6RHQo1QIZ3nZ67aqZuBSdxbGJRVpAwpAU4dRY
         YsuHW6TJgE4uHhORh7rDYj6J4yy67Ir48xYSSsg6/+Z8PuSkg5l0KMx1z2GgQF4xcJtC
         P9Cg==
X-Gm-Message-State: AOJu0YwGkSbflKfEqSc527l2Yhm3v298RpfNGfPm4MHZUc4nhKnP9HRg
	f1mYGwzIsujWq8bQFAhELerfNrP/O7h7opTQHmJSnUXekb832d+JSJD3Me7bVssC1hJcDMEIiwN
	iyqc=
X-Google-Smtp-Source: AGHT+IH0csKcmkgnvtFRcZNTVldkebtKuJ51LsPs9hi50Wtq9geN7yu38eg312BRhcu2syiYA8krWw==
X-Received: by 2002:a50:8acc:0:b0:56b:9f7c:3c32 with SMTP id k12-20020a508acc000000b0056b9f7c3c32mr849563edk.12.1712319093482;
        Fri, 05 Apr 2024 05:11:33 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 2/5] x86: Refactor microcode_update() hypercall with flags field
Date: Fri,  5 Apr 2024 13:11:25 +0100
Message-ID: <20240405121128.260493-3-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240405121128.260493-1-fouad.hilly@cloud.com>
References: <20240405121128.260493-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor microcode_update() hypercall by adding flags field.
Introduce XENPF_microcode_update2 hypercall to handle flags field.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
 xen/arch/x86/cpu/microcode/core.c    | 12 +++++++++---
 xen/arch/x86/include/asm/microcode.h |  2 +-
 xen/arch/x86/platform_hypercall.c    | 12 +++++++++++-
 xen/include/public/platform.h        |  8 ++++++++
 4 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 1c9f66ea8a0f..f987b2bd632d 100644
--- a/xen/arch/x86/cpu/microcode/core.c
+++ b/xen/arch/x86/cpu/microcode/core.c
@@ -40,6 +40,8 @@
 #include <asm/processor.h>
 #include <asm/setup.h>
 
+#include <public/platform.h>
+
 #include "private.h"
 
 /*
@@ -100,6 +102,8 @@ static bool ucode_in_nmi = true;
 
 bool __read_mostly opt_ucode_allow_same;
 
+bool ucode_force_flag;
+
 /* Protected by microcode_mutex */
 static struct microcode_patch *microcode_cache;
 
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
 
@@ -708,11 +712,13 @@ static long cf_check microcode_update_helper(void *data)
     return ret;
 }
 
-int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
+int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags)
 {
     int ret;
     struct ucode_buf *buffer;
 
+    ucode_force_flag = (flags == XENPF_UCODE_FLAG_FORCE_SET)? 1: 0;
+
     if ( len != (uint32_t)len )
         return -E2BIG;
 
diff --git a/xen/arch/x86/include/asm/microcode.h b/xen/arch/x86/include/asm/microcode.h
index 8f59b20b0289..bcba356b4134 100644
--- a/xen/arch/x86/include/asm/microcode.h
+++ b/xen/arch/x86/include/asm/microcode.h
@@ -22,7 +22,7 @@ struct cpu_signature {
 DECLARE_PER_CPU(struct cpu_signature, cpu_sig);
 
 void microcode_set_module(unsigned int idx);
-int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len);
+int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len, unsigned int flags);
 int early_microcode_init(unsigned long *module_map,
                          const struct multiboot_info *mbi);
 int microcode_init_cache(unsigned long *module_map,
diff --git a/xen/arch/x86/platform_hypercall.c b/xen/arch/x86/platform_hypercall.c
index 95467b88ab64..3b29ede8b316 100644
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
+        guest_from_compat_handle(data, op->u.microcode.data);
+
+        ret = microcode_update(data, op->u.microcode.length, op->u.microcode.flags);
         break;
     }
 
diff --git a/xen/include/public/platform.h b/xen/include/public/platform.h
index 15777b541690..31e59ba3d07b 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -99,6 +99,10 @@ struct xenpf_microcode_update {
     /* IN variables. */
     XEN_GUEST_HANDLE(const_void) data;/* Pointer to microcode data */
     uint32_t length;                  /* Length of microcode data. */
+    uint32_t flags;                   /* Flags to be passed with ucode. */
+/* Force to skip microcode version check when set */
+#define XENPF_UCODE_FLAG_FORCE_NOT_SET 0
+#define XENPF_UCODE_FLAG_FORCE_SET     1
 };
 typedef struct xenpf_microcode_update xenpf_microcode_update_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_microcode_update_t);
@@ -624,6 +628,10 @@ struct xenpf_ucode_revision {
 typedef struct xenpf_ucode_revision xenpf_ucode_revision_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_ucode_revision_t);
 
+/* Hypercall to microcode_update with flags */
+#define XENPF_microcode_update2    66
+
+
 /*
  * ` enum neg_errnoval
  * ` HYPERVISOR_platform_op(const struct xen_platform_op*);
-- 
2.42.0


