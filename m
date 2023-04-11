Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FDB6DE49E
	for <lists+xen-devel@lfdr.de>; Tue, 11 Apr 2023 21:17:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519776.806798 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUP-0006LW-2l; Tue, 11 Apr 2023 19:17:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519776.806798; Tue, 11 Apr 2023 19:17:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pmJUO-0006DA-JJ; Tue, 11 Apr 2023 19:17:12 +0000
Received: by outflank-mailman (input) for mailman id 519776;
 Tue, 11 Apr 2023 19:17:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LOX4=AC=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1pmJUL-0004Ta-UB
 for xen-devel@lists.xenproject.org; Tue, 11 Apr 2023 19:17:09 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20611.outbound.protection.outlook.com
 [2a01:111:f400:fe59::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73e6f7e9-d89d-11ed-b21e-6b7b168915f2;
 Tue, 11 Apr 2023 21:17:09 +0200 (CEST)
Received: from BN9PR03CA0142.namprd03.prod.outlook.com (2603:10b6:408:fe::27)
 by SA0PR12MB4461.namprd12.prod.outlook.com (2603:10b6:806:9c::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 19:17:06 +0000
Received: from BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fe:cafe::68) by BN9PR03CA0142.outlook.office365.com
 (2603:10b6:408:fe::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.39 via Frontend
 Transport; Tue, 11 Apr 2023 19:17:06 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT107.mail.protection.outlook.com (10.13.176.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6298.22 via Frontend Transport; Tue, 11 Apr 2023 19:17:05 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 14:17:03 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 11 Apr
 2023 12:17:02 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 11 Apr 2023 14:17:02 -0500
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
X-Inumbo-ID: 73e6f7e9-d89d-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EE2Ctn9GNlCFsItgMw8F9HmYXg17oJOdiP9I9XI4gGGOLXsCtSbDBSqC61H+Dq+MLsM7lxptVaIo+tOpPZPzzMDUlCj/wE4F6cekg2BKBn6/Lo9J9ZDhfqwtpK/9IY1089A9Q867ER7/LITYmQibC71RbKQVmwQGce9+X5tjUYl3mShbhsOu8sRmoCVk/82SwIkHBA0S/pxssD5JCg+BWCV4HX/8NOUZm+GqDJPV/BsZhURrKd9nJXFRya41E9vv9DuOzNDjwYbJ5xo+9I8FY/BzeL3GPEYu4G6QlZSHWIXlZp5tfgNRPLpwRbKvetPtBqkQF/6ytR5INCV8dx6KlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x1PNAnqijXbZmLbaJTz/bnk2u6mRzrBSQaqCUQeSU5s=;
 b=jaL9+qOMzRad5tarJg4rEj4AKXrLNbMCDZlevdOeN1RNicT0Vj4aGC2TpobcwtvzX7YLo5mFaIpM/8ulm1opSE0QM2dTfcTf+xjX0o/MfWBBCLKrIfMG4b3D39A3YuA0fhCjqtpKPBGsMN/cjpUibFTkyhbO+SToa+IxsW4Vu2rS7dD6RbdMLXSMN3IF1G05npHhRVG9BabpwY7H+D6HQI0DUuznXWTDFXOS2Tx//5JnZtFgOpDe9Ck2R9xUkNMQmOz+Y2p0ORVooRxFOIzonSG/hvi6aJR7+oABL/WNh62YxFEGv7Frl7HiY+NUrkun81OMteRtRID/tKwmaCyugw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x1PNAnqijXbZmLbaJTz/bnk2u6mRzrBSQaqCUQeSU5s=;
 b=utGqqoXglk4yU5u11TW967K8k1NpxM1j7Bmkllm4Bn7wCTX1ogO1oSrTPEHf13ml2qCcv7EmB00zIOviy+PnFtwWVV26CjjThzvZrLhKh2848DLvyL841LgU937KVR6dXT4JeV+TpyfgP5FucG/R6tH+0XCreVFnWdWGjbUzCDM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Vikram Garhwal <vikram.garhwal@amd.com>, "Julien
 Grall" <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN][PATCH v5 11/17] asm/smp.h: Fix circular dependency for device_tree.h and rwlock.h
Date: Tue, 11 Apr 2023 12:16:12 -0700
Message-ID: <20230411191636.26926-12-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230411191636.26926-1-vikram.garhwal@amd.com>
References: <20230411191636.26926-1-vikram.garhwal@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT107:EE_|SA0PR12MB4461:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c464d7b-9522-41af-e4d2-08db3ac156aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	T1rYiXDUh4QnttGRazlOfWqjXoFP74k7bGx8YZ1wWb56PmvEsA86NABuo8umFlX5ixEi3YYq+E2xjZP6eBbWnvYB8jxJWUKeG79Av4TW3jJB0aDKOibhxbA8op9ZEslTO2VsDBJsW4puJuLQF7PNsVPhHaCsz5gSEg86dt60nC2ol7cScOcmegiDeOXY+tXSJiIhUvybYfmsyq869lb3lyUcRji4lT2SPZkgGwlhtMALVu5CEvyb4OD12v3OB56KM6iv8RWFhILrbyKWRqnCZ8PzKzi/TvS9SiFw0ahr+L4ptt3IZFsM19tr9C3tZrfGcKox5W6ERt+1bkk5UtbxL53hbKEx4hQyEZ/9oV76ao9yEIiAK6As55jinHTIfSUmYt/NK1WegBul9N/cwFSkVrvI6svGFAWb6w9labchneUXBergLWfB3IMNsYi0urR6/e0DNYLNxyZrf0Oukje6aAbxrhkjmnEDG+zm2iyCshjIIYqYIoQI9aZ/nxZMUfWlQiKtFnaRJj0554loeuyY/TkoOT4sXNZeygfCwwjgY9UgFvt8oxTkAmwMW/Lizz5BqYQSUsCa4r6xDDcLKsHV/YDmBTYJ89hw78Le2RG7Ls5rR68UcuQHYCXuNRbn9NHVB0APiSi70L1uADioPmuqiUCXQ/o8LtHvjZWYSeM5OZ8GxB3fuIZB6BJujSECBgvXC/F8hNVXBAFgT6WhzWUjtt7RdHucICoh2uh3QgMCCbk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199021)(40470700004)(36840700001)(46966006)(40460700003)(4326008)(6916009)(8676002)(54906003)(70586007)(70206006)(478600001)(41300700001)(316002)(36756003)(86362001)(336012)(47076005)(2616005)(426003)(6666004)(1076003)(26005)(83380400001)(44832011)(5660300002)(2906002)(36860700001)(8936002)(82310400005)(40480700001)(356005)(186003)(82740400003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 19:17:05.9727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c464d7b-9522-41af-e4d2-08db3ac156aa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT107.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4461

Dynamic programming ops will modify the dt_host and there might be other
function which are browsing the dt_host at the same time. To avoid the race
conditions, adding rwlock for browsing the dt_host. But adding rwlock in
device_tree.h causes following circular dependency:
    device_tree.h->rwlock.h->smp.h->asm/smp.h->device_tree.h

To fix this, removed the "#include <xen/device_tree.h> and forward declared
"struct dt_device_node".

Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
---
 xen/arch/arm/include/asm/smp.h | 3 ++-
 xen/arch/arm/smpboot.c         | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
index 8133d5c295..afe6129276 100644
--- a/xen/arch/arm/include/asm/smp.h
+++ b/xen/arch/arm/include/asm/smp.h
@@ -3,13 +3,14 @@
 
 #ifndef __ASSEMBLY__
 #include <xen/cpumask.h>
-#include <xen/device_tree.h>
 #include <asm/current.h>
 #endif
 
 DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
 DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
 
+struct dt_device_node;
+
 #define cpu_is_offline(cpu) unlikely(!cpu_online(cpu))
 
 #define smp_processor_id() get_processor_id()
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 412ae22869..336a7d418b 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -11,6 +11,7 @@
 #include <xen/cpumask.h>
 #include <xen/delay.h>
 #include <xen/domain_page.h>
+#include <xen/device_tree.h>
 #include <xen/errno.h>
 #include <xen/init.h>
 #include <xen/mm.h>
-- 
2.17.1


