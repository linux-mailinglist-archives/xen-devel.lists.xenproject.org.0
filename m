Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C400CB23675
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 21:01:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079094.1440072 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluF0-00084p-Od; Tue, 12 Aug 2025 19:00:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079094.1440072; Tue, 12 Aug 2025 19:00:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uluF0-00082i-Lr; Tue, 12 Aug 2025 19:00:58 +0000
Received: by outflank-mailman (input) for mailman id 1079094;
 Tue, 12 Aug 2025 19:00:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ed2z=2Y=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uluEz-000817-0h
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 19:00:57 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2062a.outbound.protection.outlook.com
 [2a01:111:f403:240a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a990ef1c-77ae-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 21:00:51 +0200 (CEST)
Received: from SJ0PR13CA0078.namprd13.prod.outlook.com (2603:10b6:a03:2c4::23)
 by DM4PR12MB6640.namprd12.prod.outlook.com (2603:10b6:8:8f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 19:00:44 +0000
Received: from SJ5PEPF00000206.namprd05.prod.outlook.com
 (2603:10b6:a03:2c4:cafe::1b) by SJ0PR13CA0078.outlook.office365.com
 (2603:10b6:a03:2c4::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Tue,
 12 Aug 2025 19:00:44 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ5PEPF00000206.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 19:00:44 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 14:00:42 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Aug 2025 14:00:41 -0500
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
X-Inumbo-ID: a990ef1c-77ae-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v/shoHpLWv2q81MvaAHbJTZ/MnduXnyeqFj9ypqot1+9Gg2OTfa4fys1cSiQouYSx6L8I5HZubPKkIcqP78l8E3oLViQvM4G66qssOUDGPfSnm1v1pEt80PEWLuPeHq+owRVstHvfePxWxxH4ZplKZjdACGIVUtgjH34aGuvV0f/Qo6MlTS93PP00pArsjKh+s1vnKv1gTVxEZ4ZJAaQxwpIzrvxXSjuxo1hA3V7MJ9yQgmhUK7qqMadD4wAoZ9MkUf8neuSM1vNpK+KeZOHa47cMaNZPUDpkCkR99fyhu28OSds6Vbi8RPu7R4msC6U5gXVyompbYOKUosVf6HGaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dz3PNh+i6ro6eUvfZ5R1Ro9CUvmUQBqEHRmywmQA9jc=;
 b=CENGDAPMErsz6abIEIhR5yKNqlTzU+PE+vL3fD66EW6uR9f88Leh5vftHDmukMt6yYrkQkltW1l+xyWbBw4goH4nk7+eMEhru+qRbm+jBPzQ11xx8u5hf5esm2BGXtbR5aLpTxQKG8IrIQii7uipmWW0nHbMcpH+3lVXnxT+Cr4UBX49btPuS76k/6RLT9vQoYQJq9EW/VZcr5I2A499oTrhbrUw10RbXbvl9WBvQWafNmMKb9lmlgSwhwCPYJj7zDa4orzdvdLIPDNqKQ/9huLbwMx5gV6I8sxHpyXnin5YMGbhdAIoNP1rQrsML9uJEBH9biXJ7orvkBEjvXaNfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dz3PNh+i6ro6eUvfZ5R1Ro9CUvmUQBqEHRmywmQA9jc=;
 b=rQLcUhPZQxCbu7neB5I6TtMNAf0XNu5XukIohy7QnUo+CjK4V3k8Jz0zq83OwFuPZCsGdn63jTgROtmPaQErKeV6JcMfZIqeFNShi7dG16AJkg81pIrrbK91qH5tvJtrIpnk1yOOKZq6qNeWiogBCxTTjfSN7r1v9TwHHw2+CBQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: Juergen Gross <jgross@suse.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Oleksandr Tyshchenko
	<oleksandr_tyshchenko@epam.com>, Chris Wright <chrisw@sous-sol.org>, "Jeremy
 Fitzhardinge" <jeremy@xensource.com>
CC: Jason Andryuk <jason.andryuk@amd.com>, <stable@vger.kernel.org>,
	<xen-devel@lists.xenproject.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] xen/events: Fix Global and Domain VIRQ tracking
Date: Tue, 12 Aug 2025 15:00:40 -0400
Message-ID: <20250812190041.23276-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000206:EE_|DM4PR12MB6640:EE_
X-MS-Office365-Filtering-Correlation-Id: a604fa9c-e92b-4c21-e36f-08ddd9d28a56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?POVh427oB0urNGjNdGXUFW29B1nP0yzm+Ra6XTPOOfBXen2I/L5CfDt4IOGe?=
 =?us-ascii?Q?E+8WWfbx9J/tkcfX/n90w/usYLpDB0UpRmeaey8i25XI/hsWOT9r3rOm4iwk?=
 =?us-ascii?Q?3ODP9/xIr9tBwZHv2D1cbs60CeZVMfyPpOOrsVFNipdk8cgZM4wg7vbVvyyp?=
 =?us-ascii?Q?rMHmr4YHn+cbjEvLsxZv28X2RRJezPrr4Tub2plKXxXrQc4W7jerUAliD1OJ?=
 =?us-ascii?Q?IkQMbPMw0yN3uJqz50ebWzrCXGItHpZg8wBUmTtNZFzXOPcdj1tHrLgIOuRI?=
 =?us-ascii?Q?R2sxRthYHGgP8KXUCoC0FvpPgl00X/ksCpz+DS/za0jeLaKVJozpl7e64loJ?=
 =?us-ascii?Q?zmNzdFml5dFORJDut03J2TRgl0F3AWl9Dxq7Zv/0kHXJLbKMufubu8J71u9v?=
 =?us-ascii?Q?4pvRFqNU5raDR9S2tBXhjSxC5O2jaLlK5tjQpaPiU/wUsApGDnNp8HW0m970?=
 =?us-ascii?Q?MMqFOy489LBKFiaiKLwpnw0agbRUUrCEuaQVQUdOs/UQwT9+/meXdoqp7BPY?=
 =?us-ascii?Q?AOWfrEqtMctSxPcgmnqEGBIoW2oHcfdO2jlsD6RpZ3zUzwaEwYJ8iIu8suth?=
 =?us-ascii?Q?HeNtpdJOuP1xhT88E7jTzXCQ+qIUaYqpN/TLFZXCCn8OBP4ssL6SbZ7EFmK/?=
 =?us-ascii?Q?mJ/GfC8U0OsyX0I+E+Wuy7dV/BqnlDX1L24PTl6MyDW0wTyL9tFjGjzn5G0R?=
 =?us-ascii?Q?/TXGsdtPWQIWMA8HSk5PAG+o+L6PK9l42/IijVQgFzVFZa7bSribJSDqobXO?=
 =?us-ascii?Q?azxzwgBYQidBYEE1gfO0Io1w2wFLnyRStr8xF0bsytHDcd+SFdcxBhUWUn3a?=
 =?us-ascii?Q?AHaNR4DltLzN3O3ouZVfYeM/Jqbq98iw+1l4LyZTPhoYg23iifRjRj3lJhHs?=
 =?us-ascii?Q?tWUKRGqJCyDHwMzSiYiYWpQ0iECXmf1pC++lYK3UJVs+Fx2YxlOtKzSaRfya?=
 =?us-ascii?Q?HwbMUx5M06tufeczLyh6tSC6cqcLdASbiwKzHyk5n0lGX0ArBhKdnT24yR+n?=
 =?us-ascii?Q?XTHLBmqoLaW+WSxAmDh0wpIIMIkGGSEQSIPh/7Ds/sZ1AcL5CHhw1h4+cKHb?=
 =?us-ascii?Q?svDNfOn7gzusAlDdTMwy/87zwI5hYxcM4a1XVKsz4OSckZ+G0Gk9EjwCbL2c?=
 =?us-ascii?Q?wLJ135hIirVS/8Ln+00Gi+UbWoPfFpfBL7//EPjM/IFYz0rFvbE19vFTO3G3?=
 =?us-ascii?Q?ukakeRhpBn7JFa5lX4HqEcQZVyHBxbepZroVXcFWtvlEz1OD17MDoNWYwfGF?=
 =?us-ascii?Q?Z5ax2zR+YdICXO6nQ3efSDUbDuTCKWRRZT6bIkXWgXh14sLWC1hNzQe6VXE9?=
 =?us-ascii?Q?5zUohsWHWb+yaT3LFIsOY4Uz3lHcN8rrRCzHuTruL1h0oxYVPK9kaA10DKOB?=
 =?us-ascii?Q?qimP6qs8yYJ4S+g5hExG4LooPhzJkVsfkBaV1nK2SzPM6HTn4XCUGhRT8Q38?=
 =?us-ascii?Q?E2n7oExXZiFNqF6/7IedFxI4Tz9eLY/HvozzuCdhMVkjlKmCmBnehhcNhrM+?=
 =?us-ascii?Q?sGksWJ07Sx9tqtqgwSXV9RARap8qWdLtLp11?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 19:00:44.2431
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a604fa9c-e92b-4c21-e36f-08ddd9d28a56
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF00000206.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6640

VIRQs come in 3 flavors, per-VPU, per-domain, and global.  The existing
tracking of VIRQs is handled by per-cpu variables virq_to_irq.

The issue is that bind_virq_to_irq() sets the per_cpu virq_to_irq at
registration time - typically CPU 0.  Later, the interrupt can migrate,
and info->cpu is updated.  When calling unbind_from_irq(), the per-cpu
virq_to_irq is cleared for a different cpu.  If bind_virq_to_irq() is
called again with CPU 0, the stale irq is returned.

Change the virq_to_irq tracking to use CPU 0 for per-domain and global
VIRQs.  As there can be at most one of each, there is no need for
per-vcpu tracking.  Also, per-domain and global VIRQs need to be
registered on CPU 0 and can later move, so this matches the expectation.

Fixes: e46cdb66c8fc ("xen: event channels")
Cc: stable@vger.kernel.org
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
Fixes is the introduction of the virq_to_irq per-cpu array.

This was found with the out-of-tree argo driver during suspend/resume.
On suspend, the per-domain VIRQ_ARGO is unbound.  On resume, the driver
attempts to bind VIRQ_ARGO.  The stale irq is returned, but the
WARN_ON(info == NULL || info->type != IRQT_VIRQ) in bind_virq_to_irq()
triggers for NULL info.  The bind fails and execution continues with the
driver trying to clean up by unbinding.  This eventually faults over the
NULL info.
---
 drivers/xen/events/events_base.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index 41309d38f78c..a27e4d7f061e 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -159,7 +159,19 @@ static DEFINE_MUTEX(irq_mapping_update_lock);
 
 static LIST_HEAD(xen_irq_list_head);
 
-/* IRQ <-> VIRQ mapping. */
+static bool is_per_vcpu_virq(int virq) {
+	switch (virq) {
+	case VIRQ_TIMER:
+	case VIRQ_DEBUG:
+	case VIRQ_XENOPROF:
+	case VIRQ_XENPMU:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/* IRQ <-> VIRQ mapping.  Global/Domain virqs are tracked in cpu 0.  */
 static DEFINE_PER_CPU(int [NR_VIRQS], virq_to_irq) = {[0 ... NR_VIRQS-1] = -1};
 
 /* IRQ <-> IPI mapping */
@@ -974,6 +986,9 @@ static void __unbind_from_irq(struct irq_info *info, unsigned int irq)
 
 		switch (info->type) {
 		case IRQT_VIRQ:
+			if (!is_per_vcpu_virq(virq_from_irq(info)))
+				cpu = 0;
+
 			per_cpu(virq_to_irq, cpu)[virq_from_irq(info)] = -1;
 			break;
 		case IRQT_IPI:
-- 
2.50.1


