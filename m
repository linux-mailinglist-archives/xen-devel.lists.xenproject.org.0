Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD2B6A1B6F
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 12:35:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500951.772552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWMB-0008Ky-KJ; Fri, 24 Feb 2023 11:35:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500951.772552; Fri, 24 Feb 2023 11:35:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVWMB-0008IC-EX; Fri, 24 Feb 2023 11:35:19 +0000
Received: by outflank-mailman (input) for mailman id 500951;
 Fri, 24 Feb 2023 11:35:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AdiI=6U=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pVWM9-0007Ri-Cr
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 11:35:17 +0000
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [2a00:1450:4864:20::236])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f91104c-b437-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 12:35:17 +0100 (CET)
Received: by mail-lj1-x236.google.com with SMTP id j17so14022782ljq.11
 for <xen-devel@lists.xenproject.org>; Fri, 24 Feb 2023 03:35:17 -0800 (PST)
Received: from 34-6F-24-FC-D2-65..
 (46.204.108.92.nat.umts.dynamic.t-mobile.pl. [46.204.108.92])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a05651c031900b00295a8d1ecc7sm50489ljp.18.2023.02.24.03.35.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Feb 2023 03:35:16 -0800 (PST)
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
X-Inumbo-ID: 4f91104c-b437-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIxTAP/3TGyxLcEVY7CEZJFocAqIc1IBpnueXSNtmDY=;
        b=U+larZamfCH9mQ/VwojXLUSZs/o1gPlNXvwsNihd1K3DkqNEk91cGqCfuf2gQCJ66A
         DWwEsKOI28MaozS1WldORIM81djT2x+Mp+icOsWqOsZR8tohe3uewbUpJvTSZXfFims7
         h7L/bo6K4+yxAPi/i1/ZojVrte53Xj3t+oZnc1W4eBaWkUXrtPnpnfw7VokgxWvcl4o7
         rnMlfplee6O11yKaPFmgAcdL0irYbbcBOGfvTfT92KMwUgT1pornu+8so/qrTn1wLa9W
         8/alYmPjcxS/8xrXx69JldcsmyBhm9V8JJCJt14BnQeBROJx6nnonlfdWRzIF0TyYEkG
         ZV8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hIxTAP/3TGyxLcEVY7CEZJFocAqIc1IBpnueXSNtmDY=;
        b=1wL1mwKKYolNxyLMhXgiK+UDs+DWUoKT5CutLIULCmBdTCn19MdZwPGQE33rlfa+Rm
         HXRxmZ+M05eAk4o7/KDFa999JvlOTUabs5QDGRpT5W/cU3qKpVhT6RuttT1bWErSgA9k
         xMpJ5iQscGrq+InTWPBA023u2qPG9HXHfcBt1OsU/2mienwumZRXe/VDycrsYsDXLYVq
         7PbFWSXeJQllTGzXDf5gvksYdKJiH5ZPvaT7w0wf4giE6ECK6wmSoT0t6XeV//HFwm0l
         6+mK/A8J97DkcPdgHc71XT/gjUcVQjn9QB6M+L1iUgxV3Ngyxmeg7Oc0M9EjeTHL5Bw1
         pblQ==
X-Gm-Message-State: AO0yUKUHalsvaub/XSgdCqexhz6+OgXovHG/bB1v3/jWqzMne07ubXqv
	wkAnEpCO9XHlxR6v7Gl2ss6ZETNrNj8=
X-Google-Smtp-Source: AK7set/C7+Z9LsxeOBSwfXCljzTFBvEwKy3H2gCJtW4JKrebBOV4qBcf2dZyo9tINQj1Ny2AzLC+/g==
X-Received: by 2002:a2e:7d08:0:b0:293:51ba:24b3 with SMTP id y8-20020a2e7d08000000b0029351ba24b3mr5522813ljc.41.1677238516392;
        Fri, 24 Feb 2023 03:35:16 -0800 (PST)
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
Subject: [PATCH v4 4/5] xen/riscv: test basic handling stuff
Date: Fri, 24 Feb 2023 13:35:04 +0200
Message-Id: <e45d81c0c3be7f7f3ca37e307625a878b9c2a390.1677237653.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <cover.1677237653.git.oleksii.kurochko@gmail.com>
References: <cover.1677237653.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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
 xen/arch/riscv/setup.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 73b9a82883..b3f8b10f71 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -10,12 +10,28 @@
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
 void __init noreturn start_xen(void)
 {
     early_printk("Hello from C env\n");
 
     trap_init();
 
+    test_macros_from_bug_h();
+
     for ( ;; )
         asm volatile ("wfi");
 
-- 
2.39.0


