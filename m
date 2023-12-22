Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D0981CBE5
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659434.1029160 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDn-0004yt-J3; Fri, 22 Dec 2023 15:13:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659434.1029160; Fri, 22 Dec 2023 15:13:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDn-0004tu-As; Fri, 22 Dec 2023 15:13:55 +0000
Received: by outflank-mailman (input) for mailman id 659434;
 Fri, 22 Dec 2023 15:13:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDm-0000EM-0d
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:54 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6447457-a0dc-11ee-9b0f-b553b5be7939;
 Fri, 22 Dec 2023 16:13:50 +0100 (CET)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-50e34a72660so2373305e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:50 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.49
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
X-Inumbo-ID: b6447457-a0dc-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258030; x=1703862830; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTY81kNTtV0M88vGk6AYNfxh2APHtVW/IF4Pvh94fAs=;
        b=FetxSrrHEBavznSBnjOBDpJ9qvhyvHFQEEEgfaHMNCAQUxLyZQnBVE1qF0KWVYL1c3
         8v70UnnIWl+QpnlrfRS67U/6JmNhJ0U7tcEWu1wAY4vXwzALM2lP8yvVtf5UtxCfyEY0
         ga9aD37E/UaeooPqTVYW9KX+JKwyNu5rWhTwpCQfQHZPj5RRzQ96OWaNK49Mnnf8HMuC
         3sr4FjO+eZXQdCAeGhQfoowUn03OdmUCu9fVJ1MZFn+F/3R7nyfFjHjFbaJzO1B50grN
         iVpxXoAE3Dg17E/h/ubwwdnlcd+cdd5j4UI36RitgBOcMRvWamWlnE8LE3onglYOFNIE
         DMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258030; x=1703862830;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OTY81kNTtV0M88vGk6AYNfxh2APHtVW/IF4Pvh94fAs=;
        b=wBqC2UYC6bcTLu0Fi7iVojTLYdKgzMLpAXHY0p5/3COtLwTcQ9NvQuZIoNKVGZXuMv
         0fLjW9Eyrg23Lx8GnlNVVDANDTdAL9lFg0JnVrEleCHZoyVWn83jp/Mtdl4RtDO6UFJI
         byjTDmu6v76d5KbYWLT7HfhWa+5ut4wu7WKmgTwzKVMV4d27SArl0cJxAYn5r2RrpMaw
         Wy8mZJO7NwGAdWztQgw0WEXp2c8teGwO6LQk7MhijDDQhg+5NIzG1Rf4wzU+8JRIIQRA
         Tam9A9Hj94h5qOojgnaOYyNYGB3sb0/5BpFN9F48RUOtYfwG1le09dCcHkReRdxYZEUH
         BhJw==
X-Gm-Message-State: AOJu0Yy5AKFRAH6b8zJ9EHMhV7McQkQ7MhlI/b2Dab9L08/Ym5awekpg
	EOiRcWdLXIBh8tRIOJk6LhFzfD0+dIg=
X-Google-Smtp-Source: AGHT+IF+v1dLHCp5UUK0fq7mogNXmzIe5SsEgHrdB0O/rRVOFvIuiYKhZkc1O03qWTmZv4KkL46dRA==
X-Received: by 2002:a05:6512:15a4:b0:50e:6958:24a with SMTP id bp36-20020a05651215a400b0050e6958024amr875772lfb.5.1703258030071;
        Fri, 22 Dec 2023 07:13:50 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v3 25/34] xen/riscv: introduce monitor.h
Date: Fri, 22 Dec 2023 17:13:09 +0200
Message-ID: <c075fef4593fc81bd69f084645493d41f9086b18.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 Taking into account conversion in [PATCH v6 0/9] Introduce generic headers
 (https://lore.kernel.org/xen-devel/cover.1703072575.git.oleksii.kurochko@gmail.com/)
 this patch can be changed
---
Changes in V3:
 - new patch.
---
 xen/arch/riscv/include/asm/monitor.h | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/monitor.h

diff --git a/xen/arch/riscv/include/asm/monitor.h b/xen/arch/riscv/include/asm/monitor.h
new file mode 100644
index 0000000000..f4fe2c0690
--- /dev/null
+++ b/xen/arch/riscv/include/asm/monitor.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_MONITOR_H__
+#define __ASM_RISCV_MONITOR_H__
+
+#include <xen/bug.h>
+
+#include <asm-generic/monitor.h>
+
+struct domain;
+
+static inline uint32_t arch_monitor_get_capabilities(struct domain *d)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+#endif /* __ASM_RISCV_MONITOR_H__ */
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
2.43.0


