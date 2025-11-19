Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E5FC71576
	for <lists+xen-devel@lfdr.de>; Wed, 19 Nov 2025 23:47:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166460.1492988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLqwc-0005o0-6L; Wed, 19 Nov 2025 22:46:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166460.1492988; Wed, 19 Nov 2025 22:46:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vLqwc-0005mO-2Z; Wed, 19 Nov 2025 22:46:34 +0000
Received: by outflank-mailman (input) for mailman id 1166460;
 Wed, 19 Nov 2025 22:46:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=y3JJ=53=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vLqwa-0005mA-NR
 for xen-devel@lists.xenproject.org; Wed, 19 Nov 2025 22:46:32 +0000
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c10d::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94f3541f-c599-11f0-980a-7dc792cee155;
 Wed, 19 Nov 2025 23:46:28 +0100 (CET)
Received: from BYAPR06CA0052.namprd06.prod.outlook.com (2603:10b6:a03:14b::29)
 by PH0PR12MB5678.namprd12.prod.outlook.com (2603:10b6:510:14e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 22:46:23 +0000
Received: from CO1PEPF000042AD.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::ea) by BYAPR06CA0052.outlook.office365.com
 (2603:10b6:a03:14b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.10 via Frontend Transport; Wed,
 19 Nov 2025 22:46:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042AD.mail.protection.outlook.com (10.167.243.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.9 via Frontend Transport; Wed, 19 Nov 2025 22:46:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 19 Nov
 2025 14:46:21 -0800
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Nov
 2025 16:46:21 -0600
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 19 Nov 2025 14:46:20 -0800
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
X-Inumbo-ID: 94f3541f-c599-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D6pdPn0lX0G72L/NgQ972YX2rREjmPusC6fo1HPQmDBnRa3T2XEZzpQ8hbyABGl02kOnZm6ixrYWpbCvwUyB2lxfm+sDmbd5idPJl0Y1dBIiRV4wNjJbY5ix7STxOvDjuKCpEr5xXCZHJVau8U+U7n1I0y/0fkBbldJ3D471Qy25DkC+w3EY/rQ+lO9076atq1sjkLt2JM90XJhfZWZz9g/Jx3rQyYUiBZgBF3v8s/x9ALP7wNUS/v6GH0HUH0GH7NtPkauVnGqyyASLHGws+Q7FTFVamABmlc+ps4p53SdLs5QLA3ZSwiOf38p3eO/5pt+UkG68opaZ5LQnuZfkDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Jc7jSgi9oFlLTE+/8M413tkZoZeYTb/nTYdwbRMV2g=;
 b=tYZ0ggGNGpZRRhCx9FmcIhQXqPezyiNsZVSB1wnPINmFhEd5E/JaDoyj/2F5ayl6cEGsy/c0EkqAlTtAbOrN4K4z54wDpzSn5Sh+joT3T1yGIDVH/bZQ4v7cXwvkrtTw1umQ5hrvsW6DlkWfz4KT1KsIJiqZs6UJUFirjVT958o8wBAgvtYq7rloGEJZvUJBetSq6WZypU1wPQ6wVOM2x0DT1oTWdd0GNw38lM6BOavO8wYMBSEqmws1q4p93pcElI3oUQOi4M3RiQqh4jpQz5kmYDGX5S8QkalwOmy6tmTYGsbebFKRwYHGiDRrqz6ck6vrQLA8lmgQIYN3FZyRpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Jc7jSgi9oFlLTE+/8M413tkZoZeYTb/nTYdwbRMV2g=;
 b=5JkRGdIblZPIlG2oz9dHJR0iSCYwKInmzazb+thN2WwkJHpYVA5daXXkAmmO6rnREFtVxPOxgNGdW4hVllc9htiYkyPFb19Q8+xj+xKpXSjJX5nLQfOJ0gysaDAvd4g+pHqmcf5TulS/yHZvf0WlKOXhsKevkQg3jpVfJTKUP6Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>
CC: Yann Sionneau <yann.sionneau@vates.tech>, Jason Andryuk
	<jason.andryuk@amd.com>, <xen-devel@lists.xenproject.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] xenbus: Use .freeze/.thaw to handle xenbus devices
Date: Wed, 19 Nov 2025 17:47:29 -0500
Message-ID: <20251119224731.61497-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119224731.61497-1-jason.andryuk@amd.com>
References: <20251119224731.61497-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AD:EE_|PH0PR12MB5678:EE_
X-MS-Office365-Filtering-Correlation-Id: 67d5c2f8-24c6-4b04-74fb-08de27bd76bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Id+LCTrbsvcX2IT4nFK94uUOT9WKUd/RkIDBFYYJivl5sO2z+OKDnw7zWpyu?=
 =?us-ascii?Q?H+AmhBresYelwRY7jD5eoKhK+aJDRGZ7+xgyH4s8tH9hE2rurkZFlbkJlWxx?=
 =?us-ascii?Q?mDoPJmHy6Ds3AKzn9DbKuy/PQHoycyT1UzJNM2C9TX3B8F9CU77+7UeQrx/5?=
 =?us-ascii?Q?4T7YyL1+ET8nVgHhFvStbolk36cDxsgiLibQlU5BwwF1AEVyRdhro4TJ1RjC?=
 =?us-ascii?Q?lh00U+ZUf8CnoooFGD/SzJ/PRCWWmkuw3KAusBhE3f2rAV3TwN/jrMJGj4vS?=
 =?us-ascii?Q?RVaw61SsYpBY1IyLU+cZxnjl/NC4CFmtgR6bUc4V0jnmmebb7/EkFwCXbeOO?=
 =?us-ascii?Q?8d+XIxWEVmlAEZc2euOvKx5uCuDBZ3qmzyciwJzwdFNuqFYh8ayx5/Z2rzg/?=
 =?us-ascii?Q?4tQJZ2h0/mdrxcxhqAG02ZL5gvMVuzaDdP8Gbd7F4VSfMWHfAbFUrPGB9IwI?=
 =?us-ascii?Q?TLboR41ueiZMbualhHjAZOU9DBWSbcfjIV+Id95srOpumMTZ+F9S2sCAfymp?=
 =?us-ascii?Q?mFOU4LiW0iMnCcPc2n4IOew8kGHMhQZJB3kVIdzDzDjyNlww5Ltbna5ESSl3?=
 =?us-ascii?Q?YWgnvD7qVuhNpW1UcQOJfaGLpxz4WIoCGspge9UBXUvCLeDok8UQOI85lfBT?=
 =?us-ascii?Q?IOkERW0yAwlJ87cAt6XKotZlz0mSjmjUKI0gsRFU+OWf7M+5IHXbfstGmQVa?=
 =?us-ascii?Q?yKNNlOGRIQqD4bSGA15kAT1f5qt/XIdyWHkk+aISzb7DxpD0eDEf46DcIq7Z?=
 =?us-ascii?Q?9CXAW8BTsxym4JYtasvvIoa/mhCO1+lBi93syQTPVFfLj7N/r3Fip2qE5OzR?=
 =?us-ascii?Q?dIF07zuX82H4wEi6MZmw3yeLCRzJcDNLFqv+yzqNdz74mid+qkBzHZ1VBVqu?=
 =?us-ascii?Q?tH7Cu6tyHIzvUZ08/W9OmINLcvWiv6q6BO/xn4pvVYXaItPJ//hLZfLeG+Lr?=
 =?us-ascii?Q?xq+2oovPlBYIZ8TPEEZ1jj3Xm1o0blcNYCzOvjy5VhxJyWKd3U8Ad8Cb7yoL?=
 =?us-ascii?Q?LEV//q4/It+diT+DW3rgnekHnKFFDI9xLyx32CC4GkUCbtMCUQXBOJrdBLIT?=
 =?us-ascii?Q?AS9oGQeZ/9Ega7kqfhoPVLH4Vmn3o3XsYNupq/TsAOeIw+STwxNb4ZBlgHSy?=
 =?us-ascii?Q?uEFb7ZzuKdGTd9oH1txuym0OppzyRnuJ/dY9PykTI0KrcC5qF5KPx2cCcg0L?=
 =?us-ascii?Q?1irkg5SSGxbhVTMDW9YSQ0o1fE+0bjb8Yq+78ObwXVgT+qNo82p1bbjtOWeA?=
 =?us-ascii?Q?3Hq9+H5DaV+0xzL2BP3Q1cciquydvSm/6mXaOBRBlaFcNy2EHfOQdRz3wtfG?=
 =?us-ascii?Q?DXXy2b4TjNnsLOZyA34ofh5lVGMC0LzJalYB23/h4UVSE2AqvovCpvnfvc3i?=
 =?us-ascii?Q?Nx0MIB3DVCKr+gDx0qjoKHIJGrXOXnoPkwfUZwbPHXXtNNMiQ7clX5bXIyga?=
 =?us-ascii?Q?MHgZv63KU3O2p+cLoZKirANsTNKzuqzkXtd03xS4A+2PYzCHkXfp2s3QzoOI?=
 =?us-ascii?Q?k53GMk10CxnGdIYcReVNeVkcGMEti2iHthlM7lZOp30QQa6AqdS8/0Ae4FXM?=
 =?us-ascii?Q?XOVBwATEqcjNA1K2JaU=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 22:46:22.6215
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 67d5c2f8-24c6-4b04-74fb-08de27bd76bc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5678

The goal is to fix s2idle and S3 for Xen PV devices.  A domain resuming
from s3 or s2idle disconnects its PV devices during resume.  The
backends are not expecting this and do not reconnect.

b3e96c0c7562 ("xen: use freeze/restore/thaw PM events for suspend/
resume/chkpt") changed xen_suspend()/do_suspend() from
PMSG_SUSPEND/PMSG_RESUME to PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE, but the
suspend/resume callbacks remained.

.freeze/restore are used with hiberation where Linux restarts in a new
place in the future.  .suspend/resume are useful for runtime power
management for the duration of a boot.

The current behavior of the callbacks works for an xl save/restore or
live migration where the domain is restored/migrated to a new location
and connecting to a not-already-connected backend.

Change xenbus_pm_ops to use .freeze/thaw/restore and drop the
.suspend/resume hook.  This matches the use in drivers/xen/manage.c for
save/restore and live migration.  With .suspend/resume empty, PV devices
are left connected during s2idle and s3, so PV devices are not changed
and work after resume.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 drivers/xen/xenbus/xenbus_probe_frontend.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/xen/xenbus/xenbus_probe_frontend.c b/drivers/xen/xenbus/xenbus_probe_frontend.c
index 6d1819269cbe..199917b6f77c 100644
--- a/drivers/xen/xenbus/xenbus_probe_frontend.c
+++ b/drivers/xen/xenbus/xenbus_probe_frontend.c
@@ -148,11 +148,9 @@ static void xenbus_frontend_dev_shutdown(struct device *_dev)
 }
 
 static const struct dev_pm_ops xenbus_pm_ops = {
-	.suspend	= xenbus_dev_suspend,
-	.resume		= xenbus_frontend_dev_resume,
 	.freeze		= xenbus_dev_suspend,
 	.thaw		= xenbus_dev_cancel,
-	.restore	= xenbus_dev_resume,
+	.restore	= xenbus_frontend_dev_resume,
 };
 
 static struct xen_bus_type xenbus_frontend = {
-- 
2.34.1


