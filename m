Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3573997D3BE
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2024 11:37:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.801081.1211143 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4c-0001NN-UB; Fri, 20 Sep 2024 09:37:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 801081.1211143; Fri, 20 Sep 2024 09:37:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sra4c-0001La-Pt; Fri, 20 Sep 2024 09:37:10 +0000
Received: by outflank-mailman (input) for mailman id 801081;
 Fri, 20 Sep 2024 09:37:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Wh1w=QS=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1sra4b-0000OC-F2
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2024 09:37:09 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7a76c00-7733-11ef-a0b8-8be0dac302b0;
 Fri, 20 Sep 2024 11:37:08 +0200 (CEST)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a8d29b7edc2so225329366b.1
 for <xen-devel@lists.xenproject.org>; Fri, 20 Sep 2024 02:37:08 -0700 (PDT)
Received: from localhost ([213.195.124.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a90611164d0sm821123566b.91.2024.09.20.02.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Sep 2024 02:37:06 -0700 (PDT)
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
X-Inumbo-ID: e7a76c00-7733-11ef-a0b8-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1726825027; x=1727429827; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9pg/kWT3bx52nQ7VZiYhabzSdBQ5rhnkc3RGrpKCwI=;
        b=XWNnCq2DsvrsQTVnIoEzBF0SKgSVyCF4/XkSzDhU1/EI1WDMqZ6ho2Q5FP0df5O3RG
         QPl50R9LM4ex1UHiHbC+jK/xMrfojZHqr9z1lN6TmIGQg/Uq3AOTDy17mjnad059WYNj
         fdytylOv/LtyEpfo7lbM6TGLZ8FFhQK82CNsg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726825027; x=1727429827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9pg/kWT3bx52nQ7VZiYhabzSdBQ5rhnkc3RGrpKCwI=;
        b=L06zppi+aF9+GqvF+xtxNu+cQ9cAfA+IQ8tDGS9+oO5n83wrbL/6jaO9NeHZxUoFJZ
         BfRy9ajxpOf4OpmnxbeRaPrCNeZJb0cKY7qjqtS3A5XLtgDumTvfoKrLooRQL4z+RqL4
         C8hHpxfdlyImvFBdjJkPc9LE4XusDYSlZUF+sg1Mja9qcgpp7xdxAQ9x86AnRdqH4atO
         xvwwm/Eo2LTsS8XhhwazZH/k2h++3f4ex0RHNhWPFFtqRQkxS0hzSv4HiVm1KO/8J1ls
         ZKDfP+E7LuZMk1hlW6W7ZemgsQVZjR+/k+qGfcMx5UWLnjnwF8+PGZFlcogi0+/vNHTD
         Onmg==
X-Gm-Message-State: AOJu0Ywt3oElqer+ofiyEqh8pn7iS5ao0VT2VP3GLFOWBNmDwNV7SNNy
	A5qE9nefKoxTPwul6fx34xaXOUaGR7gxzAI+ZQKdZfaztZZD//Cg1Qv5FA+B+QHsF5V3MT316C0
	u
X-Google-Smtp-Source: AGHT+IG1bK95YeuNqzX+GZWxQqWHomjbSmSdaMNmK7x/G+C1kfv489w4B5E+dP+diNs0DECA4daBVg==
X-Received: by 2002:a17:907:7da1:b0:a86:9ba1:639e with SMTP id a640c23a62f3a-a90d5614d1bmr153475866b.26.1726825027291;
        Fri, 20 Sep 2024 02:37:07 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roge.rpau@citrix.com>
Subject: [PATCH 3/3] x86/alternatives: relax apply BUGs during runtime
Date: Fri, 20 Sep 2024 11:36:56 +0200
Message-ID: <20240920093656.48879-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240920093656.48879-1-roger.pau@citrix.com>
References: <20240920093656.48879-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

alternatives is used both at boot time, and when loading livepatch payloads.
While for the former it makes sense to panic, it's not useful for the later, as
for livepatches it's possible to fail to load the livepatch if alternatives
cannot be resolved and continue operating normally.

Relax the BUGs in _apply_alternatives() to instead return an error code if
alternatives are applied after boot.

Add a dummy livepatch test so the new logic can be assessed, with the change
applied the loading now fails with:

alt table ffff82d040602024 -> ffff82d040602032
livepatch: xen_alternatives_fail applying alternatives failed: -22

Signed-off-by: Roger Pau Monné <roge.rpau@citrix.com>
---
 xen/arch/x86/alternative.c                 | 29 ++++++++++++++++------
 xen/arch/x86/include/asm/alternative.h     |  3 ++-
 xen/common/livepatch.c                     | 10 +++++++-
 xen/test/livepatch/Makefile                |  5 ++++
 xen/test/livepatch/xen_alternatives_fail.c | 29 ++++++++++++++++++++++
 5 files changed, 66 insertions(+), 10 deletions(-)
 create mode 100644 xen/test/livepatch/xen_alternatives_fail.c

diff --git a/xen/arch/x86/alternative.c b/xen/arch/x86/alternative.c
index 7824053c9d33..c0912cb12ea5 100644
--- a/xen/arch/x86/alternative.c
+++ b/xen/arch/x86/alternative.c
@@ -174,10 +174,13 @@ extern void *const __initdata_cf_clobber_end[];
  * The caller will set the "force" argument to true for the final
  * invocation, such that no CALLs/JMPs to NULL pointers will be left
  * around. See also the further comment below.
+ *
+ * Note the function cannot fail if system_state < SYS_STATE_active, it would
+ * panic instead.  The return value is only meaningful for runtime usage.
  */
-static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
-                                                  struct alt_instr *end,
-                                                  bool force)
+static int init_or_livepatch _apply_alternatives(struct alt_instr *start,
+                                                 struct alt_instr *end,
+                                                 bool force)
 {
     struct alt_instr *a, *base;
 
@@ -198,9 +201,17 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
         uint8_t buf[MAX_PATCH_LEN];
         unsigned int total_len = a->orig_len + a->pad_len;
 
-        BUG_ON(a->repl_len > total_len);
-        BUG_ON(total_len > sizeof(buf));
-        BUG_ON(a->cpuid >= NCAPINTS * 32);
+#define BUG_ON_BOOT(cond)                                       \
+    if ( system_state < SYS_STATE_active )                      \
+        BUG_ON(cond);                                           \
+    else if ( cond )                                            \
+        return -EINVAL;
+
+        BUG_ON_BOOT(a->repl_len > total_len);
+        BUG_ON_BOOT(total_len > sizeof(buf));
+        BUG_ON_BOOT(a->cpuid >= NCAPINTS * 32);
+
+#undef BUG_ON_BOOT
 
         /*
          * Detect sequences of alt_instr's patching the same origin site, and
@@ -356,12 +367,14 @@ static void init_or_livepatch _apply_alternatives(struct alt_instr *start,
 
         printk("altcall: Optimised away %u endbr64 instructions\n", clobbered);
     }
+
+    return 0;
 }
 
 #ifdef CONFIG_LIVEPATCH
-void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
+int apply_alternatives(struct alt_instr *start, struct alt_instr *end)
 {
-    _apply_alternatives(start, end, true);
+    return _apply_alternatives(start, end, true);
 }
 #endif
 
diff --git a/xen/arch/x86/include/asm/alternative.h b/xen/arch/x86/include/asm/alternative.h
index a86eadfaecbd..83940e1849c6 100644
--- a/xen/arch/x86/include/asm/alternative.h
+++ b/xen/arch/x86/include/asm/alternative.h
@@ -24,7 +24,8 @@ struct __packed alt_instr {
 
 extern void add_nops(void *insns, unsigned int len);
 /* Similar to alternative_instructions except it can be run with IRQs enabled. */
-extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end);
+extern int __must_check apply_alternatives(struct alt_instr *start,
+                                           struct alt_instr *end);
 extern void alternative_instructions(void);
 extern void alternative_branches(void);
 
diff --git a/xen/common/livepatch.c b/xen/common/livepatch.c
index 3e4fce036a1c..1b3a9dda52a7 100644
--- a/xen/common/livepatch.c
+++ b/xen/common/livepatch.c
@@ -882,7 +882,15 @@ static int prepare_payload(struct payload *payload,
                 return -EINVAL;
             }
         }
