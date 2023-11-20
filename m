Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FB787F16ED
	for <lists+xen-devel@lfdr.de>; Mon, 20 Nov 2023 16:13:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637046.992741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55xn-0007i7-3j; Mon, 20 Nov 2023 15:13:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637046.992741; Mon, 20 Nov 2023 15:13:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r55xn-0007fI-0U; Mon, 20 Nov 2023 15:13:27 +0000
Received: by outflank-mailman (input) for mailman id 637046;
 Mon, 20 Nov 2023 15:13:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F3F/=HB=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r55xm-0007fC-0X
 for xen-devel@lists.xenproject.org; Mon, 20 Nov 2023 15:13:26 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20631.outbound.protection.outlook.com
 [2a01:111:f400:7eaa::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 58c346e1-87b7-11ee-9b0e-b553b5be7939;
 Mon, 20 Nov 2023 16:13:23 +0100 (CET)
Received: from DM6PR17CA0024.namprd17.prod.outlook.com (2603:10b6:5:1b3::37)
 by CY5PR12MB6227.namprd12.prod.outlook.com (2603:10b6:930:21::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 15:13:20 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:5:1b3:cafe::10) by DM6PR17CA0024.outlook.office365.com
 (2603:10b6:5:1b3::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Mon, 20 Nov 2023 15:13:20 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Mon, 20 Nov 2023 15:13:19 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Mon, 20 Nov
 2023 09:13:18 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Mon, 20 Nov
 2023 07:13:18 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Mon, 20 Nov 2023 09:13:17 -0600
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
X-Inumbo-ID: 58c346e1-87b7-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jFrG1TrMd/e0kh+Sdl95eMt08tN7krfMiKlnWMjdYI5w9hayHZOsGYgrl95RBKU4hXA6Y4oVtflZPXb1ivLbaSuclkSC0R5GUEUeB9sNPSlYJoQahZoGMawoVvBWldDNwc98de6AB+ezPGJGumUf6W3h8ArHnVosnYjhkEd589pnpD/cn18iYLE2/ntFDVE2I9Z/+KGxJYxIsOGdH7F6UeW98hAHdx3JGY0zp2fcqExApAY3RjOKBrc+Pc7BiALsLP2Pq6zwcYxm/LaHTLaSvI+GdZ0V8lNrIPrMaVyHKaTcPzimPG/3oKv3oyshjwrb6DiagETX9iUQ/rr7afjrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/PiRdYgrtDdEJE4tNAgZp4K4hnRT1QsFVLpTkw9TnE=;
 b=KEjYJEIRWQ5k2G5dtSKamO4NllQwnV534xuJVMAsH/dufgBwiYeWx7WzxFprTJmdiQ+A9UFQkVgVJJE73mlopxlZtRRcKu53q8geXEoq7lUaxqcI9YW+lVWDP4+/9fpt1ZVdlVQM+v1eDwkKSDWq2njGlr0ENfIrg2dVSn6uC7LK59gRQm4XdzsWW49ZwAAE0t9xg02dtu5bRjR0EjZW/mw3zavnNTd8akUXOvUwZ70F3d7pQWeS5e22W20s5R52fkQsU4m2ShRyCqiWoXJzSa8U+T/CPH7TlWX+Bttd8k4bW4K83KNKWXfqdv/5y8EhR5WeAgHNjVbi2+3OYXK0ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/PiRdYgrtDdEJE4tNAgZp4K4hnRT1QsFVLpTkw9TnE=;
 b=M5aOfXATlc3pO4nBQN2laNILqomc2GufUPnEeO2BOVGMm8IJqiYHpTxJuhNMQPabFMGNazVVLAovjyzGTHMHSCXVNpda9U1/3Uoxgs9VnhOW5SeaFED4tu1BYmYrtnY+od0h73mPBowY4TJMwBW2G2OntrdMKYeZiSztu+mCF0M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder] uboot-script-gen: use size from arm32 zImage header
Date: Mon, 20 Nov 2023 16:13:15 +0100
Message-ID: <20231120151315.92119-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|CY5PR12MB6227:EE_
X-MS-Office365-Filtering-Correlation-Id: 853348fe-508f-4760-30da-08dbe9db3acb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gyrMlXcS4PLMsz1HhaEEtEqIuHZt8J17YLthEk03+sd5m8FxhrXLxtp/9PHO2fAuFcQRAgCx088XmxX1J0+e76wIARayV+4gO/AyPHP6+j6BpfSJZE1TNUtG2n1DoEhV4nUWm54tBrRDMbpp2zFc+G+KCfZjtYw91afcaMAf4E91pJsX7Hx2oUjNXlEndojjzn8XFjWVu8N9S9YhG0KS9oJypWQ8DntRlIZEkfzNiew0j2NEiEnu87maqK7TtTaL+IqSRVckbL9UJX79gtj6q10r72q9a2Wsp2QpkpiPIlgIMNSDq8hr8slfnJ42zVPSsurnqU8+pQA2y8pH1PpUEigWAzYYlZRdvzTSCo8VOczW3JG+XT999rfPu70caL57qGgQE/DJQq3DKtbV7DfZWYwJr4AeegZ74wqbISvR1k7Jp9k4vAVBpBIxreTvUSzq8kY1eZzAfop9xH8KfxB6sHzuVNNqZFmqw+R53UnYrg2z/x1bhpYiWsg4dTkJdwXgkInp+zT8+WTynzWlMjYaTvm59JGdqw5nMoBnmpH46eldhPInkvPxe4orzIy5f1bWIQ418o1yF4CVuq/eo6j/r/eRdA4FHnr71gHMZNvFFpNeTeH/8S8i43YfrXc3W+WHGEXKdtLpfheRaxiTctY84YuFwgUYeWid70iJI7GMC7wuOG9c/0yTnWk1AnfJkDzFU5+h4/SfV1wXDDyr4PAq1y8usYPxqwfOy5HBdM2pxeHrHytCCf+OSKITx2dyRqXX
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(396003)(376002)(346002)(230922051799003)(82310400011)(186009)(451199024)(64100799003)(1800799012)(46966006)(36840700001)(40470700004)(26005)(40460700003)(70586007)(1076003)(83380400001)(54906003)(316002)(6916009)(70206006)(336012)(426003)(86362001)(5660300002)(2906002)(36860700001)(47076005)(478600001)(36756003)(44832011)(82740400003)(356005)(81166007)(41300700001)(2616005)(40480700001)(8676002)(4326008)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 15:13:19.5467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 853348fe-508f-4760-30da-08dbe9db3acb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6227

Take an example from commit 8bf401c99035 ("uboot-script-gen: use size from
arm64 Image header") and add support for calculating the effective image
size from arm32 zImage header.

Introduce get_image_size() function and use it to to probe the supported
header magic values and to retrieve the effective image size. Use this
value in add_size(), whenever it's bigger than the one obtained using
'stat -L'.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This patch together with 'bootz' support will allow us to enable testing Xen
on arm{32,64} in gitlab CI with UBSAN enabled.
---
 scripts/uboot-script-gen | 38 ++++++++++++++++++++++++++++----------
 1 file changed, 28 insertions(+), 10 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 9e3d86e4743a..078a667c61ab 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -431,23 +431,41 @@ function device_tree_editing()
     fi
 }
 
-function add_size()
+# Read effective image size from a header, which may be larger than the filesize
+# due to noload sections, e.g. bss.
+function get_image_size()
 {
-    local filename=$1
-    local size=`stat -L --printf="%s" $filename`
+    local image=$1
+    local effective_size=0
     # Read arm64 header magic (https://www.kernel.org/doc/Documentation/arm64/booting.txt)
-    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${filename} | awk 'NR==1 {print $2}')
+    local arm64_header_magic=$(od -j 56 -N 4 -t x4 ${image} | awk 'NR==1 {print $2}')
+    # Read arm32 header magic (http://www.simtec.co.uk/products/SWLINUX/files/booting_article.html)
+    local arm32_header_magic=$(od -j 36 -N 4 -t x4 ${image} | awk 'NR==1 {print $2}')
 
     # Check for valid arm64 header magic value 0x644d5241
     if [ "${arm64_header_magic}" = "644d5241" ]
     then
-        # Read effective size, which may be larger than the filesize due to noload sections, e.g. bss
-        local arm64_header_size=$(od -j 16 -N 8 -t u8 ${filename} | awk 'NR==1 {print $2}')
+        effective_size=$(od -j 16 -N 8 -t u8 ${image} | awk 'NR==1 {print $2}')
+    # Check for valid arm32 header magic value 0x016f2818
+    elif [ "${arm32_header_magic}" = "016f2818" ]
+    then
+        local start=$(od -j 40 -N 4 -t u4 ${image} | awk 'NR==1 {print $2}')
+        local end=$(od -j 44 -N 4 -t u4 ${image} | awk 'NR==1 {print $2}')
+        effective_size=$(( end - start ))
+    fi
 
-        if [ "${arm64_header_size}" -gt "${size}" ]
-        then
-            size=${arm64_header_size}
-        fi
+    printf "%u" $effective_size
+}
+
+function add_size()
+{
+    local filename=$1
+    local size=`stat -L --printf="%s" $filename`
+    local image_size=`get_image_size $filename`
+
+    if [ "${image_size}" -gt "${size}" ]
+    then
+        size=${image_size}
     fi
 
     memaddr=$(( $memaddr + $size + $offset - 1))
-- 
2.25.1


