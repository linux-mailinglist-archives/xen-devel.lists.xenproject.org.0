Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 224678C2E48
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 02:57:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720147.1123249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2S-0000CA-Qq; Sat, 11 May 2024 00:56:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720147.1123249; Sat, 11 May 2024 00:56:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5b2S-00009L-Mi; Sat, 11 May 2024 00:56:36 +0000
Received: by outflank-mailman (input) for mailman id 720147;
 Sat, 11 May 2024 00:56:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0W/u=MO=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s5b2R-0007p5-Bz
 for xen-devel@lists.xenproject.org; Sat, 11 May 2024 00:56:35 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4fc6ea7f-0f31-11ef-909d-e314d9c70b13;
 Sat, 11 May 2024 02:56:34 +0200 (CEST)
Received: from SJ0PR05CA0145.namprd05.prod.outlook.com (2603:10b6:a03:33d::30)
 by PH7PR12MB7282.namprd12.prod.outlook.com (2603:10b6:510:209::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.51; Sat, 11 May
 2024 00:56:27 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:33d:cafe::95) by SJ0PR05CA0145.outlook.office365.com
 (2603:10b6:a03:33d::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.13 via Frontend
 Transport; Sat, 11 May 2024 00:56:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Sat, 11 May 2024 00:56:26 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 10 May
 2024 19:56:25 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 10 May 2024 19:56:24 -0500
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
X-Inumbo-ID: 4fc6ea7f-0f31-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f3Sxtlr7qzg+ofD7hAOzn8/acXan2BrrW+i0wY7aGB4z2jCyPnAo8+fGKtddzITFU+iHnCvYXEtXpZsdwHjB3KOK40XsMRMJHGVOIWO/TIdhvrsAxtZZYZ0rIsIAqbQC++1MiwrVh+v8Wvs6OrSIn1AmpWY4yACMQruCJ9KbTeOX6vEzpSytFCYBmLXXdRHKn8y9MduPA/JZvjA2+kgg/3UKqcdG5NzzD7lsIEJO00o3eJPvsLQgbRY/3FKEZpQHx4Po9tcJY1ALkfXgdILDAYJhaJQYkLduro95Xn2Ta+vIQNnrAExCERuzGJevpt4oOrseZqoWSYNbe4+YAcrsvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+g1Sl34/9TCXkY67P68n4Fomec7VFpUiwGKx0eZZ7xY=;
 b=MsnwKKF3OPBOKJ7brfJpSkEMUCJlEAdHCm7Wg5PILGLPbzgVNvd9veEms0tZ7RSyDjNurUHlQQ8kXiqHJ0O4mR9lsxCD6ZgkN6ZkNbQnHno6B/f8ZD2/zZRQrwDV/TbBjZmNGwD6ylHsdn/F7okvYwjEgUOgr1SZYigyiNuw1LdsNTPatiBCdegrwFRa5UDjkbd5mcTp3DLaHjJdQ35sfPU9cumAZteqNUoU5fcGdPmgkPEIjhj8LVk7bLMBnSgVwBTKBj7pJzj5Jg0capCLI6O5CbVp3IPuXI6DPsP9cXWOBmBkhN2Wz3BK3sZx5/uqg0vvhAXVwBSl46g8lvcRwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+g1Sl34/9TCXkY67P68n4Fomec7VFpUiwGKx0eZZ7xY=;
 b=XPf8OZjnV0QsIPQ3m40wszIuwTDYYNdRazqqP3pjZ8kq/HDrzCJc79LPiSWNt0bapni7e6/eGFj4uvUG1rsqwTL/ZwqHwC0z8OSRE2jSqUpDX9/gIqP2k4EmJB2dmpZEwi/MFO9sjxreJNoK6Ch8JVbFK0JpT0owUN4ULaCid4o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 4/4] docs/features/dom0less: Update the late XenStore init protocol
