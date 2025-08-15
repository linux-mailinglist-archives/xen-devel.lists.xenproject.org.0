Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18116B287BD
	for <lists+xen-devel@lfdr.de>; Fri, 15 Aug 2025 23:36:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1084090.1443568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25r-00079S-EX; Fri, 15 Aug 2025 21:36:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1084090.1443568; Fri, 15 Aug 2025 21:36:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1un25r-00076h-8y; Fri, 15 Aug 2025 21:36:11 +0000
Received: by outflank-mailman (input) for mailman id 1084090;
 Fri, 15 Aug 2025 21:36:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IuPz=23=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1un25p-0004xK-AA
 for xen-devel@lists.xenproject.org; Fri, 15 Aug 2025 21:36:09 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20610.outbound.protection.outlook.com
 [2a01:111:f403:2415::610])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d99759af-7a1f-11f0-b898-0df219b8e170;
 Fri, 15 Aug 2025 23:36:07 +0200 (CEST)
Received: from MW3PR05CA0016.namprd05.prod.outlook.com (2603:10b6:303:2b::21)
 by SJ2PR12MB9212.namprd12.prod.outlook.com (2603:10b6:a03:563::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.18; Fri, 15 Aug
 2025 21:36:03 +0000
Received: from SJ5PEPF000001EE.namprd05.prod.outlook.com
 (2603:10b6:303:2b:cafe::c6) by MW3PR05CA0016.outlook.office365.com
 (2603:10b6:303:2b::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.7 via Frontend Transport; Fri,
 15 Aug 2025 21:36:03 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001EE.mail.protection.outlook.com (10.167.242.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 15 Aug 2025 21:36:02 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 15 Aug
 2025 16:36:01 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Fri, 15 Aug
 2025 14:36:01 -0700
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 15 Aug 2025 16:36:01 -0500
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
X-Inumbo-ID: d99759af-7a1f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qcbn4taXH5N+gmU7zSCkzic2vVK9BfbjPL0GPbXGM5OYPqJ1P8/p8On1svOLLNO7L7ycHflBmauwSB/BgQ1SUKqAdk9dEDNEXXUQoe2I7xaIHf0Ab/21EBJKM0AnRpvFL5dOjAwTwjUicaDOlilEpSWv9LwCkYfTMB4ioVn4e4gje7mq8J7rnsyHmyuRbgmFlEix/OZ1tlHsJ1aU1laIxSzCZ5BDj+0YRCXrtdYV4qQ9jVKAaurApdrYcPsL7+ZLBoYvXiE+mHR0y/ipOytViNB1U9uxuuMJuX8mMJmeXofa9/hombCM461FuaC/HK+CITLzMFhVZe+rwz+Rz4mBxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6o2KKFuYGe9DCLPgWqQt6Y96aL0o/a+ZBCaV0wZywVI=;
 b=QdfTS1pOZKvD3B5eEzws+XGpp/6yagNXfnA+ee1tp80h9BNzBNWfbS/j+9A7cSlfgo10b12QVbjD5jelWlciQbt8jevb1o+hievnYDjASqsLnLa+acskDmdhkwJroTlU4p8vfpGC6/5B2pbDDJA9h+A6tN9xnW0IdpOl9JtG6XnxGGhykxKTIgoFUEVriqHLRSeGOlAWii7ItVBJsMrmW3zJes4ZdgtrQPrk6nIj1SvvvTaiQIi4ZwXWkvlX5r9Bg7rVIcwMZrIVIALNdB8yGn45f8vIS7quTec/3F0aTzrfK6NhID2NUM5yUYh4McN3kxSAaYA3sM1lrvtvVTpbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6o2KKFuYGe9DCLPgWqQt6Y96aL0o/a+ZBCaV0wZywVI=;
 b=QrcbNczmLlt/dQJkc2UClJq0G4x3O6PztXDJIS/+Uuh9mdAafk8WNp+fqupoEsut40ir3hoy9LMpPY8bWvcllZmLQLCSAJhbTMUOOuN2N6x9ErUkbCCI/xW9agUoDOTp3mCveMy9fTco+/QPLWIfWxvoqUaEUtckN8Oo1CndAr0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Juergen Gross <jgross@suse.com>,
	Julien Grall <julien@xen.org>, Anthony PERARD <anthony.perard@vates.tech>
Subject: [PATCH v6 8/8] tools/xenstored: Remove hardcoded implicit path
Date: Fri, 15 Aug 2025 17:35:56 -0400
Message-ID: <20250815213556.90068-9-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250815213556.90068-1-jason.andryuk@amd.com>
References: <20250815213556.90068-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EE:EE_|SJ2PR12MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 86644da7-bb35-4510-ba7d-08dddc43bbdf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZYjBAGuKHmy5E0NsrK2wEaSwu03icErZ/yPsLpCo0GOPXTkroJnh9b7DrvG/?=
 =?us-ascii?Q?1/xxl7gyZmFW4x+8XRTiB8aUHqD6byaWBzpR3xG5nppbe9YqHyfY3AhbqbX1?=
 =?us-ascii?Q?WpcyfeLiAOpxJeWVpsqrxf9qo3knptIcRjQ2ZFyusvwhJjQSC+J05ii5BDo7?=
 =?us-ascii?Q?VV67hUWr2YRjqOATXmoPetpqex/64w5Uljdtm/2F8ZxeVCu7stv/wijkQ3Ti?=
 =?us-ascii?Q?mIA48effSlkwzWRWaqiPkzFIUav7yL6Egd4chyVUVPbLYZ1KSO5oRyQSyYKQ?=
 =?us-ascii?Q?mSfFF0xWXVAfXsvbVGGRpmwIY7lxDnjuYS9UrFkbwc2ZobakF3zOc/kVWVqS?=
 =?us-ascii?Q?njUJmq9l5sR16wP7FF9NJqeK85M0PQ19sQoSbDk4h0ND3824vTL3+QCvpfJE?=
 =?us-ascii?Q?AYvupKQa2gEDOsi5jlzqIrhrAooCBhEv34Op/g/uAGbfrOwNoo5X7bjboSfC?=
 =?us-ascii?Q?3JQlvM+qYemu+khEuzz7LTI84ZRSnhcu+JylNCtrEAU8Ba3eNuBMU2GS3zfN?=
 =?us-ascii?Q?qBoDY4AUEQWXuF9tkm+WO/Gj5pYCm67t6pSntLOsCt1i8PxXXiBTxxmQglYH?=
 =?us-ascii?Q?STSLOQWpDZohIFbUNjimn2XMQ6bepSIxEuAJIqpz24A6rw06wiHGfhjhV4oB?=
 =?us-ascii?Q?S13yKAgqr37WoGrRbOA1JWFzhE1mbNbUxBEX7Qwnj/3dU88F0Y1VJWebgpjb?=
 =?us-ascii?Q?CpooKJSOQw6q5qghwtAXCLU8fMBHeoRyZNX0vAN+bOfASdUSthSH7aCcjDi/?=
 =?us-ascii?Q?D8DTLLB16veEmahn/j6CYN0RN5AgXD0NynaWllBNOJ00YQbC0xPFnqjrxUDF?=
 =?us-ascii?Q?h6I9EJwWHtdhv5eB2cZiYNyPZbT97pBpK++p/UhmFKzUpHCAd5Seqy4rd9Do?=
 =?us-ascii?Q?aRDj5HaBj0zo/ZRYjqxI8eGbjL4to2DWR0tDDP6wojOAMJNp8FqJ0ZPXb2Cc?=
 =?us-ascii?Q?uQRuNsZJEGEEvlrD9CQ42JUjaxhnqahl2aeZPTxh1cmOc4upR18jJbhCQBL3?=
 =?us-ascii?Q?9YdoT1XO9AMzPwztl9E2dzFBZYgYyk0qii2xNXGbVQjSUiCnrbUpHnBuTqgE?=
 =?us-ascii?Q?GOO9tJ3COMDQRXQCIaZBdrurDeRpuJROM5UHXamYsGqjfddDPmkk0EiYV+n1?=
 =?us-ascii?Q?xaZqF3PuizQRuZSgcy/g57DrIlFQI1wKdAFy6NAqVVIhkSjH+zgdHOQjbNEp?=
 =?us-ascii?Q?Fd5WbAihY510V7IOL35sxrPS4N3AYUMPetOdhCRLPFHF1BoHnNv65MrlO9FO?=
 =?us-ascii?Q?EwMfYiTtBZtkgP9JbavwLvIg7OGKRpV3ElfsGy1/wber0ow7v9KzsZsXkrR6?=
 =?us-ascii?Q?AGVGeZvIj4vc8O898tKFUhr+BMO8mhyGW0qfMggzwbeA1D71ZyevuqdHyPyf?=
 =?us-ascii?Q?6YrbxwF8R0n2QnlaiA7Cua7awNs3plQRU2B5VS8fjTZoh6+B2KXFryN+nAl5?=
 =?us-ascii?Q?7ibvGXkm98XmE9xI1yftIxu6vfVMJ55XbkNUzqXzvV/iZ0nTWLImNk8NVDq9?=
 =?us-ascii?Q?1Ko3PSg2fyryVnUGCWybUvJofj8NcYmCfOzf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 21:36:02.7648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86644da7-bb35-4510-ba7d-08dddc43bbdf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EE.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9212

Update get_implicit_path to return the correct value for a non-dom0
xenstored domain.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v5:
R-b: Juergen
---
 tools/xenstored/domain.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/xenstored/domain.c b/tools/xenstored/domain.c
index cf5a54965a..694d68670a 100644
--- a/tools/xenstored/domain.c
+++ b/tools/xenstored/domain.c
@@ -1312,11 +1312,13 @@ static int close_xgt_handle(void *_handle)
 	return 0;
 }
 
+static char store_domain_path[] = "/local/domain/65535";
+
 /* Returns the implicit path of a connection (only domains have this) */
 const char *get_implicit_path(const struct connection *conn)
 {
 	if (!conn->domain)
-		return "/local/domain/0";
+		return store_domain_path;
 	return conn->domain->path;
 }
 
@@ -1386,6 +1388,9 @@ void init_domains(void)
 	if (store_domid == DOMID_INVALID)
 		barf("Could not determine xenstore domid\n");
 
+	snprintf(store_domain_path, sizeof(store_domain_path),
+		 "/local/domain/%u", store_domid);
+
 	/*
 	 * Privileged domid must be first to setup structures for firing the
 	 * special watches.
-- 
2.50.1


