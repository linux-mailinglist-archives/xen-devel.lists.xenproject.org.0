Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1A67E7DD4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630623.983761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPZ-0001Ec-Mh; Fri, 10 Nov 2023 16:31:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630623.983761; Fri, 10 Nov 2023 16:31:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPZ-00011O-3N; Fri, 10 Nov 2023 16:31:13 +0000
Received: by outflank-mailman (input) for mailman id 630623;
 Fri, 10 Nov 2023 16:31:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPV-0005EV-Dj
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:31:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c5d989b-7fe6-11ee-98da-6d05b1d4d9a1;
 Fri, 10 Nov 2023 17:31:07 +0100 (CET)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9d2e7726d5bso358955666b.0
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:31:07 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:31:06 -0800 (PST)
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
X-Inumbo-ID: 8c5d989b-7fe6-11ee-98da-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633866; x=1700238666; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHzno6h9uBFGxGvjhFAjFnqQB/yf8OhaKSIoS/xZWz0=;
        b=nCxnm7Be9I+eYWPZ5Vnhf6sOUXo8jlWhBwSV+mkqMY8WE54bjvOw7vZ0V68mucGaXw
         Y77CgULLv1e0+NwgH/DlV3+Xs/QiMPpqUFNK0Lwlmya/Hlf54XwPnyvRdPhEDYlxmgGS
         TFSk5EIEMYYfpF/fOqseMEToM4cK9JfsKwkQJmVFs8nr7zfzCGKZhapc6K6RGV8diOlq
         gMJlmpQTquE3VGB2xztPBJpFSHOVarPR50BNWqa9fZzyR6WBVEzMcIQuqoqd3jBdzlBy
         2lCu1nRWZwkiq9e3+pNUJSTAYufoX9zFv0rgTdkwsR73f/6kJ4DR90eX2cDicXdZE1z4
         uKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633866; x=1700238666;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHzno6h9uBFGxGvjhFAjFnqQB/yf8OhaKSIoS/xZWz0=;
        b=dUyrQbxVq25118mojwMko0SRSBwgmCJgtx3AkvhaSVY1yFA7PBKG+6bfIPVEdvkZ8X
         ERpsge/2VJ70A1G7Jn017yNkNeq20D476H93FwGfD5kYrMAtvlH0IyrXG1xbVlteB562
         meO2sLYgg0n+2Mz8panXW9OSU6xN8xXcmAn3KiFor/3Psrfj7Stj/na9GVpxfmNoTvA3
         D/fjIE60I+18W7UGnj5WvXQKS3YUJHJ8rAeQdDsmFYztfvtgMiwmfqFljVEskLI8Dagi
         sehezwVuIHYpPg4KKFOxuOdWFoP9To76YAa+P/udB3Sc7lG0t80QCM/YJZa8BMpwjgI1
         BWUg==
X-Gm-Message-State: AOJu0YwE46Co5yhBAnJQ1dx8LJRVHhGdEqlXchyI5uZjDjaFcVse/KUT
	z08eCXrUb664jClzy4BzDb78GrVOlyU=
X-Google-Smtp-Source: AGHT+IG6L4ccTy35MbMPwMCMhtXb1QDKZ5Xsp9/zU8x68WGzI1cDUSAZZ7ndinthPI3J5QUO4b3eYg==
X-Received: by 2002:a17:907:268c:b0:9bd:d7bd:1a52 with SMTP id bn12-20020a170907268c00b009bdd7bd1a52mr6805165ejc.20.1699633866276;
        Fri, 10 Nov 2023 08:31:06 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 15/15] xen/asm-generic: introduce stub header softirq.h
Date: Fri, 10 Nov 2023 18:30:41 +0200
Message-ID: <4eec527706ddeaa91ba1dbb6da723ad3e21c067c.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/softirq.h> is common between Arm, PPC and RISC-V so it is
moved to asm-generic.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
    - update the commit message.
---
 xen/include/asm-generic/softirq.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)
 create mode 100644 xen/include/asm-generic/softirq.h

diff --git a/xen/include/asm-generic/softirq.h b/xen/include/asm-generic/softirq.h
new file mode 100644
index 0000000000..83be855e50
--- /dev/null
+++ b/xen/include/asm-generic/softirq.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_SOFTIRQ_H__
+#define __ASM_GENERIC_SOFTIRQ_H__
+
+#define NR_ARCH_SOFTIRQS       0
+
+#define arch_skip_send_event_check(cpu) 0
+
+#endif /* __ASM_GENERIC_SOFTIRQ_H__ */
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


