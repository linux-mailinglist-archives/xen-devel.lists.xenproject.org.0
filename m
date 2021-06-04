Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 701F439BA86
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jun 2021 16:04:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.136863.253657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQt-000643-Ra; Fri, 04 Jun 2021 14:04:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 136863.253657; Fri, 04 Jun 2021 14:04:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lpAQt-00060A-NG; Fri, 04 Jun 2021 14:04:19 +0000
Received: by outflank-mailman (input) for mailman id 136863;
 Fri, 04 Jun 2021 14:04:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gm11=K6=linaro.org=lee.jones@srs-us1.protection.inumbo.net>)
 id 1lpAQs-0004yR-0e
 for xen-devel@lists.xenproject.org; Fri, 04 Jun 2021 14:04:18 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f622367-0396-4b05-8c3d-5a28572d58a6;
 Fri, 04 Jun 2021 14:04:05 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id z8so9414967wrp.12
 for <xen-devel@lists.xenproject.org>; Fri, 04 Jun 2021 07:04:05 -0700 (PDT)
Received: from dell.default ([91.110.221.214])
 by smtp.gmail.com with ESMTPSA id m11sm5422559wmq.33.2021.06.04.07.04.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 07:04:03 -0700 (PDT)
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
X-Inumbo-ID: 8f622367-0396-4b05-8c3d-5a28572d58a6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FXe7mUhRyV1V08UlHOUDRQa+cyJRl+BaTvqQGIK3jgo=;
        b=IaVfsBBg8NR4RGlKN4FA+nCoNqfGwLzQsRsbwt5aa1iwj3NRfw/OtO7jrJTDUGqpMN
         3nVAPuI71sUVJi45TyzxzM5TIPNalhlh3sfTDK715KHFO3Muc2MgflEbEV3Nafl6PD7R
         K+qgau2e3Q9PNbALT3x8rkGgs5+NTyXFUruUWqKYs8PKPFaUyYNz/HKev7bERNhBVieg
         WcZSeH3QkQgKxYNE6LmqUGyhqLYU6HKNSC5G/xK4cRvpuwTtkLy3tg7sD1fN+9iPma7r
         Ej4+LoVtLLElLl53YMXrWShGIRI39H4O94ZsmBzuWC7o70KQiESC9UArUgHuWBqvv5Pt
         e7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FXe7mUhRyV1V08UlHOUDRQa+cyJRl+BaTvqQGIK3jgo=;
        b=bSe1JeLmvoOSR1os0RBjpqVA0SQnrvOBNS+AQH7oMSfM50GFRiWLcHdx8agOja+gGD
         O9bH9nDdpEUzGrhAwjTWOYGrLiEEA3cWI0+lW5+hIyikOv8I0bksggREXng3R8IAX9Vj
         PEW63hGp7GuAL43nDUSTNKUrMgq/CQ/mdtn7V13NInmVtx8lynWY9vI2dAPMnnmsE/4b
         aY/riymMpP/IgxaVL8z06zb80/WcxGqBAZ37Rw028EeXpcfTMzaFih7LvB1etvw0Fxr2
         51pIeF9Q9GFRvEHCGz+IiU1NgXmPlRJP+3uFRIbM8eeOEKMcn7+LZ8CT637kedJNK+Hz
         PU8A==
X-Gm-Message-State: AOAM532nD/wFvjF84CwagK5sKht1XMXjtWFFzirhiERVeMako+eo0D5C
	MWYSCodOvs0RgZsfz+MymnAm2g==
X-Google-Smtp-Source: ABdhPJxEWeGElTopDkHbCuLC8qXXv/5amcTjzy0KQBVFAIdSm17ZnCj3j7C4vGyObQxH79cOOQtMIA==
X-Received: by 2002:a5d:4610:: with SMTP id t16mr3942011wrq.324.1622815444460;
        Fri, 04 Jun 2021 07:04:04 -0700 (PDT)
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
Subject: [PATCH 3/5] ARM: Register with kernel restart handler
Date: Fri,  4 Jun 2021 15:03:55 +0100
Message-Id: <20210604140357.2602028-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604140357.2602028-1-lee.jones@linaro.org>
References: <20210604140357.2602028-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Guenter Roeck <linux@roeck-us.net>

By making use of the kernel restart handler, board specific restart
handlers can be prioritized amongst available mechanisms for a particular
board or system.

Select the default priority of 128 to indicate that the restart callback
in the machine description is the default restart mechanism.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm/kernel/setup.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm/kernel/setup.c b/arch/arm/kernel/setup.c
index 1a5edf562e85e..08c5676477d70 100644
--- a/arch/arm/kernel/setup.c
+++ b/arch/arm/kernel/setup.c
@@ -1081,6 +1081,20 @@ void __init hyp_mode_check(void)
 #endif
 }
 
+static void (*__arm_pm_restart)(enum reboot_mode reboot_mode, const char *cmd);
+
+static int arm_restart(struct notifier_block *nb, unsigned long action,
+		       void *data)
+{
+	__arm_pm_restart(action, data);
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block arm_restart_nb = {
+	.notifier_call = arm_restart,
+	.priority = 128,
+};
+
 void __init setup_arch(char **cmdline_p)
 {
 	const struct machine_desc *mdesc = NULL;
@@ -1149,8 +1163,10 @@ void __init setup_arch(char **cmdline_p)
 	kasan_init();
 	request_standard_resources(mdesc);
 
-	if (mdesc->restart)
-		arm_pm_restart = mdesc->restart;
+	if (mdesc->restart) {
+		__arm_pm_restart = mdesc->restart;
+		register_restart_handler(&arm_restart_nb);
+	}
 
 	unflatten_device_tree();
 
-- 
2.31.1


