Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA316C6A1F
	for <lists+xen-devel@lfdr.de>; Thu, 23 Mar 2023 14:57:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513888.795593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLRE-0000Xs-NC; Thu, 23 Mar 2023 13:57:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513888.795593; Thu, 23 Mar 2023 13:57:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pfLRE-0000VZ-Jl; Thu, 23 Mar 2023 13:57:08 +0000
Received: by outflank-mailman (input) for mailman id 513888;
 Thu, 23 Mar 2023 13:57:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7ZVY=7P=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pfLRD-0000GC-5U
 for xen-devel@lists.xenproject.org; Thu, 23 Mar 2023 13:57:07 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20619.outbound.protection.outlook.com
 [2a01:111:f400:7e89::619])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 938dcb77-c982-11ed-b464-930f4c7d94ae;
 Thu, 23 Mar 2023 14:56:59 +0100 (CET)
Received: from BN8PR15CA0072.namprd15.prod.outlook.com (2603:10b6:408:80::49)
 by PH0PR12MB8049.namprd12.prod.outlook.com (2603:10b6:510:28f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Thu, 23 Mar
 2023 13:57:00 +0000
Received: from BL02EPF0000EE3D.namprd05.prod.outlook.com
 (2603:10b6:408:80:cafe::db) by BN8PR15CA0072.outlook.office365.com
 (2603:10b6:408:80::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.38 via Frontend
 Transport; Thu, 23 Mar 2023 13:57:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0000EE3D.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6178.30 via Frontend Transport; Thu, 23 Mar 2023 13:57:00 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 08:56:59 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 23 Mar
 2023 08:56:46 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Thu, 23 Mar 2023 08:56:45 -0500
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
X-Inumbo-ID: 938dcb77-c982-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hXpOGdMrazuz1ETuqXe+hhMDpaK4iKvmBp1fglZgwV6ErdVxEr7NA2LXHbH2yY/xLAQUjqNTv4IWNMetHO7ktY1b6MHZjEMuUtIzONetqidmmuc0zf5w0q0V6xGh3GW2YJ7qvOUlaDfcqWzwBeVWiqvuC9OA4DCq/BtQj5+YrBqxNc/SKb+DIGadgrDvdOOgL1sROofBkpsI/JprA1CFU0nkiVkCaN40iZsiXvosH4ykMsqTDhW4X+vldC5/U2Yq1wW8iX0osTOZ8yF6BWk1Dor2iU+zeshEYmPC3NyYHihNd+lfixET7Wz4Iuv3i0To/zgG+LFV3Rh6PDxvjQbzGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ToounznfMNd5yVA96KMkq0Sokt6TSD7jFIpRIWRezZI=;
 b=OT9509P6Q4cTgZ9XqiKm8R8mt7vFyeBB/fq4sdqXaHvMJBqr2eK9OM8FQBBygqPy51x/E71Z+9fQbx5lL98YPv89uGpm77aFKt7Jo3U+SbsdjdbSK4n+JA17W4d2I9U+DpHYnJhBNAnuKRnjjY3IvMKzEkURoju0bAYj+rfhl+9p1tVRSjR2GwsCfAVr71oFQ1kOcsJTdh5kwcYYRZDio95Y/R/XiFHnQRbhA+ozb8OAuMhK53opVnYcPY18pvNOW2/TTzLbxO5ogi0xSOCTq/ShjKoH/nFX8QQkYMssirou8tpEdzW/9FRwTBLSsyoBqFIickz3rPI66wGlXd95Ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ToounznfMNd5yVA96KMkq0Sokt6TSD7jFIpRIWRezZI=;
 b=CBpRrSIb16+HdJLRKBSCkvr0tHPm0LK73fhtrb+ujLWQtXOkbGuuebACmXbCULT646GIt23Gp2Z2rWvdSYIpmco03N3fFLlKCP2toUWGOYVnzwrNCwxezSuKuk/oYqlikSzmxbLkJD7oyEjBSZrsAoJa1kBH2kJI4ZvyvwIOi14=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/2] xen/arm: vpl011: Fix domain_vpl011_init error path
Date: Thu, 23 Mar 2023 14:56:36 +0100
Message-ID: <20230323135636.25318-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230323135636.25318-1-michal.orzel@amd.com>
References: <20230323135636.25318-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000EE3D:EE_|PH0PR12MB8049:EE_
X-MS-Office365-Filtering-Correlation-Id: 8452632d-e581-49d8-55d7-08db2ba67951
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZYbE9kVFxm6s9horrTYr+uMuGVJSt4ZOoHtpkN5gckCqe8VkH48wdqOOj99qByJUcz55RLnkRta1WaqUL6A7gQj6ci8hSCQHJqgTqj3CdJSbTa9Q7T3zuFHDM26NNCnNdyEKmfG9Co67Wbw9Hsq7JkgsJDipsmRfdsDkG1c44Pl9e39EvSfxw7VJeomyogLGxmmU/+ajUMs8McQ7Z8KFp9v2bBd1us3Hh5/jL79IHEla57DN3ap5qyKTU15Rb2/VE570PMrLPB1fc2fCD9ZyDyKBEmEC8TqtJmrm5EK+OSf6sZtrsQ9VVL6RAOAcc7IE1mtvpGx20MWETyrmMHe2PtQDXLNG4vWW1qcyZDoBnOuptbpwedppGI/NnuWGYJmlVHOvZYnrWuAi8DOrShhwcp63t2ZBXMDheQWbN6cOuyBwSvtm8A0dzrqHJJoU1ZaWFww6655mCCXKHTeY/eJtMPqBIMvGt6vH2xOBmAWv75bDQ9GgR4pPgFY0fA31wARgDJYnLX69CjLMKQu3YNvMKYXNtRR5xIZs7TM2vpnTi/q7cdym0zCdEK8UIytmJO92joAYbfWlCM7RahR6yphqSVM2WGCzY4Pi1tZiMxbP6nqfG8pKWWq+INiHGhvmVpYx1ZwXQva6vK2T6jZobnvfTOCMPBn+7qFIgu9eFy+4oCEETYGpprdv1gnM9ullXcEuAtyRPDSE7ptwdiy/1/uMf9N7OZ7RrMjATAvPMBtPaic=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230025)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199018)(46966006)(40470700004)(36840700001)(41300700001)(5660300002)(6916009)(4326008)(8676002)(2906002)(40460700003)(44832011)(36860700001)(82740400003)(356005)(81166007)(86362001)(36756003)(26005)(6666004)(1076003)(478600001)(70586007)(70206006)(316002)(8936002)(40480700001)(82310400005)(83380400001)(47076005)(54906003)(426003)(336012)(2616005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2023 13:57:00.2527
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8452632d-e581-49d8-55d7-08db2ba67951
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0000EE3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8049

When vgic_reserve_virq() fails and backend is in domain, we should also
free the allocated event channel.

When backend is in Xen and call to xzalloc() returns NULL, there is no
need to call xfree(). This should be done instead on an error path
from vgic_reserve_virq(). Moreover, we should be calling XFREE() to
prevent an extra free in domain_vpl011_deinit().

In order not to repeat the same steps twice, call domain_vpl011_deinit()
on an error path whenever there is more work to do than returning rc.
Since this function can now be called from different places and more
than once, add proper guards, use XFREE() instead of xfree() and move
vgic_free_virq() to it.

Take the opportunity to return -ENOMEM instead of -EINVAL when memory
allocation fails.

Fixes: 1ee1e4b0d1ff ("xen/arm: Allow vpl011 to be used by DomU")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Changes in v2:
 - make use of domain_vpl011_deinit() to prevent code duplication
 - use XFREE() instead of xfree()
---
 xen/arch/arm/vpl011.c | 47 +++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 541ec962f189..2fa80bc15ac4 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -696,8 +696,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         vpl011->backend.xen = xzalloc(struct vpl011_xen_backend);
         if ( vpl011->backend.xen == NULL )
         {
-            rc = -EINVAL;
-            goto out1;
+            rc = -ENOMEM;
+            goto out;
         }
     }
 
