Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD6D8CEC59
	for <lists+xen-devel@lfdr.de>; Sat, 25 May 2024 00:17:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729888.1135212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDg-00081m-02; Fri, 24 May 2024 22:17:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729888.1135212; Fri, 24 May 2024 22:16:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAdDf-0007yQ-T1; Fri, 24 May 2024 22:16:59 +0000
Received: by outflank-mailman (input) for mailman id 729888;
 Fri, 24 May 2024 22:16:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4rgR=M3=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1sAdDe-0007Iy-Ni
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 22:16:58 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20601.outbound.protection.outlook.com
 [2a01:111:f403:2418::601])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5588d913-1a1b-11ef-90a1-e314d9c70b13;
 Sat, 25 May 2024 00:16:58 +0200 (CEST)
Received: from DM5PR08CA0025.namprd08.prod.outlook.com (2603:10b6:4:60::14) by
 IA1PR12MB6329.namprd12.prod.outlook.com (2603:10b6:208:3e5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Fri, 24 May
 2024 22:16:52 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::fb) by DM5PR08CA0025.outlook.office365.com
 (2603:10b6:4:60::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.26 via Frontend
 Transport; Fri, 24 May 2024 22:16:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Fri, 24 May 2024 22:16:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 24 May
 2024 17:16:50 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Fri, 24 May 2024 17:16:50 -0500
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
X-Inumbo-ID: 5588d913-1a1b-11ef-90a1-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzIcS/jnelNSjX5wmxlhAnjjAVdohjceaUs9ETjTs5Y+YhOn5igMhInyZZ/EJ1Z5OoyDnhq2SMISzSjRBTq/+cUPxEH3lZbK5XEjt/JwccDSRf9rmelHCz4ggiuWYMtc2nVFk1njrZXcsdZI5MSihSFhnP14iqlYo9BJRlaGYluzA9VivtjA+/3Asn+yb9ZT8nu0N3ZZGo5Hov8q+TD581ijD8qVrZfMXPKZvn3Tp2Lw0pWzgBtNvQJFyOnSddHp6X/XfQJLKRFgdSAGpHzgeCb0UBuIhYUz5ESy+YIXxPAkfx50U7P/thQgPDB1uGfdGIzBODRKXUEoZUkS7V633g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dUxLvykGPrn0TdFclj7NWwLQlt3XRena1NmCNYfl8WY=;
 b=kaBZAr3pU4zrWLveeJm1a1tA0bhHgywJpIeS2nRlAMsHHPnTJeKbx+u3YG2Pqyzn+HE5DXvXqltQn5BiYZSWcspoUKcW/eoS1Rz9lruKIWqN6pqS19KZPQOOfHaYjyE/3LH4lVsTubjnrv1dQXT7y+EraAfPBMhJhPGeSM4Btp1YjMZU4q80fv4SSJC8GoWBHHv7IUhUTFabCTVk/06YJO0+CPf92nxT9/m/gse05/uOd9X0S1Vez58Ejez0OYdCuO91mmCaHo3AakoNWO+IvjGJS5D/dNfQClZnNP1/f2LR1fJSJBMNnts345dJBeNcf8Xnmz0vJcFh9/d/K0QhMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dUxLvykGPrn0TdFclj7NWwLQlt3XRena1NmCNYfl8WY=;
 b=44iYRey/bQX/UqeeEG1oty/E0pXIS2Fa5yCEm5zFSJpI1TQ3ebtVDkmsiqfC6Lc7UokVtlM7RN6rsBvknALGs40MWSpr3MX7bbXf5Vk59Cxdt3q2PYsyZeym4Zg3vJUjxwIqkVhi5uz+oM3P2rWH9t94E3sxwFly/JsKwx3a/sw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <anthony@xenproject.org>, <sstabellini@kernel.org>, <julien@xen.org>,
	<bertrand.marquis@arm.com>, <michal.orzel@amd.com>,
	<Volodymyr_Babchuk@epam.com>, Henry Wang <xin.wang2@amd.com>, "Stefano
 Stabellini" <stefano.stabellini@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v6 4/7] xen/arm/gic: Allow adding interrupt to running VMs
Date: Fri, 24 May 2024 15:16:44 -0700
Message-ID: <20240524221647.2860711-4-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2405241515210.2557291@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|IA1PR12MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: e3ffe385-56df-4e60-27c3-08dc7c3f36e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|1800799015|82310400017|376005|36860700004;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?x7bV7ZqjgUF7VWv5tEb0t7r9/1QAF3128hqXshja0lxs7s/Tn52FXT3oFHsS?=
 =?us-ascii?Q?ZT2zhsIwWX9WmVCIbeyGtfYr8jPZjh1JEYvQdtmOoATSEVTGHSBJMLJ2UoVG?=
 =?us-ascii?Q?j6dUkA4J0WItM5O/5BecsfapkAmTqG9XKMGWl/VOXpSRhSUTcP3FOtyHlxKF?=
 =?us-ascii?Q?dpJBx2XkgtsfaDeptG0jvlTVzj7kfIPkaFQJKX/TUy27EvTt0143HRTQExXm?=
 =?us-ascii?Q?BhRH/YDC4bD1Cw/Zs0MRzkxOwVPOzQUmprIMGNWY8+O/76vMs6x03QS/X5if?=
 =?us-ascii?Q?tlL27RkOWIALa9YBK3rFGVxyXZsgLEbndrDAntOMgxAWxfpiGtXHygvUybX6?=
 =?us-ascii?Q?EjchwqpbJVmQ+t62P5McG3mK+lFyL6awNcJJSTaYfewSJSFd3Z1jQwOSyRdc?=
 =?us-ascii?Q?cQvnaOuXa3snhaMz2R7c0K2OsU/loLa2i3BkiYYa00oTrrA/AamDNVtvk4xV?=
 =?us-ascii?Q?tA7x1TC+kuBQVRboW/EdhySZxNBZCeZ/d/QmGSpbKfuKtzY/SetOSN0fOWLU?=
 =?us-ascii?Q?qRLe9jvHdH02rYu17zOatsvltddMKd7TpUX7vwp1H+fzWF29NRtylfYKI2P5?=
 =?us-ascii?Q?A8z5zNFVnE1KC1YPtVCDuYAV0IpxPeeJmUlCQJGpUtL6JoVwVSqul8DnBo9w?=
 =?us-ascii?Q?XXoDUeCq2KHVGDGfajg59FAGsK2PPUB+yoUVbnUu8jzx6YbICMJJrOl+flCM?=
 =?us-ascii?Q?nUwXkUeRQLgiS+9aubFdVsFAJZcSVsA/EaZLt2TPQdxEPG3JI6Lu55MG8+AS?=
 =?us-ascii?Q?y/I3ST/A9pbVxZem8uNBcgNRJQcYCgz+qP4UcqAsExXn5rw/Dvdy2XlD3B93?=
 =?us-ascii?Q?+fJ2yu7bOaT8JHNpNGbYseCEAigDJekk9IDr3d+UT1AZnSSUjy5FMTuy2jMF?=
 =?us-ascii?Q?8HZbr71te46vq01pgwrvo/6WrYLkQOjaNbuEqSniqbYdbqdF45cxq1JRqNG+?=
 =?us-ascii?Q?r5jbCzBWQo6lmNogYCUk4LIQFJkazvrl5T/Qzc1GOsCz3wpj4rxN5ZDWzMsI?=
 =?us-ascii?Q?5aPUQlrM5ZvqkBsvoDNQRR791iDpT7C/T5+Lq0t12xZx+wPgFjQegNFI5wlk?=
 =?us-ascii?Q?3a7laNehWr2PjvNShs/LIG8VQNzFlRrB/jZ1CB2vCZxZy1rWHtsvwqTMGa5u?=
 =?us-ascii?Q?eK+POV4b4FBwTdtAiZQQm6jnuEDu+BrK4ipwsZYFpyQAn1TsWTAJWB+1y7GK?=
 =?us-ascii?Q?fZwqxTtc+MqneLz/2aNx4tdUuHp9MtexrJV/Ocrv0V4YbwPD5vans9K4JpQw?=
 =?us-ascii?Q?wjvMBa3vq3gaEESRQDESTPL/eGk4hpcZ6F7qXcXGwg11p3aP/E04qgUNGb6J?=
 =?us-ascii?Q?zrRnnZk9EEW/qVxAOdiMjmIbeMzAEO1oWAnL4u1hUkjYlo+DRZlhuSt336uG?=
 =?us-ascii?Q?QBeB9YOLN2h+QucIJMfIDN+Yl49R?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(1800799015)(82310400017)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2024 22:16:52.4601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3ffe385-56df-4e60-27c3-08dc7c3f36e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6329

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


