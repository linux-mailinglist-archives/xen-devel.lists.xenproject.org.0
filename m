Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8C16A21C4
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501418.773203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9J-0003G2-7b; Fri, 24 Feb 2023 18:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501418.773203; Fri, 24 Feb 2023 18:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9J-0003CZ-35; Fri, 24 Feb 2023 18:50:29 +0000
Received: by outflank-mailman (input) for mailman id 501418;
 Fri, 24 Feb 2023 18:50:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd9H-0001Wv-Kz
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:27 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a51def2-b474-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:50:27 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id x10so890554edd.13
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:27 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:26 -0800 (PST)
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
X-Inumbo-ID: 1a51def2-b474-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qi5tSetwNB2KxLoKFto8c4h593SGH+tQKkr8ph4elAo=;
        b=cgBa9w+QDqIEgbqmSB94g1hRBCeI3j4m4nhjP5KZ4Cfo4v1t2Mq47pYwFxO/0Ot/F8
         Jq7Uejult3qFPddSY7UKMHxaGk/sTfgi8NYboZBCa1IePRLhZfOky60sn1MHzI8PR3gP
         wq2E305K7NetQVnwafcOE9hHOyAAyIoxjpDrSSsUGPL3zv1h5nqPr8LHVAYJfWLAB6L1
         3VnurPD9X7rrPgdVCNpfe9/pfMNDNv8+zdCzKwEcSujZ5IMaexx1QNWhKm4gph6kdITm
         jhRsxRt+lphRabXmvGVmfRDnFQxJp2r1FEBmfpr6lh/2clWUgcrKNxu41sZxlHe0v6Gp
         +NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qi5tSetwNB2KxLoKFto8c4h593SGH+tQKkr8ph4elAo=;
        b=4xMselme8ZSQNGNPJ8kFyz2GFQ2aZW5fyZSJClSmg1z5/Kc7qG2kgG93qjvitGeQxz
         CzQuYMyUmpYGr7ONL/1Edvj1xksioIQYzm3YDddiai7an3B3wQyQY09IDMMlkJ5HN7vZ
         X0J3Pgj/Ht53goP1sLYSt5TMM9NrUEjmT4wkuTNXOxSO+cw0uSsu08WgdmQfJpRSJZDr
         pzf1m3NFAx8/F1/Upitwjot5r0rrmRfslijoDB5px6pGwwcQ0R3z4gDS87F6HV5wevnz
         ciNUPK6gHgHdi6VezjY3uHa+5d2BEAMbCluqafUGufEEGHNSUy+uxaDWdnfPPZjpaYk/
         zoKA==
X-Gm-Message-State: AO0yUKVozoIoWlDCTqiYyX/2IvcV+E7YI3MxnG9Co73X02sNsp+DxcgG
	/w7OH7De/REeNXAgwGfYy8rTBOAKeGg=
X-Google-Smtp-Source: AK7set8b7hRU9JfFfiGBOSn2pcFnBtYVPgGpW5Hwa2AxGLaJd9xetIYoMA3yRULeOHwUcudm3Nw8/g==
X-Received: by 2002:a17:906:7488:b0:8b1:7a86:b06f with SMTP id e8-20020a170906748800b008b17a86b06fmr27507338ejl.63.1677264626471;
        Fri, 24 Feb 2023 10:50:26 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 07/14] x86/svm: move svmdebug.h declarations to private vmcb.h and delete it
Date: Fri, 24 Feb 2023 20:50:03 +0200
Message-Id: <20230224185010.3692754-8-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move the declarations in svmdebug.h to private vmcb.h because are vmcb
specific and are used only by internal svm code, and delete svmdebug.h.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - new patch, suggested by Andrew

 xen/arch/x86/hvm/svm/nestedsvm.c            |  1 -
 xen/arch/x86/hvm/svm/svm.c                  |  1 -
 xen/arch/x86/hvm/svm/svmdebug.c             |  1 -
 xen/arch/x86/hvm/svm/vmcb.c                 |  1 -
 xen/arch/x86/hvm/svm/vmcb.h                 |  6 +++++
 xen/arch/x86/include/asm/hvm/svm/svmdebug.h | 30 ---------------------
 6 files changed, 6 insertions(+), 34 deletions(-)
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/svmdebug.h

