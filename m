Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DA689C7BF
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 17:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701993.1096680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtqX9-0008Qu-H4; Mon, 08 Apr 2024 15:03:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701993.1096680; Mon, 08 Apr 2024 15:03:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rtqX9-0008O4-Dl; Mon, 08 Apr 2024 15:03:43 +0000
Received: by outflank-mailman (input) for mailman id 701993;
 Mon, 08 Apr 2024 15:03:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ofpA=LN=ti.com=vaishnav.a@srs-se1.protection.inumbo.net>)
 id 1rtqX7-0008Ny-R4
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 15:03:41 +0000
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2d626141-f5b9-11ee-b7f7-5d6b493b22b9;
 Mon, 08 Apr 2024 17:03:39 +0200 (CEST)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 438F3Max005781;
 Mon, 8 Apr 2024 10:03:22 -0500
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 438F3M8o006573
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Apr 2024 10:03:22 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Apr 2024 10:03:21 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Apr 2024 10:03:21 -0500
Received: from uda0490681.. ([10.24.69.142])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 438F3Il9016093;
 Mon, 8 Apr 2024 10:03:19 -0500
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
X-Inumbo-ID: 2d626141-f5b9-11ee-b7f7-5d6b493b22b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712588602;
	bh=UzIvh6km7ts0io8SvDncngZciO4aL1/274pallGmadc=;
	h=From:To:CC:Subject:Date;
	b=OmUnkVru+wGd/QS08OgOvtod7J3pNs70rbOg1d9BtgIR6tGxw7/uCbOOy6fNyltOw
	 1wlUFHnzPiyO9xsy7XQSTJirYGx5nrhrS8dbzDjx8Et+YY/rmatbHbeQAL6+mwtRB7
	 yVeTRNLZRb0zTzY/zBO6jhEwjXUduFYfPt/63KPI=
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>,
        <jbeulich@suse.com>, <julien@xen.org>, <sstabellini@kernel.org>,
        <bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
        <Volodymyr_Babchuk@epam.com>
CC: <xen-devel@lists.xenproject.org>, <vaishnav.a@ti.com>
Subject: [PATCH v2] drivers: char: Enable OMAP UART driver for TI K3 devices
Date: Mon, 8 Apr 2024 20:33:17 +0530
Message-ID: <20240408150317.1309759-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

TI K3 devices (J721E, J721S2, AM62X .etc) have the same variant
of UART as OMAP4. Add the compatible used in Linux device tree,
"ti,am654-uart" to the OMAP UART dt_match so that the driver can
be used with these devices. Also, enable the driver for ARM64
platforms.

Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---

V1->V2:
Incorporate feedback from Michal Orzel:
	* Change to CONFIG_ARM
	* Update commit message.
	* Pick R-by from Michal.

Xen logs from J721E EVM: 
https://gist.github.com/vaishnavachath/8185e2378981705e1deb121f109f46b5

 xen/drivers/char/Kconfig     | 2 +-
 xen/drivers/char/omap-uart.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e18ec3788c..3f836ab301 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -55,7 +55,7 @@ config HAS_EXYNOS4210
 config HAS_OMAP
 	bool "Texas Instruments OMAP UART driver"
 	default y
-	depends on ARM_32
+	depends on ARM
 	help
 	  This selects the Texas Instruments OMAP UART. If you have a Texas
 	  Instruments based CPU, say Y.
diff --git a/xen/drivers/char/omap-uart.c b/xen/drivers/char/omap-uart.c
index f4368c158c..03b5b66e7a 100644
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -372,6 +372,7 @@ static int __init omap_uart_init(struct dt_device_node *dev,
 static const struct dt_device_match omap_uart_dt_match[] __initconst =
 {
     DT_MATCH_COMPATIBLE("ti,omap4-uart"),
+    DT_MATCH_COMPATIBLE("ti,am654-uart"),
     { /* sentinel */ },
 };
 
-- 
2.34.1


