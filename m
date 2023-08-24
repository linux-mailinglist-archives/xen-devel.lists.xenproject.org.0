Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F041C7877BB
	for <lists+xen-devel@lfdr.de>; Thu, 24 Aug 2023 20:24:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.590256.922401 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZEyv-0006XG-1r; Thu, 24 Aug 2023 18:22:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 590256.922401; Thu, 24 Aug 2023 18:22:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qZEyu-0006VP-VP; Thu, 24 Aug 2023 18:22:56 +0000
Received: by outflank-mailman (input) for mailman id 590256;
 Thu, 24 Aug 2023 18:22:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JGcK=EJ=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1qZEyt-0006VJ-Pl
 for xen-devel@lists.xenproject.org; Thu, 24 Aug 2023 18:22:55 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3af2fda7-42ab-11ee-9b0c-b553b5be7939;
 Thu, 24 Aug 2023 20:22:50 +0200 (CEST)
Received: from MW4PR04CA0314.namprd04.prod.outlook.com (2603:10b6:303:82::19)
 by DS7PR12MB8289.namprd12.prod.outlook.com (2603:10b6:8:d8::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.27; Thu, 24 Aug 2023 18:22:46 +0000
Received: from CO1PEPF000044FB.namprd21.prod.outlook.com
 (2603:10b6:303:82:cafe::2c) by MW4PR04CA0314.outlook.office365.com
 (2603:10b6:303:82::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Thu, 24 Aug 2023 18:22:45 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FB.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6745.2 via Frontend Transport; Thu, 24 Aug 2023 18:22:45 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 24 Aug
 2023 13:22:44 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.27 via Frontend
 Transport; Thu, 24 Aug 2023 13:22:42 -0500
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
X-Inumbo-ID: 3af2fda7-42ab-11ee-9b0c-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W570YnU6gvugyC/OGQi4plieGtQcmUd6886fACPxc21BojWfkUSGzTZ2hiDZUdaz6PRe+N6I3P2qkXcxOVEGigmuYVn2ljdMRJ8d3tIUYTqBI3kIiebuExRCatwVlZbOU1xOWMG+/nFvNHYfU0OYj1cTGLiFlQPmzSOwCS6v5MA/Np8ftC+la+q9hLz+XJID0A8oU7mGaQq/d782AwLnhz+2YSz7hKgs1i5ZaGGpl3wQqb1ezfKI0B5LIdkByDQC6NfmJBIfz6sCkdv1konzblssybAyJxmCSeuecRn+XhX0P7iJSLYQwAWVGgWr2JTIHorc7ON9hcHyT2ZbFTwq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMltQQhGGtk4wnzy42Xehvg/dyQWAzbgc6rFZmJF9GM=;
 b=JpVVbJHxnFfALXnJb2CyYr0MpvD98qjfVok8WV++WmfRDfZ1qzsb7JkvE+eo3HONqf9qsz/qT4MGAJlvxuDPn9MzgK/Rsr+0gq4ubaSyWMmbIZ2ZxNGJfUQG5EZZ1YhHVZSQuiCt/c5II4kyox+PBWTTC/ppkWqxS/MHcBT7P6rb0VptUQwMtNm2CH1BM8Rqy4vy2grqrNzojYg3mekl6xLRuaP8bPXQxwZzxqqxaeAD+8V7C+g94BWv6M0lydu6/XrhCI/6JKCc+6ahQfzhOuTaWYzJmoN0Ua9qX2I26rNwMbTYvl56IMwPy1gL9OtcmSqntv3V+2cx8fjKqSNhyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMltQQhGGtk4wnzy42Xehvg/dyQWAzbgc6rFZmJF9GM=;
 b=lKClb/boSY8ZNl2IeTG3NDeAJd+Mb7qJRaLf3yMBKIYLmvPu5yj+omwxY+WKD4H65BS3Idjc1S2Qp67YyxYCfQoipmIkSnAFnDJZGdmN0p7ZVN7OSMb++2mSDI1DapiJcD4NHcbb4zDueyzL9cW2v01gqOsgUnJdmw8jdFvivNs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Michal Orzel <michal.orzel@amd.com>
Subject: [ImageBuilder PATCH] uboot-script-gen: use size from arm64 Image header
Date: Thu, 24 Aug 2023 14:22:31 -0400
Message-ID: <20230824182233.50760-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FB:EE_|DS7PR12MB8289:EE_
X-MS-Office365-Filtering-Correlation-Id: 4da769e5-54f4-40d6-cfee-08dba4cf1cf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ByWBgrA8Xpv1dSe6mJnExGbPWMHwizgxcnp3JqiF7hmFLeQgYSBR24hD1u/l5eYlLE2NbQx7QZbzpIP2I1hdB/WJCJa8nboIikEL/eruc1RY9fJKkr7QtDtcT+St82DIJO7n2HmcOGWBMt7bEaKi2pmWRVFuD3Ml0r7y6q3POsNDahzHCM4Gi2Ye3rKpfw9lsMtPtcJHick3M9vPJ0eRv1s93zE9L210aoedu7vQL8ia8PnNIXCtpOABYuenohVaQOXJ0uAg9dAjblLmgXrfdxbkC/J9H1PI1XEVrCRcEsAnOhD3pilvvhxANgIHCBYXLFupluP8ZHJGa1rmZ6APZOg8ARof3jL4hePkFb/GZCcnd42gWyBl9+diYP+CPE3xqIzAwnT5Yx+Y/Rz+X7wEoClYb24Tg69fFQvy53oWOu0gLUk1fKmb7aonAr6/b2irHwyP8ClF2fMPX6hGnwCmYFQFp81dz6K6TRI0c4Q4yZjHFXJP5KedoxZnGxSLVlIPF46qV52s3mo6+N6d1Sss10QFDBp67jfjTMyHNZbvK2MWBL+0zAIc1Va732VmctOyqzcGZtZX/juZ20cFRs+rGktWCWzRr68CY8m8AiE5XEXeQKLSEpe3iSikT+rJ5tdijXUqOcXtSBjAsBw+WtyQqVTnqOku2lob1LwOWjai643eaiaIHVW/lWgUQYvmTsndmvocFV2rfk2hL4IEvC+zZYq3sALxzqpQlr+IEWMdOMl0M3TXFDh0KxHPiy1uNKb/u0gQsrMn6dDBzfDxZEnnQQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(376002)(39860400002)(396003)(136003)(346002)(186009)(1800799009)(82310400011)(451199024)(40470700004)(36840700001)(46966006)(1076003)(40460700003)(2616005)(5660300002)(8936002)(4326008)(8676002)(336012)(426003)(47076005)(36756003)(83380400001)(44832011)(36860700001)(26005)(40480700001)(82740400003)(356005)(6666004)(81166007)(70206006)(70586007)(54906003)(6916009)(316002)(478600001)(41300700001)(2906002)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2023 18:22:45.2511
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4da769e5-54f4-40d6-cfee-08dba4cf1cf2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FB.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8289

There is a corner case where the filesizes of the xen and Linux kernel images
are not sufficient. These binaries likely contain .NOLOAD sections, which are
not accounted in the filesize.

Check for the presence of an arm64 kernel image header, and get the effective
image size from the header. Use the effective image size for calculating the
next load address and for populating the size in the /chosen/dom*/reg property.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 scripts/uboot-script-gen | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 9656a458ac00..50fe525e7145 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -2,7 +2,7 @@
 
 offset=$((2*1024*1024))
 filesize=0
-prog_req=(mkimage file fdtput mktemp awk)
+prog_req=(mkimage file fdtput mktemp awk od)
 
 function cleanup_and_return_err()
 {
@@ -435,6 +435,17 @@ function add_size()
 {
     local filename=$1
     local size=`stat -L --printf="%s" $filename`
+
+    if [ "$(od -j 56 -N 4 -t x4 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')" = "644d5241" ]
+    then
+        local size_header=$(od -j 16 -N 8 -t u8 ${filename} | head -n 1 | awk -F' ' '{ print $2 }')
+
+        if [ "${size_header}" -gt "${size}" ]
+        then
+            size=${size_header}
+        fi
+    fi
+
     memaddr=$(( $memaddr + $size + $offset - 1))
     memaddr=$(( $memaddr & ~($offset - 1) ))
     memaddr=`printf "0x%X\n" $memaddr`
-- 
2.42.0


