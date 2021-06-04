Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A019439BA83
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 16:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136861.253635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQj-0005LV-3e; Fri, 04 Jun 2021 14:04:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136861.253635; Fri, 04 Jun 2021 14:04:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQi-0005I9-Vr; Fri, 04 Jun 2021 14:04:08 +0000
Received: by outflank-mailman (input) for mailman id 136861;
 Fri, 04 Jun 2021 14:04:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gm11=K6=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lpAQi-0004yR-09
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 14:04:08 +0000
Received: from mail-wr1-x434.google.com (unknown [2a00:1450:4864:20::434])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 510db9ae-62bd-4175-9c5b-26835265215a;
 Fri, 04 Jun 2021 14:04:03 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id f2so9408605wri.11
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jun 2021 07:04:03 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id m11sm5422559wmq.33.2021.06.04.07.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 07:04:01 -0700 (PDT)
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
X-Inumbo-ID: 510db9ae-62bd-4175-9c5b-26835265215a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9vD7NkGDkc+IVLjUtVKL1KzFVVpDAskIEMoj4foPPh0=;
        b=akY05cjVG2u0Mf/Ur1k9G+ijD85MCVBcTS5cQxoMRHReBqD1UUr5+rTusPSJUjBFcQ
         xJ5eN+t/caaW7VWfSKfSEp9tAOxtYnT7wP4gt0PBctHI71FMDBhIJElbtcRHq0RZXIqj
         NxjnAOMorjqeNIdAFe72j34/dxhsIEZWYFc8liIEyolGby0H9wUp9V8daZmdeVX1FZ0B
         5SeriQykexYzYAk2IbdrrdTOG9zKvdQJXFBJgXPKvzkZZrm/S0Ymv4tV6g+9IRQBLFvQ
         UPN+cQH55smlaQ153ZgRX0rZF83RKMv1yYNN5C6hN2iKku845JUpznvi7dzmQSIaEGCJ
         OzBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9vD7NkGDkc+IVLjUtVKL1KzFVVpDAskIEMoj4foPPh0=;
        b=EOQd5XlNE3Shcz5WfApF2JDw01RGvITNRDp1FAgBLCXhxkWZNc9qv79T8WUXw+x9s+
         ngSUl51hHweDOS7P4YGZawLU6Yw5T2ytHjI8BllrlXfI1wIjsqyL2CReXcdzKVfBy+A8
         b9eYo1ksgZIwf/XkFfb7lMrJjBIKVYcKrjqud5rUnjtAZC1ksrPWRJE/7ZGD5phbGEA/
         b+WicZ9XM1m5oi9z9IG1/GC5r0WLB3VRCL3uWoOEiHBfelIfxvAAhztF5BH22LKKK5zQ
         LUvq94BOAWfbLMW3Wu5j1nNc2W4Dd47Um9XXm38qqpmDa006LoZW+vlxcx8hlMypuI62
         ELNQ==
X-Gm-Message-State: AOAM532Y3UNqqEhtsKzHjfBuVEy1jjR47Po02fk5T5PmJJg/Aun/gcnw
	xBAHwDzxmUIWlOvyUqiCx6dKlA==
X-Google-Smtp-Source: ABdhPJyoc18GiAJJdLah52gbebIhTBv5cg91BFwDaX7X49x4F2VQ9HNUtagdypEOLgxeAr0vit0AsA==
X-Received: by 2002:a05:6000:6:: with SMTP id h6mr4149822wrx.24.1622815442389;
        Fri, 04 Jun 2021 07:04:02 -0700 (PDT)
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
	patches@armlinux.org.uk,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: [PATCH 1/5] ARM: xen: Register with kernel restart handler
Date: Fri,  4 Jun 2021 15:03:53 +0100
Message-Id: <20210604140357.2602028-2-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604140357.2602028-1-lee.jones@linaro.org>
References: <20210604140357.2602028-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

Register with kernel restart handler instead of setting arm_pm_restart
directly.

Select a high priority of 192 to ensure that default restart handlers
are replaced if Xen is running.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Reviewed-by: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/xen/enlighten.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index 8ad576ecd0f1d..7f1c106b746f8 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -29,6 +29,7 @@
 #include <linux/cpu.h>
 #include <linux/console.h>
 #include <linux/pvclock_gtod.h>
+#include <linux/reboot.h>
 #include <linux/time64.h>
 #include <linux/timekeeping.h>
 #include <linux/timekeeper_internal.h>
@@ -181,11 +182,18 @@ void xen_reboot(int reason)
 	BUG_ON(rc);
 }
 
-static void xen_restart(enum reboot_mode reboot_mode, const char *cmd)
+static int xen_restart(struct notifier_block *nb, unsigned long action,
+		       void *data)
 {
 	xen_reboot(SHUTDOWN_reboot);
+
+	return NOTIFY_DONE;
 }
 
+static struct notifier_block xen_restart_nb = {
+	.notifier_call = xen_restart,
+	.priority = 192,
+};
 
 static void xen_power_off(void)
 {
@@ -404,7 +412,7 @@ static int __init xen_pm_init(void)
 		return -ENODEV;
 
 	pm_power_off = xen_power_off;
-	arm_pm_restart = xen_restart;
+	register_restart_handler(&xen_restart_nb);
 	if (!xen_initial_domain()) {
 		struct timespec64 ts;
 		xen_read_wallclock(&ts);
-- 
2.31.1


