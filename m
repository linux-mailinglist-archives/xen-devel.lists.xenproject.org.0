Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 626D19B30C3
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:46:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826443.1240699 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8O-0004iK-L6; Mon, 28 Oct 2024 12:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826443.1240699; Mon, 28 Oct 2024 12:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8O-0004fD-Hj; Mon, 28 Oct 2024 12:46:12 +0000
Received: by outflank-mailman (input) for mailman id 826443;
 Mon, 28 Oct 2024 12:46:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXyF=RY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5P8M-0004Qp-UP
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:46:10 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2009::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9a64753a-952a-11ef-99a3-01e77a169b0f;
 Mon, 28 Oct 2024 13:46:09 +0100 (CET)
Received: from PH8PR05CA0014.namprd05.prod.outlook.com (2603:10b6:510:2cc::7)
 by BN5PR12MB9509.namprd12.prod.outlook.com (2603:10b6:408:2a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Mon, 28 Oct
 2024 12:46:05 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::80) by PH8PR05CA0014.outlook.office365.com
 (2603:10b6:510:2cc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.11 via Frontend
 Transport; Mon, 28 Oct 2024 12:46:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 12:46:04 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:03 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:03 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 28 Oct 2024 07:46:02 -0500
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
X-Inumbo-ID: 9a64753a-952a-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwhqCnyLQKeD/i8x6y0clE+m+6lu3TAvl6ewlQyscDM6iDCyMhssZSmfWIfAkKD1cy8DZ2uRobAABiDD3bqyvRX2jNA5UzJpkpzsp/XPDgpBohoEYe4MEoxBZjCxLGEqz3MEKMNuaiIF3SHGDUbC5YOBzwEeSKpgOuW0JCy3WZqkJJ7718zP8FtJoavq9Ec6/gfDkJCg0fTQ8Jqh9QPvJxQzWV8RdVAmlWTVvT71pVVaoQzK6SaLKjRB2MyV9Cm9IFDsTowuBtTNuQZeS88T9oIL1LECIw+2e7LSszt6eyQCdHAwmAlXYhSQUTrgOgQvbscwrzdE7A97uu8VooZV8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFcBkE/m8lBfaY/RDGSA74usJ37yqes+AbUBa2xX70A=;
 b=cAW06+L9ec1sN1DBh5vst50QR2DrE3Uj+TLRxNOL3TqBztiG880z8FekhYNs/cNakTGQD2eBkBfKJL10OkmM7TVz5qB9kAxJtPpDBB1qhcelbWn1TbFYBEVpgMBAMd/khyU0EiKoBAErKnvG73cIwUiCDWFSwAqdMZyaZqPOD0XBbVzhY5Ex3Xruw5mhx8Ugmy1//Tq27ua7g4vgsJNdTkkBWygcKZay0uJx1VPGszpR1i/HK9mwcXqkldYVasseQKtNXXgJsDrSd1+8rQ7mXVLykTAUo6mGVxwuJC2nmagxV4wrpdczgKk8RXZ+5t4F9B0abhKyVTHXUSmz1xxqdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFcBkE/m8lBfaY/RDGSA74usJ37yqes+AbUBa2xX70A=;
 b=Ed/Vlc5FhM82IZXFH+IHF8mKTb08v+dmz6oXLUpjMWfW106MOT0dDu/q3amEOqB1rmv7yY4X3kuxdzqeL9Ih8/DcovUTj7vMCf5hFK+w+7i2y05A+ILyf9GyVPHEfcv/hsnLeOwJQigBOFiFpFrs6GVFcU+Rw+p1O/cH+VgvOvE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 1/6] xen/arm: Skip initializing the BSS section when it is empty
