Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF307F71A6
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:39:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640427.998645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Taw-00050J-Gs; Fri, 24 Nov 2023 10:39:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640427.998645; Fri, 24 Nov 2023 10:39:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Taw-0004yb-E0; Fri, 24 Nov 2023 10:39:34 +0000
Received: by outflank-mailman (input) for mailman id 640427;
 Fri, 24 Nov 2023 10:39:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TTT-0006hx-D2
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:51 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a74debed-8ab4-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 11:31:40 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9fd0059a967so543561866b.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:40 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:38 -0800 (PST)
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
X-Inumbo-ID: a74debed-8ab4-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821899; x=1701426699; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLjNioN0z9kxErlbS/a9Yo17p/MesEH5oUEwnGWW1s0=;
        b=GUdI8Z8X+4atcDRkBKrqW0JSj5v8XhdFL5f5kBFvxlMGXDD+tB75KaR6gAK7OV+1pO
         h5V6bOjSXaf07ZPaynszlOfLzlI06BE+uPj+7RC8Btm4AVXW811+Qtn9YKVuBuqExyjm
         hfNvCYUfN8dPpxr38JYzms3oDYHO8QzWaFkpbjVwqZJmdrAenN0m+bBtl3sN85hbnCBS
         cM+4tj5tJnQPKil1RNwi+2DGMnBmHo3wCSRY1g4fSdme0+a+zjS3bs4pV9DN0ez6LiMk
         GPrF4opYkMwSJsluKJKYuo23p3ilyyCXkXQ71gmelyQBVJ9l1i/SEkYR0sgJu0CY5Jaa
         Zmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821899; x=1701426699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLjNioN0z9kxErlbS/a9Yo17p/MesEH5oUEwnGWW1s0=;
        b=Xa6euFVZF2nXsuUkFybQkDLygKc4ZbPGGxeBve1yArp7rRZGqJTMTcE2yza2TbR5uP
         9k5BXUX3PV/uaAHqB/eSB1HL4fWDa0g9y4PY/ZhN14iQBhxbwA78VVAYGOxDZXwWE0a7
         cDDlrJ5rwFBpzF/gaKF0OI6CrN3VK2iaszEHfMP4upAdjzzJ0zYbA4Si8kSGzGPih4tP
         M0UYnROQnFnxmAcXGZ3eZOcqCBnx1/NT71B8DeX6aKbbTBfSzuz9ycvJwlhmKu8tAD3d
         Wt2OvzyQWMrYnXHJAcNRs04Bsnn6cxCS5nkQFlzhAqtO6Cl9B9HP1QQIow5XzLtWJ8MC
         4PuA==
X-Gm-Message-State: AOJu0Yye9y7xXZQWwx/4etifDEFljO4EZ/80VTBQ7kHQ8qEkRKAjBEBO
	kvM+bASy7Q9t+L7GQi0OfbljFQ4Z6pU/Bg==
X-Google-Smtp-Source: AGHT+IFDkis3KsXlvXscmPgpaABJmffrS3eJnFFygdQG4dlEDlHjpNwVJOw/cergcf3I8X21FIWjVg==
X-Received: by 2002:a17:907:e92:b0:9a5:dc2b:6a5 with SMTP id ho18-20020a1709070e9200b009a5dc2b06a5mr5821323ejc.35.1700821898692;
        Fri, 24 Nov 2023 02:31:38 -0800 (PST)
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
Subject: [PATCH v2 28/39] xen/riscv: introduce asm/event.h
Date: Fri, 24 Nov 2023 12:30:48 +0200
Message-ID: <492c6183a8248046f0b6fdb186ad5b33953c3b24.1700761381.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <cover.1700761381.git.oleksii.kurochko@gmail.com>
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/event.h | 34 ++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/event.h

diff --git a/xen/arch/riscv/include/asm/event.h b/xen/arch/riscv/include/asm/event.h
new file mode 100644
index 0000000000..48630c77b3
--- /dev/null
+++ b/xen/arch/riscv/include/asm/event.h
@@ -0,0 +1,34 @@
+#ifndef __ASM_RISCV_EVENT_H__
+#define __ASM_RISCV_EVENT_H__
+
+void vcpu_mark_events_pending(struct vcpu *v);
+
+static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
+{
+    return 0;
+}
+
+static inline int local_events_need_delivery(void)
+{
+    return 0;
+}
+
+static inline void local_event_delivery_enable(void)
+{
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
2.42.0


