Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3913F6A21BE
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501416.773182 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9F-0002en-Cb; Fri, 24 Feb 2023 18:50:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501416.773182; Fri, 24 Feb 2023 18:50:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9F-0002bb-9U; Fri, 24 Feb 2023 18:50:25 +0000
Received: by outflank-mailman (input) for mailman id 501416;
 Fri, 24 Feb 2023 18:50:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9E-0002YL-6h
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:24 +0000
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [2a00:1450:4864:20::534])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 176698b8-b474-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 19:50:22 +0100 (CET)
Received: by mail-ed1-x534.google.com with SMTP id h16so957915edz.10
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:22 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:21 -0800 (PST)
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
X-Inumbo-ID: 176698b8-b474-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KL9lzwZ35ftF87QkRCnj2FkoflnDCOsUHUBVWqz7qNU=;
        b=HF3jxW9vODJL8Fmk50sLGa5xDdXq2HeRmYVvW+7y7LqH1gpMOeFrUeBrPO1y9fuUsp
         IJCB6GhYPiI9dDLqQu8KfkUpMsUCYIgwI515HV49XGRexLXxUTjtIIDZd64PhjHo9gSj
         OW2p13RKl/tMe1ltzZdYj+b7YDxXjavoEN7k9q9tDRQ1JQQuVN4Z0Ck1NUZgEo7GzDxu
         37I2EljTppxssX60KPqD3VzVZ3NvhWIeKMLR4WwaPntdLkANisi9Chp+NLd9Ns6F/K9/
         qQtohPTnArQJZhwhrTsBAVEYWDLQP3h5Ds/HSwYeZVWuHYCnMNFm5VjuXKunmxNmWFHP
         GtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KL9lzwZ35ftF87QkRCnj2FkoflnDCOsUHUBVWqz7qNU=;
        b=h6W0rM6O5ttV+IYmGvWJOEvnc8Mc1taP7jXun63Y9CF4tOliJ32XD2QEL1sI9LjdzZ
         h/SpwAjDTL9CY6w9WaqTSdX2TxM+/ZEAMe0QpY4hGuyIcrFMXu1GtSmpWK9+U2b4NEBy
         d8Z/ZQEpQtAjBPersfUpFSZpY/YOr/Tgyq7hQf5Zg8MTW/v8AE7VqBuEaq0U1P4/Txey
         pFy+yvSoi1LkdNg+Mgr+XUpgntMtuf9ITYTVSv62ctUDYc4wgCgvRzdkaKQglQQzchfr
         HSVeARRcPdvAZT291JznQuRYAjrQ26bChrWc+VQGLHKVAJhaNv0FLr1/sTcmaOsJ2DoQ
         Chkw==
X-Gm-Message-State: AO0yUKXWjJy5fQIAEeE0PL/TrhTIZEgrCtZMsjDaLZj1Mv/5wkAVlN4k
	NSdA6VguJWTf1VEpz2QWfThYVhX49AU=
X-Google-Smtp-Source: AK7set8wO/M04U9cnd0sCME4qj2tNOUpoPg6UmcMghRa+mE7pAAWnUID9EMwFSS7vNY1mRRHj4XKzA==
X-Received: by 2002:a17:906:e293:b0:8aa:9abe:8edd with SMTP id gg19-20020a170906e29300b008aa9abe8eddmr27669015ejb.66.1677264621570;
        Fri, 24 Feb 2023 10:50:21 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 04/14] x86/svm: make emulate.h private
Date: Fri, 24 Feb 2023 20:50:00 +0200
Message-Id: <20230224185010.3692754-5-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The header asm/hvm/svm/emulate.h is used only internally by the SVM code,
so it can be changed into a private header.

Take the opportunity to use an SPDX tag for the licence.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - new patch

 xen/arch/x86/hvm/svm/emulate.c                |  3 ++-
 .../x86/{include/asm => }/hvm/svm/emulate.h   | 20 +++++--------------
 xen/arch/x86/hvm/svm/nestedsvm.c              |  2 +-
 xen/arch/x86/hvm/svm/svm.c                    |  2 +-
 4 files changed, 9 insertions(+), 18 deletions(-)
 rename xen/arch/x86/{include/asm => }/hvm/svm/emulate.h (73%)

diff --git a/xen/arch/x86/hvm/svm/emulate.c b/xen/arch/x86/hvm/svm/emulate.c
index 16fc134883..4a84b4e761 100644
--- a/xen/arch/x86/hvm/svm/emulate.c
+++ b/xen/arch/x86/hvm/svm/emulate.c
@@ -24,7 +24,8 @@
 #include <asm/hvm/hvm.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
-#include <asm/hvm/svm/emulate.h>
+
+#include "emulate.h"
 
 static unsigned long svm_nextrip_insn_length(struct vcpu *v)
 {
diff --git a/xen/arch/x86/include/asm/hvm/svm/emulate.h b/xen/arch/x86/hvm/svm/emulate.h
similarity index 73%
rename from xen/arch/x86/include/asm/hvm/svm/emulate.h
rename to xen/arch/x86/hvm/svm/emulate.h
index eb1a8c24af..c0d27772a5 100644
--- a/xen/arch/x86/include/asm/hvm/svm/emulate.h
+++ b/xen/arch/x86/hvm/svm/emulate.h
@@ -1,23 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
 /*
  * emulate.h: SVM instruction emulation bits.
+ *
  * Copyright (c) 2005, AMD Corporation.
  * Copyright (c) 2004, Intel Corporation.
- *
- * This program is free software; you can redistribute it and/or modify it
- * under the terms and conditions of the GNU General Public License,
- * version 2, as published by the Free Software Foundation.
- *
- * This program is distributed in the hope it will be useful, but WITHOUT
- * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
- * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
- * more details.
- *
- * You should have received a copy of the GNU General Public License along with
- * this program; If not, see <http://www.gnu.org/licenses/>.
  */
 
-#ifndef __ASM_X86_HVM_SVM_EMULATE_H__
-#define __ASM_X86_HVM_SVM_EMULATE_H__
+#ifndef __X86_HVM_SVM_EMULATE_PRIV_H__
+#define __X86_HVM_SVM_EMULATE_PRIV_H__
 
 /*
  * Encoding for svm_get_insn_len().  We take X86EMUL_OPC() for the main
@@ -53,7 +43,7 @@ struct vcpu;
 unsigned int svm_get_insn_len(struct vcpu *v, unsigned int instr_enc);
 unsigned int svm_get_task_switch_insn_len(void);
 
-#endif /* __ASM_X86_HVM_SVM_EMULATE_H__ */
+#endif /* __X86_HVM_SVM_EMULATE_PRIV_H__ */
 
 /*
  * Local variables:
diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index a341ccc876..5f5752ce21 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -17,7 +17,6 @@
  */
 
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/emulate.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/nestedhvm.h>
@@ -27,6 +26,7 @@
 #include <asm/event.h> /* for local_event_delivery_(en|dis)able */
 #include <asm/p2m.h> /* p2m_get_pagetable, p2m_get_nestedp2m */
 
+#include "emulate.h"
 #include "svm.h"
 
 #define NSVM_ERROR_VVMCB        1
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 793a10eaca..c767a3eb76 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -37,7 +37,6 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/emulate.h>
 #include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/svmdebug.h>
@@ -55,6 +54,7 @@
 #include <public/sched.h>
 
 #include "asid.h"
+#include "emulate.h"
 #include "svm.h"
 
 void noreturn svm_asm_do_resume(void);
-- 
2.37.2


