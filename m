Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id izVBMlQBH2pUcwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:14:12 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E76301D4
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:14:12 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=Czcyq1sK;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325244.1590736 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURkd-0003Tg-Tv; Tue, 02 Jun 2026 16:13:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325244.1590736; Tue, 02 Jun 2026 16:13:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURkd-0003Qv-Qw; Tue, 02 Jun 2026 16:13:59 +0000
Received: by outflank-mailman (input) for mailman id 1325244;
 Tue, 02 Jun 2026 16:13:58 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wURkb-0003Qo-VI
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:13:58 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wURkb-00FG85-Bs
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:13:57 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1f012c-e002-0a2a0a5209dd-0a2a4503dd8a-40
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:13:56 +0200
Received: from [52.101.61.4]
 (helo=DM1PR04CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1f0143-672d-0a2a45030019-34653d04d8fb-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:13:56 +0200
Received: from PH0PR07CA0089.namprd07.prod.outlook.com (2603:10b6:510:f::34)
 by DM3PR12MB9436.namprd12.prod.outlook.com (2603:10b6:8:1af::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 16:13:51 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::a4) by PH0PR07CA0089.outlook.office365.com
 (2603:10b6:510:f::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 16:13:51 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 16:13:51 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 11:13:48 -0500
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
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEC+S1LnzucJm+jsTMOqmzS4bH6by/5g4MttIT7+sFD0R/3ZBOH4ljU7BtJxWseCB/R8BvoJNDrO1xBg2J9X7aqo12WFlRsUrPoeTTCn72kx3S6ZQblKcKIj5CkMdm45nvXHXw50OY9KQtCi16KhKqLOYrwyZOfXIMjaEsYuI8901gnXOPXEwp+Ba79D/9Ag8YO4dn2z8rc4QEG/szsZKat+6h2AtuhO5/oTteWo7Z3N2TGqgTaSV0l9ZiH9QUqMRecta5svXKQyJ2MMU1NYtYwBy71Q270BlqdCVYy/Cf5bERSDo0lyDKcu1nC3+VEEjs2xU9/lNlcRbV38xvuycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/5wjExFgrECeZXo0LIdaPSLBa1YW2XcC2RuGP6B0jas=;
 b=pkjSGwVkDZ/R5fwkNfI33BwxtC92RvhKI/YdB1ps8ufM9Fdx+81Xrh0iLhOFiPlRwGB5QbDar2CG6/Cve3MWHAWLj/UXcpgkB1hf7RwPZnRRRgZvCceAZ6b5K9xYNoniMmrEWbB5JM2aVYqNtmfpRTTMdH2M7jG492qv5uDqdWnVqphh2dv+ghO+iyNNmO9gt1Oqnsr6kT5+E4Q5kNcyDIhpnh72bzQCnIXzmb2q9mua0bCqDin9TWUMoQMSUMGVFxHh079wDc9e0FEAQ1tejM60iL3HOq0aRi3aAvKO9kTNxj14CFgmc7YRxMCPGzw/yBi39Mid0tTv/n7e5v0TOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/5wjExFgrECeZXo0LIdaPSLBa1YW2XcC2RuGP6B0jas=;
 b=Czcyq1sKF3oj7ijx2aN+4bqlJj/cKSmmlL2GLqO8iPVKFZVp4a0KnJNw83bOejItHWn519HYDHZk/qwGyUZoKH7mni22hhNZ2slb3HZDLaKsBvf760WF1t5nG2AKPRdVZpOojqTP4GRXzCVKQ6s7YU1uGXkUuTjS698cZFOUefo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Subject: [PATCH v5 1/3] ns16550: properly initialize booleans in uart_param[]
Date: Wed, 3 Jun 2026 00:13:20 +0800
Message-ID: <20260602161322.1039349-2-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260602161322.1039349-1-Zhao.Jiaqing@amd.com>
References: <20260602161322.1039349-1-Zhao.Jiaqing@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|DM3PR12MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: d3d5cf7b-8e04-405e-f307-08dec0c1ef85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|18002099003|11063799006|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	p1PomzSsby15stbCKIWzrBKMl33iPhJ5lrWDFyEVX2FKoiF/neQFaDjl6S30TpcjKBbJaFmqKIiMqsTUKTHlq1X+5Y9mKXZTUh0F6guVeyzt0vYUPNMDpMZx1Tnu7qrx7rMfIr0XDw+alrpFN5hjUHx8bLof8upm3fs2UI9L21j+svqAXNKchuIgWxMpIEQVqWOK3NW7dO/zRjpk3/5uua77enV0Io6e96GycoUixyp9ZO7LLp/Wgs3SunJFugMF2OjF4WeC438pbwAaF7ZCN61SZ2KdFuFY/Pisvldb9nB2QN7/rkAyg5fcRuJrhqZXu+usbOE2taj8SmuUw0wg5jb1p4O7z4E2hC/l+lE4IHi7D3O+YvQOCKRUJT+7yCiLA8JhIpmI2lLiVu6p68e0RPFDZbmaUjU1M2c9e06GGfN8CWLkRpslKcPfW/BRbQ+LiQL7rvO4MVsW7maptEjKEDFTyD7mQZOHZPNquI7ns6Fz9odJUcvHgLtjlGY+AeblI/FfKvDpD8ANO7ocTEO8nCso8LDFYr7cHug5acBzLvHzTYw/LYmGvLSPAJ651EFJlAAkGbrZHQ6ltqOHNBCuTOPk1463DrqHHJsWM639pjSTS3po2hLn7PLc/01a5wdBayuxAwrYfKcFVTipj+CnY1WWNmnRk57l3OLAlNxtRrx1DTXw0/xK4IeXH8rP+FXYmPGay5HMDiwuMkU9khlgcpc+OuiTnYCsesz1cjnb1nw=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(18002099003)(11063799006)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	t512x3lGK5WudAovyL7kdJG9qQnLEIXopT6ppQY20fS/6o/hUOuOF+vbJdH+FGzpJZKlIe0GncAwdUD4aXtvsgK8u/YtfuOgcVOcRs/exXAV7aRriIExGEgW7FEU3P6HSp5VMNDkMZy6+k+chPvXStFqFaMBZH9MXJN7tGFSc5bdSonvB+8+dkyXuLCHdKJQQXaLluNFvGQWTtqcoA1psEPSvH23/FNC01rMpJdwLro7ZW9Y5bxRLv+1eaVE4EJaFp8AXwcdOoexH8tTWGZ46q0ZDINKA9FzJYme6EY86nuHcdauxyGoOa3E47tD585uuLAxLX27I/yNhYcNGZPjAToZfQe7nN4R/x1HVnsSaUQA0gXnKiFZFL5oliajBYZ6bEdVmBxgW0HKvIPYl6sqZbT9WGUo1t/TwtH1BgKNWgWbRwfonhH7ZbnqtlVdsnr2
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:13:51.2304
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3d5cf7b-8e04-405e-f307-08dec0c1ef85
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9436
X-purgate-ID: tlsNG-33051d/1780416836-36547938-6C50B3FA/0/0
X-purgate-type: clean
X-purgate-size: 3928
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Zhao.Jiaqing@amd.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:from_mime,amd.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2D6E76301D4

.bar0 and .mmio in struct ns16550_config_param are booleans, hence they
should be initialized with "true", not "1". No functional change.

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
---
 xen/drivers/char/ns16550.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 878da27f2e..ed4e29ec25 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -758,7 +758,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 16,
         .lsr_mask = (UART_LSR_THRE | UART_LSR_TEMT),
-        .mmio = 1,
+        .mmio = true,
         .max_ports = 1,
     },
     [param_oxford] = {
@@ -768,7 +768,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 16,
         .lsr_mask = UART_LSR_THRE,
-        .mmio = 1,
+        .mmio = true,
         .max_ports = 1, /* It can do more, but we would need more custom code.*/
     },
     [param_oxford_2port] = {
@@ -778,7 +778,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 16,
         .lsr_mask = UART_LSR_THRE,
-        .mmio = 1,
+        .mmio = true,
         .max_ports = 2,
     },
     [param_pericom_1port] = {
@@ -787,7 +787,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 16,
         .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
+        .bar0 = true,
         .max_ports = 1,
     },
     [param_pericom_2port] = {
@@ -796,7 +796,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 16,
         .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
+        .bar0 = true,
         .max_ports = 2,
     },
     /*
@@ -809,7 +809,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 16,
         .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
+        .bar0 = true,
         .max_ports = 4,
     },
     [param_pericom_8port] = {
@@ -818,7 +818,7 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 16,
         .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
+        .bar0 = true,
         .max_ports = 8,
     },
     [param_exar_xr17v352] = {
@@ -827,8 +827,8 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 256,
         .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
-        .mmio = 1,
+        .bar0 = true,
+        .mmio = true,
         .max_ports = 2,
     },
     [param_exar_xr17v354] = {
@@ -837,8 +837,8 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 256,
         .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
-        .mmio = 1,
+        .bar0 = true,
+        .mmio = true,
         .max_ports = 4,
     },
     [param_exar_xr17v358] = {
@@ -847,8 +847,8 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 256,
         .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
-        .mmio = 1,
+        .bar0 = true,
+        .mmio = true,
         .max_ports = 8,
     },
     [param_intel_lpss] = {
@@ -857,8 +857,8 @@ static const struct ns16550_config_param __initconst uart_param[] = {
         .reg_width = 1,
         .fifo_size = 64,
         .lsr_mask = UART_LSR_THRE,
-        .bar0 = 1,
-        .mmio = 1,
+        .bar0 = true,
+        .mmio = true,
         .max_ports = 1,
     },
 };
-- 
2.53.0


