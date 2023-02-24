Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C76A21C1
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 19:50:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501414.773159 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9A-0001xH-Q8; Fri, 24 Feb 2023 18:50:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501414.773159; Fri, 24 Feb 2023 18:50:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVd9A-0001px-MJ; Fri, 24 Feb 2023 18:50:20 +0000
Received: by outflank-mailman (input) for mailman id 501414;
 Fri, 24 Feb 2023 18:50:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vhFC=6U=gmail.com=burzalodowa@srs-se1.protection.inumbo.net>)
 id 1pVd99-0001Wv-Uw
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 18:50:20 +0000
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [2a00:1450:4864:20::533])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 15c00070-b474-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 19:50:19 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id ee7so1127029edb.2
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 10:50:19 -0800 (PST)
Received: from uni.router.wind (adsl-185.109.242.225.tellas.gr.
 [109.242.225.185]) by smtp.googlemail.com with ESMTPSA id
 me19-20020a170906aed300b008b17662e1f7sm10585245ejb.53.2023.02.24.10.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 10:50:18 -0800 (PST)
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
X-Inumbo-ID: 15c00070-b474-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bco5bSqEWusubMpaw+Hfl1JBeko3KHLffepxLAFmo6E=;
        b=R/Bk6ghbcUbXyuoFrgS3T5hNsN5ZIk9+H4PgFcX9k9vnmrEJswbaKEV4nz/825tFvc
         4oJvRifjhKIcSPjgarXKJaHtNXre0cQ/z9MTsYyvLyx0tVTQPoiDf343/AATpquKGIIP
         4SZwHCi7rovxiNEMz/amOGRH1ZL7HEa+Y3Tg0W1MF2aqmdhoLMY3RSST0GXjjLaeS5n6
         C30AOXN/s/vWIYoInBYdQigmBJlMHgKitlotTR0UNLkwH9uFfZ79rV4UsOuZ3jCoOHKv
         qUxG9pwiq0wRGfYlRIJ0fTCvpAgmxY1C9yK2aNqgU8jJW16G3k8q14nqqHAFeNY5VYdh
         46Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bco5bSqEWusubMpaw+Hfl1JBeko3KHLffepxLAFmo6E=;
        b=xFWQdv7px6+bDNKTL4iPEkYO0lnO1+TFpodGbMk1DfYXIDwzsTS1J9A/tqB0fPZdvj
         G7mNiaX3oajtFYPvOqk2ET+YnMQPwhSVDWlBEwoPIqlU62YreEhkpFYobB8iV5Dh+/Pm
         d1sPw1yS4vWhDuL06iQEd1Gk4uFQ2eKWnEVqPBLLs1qC/33DQnL+sHvFxIdbQPKTxp40
         LoLp0f8D89OgIhWHSdH4DXdrQRGoQVLv7K0n+Rjl6D/0UiO6thEDzeiM32KN/egLkeZi
         UKGSe2twmefTF7wnXa0Wmqv/5ukF1xai8njRTz/LUDloHEPlS5hu0TFBT+iSZoCzH/BS
         /DBA==
X-Gm-Message-State: AO0yUKVeea77gU6tYPTZcpk5wtHCPX0Iqo0P1hU1wC5Xd+JUH7PHtIXb
	/E9JTVIFIlJao2O2KJhLroaHDiHKU4M=
X-Google-Smtp-Source: AK7set+8uC8eKcxhrC/cQNSnKM9kiGL8BrTnT8AKAF2bYRESkZE8apgLs9KYZV8250yv4ZUXtjC1FQ==
X-Received: by 2002:a17:906:af1a:b0:880:a42d:dfb4 with SMTP id lx26-20020a170906af1a00b00880a42ddfb4mr23476209ejb.16.1677264618696;
        Fri, 24 Feb 2023 10:50:18 -0800 (PST)
From: Xenia Ragiadakou <burzalodowa@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 02/14] x86/svm: make asid.h private
Date: Fri, 24 Feb 2023 20:49:58 +0200
Message-Id: <20230224185010.3692754-3-burzalodowa@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230224185010.3692754-1-burzalodowa@gmail.com>
References: <20230224185010.3692754-1-burzalodowa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The asm/hvm/svm/asid.h is used only internally by the SVM code, so it can be
changed into a private header.

Take the opportunity to use an SPDX tag for the licence and remove included
but unused xen/types.h.

No functional change intended.

Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>
---

