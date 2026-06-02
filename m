Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GBBgJ+1rHmq3jAkAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:36:45 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4056289AD
	for <lists+xen-devel@lfdr.de>; Tue, 02 Jun 2026 07:36:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1324455.1590003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHno-0006vO-69; Tue, 02 Jun 2026 05:36:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1324455.1590003; Tue, 02 Jun 2026 05:36:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wUHno-0006sr-36; Tue, 02 Jun 2026 05:36:36 +0000
Received: by outflank-mailman (input) for mailman id 1324455;
 Tue, 02 Jun 2026 05:36:34 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Zhao.Jiaqing@amd.com>) id 1wUHnm-0006sh-8N
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 05:36:34 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wUHnl-00AaGz-LL
 for xen-devel@lists.xenproject.org; Tue, 02 Jun 2026 07:36:33 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e6bd4-2eae-0a2a0a5409dd-0a2a4503a1de-26
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:36:33 +0200
Received: from [52.101.43.64]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Zhao.Jiaqing@amd.com>)
 id 6a1e6bdf-672d-0a2a45030019-34652b408242-4
 for <xen-devel@lists.xenproject.org>; Tue, 02 Jun 2026 07:36:33 +0200
Received: from BN9P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::34)
 by CH1PR12MB9672.namprd12.prod.outlook.com (2603:10b6:610:2b0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Tue, 2 Jun 2026
 05:35:00 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:13e:cafe::8d) by BN9P220CA0029.outlook.office365.com
 (2603:10b6:408:13e::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.71.16 via Frontend Transport; Tue, 2
 Jun 2026 05:34:59 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.92.5 via Frontend Transport; Tue, 2 Jun 2026 05:34:59 +0000
Received: from zjiaqing-dev.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 2 Jun
 2026 00:34:57 -0500
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
 b=OWsIsoTgFylrFNJ0YdJX/Y4KHiJpEqEfqYBzrps/mKS66zJ1eHjqRwqSGDa+p//iNOfmfkJgWz712IKzKHCMKZNblD7b7y7sEWT48uiMz214f++0oKzeGj8AFKYLRNQdNuVmqrHwA/B1hjvgg4JyoSJkCE/aJ4kgAE7hnb+ioNZUEdE0ooV+jYSmZ9S3/unSpwzB91AhcNMJdGbEr+T8P57TNTD2IYGp5G1abwl9l7yQTG58wqBFY2qna3yrw3m7MmFhpCGzfxR4OmlpuzKyBtadDEmcazJOu868mEY5m9E755zgwujqfCMV96XQ+fTU9l/kZ2VjdAQXDJMcN26u/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zD/+VQ4eZwHpEwOxxRCgnNIQaBA77in0OUYsN1Dq/RY=;
 b=Lxx0cYwdwOYPg/wkYymvTaxNNQneX/9pHmKb8fpX31VVQ4pSU5Y2B4zRT4C+AqFGsH4YbMVchYpJEyn7fK+k9khEH9vOJNcRGHJQJ+IfI+WO4xIJIfP4Qc3Wo1hf/rqH38oCqclobZEiCxpUesv5g7K11SS3mzswJBbcar+UdAXkyaZSlrGs5ZZ7pYFiqGaWbDSzGqln6bCOKxH0TiY4qsaWBqojmx0l0WYRWs5A0hRlkiY6r2WDm6EZsxksfkMCmXGP6k07BRZ76m8s9ynOEO0TlNTA1si26RkpPhM9RURmPKO+G0jASmC42YD6ILYEnLUAugojt54s1UCY6UouaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zD/+VQ4eZwHpEwOxxRCgnNIQaBA77in0OUYsN1Dq/RY=;
 b=Z2teSaAwQUHLZdpSVHFmx8DdalINby78/CfwB0XEoRYvQznclDfuZKLpZPAi/M+GLfWOu8cSFK9OkySgiSUBg7JS3322N0Kc1s+MYbFjmeRibQ5qwiKU5uFqeMYbZ1rd1GD2YSpYOlDD7E87ScqCWijX8WPdPvqmJtgroopXIUA=
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
Subject: [PATCH v4 0/2] ns16550: add support for WCH CH382 and ASIX AX99100
Date: Tue, 2 Jun 2026 13:34:19 +0800
Message-ID: <20260602053421.773149-1-Zhao.Jiaqing@amd.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|CH1PR12MB9672:EE_
X-MS-Office365-Filtering-Correlation-Id: 40c76064-70bd-4ee1-5104-08dec068b00b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|56012099006|18002099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info:
	zeArzs1NqtxZ2n9gz60DOlP6RGArDkqAsOlVM5nMwp5ODe4bdNsVf+c947jZghDwZRvGTxWgYmRv6MVbPvNaZWNFb8kGuDDH1LKt4n4fRU+zepvGr+ExcqSInqkFM6yRBQuNKx1c7rACQ0EtvMStUz6CYa68nnl80hnNRO+OJS6anH1h+NQu0q2jprMV05oGcFtcWoHTPHJWOT9St1iSL2+q4075Pzn3+ltb4hEkEf4F7eqKWRh0asPBpl1GbQe0wg2kTPxVWNiZkBL+gV3XSq6hAhjWkAOtZ51/iG4C/fqgm/jP6vbq/Q+9vyh35XWocMRE5Ms887fcm+ySB+nr1tc2YPDu6rBbAY6k3HlkEwrKF5kHKbzHFdRr1byJkGxVRCaw8qEMfCILDAlNYv73PKqEIIcUnkQcSKgkgJj4GVfZPfpb7bR2mJnJlSmpDeHn9nT1sqRGV5VbEpTLiYVo3zz/n03Hf707L/4UGKtJA1c4GqKV6jGiRCYNk8i7BKJjdH7sjkIvOqD+yblQFZWTUn6r9Fgc4gtbqz9SHuaFSwyBayq6h9d99F94PI1r5TxPVSTZBlhmiUIzgxaCgUg6q2JtM2pCWEtQYqYSVMMHMqcNdP1aL5c+pgf9i5wmRj/hwy3/4cIKYu6fKvMSZoDd28EvGyUNqx9P0v5TCzamCX8KE7Xdf6A0k0eKsYom3cVQK7kHsEx8ucLsyAodwYoioKBH+acoDWKVYx+d0mKAWQI=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(56012099006)(18002099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	eGRv+64Bvr0ejtCkHw/AvtDsOlqRjYyZTMQ66aMzM6SvGoo06z9AA2rcm7ppCn+Oz9tIJTU4aNQttCCmnQFQ9NYRbxx33ekbt63FxrxIiIaAHz1tDe4QiCMxAK3nC4Up4btlXMm9ejtQyfF72caMwVl+V68+4JxX9gL28sYL8JhqH7dIRMpdC6cR15M/lHk768zddrW2kXStdk4F8eVGkNSur6VltJVAlQh+gR4sGzpXSifI5jHznUKprOWe5XLweAwfO75suHnmCUcSo6ILY9ew8YFxJxYXrCScuXbZAi7RJV13e9AiT2+kjcQ7GIjPIl8EE6ZIIYjdnEtRcn9wXUANLHfMDdFmXzwCNGaJClWXYpd4+DCrB9jJVc8vdm/ofOPL8gtjk+xzc2fPvvEes5aq21Ihu9hVll0TPTchVI6ZL+q1/6UoSZ1tRnapkn17
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 05:34:59.5449
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40c76064-70bd-4ee1-5104-08dec068b00b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9672
X-purgate-ID: tlsNG-33051d/1780378593-3AB64938-6F370911/0/0
X-purgate-type: clean
X-purgate-size: 1071
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
	NEURAL_HAM(-0.00)[-0.999];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:rdns,lists.xenproject.org:helo,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 0A4056289AD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This series adds ns16550 support for two PCIe serial adapters found on
market:

 - WCH (Nanjing Qinheng Microelectronics) CH382, available as
   CH382 2S [1c00:3253] and CH382 2S1P [1c00:3250].
 - ASIX AX99100 PCIe to Multi-I/O Controller [125b:9910].

Both chips expose 16550-compatible UARTs through PCI I/O BAR0 and
work with the existing ns16550 driver once a matching device table
entry and parameter set are added.

v4:
 - Add Reviewed-by from Stefano.

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


