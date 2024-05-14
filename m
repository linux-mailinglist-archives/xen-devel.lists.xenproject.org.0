Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8968C5815
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2024 16:35:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.721593.1125155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tFV-00072M-8e; Tue, 14 May 2024 14:35:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 721593.1125155; Tue, 14 May 2024 14:35:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s6tFV-00070i-5n; Tue, 14 May 2024 14:35:25 +0000
Received: by outflank-mailman (input) for mailman id 721593;
 Tue, 14 May 2024 14:35:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=loUn=MR=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1s6tFT-0004xK-Q3
 for xen-devel@lists.xenproject.org; Tue, 14 May 2024 14:35:23 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [2a01:111:f400:7e88::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31c564ed-11ff-11ef-909d-e314d9c70b13;
 Tue, 14 May 2024 16:35:23 +0200 (CEST)
Received: from MW3PR06CA0002.namprd06.prod.outlook.com (2603:10b6:303:2a::7)
 by SN7PR12MB7977.namprd12.prod.outlook.com (2603:10b6:806:340::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55; Tue, 14 May
 2024 14:35:18 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:303:2a:cafe::c2) by MW3PR06CA0002.outlook.office365.com
 (2603:10b6:303:2a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 14 May 2024 14:35:17 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.21 via Frontend Transport; Tue, 14 May 2024 14:35:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 09:35:15 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Tue, 14 May
 2024 09:35:15 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 14 May 2024 09:35:09 -0500
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
X-Inumbo-ID: 31c564ed-11ff-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bgo3z8RKUAeMa3//VZ3E6/Ae26SG+P7cyiZBEFk3moTngK7Bz0Ag3Gzsi2adNamwxPM7HvBikDOT9SJ3mR9eTUSGc++JyrwHhox62XVHkS2Fav/9XKXUlmwOO5yTtfO7WxGyohe8r46FaXBrd4ZtqNfzChPjKVnAN+vILRao3J+NYa37Er5+t3nAZSVt4YG+NT4EYZrbBg0ywJ/uevMz0v+/grPbcDY7KfRLhGCEQOU8lKQAo5kzQZNAa1IdyFarz+X9HPIoow5svG/GGtLuH29osMf4vX05egH5VWuhTUSeceBXhHfWiDrNHKsKt1n9z3EZMdSaUS1GYCAcudcemw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RhlHUD9Uu3FrjzdtnmRTwtlA65attPhQDXfrRmCx33g=;
 b=WLMXxnfJwS3y8MFsQlfqpi4x4s4vPKNJrzd5ayzyobaOpFUfRdQZmmfzS25LsXc/Iaoj2Q+WDkppJyDdsy31gYgrFE6j8NSszLb1EKPVoh6EzYnO3P69EA/TjL8RHWhEzI5cNmP6cgMOZvDpiTLhtI76PJq9IslSLyTGO1m9ISWzdAgCw0nNbKKX4csT5g5sx3YqlNWxXX7fGVuXeeC0wMi83HdjHumcgbRGHVJxb2l3+VspNNGgoys7t8ktwamSMfV3Esq76xIlN4Y0DnXIEsb7YHA7TINn07HgvjOtO6b7u6uP7qvJZZxkircuNIyhEsvVScfbG7qPW9L/nC53Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RhlHUD9Uu3FrjzdtnmRTwtlA65attPhQDXfrRmCx33g=;
 b=oZ2V6bMennaAUQdIMkXrd8Z40e1W+DZlj9XdxEG57oVnuhpmT3RjykTbjOrEyrnyWP1OwqXiLR14q/8L4YNTp1HNzW58jCI/3C2moJ++X9Lyyj8Ms5GdgtOBGF86kCw5lIVgC0q36njeGuj200/NfNhTAjAS4BVtKj2LnzgA7ak=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Stewart Hildebrand
	<stewart.hildebrand@amd.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Volodymyr Babchuk
	<volodymyr_babchuk@epam.com>
Subject: [PATCH v14 5/5] arm/vpci: honor access size when returning an error
Date: Tue, 14 May 2024 10:33:57 -0400
Message-ID: <20240514143400.152280-6-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240514143400.152280-1-stewart.hildebrand@amd.com>
References: <20240514143400.152280-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|SN7PR12MB7977:EE_
X-MS-Office365-Filtering-Correlation-Id: b0ef63ab-8853-4624-2182-08dc742312ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|1800799015|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IRQdCSQ76CNm6BAyrpNWu5W0Gq18D7L2QRGuVj/HmSj/CzJC4jYK+lHewJNV?=
 =?us-ascii?Q?3Hs8qrW5bw2bfysC+foYio+wSwdyR00iSU04q6j1+Hc1sX2X2jzUytJHyJLx?=
 =?us-ascii?Q?gW7dVIyP+bag4ZBUBxMVcADEAiSs3RrPnsvZEIq0JP+UV+suf/LGZkzoIkPf?=
 =?us-ascii?Q?S6QxOk6ALoB3eH5Jk8pUuvMy3e90hT4exui8/iBSeTT3C4kWPsTyx48NmNB0?=
 =?us-ascii?Q?4VxOKrbK/vb7pGeSr2c+yIsJoZt3PqpOd0qBx+Z5rXYCFfN154T5XKRxKTnM?=
 =?us-ascii?Q?nYMJYcttO46TS8zBqB9BqKmITd/NEhYVToRZYNkLXLLqDu2p7dcSowzFI0mb?=
 =?us-ascii?Q?koP94USOU592ipnRLywEbvmygRezWq1amjayu1yNRk7nK+0u5WkmwWJG3p6m?=
 =?us-ascii?Q?4T3H8DOfcT2o9yzCbaKLsY5NR5ENRrON+R6qo4Bti31bcoGNUp2rv8mkAYqH?=
 =?us-ascii?Q?uA6IL3svTEDmxcfQEsZPLupFPm5oYNLDGKITcb3y83v3eE2iGzoFNaBRMC4c?=
 =?us-ascii?Q?RP6w1zSE9xoRwuBNDd4/v5oK2O99EUOM/BnqhjnU70FfmA1xozo3//Q36umc?=
 =?us-ascii?Q?ghy+x9sXELvjX3gOW6EPmQBtxto4KNbxdhy+tU26BykBsqnVNm/b6ZqV7cqw?=
 =?us-ascii?Q?GfgrgyFPPMYNNlIFNaP+CpSyiQ4PqQAszP7MZKieC8bDjAury1gtLU2JX5Ez?=
 =?us-ascii?Q?wH4TCQZ2Bbs4JBKHugGN+pI5oFQMUwlACJwWvIAf0qdots9GEDqDh0Q0bgCX?=
 =?us-ascii?Q?7J2AFiYG+MQ/zqZNgN6grXY2UCJ37dNOCzV6pK+5073+POfBs6UPF1/ffgUw?=
 =?us-ascii?Q?1yp2S1c0PM+ZoQDmDoiSbjnv3+haJ1ma/RKNajqRpXv/Lw+rd0zJ+KRn0IJP?=
 =?us-ascii?Q?qPc1/9slHeDj4EDH6OeK7o/5B/XicthcsON4g0KbEwWgp7cWdeeCa+xrnk8P?=
 =?us-ascii?Q?Os2hjyBVU8SpGKapdIsunQoJLEWK91c0AAecqSTsqzlEBzb2522+2mpzkcNv?=
 =?us-ascii?Q?9iRqV3dKhGYW+SFEIMxBHkRZHuJV4m9bKoeR3NzXDMaIxb4q+YtcuwVfFTEw?=
 =?us-ascii?Q?RjDhNqkYOKw0z8z7DlVwxPAy40KLieAIEckLM8FR3n96PMQDPnBaBe5TRDzf?=
 =?us-ascii?Q?Xx4N3VCl11FFtcBtaLfIOPzopF/ecGeND0sZCbJB1xo822faNOgTOM18SyJN?=
 =?us-ascii?Q?ZbM4Wz/lKvo34oZ7Kgu25AxVjo8ulytX55hmVFDWm3NuEkJGP43afHgZUjgY?=
 =?us-ascii?Q?jVP8iZ+sB00YHinpFPBPv4HXaFcfLjPWxIAi0uoPKYLvFovlxYQca7sJVDqB?=
 =?us-ascii?Q?xSMWNrPddZ9hirmZ4Q6OQPD5w+l9vkeBob5sYaftr9nE7pcn6/fNIaERq3hM?=
 =?us-ascii?Q?3sDw4nMLJBL+As1P2HEZIJkWBt7U?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2024 14:35:16.6850
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0ef63ab-8853-4624-2182-08dc742312ce
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7977

From: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>

Guest can try to read config space using different access sizes: 8,
16, 32, 64 bits. We need to take this into account when we are
returning an error back to MMIO handler, otherwise it is possible to
provide more data than requested: i.e. guest issues LDRB instruction
to read one byte, but we are writing 0xFFFFFFFFFFFFFFFF in the target
register.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v9->10:
* New patch in v10.
---
 xen/arch/arm/vpci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/vpci.c b/xen/arch/arm/vpci.c
index 348ba0fbc860..aaf9d9120c3d 100644
--- a/xen/arch/arm/vpci.c
+++ b/xen/arch/arm/vpci.c
@@ -41,6 +41,8 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 {
     struct pci_host_bridge *bridge = p;
     pci_sbdf_t sbdf;
+    const uint8_t access_size = (1 << info->dabt.size) * 8;
+    const uint64_t access_mask = GENMASK_ULL(access_size - 1, 0);
     /* data is needed to prevent a pointer cast on 32bit */
     unsigned long data;
 
@@ -48,7 +50,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
 
     if ( !vpci_sbdf_from_gpa(v->domain, bridge, info->gpa, &sbdf) )
     {
-        *r = ~0UL;
+        *r = access_mask;
         return 1;
     }
 
@@ -59,7 +61,7 @@ static int vpci_mmio_read(struct vcpu *v, mmio_info_t *info,
         return 1;
     }
 
-    *r = ~0UL;
+    *r = access_mask;
 
     return 0;
 }
-- 
2.43.2


