Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7558B2EE3
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 05:16:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712372.1113026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0C3S-0006l6-FH; Fri, 26 Apr 2024 03:15:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712372.1113026; Fri, 26 Apr 2024 03:15:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0C3S-0006hp-Cg; Fri, 26 Apr 2024 03:15:18 +0000
Received: by outflank-mailman (input) for mailman id 712372;
 Fri, 26 Apr 2024 03:15:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9cwh=L7=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s0C3Q-0006S7-KH
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 03:15:16 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:2408::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 32b41996-037b-11ef-b4bb-af5377834399;
 Fri, 26 Apr 2024 05:15:14 +0200 (CEST)
Received: from CH0PR03CA0299.namprd03.prod.outlook.com (2603:10b6:610:e6::34)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Fri, 26 Apr
 2024 03:15:11 +0000
Received: from CH2PEPF0000009E.namprd02.prod.outlook.com
 (2603:10b6:610:e6:cafe::d8) by CH0PR03CA0299.outlook.office365.com
 (2603:10b6:610:e6::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.34 via Frontend
 Transport; Fri, 26 Apr 2024 03:15:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH2PEPF0000009E.mail.protection.outlook.com (10.167.244.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7519.19 via Frontend Transport; Fri, 26 Apr 2024 03:15:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 25 Apr
 2024 22:15:09 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 25 Apr 2024 22:15:07 -0500
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
X-Inumbo-ID: 32b41996-037b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i2yE4NXzhxNSx+x05jrom/J+vMDhHaS58obvRvujK69bmHdPTxTzC5YLkWyZ4L3SzIS8v5l/Kqh+nCRPNTMghw6bLFV1jC1H/X9yNoolhf18Z8+VsWeA3XsWROJWNKMr/Jg3AeWxA9heTJm/G0lrO78XJLywC+TtzoWh74jVBzYzmCQOfwV7vsW6iPkh9WJPSg/KRM6meIQ41elmGfrKftn9qtJg4hVveMgj81FKL8KUSuXIi1cGWWSFCiXhC2fdIhUb9JHhArXVcuMVzfNUiHVhZgmsSOTcL/eWU3A3WKYFOcCH2yM295InSykozJdK0ZmK+7J/yRrYdTpqbFd+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79RFzyR41EP2xOdusQsL3cCUdGSsRj3jsPfYKcWYOtc=;
 b=n7ZO5fnDW9g4SGd1F6Kgm7I90hxGGvhgyk7yEwbRdSDWx9QUmn/2sx98xael2OcNz5kPY6neIj0lmWwMZRLgVV09jQ7gyPXxYmPg0w5jZoqgfSHYNrroiQoeBxEy9N80kUuPAD43Bl0Sl+VGvTk6tVeAjMHd+6KIMHMBQBs/zQfLRtcu0sMnkvMfCxCvjID67olUOk7YwV17gh4+yErlKRE11QhTYdWhJMkofXPPM6yGJaPo262LVchnpDjKpSbKCI/qVVX5txJ/YRHnZMWoFJtmfQwxqbc3whc3aluEWucbvLBEYBX9F6mHa8wL1q4nUCM1rGAC2302G93IU5b8Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79RFzyR41EP2xOdusQsL3cCUdGSsRj3jsPfYKcWYOtc=;
 b=NRnOHhO1lZLKsIicRAt3TCojVs0+1pl3v/Af0PdQRFaPOhc6D0RRJetTb9aTPbZDz0UvYmk/IMWj2TYldfxjn3xc2sqeOaaqCeuXQQGTZtAQ/fyWFFqw7zYBo4HOMnpAO6auhiXsBbBIkbTw8/DON0A7CwK5y75gBuqCfr6Ri3w=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Henry Wang <xin.wang2@amd.com>, Anthony PERARD
	<anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Alec
 Kwapis <alec.kwapis@medtronic.com>, "Daniel P . Smith"
	<dpsmith@apertussolutions.com>
Subject: [PATCH 1/3] xen/arm/dom0less-build: Alloc magic pages for Dom0less DomUs from hypervisor
Date: Fri, 26 Apr 2024 11:14:53 +0800
Message-ID: <20240426031455.579637-2-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240426031455.579637-1-xin.wang2@amd.com>
References: <20240426031455.579637-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009E:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: f0f1c8d0-ff76-40eb-4c39-08dc659f1516
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BJoor2yhWlS8Q9TdAnalVRMpEbFUVxO0b5hYAxbvRgGOs6N2eGjDERIxxYvs?=
 =?us-ascii?Q?SADjwxZLpKhxadb+I8iN8QRoynRRs9uJVHQQmleyIGhkF+Q2ocI1aAnb/Ykc?=
 =?us-ascii?Q?DvHqWzegwarw9Kc+zm3shTcK1TUuV2isQr6gGOIHTAdA5evZ5I2/eXVtjROn?=
 =?us-ascii?Q?jq9Jd1UoZOnnnwdTbu3TXbGppEt7sF5Kh3u4vuBNrOFAmHNj3nhjR9+lZvT9?=
 =?us-ascii?Q?wMoitP0Zp5b6VKxj9xuFtbyvtoZCVwjrtNwOZdh3V7oIliTQe248KQOMrbwT?=
 =?us-ascii?Q?YcTnKlitV0ytfZnQEyqpzsChNPbvgkbIJSOLUhgqjhXldxLjWsw1r6xh7pXm?=
 =?us-ascii?Q?0KMbxfUJgMmtyXYRvbrbOrEv+6pb0CJBy5cxEU1fMtHJhFdPZAeuRA+tt0LU?=
 =?us-ascii?Q?tilbkfT5y+616RD3JVg5ahXzRIrTjov/PQEvdM4bgJ3AlinqAl6jMyhxIGvt?=
 =?us-ascii?Q?QGGC5WmicMQ8g6J0Nllabziuk0fMy65B/r/naDT4VHnSetVz4G+vy9FLQ5rg?=
 =?us-ascii?Q?1gbOZ842vzjxfJOXJhbS4d0Oaka9wlVsbYQnJAirDm5tA8aGMYt1+YRKkEWN?=
 =?us-ascii?Q?Co4En2pNlqdKry/ijkeRtzbFbHhq/IEHzMPVB2swIvsGeKjWN2oMC9jdTxKq?=
 =?us-ascii?Q?SRgy1NvzjfTNp4KCaNFrCoVNKfAfpwwLnPvwCK5gqJVD6Rhfk69VY2+2TstS?=
 =?us-ascii?Q?mpF8JRpUfnwBpdb9KiNstpuPRMBejkNoknwNU8KhTG0lXExiISo3qzl4hbwg?=
 =?us-ascii?Q?j/A6Ph8c3Apbe1xnq5xpyWrKLXpKVk70c0zw5Cti01Cwv60vgzLOml65qYYo?=
 =?us-ascii?Q?JfTdtgf7Pjx824F0qqtYAUDcDkyaLwCs7kJ7iVqsFwmxeJOf78BbvohXtaX/?=
 =?us-ascii?Q?m77QS5QKaJaCKYcEewnk71M/3iAse7GjkBAYNMmSNWr2NAc/4xMKlBnDhQc2?=
 =?us-ascii?Q?YpmQqwUnS9ZinRJ/fm1tOvWMTINyOzjYi7+dEhK/uyToStl00jgGAEH+x28M?=
 =?us-ascii?Q?bHL8TnwGCe187i7gcZlIyCwyHQfA1semFwAWc5iagUtuNnO7AYiG2fRRznFM?=
 =?us-ascii?Q?mfh9+DQghvONcjmOiHbQGaNzSen5tItee4YknPI1im7I4atCZWebWb0it96J?=
 =?us-ascii?Q?Pmut3bfStCf9VtmGKf1JnQjkOWq8re3RCFdB9LdExKYbpiKPiVhPnzeMyzcv?=
 =?us-ascii?Q?373fqLC6k7broKdiAKTLwvq0EZhyHCHDNJuu0IAWu03krBeV5h0YFTQa9eAc?=
 =?us-ascii?Q?z4RF3Hx0HOZQ9w6dTXWptRLKIyCZmwbVDDRGxFmuBSc2Hw/RsfLc8uPcIyOi?=
 =?us-ascii?Q?s1rzRTu/w+I7N6keUbisRby/Bzz59hN75YlZ6DzUkDN0UgXw5g15L3E2P9fN?=
 =?us-ascii?Q?Jn64pthDO3Dx7aP9cFC1EaiBQD5y?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 03:15:10.7131
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0f1c8d0-ff76-40eb-4c39-08dc659f1516
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442

There are use cases (for example using the PV driver) in Dom0less
setup that require Dom0less DomUs start immediately with Dom0, but
initialize XenStore later after Dom0's successful boot and call to
the init-dom0less application.

An error message can seen from the init-dom0less application on
1:1 direct-mapped domains:
```
Allocating magic pages
memory.c:238:d0v0 mfn 0x39000 doesn't belong to d1
Error on alloc magic pages
```
This is because currently the magic pages for Dom0less DomUs are
populated by the init-dom0less app through populate_physmap(), and
populate_physmap() automatically assumes gfn == mfn for 1:1 direct
mapped domains. This cannot be true for the magic pages that are
allocated later from the init-dom0less application executed in Dom0.
For domain using statically allocated memory but not 1:1 direct-mapped,
similar error "failed to retrieve a reserved page" can be seen as the
reserved memory list is empty at that time.

To solve above issue, this commit allocates the magic pages for
Dom0less DomUs at the domain construction time. The base address/PFN
of the magic page region will be noted and communicated to the
init-dom0less application in Dom0.

Reported-by: Alec Kwapis <alec.kwapis@medtronic.com>
Suggested-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
 tools/libs/guest/xg_dom_arm.c |  1 -
 xen/arch/arm/dom0less-build.c | 22 ++++++++++++++++++++++
 xen/include/public/arch-arm.h |  1 +
 3 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/tools/libs/guest/xg_dom_arm.c b/tools/libs/guest/xg_dom_arm.c
index 2fd8ee7ad4..8cc7f27dbb 100644
--- a/tools/libs/guest/xg_dom_arm.c
+++ b/tools/libs/guest/xg_dom_arm.c
@@ -25,7 +25,6 @@
 
 #include "xg_private.h"
 
-#define NR_MAGIC_PAGES 4
 #define CONSOLE_PFN_OFFSET 0
 #define XENSTORE_PFN_OFFSET 1
 #define MEMACCESS_PFN_OFFSET 2
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd1..40dc85c759 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -834,11 +834,33 @@ static int __init construct_domU(struct domain *d,
 
     if ( kinfo.dom0less_feature & DOM0LESS_XENSTORE )
     {
+        struct page_info *magic_pg;
+        mfn_t mfn;
+        gfn_t gfn;
+
         ASSERT(hardware_domain);
         rc = alloc_xenstore_evtchn(d);
         if ( rc < 0 )
             return rc;
         d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;
+
+        d->max_pages += NR_MAGIC_PAGES;
+        magic_pg = alloc_domheap_pages(d, get_order_from_pages(NR_MAGIC_PAGES), 0);
+        if ( magic_pg == NULL )
+            return -ENOMEM;
+
+        mfn = page_to_mfn(magic_pg);
+        if ( !is_domain_direct_mapped(d) )
+            gfn = gaddr_to_gfn(GUEST_MAGIC_BASE);
+        else
+            gfn = gaddr_to_gfn(mfn_to_maddr(mfn));
+
+        rc = guest_physmap_add_pages(d, gfn, mfn, NR_MAGIC_PAGES);
+        if ( rc )
+        {
+            free_domheap_pages(magic_pg, get_order_from_pages(NR_MAGIC_PAGES));
+            return rc;
+        }
     }
 
     return rc;
diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
index e167e14f8d..f24e7bbe37 100644
--- a/xen/include/public/arch-arm.h
+++ b/xen/include/public/arch-arm.h
@@ -475,6 +475,7 @@ typedef uint64_t xen_callback_t;
 
 #define GUEST_MAGIC_BASE  xen_mk_ullong(0x39000000)
 #define GUEST_MAGIC_SIZE  xen_mk_ullong(0x01000000)
+#define NR_MAGIC_PAGES 4
 
 #define GUEST_RAM_BANKS   2
 
-- 
2.34.1


