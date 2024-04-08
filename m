Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DA89BEF0
	for <lists+xen-devel@lfdr.de>; Mon,  8 Apr 2024 14:27:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.701925.1096549 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rto5U-0001vU-SJ; Mon, 08 Apr 2024 12:27:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 701925.1096549; Mon, 08 Apr 2024 12:27:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rto5U-0001so-PY; Mon, 08 Apr 2024 12:27:00 +0000
Received: by outflank-mailman (input) for mailman id 701925;
 Mon, 08 Apr 2024 12:12:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ofpA=LN=ti.com=vaishnav.a@srs-se1.protection.inumbo.net>)
 id 1rtnr8-0008CY-E7
 for xen-devel@lists.xenproject.org; Mon, 08 Apr 2024 12:12:10 +0000
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37456c56-f5a1-11ee-afe6-a90da7624cb6;
 Mon, 08 Apr 2024 14:12:08 +0200 (CEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 438CBu2a074968;
 Mon, 8 Apr 2024 07:11:56 -0500
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
 by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 438CBuEV025223
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 8 Apr 2024 07:11:56 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 8
 Apr 2024 07:11:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 8 Apr 2024 07:11:56 -0500
Received: from uda0490681.. ([10.24.69.142])
 by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 438CBqbQ109088;
 Mon, 8 Apr 2024 07:11:53 -0500
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
X-Inumbo-ID: 37456c56-f5a1-11ee-afe6-a90da7624cb6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712578316;
	bh=aSMqRJ2j9Oj/aL7vf35DSF9DWG1/fdTVGo+Fl4r7hXI=;
	h=From:To:CC:Subject:Date;
	b=mQM0EX4/KflwpFx6Lx5JvDwmN34155HBcjkXDc2hu5JHWzC602W1rpVHW80x02aDe
	 rfbQOiqZdo7fuJS/hcP65KxrPuqqh3I191GVLN9rQriFMOen5Tsa68ZBpZLxkvLDiR
	 deMHWaHgau4/K2gHBUslxwYDIyyUMoIh5PyYamA8=
From: Vaishnav Achath <vaishnav.a@ti.com>
To: <andrew.cooper3@citrix.com>, <george.dunlap@citrix.com>,
        <jbeulich@suse.com>, <julien@xen.org>, <sstabellini@kernel.org>,
        <bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
        <Volodymyr_Babchuk@epam.com>
CC: <xen-devel@lists.xenproject.org>, <vaishnav.a@ti.com>
Subject: [PATCH] drivers: char: Enable OMAP UART driver for TI K3 devices
Date: Mon, 8 Apr 2024 17:41:52 +0530
Message-ID: <20240408121152.1302364-1-vaishnav.a@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

TI K3 devices (J721E, J721S2, AM62X .etc) has the same variant
of UART as OMAP4. Add the compatible used in Linux device tree,
"ti,am654-uart" to the omap-uart dt_match so that the driver can
be used with these devices. Also enable the driver for ARM64
platforms.

Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
---

Xen logs from J721E EVM: https://gist.github.com/vaishnavachath/8185e2378981705e1deb121f109f46b5

 xen/drivers/char/Kconfig     | 2 +-
 xen/drivers/char/omap-uart.c | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/Kconfig b/xen/drivers/char/Kconfig
index e18ec3788c..dcb9e85853 100644
--- a/xen/drivers/char/Kconfig
+++ b/xen/drivers/char/Kconfig
@@ -55,7 +55,7 @@ config HAS_EXYNOS4210
 config HAS_OMAP
 	bool "Texas Instruments OMAP UART driver"
 	default y
-	depends on ARM_32
+	depends on ARM_32 || ARM_64
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


