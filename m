Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B33B37444
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 23:09:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1095129.1450241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uk-0006LD-CC; Tue, 26 Aug 2025 21:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1095129.1450241; Tue, 26 Aug 2025 21:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ur0uk-0006JU-77; Tue, 26 Aug 2025 21:09:10 +0000
Received: by outflank-mailman (input) for mailman id 1095129;
 Tue, 26 Aug 2025 21:09:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ur0uj-0006HZ-0i
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 21:09:09 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20604.outbound.protection.outlook.com
 [2a01:111:f403:2009::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e743e1f7-82c0-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 23:09:08 +0200 (CEST)
Received: from BY3PR05CA0007.namprd05.prod.outlook.com (2603:10b6:a03:254::12)
 by CY3PR12MB9554.namprd12.prod.outlook.com (2603:10b6:930:109::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Tue, 26 Aug
 2025 21:09:05 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:a03:254:cafe::68) by BY3PR05CA0007.outlook.office365.com
 (2603:10b6:a03:254::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Tue,
 26 Aug 2025 21:09:05 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 21:09:05 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 26 Aug
 2025 16:09:04 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 26 Aug 2025 16:09:04 -0500
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
X-Inumbo-ID: e743e1f7-82c0-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cNMaNmKhwa2ssg4KDbuKe0xaCNuCDW1jtZPx5qh/iONpalsAkCRgwui9qG36waMy28JrGOgsHyanAy8TI0CP1b3kWGUXDMQYh4Zu5uxFZ+TwvN3yboI7wFgoQF4cajh7R8prLL/WMpx7Yb6FO4gxrTgZLpWcpYGW1GZq/a7qIsqF55P/piqnWIoSdfDH6VBokelaHE22gFevS1coQw3mnOV6wGuKjDpk0ZD6OrEgjT61QFOmbpyvJJRgH+nAcZ1jx8y0mztDIMHptTnWWorkZvRh1MPBUw9BSIK1j6k6aX5n3/eXryZPkwenRNcV9UcOJLnCs5vP9EUy87kxfnVEVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1nbcQMEjUBeFeC495BtfRnJCx+JGQKE9Ow3xrFdZyA=;
 b=wXoPzQ2JzGgDMrkHE0GL4WUQTxXTVmg1rRrG89iak1XbfQInHr2QYMImRW64Oo+YB3mI91FbKjNXejDp3npgYxcp2KFZOn60SiccgAX9G8k0dyxOeU2uPq1yyF037+Ba/s5RQhCNX565IMr7GxEAhmgl5bNozGRDC9P6ETzM+CDafxifJ5YaVwWC47NhFOMoRv3FLFnjD+h6t+6cCKV2zjKKPnv6wUt5kBCt3pQUr1UrRbGCLqFQ4cRuiUpGl2LcGAXV+6Ceud+9ZH21Ylo54XO4dNOHhyhBa2xwBVyvoB/S2D9BzXkvsaVmUzJLtiLCEBq1pWvBNxgJfPerNstRqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1nbcQMEjUBeFeC495BtfRnJCx+JGQKE9Ow3xrFdZyA=;
 b=yBHDim6UbAwtKXv3akA7YM4AqJB0bbRGR+sYVn6qWLkO3pIiyObhU1sRNGdLvGo7O0FHYre6BHz1nGSp8zVSACKX4IL8vGc2sqs0N8q0sd/mjwMG7uVf+hzzjDfoHOqrd804fvDS7ByAlfce0c605cOj2YUu4HCRO4WmxO+5YhQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH v3 3/8] tools/init-dom0less: Only introduce un-introduced domains
Date: Tue, 26 Aug 2025 17:08:42 -0400
Message-ID: <20250826210847.126015-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826210847.126015-1-jason.andryuk@amd.com>
References: <20250826210847.126015-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|CY3PR12MB9554:EE_
X-MS-Office365-Filtering-Correlation-Id: 7d03469f-37ed-4b66-5a12-08dde4e4ca81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z/RCuerTPypvrsqVfQbz1lcJlku0auAyoz2wIcIoPdUZs++hVlybkBGAuORW?=
 =?us-ascii?Q?jJf91bqNLZwlTy/u/CL055SusKcO1deI38S1kI57Vfle4mXT7lgCpN57We2s?=
 =?us-ascii?Q?Gk9XnyYwmgfbmmOlsL1Hi7Df3OoCmEyy7yNQ68DYc+D9T/YeUqXMU9HFR/T5?=
 =?us-ascii?Q?KYFA4FsbCWArFr8dHlmhmtW1ccUbNbTZTDM54mVQm+snaDZhU2ccynQpOyXR?=
 =?us-ascii?Q?kiApE25FpEbd6Tv/mHMHUD2QGO0V4ST9NbNldNPBdyYzL0wcxuQlbgGVT9PD?=
 =?us-ascii?Q?LDxfeQnQ42J7tImYsh3XSS9wJWGIvBvpDoIzXpf0uHtr1z9JzvPp7y3W2QMQ?=
 =?us-ascii?Q?HVLPKMciqspnvHpV8PtRSVCFn4OPfmBLM/W7jmo8raWIBWfGTAebhEtKC4LQ?=
 =?us-ascii?Q?gZJxStbUbhi34EkYhMr/A72vfUmyQ+cwtriCM0vQlNHJr/Y2i7hpgi0H1F3Q?=
 =?us-ascii?Q?ZydmsXD7UNIFPg/PwWc2DIGyQpZd0SUjl2Sh45EPnFnryc7Rbx7A27HXInse?=
 =?us-ascii?Q?HHmZeiKLKIyoy6lDqiZp1syHTtV0ap4UtY2kKNfl5TzSU8HwU33FmXR1/KsJ?=
 =?us-ascii?Q?/RSbmbiyzvmmbCfx4QvzUef29JjQQ7eqDXaTob3EWX+PrmHdr42kIlBOqnjD?=
 =?us-ascii?Q?ynAIhBxo6uYEECfyMJgdZDPxi4pPWjXsYDsY1Pr6uZ+/lQ9VBJM5F4nc7a5i?=
 =?us-ascii?Q?BgGtcYUj9f8sbY1s2WmJdFXPy38Jou5RLMl6CEgaB7PULkgwOAz4/bRGYZav?=
 =?us-ascii?Q?+lpicGCuT06EVz88cCEhS29lXQVgw8FB5BA/Hz2zGkBr7nsXCifus3FxVWfC?=
 =?us-ascii?Q?RGpxR6yp41qRM9G0CVarjorD8gjx9z5v8tpBW9zAtHOKtUvWm7cIONBr9jnY?=
 =?us-ascii?Q?M3y1AkK3bEPBAOAwHI08qxlpAB2CQ2mItuXFxMd/VeA8uWMOgYg6vucvdhhj?=
 =?us-ascii?Q?XM66DhH/Z4byzojmiEfieuH5LYsT7wzegPIIqtp88/rmP5WJ/tAT5dqFhpOX?=
 =?us-ascii?Q?AfTSTSD5ld30kwUCphxHuf1UJTNm2w4LYPlMgngambGiL19L6icBoX1/bd15?=
 =?us-ascii?Q?ltGUCgyrWPvFkHWgmVdBBn4rXSHCWfXC7kO75nqWUo1sj3l1qoSl6S5X4lDn?=
 =?us-ascii?Q?w7H6/JQ7G8xvJzJU2jGenJI52lSF0uxiKcP87rnrj39UpHCvrjush1nq1TQO?=
 =?us-ascii?Q?RJK1u2wJWgme1vMEydp27EmKxptBXWMGvFqnu3bSxCH+p9Sau0UzADtkZf7b?=
 =?us-ascii?Q?/LRHBTxE+Gw0jKPbUsHwk9RSYUc7GDur0lTwIWkev8NuDVC7T9voG5wfPveO?=
 =?us-ascii?Q?DDybruWlujDwfgqCcimvqjEtWrfHgGcdawYLvH78AUyBAnHBxm5+0fiTJPot?=
 =?us-ascii?Q?JlHyCdBnhRIwcTavyM2UJz617lYamyAzLM5gbZv4edK/jkbG3ec9+6Fg5DNF?=
 =?us-ascii?Q?JZUZYA2dbycrY3C9K7zufy91DNWzwm8/8vKrTecmIZkOb/1H7NoXiTFd0z4C?=
 =?us-ascii?Q?aF/7afEozqommJhym51sn9diPItjeS+zW+s5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 21:09:05.6275
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d03469f-37ed-4b66-5a12-08dde4e4ca81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY3PR12MB9554

In preparation for supporting already-introduced domain, only call
xs_introduce_domain() if a domain is not already introduced.  Their
xenstore entries will be written, but the xenstore introduction is
skipped.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Reordered
---
 tools/helpers/init-dom0less.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index 8de8e44ad3..3906c4b61a 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -319,9 +319,13 @@ static int init_domain(libxl_dominfo *info)
     if (rc)
         err(1, "writing to xenstore");
 
-    rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
-    if (!rc)
-        err(1, "xs_introduce_domain");
+    if (!xs_is_domain_introduced(xsh, info->domid)) {
+        rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn,
+                                 xenstore_evtchn);
+        if (!rc)
+            err(1, "xs_introduce_domain");
+    }
+
     return 0;
 }
 
-- 
2.50.1


