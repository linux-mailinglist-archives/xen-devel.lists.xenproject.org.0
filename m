Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 748648A66D9
	for <lists+xen-devel@lfdr.de>; Tue, 16 Apr 2024 11:16:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.706796.1104188 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevA-0000zl-PI; Tue, 16 Apr 2024 09:16:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 706796.1104188; Tue, 16 Apr 2024 09:16:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rwevA-0000xW-Ll; Tue, 16 Apr 2024 09:16:08 +0000
Received: by outflank-mailman (input) for mailman id 706796;
 Tue, 16 Apr 2024 09:16:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qw+g=LV=cloud.com=fouad.hilly@srs-se1.protection.inumbo.net>)
 id 1rwev9-0000j0-DM
 for xen-devel@lists.xenproject.org; Tue, 16 Apr 2024 09:16:07 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4a4db3f-fbd1-11ee-b909-491648fe20b8;
 Tue, 16 Apr 2024 11:16:06 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-a526a200879so259444566b.1
 for <xen-devel@lists.xenproject.org>; Tue, 16 Apr 2024 02:16:06 -0700 (PDT)
Received: from fhilly.citrite.net (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 u2-20020a17090657c200b00a524476aac9sm4654723ejr.108.2024.04.16.02.16.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 02:16:05 -0700 (PDT)
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
X-Inumbo-ID: f4a4db3f-fbd1-11ee-b909-491648fe20b8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1713258965; x=1713863765; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JYgU5u131JTGNDKaVXDUtjVdH+AOMW24dDk4iz+IAQ=;
        b=BzYa4uWHuv2Zvez4tzfhdDI/KoMiyVC6rj2YpR1zB1V6o7MQaEHqTGeHINqH32Zq1w
         /9PYScTREX0D+fqhd0bjRAGUzPCCFTF/pKUnueI4i4cSgtSG7r1BDQOGCYBiZNQR/xHR
         ysZ8aA71P81R79L7RSdNaF4zRJWD9T2NOtMCk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713258965; x=1713863765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5JYgU5u131JTGNDKaVXDUtjVdH+AOMW24dDk4iz+IAQ=;
        b=f2BX9A74SeYKemXzAmQuC3/t6lWwEab6aIgmQyhExTmESIebEk4SDYKugmEHC1Rvz5
         L7Mf8asg+Dksvg6zxmEVptvbA6jzlbS2wvzXHPoh4v948BSGQbvM8ew1vFxBjq/ddy7E
         AxeXb+nos26IzJh9T4WslNoSzuna/2NvqkH9RY5SVSgP/6+3dgMPzb1V9hLge3Y7e86m
         zEC0TRQKZ/YSgLsHGESfO73XyRSrGHEKQ+kdQFMQQGJfZsqHRVlXYftoKo1yjE+Lnz+w
         +BBJv6rpKvDDVL52goRPEyrMpDUEpkbiGNKk0MdhFLacxpU6qO7yWlO5jdYXhzADPlWx
         bffQ==
X-Gm-Message-State: AOJu0YwYDuTrf69LNg7Kt5RsPFUx1G8amvC0hLH9Bm4YOrRUQleriE0J
	+uOFhznHnligavd+ywBZon22dIvGyEhA3C9JSJjoTZx/I6pDar73XnsBGsgMwJBE+OGkqG8s4QM
	q
X-Google-Smtp-Source: AGHT+IHxM5DeAYgkZJbDRrxtvBfaz5fjtIiGJp51U0h7y+qo192KWoRi01Ube2KEpZZGxGO6bm3fPA==
X-Received: by 2002:a17:906:aed4:b0:a52:6a31:a9f2 with SMTP id me20-20020a170906aed400b00a526a31a9f2mr3136041ejb.70.1713258965596;
        Tue, 16 Apr 2024 02:16:05 -0700 (PDT)
From: Fouad Hilly <fouad.hilly@cloud.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Fouad Hilly <fouad.hilly@cloud.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 2/5] x86: Refactor microcode_update() hypercall with flags
Date: Tue, 16 Apr 2024 10:15:43 +0100
Message-ID: <20240416091546.11622-3-fouad.hilly@cloud.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240416091546.11622-1-fouad.hilly@cloud.com>
References: <20240416091546.11622-1-fouad.hilly@cloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor microcode_update() hypercall by adding flags field.
Introduce XENPF_microcode_update2 hypercall to handle flags field.
struct xenpf_microcode_update updated to have uint32_t flags at
the end of the sturcture.

