Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LHlLcdFlmmYdAIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 00:05:43 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC39E15AC7D
	for <lists+xen-devel@lfdr.de>; Thu, 19 Feb 2026 00:05:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1236020.1538823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsqb6-0003ru-JT; Wed, 18 Feb 2026 23:04:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1236020.1538823; Wed, 18 Feb 2026 23:04:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vsqb6-0003pl-Gj; Wed, 18 Feb 2026 23:04:44 +0000
Received: by outflank-mailman (input) for mailman id 1236020;
 Wed, 18 Feb 2026 23:04:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9JgR=AW=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vsqb4-0003pd-6p
 for xen-devel@lists.xenproject.org; Wed, 18 Feb 2026 23:04:42 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 335294f4-0d1e-11f1-b164-2bf370ae4941;
 Thu, 19 Feb 2026 00:04:39 +0100 (CET)
Received: from SJ0PR03CA0030.namprd03.prod.outlook.com (2603:10b6:a03:33a::35)
 by PH0PR12MB5645.namprd12.prod.outlook.com (2603:10b6:510:140::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.13; Wed, 18 Feb
 2026 23:04:32 +0000
Received: from CO1PEPF000066EA.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::67) by SJ0PR03CA0030.outlook.office365.com
 (2603:10b6:a03:33a::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.13 via Frontend Transport; Wed,
 18 Feb 2026 23:04:31 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000066EA.mail.protection.outlook.com (10.167.249.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 18 Feb 2026 23:04:31 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 18 Feb
 2026 17:04:31 -0600
Received: from [172.24.149.13] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 18 Feb 2026 17:04:29 -0600
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
X-Inumbo-ID: 335294f4-0d1e-11f1-b164-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xkI91SFLGkZWpGNogjQvFmDO+ApudPuR8SwOakhkDswre1mRCvIhNqGOCmmghgksiOMo2I0v9JnOm+dwqsuTW36hBniBJtGTCcfuWlhFgFe5dZLU+HuCRGg3K9FRVtSqVi2hcwClR4qDkZm2NO2qyYKLHy0xf7gQl08eSGepgnIgA74YJSfV1a/apenW70Gm0AM5koKjG9iyEK9TR99qVRGkBhEQg29wbPbCz105NrNiw4rE0N2BT3PBKoXp5lu0RLkCDpLJHKrnCVn0Nvi4V4Tl3NMZCO3/DXriFUUGHLV6IpYAR4DugNyos5KbxkyXnXo9Gv9DEas/4DGJ9FLCfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J8VnoYUXj7cNQO1ck5okVPjiqB4zMb7QZhLyZ5xqTms=;
 b=PvlgFMG33nNAA1nzuLov/nlEUMYIfswWTZxXF1ytyUeRBaYapuCuS/pPDZNTgP5RmUMA3w5zT8+BSCG+9KxJLBnztvs2zl/L9kGgiJaYX0x2+JBqK4nxShfcrMeFbjdULMYoRx+lzLQWhdmBOHlFQlOhe257owzciZwmxcb+oEWI56tEwGOwznduWtljV7k0HdE1qDemWATDWwtbVC5atCllJc1m3A/gyiAU+Mm7CruJ8WZk+zyIMNnsYa8gqu4XeCDJRYd9JBQoJ57xxwWDo8aOk6HKGnqxmZQJvtgWMDmIaJU6XnFc7nlmPvHOczPcUE8pavDuIIi310UHpa9wDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=apertussolutions.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J8VnoYUXj7cNQO1ck5okVPjiqB4zMb7QZhLyZ5xqTms=;
 b=ivmoFHjuySDX4HZUV+mPA3yt5Y36QuhGGnoEG2VpZsDWX+xcY+4cr4uuR+DdXx0MM3yauloF3GhYC9LHGnVrFYsTZDh5mP3/IVbBP48PRzAArP9s/f4bjqBfskag6WEVywvncdMUAWvBujUsq6YXX7/JenJRjhtIM9nNO0DaOvg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <1b0a2f66-e03d-4428-a9c0-f26f84e7f348@amd.com>
Date: Wed, 18 Feb 2026 18:04:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG v2] common/domctl: xsm update for get_domain_state access
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Chris Rogers <rogersc@ainfosec.com>, Dmytro Firsov
	<dmytro_firsov@epam.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Anthony
 PERARD" <anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>,
	"Jan Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>
References: <20260218190855.7272-1-dpsmith@apertussolutions.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <20260218190855.7272-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066EA:EE_|PH0PR12MB5645:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d8b565c-9b2a-4fa3-2973-08de6f42135a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|7416014|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU1LdENGUElQRFpPTWlRUVZmakJnSGFaQ1JDZFFGMEFhTk13YTBTeThKc1or?=
 =?utf-8?B?U3QyZVJyWm1SSWNMYkhRTTBCN1dKeDd6SjUrNE9FSlhkNVA0RzJObWxTRzZT?=
 =?utf-8?B?ZFZVb1RVMGFPdFg4bmZnVVVTWFZkdlZaOGRRNnMxTVFOWDE3UnFPSEtQcnJz?=
 =?utf-8?B?YXp4QzBKWVpRUk1Gb3dzSFYwNitkUGhFbTNtaG95d0xTUm00QzRPQkVpWGU2?=
 =?utf-8?B?WWVGdm9ueTVoV3FwaGhYL1ZUUUhzbGtYVlNiWXdyMVR1Q1FqTHJkM01sSDlk?=
 =?utf-8?B?V2ZEZml6N2NwNDUvL25GK0czN3BUUldxMFVTSGNIS0FQWkRyR2FBalluUmxQ?=
 =?utf-8?B?K2FzYUI1U2JmRndGdlhZODY5L1BlOGdjOFN4U095M2FadTVNOXc1ODhGV3JO?=
 =?utf-8?B?TFpOYUd2cXN6UGlGb0ZBemJyQXhuaGlmank1L3FUaDlkZFVHR3ZBaEh2MmVX?=
 =?utf-8?B?VVM3QVFQdThQV3lpZnY5ZGJPZEhLeERWNktjaEhBUXE1REkvSjZDcDlnekdV?=
 =?utf-8?B?b2MzYk9RU2ZqNmxzL3Y1Y2pVemV4OWZJN01CZ1FVNTIrWXJqcXFtc25xc2Q1?=
 =?utf-8?B?T1JjS2JHbFRac3V4UU5LWGRaU2JIdkJ3eGhNV2FyVnc5dGFuM3hlQ2hPdUFy?=
 =?utf-8?B?VGxDcTJJWmhJWDF3KzNRVHovOFZkUTJaQzUzNElMRkQrSjFaSWNna3lsL1Rw?=
 =?utf-8?B?U0tYenNTZEZyZGFXemFXblYxakZsVVhnb3R5SkNoRVVHNVhNNm44bWp3aEZ0?=
 =?utf-8?B?RE11Vk1Yck0yb3JlTnFYWFdSUzVYM1NQVW5KMzNxazcwOWJ2czd6a2N4TXRt?=
 =?utf-8?B?Skx2SEd1TFJERndNdDczQkdDNDJFZGVpTlE4bHdTSFY4RnY3RW1ySmVUWEtH?=
 =?utf-8?B?QnczczRFU3FoRDBPSUxYYmVjNTkvakhQRmZUa1MvTXZZM2JYZ2d2NlFjM1Jq?=
 =?utf-8?B?YWR0bUs3UDB0bElhR3FpR2w4TzFDdHoybGVSK0x5bEpoWlVvVXVwd2V2RDJK?=
 =?utf-8?B?VEpnZ2I4VFMydWZCNC9Ca0M0ZHNMbzhmOG91MGFOeEI3eEMxUDRwNXZmMTF0?=
 =?utf-8?B?ejRmcmFrY1ptMDh6UEFrMGxPWEEvWUx0dWRvczdFeE80TGN4SDd0VXZLTXpl?=
 =?utf-8?B?bGFaNWJyM3Q4VGJJb1JmV3k5cDZtd0ZvekFteFdJbk0yeG12VzNzNmYxcnNL?=
 =?utf-8?B?RGxFVllFNEJka3gvVEI4N2pscmc1b0Zzd3NEaWhYbWNsdkRCOGkyTjEvTzRm?=
 =?utf-8?B?ZWRDcjN1am1wMWwyaWh6S29zY21NQTdGRWQvOVpLVVR0WEcwTjJTSmczb28x?=
 =?utf-8?B?RE1tQWRoL3JCdjhYZVlzTk9IWVVKWmxDWFVqWk5wL2RkQmZyYzVhV3dRUXA1?=
 =?utf-8?B?eVlZZlYwNHhQRWttWFFvNnFtTFNjUjJKVUR6OWtEdTVaUVFlajNJOEhFM1Fi?=
 =?utf-8?B?dTRpQmF4UzBqSDN6ajFtaGk0RlRkU0ZZWFhjUEZ4WWpxSm9GRDJCdTNkeEFT?=
 =?utf-8?B?UG1rKzE4OEEvQTBscDlNUzBYWk1xVVR2Z1g2UzAvKzNKS1JCc2hSY2YvVFRR?=
 =?utf-8?B?YklxM3FSd1FMWGQ2a3BpZ2Vvdk5DcHl4bHJkaXpvNFFWU2h3V0NzQjg2dnpT?=
 =?utf-8?B?b2Q0dDBUUzhnakJiU1RWbWhJVitDTncwTXZUTzNObk1aa1QvcDRWSUE1akRr?=
 =?utf-8?B?OUEwTlk2dEtLNG5GWkhQLzBNSldxWGQyeWJrL2NieitlcFd4WE9CdVUrbFpI?=
 =?utf-8?B?cXRBRlc3c0VqYSs2VlhjZHBZaTE5blNEdjE2MmxnbGRLS0lpYWRTb1Zoc1Fr?=
 =?utf-8?B?T3BKbVR4Qzd6emk2Tisvakd2dkdBS2N2aENYMjlNN3Z1K0hLMGV3K1R2OU5u?=
 =?utf-8?B?WU1TZWlha053QUJqUjE4VzlMMVVDMjlkT0xWdWw4aWp0N1lFbFVNblFwdUJV?=
 =?utf-8?B?bmNCMVJQdXF1cHBpS0tvaCtmN0VTYzFwMnF6RzJxRzN6T3k4M045NTRFRGRP?=
 =?utf-8?B?SkJRSlQ1K3JnVThDS0xQVVFUYWdMa21zV2JVcE85M3lmeWs4N29DWHlPaDlJ?=
 =?utf-8?B?cmN6ZnlnRDArdHA5UTBqUzRpL2lIK2hCVUZCc2R4UGp6TnZCVlpyRjZOVnk1?=
 =?utf-8?B?ZlNKTlQweVNKMk5TM29tN3ZMbVg5aU02ZEE5b0pEbG9vNmJwUVZuYUdaTFVT?=
 =?utf-8?B?dUtiaGdmWTRDZTJsa1VHN0FOK2dYRWdIbkk1dElyVjI5WitQcEMxV0hyZWtt?=
 =?utf-8?B?ckIyajZaU0gvSXh3S2doN2ZhaTd3PT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(7416014)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/9T6LI4vVB1Ae6sRy32++Rd1RSIkx6c7TndmsCRrFHQoJGTdWuKvCYUy4XMALY2VybZ8Is+dvjxKTreRJ3VswY//3rGVcMYJQqegrgMnKwkI8vpu5zSj3VULCxA5ht3F+SBbaPIbrmpmnycjJV97F2IWDh6gnTKAI3AqBNYvc0h+oN66GuDfYrwiizQyDUY3FuwtZnbeUvwVZJhrCQ8wj2wke/NzS9Wu8KthBNAr8yIDjBefRwYj1N8CUme8c9Oavbwvf1E3MJ639GPijfHJZvOoKrKqunsKlrFNeXgic7vDkCgj2oZ87bDrTuG+2FqVmsPH5gzu7FTEMoC1ebU8ppAu57KnmvABSrrhna8ROFH1a9qQxxPnPLC2hvfnNyp/roT4smpD5MXfu14XOT02OatyW4631hV7xC380FnK5unAk645Ibe9p/qVDPXtYQUn
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 23:04:31.5712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d8b565c-9b2a-4fa3-2973-08de6f42135a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000066EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB5645
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.19 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dpsmith@apertussolutions.com,m:xen-devel@lists.xenproject.org,m:rogersc@ainfosec.com,m:dmytro_firsov@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:michal.orzel@amd.com,m:jbeulich@suse.com,m:julien@xen.org,m:roger.pau@citrix.com,m:sstabellini@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[apertussolutions.com:email];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: DC39E15AC7D
X-Rspamd-Action: no action

On 2026-02-18 14:08, Daniel P. Smith wrote:
> When using XSM Flask, passing DOMID_INVALID will result in a NULL pointer
> reference from the passing of NULL as the target domain to
> xsm_get_domain_state(). Simply not invoking xsm_get_domain_state() when the
> target domain is NULL opens the opportunity to circumvent the XSM
> get_domain_state access check. This is due to the fact that the call to
> xsm_domctl() for get_domain_state op is a no-op check, deferring to
> xsm_get_domain_state().
> 
> Modify the helper get_domain_state() to ensure the requesting domain has
> get_domain_state access for the target domain, whether the target domain is
> explicitly set or implicitly determined with a domain state search. In the case
> of access not being allowed for a domain found during an implicit search, the
> search will continue to the next domain whose state has changed.
> 
> Fixes: 3ad3df1bd0aa ("xen: add new domctl get_domain_state")
> Reported-by: Chris Rogers <rogersc@ainfosec.com>
> Reported-by: Dmytro Firsov <dmytro_firsov@epam.com>
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
> Changes in v2:
> - fix commit message
> - init dom as -1
> - rework loop logic to use test_and_clear_bit()
> ---
>   xen/common/domain.c | 27 +++++++++++++++++++++------
>   xen/common/domctl.c |  7 ++-----
>   2 files changed, 23 insertions(+), 11 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index de6fdf59236e..2ffec331a8d1 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -210,7 +210,7 @@ static void set_domain_state_info(struct xen_domctl_get_domain_state *info,
>   int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>                        domid_t *domid)
>   {
> -    unsigned int dom;
> +    unsigned int dom = -1;
>       int rc = -ENOENT;
>       struct domain *hdl;
>   
> @@ -219,6 +219,10 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,
>   
>       if ( d )
>       {
> +        rc = xsm_get_domain_state(XSM_XS_PRIV, d);
> +        if ( rc )
> +            return rc;
> +
>           set_domain_state_info(info, d);
>   
>           return 0;
> @@ -238,28 +242,39 @@ int get_domain_state(struct xen_domctl_get_domain_state *info, struct domain *d,

Between the two hunks is this:

     hdl = lock_dom_exc_handler();

     /*
      * Only domain registered for VIRQ_DOM_EXC event is allowed to query
      * domains having changed state.
      */
     if ( current->domain != hdl )
     {
         rc = -EACCES;
         goto out;
     }

So it is only the domain with VIRQ_DOM_EXC that can enter the while loop:

>   
>       while ( dom_state_changed )
>       {
> -        dom = find_first_bit(dom_state_changed, DOMID_MASK + 1);
> +        dom = find_next_bit(dom_state_changed, DOMID_MASK + 1, dom + 1);
>           if ( dom >= DOMID_FIRST_RESERVED )
>               break;
> +
> +        d = rcu_lock_domain_by_id(dom);
> +        if ( d && xsm_get_domain_state(XSM_XS_PRIV, d) )

... if the VIRQ_DOM_EXC owner is denied for domain d ...

> +        {
> +            rcu_unlock_domain(d);
> +            d = NULL;
> +            continue;

... the caller would continue ...

> +        }
> +
>           if ( test_and_clear_bit(dom, dom_state_changed) )

... and this bit would never be cleared.  Should the VIRQ_DOM_EXC owner 
always get to clear the bit even if it cannot see the result?  Is this 
too much of a corner case to care about?

The patch generally seems okay aside from this.

>           {
>               *domid = dom;
>   
> -            d = rcu_lock_domain_by_id(dom);
> -
>               if ( d )
>               {
>                   set_domain_state_info(info, d);
> -
>                   rcu_unlock_domain(d);
>               }
>               else
>                   memset(info, 0, sizeof(*info));
>   
>               rc = 0;
> -
>               break;
>           }
> +
> +        if ( d )
> +        {
> +            rcu_unlock_domain(d);
> +            d = NULL;
> +        }
>       }
>   
>    out:
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 29a7726d32d0..2eedc639c72a 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -860,12 +860,9 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>           break;
>   
>       case XEN_DOMCTL_get_domain_state:
> -        ret = xsm_get_domain_state(XSM_XS_PRIV, d);

With the initial NULL deref issue, I wondered if this wouldn't be better 
off modified to drop the d param - xsm_get_domain_state(XSM_XS_PRIV) - 
and changing flask permissions like:
allow dom0_t xen_t:xen get_domain_state;

That would gate the external call, and individual domain permissions 
could be checked with xsm_getdomaininfo(), or a new hook if you don't 
want to re-use.

But as your approach avoids passing NULL, it seems okay to me.  It also 
doesn't change the flask policy, which is nice.

Thanks,
Jason

> -        if ( ret )
> -            break;
> -
> -        copyback = 1;
>           ret = get_domain_state(&op->u.get_domain_state, d, &op->domain);
> +        if ( !ret )
> +            copyback = 1;
>           break;
>   
>       default:


