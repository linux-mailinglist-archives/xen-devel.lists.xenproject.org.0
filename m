Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8E07EB345
	for <lists+xen-devel@lfdr.de>; Tue, 14 Nov 2023 16:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.632780.987209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v8z-0001vJ-OJ; Tue, 14 Nov 2023 15:16:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 632780.987209; Tue, 14 Nov 2023 15:16:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r2v8z-0001sn-KN; Tue, 14 Nov 2023 15:16:01 +0000
Received: by outflank-mailman (input) for mailman id 632780;
 Tue, 14 Nov 2023 15:15:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H6sB=G3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r2v8x-0001sO-D2
 for xen-devel@lists.xenproject.org; Tue, 14 Nov 2023 15:15:59 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f400:fe59::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b5e7e100-8300-11ee-98db-6d05b1d4d9a1;
 Tue, 14 Nov 2023 16:15:57 +0100 (CET)
Received: from CH5P223CA0002.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::10)
 by DM4PR12MB5962.namprd12.prod.outlook.com (2603:10b6:8:69::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6977.29; Tue, 14 Nov 2023 15:15:50 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:1f3:cafe::67) by CH5P223CA0002.outlook.office365.com
 (2603:10b6:610:1f3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.31 via Frontend
 Transport; Tue, 14 Nov 2023 15:15:50 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7002.14 via Frontend Transport; Tue, 14 Nov 2023 15:15:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Tue, 14 Nov
 2023 09:15:48 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32
 via Frontend Transport; Tue, 14 Nov 2023 09:15:47 -0600
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
X-Inumbo-ID: b5e7e100-8300-11ee-98db-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoTHtH2woT/zmxOywLdCgslMKPzQ3lL2rwRj73oevyFWws+cTw+yG7TLiycZ6hf/39BDB5CCWFVs4su8q7oVuHkfv1qAPxfKvFX4CPeeYHYfva3H6ZH0qpS/cfuRNgpjkDDQD5FBKTwtmR6HA8IqL1JCXM33RhzSQywAfBiRVl2gZifoTwc6D882kGLaJnTaxiCeiiojdNephAK3LWdq8NczWrhC8+lhqbyb1yOpOvr/+YPwKdLgOGtfHodK3nM4XKmWJpeTwyEHERHWRkdYU1WwOSnDLrUw9Dv2j/GOn99Aa1zxkGpzUJwG1SUdcAj5GWqTZ9FREtlDy3Ujx7J1Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DasBI6LeyKgugWeCwBkYzotJQvEFYR+pBHAsv5kFKHA=;
 b=CkAXbI1VBF4IwKGuRL0mt4CKJj3Ooeboz3CrY20J5Ldre2d3HZ0zucpTeuVwfJE+oboKtiSREOjB7U7HJqxfni0xUGjWLm9u15HuA/RDu1o6Pg8+ldX5IetnmWrao1OuAyQZSDjXYcbxD5vvKnu5gyVnuMeIIuoGOuEjI9Hcu38I9Yi6vWbAdcSSW+LcVsNB/uD4IrWNLt8J1LhpafKN71msw6j03JgpMJ2pvKU8fyTwfIvFLl6Y9VfoDpzhMGEPhI/tpCVlYXQLVQg6fpKGlUhpz3SQgwbmFctRtNf9q9cdBqB6nXvXSlkhH4IUhIxerks3FGaKfjOFMDa6eR7VsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DasBI6LeyKgugWeCwBkYzotJQvEFYR+pBHAsv5kFKHA=;
 b=qReXNCnYH2mTsRNNAMbMj2r5I4Kojbvsc3tsuiwFH/fWpBLwvmBNW8XE775eZP+BB3MB940ihLsmJe72aOQe16qxagrxE0JuplwQI0hSLTSwlKDq/YRFHXdyJ4gnxmbwQ/z3b5C5ARIbNoyrdPjsDzKCUB27etQ64DNTEIKHl9U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder] Add 'bootz' to a list of supported boot commands
