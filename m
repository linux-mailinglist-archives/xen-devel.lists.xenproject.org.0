Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EAF8CDF6C
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 04:18:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728985.1134100 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW5-0004R3-5W; Fri, 24 May 2024 02:18:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728985.1134100; Fri, 24 May 2024 02:18:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAKW4-0004OY-Tx; Fri, 24 May 2024 02:18:44 +0000
Received: by outflank-mailman (input) for mailman id 728985;
 Fri, 24 May 2024 02:18:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAKW3-0003tc-Aw
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 02:18:43 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20601.outbound.protection.outlook.com
 [2a01:111:f403:2412::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f02977bf-1973-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 04:18:42 +0200 (CEST)
Received: from MW4PR04CA0078.namprd04.prod.outlook.com (2603:10b6:303:6b::23)
 by PH7PR12MB9202.namprd12.prod.outlook.com (2603:10b6:510:2ef::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 02:18:37 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::5e) by MW4PR04CA0078.outlook.office365.com
 (2603:10b6:303:6b::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22 via Frontend
 Transport; Fri, 24 May 2024 02:18:36 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 02:18:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 21:18:32 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 21:18:31 -0500
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
X-Inumbo-ID: f02977bf-1973-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+oOt94oKv7T9anVoojoQ2aQupFhYcyms6MN4ZJUxkgGKyV7SOeL1eoG1czNxiDCT3Wv41uE/WssM3QHtG1HYsJmBvxeXnRav7esw0ITS8cExVKmPsGyNGTAABMOEGv9JsOczd17BLY24gqdG8zlype73oh12aWAHfIX/mf79DrtEWoy37H+Gk+QFw2Gdqx9f9O7V2uYEtXw7chSTLSNcjcopqKJ2bvHUApbpFOpYFTCGm/WYJkorgHAiuYrTSNF+i9OcCyoPZ2PV29wAcfzjAY6tQogjuyDvT4+b6phGoyuPJPgOkr8C/A1q5bZeZ9vDFgEg1w0b2Vvj1PRuoOiTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUxLvykGPrn0TdFclj7NWwLQlt3XRena1NmCNYfl8WY=;
 b=kOHAkf8zFzgffGuktIgxoefAhdk7IO3sZwPyYyrQEZtfy6CphD985vHT2HIVG1Rve4b4cRcKdxQMJvbPDGDbiP7ZeGOUxItXDkulg1tjRDuVF8YMVBWczd55daSr5mzzWqtvr7P3ubKdyPIkHowD7B2HUx8esZSNRdgYvOCgcBr3eibBgnXPzYI53ow5wknpvp/rGAZnYJSNYs9G3bEpEq6qRVh+Dm5Iy+gG9hHrQWYhanWatm19yP6eKEpaSaiAYmuw4DN4F1V+C8oHyqpEbq/UbKDNArXv+0J0biTVT5Fjykh2ZnIoltmuNxmk6JGjsrCvvn4H5i7ed0vyc5BtQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUxLvykGPrn0TdFclj7NWwLQlt3XRena1NmCNYfl8WY=;
 b=xNoUp4SBKWr0BOsbJwkmTaOnbTNp6wYpQjmn3AdCAvG08lon9xk40uOTwGl8f4DjnMzH4k/6jdLl10EiRXcIoGvscVRT4BJKLEVC82K4mD+oPk4Z91zjqsUSXH0y3u7pmZi7YSRl6oNs/oljEIkqxxrkAoIc0E/2Z2u6Ge8W3JM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v5 4/7] xen/arm/gic: Allow adding interrupt to running VMs
Date: Thu, 23 May 2024 19:18:11 -0700
Message-ID: <20240524021814.2666257-4-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405231914360.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|PH7PR12MB9202:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea84ffd-f719-4948-71b9-08dc7b97d1c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|1800799015|376005|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5Kfs9OGs6EUji5agDbShs9dUhfuVFkFUkPASr4/FE9kDWmBylwHxf2AnAG2Q?=
 =?us-ascii?Q?EHxqTwSng8cZMvmoqbpdhMdSgX4httlMo9Kh8P0xU5Hhh1kM1LudrjUyjKrj?=
 =?us-ascii?Q?CZyT72h8XUyLPFbQQeDGK5D6iQAuXd70FOtthS+r815pbM+e19tRslRO0b9A?=
 =?us-ascii?Q?SThM2jNAbjPN0diH4p4JWInRcC2uEWTupT87amcXdDeCF6qefNBoDtJCQpuK?=
 =?us-ascii?Q?6M8H7ms4/Ib/CGtKYBd9CwdHNrMTIzDIq9hun0z4KMSi5NHce2ry61KxRGVV?=
 =?us-ascii?Q?JRWHwNgQmLasYHI1mgm2Rb5rUhz10dfzWFeGZ3iFWpvdJtaO+WxYzIPX89NU?=
 =?us-ascii?Q?BMGIaZfxfSQRsSl9OD8PCYJZIlKBHrhvViYwJWbFjWZNeFDQHgbkt8O8UbIN?=
 =?us-ascii?Q?wEOxx/HK7r2Pl/s50965EgK8OMoq6k4DnDGCLNsmoLv/NrDAIi81qVdHtZBe?=
 =?us-ascii?Q?Fc86+jzSygvLXxSqzzI2nPdm63vxgrHmCO/ZZH55LD84CWPDo1BK0MfaeQga?=
 =?us-ascii?Q?s7QurGFQpSE+ca9k43licMmDctNuOPTXgEN+NVWOtLPthvVh389vucFdGHla?=
 =?us-ascii?Q?6XtIMSLhUf9fquyJYIhBr1IhnI9Ufv0u+ftV1T4SXLcy8DwSw1qSQuazzPbl?=
 =?us-ascii?Q?KLBUDE/I8SDYHG/qMk+YXLFV7PP2/nySjI55hhnMdGfx97JQAQ+CftYsy3bA?=
 =?us-ascii?Q?Leb96KISCwmue/xSswO0D9t8XDZYcddOFOqYrHxR5FhfLgWir8IaMoPHL78f?=
 =?us-ascii?Q?NysTlhpIpNed1yBf+F49z86vJjm3xqCXAAWIssdu9chmEJccGwfSzGKkK+Z1?=
 =?us-ascii?Q?x+Y7Gpm5JFAgDZdFStcKZvpfhwfDRFa6S19LRGYhX5BB+efqQsnljHzgyavD?=
 =?us-ascii?Q?BmqHNoQVCb2cFFKc3/XNvozVaeT+poQwmur8S/vnPCsrX2wPNTuluUd/irx6?=
 =?us-ascii?Q?Xzc1xb4+JZ5qBZZPykLN7SIG1oXBFTZalE2eNelPkxQxMtYPsdl/7UbT1k8i?=
 =?us-ascii?Q?51dVd2RGamVfWXIBKicmbQAHrzGqLj8pHYTKeZ6sqckQ6Mj9i4wj2ivmcgHV?=
 =?us-ascii?Q?hOMY5t4YKvwdNuTY/0EyLH1tZidxZ9fHH6cxVhmW+p0ujDk7DVfKAgtZhrst?=
 =?us-ascii?Q?LCp/9St9xoIRnCcp6JhRsyYpoR71scN1qVj5DJMKB7/2KOmiKu1iYdRiMXqq?=
 =?us-ascii?Q?xifCS2geNMDxRAA9Od7C+ljLWb+pAp6sxk5orf0A1/Z3N2pFRcMOIwSL7pAM?=
 =?us-ascii?Q?YxO3pXjEnQKHudUsO/qpfwxH5G8BO6M+oRXYFOoFzycDMIM3CjBVJpgd0LBo?=
 =?us-ascii?Q?wGOtMMTSZaPrsZIUS+6V1ZfWaza8vFKCSkqoOcWUg3TfYjLxJwhXL3fr3WJU?=
 =?us-ascii?Q?ZqCO7vAGaPXMMwDcZSg+gfDim3Xv?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(1800799015)(376005)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 02:18:36.8123
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea84ffd-f719-4948-71b9-08dc7b97d1c9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9202

From: Henry Wang <xin.wang2@amd.com>

Currently, adding physical interrupts are only allowed at
the domain creation time. For use cases such as dynamic device
tree overlay addition, the adding of physical IRQ to
running domains should be allowed.

Drop the above-mentioned domain creation check. Since this
will introduce interrupt state unsync issues for cases when the
interrupt is active or pending in the guest, therefore for these
cases we simply reject the operation. Do it for both new and old
vGIC implementations.

Signed-off-by: Henry Wang <xin.wang2@amd.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/gic-vgic.c  | 9 +++++++--
 xen/arch/arm/gic.c       | 8 --------
 xen/arch/arm/vgic/vgic.c | 7 +++++--
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index 56490dbc43..b99e287224 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -442,9 +442,14 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v, unsigned int virq,
 
     if ( connect )
     {
-        /* The VIRQ should not be already enabled by the guest */
+        /*
+         * The VIRQ should not be already enabled by the guest nor
+         * active/pending in the guest.
+         */
         if ( !p->desc &&
-             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
+             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
+             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) &&
+             !test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
             p->desc = desc;
         else
             ret = -EBUSY;
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 44c40e86de..b3467a76ae 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -135,14 +135,6 @@ int gic_route_irq_to_guest(struct domain *d, unsigned int virq,
     ASSERT(virq < vgic_num_irqs(d));
     ASSERT(!is_lpi(virq));
 
-    /*
-     * When routing an IRQ to guest, the virtual state is not synced
-     * back to the physical IRQ. To prevent get unsync, restrict the
-     * routing to when the Domain is been created.
-     */
-    if ( d->creation_finished )
-        return -EBUSY;
-
     ret = vgic_connect_hw_irq(d, NULL, virq, desc, true);
     if ( ret )
         return ret;
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index b9463a5f27..6cabd0496d 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -876,8 +876,11 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *vcpu,
 
     if ( connect )                      /* assign a mapped IRQ */
     {
-        /* The VIRQ should not be already enabled by the guest */
-        if ( !irq->hw && !irq->enabled )
+        /*
+         * The VIRQ should not be already enabled by the guest nor
+         * active/pending in the guest.
+         */
+        if ( !irq->hw && !irq->enabled && !irq->active && !irq->pending_latch )
         {
             irq->hw = true;
             irq->hwintid = desc->irq;
-- 
2.25.1


