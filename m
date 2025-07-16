Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AA4B07F76
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 23:22:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045775.1415998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aA-00088k-J7; Wed, 16 Jul 2025 21:22:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045775.1415998; Wed, 16 Jul 2025 21:22:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc9aA-00085l-FW; Wed, 16 Jul 2025 21:22:30 +0000
Received: by outflank-mailman (input) for mailman id 1045775;
 Wed, 16 Jul 2025 21:22:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XbuO=Z5=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uc9a8-0007F2-Ut
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 21:22:28 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2412::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f8e5979c-628a-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 23:22:27 +0200 (CEST)
Received: from DM6PR03CA0100.namprd03.prod.outlook.com (2603:10b6:5:333::33)
 by SJ2PR12MB7799.namprd12.prod.outlook.com (2603:10b6:a03:4d3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.35; Wed, 16 Jul
 2025 21:22:23 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:333:cafe::ca) by DM6PR03CA0100.outlook.office365.com
 (2603:10b6:5:333::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.20 via Frontend Transport; Wed,
 16 Jul 2025 21:22:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8943.21 via Frontend Transport; Wed, 16 Jul 2025 21:22:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:14 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 16 Jul
 2025 16:22:14 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 16 Jul 2025 16:22:14 -0500
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
X-Inumbo-ID: f8e5979c-628a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iNs9usH/Uh7qv/Yibszq5TrIclWrkNysxQnxWmZMyxCrNx32c5L1yZRl6lPHajlOWFemXQDSc79Q2LXTxorHDh3ZT4ZWvXMAVSK6uSQsbWAZfpsLLcfg6YL7J9u5GtjfnGpoKpmCKPGxRpmXFFGKW867vgeoqw//Kzolm6cw/xB389/Ca6b66yUrbr+zg5yhqzmHZTbcP0XzJKyBD0xS0sQ4uYNLq1TSiCkDAAXkVBBgrlNU3IbgnG5J4l8iyAgX+rB9dDDci2sYwOtcjRgzIrWpvFygVSC2AMRtSvIoOOPj4LeGf/EVPnm4DMzxOwsq5f2A3a9S2T5svAHqhvwgBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4SrHYelHHxhnkv89jdaZ0HdwLgpuE+uqyfBIn9726pg=;
 b=n5km9/UC3YiBoExl4+rPjeInhRW8pxRfjzETXCJWILqhVNQ+FcYqZSdMsDZa3+mJJEZDh19gRGXjnka+iKr6vYxryVk+J0ifx9LhVUQP9sxfnEQbgEzraQ4q+NsiV4nyFm6o3j8TH1n7qya2FQxRKxmlq7dHg+IbsFEmQKjdvRFJOvJyYb01x+K2at8qKScRHlM+MRuvLD1vdCY54bUHvV46I2Bi7oSkyYCWcEd6CbK02NE93ejo8IxIduKLgteGtk0dFQouORS0BT020+Ot8kKnevMGDWeiTkL8qr3NJRR7dGsmmFwDpoorPw8oB/sXkILbNXrHvIu2T42KUJlvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4SrHYelHHxhnkv89jdaZ0HdwLgpuE+uqyfBIn9726pg=;
 b=cCBF7BtSVCdkkLhlQMejX3rGksc1/611PWd6PPMeo8u2G7pQ7gny3IGqd9/urRh2gA79GHOj/TlEVX1s0z05xH6IRmRUY3eAjTM1FxevlYXjKVSah2pwjWxSmyDxLDC6xyaORv4jZU2lgwEGOQpqbPqA45eGJiEaQlNMAPYHaXI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 08/17] public/io: xs_wire: Include event channel in interface page
