Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9BD9E0C7B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Dec 2024 20:45:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.846994.1262135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tICLV-0001x9-MW; Mon, 02 Dec 2024 19:44:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 846994.1262135; Mon, 02 Dec 2024 19:44:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tICLV-0001rL-Hg; Mon, 02 Dec 2024 19:44:37 +0000
Received: by outflank-mailman (input) for mailman id 846994;
 Mon, 02 Dec 2024 19:41:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yaPF=S3=ti.com=afd@srs-se1.protection.inumbo.net>)
 id 1tICIe-0001jK-Bx
 for xen-devel@lists.xenproject.org; Mon, 02 Dec 2024 19:41:40 +0000
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71cdeedf-b0e5-11ef-a0d3-8be0dac302b0;
 Mon, 02 Dec 2024 20:41:38 +0100 (CET)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4B2JfCtc1528218
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 2 Dec 2024 13:41:12 -0600
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2JfCKA073877;
 Mon, 2 Dec 2024 13:41:12 -0600
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Dec 2024 13:41:12 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Dec 2024 13:41:12 -0600
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
 by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4B2Jf8iQ127393;
 Mon, 2 Dec 2024 13:41:11 -0600
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
X-Inumbo-ID: 71cdeedf-b0e5-11ef-a0d3-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1733168472;
	bh=wQeXaz16g8BvuxKa6rSagWr4SkeKW522Qc0ciOgW77o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=xOmSrWmuL7641IvGVJpjRxFzUGUslnfZf9jkh2//cO/IgXTjRJ0clOsqbhZwz4Yu+
	 CIety5knPe661921/lgq5hSE4HFnoqPIO7QjTX21ov3KsH6kIWogYGd/z4ISqBqWB2
	 ahdZfZIdSSmbTv6R9t81iZi1FYQLQaqGTxdldJL8=
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
Subject: [PATCH v4 5/5] arm/xen: Switch to new sys-off handler API
Date: Mon, 2 Dec 2024 13:41:07 -0600
Message-ID: <20241202194107.105119-6-afd@ti.com>
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
---
 arch/arm/xen/enlighten.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
index a395b6c0aae2a..8655bc3d36347 100644
--- a/arch/arm/xen/enlighten.c
+++ b/arch/arm/xen/enlighten.c
@@ -541,7 +541,7 @@ static int __init xen_late_init(void)
 	if (!xen_domain())
 		return -ENODEV;
 
-	pm_power_off = xen_power_off;
+	register_platform_power_off(xen_power_off);
 	register_restart_handler(&xen_restart_nb);
 	if (!xen_initial_domain()) {
 		struct timespec64 ts;
-- 
2.39.2


