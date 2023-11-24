Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD007F716C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 11:31:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640373.998466 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSz-0008Qz-Bd; Fri, 24 Nov 2023 10:31:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640373.998466; Fri, 24 Nov 2023 10:31:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6TSy-0008Fj-VT; Fri, 24 Nov 2023 10:31:20 +0000
Received: by outflank-mailman (input) for mailman id 640373;
 Fri, 24 Nov 2023 10:31:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fpHI=HF=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r6TSx-0006hy-3W
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 10:31:19 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9a7433d9-8ab4-11ee-98e2-6d05b1d4d9a1;
 Fri, 24 Nov 2023 11:31:18 +0100 (CET)
Received: by mail-ed1-x530.google.com with SMTP id
 4fb4d7f45d1cf-549070a04baso2368717a12.3
 for <xen-devel@lists.xenproject.org>; Fri, 24 Nov 2023 02:31:18 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 g1-20020a170906348100b009de3641d538sm1882374ejb.134.2023.11.24.02.31.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 02:31:17 -0800 (PST)
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
X-Inumbo-ID: 9a7433d9-8ab4-11ee-98e2-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700821877; x=1701426677; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaJa/anRsPuG7MeMh544Xo5c3C5PAbaeHXhCV9tyhpk=;
        b=c10mioMTRAWYSSGTb4rvUEO+2vJ+0vnBXIUNxfcmeofnHc09Ymq8+Nhvy+D8bcpAhl
         uiFEFMitWkhqixwOLA3mv7yJUvgk6fxrlP+C9UIcDejJvD3dyePilDg7ZhMF33Z6vtB1
         R3IN/DILhuWzGVfauDT+gCg4PG+sN4OGl53U2NIe7QvTTxliGKr0khuHEiEmY+0addSp
         fG2DXQYBgiKrKYmSYqWHmFhhGXWUyYv+vE31bbtbM9woO+j8vMwQmCjeT1KJ0I5w+1Lg
         SzXekLaERf4wDBUDrshL/dRwp1zPjPAcm95XOS9kxlc55d9W+LNDL3exScfXIZCZSSdB
         7AFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700821877; x=1701426677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaJa/anRsPuG7MeMh544Xo5c3C5PAbaeHXhCV9tyhpk=;
        b=DPUTEhKMWN4yX09I64YPCq/0e5bTmUijj+wmtM6lY4VxO7TCfT/X7nhugmXc7wzsFl
         5xgXBhQb6YoHCey10kZjfoMErqf8HgmGoOM+Uo7/7xUp7i/9JIC9+20LEvgxr7lrGYpk
         Vd75uXTqwBWMKDvUXTtXtUwPCqbUCA+LgPb6zsXr5QVB6tHkZlG4S1BnbKOlunYDp/re
         aka5uJTS4A39Bmo94r+I5Y4tVU8SGmVk6Xcc2MQ38ShRe+62l4l8+WniYleNZXZivcBj
         ItDaIAdHvFA3t87tZJs7fPFX82zzU0dlMaj6+alX8R/36AkaL2uA6hrNQl1WtYD8ilou
         1v/A==
X-Gm-Message-State: AOJu0YyGcnhsbCA/q67N2sEcfXq4BPOzD1nlELAhURRt/Jo165cMz7vd
	oNnZFksAUv6QCRX+bw+bPFviH1fAMLpL/Q==
X-Google-Smtp-Source: AGHT+IGFEiiTBiGvAR5ACWWHdqbdx+B2BrVyRLY75ufFR8vh9qZRtycnueln5Q8tQMjDSWelWaqYFw==
X-Received: by 2002:a17:906:1ccd:b0:a00:a591:929 with SMTP id i13-20020a1709061ccd00b00a00a5910929mr1842188ejh.24.1700821877430;
        Fri, 24 Nov 2023 02:31:17 -0800 (PST)
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
Subject: [PATCH v2 08/39] xen/riscv: introduce asm/cpufeature.h
Date: Fri, 24 Nov 2023 12:30:28 +0200
Message-ID: <b8fcdd22462ffa71a058e63dbf874dfc858264df.1700761381.git.oleksii.kurochko@gmail.com>
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
 xen/arch/riscv/include/asm/cpufeature.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h

diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 0000000000..211827f816
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,22 @@
+#ifndef __ASM_RISCV_CPUFEATURE_H
+#define __ASM_RISCV_CPUFEATURE_H
+
+#ifndef __ASSEMBLY__
+
+static inline int cpu_nr_siblings(unsigned int cpu)
+{
+    return 1;
+}
+
+#endif /* __ASSEMBLY__ */
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
+
-- 
2.42.0


