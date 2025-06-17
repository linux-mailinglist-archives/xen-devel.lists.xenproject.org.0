Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F411ADC327
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jun 2025 09:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1017807.1394806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQbr-0007HM-Hm; Tue, 17 Jun 2025 07:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1017807.1394806; Tue, 17 Jun 2025 07:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uRQbr-0007F7-E2; Tue, 17 Jun 2025 07:19:55 +0000
Received: by outflank-mailman (input) for mailman id 1017807;
 Tue, 17 Jun 2025 07:19:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fQMZ=ZA=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uRQbq-0007Ez-56
 for xen-devel@lists.xenproject.org; Tue, 17 Jun 2025 07:19:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2416::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75565d9f-4b4b-11f0-a309-13f23c93f187;
 Tue, 17 Jun 2025 09:19:52 +0200 (CEST)
Received: from PH7P222CA0018.NAMP222.PROD.OUTLOOK.COM (2603:10b6:510:33a::12)
 by MN0PR12MB5785.namprd12.prod.outlook.com (2603:10b6:208:374::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Tue, 17 Jun
 2025 07:19:46 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:33a:cafe::15) by PH7P222CA0018.outlook.office365.com
 (2603:10b6:510:33a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.21 via Frontend Transport; Tue,
 17 Jun 2025 07:19:45 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Tue, 17 Jun 2025 07:19:45 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:19:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Jun
 2025 02:19:44 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 17 Jun 2025 02:19:43 -0500
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
X-Inumbo-ID: 75565d9f-4b4b-11f0-a309-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CmRtaVZWqTppZYoHtwJlDKOlq4dBxMlb7JWuohon6/XIx/GmYBSAhlkr3S4KJ3NGTCo5d75Ct4MzWLenz3SilaPd7F7va4Qx0/byWoVgYb9HE23LZQ4/bg4aOVfMEqZs+1d1R+uE/WzceilUcPKiBAYoEedgQn6U0aV2Q98hVE6Cs0E7u+NyDiaVoaea/J6atfTDyDS2bWDYGMzZQNuBA/7Shcg482H20ESliX5VQ9XXDdzlTPh/zBEYOiKBl6EtyYFWGCUKk6Wo8wbA4No9tl7hXNr8kP6IKZs44DHmfzJ18kwS/gMIeisO64mXsOaH7zH2Fr7NByS7aCI9JfOXsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lbDd2DpkJV2lGbpCrWTmXsmmQtaUABV0UM6Kmtyx9Io=;
 b=RV9BUt2KexIOIvvwxRvNzkrEWI/OgZyn/b4S3MOWpevQjufpjXXIbLHhy05J4mmkzlKp6tTwQOMe6lhElP9HJjjd4FXWDpbUM69jLONoYyl9nju9YA5gqyt0K3Bh0fpqtjCYSDEhOijieayQDe3dlFR1+fjB/pbDBQlrXn+J92XkMBM0HpS3n4pN9D4cHeXQxP7+We7TknUJppyIOK4e8bcivXg7nCv9Mabc800cVYgfmpq7YM47CEiPKDLejS3fxW98XCMWCRe7UzbSP0aKybYBK9vyjj2eV4/w2TnYFiLa1O+vi7K+1fRdzzax2aMt1MXEshIP5XHUQ/yy7xvOKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lbDd2DpkJV2lGbpCrWTmXsmmQtaUABV0UM6Kmtyx9Io=;
 b=DvAK7laRvhAijY9hTLHCfJn2mLrGr0HKNon1ySGpZj7fQMTPUWPgKjEOEd6plskMMTyL5nItKcW9cUzXpPs2cs8/EYAwfYgg3zL2uKovhMDcurAWriF63EgLqOIhmi1r0oHPxVGUKsJ6UWLath/FhL8O8W4xN2A0MYTCVryam2o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH] console: Do not duplicate early printk messages on conring flush
