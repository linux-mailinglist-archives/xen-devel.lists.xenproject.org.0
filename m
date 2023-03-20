Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CBF6C1201
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 13:37:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511884.791267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEl1-0002ZC-9X; Mon, 20 Mar 2023 12:36:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511884.791267; Mon, 20 Mar 2023 12:36:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peEl1-0002Wu-6S; Mon, 20 Mar 2023 12:36:59 +0000
Received: by outflank-mailman (input) for mailman id 511884;
 Mon, 20 Mar 2023 12:36:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K00X=7M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1peEkz-0002Wo-7N
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 12:36:57 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20620.outbound.protection.outlook.com
 [2a01:111:f400:7e8d::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e24d643a-c71b-11ed-b464-930f4c7d94ae;
 Mon, 20 Mar 2023 13:36:50 +0100 (CET)
Received: from BN9PR03CA0959.namprd03.prod.outlook.com (2603:10b6:408:108::34)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 12:36:47 +0000
Received: from BL02EPF0000EE3E.namprd05.prod.outlook.com
 (2603:10b6:408:108:cafe::c6) by BN9PR03CA0959.outlook.office365.com
 (2603:10b6:408:108::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 12:36:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0000EE3E.mail.protection.outlook.com (10.167.241.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Mon, 20 Mar 2023 12:36:46 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Mar
 2023 07:36:45 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 20 Mar 2023 07:36:44 -0500
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
X-Inumbo-ID: e24d643a-c71b-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpMDwvg2Zvaf4XLf2CMN7bqlUFpq1ktlaRGM+zwpmoA5t3O3PB6H0v3fnWUL6fcxQyQ9sR/RPPwG9Ivh/IPDdCmuYnue89HEUuuKVGfIHfjv5s9kGYOZ/l7vYML+zJVvYdcPXChvIjUGHB+bpVw/FdQvzYvJXNzDu8H+rNydo/gsiPTBvHQ5pXZvboe/adpRK4JpbLzjLq5mo0vMFPEElDp5Do8tsSjMR6VEopA+0TOighzUi0xOgYC73cVv+1v17Ez3DdsLhBZe5LU2bA+W1KyqYLqmds63gzV7D0vJf/Z0POn77IUGeT+r3qyGQyNfdf4QUGDdEBaP2gMjHX6IUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bbAstaqj1D4syKfDH9cZqEhlVQIZW/tPsy1JkWBTql0=;
 b=EDI/+yBcpeY/4YSbDk5MxdJ917qjxihgQe1N4EJvR+CU2xLQSCzOlxkLXOcTtiEWgxU7wpoggeKB4BWFuItoXoxP6zeyoxXRr+qMmyBSmnugqtCGLH8/cPClVnhM1iQcDMMA1odsV8GoQ/NVdmqmEfK6WouDeVK4OEPnGwx8iSwVziDPI3rpezMpGzyqFjuhZLAEauLDaHaTHbL/7V1Npgfe0EITrYFSgpWJmlZupLUgoQ5oGR1KvFQtv2dNth3JXhyQUI47qDNogyzwCKC2Y4HsDKg9NgPXIwjxnBcCxIPImqgMWbCu6tPrbrnLcv2Dqm/56ZFU78+OO+POZSigNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bbAstaqj1D4syKfDH9cZqEhlVQIZW/tPsy1JkWBTql0=;
 b=L8pHFWCYzxexHupVT6DqftRVC1/lAmXzcpAWGWYWLOQwW2Qdz/n/6DB5ccDPSSPPMiLx9taYG2BXhrYZcvvDH/U5fWCpWCHCcB3rJDQFde4oYoxCQ2GFYLojjBAkk+O7znIqwJfQGSog1XhTT02MGBP6ZoNG6KaVJIpfm3vM1j8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH v4] xen/console: Skip switching serial input to non existing domains
Date: Mon, 20 Mar 2023 13:36:43 +0100
Message-ID: <20230320123643.7210-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3E:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a6b4e29-1c97-4c61-5092-08db293fc4ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uQzkhaaDgtQrZIa1C8vTNDdp2XvB3dzIAESvMnvHvl1mHvdRQxy1rerL0BOuljAgi4xq8xm/kpqVBOIKoOIu9CdnbHgT7JCIf7rEioTF6KV5+LvdUFOA+uxlZjJEYmNhBaAGh6GPD4tw7V1OPTd6uFDOAJIPlGTIIWXJ3OZjG3NeFQ4dsbhJrVcC9Ua8+p2VMytdZRaSL2Ldozfa99WskVe1vm3i2AFX/WIWOo7cmdhDbufNVZCEPRcfExoqmmdJXtPO+wvtibaWV0J8Yc/oJaa3sOnHnTkpJZclcfOz/+Ghw5QtENZ3dpadBHaeB4TtAVvz9MSE9NmigU/rrlapocIXzQuYI8YhnOgoiILAK3V7fcLTWpElKTSHjm0G8J3pgVlAxJ2rfndm6a8HLgby+jqKCTRwpPJyi5DOKdttFbLxftDyXuWliIe+AxVgk1R0r9Hg9r0eLWUve6vNpF3uK5AJmv4SQutDb5+BNLBMP0CKWkZAQ9MBVGon7JocQDeaRCVeTEKiPqTKNN76bKAzkvk7ummwOOy5I4FGsA3r0a2iZTb9FewHHwGjYTENBUSi8Bg0sWtVWdxmnzjeQDKZhbGMgxj95A7pham3RrYhRDYepMcg/VBMZL2AWvz/TUS9wvYnRxHtY6lz1NUv/TaoGtCsprApCCLw0L50AY6cu+ChmFVWGrTGN9l8+xloedZDiRtnHNDSymp8DTrOP23poSZgXMhRuD0xA0K9jH8Hjf8=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199018)(46966006)(40470700004)(36840700001)(40460700003)(41300700001)(2906002)(8936002)(44832011)(5660300002)(81166007)(82740400003)(356005)(86362001)(36756003)(36860700001)(4326008)(6916009)(70586007)(8676002)(478600001)(70206006)(83380400001)(40480700001)(82310400005)(2616005)(47076005)(426003)(336012)(54906003)(316002)(26005)(186003)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 12:36:46.1828
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a6b4e29-1c97-4c61-5092-08db293fc4ab
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174

At the moment, we direct serial input to hardware domain by default.
This does not make any sense when running in true dom0less mode, since
such domain does not exist. As a result, users wishing to write to
an emulated UART of a domU are always forced to execute CTRL-AAA first.
The same issue is when rotating among serial inputs, where we always
have to go through hardware domain case. This problem can be elaborated
further to all the domains that no longer exist.

Modify switch_serial_input() so that we skip switching serial input to
non existing domains. Take the opportunity to define and make use of
macro max_console_rx to make it clear what 'max_init_domid + 1' means
in the console code context. Also, modify call to printk() to use correct
format specifier for unsigned int.

For now, to minimize the required changes and to match the current
behavior with hwdom, the default input goes to the first real domain.
The choice is more or less arbitrary since dom0less domUs are supposedly
equal. This will be handled in the future by adding support in boot time
configuration for marking a specific domain preferred in terms of
directing serial input to.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes in v4:
 - use infinite loop approach
 - remove unneeded else
 - take the opportunity to fix printk format specifier
Changes in v3:
 - properly handle case where domain with highest ID no longer exists
 - define max_console_rx
Changes in v2:
 - was: xen/console: Handle true dom0less case when switching serial input
 - use a more generic approach to handle all non-existing domains
---
 xen/drivers/char/console.c | 36 +++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 51e5408f2114..0e410fa086df 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -473,6 +473,8 @@ static void cf_check dump_console_ring_key(unsigned char key)
  */
 static unsigned int __read_mostly console_rx = 0;
 
+#define max_console_rx (max_init_domid + 1)
+
 /* Make sure to rcu_unlock_domain after use */
 struct domain *console_input_domain(void)
 {
@@ -483,15 +485,31 @@ struct domain *console_input_domain(void)
 
 static void switch_serial_input(void)
 {
-    if ( console_rx == max_init_domid + 1 )
-    {
-        console_rx = 0;
-        printk("*** Serial input to Xen");
-    }
-    else
+    unsigned int next_rx = console_rx;
+
+    /*
+     * Rotate among Xen, dom0 and boot-time created domUs while skipping
+     * switching serial input to non existing domains.
+     */
+    for ( ; ; )
     {
-        console_rx++;
-        printk("*** Serial input to DOM%d", console_rx - 1);
+        struct domain *d;
+
+        if ( next_rx++ >= max_console_rx )
+        {
+            console_rx = 0;
+            printk("*** Serial input to Xen");
+            break;
+        }
+
+        d = rcu_lock_domain_by_id(next_rx - 1);
+        if ( d )
+        {
+            rcu_unlock_domain(d);
+            console_rx = next_rx;
+            printk("*** Serial input to DOM%u", next_rx - 1);
+            break;
+        }
     }
 
     if ( switch_code )
@@ -1089,7 +1107,7 @@ void __init console_endboot(void)
      * a useful 'how to switch' message.
      */
     if ( opt_conswitch[1] == 'x' )
-        console_rx = max_init_domid + 1;
+        console_rx = max_console_rx;
 
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", 0);
-- 
2.25.1


