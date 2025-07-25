Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36885B11679
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:30:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056884.1424939 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cv-0006xE-M9; Fri, 25 Jul 2025 02:30:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056884.1424939; Fri, 25 Jul 2025 02:30:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Cv-0006rU-EJ; Fri, 25 Jul 2025 02:30:49 +0000
Received: by outflank-mailman (input) for mailman id 1056884;
 Fri, 25 Jul 2025 02:30:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Ap-0000gX-DZ
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:39 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:200a::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 113bd977-68ff-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:28:37 +0200 (CEST)
Received: from BN9P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::12)
 by IA0PPFF4B476A86.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bea) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.26; Fri, 25 Jul
 2025 02:28:33 +0000
Received: from BL02EPF0002992A.namprd02.prod.outlook.com
 (2603:10b6:408:10a:cafe::2a) by BN9P221CA0004.outlook.office365.com
 (2603:10b6:408:10a::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.31 via Frontend Transport; Fri,
 25 Jul 2025 02:28:33 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0002992A.mail.protection.outlook.com (10.167.249.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:32 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:32 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:32 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:31 -0500
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
X-Inumbo-ID: 113bd977-68ff-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QI/oWD/3oMYpsHc05vNTzAOwDOXGCe55KmHShvvHDhTphMHS2Xjv9nci+nPaqM7mPY/+OLs33rEJpY+HE2HqblfCnyfqRsGuWNYFn8THtqjqTlXqbfU6iANP2wwrY9bWg9gf1X4LivHtoPPQLExMTE+vaUnu7N5hHG/UB+fs8FKzntbdYFDAbl+Xc8ttyv+GSPF6H9trUD9lv9UD7XH/WjfZ2FDw+pPcgPNoCLT5BkVRFf1mfO1RmA2gf9yWkiT3PeQN2DqncrlM3l0LAxaPp9TOLqj6KtUxI27cncHNxsoDzDk/W1TD0yb6g0oipj1QAozO1Z64LHn1LQXE/5sJYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZxtOPcbtCIz2ATDGfljtgRclBt/eYKldV3W5vT0cVdU=;
 b=WH1pXcvzsxj1XGkQg5js7s71ZoQNjxF7kbKu1Mv1i1Zyn/qEW0ZbljpeIofX3lOrQLUepbT7LAnVDmYlhTa1Cg5X1W0V4jJ3GFBX+xRRhRTmd4H4s9303/ldfPv5u/JzlAXW5cA2Mrr39VqsC6UIAqDxq2P8eDLh+06D1zTyWnWTihm1ERnL67NedxcUw3WOw7OjG2wz+Qee+RmXcLSk4XxHSzq8QLgYIOA6D65XT5XBUf5xjZrbrRB48DXh1HC9eI/ahw2xIap6zZKlPePb63WopDrblNLoUjbrWyCkDMLPBq9vVm1aKeQ9G6Km4FwpLf6NMaXbeoV8aes0LRiVLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZxtOPcbtCIz2ATDGfljtgRclBt/eYKldV3W5vT0cVdU=;
 b=jLQBWzp6YI4wT/54vMm/SoxFV33l2KQW9XTuFNorQpdw85mYF8UPTmOWK5emfjMoEEVYpbMjVIBGIS9NJllXsWugeE6dhgprQobigrgN9mAIXVWzWj80orTR3/yezH+Qcvapqpfyc2AjkXmLtjGmEiksOwKrYJypiTJZA2/CpvU=
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
Subject: [PATCH v4 08/12] tools/xenstored: Remove stubdom special casing
Date: Thu, 24 Jul 2025 22:28:08 -0400
Message-ID: <20250725022812.466897-9-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992A:EE_|IA0PPFF4B476A86:EE_
X-MS-Office365-Filtering-Correlation-Id: 9af7e407-2262-458d-20e0-08ddcb22f372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?HbI9TL8p6/pDrA0nBhMcW/UWX7bXLQ0GCJRp1GqPArF9a8YbvSw6N/Z5RbYc?=
 =?us-ascii?Q?poZxI85Hnnsx/q/XnE4QKs57FM/1dZTUZQfYmqUCmmRDrDFmijNQh1acFttJ?=
 =?us-ascii?Q?ZPnlHbOjSLIVYXjUknmvpqI+e7W2817jCtKci4tY0sEIcTL8fBbBsPxJx93+?=
 =?us-ascii?Q?qaMAhpH3TN1aIO72d0HcvQnOA5vf/nJn+yRX0CXdd5QDhtq0HWAa7IxsD+bj?=
 =?us-ascii?Q?Ltp4enNz6U941y4CrXbWk+H7dasnGZu/7eTZB+1Tzz0/ETZHfFXJtGs3fy1W?=
 =?us-ascii?Q?unDwI/wOcvKL97nwRJ803fCl6o7mB5xxTgWtIgLn1afkSV9sJM1XmrcmmBYP?=
 =?us-ascii?Q?UJwZWXAEa3FttMvhrzcRctjIocoo8ncsCEzc36W2tnzCzBzNu/sGoHVhDrsd?=
 =?us-ascii?Q?k/LhA1Z/OvGLC2wvoOAzE8+jgj3770LHdcrnZy5UPJarsS589oLGlbUWNSzp?=
 =?us-ascii?Q?l+ss6SkwdAuZVsCQ8lNyroYn5M0K4Dr/rHKbaR9w4gWR+UGnGE+IABiE2eG/?=
 =?us-ascii?Q?BU1aD0iMaqAuqQDqRdYcfu8i68+dRTfamDBIkj7+sJkjfOnFmYrjMihaUx5X?=
 =?us-ascii?Q?AfkI05xP6r+hcBsyaL4WWfq1B71V9Ow9X4mx6cEHfsboSIiQeV/RMJJOpcKr?=
 =?us-ascii?Q?Ee+S9eh+Qa99z/OoNymY2nRbSA1SR9iJwKxHHJN/+N0aqrbFFPJ/Oi8Ghe9+?=
 =?us-ascii?Q?req8qDxTQ3DwdnPNFAY76I13JbPw8VKHwxtfKc7Gc2FV28GH+EHR/amEQOzw?=
 =?us-ascii?Q?ls7MgPiHwo5cD+mCXZv2SHSsoS2ZoNtiwQZZi20gF9n5C05r4jVb6UffX9J5?=
 =?us-ascii?Q?vW04ArJgbdH8uRNwV+exA9TYRHJUEyY7cUrBB5rTJG35T7FalUWbGNOCdng5?=
 =?us-ascii?Q?vrOyBmpdqd00OyTY+QtTnwocI9/NZEU/x3KkCa1lfwmw6PH3fQ/K5hMBUc8E?=
 =?us-ascii?Q?jETtE4l+0HfE42VERVdumCreTranWJwkeXjd3rKDT7a4IsZrEj3Z9m9nQnnh?=
 =?us-ascii?Q?GF5EEfn0oY7uYCFR1/D8CDcevgaqRA/qafmx+ySMSx4+NzJFEX1fYlKBs1+8?=
 =?us-ascii?Q?xxFJ0Y5BPcZUUXPw+MQq3nPkRXZezIQvR8oYceFa5ccPWOe2wx+zZWG9Sr/a?=
 =?us-ascii?Q?42+vM7sQkPnEFc5mGyLMc607aCuu6XREIQh6RdPtrTNyAvDhB8t7aX4D8/nw?=
 =?us-ascii?Q?G22Pzcel9dlPTODbppNXFL6PNm/3Wz6+COz36yndKBDBHHrKiEdSoM7fS5bZ?=
 =?us-ascii?Q?ImYst2WgyMIAmcVSgRvRnq6cb+2WD8zP0Llr1QKBasATGDz0gnTRYn+Z4SVG?=
 =?us-ascii?Q?tu5Rb7Y9ev0/dCSZnPqLWXm6uEtVkrkY/0OMtJoaRUnrqSZBYGdwye9gTbsA?=
 =?us-ascii?Q?oUva1XeUG7GrfQc9IXa2U+AEbtxxfRqbE3256DG7TbeaxOYUer8OCCXcFhKM?=
 =?us-ascii?Q?W7985h3S2vbvKRsFW44w+BRAgmu/PZc/UMiwWXs3nkNZjLdG8q8/P9bEsky4?=
 =?us-ascii?Q?hv7jSeDqjmfDWacUpdmge72vYM5RxCT862/G?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:32.9711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9af7e407-2262-458d-20e0-08ddcb22f372
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0002992A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFF4B476A86

posix.c and minios.c implement the same named functions serving slightly
different purposes.

For xenbus_map()
posix.c maps the local /dev/xen/xsd_kva
minios.c maps dom0 via grant and there is open coding for stub_domid in
map_interface.

Change xenbus_map() to map the local domain's interface.  The default
grant table mapping is performed otherwise.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/xenstored/domain.c | 5 -----
 tools/xenstored/minios.c | 4 +---
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index e9e45ed8e8..ac4ac72f99 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -506,11 +506,6 @@ static void *map_interface(domid_t domid)
 	if (domid == xenbus_master_domid())
 		return xenbus_map();
 
-#ifdef __MINIOS__
-	if (domid == stub_domid)
-		return xenstore_buf;
-#endif
-
 	return xengnttab_map_grant_ref(*xgt_handle, domid,
 				       GNTTAB_RESERVED_XENSTORE,
 				       PROT_READ|PROT_WRITE);
diff --git a/tools/xenstored/minios.c b/tools/xenstored/minios.c
index a229954cf4..34f655f20a 100644
--- a/tools/xenstored/minios.c
+++ b/tools/xenstored/minios.c
@@ -48,13 +48,11 @@ evtchn_port_t get_xenbus_evtchn(void)
 
 void *xenbus_map(void)
 {
-	return xengnttab_map_grant_ref(*xgt_handle, xenbus_master_domid(),
-			GNTTAB_RESERVED_XENSTORE, PROT_READ|PROT_WRITE);
+	return xenstore_buf;
 }
 
 void unmap_xenbus(void *interface)
 {
-	xengnttab_unmap(*xgt_handle, interface, 1);
 }
 
 void early_init(bool live_update, bool dofork, const char *pidfile)
-- 
2.50.1


