Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9927E7DD0
	for <lists+xen-devel@lfdr.de>; Fri, 10 Nov 2023 17:31:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.630617.983708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPQ-0007hk-DL; Fri, 10 Nov 2023 16:31:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 630617.983708; Fri, 10 Nov 2023 16:31:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r1UPQ-0007Zo-59; Fri, 10 Nov 2023 16:31:04 +0000
Received: by outflank-mailman (input) for mailman id 630617;
 Fri, 10 Nov 2023 16:31:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zww5=GX=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1r1UPO-0005Bj-Mk
 for xen-devel@lists.xenproject.org; Fri, 10 Nov 2023 16:31:02 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 88e389cb-7fe6-11ee-9b0e-b553b5be7939;
 Fri, 10 Nov 2023 17:31:01 +0100 (CET)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53df747cfe5so3776182a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 10 Nov 2023 08:31:01 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm4128966ejb.46.2023.11.10.08.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Nov 2023 08:30:59 -0800 (PST)
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
X-Inumbo-ID: 88e389cb-7fe6-11ee-9b0e-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699633860; x=1700238660; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uwoCpnzzrrgzgPgK1t3bRDD5n2e+2jmc1wxLNSR5C0E=;
        b=X7b1Mb1EKlkYZHRwutw9EfEnCrjdDkNrLswD59HZ2DwiXBOp1cYbmG90Z6UW4abk1w
         mQRzXOrcOuBgAydPxK9vuI9sPniOl3veLQ/WNGALXIYhmV5Tg4SEFxahl+PC0Tthurha
         DqVVXoD+FOGlAyEwP+giq5NmfenbPRkOFPGVVFUNWB5nx42+nf4TInJq2gv+YxTZQ7W3
         tlkoatzKfvkLF2DGdLQQlRlH6tH4bt9GBc1wOMfEF4x9Ikl2vFOBy/5RwLIOEWfLa9oI
         mBtNb5mbP3Bk6vSA39fYEYEmmI6UiagJjrYl8Ad5ghG6ZNbI7UmzYgygjPSy+IVk+kxt
         DIsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699633860; x=1700238660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uwoCpnzzrrgzgPgK1t3bRDD5n2e+2jmc1wxLNSR5C0E=;
        b=sD0v8fxFQx5dEuAZc3Nln2qWCWGU7Byrt2fzjySnVePBoEwNb+EUU+WBiHBIZRUkau
         B+odzuUTngfqafhxaBI6ANrMg42vpGxCKsMTQBxGgVNfnCxGNE/cMCtVkpCTE5ESQQJe
         aGRI06Ic77mLjcyykY8m5pALUbiNTuakif0vukhQ7RwIeLMZ28nQ1UW/k+j1Zim7CEWP
         fIAQuP8PHXmEPVs1dgDtc+RcsEVxB8wgVfOr+EDRoig/jQ2zm2WygCdtjDdvkHQCsJpT
         sNEskETOEypwJw84QFCDDLz4Xlg2MGoAgfr9EEZPb12lwwQFWav+RuIiZZn1PLB4pxMt
         k5Ew==
X-Gm-Message-State: AOJu0YxI2P5h70ykVMiAW/z5yvgtuLJ0ZFURph7j7ryfWRVxrkSCQKj2
	qv35N84vvJ1vF66BR2yvNg9lv73w/Mk=
X-Google-Smtp-Source: AGHT+IFiAgypV9Aie5vuC9zDH2JDclGSJi8rbqt3C0eUenX2KnqxV1wLnxsCPNIKUBuLIju2CeueeQ==
X-Received: by 2002:a17:907:3d91:b0:9b2:df16:851d with SMTP id he17-20020a1709073d9100b009b2df16851dmr5634285ejc.57.1699633860188;
        Fri, 10 Nov 2023 08:31:00 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 09/15] xen/asm-generic: introduce generic header smp.h
Date: Fri, 10 Nov 2023 18:30:35 +0200
Message-ID: <bf7b027f7ae05533a6b2034e2ad4882ae27f2c67.1699633310.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1699633310.git.oleksii.kurochko@gmail.com>
References: <cover.1699633310.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

<asm/smp.h> is expcted to be generic between Arm, PPC and RISC-V
there by it is moved to asm-generic.

Right now it is common only by PPC and RISC-V but during work on
support of the mentioned arhcs <asm/smp.h> is expected to be the
same.

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V2:
	- drop #ifded ASSEMBLY as this header isn't expected to be included in asm files.
	- update the commit message.
---
 xen/include/asm-generic/smp.h | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 xen/include/asm-generic/smp.h

diff --git a/xen/include/asm-generic/smp.h b/xen/include/asm-generic/smp.h
new file mode 100644
index 0000000000..6740a2064c
--- /dev/null
+++ b/xen/include/asm-generic/smp.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_GENERIC_SMP_H
+#define __ASM_GENERIC_SMP_H
+
+#include <xen/cpumask.h>
+#include <xen/percpu.h>
+
+DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
+DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
+
+#define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
+
+/*
+ * Do we, for platform reasons, need to actually keep CPUs online when we
+ * would otherwise prefer them to be off?
+ */
+#define park_offline_cpus false
+
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: BSD
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.41.0


