Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF25B11674
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056872.1424919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cr-0006El-Tg; Fri, 25 Jul 2025 02:30:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056872.1424919; Fri, 25 Jul 2025 02:30:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cr-0006BS-LA; Fri, 25 Jul 2025 02:30:45 +0000
Received: by outflank-mailman (input) for mailman id 1056872;
 Fri, 25 Jul 2025 02:30:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8As-0000gX-Dn
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:42 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2415::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1335860d-68ff-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:28:40 +0200 (CEST)
Received: from BL1P223CA0006.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::11)
 by LV3PR12MB9402.namprd12.prod.outlook.com (2603:10b6:408:213::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Fri, 25 Jul
 2025 02:28:36 +0000
Received: from BL02EPF0002992E.namprd02.prod.outlook.com
 (2603:10b6:208:2c4:cafe::d7) by BL1P223CA0006.outlook.office365.com
 (2603:10b6:208:2c4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.21 via Frontend Transport; Fri,
 25 Jul 2025 02:28:36 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992E.mail.protection.outlook.com (10.167.249.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:36 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:36 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:35 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:35 -0500
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
X-Inumbo-ID: 1335860d-68ff-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uc7X4h6bffmnRKhrO8Zl7p5gh2AEWnZRsQi0WTfiE8KkcJFS5ylUMX3ghLlTx64ClOqXIE9pbgzuvEABiGoMgOEVXvDBQQgqXvPBv3yF05yL08x+zrWJS8mxLjsCFG5fifQlv2jkSJ/4Uan+x3NTYOmeYuSLmk7sb7juTjUwaNw0ivRiD5tFp9SAF9QMMlhFf3+CnwUs4OsHeUCc6xICqaDgIO5tDvg/LCEOfL/T8/Jf6wpEYhr3dqYEtj4rwfl46loNOs2UO9gNvCz/MifzqeJO+SwezIuR1xYAfzyA+ELQd0I8orkC/E2glpbo/IIWLtq/S2pP/i0yPc/NyOItog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IY46yUzC/+71M6lchNLsMz+T9eDvpji2uNrFCavqT2M=;
 b=Gs4dAq1Xg1mXPDLZCEv2sppKH5t8RuY6oRjzcFZgtSRwYYGx0n0zAynaTHpN/GCnMU/z2e9zcwIQYyThUC81mbFMsDAqFPv4UeDK9bEXuqS6h6IJ738PCryyGuO8T9dPZyRje7wCu9ojriwXkv+p0vVWvQS4V1iYfVBsJSS/DTfw/i7cRZYKoVgjWsIFfCgZC9Fkb513kYz5UAOUbb+Gv8PRXjh75lDYAtlvlsmhDG4P35UlWCd02IX4YgEKxtS03G7E1AA48CsN1qvcU2yX/idjKkrCi0e/cmReNR49yi98ktkt/Xj9xEasWLz6IUDpliZ0vdfhQEs1/bX13vWPrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IY46yUzC/+71M6lchNLsMz+T9eDvpji2uNrFCavqT2M=;
 b=nzuUf0IoiNK6Mdv1z3oC24Jp9/ZMzdOWhqgK+WFPktysm0hbBby7jq8QTGOkUvgBfpt6boQpPCVmlrgWIG1eLooolECj71/uNTBfwh/I9Bx2aPtHVsXkcyHEIYGkV9uJxMmliTl6RiFGT30kiFhKqsH9dyJY/baXpQ7c8ZNtfDk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v4 11/12] tools/xenstored: Rename xenbus_master_domid -> xenbus_store_domain
Date: Thu, 24 Jul 2025 22:28:11 -0400
Message-ID: <20250725022812.466897-12-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992E:EE_|LV3PR12MB9402:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f2be8c7-05ed-4f86-aad6-08ddcb22f582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IKjNFiylx+tOAjb5Bf+/whC8I8bn7JSxNQHdPFMprnacu1eATBYiN2igfYz5?=
 =?us-ascii?Q?2Ajo0oUCZEcx+ywBFzjCktcCHYO3DJOVrYDF5ksK9A7b4UupHjb1qBeQ2yV3?=
 =?us-ascii?Q?rLjhyBz0Xt6IuTKJ7qjMLvCHF2y4PgPqQ+n15gNXRkWSMgmmxjzPrij46yia?=
 =?us-ascii?Q?kWkNCLS/mxL5TLgqr3PSugDgk5TEgh2mM0BKCVgLIFLGZUZzkbFg0lsk1k4J?=
 =?us-ascii?Q?uL1T11A62fYiBnTg+lSJP4NPfgHhwUP1VEfX0z/3kjEDNvLGK01+ViwgUa1T?=
 =?us-ascii?Q?DEA4Ttbzuu4+Cgr5sWlxHRQJTHe09AkO/7sCgLsltFjtVgK5S8Ndr8nHIOaD?=
 =?us-ascii?Q?3umQtlyAB3ZKCPHaksLfhOI5C5lmR91XNB31ZNQNlRLBzuikcc4e7Lk2zu2h?=
 =?us-ascii?Q?0/uETBABJpZq+oD/GKOfv3+paegq8wA/qU503+MD3nykAh2p1RpsuuvEmuFy?=
 =?us-ascii?Q?KGIaxurG4W+BtnnlvKrrZ69KmDMe2I80P3llOTF8jJzh9DMHpBS8H7qzFxnU?=
 =?us-ascii?Q?FL4Tu7VO+ruqoVvVbzN1W0qxdBU2zKHhXsbAXhY/SGsjOwr6xymSlqKjQsMB?=
 =?us-ascii?Q?UbBDh9rRpLSnt6RZ3w9gwTjtXuV1MatKDsjQ+2iaYSdiFWADA9RZinzvW8fr?=
 =?us-ascii?Q?2fxr92T36+ka2rnG/Qzkk/e0UlTYZ+X0p/MhQqc5ulUTVZo1yf+xJ+/fc3l3?=
 =?us-ascii?Q?vN1w2H37XAi8x/4vn89cZXUCwDF/DimtQDjHjWTgnomhSPLbIGT3gbPTq1UK?=
 =?us-ascii?Q?8Q+htI8q6ykw4csbh4tuSjgusTFpLYf7gZbXbFNEcIX+hSMnixIljevPxLv2?=
 =?us-ascii?Q?ODZ3MyDBybAzHB7m3pplPVoWm0wzzN9zhh2GsbgGVyxPIW3y4at+F3cRJuHT?=
 =?us-ascii?Q?ztCQJA46xqdR/tlQVJ3aJ0GoRZ1rKZFdesNfoWtNDiupfTVnXfVJiutRJ10K?=
 =?us-ascii?Q?3eoUbtWIoPoGZWkKQc7XGrYtinxNy8bSkvRjW0x8Gwjlhg4aKoomclUXbblV?=
 =?us-ascii?Q?KBKu1gkbpAG/QotSAjZRHIyhpr0vxz5JslIS4GFa2hS8VnRWwJtsHQT/ZLT7?=
 =?us-ascii?Q?ZaXqexZkXo/QjcPyefmcfyYaSvf5ZzziTcny2KfXPYtOBR9Nqhz7ckrWBpIe?=
 =?us-ascii?Q?Pdq/O7G4e+qIXo7R/5p0b2CLzoG6d8F48+YSF/UriCiVuST1aMfQGtu7MkeZ?=
 =?us-ascii?Q?jA84XmztgeLVP3MnliFfsTD0ORm7FGuj3yzceGQCuxIVXuW6iMW+W9d5FHp2?=
 =?us-ascii?Q?+Jx0wWaMn+dO7XNAeyW9tEVTd6x4sMK3kyI5xFK3+C+gHz32mBFSZO7xtsFR?=
 =?us-ascii?Q?uLUqfeCHuXfBAwbUOcJ3GEpitzHNWmz/NrVdUFFH2caig3EXNpYTv4sOvzVZ?=
 =?us-ascii?Q?9nyNoWbVhliMtbfgTZ8fXLypdMYFUYKUQgr7JzxCU+SzzY5REbQ2xfeEcrsC?=
 =?us-ascii?Q?qixH3sz29hoU0TlZSROmAJ7/gxxjhjg1Me1tZ0T8sxV9aj1zyfDP59BRK3yx?=
 =?us-ascii?Q?XmltsvbwFmOiw4x315Ez6ZmoZB+AJMSc9+Ug?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:36.4357
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f2be8c7-05ed-4f86-aad6-08ddcb22f582
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9402

Rename the helper that access store_domid accordingly.

While doing this, rename the is_store_domain variable.

No functional change.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/core.h   | 2 +-
 tools/xenstored/domain.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/xenstored/core.h b/tools/xenstored/core.h
index d44cca8454..3e209893f3 100644
--- a/tools/xenstored/core.h
+++ b/tools/xenstored/core.h
@@ -381,7 +381,7 @@ uint64_t get_now_msec(void);
 void *xenbus_map(void);
 void unmap_xenbus(void *interface);
 
-static inline int xenbus_master_domid(void) { return store_domid; }
+static inline int xenbus_store_domid(void) { return store_domid; }
 
 static inline bool domid_is_unprivileged(unsigned int domid)
 {
diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index d9144e97a1..f1527a6db7 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -503,7 +503,7 @@ static const struct interface_funcs domain_funcs = {
 
 static void *map_interface(domid_t domid)
 {
-	if (domid == xenbus_master_domid())
+	if (domid == xenbus_store_domid())
 		return xenbus_map();
 
 	return xengnttab_map_grant_ref(*xgt_handle, domid,
@@ -513,7 +513,7 @@ static void *map_interface(domid_t domid)
 
 static void unmap_interface(domid_t domid, void *interface)
 {
-	if (domid == xenbus_master_domid())
+	if (domid == xenbus_store_domid())
 		unmap_xenbus(interface);
 	else if (domid != stub_domid)
 		xengnttab_unmap(*xgt_handle, interface, 1);
-- 
2.50.1


