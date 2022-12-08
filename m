Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4359064700A
	for <lists+xen-devel@lfdr.de>; Thu,  8 Dec 2022 13:50:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457101.714941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3GLQ-0002Vp-UW; Thu, 08 Dec 2022 12:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457101.714941; Thu, 08 Dec 2022 12:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3GLQ-0002TT-Qk; Thu, 08 Dec 2022 12:49:44 +0000
Received: by outflank-mailman (input) for mailman id 457101;
 Thu, 08 Dec 2022 12:49:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YEW2=4G=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1p3GLP-0002TN-58
 for xen-devel@lists.xenproject.org; Thu, 08 Dec 2022 12:49:43 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20628.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0756fe9-76f6-11ed-8fd2-01056ac49cbb;
 Thu, 08 Dec 2022 13:49:29 +0100 (CET)
Received: from BLAPR05CA0030.namprd05.prod.outlook.com (2603:10b6:208:335::11)
 by MN0PR12MB6270.namprd12.prod.outlook.com (2603:10b6:208:3c2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.16; Thu, 8 Dec
 2022 12:49:35 +0000
Received: from BL02EPF0000C407.namprd05.prod.outlook.com
 (2603:10b6:208:335:cafe::94) by BLAPR05CA0030.outlook.office365.com
 (2603:10b6:208:335::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5901.8 via Frontend
 Transport; Thu, 8 Dec 2022 12:49:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000C407.mail.protection.outlook.com (10.167.241.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5880.8 via Frontend Transport; Thu, 8 Dec 2022 12:49:34 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Dec
 2022 06:49:34 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 8 Dec
 2022 06:49:33 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 8 Dec 2022 06:49:32 -0600
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
X-Inumbo-ID: c0756fe9-76f6-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZfL94OnihEgyPsEOv8EAH8ueSAy9i96vBvCG1jAfdZTp7m/Ol/r2hhCkgAGRHuKBPMrSbb/JIr+dHgnLJX2uk05KtC1ACIKsXUEC8ZDXc0dwX5hDMQqWI0jF7pJThU06BGIh+JvgjE4aqKtaLoupAsC3v28n+kx0FBAsxdNHPp1KdRMFElhZO1wfJWAFZkNh7LuSn3A89p4BEgpLokK3l+EKrLD/rw2VgRNnLyZ2TMpW7hCxNxn6105uH6jOWjPKfMStX93EhItBoqXtQZO5Ry6bu6Pj/DXA8ZA6je6vXRp0TJct4rrEALDkFXBCXObx//S4pCkLy9Wg6XvquywL6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yenTeUt+rF7YHoERmpJx6GV+EruBzgUxZO07mi3amQ8=;
 b=Y9/sORJ/ZnhyGY1WFcZoVzAlJgRKD6LYXQTFKiBEo7o0l0Wy1ZVQF3m44TfPhkeyiITCZ+u76iCbugyMXCF3JaPWggjTYWfe1je83REoyxNbToSfDDJBNNeuJb8xdFJoudeWI4+n8HKpujgtfL2PSQTDmnWQTZfNcJalDRFYvdSeTzYVZpUlooZ28TEyx4T634yYvxt6H/Qoia+ZponYFe22AQXEV73z1V7umbLWX2S07YEB4jVOl72iXDlOcFGfQKUIC+eO+zupOUo/yL+0bk4T28IdH7A9hSaOrIRuWg5UQOVKpedNwUHv2pcRq5udfcjsO1v632SbaW3b629YTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yenTeUt+rF7YHoERmpJx6GV+EruBzgUxZO07mi3amQ8=;
 b=aziHvksLqJaJPgeEgv918+qB0N5fTIxVc7wu1+ounFWujE31zB0ey49BnxHEMjLwPnj3F6GD/KBMbYMlQjdlCDFbxe7GYwJFKIVVWofwL8O2UVs3zBhM5EljsBKdL1e/5YnbvTRUTu0M4LS5DjUx1vWWkvFATSCNoZQ1s6RTliQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Subject: [XEN v1] xen/Arm: Probe the entry point address of an uImage correctly
Date: Thu, 8 Dec 2022 12:49:29 +0000
Message-ID: <20221208124929.55268-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C407:EE_|MN0PR12MB6270:EE_
X-MS-Office365-Filtering-Correlation-Id: 0737bf81-5ed0-40a2-7671-08dad91aa875
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	td+CbEK8ItqFZLXs+6n7cj6UynpwECUvhfT3Z27U6M3RqXEBtz/Ntis9GRk6DcPM/eoW3wQiJoDCNRtIRuLbmCTwdWKFz8ABytRzWBtZGfO6eLcyCKlecZDep7xIZ9+/v9Hql9n6XT+lLZYGlc6b2QS+XRzz06Aa2MTEjvgbEAdLjwDOi6LsqL+CHcVgHgcXSuYyRLOxEisQYDjW4C12iI7/AstFE1dg/51DwzypH/j4jrwXTeV0nFxr+KaiQl2jAaypWhWUGsqLCxb8+t+qeKq+WP4w91cYTIIvjeAnjAhPUPoyVMlMl2/pzKRwaICERFOJtwhzfoiRV7xNTy4E9J4n079AQ38NroIXd/aDgGPn6VPJR3MfT+ShznbBxzdLP4bx9i94HyBAC6XLZMpVFQQmNsOdFG+dc9dbcYPj2d22hAUcdqL49nZiUuwn4ZUJl5h1H/FqaZ2XYrTCrJs0EfX5fiLlL4C6Nn6IRBfGOnkm70OE7zEOfVZvbLNuJfyQsTyJl+fX6JgFYoNkHQUC1LBEFAf1aeOYP2r7I45PxDOB1pakmJpPrJ6eLixx7JXtBAMPx5Dg2s/vxvqZZVfeGIDts6ecAl2OYWxnXSOyvfx9MMDbLf63SswqbvzIUHz4EsfgmT+WcMV7vmSuOuXKvtPTQ3dAzRtG+2VUFgHq7hvItpF7jWKGhfw5Pf65N99K6x01LEFOeKa7py5/jeZDUD8XCNifEWW6f2zwBhhQy5w=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199015)(36840700001)(46966006)(40470700004)(6666004)(478600001)(26005)(40480700001)(316002)(6916009)(70586007)(70206006)(4326008)(54906003)(8676002)(8936002)(47076005)(426003)(82740400003)(356005)(81166007)(41300700001)(2616005)(5660300002)(86362001)(186003)(103116003)(336012)(1076003)(2906002)(36756003)(36860700001)(82310400005)(40460700003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2022 12:49:34.4368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0737bf81-5ed0-40a2-7671-08dad91aa875
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000C407.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6270

Currently, kernel_uimage_probe() does not set info->zimage.start. As a
result, it contains the default value (ie 0). This causes,
kernel_zimage_place() to treat the binary (contained within uImage) as
position independent executable. Thus, it loads it at an incorrect address.

The correct approach would be to read "uimage.ep" and set
info->zimage.start. This will ensure that the binary is loaded at the
correct address.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---

I uncovered this issue while loading Zephyr as a dom0less domU with Xen on
R52 FVP. Zephyr builds with static device tree. Thus, the load address is
always fixed.

 xen/arch/arm/kernel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index 2556a45c38..e4e8c67669 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -222,6 +222,8 @@ static int __init kernel_uimage_probe(struct kernel_info *info,
     if ( len > size - sizeof(uimage) )
         return -EINVAL;
 
+    info->zimage.start = be32_to_cpu(uimage.ep);
+
     info->zimage.kernel_addr = addr + sizeof(uimage);
     info->zimage.len = len;
 
-- 
2.17.1


