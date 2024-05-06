Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 585938BCBBC
	for <lists+xen-devel@lfdr.de>; Mon,  6 May 2024 12:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.717438.1119709 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNk-0003cq-5A; Mon, 06 May 2024 10:15:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 717438.1119709; Mon, 06 May 2024 10:15:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s3vNj-0003XA-VO; Mon, 06 May 2024 10:15:39 +0000
Received: by outflank-mailman (input) for mailman id 717438;
 Mon, 06 May 2024 10:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loHM=MJ=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1s3vNh-0001cU-Mx
 for xen-devel@lists.xenproject.org; Mon, 06 May 2024 10:15:37 +0000
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [2a00:1450:4864:20::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 94dcaa4f-0b91-11ef-909c-e314d9c70b13;
 Mon, 06 May 2024 12:15:36 +0200 (CEST)
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-a59a64db066so393437066b.3
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2024 03:15:36 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 h8-20020a17090634c800b00a59b8e16ac7sm2160242ejb.36.2024.05.06.03.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 03:15:35 -0700 (PDT)
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
X-Inumbo-ID: 94dcaa4f-0b91-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714990536; x=1715595336; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jf9UofV0vIWQlCtbQGQy8Ck6PFeBmxijL+bZKvWBsVk=;
        b=ghCWMiuN2+grDHY8T2rXY6Sdzykafex+KcV1GwX5FneyOhP2ApULZUe6KJ/RzcUwZ1
         5530FGkYHvy2e/kxEq+Rez/h+numDfNSnRUa8beCQC9vDWtIWakD4ok2J8rzx9qFTyoG
         LSgiXiQWV11eJHPb5cAnHcQQ7k0ZZr+FpykTSYPQadNQhXTT5LIUN9PKYTevK+B3VzPB
         N9JmDQ3JywbiAZFby2dMmGe7JYoXa9k4Q23AFKqLtSF60L3teRxUAPUWULKoBUvwdhsv
         odaT/Sj1a8fRkifN8IkbUrvCXbP9JlYEobgLWERja3Xk8zcDo3kpPHPfK5YcmVYKwv2I
         5b0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714990536; x=1715595336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf9UofV0vIWQlCtbQGQy8Ck6PFeBmxijL+bZKvWBsVk=;
        b=n8+iT2q9tiZJbOTu7Hr/80GmT+N7lE6ZObPW0xUb3sbDiTb1tzDBXVlSwWAE8sKLec
         No1Gj/kqkIDKJXxm3XZTAuvrnJNka+vCuXxwcQDr+v6dtbhFzgqILutOo0eZHqX2yRpD
         /MoXpOdayG+85sNUTzboIdtkEniLSv251/mTrm5KO7ZWA8qtFkxJDS3U76IbVYv5qsd0
         MQDyiRuBnS/bRXQKeg6sgjhUX3/jJyFqrWMUqZp8FvNCsHnAWtwIY15RcGuJ9n566clr
         uH0yp+TOdwUHM5uBugkosmQrzBKGRMSXAYdjpw9olXAeLToARW/Q42vdk0XedrTwPFbi
         61CQ==
X-Gm-Message-State: AOJu0YwO94albt9tLbUg0+BXDAw8bHsW0cDcIHBav9wgX2PFh/WGjxsd
	6JzXzEMil3U6vmKwKI9etna2mMZ2AeyR5JHIgK+VRB677BAbIi6vVbD/zg==
X-Google-Smtp-Source: AGHT+IHxi8paI+7rmQfjcJQcWkUjlIL7zhwGgI71wFUh0EOdA+5cg0YJ6HlMYOOi1/TJrC6dxQ+91g==
X-Received: by 2002:a17:906:b08b:b0:a59:a3ef:21f9 with SMTP id x11-20020a170906b08b00b00a59a3ef21f9mr3956496ejy.52.1714990536058;
        Mon, 06 May 2024 03:15:36 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v9 08/15] xen/riscv: introduce monitor.h
Date: Mon,  6 May 2024 12:15:17 +0200
Message-ID: <e5fbacd0a8ef222087dbe969a912dec0e2bc3af9.1714988096.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <cover.1714988096.git.oleksii.kurochko@gmail.com>
References: <cover.1714988096.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V4-V9:
 - Nothing changed. Only rebase.
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
2.45.0


