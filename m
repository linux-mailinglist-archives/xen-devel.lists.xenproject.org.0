Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69B8046A7
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 04:30:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647396.1010472 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAM7s-0001pk-RX; Tue, 05 Dec 2023 03:29:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647396.1010472; Tue, 05 Dec 2023 03:29:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAM7s-0001nH-Oc; Tue, 05 Dec 2023 03:29:36 +0000
Received: by outflank-mailman (input) for mailman id 647396;
 Tue, 05 Dec 2023 03:29:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H3q/=HQ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1rAM7r-0001nB-9v
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 03:29:35 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e89::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 80cb99c0-931e-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 04:29:32 +0100 (CET)
Received: from DM6PR06CA0084.namprd06.prod.outlook.com (2603:10b6:5:336::17)
 by PH7PR12MB6396.namprd12.prod.outlook.com (2603:10b6:510:1fc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.23; Tue, 5 Dec
 2023 03:29:26 +0000
Received: from DS3PEPF000099DD.namprd04.prod.outlook.com
 (2603:10b6:5:336:cafe::54) by DM6PR06CA0084.outlook.office365.com
 (2603:10b6:5:336::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.32 via Frontend
 Transport; Tue, 5 Dec 2023 03:29:26 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099DD.mail.protection.outlook.com (10.167.17.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7068.20 via Frontend Transport; Tue, 5 Dec 2023 03:29:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 4 Dec
 2023 21:29:25 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34 via Frontend
 Transport; Mon, 4 Dec 2023 21:29:24 -0600
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
X-Inumbo-ID: 80cb99c0-931e-11ee-9b0f-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQvjr9Jy2pi1955VIC0VzHCzpy1nYf/vD0W3pDPlH7Hwynl2Ogn4jleRYvs6RJekNKUiLDkwaoDY6RtSq9HoOGtfwzyS7YcvaR5lOGVaoD6QWmFFvR6azRVC8LlaPVE95dO+MHh80XWxkr14pw5LoFid/DROgWEERCZtU96xbxBVntEvMZd19gakDLclnrDKS+stpmkox7qyfhaQHmqWceyXEg5X4ElKU+7VvLNzh5VbyopBuPHfIAiOndbMTCcn0VpVchUyEceRuGm+iOnPlpAhXkVeFwBnT+lQvH34xRfBEa27fduE0I3awrw2e7WFGrdLvaULdm1PLq3E8bMahA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zH1n2UOyz3e/Zk+LuK0xB0Y+U90M5mdvOerHQwWk3lI=;
 b=mWq+m0vSJgwuMj/43wbMk77627WybAcyjGXDr5Ywd3ORE5mKorhrPO9kJWgw1AOPnWhcXyrza2c/y4WyExZH3ajproGSHQccbNpDnMYgx/ytYQHiG3tfMZpuXdmxdmHG0DjqhFJEKzb3Kp1H57+vDX/iaC/n7Vk8+9Nhwn1EyrXrOy2m91siz8AqhGagrMVoYGcw+akYVtreEsus4QJv7gLbz40oFihbyVk9Q5Vq4n7yEgHei+drfTHo3jNFtGr+422uGpXWVMFfDQmYPdUE1wetuAr/ZKwXDjgk35XacfzmKIwgyJo5P0AwkQyHucc+c9Vm24c6+oS8VRefUQO+1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zH1n2UOyz3e/Zk+LuK0xB0Y+U90M5mdvOerHQwWk3lI=;
 b=JK56eBt8DUEES4GkBFyoY38BpM38TXvRqTH4d8uTu2uh+l9iYFxgSGqWvjqfVH1P1E4Eh1MDrerbwl0dDKIiUL9jlZpqqIX87GvUDC1x85VEU9SbbcBa4wTTYsumP9XrFluXK4GYPnbUG2OUgES8VEHoePvvrEjw6smE63rj2uw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen/domain: fix error path in domain_create()
Date: Mon, 4 Dec 2023 22:29:11 -0500
Message-ID: <20231205032918.3656211-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DD:EE_|PH7PR12MB6396:EE_
X-MS-Office365-Filtering-Correlation-Id: 002b0490-5b2b-4c29-bde9-08dbf54261f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bnvyo3jVLtEv/4xJwDBd8qw8Qbr+M9tqkW1plJMSQlf2PadoVoDIAT9L2c6+4nZsm4doKek5zU441F8rj+6t0RO6fRhX4Kw1+7W5pQYYdlug51rzNa/RLGoDYWPxFBOmJW02nvcNdc66SMpEiHx7vDWQcfFFLI7EUjXd4SjbYkS527IYNyRm6GxL+YBgzMH8JO7JM+AREmJ7T4UMjasqw5gUCDZ6gMe0SWikoIU/Ioh9jpu7pKJLsrwNlJO0BRX11VgRFJbgc9KuvvEQhmiw7Rax4ON1c7RHdhLCySlWdPtrOoyOGGKNFw14eCxYzaX6nbF40pXHLCDhxYvzxa4wGyCiZwlhrvN9bjV4w9VOr9JlT8JbhxfkR6J/HGUu3i7Yig6kkLiHXE6ZDhvtTdZZkNEhva1J/TFI09wZw4Rxo+A/LXQiuutQDMp37Uq55Umzw1FI+57LjKbegXyyzxBwBOKL3Vi6KHVunIDHr4SxFu4YoBFtXbehdSaG5syZuqlw9UpzsVRE3EyyoKimgSru99A3/rxenJYpS0BeSjWooiSW+kTt+nmpaO3gx3RXepPmgZPysreGKuvlOm3qcPUr44QKjoHLlTqNxrnF8KpE/uBgxScYAML+u+FgXsPf2iWtnLxtwQxyzgtjBhabUoZ6uCkIKctCdKpal9FFpdjOIdQTdcEBHpNJFqj2z06UljaKnc+tJN3vcZB/OM3gt+YgUR0jgeDPbb/MWeqABF7DPJXqjGrzWci8XPYWvKcLnzvsTDKB+UDmI6ndNHAV8vYvUg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(396003)(346002)(39860400002)(376002)(230922051799003)(451199024)(82310400011)(64100799003)(1800799012)(186009)(40470700004)(46966006)(36840700001)(40460700003)(26005)(6666004)(1076003)(336012)(426003)(2616005)(54906003)(70586007)(70206006)(6916009)(40480700001)(81166007)(316002)(82740400003)(356005)(5660300002)(86362001)(8676002)(44832011)(4326008)(36756003)(47076005)(478600001)(2906002)(41300700001)(4744005)(8936002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2023 03:29:26.2351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 002b0490-5b2b-4c29-bde9-08dbf54261f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6396

If rangeset_new() fails, err would not be set to an appropriate error
code. Set it to -ENOMEM.

Fixes: 580c458699e3 ("xen/domain: Call arch_domain_create() as early as possible in domain_create()")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/common/domain.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index cd2ca6d49a5e..c5954cdb1ac2 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -710,6 +710,7 @@ struct domain *domain_create(domid_t domid,
         watchdog_domain_init(d);
         init_status |= INIT_watchdog;
 
+        err = -ENOMEM;
         d->iomem_caps = rangeset_new(d, "I/O Memory", RANGESETF_prettyprint_hex);
         d->irq_caps   = rangeset_new(d, "Interrupts", 0);
         if ( !d->iomem_caps || !d->irq_caps )
-- 
2.43.0


