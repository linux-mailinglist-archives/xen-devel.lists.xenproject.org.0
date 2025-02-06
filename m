Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36B99A29E37
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 02:09:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882395.1292577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO5-0000LO-2D; Thu, 06 Feb 2025 01:09:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882395.1292577; Thu, 06 Feb 2025 01:09:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfqO4-0000GI-Rs; Thu, 06 Feb 2025 01:09:00 +0000
Received: by outflank-mailman (input) for mailman id 882395;
 Thu, 06 Feb 2025 01:08:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3EC/=U5=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1tfqO2-0007da-3J
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 01:08:58 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:240a::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0158626-e426-11ef-99a4-01e77a169b0f;
 Thu, 06 Feb 2025 02:08:56 +0100 (CET)
Received: from CH2PR11CA0005.namprd11.prod.outlook.com (2603:10b6:610:54::15)
 by PH7PR12MB9075.namprd12.prod.outlook.com (2603:10b6:510:2f0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.11; Thu, 6 Feb
 2025 01:08:51 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::84) by CH2PR11CA0005.outlook.office365.com
 (2603:10b6:610:54::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 01:08:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 01:08:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 5 Feb
 2025 19:08:50 -0600
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 5 Feb 2025 19:08:49 -0600
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
X-Inumbo-ID: f0158626-e426-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o0JNP5uJR989qAdgb/rle5qYNjf+PLw2FJXHYBbFwELndnthZTJYVLYV2BU8ekPuISQKRLRquICNCiVnpUNP1e5ofSp09QkKrP0k5gDc3jduIobVBKxtcHf39Vg6/xhTlqdHVK+TdxuYe5r4Tqr2rPV7lLIgVuMRJOqBVDFMBW4yaKcLFwN+nkp/guKbhnD5kNd0BhxVVmO8uW8r6adps8lVgn6e9LsZuLN9Pniun/wIxbSKJedq8PfxLLtKlwKn1eYfHcFg1KZQIyqNsBcy0GsRkq1afh9RGDPgtsI1E3puNRLl4CnGyy67BIR0xMmTMkg9+KpEl9a01/LjEWXJ3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DdNnZPT/EWWNxVMQKl2mVk9CKJViJCGFeX7uqj/5yiU=;
 b=r4LOFJZLS1G+f+v8efLRCIyxnltr60r2nDySmbsqwu4wQP9frLX0TSdUGWVoLBv9KJMndNkv/X5UBBVnAqpMmZxadpSYMfOSf2IvCvxk2AcdNjQyrMC0PWWchICEYWV8JmhRfR6xKXvOR2fghpZBzwXDyGg25+unkCHdi1YPpfEDE44ucryfV6mwtjjrEWUjY/NK/BXoQEs/FlwJmxlaTNw/bfnZOzNERPOp2GrZP4isMNQ8w2UxJX8a9GD8XniwgXPTn7LRb1pePmJskQteERz/jWay3YWMGJuTGeg/SbJtLV+1mvyA4Z9yr86T9JZCw4GT31qGBRgS52J9tTEa8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DdNnZPT/EWWNxVMQKl2mVk9CKJViJCGFeX7uqj/5yiU=;
 b=k1AwnKZ08a2pwW85fP0hwvPd6kHQ3t6UBD+MMMawneERvwlo3sXsdTkm9mt0LZZ/XKX2pteqY9kTj/D9fOcBuA4c76pqrLDkcYRui3OCxrDsZUVwzM/+zTlQqN8q/8B6oGdHLnLjVSSsue1QqHhg8r/79UE+J8pIAO9sHVazwzI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>, <julien@xen.org>,
	<michal.orzel@amd.com>, <Volodymyr_Babchuk@epam.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH v5 6/9] automation: add ping test to static-mem test
