Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F272D8CCD2B
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 09:41:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728097.1132903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34P-0002d9-P1; Thu, 23 May 2024 07:41:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728097.1132903; Thu, 23 May 2024 07:41:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA34P-0002a2-L4; Thu, 23 May 2024 07:41:01 +0000
Received: by outflank-mailman (input) for mailman id 728097;
 Thu, 23 May 2024 07:40:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1Po+=M2=amd.com=Xin.Wang2@srs-se1.protection.inumbo.net>)
 id 1sA34N-0001WY-GQ
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 07:40:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2415::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb2aae42-18d7-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 09:40:58 +0200 (CEST)
Received: from MW4PR03CA0214.namprd03.prod.outlook.com (2603:10b6:303:b9::9)
 by BL3PR12MB6643.namprd12.prod.outlook.com (2603:10b6:208:38f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.22; Thu, 23 May
 2024 07:40:54 +0000
Received: from CO1PEPF000066ED.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::2f) by MW4PR03CA0214.outlook.office365.com
 (2603:10b6:303:b9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36 via Frontend
 Transport; Thu, 23 May 2024 07:40:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000066ED.mail.protection.outlook.com (10.167.249.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Thu, 23 May 2024 07:40:53 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 23 May
 2024 02:40:52 -0500
Received: from henry-MS-7D54.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 23 May 2024 02:40:50 -0500
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
X-Inumbo-ID: cb2aae42-18d7-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAjQNZm/ATs7jCaRlEhbS7Nw5C78kdhdWkKY+KmIhV0cX4NtiF4QPSxtc/Xt1IlVT1SuyzkvX7TGHzG53LrMNaaViHLRUpU0mlKeP7YbF6oj22yNuCYk3lVoSdcdbB1AapQAuNQTXK179rfvCPqaErhQEprirOG/RWw6HohNeA1MK0p9q2wTIh13kGu5rRM05QlhqM+jIULWq/lfgO+lQJKhdiGClRpc95ExraEtCE28rf60mUBprBpGB0/ib1wEF6Qu/onkct1rtdSHwbf5ZAlEAzB4ukVqTs5VLUYvFQmfTVcV7Mw/UEx4SHxtfFFztdAnxPfyStUCdWvz0Q3eyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bJ4rFJutdXy/qfPZPTvRAO+qEyMuCy4lZffUC1ijz5Y=;
 b=TXoLpKg7Xbd+z/nzO7Ngb4nWAkG/qN4DWA0a215/cp+RLLFtwSTWOMnYRjjIx4GuM+azFIJGNW5IEXZiCmDyClIZpHUgyxn4mkfOcTZhV+DksfkBZujGbr+t4QBogaGdN8QNUFKoBUlHd51bIpQY0ZbDDqWuPovPzSkC1jff6RVAJvD4zyeCbo9nm+Rb4SSWA+V/Cch8/6tz8Fo7xYjH09ytMKx3Iq2+9gVEHj5I93gEwvMJLoYBYFRcAS4in+toRkm2x8DkypnNCEheX8qvdNJ9u7Q0+5SYuOACBBDtgQYPQXjZvxl5y4lpI7AniOGneFgaE9NiFpwtVJGydDuyBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bJ4rFJutdXy/qfPZPTvRAO+qEyMuCy4lZffUC1ijz5Y=;
 b=uiXBZP2Tg6MRcvKJnEBlCwVRNe4gcODnm8nXD4nDZveMFnwiD38u0jS3p83CTVGJABLAbe0NGgAe5N8JAGF3SQ/JduAOVXvoxK2GIWQLsqhE3LF0IxATU7Hr0DNE4Bc7kozfff1biJeCyYebL5xv28ReFbBjK+8QdJL24u7lCXw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Henry Wang <xin.wang2@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	"Henry Wang" <xin.wang2@amd.com>
Subject: [PATCH v4 4/9] xen/arm/gic: Allow adding interrupt to running VMs
Date: Thu, 23 May 2024 15:40:35 +0800
Message-ID: <20240523074040.1611264-5-xin.wang2@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523074040.1611264-1-xin.wang2@amd.com>
References: <20240523074040.1611264-1-xin.wang2@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: xin.wang2@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066ED:EE_|BL3PR12MB6643:EE_
X-MS-Office365-Filtering-Correlation-Id: 7161e61b-6859-4b92-08d0-08dc7afbace7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|36860700004|376005;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LYeGWke6n4bX49lwvxP85Ozwipg4qx2/aH0d7Un85TTkALAGeAp4Uj5QfGTD?=
 =?us-ascii?Q?BfXAIfeb2c8gHu8XC7YPqQ9qZG8KX/EawG9bDJQMLgqZ4KPkKPappLluKt5C?=
 =?us-ascii?Q?AgerW39/7TUGf8t5Y+fXeV4VXQQO5/JZSIFm25T/Y/ucrZF38YVNdMNkuLZe?=
 =?us-ascii?Q?gOov3WIXNDTblsPBoPfD6d/2eO6jgSjacGhALoZF3TX9v9xc5AFInBXp4Zj8?=
 =?us-ascii?Q?GJDwdGBm+uqYi6CcZU9KhKWpTo6hevZ9GTpBe4Tuge42MuyNTlyueZ9TEmYO?=
 =?us-ascii?Q?iYkGzRLajFg6Bh8G/Yszul9MU7U8Bi0H0tdnCZEsGg9oxpWHlsJK4DzKzOPq?=
 =?us-ascii?Q?7vm/S1HchCdNgZRrZMsCUHtdU5AicYbqGSLNia8F+xpd3VWvXMlAQijetkmv?=
 =?us-ascii?Q?YunXb5pXNH6uGgnNEU7T7jcc65xyIg0m3YyKiDHwgAbLTNDkEkEG9PHjRHjR?=
 =?us-ascii?Q?9wazh9bVULpB5nhlKkZEk5WZ51hHO/QkLrpLAGzXavYS/SbxjcT1mrpydE/1?=
 =?us-ascii?Q?EDM5Xx1fkOj1qPbF69+KqWGGShYaPH8s8BdNydApGnL5ntdnAPA4fH1Npe7K?=
 =?us-ascii?Q?LXGQvAlgTMZuOWzvpcIZn5GW1OzR0NP71FOYZgzp21ZDUDM9JODeHjofqkhm?=
 =?us-ascii?Q?UnHit6AYprwRXKvVz25deIdjPh1gMWndRMPwY77O5P4BdiHg1dpfXxWJ55O4?=
 =?us-ascii?Q?npal4ZNXr6odCKF9ZMzLtSGOMaha28QZ0eQgeQzldViIUypkwGffNrMbYmka?=
 =?us-ascii?Q?zvHqjnjgLclZna94RcdqD6UUOp+utj6igelleEyeynOz6qwVy0uoJeWd9Txc?=
 =?us-ascii?Q?KDAzY0onyLS4eOF3M9qpYHTFBCYaeBe2Y7FIOlOeSyEk/trjOJ78tNjJbkbZ?=
 =?us-ascii?Q?tpJ85VDvnk+QV6Zl1gJgtpjnpHRg8XzjW9rcmy6YD4DEZuXRQZ8CfEl5JbRb?=
 =?us-ascii?Q?nCiRH9ri3kjhcfmzXyBj6blllFFKlBe5Hh0lumyVJMFZ/+RFb87FNs0r2qcD?=
 =?us-ascii?Q?oV5r6FFjPKfI4mt6ZZGFUVw5oh3SWKahKKc0pRbyk1YIsgTWuJ6R6nbrNGb/?=
 =?us-ascii?Q?Oz3RC7GeMjRjewoHrCqzbgi7JhFI/vFVszGqgEfZ+64BymI2ET0nnui8bLKo?=
 =?us-ascii?Q?hML2YMb7Vq1mvqvUa4X0+AGeR70eZqM7pi0ANYWxF8DJ4Zmjg93W2/RsLlwW?=
 =?us-ascii?Q?xG5qNhAqTiCstsqIiIkrMjDFc5BvuSDfZ9i6cgMTPg4Mj7ClG/wPJHGRJISK?=
 =?us-ascii?Q?OVylkfwkqk1hud1MsyWXnAYvYqhn6eoIbds+e75u4aW4VWwIylncgJpH9sii?=
 =?us-ascii?Q?L4qerWCg1U2NjuMY2nkFg3UaWqate6R1U90Idcib8KwhocfbFjzFzCCs2LcM?=
 =?us-ascii?Q?zxpfzHbbPSX1KkPmpZYCjuDtb0Kl?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(36860700004)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 07:40:53.4407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7161e61b-6859-4b92-08d0-08dc7afbace7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6643

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
---
v4:
- Split the original patch, only do the adding IRQ stuff in this
  patch.
v3:
- Update in-code comments.
- Correct the if conditions.
- Add taking/releasing the vgic lock of the vcpu.
v2:
- Reject the case where the IRQ is active or pending in guest.
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
index b9463a5f27..048e12c562 100644
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
-- 
2.34.1


