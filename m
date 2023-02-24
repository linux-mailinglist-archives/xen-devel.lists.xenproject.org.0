Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 207AD6A1B6C
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:35:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500950.772540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWM8-000816-8g; Fri, 24 Feb 2023 11:35:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500950.772540; Fri, 24 Feb 2023 11:35:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWM8-0007ya-5X; Fri, 24 Feb 2023 11:35:16 +0000
Received: by outflank-mailman (input) for mailman id 500950;
 Fri, 24 Feb 2023 11:35:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWM6-0007Ri-67
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:35:14 +0000
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [2a00:1450:4864:20::229])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4d9edc5d-b437-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 12:35:13 +0100 (CET)
Received: by mail-lj1-x229.google.com with SMTP id h3so7820599lja.12
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:35:13 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a05651c031900b00295a8d1ecc7sm50489ljp.18.2023.02.24.03.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:35:13 -0800 (PST)
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
X-Inumbo-ID: 4d9edc5d-b437-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IcCcmDaZL5zu7cfe/7cHTiIVDkNgVS1oXLcUiC5qO7w=;
        b=JK3DMo2dMWh8dHqhVMFgjt/8fBVa204x55PqUZhNMcPl/464ndON30L8Gxp6y9mpDt
         HgAAYeyp4JGL2FjqSo8MCaVJHs7mhoW6pMBKY4A/GyW2N9dF/N6ggBMfM/BYVCu/d6qO
         t1Bsk4A0HQ/8pPyoXmyxS3HHoqpqpjOYT2TyNsAMeNqbB5bWUhnJ5lu9Ha631xMZ+Yvq
         ijKZ4nGskNg2xI07SDBO1c57YboWiyupmVEcttAyW8b67wEuJVUdlPZd9uWrsGua8K3w
         u1wdhALPqpJkXjXdfeAiQ0Hh5/7lz1HRPyJMWYuu7di3qR0rpvDBnDQSnnNgKzvJjKwg
         mqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcCcmDaZL5zu7cfe/7cHTiIVDkNgVS1oXLcUiC5qO7w=;
        b=rEkongJXukuMETybYXu4/Dvwyjarsw+B/ROKX9G2gBQXstSadVTXq0XhphMrFGCC4t
         wxnABcB8JQvFLNjl3tK/AwaDKSKH7/mvhwnJ8Rdb7IkE9F5HXLEHcDsGXNrtebQ/ILvA
         YBRY/d3Opz7sSgZPumXl3Z//xxQHFlY44vrGBC+y/da1NqACEAGw7rn6Oc3vPfGMlAdp
         6IzzHV4EQ1HZ/+0RSVdFmoyDpMr/N6Bm+VO2DNChq4EC+U/2jVhCvzAB0uZX3RmH2FFJ
         7hqQRMPPKmrXaKSuZDFpSdG1I0tIdAeScVSPqOn069I/JfgrUjM0wQSFU+OVVu0Vz5Go
         oL5Q==
X-Gm-Message-State: AO0yUKW4HBcK+aU9ojrhoaWbX0/gQe6SzHH6Iq4MedvGd7qbeIRNvQNx
	6xLrLG/FRzW0QEnyfL7GqaaF4f0pJU4=
X-Google-Smtp-Source: AK7set/EXM1tkclqIwZBSYHsUoP7ePa7hIn3WHt4VPvdZEUY/320uQhvIUMa3beAC7izmOId4sJqNA==
X-Received: by 2002:a05:651c:547:b0:294:6361:6fe6 with SMTP id q7-20020a05651c054700b0029463616fe6mr7081109ljp.8.1677238513273;
        Fri, 24 Feb 2023 03:35:13 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Julien Grall <julien@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v4 2/5] xen/riscv: introduce trap_init()
Date: Fri, 24 Feb 2023 13:35:02 +0200
Message-Id: <b1b2252d3105eeaf0cee10ae2be253c8526d0e5c.1677237653.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677237653.git.oleksii.kurochko@gmail.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
Changes in V4:
  - Nothing changed
---
Changes in V3:
  - Nothing changed
---
Changes in V2:
  - Rename setup_trap_handler() to trap_init().
  - Add Reviewed-by to the commit message.
---
 xen/arch/riscv/include/asm/traps.h | 1 +
 xen/arch/riscv/setup.c             | 4 ++++
 xen/arch/riscv/traps.c             | 7 +++++++
 3 files changed, 12 insertions(+)

diff --git a/xen/arch/riscv/include/asm/traps.h b/xen/arch/riscv/include/asm/traps.h
index f3fb6b25d1..f1879294ef 100644
--- a/xen/arch/riscv/include/asm/traps.h
+++ b/xen/arch/riscv/include/asm/traps.h
@@ -7,6 +7,7 @@
 
 void do_trap(struct cpu_user_regs *cpu_regs);
 void handle_trap(void);
+void trap_init(void);
 
 #endif /* __ASSEMBLY__ */
 
diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index d09ffe1454..c8513ca4f8 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,7 +1,9 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/csr.h>
 #include <asm/early_printk.h>
+#include <asm/traps.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
@@ -11,6 +13,8 @@ void __init noreturn start_xen(void)
 {
     early_printk("Hello from C env\n");
 
+    trap_init();
+
     for ( ;; )
         asm volatile ("wfi");
 
diff --git a/xen/arch/riscv/traps.c b/xen/arch/riscv/traps.c
index 29b1a0dfae..ad7311f269 100644
--- a/xen/arch/riscv/traps.c
+++ b/xen/arch/riscv/traps.c
@@ -13,6 +13,13 @@
 #include <asm/processor.h>
 #include <asm/traps.h>
 
+void trap_init(void)
+{
+    unsigned long addr = (unsigned long)&handle_trap;
+
+    csr_write(CSR_STVEC, addr);
+}
+
 static const char *decode_trap_cause(unsigned long cause)
 {
     static const char *const trap_causes[] = {
-- 
2.39.0


