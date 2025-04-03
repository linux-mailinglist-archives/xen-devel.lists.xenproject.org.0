Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2FAA7B19D
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 23:46:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.937341.1338356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOE-0000eI-Ug; Thu, 03 Apr 2025 21:46:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 937341.1338356; Thu, 03 Apr 2025 21:46:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0SOE-0000cS-Qg; Thu, 03 Apr 2025 21:46:22 +0000
Received: by outflank-mailman (input) for mailman id 937341;
 Thu, 03 Apr 2025 21:46:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GOX3=WV=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u0SOD-0000LK-Iq
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 21:46:21 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2418::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 135ad057-10d5-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 23:46:19 +0200 (CEST)
Received: from BL1PR13CA0070.namprd13.prod.outlook.com (2603:10b6:208:2b8::15)
 by MN0PR12MB5883.namprd12.prod.outlook.com (2603:10b6:208:37b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 21:46:16 +0000
Received: from BN1PEPF0000468A.namprd05.prod.outlook.com
 (2603:10b6:208:2b8:cafe::9c) by BL1PR13CA0070.outlook.office365.com
 (2603:10b6:208:2b8::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.8 via Frontend Transport; Thu, 3
 Apr 2025 21:46:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468A.mail.protection.outlook.com (10.167.243.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 21:46:16 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:16 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 16:46:15 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 3 Apr 2025 16:46:15 -0500
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
X-Inumbo-ID: 135ad057-10d5-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vMwJyq38Kfn82exiLooYw0ox6OrkhIhMSdHSYTVI2fI5bWlh8ztAXGV+LmvqYXBn/HfLZeeG8ojU/Bc+X7sUSRCzPPZUXL54GJ/GKRrrS0VbCeP0c3vBx7fGmR9TFb7fgXe3VG74f4MxbLT5j8gPnUmf0+vMT3FK9zdiji4LA7l2GRYdvf7OlacBeLozO7pYMYhpCCXyIIZp+QyNscpuX9muBU53GQK2bUNTcTM53a+KPygppE59wewY0UUfRhJJFiZ3+iZEJgxe9ZKRUe7LgReGzFEkzVFiEYYznkIghglg0hg/hq7kumVc7DS7CxbMLU7sUwBVlsFCwvuvlHL3zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HIwhjfknntHy51daW0G7gVn2WkUksiIVEhJto7dMW3I=;
 b=RIUcyTW6EOQzX74SYvWFD7nNUz6PaI2w/g/Zvs2ly3UQpEjOaOSE2z2It4fKlSDogcw1qTXg33klRRMbZzogwYT/MmdA1mEsUOWonfzFbqVWz5jh0ilrklcprXJ3SLus+xwHsuqWCWgR/wuwYNwEhOAnPrXhnzaBJKd3QjErXktD0tGh6rm6fBUDHxJU/RNG4ugR3QkxiW9ktDo4x8VS8i8D+58mgffe9TAUcKECva6Kx6+mTJvHy4uK8JNz8BPzmWr8eXN2c3lNDWmgw1M1JGoGRA9sHMMvzVmXHQrSdTrnAUHQbR5zyAk6JF2jwbik68FnCkUDJPLdIblVgg2ZQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HIwhjfknntHy51daW0G7gVn2WkUksiIVEhJto7dMW3I=;
 b=zDMPJGnlCWc6DiXreBiV1hT18/9ROXNk/Rfek9W8xzvG3/2PX2n0TTZiX40o1DQhTkiTZ6A+6XyMltPng/Uo7eeslsRmJ8tAVcDNvB7L2HtgGs75U0d2jmuIkJRBVgUVtpJH5e3doU7mulCpmYhHinmPXZnObSfG2EZSAZO+p6M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v3 5/7] tools/init-dom0less: Only seed legacy xenstore grants
Date: Thu, 3 Apr 2025 17:46:06 -0400
Message-ID: <20250403214608.152954-6-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250403214608.152954-1-jason.andryuk@amd.com>
References: <20250403214608.152954-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468A:EE_|MN0PR12MB5883:EE_
X-MS-Office365-Filtering-Correlation-Id: 743ec4a8-fe24-4f99-d049-08dd72f8f632
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7LUODd+DJM4ySzKY+o7Habc7/hKMUNDAdGfoOiqeZAtji4ldFpdruLuA9GDB?=
 =?us-ascii?Q?i9TX5t/kT7C8Ql78Od8WLrD0ycRru1OLmYUdJBEFRMM6pi5WoMYNNMfoQ/bY?=
 =?us-ascii?Q?F33bMzk1sOND5f3HlWspV/c9mQrgyyVuX7kym+kt9jxEpyFOMfTpvQQfU1va?=
 =?us-ascii?Q?Iwz89nDWIYOB+z3aB5SHyiYq4p1vTlPke3nUw2LfwWy+iGeC8EUCHMOoq8WH?=
 =?us-ascii?Q?F2qZXMc+T3FWHMkqtvZvXxJgSzEUIBwvqGw5RHjaAMlX9TpvwuT/Ma0DoRae?=
 =?us-ascii?Q?JL/Qjrq/0Cdhk2HAyF5aaoNLpOB9otZTyC5LjTB9ae5+6zWV6HmJQHyuUREf?=
 =?us-ascii?Q?UM8pRhM9VHs1kYNPV1LN1pajuMIxh4+CHGLPn/VVu67ZZ5thB/lvIwajth8I?=
 =?us-ascii?Q?sIS3czOLae9MXxle2j7XpkcqvEs5TmcpK58ivpKhz531Pzxb30AGBz5JOreN?=
 =?us-ascii?Q?so2aDjG1wpqPcFqtUC/wMk211Odmm436E/v6b49GBWuiTMLti2vJJlB7dlEw?=
 =?us-ascii?Q?d+OT8RQO2xbsGGiqeGfK+xykYN6oxKzAUxDXRGBybtaZD0wFWTyB1tHiisj3?=
 =?us-ascii?Q?Yy2Tk9HLElFYUAZ2DfmBRQ25Fc3G1jZafWP9Rs9nzt9wHZpTNfpbhBrlOLtk?=
 =?us-ascii?Q?3DM42CXPLLTF8gPST0R2MBYfqBu7eVUaoj4yGXNEPdpjnMT3j8dDKHRn79ZF?=
 =?us-ascii?Q?xBVT/K03CSW/mNDrkRp/A4UVPGT0gXCum5iBn/p6a97z/qGYF3JGmIHtI7ED?=
 =?us-ascii?Q?OY/p2mSrhlgcQH6nr+GaAKMHiFjdlOYERPQPl1JBYEeXXjK9HQ0JMMe0Au/N?=
 =?us-ascii?Q?/zcBtkgErKGiQ9frDv9Axzq1nHxfIh5pt5HRacbiwJBMmrqpsJKB7j/8xqvd?=
 =?us-ascii?Q?sLqTGWyiCpzdFffj1j4jev8ArHn0fnsGTxs5Mf85Fbb6CrjBqracHdWuxGXy?=
 =?us-ascii?Q?jQatnidlAPNUmhF0FOMox98chxRU2aPAmtGS/Q5ciwO0KF0j3mU9jn6Nl3Qs?=
 =?us-ascii?Q?G6U/JLl+wV41N5AbMOQ/F+eifupkkKveryDItYCzPdNs30Gd8qC1z+VqWWod?=
 =?us-ascii?Q?DAE707M2CWpgpYn1zGFpFV8+wpwVoxY1yqqSt1/S4Du96yWKdNXgS5Z0HiRt?=
 =?us-ascii?Q?uuY+qoAFpwUozyloFmGrON8UvjuvJDGiGkOxeL8CpzbEMrnqsdHbg1xWhrYf?=
 =?us-ascii?Q?4TVsplsVTpLFF0xs6U6wo/w7a1RkrS9yv7xOvwQ/3dPmtx3DvrXrN8sB9cpi?=
 =?us-ascii?Q?liyVIQz08ncV9i0/wTE5qIzZqfL3nviWxT2byISzkszfxaWUHoXLlB8YIy/5?=
 =?us-ascii?Q?neW8r+9bgFc0vDss3LGWf+nTKbE+G16bz9FsGTmQHsNj/qK3fiTg0DPTfVRR?=
 =?us-ascii?Q?RJyu/MT3eRCO9Jd5gO9QMTWAKWUidxoF8rlumzEg9eYPJcOAIpdNJE1hPG+S?=
 =?us-ascii?Q?ll9V7zkEq6NCR9WPdiJ+JPpMIeGyvbc9wkHeWSK2WpX0Z+50YysWTq8EFXmR?=
 =?us-ascii?Q?qlq0RXSHNg0vwJ4=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 21:46:16.4035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 743ec4a8-fe24-4f99-d049-08dd72f8f632
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5883

The hardware domain is unable to seed a control domain, but we want the
control domain to use xenstore.  Rely on the hypervisor to seed dom0less
grant table entries for Xenstore, so this seeding is unnecessary.

However, that only works for the new xenstore late init.  The legacy
protocol which uses init-dom0less to populate the page still needs to
seed the grant.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 tools/helpers/init-dom0less.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 17579fe2e8..91edf17b6c 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -286,12 +286,12 @@ static int init_domain(struct xs_handle *xsh,
                 xenstore_pfn);
         if (rc < 0)
             return rc;
-    }
 
-    rc = xc_dom_gnttab_seed(xch, info->domid, true,
-                            (xen_pfn_t)-1, xenstore_pfn, 0, 0);
-    if (rc)
-        err(1, "xc_dom_gnttab_seed");
+        rc = xc_dom_gnttab_seed(xch, info->domid, true,
+                                (xen_pfn_t)-1, xenstore_pfn, 0, 0);
+        if (rc)
+               err(1, "xc_dom_gnttab_seed");
+    }
 
     libxl_uuid_generate(&uuid);
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
-- 
2.49.0


