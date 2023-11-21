Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B8B77F292D
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:46:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637606.993559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NKD-0004F5-Ct; Tue, 21 Nov 2023 09:45:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637606.993559; Tue, 21 Nov 2023 09:45:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NKD-0004CR-9W; Tue, 21 Nov 2023 09:45:45 +0000
Received: by outflank-mailman (input) for mailman id 637606;
 Tue, 21 Nov 2023 09:45:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqtY=HC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5NKB-0003ww-L6
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:45:43 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id bc1b9a9e-8852-11ee-98e1-6d05b1d4d9a1;
 Tue, 21 Nov 2023 10:45:43 +0100 (CET)
Received: from BLAPR03CA0071.namprd03.prod.outlook.com (2603:10b6:208:329::16)
 by PH7PR12MB7938.namprd12.prod.outlook.com (2603:10b6:510:276::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Tue, 21 Nov
 2023 09:45:39 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::b9) by BLAPR03CA0071.outlook.office365.com
 (2603:10b6:208:329::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 09:45:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 09:45:39 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 03:45:39 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Tue, 21 Nov 2023 03:45:37 -0600
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
X-Inumbo-ID: bc1b9a9e-8852-11ee-98e1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bt1JdNZNCbjBK8RG5mq7rT1/lIteO54wdcTHZxnKOoSJSq1S5jtDZuPuaKW0C095mB1wuM688lHcgPB43BIwdzScHT5gbFLqaZMtQIchnXY4n1MBRGv0qD3V27c5iUJ5hhEnclsqaLOjYtKZVU+bU3Rmjdik+vLvnVP5f4pEmH8QKNefV/NW+hP0JaOB/jqe4fkn9oqzbVc7zd8gaIxYGZOZg+KfWMxld/fiaAev+W1tBCy4pwnVI5FIxGCHljd8rWvpsQnU4jU4xRAg6IyCgzUmsL1LpJDpUByk7HWTwIftk2mse64FgOS8RTR9xPERuRMQ5T2vQdREBYm7YoAdlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xa7a57P4d78oZLu4ZDZT+8vnzMYOT8JAEc+nQCvZbW8=;
 b=CwOGPCt+H1M8ZbWuEijciLNehF/o+F8FezXur5MFo61tHt+UGE2e4BOply8J2HWtBsvi5dbOzLjgQ9sdaeZWxXa0bNltLymW0GJlosuQGIKLsLbY4pQAm1w1eAAyUbjGBeW6qNwV0g6Lyy82NF2uclk7prhL8a9Vq6C54exXNAoZmBeFPKeh4J7hSImtrJqRP44IJXE2NGAbDmjszOfpji+/kihjHqoA0wPCMUlBnH7IP1ryvdXZ3Rl04onyqK2ZtGHPD19leSI4pDWVsF0ibrlApsdmBIZMg1o4eWZ5/pQitSu9NMa7UX9O/4jvMsm4UzY1yuw+b5fbiPP7ECkWRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xa7a57P4d78oZLu4ZDZT+8vnzMYOT8JAEc+nQCvZbW8=;
 b=JQbhMeA/IPr5XeJAMIyJ8G5mDB4+n/qCD2aQKQ4RvX0zAuBpc15Di2U3jWNA3H1icLESW3cVA0nf8YNG59n72aBIoqbQh8IVnuvuvyD7MOyc0Baceebn3e/lReFmb5vQc8Yr9kjArgTe5SmuCe9Uml4XZp8ior2Z3Gg6/Otjlew=
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
Subject: [PATCH 3/3] xen/arm64/mmu: head: Replace load_paddr with adr_l where appropriate
Date: Tue, 21 Nov 2023 10:45:16 +0100
Message-ID: <20231121094516.24714-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121094516.24714-1-michal.orzel@amd.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|PH7PR12MB7938:EE_
X-MS-Office365-Filtering-Correlation-Id: 0323ef13-c75b-4fdf-bed3-08dbea769ef7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O2dryDuifX1LugebhSwQiZOxtLqMUfSbuULr1R814KfMpXItZQVA9X1rDB2wXMmPA2mggdzRAHVSrWxKptchptEn7J6XVBxatgrhxYdBx59rROY69pQSay4VYYmkOOGDvyjINZQQHpcDeJyobbiMitb1y4OD1LaJ6UnE8LKzBxNLhSbRA2B8fEC15nCJ7r2mdTuZYBgKEmox16gW5azDnBwdkfcaQi6wnik/1sx9Y79a9edCUpABNVNdcVzgy1MNbs/gRUXNUejRGkAH7tO+dQ2DCXpRcz75ks7Khy02XWZiRDePEzn30bbf2GYaEjsRDuk6Lhe8ZTtrPdzQknbVWkigXOy9G44n8OLnz1uOhL76ClVmZ6GtUkISES2xzvyPtBAi+1qR0ZSmuYgl7INjumZgFO+qjUq2E/xUUCxhoVgEsLjmiM9XTZFhc9dYR+P2GCkGKJRqO9/8L8Fh5YHPXJTHGsWMksNMUZu8lmESmfJ6G0kq5sUgKFZBFe7IELumWqdkEoSZDgYIcpS+TeToHkbD1NUS/iwXc6vLlNvyXY+K+IlWSk+NGalPwzeRMH4ge/oxl2JmjBerxs/ZEm453Zcs3b+42UzkBbezStQYCOScssDRZ8tXHbs15t3pNrDAKAE8ulz5AgK4r1sh46mOo+Ub9fNJK3/fflRWx3lDm7ONjrVEo76vvONicegqh9QL5v0ab9Yr/AIATcbPS7UI1YDQca7cLjuXe35enZfHoRrNNKGIALPbzbIiR7QHQdsx5Z0azS03xmjhUKL9Z3pGEw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(376002)(346002)(396003)(230922051799003)(186009)(64100799003)(82310400011)(1800799012)(451199024)(36840700001)(46966006)(40470700004)(2616005)(82740400003)(86362001)(40480700001)(356005)(40460700003)(6666004)(6916009)(70206006)(70586007)(316002)(54906003)(36756003)(81166007)(26005)(83380400001)(336012)(426003)(1076003)(2906002)(44832011)(5660300002)(478600001)(36860700001)(41300700001)(8936002)(47076005)(4326008)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:45:39.5727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0323ef13-c75b-4fdf-bed3-08dbea769ef7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7938

Macros load_paddr and adr_l are equivalent when used before the MMU is
enabled, resulting in obtaining physical address of a symbol. The former
requires to know the physical offset (PA - VA) and can be used both before
and after the MMU is enabled. In the spirit of using something only when
truly necessary, replace all instances of load_paddr with adr_l, except
in create_table_entry macro. Even though there is currently no use of
load_paddr after MMU is enabled, this macro used to be call in such a
context and we can't rule out that it won't happen again.

This way, the logic behind using load_paddr/adr_l is consistent between
arm32 and arm64, making it easier for developers to determine which one
to use and when.

Take the opportunity to fix a comment with incorrect function name.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/mmu/head.S | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 10774f30e40e..41779020eb4d 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -146,10 +146,10 @@ create_page_tables:
 
         /*
          * We need to use a stash register because
-         * create_table_entry_paddr() will clobber the register storing
+         * create_table_entry_from_paddr() will clobber the register storing
          * the physical address of the table to point to.
          */
-        load_paddr x4, boot_third
+        adr_l x4, boot_third
         ldr   x1, =XEN_VIRT_START
 .rept XEN_NR_ENTRIES(2)
         mov   x0, x4                            /* x0 := paddr(l3 table) */
@@ -311,7 +311,7 @@ ENDPROC(enable_mmu)
 ENTRY(enable_secondary_cpu_mm)
         mov   x6, lr
 
-        load_paddr x0, init_ttbr
+        adr_l x0, init_ttbr
         ldr   x0, [x0]
 
         mov   x1, #SCTLR_Axx_ELx_WXN        /* Enable WxN from the start */
@@ -336,7 +336,7 @@ ENTRY(enable_boot_cpu_mm)
         mov   x6, lr
 
         bl    create_page_tables
-        load_paddr x0, boot_pgtable
+        adr_l x0, boot_pgtable
 
         mov   x1, #0        /* No extra SCTLR flags */
         bl    enable_mmu
-- 
2.25.1


