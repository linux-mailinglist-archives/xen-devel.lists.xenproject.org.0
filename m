Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7D7AAFB2F
	for <lists+xen-devel@lfdr.de>; Thu,  8 May 2025 15:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.979391.1366050 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1Bt-000703-Ni; Thu, 08 May 2025 13:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 979391.1366050; Thu, 08 May 2025 13:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uD1Bt-0006xz-IZ; Thu, 08 May 2025 13:21:33 +0000
Received: by outflank-mailman (input) for mailman id 979391;
 Thu, 08 May 2025 13:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IqQS=XY=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uD1Br-0005gY-FM
 for xen-devel@lists.xenproject.org; Thu, 08 May 2025 13:21:31 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2415::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a0fe31f-2c0f-11f0-9eb4-5ba50f476ded;
 Thu, 08 May 2025 15:21:30 +0200 (CEST)
Received: from CH0PR13CA0041.namprd13.prod.outlook.com (2603:10b6:610:b2::16)
 by PH0PR12MB7861.namprd12.prod.outlook.com (2603:10b6:510:26e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.25; Thu, 8 May
 2025 13:21:22 +0000
Received: from DS3PEPF0000C37F.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::bf) by CH0PR13CA0041.outlook.office365.com
 (2603:10b6:610:b2::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.24 via Frontend Transport; Thu,
 8 May 2025 13:21:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37F.mail.protection.outlook.com (10.167.23.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Thu, 8 May 2025 13:21:21 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:21:21 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 8 May
 2025 08:21:20 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 8 May 2025 08:21:18 -0500
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
X-Inumbo-ID: 5a0fe31f-2c0f-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QivDNAi660V+JVq6wiiyJu65xyw//QBuS0CM0s775D4ap5o5XA+UnBHrHq3ZQYIEIWgQIATc3G3jDs04Ng7AyUrF5qDxJnjNJFPQDglRLGUIYF9phV9zOSgG9UzIySTJg3wIjMkaabim+ywuTrXcVc7NVbsx05ukhVPDjzrkz33N++/SCC9XOp9xBl7y+RtKS+3u+e0/YlCuoU0ohavL2FasPxf/uyrrA7sEkiHB7WhKIVoeQkrAyz5JxH4ezDY2aZe2gD4k+Fe0EXnBmrvp4Jh6vEopBoHEjP+XpUIbsnbR2ilt8p2GgSiRtXkQscsG3VsBl79PzufImql+8uJLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7QqFU341kNEQ1CkVHUs9vf850fY7Y4Ivh8PGVOXOpI=;
 b=eE7oH9/eKJ4JJ4OyFa6EqKHGFKxXs1PqcG1qDhCNBHkW0GPjHX+I7bjk6k2hTaLKRLLGkh0wZSOa91HzNOFYoWYqj/Q4GHze7PPL1ozrFDEqa4RiVpwJ3LCn2ooW8w6UfLRI0wU/+XBYSCz+wY/LHBH7+oTi5ucC+l2rVRoD7ccoUyXRpUbeciXBnKsx3VcF2Vcht/GtJMLOogrowvrJox31JZZWVOS7yXuI8iqaYrLWLBjgoyq/cvuWvVJBRdU4JmUQWW4OZ7V7mAXA8QtABImGMcVP4pgXSivY01jkkPjZXOGE7tWCqVJc/QGK+qqt0X2HhUQBWqP8ZLUrYWsFDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7QqFU341kNEQ1CkVHUs9vf850fY7Y4Ivh8PGVOXOpI=;
 b=mnp49ONcDUihTvyHWcA+e/2VxdGZmpJETyRKuvvENHViXsoVrfA8g4fn8qIwazibmuR2MQYymmJ8xdVzPfW7KBcrqTV14OS29G6bizLkoQ2hCdPiPanA2dATGGTKbQRAiO5g8/0BcKYGzxanVF0yfzJDnOKB/utsAl9rF7pWGFA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/6] rangeset: introduce rangeset_subtract
Date: Thu, 8 May 2025 09:20:33 -0400
Message-ID: <20250508132040.532898-5-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250508132040.532898-1-stewart.hildebrand@amd.com>
References: <20250508132040.532898-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37F:EE_|PH0PR12MB7861:EE_
X-MS-Office365-Filtering-Correlation-Id: 8511870a-95e9-4046-2f0f-08dd8e333994
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZbInkedcqu5genAzw129cRYQRS51zzv3DFu5gj6FY39je0tC+PuuDl4ccaxT?=
 =?us-ascii?Q?AuG2PE6HHzvyCNzBsMCR3O4pOe2NiwBNNZM4hFvMyvmW2FSp11Av7RbQBju4?=
 =?us-ascii?Q?5vzJplBIsZoJADjevLToJi91cQbQoc6ZdILb8MhiCV/MGOfUEz1IfbvGeOLh?=
 =?us-ascii?Q?2+2rDu09lnXJLrNtWpuagP05h5TjJ55r0Tpn+ABdWCiw7npAcChrsuc5TGb8?=
 =?us-ascii?Q?hISmmoZFXc1EFkr6JL/LeCJLcv/S4vm0x2jwC2zDKTWJX9q7DmbVb2bYjhA7?=
 =?us-ascii?Q?y1mhSrt63HiwZ1Z1RNBGn6/4BznK6c19GcLABPCrVsvdY2G2NR0jc/7N6oC5?=
 =?us-ascii?Q?W0cY98oEoW0P1xA7JU0xEDQ+tfYOtDKSsqN9b6d4CHyTqJsxxZLp+z2tlnE3?=
 =?us-ascii?Q?23GUv7ro5jYyj8ZgxFoM6cwPMMoe8gAwig6V4FcHyUeRUj/nOtPqkGVevdm6?=
 =?us-ascii?Q?SHTMIOvIL4rVysHT2tY1XOOaZzGSNVzuzjhxGKACvmIt97elOzNbIUfAX4OB?=
 =?us-ascii?Q?CGSV/ShypZ9pErNWrup/YlEHZaz6XVqsYQWVJK3ZqXrh4/83O1/rEy5GI01F?=
 =?us-ascii?Q?jBQRDgXQx8LRtzM4jLCwiZ/3zVRKXfdd4z86C6dqBUmKrWcRbEpu2O+8fxDb?=
 =?us-ascii?Q?JXiYe09TPc4tpzC639WCJNGfx0N4aGXDTpfGZ3J/MfJZrQx/w4DHrEgaxlH4?=
 =?us-ascii?Q?yJvGBOazkRAC0jPHbEqPiNXc5oHbpjusau2xnWkD9dbJsqaYuXWtUvAEBPPV?=
 =?us-ascii?Q?GiWsyJ97IKMLTPWGjnDRr+DFWcZZroYzUMFlt5TIo4u+gKI2RvkdC9rEARad?=
 =?us-ascii?Q?vYkgG1lMzl6nbQ4ToDoqUJ3hPUQKS18hDr8hMfAXgP3Gzcm/SsR+x4MwDyz+?=
 =?us-ascii?Q?pgjVDdkdjSlDPdi0K87k3P92K/2nWOoGQxUVKcoUmW7bOqAOqBiZa+kyW0n7?=
 =?us-ascii?Q?9LGxMjkhjcndIhY3K1hThiPw/0fB2sefiv9/iO/VKqZgx9jftWhfmU2t8U4S?=
 =?us-ascii?Q?3jXWvy2+eyZ6joS1CH4BrdRJJqSR81OstkHZkA4hso857BOrBbuf+BEJrTg7?=
 =?us-ascii?Q?9j/BjYX1tKQjL0LM6niESsQ3cBdHB0ROzBuBIBdyi1sGEC56Zdg9btR0WI5l?=
 =?us-ascii?Q?FbXTOH9cjPVBMg+Kv5z7ZIbnTHYo8UKqSOI4aNuVPyGS1MOGFhvtzTfdVCN4?=
 =?us-ascii?Q?faCP+GBOf8KL/Ue5iS+zroCw0nQNxV70p/KDb+SOK+oQ8lj3OeRTxsjom/mu?=
 =?us-ascii?Q?wURqQbya9wQNQZvNFRbXZ+Lv8XUGwMJk9ltaiUdwf+zTNx3vrJxOeEIkpDZ4?=
 =?us-ascii?Q?nxsm9dOTU2EeVrk1jCymbObzz38+YuTgtZlrhO5Dl35UgFwW8JJKDuwmAxRx?=
 =?us-ascii?Q?s81tZOOw5UseDt6fqdAx325QnEgpIr7vjpIR/UqHkAKNAxBK2kMhICTmoh4b?=
 =?us-ascii?Q?yS5cCvSKkvXCO3qJFMww5a+fSBqLhnxpong6ExgG5VnTpckZ///YdNE39ejF?=
 =?us-ascii?Q?TpChSIU6cNS/41j6QbOxipqchs7cL7CCbYQH?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 13:21:21.6197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8511870a-95e9-4046-2f0f-08dd8e333994
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7861

Introduce rangeset_subtract() to remove regions in r2 from r1.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
* no change
---
 xen/common/rangeset.c      | 12 ++++++++++++
 xen/include/xen/rangeset.h |  3 +++
 2 files changed, 15 insertions(+)

diff --git a/xen/common/rangeset.c b/xen/common/rangeset.c
index e75871039087..b9e8912fb1c3 100644
--- a/xen/common/rangeset.c
+++ b/xen/common/rangeset.c
@@ -397,6 +397,18 @@ int rangeset_merge(struct rangeset *r1, struct rangeset *r2)
     return rangeset_report_ranges(r2, 0, ~0UL, merge, r1);
 }
 
+static int cf_check subtract(unsigned long s, unsigned long e, void *data)
+{
+    struct rangeset *r = data;
+
+    return rangeset_remove_range(r, s, e);
+}
+
+int rangeset_subtract(struct rangeset *r1, struct rangeset *r2)
+{
+    return rangeset_report_ranges(r2, 0, ~0UL, subtract, r1);
+}
+
 int rangeset_add_singleton(
     struct rangeset *r, unsigned long s)
 {
diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
index 96c918082501..817505badf6f 100644
--- a/xen/include/xen/rangeset.h
+++ b/xen/include/xen/rangeset.h
@@ -85,6 +85,9 @@ int rangeset_consume_ranges(struct rangeset *r,
 /* Merge rangeset r2 into rangeset r1. */
 int __must_check rangeset_merge(struct rangeset *r1, struct rangeset *r2);
 
+/* Subtract rangeset r2 from rangeset r1. */
+int __must_check rangeset_subtract(struct rangeset *r1, struct rangeset *r2);
+
 /* Add/remove/query a single number. */
 int __must_check rangeset_add_singleton(
     struct rangeset *r, unsigned long s);
-- 
2.49.0


