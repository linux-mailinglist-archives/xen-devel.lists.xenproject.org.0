Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id e6BlKOT3c2lJ0gAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 23:36:20 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EFBDB7B323
	for <lists+xen-devel@lfdr.de>; Fri, 23 Jan 2026 23:36:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212597.1523638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjPl3-0004Pt-Dk; Fri, 23 Jan 2026 22:36:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212597.1523638; Fri, 23 Jan 2026 22:36:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjPl3-0004Mj-9Q; Fri, 23 Jan 2026 22:36:01 +0000
Received: by outflank-mailman (input) for mailman id 1212597;
 Fri, 23 Jan 2026 22:35:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zLor=74=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vjPl1-0004Md-F1
 for xen-devel@lists.xenproject.org; Fri, 23 Jan 2026 22:35:59 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e23e5aab-f8ab-11f0-b15f-2bf370ae4941;
 Fri, 23 Jan 2026 23:35:57 +0100 (CET)
Received: from PH5P220CA0001.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:34a::8)
 by DM3PR12MB9327.namprd12.prod.outlook.com (2603:10b6:0:42::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.11; Fri, 23 Jan
 2026 22:35:52 +0000
Received: from SA2PEPF000015C7.namprd03.prod.outlook.com
 (2603:10b6:510:34a:cafe::8) by PH5P220CA0001.outlook.office365.com
 (2603:10b6:510:34a::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.11 via Frontend Transport; Fri,
 23 Jan 2026 22:36:08 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SA2PEPF000015C7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 23 Jan 2026 22:35:51 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 23 Jan
 2026 16:35:50 -0600
Received: from [172.26.188.28] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 23 Jan 2026 16:35:50 -0600
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
X-Inumbo-ID: e23e5aab-f8ab-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5fLhBonaVAK9O9IrI8jnorQ8wO5MYwkq5E5x06xvM7msH3jTMtI8hUNNyuBsqiuG7YMje/H43ZmCLT0lE9JFqEB+aTzxLSNeltzb7AXm+sbPtZpZfHwn+I8ws+roJjBBekjf5XRGnBQctkaMbbjVvLZlsBLkQOEC3XxJhXf1kdnL7OK1SZg/eLGVcy5f7N+YZfxkg6NDeFh4e+RqaKJJdqyPx+XPctnH+0dJsNx46P38zfTMqPt2sFlr4niKyaPZgX61ssrVGYDIdhms5uCo5MOTjUejkOJpKu6+vYsbXFSM1ppPR0Q4PqKPys7ipkjeOMqZQUITj2xabBhcYxfrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GgmufgnGgUDOr6k/GE5Xoz17xtg6jzpb8FjFlHU/IJ0=;
 b=Sm3xjO59nJETe31eY/x/I0gVgwfgvR87kYowU280h93ZR39IzWv49Q/0jTEexWa5/8rOiq7htrsYmdRHuOXpF2KVBYY4mKoOywcc+tMhZ7bVb/9fLee2qyBTKXPeKUXRACCHFUvATyFQokd1qssLZp5QJTLceBmbw+LyKtXDbG1H9u1PrMhDy6a+YJnqpFmzkiTTr378qUmvnBFSWIJ3t1drBth71g1iVEOs5Em1frBN84LfcYf1kJY+Hsz9qgPo/ra92BYaYbIaxB6vWKm53vdaYxclfWX97wYQ1vqYAuK5hptosgtMGfyVPQukY8vHKv9fHfJHC3WwpbyPmn/EcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GgmufgnGgUDOr6k/GE5Xoz17xtg6jzpb8FjFlHU/IJ0=;
 b=Keu5GSVoj93NktbF/93FeFRmX3NKGFT4dzjyAoFtxdx4K7n8aOnYozPkhSrb5/xHgNGF4C0mb9WsR/d2tw7qGIrydPxBI0qlKbSqkGbTclZ/dvAtSxIiqCJHhjiNykTK/0fzdNqprfOykIhjMfSDP7NEynoIJ1z8dUxSthk9Kqk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <26ef0e68-efca-4b9a-a210-76b5426da130@amd.com>
Date: Fri, 23 Jan 2026 17:35:49 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] cpufreq/hwp: move driver data into policy
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
 <8441ada5-e2ed-4d79-822c-ecf1ce3c9484@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8441ada5-e2ed-4d79-822c-ecf1ce3c9484@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C7:EE_|DM3PR12MB9327:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c80c7e4-5e57-4921-9bd8-08de5acfc337
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RnBpN0xuZTlmOUtTREs4UElWMkxtK3pTMTBrVENJRWltaldMRjFmdnRtUUN4?=
 =?utf-8?B?dFhyTGJRT09kMnh5QldsMlRXZ0p2bkYyaWl2NFplN2M5RDZPK1FvLzJRdTRy?=
 =?utf-8?B?T2psaTlxcjVqSFd3bU9lWW0wcTQ3bmRsL1pvd3JKNERiNjJJczJHZVhjQ2Jt?=
 =?utf-8?B?cEpZWXpibWhycm13OWowNzFVNm1ka1VydnByVXRRMmlIVkUrS0pQVWFWbGJW?=
 =?utf-8?B?cXExMkxIbE8weVlwK2x1cUZWN2tvSlVxUExFSW9NR29OWkU3a0Y2cmdLbGVG?=
 =?utf-8?B?NVhSN1pWd1JPOVZuaVBGc284TktZc29lUk1KZTE5N0xsWkNEQzNEak1aT0lW?=
 =?utf-8?B?MWVCQkNKNmJMS21laklnNmJRZG1YSFBRVnNuWENidSszbEYyT2tPMG1lKzhP?=
 =?utf-8?B?Y3dYdnZoUVBGUS9SSWhXZE9vUHB4MFQyMlJ4SWdtYnhXR3VqTnFSaHNidEtI?=
 =?utf-8?B?TDNNZld3ZUhtcjFjQnhJcFp3Rm1uSXJ2TnNBNm16N2NFenVyb2pzUkIwTEk2?=
 =?utf-8?B?VDJtYjJnQzhGaHVpMW4relF2TGdiVjhObWFzd2ZVd0JVdTZZUHIxNE5xYUlq?=
 =?utf-8?B?SXZFZFRzMDZINThleVk3Yk1YQTZlbTFaMFRsTUdIbE15NXdxT2kwbHN6TWg2?=
 =?utf-8?B?SDZmTXVZWkI5RXRtZlp6OHFIUUsrekNOYjV6dTRxeXMvcFROWkgwdFlQdmdZ?=
 =?utf-8?B?WFRNeFpGTnR2aHBKMm5aZS9OM1YzVWtiU1F1a1hDRk81NEpZLzFtcHFlanFn?=
 =?utf-8?B?N1JSenBYbURqN1l6SHk1YkhxQXRTQVZiVExLUVpHYWpFVXJkM29BV3lMYXNZ?=
 =?utf-8?B?R2x0SHhULzI2WFhnUDNBd0FNd3RuVnhKUDJLWUJRWGROTHpzZXIrM0hEK1FK?=
 =?utf-8?B?VWE2NmNVaWVDQ0p6ZS96YmltYmQ5dThTVjlyam9xWlEzK29rclZVcm9HSzI0?=
 =?utf-8?B?TGl3K2wvdERzZDZmQkswYU1zMUYxWkwyZTZxaVR3Yk96YnFMZ2laN2lJYWhX?=
 =?utf-8?B?dmgwMTB6QmEyaFBhN1pJOTlMdDFVbmJucDRZV0NlM1oyRXJQSmtCK0kwOFpQ?=
 =?utf-8?B?L1paOTgrVVpvSGhadGJBU1FpOWJzMHI2TXgvMFVmN2liN0tLTzh1OEg4OHpY?=
 =?utf-8?B?cWdxc21QQVNFM0lvS2F1V2VNRE85T3MxZ3lhd0FqazJUWjVEU0VHM0dSZXdv?=
 =?utf-8?B?UWJtcitJdU85b3lyNEhTd1VZZUhJU3A0dWVDTXBvNTJKcjZyK3VteXZjZmV3?=
 =?utf-8?B?OFpxM0lwYnVheCtoRDdrVDlVRzNlNmRUSWhCQmdpZEk5amJabytoRHJyRk1C?=
 =?utf-8?B?SGk5YmhSK2Z5UXk4QnZ2NUpDd0xnVWNhWk5EQnFSU1g0eDJTdC82bVV1NldN?=
 =?utf-8?B?YjZudzZrakovYk9JL1NBTkR5c0pvSjRwR2s1dnErQVpZTFNTMmdJYSt3cVkw?=
 =?utf-8?B?bUlwdG5RUTN6dDNLQ1BHWndVVWZWck9SWGdOd1hKSlNZQTk2aC9pdmowY2xG?=
 =?utf-8?B?ZlZUaXRTc0tqakFFUFJ2Um1tU3B3RzVPTEszWmFvTGJ6VEZ5c0pWM0kweTFn?=
 =?utf-8?B?RkNGdEpTQjJaMHVjTEtWOVloT2g5bUdVTHRTK3NQVjBwUVpuR2RTRjV2WWdk?=
 =?utf-8?B?NzBYNzlSWXplL216TmhCY1pxMW1tYS9DQTU1QlgwNWNvOFFTU2lpN0I5RkNL?=
 =?utf-8?B?Z2IvTk1oTWV6OFdiTVREa1BFVmZNZkdLZ2NhdjhVNS95bnIzdGRSU1RxR2xM?=
 =?utf-8?B?QzRBVFprL1l4UFY1L2N0cjFNdUlKUDlPbVpRSGlBMjZyaXN6ZlFCUTJMbGpV?=
 =?utf-8?B?S2FKVlM2RDFDZzZHSk9hNEIxRzRXaW8yTXNVc0VVWS9WY3R0bnRXVmtwcDZP?=
 =?utf-8?B?NGFST3ZiQlJiSkkwbUtGNmt1UzRmSEZPRjlRdTdoQXh6VVlaNEFwMUZRd0JG?=
 =?utf-8?B?L0pOL2o5cXNHRm94MjBhTFVvUmRSOEZaSFFteXlNdXVXOEdpU08rOVNvZDkx?=
 =?utf-8?B?cGtEM1JYR2dzMWQyUUhQbUlrMzdheGdFY2Z6cFJ5TVRscG5tR3p0SHQ1d01O?=
 =?utf-8?B?ZDVqNDVxWWdZb2hMTC83YzZmL0dmZzIrNS95a0tXWU1kd2t5TTQrZFRSNjF4?=
 =?utf-8?B?Q2VkVDZaWXArOFlpQXVwa2FhMS9raU1XTmV1SWszY2tGS0U0eTZRMWswdWJV?=
 =?utf-8?B?S1pLUTNxWXBiWXF3dDBOWnJBdEg0MXZQSXU4VUwzaENiTFpvN1NJRHFnMXZ2?=
 =?utf-8?B?Uy9idU5WeS8rRjdMWlh2eWUzS0dRPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 22:35:51.2501
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c80c7e4-5e57-4921-9bd8-08de5acfc337
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9327
X-Rspamd-Server: lfdr
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-0.694];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Queue-Id: EFBDB7B323
X-Rspamd-Action: no action

On 2026-01-22 04:42, Jan Beulich wrote:
> Share space with the ACPI and powernow drivers, avoiding a separate
> allocation for each CPU. Except for get_hwp_para() all use sites already
> have the policy available, and this one function can simply be brought
> closer to its sibling set_hwp_para().

Minor, but maybe 's/function/function's signature/'.  The original 
phrasing made me think it was code movement.

> 
> This then also eliminates the concern over hwp_cpufreq_cpu_init() being
> called for all CPUs

We expect hwp_cpufreq_cpu_init() to be called for each CPU, so I am 
confused by this statement.  The data...

 >, or a CPU going offline that's recorded in> policy->cpu (which would 
result in accesses of per-CPU data of offline
> CPUs).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> hwp_cpufreq_target() still requires policy->cpu to be online, though.
> 
> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c

> -static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);

... here is tracked and filled per-CPU.

Do we need cpufreq_add_cpu() to force hw_all = 1 for HWP (and maybe 
AMD-CPPC) to ensure that policy is allocated per-CPU?

Are we implicitly relying on shared_type == CPUFREQ_SHARED_TYPE_HW to do 
that for us?

The code here is okay, fwiw.

Thanks,
Jason

