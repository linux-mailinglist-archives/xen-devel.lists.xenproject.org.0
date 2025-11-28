Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD7CC93194
	for <lists+xen-devel@lfdr.de>; Fri, 28 Nov 2025 21:20:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1175123.1500047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP4wb-0003xD-HB; Fri, 28 Nov 2025 20:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1175123.1500047; Fri, 28 Nov 2025 20:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vP4wb-0003qL-7H; Fri, 28 Nov 2025 20:19:53 +0000
Received: by outflank-mailman (input) for mailman id 1175123;
 Fri, 28 Nov 2025 20:19:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61/n=6E=citrix.com=andrew.cooper3@srs-se1.protection.inumbo.net>)
 id 1vP4wZ-0003fj-5o
 for xen-devel@lists.xenproject.org; Fri, 28 Nov 2025 20:19:51 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 95c00832-cc97-11f0-980a-7dc792cee155;
 Fri, 28 Nov 2025 21:19:47 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-47796a837c7so14791295e9.0
 for <xen-devel@lists.xenproject.org>; Fri, 28 Nov 2025 12:19:47 -0800 (PST)
Received: from localhost.localdomain (host-92-29-237-183.as13285.net.
 [92.29.237.183]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-479052ec685sm98201245e9.6.2025.11.28.12.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Nov 2025 12:19:45 -0800 (PST)
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
X-Inumbo-ID: 95c00832-cc97-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1764361187; x=1764965987; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qQpt1luuOqoD50sau1mPzz7mAyMLD1xHkGk2por5HTg=;
        b=jhTiH1EzNrfUrQn5D497CjviK6+EFf1B0h2gK56icAaMKZ5dF2v/YBiodyZR6rTvIj
         jTpIdPVlNPng9vAsJ70e5RBmp8bvN5QZPsAkM8kNMWcRHRPta5ZBOAzk44mynEUkeuAM
         +2jbdAZb+gH3CpWUTwZ7LeCbrgWYBpBGd7C7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764361187; x=1764965987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qQpt1luuOqoD50sau1mPzz7mAyMLD1xHkGk2por5HTg=;
        b=ROiInP0gmyXC0gyA8KqThxi0yH44mZ/ecSF9+It1kfo8QDNKWYglSxdzTj9fqTLXpX
         5yWmJ7V7o3WZQMe6eUN03qnO+XHiGOs5cDSYhlZYW+GjyoGN3obnIC2tIAPkqobAsDxt
         VDKhdFnXddDSCrcfz1FHPqPff5qdFECVgfTdX8I/Y4ZQlgMI1zJCg5u6W1X3u9fHZy2X
         l9akpZ3c1gt6rlfhgxWP2Mhj00cjgl5B8Q+Ud0jwD8sC7tU84o33gzFFPo1u4nXUTRco
         E2QdZOXlpkHiBIn10JHLEygPkhx57i5D8yRxMBXG7Ggn6dDS5t8Sa/qAburNCOCuu7vy
         ArrQ==
X-Gm-Message-State: AOJu0YyesldtMjwoHDsJZvRUIipQMZycECjxUltTe7kE1YoVGwBKvQIZ
	cOMeV30U00lMnta+BdSmqghBDdqpNLJLQ490XB4IVVQhBE7kQTueO/WLT/O+sZRCgiFjR+uAx/z
	yyBTS
X-Gm-Gg: ASbGncvNXmu+/0MoGhIaJnPzFLSoEc2vIbImM+hjDvG8JllYVNOday11uZ9uNCfo4FV
	wucLaRglGxSMJhtlCLxNom0SwCJnG0+lmC0QH3CHaeACivD9AT8olFCUrFyRAIV97dRIAzTzMdQ
	2c6Jf93RD9jq1gL8ThJ2pQa6zLmRvhRiqAUpwIy/JwPEP+718dy3GoXHJDRnwQL5YphpKldJKiR
	mPG6stwQFg7CB/45aR1Su/XQRGl29c6vLQU0rP+c5nWVJonmpTYTUDSulecuhWgCJiHI98iSN3B
	+e4GQresBF6UcxHdphiTpgIMUVzJVQniI1XY9p7UUPI14IJBrNBYRo1wuuTBha4Erv2hoZqeRAG
	iY9bO3NYWWTat6vOj4Y5+9sJA5mrnyJnuHceDXslRO/jjbpDoi8TpDxxWs1gbRzS3qE5G5XgINz
	G5fTkfJPlIfYApkF1vK4CbP8t6yBkX67FiyeEvXMtSmEaUc7hGr4LkNcsXoHu3Bw==
X-Google-Smtp-Source: AGHT+IEWlAhmwKzRi3DsVPEVcLwvXUa3WdI8oU+KMgVAlRBQhJkwsNFHt6SbxbXLvLvxaPiEZhDQFQ==
X-Received: by 2002:a05:600c:3146:b0:477:df7:b020 with SMTP id 5b1f17b1804b1-477c01b2211mr302738935e9.18.1764361186642;
        Fri, 28 Nov 2025 12:19:46 -0800 (PST)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <JBeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 3/3] x86/svm: Drop svmdebug.h
