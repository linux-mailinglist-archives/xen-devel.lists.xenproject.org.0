Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079382D90B
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jan 2024 13:49:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667371.1038553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPMOx-0008RA-C3; Mon, 15 Jan 2024 12:49:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667371.1038553; Mon, 15 Jan 2024 12:49:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPMOx-0008Oe-8d; Mon, 15 Jan 2024 12:49:15 +0000
Received: by outflank-mailman (input) for mailman id 667371;
 Mon, 15 Jan 2024 12:49:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0euc=IZ=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1rPMOv-0008OY-Ai
 for xen-devel@lists.xenproject.org; Mon, 15 Jan 2024 12:49:13 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20600.outbound.protection.outlook.com
 [2a01:111:f403:2407::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a8659dd-b3a4-11ee-98f1-6d05b1d4d9a1;
 Mon, 15 Jan 2024 13:49:11 +0100 (CET)
Received: from MW4PR04CA0381.namprd04.prod.outlook.com (2603:10b6:303:81::26)
 by DS7PR12MB5935.namprd12.prod.outlook.com (2603:10b6:8:7e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.24; Mon, 15 Jan
 2024 12:49:07 +0000
Received: from CO1PEPF000044EE.namprd05.prod.outlook.com
 (2603:10b6:303:81:cafe::2b) by MW4PR04CA0381.outlook.office365.com
 (2603:10b6:303:81::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26 via Frontend
 Transport; Mon, 15 Jan 2024 12:49:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EE.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7202.16 via Frontend Transport; Mon, 15 Jan 2024 12:49:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 06:49:05 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 15 Jan
 2024 06:49:05 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 15 Jan 2024 06:49:04 -0600
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
X-Inumbo-ID: 7a8659dd-b3a4-11ee-98f1-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FKmMFSEfMJ+ZVtIXPoyyftDWjy+dwkminu0WjVcIuu0DF2m1A8IRyfMEnRKHuy9V0zVUWRmOj7xQqNx0lcU/1bgaz+Nvg51n7/KuRdW7++TX15w/Hjls5ig+w/FQHCrndBhMgNlUdxeGdtVNeoITMcWaYCqm0G6iBlv69w1ZOAYDlVATfHUUbriLokMnl2bTgyD3U9RscOvrA90JUEnHp9GQ7OKJoF6gkyM51Jid8S82YUd3HzXyhC4Q07WofDMoOc7AM2zD8XOVYoyfj3YPdTGfI70c4bmntA38/WLo52p7SoraXQMdkOS4Hd44pemqOj6Ge8r4D2wuBLtO9OEadg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NLBQvLoHCOj3N6IhMseZ9rkZSOpJyYpqguK/QdlO4GY=;
 b=QFpRYKXAqpS1RS80b58sZn2kw3nbgFQytrAwZlhA1eg82jZG6yhjX73pvlWfzhVU25rkYXgoqcITIz+vh5aeEkNG6FpDrYvfmMbP7/sEdY9gTPKAYR8PQmQKuaRmfbUIBmG0azk2WDt90HdzLsc4TT5bvRfYJHc1EEHZC/odviLkcwMKUz8hJcZbevikKkWR8LBZgCc4mBS7TaotwPS3PxW5gzpOxHfSKMNiXToUnjxBbdLgbVlgVM93i6eFTWvVKU0x+jhjEMg2EMdNvO+zkjyS8v9iPmEqoDKezktmM+kRJtI4goqwEBIEDntechCXRuFQ1ulMWvWYfwcB0xnRCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NLBQvLoHCOj3N6IhMseZ9rkZSOpJyYpqguK/QdlO4GY=;
 b=oGq2K6KCJ26nPZTb4QlJCgV3YoHGJPyif+WPDjN7WkGII1svlHAG74/s3jcanhTaexHRV9NQvEpkHjwIDG/EG4X4tYfGfdhYulATTf8SrYO/Oo5JdEMOdOHTI1Vp0rScJA7m3OOJxXrEVGO7C6+DyO3RPyizQN3n+F+qom0AJv8=
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
Subject: [PATCH 1/2] xen/arm32: head: Move earlyprintk 'hex' to .rodata.idmap
Date: Mon, 15 Jan 2024 13:48:58 +0100
Message-ID: <20240115124859.89218-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240115124859.89218-1-michal.orzel@amd.com>
References: <20240115124859.89218-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EE:EE_|DS7PR12MB5935:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b353449-3875-4f71-2139-08dc15c85c73
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9NmFwBqQZMLLU8f/wisBZZWC6tVXUgyVKa8GJoNRp34dosYDjWwqWf2ZUDk2Xc5tzGP4VFu2SwQlM1tYV6IaEsXUztH3GxIxVaxfLm5/a4i2iyT5OyOcnFI2GBYZcO0yxRzonDF+FsXcG7FBO7WbnN6GBETmIDYOVfQwpFRI1EMYIRqCC1zv+iorIcWR/bNLV0sfYGs3NOMWykpRSx+iCJpO4//kWDDdCSxGT46z7X4yjb4S6k2Hybxl3xZTCcQ3kd6bZosjYLEhq/UN75tcbveYkG/r1TnJlBK5B2tJX8kzhQBLUo5VFvEY4UEBueSPozuwpKuFcZB3bfSTvBahdb/EV4o2ntnBryHXLy+IHrrARXfx6Fh4mOJlIfd3+ZasIcH4dJl9J4pZJ8OE+043Gl2bW0vTunc3t0jJcM0HkjHuUPXcdIXq2MGQuIU/SYf0qf0IE/INAEqKdsSqC+ZJrXryGj2fX/klFMr8zM41UE1XPC2XhN4pQcLAVOJ0Nsdpc91nHLwwUI+mFdV22nzNlsV52QhV2s3wkcWBrO9s+W5LJWLznQSYA3z+VRhwy91u2g2Y5seN/vwwX9aaNz/tg0jMUt8Chzr224FT9PCSDGUrLr+Hktb80HcxrrG64LmZX0X7a10GdEmgcNAbvdTNfR1ICly6UPcc1lu7MgGW6JE7K+MOHb8iMNN0LIA/3amDC/2WgB2gMNVvOT99h0Qw4Unski0yms9FW4DDf8jg/324mhG3p8Lz/Sx8QcPrpet6jy4jVmNh6uj4VeDSD5HwuCDMkpTUMnGkmh6fDNMKLYk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(82310400011)(186009)(64100799003)(1800799012)(451199024)(40470700004)(46966006)(36840700001)(70206006)(8936002)(4326008)(478600001)(8676002)(36860700001)(316002)(54906003)(426003)(1076003)(6916009)(26005)(70586007)(83380400001)(336012)(6666004)(2906002)(5660300002)(41300700001)(44832011)(4744005)(2616005)(36756003)(47076005)(82740400003)(356005)(81166007)(86362001)(40460700003)(40480700001)(142923001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2024 12:49:06.6896
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b353449-3875-4f71-2139-08dc15c85c73
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5935

Thanks to 1ec3fe1f664f ("xen/arm32: head: Improve logging in head.S"),
we can now use PRINT_ID() macro to print messages when running on
identity mapping. For that, all the strings need to be part of the first
page that is mapped. This is not the case for a 'hex' string (used by
asm_putn when printing register values), which currently resides in
.rodata.str. Move it to .rodata.idmap to allow making use of print_reg
macro from anywhere (mostly to aid debugging).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm32/head.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 99d7d4aa63d1..b488a21a71ba 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -320,7 +320,7 @@ ENTRY(asm_putn)
         mov   pc, lr
 ENDPROC(asm_putn)
 
-RODATA_STR(hex, "0123456789abcdef")
+RODATA_SECT(.rodata.idmap, hex, "0123456789abcdef")
 
 #endif /* CONFIG_EARLY_PRINTK */
 
-- 
2.25.1


