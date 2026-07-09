Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id I/HTEkFtT2ooggIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:43:29 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A489F72F12F
	for <lists+xen-devel@lfdr.de>; Thu, 09 Jul 2026 11:43:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=amd.com header.s=selector1 header.b=nnzdRyHh;
	dmarc=pass (policy=quarantine) header.from=amd.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org;
	arc=pass ("microsoft.com:s=arcselector10001:i=1")
Received: from list by lists.xenproject.org with outflank-mailman.1357757.1612096 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlHn-0004Iv-Mn; Thu, 09 Jul 2026 09:43:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357757.1612096; Thu, 09 Jul 2026 09:43:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whlHn-0004GV-KE; Thu, 09 Jul 2026 09:43:15 +0000
Received: by outflank-mailman (input) for mailman id 1357757;
 Thu, 09 Jul 2026 09:43:14 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <Michal.Orzel@amd.com>) id 1whlHm-0004GP-2o
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 09:43:14 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whlHk-00EMys-87
 for xen-devel@lists.xenproject.org; Thu, 09 Jul 2026 11:43:12 +0200
Received: from [10.42.69.10] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f6d2e-e002-0a2a0a5209dd-0a2a450aa90a-8
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:43:11 +0200
Received: from [52.101.43.36]
 (helo=SJ2PR03CU001.outbound.protection.outlook.com)
 by tlsNG-4011c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <Michal.Orzel@amd.com>)
 id 6a4f6d2e-e40e-0a2a450a0019-34652b24282c-3
 for <xen-devel@lists.xenproject.org>; Thu, 09 Jul 2026 11:43:11 +0200