diff --git a/xen/arch/x86/hvm/svm/nestedsvm.c b/xen/arch/x86/hvm/svm/nestedsvm.c
index efbd9bbb77..201da7d531 100644
--- a/xen/arch/x86/hvm/svm/nestedsvm.c
+++ b/xen/arch/x86/hvm/svm/nestedsvm.c
@@ -20,7 +20,6 @@
 #include <asm/hvm/svm/svm.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/svmdebug.h>
 #include <asm/paging.h> /* paging_mode_hap */
 #include <asm/event.h> /* for local_event_delivery_(en|dis)able */
 #include <asm/p2m.h> /* p2m_get_pagetable, p2m_get_nestedp2m */
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 86b1bf3242..0a1b447e36 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -38,7 +38,6 @@
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
 #include <asm/hvm/svm/svm.h>
-#include <asm/hvm/svm/svmdebug.h>
 #include <asm/hvm/svm/vmcb.h>
 #include <asm/hvm/trace.h>
 #include <asm/iocap.h>
diff --git a/xen/arch/x86/hvm/svm/svmdebug.c b/xen/arch/x86/hvm/svm/svmdebug.c
index ade74dfd8f..7fd0753116 100644
--- a/xen/arch/x86/hvm/svm/svmdebug.c
+++ b/xen/arch/x86/hvm/svm/svmdebug.c
@@ -19,7 +19,6 @@
 #include <xen/sched.h>
 #include <asm/processor.h>
 #include <asm/msr-index.h>
-#include <asm/hvm/svm/svmdebug.h>
 
 #include "vmcb.h"
 
diff --git a/xen/arch/x86/hvm/svm/vmcb.c b/xen/arch/x86/hvm/svm/vmcb.c
index 1d512fedb0..657b4b1670 100644
--- a/xen/arch/x86/hvm/svm/vmcb.c
+++ b/xen/arch/x86/hvm/svm/vmcb.c
@@ -27,7 +27,6 @@
 #include <asm/msr-index.h>
 #include <asm/p2m.h>
 #include <asm/hvm/svm/svm.h>
-#include <asm/hvm/svm/svmdebug.h>
 #include <asm/spec_ctrl.h>
 
 #include "vmcb.h"
diff --git a/xen/arch/x86/hvm/svm/vmcb.h b/xen/arch/x86/hvm/svm/vmcb.h
index c58625fd80..80143164e5 100644
--- a/xen/arch/x86/hvm/svm/vmcb.h
+++ b/xen/arch/x86/hvm/svm/vmcb.h
@@ -11,6 +11,7 @@
 
 #include <xen/types.h>
 
+#include <asm/hvm/svm/vmcb.h>
 #include <asm/x86_emulate.h>
 
 /* general 1 intercepts */
@@ -518,6 +519,11 @@ void svm_destroy_vmcb(struct vcpu *v);
 
 void setup_vmcb_dump(void);
 
+void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state);
+void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb);
+bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
+                      const struct vcpu *v, bool verbose);
+
 /*
  * VMCB accessor functions.
  */
diff --git a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h b/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
deleted file mode 100644
index 330c1d91aa..0000000000
--- a/xen/arch/x86/include/asm/hvm/svm/svmdebug.h
+++ /dev/null
@@ -1,30 +0,0 @@
-/*
- * svmdebug.h: SVM related debug defintions
- * Copyright (c) 2011, AMD Corporation.
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
- *
- */
-
-#ifndef __ASM_X86_HVM_SVM_SVMDEBUG_H__
-#define __ASM_X86_HVM_SVM_SVMDEBUG_H__
-
-#include <asm/types.h>
-#include <asm/hvm/svm/vmcb.h>
-
-void svm_sync_vmcb(struct vcpu *v, enum vmcb_sync_state new_state);
-void svm_vmcb_dump(const char *from, const struct vmcb_struct *vmcb);
-bool svm_vmcb_isvalid(const char *from, const struct vmcb_struct *vmcb,
-                      const struct vcpu *v, bool verbose);
-
-#endif /* __ASM_X86_HVM_SVM_SVMDEBUG_H__ */
-- 
2.37.2


