Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7BF81CBE4
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 16:14:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659410.1029033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDO-0008Ji-Cd; Fri, 22 Dec 2023 15:13:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659410.1029033; Fri, 22 Dec 2023 15:13:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGhDO-0008GQ-8n; Fri, 22 Dec 2023 15:13:30 +0000
Received: by outflank-mailman (input) for mailman id 659410;
 Fri, 22 Dec 2023 15:13:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=buqB=IB=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1rGhDM-0007Ie-Ig
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 15:13:28 +0000
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [2a00:1450:4864:20::135])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8bf180e-a0dc-11ee-98eb-6d05b1d4d9a1;
 Fri, 22 Dec 2023 16:13:28 +0100 (CET)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-50e23a4df33so2371283e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 22 Dec 2023 07:13:28 -0800 (PST)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 j7-20020a056512108700b0050e6df07728sm45983lfg.180.2023.12.22.07.13.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 07:13:25 -0800 (PST)
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
X-Inumbo-ID: a8bf180e-a0dc-11ee-98eb-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703258007; x=1703862807; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/0xpdBsVC3QKCmTx90l3z9JYAj2BvdshNF4PB960SQ=;
        b=K4xhFAuAWPN4cjzZfG5nQ0RZCLQhxaFtUBFrx1Q4q0qLVn4gOGZIpB6ldNv36HWT5w
         9YTBiE8rIJ224T6mizYjGvktSAQ9bU3Mw6ZZVXbOoa7ObCHgDgrTX0NPNxvsVhK79zKD
         WLInEDU5KvmFvdNdQeEDsNa1Su07jSABM86ub358xAabhtKPTLBIf3TzWyzdT2rEtQh3
         xNe5ixCrDwO8K3whZ5angauJCHkTS9pGSYJ7OcI+MI8ny1ErtW9/noZQk+3U/kQu2/MX
         xug5HI7u5gui9Lkv5HoNiFPkuvEaHPgPNVX7HWeI9u8YEVcWYM6UM9ZmXhfF7spgbE4p
         3JRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703258007; x=1703862807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/0xpdBsVC3QKCmTx90l3z9JYAj2BvdshNF4PB960SQ=;
        b=qr1Nf41LOqOH016ojQh5lsRJM+IsqaZrPzUUgor6IyLYLZzVFE36oj6rneE/cfPeCH
         K6qsXAHJMV6BAR/XVOzhXFOkDDVMWrRfjL3DJhh+8rYIHgKr6dTZo+/evsanXhqj3PHm
         6Ex3WVRx0hxIlWcPrOo6r954Cv89Gwmbr/yBjqiHhA+rPExBBgMrI6JAu4DC9Xvcqss7
         a1L7ph3vQCgQMZr6raxHea/YlcREtrcQp3Mbw6SiV8KHS2AUCEGFZhjrOeRDcRcJSNLH
         pF1SEHwUbMWisJOMx2/CKTdg9R3b1iEp+Y9OOGkB9nzmmoseD47GiE7wO/NGZPRQSuaU
         P1nQ==
X-Gm-Message-State: AOJu0Yz2MEBGYkL7mkUbESD3SDCJ9CdDQMPrkRk4aLLzZRMFLR4mzhpD
	cVX4eAkO3DRQqBgu+iASf08IYvodD0g=
X-Google-Smtp-Source: AGHT+IFkn3OBlmc1Sd21QuJHCHbRHOG0rsZg/SYbPvs4Ch3lcSTenv+Aly5VmLq354Zc3yJFzyDZbw==
X-Received: by 2002:a05:6512:3b2a:b0:50e:6d0f:4c82 with SMTP id f42-20020a0565123b2a00b0050e6d0f4c82mr421811lfv.6.1703258006868;
        Fri, 22 Dec 2023 07:13:26 -0800 (PST)
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
Subject: [PATCH v3 04/34] xen/riscv: introduce cpufeature.h
Date: Fri, 22 Dec 2023 17:12:48 +0200
Message-ID: <2bdc9b64ebd9be8bf034329f2de5a4011d335e7d.1703255175.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1703255175.git.oleksii.kurochko@gmail.com>
References: <cover.1703255175.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V3:
 - add SPDX and footer
 - update declaration of cpu_nr_siblings() to return unsigned int instead of int.
 - add Acked-by: Jan Beulich <jbeulich@suse.com>
---
Changes in V2:
 - Nothing changed. Only rebase.
---
 xen/arch/riscv/include/asm/cpufeature.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 xen/arch/riscv/include/asm/cpufeature.h

diff --git a/xen/arch/riscv/include/asm/cpufeature.h b/xen/arch/riscv/include/asm/cpufeature.h
new file mode 100644
index 0000000000..c08b7d67ad
--- /dev/null
+++ b/xen/arch/riscv/include/asm/cpufeature.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_RISCV_CPUFEATURE_H
+#define __ASM_RISCV_CPUFEATURE_H
+
+#ifndef __ASSEMBLY__
+
+static inline unsigned int cpu_nr_siblings(unsigned int cpu)
+{
+    return 1;
+}
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* __ASM_RISCV_CPUFEATURE_H */
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


