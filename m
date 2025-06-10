Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBFFAD4727
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 02:00:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011234.1389625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8tf-0006qu-8x; Wed, 11 Jun 2025 00:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011234.1389625; Wed, 11 Jun 2025 00:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uP8tf-0006oB-2Y; Wed, 11 Jun 2025 00:00:51 +0000
Received: by outflank-mailman (input) for mailman id 1011234;
 Wed, 11 Jun 2025 00:00:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sTmX=Y2=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uP8td-0005ZD-1k
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 00:00:49 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20621.outbound.protection.outlook.com
 [2a01:111:f403:2416::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1fd17c52-4657-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 02:00:48 +0200 (CEST)
Received: from MW2PR16CA0049.namprd16.prod.outlook.com (2603:10b6:907:1::26)
 by IA1PR12MB6187.namprd12.prod.outlook.com (2603:10b6:208:3e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.38; Wed, 11 Jun
 2025 00:00:41 +0000
Received: from SJ5PEPF000001E8.namprd05.prod.outlook.com
 (2603:10b6:907:1:cafe::e3) by MW2PR16CA0049.outlook.office365.com
 (2603:10b6:907:1::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 11 Jun 2025 00:00:39 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF000001E8.mail.protection.outlook.com (10.167.242.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 00:00:39 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 19:00:25 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 19:00:24 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 10 Jun 2025 19:00:24 -0500
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
X-Inumbo-ID: 1fd17c52-4657-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K0a8s21PwKTVpvvTscnReOu/9sepoRKx5Br+pK0Nh5f5Y9Wl4jKYdpV2hGC0iePFa1zPQdo4F/6RCc6RrBU0J8SEzkj8J03aPzY+imS0BfAji/66ze7P9WcV2omke9MzBIum3NlfoC+vwt5FoThXBJUAme5GBUog+oBgYo+DIxkp7BPCjJ3VD7j6fVPWOonCzX1gaGc84O92oWhW2w+DnZLHB/TRQSFwCfyn4tD7l4rLpb3vIpuESCWmONK0i4c316dIUbEiX/kUBGV8uoaZmmJz4mR/W4Nw1vquyY8sxnnysqIJpg6Ho4qBT+g8njI9Ipf/Qqcv0Ie65j4hzUziQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2iazIvehT3EXJi3bBAC4f/lbNizm3XVxsCKUkoYsOvY=;
 b=Lw4nxIkQRq3S+77ni6pVXuweG5H+FoqpG2GC0LPI/Po0EYLmn7AbORARNvCN9oKS0XeQuFfV3nAP5S/LzEMBvNbBsKZY/tUYniScggdV/LBQ453Sce+n6gRLXrbC7fuLa/t32YHt0uuE31p6eMx9pgg8uz4RqmcCzWJi5B3TQA4a/Om18/klYc/47EHfZSm7dNMGsfhr/fgJKnujKhFr8HbXvKGF46uois4SFZZtFGIVzTJD3/crzRjhx9nhStWdSjdaQdt4rh7D+QARQL7gZQgJFwsU685+nUr7EsT2/of5ho+ZqTdVl+YX76tWdvjXSk7lTx7LXdBycydqVoJkkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2iazIvehT3EXJi3bBAC4f/lbNizm3XVxsCKUkoYsOvY=;
 b=KyCTKYJEtjyLrZx0OW6JNll8zPFzMm3maViYqIEH7tqHcWfLCwdAPDlO3XKjTCVGcAApBJhUxaaYHckwaWYe5N5kw3Q+/IzR7GE1izZei3SU2LEqm755hmsNzyt5818Efl9nixUu88X3HfCjRJByynw05h1Zu0mD9fT9AJmF2y0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Daniel
 P. Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH 4/4] xsm/dummy: Allow hwdom SYSCTL_readconsole/physinfo
Date: Tue, 10 Jun 2025 18:57:37 -0400
Message-ID: <20250610225737.469690-5-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250610225737.469690-1-jason.andryuk@amd.com>
References: <20250610225737.469690-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001E8:EE_|IA1PR12MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 30f70a3c-2007-424c-494e-08dda87b003e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kPy9SYMKtzxT7GrxfpM/gIiUAnu2S8104ZFi9Whre7HMTCfc/KDawdrpOB9a?=
 =?us-ascii?Q?/kr3lLYNNIxPO/RYNNSOZcP21miksCE81KCPxF+C247tXaT+AfOeXstRfb9h?=
 =?us-ascii?Q?PzMs5OrKyPqUt/ryHVteOgrs4zfDf4+qodLkfYp1EOIi7nV32VvOjx8hNx7P?=
 =?us-ascii?Q?iqQ+jHfO9RABN8QzFaPGb5sRHOcKt7sdLx9HZ8QhSoh7koMUWSMnIdKyWQdP?=
 =?us-ascii?Q?uamOR3g4/+br4PCyjpBiaQ25QoXoIFoEvapdW2CF8euy6g880RGAL1pQ3Aq3?=
 =?us-ascii?Q?Czki/WuN6cJlFfz4PYFBiwIwnptlFL6Y5IxXdohzFjH9UAZ4mX9kk0CRNikE?=
 =?us-ascii?Q?MxglqcMdogc7DuEa5pP76qaRwPnrxAML5jQCGXp4URfl7IhLZrcORq3nDmUx?=
 =?us-ascii?Q?DHx5aVgWQC/vcfrJzkbAOPjf/LRt0puET2Q1s8kmttwQG+mxg8hNYl3VB8HN?=
 =?us-ascii?Q?jxmFzbXZ9Mdih4ilOYSamra5SToFDXZ94F9Xni7oU4Pbd7H+TlgNbQP+pCbN?=
 =?us-ascii?Q?90Gf1CnOe1486BUJEbYdSbjTdaFQLfMrcM2GCRo/vbpsLQwsdzQNmDTONmuw?=
 =?us-ascii?Q?vy092FyojByX6TpnwNbWhW8tAKVXaj4MBNtjIBN5ZKZAz5gVS4n1hTYjWlyR?=
 =?us-ascii?Q?uTR3v81gwoGSCIOusvRvwLzFFS1meFtq1H6iE0DWtuPq1kYL3oiuCzkvlUPL?=
 =?us-ascii?Q?T0yy5bj9mnrA+eKXiDR9L5zDJwINQyw10WA9RMiifYQKkhdfqDzAAJVdfVat?=
 =?us-ascii?Q?X+QXFt9EOkwzKmTjuFOJR6RtRVtndK65kdUThfz0KWPtITClFQe4UkUnJ19U?=
 =?us-ascii?Q?t8eIZkjydz4rouW56vkjNXBnnUmDBVUtQ3IQAGE4lRG+8NHdKq0Y7HUbzkPw?=
 =?us-ascii?Q?E/J5Dp9S4kAo2kCetV7wFnaaQxiWsRpVQwuVhdFWLj2dQDRjCZqVENBGT+yZ?=
 =?us-ascii?Q?em2+/FlDbwTKeNjEpyVXjNnPHf78yN15UbeOBprUdNPGDaLCqGr65aQ3rwny?=
 =?us-ascii?Q?yl2E6WmtRQXIcEFcKzAlISPo8uPSL6EK5MB4AHN8k66vDrHxSxR51ROt/RUD?=
 =?us-ascii?Q?ekeM8WiY64ngEnrsk+kKdxzZsxkkn3dpk+SUD/WMJMqQvuCJNEaVM/uL+UP1?=
 =?us-ascii?Q?3hsbAQtx/vwJg60KK4vDlT+RU2gafXX5wL/YADFRLWB3MQhp8KkhnN9YPok6?=
 =?us-ascii?Q?eygtc78LPVdDqg7icgE1Q/9v7HWQDKrlt0KXpm+AqkyX9JbKfLfAJYYXKPGI?=
 =?us-ascii?Q?I5hW4ob82KC1/1/jPP/hyzFIL5KAInIcBXfciqU9U6pvpoJDppjziasrH11q?=
 =?us-ascii?Q?8twjJaQYGcM8Uc4dG3+BQLRtJh5AYzVk1xYidGc+9ieFFTj6T7sIvmKCBpxI?=
 =?us-ascii?Q?yZthFUgvqhqHZlaO3oUOXqtg9BG14hNaYPYr1+N0hSi7kAuzR5ukksftWzUh?=
 =?us-ascii?Q?di9MhVgnZRB/nUJPONm8TqbdPg8VrJK42k+kHP0ExCXXGIN3KSbkE29SmZKE?=
 =?us-ascii?Q?V+wXEV9H+Qh9KPdfP1f2O+yjEPBHrib15lLS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 00:00:39.3734
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 30f70a3c-2007-424c-494e-08dda87b003e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001E8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6187

Allow the hwdom to access the console, and to access physical
information about the system.

xenconsoled can read Xen's dmesg.  If it's in hwdom, then that
permission would be required.

SYSCTL_physinfo is mainly to silence xl messages:

$ xl list
libxl: error: libxl_utils.c:818:libxl_cpu_bitmap_alloc: failed to retrieve the maximum number of cpus

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
This is not strictly needed.
---
 xen/common/sysctl.c     |  2 +-
 xen/include/xsm/dummy.h | 14 ++++++++++++--
 2 files changed, 13 insertions(+), 3 deletions(-)

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
index 477fadaefd..5e806dc241 100644
--- a/xen/include/xsm/dummy.h
+++ b/xen/include/xsm/dummy.h
@@ -188,8 +188,18 @@ static XSM_INLINE int cf_check xsm_domctl(
 
 static XSM_INLINE int cf_check xsm_sysctl(XSM_DEFAULT_ARG int cmd)
 {
-    XSM_ASSERT_ACTION(XSM_PRIV);
-    return xsm_default_action(action, current->domain, NULL);
+    XSM_ASSERT_ACTION(XSM_OTHER);
+    switch ( cmd )
+    {
+    case XEN_SYSCTL_readconsole:
+        return xsm_default_action(XSM_HW_PRIV, current->domain, NULL);
+    case XEN_SYSCTL_physinfo:
+        if ( is_hardware_domain(current->domain) )
+            return xsm_default_action(XSM_HW_PRIV, current->domain, NULL);
+        fallthrough;
+    default:
+        return xsm_default_action(XSM_PRIV, current->domain, NULL);
+    }
 }
 
 static XSM_INLINE int cf_check xsm_readconsole(XSM_DEFAULT_ARG uint32_t clear)
-- 
2.49.0


