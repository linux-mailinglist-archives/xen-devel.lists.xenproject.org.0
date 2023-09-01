Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3087179006B
	for <lists+xen-devel@lfdr.de>; Fri,  1 Sep 2023 18:03:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594653.928056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc6bI-0005Zp-Qn; Fri, 01 Sep 2023 16:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594653.928056; Fri, 01 Sep 2023 16:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qc6bI-0005WF-NB; Fri, 01 Sep 2023 16:02:24 +0000
Received: by outflank-mailman (input) for mailman id 594653;
 Fri, 01 Sep 2023 16:02:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bo8w=ER=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qc6bH-0005E0-ER
 for xen-devel@lists.xenproject.org; Fri, 01 Sep 2023 16:02:23 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ee96834e-48e0-11ee-9b0d-b553b5be7939;
 Fri, 01 Sep 2023 18:02:20 +0200 (CEST)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50087d47d4dso3818518e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 01 Sep 2023 09:02:20 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 d23-20020ac25457000000b0050097974ec8sm685782lfn.216.2023.09.01.09.02.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 09:02:19 -0700 (PDT)
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
X-Inumbo-ID: ee96834e-48e0-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693584140; x=1694188940; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPQRiEY+3o/lM3cmyr+0FFHtgXvECooqvXEAA7BncAM=;
        b=P21WiiGF5xJQyxfeSmYs3tILVRnaVXd8cVafG3DBs89Er1zJ2J56k5JqQly7ehe55X
         DJUEWF79RFMicqfMvM6vXJ3Ix92xAWSf7pNFAp3cXaWtO4Fs4hB5FTgX//wdDJI4Cb4k
         oUYWdW9NSOr73waLCMUpywMJtPzRpvacwOEKkQr6VqrVZXbgOFNIYAxUcPxb7nffNCt8
         dwI1Spt6aGTyOALV+Pp0al+YdOdqS2PrdD+ICConPIRyiegz6U/sXVV6pQF6pRyM/bF6
         y4eBU8Ekp0rd+J12wcgP3AfVy7/mOII7+STc1cla4FVYXt064zl+hr8UEwJ+0REjawLb
         jmgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693584140; x=1694188940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPQRiEY+3o/lM3cmyr+0FFHtgXvECooqvXEAA7BncAM=;
        b=F8wQ0/Av+Rlv03psziaL2xDItMuM5XWa/OpHmEt9/otdjTGacxoAs6tgUgvpjm053u
         vJJ/yR9YK95ha7IAwwcLjMexG5puCs3uHE6JfWiqkVVn/YyblwpreU2hZxigEDBfQRES
         POy1TkGQnVqKr0locuhaWl8ZqgrF4wmM0P7azxhqrKJ6UtV46G2q/aYig3B45gkHlP+a
         XIoWpCq4cZKHhyWD14dc2BRkLEh8je9TrejrmDwDRNdr+5/J7oER7oKycysst9Yi2osB
         NTYPX62qiLRPVDzDLOcH4cRmkXmU5mM3OKVTLoojJEjYv8PdyCzq5MWSje/0HLbVlQwW
         W2bQ==
X-Gm-Message-State: AOJu0YzImvVPju7gX9ELlW5L6j1QxrfZvXgk7MW1XY5YfqAdedK9zs+M
	LWO8sjhmzCqWLyoAKDZlwzbUUyuCG50=
X-Google-Smtp-Source: AGHT+IF50ZRaLW+Ac9DN9DPOicJCvhy1v4svfMs9B2QcX/N/1OQg+/RWAuzHhzRLUmSdn0hdVDoXSw==
X-Received: by 2002:a05:6512:34d0:b0:4fe:85c:aeba with SMTP id w16-20020a05651234d000b004fe085caebamr1836527lfr.21.1693584139959;
        Fri, 01 Sep 2023 09:02:19 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v4 2/2] xen: move arm/include/asm/vm_event.h to asm-generic
Date: Fri,  1 Sep 2023 19:02:15 +0300
Message-ID: <0d273a71bb3caca894485a33970a81ec9a9f44e5.1693583721.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693583721.git.oleksii.kurochko@gmail.com>
References: <cover.1693583721.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm/vm_event.h is common for ARM and RISC-V so it will be moved to
asm-generic dir.

Original asm/vm_event.h from ARM was updated:
 * use SPDX-License-Identifier.
 * update comment messages of stubs.
 * update #ifdef.
 * change public/domctl.h to public/vm_event.h.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes in V4:
 - update path of vm_event.h from include/asm-generic/asm to include/asm-generic
---
Changes in V3:
 - add Acked-by: Stefano Stabellini <sstabellini@kernel.org> for "xen: move arm/include/asm/vm_event.h to asm-generic"
 - update SPDX tag.
 - move asm/vm_event.h to asm-generic.
---
Changes in V2:
 - change public/domctl.h to public/vm_event.h.
 - update commit message of [PATCH v2 2/2] xen: move arm/include/asm/vm_event.h to stubs
---
 xen/include/asm-generic/vm_event.h | 55 ++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 xen/include/asm-generic/vm_event.h

diff --git a/xen/include/asm-generic/vm_event.h b/xen/include/asm-generic/vm_event.h
new file mode 100644
index 0000000000..620c7b971c
--- /dev/null
+++ b/xen/include/asm-generic/vm_event.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier:  GPL-2.0-only */
+/*
+ * vm_event.h: stubs for architecture specific vm_event handling routines
+ *
+ * Copyright (c) 2015 Tamas K Lengyel (tamas@tklengyel.com)
+ */
+
+#ifndef __ASM_GENERIC_VM_EVENT_H__
+#define __ASM_GENERIC_VM_EVENT_H__
+
+#include <xen/sched.h>
+#include <public/vm_event.h>
+
+static inline int vm_event_init_domain(struct domain *d)
+{
+    /* Nothing to do. */
+    return 0;
+}
+
+static inline void vm_event_cleanup_domain(struct domain *d)
+{
+    memset(&d->monitor, 0, sizeof(d->monitor));
+}
+
+static inline void vm_event_toggle_singlestep(struct domain *d, struct vcpu *v,
+                                              vm_event_response_t *rsp)
+{
+    /* Nothing to do. */
+}
+
+static inline
+void vm_event_register_write_resume(struct vcpu *v, vm_event_response_t *rsp)
+{
+    /* Nothing to do. */
+}
+
+static inline
+void vm_event_emulate_check(struct vcpu *v, vm_event_response_t *rsp)
+{
+    /* Nothing to do. */
+}
+
+static inline
+void vm_event_sync_event(struct vcpu *v, bool value)
+{
+    /* Nothing to do. */
+}
+
+static inline
+void vm_event_reset_vmtrace(struct vcpu *v)
+{
+    /* Nothing to do. */
+}
+
+#endif /* __ASM_GENERIC_VM_EVENT_H__ */
-- 
2.41.0