@@ -705,7 +705,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     if ( !rc )
     {
         rc = -EINVAL;
-        goto out2;
+        goto out1;
     }
 
     vpl011->uartfr = TXFE | RXFE;
@@ -717,15 +717,8 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
 
     return 0;
 
-out2:
-    vgic_free_virq(d, vpl011->virq);
-
 out1:
-    if ( vpl011->backend_in_domain )
-        destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
-                                vpl011->backend.dom.ring_page);
-    else
-        xfree(vpl011->backend.xen);
+    domain_vpl011_deinit(d);
 
 out:
     return rc;
@@ -735,17 +728,37 @@ void domain_vpl011_deinit(struct domain *d)
 {
     struct vpl011 *vpl011 = &d->arch.vpl011;
 
+    if ( vpl011->virq )
+    {
+        vgic_free_virq(d, vpl011->virq);
+
+        /*
+         * Set to invalid irq (we use SPI) to prevent extra free and to avoid
+         * freeing irq that could have already been reserved by someone else.
+         */
+        vpl011->virq = 0;
+    }
+
     if ( vpl011->backend_in_domain )
     {
-        if ( !vpl011->backend.dom.ring_buf )
-            return;
+        if ( vpl011->backend.dom.ring_buf )
+            destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
+                                    vpl011->backend.dom.ring_page);
+
+        if ( vpl011->evtchn )
+        {
+            free_xen_event_channel(d, vpl011->evtchn);
 
-        free_xen_event_channel(d, vpl011->evtchn);
-        destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
-                                vpl011->backend.dom.ring_page);
+            /*
+             * Set to invalid event channel port to prevent extra free and to
+             * avoid freeing port that could have already been allocated for
+             * other purposes.
+             */
+            vpl011->evtchn = 0;
+        }
     }
     else
-        xfree(vpl011->backend.xen);
+        XFREE(vpl011->backend.xen);
 }
 
 /*
-- 
2.25.1


