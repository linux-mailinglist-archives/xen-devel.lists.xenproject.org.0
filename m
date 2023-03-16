Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 259B36BD283
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:40:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510654.788781 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolf-0008Tm-M7; Thu, 16 Mar 2023 14:39:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510654.788781; Thu, 16 Mar 2023 14:39:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolf-0008QF-I6; Thu, 16 Mar 2023 14:39:47 +0000
Received: by outflank-mailman (input) for mailman id 510654;
 Thu, 16 Mar 2023 14:39:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcold-0006WA-2L
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:39:45 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 64934f96-c408-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 15:39:44 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id h8so8552102ede.8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 07:39:44 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060e5000b008b980c3e013sm3970187eji.179.2023.03.16.07.39.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:39:43 -0700 (PDT)
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
X-Inumbo-ID: 64934f96-c408-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678977584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNIHclMhI5KuwmYwhjT6HcX6NDeB8oTP6k36A94QyFI=;
        b=keNi+Wzsq/txMnFyrCdFK4A4FXIN/Ea07piF1la+gIIHgFHXPCbI/gOJsicHBRlidY
         pXODQq5/RmI+X7VnsXohPg6shzJkHH+qPLPzZkblP7PlxY4RXREXi5UVVFgB13cgIRsk
         p6ayJgAxbszEC8NVwXfBBy4KbZx+8Xg70npQdGbI2afl0Rl5WbYgbwGZmDIcU+VrpTjR
         YreTiCbHymPHippLLc6nnTPsGMmkQjAiuak7qn1PmYxpxR2rBUkCcIG4BS03vtrlPGu6
         FHNbkqastSn7QOFMbp/AdBrsHC+IFyld/SKq5o3RRflLQcyl7QN+vMWEKnv7Hc1f0tSj
         TNAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNIHclMhI5KuwmYwhjT6HcX6NDeB8oTP6k36A94QyFI=;
        b=as2RqKxeHfKQueCVqIEsvB8fYjM+MIKXQAJ8hYGyFIhHYZMzJHJm5kBz2u02DryCMQ
         pst3QD5KFVLuofWKoBgRQy5gejHKq+L8viJbUBFWpvVPxGdcK2B44fDcgHDFYQiaNcbE
         QMeTCibPSniO2KX57Gx8l3KAhoTdW4BRGDG7VuWRrUSqAabhqu3RAv05qsHYvWi2BXds
         U/7J1iLb3EdMbYN4lrqZ+mCKz1XlN+5MpVwbYG09gE2KCk0IkayLtn4i5Lo0ksEzyStL
         F75LiWxrq9Sk6AGNqWEGTm4tyDMBa533QDIAOyDcJr2TnAHh5VPlB6EuuHaXmiXdABja
         S0Zw==
X-Gm-Message-State: AO0yUKUpv3I12ZnS1UWc/ZfTM9+30AxTbl38m5wr53BzXc3+dMVGBJCd
	9iJUw+ujB/XUXsG95Oc+MdCs9op4SZOEUQ==
X-Google-Smtp-Source: AK7set/q4NXUwR3SV1sseVDhD2AxPdVUBDFZ+lrU4KLqNb7ipT+JcRZrfX4irnegkux3kx3BQVRovQ==
X-Received: by 2002:a17:906:702:b0:913:ff28:59bd with SMTP id y2-20020a170906070200b00913ff2859bdmr10540338ejb.52.1678977584126;
        Thu, 16 Mar 2023 07:39:44 -0700 (PDT)
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
Subject: [PATCH v5 7/7] xen/riscv: test basic handling stuff
Date: Thu, 16 Mar 2023 16:39:29 +0200
Message-Id: <7aaf322d5314688039212251f5202ef4cdb46f14.1678976127.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678976127.git.oleksii.kurochko@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Acked-by: Alistair Francis <alistair.francis@wdc.com>
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
index b44d105b5f..b56c69a3dc 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,3 +1,4 @@
+#include <xen/bug.h>
 #include <xen/compile.h>
 #include <xen/init.h>
 #include <xen/kernel.h>
@@ -27,6 +28,20 @@ static void fill_boot_info(void)
     boot_info.load_end   = (unsigned long)_end;
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
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                unsigned long dtb_paddr)
 {
@@ -36,6 +51,8 @@ void __init noreturn start_xen(unsigned long bootcpu_id,
 
     trap_init();
 
+    test_macros_from_bug_h();
+
     early_printk("All set up\n");
 
     for ( ;; )
-- 
2.39.2


