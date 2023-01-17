Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347866DCC6
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 12:44:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479341.743135 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkNU-0007KE-8o; Tue, 17 Jan 2023 11:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479341.743135; Tue, 17 Jan 2023 11:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHkNU-0007Cq-4T; Tue, 17 Jan 2023 11:43:44 +0000
Received: by outflank-mailman (input) for mailman id 479341;
 Tue, 17 Jan 2023 11:43:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwid=5O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHkNS-0007AO-FG
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 11:43:42 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2fd2f1d3-965c-11ed-91b6-6bf2151ebd3b;
 Tue, 17 Jan 2023 12:43:41 +0100 (CET)
Received: from DS7PR05CA0033.namprd05.prod.outlook.com (2603:10b6:8:2f::20) by
 BL1PR12MB5192.namprd12.prod.outlook.com (2603:10b6:208:311::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Tue, 17 Jan
 2023 11:43:38 +0000
Received: from DS1PEPF0000E62F.namprd02.prod.outlook.com
 (2603:10b6:8:2f:cafe::8d) by DS7PR05CA0033.outlook.office365.com
 (2603:10b6:8:2f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Tue, 17 Jan 2023 11:43:38 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF0000E62F.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Tue, 17 Jan 2023 11:43:37 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 05:43:37 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 03:43:36 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Tue, 17 Jan 2023 05:43:35 -0600
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
X-Inumbo-ID: 2fd2f1d3-965c-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ca/QEn6HmGlsQ4o6PNPLIi5ftn6tFmu++O/WupoGI/hjZzIN7XBj5ljRRg4W5G0/C7v5iInvdNEC5mKGX5TK0mm/DIZuqyukiTJ4DqR/IXvLbt3yF9pKXHIjARV60H2iTNnu/FC8YUTq079VvmpyzlRd77vRcMQFzKuqIXf71Zo6XibyelLkDi57T3JryZt/AuvCAy+RjVuokWWQNlp5BiUBDyq++HHpTFmz0Gr6FZlyMvbllfc8wBFimFHyO4b/ypBZCkCJu55pVVyoXXaBu4ACK7vUMH2wyhmYPtmSkoRbkE/qu5ekBSxiKbWiVx7UyEnz652TOSKLQ0Thfnn6rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKLHhjoW+RSSaKho/VCljUTUCbTI/+fA3sXMWlAbEYE=;
 b=HKGNhNjgrOq8ca2QOvPEL8QzXvwrf5FdIOxCHKxOJtbEsWYqjHrya5M0uNT2AdrM6HziH4YuQ4Tf0dN4WK5DgglkL3q9QpF7xwsKJrXT35gDNFZsLJOouS/0Gq2SR/7SibK6QlDImCyqkcxPsGMbhj6odmV56Um8swaHmgYP73aSduLwjdorLd3+aUmI4+9L9aVQ/iu7gcMA/QnxDk5Nk018oziIxAJrvT/Kke8LmuXIKYFAOcWVt/qqe6+sJ08N1Gt+zfVxwTsjfh1UdT9ZT30HmKYSWdNyZH+BEN4cT6GeAEpsz/6AjlcQKWgsL+N0RWq0CEn+TMvS4lUHGd0YVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKLHhjoW+RSSaKho/VCljUTUCbTI/+fA3sXMWlAbEYE=;
 b=f/FmQN8uR7QExZmYlJ1TItf4e1e0PuArIVsnLckrFYnN+zox5o7j3klIkxnthlzViuvnrxfbsQWoH9cy6yKZQueTLJFpBBQIuG/OIMVzC+0n81P7nq1I2Z+7T8aBZ9o6YmSSDMsCYHOTu2HTj8vIIV0jtihIToyG6u12MHVFaUY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 1/3] xen/arm64: Fix incorrect DIRECTMAP_SIZE calculation
Date: Tue, 17 Jan 2023 12:43:30 +0100
Message-ID: <20230117114332.25863-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230117114332.25863-1-michal.orzel@amd.com>
References: <20230117114332.25863-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E62F:EE_|BL1PR12MB5192:EE_
X-MS-Office365-Filtering-Correlation-Id: 5244ce5b-9571-4ca8-8ef8-08daf8801279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m3Iz2NSFNJ3PHEbNIJSOTh56dwH1Obxbun54SWCBrS1/+CC9TL19Ki4mDXfX5SO3jy85IGCDsKQuwWgO9eGxyMJGBxk87MBRE+sm7YgxKAUk34sfmyQFx9Yta+tSMouMLFzI8CLIoBqFfI3+Tuv84yYEwnbNYp7wfpeZTpfAgfs/X334/IQbLtPX/8TWoC0YJozhr/y5zSi4u0JcqXoAV8uUNdRsEczY3ZBHBQOKQRHwBfqvxRHhkItLhJYmGPyBq67rQImC66WtLenSl/GB6jYs9nGsOoZ1DXv9K6DaE8nEGMrgJzOVBc85b7C/coRAstOwk/oFjYESzllo8oQAsdn/g4j9i1MTdhW/ak3LB/NtrBTB4jWvwvHJnzPZSlIH7xOpPwP1Kr0q0em7f37B7tqVdpxwqhTTN5KfdTWbjW4t+WcntDb5M4CtiBLig2dWF90GakF4uoLQiOqWxoSXT4os6yPjhwbrpUOB5tOqp7detGHKU0oCIrYNZBxco1KhQ2cKMQ85p2FLomgwDdsmRb1pcyxboMjwfvq5SDUB04bkm+45F4FTBt1JMSRMXA3H9AGL12dwcHEo2Efk6d13YGPMFt9IZzeBbfwUNgcrM5EY76PSTG4vQG6ygWhYtZAGW3gOKCpDvKeg3D0H11W29iaTyzGmiX+7WwZNe09k9wwNij0u1+95P7dCBtxROalc895fPBgpCcP4VSaDEGqfiUAS+s9Ha8PSrtXtalKNUrc=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(346002)(136003)(376002)(396003)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(82740400003)(83380400001)(81166007)(36860700001)(86362001)(356005)(8936002)(4326008)(2906002)(70586007)(5660300002)(8676002)(44832011)(6916009)(70206006)(41300700001)(82310400005)(40480700001)(2616005)(186003)(26005)(47076005)(336012)(426003)(1076003)(6666004)(316002)(54906003)(478600001)(40460700003)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 11:43:37.5023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5244ce5b-9571-4ca8-8ef8-08daf8801279
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E62F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5192

The direct mapped area occupies L0 slots from 256 to 265 included
(i.e. 10 slots), resulting in 5TB (512GB * 10) of virtual address space.
However, due to incorrect slot subtraction (we take 9 slots into account)
we set DIRECTMAP_SIZE to 4.5TB instead. Fix it.

Note that we only support up to 2TB of physical memory so this is
a latent issue.

Fixes: 5263507b1b4a ("xen: arm: Use a direct mapping of RAM on arm64")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - update commit msg making it clear that this is a latent issue 
---
 xen/arch/arm/include/asm/config.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
index 0fefed1b8aa9..16213c8b677f 100644
--- a/xen/arch/arm/include/asm/config.h
+++ b/xen/arch/arm/include/asm/config.h
@@ -157,7 +157,7 @@
 #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
 
 #define DIRECTMAP_VIRT_START   SLOT0(256)
-#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (265-256))
+#define DIRECTMAP_SIZE         (SLOT0_ENTRY_SIZE * (266 - 256))
 #define DIRECTMAP_VIRT_END     (DIRECTMAP_VIRT_START + DIRECTMAP_SIZE - 1)
 
 #define XENHEAP_VIRT_START     directmap_virt_start
-- 
2.25.1


