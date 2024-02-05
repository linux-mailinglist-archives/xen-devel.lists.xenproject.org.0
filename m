Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29EF2849E3E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 16:33:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676211.1052307 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y1-0003Im-OS; Mon, 05 Feb 2024 15:33:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676211.1052307; Mon, 05 Feb 2024 15:33:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rX0y0-0003BP-Ve; Mon, 05 Feb 2024 15:33:04 +0000
Received: by outflank-mailman (input) for mailman id 676211;
 Mon, 05 Feb 2024 15:33:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TPgQ=JO=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rX0xx-0007I6-GU
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 15:33:01 +0000
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d7da89d9-c43b-11ee-98f5-efadbce2ee36;
 Mon, 05 Feb 2024 16:32:59 +0100 (CET)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2cf4d2175b2so51938751fa.0
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 07:32:59 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 s1-20020a056512314100b005114d401157sm474445lfi.2.2024.02.05.07.32.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 07:32:58 -0800 (PST)
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
X-Inumbo-ID: d7da89d9-c43b-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707147179; x=1707751979; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7y/mb9zRfl82LoI+/wV6Uo5A2HP42Gm2KKQIS8V0N2w=;
        b=IUNwMfYUD14wOJYgArrkYudTVxLlKZqZtsk5BTzy9nQDy7UnJJ8mT4ngv/K+FWl689
         Ja5x3vRhUW6/5nMtTkKluuc8Jz4YsKUkL6rSXQddSW7IZITtnMFJDLNbBPkxphfr6AMQ
         jbVeaWvgwWD7lEEBLEJ3Keq4KjQNp5xS2HeBYzNfjARZAxwrbt1tpjughcN4qtJIwqKA
         M9C76CNfAmq0d9xtTF/IswzIU+82CXkRJoUxLbII+jUwy8ygU5tM5ObLyOprWXAIzHBw
         B+y7gbp0TDKhuqzLkrE3o5OFbM3Wy4nBb9w8beqr0Xgl5S0luc2suIHPGioXAY5UNhWc
         Pxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707147179; x=1707751979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7y/mb9zRfl82LoI+/wV6Uo5A2HP42Gm2KKQIS8V0N2w=;
        b=cdvWprqGp8xcHIvN4+9bd217MUnP2tyO0sfgkTbN/MKxa7qSDNmmg7VXgXlRlSI9Dp
         aJEYdiH/uyHc/KMte7UkfrTSecZ4d4PmqV7enj2VlDVTaAEErOe1k4Ccw/BM9eZOGu2A
         T+kcuWj9weH9DR3mGwZLcKQ5Akq6MkYzuG8PAMvmKkvW6mHX8BzEKpA8Qzi4tNFoZNSw
         P96p18VYL1+FA2g2WpWF9d+4YM4+4HEzd0pvphvY+yJ8yoH6ur/cOJ2gCy4o7NhPfJEJ
         1XgkF5uVEM2f5DH6utVNzMiCPNER1sp7i81RdV8OIyUOw48WY/OKVhzen6ZyQcjlLOq8
         lnJw==
X-Gm-Message-State: AOJu0YzsH62+VD+c7noF9Mi78y35LlPE/kS6WD4rRjfHN3tGhU1IiMwT
	2UgrV2ru8Z2BY43R6sPSq8UUgYM/2s0Q2HbksQbF5x8CQg0Xtw69ln7wJd+v
X-Google-Smtp-Source: AGHT+IESW/KeXOwEVS0hk9Mu825OKbeA8BW1rAcOgqkk5KyjZhQ2QtdkURrz2cCoHf+RsnV3HWEzbA==
X-Received: by 2002:ac2:58dc:0:b0:511:4f2a:3ff8 with SMTP id u28-20020ac258dc000000b005114f2a3ff8mr2264718lfo.67.1707147179026;
        Mon, 05 Feb 2024 07:32:59 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXm9QxYDlF3e9hFbfLvTxkGIdysntha7dD/yORxMYb8xmcjeXqW6Bg+te1SGI1adMJDNZxVxaJFF4n89MU6gvyoiGayzDJCtg+o6vAZsJGe+MMt9vt+Toqf2qWonl1mq3s+8l8jLRmshWw5JxA+/HEGVj3F/KuSDtMEu5zbhPPlSlIDK+Xk+mGR2GBksLI2MBUbWDURfpHqnWscY5w2bVXcArIYvUEe41UaTTcuy2eb/4Y2Hrx78hbDU0COsQNQIqUZ+ieI7rmYuo48X0een5D4OpuYPVUorwpdg0LRU3bpAD03O+8KMVQwP38Dpun8LAGjWhal
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
Subject: [PATCH v4 17/30] xen/riscv: introduce regs.h
Date: Mon,  5 Feb 2024 16:32:24 +0100
Message-ID: <13cfdfa01b303d2597124f09c0ec0734859b697d.1707146506.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707146506.git.oleksii.kurochko@gmail.com>
References: <cover.1707146506.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
------
Changes in V4:
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - s/BUG()/BUG_ON("unimplemented")
---
Changes in V3:
 - update the commit message
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
 - remove "include <asm/current.h>" and use a forward declaration instead.
---
Changes in V2:
 - change xen/lib.h to xen/bug.h
 - remove unnecessary empty line
---
xen/arch/riscv/include/asm/regs.h | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/regs.h

diff --git a/xen/arch/riscv/include/asm/regs.h b/xen/arch/riscv/include/asm/regs.h
new file mode 100644
index 0000000000..c70ea2aa0c
--- /dev/null
+++ b/xen/arch/riscv/include/asm/regs.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM_RISCV_REGS_H__
+#define __ARM_RISCV_REGS_H__
+
+#ifndef __ASSEMBLY__
+
+#include <xen/bug.h>
+
+#define hyp_mode(r)     (0)
+
+struct cpu_user_regs;
+
+static inline bool guest_mode(const struct cpu_user_regs *r)
+{
+    BUG_ON("unimplemented");
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ARM_RISCV_REGS_H__ */
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


