Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE746C0C0E
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 09:20:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511754.790961 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peAkD-0000Qo-Rm; Mon, 20 Mar 2023 08:19:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511754.790961; Mon, 20 Mar 2023 08:19:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peAkD-0000NR-Of; Mon, 20 Mar 2023 08:19:53 +0000
Received: by outflank-mailman (input) for mailman id 511754;
 Mon, 20 Mar 2023 08:19:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K00X=7M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1peAkC-0000NL-4H
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 08:19:52 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe5a::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb0d220a-c6f7-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 09:19:50 +0100 (CET)
Received: from MW4PR04CA0201.namprd04.prod.outlook.com (2603:10b6:303:86::26)
 by CY8PR12MB8409.namprd12.prod.outlook.com (2603:10b6:930:7f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 08:19:46 +0000
Received: from CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:86:cafe::da) by MW4PR04CA0201.outlook.office365.com
 (2603:10b6:303:86::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Mon, 20 Mar 2023 08:19:46 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT078.mail.protection.outlook.com (10.13.175.177) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6222.15 via Frontend Transport; Mon, 20 Mar 2023 08:19:46 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Mar
 2023 03:19:44 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 20 Mar
 2023 01:19:44 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 20 Mar 2023 03:19:42 -0500
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
X-Inumbo-ID: fb0d220a-c6f7-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kiKDEKQv/ulKI3mUiHLT7i97SDPtjCX9V0E0yot/9moseCFWPOFAoN3TpsRmy6l6zO85vEY0BXD/ZMVGAspAtc3628CESqiwUTE7qS5umd1xZtGDNWsSatsq16vsmPPWcmiXMMt0myVCjSsyasxzaQjnxkBio2+zQ0OVpwKm1RS5zsZmQzdD65oX2/vSOzr6NNpgNTSyBxFEDAKett1uPacryajQRMZdjEVqC1r4pdF0t0XeKwg04eUYmNA0uZC3bbn+WCYZLjttgy28UJJdrYJyoNU6/jcauFwcEHInkFv9GplafbhpBr+2QkuJVk8U+h032gJ/qklDtQAJCuiMhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZOTRNIqIdCZRbpazo9TlwxUHFHXL2PslnbP3rEpGkc=;
 b=JAleyPKIJ2e04vnQZQkRScnpl25NqFQ/q6E62pNtUbluuCLV5H4vPkSWRKDFeUcqFl70rSGuo58Y5j7fzf2sWzFXP1D9GVQtn8eFBvyJr4XWAUGfcG6pLKZcvG8o3MFOzwZIvvY78vngYjhXbCEwNWHgmuiN3ARJEOlvsxPmXS43vD23xRXZ92opCmj4EDHeIxzqSLTDL/Xg510seFiCzZjoFzcZg5pvKpMMcgEvQ3EnYCn+iHo8N0d0kWIuvXIOjJDdhXWXGZrj9azvDgtBEohWENgYFtPqN8MLKG9qsp4LdtffwjwD2e+lmJYG1TuP9T2HkgUwhignh+PpVnk0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZOTRNIqIdCZRbpazo9TlwxUHFHXL2PslnbP3rEpGkc=;
 b=q6ND7bJCQDey43TWxyZuv3hNtWXZd5lYnQ0DqGELu2jDlinb+hTgzfMYFu8sxUHZp7m6WsFcw3Rx4nUc3sKieLq6KHP7T9x3k6t86cjfr5X5lgUSKxvkuMNXGrpUIkzjKj0vRVY9MwKMwkN+qHWFQvCB2VCYeiWRm2iOOsrSNf0=
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
Subject: [PATCH v3] xen/console: Skip switching serial input to non existing domains
Date: Mon, 20 Mar 2023 09:19:35 +0100
Message-ID: <20230320081935.18367-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT078:EE_|CY8PR12MB8409:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d14460a-c4fb-486e-270d-08db291bddc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	W6de0U+jKAbC71Av+6PXdk+Y7JC2NPqnmPT26KnmF8z1tsH5FaYUtFLSLQa4rx49HiSKUl7ua1BbvFKYesaGOlXFkIxmG1V+Me6sTVm4IoftcuhI3YNm4kguGziwmym08SI2XAWeK6hS1JPrrHOFP55AKJ7tWCoU4Pmw8Ze/DAYqaDIA4UZUaJsBw9y0oUs8OqH0G98PxVTTobXdJkVoYI9JRstt5BCKgpEAwjhj+Zzbv8OrFX8utVipgmXONuKsdqNlyBdEjOQtNa37G6PKh5dT3+d6+K2d5zXi7DYqkeW2nmF1ixttu3ZuyhPNgdO5go2w3oe+I+U0gYJVrVka7N/zQBU4lkkYkoLVnIQqpSiZtB5SgzloCDSxebJATxvKdX3EbQgqngfhn3rKryE8kjj+lQXjmBviPeO4ONKPRKlja6dzDTdzlN63vO4vAy8r2mJAjnHMeniPuzin1PHuIvtgJ52pnXlWjDNg7h8SWkWZk+wz+qLsSsMjmA9z/C91/dQFt31a41idVKycHF7eWQgR6ftedRWpynZ7+MmaOmN5LlWmT1rs3Kq9ULw2xKKQN8kqAkSwMV6fxsugahjCUTrgSgXDjAWQcujd6wB4Djkdv5PClNj8DWnGUKcJ5nahFvEEstFLqKGuyY0C+cSxYoZyGJqZKiqI2HqZH25eOvKNpHOevoppjhalLYlrSv0uh8cWPkT9hVMQx+awTiRsijbHA9fLsNemnRzBMfdNWsg=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199018)(36840700001)(40470700004)(46966006)(426003)(186003)(6666004)(47076005)(478600001)(26005)(336012)(83380400001)(54906003)(1076003)(2616005)(316002)(8676002)(70586007)(70206006)(6916009)(4326008)(36860700001)(8936002)(44832011)(41300700001)(5660300002)(40460700003)(82740400003)(81166007)(2906002)(356005)(40480700001)(82310400005)(86362001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 08:19:46.3035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d14460a-c4fb-486e-270d-08db291bddc5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1NAM11FT078.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8409

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
in the console code context.

For now, to minimize the required changes and to match the current
behavior with hwdom, the default input goes to the first real domain.
The choice is more or less arbitrary since dom0less domUs are supposedly
equal. This will be handled in the future by adding support in boot time
configuration for marking a specific domain preferred in terms of
directing serial input to.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v3:
 - properly handle case where domain with highest ID no longer exists
 - define max_console_rx
Changes in v2:
 - was: xen/console: Handle true dom0less case when switching serial input
 - use a more generic approach to handle all non-existing domains
---
 xen/drivers/char/console.c | 39 +++++++++++++++++++++++++++++---------
 1 file changed, 30 insertions(+), 9 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 51e5408f2114..86aa2b9c7165 100644
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
@@ -483,15 +485,34 @@ struct domain *console_input_domain(void)
 
 static void switch_serial_input(void)
 {
-    if ( console_rx == max_init_domid + 1 )
-    {
-        console_rx = 0;
-        printk("*** Serial input to Xen");
-    }
-    else
+    unsigned int next_rx = console_rx + 1;
+
+    /*
+     * Rotate among Xen, dom0 and boot-time created domUs while skipping
+     * switching serial input to non existing domains.
+     */
+    while ( next_rx <= max_console_rx + 1 )
     {
-        console_rx++;
-        printk("*** Serial input to DOM%d", console_rx - 1);
+        if ( next_rx == max_console_rx + 1 )
+        {
+            console_rx = 0;
+            printk("*** Serial input to Xen");
+            break;
+        }
+        else
+        {
+            struct domain *d = rcu_lock_domain_by_id(next_rx - 1);
+
+            if ( d )
+            {
+                rcu_unlock_domain(d);
+                console_rx = next_rx;
+                printk("*** Serial input to DOM%d", console_rx - 1);
+                break;
+            }
+
+            next_rx++;
+        }
     }
 
     if ( switch_code )
@@ -1089,7 +1110,7 @@ void __init console_endboot(void)
      * a useful 'how to switch' message.
      */
     if ( opt_conswitch[1] == 'x' )
-        console_rx = max_init_domid + 1;
+        console_rx = max_console_rx;
 
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", 0);
-- 
2.25.1