Date: Fri, 28 Nov 2025 20:19:37 +0000
Message-Id: <20251128201937.1294742-4-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
References: <20251128201937.1294742-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

svmdebug.h now only contains the declaration for svm_sync_vmcb(), despite the
function being implemented in svm.c.  Move the declaration into svm.h

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/hvm/svm/svm.c                  |  1 -
 xen/arch/x86/hvm/svm/svm.h                  | 17 +++++++++++++++++
 xen/arch/x86/hvm/svm/vmcb.c                 |  2 +-
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h | 16 ----------------
 xen/arch/x86/include/asm/hvm/svm/vmcb.h     | 15 ---------------
 5 files changed, 18 insertions(+), 33 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/svmdebug.h

diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 14b3a427e642..15d45cbb57c5 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -27,7 +27,6 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm/svm.h>
-#include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/i387.h>
 #include <asm/idt.h>
diff --git a/xen/arch/x86/hvm/svm/svm.h b/xen/arch/x86/hvm/svm/svm.h
index f5b0312d2dcf..cfa411ad5ae1 100644
--- a/xen/arch/x86/hvm/svm/svm.h
+++ b/xen/arch/x86/hvm/svm/svm.h
@@ -78,6 +78,23 @@ unsigned int svm_get_task_switch_insn_len(void);
 #define _NPT_PFEC_in_gpt       33
 #define NPT_PFEC_in_gpt        (1UL<<_NPT_PFEC_in_gpt)
 
+/*
+ * VMRUN doesn't switch fs/gs/tr/ldtr and SHADOWGS/SYSCALL/SYSENTER state.
+ * Therefore, guest state is in the hardware registers when servicing a
+ * VMExit.
+ *
+ * Immediately after a VMExit, the vmcb is stale, and needs to be brought
+ * into sync by VMSAVE.  If state in the vmcb is modified, a VMLOAD is
+ * needed before the following VMRUN.
+ */
+enum vmcb_sync_state {
+    vmcb_in_sync,
+    vmcb_needs_vmsave,    /* VMCB out of sync (VMSAVE needed)? */
+    vmcb_needs_vmload,    /* VMCB dirty (VMLOAD needed)? */
+};
+
+void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state);
+
 #endif /* __X86_HVM_SVM_SVM_PRIV_H__ */
 
 /*
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index b1a79d515143..7bde6e98ce03 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -16,12 +16,12 @@
 
 #include <asm/guest-msr.h>
 #include <asm/hvm/svm/svm.h>
-#include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/msr-index.h>
 #include <asm/p2m.h>
 #include <asm/spec_ctrl.h>
 
+#include "svm.h"
 #include "vmcb.h"
 
 struct vmcb_struct *alloc_vmcb(void)
diff --git a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
deleted file mode 100644
index ede13bd34048..000000000000
--- a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
+++ /dev/null
@@ -1,16 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * svmdebug.h: SVM related debug defintions
- * Copyright (c) 2011, AMD Corporation.
- *
- */
-
-#ifndef __ASM_X86_HVM_SVM_SVMDEBUG_H__
-#define __ASM_X86_HVM_SVM_SVMDEBUG_H__
-
-#include <xen/types.h>
-#include <asm/hvm/svm/vmcb.h>
-
-void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state);
-
-#endif /* __ASM_X86_HVM_SVM_SVMDEBUG_H__ */
diff --git a/xen/arch/x86/include/asm/hvm/svm/vmcb.h b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
index 717215ff969b..41bcc9f0d862 100644
--- a/xen/arch/x86/include/asm/hvm/svm/vmcb.h
+++ b/xen/arch/x86/include/asm/hvm/svm/vmcb.h
@@ -21,21 +21,6 @@ struct svm_domain {
     } osvw;
 };
 
-/*
- * VMRUN doesn't switch fs/gs/tr/ldtr and SHADOWGS/SYSCALL/SYSENTER state.
- * Therefore, guest state is in the hardware registers when servicing a
- * VMExit.
- *
- * Immediately after a VMExit, the vmcb is stale, and needs to be brought
- * into sync by VMSAVE.  If state in the vmcb is modified, a VMLOAD is
- * needed before the following VMRUN.
- */
-enum vmcb_sync_state {
-    vmcb_in_sync,
-    vmcb_needs_vmsave,    /* VMCB out of sync (VMSAVE needed)? */
-    vmcb_needs_vmload     /* VMCB dirty (VMLOAD needed)? */
-};
-
 struct svm_vcpu {
     struct vmcb_struct *vmcb;
     u64    vmcb_pa;
-- 
2.39.5


