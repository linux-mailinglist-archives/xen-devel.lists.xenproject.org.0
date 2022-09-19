Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E814D5BD4D4
	for <lists+xen-devel@lfdr.de>; Mon, 19 Sep 2022 20:39:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.408883.651730 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaLeY-0005ZO-6m; Mon, 19 Sep 2022 18:37:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 408883.651730; Mon, 19 Sep 2022 18:37:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaLeY-0005WE-3u; Mon, 19 Sep 2022 18:37:58 +0000
Received: by outflank-mailman (input) for mailman id 408883;
 Mon, 19 Sep 2022 18:37:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=42hY=ZW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1oaLeW-0005W6-Om
 for xen-devel@lists.xenproject.org; Mon, 19 Sep 2022 18:37:56 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2074.outbound.protection.outlook.com [40.107.94.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2c5c9eaf-384a-11ed-9647-05401a9f4f97;
 Mon, 19 Sep 2022 20:37:55 +0200 (CEST)
Received: from BN9P221CA0026.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::24)
 by CH0PR12MB5387.namprd12.prod.outlook.com (2603:10b6:610:d6::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Mon, 19 Sep
 2022 18:37:51 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::7c) by BN9P221CA0026.outlook.office365.com
 (2603:10b6:408:10a::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.15 via Frontend
 Transport; Mon, 19 Sep 2022 18:37:51 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5632.12 via Frontend Transport; Mon, 19 Sep 2022 18:37:50 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 19 Sep
 2022 13:37:50 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Mon, 19 Sep 2022 13:37:49 -0500
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
X-Inumbo-ID: 2c5c9eaf-384a-11ed-9647-05401a9f4f97
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VfS1TMHKzPnioeD0vg7FUkyic4qhUTBSJhEUeYcGCTo+FGPrqfw/AfhATNIMiSANwqkZaaujXP0HmIQ67cXtP+slfZkXf7Fitbq8ERSLfSGVL3K22DEM28RJq2kyyPkWZJeKtG7vX8NrxEKewA5EZhyQ671CusA5xKs4qYg1aF2yNX0B4uBJHTLXecC4Rr7ECfvOXh+VWAJGWgXjmWM5UGbLNzTEqsHIpextTSMy3VPT6PHUJTQ/OghW95prOm2legifjJAgsUUyX59TnF8RPOJKKVx25JZLum2jI0GHoL3ho8+nF6/KyTTuF86wTvfbcZKtFcBQ3+DRu2aw+uuaRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L6Sabc4pZq9IA1rmU3S2UQoeU2Nxuf8Lvhkj3rNxmAY=;
 b=YzsTrj+g5MULMHLwDduAbn2GSd4tJ6F0mkNjJcU/vDDVNH6IQNJqf5MjF+HXlRjewlyMswADv7LlBnYrpKRk8KdT42kahkHWteYxUIkvXUvZr8fwT3qwK1kCCjg095qkw7fL1yh2csKHBM5yG1/vz8sohiTzI7Z2LsGXX9RAbv3XVFjGa3EFxo1fLKpfaCJsmm1yl9+Hs60J5tGTSKVNeXslYnS8RjIxnHfJFCgg3KH+vaIzNmRWHicrG6BewEWPv561bLx7vGvtHtxgn+KLS7Mxb374oR+BvaC79ud8Ho9jNDQ81BjZTlBmD9gVhkm2Xh4o94tJOFwBZ2qdr+Z5Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L6Sabc4pZq9IA1rmU3S2UQoeU2Nxuf8Lvhkj3rNxmAY=;
 b=qREgYJTrslErtUurPMHsnnFHRfbmbyrkazNOKDf8H7Hm5lvDbypbLjut9oaWxlOe/58BqRxjemADgpGi2yHFPmQlG+AfxvSep7x6H97ogyVI5S6rznZOZfmeQdeNbpgzlGYIrlBNhcp8VDc/iBKYPmaC9639QS6UBp5dtRb0zM0=
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
Subject: [for-4.17 v2] xen/arm: domain_build: Always print the static shared memory region
Date: Mon, 19 Sep 2022 20:37:37 +0200
Message-ID: <20220919183737.14067-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|CH0PR12MB5387:EE_
X-MS-Office365-Filtering-Correlation-Id: 43b901a7-4785-4474-a61f-08da9a6e0ebd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NsfQvwfNzNtst29+i2FP+cH5IyApxvRKzby99dUS0UhPisOguscE/Qf9bFkp5C9fQ6IKLNqAI4ibFp675OJuQlkZYkueUfqhlROYzsW531wgY5+OoCFAWI+L3SvkTMfs+/r3b4KNjvFFNY8IL6T4LzY2cUdiA6ttU5Nz1h7LgU1R3uvBUtfuAfZDbfkrk7hRPfxzn5mehtltCADeak7L/DzRyoEvFxpHjzZ4utf1dDZ8nZ2iX3or7DXkLSuR4OwC0DTr+zOsobCc1XZi+sj5FG9zXqLDyxVXiHZtJ3OTJ4FBqEcIKNYwziCIgKn9E0CDF7OGkv+WraQeAaalq1qpo1V3dvIeToZAMDDH1r1thwCPh2YXzaHNsXU3Pq/OGwi/NoBCW5NVVV5XSbFeptdKUYnFikrD8mjXfBRPx83/Jm/BXh7ZmlZn9Mbrwxh8NaQmMlnT2jM29a6DRUVZfEbLp18SR4Udv3TmZdVC2sBoMmdiWB3yUk1ICfKpgPJAyasVC0JhdqEdRNcqJrbvDt+TB5kLzCr30CgWUXeZlZ/jZzKFjQABmUQMTscB5pg/9Ke8Z1HHg2dUEFqG9JZqwx23c320vg9mIrUGITXyHFybDdjaSbXEk98dwjbsVJ7wD1sKzTbpWgeMApKGWaQ7cMZJ+y8XAamF9dWTVMy64CR8dj8f7gLcRSrYPYovYMzO/BFXhIFJenDNzQ4ZaE5HrQ9N8Z5UC0YSbW+N1raLAx90+Yz0l73Ro7+FttltPlHO3AZyxo7ZyVNrJnIK/0hXwfdatQtBl/QriA65Jl0BNYrnG5I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(136003)(396003)(346002)(376002)(451199015)(40470700004)(46966006)(36840700001)(2616005)(2906002)(54906003)(44832011)(82310400005)(41300700001)(356005)(36860700001)(6666004)(40480700001)(4326008)(8676002)(70206006)(70586007)(83380400001)(6916009)(426003)(336012)(40460700003)(1076003)(316002)(5660300002)(36756003)(47076005)(186003)(8936002)(86362001)(478600001)(26005)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2022 18:37:50.9955
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b901a7-4785-4474-a61f-08da9a6e0ebd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5387

At the moment, the information about allocating static shared memory
region is only printed during the debug build. This information can also
be helpful for the end user (which may not be the same as the person
building the package), so switch to printk(). Also drop XENLOG_INFO to be
consistent with other printk() used to print the domain information.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
The other motivation for this patch is to be consistent with regards
to the format of the informative logs. We do not really use dprintk with
XENLOG_INFO unconditionally as it results in printing additionally filename
and line number which may be misleading for someone reading the boot log.
Such extra information is helpful on error conditions to make the process
of debugging easier.

Rationale for taking this patch for 4.17:
Useful information printed always instead of only during the debug build.

Changes in v2:
- use different argumentation
- drop XENLOG_INFO
---
 xen/arch/arm/domain_build.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 01c2aaccd82d..40e3c2e1195c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -844,9 +844,8 @@ static int __init assign_shared_memory(struct domain *d,
     unsigned long nr_pages, nr_borrowers, i;
     struct page_info *page;
 
-    dprintk(XENLOG_INFO,
-            "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
-            d, pbase, pbase + psize);
+    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
+           d, pbase, pbase + psize);
 
     smfn = acquire_shared_memory_bank(d, pbase, psize);
     if ( mfn_eq(smfn, INVALID_MFN) )
-- 
2.25.1


