Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YKblNvoODGoZVQUAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:19:22 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B837578E1A
	for <lists+xen-devel@lfdr.de>; Tue, 19 May 2026 09:19:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1312444.1582528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPEiW-0000ME-SR; Tue, 19 May 2026 07:18:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1312444.1582528; Tue, 19 May 2026 07:18:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wPEiW-0000JL-Pj; Tue, 19 May 2026 07:18:16 +0000
Received: by outflank-mailman (input) for mailman id 1312444;
 Tue, 19 May 2026 07:18:15 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wPEiU-0000JF-Jb
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 07:18:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wPEiT-00B4DR-OI
 for xen-devel@lists.xenproject.org; Tue, 19 May 2026 09:18:13 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0c0eb1-5cb7-0a2a0a5109dd-0a2a45028608-20
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:18:13 +0200
Received: from [40.93.196.40]
 (helo=SA9PR02CU001.outbound.protection.outlook.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.56.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a0c0eb3-af86-0a2a45020019-285dc428f5f3-3
 for <xen-devel@lists.xenproject.org>; Tue, 19 May 2026 09:18:12 +0200
Received: from MW4PR04CA0103.namprd04.prod.outlook.com (2603:10b6:303:83::18)
 by CH1PR12MB9720.namprd12.prod.outlook.com (2603:10b6:610:2b2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.14; Tue, 19 May
 2026 07:18:06 +0000
Received: from MWH0EPF000C6185.namprd02.prod.outlook.com
 (2603:10b6:303:83:cafe::b9) by MW4PR04CA0103.outlook.office365.com
 (2603:10b6:303:83::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.24 via Frontend Transport; Tue, 19
 May 2026 07:18:06 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 MWH0EPF000C6185.mail.protection.outlook.com (10.167.249.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.11 via Frontend Transport; Tue, 19 May 2026 07:18:06 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 02:18:05 -0500
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Tue, 19 May
 2026 02:18:05 -0500
Received: from [10.71.196.80] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Tue, 19 May 2026 02:18:04 -0500
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
 b=f3e/2eRUQ0Badfmgjw/KIOaxzDP0aGy8KzNZVTWEVcRA9WZL5Xigi68Aa83bcsv6q/iwOJe1aJ61IoPFhP7ShUj7D6DszHcStfCMkB0oAevIVjGxp+qTbyFQ3a2dNFZqQVFvvaXyE4oVw5g0nDxp7rnkJDScGlOrTBnhqOJZLM7noTgsQM2NMxHMfjb8/pznelKf/W7UcdPXpCq/FyoJXLtTD+fnvf6ikE/aKD2WgoMr8GzwbhYMGQmOjwHUIl9t0AzQiqlOr3h3+Ac/bxe7i0i47T78x5qVHCDWgjChJrYP1WWKUXnZIT3TZAUhrLZ9/31ERm15Wsvj05UgnRyagQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z6DXF+5SNF5nG/qNAlhWLWLmob/3IjBO1EuTs+J8XOU=;
 b=cHji3KUhzOdBcTq1BJQet3Ry5c+zISuWcOH4cjg82DAn2pLxzCki5QyTORlYPooj2LYR43/WHL0S/7E6Q4HVQrFcARrPUdKcKbuuQuCyFpWjwE+BcODnlNyuFBTlYiZMmfjnDNVr7Gp5WbXRDiclhGm5Z9E3tlc+FN6qJWC5UiRbbGa0vTz2pNjTb8LbsxXSR4EH8dakhcMfQA30XvLY11FCnaZFgRVRxLuas4g1ng+54r+n1wBbIbEGR/22FYhf7hB8aHLVblfen0P4O4IU4Fwi/84LYVr6o7evHleERW/PwjxqSFbrQn0h1QIpy7k2Vid+BdojWAbdEtG+otLnHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z6DXF+5SNF5nG/qNAlhWLWLmob/3IjBO1EuTs+J8XOU=;
 b=eJnohMO4+BxQwYQppazJDCh7UCKc72fJURs+CDS35KaEBJVOO7oasrDUdGfxBG8YLpTxawSr66JPWApZqbH3+ToIcx8Ja7ZSG93nPKDWTArMJXH7W3H1iHlKF9+wgaDOwtp6MsjM2xxFa5ZsHMKdJAcUVB8T7KeTURpL7J5NINY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <b2a81cec-7e93-4441-832f-ee9cf06d168c@amd.com>
Date: Tue, 19 May 2026 09:18:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: Fix PT_PT table descriptor value and comment
To: =?UTF-8?Q?Gabriel_Quint=C3=A1ns_Souto?= <gabi.qs.mail@gmail.com>,
	<xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <julien@xen.org>, <bertrand.marquis@arm.com>
References: <b0a7dbdf-775a-45e2-bee4-d234ca21c002@amd.com>
 <20260518210340.81347-1-gabi.qs.mail@gmail.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260518210340.81347-1-gabi.qs.mail@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000C6185:EE_|CH1PR12MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 2df34451-e763-4e05-6e96-08deb576c5ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|18002099003|56012099003|22082099003|11063799003|4143699003;
X-Microsoft-Antispam-Message-Info:
	UwEq6pqGuPamofkJuQsL57uE5bEJ6WMqkkcuMW4cNnY3O13Gzwo5Q8iQOnVS+/TTgVglbJErKa2rNJHVArxMaw0HEuRHENWeDT9gzuVSQNJlXAZGWoCxj74TkF7dwzsL5rOBUw00Ba2TLWSJu/YSxZtcC04XWaiJmoDDURMUHgHGDePTTrpAjM9406cPwGyYAcT7QQAI7kugUSLLbrqhVdc3x6I3wCqjIf+fhGa26TfUq1gHQ/LFIJEBO3+096/rTDNDX2k2Mu3Lng5H/RMT/AEdTmCCOdAojOIktXNsZe05rBE2NX0GDYdYppHrBBerC7mxFxoD33qgR42KsD2e/O9ICXaRsP6XMPmlmaGSgDW8YYFPQvJobmLkPnGzT6rTcQfQXqSyVmut1Vqp9zxzs4LFRWSMvdcVPvkG3TQMEgU3nxwBeSU22wOB01h4XozUhys0x1WvCwF13JV7CQSW5YXxZefgNSqZZQ5PX5XTvebP3E0eFfV6eCBX+MxN68VVgX+jfLRrrPn3wfL14YRvIbsrf9f0d6k0029mYvKh+tncaF99ZFCMBa5Qc8rc/hOkGMHu54fsNI3rqpDkS9rgNY/uPCaabWSgHh4xBxWRTAbGGtGQUnhMJQaxC2BZpBp7t13GoyQwb0qDanvDJSDDDeZcdRUqyvJysl0WQ9rf981SOynIXcCk0TP5jRZE7GCCnQEaqYusKRLgXBTjrGL9NwZ15C5kxKPCzDE0XcjEtJQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(18002099003)(56012099003)(22082099003)(11063799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LnTbfsHVqKZDXaA0LLaFPS+YWMU4FWcWAmPGdUX38iE/grma0ODqQw4yGWC3CGDE1CjPlvnhKXvQPdBrGgIDgWh7ruxhCI0FZyingkKzU4fXTVVV1WeQJvipytea4q6Rh/tjzuK6iOVjjtO1ENUXMhbcOH9EdE+6Gqm0z2ECT8iQVQkfJG3QU9pTxwEuvt4qztVeQ+hyoU4O4tM2e+iXRiVaivsSJkSXSs2ctmCLbDGbA7LDlP9quZoiTlErhxCkA0av4Ookj9GNRWh0ntwKiH/+1FwFkqSHiZuyxiQcvWFe2evP2QC+KCkgz6sVX5cZO9f++88oJr9f1GBdSa2fzsa5Hl1kAqTHeUmrGRzGrxbJYiTxwiyoFCfOHtNzekLnbQFyT0uLOgtyzVrp5pyyKiY/MH5+uvrM84X8AHQ+aO5Tkz3rCb4JlnnwcRO8eFe/
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 07:18:06.3277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2df34451-e763-4e05-6e96-08deb576c5ed
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000C6185.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PR12MB9720
X-purgate-ID: tlsNG-720697/1779175092-A8D7F161-A19976C4/0/0
X-purgate-type: clean
X-purgate-size: 547
X-Spamd-Result: default: False [1.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:gabi.qs.mail@gmail.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:gabiqsmail@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 4B837578E1A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 18-May-26 23:00, Gabriel Quintáns Souto wrote:
> Per ARMv7-A/ARMv8-A ARM, bits [11:2] of table descriptors are
> ignored by hardware. The original comment incorrectly described
> block/page descriptor fields which are not present in table
> descriptors.
> 
> Use the minimal valid encoding for table descriptors by setting
> PT_PT to 0x3.
> 
> This updates both arm32 and arm64 for consistency.
> 
> Signed-off-by: Gabriel Quintáns Souto <gabi.qs.mail@gmail.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


