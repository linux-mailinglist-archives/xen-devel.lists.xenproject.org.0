Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C32439BA87
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 16:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136864.253667 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQy-0006Wp-9I; Fri, 04 Jun 2021 14:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136864.253667; Fri, 04 Jun 2021 14:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQy-0006Pf-5D; Fri, 04 Jun 2021 14:04:24 +0000
Received: by outflank-mailman (input) for mailman id 136864;
 Fri, 04 Jun 2021 14:04:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gm11=K6=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lpAQx-0004yR-0q
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 14:04:23 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2187f623-5ad3-49c0-8329-fb79e8419f1a;
 Fri, 04 Jun 2021 14:04:06 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l11-20020a05600c4f0bb029017a7cd488f5so5724173wmq.0
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jun 2021 07:04:06 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id m11sm5422559wmq.33.2021.06.04.07.04.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 07:04:05 -0700 (PDT)
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
X-Inumbo-ID: 2187f623-5ad3-49c0-8329-fb79e8419f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QaJICWaLVjdKyiczP8R7DVAA/JKj3/g1GzNXgU/ERjo=;
        b=OtKIdFz91o6zSGDVTQZvGzg/E3WbsLPBQt+zn0ndJ5AES765uw0NRLSuW7BmM1XIIb
         KSmT00ThuHMEyNqcf0APky2O0X+Fz0wCuAj+ufEoElBLQgTbz+i02lN3/Zf1im09zpDW
         V7M1w+GKAjj8vX7fR+3Ffa8zGHIP9mnEFe/wg7tdUMuHD2MA56Co5BpmNTswwnhnzJZ3
         9c7ENbHX2CdAaMwDB25ftfd7WDxFryEsXCCExLyCZAO6YcPG/2o+q800T9B4mz1KOZRv
         aTr3DUL+N94+eGQZxLu/MEdvv+3cWnjJfA40LNQyMNgeg0oJvNtkbZAD86ICk+f88Itg
         u7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QaJICWaLVjdKyiczP8R7DVAA/JKj3/g1GzNXgU/ERjo=;
        b=HgC7ZIaLn6mpcVm80S8G69AOrROHDIvzdL4XOfucjymHlP9IpGo6lA9LWmiDIejg6b
         omb6WL2LQSyeTnz5YSYQ6fA4W/kAWdDjpCnRQqEhsBaK0eO4/aipEL8ny+2WagL52M9I
         f8SHjCORpuqp0qREZjBvZwxkU54wxDiNrl5cNcL9C581X/i4YKV4Z8Q2fsINwky9xYpf
         jUWYZM67A2yDidOEIeqAgTLf75OwLT/+TieJoNDAW5GrqHte13+W9o+amOcXivtSkzwP
         t9TbQYhYfckQwEcPWpUwfaK8YQW+aTVjx09Oge+Y+5Nocx9FTcwLIh25wKNlxllc4zx/
         ku2g==
X-Gm-Message-State: AOAM530dnuECTrYcnnaOXQssNjz5OjXc+YYeUUw36IaMG75WqrUkle9R
	8r25w1SEQCAtqRB7iU9QS7uXuQ==
X-Google-Smtp-Source: ABdhPJxkeeHzpVP/eH19on7AKsxKyxYqA03gG6EEjmBqwHMSrKqjg6lHl/nEqHDgTjEVI8pTSN1dXw==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr3940993wmj.128.1622815445465;
        Fri, 04 Jun 2021 07:04:05 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org,
	linux@armlinux.org.uk,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	lorenzo.pieralisi@arm.com,
	sstabellini@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	linux@roeck-us.net,
	treding@nvidia.com,
	arnd@arndb.de,
	xen-devel@lists.xenproject.org,
	patches@armlinux.org.uk
Subject: [PATCH 4/5] ARM64: Remove arm_pm_restart()
Date: Fri,  4 Jun 2021 15:03:56 +0100
Message-Id: <20210604140357.2602028-5-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604140357.2602028-1-lee.jones@linaro.org>
References: <20210604140357.2602028-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

All users of arm_pm_restart() have been converted to use the kernel
restart handler.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm64/include/asm/system_misc.h | 2 --
 arch/arm64/kernel/process.c          | 7 +------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/arm64/include/asm/system_misc.h b/arch/arm64/include/asm/system_misc.h
index 673be2d1263c4..305a7157c6a6a 100644
--- a/arch/arm64/include/asm/system_misc.h
+++ b/arch/arm64/include/asm/system_misc.h
@@ -32,8 +32,6 @@ void hook_debug_fault_code(int nr, int (*fn)(unsigned long, unsigned int,
 struct mm_struct;
 extern void __show_regs(struct pt_regs *);
 
-extern void (*arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
-
 #endif	/* __ASSEMBLY__ */
 
 #endif	/* __ASM_SYSTEM_MISC_H */
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index b4bb67f17a2ca..5591725cebccc 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -72,8 +72,6 @@ EXPORT_SYMBOL(__stack_chk_guard);
 void (*pm_power_off)(void);
 EXPORT_SYMBOL_GPL(pm_power_off);
 
-void (*arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
-
 static void noinstr __cpu_do_idle(void)
 {
 	dsb(sy);
@@ -201,10 +199,7 @@ void machine_restart(char *cmd)
 		efi_reboot(reboot_mode, NULL);
 
 	/* Now call the architecture specific reboot code. */
-	if (arm_pm_restart)
-		arm_pm_restart(reboot_mode, cmd);
-	else
-		do_kernel_restart(cmd);
+	do_kernel_restart(cmd);
 
 	/*
 	 * Whoops - the architecture was unable to reboot.
-- 
2.31.1


