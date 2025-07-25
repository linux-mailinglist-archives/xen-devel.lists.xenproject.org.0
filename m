Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B10FB1166E
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 04:29:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1056825.1424833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Aj-0000xg-4Y; Fri, 25 Jul 2025 02:28:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1056825.1424833; Fri, 25 Jul 2025 02:28:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uf8Aj-0000ve-19; Fri, 25 Jul 2025 02:28:33 +0000
Received: by outflank-mailman (input) for mailman id 1056825;
 Fri, 25 Jul 2025 02:28:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uf8Ah-0000gX-Oo
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 02:28:31 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2408::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0cd18709-68ff-11f0-b895-0df219b8e170;
 Fri, 25 Jul 2025 04:28:29 +0200 (CEST)
Received: from MW4PR04CA0255.namprd04.prod.outlook.com (2603:10b6:303:88::20)
 by DM4PR12MB5770.namprd12.prod.outlook.com (2603:10b6:8:61::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Fri, 25 Jul
 2025 02:28:25 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:303:88:cafe::a6) by MW4PR04CA0255.outlook.office365.com
 (2603:10b6:303:88::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.23 via Frontend Transport; Fri,
 25 Jul 2025 02:28:24 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 02:28:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Jul
 2025 21:28:23 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 24 Jul 2025 21:28:22 -0500
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
X-Inumbo-ID: 0cd18709-68ff-11f0-b895-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UKg02909wsniTSUxvaSiK7+nNetEh5xkdfyTGoPVbY5wnO2XJgsejpMd8u9wet8BrNW9zTbNeALX8OGUrlJCf2ydKbs7GOMzwoYywXHWwITljBUsehFRWXJTN8l2lrraAATNVLrfVq5y+94fu0EGkj5XiaylBXcOXmKm27Ds4mAcSW7Rf5ED0SoefFz4+H7uUmCsRZ4IKFdaVo9poQFaLZ0osDj1weaVJk4pWQNoJpsGc0ZfNd4EbF1bcK8Fc2BJM0mcnC6nbA2vor5ZMoKQDu167hwuXBh3aoBJ4my7DZGMk66RNwj8sCNKyfvGR1hM0114wPn46V+r5Annr2hX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQE7SFtI6hT+kIWQ8NrT26YUgIJRLT0BB8RPA/WB9bs=;
 b=S9keDzl9Hd0ccHTyEkn7Gv4hj9Ilg7TP16OVPtjV8ooie/2Umr6As/1NK2zH2ot4EQx/mtpVNxriKZZWTtNp2NoFqu+8Nejc3TAElPqUwjL1Vd/05dl0K8YBCNLmBNBJDjQQnqorDrDbCkLVDks+6Oefl2t96OUcTBfK5USXR/Uaue5NFoWUjtd+b3bpiLIlNX/Oeh85s3LFFLnzxSZFekjjn1lpd0bZGSE6ziYQwcV55EsFmDr7RtyE4YNwdaqHA2iJJqjwTYllNPcABbADIRm+UfPF0weQ/HC943IhRTvZm/CUJ700lzJhhjJYiN4Dz9BxPMwc2qcspt47DX/H5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org
 smtp.mailfrom=amd.com; dmarc=temperror action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQE7SFtI6hT+kIWQ8NrT26YUgIJRLT0BB8RPA/WB9bs=;
 b=yCKTqHXRY1GbsH7IrYciQa3inV8KDdaMxGyqaWs7LYq5DGJVQCFLLD/Rmi5u8P9+1FE9HxsPgo29qDKwniPBHNZoOyArn56Go3B9pwVApF4/RpnrBktyFYDfsHAShtuEVNW5IbSMzi9EqXJ0ZCmeb8ycoBukX7UKGuw8HueVmcU=
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=amd.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of amd.com: DNS Timeout)
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v4 01/12] xen: Add capabilities to get_domain_state
Date: Thu, 24 Jul 2025 22:28:01 -0400
Message-ID: <20250725022812.466897-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725022812.466897-1-jason.andryuk@amd.com>
References: <20250725022812.466897-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|DM4PR12MB5770:EE_
X-MS-Office365-Filtering-Correlation-Id: e92a10d4-3a20-4d11-ac7d-08ddcb22ee30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?bQHU3lMadAgYswqJz2DSF4JRUKDhB8xzsl5pziAsIKzqM7mnnapD0c6P/yhS?=
 =?us-ascii?Q?qp7DprRj+Vdwb+n2NdN5Asdqurv+rQlmXtsgHRqCmBnjYaCNWmq1kCYqF1V+?=
 =?us-ascii?Q?xbpHQmplJtpFouTfWZR7M8voLNQXI4cW4ZDncz3cMFOt9l0DBvS6I1W59m8Q?=
 =?us-ascii?Q?MA11op0A8gUTA/droy7bkFqxDz2PLpcRIj6VDb5ubT5YLPac7s7BY23XFUXT?=
 =?us-ascii?Q?qy5jro7raCWTGhW/r7T9r0klCHgPE5M80XmlWXM6KwqeHPyz9ozpmOEdnFYg?=
 =?us-ascii?Q?x17pPTXZJ0oQL4NhEXHDQPqH7ESPG23NYqzChR4rwTPH05RKBnZbchwucj/Q?=
 =?us-ascii?Q?LXEXTPL1tDaSxdT/3OTjp4G1aTegjz/ywOKoEV5Cgm8UmQN1MHcb9MszdGgJ?=
 =?us-ascii?Q?jGePYJLI7hsJeSuTNMlULeRnDu+0BTzCi3u9TavCS9aMTgd5q2HyckIGPy0H?=
 =?us-ascii?Q?2u/Ol/536AcY/IOzZ4a0OrneyzGQKW7KYiERi9xZCGjhycha1tApU4XTv+d0?=
 =?us-ascii?Q?h3UJVteGXszYHxJNWfd1BsWPPESMiE8Fda/ppprb0vlinyQGpMo9JrdwDerh?=
 =?us-ascii?Q?YffNpD+BnuxLv8dQEup5rzio3+aJZK8OfPeVWteWNFQHRoz4RCNjJIhn1a82?=
 =?us-ascii?Q?tmo4tm6yp20Yl8MDyx13XTzcPqLRgdv1JwAijhywrCNJEOXN0FzeblRop+Ai?=
 =?us-ascii?Q?oOKDpQByk6q3QSJvgsFNHNe1MeNjlRnJUYX9IU50MupYG9H0d44zGKhvCvRY?=
 =?us-ascii?Q?4YxUdk2ym32/KjY31jj5U2Bttv/Pej705gGgmq8P1DQhfDyIHY5a75vN2xqJ?=
 =?us-ascii?Q?NY/aqswaw2HBJmyixyfHq4I4N5x0PkfNKpaQVzARPbXyF+XBaDKWJfBc7HJg?=
 =?us-ascii?Q?yZ67v2CoRhWB0Dv/Jsu79xxWTH0CleTtac32frJhNunmb91E1bIEbw4lDqbT?=
 =?us-ascii?Q?3+qynvdHGQWoKdthnxbOmVX0qZNYxLPvVJoAhgba9IbSHnPbKB/Bqn7nwfr/?=
 =?us-ascii?Q?Vrwej2SG0gYlpuvyRh7Or5ktos+mdqNa5HkEOf2aLpWVeLwxuca8UvuITqAL?=
 =?us-ascii?Q?6kICL//xAad3gI6aELkGjxIXY9QPrXeXuWVtHlHkVDR6Jzm/ac2NgrlwJhNs?=
 =?us-ascii?Q?sLjBMWzRuonGtwl49cttFuYw4AV1eixriqJuOcMJCGRrzj3hKVtGCI6mSjst?=
 =?us-ascii?Q?78LZ4CkkGGDutDgM9oUUN8LokDQSzMPOdYuFkrwmXCvAk0GW3b65Ngpkg9dG?=
 =?us-ascii?Q?yEgOebGrndWIg41Uwxm909y7ykpuFTFv9ecZshKONMEyb7aHGddJC+swmfk0?=
 =?us-ascii?Q?e3wbCrEJUQBxK2Hc3VdF423K+9ntEo6k1bFonaR+qOLm5ezkZNdTQLGZA0Gi?=
 =?us-ascii?Q?QuFUJbpabmSJxKb2Y+lssm1aTrSh5lFlNE9ksQkTT9eJp3WXTqcsRLtRUetY?=
 =?us-ascii?Q?COhEqYBbgsczAZQg9QUM4psqci0f7ZOaPxoQM+LlZ2tpFxpec7oZGZI6jNma?=
 =?us-ascii?Q?6jbDctlHC5i4/LAAATixlxVkuDzTQ/on5o4W?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 02:28:24.1303
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e92a10d4-3a20-4d11-ac7d-08ddcb22ee30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5770

Expose a domain's capabilities - control, hardware or xenstore - through
stable get domain state hypercall.

The xenstore domain can use this information to assign appropriate
permissions on connections.

Repurpose the 16bit pad field for this purpose.

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Reviewed-by: Juergen Gross <jgross@suse.com>
Reviewed-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
v3:
Add Stefano's R-b

v2:
Init info->caps = 0
Remove stale comment on caps field
Add Juergen's R-b
---
 xen/common/domain.c         | 10 +++++++++-
 xen/include/public/domctl.h |  7 +++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 303c338ef2..3c65cca5b0 100644
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
index a69dd96084..0c75d9d27f 100644
--- a/xen/include/public/domctl.h
+++ b/xen/include/public/domctl.h
@@ -1265,8 +1265,11 @@ struct xen_domctl_get_domain_state {
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


