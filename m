Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD206BD282
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 15:39:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510648.788722 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolX-0006mx-JQ; Thu, 16 Mar 2023 14:39:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510648.788722; Thu, 16 Mar 2023 14:39:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcolX-0006lE-Fm; Thu, 16 Mar 2023 14:39:39 +0000
Received: by outflank-mailman (input) for mailman id 510648;
 Thu, 16 Mar 2023 14:39:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NB6E=7I=gmail.com=oleksii.kurochko@srs-se1.protection.inumbo.net>)
 id 1pcolV-0006WA-Qr
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 14:39:37 +0000
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [2a00:1450:4864:20::535])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 603c7922-c408-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 15:39:37 +0100 (CET)
Received: by mail-ed1-x535.google.com with SMTP id h8so8550623ede.8
 for <xen-devel@lists.xenproject.org>; Thu, 16 Mar 2023 07:39:37 -0700 (PDT)
Received: from fedora.. (46.204.101.131.nat.umts.dynamic.t-mobile.pl.
 [46.204.101.131]) by smtp.gmail.com with ESMTPSA id
 q16-20020a1709060e5000b008b980c3e013sm3970187eji.179.2023.03.16.07.39.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 07:39:36 -0700 (PDT)
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
X-Inumbo-ID: 603c7922-c408-11ed-87f5-c1b5be75604c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678977576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FKTp6dhD+4idMmK9ijuA9b238S46/VfGSoR4ri38brw=;
        b=jy8u2YoDJFHvNcDmZHex1DeiAuyMUA3z9f6y9fA2TTiO9KjAHPufx9C23cUXZjkrmk
         /yQEKIVernI1kqs+IBjUWBMQ5VDfPuwZQb6/FscIeVv0jEjt4I9+N5LzZ5ShFGoHVo/P
         GImQvTVbwEBoT9Yk9R5O+LI3/x12adNWbmtIDoBhi/7cCjR1Rppv1t+1ObMZi5PsERGy
         Xpwye8I/yxvSBCBnAa21OcLLyU59FYhzCFXwkCigtDjTjPpjfspK/vemHi+v77g4Pq4f
         tm9fk0945NjhfOdOHkX6XXq1Xtr4OgPHWDL8zaDAyUzYiIC+PF3aGHmBkVyg6DiUGGkO
         zCfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678977576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKTp6dhD+4idMmK9ijuA9b238S46/VfGSoR4ri38brw=;
        b=3GQk6BdvCSVHQYZbulkzpemPs2WUzpl0V0Qrq3rZI36+XCMXdyCuOw//46QinwafOj
         v7UAogEFo4OEZPWmbA+Y1nNlOI3GfVDFgtpy9aVaCVZ1c7WXC26Fv1v1mMCNvnwLFDNw
         gqFnKf2ML0Jap/e0zxl7HkParzUPq8spGapinKSUhH+jh63lsCl+1HJFQ2Raao+ZeNMP
         HoZ9yeu3ORQgYZYOyg1cKPsIsRrwDd22BF6fEKRzMtOG57sXDrUBrO52fZlo+ZtvMKVn
         NvsDnzqAwiTt4Rqu5+4I4+qaVHxz+N8Ji6ytBWmlzLAlmGlS4Aiy06Ix2RKgzuqmMvbE
         Vx0Q==
X-Gm-Message-State: AO0yUKVhyMaXvZRO9Wi9QKAGgBcIrCUQ3bh7E3g2767UNsIeT++Dij/L
	sez4GuMmOckmkKuOfGuy5hNSsA0I7JUdCg==
X-Google-Smtp-Source: AK7set8HtsRIID8Vf/liy0Uj8Kik4uprAzIHvvNP/SBbta69oYn2IjTXTo18aEGrsHyRMbTmEiYBEg==
X-Received: by 2002:a17:906:d0cc:b0:84d:3403:f4f2 with SMTP id bq12-20020a170906d0cc00b0084d3403f4f2mr10321182ejb.62.1678977576604;
        Thu, 16 Mar 2023 07:39:36 -0700 (PDT)
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
Subject: [PATCH v5 2/7] xen/riscv: initialize boot_info structure
Date: Thu, 16 Mar 2023 16:39:24 +0200
Message-Id: <1941d4ed64ff6edcc6354d09d6a40db4d6f63c44.1678976127.git.oleksii.kurochko@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1678976127.git.oleksii.kurochko@gmail.com>
References: <cover.1678976127.git.oleksii.kurochko@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
---
Changes in V5:
 * the patch was introduced in the current patch series (V5)
---
 xen/arch/riscv/setup.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/xen/arch/riscv/setup.c b/xen/arch/riscv/setup.c
index 0908bdb9f9..36556eb779 100644
--- a/xen/arch/riscv/setup.c
+++ b/xen/arch/riscv/setup.c
@@ -1,12 +1,16 @@
 #include <xen/compile.h>
 #include <xen/init.h>
+#include <xen/kernel.h>
 
+#include <asm/boot-info.h>
 #include <asm/early_printk.h>
 
 /* Xen stack for bringing up the first CPU. */
 unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
     __aligned(STACK_SIZE);
 
+struct boot_info boot_info = { (unsigned long)&_start, (unsigned long)&_end, 0UL, 0UL };
+
 /*  
  * To be sure that .bss isn't zero. It will simplify code of
  * .bss initialization.
@@ -15,11 +19,19 @@ unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
  */
 int dummy_bss __attribute__((unused));
 
+static void fill_boot_info(void)
+{
+    boot_info.load_start = (unsigned long)_start;
+    boot_info.load_end   = (unsigned long)_end;
+}
+
 void __init noreturn start_xen(unsigned long bootcpu_id,
                                unsigned long dtb_paddr)
 {
     early_printk("Hello from C env\n");
 
+    fill_boot_info();
+
     early_printk("All set up\n");
     for ( ;; )
         asm volatile ("wfi");
-- 
2.39.2


