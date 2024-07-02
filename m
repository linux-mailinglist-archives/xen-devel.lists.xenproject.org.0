Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E49923C51
	for <lists+xen-devel@lfdr.de>; Tue,  2 Jul 2024 13:24:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.752363.1160609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObcC-000353-9Z; Tue, 02 Jul 2024 11:24:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 752363.1160609; Tue, 02 Jul 2024 11:24:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sObcC-000323-4w; Tue, 02 Jul 2024 11:24:04 +0000
Received: by outflank-mailman (input) for mailman id 752363;
 Tue, 02 Jul 2024 11:24:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/Tas=OC=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1sObcA-0001m7-Gs
 for xen-devel@lists.xenproject.org; Tue, 02 Jul 2024 11:24:02 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94aa26d5-3865-11ef-aaf1-7f3abd7486c0;
 Tue, 02 Jul 2024 13:24:01 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2ec52fbb50aso48157091fa.3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jul 2024 04:24:00 -0700 (PDT)
Received: from fedora.. ([94.75.70.14]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ee5161fb73sm16149981fa.33.2024.07.02.04.23.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 04:23:59 -0700 (PDT)
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
X-Inumbo-ID: 94aa26d5-3865-11ef-aaf1-7f3abd7486c0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719919440; x=1720524240; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EYmnnYmgVza05GF6fpOBaADbngQ5M4w1OoEJiW0icp8=;
        b=W5ZTzFUQOux2RJ8Buswq9fw9famJXf03G1CKqiPuWxOMJpLNaeIbsDvWj5udzivTKV
         iGwrMIdOIKQKr2C+EL6eY9pdXb5Gu2kYHTq1IfXg5iJJ6F7sXrls3mOSBxqIwqUxvFbu
         QrAVpam1A5+tCe5UCVDTpp8okCfhT75WWTjK93zOLSaXDgt71GhzfIfwgWFMNI0+WLzP
         RMt1dW94yJLIkYs9xa1P2crQY9cXI2cc8/HOyTM5CJVSXyhricIrFLPaONrsXz0yPmtm
         vHA66EEh9/oeC7YdfQf+/fEOWgOObyuTXfPDX9KlBioshHAlZmdG2mK5PCkYbfvQKJcq
         daYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719919440; x=1720524240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EYmnnYmgVza05GF6fpOBaADbngQ5M4w1OoEJiW0icp8=;
        b=asovltt8sBDXsIVo6tx1m0tA1lk/BoHeOZ9efMFBhUMn1Ys5nSvInrNjb5KWVIK7/r
         CGpcyfw/Mqx3e16zOidxr1RWAeImiW63xaalCwp7zV2b08iqhNWWoocDKqOeiB3zJNDj
         wCQtPsuqFQRNRtRFflzpIQbDkkdqw7kOX5V6EC4sJjkM+kwwkBsI67ivVCJ8aSq29FwG
         MZl+TiLCNhvCheFZEH21Mp1/4gQ1DjgxbWabfA1zzGqWPEE9duuG7yxBYkbD87LAUpdR
         lI1lVNe304Irx32biwxsaJb0uKQnIFzIwq7DoTV6YN6x5om+q2CYkpR6Fnu1aesbN17h
         QNmw==
X-Gm-Message-State: AOJu0YzD9llM92ze8HYYJmwqdwgYO7T8zN24NX1I4JMuQKxKp05JWfoH
	0h70G9N1MYz90Oyo/vl/Jpho4xwJRTNBgTqY7xFFahMIp5ESYROD9SiEDEkk
X-Google-Smtp-Source: AGHT+IHYTf6HF0P3BWYkFwBSVYHBFrWyjoQVEpopSu2ldqdVn8B7GSlePCb+UyIE/s1epVk5jRn+fA==
X-Received: by 2002:a2e:a5c4:0:b0:2ee:5ec1:1838 with SMTP id 38308e7fff4ca-2ee5ec11928mr75360291fa.30.1719919439742;
        Tue, 02 Jul 2024 04:23:59 -0700 (PDT)
From: Oleksii Kurochko <oleksii.kurochko@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bob Eshleman <bobbyeshleman@gmail.com>,
	Connor Davis <connojdavis@gmail.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v9 5/5] xen/riscv: test basic handling stuff
Date: Tue,  2 Jul 2024 13:23:50 +0200
Message-ID: <62cce91351f00f80cb1c7701906e2d8cd3301ec1.1719918148.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1719918148.git.oleksii.kurochko@gmail.com>
References: <cover.1719918148.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
---
 xen/arch/riscv/setup.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index a6a29a1508..4f06203b46 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -19,6 +19,20 @@ void arch_get_xen_caps(xen_capabilities_info_t *info)
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+static void test_run_in_exception(const struct cpu_user_regs *regs)
+{
+    printk("If you see this message, ");
+    printk("run_in_exception_handler is most likely working\n");
+}
+
+static void test_macros_from_bug_h(void)
+{
+    run_in_exception_handler(test_run_in_exception);
+    WARN();
+    printk("If you see this message, ");
+    printk("WARN is most likely working\n");
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                paddr_t dtb_addr)
 {
@@ -26,6 +40,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     trap_init();
 
+    test_macros_from_bug_h();
+
     printk("All set up\n");
 
     for ( ;; )
-- 
2.45.2