Date: Tue, 17 Jun 2025 09:19:40 +0200
Message-ID: <20250617071940.10445-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|MN0PR12MB5785:EE_
X-MS-Office365-Filtering-Correlation-Id: edd65454-a15f-4dec-ad8c-08ddad6f5635
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EHHnrVVKGRleVKOKePSghi3VvJHHqCYbF+0efYSgwbH4t8omgE3B6DGDBV49?=
 =?us-ascii?Q?VSBwmAJVo7zak5a+BOuZs7iZzl4EtZ+Iz3zwIaYNUUS56dWtMFUoq7fNgcF0?=
 =?us-ascii?Q?S7HUK2NeApC+JS4+m0eD0o/SdrYUU/0kCumpitxA1ymrVN6muADaE5rjdXoy?=
 =?us-ascii?Q?YkU44r6yvdaz1vMcP/px4Uw+LzNrp9B8x0EB93Kj65HQQObdq8jUtQIX6lI4?=
 =?us-ascii?Q?6ao44XIC8VRIgV0CQ5jqYg1/Bek+iIWMgU7qb91IjmAfuAgEzL2WcgHN3yA3?=
 =?us-ascii?Q?VqzEVn60wDPAEydSGIkfp1bPZXDQi9lxWmLNottmrd0ChzET2TvnPd58QCMK?=
 =?us-ascii?Q?VNBcPOmekKUV4Xx+DaBDD6LCTjTiFeKzxIYLK3UxUh5x78apG3oy+VWBL3j5?=
 =?us-ascii?Q?LV2aUf7evYgOVuWDKZTXI1gJIl1nlb2nupELwhDPVivYKfgsilXlauGsT3Bj?=
 =?us-ascii?Q?mmhjUvI9TDiOdYGUyeVNxVhgqZvj8N4/sr8vpJfu5M5KcWZSeQWoNM4Huswa?=
 =?us-ascii?Q?HvFFYfyawoIA9y6RMrjoyzULL5XVXuVVX8LY0ejWLfwr8CHSDYNlu+NwAKFh?=
 =?us-ascii?Q?83Kl+RmkmbCg8ifDQURA23GgemaYLHpY/vzGeYli9gLtq1ZgHiXI/tXKpFJY?=
 =?us-ascii?Q?vEekVw/8rE9D3LaBEAhBthnnkOkRlwBEiRf2+RBjdrhPC92Ff4RyCpDdtcI4?=
 =?us-ascii?Q?TtGz6pknnUHV2y0M/KzRov5+5jMQq25sI6N9AHvj+DFbeF3UgXwohGx2Q1JT?=
 =?us-ascii?Q?yeRldyJNqmxjiGbusptMJAYo8yzk/DRtxtzshy30zK1jeQYC95RBEiBqn2tA?=
 =?us-ascii?Q?CKmYvipq0tVubtMnPmNS1mu4XaJ6fghffJeyAFR3atsgMQQzNpQHGhrz/yDQ?=
 =?us-ascii?Q?FrFTy0JyGhgTzpqy7BdzF2QaPkorpcHjdsvwQZ+5dYYT8lvIh/LZLHuTYwt0?=
 =?us-ascii?Q?+2IGFmNxJ3Q2Zxk2Bu2/lGDnDVNfSJxkzzFXkIXW3t9uXVMuNxtV7aifXSb8?=
 =?us-ascii?Q?UKeh5R5ab9pgngpgPhKsR2LzxSv8ZLdMhqyGzpZNqW6NT2Dn05bmki/YRmqZ?=
 =?us-ascii?Q?PHaEkR034fEOHVLzC9EQ2oFiToXV1SSBE5Mncf3Xp6O0Kn3sf4rfoBCw68G0?=
 =?us-ascii?Q?T5rfn5gQRdBfzdJ5+8Hsy2vRS05zrkE32FPQMhukVAcQq5Gkjh0yXfrTGe/x?=
 =?us-ascii?Q?EFgtOq+VeyiIX35DPsqoNoQXOns0RzIbchgzIBEOOx1Wp0wOVlt0526nq07e?=
 =?us-ascii?Q?oOfMknRVlbArdq/N3VC7B4tus7hrnrFlf9ikC/04C+JCj7OVJsJxKeAl3tf2?=
 =?us-ascii?Q?Z2UALHV8UyHFv20NW4HqKkwqtm/MaZTy1hXCN07CCdFQzd9f7sRUYsnGDscT?=
 =?us-ascii?Q?QEZIYopPfCBJTWydWe1qmDbu9g+e+p07comw3Vtu0SfTTe1oCSulihLff+Fd?=
 =?us-ascii?Q?0LBZRUKUISZcyfReN8Anb5GACv5VFXwLVpPgPWCrRJ2aTEuDAtYo1NbSeBQO?=
 =?us-ascii?Q?/gj0JZxeeBGpvedvu189LPkYQ6sFskqpqKPb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 07:19:45.5083
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edd65454-a15f-4dec-ad8c-08ddad6f5635
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5785

Commit f6d1bfa16052 introduced flushing conring in console_init_preirq().
However, when CONFIG_EARLY_PRINTK is enabled, the early boot messages
had already been sent to serial before main console initialization. This
results in all the early boot messages being duplicated.

Change conring_flush() to accept argument listing devices to which to
flush conring. We don't want to send to serial at console initialization
when using early printk, but we want these messages to be send at conring
dump triggered by keyhandler.

Fixes: f6d1bfa16052 ("xen/console: introduce conring_flush()")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/char/console.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 9a9836ba91e7..5879e31786ba 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -453,9 +453,9 @@ void console_serial_puts(const char *s, size_t nr)
 }
 
 /*
- * Flush contents of the conring to the physical console devices.
+ * Flush contents of the conring to the selected console devices.
  */
-static int conring_flush(void)
+static int conring_flush(unsigned int flags)
 {
     uint32_t idx, len, sofar, c;
     unsigned int order;
@@ -479,7 +479,7 @@ static int conring_flush(void)
         c += len;
     }
 
-    console_send(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
+    console_send(buf, sofar, flags);
 
     free_xenheap_pages(buf, order);
 
@@ -491,7 +491,7 @@ static void cf_check conring_dump_keyhandler(unsigned char key)
     int rc;
 
     printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
-    rc = conring_flush();
+    rc = conring_flush(CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
     if ( rc )
         printk("failed to dump console ring buffer: %d\n", rc);
 }
@@ -1042,6 +1042,7 @@ void __init console_init_preirq(void)
 {
     char *p;
     int sh;
+    unsigned int flags = CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV;
 
     serial_init_preirq();
 
@@ -1084,8 +1085,15 @@ void __init console_init_preirq(void)
     serial_set_rx_handler(sercon_handle, serial_rx);
     pv_console_set_rx_handler(serial_rx);
 
-    /* NB: send conring contents to all enabled physical consoles, if any */
-    conring_flush();
+    /*
+     * NB: send conring contents to all enabled physical consoles, if any.
+     * Skip serial if CONFIG_EARLY_PRINTK is enabled, which means the early
+     * messages have already been sent to serial.
+     */
+    if ( IS_ENABLED(CONFIG_EARLY_PRINTK) )
+        flags &= ~CONSOLE_SERIAL;
+
+    conring_flush(flags);
 
     /* HELLO WORLD --- start-of-day banner text. */
     nrspin_lock(&console_lock);
-- 
2.25.1


