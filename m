Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E5B39BA84
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 16:04:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136862.253645 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQo-0005f1-CX; Fri, 04 Jun 2021 14:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136862.253645; Fri, 04 Jun 2021 14:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQo-0005cp-7f; Fri, 04 Jun 2021 14:04:14 +0000
Received: by outflank-mailman (input) for mailman id 136862;
 Fri, 04 Jun 2021 14:04:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gm11=K6=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lpAQn-0004yR-0S
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 14:04:13 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 508581bd-cdd7-44cf-a786-69867cd0155c;
 Fri, 04 Jun 2021 14:04:04 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a11so7563099wrt.13
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jun 2021 07:04:04 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id m11sm5422559wmq.33.2021.06.04.07.04.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 07:04:02 -0700 (PDT)
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
X-Inumbo-ID: 508581bd-cdd7-44cf-a786-69867cd0155c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TEh1khdRrbKOISh67J2riVpfOYD6OGYoV3WdgW9rcJ0=;
        b=nbeaNWdBnTcP7bz1VBo8ORkE7GXcmZ9WULwc9d53BO3FJsVDxfvMLco7Jdi8xDopSW
         rFy3A0cnyioI9Du7UwC11so/a/emXg9SmX89XwsXCX5PaimX++OUSF1pmOmzDjPSJ563
         7KFOmY8D3Adm6+/EaZXeJifRRsQf4TM1fcsM4mdfUuAE8wpGiEtPHYeK25qBDNx3FX1l
         FVS9pptxb5ACR0S1LvelYbp3SQvbYCD1/z9hRSFTg44QPcwlGsK3ziy22bSbbPIeLBwq
         2RB1U4q1ThxkuhSrx8E1G/ve/dmSXoAlyAyj1BJwgzWp2AZfBYGVio/AYt62J9+48+g7
         WH9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TEh1khdRrbKOISh67J2riVpfOYD6OGYoV3WdgW9rcJ0=;
        b=A8b5+y4h6zECFuB3MhGKNtGBw7Fps6K2Eb1/swJS2eO+lOD6jhVv5nPh663Dpy0h1r
         5HPohO4mDXP7aCrSYb3HpUBwBkEQTTosyCb08r36etlTJKIQgYss59HqHLiRGrFJOxxH
         39WnjAazWsoWzOtB3ve7G7gcCMwWAgcyfq2e0Z5EpfraIy5TmPZ2bf6YqInTVH49PnVa
         EFj3RLrr6mufmtcPTi+8OPT8jGskX2C/fE7jNJjD6IPer+6z6Hi4kV5o4pHLoP2v3rHT
         2RxcAm8le0BcsOOI3SQDQDq1fG6xcoEpl3yTxRN9LSso77BbweKnh6MZ/AUOyUwhL10B
         XEXw==
X-Gm-Message-State: AOAM532/oMuwOZBe8Rlf3wzWJxbQVKve2+uA6Ns1n0qitcP3JMMzgWrX
	WIXT+HzgyoMkQMb3H1g9KzdssA==
X-Google-Smtp-Source: ABdhPJw1kAi2sfOb54fRB7u21L2rZpgLmTnYQGXWunLdqkzDvlsLaxCRGrc38uw/MzOLdLP3jwPQtw==
X-Received: by 2002:a05:6000:18ac:: with SMTP id b12mr4005226wri.44.1622815443376;
        Fri, 04 Jun 2021 07:04:03 -0700 (PDT)
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
Subject: [PATCH 2/5] drivers: firmware: psci: Register with kernel restart handler
Date: Fri,  4 Jun 2021 15:03:54 +0100
Message-Id: <20210604140357.2602028-3-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604140357.2602028-1-lee.jones@linaro.org>
References: <20210604140357.2602028-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

Register with kernel restart handler instead of setting arm_pm_restart
directly. This enables support for replacing the PSCI restart handler
with a different handler if necessary for a specific board.

Select a priority of 129 to indicate a higher than default priority, but
keep it as low as possible since PSCI reset is known to fail on some
boards.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/firmware/psci/psci.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 3c1c5daf6df2e..18a47c9d5b02b 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -296,7 +296,8 @@ static int get_set_conduit_method(struct device_node *np)
 	return 0;
 }
 
-static void psci_sys_reset(enum reboot_mode reboot_mode, const char *cmd)
+static int psci_sys_reset(struct notifier_block *nb, unsigned long action,
+			  void *data)
 {
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
@@ -309,8 +310,15 @@ static void psci_sys_reset(enum reboot_mode reboot_mode, const char *cmd)
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
+
+	return NOTIFY_DONE;
 }
 
+static struct notifier_block psci_sys_reset_nb = {
+	.notifier_call = psci_sys_reset,
+	.priority = 129,
+};
+
 static void psci_sys_poweroff(void)
 {
 	invoke_psci_fn(PSCI_0_2_FN_SYSTEM_OFF, 0, 0, 0);
@@ -472,7 +480,7 @@ static void __init psci_0_2_set_functions(void)
 		.migrate_info_type = psci_migrate_info_type,
 	};
 
-	arm_pm_restart = psci_sys_reset;
+	register_restart_handler(&psci_sys_reset_nb);
 
 	pm_power_off = psci_sys_poweroff;
 }
-- 
2.31.1


