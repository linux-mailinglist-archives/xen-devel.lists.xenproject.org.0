Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Q4MMLJYPRmqVIgsAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 09:13:26 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 183646F40E0
	for <lists+xen-devel@lfdr.de>; Thu, 02 Jul 2026 09:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b="pG59x/5W";
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1351288.1608505 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfBbl-0001Rj-Fq; Thu, 02 Jul 2026 07:13:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1351288.1608505; Thu, 02 Jul 2026 07:13:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wfBbl-0001PN-DG; Thu, 02 Jul 2026 07:13:13 +0000
Received: by outflank-mailman (input) for mailman id 1351288;
 Thu, 02 Jul 2026 07:13:12 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1wfBbj-0001OC-Of
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 07:13:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wfBbj-006neM-5H
 for xen-devel@lists.xenproject.org; Thu, 02 Jul 2026 09:13:11 +0200
Received: from [10.42.69.4] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a460f67-bab6-0a2a0a5309dd-0a2a4504924e-42
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:13:10 +0200
Received: from [40.93.194.25]
 (helo=SN4PR0501CU005.outbound.protection.outlook.com)
 by tlsNG-ebf023.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a460f85-a01d-0a2a45040019-285dc2192b28-3
 for <xen-devel@lists.xenproject.org>; Thu, 02 Jul 2026 09:13:10 +0200
Received: from SJ0PR05CA0114.namprd05.prod.outlook.com (2603:10b6:a03:334::29)
 by SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 07:13:06 +0000
Received: from CO1PEPF00012E81.namprd03.prod.outlook.com
 (2603:10b6:a03:334:cafe::3b) by SJ0PR05CA0114.outlook.office365.com
 (2603:10b6:a03:334::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 07:13:05 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF00012E81.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 07:13:05 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 2 Jul
 2026 02:13:04 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 2 Jul 2026 02:13:04 -0500
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
 b=hMoAy8u7BjAKeSDM3ibSBizL1Bb7b2FjZR6fh/YnBM9R+t4d9fQM4/0jSxbpaHnaf5gZBfR9knA2sapJUCQweowgCzP0Wc5IcSEwEby+7KTO0ybhcgbsh3S+aVYnzqdFVeiNy6s+5qIbVPMMAbofQBImCxFZqHk4Rs2uTWHDsEd8CyB992BhwJ41OEuZFVWn6XpC75EmvLjaLSiJdnUl5LiCeHJZobhmYyrdgnvHC5dJ0Bi55EzO/Gv77qTzWoU4PU/CSOFQd7Ls4eC23lE8GOOz4JpDOetrgqQ+XG82QNulNLCBSJm36cLkuGum2Ta0NIfUyHMUNpa29sd/EraHMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yj42o5dQa5WI3bb6qW20n8gTFcCUFB1Aw2r8frAqhX8=;
 b=rprn7nqeCfTgl/hqJ2Ukj+3lpEFbTQwyCAPjGcbZn6lzszcVMLIOWyb8vrWt+4EaA2V2i8Kyamt2gcTCbY90zU7uEZ+elPseUXCY31eDrbamsCpF7SCD34TmAMA4qJHAUk8tSJUAYI2m1yRt2CdpwPi0iQQZSc5HVBwVPyNtAYdjqoxxEEdO53UmtdVrG9S0OzaZkAIU+IkUNudHAcuyAz/x9D5uQK58eH81Leiwg8J3dyfE8Wma7GyUmnKZ4ILiTbIhQSjKHMIzvyJ+/sxNaVp0nJ/kBX4qGScxpF7P+3OcJebXzkKQNFToTwngtbLqgB65Pq+6rzcBNUw1rIgM+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=valinux.co.jp smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yj42o5dQa5WI3bb6qW20n8gTFcCUFB1Aw2r8frAqhX8=;
 b=pG59x/5WD4xpb6iaeN2foDt9SlSeCuc4nwJnPGye17BJ8M20QeL+8fCPw8Lo604dFiEfK8GCiAxhnlYRpd98tpHgXwkY8tYaijKQy8Ty8dHjQCT0OvYSOKtfY02i5AwzMQCUqwwZaM49Gj41vhLW7VfqYMnlwL35ICHcIEYo6Cs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <57a8d88e-c5ee-44cc-9832-c1e766fecaa7@amd.com>
Date: Thu, 2 Jul 2026 09:13:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] xen/arm: fix sparse cpu_possible_map calculation
 on SMP boot
