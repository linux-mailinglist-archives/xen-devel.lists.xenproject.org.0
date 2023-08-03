Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E15BA76E7CD
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 14:05:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.576308.902321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX5B-00045U-EL; Thu, 03 Aug 2023 12:05:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 576308.902321; Thu, 03 Aug 2023 12:05:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRX5B-000418-3n; Thu, 03 Aug 2023 12:05:33 +0000
Received: by outflank-mailman (input) for mailman id 576308;
 Thu, 03 Aug 2023 12:05:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DEIV=DU=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1qRX59-0002sb-M7
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 12:05:31 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0af92a90-31f6-11ee-b268-6b7b168915f2;
 Thu, 03 Aug 2023 14:05:31 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4fe1c285690so1484750e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 03 Aug 2023 05:05:31 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 e22-20020ac25476000000b004fdfefdf4acsm3304557lfn.39.2023.08.03.05.05.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 05:05:29 -0700 (PDT)
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
X-Inumbo-ID: 0af92a90-31f6-11ee-b268-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691064330; x=1691669130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VSibP5eTiQgTk20HjOHTiUPAjHnFr8NTK33Zlp/pEgM=;
        b=W6CAZlzPU+q9DyJ4PxnDSCSGu2OKImYbHfsVDqpgeVcB03n78aqZo+OJFUKhCPpqvA
         3SGs0+aJjno9H1WyopozDLnhJxISIFMSaxf5NLJQGEzb1CHm3DRvfh91cn4q4EnPj/3q
         3a8Ty1x2z0FR5T7q7R4eXyMRFrgt1P1V6BAZYkNWfIfMb00+HcdlcLNohfNaY8ftV67s
         5f5FqWruN5SCnuRSge+9zxNRYLGgHQYSuE2wFv3eZOP/uzY3NBlO7s9B0QGBVll4u7mP
         NFqXGNaUDBqtsDocKl8aBME+k7rlfkieewXMxj3i5iq1bVXVPJulwavaLh5wgZhIicWm
         0VXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691064330; x=1691669130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VSibP5eTiQgTk20HjOHTiUPAjHnFr8NTK33Zlp/pEgM=;
        b=EOC2fxJzBMSbmepzTzArxx+7G03PXK0jH5oK5t2wuCoSqiBY/DSO1a+4rf+8zuFFuQ
         aA4ell+Ff7PmY5c63LVaPXCdhyocZsweivTg5Bud1cXJ4n9RFf5Uz8R/xvKa6tBidS50
         roUiDXwt9lTA81oYvIWTB1XojQsRVGkWVV6VF4j6C54ATEQYrslA9eXR2oHOHhla1XJ7
         h++MAQK5BwQDBLnO7DAG1RcrgHY/z++XEm34l+/pOSlJC8IFAe5gfwTOkk1HI/AV9dmH
         4IBxlbkWCecZLEo+Jw77YAhplxlxBDPZjTC7ZSQHQMNHXb+UHrUZ4T2LEx9zOr96gPNo
         chHQ==
X-Gm-Message-State: ABy/qLbKmrqzKWkCdOeR8AM/isJExFwj4ZqcEPwPo+PN37X6sJxQEMqx
	VAzKicEwdV2JJ7hehx2audqx4a88GWg=
X-Google-Smtp-Source: APBJJlG4UqEUWpc3dVF03OxtTwW2iHbpqYjBVtCRroEIaKyZdZ+eNxE4rlulDSKQ0g3NphinHlIrvA==
X-Received: by 2002:a05:6512:2521:b0:4f7:6775:2a66 with SMTP id be33-20020a056512252100b004f767752a66mr8694805lfb.53.1691064330433;
        Thu, 03 Aug 2023 05:05:30 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v7 6/6] xen/riscv: test basic handling stuff
Date: Thu,  3 Aug 2023 15:05:22 +0300
Message-ID: <89553c7196a3e01294a17a0ae3946544b1b14e04.1691063432.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1691063432.git.oleksii.kurochko@gmail.com>
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V6:
  - Nothing changed. Only rebase.
---
Changes in V6:
  - Nothing changed
---
Changes in V5:
  - Nothing changed
---
Changes in V4:
  - Add Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Nothing changed
---
 xen/arch/riscv/setup.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index abdd1669c6..ab83f84e67 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
+#include <xen/bug.h>
 #include <xen/compile.h>
 #include <xen/init.h>
 
@@ -11,6 +12,20 @@
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+static void test_run_in_exception(struct cpu_user_regs *regs)
+{
+    early_printk("If you see this message, ");
+    early_printk("run_in_exception_handler is most likely working\n");
+}
+
+static void test_macros_from_bug_h(void)
+{
+    run_in_exception_handler(test_run_in_exception);
+    WARN();
+    early_printk("If you see this message, ");
+    early_printk("WARN is most likely working\n");
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
@@ -18,6 +33,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     trap_init();
 
+    test_macros_from_bug_h();
+
     early_printk("Hello from C env\n");
 
     early_printk("All set up\n");
-- 
2.41.0


