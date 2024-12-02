Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D2D9E0C79
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 20:45:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846995.1262144 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tICLW-00023q-2u; Mon, 02 Dec 2024 19:44:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846995.1262144; Mon, 02 Dec 2024 19:44:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tICLV-0001w8-QG; Mon, 02 Dec 2024 19:44:37 +0000
Received: by outflank-mailman (input) for mailman id 846995;
 Mon, 02 Dec 2024 19:41:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yaPF=S3=ti.com=afd@srs-se1.protection.inumbo.net>)
 id 1tICIf-0001jK-3z
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 19:41:41 +0000
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 726a9a2e-b0e5-11ef-a0d3-8be0dac302b0;
 Mon, 02 Dec 2024 20:41:39 +0100 (CET)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2JfAHv1777092
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Dec 2024 13:41:10 -0600
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2JfA8L018331
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 2 Dec 2024 13:41:10 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 13:41:10 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 13:41:09 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Jf8iM127393;
 Mon, 2 Dec 2024 13:41:09 -0600
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
X-Inumbo-ID: 726a9a2e-b0e5-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733168470;
	bh=P6d498xP36XXy4X2j2XNBIV3J80KTeTFWEpSStPLVgY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=tHfWAYTb7oGZnG+xPW+4zrXYKTxWVEwuxtfhYX0ntLfAjUFfoG+oqDzQ+1JgTAnOb
	 BVZboqAUgIAiyyUo0qOBQHDp7XAL/HZHB+Qolc/aJ2pLHvEht0l3gYU0G9VfqPB8en
	 BfpXfNCSCPOlgRsSmBmjlU38u00ZrO125iNpWj4Q=
From: Andrew Davis <afd@ti.com>
To: Arnd Bergmann <arnd@arndb.de>, Andre Przywara <andre.przywara@arm.com>,
        Russell King <linux@armlinux.org.uk>, Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik
	<robert.jarzmik@free.fr>,
        Alexey Charkov <alchark@gmail.com>,
        Krzysztof
 Kozlowski <krzk@kernel.org>,
        Stefano Stabellini <sstabellini@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <xen-devel@lists.xenproject.org>, Andrew Davis <afd@ti.com>
Subject: [PATCH v4 1/5] ARM: highbank: Switch to new sys-off handler API
Date: Mon, 2 Dec 2024 13:41:03 -0600
Message-ID: <20241202194107.105119-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241202194107.105119-1-afd@ti.com>
References: <20241202194107.105119-1-afd@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Kernel now supports chained power-off handlers. Use
register_platform_power_off() that registers a platform level power-off
handler. Legacy pm_power_off() will be removed once all drivers and archs
are converted to the new sys-off API.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-highbank/highbank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-highbank/highbank.c b/arch/arm/mach-highbank/highbank.c
index 5d4f977ac7d2a..47335c7dadf8d 100644
--- a/arch/arm/mach-highbank/highbank.c
+++ b/arch/arm/mach-highbank/highbank.c
@@ -143,7 +143,7 @@ static void __init highbank_init(void)
 	sregs_base = of_iomap(np, 0);
 	WARN_ON(!sregs_base);
 
-	pm_power_off = highbank_power_off;
+	register_platform_power_off(highbank_power_off);
 	highbank_pm_init();
 
 	bus_register_notifier(&platform_bus_type, &highbank_platform_nb);
-- 
2.39.2


