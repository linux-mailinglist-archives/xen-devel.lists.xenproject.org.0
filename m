Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B6BE8B2EE0
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 05:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712373.1113036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0C3Z-00073E-OT; Fri, 26 Apr 2024 03:15:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712373.1113036; Fri, 26 Apr 2024 03:15:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0C3Z-0006zu-LP; Fri, 26 Apr 2024 03:15:25 +0000
Received: by outflank-mailman (input) for mailman id 712373;
 Fri, 26 Apr 2024 03:15:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9cwh=L7=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s0C3X-0006yc-SN
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 03:15:23 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:200a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 36945780-037b-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 05:15:21 +0200 (CEST)
Received: from CY5PR03CA0010.namprd03.prod.outlook.com (2603:10b6:930:8::18)
 by BL1PR12MB5778.namprd12.prod.outlook.com (2603:10b6:208:391::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.48; Fri, 26 Apr
 2024 03:15:18 +0000
Received: from CY4PEPF0000EE3C.namprd03.prod.outlook.com
 (2603:10b6:930:8:cafe::b5) by CY5PR03CA0010.outlook.office365.com
 (2603:10b6:930:8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.23 via Frontend
 Transport; Fri, 26 Apr 2024 03:15:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3C.mail.protection.outlook.com (10.167.242.16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 03:15:16 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 22:15:16 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 22:15:12 -0500
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
X-Inumbo-ID: 36945780-037b-11ef-909a-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbGmz2BO2gqZWZRz4mAacfOjOhL9G9G3ZqWIKRVIXilya8dCvw6orfFANiyGpvslaoGLtsEWRya9376dMB7DTLtJHE0pWaHYzPwTWvmZioUpLslkMnfj4cVu4CWj4X8rDB6dVVIW+fB4d42sOvS+3saKQ3s23WGS07MH9GZ+Ewk1Pbyd2fgtiNCImqmQSA7c7LevKbVp1fMjUUJGfmuKTOmpzuGE9eLQQIeaywSBXKhlSw5mkFpq2XIsZ4+7ezYqtUFAyQQ+pZpX8j/LwinFLJGgBkQlZ4sPijNx7reeq4Pih6OnnsWeTdzbuci+BkQIPMLsewGj+D+NC23nh3jVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hoINEpwEgGiddQ725fJgeiRoPqfe/wX4qgGl/EaGEJc=;
 b=G7FKfwHv5G3Z4JgaGKlqwQdAbgJWq5mZYhRZLeegnG4CfIsttFQYF+LQzrmQmh9jkn2TSWBnCks8GW4ZhRR4T+758OFB3SB4vEUxtQhUjxm2wePC1f78XHwqA97Yw56gWr1BtqZXylMSF1MbX5j84hRTFGONqKjdsg38oii7W7fy6Go1wcOtiZlh4GtydRRrkHVEoNjPnZVhV8PgFBBGZ3KKKXSUNNBDmWF9ZLNEuSTz5K9WPYJKyyrcV4ziAGAxbm5560QYBpFlMckaIIG/oHjZw5biPCgpLLMkKqyd2xC/eK66TcbmZNX4U3OtivpQw5J99QPH8fHugPDlr1TupQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hoINEpwEgGiddQ725fJgeiRoPqfe/wX4qgGl/EaGEJc=;
 b=dbBBrRI7KSsUoqgw+xpwqSOpPCSq+z3QSFvZdhWte8gPRpjk0feuHF1HuXlZb9VMGhp+dkZ1LM8Kc/Q+d8xUxdq2/+CQXOKYTagNfxmcaXKC/PSNHHrPGgvssmqPOZlO2BGS9AYqoibVS4EFkTqxKX/q2GFit/MUrTvvrd/9QuQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Alec Kwapis
	<alec.kwapis@medtronic.com>
Subject: [PATCH 2/3] xen/arm, tools: Add a new HVM_PARAM_MAGIC_BASE_PFN key in HVMOP
Date: Fri, 26 Apr 2024 11:14:54 +0800
Message-ID: <20240426031455.579637-3-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426031455.579637-1-xin.wang2@amd.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3C:EE_|BL1PR12MB5778:EE_
X-MS-Office365-Filtering-Correlation-Id: 640962ea-cd20-4f0b-3f02-08dc659f18b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Fe5k8i/1h54zu1P00NTC8m4VgasSQicyS/hOPdn9T+DaDo8Cx3QFGFHKu8uG?=
 =?us-ascii?Q?Ryy3xKiq2Ufn3VCHzDRYc1Ji1hJH4kOvAJRfXH76PIwoiORwX4sIp5u99brX?=
 =?us-ascii?Q?PMQcrbpSXptWJkaBnRpo4HuNDKrzJM7I5skxD0NmaV9ouErfhkr9/+gGPQL2?=
 =?us-ascii?Q?ucM8htcJc0KtfW+JgiqyjlJotK1rgMX1dITd/6B0DffPNrvv/0j9wheuarCi?=
 =?us-ascii?Q?7hxuVEiJaRqdglB5yj8qMAC4g1wzaG+w34FLinuvw9+0SfiIrO8m302S64fV?=
 =?us-ascii?Q?Mx2A/SHTwzOzsBkmPDps38b9AEQuQyWwWphGWJtSaKVH4Fj302pr60oDYYxH?=
 =?us-ascii?Q?h/Oj7tbG86peVnKd+SXbkfeUixiDnJ2fEfTgl7eXM91g5WViwYpXWQzG3S3N?=
 =?us-ascii?Q?QFAMVHuTC8l3bvx8qFpgSAnSI2XRVPH6Lb9mZumtgdgVcy48LlkAow40OoIM?=
 =?us-ascii?Q?7yZXI19dcwuLchIZp0Dhi8VQVTV7qqAdWs2LWL3Yc/nsxRgBBzALvKODCrc8?=
 =?us-ascii?Q?qdOYjtoUJgk7dpCciPn4WXY35DSGAkOfSAdPeAxLKizAWA0aKyGmX7JGZuQE?=
 =?us-ascii?Q?w5cnYzT3PSaF2q0chmBMZNzRsWnpddIlZ/R7WrzfVpQdjy9EbKILSEfN07V/?=
 =?us-ascii?Q?ehoCtwb+bWC7AAVavMyHa5JWa3F6YGXbwCtIGPLzw74sh/fYRim7vllEKp7K?=
 =?us-ascii?Q?OEw/rwAUu25pSD5h/d5p+Ql5udIgdhq43QQNr5Cr3TrsbWzITIQY0MAXjGIb?=
 =?us-ascii?Q?oCG9Z26wY+PDauuwh3uGDSPUjJLqEBQKdX1wvYGOEjkRfNY0DzuwUmyfh4Gg?=
 =?us-ascii?Q?gFqLkgPGv7206Zw1VwInTg96X++RmPKqRJ7mFn8ofmjP+bVhi2+MKtg84uA1?=
 =?us-ascii?Q?EgS89nApNrESw1vMqj/w0+Y57es2NqrwE+650Jt1iUlQ+v2Zm/h6AHWg+BTK?=
 =?us-ascii?Q?0cx13OAcoVlg+q2f8hfQNpQ8qWAvkBe8JeVLc8cYznWeERz/jlrFgFl/CjSU?=
 =?us-ascii?Q?FHqX7zEqkAxjW7MrZmORfxMdPLhITnhCnU3sM6nPY7fEsvJxr7OjBqslRibp?=
 =?us-ascii?Q?3Zi20KoH/jZ5XnffJPbjouV1CeAcUPWipIIT9F+TJHMov1CBKKQyPt/gXWLe?=
 =?us-ascii?Q?FmFcxDHW8R2GyAbObftKf+fZIu0GYexA9Z20PuB1L9QbcDXIuH/lGwOBiFVX?=
 =?us-ascii?Q?TbPwsuYttD3lMTQ04NFGf5e70MvJpyli0S1Y7fRtTkSXHGgcSZ5pBU9K6bUx?=
 =?us-ascii?Q?ra5LoUN9M2AfKzPFsp5cYN79WjHcnrZCVRPe4hUKiaN3JD+wtFMJi3qg7CR8?=
 =?us-ascii?Q?orWFTRmky6MqmoDPZyUs0SFMng1K8sH15OAcZUsogVM/hVpmZSJL7RXk5Df5?=
 =?us-ascii?Q?8LIPhzRLfZ9YvpabDfcTvMics3MS?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(36860700004)(1800799015)(7416005)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 03:15:16.7214
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 640962ea-cd20-4f0b-3f02-08dc659f18b2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5778

For use cases such as Dom0less PV drivers, a mechanism to communicate
Dom0less DomU's static data with the runtime control plane (Dom0) is
needed. Since on Arm HVMOP is already the existing approach to address
such use cases (for example the allocation of HVM_PARAM_CALLBACK_IRQ),
add a new HVMOP key HVM_PARAM_MAGIC_BASE_PFN for storing the magic
page region base PFN. The value will be set at Dom0less DomU
construction time after Dom0less DomU's magic page region has been
allocated.

To keep consistent, also set the value for HVM_PARAM_MAGIC_BASE_PFN
for libxl guests in alloc_magic_pages().

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/libs/guest/xg_dom_arm.c   | 2 ++
 xen/arch/arm/dom0less-build.c   | 2 ++
 xen/arch/arm/hvm.c              | 1 +
 xen/include/public/hvm/params.h | 1 +
 4 files changed, 6 insertions(+)

diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 8cc7f27dbb..3c08782d1d 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -74,6 +74,8 @@ static int alloc_magic_pages(struct xc_dom_image *dom)
     xc_clear_domain_page(dom->xch, dom->guest_domid, base + MEMACCESS_PFN_OFFSET);
     xc_clear_domain_page(dom->xch, dom->guest_domid, dom->vuart_gfn);
 
+    xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_MAGIC_BASE_PFN,
+            base);
     xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_CONSOLE_PFN,
             dom->console_pfn);
     xc_hvm_param_set(dom->xch, dom->guest_domid, HVM_PARAM_STORE_PFN,
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 40dc85c759..72187c167d 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -861,6 +861,8 @@ static int __init construct_domU(struct domain *d,
             free_domheap_pages(magic_pg, get_order_from_pages(NR_MAGIC_PAGES));
             return rc;
         }
+
+        d->arch.hvm.params[HVM_PARAM_MAGIC_BASE_PFN] = gfn_x(gfn);
     }
 
     return rc;
diff --git a/xen/arch/arm/hvm.c b/xen/arch/arm/hvm.c
index 0989309fea..fa6141e30c 100644
--- a/xen/arch/arm/hvm.c
+++ b/xen/arch/arm/hvm.c
@@ -55,6 +55,7 @@ static int hvm_allow_get_param(const struct domain *d, unsigned int param)
     case HVM_PARAM_STORE_EVTCHN:
     case HVM_PARAM_CONSOLE_PFN:
     case HVM_PARAM_CONSOLE_EVTCHN:
+    case HVM_PARAM_MAGIC_BASE_PFN:
         return 0;
 
         /*
diff --git a/xen/include/public/hvm/params.h b/xen/include/public/hvm/params.h
index a22b4ed45d..c1720b33b9 100644
--- a/xen/include/public/hvm/params.h
+++ b/xen/include/public/hvm/params.h
@@ -76,6 +76,7 @@
  */
 #define HVM_PARAM_STORE_PFN    1
 #define HVM_PARAM_STORE_EVTCHN 2
+#define HVM_PARAM_MAGIC_BASE_PFN    3
 
 #define HVM_PARAM_IOREQ_PFN    5
 
-- 
2.34.1


