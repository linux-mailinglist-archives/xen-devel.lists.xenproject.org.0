Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id pHnVIWIBH2pYcwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:14:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F576301E1
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 18:14:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=slLeAJzm;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1325250.1590764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURkt-0004JZ-Sq; Tue, 02 Jun 2026 16:14:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1325250.1590764; Tue, 02 Jun 2026 16:14:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wURkt-0004H0-Nk; Tue, 02 Jun 2026 16:14:15 +0000
Received: by outflank-mailman (input) for mailman id 1325250;
 Tue, 02 Jun 2026 16:14:13 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wURkr-0004EW-ON
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 16:14:13 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wURkr-00C4nC-51
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 18:14:13 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1f0146-5cb7-0a2a0a5109dd-0a2a4503e77a-30
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:14:12 +0200
Received: from [52.101.43.7]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1f0152-672d-0a2a45030019-34652b07ddd5-3
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 18:14:12 +0200
Received: from PH0PR07CA0081.namprd07.prod.outlook.com (2603:10b6:510:f::26)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.17; Tue, 2 Jun 2026
 16:13:48 +0000
Received: from SN1PEPF000397B0.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::42) by PH0PR07CA0081.outlook.office365.com
 (2603:10b6:510:f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.92.7 via Frontend Transport; Tue, 2
 Jun 2026 16:13:48 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000397B0.mail.protection.outlook.com (10.167.248.54) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 16:13:48 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 11:13:45 -0500
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
 b=hGrtAlJb2tmcJQEL3I0MK8WxzjSyNJ6P6VsU2tEJVceucZxwQ50l3whRGuO6bzs96o3OTrJOEivm89gQUUwcffA7GQKXfFZ1GixWZah7yG8pM5BroWWpyZnHNGjxwhLf3ALpnVsRMJFkSe7B9hUGp6cVpfbz+aq3tAbgqkTMgdrlq79lk22o6t9I9EP/c9NZr6A4El5hKUEp5pcJMxdjX/0vCtFWxrI1s3AlmFl7eOg68voKv16CUZXD5yY18j3dlzbGSf3435CMY8eMjc8uXJcmL4UVLj5G/+iexBVYNXHkJFFXG1HNtaKg+mq1JD9oHqApvSsqyiDVwABl4MRY9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SpoZNic4rcaI0BhSOmmTd8TpYSwesSiNFJ/rgC7NH4=;
 b=fHnciJ4YCb/ua34dNw47VEeq2AuHxDx6+sTS6TLIGB19k2w7OEywPqSHywGyhdnrw+i/1j8mYXYTZcEkjjBhkxvmFrkZh1Pdf2GPBSKyOuVpMWh0NsM187uZMhFynTI/vvQX3uhx5MZJXCz+Ygt+DOqBOLZ5H5Q4MKNxn1PNKXMwGOks48TAXUEEvurT1srEDEk846JoGDPGV4ikpLefpgTbY3iW5H2+VoTsAgJrLU0W4W8kUzZ/ZhKPGIf1LN2mOe8rOJn7a+HVdgft03vwHQHDIohhaYVDmpoA/euh1iPmYgnX7Qa8pcKG9OKW5sZsKLqgro9iYbGNKMCNOBnPZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SpoZNic4rcaI0BhSOmmTd8TpYSwesSiNFJ/rgC7NH4=;
 b=slLeAJzmTBzefhBcldnuxDkdwwYPgPVC51NkoCH9Aww/qmMgx0dIzz7NJgAYHC+Og8H8spEGm+kE440KD7dHMEDHZYwwmTjc50m/pmzWzl9q7skw46t5k97YwTb1Y738O0aSl1woskwc3PIwGPl01T5lqNsRLwv8Fw/2dVCA/Lo=
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
Subject: [PATCH v5 0/3] ns16550: add support for WCH CH382 and ASIX AX99100
Date: Wed, 3 Jun 2026 00:13:19 +0800
Message-ID: <20260602161322.1039349-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B0:EE_|MN2PR12MB4061:EE_
X-MS-Office365-Filtering-Correlation-Id: cc9c4b89-9817-402c-a41a-08dec0c1edba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|6133799003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	ps4GYyJBqUM7NJyPMqASRWRQxk+nWvwGh8XxVOUH6ozACa+7rT5FpUXNwFBH2EXcmC5qkpQYds41rG5o4SbmIVg04VAXm8wFM8ppsqxBdpZ3dpxg56UHs/5scXnJIJ94huP27c6GWK9vV2X5kdQXVO7jnXjcswUBjQzDZ8gJDuOmNQcACS/HPLnHhSnHi+y4QHyI8WOrDvjqjLPA9PdA7qs19o2bzibShiiwpMit6fmXRNOhkDpZaMhSrDDIKsGRE75PxSWbDnKIhWeLlgwoQYsalm6ll0AMo2Tz6fhaNsBCPwG0AwOM+cEpZpkoCASfon7//2IyXaM/VATVqSoboXfIy+syy6bjqH+4Kj+i29dOH+12mwgnMjGVKTWohknFkEm6Kg6kv34kRwOFjNbR+4tjUJFmi8AO8wQ86Zt+PCJf1t++gqr9IzTRVKRDyaJWJ2girKqfoklomiSzw1AVMuQ31M78trwVA1nbwlRI5s2n3NoBDQ0W3AiPviimK5QrnP744KwOIfvfw6CPTdacocPOLGtL+a/9k6FS0N0bDQf+owsHbAOhlnDPqGYYNGBYh5hzKO0DMv2z5MbjjByRsJmZmuQ8SyOOtR6oqt763mUTVF1e/7qGhTlTSypPAx7qTvrjt7CsZ0JBv5qI1qOaQnK0e+9jhEk106ocBfHfVDDYq3fg0+vdyfK22JncJvyl13nUxz7FKSxCsmB51Y40Ik5w0cJFIRWV5ZzB6ickQ+g=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(6133799003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	m63Uyyl0vq//FVyP313vOFlCWKRusE0gXFZmyDm4JRe2ck+DhcHEUVmAq5u//nbFFtRQ1xcKexzyRUNNfKx7V+A3mTyzpUln7GwRjZuPck72SWiENkO0UMLuxzrc22o+CW+PZSzJZRwyp+4BKV/5I4DveMIyyyIiNcTOXWIiHU5lMX28XNLjlUcIGbLI4Af+taAWnw0iWf4htfSOVdZBDhJ1aD7EaEcAxkcpE8qmrL7omXj/gcmCr6GepfwP9a6q0oRYg+vDhonYjkPhFS4oDpLwhHN3wP10NDXzDGE1EYwhXu8+yhdfgOcVdAAvf2hjWIvyNPMjzzOTUk17y0qa1TR50ShI/nGBsxBR79/V8rIn8DhLiSx21yYBU37pwYDxDSTUF/b+J1EO4XZWcZW4aAK/CFglaObqakoZlgw69+nv6iqOm+BPDzCak0yKJARX
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 16:13:48.2217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc9c4b89-9817-402c-a41a-08dec0c1edba
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000397B0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
X-purgate-ID: tlsNG-33051d/1780416852-3754F938-318CF14F/0/0
X-purgate-type: clean
X-purgate-size: 1487
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:from_mime,amd.com:dkim,lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C8F576301E1

This series adds ns16550 support for two PCIe serial adapters found on
market:

 - WCH (Nanjing Qinheng Microelectronics) CH382, available as
   CH382 2S [1c00:3253] and CH382 2S1P [1c00:3250].
 - ASIX AX99100 PCIe to Multi-I/O Controller [125b:9910].

Both chips expose 16550-compatible UARTs through PCI I/O BAR0 and
work with the existing ns16550 driver once a matching device table
entry and parameter set are added.

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

Jiaqing Zhao (3):
  ns16550: properly initialize booleans in uart_param[]
  ns16550: add support for WCH CH382 serial adapters
  ns16550: add support for ASIX AX99100 PCIe Multi-I/O controller

 xen/drivers/char/ns16550.c | 68 +++++++++++++++++++++++++++++---------
 xen/include/xen/pci_ids.h  |  4 +++
 2 files changed, 57 insertions(+), 15 deletions(-)

-- 
2.53.0


