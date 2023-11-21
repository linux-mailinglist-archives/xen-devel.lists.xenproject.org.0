Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 312137F292B
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:46:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637607.993570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NKE-0004To-KF; Tue, 21 Nov 2023 09:45:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637607.993570; Tue, 21 Nov 2023 09:45:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NKE-0004Rt-HR; Tue, 21 Nov 2023 09:45:46 +0000
Received: by outflank-mailman (input) for mailman id 637607;
 Tue, 21 Nov 2023 09:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqtY=HC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5NKD-0004CN-84
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:45:45 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e8a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba907ba0-8852-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 10:45:40 +0100 (CET)
Received: from BLAPR03CA0090.namprd03.prod.outlook.com (2603:10b6:208:329::35)
 by DM4PR12MB6232.namprd12.prod.outlook.com (2603:10b6:8:a5::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7002.27; Tue, 21 Nov 2023 09:45:37 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::5a) by BLAPR03CA0090.outlook.office365.com
 (2603:10b6:208:329::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.28 via Frontend
 Transport; Tue, 21 Nov 2023 09:45:37 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 09:45:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 03:45:35 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Tue, 21 Nov 2023 03:45:34 -0600
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
X-Inumbo-ID: ba907ba0-8852-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgwMNT0fEu8IPCKtGfYxM6WHbTPe2AnrlDZbhLrcAZ3iZOSZEMPzZyDpMGSfuAo5312y2dBXReOhdqCSmbo3rSRkheoRevFBwPB8zGgn+lmV894Dm1EL91vJc5D0C74Hd9mrCPUlpP/2j0hmWFus/pXd6qHRir2zpMOtkSA6ZXIM5sQ3zxjsrr2r5h2mRkANvZCgI15GC5NTCGHDxlT/1IFWzewrebbCz04IFpwv/sPkd4/dD4Ep6AkmJCVXpqoWM3fuK6JpNE9f2wtV11QpApjmED6YcpcrCNbWJoAdfsGko3qqSJ4bpFzYMLjtJGvTv0DKJHuS3U3r7EImJrF1TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eX7gUvzVwKqyo6vs+snwslITqoB77c3y+bXgXNG97pE=;
 b=fUv2utuoY5zp9EJKtfb6Qt3UOuW0jN7bwunLfVms//Xw+0cdWBNBGTsubbjDAbmCniJPGzrCv+FLfwmBT2EzOG3ECtwaRCeAFJOi8IAwzLOwOsepVjYZQezI9b8EcRqF5cAyDRPFdieH7MbAr2obHvDl2X2+SRKZQgCbY0Y/TEdJeSZEs0skfze3gjPd6iU5dxAMh6Wj8LuTj0mdzRyfqdLMf5XgL7GonTX1RW03mIcFp/qoOcLRh3tOmIyefxyg6peDq2y2FRQnwfC38QXnrW2vPxEzXz1i3DGPpT7qW0oqJFaKGv/5OWr9fAbprtrxv7AdyN1B3sN38diibOIcLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eX7gUvzVwKqyo6vs+snwslITqoB77c3y+bXgXNG97pE=;
 b=N0cgLRS803yAP9Jmdj6G6TMowmOlhmrd0HqOkaibxaKvhpCsZ5RdVqtiuRx9GIWpyXcAzcprFUqg38/rPbCdr1jZqbpLEjU9vPzu2QgdhfysivE0p2DLe58iC95e6G4/Riu1TLImm2KdSnT89LC9e+so/VQtW0dnUnS2YcBeN7s=
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
Subject: [PATCH 1/3] xen/arm64: head: Move earlyprintk 'hex' string to .rodata.str
Date: Tue, 21 Nov 2023 10:45:14 +0100
Message-ID: <20231121094516.24714-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121094516.24714-1-michal.orzel@amd.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|DM4PR12MB6232:EE_
X-MS-Office365-Filtering-Correlation-Id: b81c3e5d-426a-41c1-fb22-08dbea769d2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QAawCmonysYyZRy4GSjhFVz50WGC3VQyHobIKimZHxcsdyXKznSCWuVSgJHYpMqbLcZxBfq00kRNSntuip9d8kyanOQ317gXf7ymTwQXizTCxUyoh/BeG0/dxHeKLflnwiQ1EfxX647PKCt+1v+H5UpNf1lT5/memchHgoy1W4sPsqaOs6P2G0vVArnZ1WdSj+voNTYhC36dMxmfTHV4UG8gRzpC9gJUUaytnnngBCn40MMSfSsXsOXc0Oqz9t2BGjECYqRSA1GhDENm9j4AcExGUE1v3tNmwwWLuIurc6ENwQ7agvIzDGMMehBAoZmlZ/VmXz9TQzDS/sYnk7al4L2vmVPJ6b62KadG69WEhVJJ2SCMtBz7XMdYjBhEZSQkcbu1LxQhTOR/whzWkNTKU0re/xO2LUlgVXLFzI7kjYjz0/3piwz+kyI4PI9WXfp4g8YFBI766+CSsRMsnVhK3SUJBBVv/haNpdawXod+HsQXrCHcUCWTxIblyhd3NC+Q/ZuTpSEh5iPcxlBxUpSaaHrQg4TCscfn3B29af8iTTjBJZ1Ws+qJFB6EnT9coFJus1IQC6C0wkS3aQgvoUrbwNP9cBIVmQPXFoAIMefaWbZ/14+xQ2Q/1gML287XdHu7QUqcQVQZ/TRFv/eeiOjRjq00ElaalWrKA6V34KZNZPuvnYaMn8qY44MYxmkUJBLezjkx1OroKG9jolh2TYamRVjovog4q6zYfjs7BzJsQ5zPSKk9hf9Jfylfa90+2CZqrqANZAV1twQxLG+5yW2GbYOGJDJT6Eg6vTJwfq2UF/4=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(396003)(39860400002)(136003)(346002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(82310400011)(46966006)(40470700004)(36840700001)(2906002)(5660300002)(4326008)(8936002)(8676002)(36860700001)(40460700003)(82740400003)(86362001)(36756003)(41300700001)(81166007)(356005)(478600001)(54906003)(70586007)(70206006)(6916009)(316002)(40480700001)(1076003)(426003)(336012)(26005)(2616005)(83380400001)(47076005)(6666004)(44832011)(142923001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:45:36.6665
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b81c3e5d-426a-41c1-fb22-08dbea769d2d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6232

At the moment, the 'hex' string is placed right after the 'putn'
function in the .text section. This is because of the limited range
(+/- 1MB) of PC relative 'adr' instruction 'putn' uses. Modify it to use
'adr_l' instead (range extended to +/- 4GB) and move the string to
.rodata.str. This way all the earlyprintk messages will be part of .rodata
and the behavior will be consistent with what we already do on arm32.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/head.S | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 8dbd3300d89f..b6111399e766 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -498,7 +498,7 @@ ENDPROC(asm_puts)
  * Clobbers x0-x3
  */
 putn:
-        adr   x1, hex
+        adr_l x1, hex
         mov   x3, #16
 1:
         early_uart_ready x23, 2
@@ -512,8 +512,7 @@ putn:
         ret
 ENDPROC(putn)
 
-hex:    .ascii "0123456789abcdef"
-        .align 2
+RODATA_STR(hex, "0123456789abcdef")
 
 #else  /* CONFIG_EARLY_PRINTK */
 
-- 
2.25.1