Received: from BN9PR03CA0774.namprd03.prod.outlook.com (2603:10b6:408:13a::29)
 by DM6PR12MB4092.namprd12.prod.outlook.com (2603:10b6:5:214::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 09:43:05 +0000
Received: from BN3PEPF0000B071.namprd04.prod.outlook.com
 (2603:10b6:408:13a:cafe::58) by BN9PR03CA0774.outlook.office365.com
 (2603:10b6:408:13a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 09:43:05 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN3PEPF0000B071.mail.protection.outlook.com (10.167.243.116) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 09:43:04 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Thu, 9 Jul
 2026 04:43:04 -0500
Received: from [10.252.145.116] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.41 via Frontend
 Transport; Thu, 9 Jul 2026 04:43:03 -0500
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
 b=DASt9umPyCR+ZIyDu5VkzuUhB06mqfSwbOE0XqlbTtYWSLm2N8n1vXxhZWQM9apa6MUSByJixfhYCzlLyAeP0Fddhb279uaLPbvlrzZoh3Y1vBebvnxvC0YEuR7YdNEPhvN+kZssfw4CVy36ZdTR9HfOS1LhHOGIqv7lkB8/B+noBgi3pLeuYnjaSDJf5kb3cWrRmTBYe57w+/A+n3FEpkCNbGVWfOcNl3JnzCdSErM1HydIVSEh6e2g/iOYXZcDfqRYGZ3qPA/T213RMX4p2MlLS2bdk3b/Bk4db5ftCuxF3HXGxPYs5WkaFjFnZJ9FNsWV2QAY7C7srBOHL4Hzgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faKzvThL6z6bi0qFeVSyIZcETPcOOHYiXWhXty9vtzQ=;
 b=KOylzzK07y8dGCd5aYD9RzghfN7PKYWaNS14FBwbv8ov/Wq5JkEVhRdFC9Ktw9ZE5sEVWP7WgJGhhMYMPCq2+unYiDlcKy56uxLnRUwIwrmz7GXGQLMKbsrpiR4P55vNBWC6MMBSsnU5ASRzOy/qMyp6d6WeVCvg2k6thHj0gp50ztcj6jW2xBoMMe594x+XFah3ZoA+GxeM7WLHp9oyO9lgg4+jvaVc7ru7bsY+xXOdLTHwmrx8xJ88Wsp+OjOzbUPjmkFLTYzrRwaJj4NEfI2pHBOOVa+IYv6YMhCHB12r8Zv5ZLUpD8/cCwOP605XVlNF6/H0/kJfugObeX5NgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faKzvThL6z6bi0qFeVSyIZcETPcOOHYiXWhXty9vtzQ=;
 b=nnzdRyHhPHLoeDv+L6wrQkLt8KsHcZd/GikyfKAPuf0i2FTvY7A4jI/zV9JjxhMTFYbxQu1dreEuAMW+zqDU81dsjC4lMnA/R94EKUzNVNBXBial5D29SpOvqLRHI4bvuFfLFKr/jvdtTYraFIWUYlxHt6I8Sh67PDg9oH7R3Ac=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <47957c72-31e0-4401-a9ee-e3679db54011@amd.com>
Date: Thu, 9 Jul 2026 11:43:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.22][PATCH v2] xen/arm: Fail domain construction if a
 secondary vCPU cannot be created
To: "Halder, Ayan Kumar" <ayankuma@amd.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, <ayan.kumar.halder@amd.com>, "Oleksii
 Kurochko" <oleksii.kurochko@gmail.com>
References: <20260709063643.11800-1-michal.orzel@amd.com>
 <aab9fd35-6230-474c-8848-480c8cccc43c@amd.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <aab9fd35-6230-474c-8848-480c8cccc43c@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B071:EE_|DM6PR12MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: e0e07017-5208-4df9-5efb-08dedd9e79b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|376014|23010399003|4143699003|6133799003|22082099003|18002099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	/E+5g63Sr6dgbtndun/UlYa1Fy9V8JoAceWRGfOPXi0HDm1uWs+bJJ2yZrWHZdAUDcLMUsu4w6BBE2BbwzxRFCH4y0zSkDvblevvUOOnulNZM+zTuvofTX8Wh1hTcW+3COpb6qBTJmv1Vu3lIiP1RpO5myvzdC1RkbyVVwiRxQmIFliHp96UZZO5ZNseFbrCOQFBof3n/WSModEFq4EjxHbNlWngm5Gg7h0h+Fa5FlVQcuz8IGrCimgPswJVqd8sfRQ9GfVLQJX1lH9xXS/gpqn4iMK5w8sBhcQduZOhONngDSVGTTib6WR6ugK7kVdPsXjrEPLmFMKdZelmjsgq07HFbBvM+RRp+psWM0136FVO4GK9LWeTHf9/LyTfJCUgcQGnRAOFDy8PkT60aedI8SYullXKwGnCYY2+JXB9z8/wmuKrWE2H2j2p/9ZdTUmx0K1YD3o41vuNtA49L6OM0CnMpNbwJGwBcNgGHfqbgIcg4R8G7l8RYtcFojJQPsWItCIw0ZWuddCXNOSRAFDZtzfdxGwbhGmR4qXMZo0nCny+HmDCKMt5h5aa8boPfb5FDbrrk0FJB8iM22VacDt5xr9pImY0ntsf4vLIXkM68gojTxRb4PG2sVZ30xccQr03yauR8qwE0uCd3cuCp5GRi/4TLBHukjhMl3l5Zt3liZg+yJc3NWa2lZkNDPpH1hugCB3ufWbQEQcnSLJYpt5bGA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(376014)(23010399003)(4143699003)(6133799003)(22082099003)(18002099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8pXemOjDXAGUTSgGpGpnjgebnw2N79Jth808h5FOIULld25SNBzfKkDpZeOUozWr1klTZK5Bt/p3soPDrYh9d91fBeaey3Bi1Mv17JOKpfkmHDxmEQM4UeHBRIihKDyyrHwuLoL96uEwG583ucLhTgcQ1fn0QoIEFfgSJhnMmmlsD94HVDxuXP5vqr9vAwmT3N8eP9zHUnIf4SEEGFXNqfKtEHgIbsAZckBvWK5nq0Dfi2fJOlctCO4RHQblwkY1y3PSPkWUbaS6tglFuzjD/8FtZUL43R88nvtM1LGUjd15PhZ4+DujY3aZqiDPjerdaGBp+SpQ4P2lO6Pe49MKx30eyOaqbXpjA6IAsxXalaxnSrJ9YAEC6kFdsqx1Lh5aOpGikeRrtF808FeUwTPoHYu8ErKKq+Xm6+OYSkZwPHxd0hQ/UuP7mfuD2KXgDzMf
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 09:43:04.9290
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e0e07017-5208-4df9-5efb-08dedd9e79b5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B071.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4092
X-purgate-ID: tlsNG-4011c0/1783590191-3CE77DDE-B45E977A/0/0
X-purgate-type: clean
X-purgate-size: 2110
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xen.org,arm.com,epam.com,amd.com,gmail.com];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ayankuma@amd.com,m:xen-devel@lists.xenproject.org,m:sstabellini@kernel.org,m:julien@xen.org,m:bertrand.marquis@arm.com,m:Volodymyr_Babchuk@epam.com,m:ayan.kumar.halder@amd.com,m:oleksii.kurochko@gmail.com,m:oleksiikurochko@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[13];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michal.orzel@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.xenproject.org:from_smtp,lists.xenproject.org:helo,lists.xenproject.org:rdns,amd.com:from_mime,amd.com:email,amd.com:mid,amd.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A489F72F12F



On 09-Jul-26 11:32, Halder, Ayan Kumar wrote:
> 
> On 09/07/2026 07:36, Michal Orzel wrote:
>> construct_domain() creates the secondary vCPUs in a loop, but on a
>> vcpu_create() failure it only prints a message and breaks out of the
>> loop returning success. As a result the domain can be partially
>> constructed with fewer vCPUs than d->max_vcpus. This causes two contract
>> violations:
>>   - Xen-Guest: domain's FDT is generated before vCPU creation - Xen exposes
>>     incorrect information (e.g. two vCPUs listed in a device tree while only
>>     one is actually created),
>>   - User-Xen: unlike x86, on Arm port we try to bail out as soon as
>>     possible on unsatisfied user requests (e.g. user requested two vCPUs
>>     for a domain but it was created with only one).
> 
> Unrelated, but just to add my 2 cents wearing a safety hat.
> 
> The user-xen contract comes from a system integrator. Xen should try to 
> follow the contract and if not panic or bail out.
> 
> The Xen-guest contract can be used to enforce the rule that guest should 
> read the contract before doing any safety critical task.
> 
> The most important thing is anything errors that are internal to Xen, 
> should be propagated to the external world (either as panic or return an 
> error to the guest or abort the guest). If there is a degradation is 
> functionality (eg Xen creating a guest with lesser number of vCPUS that 
> what the system integrator provided), then this is safety issue unless 
> we put an assumption on guest to read its device tree and know the final 
> configuration (which may not be always ok).
I agree and this is the reason behind this patch.
> 
>>
>> Return an error instead of breaking out of the loop. Both callers
>> (construct_domU() and construct_hwdom()) already propagate a negative
>> return value and fail domain construction.
>>
>> Fixes: 6b0e8e43348a ("xen/arm: allocate secondaries dom0 vcpus")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> Reviewed-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Thanks.

~Michal


