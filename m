Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D09F589E
	for <lists+xen-devel@lfdr.de>; Tue, 17 Dec 2024 22:19:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.859897.1271980 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNeyQ-0007YJ-97; Tue, 17 Dec 2024 21:19:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 859897.1271980; Tue, 17 Dec 2024 21:19:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tNeyQ-0007Wb-5x; Tue, 17 Dec 2024 21:19:22 +0000
Received: by outflank-mailman (input) for mailman id 859897;
 Tue, 17 Dec 2024 21:19:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sBm5=TK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tNeyP-0007WV-3A
 for xen-devel@lists.xenproject.org; Tue, 17 Dec 2024 21:19:21 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20609.outbound.protection.outlook.com
 [2a01:111:f403:200a::609])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92a244ec-bcbc-11ef-a0d6-8be0dac302b0;
 Tue, 17 Dec 2024 22:19:18 +0100 (CET)
Received: from BN9PR03CA0091.namprd03.prod.outlook.com (2603:10b6:408:fd::6)
 by SJ2PR12MB9137.namprd12.prod.outlook.com (2603:10b6:a03:562::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 21:19:13 +0000
Received: from BL6PEPF0001AB4B.namprd04.prod.outlook.com
 (2603:10b6:408:fd:cafe::c3) by BN9PR03CA0091.outlook.office365.com
 (2603:10b6:408:fd::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.14 via Frontend Transport; Tue,
 17 Dec 2024 21:19:12 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF0001AB4B.mail.protection.outlook.com (10.167.242.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Tue, 17 Dec 2024 21:19:12 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 17 Dec
 2024 15:19:11 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 17 Dec 2024 15:19:10 -0600
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
X-Inumbo-ID: 92a244ec-bcbc-11ef-a0d6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CNYU6mEQ+Pwj/1CJAfTcpFuYaY6MNoBREdUsrX0UY23XUaHq5h7nGv4mC1KHpgF7c3xslwHccUgObkwoN3iOpUOwg2emXxQVwuuW13VZfkUMT20F34o9Yh0EcBWYMRVWiWDj0cgKb9JDVBtHmfh/NPoaGPJL4QsXriLXouVRZst1CYw9szEJRAEZ5bDsXcqWjLRU/iqxQ95vrOsiQRPo45eaw/7xaVDQv7B8fKXKzTgTDwyaVN14yLSAWCpU73L6iu3K111HL+uRuGzn2W5o4MrLX7R5fKbptPPOE4qfe9wna7j5QQ/UaImGNl/ZkMGhfZJKY3E/F9xCKS+Xke/5ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4uW22R7L//WOI3zTt03o+J5QXM2VE11hPWTrbGf9bc=;
 b=WfST7oHfqlQCSQePoSMjmlgicckyIuSb4a6oGp+yWbM8iOiltIilmS3KFOLBKbEQaZwNIwD0eBMvFS5CGik2kuE6/DvAjQqs3psaIhokB5pd81ZQAl1w12K5E0hKfkS269WY6aTP5fU8yKCGnJFFUN40CJiW9kYsucH6aLiBkr2fw2GSH3Ld9Mea0eAi6+i6ZogiXE+WZ2sMq4rjboyEnMnlFVoQsJyfkLaXPPl4ESUSMkezNE6Pfv5P0T/cCTeqz+I3hFujp/AVxCewxhJlcXA0DHlNLVvNIngP981ZeysHnQFy/GGaE+ivp7ZvEnmxmUEHpNg/YpRw/pjk1V6mfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4uW22R7L//WOI3zTt03o+J5QXM2VE11hPWTrbGf9bc=;
 b=jtqBMJGe2QQJsTSsMCnU9VAuGMqFIYI4NaGsFniBabtEE3dmiLQM9+T4+tX7Gbm5t3sAngAFsCFd2xOAjB6c2Kj5z1IbK/Pmjk0mKNg/ryjQyCea13kgRLTEXuS6W5dfX6tnBOv282CQK/DpOLJdI/0M+EKQP966hTOtx/FkhhE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <stefano.stabellini@amd.com>, Michal Orzel
	<michal.orzel@amd.com>, Jason Andryuk <jason.andryuk@amd.com>
Subject: [ImageBuilder] Add zstd compression support
Date: Tue, 17 Dec 2024 16:19:03 -0500
Message-ID: <20241217211903.5945-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4B:EE_|SJ2PR12MB9137:EE_
X-MS-Office365-Filtering-Correlation-Id: 210c1747-ea21-4cbe-d5a4-08dd1ee073cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ri93xrGitH+g1tMWTKciezeny4JMI2J71iphpGVhXp/ZS1Qmcgb1UU5Cr0ZE?=
 =?us-ascii?Q?aLEnDwuF4MHTxbCfKeQCiSErm5Yl9mHnj0zHrTdKsn2yyx1bMr4aLIPEwqvV?=
 =?us-ascii?Q?/rq5QkxcZ0fhMaWX3WXu0hkaRFAvpG//aBCEUwPzs+EutYcWut5R6ceiyk19?=
 =?us-ascii?Q?o4YdVNHkfeCoZH0dCn7lD9yovET9ZlzSzTL+U4aS5aCcX7N+RjBze61b8JIQ?=
 =?us-ascii?Q?ySxfc6jE/cqyBiCB2UVM+d/WZMpB8YzGKvjXZxgPIK6L0nCBdKxhy3wAl2z2?=
 =?us-ascii?Q?9r1krwJB83A8LdMFNNxz5AivKAzKaNnxqV2YLvIf/uY2/ImfEqWMkJnZwvnM?=
 =?us-ascii?Q?KG5QWnBs97zS4/Qdu50m4uAFI8i4c7IVJ0vHbVCWXY4zOK3P6vij3G7OkADC?=
 =?us-ascii?Q?GZQ7aNlvx2/8fUCjc/R7cOVq47BHXaCs+jc5Ia0T+jZQP01i4NixiXLBwTI5?=
 =?us-ascii?Q?5IqNLv4gWZ+4VeVjP9BoZVzD0+JgMbszSokjev2TBkZTjxPpz8HSo6rArXJv?=
 =?us-ascii?Q?RtJq9IQ8yeJHCRwRNmwlMdzpO6nLBI0Kckj0olhl09m+0vsXMncJHut/JbMw?=
 =?us-ascii?Q?6LiuOshE8y+eY6hY9gE7HJ78PyO2rggfEZZPhUhSXOvaNelAyWim6WmsVkKx?=
 =?us-ascii?Q?kRFiyUzClfVyIsheleGxHdNJKQ1VEw2KvF6sULBILqvZIKCx+Tmd/e3NPie2?=
 =?us-ascii?Q?XreKIDVNRkxepto1Q3YSzmJPbWwkYweSnhKfJf4O+m/gK2udWOZpLoPrd2cY?=
 =?us-ascii?Q?NfFORjzIcfEcknnMUT7+CKJalQmYD6yPiC8puO5tgXM8ORqzStPzbWQpxpd/?=
 =?us-ascii?Q?vEVjUDf12eNYBub7Y09HzwyMSzUlzESzioGhodFrT302j0jSGWL8dX9CnRoN?=
 =?us-ascii?Q?8GzeZgnqBc5HttagiCFFFRBTu8OjE3D3L7aTFSeBejgsFDr8ffTB20fuKGbO?=
 =?us-ascii?Q?v/QSBvFIoa0qK99IozA2+QsDJaDBwo/5YM6AjmqLTrum8fHbiK606yFQ8uhi?=
 =?us-ascii?Q?wbd3EewmDuYMFTxtxIjqVWYVaGbfXC1KYc1zzwkgk2RjXBWBam1ocYGRJgYn?=
 =?us-ascii?Q?ETbB9rXy2eG0CNcvdJs2RVVnPDMo+zVh32iHErS2pjHVuuImY2eUT1ZNnhM+?=
 =?us-ascii?Q?VNVOt3IB9k6ZNC+fZ7Y0NGY3sZ+l0n95TbWx8BwJAJu/BRYpTgY+0MDQmT3v?=
 =?us-ascii?Q?GE3JbUsA5jQ7ZAhbcdAVwIoGu8cQEj3jmVPYozN+Q0xQmM4m/CphYBU2lP2R?=
 =?us-ascii?Q?4Wqvnmme547sJh+fmUwVO4z5Mv6fKDb+dBOC2p5EeGv6szz0GjjTBGEy5l0R?=
 =?us-ascii?Q?iLAVaJX0A2VHlIAAQBh1mBV1Vqtr2fmXQOgFB5+pFshK5epkMot6W8/kBoc2?=
 =?us-ascii?Q?Iy5W5mOcv1OT1Tm3TTXp4LkhFfdh4bcImdphPEac09UjZ9/QQsIzHYBfTFTw?=
 =?us-ascii?Q?bbsdjQgC9sxWA6vFMXFZDzQbwq2fp3D8rq6YnYKfUQN0DiX8mM1EiAe/nYE/?=
 =?us-ascii?Q?KzPKLl7cBjPkrxY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 21:19:12.0008
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 210c1747-ea21-4cbe-d5a4-08dd1ee073cc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB4B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9137

uboot-script-gen fails to process a zstd-compressed initramdisk, exiting
with:
Wrong file type initrd.img. It should be cpio archive, exiting.

Extend the existing approach to also check zstd.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 scripts/uboot-script-gen | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index fc63702..db2c011 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -567,6 +567,7 @@ function check_compressed_file_type()
 {
     local filename=$1
     local type="$2"
+    local file_type
 
     if [ ! -f $filename ]
     then
@@ -574,13 +575,17 @@ function check_compressed_file_type()
         cleanup_and_return_err
     fi
 
-    file -L $filename | grep "gzip compressed data" &> /dev/null
-    if test $? == 0
-    then
+    file_type=$( file -L $filename )
+    if echo "$file_type" | grep -q "gzip compressed data" ; then
         local tmp=`mktemp`
         tmp_files+=($tmp)
         cat $filename | gunzip > $tmp
         filename=$tmp
+    elif echo "$file_type" | grep -q "Zstandard compressed data" ; then
+        local tmp=`mktemp`
+        tmp_files+=($tmp)
+        zstdcat $filename > $tmp
+        filename=$tmp
     fi
     check_file_type $filename "$type"
 }
-- 
2.34.1


