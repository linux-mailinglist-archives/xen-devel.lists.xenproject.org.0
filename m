Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D479EB35088
	for <lists+xen-devel@lfdr.de>; Tue, 26 Aug 2025 02:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1093761.1449192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhyO-0001Up-0D; Tue, 26 Aug 2025 00:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1093761.1449192; Tue, 26 Aug 2025 00:55:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uqhyN-0001SC-St; Tue, 26 Aug 2025 00:55:39 +0000
Received: by outflank-mailman (input) for mailman id 1093761;
 Tue, 26 Aug 2025 00:55:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=etY1=3G=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1uqhyM-0000hD-TK
 for xen-devel@lists.xenproject.org; Tue, 26 Aug 2025 00:55:38 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061d.outbound.protection.outlook.com
 [2a01:111:f403:2009::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60f9434b-8217-11f0-a32c-13f23c93f187;
 Tue, 26 Aug 2025 02:55:38 +0200 (CEST)
Received: from DM6PR14CA0055.namprd14.prod.outlook.com (2603:10b6:5:18f::32)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.14; Tue, 26 Aug
 2025 00:55:34 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:5:18f:cafe::47) by DM6PR14CA0055.outlook.office365.com
 (2603:10b6:5:18f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.21 via Frontend Transport; Tue,
 26 Aug 2025 00:55:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Tue, 26 Aug 2025 00:55:33 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 19:55:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 25 Aug
 2025 19:55:27 -0500
Received: from fedora.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 25 Aug 2025 19:55:26 -0500
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
X-Inumbo-ID: 60f9434b-8217-11f0-a32c-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iyU3wxYGpiISoh/ORueFSlytgk+9QjxHWrrI+iS77I8904KH0bmveF6N9VU+okulfnrkePT4SD1RTIlTsRJRFdqSsnj0EpyUYr1ICpkXCd46C+tG+0ptUNybsT08+kFyDL4l2qOi4/q9i3kuueuodtlNyDtQDABrJLUGuUK8Art/hVD6eiraEXYcx08GmVvMoUIn3EXRXPEOgeRFbcXEBGMPCmiY+I0vTHMxsP+/gre5C+FBhzLoC1bVWRN7eFayeHZpD5+t7wSF2hNHl9XVbAWaKA1do+edtNX6IDiOAyAr+U6aRO0roXycbudLXzcB1PIytZz+gksNnNgbBABi5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vhSEPF8a35m/xTcBty/l8kD6Fit9wlVpONLWs4x9hHc=;
 b=G26YkfVD81nINmHApXz4ZmP6moCflXuXTcTRFWEFE85quKSoF8RIPPr+N3vhXtGt//Ns1qSKuiHp01TwhZHEdZ+5Pfid2lSutwQl0gg7vOZvO7GbG5mKkf56huNfiAP1BDqp4+SaRb67OkZEw5DPKPBhlBVHSiVvzkc7DhUOOWC7wtzm1poByNeNFKruVvK4rKDR9MpF9X3qBr26+mxvd59qe5Rqdynfs8ZRurR3Nr4pKezYW9H1WPvKaRyg0gf7fMjIMKIfLrvV9Py9HOU3Qr1spfyCoJ4FWmrjdd/fcapJ4Ppv7rkqW8ugr/v79qoJwI/U8usU+r+ZzHm67Flm7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vhSEPF8a35m/xTcBty/l8kD6Fit9wlVpONLWs4x9hHc=;
 b=RVCBfS8XKocgZAYHQbndIsv6uFJPNsX+hv+3pDf92Soh59aeNbp4tm5g4EP3ZW04EQqxlkT10ebS+DBZHOZBtPm2sQFv+U9odzWu/wTiQVD6eECd3C3IlTN38iVnGUOMYOIXRH/pgSHGK1NuHxZvu7dJKG4CBag/l1hEt/PD4G8=
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
Subject: [PATCH v2 3/3] xen/events: Update virq_to_irq on migration
Date: Mon, 25 Aug 2025 20:55:15 -0400
Message-ID: <20250826005517.41547-4-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250826005517.41547-1-jason.andryuk@amd.com>
References: <20250826005517.41547-1-jason.andryuk@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: 257c7527-1b1a-433b-18bb-08dde43b4337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nMu5kN6+I6t6UvBysYvjl1/MEYUrCnNC8IwTMUiApM6Y7vjcU5L7+M2ajHCD?=
 =?us-ascii?Q?fm1E04TgLfivlaY/KFpx/OBXiRVFWeSJt4HfkEglYRNUqCUJVW7xdlX/ESS4?=
 =?us-ascii?Q?vo8bpZqUeUCIMQxSaY2wZiDof6geiz/JyGw6W9jHMLqrWO33opFWTKOE3mG7?=
 =?us-ascii?Q?AivaUi5VktkKg/vNRYmshmMkvDxlasVH47xXY2Nx56YIyin61gDNGwWcQtjO?=
 =?us-ascii?Q?P1+KWpnSWMR0bVPQTGf5h/gOr80x8N4np0ZJwafstEU4qCPM1KsFVQ8QEd+M?=
 =?us-ascii?Q?SVEDfgGUW4wLHNDFoU51KIc5ZULnsfv35s7lR/org0HSwDACOGU/20RQco9f?=
 =?us-ascii?Q?99FEOryKLszZ6v9KGyeHpuTRhYku1n53KcTZhHMmaU/juJlwdycxTxRZJS1n?=
 =?us-ascii?Q?LrTxbJ4E8tAotqBtD6kUj3GaW2XMACJjWygKwl11mBJx9Tf0gBr2prrL1mHR?=
 =?us-ascii?Q?T4gTczicMx8C/xgckO+miyL2mns3q5tBNUoP1agh5Cyoo41TnHtVWnlvER8r?=
 =?us-ascii?Q?xTAvFr6rWe8ThzSOwSthdHcxJRlYpvNTUXiLziVp1MgTtSUCQpPAYMLDXMv1?=
 =?us-ascii?Q?tXoPs/dtEkYfO5Y2SYIzFAB49JbZN/M2oXjE2+onWoadlFVjtXQuYlCP3GiQ?=
 =?us-ascii?Q?4W3+CF5a28GBiyoRGIs92SwcM24971eCdefuOL7ufVZAZ/7e4dmH0ZHmGIde?=
 =?us-ascii?Q?FjMOWGPBlz6RXnG+GbBpCIvG4TS48hhRae/39OtZqKAFBPEUKi6IBA7M0Utg?=
 =?us-ascii?Q?oKvMilWMMZteVwD5/f9EUaTLcaugmrG3GjF/4sPDpSP5DLBTENFPhy0WHHKo?=
 =?us-ascii?Q?sxpr4u+NPW6EK2WD8zL3J9vAlQBG3O8fA4qQybwshy4b/RvYeJv529byUyfz?=
 =?us-ascii?Q?AAGWmAmFKNwFE26HzvOVBG3DIIeO0+MIlcztVkhWdQYGYQzz+/H8G01+OqJH?=
 =?us-ascii?Q?d2w4QDk1DwCbOK2mOFfkC02qZAKUenToIQfyOaNwurdUEfus7yJs/gRg0iec?=
 =?us-ascii?Q?kYXJJ6wWJaY5Nt9sJYkr+jSwRffnBucwH1ruJJfHwtG5okUylSUcRy94D2Lg?=
 =?us-ascii?Q?+reSQ4ypSSvEQlivuZKGa1VmV2HTu12f35b3fGW5Cy1wFTHaRtM9uutAEcNM?=
 =?us-ascii?Q?WbNbqpNXLwuLW168eTNjWY4E/G3sGteGmPdZrWEoCrW+bMcNYR/eS+OOSC7L?=
 =?us-ascii?Q?GVxbEmPzlIlizGHekFE56hQRrluaRhe/a00yhvdsr8bVqgCo7krGflPF9oLR?=
 =?us-ascii?Q?vZ6/ARt5r98MWPx4qKGnH39aGx/IfucC0TpPx7/4dIQmtW3RyDKN0+PrIwhY?=
 =?us-ascii?Q?vVIgJIuyy81QV3bea/owOwxHVRrw5CYi3m5bEZ8nFGlw4ZuU0ybFs7947HVx?=
 =?us-ascii?Q?MJsS+vQYboQ5q+Gc+1jp1tzI5cjtQXQPjGbx5JyfQvmsqim0HNfvuUORUANU?=
 =?us-ascii?Q?O4hwTi1b3Y1tW72mPpjeUPea+ylza4Un1fbzXHHXJ8nbpbk3mG5dFqTLPvVk?=
 =?us-ascii?Q?XmZFJ5f3NvQcIeXnA72fgPKyULIXqfFzSher?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2025 00:55:33.7475
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 257c7527-1b1a-433b-18bb-08dde43b4337
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272

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
V2:
Different approach changing virq_to_irq
---
 drivers/xen/events/events_base.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/xen/events/events_base.c b/drivers/xen/events/events_base.c
index a85bc43f4344..4e9db7b92dde 100644
--- a/drivers/xen/events/events_base.c
+++ b/drivers/xen/events/events_base.c
@@ -1772,6 +1772,7 @@ static int xen_rebind_evtchn_to_cpu(struct irq_info *info, unsigned int tcpu)
 {
 	struct evtchn_bind_vcpu bind_vcpu;
 	evtchn_port_t evtchn = info ? info->evtchn : 0;
+	int old_cpu = info ? info->cpu : tcpu;
 
 	if (!VALID_EVTCHN(evtchn))
 		return -1;
@@ -1795,8 +1796,18 @@ static int xen_rebind_evtchn_to_cpu(struct irq_info *info, unsigned int tcpu)
 	 * it, but don't do the xenlinux-level rebind in that case.
 	 */
 	if (HYPERVISOR_event_channel_op(EVTCHNOP_bind_vcpu, &bind_vcpu) >= 0)
+	{
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
2.50.1


