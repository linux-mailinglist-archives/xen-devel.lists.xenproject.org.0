Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F026A21C2
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501421.773232 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9M-00047T-Sa; Fri, 24 Feb 2023 18:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501421.773232; Fri, 24 Feb 2023 18:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9M-0003yz-Ks; Fri, 24 Feb 2023 18:50:32 +0000
Received: by outflank-mailman (input) for mailman id 501421;
 Fri, 24 Feb 2023 18:50:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9K-0001Wv-Rw
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:30 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c687060-b474-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:50:30 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id cq23so1155733edb.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:30 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:29 -0800 (PST)
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
X-Inumbo-ID: 1c687060-b474-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tf7rK6h2R1hnCH3sI+RxI9BdV0x0fUj0Pl5i4U926Qo=;
        b=Hl5p1WNymqkIwVQgUM4+n1XHAUka6weLZbCQCbVxHKqMhU1jjIDcHs7We728B548OT
         ojilNwy6QrI9FqOIazvZ5q9T4jQYQDfYVySAJEHBR6a06W9AgBSJWmXsQoAY9ZC1Ze+F
         LvYCNDtslwGZQtqPwX9+qimA4mpy9oTCE/bbyL3oXR7/Eo5Ek52DPrnsHWtfIOG/I8t3
         pax+m/8XB6VxHc18XU1YJJbk+gGgqoFTEkWtHu2pUfyMS7QOXILh/ljzgTsP9Un2w4tR
         HlTf2rbSHKbcveco7wbrO7OP4+HE2xbTyW53FPx2uVi3JdsteyLjDh9jFfYIb9k/+jvP
         m0sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tf7rK6h2R1hnCH3sI+RxI9BdV0x0fUj0Pl5i4U926Qo=;
        b=bC+JeyL4nQjXjjyOmJrr09aF2zx7iU3C5iGinHEutgLdsq7kPS+xEzIE1kLeH6br59
         epJcFGpu6fGk9jdV3gjNxx74TBeWVJSNZqNCjTif0r7E/HuftiJzTnC6Gm/Nwu/tPcTB
         MC76BtzbQcLrVQGatbkG+uj/EzZUuY1I6gJtKmP+Up5K8jpZqQZu7YGYRyU6B1Hb4DMZ
         bUZRPXl0xPrvkl0VUc+9uCT4X5R0TKYKhxhzqZ6VFTacp8ZuOI9CsIJjsRD8aJ68yGRL
         swYo4SUspUb7D5mIaNzxphIgHsnv4I2fK87EM/6iQjCSSozA4AbuuK/5GZtEoni/R7Hd
         FHvw==
X-Gm-Message-State: AO0yUKWKC/dJyJ8kqQadXUNRC6lolkKqALyyt2umORYlSrMNK1oopJ2m
	yLO9jMVZ+qdIZjAtzb6yNi+YaxdUsRg=
X-Google-Smtp-Source: AK7set8k7+JX10Hrw5HOz7NLFdBlES5/dA87K6uhp6LNUy5yFb3HwTVwtMb+giTiIpZTnglsWKMfHA==
X-Received: by 2002:a17:906:53c7:b0:885:fee4:69ee with SMTP id p7-20020a17090653c700b00885fee469eemr22870606ejo.59.1677264629835;
        Fri, 24 Feb 2023 10:50:29 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 09/14] x86/vmx: remove unused included headers from vmx.h
Date: Fri, 24 Feb 2023 20:50:05 +0200
Message-Id: <20230224185010.3692754-10-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not include the headers:
  asm/i387.h
  asm/hvm/trace.h
  asm/processor.h
  asm/regs.h
because none of the declarations and macro definitions in them is used in
this file. Sort the rest of the headers alphabetically.
Include asm/i387.h in vmx.c, needed for vcpu_restore_fpu_lazy().

Take the opportunity to include xen/types.h in the place of asm/types.h and
replace u* with uint*_t and bool_t with bool.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - reword the commit message to not look like a bug fix, reported by JAn
  - include xen/types.h instead of asm/types.h and use uint*_t instead of u*,
    suggested by Jan

 xen/arch/x86/hvm/vmx/vmx.c             |  1 +
 xen/arch/x86/include/asm/hvm/vmx/vmx.h | 15 ++++++---------
 2 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 294c8490b4..232107bd79 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -43,6 +43,7 @@
 #include <asm/hvm/vmx/vmcs.h>
 #include <public/sched.h>
 #include <public/hvm/ioreq.h>
+#include <asm/i387.h>
 #include <asm/hvm/vpic.h>
 #include <asm/hvm/vlapic.h>
 #include <asm/x86_emulate.h>
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index 82a9487b40..f5720c393c 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -19,20 +19,17 @@
 #define __ASM_X86_HVM_VMX_VMX_H__
 
 #include <xen/sched.h>
-#include <asm/types.h>
-#include <asm/regs.h>
+#include <xen/types.h>
+
 #include <asm/asm_defns.h>
-#include <asm/processor.h>
-#include <asm/p2m.h>
-#include <asm/i387.h>
-#include <asm/hvm/trace.h>
 #include <asm/hvm/vmx/vmcs.h>
+#include <asm/p2m.h>
 
 extern int8_t opt_ept_exec_sp;
 
 typedef union {
     struct {
-        u64 r       :   1,  /* bit 0 - Read permission */
+        uint64_t r  :   1,  /* bit 0 - Read permission */
         w           :   1,  /* bit 1 - Write permission */
         x           :   1,  /* bit 2 - Execute permission */
         emt         :   3,  /* bits 5:3 - EPT Memory type */
@@ -49,7 +46,7 @@ typedef union {
         _rsvd       :   1,  /* bit 62 - reserved */
         suppress_ve :   1;  /* bit 63 - suppress #VE */
     };
-    u64 epte;
+    uint64_t epte;
 } ept_entry_t;
 
 typedef struct {
@@ -595,7 +592,7 @@ void vmx_inject_extint(int trap, uint8_t source);
 void vmx_inject_nmi(void);
 
 void ept_walk_table(struct domain *d, unsigned long gfn);
-bool_t ept_handle_misconfig(uint64_t gpa);
+bool ept_handle_misconfig(uint64_t gpa);
 int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
                        unsigned int order, bool *ipat, p2m_type_t type);
 void setup_ept_dump(void);
-- 
2.37.2


