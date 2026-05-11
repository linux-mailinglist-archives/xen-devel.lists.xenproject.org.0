Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yPxhBo2LAWp4dQEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 09:55:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77657509A75
	for <lists+xen-devel@lfdr.de>; Mon, 11 May 2026 09:55:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1305817.1577959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMLTv-0006VL-N2; Mon, 11 May 2026 07:55:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1305817.1577959; Mon, 11 May 2026 07:55:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wMLTv-0006Tu-Je; Mon, 11 May 2026 07:55:15 +0000
Received: by outflank-mailman (input) for mailman id 1305817;
 Mon, 11 May 2026 07:55:14 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wMLTt-0006Tm-Tn
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 07:55:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wMLTt-0028mT-AR
 for xen-devel@lists.xenproject.org; Mon, 11 May 2026 09:55:13 +0200
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a018b58-bab6-0a2a0a5309dd-0a2a450c9a7e-46
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 09:55:12 +0200
Received: from [52.101.56.43]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a018b5f-62f1-0a2a450c0019-3465382b35e2-3
 for <xen-devel@lists.xenproject.org>; Mon, 11 May 2026 09:55:12 +0200
Received: from BL0PR1501CA0022.namprd15.prod.outlook.com
 (2603:10b6:207:17::35) by SJ2PR12MB9237.namprd12.prod.outlook.com
 (2603:10b6:a03:554::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 07:55:08 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::b6) by BL0PR1501CA0022.outlook.office365.com
 (2603:10b6:207:17::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Mon,
 11 May 2026 07:55:07 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Mon, 11 May 2026 07:55:07 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 02:55:04 -0500
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=amd.com header.i="@amd.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Hk6MqGg0nRhjpF4ytuMkNKxdinBFkY5F702dOwTEANVQSSk03dJ3EIH0HkqgPwAbIxSQYFeStmlOoM/E0kPFhnEV1emz243qEB19rtEl5Xlw3J0GR/tPhhEYM2kya+ibtKTJANznd6yK3WZPH/aNl4awc9Ja0oDFgHbIAXqNAlIhlLucIkiqLzh9tI4UvXxHoJkdeXqSNP1ySsJ8Aiz1wjhZ60gDy3AemwizNeqa0NneP/nMD2pgL0kWggzAJl7d9dSPeRURbF8ZRP98qWy2rH0Km8eJv3f1nGtrzfLxF0LA+CRy7wk8NwWmG7LS88oEAUhFF63LhA9DmnhDsRW4pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p8eFitT7eqPkRdE+pmjgDzqR+P32FmKPrzk5O9kcink=;
 b=ED2fbzPnZ5lPN5GjnsTCDc02eUu9U1662NXqYUSfkzFdHa/UQezuLJIFiULAylgyIs5IOlJ+6a26SE/4Z/sskf2WuXgDuuvPEh36ngJtOGr5Gxp0xIbMHNcK/3+MqXjJRZ/R3CLJe2AipDOo+csRnVksJ3t8sbAy+hirrxg3mbiRslWogmu3W+H45jdpL7fbHcmKXvN69hWKUC8FpSEDvk3F56xm7KVvBa7vQ82oIGr+agTNheMFK5okWVLIitQJ0xcbB9koNtbiDu44vQThGJrspbszG80Nkn75DZrfiJAaO68P87lDctm/ZE0ybq/GP+oJDoysqSUCb23umLGMpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p8eFitT7eqPkRdE+pmjgDzqR+P32FmKPrzk5O9kcink=;
 b=MF0Sr7eeQ5gPdVmZ17eB5kK6X3F1xjL1H48F8w/Qc9fTROKfAAp/mp+E4BM0W7TqKg0oKrhoCcEoJSrJtE17blfNCKhD9SI4Tm9J1v+DmFRHjvW2WDlDamdyEV88J2AxoKxFOY9jFeooTw8a7wNG5hNpj25zswVoofGSggMSIHI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Jiaqing Zhao <Zhao.Jiaqing@amd.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
CC: <xen-devel@lists.xenproject.org>, Jiaqing Zhao <Zhao.Jiaqing@amd.com>
Subject: [PATCH v3 0/2] ns16550: add support for WCH CH382 and ASIX AX99100
Date: Mon, 11 May 2026 15:54:13 +0800
Message-ID: <20260511075415.36538-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|SJ2PR12MB9237:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a2f3a31-fff7-4330-06cf-08deaf329e7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700016|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	aB/BRV0jDxNUxoocxZcZTmE7OaUb7orQfqmD8eQ/LzDAezIgu4VXtlyLFraKWgz9o06rZ26i9xiWSF1W50D0DB1d8+oDIv9O+p14GpnORrvf1Ge4dCkZAnHN28VEVc5vYgdie6jpQg5KyeBhVVO61qQrsyCT/l3IhhQFQOxAqGknUyR1lfX6NjrMyQMKWBocfNrUVfc2guCX3P9CjkqVpLM14crSCcCqekkmO8+cY2tzPT1qkzqhk9q+8l8bqYokIg+tro0n9Ll3vrxXjjTtNy90DEMKb1LKTslHjw/HWXQ1bN+LAacdpXhtQWsh2ZbSGjnb9QIvYojDav38zuFYEpjNQxhN9pPP47R9XfVMxRduNQMHpSj1Lw4KPHJ614YCe1EADcRKdtnCmW+p0kD/51XAYdpOk/vKD0FyvtYNimPhMvMjitFNOfp4oWqZUeF9byAqvenoE6g5sPfxvMSDbr992ATgL/cVeTq8dO3UlxZW5bpN0GVDyliq/xnxRgepuEzbpMW7lbWL68qJ67w+4jinC0FLfdWrTJtcngzDw6gSvFO1dThlsJB9Bq8BKe5xrJILP2dDSLpi2Mv7LBuMM4LOtFQwK5YPJHOPwQekslS1nLRQwikTlOILTSJqZFl0yASqU9GNulBSlOyb/LMhHg4c4UcZiRjULzZLCYZglnulFKAsQ5ZQnHGqQYn0xmzwM3cMvPyqoirSRDnsp7bvtorI6I5e+c0qml6/Nfx3LcI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700016)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rEYpvNLgb0wGwbZg7RSpHcff4xXsQktOx79Z7t0VDujl73guCfFEQfN1NRD28KbNowKrzs5OyjCQPbqmDacsCUNuN3dCjTvmYDBH65z7ef9eHHKw3MGvmP0H0FY0xJhTyF3FpBxXa9QYW1QmzcKNKEEi79Woah3MCIakl5fc623s/2ogPtFrmhFwWGNb/5c79hchpPrXeyiH6Pci+ZtSjGcQnL9neY0lrMJ1ql8pqTAt2dVKIpLVAxgw9fwqewUZH/LBY5CrZ++wgYJ55FJqn7qQIAtMLdcZgE6G5Iu+CdtxZHLAZ4YrRiwBGI1DZw7VhAZafOdS+7AFEtKYJsICcHpwkpJlY8fW0t6p+GzjUrb4rK79SvSga6zBvkUvfoCyGo/HeNqMBKbm+H9YS+QFJzr6ij2NTxfarhEMA2S5vvGG035dj/wHfyVSe7qbooux
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 07:55:07.4956
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a2f3a31-fff7-4330-06cf-08deaf329e7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9237
X-purgate-ID: tlsNG-d25034/1778486112-E2169CF5-50E1A60C/0/0
X-purgate-type: clean
X-purgate-size: 1030
X-Rspamd-Queue-Id: 77657509A75
X-Rspamd-Server: lfdr
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
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:xen-devel@lists.xenproject.org,m:Zhao.Jiaqing@amd.com,s:lists@lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim]
X-Rspamd-Action: no action

This series adds ns16550 support for two PCIe serial adapters found on
market:

 - WCH (Nanjing Qinheng Microelectronics) CH382, available as
   CH382 2S [1c00:3253] and CH382 2S1P [1c00:3250].
 - ASIX AX99100 PCIe to Multi-I/O Controller [125b:9910].

Both chips expose 16550-compatible UARTs through PCI I/O BAR0 and
work with the existing ns16550 driver once a matching device table
entry and parameter set are added.

v3:
 - New patch 2/2: add support for ASIX AX99100.
 - Add forgotten Reviewed-by from Denis in patch 1/2 (WCH CH382).

v2:
 - Reorder entries in ns16550_config to keep them sorted by device ID.
 - Rename PCI_VENDOR_ID_WCH to PCI_VENDOR_ID_WCHIC as WCH has multiple
   vendor IDs.

Jiaqing Zhao (2):
  ns16550: add support for WCH CH382 serial adapters
  ns16550: add support for ASIX AX99100 PCIe Multi-I/O controller

 xen/drivers/char/ns16550.c | 38 ++++++++++++++++++++++++++++++++++++++
 xen/include/xen/pci_ids.h  |  4 ++++
 2 files changed, 42 insertions(+)

-- 
2.53.0


