Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PouTFBj5KGpuOQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:41:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC01665FC7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=xx5lJwJy;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333924.1597015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBgQ-0007fv-RX; Wed, 10 Jun 2026 05:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333924.1597015; Wed, 10 Jun 2026 05:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBgQ-0007dI-Ia; Wed, 10 Jun 2026 05:40:58 +0000
Received: by outflank-mailman (input) for mailman id 1333924;
 Wed, 10 Jun 2026 05:40:57 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wXBgO-0007d0-Tb
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 05:40:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXBgN-00A8VC-S7
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 07:40:55 +0200
Received: from [10.42.69.6] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f8de-2eae-0a2a0a5409dd-0a2a4506a376-16
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:40:55 +0200
Received: from [40.107.200.32]
 (helo=CH5PR02CU005.outbound.protection.outlook.com)
 by tlsNG-16d1c6.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f8e6-7371-0a2a45060019-286bc820b3b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:40:55 +0200
Received: from BN9PR03CA0434.namprd03.prod.outlook.com (2603:10b6:408:113::19)
 by BL3PR12MB6402.namprd12.prod.outlook.com (2603:10b6:208:3b2::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 05:40:48 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:113:cafe::ac) by BN9PR03CA0434.outlook.office365.com
 (2603:10b6:408:113::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 05:40:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 05:40:48 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 00:40:45 -0500
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
 b=xH45YQ8z9+LViXVqVrGnpiBGXYEUOot4CIhg9nAzAUtCov7snp6wUaASdYYM7tUnKHQ9dxlggdukR24aRdS6RY1dseH743GD0x1iZ6QKUvmLaTL4tZ3qn0xbHV9VGCVmJY5A/h1eg5GwnkV+0u3po6HHENORUtleDpuE6QLqpiEfJPJyrcSo5ql0ZI6GPxVi6ufP/Jms5fNkoERQuXOxwUlzwvVI6RSnFLBba1eyaQlKP9Dkmsd2JNOgZGU28QR2o9rDVDoCSD1bMfFf4kDCkC1zGIEBO5ROYXIgIeJG1XUOtQQfn0KMcp+fdyoElFra5yaLR2PgIngUGe6N0i6RGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OiwUxfzZ52HOR4Og8Wmwymh6ekARcn9POkjVivbBbj8=;
 b=xUYLHc7UbIdkCztA79QMpJCge16EFdpSQv+Bc+Oi5hFD2cbxINTejjVb6X0sby+OBKpNdLyDXW+ak1H0gyoj67dJfmimsg6g29ybdMVCDxIxr+lNYdrFF40/OPkAmLJLvYsp+zb+k93C1G7v9Rgy3i9+Gx3GxwtLJZ0G/xYIClYKpUN6VpkvzzgD1mfm/snVP1E1WH+1IUaPKOz8uQ26jXV9S2TwN5gHLGqZ6MNMN1vsAPIYKdOZQ5ruB3aKjosPS1fP4ouIgGGAb97IcOAq7THg2t/z3ieIDF0GscmWLJAigj3jmOXYebux6Y2Gy29KF5of5KtYjRFMBGhwcS2QKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OiwUxfzZ52HOR4Og8Wmwymh6ekARcn9POkjVivbBbj8=;
 b=xx5lJwJyC85M2Gzo83s4Nu+x/euVwiELZAh3tjE1ya52WI0bKGZBeQeWJfTehpLiZWkM38xqSPrqlaBsR7idZ7dGlGOkWb/fXi3nMf5/U5TIHDnvIsQbWSkGaQ2ylHPr5CQgaRxvkhs/AG5ga7gH896484ovRLWjDqOssphhwIc=
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
 Stabellini" <sstabellini@kernel.org>, Jiaqing Zhao <Zhao.Jiaqing@amd.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v6 1/3] ns16550: properly initialize booleans in uart_param[]
Date: Wed, 10 Jun 2026 13:40:28 +0800
Message-ID: <20260610054030.1624662-2-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260610054030.1624662-1-Zhao.Jiaqing@amd.com>
References: <20260610054030.1624662-1-Zhao.Jiaqing@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|BL3PR12MB6402:EE_
X-MS-Office365-Filtering-Correlation-Id: 264105dd-5a81-4c41-8004-08dec6b2d343
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|1800799024|82310400026|376014|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	A+jVLhUj5oN9IxSsEDpPKWrqO6PB3IQnVJV4VDqtuG0WvCmj1nhFXmPXT/kbLov3Cb6bJY3w5wZmoFPeIqD851RU7HuxgTkvhJRLospvpG5mjykT/ZiuI7+tj7HvRzztaCV4cMUxUuHFQzvQfTYf3APKaxx/L3RCVVMPvfn7B/fwHZp3bCoum0LGU2H8EXtRUbwwHIUAoRnuFYqDfrlDUzaKojH811HV/4P11L2+qCbSTe86iP1vxwOYPCr7TE+5f9b8lP26oHLRhKAiVVtKEx6jRQGbYen6Itzlr46ZZvotUr9ljICBERHyfChI5MS7YfUzWXK9EtGHNBq8cJ4VBXY0K8azkiQlrdJ0yfPYcG+b7jhknpuGuX8zemKX+fOhBQUgtVKlx+5mxyGFw2cZZvBFJsTDVPe6JlYPE2+zcxXeCo5M+r51Mb7lHHtLtb2jxy0ksw6KkbGdvif3s2pVkB9Os0KrfbBOeh2AG8pbJZvlwZo5ajT70avaS0O0HoIZ0DcWIv2E8WjUbtVL+orIMt211xKZtt6rgMec/ApQgFuwWUTtT8+nUxpAXbQAE6/HDrRaPxpXADYboB9XtK+2F0EqQRFqoXOoM/+MZpIa8mdX+HWR6T5P6UiyFljPtATOONUMTpE6HI+Wh6tPWtqPCIk9HGl7w2agE+7c6EAhj09tkE/GEP/otMBNu3OdkOLmUXzwjjiuIDMLZnTJ7yMOdimVTCofWLceyjrCUy7+ABk=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(1800799024)(82310400026)(376014)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Jd3nuV6UErl0/ktEjnBYonRTcOLNyU+grCz+F7UhJdLHER4DzhG19zKh7W2NoxUNoJSVPrTHAW9WvNJe78+s4C5CEotYetR97pDKIEqTYhvcz8Sn+RairFG1AaMiZ9PWDxKeLgqCq59Lj+VxFQwCj2ZMAV7qTJ1HoDoC5ZzuELHXCTxzxuZd3eXS7Zns8rkvq2FJKdJEP7QxmOsebQodQOR0vByJnbo+LPDfMcfwGCY/XHr4eHECccgViviEksPiyCWy98VHO/foE5+dPSgYDlA7sg72xElGIuUF91lg0A9xfnt/jD5ScBIp0ra1z0gIdvvdQOQgCf4GsyZaMJDB1XiSriKW3QjwJcoMgn2zUhEkU79PXvO84yMuKS088S2i4fFabP2fltPia8xPnyFSeL03jAZWIgyc+y7rUbRJuS5yQRojNLuEmknjMXwD3INn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 05:40:48.3691
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 264105dd-5a81-4c41-8004-08dec6b2d343
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6402
X-purgate-ID: tlsNG-16d1c6/1781070055-8797CD75-CDFCB032/0/0
X-purgate-type: clean
X-purgate-size: 4017
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Zhao.Jiaqing@amd.com,m:dmukhin@ford.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,amd.com:dkim,amd.com:email,amd.com:mid,amd.com:from_mime,ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9CC01665FC7

.bar0 and .mmio in struct ns16550_config_param are booleans, hence they
should be initialized with "true", not "1". No functional change.

Signed-off-by: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


