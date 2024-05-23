Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 253B08CCD2D
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728101.1132932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34Y-0003jA-Th; Thu, 23 May 2024 07:41:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728101.1132932; Thu, 23 May 2024 07:41:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34Y-0003gE-Ol; Thu, 23 May 2024 07:41:10 +0000
Received: by outflank-mailman (input) for mailman id 728101;
 Thu, 23 May 2024 07:41:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34W-0003CF-VT
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:41:08 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cdf34002-18d7-11ef-b4bb-af5377834399;
 Thu, 23 May 2024 09:41:03 +0200 (CEST)
Received: from CH0PR03CA0441.namprd03.prod.outlook.com (2603:10b6:610:10e::34)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18; Thu, 23 May
 2024 07:40:59 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::99) by CH0PR03CA0441.outlook.office365.com
 (2603:10b6:610:10e::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.18 via Frontend
 Transport; Thu, 23 May 2024 07:40:59 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:40:58 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:40:57 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:40:55 -0500
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
X-Inumbo-ID: cdf34002-18d7-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RBUWCnqg9UeHYedJVl/R9pfYRSQPbqjaNn7+kPZ1VzeYDdGsRAp6XO47j2WTc9R8hM4UNNlWKMNw9MswuMqsmKEnjdMfgGqrE4wyf3xQ5L0TofVKYiwN/gtb9hkGr8TqbdvBzej0OAR6vc5DxmMLvGN0qg4FskHGYTkKxlhZ63v0cofGYvrswBoEhfCeZ8RopH0nWDa1LGDZsA/ec4cxH9Zj+CN4JI0T4+i/Q7sIZD1vJQ/3sudVXdI5ooolnAkTZcHZi2yu8B501MN90jnYqJ6+zAOnPs4lfH8osgQlkR2uMslfZYvy/hi8DC71mal6htn6GKUl6Sy27xa20e76Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L8dKwKh5Agkr6/Sz2gAOhHiky/a7zfL5mmaZ+kO5RLw=;
 b=n1oH2n8ilKylm7HfqTfqeCDmNiQtZwqTCQcKFooiKb/aHe0ze2d4w91fG5jwTa5/Ewa6XB40tDtz+8hCSkuEIqIfOyufbswZ7vWKRIkSI+OmcaI2TH+9GepKfewK2djNlRVg1uBg0F0Q6uftP6/mJQ0cSDpICce7ZkXgFJziWxsChmFYBhpk8vTg2lrUJvskgp9invOzTcyybXEf4uopUDYYm4Gdm6N4BJYZEd+i9WI4mv89/JiCoCu5VuOfrZ8amP9G3upRy8TnMQmepNchdZiJcpL0wxXcbc8DHoa6v6l9VmJouTLy1ba52svo04rMRpS5NXJUTMhsSXsX5u8oXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L8dKwKh5Agkr6/Sz2gAOhHiky/a7zfL5mmaZ+kO5RLw=;
 b=qu60VsrHqx7x0QzeoqjN1uswiuS4Q1T48lpY2u313+IUphvS2ILN1y95o22X8mXIlwIIRO/lLjU03QmQ+WB7xdH93inSSXHU55FDY6au3ea7lxuRv1I7M4lnt34nX9KtrG1WnBE3q4ESb9ADol4AxaplKS1KRoggPbLZzYm8kmQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Henry Wang" <xin.wang2@amd.com>
Subject: [PATCH v4 6/9] xen/arm/gic: Allow removing interrupt to running VMs
Date: Thu, 23 May 2024 15:40:37 +0800
Message-ID: <20240523074040.1611264-7-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 26087eb1-bd6e-4dcb-36f2-08dc7afbb00a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?589QVo1rUR6jtYI+hepZXhQS/2JuFhESRrE1KFczuIeIYQSskO+IhDLWCaOl?=
 =?us-ascii?Q?UHGvySCx19xxCsbhFfvDxlEYvOmKeT8tUgDhd6i6eGKqvGTlfBDq5zP+wCyV?=
 =?us-ascii?Q?gsGJbAP+G9sH6anfv2ucG5DNXxVZbqvkomx/ClEJHK1XMj+6s9BZxydxLttU?=
 =?us-ascii?Q?5ejamBYAhW8iDb8Pdgvn3NtIK6YaSY/B0HxvWftP7f0CDPeUeJf7uMX5cnE+?=
 =?us-ascii?Q?MABpDff/pLQDcKV6kRJaTp3vw8/07bZ+uEZgO3NbCyj/MH8peeG6167VzW9v?=
 =?us-ascii?Q?cdPeiM2QdG/3PU2qY2pk2b8PGd7yQvWp9/qHwlvNKYvIYaiIHFRvHzGwuM3v?=
 =?us-ascii?Q?+ECDZH2KsqqJ2WIQwqDdANA40bK7jsRe3Ajw1/clkgMXzbDOTEGaCfKJPT9e?=
 =?us-ascii?Q?EVgS3XXjolOepU2d3oOJojTuh0jK+NVYIJUB0gb7Yh41QTKxMXrKZWwIF3Dh?=
 =?us-ascii?Q?Ngf0qdpiqncx0la5AOMtFF/QOc1qlbWTnDn8hBiigpfhzqKGceSqJ8/gyWKU?=
 =?us-ascii?Q?KzXMBYpXwQzcG+j4A/fGi8WZwnjrxo4cmeCjEfUf5BefQLSwlwoCvelkAPDR?=
 =?us-ascii?Q?mp+Rrep0s8YKMOiOJneQK+7daTpCmFHKLxk1xPJ7HbGc1uZOHVAtnK0wEvYq?=
 =?us-ascii?Q?5r6pQdd1qV7F6zsGcR8Os60w2KG4PRc9s+LcT7yjki5S/uzSpUplqRiCMCI/?=
 =?us-ascii?Q?3AUFpoR5ZOz0c8S1j9BSGXigW6P6z5dcKzVWlH/8GfJbHybE2TKuzZep87Bk?=
 =?us-ascii?Q?PtsQcQUa9RG2aEPAHWZaGa0Wb5HBGoA9BE/vNzVLUtxeHFEirjvHV8fBKerQ?=
 =?us-ascii?Q?b9m1UKd/0BSeBMEvvtMMSUOdBi+UVu2qVaW9EDpHvxvN0XMK35Jm/mgo2DR9?=
 =?us-ascii?Q?hvUqWEoI0EqVGCxWZUy4H/6xtm54Lh8BR9ZLbAuX1Fmp0asdNgpXH2RwbaTx?=
 =?us-ascii?Q?TSLD/VXpJsPdxdfG5i62/EHK77LaRZnhmxtMZ++FcodvkTeUOdn6Sii9kTjx?=
 =?us-ascii?Q?Cw8CcwlL4L7dEIDmOT1TNgMIT1K6T0Kp1nY+CdbmS89ieHB8eFqu03mfGLoA?=
 =?us-ascii?Q?Hyg77CFxjbjs/pI/bG+0hN+jl54Fbsnm7stFkUUoiwnYcI+nyhL4L/VfLTIo?=
 =?us-ascii?Q?Ugy8oA/sCeZZOY6nDb4dIlipa+MqEUY6+j9RKnI+/ZZhiNV+PtC5ou5FZuvu?=
 =?us-ascii?Q?qMVYsFcWFnThJiHQMdu/yQjOFY/o1a5xYH5H3R8SphjTcPMGA0yh7jnB4ry9?=
 =?us-ascii?Q?W8P3JRGRfTY06Ca5swh4EeACv1QLdXY+G4llyZN2iBzyQV+jLZDmRkSqjkP+?=
 =?us-ascii?Q?3FQHLoxRyEecKZET/bsAAEXtd746LkaBI2a7eyW9Y71YsTtKrJPV8SPbQzI+?=
 =?us-ascii?Q?8P978YdRzxirDX2UX1v+FcpyI7C5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:40:58.7826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26087eb1-bd6e-4dcb-36f2-08dc7afbb00a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215

From: Vikram Garhwal <fnu.vikram@xilinx.com>

Currently, removing physical interrupts are only allowed at
the domain destroy time. For use cases such as dynamic device
tree overlay removing, the removing of physical IRQ to
running domains should be allowed.

Move the above-mentioned domain dying check to vgic_connect_hw_irq().
Similarly as the routing interrupt to running domains, reject the
operation if the IRQ is active or pending in the guest. Do it for
both new and old vGIC implementations. Since now vgic_connect_hw_irq()
may reject the invalid operation case, move the clear of
_IRQ_INPROGRESS flag in gic_remove_irq_from_guest() to after the
successful execution of vgic_connect_hw_irq().

Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Henry Wang <xin.wang2@amd.com>
---
v4:
- Split the original patch, only do the removing IRQ stuff in this
  patch.
- Move the clear of _IRQ_INPROGRESS flag in gic_remove_irq_from_guest()
  to after the successful execution of vgic_connect_hw_irq().
- Special case the d->is_dying check.
---
 xen/arch/arm/gic-vgic.c  | 27 ++++++++++++++++++++++++---
 xen/arch/arm/gic.c       |  9 +--------
 xen/arch/arm/vgic/vgic.c | 24 ++++++++++++++++++++----
 3 files changed, 45 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index b99e287224..56b6a3d5b0 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -439,6 +439,14 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v, unsigned int virq,
 
     /* We are taking to rank lock to prevent parallel connections. */
     vgic_lock_rank(v_target, rank, flags);
+    /* Return with error if the IRQ is being migrated. */
+    if( test_bit(GIC_IRQ_GUEST_MIGRATING, &p->status) )
+    {
+        vgic_unlock_rank(v_target, rank, flags);
+        return -EBUSY;
+    }
+
+    spin_lock(&v_target->arch.vgic.lock);
 
     if ( connect )
     {
@@ -456,12 +464,25 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v, unsigned int virq,
     }
     else
     {
-        if ( desc && p->desc != desc )
-            ret = -EINVAL;
+        if ( d->is_dying )
+        {
+            if ( desc && p->desc != desc )
+                ret = -EINVAL;
+            else
+                p->desc = NULL;
+        }
         else
-            p->desc = NULL;
+        {
+            if ( (desc && p->desc != desc) ||
+                 test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
+                 test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
+                ret = -EINVAL;
+            else
+                p->desc = NULL;
+        }
     }
 
+    spin_unlock(&v_target->arch.vgic.lock);
     vgic_unlock_rank(v_target, rank, flags);
 
     return ret;
diff --git a/xen/arch/arm/gic.c b/xen/arch/arm/gic.c
index b3467a76ae..8633f14bdd 100644
--- a/xen/arch/arm/gic.c
+++ b/xen/arch/arm/gic.c
@@ -159,24 +159,17 @@ int gic_remove_irq_from_guest(struct domain *d, unsigned int virq,
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
     if ( test_bit(_IRQ_INPROGRESS, &desc->status) )
         gic_hw_ops->deactivate_irq(desc);
-    clear_bit(_IRQ_INPROGRESS, &desc->status);
 
     ret = vgic_connect_hw_irq(d, NULL, virq, desc, false);
     if ( ret )
         return ret;
 
+    clear_bit(_IRQ_INPROGRESS, &desc->status);
     clear_bit(_IRQ_GUEST, &desc->status);
     desc->handler = &no_irq_type;
 
diff --git a/xen/arch/arm/vgic/vgic.c b/xen/arch/arm/vgic/vgic.c
index 048e12c562..0c324b58f7 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -890,14 +890,30 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *vcpu,
     }
     else                                /* remove a mapped IRQ */
     {
-        if ( desc && irq->hwintid != desc->irq )
+        if ( d->is_dying )
         {
-            ret = -EINVAL;
+            if ( desc && irq->hwintid != desc->irq )
+            {
+                ret = -EINVAL;
+            }
+            else
+            {
+                irq->hw = false;
+                irq->hwintid = 0;
+            }
         }
         else
         {
-            irq->hw = false;
-            irq->hwintid = 0;
+            if ( (desc && irq->hwintid != desc->irq) ||
+                 irq->active || irq->pending_latch )
+            {
+                ret = -EINVAL;
+            }
+            else
+            {
+                irq->hw = false;
+                irq->hwintid = 0;
+            }
         }
     }
 
-- 
2.34.1


