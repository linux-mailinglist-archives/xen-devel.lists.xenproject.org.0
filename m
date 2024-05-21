Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 003F88CA772
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2024 06:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.726503.1130835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEZ-00084Q-Ib; Tue, 21 May 2024 04:36:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 726503.1130835; Tue, 21 May 2024 04:36:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s9HEZ-00081l-EU; Tue, 21 May 2024 04:36:19 +0000
Received: by outflank-mailman (input) for mailman id 726503;
 Tue, 21 May 2024 04:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H+om=MY=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1s9HEY-0006hu-8Q
 for xen-devel@lists.xenproject.org; Tue, 21 May 2024 04:36:18 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2418::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a857611f-172b-11ef-b4bb-af5377834399;
 Tue, 21 May 2024 06:36:15 +0200 (CEST)
Received: from SA1P222CA0046.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::14)
 by MW6PR12MB8957.namprd12.prod.outlook.com (2603:10b6:303:23a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Tue, 21 May
 2024 04:36:12 +0000
Received: from SA2PEPF00001506.namprd04.prod.outlook.com
 (2603:10b6:806:2d0:cafe::c3) by SA1P222CA0046.outlook.office365.com
 (2603:10b6:806:2d0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.55 via Frontend
 Transport; Tue, 21 May 2024 04:36:11 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00001506.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Tue, 21 May 2024 04:36:10 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Mon, 20 May
 2024 23:36:10 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 20 May 2024 23:36:08 -0500
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
X-Inumbo-ID: a857611f-172b-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lZgPU7G1H+hhtuaWEuG/cMMmBo/QQ49SAG+AZvvFieqW6nQcvTRxqXdKrDBK2oWwTIgqAYyXW2HJawQa13miNOxFqlYK/NcLU9BNnnDtbAnhbktwlBWXwyWWzccQUWlaczfX8Xe+S4bDs7sE9OceNUvQyVQmYZNddeSWI9MsSzMa6tnKnLHsW7xjrHa23FIAgq5KXRB/r4O7+4KG/2TISHL4pSdKMxIJEDbKI3vS9DAJO2FpZJviUDn98kll0mW7Un4FNF4nx0bH+B1ILui13JtcZYmuWHkL7AkkQeIk74XG7xdAogJs/P1spFDp9PnHCKxfOoYtekCTdmWMp+wfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EOJtF38SHzbKHHCO6HcbBP/3k8UEkTSkkoNvwkF1QIM=;
 b=QBtl44x1G/czAYBYL4NEKW+rBKOl7GF0UAaPXDJO83C9zkgJZzZwFcV5iz1OL4hQ6jiR0fVfLZyqAK4RpIOAwoxof1OYBH3T5pv/qK6SlbxCAL9lyon2lTGztVWG9zN1aO7nR96FJenXJwNDoUA3rZHfPbu/Gg1CRcCJtAp9L+8pH+Tq+ZzCjUzj0RUL4nFYfHDil3+B5y3vpnRuC6TivZLSoeine2eK7ypgBjECuYl1d+MR4n9b8KPyfhT+/7UlKXiokTsDq0KtaaoCaUTHDVlQf5z2GpH92BOPoacxQXbDGdVXMYfWe9RdMvXqNmHk5rhGMnvTL0zG1YgUzll7yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EOJtF38SHzbKHHCO6HcbBP/3k8UEkTSkkoNvwkF1QIM=;
 b=S8Sm22uAopwOkW6WFnp9X+UOmz1gKQmZeaERmqNckV/Ei1KDdKMH7fKKmqLOWWEB+5H24Os1gsNfWYIAEJImkk50W1cb5htRRPGFeYD7W7/VwPNeWz0cAufpNhmAl3Znjc1tQ3LRg6NjhA/01+IaVAJbwKhgneLsIMudVo1j03U=
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
Subject: [PATCH v3 5/8] xen/arm/gic: Allow routing/removing interrupt to running VMs
Date: Tue, 21 May 2024 12:35:54 +0800
Message-ID: <20240521043557.1580753-6-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240521043557.1580753-1-xin.wang2@amd.com>
References: <20240521043557.1580753-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00001506:EE_|MW6PR12MB8957:EE_
X-MS-Office365-Filtering-Correlation-Id: 556d5ffa-525c-4836-1cb7-08dc794f8a1b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|36860700004|376005|82310400017|1800799015;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+Qql7oBpC7z9QsDGgKoq0TXcutywO3ibPMhx5jjDz4u/TIaGO7etjfTbZsGy?=
 =?us-ascii?Q?LDgMF64CKDEOrduo2EqUd0O3amflBPJzXguY/tmBp6uJrvukT6SNIfmPp3Zp?=
 =?us-ascii?Q?SONcEMkqFLhEqwyVAKCkpimVhdOZ9MjiXqL9AEgr5Dei4jS4jW6hbeC06+Bp?=
 =?us-ascii?Q?LOhClgJ/Br1ngGSJ4vCeGABNV0SDYRNAFfmK+qHOq+M8dQYzS0n+0b60ieIj?=
 =?us-ascii?Q?Nmg0rn6VA5es5XHPomXD7eZqMUW4gobcuwoXgJRjPfL0tyaaKNTjeQMQ6IcC?=
 =?us-ascii?Q?J+s+M3XG42t51JbL4K8vbhmxnaWPtfqpbDwVycqRfbYzSFYIpOJcVD0LGW2z?=
 =?us-ascii?Q?YKQlz3E3JeDzw5Ubn81UE1AKxiCsVKGzywraP7DSuVFf2NC8lMNnes40b11i?=
 =?us-ascii?Q?ZB9Uy32A5F+soo6bTzuizlRa13FBrI6of4mKSASUyePIm2SNmdTTSJItJTsg?=
 =?us-ascii?Q?TrjGJqILLjX5YvsjneTvM8OJPcR20QCC3nv5TroNS53/KOdfcyttZya3sIfX?=
 =?us-ascii?Q?YlFhduTiJVttzQwz9HocLEJFULDlxjyp8zifNTBMk3vrOAOdNeo+rgkQ96Te?=
 =?us-ascii?Q?b97jGy+K54tNnriXFjg84+hi9l1vjyY8ceqV38223vtvh6ZMnJVfQ5TuFony?=
 =?us-ascii?Q?WJlwiYgcJ92Bt0ULXmkxbdZdetiN0q/J2wUM+bBVpNRrEGKnvdEDxovArEre?=
 =?us-ascii?Q?RNktqaKpCibXxyq4KqFdXhZCOhVtNVzw5d145FEWl7PX+LG+AbaO9Suv60Hx?=
 =?us-ascii?Q?ehgwww3VWirIjY20UZjbpMjR7s10pBddbSJcahtTk+zwD9cXpNoWj0UelRcQ?=
 =?us-ascii?Q?A/R54EhsXavqzrUIqq2g+sk2gc2C1GA3fPvxSyBIVGBgrMNuvVXoXFUUzHXV?=
 =?us-ascii?Q?oRGbgRhSJxXQUW/qhJLlesL0MSdjjbnv/hxxcyyALPhsj36RoxwOCPJsxzd5?=
 =?us-ascii?Q?2+kKOcP+U9K/14WHLbMEH6EhYaCLklqHyrdKOkJTG4hlMvKftswV6qpNcUzb?=
 =?us-ascii?Q?0mScb+vCZWFUr3lKLdBfcvJI5SMjQY/ls9tbm0HmPAoPjcEXHFSGjuxUGF9b?=
 =?us-ascii?Q?fS+CuJc8Ffipda4ivAM9c1AbYdT2TkS+vk+H/TiHiL/t9sqwo1smfpuUJnZo?=
 =?us-ascii?Q?Zchvu0pAoUetsdiXiRBoMt567GbHaUbj6240XYljz7EsSJYs9sA22HLh9WFP?=
 =?us-ascii?Q?UUu6pL980WbgDzkeNYjEexdX+0FL4yY0fZ0pdqvCvxwHcBdSxrtJrEdrT0rX?=
 =?us-ascii?Q?ssaB1sFUR99TYl4yHi77POeDjw+4KCWrNGnDe/bXdJWAFg/zwnz7peq8ToKm?=
 =?us-ascii?Q?ebMJO8GuPynAuL9xf7OIfX0Y33FNIEofX9PybYAkmQPSYZOUoE1Sp350KCvv?=
 =?us-ascii?Q?DeLKjjytWc6zdcBgwuOb3HYNJGYP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(36860700004)(376005)(82310400017)(1800799015);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2024 04:36:10.5552
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 556d5ffa-525c-4836-1cb7-08dc794f8a1b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001506.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8957

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
v3:
- Update in-code comments.
- Correct the if conditions.
- Add taking/releasing the vgic lock of the vcpu.
v2:
- Reject the case where the IRQ is active or pending in guest.
---
 xen/arch/arm/gic-vgic.c  | 15 ++++++++++++---
 xen/arch/arm/gic.c       | 15 ---------------
 xen/arch/arm/vgic/vgic.c | 10 +++++++---
 3 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/xen/arch/arm/gic-vgic.c b/xen/arch/arm/gic-vgic.c
index 56490dbc43..956c11ba13 100644
--- a/xen/arch/arm/gic-vgic.c
+++ b/xen/arch/arm/gic-vgic.c
@@ -439,24 +439,33 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *v, unsigned int virq,
 
     /* We are taking to rank lock to prevent parallel connections. */
     vgic_lock_rank(v_target, rank, flags);
+    spin_lock(&v_target->arch.vgic.lock);
 
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
     }
     else
     {
-        if ( desc && p->desc != desc )
+        if ( (desc && p->desc != desc) ||
+             test_bit(GIC_IRQ_GUEST_VISIBLE, &p->status) ||
+             test_bit(GIC_IRQ_GUEST_ACTIVE, &p->status) )
             ret = -EINVAL;
         else
             p->desc = NULL;
     }
 
+    spin_unlock(&v_target->arch.vgic.lock);
     vgic_unlock_rank(v_target, rank, flags);
 
     return ret;
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
index b9463a5f27..78554c11e2 100644
--- a/xen/arch/arm/vgic/vgic.c
+++ b/xen/arch/arm/vgic/vgic.c
@@ -876,8 +876,11 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *vcpu,
 
     if ( connect )                      /* assign a mapped IRQ */
     {
-        /* The VIRQ should not be already enabled by the guest */
-        if ( !irq->hw && !irq->enabled )
+        /*
+         * The VIRQ should not be already enabled by the guest nor
+         * active/pending in the guest
+         */
+        if ( !irq->hw && !irq->enabled && !irq->active && !irq->pending_latch )
         {
             irq->hw = true;
             irq->hwintid = desc->irq;
@@ -887,7 +890,8 @@ int vgic_connect_hw_irq(struct domain *d, struct vcpu *vcpu,
     }
     else                                /* remove a mapped IRQ */
     {
-        if ( desc && irq->hwintid != desc->irq )
+        if ( (desc && irq->hwintid != desc->irq) ||
+             irq->active || irq->pending_latch )
         {
             ret = -EINVAL;
         }
-- 
2.34.1