Date: Sat, 11 May 2024 08:56:11 +0800
Message-ID: <20240511005611.83125-5-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240511005611.83125-1-xin.wang2@amd.com>
References: <20240511005611.83125-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|PH7PR12MB7282:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e71e78-47a3-48ec-c3b6-08dc71552fdd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|36860700004|82310400017|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?iL5IOhV4p7cUoNSGwwrJPaPMZsYsgELpNwSHCUdF4oR08an2u887BiiX7zG+?=
 =?us-ascii?Q?wiIV0t3ZBw9D1zzH6Mup4ehOCdXoGwAQq4W4CAcaYHM57rv77WeG6dV/pZ5u?=
 =?us-ascii?Q?dRhj56g7NhrJujfw3OSA85KlwdX66f1KGEA7d3UPSDxNKrvqAUTYEknaoxg+?=
 =?us-ascii?Q?XH3pIFOD2bFE5Jf9C/HCX+KUAiOF2FmEv7Q8zaOphowPU+fRaQfUxDoY91Hz?=
 =?us-ascii?Q?1nTLiNCqPl7uVXP+OLE5vLSYeTr48CviwEiXmc+YQ4U4E4nLWqGnluCRib+a?=
 =?us-ascii?Q?w7Gw7A1zQvJof8JTyZpclC/gUyzUcZZ7c5+PZV1ZKGoJCTWtVzLw0MCAMfpN?=
 =?us-ascii?Q?8GPenZhb7rJnHMLrj9pMyqDPVDjYnhoz0g9TKhxIMhFEsBh1zkejFq59nc+0?=
 =?us-ascii?Q?4fxEzyxkTf63ulGRrZUdb9gP61pQ99Yn1xSKwkpq3IT/l74Urx2ZYo/Op8C6?=
 =?us-ascii?Q?wIOLQOcY3PwHdhY/2NfSjr+IBbV8oX01M/erVA1AOXF0zhyexLu5GauP/Lqq?=
 =?us-ascii?Q?K3qSj6CF707UcwFuCXklm0uXNICeerOFwn2hXmmFRTBHahsMAwZKZ0CLFtYT?=
 =?us-ascii?Q?HBhUPQ2EfUiTDkyO/y5WzCO4K9oXKuLUPbrNoitToqaZgavq0Vjww9TP49+T?=
 =?us-ascii?Q?qjigrUR/kybx7WhFlRy8gQrdFXA5Kuf/AQaQB2JuHI9lELoBl3IxQflXjJI4?=
 =?us-ascii?Q?6CknW3jGsw/74ivZsooFOwZMTnw6AWjcDoec64/8hIvLr4A6LRupJ+Aayw0j?=
 =?us-ascii?Q?jRIvMDgtWvJzq+ks1Iv/2Fv8y6DlprZglKcwc/CFGcS3RtR5mVDhK8rw0wEt?=
 =?us-ascii?Q?V1FeaGdRdNGHH/qZlYWk9o3iCIEFicd6YTolmAa6YIc6UPMDLdtWuIy5jGbz?=
 =?us-ascii?Q?+yhikmBTfu0hl5dWevJjycMAJIdtr6T2QNiUxwF9nb6+Oky1vIpRUj9erWW0?=
 =?us-ascii?Q?G7buIeeBjjfLgME79EK5KwDOzPe5wuYRw1WYdLrC4xeoKaUUnEpGhgfkCnOc?=
 =?us-ascii?Q?F9tbE3mc+Shgy0OdxL+SsJBIXnHkpY9+dPtrJfaPlIPo699PIPrvL3ong02b?=
 =?us-ascii?Q?u2sq2CIkrHLZ4upqyNHMnWWqifYWmQgalrLoPj9DhzzkdAIbz7CqYfw3Cy5y?=
 =?us-ascii?Q?iVFQjPm9fEc/1QOyC+L7baILcjsHcanXpmpqWixnDL8GV4toymZwt7B0tx96?=
 =?us-ascii?Q?9JKH/X44XoDRLAX9ata+Or1CH9dB871YByHUUGcbaD/YL/j8dotuUDxMyMcu?=
 =?us-ascii?Q?P36WJcWJQFnnnIXQYv14C8LYhauJEq1E7hMq799gDQ/wp1vuMols8/DchXr4?=
 =?us-ascii?Q?FiU5evfjwJlgUeT9t/J6SukBbnmjQRST1Lh/wsEUmpUb8H6Wed99EdebPkgH?=
 =?us-ascii?Q?4bGuYStkNoInVnWfCEqJID9ze1at?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2024 00:56:26.7739
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e71e78-47a3-48ec-c3b6-08dc71552fdd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7282

With the new allocation strategy of Dom0less DomUs magic page
region, update the documentation of the late XenStore init
protocol accordingly.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- New patch.
---
 docs/features/dom0less.pandoc | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/docs/features/dom0less.pandoc b/docs/features/dom0less.pandoc
index 725afa0558..137e6b618b 100644
--- a/docs/features/dom0less.pandoc
+++ b/docs/features/dom0less.pandoc
@@ -110,8 +110,9 @@ hotplug PV drivers to dom0less guests. E.g. xl network-attach domU.
 The implementation works as follows:
 - Xen allocates the xenstore event channel for each dom0less domU that
   has the "xen,enhanced" property, and sets HVM_PARAM_STORE_EVTCHN
-- Xen does *not* allocate the xenstore page and sets HVM_PARAM_STORE_PFN
-  to ~0ULL (invalid)
+- Xen allocates the hypervisor reserved pages region (the xenstore page
+  is part of it) and sets HVM_PARAM_HV_RSRV_{BASE_PFN,SIZE} accordingly.
+  Xen sets HVM_PARAM_STORE_PFN to ~0ULL (invalid).
 - Dom0less domU kernels check that HVM_PARAM_STORE_PFN is set to invalid
     - Old kernels will continue without xenstore support (Note: some old
       buggy kernels might crash because they don't check the validity of
@@ -121,7 +122,8 @@ The implementation works as follows:
       channel (HVM_PARAM_STORE_EVTCHN) before continuing with the
       initialization
 - Once dom0 is booted, init-dom0less is executed:
-    - it allocates the xenstore shared page and sets HVM_PARAM_STORE_PFN
+    - it gets the xenstore shared page from HVM_PARAM_HV_RSRV_BASE_PFN
+      and sets HVM_PARAM_STORE_PFN
     - it calls xs_introduce_domain
 - Xenstored notices the new domain, initializes interfaces as usual, and
   sends an event channel notification to the domain using the xenstore
-- 
2.34.1


