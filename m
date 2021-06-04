Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CDF39BA88
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 16:04:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136866.253679 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAR3-00072V-Jg; Fri, 04 Jun 2021 14:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136866.253679; Fri, 04 Jun 2021 14:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAR3-0006zS-Fi; Fri, 04 Jun 2021 14:04:29 +0000
Received: by outflank-mailman (input) for mailman id 136866;
 Fri, 04 Jun 2021 14:04:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gm11=K6=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lpAR2-0004yR-0z
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 14:04:28 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4a30cf7f-335f-42dc-a0af-7fe29a653ac5;
 Fri, 04 Jun 2021 14:04:07 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u7so3998858wrs.10
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jun 2021 07:04:07 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id m11sm5422559wmq.33.2021.06.04.07.04.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 07:04:06 -0700 (PDT)
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
X-Inumbo-ID: 4a30cf7f-335f-42dc-a0af-7fe29a653ac5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D6QyFvCrmM9/eKIfxG4Pm00YDFikRvR7iKb/WRsmrRM=;
        b=rnXl1mp749C3drgrMS8qg9OrEpVG5gyjtC/beupAd1e0u7I2C0SA+eLYqiAZo4zOf1
         q05qwrZm55jTi+ifKRg8eXWpkJEyVRxtH/IgUYGbEZ70EVHfHrPyla7TPIzoc3bF3HUY
         38N+YHqp0zTbzFzoCmx/yOn7e0FImL+E1RzKDH7btVNuv4yY5751UVI1bLnrNl7scCoW
         LFc1Ih93JSdQok29RWgqRhCojCLYOg62P4bYX/nGU9EOEWtNNXBLPDIFNWoTmUP22sU3
         JvGp1+ARt/xYZhTOdzb03Rb1/7Tbwwe1vK1CD+EZtoPQYOnPg1dx3h+YFx/bg1nj1AhS
         +DAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D6QyFvCrmM9/eKIfxG4Pm00YDFikRvR7iKb/WRsmrRM=;
        b=RJfAxYxCOiJ8a+O5eYoO/1acQrZ5xlUo+H4d2GmXTcbyOzjidBpKbCs3ciSyBLNBk7
         exV9mFxneljJrqEImXSD4J+LSDVHFRTLTzHL7acbTPIRK7OYnOhiPmh1rdU4JDZsSH5g
         CoXqnUF0VRllaeFbwljLN+5kDdvEqBUGaHZwneHFEzLI6smx1S0oRrKqvvw7I+pRH5hJ
         /p6ZKoRHoEPrAPiOdh9OH5Zr9fX5+JXRl0P/pC8g57r9BG3gAuS+KIxWw0vW4BJ9hMHE
         RAWai+xTCCbPJSUc62Y1lhyNorspIonlUV0b/znHQq1qU2Mk4fa0DqyKJvWm/CbTcE+d
         F4EA==
X-Gm-Message-State: AOAM531bTbnMUGkz3F2tG0BtCvc1f2KRrTqxwxf4tj+HS7U+e+Y+ZzgN
	4/ynJlgAGcUxQrqoox5fLPKqDQ==
X-Google-Smtp-Source: ABdhPJy6Bn0tgDEaDDg7jaA3vOqPTriXmMlbNfufQjcNecRNKMp6REhDzJ4KHPqHqkOmLTOy8DweYw==
X-Received: by 2002:adf:f7c3:: with SMTP id a3mr3659762wrq.253.1622815446460;
        Fri, 04 Jun 2021 07:04:06 -0700 (PDT)
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
Subject: [PATCH 5/5] ARM: Remove arm_pm_restart()
Date: Fri,  4 Jun 2021 15:03:57 +0100
Message-Id: <20210604140357.2602028-6-lee.jones@linaro.org>
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
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/include/asm/system_misc.h | 1 -
 arch/arm/kernel/reboot.c           | 6 +-----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/system_misc.h b/arch/arm/include/asm/system_misc.h
index 66f6a3ae68d27..98b37340376bc 100644
--- a/arch/arm/include/asm/system_misc.h
+++ b/arch/arm/include/asm/system_misc.h
@@ -13,7 +13,6 @@
 extern void cpu_init(void);
 
 void soft_restart(unsigned long);
-extern void (*arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
 extern void (*arm_pm_idle)(void);
 
 #ifdef CONFIG_HARDEN_BRANCH_PREDICTOR
diff --git a/arch/arm/kernel/reboot.c b/arch/arm/kernel/reboot.c
index 0ce388f154226..3044fcb8d0736 100644
--- a/arch/arm/kernel/reboot.c
+++ b/arch/arm/kernel/reboot.c
@@ -18,7 +18,6 @@ typedef void (*phys_reset_t)(unsigned long, bool);
 /*
  * Function pointers to optional machine specific functions
  */
-void (*arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
 void (*pm_power_off)(void);
 EXPORT_SYMBOL(pm_power_off);
 
@@ -138,10 +137,7 @@ void machine_restart(char *cmd)
 	local_irq_disable();
 	smp_send_stop();
 
-	if (arm_pm_restart)
-		arm_pm_restart(reboot_mode, cmd);
-	else
-		do_kernel_restart(cmd);
+	do_kernel_restart(cmd);
 
 	/* Give a grace period for failure to restart of 1s */
 	mdelay(1000);
-- 
2.31.1