Date: Tue, 14 Nov 2023 16:15:35 +0100
Message-ID: <20231114151535.53409-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|DM4PR12MB5962:EE_
X-MS-Office365-Filtering-Correlation-Id: f27ed917-e233-4a89-76de-08dbe5249639
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ULCtQ1dPAxJPgeTiL1FNAKPcT1oE2Ox4/A/firGBilW12FY075ZKjEzeDi3Be7JKv1n9jThf1TYP3QQ7rJFbRTDCKVmV9ajfDzJEOd5eMxq6lFhsvPHMwk/r3qRCvo3oftg63f9dSgHuBniz5YjqjXsKbYwHqvhR0JGbpg0rDIfy0KE0OIraxDxeJXQolH09WWJlyehNYqCnDJv8cKPaLweFfBwGr5T+/bymQCgA9lBiNacvhrbPgMu/1CJMjoJscHA63YkJ5BIAKlzg8jKP3vF3bzovIANuJqA8O3dIxRGf3wNimcHbrICVRMLxI4AD0ATptC3VRV5DR6qLav7DEs804N8jV3qC7SEFza1XoKv8Hwfai0sHQ7P/kGuxWbyvWOXNbXUP0eBtbdPpohBflTrb14lLFgt++XATPa+SDNUjxQ+2hGJnvOKbG8THbcdKdMxkzupzQ+B0lFvYOCc/ImMe2sI2rFnSxj2Y0zcD5IZixD5p1M4/VWJxhObym7f7frJrGJOBL0doTy+Bb4+RM/qJ0yY1VLQT4HG+dT4iNroepGvNJ0ZNPC9Kk0cUkKMcS/yyHukPDwSiJ4F/RdXPJGNGstzA37rIbwr7QDhcMghbhSZ4fh007pXgXCjWh4UImtJaG/d7IV/Txhhnt2VvYxw9t44qNsZmbNTdWAv/yHhaRIfXkmJAc7STri1whWKwW9Y6sFEXz9bPxqgEE40cGw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(230922051799003)(451199024)(186009)(1800799009)(82310400011)(46966006)(36840700001)(54906003)(70206006)(70586007)(6916009)(86362001)(356005)(81166007)(36756003)(83380400001)(426003)(336012)(26005)(6666004)(1076003)(2616005)(36860700001)(2906002)(508600001)(316002)(8676002)(4326008)(47076005)(8936002)(5660300002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2023 15:15:50.2488
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f27ed917-e233-4a89-76de-08dbe5249639
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5962

At the moment, in order to boot 32-bit images, we need to set BOOT_CMD
to 'bootm' which results in adding a u-boot header on top of an image.
Add 'bootz' to a list of supported boot commands, so that we can skip
this extra step. In most cases, specifying 'bootm' should only be needed
for images without Linux kernel Image/zImage header. Otherwise, we can
use 'booti'/'bootz'.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 README.md                | 4 ++--
 scripts/uboot-script-gen | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/README.md b/README.md
index fe5d2052cc69..3b4b16f1f7e4 100644
--- a/README.md
+++ b/README.md
@@ -80,8 +80,8 @@ Where:
   though.
 
 - BOOT_CMD specifies the u-boot command used to boot the binaries.
-  By default, it is 'booti'. The acceptable values are 'booti', 'bootm'
-  and 'bootefi' and 'none'. If the value is 'none', the BOOT_CMD is not
+  By default, it is 'booti'. The acceptable values are 'booti', 'bootm',
+  'bootz' and 'bootefi' and 'none'. If the value is 'none', the BOOT_CMD is not
   added to the boot script, and the addresses for the Xen binary and the
   DTB are stored in 'host_kernel_addr' and 'host_fdt_addr' u-boot
   env variables respectively, to be used manually when booting.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 6e52da5e2aca..9e3d86e4743a 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -1041,7 +1041,7 @@ function check_depends()
 
 function check_boot_cmd()
 {
-    if ! [[ " bootm booti bootefi none " =~ " ${BOOT_CMD}" ]]
+    if ! [[ " bootm booti bootz bootefi none " =~ " ${BOOT_CMD}" ]]
     then
         echo "\"BOOT_CMD=$BOOT_CMD\" is not valid"
         exit 1
-- 
2.25.1


