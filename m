Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88076BAF807
	for <lists+xen-devel@lfdr.de>; Wed, 01 Oct 2025 09:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1134685.1472386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3rdH-00032j-3i; Wed, 01 Oct 2025 07:52:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1134685.1472386; Wed, 01 Oct 2025 07:52:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v3rdH-00031G-0w; Wed, 01 Oct 2025 07:52:15 +0000
Received: by outflank-mailman (input) for mailman id 1134685;
 Wed, 01 Oct 2025 07:52:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OOib=4K=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1v3rdF-000319-PP
 for xen-devel@lists.xenproject.org; Wed, 01 Oct 2025 07:52:13 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 86a3c2fc-9e9b-11f0-9809-7dc792cee155;
 Wed, 01 Oct 2025 09:52:08 +0200 (CEST)
Received: from SJ0PR03CA0208.namprd03.prod.outlook.com (2603:10b6:a03:2ef::33)
 by DS0PR12MB8071.namprd12.prod.outlook.com (2603:10b6:8:df::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.18; Wed, 1 Oct 2025 07:52:00 +0000
Received: from SJ1PEPF00002323.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::b6) by SJ0PR03CA0208.outlook.office365.com
 (2603:10b6:a03:2ef::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.22 via Frontend Transport; Wed,
 1 Oct 2025 07:51:59 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002323.mail.protection.outlook.com (10.167.242.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9182.15 via Frontend Transport; Wed, 1 Oct 2025 07:51:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 1 Oct
 2025 00:51:58 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 1 Oct
 2025 02:51:58 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Wed, 1 Oct 2025 00:51:57 -0700
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
X-Inumbo-ID: 86a3c2fc-9e9b-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LS8VmzDN28QTR7qllANhkE4QUyw4aL8FrHeiPe38nmspnKDuyV9DrL4sWdz86LX7lFLuAbn3pfxxiT1+2fZ/LUmfksggeYG69+5IKTqplbHl4yMYS/FGLuFc59l0RtuHPV+MUCVeqpjs5mAZ7/hCV+teRDsGP8aI5M2gcYsEyA+FIApq5UYqy2BxpAYYp4RTYL1pN2xEpjgN08NZsP9QTujy2AO+4wLolBes4zt2PfztKmvPLugJEh1Rd8f/jS8MGUl1/e6bmukEmGyDcxrLUG5KkpfsCRGUqfq1gEEYm4gkwstwLow+wKdYhupRNULw66FVmP4YtCtfvgipMOemLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Roo3UpLpWdSUS8iJHQLCgeVurPp/+knn0D/sGXiFGd4=;
 b=UUAVRNIcafGdIIQKzDo0GMeN6FuOhm89f2AIKj62r7jcN5nr6Mk1gC+XeVw2uQp1/a94z+o4cey4EiPciOaA3CuF51wNJbh3fJzLEwtF9xYcz44wlezC+ZFaF9NWdeqSGvUnCVssUCKZCaYG70yasw9VCAVLuro0FkHWtreN6OIt3LtGaQSDt9Owq9qeb/vcoAJFGdTWmAXR5YS17GGQHBLdXdRYqhvuIlIOXwFvZ8RBt1JxecRdQ9/5ZA+YDr/Fsgvpa7gYRMcbBAlcV4EPQVTmpEgHZqDMe1f/zAeaS/+cbCho5cxP8gnBHx8aQzGTpSQXgsG8zYt6nGhmhvNpPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Roo3UpLpWdSUS8iJHQLCgeVurPp/+knn0D/sGXiFGd4=;
 b=HxQaNtTxAI/EZn64HN9eU/Qf8iM2zgOyW5xiFZ69Md4Wh/O0aESMx2aoIQ8jMb1u9cTscojll61cTjwKCDxb9sEw4bEfwN97zJUUCks+SsHeL8kmSGiAyHicLvH+54b9qRSLXDUtcSqfKzxUSY7aE25H/P1I3mATYhVYNXCmvl4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>
Subject: [PATCH] tools: init-dom0less: Replace err() with more informative messages
Date: Wed, 1 Oct 2025 09:51:49 +0200
Message-ID: <20251001075149.31545-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002323:EE_|DS0PR12MB8071:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ac2c2bc-02a0-4259-072d-08de00bf66b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2Da8bOLrK0fLmYl9oUgLY3/7CTj95dy40r7v8Ml9hTQwPzV5qqWoTMNdrimQ?=
 =?us-ascii?Q?MskxvBriCGtKwdysrRetLNOHqrK0JkBTHC8mya4mhxVXvRek1PHRPyo+b4ps?=
 =?us-ascii?Q?22C4aud/Ioz33q95ux/hu1LqWlFuMy+TMCv5ZNYpDlsHCDyjSxf0QyidibOm?=
 =?us-ascii?Q?0ykVWCrUtusEeNT3vCy4NSamXtOSkt7saHv79TVuracWSeJkCa8rAV871Hz5?=
 =?us-ascii?Q?+B9WqjM40EIqly012GRGybG+Dhc6/drC6Sn1Jvy0kLqHrmfY6o16euy+vApV?=
 =?us-ascii?Q?hok6qFeu8Y9ZU1DofVfLnDaR11DbJIQY+9zMsJ/PK2Sh7d05cWA3QoOSVQRS?=
 =?us-ascii?Q?1TTtC3CAEhS0EP5WHXwQndZ/0OMvI16QUV1ImT8WxGFu6vMBf14ejZsRwsSE?=
 =?us-ascii?Q?1S8I4W5Qgi16PEUy4T87F6/YqjqhnbKDhkcL0hDnKr50+P5q2Mww9Qt5QBy0?=
 =?us-ascii?Q?H4HUQ1dO8iIldXPlYbnNJ9eJOUFPV/xYAwSpoXwUs03eueoX6eYdt7XWSxIm?=
 =?us-ascii?Q?HiIR6bIQpj+YQEra9yGfjo/5cesBS3OuKIqOdA9LUpkeGlu6fDv1vnqrpUih?=
 =?us-ascii?Q?sNJR3BJY+M454rGb/cqLlI4901Qj8rlWiX4d0NRI8b0LsNc8JMb8P3J1yukq?=
 =?us-ascii?Q?c6Sz1GHdjtRM4+F31MCgVX9lbmMx0UGITS/aGRkiyqfP/xSECuJOJNwC9jQl?=
 =?us-ascii?Q?5D9TXOvhYvEqbQ64FewFcNjnLiu6Mr0lc/fdNH3cWEQcA9zEgJJ5vbDsn9k1?=
 =?us-ascii?Q?IE+fc3oBotxYR/fw7M9VtushgZPvh0WBTAgRNZdrOU5RXPDpsIubL5AcWRCC?=
 =?us-ascii?Q?WOPyfjsX6H3MRIyD1mSDpWxCuLINIAL2S/80SSIocDBxxMddUIyZ4shJRBoo?=
 =?us-ascii?Q?/hwFG3KFXAVMek+APrCKMIqduPjSWWexdbKFSc+H8bjq06AYrzzHlB+bUQ1/?=
 =?us-ascii?Q?HMUkNGqpIfr4PPC2LRXDnME+EoB5WPFJeD4ErCf3vOzHb7hsVkF00T+tcFCC?=
 =?us-ascii?Q?xxJWiJW7P2+Mb5pu1xqbSDqvGnO/utj2+e034TSqQbiNZ2pub0WpOKfmcvmi?=
 =?us-ascii?Q?PsBf332Ghyjsj4T8B6GDEeDim1DoO+0kYA/AyKG2yedIIkxWFofhASv0R3jU?=
 =?us-ascii?Q?RGGv2NvKCcvncYkPCKPKcHTWPaF04xr4ITTlu3db3HX5f4NLIkrfvKbm/+YM?=
 =?us-ascii?Q?xM2J4CpyonweTFc0FzDWbvGrWFH0axbcc93EwmTW1iMM3zLg1diy6yJ1uWze?=
 =?us-ascii?Q?sZY8LXCi+HUbz9liAEzlGmmObziB8zHBDPovOJPIz9717GA/5nfK8sCmyMFP?=
 =?us-ascii?Q?Af0F69JBfQ0T5NEaeUPMnaMQo8CsZXozC68XSrVu6tdxZjXrgGayOhOz0Iec?=
 =?us-ascii?Q?cATd6GcDI4h9zv+kWac7hTq7D1tKFFeymQgCGVsOEztwy9la43tGQHGouFPh?=
 =?us-ascii?Q?fZLuDBWXwqbacGADxEFgCYJv7V7rNaA7tB5e/dWc3wwlzxvwbs34HOVkv4t2?=
 =?us-ascii?Q?W2KHOOmuylCzFF0QNfISeuJN4jTxntGITUBy+XyxdfTwcJ7UlM/tw+CRU2bb?=
 =?us-ascii?Q?CSWYN3jg3u2gmCu8lR8=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 07:51:59.3794
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac2c2bc-02a0-4259-072d-08de00bf66b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002323.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8071

Current use of err() has the following issues:
- without setting errno, on error it results in printing e.g.:
 "init-dom0less: writing to xenstore: Success"
 This is very misleading and difficult to deduct that there was a
 failure.
- does not propagate error codes to the caller.
- skips "init_domain failed" message by exiting early.

Replace err() with more informative messages propagating rc when
possible.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 tools/helpers/init-dom0less.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
index a182dce56353..3dd2d74886eb 100644
--- a/tools/helpers/init-dom0less.c
+++ b/tools/helpers/init-dom0less.c
@@ -288,24 +288,33 @@ static int init_domain(struct xs_handle *xsh,
 
         rc = xc_dom_gnttab_seed(xch, info->domid, true,
                                 (xen_pfn_t)-1, xenstore_pfn, 0, 0);
-        if (rc)
-               err(1, "xc_dom_gnttab_seed");
+        if (rc) {
+            printf("Failed to seed gnttab entries\n");
+            return rc;
+        }
     }
 
     libxl_uuid_generate(&uuid);
     xc_domain_sethandle(xch, info->domid, libxl_uuid_bytearray(&uuid));
 
     rc = gen_stub_json_config(info->domid, &uuid);
-    if (rc)
-        err(1, "gen_stub_json_config");
+    if (rc) {
+        printf("Failed to create stub json config\n");
+        return rc;
+    }
 
     rc = create_xenstore(xsh, info, uuid, xenstore_pfn, xenstore_evtchn);
-    if (rc)
-        err(1, "writing to xenstore");
+    if (rc) {
+        printf("Failed to write to xenstore\n");
+        return rc;
+    }
 
     rc = xs_introduce_domain(xsh, info->domid, xenstore_pfn, xenstore_evtchn);
-    if (!rc)
-        err(1, "xs_introduce_domain");
+    if (!rc) {
+        printf("Failed to introduce a domain\n");
+        return 1;
+    }
+
     return 0;
 }
 
-- 
2.43.0


