Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4798C745A
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 12:04:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722994.1127502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxq-0006ch-Kz; Thu, 16 May 2024 10:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722994.1127502; Thu, 16 May 2024 10:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7Xxq-0006ZR-G5; Thu, 16 May 2024 10:03:54 +0000
Received: by outflank-mailman (input) for mailman id 722994;
 Thu, 16 May 2024 10:03:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MS9v=MT=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s7Xxo-0005T3-VL
 for xen-devel@lists.xenproject.org; Thu, 16 May 2024 10:03:52 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2416::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 986b2861-136b-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 12:03:52 +0200 (CEST)
Received: from MW4PR03CA0162.namprd03.prod.outlook.com (2603:10b6:303:8d::17)
 by PH0PR12MB7905.namprd12.prod.outlook.com (2603:10b6:510:28b::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Thu, 16 May
 2024 10:03:48 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:8d:cafe::b1) by MW4PR03CA0162.outlook.office365.com
 (2603:10b6:303:8d::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Thu, 16 May 2024 10:03:48 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7587.0 via Frontend Transport; Thu, 16 May 2024 10:03:47 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:46 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 16 May
 2024 05:03:46 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 16 May 2024 05:03:43 -0500
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
X-Inumbo-ID: 986b2861-136b-11ef-909d-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv1u04U91wvqYeyAINSCS4oMSzvqtre4QfoGR/A97lMO1m3nxbh9wtaBHZfZZO3CqPi5UoKmWQWYpClmAqWq3DMjOknDGFDi53PadQDZyUUEGgHt/o7YkV2xS31uGz3z8AwoKNk+RhgBJFEczXbmR/RWRqQCun6Lkt9Qgk7sGwcyAH4O6dqMu7HL02bjKOco12KGlOLG4m12ShST2idV/dIBCcpsktiXYCd9MQdQqW7qAFJ56yZvcL1XGEYj4i/O3V1o8c6h/1iCusImSUQMWus8Sfin683Tm1O+14euR54IKtNxz7vIOezY4rXzmyZaMmWraG7TCTCbXfSRD/AXnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mF2OBpKMBYdkRqVcGsWEJvyB5o1cjSWHP++bO6wuCaM=;
 b=dBPN5QNFY9M/livjelK5E63yc/YObvezt8U44Rus9Tu+ssbngS0J8sM4meJjchV7ukRIPc0AI8OVj1214lLdwaCdJ8zgEes04ZqYsKMx5WEjEbixTfDLtcguve7nXNC3E9jmtsQLKIJsNyb0hFhXDi8hiSSFq0rkpDUfqtlZMfALHfdVYnchyZkvu/pphDaoyGhfv4WePoKCWHkNDfjFBUVLFIAimyLAiZeJl3rkoIr+LO1csTX+ErOVt/NWSOzp9p3erNVQ0AoFR7j6YzET9eqR0Oi8gunVTQ7E1q0UoZqJVKENM51rEVVMmGpJlgHVFZjTtviG2uXrrDx6nQKi1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mF2OBpKMBYdkRqVcGsWEJvyB5o1cjSWHP++bO6wuCaM=;
 b=G3h/kFl2E2YtmsELkOZ2ReZmJo315KXNXkkP3LMrLFk5U2VjCTPTAhcHLrjIe09l8KHSQbBYG2ZnW8WZ84C8xjPiALEcGWQYcHyUCiKZJLy56dpCoTIzUjZtr8U7KFT59tkPpiQialV7HI2ut9yWH4w4CepzXhhICrlsQEa8O98=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Vikram Garhwal <fnu.vikram@xilinx.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>
Subject: [PATCH v2 5/8] xen/arm/gic: Allow routing/removing interrupt to running VMs
Date: Thu, 16 May 2024 18:03:27 +0800
Message-ID: <20240516100330.1433265-6-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516100330.1433265-1-xin.wang2@amd.com>
References: <20240516100330.1433265-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|PH0PR12MB7905:EE_
X-MS-Office365-Filtering-Correlation-Id: 66647cf5-16f1-4d7b-8f9c-08dc758f7a90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w96Id55op/KRIy+G9ieLph2A179n/n4oqikxATjwFbxX3XnYpGnlwv5CBoY5?=
 =?us-ascii?Q?gCyCBGvr3JFYYSKq0/Q2yhstBkogASEmkcK8S8K9gzi+dyc4ck6johJYoADW?=
 =?us-ascii?Q?xRjB50yh8JSl8YmTw24hsMZTrdD63ZSMXHiQCRN6owCf8yqzuHD91RMBmwaK?=
 =?us-ascii?Q?W4R2L5EmzTasfpZ7xn/9nxm2IE62sbqvkSD9habxBKLbRNJz4pUEsZbOLcwt?=
 =?us-ascii?Q?xijpUjI2O6ORlC2PmcNXr0+QNLVTBn1L5Qm5yY4raHvIDD7ACD8vxX0HKwzy?=
 =?us-ascii?Q?Bx8Uez/UDseIebbZDRHG1++DCdE4/qr9PQ9Kdye3rkw9w1QqgjWC6+4AYDiz?=
 =?us-ascii?Q?C59+HszPvu75CerFZd5Y5nTX2Td4MTrKh8lNsMg0sv6ZRSnyE1aGSteVy7mm?=
 =?us-ascii?Q?lMSAFc8dDSNQfQYw0uFLRrTpD1Jn5ycFeguWMUd9ACj7m4pHexRF6JyRdeOA?=
 =?us-ascii?Q?zCjhKk0LFIyhcygnzEori2aJQmlYL1iqE+IWeAwuh6ryRJQ/2NzojxQ+MRw7?=
 =?us-ascii?Q?FluIGDTOm3NF76cmi/Dqs9T33IQN4pAGTjX5yaBZOvny2jN57fwCIWzpN0Zc?=
 =?us-ascii?Q?5X903Z+VYa9dMy93+N2k8RjkZARqxnwZSHhtqaJoZligg3xp/kKzJe99y1oO?=
 =?us-ascii?Q?++uJXTohUhOx4iQyBlLE50j1Rbhjb5DsgvULIKxkgI4zltVHWa6pI9zNJa9Q?=
 =?us-ascii?Q?WxbfuihvvZ8rEZk+gwNcIGVaKaCIInpAlcb4YDl0Lm6qldZKByyiQ2Uu/X2K?=
 =?us-ascii?Q?nlYXGIAsgWJLYGNwLZMaIfeovLbLresF+6pofMuVyjlaLJkT2f8MS1go8y8v?=
 =?us-ascii?Q?9AcMJdCS1gIEIdFFhILbuGDYfQPvYeRq3Ckr1PvSzqfUMRjOC/NOtn27OKSD?=
 =?us-ascii?Q?sX0zHQQfumKUaGmc7N9MeEA+87Xe8A2572G0gb9emUPqREyK/VyQK+ptNLaA?=
 =?us-ascii?Q?wEN7wkzsIztvA3vLSulAMwyZrqdqUaiKHr4DsHfRaCThhvLJLRnZjAs6MNSq?=
 =?us-ascii?Q?Wz9xB2OJH19cT9C4plpO0+0Ui/xjnaq9jZrEWKntnqkSrodi5p7iLreJRPEg?=
 =?us-ascii?Q?5TazlRfty6ZA+eXKCzWfvTU+DNMGWgbGiVcdg9qmyxPpgkx2mpvKbTAx08cQ?=
 =?us-ascii?Q?ZLdSJBjEZw8wfBE4nR+TwHkMLfRoKx/hedp+UEye/hlRtJjq8n/YZ4W8da8v?=
 =?us-ascii?Q?loPkHCWyeXsVCbSjtaGffXiEtCXX9OrBcMNkrWHkpy6yBl98QCEQ4Ri/UUIm?=
 =?us-ascii?Q?NZ+eoePvMu9RPRuOzbkflP5319/s0RumiOklX0flVFSEr5KM5uWHDKP3m2+Q?=
 =?us-ascii?Q?jVPq4ZRYjYeftd2VINhcXmo0dIdsfFVCGk4xp4m66tKL8EM54R/qU8EHJrZH?=
 =?us-ascii?Q?zMFZjRFtYOukK5GEf1pei+4ffKj1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2024 10:03:47.5272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 66647cf5-16f1-4d7b-8f9c-08dc758f7a90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7905

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Currently, routing/removing physical interrupts are only allowed at
the domain creation/destroy time. For use cases such as dynamic device
tree overlay adding/removing, the routing/removing of physical IRQ to
running domains should be allowed.

Removing the above-mentioned domain creation/dying check. Since this
will introduce interrupt state unsync issues for cases when the
interrupt is active or pending in the guest, therefore for these cases
we simply reject the operation. Do it for both new and old vGIC
implementations.

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v2:
- Reject the case where the IRQ is active or pending in guest.
---
 xen/arch/arm/gic-vgic.c  |  8 ++++++--
 xen/arch/arm/gic.c       | 15 ---------------
 xen/arch/arm/vgic/vgic.c |  5 +++--
 3 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index 56490dbc43..d1608415f8 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -444,14 +444,18 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v, unsigned int virq,
     {
         /* The VIRQ should not be already enabled by the guest */
         if ( !p->desc &&
-             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) )
+             !test_bit(GIC_IRQ_GUEST_ENABLED, &p->status) &&
+             !test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) &&
+             !test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
             p->desc = desc;
         else
             ret = -EBUSY;
     }
     else
     {
-        if ( desc && p->desc != desc )
+        if ( desc && p->desc != desc &&
+             (test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
+              test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status)) )
             ret = -EINVAL;
         else
             p->desc = NULL;
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index 44c40e86de..3ebd89940a 100644
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
@@ -167,13 +159,6 @@ int gic_remove_irq_from_guest(struct domain *d, unsigned int virq,
     ASSERT(test_bit(_IRQ_GUEST, &desc->status));
     ASSERT(!is_lpi(virq));
 
-    /*
-     * Removing an interrupt while the domain is running may have
-     * undesirable effect on the vGIC emulation.
-     */
-    if ( !d->is_dying )
-        return -EBUSY;
-
     desc->handler->shutdown(desc);
 
     /* EOI the IRQ if it has not been done by the guest */
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index b9463a5f27..785ef2b192 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -877,7 +877,7 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *vcpu,
     if ( connect )                      /* assign a mapped IRQ */
     {
         /* The VIRQ should not be already enabled by the guest */
-        if ( !irq->hw && !irq->enabled )
+        if ( !irq->hw && !irq->enabled && !irq->active && !irq->pending_latch )
         {
             irq->hw = true;
             irq->hwintid = desc->irq;
@@ -887,7 +887,8 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *vcpu,
     }
     else                                /* remove a mapped IRQ */
     {
-        if ( desc && irq->hwintid != desc->irq )
+        if ( desc && irq->hwintid != desc->irq &&
+             (irq->active || irq->pending_latch) )
         {
             ret = -EINVAL;
         }
-- 
2.34.1


