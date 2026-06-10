Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 71BgEhj5KGpsOQMAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:41:44 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DC3665FC6
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2026 07:41:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=zg+3n6ZX;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1333925.1597016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBgQ-0007gy-Tg; Wed, 10 Jun 2026 05:40:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1333925.1597016; Wed, 10 Jun 2026 05:40:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wXBgQ-0007di-PN; Wed, 10 Jun 2026 05:40:58 +0000
Received: by outflank-mailman (input) for mailman id 1333925;
 Wed, 10 Jun 2026 05:40:57 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wXBgP-0007d1-0L
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 05:40:57 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wXBgO-001fT0-3B
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2026 07:40:56 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f8e3-5cb7-0a2a0a5109dd-0a2a4502ac38-8
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:40:55 +0200
Received: from [52.101.57.6]
 (helo=BN8PR05CU002.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a28f8e6-af86-0a2a45020019-3465390675b9-3
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jun 2026 07:40:55 +0200
Received: from BN1PR10CA0013.namprd10.prod.outlook.com (2603:10b6:408:e0::18)
 by DM4PR12MB7528.namprd12.prod.outlook.com (2603:10b6:8:110::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Wed, 10 Jun
 2026 05:40:44 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:e0:cafe::78) by BN1PR10CA0013.outlook.office365.com
 (2603:10b6:408:e0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.113.11 via Frontend Transport; Wed,
 10 Jun 2026 05:40:44 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.113.7 via Frontend Transport; Wed, 10 Jun 2026 05:40:43 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Wed, 10 Jun
 2026 00:40:41 -0500
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
 b=lo9qQRAO24jVVbcDtmCcWccivd1sjDc+5I4DsehBQeVFfPCPbjg9bLWq0TFYMpjnbkfDCfHf+vBMPlf8HJZOwRakj0TgAiovSORHUT+AV8MngkjL+caOsp5aIvXmlwm1iGoi7LagHnBkI/0TQZO2j9k/YUwWd10OyVMe8dglzZmEKdWv9zrPS8fa888diFGMCLZYZfYDlm2KG33PD7+D+AOt+juGgKUqjgtbXjkJ9fPWFhRr2tqkhbWWed5JqnQVC5czHAgZ6Xc+qwh2VVDjIJkW4xG0JSLWBbsHvvfm15kTMJX0mkTldOvqlktienRq4cnGW+rtYystfJzKdZcDGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYcRjw/JSrIgQEQ9O31SGZIlBoyb4G7AtR8nso0H1kc=;
 b=s1ndPnLYMIgRfjeX19tW4uIumM7oGbGcTo6wn+1NBrvoW9A4qAP+xB35n8WIG8JyBsqsmmbsc9pfGRMS0xbeVQufmZSDisBhMqWgN0WDocK+ULp3F1NGE/pl+8Kliz6Ef5Scb3OvQO3Mis/iZu8iK6XYT27Ym5H/63Ul2pPu4TRYGKbBHUC9/Nyijcb+aXAjaBCezuFqKMJQXxJnF+7oG1yMNzCUSfAAwyYpzxBfXqIHTuYB68CS+/Q2W9MToEWCtSZewd08GFSOeTNTbLukJoFfAGfudLiwNIgqTQD4dAuev+/u6Dpyt34DaUFLzdNf83QkAUPyucz4/2Ek57C1Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYcRjw/JSrIgQEQ9O31SGZIlBoyb4G7AtR8nso0H1kc=;
 b=zg+3n6ZXYpITkaR9JF28QLk+pi6QD0WyFRYrIcOj9JmzXTeSCJnvN/of607oYdgFoiBc8WFYa5JLSFN5G1qwtAuFOvfVhoZFNTCAZAUY41dKbReGYgC9sPbomYO5aQQYihtVy50Jd2qslrFsvgU3MHB4NHaEgcT/EcVVriHzeXI=
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
Subject: [PATCH v6 0/3] ns16550: add support for WCH CH382 and ASIX AX99100
Date: Wed, 10 Jun 2026 13:40:27 +0800
Message-ID: <20260610054030.1624662-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|DM4PR12MB7528:EE_
X-MS-Office365-Filtering-Correlation-Id: 6219ebf7-c3b3-4ecb-78a4-08dec6b2d099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|6133799003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	TlmtEIv5IcZyoJ7CH5gkPayM4mLPn0ZW7DAJ0jXg6VR2v9Z+YnxB2T87fbv6rYJRRJiCz34/YwTQhDw2ZAZDTWugGpEm3cfL2fq11K4MXKLZwvFgA+kTTUxdfmTlDJu7WpFs60dNMWFGh5WUyMyUIlohRFc+ZFS2g2dH4lxHxYPpgh7vz79/mvIKXOpbvjbpa0kD0mgbhKn9Gn4oIaTy5L/NH/U/YyCbLYLJCNP0fsllbVjGSgzMtaD/jgDQ7plKZxsqhAeSLhT1Z0ZePc0AT1pDVzxtCeG4lK2UIBF/mewZenuz4MVAoE1hdAiXh92f6KtfXPQlhnUlLLh2IKKxXfa8MVrnJO83A99vbEtoC1b5yaptxxhroSIclQ46y7t1cRvZgPMGsCdS30v1oZ6OCkTNbQHf+3Ce6hB+7wPjvOjsKYew8eqHIsfAWpnzhpSh72u1Ngh1WRafdrauw/AC8gDlvGos/L4cW4YFohb+GQ+Xu+58tir5YUL+HmxptrFpVEmZZYQkZKZ/zrXW+Y0BfJIyJw8rr7TW5WRxC9yYthBnnMUrDNGBJOgYBqzSHN4Ty4TwEWJSk58VCLEsZuVUNNVjil0KYpebWHievMNZmLQXmBzPzHXbUX7yTuspWyU4PcPy7zDMBaNJYiDXSaboWjSTJsTP/27Jq5uhPp2y7U4Qf58fWjCR1h8peDQJTwVmzRJWkZn+ryhjQ024rNAlBpFyGHEQHilnfMZRWfknh1I=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(6133799003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rLGUclHx+Et6yxQg1sJkO6dnXc+9vsQayfZSr/Ah741aZrPvVVLG6lI30LBjBDdV0M8NcXacclgKTTuKna2Y0tc+zHEYLUXdrTvjTtRZD1sNvoEj1lLgvF9B1jg00IDiTInzPm/QznBhLN1fXGkNLN++l610aviaqPwE4nbr4tPGe9Oupp1EspzVgKU+tqfpdEhfIlaEr7XKnFnoHSRNu0mPlcJkF4zKLh+KMdF6WmUSMP624bk7gEG4g3UAAJikORCjmxRMiyv0IJ8JZVFkEQpYQP/kIrxmvMd1OOitg0Hckhz9eO2A6b2131i5tQvedAs1XL137nMfa4Uk5X772Zx1x5SuJZAPBvsFVgaLN6TX7H7WsEoMn8bsTCi7xrnBMxw1xJOQU8YXYZFEHSf4bOkoVNsyl22bdOEuCsTIBRvjHIC2QMrWp8gGYmMUK2FE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 05:40:43.8938
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6219ebf7-c3b3-4ecb-78a4-08dec6b2d099
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7528
X-purgate-ID: tlsNG-720697/1781070055-83F66161-EA7C69AE/0/0
X-purgate-type: clean
X-purgate-size: 1349
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:Zhao.Jiaqing@amd.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Zhao.Jiaqing@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:mid,amd.com:from_mime,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 92DC3665FC6

This series adds ns16550 support for two PCIe serial adapters found on
market:

 - WCH (Nanjing Qinheng Microelectronics) CH382, available as
   CH382 2S [1c00:3253] and CH382 2S1P [1c00:3250].
 - ASIX AX99100 PCIe to Multi-I/O Controller [125b:9910].

Both chips expose 16550-compatible UARTs through PCI I/O BAR0 and
work with the existing ns16550 driver once a matching device table
entry and parameter set are added.

v6:
 - Add Reviewed-by from Denis and Acked-by from Jan.

v5:
 - Add Acked-by from Roger.
 - New patch 1/3: Initialize booleans in uart_param[] with "true"
   instead of 1, as suggested by Roger.

v4:
 - Add Reviewed-by from Stefano.

v3:
 - New patch 2/2: add support for ASIX AX99100.
 - Add forgotten Reviewed-by from Denis in patch 1/2 (WCH CH382).

v2:
 - Reorder entries in ns16550_config to keep them sorted by device ID.
 - Rename PCI_VENDOR_ID_WCH to PCI_VENDOR_ID_WCHIC as WCH has multiple
   vendor IDs.

Jiaqing Zhao (3):
  ns16550: properly initialize booleans in uart_param[]
  ns16550: add support for WCH CH382 serial adapters
  ns16550: add support for ASIX AX99100 PCIe Multi-I/O controller

 xen/drivers/char/ns16550.c | 68 +++++++++++++++++++++++++++++---------
 xen/include/xen/pci_ids.h  |  4 +++
 2 files changed, 57 insertions(+), 15 deletions(-)

-- 
2.53.0


