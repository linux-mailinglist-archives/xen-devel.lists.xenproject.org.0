Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED109B39030
	for <lists+xen-devel@lfdr.de>; Thu, 28 Aug 2025 02:41:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1097219.1451661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQhC-0003se-8R; Thu, 28 Aug 2025 00:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1097219.1451661; Thu, 28 Aug 2025 00:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urQhC-0003pR-3p; Thu, 28 Aug 2025 00:40:54 +0000
Received: by outflank-mailman (input) for mailman id 1097219;
 Thu, 28 Aug 2025 00:40:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Rla7=3I=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1urQbU-0000Ol-6Z
 for xen-devel@lists.xenproject.org; Thu, 28 Aug 2025 00:35:00 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2416::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d35669e0-83a6-11f0-aeb2-fb57b961d000;
 Thu, 28 Aug 2025 02:34:59 +0200 (CEST)
Received: from SJ0PR03CA0216.namprd03.prod.outlook.com (2603:10b6:a03:39f::11)
 by MW5PR12MB5622.namprd12.prod.outlook.com (2603:10b6:303:198::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.13; Thu, 28 Aug
 2025 00:34:54 +0000
Received: from MWH0EPF000989EB.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::af) by SJ0PR03CA0216.outlook.office365.com
 (2603:10b6:a03:39f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Thu,
 28 Aug 2025 00:34:54 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000989EB.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Thu, 28 Aug 2025 00:34:53 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 19:34:49 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 17:34:49 -0700
Received: from amd-BIRMANPLUS.mshome.net (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 27 Aug 2025 19:34:49 -0500
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
X-Inumbo-ID: d35669e0-83a6-11f0-aeb2-fb57b961d000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MbN/RmRMHKOBmxDV83GN9CNkjF0OUIOHezWdTttaHjqmSoeGgBLmzGeEDd60XbfrYQVaCmQJUrsMh0ABXS1jgXbGhUZpi0oln1I2PBYPt3JuMzuj+kOXusis/KqP6FKtcnLUYjplf8Ki5pX6U+TeQaTzQqO3yZHwVGNnvVsiOCeOu4Od0SH1U311qaMp8jrgNTbLw3qdqNGlY41yoRALuAqdhq4NAgk4ez1EdyC7BD9pNv87YLDQEC/ZERcrTxeYWEcKnKYwJjm29AjsobQxPjMVsEf64uguTjPh+HXEfCOgu2M6prN+wAJ66nzGLTkc/7yUUpRkvZgZ77qdyTEcFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hI0Gbe2mYNcrDAAQZRVPaNZt72D2cNKzUHir1F+hsOI=;
 b=kkdkfnrEGsWTUgDYsBNytx2U/0ccVBsgigBxBsVclUx6Cy+aRO3sO3IY4ErLs5A5wEaUf9NnDBjKKulb8ebVjWfYYB2Pyi8XgItKBynNBFygwBGFIVNs5HUVwnRPix7HZzdPHvpby4K0nc1ss6dm8mtxyaxF+uKbBlDkBFgVsfSmKyzKs52cd9j2BUDcj2rq6bjKqSiBfqebJFp342hskF7Mxi13V9htKF/3UEZ3tMGeAnMXCRXo3acBFw8EMtQf2RAxbmmdml2lknNcKg5wIcSJxkFOdmSAxhhzryxUQYsVOoT5MUMUsZTr27tkHH3bNkOvHXJ6eHpEdle9yDWmgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hI0Gbe2mYNcrDAAQZRVPaNZt72D2cNKzUHir1F+hsOI=;
 b=02kL7aHoIIrG89VGrorrae11yVpuDizvbzr1IcOVdnS0OdyZDssCBiwSUdoFkUb+6aOE/8+5GUDnfDmMaZLhxpZPgM1ouyU5l/gL+puo32k3qkHgXPVQospPIZBvjomCQaP5oHMUxuGEUTiicfddHRq7InvgWodYjSrl7yKa7lc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Jeremy Fitzhardinge <jeremy@xensource.com>,
	Chris Wright <chrisw@sous-sol.org>
CC: Jason Andryuk <jason.andryuk@amd.com>, <stable@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 3/3] xen/events: Update virq_to_irq on migration
Date: Wed, 27 Aug 2025 20:36:03 -0400
Message-ID: <20250828003604.8949-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250828003604.8949-1-jason.andryuk@amd.com>
References: <20250828003604.8949-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EB:EE_|MW5PR12MB5622:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ebc60e-547d-40b1-5b18-08dde5cab4ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Lu8Q4JnOBk00vpR6OekIUJqMS+zv4Wm99SZ2tUtQ+bOqdd2Zc0jwTYWb/UjW?=
 =?us-ascii?Q?cJDhYHxcjy7EfbHlz7+5Gy/Mki0jkWedYkDGRX599Tuj2Fy79OjN/qoirtTQ?=
 =?us-ascii?Q?AqM0UPMOo3VJdyAjn4l2NjOy2lZr9OxENKk2FdI7KStFfu8yAuUbC8iH8xAx?=
 =?us-ascii?Q?SKexhB6CXdhzKrvCHOkVlG17jYTmSr5oU5IIq0QuiKACKfq3831hbvYaXgZK?=
 =?us-ascii?Q?leqZMuBsct9STkSItYG55xg/eCSzIx+J5NHBN57YNuyJzIqin0ewBF99qZqB?=
 =?us-ascii?Q?Z0dB8J2LaRJZUZ8uNrBXiJjeK0yqEb+y3skWn6zQUcb9EymXkIvAxdWqtfoU?=
 =?us-ascii?Q?eJH5G6fNrr79ZzfG00w0Rf/cXecwEAMr8hP+1DJ/VZQErbWQLCZh1qVzY8Ch?=
 =?us-ascii?Q?WXPOPk3sp2dne4OMDsSL7vd6ypmmFc2lA9l7qeWL2oossxvlimJLdDEzJM+j?=
 =?us-ascii?Q?o0+sOxuFmo8NJ8WDtN42NwDjhd9Rp2UPUaeVJ4sBSsbboRlFMQc02S7I4Yej?=
 =?us-ascii?Q?IW5/3ucGIRUYrNwhKN85wVCzjuKV0FpU9mT08AeZeXikbqQQvqdK19048ywr?=
 =?us-ascii?Q?FYHEop3V1E57DSwhPkdcG5iMIucCpbfRaxyaUhS8ZqOg4esJkiabFunZj7LQ?=
 =?us-ascii?Q?y02swfBo08+zGsuMUrnVrq6tLpj05HLCvpp5RnjD0msNHxT+r2PkkVDZGjRU?=
 =?us-ascii?Q?b85N9NVcjMyLIAxdlVDgglOk6z4Vszgou4HQjbhc+9ovGBq8e0F3P9NJZN0i?=
 =?us-ascii?Q?7ttgBsHjzfdvCaSIHVndcm3dpU198D1CWx00RDCJTglz4OiCsK5LhVGxfY/y?=
 =?us-ascii?Q?Ipr9eZmG4O/WI6JSsHswIwgh8xDdkKFSEBdz5RVk4ForkpzcQnnD2jmxzfcC?=
 =?us-ascii?Q?vfsbLXvqwH+AIRaprXiFoayDPzx9YXBMDteyTblgzWKQNhtKUaHlQxn2lFb0?=
 =?us-ascii?Q?YO0hAYOgBRA52JNyrEhh1LScGfRbY/ABG6sqoVcbz0wq6+/ZyGcCDE0e1239?=
 =?us-ascii?Q?gwHzmQO3halk7HqKTuFIM0FcIzIHbqkgnKAzvKvb/8Gsr/XemarapmxZQ0Oh?=
 =?us-ascii?Q?ZBviCdd2nibkr1M8sSidcHZPDOtuAgNOhIkRLRCe9xPMaCoS6eYJN7Sl2hvt?=
 =?us-ascii?Q?XFpYzcwrWywawcxHlZDySJYvjtyPBjBGOoOB5yUAzpIVS4SVJlWQIGO2XvyP?=
 =?us-ascii?Q?KJXTRL53s4bx6pH9ikiQv7hEt7A6zIonFStLr3YEjoQabkTtenyVBwcU71VU?=
 =?us-ascii?Q?Qt+rx4tIBoG1/9uq/6LIvuUame2wx6ySTUBz9s72gbaoFIGXacdoeCi+tpES?=
 =?us-ascii?Q?u4j2k19upQGSdS6BHd3cPyQgRX7F9jMh8cTF/ga+EFdR5eLCqaz/3ZrLrAxB?=
 =?us-ascii?Q?3oMMf/egIUZzcy8+065I5afMbv6dqMFv6XMbetQMfcLRi68s/XSEZOxKnWMJ?=
 =?us-ascii?Q?y0eF51T+uzyy/8Jn77m2fBA8+Uwl8HSEHxRVVn8xGs9BGLk71DlcGTeUu3gC?=
 =?us-ascii?Q?U2hwdHodjRHtS5YvjhdkpM+cYevloTy9oxy4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 00:34:53.6683
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ebc60e-547d-40b1-5b18-08dde5cab4ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EB.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5622

VIRQs come in 3 flavors, per-VPU, per-domain, and global, and the VIRQs
are tracked in per-cpu virq_to_irq arrays.

Per-domain and global VIRQs must be bound on CPU 0, and
bind_virq_to_irq() sets the per_cpu virq_to_irq at registration time
Later, the interrupt can migrate, and info->cpu is updated.  When
calling __unbind_from_irq(), the per-cpu virq_to_irq is cleared for a
different cpu.  If bind_virq_to_irq() is called again with CPU 0, the
stale irq is returned.  There won't be any irq_info for the irq, so
things break.

Make xen_rebind_evtchn_to_cpu() update the per_cpu virq_to_irq mappings
to keep them update to date with the current cpu.  This ensures the
correct virq_to_irq is cleared in __unbind_from_irq().

Fixes: e46cdb66c8fc ("xen: event channels")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
v3:
Kernel style brace placement
Delay setting old_cpu and tighten scope of variable

v2:
Different approach changing virq_to_irq
---
 drivers/xen/events/events_base.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index b060b5a95f45..9478fae014e5 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1797,9 +1797,20 @@ static int xen_rebind_evtchn_to_cpu(struct irq_info *info, unsigned int tcpu)
 	 * virq or IPI channel, which don't actually need to be rebound. Ignore
 	 * it, but don't do the xenlinux-level rebind in that case.
 	 */
-	if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_vcpu, &bind_vcpu) >= 0)
+	if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_vcpu, &bind_vcpu) >= 0) {
+		int old_cpu = info->cpu;
+
 		bind_evtchn_to_cpu(info, tcpu, false);
 
+		if (info->type == IRQT_VIRQ) {
+			int virq = info->u.virq;
+			int irq = per_cpu(virq_to_irq, old_cpu)[virq];
+
+			per_cpu(virq_to_irq, old_cpu)[virq] = -1;
+			per_cpu(virq_to_irq, tcpu)[virq] = irq;
+		}
+	}
+
 	do_unmask(info, EVT_MASK_REASON_TEMPORARY);
 
 	return 0;
-- 
2.34.1


