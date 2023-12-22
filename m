Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F5881CBE1
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659431.1029152 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDl-0004X5-NK; Fri, 22 Dec 2023 15:13:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659431.1029152; Fri, 22 Dec 2023 15:13:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDl-0004Rx-BV; Fri, 22 Dec 2023 15:13:53 +0000
Received: by outflank-mailman (input) for mailman id 659431;
 Fri, 22 Dec 2023 15:13:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDk-0000EM-00
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:52 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5d4849c-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:50 +0100 (CET)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50e6bcca684so531623e87.0
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:50 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:49 -0800 (PST)
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
X-Inumbo-ID: b5d4849c-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258029; x=1703862829; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T52fIi71TBD9YYe45Jg/S335i1e9OJBp7DE409RKwwg=;
        b=IGljKhOGLYXlJgJV03dxSNBk1+mRe5F703064ChoG8WpTpF+zWAsWQkcSON1PizbpM
         eRKrgMcX+VR8h14IzL4x6dcHFSR4XZMSKyfeoY/GncL6n2q9UZ85pkpWMSvbBYFab7zG
         jnxXbVPm58NycnUXAONIXniRyjh4MkXFumBvsWDSEwx+b5tiV45DEoaXTzGfGmA+//is
         jxKvTR0OZuj0ZmcCt2r8jjAwIpPJa4nI7UOiydzAGsjmDFdtsApLkwDXCMu5Z/vJHRJF
         0VXgHLTBR/69rUGli/Cf0GRrQ595BsgYZ6q6GDUoscWLhlsk/nEWegalDW2gbLWflCCg
         N/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258029; x=1703862829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T52fIi71TBD9YYe45Jg/S335i1e9OJBp7DE409RKwwg=;
        b=MDB7xgh3Em0ct95sTZAyGaWXqARKbc/T9GJlZ8Jndm36ALZaovBd4VB6czq+Wij1zA
         YwDC1mhxGizCKy387THD9suirvUXAs/EMcZ6uTLV/nf5rV/ERiMWwVth2ZqR3zVgjlf/
         oZYqze0DYc4G1xF+PhvZ4Rt3Q8x+Xit3jGObMTqEwC2je/LVSdJlaYpmJBZ+OMPhpFJd
         qx/QbWyCDM0cA/tqA0eMHlBxa6W93roUUDPunutqw5d7JLd89YRn+xHFmzpBjjzdRACs
         tZAnTpPwFNuJoNNLuIeUkAvbfMJ3KBbdgCHt+vvbzgAvCsBfAs9D7eCypqAedDyrPXAy
         rtgg==
X-Gm-Message-State: AOJu0Yw0sXT2X4ZdKBqIqH+H8TlRntgWvwMaK05R7T48Re6EtbYT6akJ
	bOUfBVdy23XqvLoDaJ02TCZ6CedifkE=
X-Google-Smtp-Source: AGHT+IGQXJGum15CcvPL14JMoNUzh9rD3gWGXNQtyvIOk6hSJHgzRUvC57lC84yap9EicWBfh3PDHQ==
X-Received: by 2002:a05:6512:3f12:b0:50e:684c:7207 with SMTP id y18-20020a0565123f1200b0050e684c7207mr499315lfa.86.1703258029256;
        Fri, 22 Dec 2023 07:13:49 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v3 24/34] xen/riscv: introduce event.h
Date: Fri, 22 Dec 2023 17:13:08 +0200
Message-ID: <c1d3fba3dbc52efcdd41b25a85bcfc7fb2b8b510.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V3:
 - add SPDX
 - add BUG() inside stubs.
 - update the commit message
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/event.h | 40 ++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/event.h

diff --git a/xen/arch/riscv/include/asm/event.h b/xen/arch/riscv/include/asm/event.h
new file mode 100644
index 0000000000..65cc5ae168
--- /dev/null
+++ b/xen/arch/riscv/include/asm/event.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_EVENT_H__
+#define __ASM_RISCV_EVENT_H__
+
+#include <xen/bug.h>
+
+void vcpu_mark_events_pending(struct vcpu *v);
+
+static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
+{
+    BUG();
+    return 0;
+}
+
+static inline int local_events_need_delivery(void)
+{
+    BUG();
+    return 0;
+}
+
+static inline void local_event_delivery_enable(void)
+{
+    BUG();
+}
+
+/* No arch specific virq definition now. Default to global. */
+static inline bool arch_virq_is_global(unsigned int virq)
+{
+    return true;
+}
+
+#endif
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


