Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA5C5FE72B
	for <lists+xen-devel@lfdr.de>; Fri, 14 Oct 2022 04:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.422452.668479 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojAqC-0004e8-K2; Fri, 14 Oct 2022 02:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 422452.668479; Fri, 14 Oct 2022 02:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ojAqC-0004c5-Gm; Fri, 14 Oct 2022 02:54:28 +0000
Received: by outflank-mailman (input) for mailman id 422452;
 Fri, 14 Oct 2022 02:54:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bPLM=2P=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ojAqA-0004bz-Vz
 for xen-devel@lists.xenproject.org; Fri, 14 Oct 2022 02:54:27 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80c3dbf2-4b6b-11ed-91b4-6bf2151ebd3b;
 Fri, 14 Oct 2022 04:54:24 +0200 (CEST)
Received: from DS7PR07CA0014.namprd07.prod.outlook.com (2603:10b6:5:3af::17)
 by IA0PR12MB7627.namprd12.prod.outlook.com (2603:10b6:208:437::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.26; Fri, 14 Oct
 2022 02:54:17 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3af:cafe::7c) by DS7PR07CA0014.outlook.office365.com
 (2603:10b6:5:3af::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.30 via Frontend
 Transport; Fri, 14 Oct 2022 02:54:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Fri, 14 Oct 2022 02:54:15 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 13 Oct
 2022 21:54:16 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 13 Oct
 2022 21:54:12 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Thu, 13 Oct 2022 21:54:10 -0500
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
X-Inumbo-ID: 80c3dbf2-4b6b-11ed-91b4-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fFVoCVWMBIwJtbleO1SJY2p7QsuXqzKDGNhNh4xchYcycS9IqBsT3pZMbPWtVt71d/jRASseIr3ZWF6UKxdJ+WINKQzz0dsObVwEs6NaCYP6i7AxTRLLR1tv0BHwFJagpQcCIvJ5fO5mUsztDnIziR/b0PEdcyq28jgMBsP/RFZxre6L0Jx8QOLDHJlL6A+M682/pJX+kQK+HWnmlQ8oYvWLEBIWwNJCsEKHtO5L/gAVwChazS9CLpiypKQsuoPO10O9L5yeC8eSPMOo2a78YaGj6n+frAtCZF9I8U0JdCyvUzx0W6gOZVuckY9I5sphSDdqpRk23zihCu30/b71pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zULvW+JkD+An25jpZLbA8r94kG4X0+wBMjtFrTztGg0=;
 b=kKQfAuyVtV+rTOq/MP+qu6nZXlsDQjnn1egZ1qB3SOlPY1KIJRl6jnxm8w86AvFjNEMgAOIJlu4kPxa1UsEkUg0kglvaKxXU+Qfgj4z4KYNPilKffh3EUjyErxfEzLLQCqMcGREsObg6tY1wgPY5ffeelpx3DHGUg/G3ci5lO8MR4p6tJVeDPDvRwvKnkWN1OZlyMMe+x9DrrXfZtW5tHmCGkoOdtyV1VNyJN+EjdKHwxtm/gaB5ZaIJBEhJxRzWu9uE/F4ZEZKN4eHs997VcAtuAhP/O1fe3J/qcaeBjyxC0P1k/PZQnl8DWJnEozNAqi3GjLN7phyKFh4ugs5f0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zULvW+JkD+An25jpZLbA8r94kG4X0+wBMjtFrTztGg0=;
 b=D0lyL8IdZcsQ/miUbwMnrIPGWpN6fLG59riQ/SuOcjtrkwSGO+nwVZJy5r3i0y4TwTrw4waenJj8+G+2ab1nVI6bxlSteiGQ7lc4jU/i9/8YsA30FRbXSCRflZFLtzY3ffWrPtJ/DFvAF1BWhuypZ2wfVkE5t+6lGFp2ek2rvOI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH] xen/arm: mark handle_linux_pci_domain() __init
Date: Thu, 13 Oct 2022 22:53:54 -0400
Message-ID: <20221014025354.30248-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|IA0PR12MB7627:EE_
X-MS-Office365-Filtering-Correlation-Id: 327d6dde-de34-4e90-b5c8-08daad8f61d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sEMl27HmOze/5XkQfX+5fI1pthshkgR0fwxaZDlm4tLNXkZfSmYwtfjRcuN/d07XMkluRunhpTj9uYun3YAgylBxRrx1We3D6rqdaGNhmRQi7x8rmdPEIlO0mShkNmWCR4PPBPvDdHufp4mIMEWIzbbyss4wdauV09rHRxF8vsYvXdXUvZbZXShhANpAwjWodyhGH6U4wGMLKY+8cLsxXt0SX/sPaeATrtDOVSJdWMeCNAIY6QtwtWRFAnkgzm9far5nVZ8u0XwOv5onCIUChv90eTLc8k8xkMwi3/ZIGUlwSMF12qGYjsaIldFt3GQvwq9z6iH6A9qJ7pdhKNE3Y/Fdlk1uJkyTAWbIoKpF8gxIRactZE3JCyH+OrZ2Ox/EIVnD8ihxpHXLTaM7Bf3tO8U3KouNPOUvy8clxbhbG4bAJYGRPDy5K0kXRHttNOneAmuCeoGFthgr9vGskoGB7I5r2Nk2Uc4+xktywcsTlHVyBckpMeftL9gXbuhaXi/1RQFI38k4loFg383YLKqqGuRA0yeREE6XQzxLxOIQ6mhqDVsMGHVm5pc8GPAe0vfG6U6XCdEqj9GUZeIayZwZ21jyxo3xffAe5vWr+CmeHcKcO53ak82HNouEfRAESYWaZZ6LM1JCAJylZcadaGSYlDUpGRwwymVvmCyo0J/FmOuu2Fo6JrwIcwW+r1JISwQ0XjzzHihafUpQFfag6SEPWhn6dHJRX+hJVJHZMo1FeX/Zpm6gZ8BMOxWjjNcSfn1o/sybj5KCc8X3L3B025v3H7tYylx1e7X1U56//kgPS0vZtLtbQ6KvcjwQSkNFbh/E
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(82310400005)(36860700001)(426003)(83380400001)(47076005)(44832011)(2616005)(1076003)(40480700001)(4744005)(356005)(70206006)(86362001)(70586007)(8676002)(4326008)(82740400003)(8936002)(26005)(186003)(36756003)(40460700003)(6916009)(2906002)(336012)(478600001)(316002)(81166007)(41300700001)(5660300002)(54906003)(6666004)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2022 02:54:15.8889
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 327d6dde-de34-4e90-b5c8-08daad8f61d5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7627

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/arch/arm/domain_build.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index b975d0b309..9fa283d694 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1051,8 +1051,8 @@ static void __init assign_static_memory_11(struct domain *d,
  * The current heuristic assumes that a device is a host bridge
  * if the type is "pci" and then parent type is not "pci".
  */
-static int handle_linux_pci_domain(struct kernel_info *kinfo,
-                                   const struct dt_device_node *node)
+static int __init handle_linux_pci_domain(struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
 {
     uint16_t segment;
     int res;
-- 
2.38.0


