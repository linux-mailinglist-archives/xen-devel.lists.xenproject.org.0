Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB857849E46
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676212.1052316 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y3-0003m1-Cb; Mon, 05 Feb 2024 15:33:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676212.1052316; Mon, 05 Feb 2024 15:33:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y2-0003N8-Mw; Mon, 05 Feb 2024 15:33:06 +0000
Received: by outflank-mailman (input) for mailman id 676212;
 Mon, 05 Feb 2024 15:33:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xy-0007Hv-2v
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:02 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d8db995f-c43b-11ee-8a46-1f161083a0e0;
 Mon, 05 Feb 2024 16:33:01 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5114cd44f6aso1310796e87.1
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:33:01 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:33:00 -0800 (PST)
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
X-Inumbo-ID: d8db995f-c43b-11ee-8a46-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147181; x=1707751981; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kwBu84D0n1DoTgY2J9dL0hCB/ukCq+oQwz679ugGOF4=;
        b=OFFxYpOT/SCyDL3P4UH7yKxo6jAD4zIDgfyQmZhiMldsCDOSXRwOyrRoILJ4Qu3f7E
         8ddYejoBv0KJqgCMnUTkP000y04jlVZdxJfCwFI9ZuoTW34S1SeHKtHci6Fl3VDyXg7o
         bQ8Z1SuaXbVGLpCRstLzshOr8fRMBwEBJQtbYBm/HxEYqfvRzrFpv2T3Y9CH/+oH/jmb
         vVX74E+Rq1Z2pWPtlyY0ZIjrD3rCtUPM2J7GLyOKhH9pRtZpLU2NhTp7CIHy4PIqdHjp
         8/BetZJC4JpZjmrKR7+y4lQYcq+bSC2aVBzB27n75Z58qWcOJnx3oWjDqohEOTdwJq65
         toBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147181; x=1707751981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kwBu84D0n1DoTgY2J9dL0hCB/ukCq+oQwz679ugGOF4=;
        b=O3zDQUjGbKaS6Tlj1T2Sopxs0SP5xoa/4xjqWsCCI6p9qnQdzI0dnrC0DP/praq6Yz
         65tedYkiTCjlsq5gk/Ldhd0pOIwZtentGbofJCO3CT59kIzX/tUBdEEHxLHmftgeja2+
         X/lNuf2bcBv0Jdn/lOka1mkRzoUmLZ7GXf72OqjixGUqonG8zxEoF8ehOXfendoObbXw
         fQedE3a4X6AuinGHuY7960JBQzpiMTxhjKuD4lJ5/4UsFpQ2pgtBbDTp9tQx31tikF3i
         aVP2oeRzxCGgO6FsnmAYdcqjPtvv2lf+acDibYi/MPWHVinTE3X+DEho/RdjXd7jOT5N
         cFqQ==
X-Gm-Message-State: AOJu0YxT6khiSJnHiqB5VDVVEoshXOjlD7wHVLAp9NieH/ItBIMrE8d1
	EXGFvrmfpshvqG5Hoo7BK9fbzyDcvql4rP9ZhXxKooIu7b/M9tRddUA2s3Wd
X-Google-Smtp-Source: AGHT+IHFs7tlpIVryWCEx1JXjwZyMAuN58CNQvo4IL2SB1CB+7ciG6j8sE5ZI3WEmiEJI+a19G/ChQ==
X-Received: by 2002:a05:6512:480a:b0:511:52b4:8b93 with SMTP id eo10-20020a056512480a00b0051152b48b93mr1399173lfb.29.1707147180898;
        Mon, 05 Feb 2024 07:33:00 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWtUKb5cQm7vsiITfH1eqCM5692QeSptFfBnvihdgDBloWsy0FZFfbMu6VWt6mVQwB/ujLAGwBpm8WDazQDnfAfnk4lWXNygCw5d5LzWBNfX1HVHgtjg8FAwUCmcKtcDI1bh9emA4QJcqbb5rNaMMxH1/4ADlWrKgSM5iZlTWTtYidxoeMHPjv+zdBmXtQFnKXe5TQn+t5MqI6Tj/cYJRM4/UqvcxtTDC8xE0sy1DIASGuGmBEhhLUaq9wfpnp5m7ac5VbuWr1sgBiQs81Ey9f08rkW66UkHEUWv5rqieRBPdsKZkoQnMw5Hx6knmwU1iUAJUlW
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
Subject: [PATCH v4 19/30] xen/riscv: introduce event.h
Date: Mon,  5 Feb 2024 16:32:26 +0100
Message-ID: <a57aed8d2d8424c63b1f27d007b2d5cfe35460cc.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4:
 - s/BUG()/BUG_ON("unimplemented")
 - s/xen\/bug.h/xen\/lib.h as BUG_ON is defined in xen/lib.h.
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
index 0000000000..b6a76c0f5d
--- /dev/null
+++ b/xen/arch/riscv/include/asm/event.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_EVENT_H__
+#define __ASM_RISCV_EVENT_H__
+
+#include <xen/lib.h>
+
+void vcpu_mark_events_pending(struct vcpu *v);
+
+static inline int vcpu_event_delivery_is_enabled(struct vcpu *v)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+static inline int local_events_need_delivery(void)
+{
+    BUG_ON("unimplemented");
+    return 0;
+}
+
+static inline void local_event_delivery_enable(void)
+{
+    BUG_ON("unimplemented");
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


