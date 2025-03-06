Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C6FA559F3
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 23:40:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.904166.1312127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJtO-0004wN-Kt; Thu, 06 Mar 2025 22:40:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 904166.1312127; Thu, 06 Mar 2025 22:40:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqJtO-0004tz-Hr; Thu, 06 Mar 2025 22:40:38 +0000
Received: by outflank-mailman (input) for mailman id 904166;
 Thu, 06 Mar 2025 22:40:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqJK6-0000Ss-Ff
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 22:04:10 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20624.outbound.protection.outlook.com
 [2a01:111:f403:200a::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ed4a76af-fad6-11ef-9ab4-95dc52dad729;
 Thu, 06 Mar 2025 23:04:10 +0100 (CET)
Received: from CH2PR04CA0021.namprd04.prod.outlook.com (2603:10b6:610:52::31)
 by IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 22:04:04 +0000
Received: from CH2PEPF00000148.namprd02.prod.outlook.com
 (2603:10b6:610:52:cafe::30) by CH2PR04CA0021.outlook.office365.com
 (2603:10b6:610:52::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 22:04:04 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000148.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 22:04:03 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:03 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 16:04:03 -0600
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 16:04:02 -0600
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
X-Inumbo-ID: ed4a76af-fad6-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4heVTRoCaIPkh8WxY+fu/KCScys07aGovr1WtdUQVPPY4wWBzdrbQHp11+qduIaT7VlD54hZYUe4bbnuAIUrJAS2PnsfUjmg5oAeZ4gVgv9Iu3JTunN2PvyV1bE+cHBiXexj4jgpMgNH4OKnbkrgR/ocupKI3UyW4ioXdhua2yBuPpXqJEN49bGTmTC07Mh9pMTxXrmwBg5lGKqXQ+5/9dU3F3J0Py/dRKhwkTy/SP36/yXhqWJVtVPUO+UIaF6O9YKbyrKDC4+VCBNV/s8TpwxdwvPBs+AwmPF8EdnPKZyvAmHVZErnpBJL07PiqSPIR8zgRqr5J7iYRFHXPeWyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+wqA1FDBIcJkmJckULDK0wV4r8kvoqJuoWnZDlDBCI=;
 b=K39F+RHrYyZ2eIQbrcHH/uLPLCu8fq8GswYxfy6FiNmNvb5rezjix+76322KD89f6r5YRGAGwEAvgDGlRqJPDZqyTD1lzHllbm6AqxrB4yaX+aRGq/UDwQaVbiYQVZ1Cj8LiySW8Nq8NIiadbC95xTUX8hhxN15qimOEHJXn8dCWfUP5BXOTwz+vmW0uOz7GAQy2luJFHNhQUdqqyKpYvsgoEa7863cBsEPTZ0iYgu0b+iz/cg9gtuzC1XBvCYB3Zc0/DN3+hs1pInHDcZsMsrkMjAecz9ZGXOxfrI93WlTYffqVokSTE7zLUzdY8sX6uE3/U0sUAliqf9Sq9G3Brg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+wqA1FDBIcJkmJckULDK0wV4r8kvoqJuoWnZDlDBCI=;
 b=QVG3MNF68om8nIbL8N6Lv2kSb/Q30F7KTF4K2bGSxde+Bs7ITHNVBDiXUZ6wjeX/w4VY7+j9S+jbBv1shPNWCS2yOIkG7gKzExdDdlEmYfz+adjK0ULy+7mJFFZMhMCNF5foMaC2xeu3gDnAJ+0rDAiVxbHwBfxbrqvq5khCGy4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 13/23] xsm/dummy: Allow XS_PRIV XEN_SYSCTL_getdomaininfolist
Date: Thu, 6 Mar 2025 17:03:33 -0500
Message-ID: <20250306220343.203047-14-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306220343.203047-1-jason.andryuk@amd.com>
References: <20250306220343.203047-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000148:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 0df5cde2-da36-490a-d8be-08dd5cfacef0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Cos1XVbNliabPKmO1kYDt41Rr5KhQiu4IY1X+1BFRVMTlNzo46Sqrg9himpT?=
 =?us-ascii?Q?fI/wLU+BsrrxSD7nJFX2h1OhQBasKt+pBmBYaLHiMhjs5s/rPR8bv7govhBh?=
 =?us-ascii?Q?xRdUPmpNJCxCTckib9dMbxTTjvG2KJm3rbfRQ3EzJKndNZQKSj78bCt8rjpF?=
 =?us-ascii?Q?ycqZB83AuT90fBwZjEtI0eiuiSiAqyiWdCORLLutijhZfUNxx9E5ORvtR283?=
 =?us-ascii?Q?HqRhyBaNNpvNvijB63OE+JA1LsG9YA/C7kuJvTMwGDcy5mK2HZT4Ik/1zmRY?=
 =?us-ascii?Q?lnkBv1W7nillxqf8j1C+UPm/QRkr2KXcCi3VWF0cQbr/agOqeh+YdUClQweh?=
 =?us-ascii?Q?eZTQ5xJhSkskSdDX47t6Ws6bSQ8XmyuqfhDmPn5WjMRr2IHwSJ+borsChnsg?=
 =?us-ascii?Q?qd9svZ9PmdqA3ckJvVr00cIKXP9jjuD/wpC4PwsfbMQmVvqfTeI/3Dak14Fi?=
 =?us-ascii?Q?2FSENksToMkBsIw4Cz76KY95ZFiCtFPnhbJBaLQv1Op/C3IGwGUwaRmAvQaV?=
 =?us-ascii?Q?nKg1IkZ4A/o2u285Mzd0RjyX+npOUbeQbkGtnsOUt3dAjcG5BOqRKeLlQRxq?=
 =?us-ascii?Q?QT4p1HR9HqFJaPwsLcOOKVtbhV8Pmh0tJHckZ9LV0r9OTWwjrJuyJuUaHpqv?=
 =?us-ascii?Q?EzMXNxrWaEBGSdsy7ipn2xEiZ+Txsb6fLRKUHqWHGA4PJXIv2EAG22vQ9LJP?=
 =?us-ascii?Q?j/8GslEhUaxOgM0SxJqLeXK7VQjS+UsG3dqTLv1SNPcz5fIwc19CvBdiARvJ?=
 =?us-ascii?Q?LIDIis5aVC5GiGNsj4R5M6f7iGfdCRIu2Gq/88hWcS7GAOOJ8lL4NSbe4sWc?=
 =?us-ascii?Q?c6l2hzP3lDrkDDjaQfMhAbI7EmtmrdULLIh7zxrYeKlZrDHtYxPgHM8HItku?=
 =?us-ascii?Q?TATk+W7ACfVwAovr2Gzj6GMXcn8/aHEpEdb8DwVEXyH4g5mSaZ0Rrk3Lto0y?=
 =?us-ascii?Q?OZwNGGgkDgaf5JEjPd7ml/cysgDhoM6xzUvdkHCJRys+LZwLFZeVNgy8mtID?=
 =?us-ascii?Q?dys+wyR6ReM/vRqxpmz8cjA0fDlniVH9FF0r+l7l45/tLsHZpRkOqEX26jQD?=
 =?us-ascii?Q?Cx1tVdIgh3Hq3BmbM9TpMCxTDUhOpdZogMmzdTQmoVLxFrJC6isENp4j/kv8?=
 =?us-ascii?Q?7MYL3eYds8o+6i6fZNrD+hZwzPWb25vIUrKvfxU+49Z+HR2mSgz+GNUyU8/n?=
 =?us-ascii?Q?cdp1ltn+8Qo5vCOKHMq0+19Z3BmH/hVEgnFB5M9UItUw/gKDVf8P5m9G1+/7?=
 =?us-ascii?Q?u4AsvlUpw5fn/Ry9ETYREJg0AK0/kxS9aOXBHvHzPNRdAdwdwhNTA9ACinUX?=
 =?us-ascii?Q?1wwl73sCkXFh+WIf4P6BRAMH0EgCIOL/eUqBk2eecmOlJtCSwhEficDFiyup?=
 =?us-ascii?Q?j3i8r6pqhwcsjDDka6O4OEzLkEz/Hs+ym9y2is3qiVy/vx9kOe5Ql1VCkl8W?=
 =?us-ascii?Q?jYYSHgjTdpAPVLoHGNzxb32EEwjzxRtzaNzrgWiWnXNheoiz8vxNVGhwxIfr?=
 =?us-ascii?Q?ET5iYr6A9g8K+88=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 22:04:03.9167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0df5cde2-da36-490a-d8be-08dd5cfacef0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000148.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045

To hyperlaunch xenstore, we want it to automatically introduce all
domains it finds while initializing.  To do that, change xsm_sysctl to
allow XS_PRIV to call XEN_SYSCTL_getdomaininfolist.

Xenstore can already call XEN_DOMCTL_getdomaininfo for the same
information, but it requires knowing the domid.
XEN_SYSCTL_getdomaininfolist eliminates the need to guess domains.

init-dom0less also calls XEN_SYSCTL_getdomaininfolist to determine
running domains to initalize.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/common/sysctl.c     |  2 +-
 xen/include/xsm/dummy.h | 10 ++++++++--
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
index c2d99ae12e..89d5176f4d 100644
--- a/xen/common/sysctl.c
+++ b/xen/common/sysctl.c
@@ -42,7 +42,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
     if ( op->interface_version != XEN_SYSCTL_INTERFACE_VERSION )
         return -EACCES;
 
-    ret = xsm_sysctl(XSM_PRIV, op->cmd);
+    ret = xsm_sysctl(XSM_OTHER, op->cmd);
     if ( ret )
         return ret;
 
diff --git a/xen/include/xsm/dummy.h b/xen/include/xsm/dummy.h
index 6a2fc33c3b..f2d6662a9d 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -181,8 +181,14 @@ static XSM_INLINE int cf_check xsm_domctl(
 
 static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    XSM_ASSERT_ACTION(XSM_OTHER);
+    switch ( cmd )
+    {
+    case XEN_SYSCTL_getdomaininfolist:
+        return xsm_default_action(XSM_XS_PRIV, current->domain, NULL);
+    default:
+        return xsm_default_action(XSM_PRIV, current->domain, NULL);
+    }
 }
 
 static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
-- 
2.48.1


