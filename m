Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD307A08BA
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 17:12:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.602424.939095 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo0i-0001pi-Tu; Thu, 14 Sep 2023 15:12:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 602424.939095; Thu, 14 Sep 2023 15:12:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgo0i-0001mx-Qn; Thu, 14 Sep 2023 15:12:04 +0000
Received: by outflank-mailman (input) for mailman id 602424;
 Thu, 14 Sep 2023 15:12:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9rCx=E6=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qgnmV-0002W4-NX
 for xen-devel@lists.xenproject.org; Thu, 14 Sep 2023 14:57:23 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 01e14105-530f-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 16:57:21 +0200 (CEST)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9c907bc68so17355891fa.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Sep 2023 07:57:21 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 a14-20020a2e860e000000b002b6ffa50896sm309828lji.128.2023.09.14.07.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 07:57:20 -0700 (PDT)
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
X-Inumbo-ID: 01e14105-530f-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694703441; x=1695308241; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gqkhvANInIWgDmOoOPJUCId3lz6JPHGNXOuOXwQD0U=;
        b=oZAP/o6tA7U+vthV+pyrVxTuZjqHO9w506Q3wRghSyFIQYEDIAJD4Sfj1fRF+YG7jq
         q/my5WA1uCl3q2UgjFPK6DnUzc6LNz/UoO1Ylu8TAzcMFYjPp23io2o+4jJbIudkPir2
         jH1wSVT2WH5OsBR9XsXYhNcGzHHpZfcvroTb7rzrbzkwah85tYE51B06VCkvMdPpDUcJ
         NBIzUTAsIkC6esgNu5Cgh70lidPgOT4ub/r4otZ/OiXqBZXj6kzJk1Cl3MmwdqA+SmS7
         tTta2ESa9ZRJ2l1hqoewAQVJj/QcR2JqSGVz4hfg6HcLCM/r/3vpkBSiRj43+OXQw/lq
         Aaag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694703441; x=1695308241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gqkhvANInIWgDmOoOPJUCId3lz6JPHGNXOuOXwQD0U=;
        b=jvSdGYfDj1oOZiUiSACoixvinOBYrCjM+Dm0anW6oXp88BWdt0tqFPap0eb6uL7eLm
         0E2WRVorpHTMLXDWmfCtM6V0esDSvtVNYx+eG22x5zk+JVv3siq7CJmyzBwSvRRC9agR
         LfmlLFHBUW/BunykwKwICzNi7LwP8ryvnvoUGxBL5MD8bI/PPbxEab6niobcxfWuWRKX
         gieI7BbiomjzIX2FNdBkxGN6OriFpquAkCTGITjG9DBot/VMRgOEjvsjPo/Vx6ADglSW
         UQOpenEsu2pbzJavNn9o8zj2K6l4TX1jX8tpxO5RAK7+/vkJQ6WxMYhKc4YuCudRULpR
         1xqg==
X-Gm-Message-State: AOJu0YyNqqrtnxVu6angTigio0XIHGkDe4LXdfinv94NnqhzqD+PUkg5
	GJ5vsi0XlRZhCzDKTzlRrkFJ6nDg4VQ=
X-Google-Smtp-Source: AGHT+IHSLICORFafw9BuEY1nMokrIyXeJugx5OEqDLKMY8O6saI+9vYKCLyW18Rzq5eC+iJwY4lGNA==
X-Received: by 2002:a2e:9b4d:0:b0:2bc:ba71:ddf2 with SMTP id o13-20020a2e9b4d000000b002bcba71ddf2mr5298747ljj.15.1694703440811;
        Thu, 14 Sep 2023 07:57:20 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v1 17/29] xen/asm-generic: introduce stub header percpu.h
Date: Thu, 14 Sep 2023 17:56:38 +0300
Message-ID: <521647680aa5010629ded799010c8f9e5d22cde3.1694702259.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694702259.git.oleksii.kurochko@gmail.com>
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patch introduces header stub necessry for full Xen build.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/include/asm-generic/percpu.h | 35 ++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 xen/include/asm-generic/percpu.h

diff --git a/xen/include/asm-generic/percpu.h b/xen/include/asm-generic/percpu.h
new file mode 100644
index 0000000000..d1069adb61
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
+    (*RELOC_HIDE(&per_cpu__##var, __per_cpu_offset[get_processor_id()]))
+
+#define per_cpu_ptr(var, cpu)  \
+    (*RELOC_HIDE(var, __per_cpu_offset[cpu]))
+#define this_cpu_ptr(var) \
+    (*RELOC_HIDE(var, get_processor_id()))
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