Date: Wed, 16 Jul 2025 17:14:55 -0400
Message-ID: <20250716211504.291104-9-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250716211504.291104-1-jason.andryuk@amd.com>
References: <20250716211504.291104-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|SJ2PR12MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 20695f3c-46a7-4cf6-a7f1-08ddc4aeda5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?08U5bPQjMBvwOPSOyLXsnYptlanH7uFPdymRxUYLHFPXDl4ILh3uQ2TEOV5l?=
 =?us-ascii?Q?nlcNZpewXoMteUnvCI3QFKqvjWbzDSFyHncHOpokYCMppGmznb6g9PaSHiMy?=
 =?us-ascii?Q?sUzJMFs4jVV35d0DrQiZEX2hKtwlBqlHHryaFLuAoo4WW05aQ+l76QbYX4Wi?=
 =?us-ascii?Q?BDokoM6ez12JFnh1ZRjD2boydMgkyiwSdkGmPaKgW1AiBnRiUi0DFjk476FK?=
 =?us-ascii?Q?bm7nbhK3qXN84P+ByWagpiMQzxoZfDDs5hPzqyEmBxPOnU4iY5boBSlAjQmR?=
 =?us-ascii?Q?xNL932cpTxr3vYlTnGDzmsUVenDZWoEPan5USkx1shjtMry1Pr6+aUGT6gnk?=
 =?us-ascii?Q?y6sZ0KoSjn4zWlIq6nj3QQouCWHWp8MQj7w4kGkEUG/SnQA+MpSm8NHjO1pG?=
 =?us-ascii?Q?UgQFE+IfkavgryG2SYrpgffPWQUCu8+8awyKrrPB8ZB3lEb/4ZnS2srK0NBp?=
 =?us-ascii?Q?BwNMSfvDvBfgEHeyvYmh+NV4MghTR1j6tYDnMuvcPEcFcwkMHPIourvb7jPx?=
 =?us-ascii?Q?I1hP0fuKd5wGNnlXvcG+hZ/3GOLA2KlEFksERkAHVqZaSv5YFn0Wf5Z05tri?=
 =?us-ascii?Q?gBevEgsS6YaPRjGlITsBRpz4mZm89ZBC4VZq6aWZbBlFfl7SM+l+YogByhvb?=
 =?us-ascii?Q?9z1TWL84edUD4JXN6hQ+07gHC5yoxpkCRxBBK8Ul+pQxOb7zqNid7rjbpq1E?=
 =?us-ascii?Q?/jZcExDIKgWvKzP2CFxIteOLugYaFRAKm5F1Y+/z7kgeBcH1iqeSwjIG2MUK?=
 =?us-ascii?Q?DHl/WBNP6+mPfuvq3z4Ek/rwYHerob65YeT0buNkAI+PT7G3H6vog0l/X9oj?=
 =?us-ascii?Q?SSm9/pmriQcg54oLHrNyvjHU4HSHF8JbMsqOgwJPAHDy8SzqcH8rEz5X/Fjj?=
 =?us-ascii?Q?qT01nnttvVAGmQIkjZ5s3ViMBY1AfwZYH21pV2Ne1g2VYoYT20MgisL0F7FA?=
 =?us-ascii?Q?UDyfzT6JRq48DE9wtcNbhe4cM55wBpW1+/tnCymIq6TO0fd4Sy2ojjI9M4hR?=
 =?us-ascii?Q?cdVrZoLh0Zt0/RbaudiYTIOd+8x5pHF+kfd54brGjwvI01jJZLnBOZ2xxHV3?=
 =?us-ascii?Q?ibf3s/msglq7CgVtUK8ErhvXEuQxHaB4x9BWwO8xbGMQh8Ot5ZurppO3LuPK?=
 =?us-ascii?Q?4MzTQIiKASzbWZX5qlW4s7ilYZ7knK+ASxFLZZ3Hfwu98/h/fkaiqI8NlpYB?=
 =?us-ascii?Q?5ScYUUbAAURu4wJwOSY9CkMma3omZaHBvY9mjFIjLW56eptsfFLh0pvguHYM?=
 =?us-ascii?Q?uZK5KQO6QRPTOUdFDeNyFaE3Mj554r+X9S3JAOT/uc49UCnBRJaNKW5l9q8V?=
 =?us-ascii?Q?xSjI1DAY6ryh8W47oTK3RYah/0TECAXJgGw4+xSaEOpFF14hf0DhXe3xMjlb?=
 =?us-ascii?Q?aPuztJCebYQE01xBIbbB/IUHD34aWlU9Cep1Gi+ACPyD+h6zuLtxvkZsly/U?=
 =?us-ascii?Q?pC3h3PGnGkwKl3yDMCYwetm0QVFksc4fKaibSWoN0impVRBFzJHKDYWtbnGG?=
 =?us-ascii?Q?WAglGrDJNkOZrL98n8YEvU1N2+HL24RpY0gK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 21:22:22.2562
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20695f3c-46a7-4cf6-a7f1-08ddc4aeda5e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7799

Include the event channel in struct xenstore_domain_interface.  This way
the toolstack or xen can communicate the event channel to xenstored in
memory xenstored already needs to access.

xenstored maps the grant with the well known GNTTAB_RESERVED_XENSTORE
index, so no further information is needed.

Suggested-by: Juergen Gross <jgross@suse.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/include/public/io/xs_wire.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/xen/include/public/io/xs_wire.h b/xen/include/public/io/xs_wire.h
index e92a87a07b..f2c0afd107 100644
--- a/xen/include/public/io/xs_wire.h
+++ b/xen/include/public/io/xs_wire.h
@@ -110,6 +110,7 @@ struct xenstore_domain_interface {
     uint32_t server_features; /* Bitmap of features supported by the server */
     uint32_t connection;
     uint32_t error;
+    uint32_t evtchn_port;
 };
 
 /* Violating this is very bad.  See docs/misc/xenstore.txt. */
@@ -134,6 +135,12 @@ struct xenstore_domain_interface {
 #define XENSTORE_ERROR_RINGIDX 2 /* Invalid ring index */
 #define XENSTORE_ERROR_PROTO   3 /* Protocol violation (payload too long) */
 
+/*
+ * The evtchn_port field is the domU's event channel for xenstored to signal.
+ * It is filled in by Xen for dom0less/Hyperlaunch domains.  It is only used
+ * when non-zero.  Otherwise the event channel from XS_INTRODUCE is used.
+ */
+
 #endif /* _XS_WIRE_H */
 
 /*
-- 
2.50.0


