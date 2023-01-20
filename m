Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 346EB6757F4
	for <lists+xen-devel@lfdr.de>; Fri, 20 Jan 2023 16:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481864.747129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssO-0000pn-DW; Fri, 20 Jan 2023 15:00:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481864.747129; Fri, 20 Jan 2023 15:00:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIssN-0000hO-T9; Fri, 20 Jan 2023 15:00:19 +0000
Received: by outflank-mailman (input) for mailman id 481864;
 Fri, 20 Jan 2023 15:00:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RVut=5R=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pIssK-0006Kg-SR
 for xen-devel@lists.xenproject.org; Fri, 20 Jan 2023 15:00:16 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26156ae8-98d3-11ed-91b6-6bf2151ebd3b;
 Fri, 20 Jan 2023 16:00:16 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id d14so1414359wrr.9
 for <xen-devel@lists.xenproject.org>; Fri, 20 Jan 2023 07:00:16 -0800 (PST)
Received: from localhost.localdomain
 (lfbn-gre-1-240-53.w90-112.abo.wanadoo.fr. [90.112.199.53])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002bdbead763csm25349811wrf.95.2023.01.20.07.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 07:00:15 -0800 (PST)
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
X-Inumbo-ID: 26156ae8-98d3-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SUG1QTMGPWyaQd+Wzg6VRLvIzEpGSEc+bJIbP4HX+Ac=;
        b=BUzCp98P2KOhLr2xTPj8dfCxehOuf8RpFf/IIH+m9Dvk9buBG26N+OEouINtD4tWKx
         BNBHn3E1J49dz8d0SE+6SOV+Ayp1vswtlZkrdE5xMNuCXjuSnY8RiiIOs0DZuvnmuBc+
         Q9eIjCj72Ol/NRq0g1hsjBCH5mi9pY4gWd9YowkeNaAExQHiRc4iajd1+mmyatXi4E5N
         2cohliapAgw23gsVY9tNQJakdH2QxVGKwHn2xxsE5z59y1F9l7kHgg0JaAM2+1yYkOCx
         6sGxWGLM5b+Ly0ebXvTRuPl5q5q6jhrAEk66iQ3rO09Rk9Ocsvn6qw8gXlKal6KAuY1h
         LhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUG1QTMGPWyaQd+Wzg6VRLvIzEpGSEc+bJIbP4HX+Ac=;
        b=YTpzHGPDRO3dNEmqY+gP1aEiMdwHjc7UazK1yP54ZTp5PqzxnO1LOL89s+13o2OS2K
         zxHiYyTVXQOsGo79S/L9o9MhPHPX819NubQdU196b/lSj+m3hZ8/b0T1Ql92s9aEgjRw
         JH+JLCC11vOyDy+3L3SkLPKVnfoAM0xXxxsPPUIMhbxv2QkVaJ5CLdyrE8yVFTchVo4C
         738e+9NtOZtHu89tPS0fxE480BbNe0vb77Disg6T9gt999k8LQDrSXOBIfBdgYoyDk2s
         YR+alN04O2Cs2bcRlI1e6SBWNFft5cyuR3A/Oq82jLntZVk2zh5gCTbX/qZBoQksGqlA
         woKw==
X-Gm-Message-State: AFqh2kptdI9njuhyWkhtLSVy9w5gLkKHKRH+Vt3Cd666IqFTAh0ulaoz
	VR+idJ2TauhA18uUrA08TvB9qOxXmx7GPA==
X-Google-Smtp-Source: AMrXdXsikABfoFsOfWXV3DcSlpLN++qeOfD9vBk6m7CYBLT/K/Rzbxd8OY/6qrcT/YvP8Yw90QI3Ew==
X-Received: by 2002:a5d:68c9:0:b0:24f:11eb:2988 with SMTP id p9-20020a5d68c9000000b0024f11eb2988mr14058938wrw.71.1674226815692;
        Fri, 20 Jan 2023 07:00:15 -0800 (PST)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gianluca Guida <gianluca@rivosinc.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Connor Davis <connojdavis@gmail.com>
Subject: [PATCH v1 13/14] xen/riscv: test basic handling stuff
Date: Fri, 20 Jan 2023 16:59:53 +0200
Message-Id: <10254478415a1417872a5c89cba1811b6483fd78.1674226563.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1674226563.git.oleksii.kurochko@gmail.com>
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
 xen/arch/riscv/setup.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 174e134c93..35ab9d25c6 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,6 +1,7 @@
 #include <xen/compile.h>
 #include <xen/init.h>
 
+#include <asm/bug.h>
 #include <asm/csr.h>
 #include <asm/early_printk.h>
 #include <asm/traps.h>
@@ -15,12 +16,27 @@ static void setup_trap_handler(void)
     csr_write(CSR_STVEC, addr);
 }
 
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
 void __init noreturn start_xen(void)
 {
     early_printk("Hello from C env\n");
 
     setup_trap_handler();
-    early_printk("exception handler has been setup\n");
+
+    test_macros_from_bug_h();
 
     for ( ;; )
         asm volatile ("wfi");
-- 
2.39.0


