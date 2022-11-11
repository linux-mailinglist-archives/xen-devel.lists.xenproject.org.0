Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6C0625CCC
	for <lists+xen-devel@lfdr.de>; Fri, 11 Nov 2022 15:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.442574.696908 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrQ-0000ZL-Bf; Fri, 11 Nov 2022 14:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 442574.696908; Fri, 11 Nov 2022 14:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1otUrQ-0000Sc-4S; Fri, 11 Nov 2022 14:18:24 +0000
Received: by outflank-mailman (input) for mailman id 442574;
 Fri, 11 Nov 2022 14:18:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LUri=3L=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1otUrO-0006iO-FR
 for xen-devel@lists.xenproject.org; Fri, 11 Nov 2022 14:18:22 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b1a2e667-61cb-11ed-8fd2-01056ac49cbb;
 Fri, 11 Nov 2022 15:18:21 +0100 (CET)
Received: from BN1PR10CA0020.namprd10.prod.outlook.com (2603:10b6:408:e0::25)
 by DM6PR12MB4912.namprd12.prod.outlook.com (2603:10b6:5:20b::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Fri, 11 Nov
 2022 14:18:17 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e0:cafe::7b) by BN1PR10CA0020.outlook.office365.com
 (2603:10b6:408:e0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.14 via Frontend
 Transport; Fri, 11 Nov 2022 14:18:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5813.12 via Frontend Transport; Fri, 11 Nov 2022 14:18:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 11 Nov
 2022 08:18:15 -0600
Received: from xcbayankuma41x.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.31
 via Frontend Transport; Fri, 11 Nov 2022 08:18:14 -0600
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
X-Inumbo-ID: b1a2e667-61cb-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2JqJJ4fseB34F0NMFpJOLSEmVIRk0hngztiVW78/S6q7qo5Tygeljd3RYWGp47JCpizBDr2EL2K6R0JhyqezaP4CymejtYdnnwaB/EL0g6O98TWCHZGS4zqAg8uJmChuUNF69FzIWGZ35iGEu0b63z04eEe8b6iPQmrHO2KBHFdyYWdkDYovKz/UEB3W8vOFW1M6GruUgvoX1+TMe1P/tSaD1TnS66NIMV3abJ+rJV19yakS4EvEXhnfa+K4/RocRJA8nryI7bkqgXmlmV5irO8Pzp4U7lzgYd5DN/vlILiOs4PDnoB9zmjHDKwe8+/IgRDGPPuR3hRukp/SsYlJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FxJEzx55FB4HZS9AGsQGP4TBIHzxSrHrhRRSTavBMYM=;
 b=B5Tldffa7e7Tbyk21fXSakNWNLFQaRvmalgEcpW9prlEEsJ/3fRNnS7J2d4sCbnN9BrOUuOHGvmHQk+VkJLo9UUM5IByZsDbTXkqWy0LtA7H5i5HY3AR5sZe+DFniu+CNARYVU4AWsOqaq1Qd5UIxqSyi1OL23mdcDAyo/Peznv2e3DpkzxcNANPDrKyX08EQLJiynX/4wxCZwiqTm7re7K8pHpaxNtbKa4tr6DUoIstRZH6nRmPub/CTFbataEstEi9z7RbP/ruDmLbYyRfJKU8iQl1Z+M9OE0/aD7HVn23UAL5dJlQ0OmPGgLt4P20uYGG0WPsWySHSW2Log5jEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxJEzx55FB4HZS9AGsQGP4TBIHzxSrHrhRRSTavBMYM=;
 b=DgiJ/9dJHPmJD/FFO+A+hpoOGI774kBbVZRjd+ofoeOvvU5G2O9NTdUkH5/JY8Wk0jVh96ejJ21MAeWmuckQNDX1GzPdshAM6cMas5BE/gtxlc7uty6p/igrHFxKQbN2+yDxds8TF10TKzEYEC5GARoCw3sJxgRqoM02r+UtenM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <stefanos@xilinx.com>, <julien@xen.org>,
	<Volodymyr_Babchuk@epam.com>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <jgrall@amazon.com>, <burzalodowa@gmail.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>
Subject: [XEN v3 06/12] xen/Arm: vGICv3: Fix emulation of ICC_SGI1R on AArch32
Date: Fri, 11 Nov 2022 14:17:33 +0000
Message-ID: <20221111141739.2872-7-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
References: <20221111141739.2872-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT033:EE_|DM6PR12MB4912:EE_
X-MS-Office365-Filtering-Correlation-Id: 94eb4e8e-dd0c-4df3-9698-08dac3ef93f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1q0psyAvFiNBju3PdoTzq+BQ8fLTZg9FNcwf31OdO0UVTLXAjKNJD8nGxeyX6ZPjSu/W23/Md4KEMC3e2Ac46d6jrLGN9q4+LnbAQDD5kwe2+X+531KfHqq5GFatDGtHnvvgz8Vg1WL5FBrmjW6vRZneNrC1n5KM8LCX8l5cN+VLHxcTz8kJCqNs0OsQBtkoRmQUvG/Va3Kshmd+TMfIQ3CAkF1Vtby5x4wgz0r6HaBpUc6aGuPe5rPSzH1JRek/a1kXpivdGu7pL1RYX7cXRix/CR08VdiZRBEgE8m2hoYccGvH1RMMuOO5cUC+FZCgPuF6X4v/l82qLE7aWBcf5SQactG8RGxWmFNKD2N3XLyzzokLTkvZo9K0Wea3uODTHPRHxlR+plZCDXDzI+5G37y5TUCoajlfpsDddZMP3whpqMCGUEh24Lfqm/yPJN8/LbIWIZD/PKf4rxN6LTSqritA+TCaZAtKOzYr/MO3eHVzRQzpVmOypIWJJke5kVumhogP5+Y8ur1zyTgETyRqgof4uqToI148UXSyL+BX1ImQ1emP8W4fV+OnxFIs1z0sLgjZ4yGYFo+Axhrwpr4TI9c5OGYlAawGQurfMZdsoy1Nw89LrY61t7bVKbKK9LexPeAgFm4vtn+JuAQgyjn2xYEuZhrxXXDfNv+JDYo3AKJ1o/CVWOsUnhDTf5F39sJWC7KAjyoqtllrechBAPQW/F7FlUAU2+tVE+1eeSt+2+ja+NLSCjtWVyMLzaImIOQ5snNC1gfP2hbiFFHYMbPGUYAJdosajpG4fURr2a5OokQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199015)(36840700001)(40470700004)(46966006)(5660300002)(356005)(8936002)(81166007)(186003)(70206006)(70586007)(478600001)(1076003)(47076005)(426003)(2906002)(336012)(40460700003)(86362001)(26005)(36756003)(8676002)(4326008)(82310400005)(83380400001)(2616005)(82740400003)(103116003)(6666004)(36860700001)(40480700001)(6916009)(54906003)(316002)(41300700001)(4744005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 14:18:17.2823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94eb4e8e-dd0c-4df3-9698-08dac3ef93f5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4912

Refer Arm IHI 0069H ID020922, 12.5.23, ICC_SGI1R is a 64 bit register on
AArch32 systems. Thus, the function needs to change to reflect this.
The reason being 'register_t' is defined as 'u32' on AArch32.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Changes from :-
v1 - 1. Updated the commit message.

v2 - 1. No changes.

 xen/arch/arm/vgic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index a7a935ff57..93c8a0ae79 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1479,7 +1479,7 @@ write_reserved:
     return 1;
 }
 
-static bool vgic_v3_to_sgi(struct vcpu *v, register_t sgir)
+static bool vgic_v3_to_sgi(struct vcpu *v, uint64_t sgir)
 {
     int virq;
     int irqmode;
-- 
2.17.1