Date: Wed, 5 Feb 2025 17:08:40 -0800
Message-ID: <20250206010843.618280-6-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2502041807070.9756@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|PH7PR12MB9075:EE_
X-MS-Office365-Filtering-Correlation-Id: b1f64114-aa7f-4eaf-3bc1-08dd464ad14b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1ZKbeXApRBc33OWmLd91npAas4ZtzkYPWn+CSin4yNtNrDKatiTnl9FkJ9Ew?=
 =?us-ascii?Q?yMALUvqP6p+1FjhnmlIO1ks1mXLYPmAI8ofl98WskzU/S5fVl/KnGJUbpnua?=
 =?us-ascii?Q?/TiClDHistEs6PnAFD7UtesiXysC3GKyajUwmXUKzNyFaGTWSjP27GGwnBkQ?=
 =?us-ascii?Q?7CD8nDOhpqsFFCM4LtBP0/Dl4aVM6bhLZFLwoxI/Kwwp4K9atYQekWQgWof8?=
 =?us-ascii?Q?9RPcKTp1Jv+VB9QTsDWuNvIpct4u1amB1kVG3uSc5IHAcloV8mpebsHQd4fq?=
 =?us-ascii?Q?dI2KmbevrnQ+oMLt3AoApK3bAzqD6US//KJkVR2bsDHHwvjE3sYBcHipxnG4?=
 =?us-ascii?Q?/clwRG56FvE3kZJz6GtX+XcZWiDg/RuHCSGX5+yFIUiA4qxafxd3nYu1Mw6w?=
 =?us-ascii?Q?CzcGM/EyD/QfxMFuD8xvyMmHIzObTaYdjIptTUU0wpNIsUKKOyP8JdYBJHGC?=
 =?us-ascii?Q?uwrIA03TY3QJA/SrKooXCoHXO4MWkpMBbrjJD8EbUTSbdPJrlHJflPm1mBMr?=
 =?us-ascii?Q?S2GWlB1hk+/TUfKvBpwXIelGysEo9j3Pgm2/o0orYU8mzeCZefsctC92aPFF?=
 =?us-ascii?Q?Uatu0lDfM0aqUOtfcgSTfIIeM3ncD05eTYRjeqXS2m5PkoumOSkhMmAWmRQo?=
 =?us-ascii?Q?GXD961ky/EstG28Iy65GKcoTih03ieCYUzRUOywh+uxrF1s9GqPahJ99Sw1N?=
 =?us-ascii?Q?6KOI7JzRitwkZ0t46XLcg8/APRL22kHk0KDaOQI4c6LwNdsenDlFHRqablrv?=
 =?us-ascii?Q?aCrtLisqMGzTTmkCzQaj9VDrzcStm/bq6I9S2LLVDvS/sTnYkibj+mK87XpO?=
 =?us-ascii?Q?zt4clrcyqiffD/yUZbFo3yyighOyVYOjSFXB6A/MTCi0JLvUrdoW+D6SAmhO?=
 =?us-ascii?Q?QAubNucx38zPmjUnKCjySMFux9Ndl+sDaQlbeXv9KVnECvUbfegTDVdUjpYz?=
 =?us-ascii?Q?fqgU9AnGaCEI9g5939SQb3MqmmttXtGrlLSTcflQ5Q4TMSnKzrx5FFbZbj2T?=
 =?us-ascii?Q?HuF0ufLFtUPiro9RHP8aSdRK+7FmDcmAoW7PUCtxsJAjvsyfGFTHoHEUoTTB?=
 =?us-ascii?Q?LWcOl19nHm1WWgA8zuK1eVZrUJlUmIbCuE8BtvquQpFRoGTgK8r6vx3EWxVh?=
 =?us-ascii?Q?1Me7JFAfQ5ePqqyy298aIrEa8YYrhwqn5zUUqH/zyMA4/738zRJeZs5IHCgD?=
 =?us-ascii?Q?8RvKt7XE2Ucdki6TzLqs0209sYFyQ6zaMuFj3aYgepgS1jkUybhd0bFkB0cC?=
 =?us-ascii?Q?l5I2twf4vKPAdJtLoLbU94gAQTr2w8ymY3pqAhkGZ9fffRu4OTp5eqT0zvW8?=
 =?us-ascii?Q?MOf80pjV40Lywxfo39STT5iO8qaF+jH1RZXODuuv/QzMjslruV7Tz18FPqFt?=
 =?us-ascii?Q?H96CVNYKvr2VqLgovw2bYEMBVOJedRKzn5pIHQTOCLNmM68bam7/lK0wwPbp?=
 =?us-ascii?Q?lxEEy+GR1kuqvOo4BPToocmEy5mNyW8SlOeseP6WX7o7Lbx2ytVP1i9pc99E?=
 =?us-ascii?Q?+iiDThP6tnEneAI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 01:08:50.8433
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1f64114-aa7f-4eaf-3bc1-08dd464ad14b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9075

With the recent fixes, Dom0less direct mapped domains can use PV
drivers. Extend the existing PV network ping tests to direct mapped
guests.

Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/scripts/qemu-smoke-dom0less-arm64.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/automation/scripts/qemu-smoke-dom0less-arm64.sh b/automation/scripts/qemu-smoke-dom0less-arm64.sh
index 83e1866ca6..f72d209361 100755
--- a/automation/scripts/qemu-smoke-dom0less-arm64.sh
+++ b/automation/scripts/qemu-smoke-dom0less-arm64.sh
@@ -25,6 +25,9 @@ if [[ "${test_variant}" == "static-mem" ]]; then
     domU_check="
 mem_range=$(printf \"%08x-%08x\" ${domu_base} $(( ${domu_base} + ${domu_size} - 1 )))
 if grep -q -x \"\${mem_range} : System RAM\" /proc/iomem; then
+    until ifconfig eth0 192.168.0.2 &> /dev/null && ping -c 10 192.168.0.1; do
+        sleep 30
+    done
     echo \"${passed}\"
 fi
 "
-- 
2.25.1


