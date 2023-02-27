Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1B06A3EAD
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 10:53:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502311.774055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWaCL-0007Wm-Gt; Mon, 27 Feb 2023 09:53:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502311.774055; Mon, 27 Feb 2023 09:53:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWaCL-0007UH-Ds; Mon, 27 Feb 2023 09:53:33 +0000
Received: by outflank-mailman (input) for mailman id 502311;
 Mon, 27 Feb 2023 09:53:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rB3s=6X=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pWaCK-0007TY-5x
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 09:53:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20603.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::603])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 96a1ab08-b684-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 10:53:30 +0100 (CET)
Received: from CY5PR22CA0073.namprd22.prod.outlook.com (2603:10b6:930:80::21)
 by SA0PR12MB7478.namprd12.prod.outlook.com (2603:10b6:806:24b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29; Mon, 27 Feb
 2023 09:53:28 +0000
Received: from CY4PEPF0000C966.namprd02.prod.outlook.com
 (2603:10b6:930:80:cafe::47) by CY5PR22CA0073.outlook.office365.com
 (2603:10b6:930:80::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.29 via Frontend
 Transport; Mon, 27 Feb 2023 09:53:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000C966.mail.protection.outlook.com (10.167.241.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6156.12 via Frontend Transport; Mon, 27 Feb 2023 09:53:27 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 03:53:25 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 27 Feb
 2023 01:53:25 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 27 Feb 2023 03:53:23 -0600
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
X-Inumbo-ID: 96a1ab08-b684-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JzfSAjUq57C8AQhc6Ozxo/ljipf1vX4jmazdbiToaqzIkw5Pt4VGh83n3kkGVKU6uI6RNENwdyf+TKz6IBVc5T9DQvNEnkU3PNqdIGrPGpHXoABA5Eyaiw/DNsIAAuHY6u78mdu/98TvLbq+vOmG/8m2qBxBrTLrY1t19rRZ2ptd5NKyMdcgF6e9QU664/Fk4cgsMm8laoYMdq6/PBWQIKff4D5LY4s4rBPm6bPGTzFGEEM70p6xDPsnjAa4SvOEiO6wPXLWs/vJBrUvRoveGP0wUqu/7TKWsaAPsoPT52u6+9OlWp0slj5xGVUnWMIBZnKbQS3uvORSQe1CrceKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+aGyjPFZtYlmEZJ6BhqQiZTpCZjQwGAzAQyCFGUhQI=;
 b=mmeF1V70sAEUeZa+v7byMkhmLRZzfD0lHZGY8E5CWyY+Cdz5VOeIzqwaSsFdFuvB8PnOBhRhY7XLQKU9tkZJSlaCNtR7hL9DwPQbyGz42U3lNNOn/pfEiaGRoxzKWebrRLcygVq3wzwyUd+jefEJkSVCKiImrnf9Qfnte4296FOZUe+AQLJBKp4J1Y/+aPWeA9DkFHHoiNOyWZegfv8ruWE0bfFlEX+nR+azj6nAWlQ6n02UuBOKjab7gNjAxSPXU4CU2JZ78MrFP3jfGWFTHBCd1WNDse4pUvRqLX23lOzjK6NWP6t83Pju32kKXogGscuBa8obesK4dr7ft1bRsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+aGyjPFZtYlmEZJ6BhqQiZTpCZjQwGAzAQyCFGUhQI=;
 b=Al88jI1uD2r0Nwe+E09HKrBwzc70jMnOupL/UtVT7PBFlb5eAtCYz2ZnLy1RKKJFYs5EigDKN62zhhQ6g99Mw0HYG50xpHewDw54IqcifmC78Ma5+6Mhy5LXzeUcosfrRocKgoWDfAdkEoLGuq8psYc71IrsHJ2HzKyTm2V8ERA=
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
Subject: [PATCH] build: add crypto/ to SUBDIRS
Date: Mon, 27 Feb 2023 10:53:15 +0100
Message-ID: <20230227095315.6483-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C966:EE_|SA0PR12MB7478:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cdfdc62-3317-4c62-093a-08db18a8796b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rW5JjVL58UuLPQqP8YSTmZKOn8Umr+w9EiRT/c2O/j+oTRtGgJgZKTQPyXzZvET9wpw9l6zCIu2F1kQl+Uikh6fxQ8dg7NnlQuLIFdkS10fdftTyE3L0KzDmEvXrHPdD27rMServejuCet+Xeiqsr2EWuH5xUxHJX6Ze7ywBoKY+EruN281i8DAgRI0AHPmVNoPh4e6CuuQ9yvHoWTFUoyJRuS5Bpdcg48fIP4zIhpXxUc/RMOdmAJ1zx1MQIZ/AzENPcj7EvmxxKdacHF0xJQVQ7oDHgtPP5iyBxXPB116FHvduKUntG6g82mm3BWnVcOg7Zx5imNOprISumnUUi63RP1T7ktTaEkU1MohRvNjUVNbdmefjOvpcI9pJvGvQZ5j77RYeAUoknb+hY9M3OwOZalWYlYqWjy5hH/HQlxnAHQQN6TayoMMWBEGy9L4LMTS/ScmtIt82sYNnR7eMBNbg+MuPf42+SaFQ9oePSEAiVNAHNKA9AoMEa0lnApso2JV+mZ8kaOdTOS81/ddRzc4BLsshpOizkYi+7mzkU/493Qp8Ke/c9TI3jMAs0CtPqlSWfjBQspMlJJL+FoD5q+1Hjt5M7DV9TEMVP/z79+ISFsAgeB49zMbX1W3Rca8KN52Jkl551o4/h0DkcGg55NZIq4/lx9M/lkV0yz2+9v1yecugaI5+8a1gSjCOBmBETQkrz7b1PxXdaNenWcJ+GICoZ1XZjPKjBZu73VyQ3Z4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(40470700004)(36840700001)(46966006)(2906002)(44832011)(1076003)(5660300002)(8936002)(36756003)(4744005)(41300700001)(54906003)(40460700003)(70206006)(70586007)(316002)(86362001)(40480700001)(4326008)(6916009)(8676002)(356005)(478600001)(82740400003)(6666004)(81166007)(36860700001)(82310400005)(26005)(186003)(2616005)(336012)(47076005)(426003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 09:53:27.2593
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cdfdc62-3317-4c62-093a-08db18a8796b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000C966.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7478

This is done so that the crypto/ source files are listed in all_sources
and thus taken into account for cscope,tags,... targets.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/Makefile b/xen/Makefile
index 2d55bb9401f4..27a2034b593e 100644
--- a/xen/Makefile
+++ b/xen/Makefile
@@ -589,7 +589,7 @@ $(TARGET): outputmakefile FORCE
 	$(Q)$(MAKE) $(build)=. arch/$(TARGET_ARCH)/include/asm/asm-offsets.h
 	$(Q)$(MAKE) $(build)=. MKRELOC=$(MKRELOC) 'ALL_OBJS=$(ALL_OBJS-y)' 'ALL_LIBS=$(ALL_LIBS-y)' $@
 
-SUBDIRS = xsm arch/$(TARGET_ARCH) common drivers lib test
+SUBDIRS = xsm arch/$(TARGET_ARCH) common crypto drivers lib test
 define all_sources
     ( find include -type f -name '*.h' -print; \
       find $(SUBDIRS) -type f -name '*.[chS]' -print )
-- 
2.25.1