Date: Mon, 28 Oct 2024 12:45:42 +0000
Message-ID: <20241028124547.1371867-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|BN5PR12MB9509:EE_
X-MS-Office365-Filtering-Correlation-Id: 53cd0bc6-e4b2-4d50-0ff7-08dcf74e7c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cvxwfj4eHV0JoCE+Q169lAE4VlTbORZrvftkh/Nl2mzNlyzvXK18sAFJOXyx?=
 =?us-ascii?Q?nn/W+ntN9ySx6ILDjt7i4uMVmxH3ZcjeE6bGJuyeIoWB6psjqzehR/43gpw2?=
 =?us-ascii?Q?Hr7hYKfhBO3LZlQD5I0bh3UUCPafHmvYv92AhnK8q6FZXayKeET3xwjhUFvd?=
 =?us-ascii?Q?Qb30s1Cod7rH5WqJsEaEubebSOYejfRo1HhrtLKvgyPF1ht/B8GsUKJm0iBT?=
 =?us-ascii?Q?Y8PsKNKo0dIz8DWFoaFBuhBjsuIE08OiHbzTDt2zY1m7TsqkxR2sIyDzEfcj?=
 =?us-ascii?Q?fsXLcVVCy+3pUno09+/+KKqJb41ML3oPW+XpbmeEZXz7RsB7hPr+y9IPWXXz?=
 =?us-ascii?Q?Is1K7Im9M0lqWKKTaZcsKp0rM8kpBF2pmLado7W5YRKGiWfe8JwCht27qizq?=
 =?us-ascii?Q?AsvZ5h7Nwb3nKdPXd2DWPDpRykcXtPrNkKCI/72JA0NPfY/hOs7NYWb+Kg3y?=
 =?us-ascii?Q?ILsqbOT0yIDnvS2ZcbExGE2fLaWKjf/Pj3OBF4gyIOgzodGHth5ac0OheY5d?=
 =?us-ascii?Q?6/Lhh5RkMHfxfwK3l89tDReWC+GegVvtbh0c0Rik8IDn4bH5HJuGMGg854yC?=
 =?us-ascii?Q?OKI6U+nMqBqn4P49hWxh4CIkQzlzENL2Dn5tAmZrPvooW2c8pn1t65mzeKLI?=
 =?us-ascii?Q?2RwU+0ek+FZYWJIG3Y5Onxt3VxQeB0iZ5wB2O/5kkMq7qxxvc/o7tatRBSlE?=
 =?us-ascii?Q?mneqVthBVkMqMudTRvdSbtrpwC04Pi79zEKjtWmQdu3IU6DbtzZX3KQFyKep?=
 =?us-ascii?Q?fYnffIm0CC4CItkVc2uy00gWL9nAXkoNdp10vXxia9LjHcmNPFQSb1TCI+UP?=
 =?us-ascii?Q?if1sTTjXvU/j2WWiD30Pjxjj6O0UtX4AEnDQXovbfS3Gy9a3mhGJnZo/kjPk?=
 =?us-ascii?Q?ZWqHCqoSV7hmz1uDY9/thz4Z+ia+/Z9HWhCG3Qr8vZ8Dx0bckKjkj65p2Fmj?=
 =?us-ascii?Q?AcVd8FbMjJN6d6+xNXp3pOVBDU552IhM2vGEbCPLXU4RCDLRca+0uZLnzpFo?=
 =?us-ascii?Q?YF6olaRTl8p+EfD3GuA7JEtAZpUvEKYOPj9k5WKz4B726OsQEJmwzVzu/tMg?=
 =?us-ascii?Q?Td4knFjYY5y/+4RLBB/NOKiERuJKwhyZW4DNyN9LqB5Z7/IyjXYyA38NZE/9?=
 =?us-ascii?Q?qLJULRNQCwWw7pYVrmjebRetASaXph+m2KUbfPT3WT2hm5ClPSTrQwho8Y0i?=
 =?us-ascii?Q?kAbNPYYM8/O4zpsN32ljY7DKcmqjBwLBh/WHXIfKkeshcsjsdU0UMEqgNayD?=
 =?us-ascii?Q?4e4QSmyq/iNOkEQ5kOvBEyZp5Ah2NqhxzdNJeQeGZHg6GvsXq3D5CB5ZLG3s?=
 =?us-ascii?Q?PiLvaBq/nmzi/Y1c2D3iR//DeWY1iEzfNHtsR1oOrfXEaw3vd9r+igfJkK3k?=
 =?us-ascii?Q?iq3zEe1WDBXidOMdKuKFbx/ZeLIsrGOJGrtV+nz2GdyGucnDuA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 12:46:04.1607
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53cd0bc6-e4b2-4d50-0ff7-08dcf74e7c38
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9509

If the BSS section is empty, then the function should return.
If one does not check whether the BSS section is empty or not, then there is a
risk of writing 0s outside of BSS section (which may contain critical data).

Fixes: dac84b66cc9a ("xen: arm64: initial build + config changes, start of day code")
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1..v2 - New patch introduced in v3.

v3 - 1. Update the check in arm32 as well.
2. Drop the R-bs.

 xen/arch/arm/arm32/head.S | 3 +++
 xen/arch/arm/arm64/head.S | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index a96d5d3503..4ff5c220bc 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -185,12 +185,15 @@ zero_bss:
         PRINT("- Zero BSS -\r\n")
         mov_w r0, __bss_start        /* r0 := vaddr(__bss_start) */
         mov_w r1, __bss_end          /* r1 := vaddr(__bss_end)   */
+        cmp   r1, r0
+        beq   skip_bss
 
         mov   r2, #0
 1:      str   r2, [r0], #4
         cmp   r0, r1
         blo   1b
 
+skip_bss:
         mov   pc, lr
 ENDPROC(zero_bss)
 
diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 14c3720d80..72c7b24498 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -346,6 +346,8 @@ FUNC_LOCAL(zero_bss)
         PRINT("- Zero BSS -\r\n")
         ldr   x0, =__bss_start       /* x0 := vaddr(__bss_start) */
         ldr   x1, =__bss_end         /* x1 := vaddr(__bss_end)   */
+        cmp   x1, x0
+        beq   skip_bss
 
 1:      str   xzr, [x0], #8
         cmp   x0, x1
-- 
2.25.1


