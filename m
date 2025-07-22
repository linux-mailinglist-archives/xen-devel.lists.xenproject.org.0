Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9BBB0CEB2
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 02:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1051889.1420351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0lY-00084I-Ba; Tue, 22 Jul 2025 00:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1051889.1420351; Tue, 22 Jul 2025 00:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ue0lY-00080w-8T; Tue, 22 Jul 2025 00:21:56 +0000
Received: by outflank-mailman (input) for mailman id 1051889;
 Tue, 22 Jul 2025 00:21:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kPIU=2D=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ue0lW-0007zp-O4
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 00:21:54 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20627.outbound.protection.outlook.com
 [2a01:111:f403:2415::627])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ddcc4017-6691-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 02:21:52 +0200 (CEST)
Received: from SJ0PR03CA0029.namprd03.prod.outlook.com (2603:10b6:a03:33a::34)
 by MW4PR12MB7288.namprd12.prod.outlook.com (2603:10b6:303:223::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 00:21:43 +0000
Received: from SJ1PEPF000026C8.namprd04.prod.outlook.com
 (2603:10b6:a03:33a:cafe::72) by SJ0PR03CA0029.outlook.office365.com
 (2603:10b6:a03:33a::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 00:21:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF000026C8.mail.protection.outlook.com (10.167.244.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 00:21:42 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:21:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Jul
 2025 19:21:41 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Jul 2025 19:21:40 -0500
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
X-Inumbo-ID: ddcc4017-6691-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IPWJPRB8lWOPhgNff8bfhtvl0CxJHW7fX0GfBJWGMv4Ju78ELkhCv5iMIuJ7jiRHi3AWlzbZbRpwb3jietcoatRvCl4oJaT3CqHVQzHgtQvuAW//wT1yeiSOV52s/D9NIxAKZ97TMzEd99BsNGLGhDVLBi9ynhfRVmFXfiW8QTLegkBDZCAiAmmGL+wrPIiiYaM5xsYudEGE0uPv5psILiVdW/XuyTjqcON2QlBBw9wkaSuny74c+Yuf2nN1W9zK2FxmVzArLF+9jCdi12wAgJoySRvC/EFbWY/UAVgD2Jd6KZgMNbv7W1KZ6R7USMWq63BZ8UJtIUAuu3Ntdy13pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c75uJqg5nhBagpJJavUDY5wwNsouTt9h+tnycF+katg=;
 b=TNe7/XmThPcF/nym2FURsfsvziVcWYxMP1SL2tuvDZwk7hf4bVOT+lUUBFdRlpMOWldHu6t/KAMmGAUOJhzbpDfrOTnNCWu9p2Bl5Bu/XKj8g4D+xDHKEqsOEuUmG77bzmJGQcb2CAkBHknN8VP0Wt0IHLdE6+u1yQ1qeiaqad4+ASlosaypPMmOXCrlsB5pfWUeptt30+vkr75+GCX6nAJWXPRQTnD3ty8hAdCRAGTlwIPAM5KKKCTfm4oEL9P4zsM5JD60DehbBIkuiEFr8Y0vBqm2ghmGCgtGymV9+ZJVKl19GCsR3aTr2Br3b5etL2ZIXy9SGqwVdzg6WXg+bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c75uJqg5nhBagpJJavUDY5wwNsouTt9h+tnycF+katg=;
 b=wwapfVguBZUuSkWyfwCWhQ/nb4ytdeeiTYWZydQo8mdbawfjvcRik2x9PF8/ZmJOY60T+BIVyzXwj75iXpGzrJ1nlrWA3NeIYWcZf47wGYTajfp2BA8sDQO/bra+fRN6BPmsT7YRcirLMn5GFt8rkDzR2JqARtyYhX2fJCtLQYY=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Juergen
 Gross" <jgross@suse.com>
Subject: [PATCH v3 1/2] xen: Add capabilities to get_domain_state
Date: Mon, 21 Jul 2025 20:19:57 -0400
Message-ID: <20250722001958.174294-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250722001958.174294-1-jason.andryuk@amd.com>
References: <20250722001958.174294-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C8:EE_|MW4PR12MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e28da7b-8f04-4eb9-6f9f-08ddc8b5bc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?U3zbhWCMV+WKSlccFtvwkoASXH8v6saHlNHl+6HoTS2iSliI5MMPKGUJPrIK?=
 =?us-ascii?Q?HQasje/bvtY0UrIy/OsdiO73gf9llLDY/pkxxul4WZbh/SY/UlGh1rVFV4d0?=
 =?us-ascii?Q?GraeaCgX2wkieBos0+vxd/nT+mvYHB2ksqDNJjq15mDjs4XB+95703zWkrf5?=
 =?us-ascii?Q?NZJCz9f4SzzZZ3ALXFWlv+QMZ4AOKBYBTykbe5M3Pm9APB3aAFzl5StGK6dF?=
 =?us-ascii?Q?v7KFz34DxyYNfIDLF/KQ9djNCdbDuEKqqyOSz/lGfi0X23oqPet/a8cREqcc?=
 =?us-ascii?Q?/Il3K8dfAqBhfVIhqQrC361mo7K3dP8BvUstYw2M1spepcF2j39o484FiPRA?=
 =?us-ascii?Q?in8b3QHjRbuVADB4fE15Ob90/aNmQB2uqp/AihLkYyGAT8Sayu7lvn5nAMc9?=
 =?us-ascii?Q?fxW/plbQIHXJmbizbhpqaaG9kq2KEWHkux4G+zllWGOaO7UechYCeoUiEFQn?=
 =?us-ascii?Q?jAkE4Q5AQH8F6WagFHOZo1jtU9adrxFg/GqVVqA8RxJ0LDMI3tSl3sqHY2aT?=
 =?us-ascii?Q?VGF5G9/nYyFvo6JEk43o/vtVCKHJ9YlhCs0Z3P/MxS/cGt4hb9YocrnD+vbC?=
 =?us-ascii?Q?4qtjibuL6R3IbYT8yhfY0HdVZibiR2w6GujFvWF8T/7UDj3nG+qp1jP/+5jp?=
 =?us-ascii?Q?NNhsyDlpr4JVcGDrJFguyraDvoaX/rIc4FWEqj775zBI1rLIGurpdq8HcUlc?=
 =?us-ascii?Q?YuldYvXomXliuja+g6FjbrgmoocZEiIgoUgquGgSdF5r8tQ9UGBe1k4IK/DX?=
 =?us-ascii?Q?Ek0RAXch1FZ0vi1sn+i+3vlGITRfsTA5+KoA80YKiOW118/kUWoVZQOo4wEZ?=
 =?us-ascii?Q?MtSabfO80o97WcmwUImMfiYkNSk73PXXC79pEsO23H9xlKXI1E4ck/dUvxZy?=
 =?us-ascii?Q?ywIRwQBU0m4rYX9BY31taszaEzeMVAIXFqQxPKFJopGljyoV4OYKmm0BfDAq?=
 =?us-ascii?Q?+dRrQFOXnuAp1ot2VLCKAom+rXafofCojJBVVVMAY/Zt6Jk3gWnLYIwEcpJM?=
 =?us-ascii?Q?37DmvkvJy1y21TrFBepEtDLK/0CShmGgAVEF7iorbI2sC4M90Ri4vhADbCE0?=
 =?us-ascii?Q?VnqQbOxZ7bF48K4CkNd9xbDTvI85QDD5EAre6Y0TCrL+NozlE2q8WwuOz1oj?=
 =?us-ascii?Q?xBuOkAMjuOgdrTIl7CHtS3BBHZAF/yyGxHx1bZLi34sbdh0wd5ahnnQ9vWxt?=
 =?us-ascii?Q?dA266zDyMcaIvpj2Xvq4hNhhfllGT7pffBwUyDcNAAjlxHePlKMLe167vpuD?=
 =?us-ascii?Q?ZWa6JKHMChpE3bPbq0miiXZ6Oolmzwet3Zh7wa4tU1IE1iJZp4FoSFsjvlOf?=
 =?us-ascii?Q?flz/HgUD5oCys9MS2JXHaOJNjKPSpMZsDwwhA3FNaSJagNfQZrq1fJRooDL0?=
 =?us-ascii?Q?r4mwGuw3Fwu6vVTsYX3Yl9B09VYD8nomBFpl/IE77ehoWhy9E4ugn7pnkk/0?=
 =?us-ascii?Q?IzwslWPhKnvBlSstsj1xkRdB2Cl9G63+13SgfS5KnSUQ1myk0k7Qz4SKWbjM?=
 =?us-ascii?Q?OzER1E3lgWRa51me0uQyIDUzFz1c1DDzxONE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 00:21:42.4900
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e28da7b-8f04-4eb9-6f9f-08ddc8b5bc0f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7288

Expose a domain's capabilities - control, hardware or xenstore - through
stable get domain state hypercall.

The xenstore domain can use this information to assign appropriate
permissions on connections.

Repurpose the 16bit pad field for this purpose.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
---
v2:
Init info->caps = 0
Remove stale comment on caps field
Add Juergen's R-b
---
 xen/common/domain.c         | 10 +++++++++-
 xen/include/public/domctl.h |  7 +++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index c347de4335..bb33b1f1c7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -195,6 +195,14 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
         info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DYING;
     if ( d->is_dying == DOMDYING_dead )
         info->state |= XEN_DOMCTL_GETDOMSTATE_STATE_DEAD;
+
+    info->caps = 0;
+    if ( is_control_domain(d) )
+        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL;
+    if ( is_hardware_domain(d) )
+        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE;
+    if ( is_xenstore_domain(d) )
+        info->caps |= XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE;
     info->unique_id = d->unique_id;
 }
 
@@ -205,7 +213,7 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
     int rc = -ENOENT;
     struct domain *hdl;
 
-    if ( info->pad0 || info->pad1 )
+    if ( info->pad0 )
         return -EINVAL;
 
     if ( d )
diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
index f1f6f96bc2..136820ea5b 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1269,8 +1269,11 @@ struct xen_domctl_get_domain_state {
 #define XEN_DOMCTL_GETDOMSTATE_STATE_SHUTDOWN  0x0002  /* Shutdown finished. */
 #define XEN_DOMCTL_GETDOMSTATE_STATE_DYING     0x0004  /* Domain dying. */
 #define XEN_DOMCTL_GETDOMSTATE_STATE_DEAD      0x0008  /* Domain dead. */
-    uint16_t pad0;           /* Must be 0 on input, returned as 0. */
-    uint32_t pad1;           /* Must be 0 on input, returned as 0. */
+    uint16_t caps;
+#define XEN_DOMCTL_GETDOMSTATE_CAP_CONTROL     0x0001  /* Control domain. */
+#define XEN_DOMCTL_GETDOMSTATE_CAP_HARDWARE    0x0002  /* Hardware domain. */
+#define XEN_DOMCTL_GETDOMSTATE_CAP_XENSTORE    0x0004  /* Xenstore domain. */
+    uint32_t pad0;           /* Must be 0 on input, returned as 0. */
     uint64_t unique_id;      /* Unique domain identifier. */
 };
 
-- 
2.50.1


