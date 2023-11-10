Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D77707E7DCD
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630616.983703 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPP-0007Ww-J8; Fri, 10 Nov 2023 16:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630616.983703; Fri, 10 Nov 2023 16:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPP-0007R8-A6; Fri, 10 Nov 2023 16:31:03 +0000
Received: by outflank-mailman (input) for mailman id 630616;
 Fri, 10 Nov 2023 16:31:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPN-0005Bj-G5
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:31:01 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 882496b5-7fe6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:31:00 +0100 (CET)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-9e62ab773f1so131560366b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:30:59 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:58 -0800 (PST)
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
X-Inumbo-ID: 882496b5-7fe6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633859; x=1700238659; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ksyz7eqpUnGFNwlEVCF+IR1olruWlEWE2GXgTvK14s=;
        b=nLiI6WDqXftlmzwP4+SWZQ+zmht/TrfU4ViNJYOCawtjxiu5pLGSOUybntT6SdgJYb
         uxQIJbDRpUTboOy++Zi/sIT00lVriMf/0VxiivUAC+5bzIjfS1lerkq+TMfQROw0O7Z1
         Kzzl8sHXj+xgG5WMW7Ylso52DDbFSCb/GgKIJbliksdfwtax4mgZRgkAlZstaTg5SORU
         zNcBKDM/Uf29PkL/D7tkBcmyjsYoUmgiWuZqCI71Q6PhLofF3GR9wq9QCF1H/qSaA+IE
         QNedFx1K0S8e7EKoSuvEHozTDddRcy38ixOzuGhymdj79t3rS+jJW2NG8wdfSTqrXEwK
         8+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633859; x=1700238659;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ksyz7eqpUnGFNwlEVCF+IR1olruWlEWE2GXgTvK14s=;
        b=Nc6NRlFrLqqG9Rrqa34q8/vZctjRkm9D+3nBueWLSev8xqQC4eSYDBvqBLFY8aQ298
         3OYHIoA1X8+5Gm87zg5VSZKmRuH0mZtprfCzLnrt14nBjO7phOsntIZsYh4QjWQzn54p
         ZZF4j84f/UpeqvWs6QihfabpTy6mcIvfkvM3ims434AVjSXsce/1t1FIVGbdYLWWsaAu
         DTk0hbGURu/tqHyp7CeHFLuk+7rkYINgDQP4IfrHcuqRrRqqWu39MFKmrM4+ftJZUFjS
         oeD5YI+20y4qfHB4DEFzO0eLrcNqPJlBm4mtqEO3rjAr3wZd+UdXNcRKM6CU6itWeFeV
         jPdw==
X-Gm-Message-State: AOJu0YzItj0gPI/9for+JHR6m5v6pOCvP4xcD4RJB+d2YA+ZM5ieDZ03
	X/5LKXTd4/uCGByWdLdgrPz+J0Rxxj4=
X-Google-Smtp-Source: AGHT+IE6kPiXX7Z5JSop3+dJNokyJWJRZdMX1Asa8K1PXdW65cBGfCL9mpOdjoesLyxVw2MLuNP78A==
X-Received: by 2002:a17:907:948d:b0:9a5:a0c6:9e8e with SMTP id dm13-20020a170907948d00b009a5a0c69e8emr7208470ejc.31.1699633859199;
        Fri, 10 Nov 2023 08:30:59 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 08/15] xen/asm-generic: introduce generic header percpu.h
Date: Fri, 10 Nov 2023 18:30:34 +0200
Message-ID: <d0ecdf04ceea49f57a54e15cc129c165a142a5cb.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- use smp_processor_id() instead of get_processor_id().
 	- update commit message .
---
 xen/include/asm-generic/percpu.h | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 xen/include/asm-generic/percpu.h

diff --git a/xen/include/asm-generic/percpu.h b/xen/include/asm-generic/percpu.h
new file mode 100644
index 0000000000..85a3f3ef17
--- /dev/null
+++ b/xen/include/asm-generic/percpu.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_PERCPU_H__
+#define __ASM_GENERIC_PERCPU_H__
+
+#ifndef __ASSEMBLY__
+
+#include <xen/types.h>
+
+extern char __per_cpu_start[], __per_cpu_data_end[];
+extern unsigned long __per_cpu_offset[NR_CPUS];
+void percpu_init_areas(void);
+
+#define per_cpu(var, cpu)  \
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[cpu]))
+
+#define this_cpu(var) \
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[smp_processor_id()]))
+
+#define per_cpu_ptr(var, cpu)  \
+    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
+#define this_cpu_ptr(var) \
+    (*RELOC_HIDE(var, smp_processor_id()))
+
+#endif
+
+#endif /* __ASM_GENERIC_PERCPU_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


