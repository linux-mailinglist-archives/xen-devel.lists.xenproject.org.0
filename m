Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F7065B39B
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jan 2023 15:50:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470348.729825 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCM7n-0003y0-UN; Mon, 02 Jan 2023 14:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470348.729825; Mon, 02 Jan 2023 14:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pCM7n-0003vU-Rf; Mon, 02 Jan 2023 14:49:15 +0000
Received: by outflank-mailman (input) for mailman id 470348;
 Mon, 02 Jan 2023 14:49:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W7CY=47=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pCM7m-0003vO-7F
 for xen-devel@lists.xenproject.org; Mon, 02 Jan 2023 14:49:14 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2044.outbound.protection.outlook.com [40.107.102.44])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e3e6c39-8aac-11ed-91b6-6bf2151ebd3b;
 Mon, 02 Jan 2023 15:49:12 +0100 (CET)
Received: from DM6PR21CA0017.namprd21.prod.outlook.com (2603:10b6:5:174::27)
 by IA0PR12MB7675.namprd12.prod.outlook.com (2603:10b6:208:433::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Mon, 2 Jan
 2023 14:49:09 +0000
Received: from DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:174:cafe::b8) by DM6PR21CA0017.outlook.office365.com
 (2603:10b6:5:174::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.2 via Frontend
 Transport; Mon, 2 Jan 2023 14:49:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT012.mail.protection.outlook.com (10.13.173.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5966.18 via Frontend Transport; Mon, 2 Jan 2023 14:49:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 2 Jan
 2023 08:49:07 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Mon, 2 Jan 2023 08:49:06 -0600
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
X-Inumbo-ID: 9e3e6c39-8aac-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuB2gXUQZGR7Cv/1+KZRvB4PM22ZXzMuLPHkpRTtoc5JWCeU0B+zTQskVzFB2k5KSp7H497c6KHFG8M944pPDrxZvlV8yGDCkfVUMREGfP2RTvXBF3PkHdPwMFOwHf/fKNyPYNGfd/jU68TaULwP+Yv9GLbtuh4gdnXCTwNHmYJz3IlplOA1pD1c77X9ob/NHDAuAxeoAwAyBeh3LVVdF3CIGr1VevnE0KxUBLgvsiZ/yriA766pnfuKowfzKdeJiteXVcGw1hnwtmpyTJ+kKtI8b6+5xduKacm3T/IVqdF1fZjeW4Uhty+kDQlOV+2Bzc3FgVSX4SpDrnyVcq8rug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=efh/Yhzkae+fINf3IfQzkBHj+8mOBrO76E4WEVCwp8Y=;
 b=loi+jwbdNCnhgN+rYjVn77BF9bDZluXY+SAKWKn3HY77Vzbhtdnh6f5eA9ZYr572X1is1DEtOGS1e3OqQAtQN7C4Faxd9mDdwIA79G3G7zWqKl0WZKhEgpqknlX2yqnjjpqYxHumYjOb+UHIodxcQep5vDM7Z8ZaT6hunSweEQlKzcbvu0wXZ5ENM6RACwqo8TWSotqZkXdDooZPm3/giibKxru28r+f2ORx8VtoLVn/B+awiaPCzSwPmsTKfVu5eh7kVk9hXMcD8xKLK2uqQaIOXDWImuQ+lr0cA8Dqb1QKUSe8DhQ0JVD2rITkDJm1f2YbPTf5/Mv+7uvOIu7LMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=efh/Yhzkae+fINf3IfQzkBHj+8mOBrO76E4WEVCwp8Y=;
 b=NkMUBsfU67o6GM97paS6SzxTEnz8Ucj4w95d3oU3dAyIY3CgFukot29ICnrIw5xvl/7JEw/4hhQTj8gnq/I7TiiqG//42HT9GB48NoBbFQ/MulnQG7DBDDbrSrVLcDvvapLWGSPJrK4d49QpgPiqfbwkFERZv9l27KIGJwQR0lM=
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
Subject: [PATCH] xen/arm: Print memory size in decimal in construct_domU
Date: Mon, 2 Jan 2023 15:49:04 +0100
Message-ID: <20230102144904.17619-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT012:EE_|IA0PR12MB7675:EE_
X-MS-Office365-Filtering-Correlation-Id: 21fd9655-9e8f-47f6-6819-08daecd080ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MtQBb6uID8MpFXOcmFSRs3kXSzkoOOILoj2Cc/V85xcsWhvH1biTc88zAV52DfOQOo8rBVpINlhTnstUPQYUJkcpGhRo8qNDor4MIwPM4KSyF51KYb3jgSNRJZcFlq98OXnpw/Z46k/FOpHpPmScQsWnbtthdbTE0rVg8rpRyLXuw+0ANO744GAz0PnbaldsnNhqIDZIp18K6pb0HquaDk+iTD9XkzYMULWc/uFWFXnAJXyHiQ0EDqodo442gclSC6Cad8VzWjSw7VySmefJcXRwjEkf8p+gCMmOGqj0RgHSSBH8m6BGef8bJahiisbsQSxJ/tWKan8yiHIDfXiDmpxPg9NhgWSun/uzm1RpXpHj11RiRIZZ1DKtHkAS7fLl99KID7A7sJ4LiMM9wxDuSXJ53wQeAqxMZeUh6EP1IJArbGxqdUtIeTc295w28aAT8VIjzaShTBtSvCuMIT2uY4zYhtkhIzO66V6czh/AZl48+OybY2FDhiiGso+DjKK6gSIG9Q/pfzbuLqZKiiiFKqdxZtvK+fnEoNRqKd2OtxAOToDMGKvbYbS3s7tzaTkjBSXXgV8b5s+T+tQsbcA96mKueVLVa2f3iikSd/MiY5lIJXcspaZP+Q1VDz5E3Oc8cBng7XQDzPsGjsIQFP2r9DsYEPpae7AnCTCU/smpkhzgAit1Bsi343D2bXNGK7YSuitLI5oTKpMQaewlrzLyS8IpAozFEOwwdRY2YYcTFb50aKXy4XxaoGUqdcs1RB4ZXXYciJ+ZkrqseYFYmXkTdA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(376002)(346002)(396003)(451199015)(40470700004)(36840700001)(46966006)(54906003)(26005)(186003)(2616005)(70586007)(36860700001)(1076003)(316002)(70206006)(478600001)(8676002)(8936002)(4326008)(336012)(426003)(47076005)(41300700001)(83380400001)(5660300002)(4744005)(44832011)(2906002)(82740400003)(40480700001)(356005)(81166007)(86362001)(6916009)(36756003)(40460700003)(82310400005)(22166006)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2023 14:49:08.5960
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21fd9655-9e8f-47f6-6819-08daecd080ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT012.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7675

Printing domain's memory size in hex without even prepending it
with 0x is not very useful and can be misleading. Switch to decimal
notation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/domain_build.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 829cea8de84f..7e204372368c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3774,7 +3774,7 @@ static int __init construct_domU(struct domain *d,
     if ( rc != 0 )
         return rc;
 
-    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
+    printk("*** LOADING DOMU cpus=%u memory=%"PRIu64"KB ***\n", d->max_vcpus, mem);
 
     kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
 
-- 
2.25.1


