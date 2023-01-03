Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7232365BDF8
	for <lists+xen-devel@lfdr.de>; Tue,  3 Jan 2023 11:26:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470543.730079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCeUE-0004rP-RL; Tue, 03 Jan 2023 10:25:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470543.730079; Tue, 03 Jan 2023 10:25:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCeUE-0004pe-Np; Tue, 03 Jan 2023 10:25:38 +0000
Received: by outflank-mailman (input) for mailman id 470543;
 Tue, 03 Jan 2023 10:25:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cMja=5A=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pCeUD-0004pY-AF
 for xen-devel@lists.xenproject.org; Tue, 03 Jan 2023 10:25:37 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f51e8cae-8b50-11ed-91b6-6bf2151ebd3b;
 Tue, 03 Jan 2023 11:25:35 +0100 (CET)
Received: from DS7PR05CA0050.namprd05.prod.outlook.com (2603:10b6:8:2f::9) by
 SN7PR12MB6814.namprd12.prod.outlook.com (2603:10b6:806:266::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.19; Tue, 3 Jan 2023 10:25:32 +0000
Received: from DS1PEPF0000E643.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::ea) by DS7PR05CA0050.outlook.office365.com
 (2603:10b6:8:2f::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.14 via Frontend
 Transport; Tue, 3 Jan 2023 10:25:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E643.mail.protection.outlook.com (10.167.17.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5944.8 via Frontend Transport; Tue, 3 Jan 2023 10:25:31 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 04:25:31 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 3 Jan
 2023 02:25:31 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 3 Jan 2023 04:25:29 -0600
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
X-Inumbo-ID: f51e8cae-8b50-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OerhJLJ1dIwKnPPnc1vVMFxZFSnasESGa2Hu7zfkdb2Ilq9PAUbdrxdT5mpd6rZKz3gAYRxrq0fojRZxKOxuP32KEjlbBYlaAtZOz2eX6oq0xxLP7arnrW143vMT/zOnawAnE13cWwy1TQSNuQQYHyKg6/n6LsWoV/5up+WdZfwdH5WDdRjgkzlhjDptG5J/5GYItTPpvqsE9L4uIMxD8PmSC61dGVgK5diB7e7LQN/hKjVCDzvc8xF7yfG7D5VqWddrML6JzbqzR8uTe6nlYGzpcpQ9JVMbavvFiM/N4Xq9GChYSAcG/lZObd3GEZ5OsaQ1MrIlCsx2UnMvKuGQjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1wG8Ayo4aOuncq1FnIWUKxCPPCI3r62/OM1xAaqLnPc=;
 b=XQFKrWqfbEa98m3l47QqBVK1zGJbiikXZmOVYc4BJo3fVM9XkPo0UBCz/lNDVXsA4+0tn8rSSjXc1LF0eS7Im09xphUaPHljNdc5aUEOS6KVqutUfM3t91qBhnRsd5agJ+3vdO3O8la4eD6MZ/4fcY/5/syHnBC0GJr/Ctpz/N3jNOf0uGBEVylIhzqRd8xDnUanavp2mqUCS9C4OxwEFDFz6NoowYUQHLQVQaQst4kPEe0q2AXZHV41SO5uE7uya7oU5z2S3oRtTG4IlP/Da4Z0X3Y4+24sUlIxZFKizor9qCDNi7FIhRwZA9K7ELlp9/aSDuCNWnBMbP9Irso3XA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1wG8Ayo4aOuncq1FnIWUKxCPPCI3r62/OM1xAaqLnPc=;
 b=2IlrJDtvsRoUlklYanmZjqDFz9z2uI9ab1U0X2l2eLSryfWfsa90qwyYMo7D5ushEj1yBBurbVxwYW9UOrsZQX4ZLJ53usS6nxXLxK7zU0DxOys4RpsQTPCcvxu+myrJC7P+H/3NgfsUxAjZNl7gDaBUBUmoLYRqhVXl7aTOhPE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: Add 0x prefix when printing memory size in construct_domU
Date: Tue, 3 Jan 2023 11:25:19 +0100
Message-ID: <20230103102519.26224-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E643:EE_|SN7PR12MB6814:EE_
X-MS-Office365-Filtering-Correlation-Id: 16268770-c82a-468d-0230-08daed74d7dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EDRiX9j+dJxylAl3t2/a7ozIS4mwMnZHatopv7kLQifDZk2hsTlaTmVGd9mJpTdnghp2sTshtzLbHkbO3B0BOlkFRZkwGSWbMXGajdQOsX6UJhIeAn8wxLbEWVag+R+88fsm/bK6At1UffUjPP9Hbj6UstuI33TjjOJL+P5IqPQ0YMBNr/FOxtz1p58jZGiZmcxj1Ss+yrj2YjCsowr8m0etOutVMviRwp+acEAolt9+pb5bJ/gzoNl9wp6IVVXlcLn5lBQaMXx78f3vn8S31vPgz58GLsyTlxysfDD2V+OSZcc6eMSYW7r6glYJwh2MqXqf2Pd+G7Yzexlb7ze1hnK4njxL0u0r5soYrPTEkHoLmQpX5b0Et1vry5F73/9K3Z3kzxzaRI4PYCFM9R5MdrtgyihkMlYmyLGcXjwmAu9gGRHxEnhUCptPT9pOE7Ovk6TKQ4q2GG06tRz4KpkLywK4dvlNOGgAcJ7CgpLgayazoOnM/QzktGQeN8roSCBa2P9GmUiSc1XA92ogPZVbkAIN50DGT7G6KXIrRIaL/uyc2BArfl+Rnjrsffe3KKsXgvux8FKJ9xYyix15zruAtG+gFgyyZSRcnfKC1Z/+fdpzM9ygHpzclkVtzCtvk4YM3hLrSeC9OfUvsUPq/6gflzjV1u0DdOhufio5sFV2kKmEWWvGia3htR1GHBHb6/urCwmoIA1BGLQCKoGvuWH+MWW4pdcHhCmTCg2hH0eJXAlOwK+l3om7ENA5HvDAQLqtsm2l0eRjqfBq2LnCBH1p8w==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(396003)(39860400002)(136003)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(47076005)(426003)(1076003)(82310400005)(336012)(26005)(6666004)(40480700001)(40460700003)(86362001)(36756003)(36860700001)(81166007)(82740400003)(356005)(2616005)(186003)(478600001)(41300700001)(8676002)(4326008)(2906002)(5660300002)(44832011)(8936002)(4744005)(316002)(70586007)(70206006)(6916009)(54906003)(22166006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2023 10:25:31.9074
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16268770-c82a-468d-0230-08daed74d7dc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E643.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6814

Printing memory size in hex without 0x prefix can be misleading, so
add it. Also, take the opportunity to adhere to 80 chars line length
limit by moving the printk arguments to the next line.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - was: "Print memory size in decimal in construct_domU"
 - stick to hex but add a 0x prefix
 - adhere to 80 chars line length limit
---
 xen/arch/arm/domain_build.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 829cea8de84f..f35f4d24569c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3774,7 +3774,8 @@ static int __init construct_domU(struct domain *d,
     if ( rc != 0 )
         return rc;
 
-    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
+    printk("*** LOADING DOMU cpus=%u memory=%#"PRIx64"KB ***\n",
+           d->max_vcpus, mem);
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
 
-- 
2.25.1