-        apply_alternatives(start, end);
+
+        rc = apply_alternatives(start, end);
+        if ( rc )
+        {
+            printk(XENLOG_ERR LIVEPATCH "%s applying alternatives failed: %d\n",
+                   elf->name, rc);
+            return rc;
+        }
+
     alt_done:;
 #else
         printk(XENLOG_ERR LIVEPATCH "%s: We don't support alternative patching\n",
diff --git a/xen/test/livepatch/Makefile b/xen/test/livepatch/Makefile
index 4caa9e24324e..c29529b50338 100644
--- a/xen/test/livepatch/Makefile
+++ b/xen/test/livepatch/Makefile
@@ -125,6 +125,11 @@ $(obj)/xen_action_hooks_norevert.o: $(obj)/config.h
 extra-y += xen_action_hooks_norevert.livepatch
 xen_action_hooks_norevert-objs := xen_action_hooks_norevert.o xen_hello_world_func.o note.o xen_note.o
 
+$(obj)/xen_alternatives_fail.o: $(obj)/config.h
+
+extra-y += xen_alternatives_fail.livepatch
+xen_alternatives_fail-objs := xen_alternatives_fail.o note.o xen_note.o
+
 EXPECT_BYTES_COUNT := 8
 CODE_GET_EXPECT=$(shell $(OBJDUMP) -d --insn-width=1 $(1) | sed -n -e '/<'$(2)'>:$$/,/^$$/ p' | tail -n +2 | head -n $(EXPECT_BYTES_COUNT) | awk '{$$0=$$2; printf "%s", substr($$0,length-1)}' | sed 's/.\{2\}/0x&,/g' | sed 's/^/{/;s/,$$/}/g')
 $(obj)/expect_config.h: $(objtree)/xen-syms
diff --git a/xen/test/livepatch/xen_alternatives_fail.c b/xen/test/livepatch/xen_alternatives_fail.c
new file mode 100644
index 000000000000..01d289095a31
--- /dev/null
+++ b/xen/test/livepatch/xen_alternatives_fail.c
@@ -0,0 +1,29 @@
+/*
+ * Copyright (c) 2024 Cloud Software Group.
+ *
+ */
+
+#include "config.h"
+#include <xen/lib.h>
+#include <xen/livepatch_payload.h>
+
+#include <asm/alternative.h>
+#include <asm/cpuid.h>
+
+void test_alternatives(void)
+{
+    alternative("", "", NCAPINTS * 32);
+}
+
+/* Set a hook so the loading logic in Xen don't consider the payload empty. */
+LIVEPATCH_LOAD_HOOK(test_alternatives);
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * tab-width: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.46.0


