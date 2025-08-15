Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3195BB287BF
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084086.1443529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25k-00061Z-Us; Fri, 15 Aug 2025 21:36:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084086.1443529; Fri, 15 Aug 2025 21:36:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25k-0005xh-RQ; Fri, 15 Aug 2025 21:36:04 +0000
Received: by outflank-mailman (input) for mailman id 1084086;
 Fri, 15 Aug 2025 21:36:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un25i-0004xK-NM
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:36:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2413::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d57553bc-7a1f-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 23:36:00 +0200 (CEST)
Received: from MN0PR04CA0007.namprd04.prod.outlook.com (2603:10b6:208:52d::12)
 by CY5PR12MB6083.namprd12.prod.outlook.com (2603:10b6:930:29::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:35:56 +0000
Received: from BL02EPF00021F69.namprd02.prod.outlook.com
 (2603:10b6:208:52d:cafe::62) by MN0PR04CA0007.outlook.office365.com
 (2603:10b6:208:52d::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.19 via Frontend Transport; Fri,
 15 Aug 2025 21:35:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF00021F69.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 21:35:55 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:35:55 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:35:54 -0500
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
X-Inumbo-ID: d57553bc-7a1f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oN790B/dhLgF92Q9Pj7f/82XLVQXMXxSENmlPkyJE9aEddTF/f9fOM1smcSkAdMNrVXkKbtaLjeqnx7PHYaTMnds+JsJfxrxXZ3VcxakzKhCnaFLZ0DM/j8Mpk1aQouwKSCZGg9oPZ+O0VeWKY2AV+BBP+kUXtvpLEEe8bm9dY27FTE5LoR6osJqxhryROYDkxVF/7UdIPnSX1YTTOah+ZiejdAmciLJ//Kono3doC7u0w+8Rx5IY/HLGgrjQtWHm2gF8IVoiTtl3FplnEOwSOP6UB9GzI7G+XXKlYyUyYujtJwZAuqksKr+jwx6pW9a1gLvin2AXHGm07WLKS1WxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MfnTWYT+hidron2wSySDF7eq4i9pLVKgrFQZivNWi+0=;
 b=c6jIVBCQE0dqlucOPJvRk0NmraTBv71Gks5+gCFp7Q7JR3F/GPnhzebbKeIFxzdBH92yY49QqaS3QZyGjWHKpQymbWcGdjhiHhxKp1fVIZPqM0Eo2qoz6v/uNhlh5hdAose6vRXcrTYlvVM6XxeiihUAYnNYPW//yDCJtJSiq32K6PDm6Q6l0+f4hx06LihcS+ld6E2kC2o1WhWnIP5ebTF83HTcMujled78h5l1xRVBqxHHDIoNkduoGLZrx8pbLu+Rw6E1a3OSs5phOMDPH/7b/6rLHmZ3Qq7WYG7CvydkQfpeau1okjN6VBPdLfmIEj838BXF9ks/4SFBnp7G9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MfnTWYT+hidron2wSySDF7eq4i9pLVKgrFQZivNWi+0=;
 b=1VkWkj7wOLXLszo12r0dPdjlyRZHzNTIwRBWlkz6OAbrUD3D69gNIU/I47rPcZwNF2nhCnEWzoNG003pzdxqnhWtLASaJmFCTfmJVDEND4EPwKoygTm1WpbHl19tZSi31M7i2XYN+JBLUThApJrAASCc8hL4kNbR4rJe64VFgHE=
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
Subject: [PATCH v6 4/8] tools/xenstored: Check NULL domain in domain_chk_quota()
Date: Fri, 15 Aug 2025 17:35:52 -0400
Message-ID: <20250815213556.90068-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815213556.90068-1-jason.andryuk@amd.com>
References: <20250815213556.90068-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00021F69:EE_|CY5PR12MB6083:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec94166-b4fc-46f7-7120-08dddc43b7b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IlLT80jKXitCSMyPa9zaAxLMT123UqTevSr6QCI6If7oxkx3MykMe94ygHDD?=
 =?us-ascii?Q?l77/Pot50z8r8lGPXP32z+i8FgyMmmKLa25Vmdeg/ukA21Xidgp43ybzbQlF?=
 =?us-ascii?Q?Df1Lgs+7UCOJL2ywcyI3OJgtjkmJmGq7ZXIbFbDpmjD+yLmZz7LK5sn3z98A?=
 =?us-ascii?Q?jyYUFU7vhUXHGME+GNDkVDIkLh5upPPrbo2e31Y0f36O7mgwnkXHKnk/Y3Fa?=
 =?us-ascii?Q?BcEwQEfzqmcNKvprcyeQ05ktrsm6RV+CnqwukQnuAEI+6Hje6q0VZsVLSsCs?=
 =?us-ascii?Q?NUzMiYpA5Taqi4uctkVCsytuTW4IUjXWPCFh30DAyGJhyzsE2DovFRcgaCYs?=
 =?us-ascii?Q?eF2txzgcm/6hkQrsCFrIT3IyD/68hf11Sh8A46vA+z4aFSEGU3QwralMDDoN?=
 =?us-ascii?Q?6VYkfMZSlvavUMN5Hmtk+1JeXBLcUlasc7B6SK0yJ42hMyDZsl9lVOJIxvPD?=
 =?us-ascii?Q?rNdiCysliM6w5hM8Dv3+KpZpq0NChIk6cg6FELVgr5kIAsufPEB3vCD3Hgzu?=
 =?us-ascii?Q?T9nOhmprZ4Htq3vzqUQlRd5CMIsLRIq5ZggOVp65lvE6Ee+snj/Tuwaqvi48?=
 =?us-ascii?Q?WlSAJwddz2ch6AZdizJr2N1MbkIRrJxyomaKcytR9y3R9nHLBYmaXTEuJCwC?=
 =?us-ascii?Q?wJM64T2MAB5EOCeIn8reqbOLVSYi+9KaSqvTI1SNz7KdC4r6hIE2r5e7Q6sr?=
 =?us-ascii?Q?JO4r0QuAyGFeVyzWiQ0//MwHqOuexzeGp8clF6ZYTjONt80c/wBviy+pd1RH?=
 =?us-ascii?Q?D/o+lSf4T2aKFj3hGhZHBNjnVJPVN0TYeo4c0qQ4ol0d04ME7a9hMGRJszye?=
 =?us-ascii?Q?BYeV5p4I1rjMc9QtGUKRmGa3Kv/dq9vGei0F8MbE4y9JviKhxe/IigJZsY5G?=
 =?us-ascii?Q?/MhEiBHLHeGW3eak3AFgKBxR0z2IxV+xnlOMbZpx+0vZG4fWAYdNLpl4g+bk?=
 =?us-ascii?Q?lMHzw+iBv7TnkcviV6PMXEm0c/ehfJmYdPQm1McLnIGN4LpgrfBpY5nF0YaD?=
 =?us-ascii?Q?XYHcvQOqdnd9znleHvHM1WF+hgN4EVPVyeXsrn93HWee3WGDG9x7EUIVuejR?=
 =?us-ascii?Q?0iQcCLVdl8GNGW3P9i/XaZBD0gdnvHswzP1fKe6b+YWpmw13q776yYmGmO/M?=
 =?us-ascii?Q?eXzXhGUz0bgks4AWmCeqIcb9Jnhn3ylyNr9SrfxO7FlNEwI9zFVe+h5oRby8?=
 =?us-ascii?Q?e4pjOh/Igygz1M6kLOwtEw6f/a87yZtlSvj2MiP0k0QB0rV0lpkQ1EpRfDIm?=
 =?us-ascii?Q?23gfJK14Zgmm+jfd5fGKPkdJmSSAq0HpIEI3pJlt/K8Tgw0xeB15BLuMiWKx?=
 =?us-ascii?Q?s0pHw+ErjJAzOoXbAOw3EAuGfuXq9YrnwiIdX362kbmGNreOZMqPLdkE1iib?=
 =?us-ascii?Q?M4ICjS4vFaiu7P6JqTYO46HtddP6l8qnZublOwerqUY+kRrc63hkAPj+DcoW?=
 =?us-ascii?Q?GhWz0dS4Uhjq9SJL5n/oQ7MoNqwJnw0RPlRpKnsY9QWNgCz6P+zHqguWWnAR?=
 =?us-ascii?Q?PHNoUaV+BNQ9q8KM9SqefCkly/YRKlRY9+9+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:35:55.9218
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec94166-b4fc-46f7-7120-08dddc43b7b7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF00021F69.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6083

With separate control and xenstore domains, the xenstore domain itself
is no longer privileged.  Local socket connections do not have
conn->domain assigned, but domain_chk_quota() will go ahead and
dereference it.  The !domid_is_unprivileged(conn->id) check usually
means the function would have already returned.

Bail out on !conn->domain to avoid faulting.  This adds a similar check
to that in domain_max_chk()

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v6:
New
---
 tools/xenstored/domain.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index 051e3fd164..c74bafa165 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1762,7 +1762,7 @@ static bool domain_chk_quota(struct connection *conn, unsigned int mem)
 	time_t now;
 	struct domain *domain;
 
-	if (!conn || !domid_is_unprivileged(conn->id) ||
+	if (!conn || !conn->domain || !domid_is_unprivileged(conn->id) ||
 	    conn->is_ignored)
 		return false;
 
-- 
2.50.1


