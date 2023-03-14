Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1849E6B97F1
	for <lists+xen-devel@lfdr.de>; Tue, 14 Mar 2023 15:28:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509664.785882 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5dB-000461-MB; Tue, 14 Mar 2023 14:28:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509664.785882; Tue, 14 Mar 2023 14:28:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pc5dB-00042J-Ha; Tue, 14 Mar 2023 14:28:01 +0000
Received: by outflank-mailman (input) for mailman id 509664;
 Tue, 14 Mar 2023 14:27:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MGiv=7G=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pc5d9-00039r-EW
 for xen-devel@lists.xenproject.org; Tue, 14 Mar 2023 14:27:59 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20617.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::617])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 69e79ef8-c274-11ed-87f5-c1b5be75604c;
 Tue, 14 Mar 2023 15:27:58 +0100 (CET)
Received: from BN7PR02CA0001.namprd02.prod.outlook.com (2603:10b6:408:20::14)
 by DM4PR12MB5135.namprd12.prod.outlook.com (2603:10b6:5:392::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26; Tue, 14 Mar
 2023 14:27:55 +0000
Received: from BL02EPF000108EB.namprd05.prod.outlook.com
 (2603:10b6:408:20:cafe::71) by BN7PR02CA0001.outlook.office365.com
 (2603:10b6:408:20::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.26 via Frontend
 Transport; Tue, 14 Mar 2023 14:27:54 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF000108EB.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.12 via Frontend Transport; Tue, 14 Mar 2023 14:27:54 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Mar
 2023 09:27:53 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 14 Mar
 2023 07:27:53 -0700
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 14 Mar 2023 09:27:52 -0500
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
X-Inumbo-ID: 69e79ef8-c274-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gjcr5cOaQ8CZfownoJVX+CxiAJ0iNVqW3cN+H9nX6fmLlGmJrQ0JWpgA66mk/RafauRcKt3F4vfKvBd2Cv0gs47I4u9QQbwORAIjx3KMxzTVqLmQV5+2kOiMUlzgvU1SXFfrCBxsK6xE0lnECFKKg567xASPMpAkChEwjJEblPJLhR9+yc3MAfnfI3QlQfN/Oqr8YC2z8qow664LwEy5vc8ezzLoe8oyZP4qJ+/jgPxbz3nQenAXAB5SSzXmHw1WIihOphuTvDkjzm+uQn07WMKnYjmLtRBAmF3QdB/ejjZdo70x43IMyreYqtEgZ/HRi+2S8sUcE8IRCHx3BzuPvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSmnECZXKVPgyAepBZNc+28vY759/kkLgbNNl98Hzx8=;
 b=iakKbIel4KV7lRlxCnQ7bAVd6RcVPX3T+L6y9aWBaJVenCuPjrYtzLWUE9ndBeB541BWUkRAycgUIYi6RQgFPq+sQTKMR20Be64rzdY8RmtFY7AplN/h3XDlpuuqTKFkJ4mpvO95WYgSjnubWx5Q0rKuE99zB73hXpPG7BH2g7ng6oMs3iHgQ6mfPJDm+st32lRIf+wQUfvPRa5pI5EA3VRjUbbD9Dv0mHJrpr4wP4NAUmKyUaUNdO1Jwu8TN61nl99ZZ3CLuHNT0vAQggY+b1pDT0EoXt0OhWyr5GByHPzgRirJPZJ9/3Nvn1KV+ZiIFwAkYxeHE6AOO5+6uhJHAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSmnECZXKVPgyAepBZNc+28vY759/kkLgbNNl98Hzx8=;
 b=PaoX3XdsN90R9g8oJ/ogvzRWdMsEX/1nBRjfpTKsRS4jzkvD6b04arwFkXgFanHc5S17ZgWf6qsQGX3l70FxAr+y5ilT1lpUvniZVkFEvXpGhAD0bv4SHjSOq9uvSr7JMYy1lvdLKY7DvZL/tFL+BUY+Uqbtyf3tHu2SkL3paUc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/console: Handle true dom0less case when switching serial input
Date: Tue, 14 Mar 2023 15:27:49 +0100
Message-ID: <20230314142749.8845-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108EB:EE_|DM4PR12MB5135:EE_
X-MS-Office365-Filtering-Correlation-Id: e4a09956-9657-495e-ca41-08db24984ca8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	xXQ0QqtLvvdytZCIqMN9a0fVe2R/wQ8Jn9jwka8tCG8n7kDuRwehbs3VWzagP+8kCFcsfXN6fkxoDVkLc+X4EdMIh2lAZ1szrj6V1eARSA86aaQQLMWijkQmUwEIACEWIsgqQmtaNquPj2Z2g05nFYbiUZiT1KHibxRrgL73khDXnXjJk6GR55vMrPsXV3oSBZJ1eJGf8CxFbGQFOpshDfZkQyNFKY2m41CivyEEtyT5xN/4jssSeo9tGCeHGaQ56m5AZyT7hO9gE0Mx4GncCbFLH9TRWnkmJUk55bboSWSGmCkp9OtzG8ZNfNR4VnVNSyRybMXxs/u/7QwYkPqK15Y64VTEbIV8KcdJh37WuWtskZNF3u50iuAXnhWOS1u/ZEBYbJdks2om3pxNGzYbVO0WL4GI8H19+pAsRDmWrmrRL0SSAWvxWvt6XttBGYLrHGaAc6Sqoybxw9Vboe815X3s86qOr/eA6mrUsTTy/qSHNk/FCrKvpgg7T0SgvSsVHN9dqJT3Ze9kSW82hj1jh/lAylCzs1Q5Eo9NMehj9JockauFFi9O1QF5cfcqxRZqi0OO4laHSMyMRHkmTvpkuiskwOIle+GVsUTLg7f6docL0VNuABb8sN4FXIbi2qmuP+sGluyL1N9KsZW+CWej8WedP+j3zHHmSBnWE/8QwdKuXNfeHEGfLwAShSoexMmPf3Nqsfa/yPe85x+deNLOYpTq4Awcne7s2B/91ml893hz/XJTYrWD8KtI/9DxnPQFlu5c8H3ZIfd6I2X4ZCqtRQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(376002)(136003)(346002)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(40460700003)(356005)(86362001)(8676002)(36756003)(8936002)(44832011)(2906002)(6916009)(5660300002)(54906003)(478600001)(316002)(70206006)(70586007)(41300700001)(4326008)(82310400005)(36860700001)(40480700001)(6666004)(1076003)(82740400003)(186003)(26005)(81166007)(336012)(426003)(47076005)(2616005)(32563001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Mar 2023 14:27:54.2347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4a09956-9657-495e-ca41-08db24984ca8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF000108EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5135

At the moment, we direct serial input to hardware domain by default.
This does not make any sense when running in true dom0less mode, since
such domain does not exist. As a result, users wishing to write to
an emulated UART of a domU are always forced to execute CTRL-AAA first.
The same issue is when rotating among serial inputs, where we always
have to go through hardware domain case.

Modify switch_serial_input() so that, if there is no hardware domain
(i.e. true dom0less case) and console_rx is 1 (i.e. input to hwdom),
we skip it and move to the next serial input.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/char/console.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index e8468c121ad0..3bbab35dc460 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -491,6 +491,14 @@ static void switch_serial_input(void)
     else
     {
         console_rx++;
+
+        /*
+         * Skip switching serial input to hardware domain if it does not exist
+         * (i.e. true dom0less mode).
+         */
+        if ( !hardware_domain && (console_rx == 1) )
+            console_rx++;
+
         printk("*** Serial input to DOM%d", console_rx - 1);
     }
 
-- 
2.25.1


