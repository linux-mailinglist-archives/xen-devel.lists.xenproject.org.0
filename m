Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9920B81CC21
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:22:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659519.1029223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhMD-0004k7-Rl; Fri, 22 Dec 2023 15:22:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659519.1029223; Fri, 22 Dec 2023 15:22:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhMD-0004ht-Ob; Fri, 22 Dec 2023 15:22:37 +0000
Received: by outflank-mailman (input) for mailman id 659519;
 Fri, 22 Dec 2023 15:22:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDi-0007Ie-Hb
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:50 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b519b854-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:48 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2cc9b31a27bso23537211fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:48 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:47 -0800 (PST)
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
X-Inumbo-ID: b519b854-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258028; x=1703862828; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iERJyBx2zMVd360kKc+64bkAZfqJHhsH6Dyb71/j52s=;
        b=lpW5iBbGPGBe8aLwrbtplCJn+VbwEn9UvWXayFFBFdJMoxk1QV+34671A8HGV2aMzA
         YXUvJEQGoARfqzM2T0ULoS7YhiUZ4BRt3T8y8jrQJAsWAMGSiwV8F5rXdk1bL9VsTjZp
         NNPoU4SRjt+cnCUvxYwGY9f5/TnPxEQCo+26wjYM2wQ/2qfRF3TGU4i/RNRsDyRpAMZE
         SLD0RoaXUXqfB064HzxpZ0N0y+KgmxWhOJFMRM5n4GjvaGFSGKovUU8PJkWN8wk8Occb
         8qsS9ZG4WnaYIZ3zMGVq5O4WX5DB+L+7a+gwtClMSZICxdpnRIr4Tsa5QV69DICbvbJo
         9XJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258028; x=1703862828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iERJyBx2zMVd360kKc+64bkAZfqJHhsH6Dyb71/j52s=;
        b=MZfhe8659YumzskbeqM5Q8rHY2kSFpQtlyZGtvoE8cSP9MuGAhZGOC9c/aheRIEYg+
         W4MKQMz0bGRHWsznMHKiHMD7RghTef+JJDAQh49Chxwy/RjMuxW5YY6bMBkxt4Pzs+/J
         l+Ddn7XTiS0gqnlND+bra2G2ksJJgU3gwFqBu6yPmxXEDqAAarPqvVyGbwFpA/4+v1mo
         f36EJSiIfyXakM+e9P0LO0l9EpzcMClveLdKVKXM5RxMVieHdU4Fbk5TBDhml0ltTkbq
         vDLe9SFiixiQeSZg5H7vF4N1TSxVXqjEkmrJcXfEy+ZSDWKHpyT2HIF/b4pkqF13EsHK
         DUmQ==
X-Gm-Message-State: AOJu0YwB8IannZJ8NLXKFQeOYLMFLSWNC2PjRPmdbrVe+/V8ZNa8v9ir
	87OJ7kwG4X6ADmkn2jxmvOh5Y7irQx8=
X-Google-Smtp-Source: AGHT+IHNxMCwb10deT2JxAljJ2aSodr2v2rO1rU8SU44/5s1W0y/552HAFefOab01+7bbyoHQhsDfw==
X-Received: by 2002:ac2:4a67:0:b0:50e:6d96:4b28 with SMTP id q7-20020ac24a67000000b0050e6d964b28mr203058lfp.137.1703258027760;
        Fri, 22 Dec 2023 07:13:47 -0800 (PST)
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
Subject: [PATCH v3 22/34] xen/riscv: introduce regs.h
Date: Fri, 22 Dec 2023 17:13:06 +0200
Message-ID: <3d1ae540120804af5fc812a1492931afac66bd39.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
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
index 0000000000..86bebc5810
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
+    BUG();
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