Changes in v3:
  - new patch

 xen/arch/x86/hvm/svm/asid.c             |  3 +-
 xen/arch/x86/hvm/svm/asid.h             | 38 +++++++++++++++++++
 xen/arch/x86/hvm/svm/svm.c              |  2 +-
 xen/arch/x86/include/asm/hvm/svm/asid.h | 49 -------------------------
 4 files changed, 41 insertions(+), 51 deletions(-)
 create mode 100644 xen/arch/x86/hvm/svm/asid.h
 delete mode 100644 xen/arch/x86/include/asm/hvm/svm/asid.h

diff --git a/xen/arch/x86/hvm/svm/asid.c b/xen/arch/x86/hvm/svm/asid.c
index ab06dd3f3a..1128434878 100644
--- a/xen/arch/x86/hvm/svm/asid.c
+++ b/xen/arch/x86/hvm/svm/asid.c
@@ -17,9 +17,10 @@
 
 #include <asm/amd.h>
 #include <asm/hvm/nestedhvm.h>
-#include <asm/hvm/svm/asid.h>
 #include <asm/hvm/svm/svm.h>
 
+#include "asid.h"
+
 void svm_asid_init(const struct cpuinfo_x86 *c)
 {
     int nasids = 0;
diff --git a/xen/arch/x86/hvm/svm/asid.h b/xen/arch/x86/hvm/svm/asid.h
new file mode 100644
index 0000000000..4dd6abb5fb
--- /dev/null
+++ b/xen/arch/x86/hvm/svm/asid.h
@@ -0,0 +1,38 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * asid.h: handling ASIDs in SVM.
+ *
+ * Copyright (c) 2007, Advanced Micro Devices, Inc.
+ */
+
+#ifndef __X86_HVM_SVM_ASID_PRIV_H__
+#define __X86_HVM_SVM_ASID_PRIV_H__
+
+#include <asm/hvm/asid.h>
+#include <asm/processor.h>
+
+void svm_asid_init(const struct cpuinfo_x86 *c);
+void svm_asid_handle_vmrun(void);
+
+static inline void svm_asid_g_invlpg(struct vcpu *v, unsigned long g_linear)
+{
+#if 0
+    /* Optimization? */
+    svm_invlpga(g_linear, v->arch.hvm.svm.vmcb->guest_asid);
+#endif
+
+    /* Safe fallback. Take a new ASID. */
+    hvm_asid_flush_vcpu(v);
+}
+
+#endif /* __X86_HVM_SVM_ASID_PRIV_H__ */
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
diff --git a/xen/arch/x86/hvm/svm/svm.c b/xen/arch/x86/hvm/svm/svm.c
index 6d394e4fe3..793a10eaca 100644
--- a/xen/arch/x86/hvm/svm/svm.c
+++ b/xen/arch/x86/hvm/svm/svm.c
@@ -37,7 +37,6 @@
 #include <asm/hvm/monitor.h>
 #include <asm/hvm/nestedhvm.h>
 #include <asm/hvm/support.h>
-#include <asm/hvm/svm/asid.h>
 #include <asm/hvm/svm/emulate.h>
 #include <asm/hvm/svm/nestedsvm.h>
 #include <asm/hvm/svm/svm.h>
@@ -55,6 +54,7 @@
 
 #include <public/sched.h>
 
+#include "asid.h"
 #include "svm.h"
 
 void noreturn svm_asm_do_resume(void);
diff --git a/xen/arch/x86/include/asm/hvm/svm/asid.h b/xen/arch/x86/include/asm/hvm/svm/asid.h
deleted file mode 100644
index 0e5ec3ab78..0000000000
--- a/xen/arch/x86/include/asm/hvm/svm/asid.h
+++ /dev/null
@@ -1,49 +0,0 @@
-/*
- * asid.h: handling ASIDs in SVM.
- * Copyright (c) 2007, Advanced Micro Devices, Inc.
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
- */
-
-#ifndef __ASM_X86_HVM_SVM_ASID_H__
-#define __ASM_X86_HVM_SVM_ASID_H__
-
-#include <xen/types.h>
-#include <asm/hvm/asid.h>
-#include <asm/processor.h>
-
-void svm_asid_init(const struct cpuinfo_x86 *c);
-void svm_asid_handle_vmrun(void);
-
-static inline void svm_asid_g_invlpg(struct vcpu *v, unsigned long g_linear)
-{
-#if 0
-    /* Optimization? */
-    svm_invlpga(g_linear, v->arch.hvm.svm.vmcb->guest_asid);
-#endif
-
-    /* Safe fallback. Take a new ASID. */
-    hvm_asid_flush_vcpu(v);
-}
-
-#endif /* __ASM_X86_HVM_SVM_ASID_H__ */
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * tab-width: 4
- * indent-tabs-mode: nil
- * End:
- */
-- 
2.37.2


