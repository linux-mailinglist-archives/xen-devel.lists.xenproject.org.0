Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42751B127B8
	for <lists+xen-devel@lfdr.de>; Sat, 26 Jul 2025 01:59:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058718.1426229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSK8-0007qH-8n; Fri, 25 Jul 2025 23:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058718.1426229; Fri, 25 Jul 2025 23:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufSK8-0007no-32; Fri, 25 Jul 2025 23:59:36 +0000
Received: by outflank-mailman (input) for mailman id 1058718;
 Fri, 25 Jul 2025 23:59:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFeG=2G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1ufSK6-00072I-EL
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 23:59:34 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [2a01:111:f403:2009::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68e3ad12-69b3-11f0-a31e-13f23c93f187;
 Sat, 26 Jul 2025 01:59:33 +0200 (CEST)
Received: from BY5PR17CA0056.namprd17.prod.outlook.com (2603:10b6:a03:167::33)
 by SN7PR12MB8058.namprd12.prod.outlook.com (2603:10b6:806:348::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 25 Jul
 2025 23:59:28 +0000
Received: from SJ5PEPF0000020A.namprd05.prod.outlook.com
 (2603:10b6:a03:167:cafe::f0) by BY5PR17CA0056.outlook.office365.com
 (2603:10b6:a03:167::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8964.22 via Frontend Transport; Fri,
 25 Jul 2025 23:59:27 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF0000020A.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 23:59:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:26 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 18:59:26 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 18:59:25 -0500
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
X-Inumbo-ID: 68e3ad12-69b3-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CyO70a23lTE/qTnTtZIpYHtfSxZEhxBpZ4FwY8fLC0ZhozjMQxls+ZL5/vsMGcv6WVX7wkpT6LGXeUhFoxV5uBKLTA+Rf5duWsES4yjnETW5As2eko0+HmVLdDihmi4SXV1xoomFnOoiAhFfOLkb1hK35fxI3f7gXjhDuWsjHdT9HFdIN4vJowRVOriG+C9GCJEUY1gDYxkq2EafO7/eYCxgGdGFgMHEZa18Jk2c2Yop4YtdAQHyzcUBot0ucHvsAuiLQ3xkXceyVW5ttKAkVmaeID10WeyoLCSz7kHbI7L8LhXJtH+JZJ6lNs240hkMmQexQnQh9BPkvh2lVt1qOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wQE7SFtI6hT+kIWQ8NrT26YUgIJRLT0BB8RPA/WB9bs=;
 b=JQi874UKocq2wOiKunsxdCP8tcUmYPrWB5UbmFwJ6iEQa22kGvsiE5ZIceSMJWt80eheyxX46euzj45h7nN6gor1veX1lD2HHiYMZpkqsqGAcdcPWMSY9ioDCj8RumtHr8X+XgdQbYhOIX29AMUX1Q33CxvwdgF1RyjUP198gLHLXZYewnUjPpBIsyV/csEJPwdoJoVdI/QG1qL/zLucWSyiBLHfiJU95d9aJoP3iHEb+i/opFU+inZiXBXsJTmgVKNi8uj03Re+mK5etakSHIcPbLq6wdBobBFi2riXaCisHozeLs6NyKCSvV/jy05A8ENcjrd5taPNrX9MA7h/Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wQE7SFtI6hT+kIWQ8NrT26YUgIJRLT0BB8RPA/WB9bs=;
 b=TgVrubZLcnDcW2R/1QB/4r2oIAi3z8kHFuY4T8Re0wrLCqnpm8U/fIQPom0Zug/llbyiS6BFkKUsGGY9i/ga7TdbGDNq9qZejK0rqA21r5bEfyT1a/NNBIIPT1+Q+1NT33bYdB0rW2p5mLYReqZBXap4lXWfmKlS6jzEI5Er3g8=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Juergen
 Gross" <jgross@suse.com>, Stefano Stabellini <stefano.stabellini@amd.com>
Subject: [PATCH v5 01/11] xen: Add capabilities to get_domain_state
Date: Fri, 25 Jul 2025 19:58:48 -0400
Message-ID: <20250725235858.666813-2-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250725235858.666813-1-jason.andryuk@amd.com>
References: <20250725235858.666813-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF0000020A:EE_|SN7PR12MB8058:EE_
X-MS-Office365-Filtering-Correlation-Id: 664ec783-96ae-40f9-f102-08ddcbd749b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Rbov8makbMq1IK0KLULG8eRkoWug3Din772B3IcbcXTM9Ijg5J19s6lKoXud?=
 =?us-ascii?Q?PCFimDXUa4WxePgy96a9VvAMXGoD1WNiRXRT1/hAXURsUUVzbTfjYMASo9Q2?=
 =?us-ascii?Q?bQ3N19nT6wzHHy2YAxPFIa9k9BtwZxxtoCWjpdiF1uBpJ6cs/fj+DGjrYd29?=
 =?us-ascii?Q?9uODgP2jpGPXomu5KNIscJ0KDcMK/G9yjBa2uuhafPVx2HVGY3kkno1kI1hj?=
 =?us-ascii?Q?q19Md1UuJ2q84r0MvzharyeYD/1Pdkk1TzbDNTXzAeNQoJdbk67YoYSWuTRP?=
 =?us-ascii?Q?ylLWL+zbcP4ITuVK8+HKeTYTaeg8ANatP5EpahlBa1pqISWXYEN++hoQbp1w?=
 =?us-ascii?Q?FoHn19GaCb9Ogfsrlo4tnbB18c6cxCJriVNWm0Lepo0isMuvb+lcKHYqkp4d?=
 =?us-ascii?Q?Wlb4g9YgeWPaCxc1UacL6MngLNxr/Db4LopbC2EDo/rnCBO8BvBoLi7n2hCl?=
 =?us-ascii?Q?lS4d3fOv3RrNnCgCzidA5f3appPnSyKxhkbhk0sV191rIYDGWLCGpSTKryqB?=
 =?us-ascii?Q?s4Vxlp/k1E/Hl45Fm6XhyK2KRoAR1xZ9indOl9Sp1N/tdgt/rrHk8VY3Nxmj?=
 =?us-ascii?Q?mOLoTWoTRFHLU3ySo+1HldBQiowTdpvOaaU1oa6fQQUAcdmbsZvSvwW92emO?=
 =?us-ascii?Q?mLAfnxodBgKt35taYjZFwJY2ROQefFKXe9Eem29hggDxZbRqzJlFC5NN8sfV?=
 =?us-ascii?Q?6Xr1X1X4gHUtoN1zQOMdCGWW46D6r2nT1LiWs7wujzlReH7G8M0URegDB9GC?=
 =?us-ascii?Q?34gT7ujLDXwkt+3ussQzWpJmzuDluOII2JN7oIfIqyJ2zSSuxg2bFFgIr36C?=
 =?us-ascii?Q?982ANxPfHgsb7GFP0RSYUAdnNeWH85zO/NZ6DbfeJUmoWEToTqv8vmhg26+C?=
 =?us-ascii?Q?Vd71+6Z944VOsUpsV3EJ7DgDiMQXJgNOzu8ByvhI7z09K0scgLaGWlqIyL6j?=
 =?us-ascii?Q?f+1yAt8DckbwYjZHNlJq+iV0JULVzNdRbCqUrtMCrT7w1gpBrkf6jrK4mvts?=
 =?us-ascii?Q?4I+fRhbVpDIKlUr4+fvzF3MD6cf9eLoXLSOWGTdDzz2H0ZCXPltZlledTLPp?=
 =?us-ascii?Q?ZgFhlYl5k6MF5t/3eLhyfgRg2piTtNfdVOJdcmY7DmqOHhj2AjtaZUviLW/z?=
 =?us-ascii?Q?e70ULUc9qQneX4GghPoDLUB8vXbZnO7fUZOuw8zKH+NmoD3us/X0+KnWV8M4?=
 =?us-ascii?Q?vLfc/UYfEmYMtHaBZtcCEvyDK5CIFaYPLSWP0e71gHHYs1RUy1p9fuEYD1Vd?=
 =?us-ascii?Q?ZlDxx98kYQs7wstyVaa67lis+oqhWMRDDrNJf9XwX+h++qQw51++BirP1+Uu?=
 =?us-ascii?Q?bWY4ajrHi6LZlJCtuDFNtT4Cn7GogR7W030h+qXHSdjAPaDsUVJvyxH/z/8V?=
 =?us-ascii?Q?8XvWGrUXtkD2BvXBnEYWqw+cpdiJJ4V6lEWOmxaviJ1ZiQlRsHFkiVqOeWAe?=
 =?us-ascii?Q?V+hDWDVc/jNlzPDd6ET+vPE1aWLCaLvxw3QsPVMfxf5Q+cwoERpvxtbTH/uK?=
 =?us-ascii?Q?5QtqWIqAQfrkeUy5XdgSZb1HzpoppPvCYAgE?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 23:59:27.0390
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 664ec783-96ae-40f9-f102-08ddcbd749b8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF0000020A.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8058

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