[v2]
1- Update message description to highlight interface change.
2- Removed extra empty lines.
3- removed unnecessary define.
4- Corrected long lines.
5- Removed ternary operator.
6- Introduced static ucode_update_flags, which will be used later to determine local ucode_force_flag.

Signed-off-by: Fouad Hilly <fouad.hilly@cloud.com>
---
 xen/arch/x86/cpu/microcode/core.c    | 14 +++++++++++---
 xen/arch/x86/include/asm/microcode.h |  3 ++-
 xen/arch/x86/platform_hypercall.c    | 12 +++++++++++-
 xen/include/public/platform.h        |  6 ++++++
 4 files changed, 30 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/cpu/microcode/core.c b/xen/arch/x86/cpu/microcode/core.c
index 1c9f66ea8a0f..99b651d8c3a1 100644
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
 
+static unsigned int ucode_update_flags = 0;
+
 /* Protected by microcode_mutex */
 static struct microcode_patch *microcode_cache;
 
@@ -580,6 +584,7 @@ static long cf_check microcode_update_helper(void *data)
     struct ucode_buf *buffer = data;
     unsigned int cpu, updated;
     struct microcode_patch *patch;
+    bool ucode_force_flag = ucode_update_flags == XENPF_UCODE_FLAG_FORCE_SET;
 
     /* cpu_online_map must not change during update */
     if ( !get_cpu_maps() )
@@ -633,12 +638,12 @@ static long cf_check microcode_update_helper(void *data)
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
 
@@ -708,7 +713,8 @@ static long cf_check microcode_update_helper(void *data)
     return ret;
 }
 
-int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
+int microcode_update(XEN_GUEST_HANDLE(const_void) buf,
+                     unsigned long len, unsigned int flags)
 {
     int ret;
     struct ucode_buf *buffer;
@@ -731,6 +737,8 @@ int microcode_update(XEN_GUEST_HANDLE(const_void) buf, unsigned long len)
     }
     buffer->len = len;
 
+    ucode_update_flags = flags;
+
     /*
      * Always queue microcode_update_helper() on CPU0.  Most of the logic
      * won't care, but the update of the Raw CPU policy wants to (re)run on
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
index 15777b541690..cc19b2956b46 100644
--- a/xen/include/public/platform.h
+++ b/xen/include/public/platform.h
@@ -99,6 +99,9 @@ struct xenpf_microcode_update {
     /* IN variables. */
     XEN_GUEST_HANDLE(const_void) data;/* Pointer to microcode data */
     uint32_t length;                  /* Length of microcode data. */
+    uint32_t flags;                   /* Flags to be passed with ucode. */
+/* Force to skip microcode version check when set */
+#define XENPF_UCODE_FLAG_FORCE_SET     1
 };
 typedef struct xenpf_microcode_update xenpf_microcode_update_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_microcode_update_t);
@@ -624,6 +627,9 @@ struct xenpf_ucode_revision {
 typedef struct xenpf_ucode_revision xenpf_ucode_revision_t;
 DEFINE_XEN_GUEST_HANDLE(xenpf_ucode_revision_t);
 
+/* Hypercall to microcode_update with flags */
+#define XENPF_microcode_update2    66
+
 /*
  * ` enum neg_errnoval
  * ` HYPERVISOR_platform_op(const struct xen_platform_op*);
-- 
2.42.0