To: Hirokazu Takahashi <taka@valinux.co.jp>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>
References: <20260701224057.46592-1-taka@valinux.co.jp>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <20260701224057.46592-1-taka@valinux.co.jp>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E81:EE_|SA3PR12MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 87f84350-f12b-4838-ae60-08ded8095ce2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|376014|1800799024|36860700016|18002099003|22082099003|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	J/tc7cryDSu0SensP+cmf7Dvv1H6y46AyRxnu9nnK4HXVS3p9bWvltm1iGfjg/Sc3TQsAxruZv7trfeUMxFEsv0xyVLGIAGEcc296zEVlWgyA4ErDik+43aApruCNVEjTQyo80woG5Kl2pYQ69INq/3ypJkbh44TPpXw7eVIaQPb77k1d8MAskvFUwoOMlN13NkpgS08tXucOiRyNwPFemzX2zBw/q7ftA8cMwYQOQclgsAUHezrsoO7SEmZGWFLbiwe2KhFqZt3QqGWaRsWO06gPRUyHAUaauHIreZEc8p5yEz3pCs2yh5Cc8WW28mob4l8zUk7DldNAmSMtRJMvHj+L/i5DAnHvOn2riu7u33nsKm8/pPsp/IJLeqhj59nJeZG4eNsNajF/2he7u23P2jZsLaoD2hrrMGfy3jwrvBRPhR/JUmq40JKb/4s1H641Hs+QXnI51S9AMeXqMmTHPpIDU4BlJniSJ8APu3qGHBq3nDHOMF4ng22Vh77BJRXs9W8a7OdXguNwQVZe02T+a9M7BArW9MaM+eokHR8WxZKuLbud8SYN/XJwfrTTivP1ydl6gDJLuiZ4JtOLb+hrSnWkPZHQbPkxb+C4j8x8rhFcFRbrPIJPciH0SfI7x34xTTffJM9L0ssr+KlTaEIvM4k8BCvs/PzQsI4J0C48d9oMUHfLNuM333h84TTfc1Nst2WVaAwLHmJhzZDhwckHQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	R5IgeScsl9Q+STCKzwgovCPLU6OmxqaVg1fwT/VhwSWvBZbMIUfcHJuVdjNf7lPWm/VnkAlcdtSbJ6kTwzsMs1qqzvhUhTaXC5aRqftYV+hdqn8rKhIeZGbwH0Vr2EvsKLlw/VDuEAM1aEOPkHrILPIROnu7oE56DkBIksC7p72aSmGkvbbDYIxXZPU/YDRrSsILqqtccDOh9tQbw9yGzbq+80OnFDGLJXu95Ihp9Ltl9smMLnAL9wEdtKDXyNT5/siOkene3dqZ/IoKj5ltJQcO9OOVaX+fRcIzgE8a1B4y0t7hPqbUJjG4RFk1veetDGjIzvq/vvKAHJJjA4SUgjI8+Dbkg6hQfaNK2M2oug9ku8PgDVvquQOiCvXmWVfdBk1kd1mj0f1wmpyHUzkvnoGY3EXm0NHaCRUC4pM7R7QLxXdoKfRwAkr+mf5aN6sx
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 07:13:05.6523
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f84350-f12b-4838-ae60-08ded8095ce2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E81.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091
X-purgate-ID: tlsNG-ebf023/1782976390-AC93A1CC-A099F199/0/0
X-purgate-type: clean
X-purgate-size: 945
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:taka@valinux.co.jp,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DKIM_TRACE(0.00)[amd.com:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:helo,lists.xenproject.org:rdns,lists.xenproject.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 183646F40E0



On 02-Jul-26 00:40, Hirokazu Takahashi wrote:
> Currently, during ARM Xen's SMP initialization, if there is
> a Device Tree error (such as an invalid 'enable-method'),
> cpu_possible_map can end up being sparse.
> 
> The issue here is that nr_cpu_ids is calculated in a way that
> doesn't properly account for the maximum CPU ID when the map is
> sparse, causing a mismatch. For example, if cpu_possible_map is
> 0xff0f, nr_cpu_ids becomes 12, but the actual maximum CPU ID
> is 15. Xen's common code is built on the assumption that
> 'CPU ID < nr_cpu_ids', so this mismatch can break things.
> 
> To fix this, modify dt_smp_init_cpus() so that if the
> arch_cpu_init() call fails, we don't consume the CPU ID slot.
> 
> Fixes: 4557c2292854 ("xen: arm: rewrite start of day page table and cpu bring up")
> Signed-off-by: Hirokazu Takahashi <taka@valinux.co.jp>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>

~Michal


