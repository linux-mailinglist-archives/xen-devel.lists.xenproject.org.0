Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E95EA9B9D1
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 23:23:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966922.1356972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u842k-0003aK-3q; Thu, 24 Apr 2025 21:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966922.1356972; Thu, 24 Apr 2025 21:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u842j-0003Xw-Vr; Thu, 24 Apr 2025 21:23:37 +0000
Received: by outflank-mailman (input) for mailman id 966922;
 Thu, 24 Apr 2025 21:23:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s25R=XK=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1u842i-0003Xq-P1
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 21:23:36 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20621.outbound.protection.outlook.com
 [2a01:111:f403:2418::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5fe9a041-2152-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 23:23:33 +0200 (CEST)
Received: from BL1P221CA0028.NAMP221.PROD.OUTLOOK.COM (2603:10b6:208:2c5::18)
 by DM4PR12MB8449.namprd12.prod.outlook.com (2603:10b6:8:17f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 21:23:27 +0000
Received: from BL6PEPF00020E60.namprd04.prod.outlook.com
 (2603:10b6:208:2c5:cafe::8a) by BL1P221CA0028.outlook.office365.com
 (2603:10b6:208:2c5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Thu,
 24 Apr 2025 21:23:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E60.mail.protection.outlook.com (10.167.249.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 21:23:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 16:23:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 16:23:26 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Apr 2025 16:23:26 -0500
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
X-Inumbo-ID: 5fe9a041-2152-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OnOJckFFF+o7Rh1Y5RZFqUpHq8gChVwkaCsjuIlCTvC7tpWDO3i0LEEhTwotkGF23lW61afK+j36N2Bsb0iPt2zRBVV/mTMRnCuwvH4m2EBJbLt93ya2Q3zRqLquVD4IFjqSU/fdaZqeUtok9duXG1tjxcLcIVU3ZMNWynkgtPBelfyreCm/M9ObhoUVDVWqkZqEKwQ3/JNI7sCVXzdcHo8gi7DZ1VwZMmvXSltpFx8GpCXUKZXSTDy7qFf5QIPaiJdK6WddZ0LGdI9lqO/mPPWmOwyyhH6D8VpIlagXT2w0Oze/aIo0XeFgQDUWvsP7Y8j+Gd3RzjADcYBlHY8Adw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9n+bNQDT/oPUTcJYcm2pOLXgc4BFunl53RhuAfD3QkI=;
 b=CqWsQYBAUoCXfYljvWOTedCo+Ti1LuhyQELlPjKezlKeqat0Xm+sfF/ZoiIiTwzKx9HLplT3K5vMjqhACjZ8j4keOiO8QmQ8ybOal+AYLojYy0VT29qiq7JGBGvQDCv6FfSR4IUu0eVnGC3DNPC/4vTvnYl5OnRTYm4+jpHXtRrnQSwS7WOZLvDCsBicBQ8X8qMXZFX5Qs/gL6vu/4isIZZzeQx/3Zzx5fVtpU2ZH55JqoyfQ3UM/gkSOPTgI0EfOEFtGlfsr0wbc8VH6LNvX/E+J4BrZzMnV3KdkRJB3zlolDgFpjvpDuNVQh8f9lLSNCjN6sSKLq6IkfjmyMLqKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9n+bNQDT/oPUTcJYcm2pOLXgc4BFunl53RhuAfD3QkI=;
 b=OlJUXhEVlx3XMjKQEMrjRZQ0BGFctwT3uixaaCjMf6YKtR6DnUK1JB5a2OMGTWuO5XUqlJiH5iR3Epg+YJYxFQ5OXiExYqMyMijPo29TLwTzHiWg+6brdpcc3Zd0YzU9dzsCwkuVqOB2bkIvguM0srd33Qb2bqrjQzJu45ytlS4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2] xen/vpci: Fix msix existing mapping printk
Date: Thu, 24 Apr 2025 17:23:26 -0400
Message-ID: <20250424212326.151403-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E60:EE_|DM4PR12MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 25ef4734-a6ae-48e5-6495-08dd837640c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oyq/J74wXKCrOm6aPVt/vqy2I6KV43ZG3iNSTUJAUmFD+qQ822VSP/tg1CC/?=
 =?us-ascii?Q?Hzk95peR4vrdzvF5HynQkvOt+CauCTuxZPa/HH/tDSFLP7dGovcH6C97SJ1V?=
 =?us-ascii?Q?0+F1HSIsbvH+D86s2fwUW9AwjHYLT2rNznGvv3h/bsSwycY8iBOzIPwJ2Guo?=
 =?us-ascii?Q?oWIyNkaLpkJ7z3KUZpPcvCZtQ8xqOA8NwT/UB8cAxlIj6d/yRhj/dWiQtl/G?=
 =?us-ascii?Q?kPyqN5KSHdGXM+EtyhtZMgcdScqe3XrEV/FtYvZ4B7X+T5f5JeXLDMCH/d7g?=
 =?us-ascii?Q?Fm0EhFxOaiizoiwwbiEYlamFHNLmpXd6mlrf8rfG4W7qtdgXJ86hD+/MgZcI?=
 =?us-ascii?Q?+jwL3QJI8ls9bvYIzJSQwZOQdduWOLPNLUT/BwTjiufMVUvRjFumkzLYHxOk?=
 =?us-ascii?Q?ecZu2mZYM0TePOVnO2gIXz5tPWvExIY381CqQlaq9Mv1XQ4xzDWb6CLIUj6E?=
 =?us-ascii?Q?36rKZ56J89xhWpUMsgxm0X3/WuJgXdSJf/CzE6xaNhV8Ya67JvMPu3aFNES3?=
 =?us-ascii?Q?m1440FTft4mvo+olRO9LvedRygCqceNRn6LQxzll3CdfTQCa0laXVpdBR8Zy?=
 =?us-ascii?Q?kda2xd6AMEOo52Dv1pe77tzPIZsxo1j/eVBQ2WmxlK19vYq7tvRN2KISfhQ1?=
 =?us-ascii?Q?Ks6HYcgRsval2rmGMRiMdiDzyXWCMtBYKV3XxSaQCwfeFhwusCIWzDmbBXdV?=
 =?us-ascii?Q?Vm5Fx8fdFxDXrxzpgDbhPMdkTLJSBAFBwUf3Ra6cRfBpirpYCc4ebX+yN+Ci?=
 =?us-ascii?Q?hmXquQ5O5HNHIPDDvwv459+2BrZeTzNZRLBL7W9y9J/EMPCr0ZcvMFoW5iYC?=
 =?us-ascii?Q?AFbG2hH7sr2qX0cgSfK3pdWObiVrQ4LaSNTQY01wFfnP3u5sN25bqnESv74D?=
 =?us-ascii?Q?cJwav/2r8MuLvKxm5H7VYgYtWL8rCQeHl66cz+C9E7kvyZf85ld1ZuaJDbNS?=
 =?us-ascii?Q?BKaCtyYJysRADnHrbuffqIB6oSVLOGtobKP0IswY2e566uGXKNfj8rrhXaRS?=
 =?us-ascii?Q?eslqAywLr3/zPA3zEUPE2cp1T5saLdVEe+g6i7frwPo0QiJGv5l2IBjpWqAB?=
 =?us-ascii?Q?BN0Ajh8dHohBQS9sG4/qAu1J32MvnRa1pyBcrOr1Nf7cjSj5UuNA34JsEC0Q?=
 =?us-ascii?Q?2qhuWjqExpn4dYU2lP8nnewVRpat07G/HqJqmNKwNaFoJN781h8GYZsFIeM7?=
 =?us-ascii?Q?8PslEI7qJyBSFYipx9SsHoKcJ4KBiVfRbnpcdSAJienIZrbJ1kv9O121MK3W?=
 =?us-ascii?Q?NkH8iHHXxPfV2Gs+Hz1regTwAETw1hhqd2LgftiX9gyqn1pzjGjF4tt6OLa7?=
 =?us-ascii?Q?C6UhPq5LZ/sMvnwYJ3C49kNcOgq1ZZAjrZYX0mILcl5XZIi2ZpcbFArsgulU?=
 =?us-ascii?Q?by/xf/fh4M9cCfFgBL0ChCnc8KRjl4UihayaVKyK5qP5fHtqPP6GYGIjKc8F?=
 =?us-ascii?Q?wfjqv0QdX1If7zn7qURYF+3wTfq4cssVw3ygc5tIOavcmbsHrpxPjz7pvvH+?=
 =?us-ascii?Q?w2qoM/feImgXS250MLOhUDBzgERFGffWLlVu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 21:23:27.2485
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ef4734-a6ae-48e5-6495-08dd837640c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E60.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8449

The format string lacks a space, so mfn and type run together:
(XEN) d0v0 0000:06:00.7: existing mapping (mfn: 753037type: 0) at 0x1 clobbers MSIX MMIO area

Add a space.  Additionally, move the format string to a single long line
to improve grep-ability.

Fixes: 677053fac17a ("vpci/msix: carve p2m hole for MSIX MMIO regions")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v2:
Use a single line
Add Fixes
---
 xen/drivers/vpci/msix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
index f3804ce047..3568f2a651 100644
--- a/xen/drivers/vpci/msix.c
+++ b/xen/drivers/vpci/msix.c
@@ -665,8 +665,7 @@ int vpci_make_msix_hole(const struct pci_dev *pdev)
             default:
                 put_gfn(d, start);
                 gprintk(XENLOG_WARNING,
-                        "%pp: existing mapping (mfn: %" PRI_mfn
-                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
+                        "%pp: existing mapping (mfn: %" PRI_mfn " type: %d) at %#lx clobbers MSIX MMIO area\n",
                         &pdev->sbdf, mfn_x(mfn), t, start);
                 return -EEXIST;
             }
-- 
2.49.0


