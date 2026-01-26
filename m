Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFcZCnHUd2mFlwEAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 21:54:09 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D378D592
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jan 2026 21:54:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1214026.1524457 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkTa6-0002zY-Vr; Mon, 26 Jan 2026 20:53:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1214026.1524457; Mon, 26 Jan 2026 20:53:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vkTa6-0002xq-Rq; Mon, 26 Jan 2026 20:53:06 +0000
Received: by outflank-mailman (input) for mailman id 1214026;
 Mon, 26 Jan 2026 20:53:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=geEI=77=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1vkTa5-0002xU-GZ
 for xen-devel@lists.xenproject.org; Mon, 26 Jan 2026 20:53:05 +0000
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c10d::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 00f65e0e-faf9-11f0-b15f-2bf370ae4941;
 Mon, 26 Jan 2026 21:53:02 +0100 (CET)
Received: from MN2PR01CA0041.prod.exchangelabs.com (2603:10b6:208:23f::10) by
 PH0PR12MB7472.namprd12.prod.outlook.com (2603:10b6:510:1e9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.14; Mon, 26 Jan 2026 20:52:57 +0000
Received: from BN3PEPF0000B06F.namprd21.prod.outlook.com
 (2603:10b6:208:23f:cafe::23) by MN2PR01CA0041.outlook.office365.com
 (2603:10b6:208:23f::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.15 via Frontend Transport; Mon,
 26 Jan 2026 20:54:21 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 BN3PEPF0000B06F.mail.protection.outlook.com (10.167.243.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.0 via Frontend Transport; Mon, 26 Jan 2026 20:52:56 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Mon, 26 Jan
 2026 14:52:56 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 26 Jan
 2026 14:52:56 -0600
Received: from [172.23.49.162] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 26 Jan 2026 12:52:55 -0800
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
X-Inumbo-ID: 00f65e0e-faf9-11f0-b15f-2bf370ae4941
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DHtJ5x+LImKxqnnfw4NEozBRklfHhaevgrdAS7NLiSSHlSJLddMXqQVhVJEWoqFBPkRdXBbSsytGsCzwV6ye7e/lpFW7bWX4RbjMOpGxqD3Rf9odd1b2VzAztdz7MvwS7cEKupvj2M/MX8e9NfoYTuxLXALnJd0RiFKnSa5lI5sGGAhvlyGkiaf7XtD3zt8+3Fz7eqsoeVoE2/WgdA6snHu1yQx/3eOKJ7+Oq/RRZ8LNyjxvDXVNPYA1/4IAveWU9BnfrWdoEFTo6WQOXKVdPJBwO/9DphM4ajVtY+RGYBsJQz2M5VmtPRY8DuZwsJGdFc2pa7rK73sFIoWUPK3aPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7SGNS4TjEI76EVNKrBmF4O5g2Si1KJyHIqW2yyloj+A=;
 b=H7vKkhb15Va6k9Wnru6XPqM1LiRRyOAPn0mZ1+oAYF4fCm89vRsWR69qarI0Or0iRkEGfqVWxJTZaPzROF4s84iO1zsfGXfjBLc1f0QOPqtN4h+GEJtjbvdxYz2N3Gnp2SJep/o3ssSeC0gUT5wICZ7v6W+utxyg/Aw/7wzLfkbkWpgQ4p2C1n/0DOFiVrlHMviLhGcMXXbmasjHnnai8OCcvxOzYnMKnK8uOP6zzTiuUT50udlgSm2zRdNWlYBu9BA09cx0Q36hbzN8Kvu39bPzyKTGbntcqotlfqPiHUpyQPLOm9FstvgKyUFWFntoHDjE1uPmiOYe6IZ2SeJW9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7SGNS4TjEI76EVNKrBmF4O5g2Si1KJyHIqW2yyloj+A=;
 b=Yfq9GKK+90tvnbPUknUHekMAaGwltoPq4gZzGxDWXGIsZiaILoSBrth2vA8g9AFnyKyF5rffysPdNqyLShgnNZuGxXNcK7dBZ1pJlGPKWUJGChiQEx8e1aB4TPKvI+pzSv422uw8DPQDo7KaD0owjfbL2aHJhIS3aAMsopEP93I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Message-ID: <3b9a40d3-ecd8-44cf-a310-620ed55abc68@amd.com>
Date: Mon, 26 Jan 2026 15:17:33 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] cpufreq/hwp: move driver data into policy
To: Jan Beulich <jbeulich@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <ac56e199-7c03-4e97-8238-91d23b0391e2@suse.com>
 <8441ada5-e2ed-4d79-822c-ecf1ce3c9484@suse.com>
 <26ef0e68-efca-4b9a-a210-76b5426da130@amd.com>
 <8bad1a32-d59c-4dba-8c35-b28fcb16f39c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <8bad1a32-d59c-4dba-8c35-b28fcb16f39c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06F:EE_|PH0PR12MB7472:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f2900dd-3284-433f-a76d-08de5d1ce249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bG9RQ25BeEh2MG5HU1FlbzhTejdvdE4yMytoTU9EMVk1ZTJLblVlRCtJNmw1?=
 =?utf-8?B?RjNxcTZmeFFMUE1pRno1YXZFNzBhODM0R0NXRS9ZTlVnYW54dVF1NFVpSkE1?=
 =?utf-8?B?SlBrN0p3c0tnTDhLcTJJdkhmRmgxZGpCQ2NtOE8vVDF6blNUNE5IYzVwQVVl?=
 =?utf-8?B?QWx0eVNocitKRTJwY1JsZk9FZzRQSDJrOHNZenV1bGNYZjdCK00xaHFtNXhN?=
 =?utf-8?B?S2xTS05NeUdFbGk2dVlqZDYyb0xxUGlRQ1NudG1lNzN0WGpQa0RTVjZ2TXZ0?=
 =?utf-8?B?UWkrNU9IWjZleVVYM1JZQjQwV2NjVFpNMENoeHg2WjZMc0hqVGpvc2hJSmFk?=
 =?utf-8?B?UG54OEFiZ1NGRFFKTkE0Yk9xVG5iem1ZOGJsWUZUbExhUXpxNTBwQmp4NEth?=
 =?utf-8?B?QXBSdDlOSEVaMm9SVDVnOGRVSENlcm1aRnRTdlQwb2w1Zjh1dVkwRDkxSXZu?=
 =?utf-8?B?RC9qMHpqY20xZkJScXN1a1FNeWJDdk85K0hrNUpHZFJ2S2w0dTZHMGI0UzFZ?=
 =?utf-8?B?c3FQQ1pPc0lISEJkbTlZcWsxdUhIZFlKN2JxbWRoY0JnUjk2OHd5Q1ErVTRa?=
 =?utf-8?B?cDN0UHJKUklxeUFLRW1TcFBHYXQybEdPNU5RSVNEMjB4aDY2SlhpQklWVnhu?=
 =?utf-8?B?RFE1bFhybVg3TFNHZGI5b0tGaUhCSlorbWRxSXM1WWVNOWxXcUxxNFM1SDVP?=
 =?utf-8?B?bE5TOGFsaXJGc1RUaUswRTkxcUJzWlV0NG1BdWs4SEF4ZWZWWTlxUjltT081?=
 =?utf-8?B?N3FRQXVSTUQ5ZEQxaHpCdDdKcE5KV2I3c0JsZFh2Q1dCYnNpTTRQOEI3aFNV?=
 =?utf-8?B?cXZUZWprTlFDT0xIZDFLeFNxZFBwYk1US1FWc091Rk9CcUNjUE1icHBzNFds?=
 =?utf-8?B?Mk1hNEVRdWFLNEErTFJtS0xCV0dTUXFuOURhNTZGWWp1VTFUS1d4d0N1bzVE?=
 =?utf-8?B?clY3QkY2bk5EcnJWSHE1VlNNbWcxSnYwOHR3UnptZnBOQ2srNXhNZ1YrU295?=
 =?utf-8?B?STJwbHVCdWFVZENkOWc0SHZNcnB3aTFsdlZJQ2RjVmlCK1RqOUsrUDNEYkVh?=
 =?utf-8?B?cVVvMnpTMXp6SEdxK2xqRnBjbGMybm9sbE9HR0lJMHY1RXQzVXFYNHlvNUtW?=
 =?utf-8?B?Wm85RTAwVzNGbmljaEpXRFdQUmRadktIMklVckd1R01odXBZRnVEU21wU0Fj?=
 =?utf-8?B?Q3R0WnpkZWppVnJUOE9Kd3N4TmVCWEd2bTdIc2x4bWdNYndYUlEzS3pZdWVj?=
 =?utf-8?B?OWR4QlRPcTl2VjJhcStUNWlkVDlQajZub21YZEFHL3dMemlEdko2dCs1VVpZ?=
 =?utf-8?B?eklCSTQ2bVl3d1dEclpOd0ZWeXBTUDlnZUZrOEg5aTk0N2F6d01HclhzeGVN?=
 =?utf-8?B?WGltMXE2a1FyVHJmRzJKcXU4bG56SStteXpod2h5Ykd5U01ZeWtFQ0hyeEhG?=
 =?utf-8?B?d0NaNUR4VDRXR2hwUyt1MmZWWGJiSWttRW9UQXlJY0pTSkE1S25raGlLS2RP?=
 =?utf-8?B?akh4azZEZXVEU014QnZTNzQydmg4RzV0Q1ZJS0dmWDRIRjRwaDZpNXM0SERX?=
 =?utf-8?B?R0NaYWFORmNjUWwrQitmbVlGbWpkZldhc0Q3OTh1eUxRdno1VDJwak9OdVRF?=
 =?utf-8?B?WGlieUZZc1cyWERuVTZZQ0ZoVldnYWh4MldHQUxkYWgza0ZwK2tRSFR5ZGJh?=
 =?utf-8?B?azhDelpOV0x0RExoU1NVdkRsTW9TUWJTT0FRZ2p5SFRlcHVNeng3ZHVKd0l1?=
 =?utf-8?B?djFkMDR4MnplUGhPNWRXZEpsYytJSlRPamZKTlZ0bDFtYUF2RTM5T1o2MExn?=
 =?utf-8?B?R1R6Tnc1T3NTc1ZvbXVFUFdRaTVVV0twejFiZ1lOSFE2SzBBNnFNWWhRWXhF?=
 =?utf-8?B?TnRpaFZtMkY5QnBDcDMrL3ZWWER2ZU1mbVFXV1JNT3o0UzZpRXJNTDkrSUFq?=
 =?utf-8?B?aTRJRktBei9VbDFMV1MwSUNpeWwyYWw0UTFJbm5lZHA5SVRKaXN3S1BlcldW?=
 =?utf-8?B?T2hQbzBpeXJCQSt0cEw0UTMzbW5ydldheWdGRlk5OU1xSkp5ZlAxYjZPMFFJ?=
 =?utf-8?B?UVBoaTl2aFdBMGN3K0ROYnhOc0pQU1BaTzdVaXBRU3NPbGFRMzNnNHpGOXpi?=
 =?utf-8?B?S1BMamdsQk81dWFIOURkQVRUcytlcUFBNnlYYld2WDhnMGpRZFpmNGpsamVo?=
 =?utf-8?Q?J4zwwEjnGpIfA0NC9JFt5j3Oxak7GX1di9Zg4LhSjJNM?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 20:52:56.9712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f2900dd-3284-433f-a76d-08de5d1ce249
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B06F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7472
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
	FORGED_RECIPIENTS(0.00)[m:jbeulich@suse.com,m:andrew.cooper3@citrix.com,m:roger.pau@citrix.com,m:xen-devel@lists.xenproject.org,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jason.andryuk@amd.com,xen-devel-bounces@lists.xenproject.org];
	RCPT_COUNT_THREE(0.00)[4];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	TAGGED_RCPT(0.00)[xen-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,suse.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns]
X-Rspamd-Queue-Id: 82D378D592
X-Rspamd-Action: no action

On 2026-01-26 04:08, Jan Beulich wrote:
> On 23.01.2026 23:35, Jason Andryuk wrote:
>> On 2026-01-22 04:42, Jan Beulich wrote:
>>> Share space with the ACPI and powernow drivers, avoiding a separate
>>> allocation for each CPU. Except for get_hwp_para() all use sites already
>>> have the policy available, and this one function can simply be brought
>>> closer to its sibling set_hwp_para().
>>
>> Minor, but maybe 's/function/function's signature/'.  The original
>> phrasing made me think it was code movement.
> 
> I don't see an issue there, but I've adjusted as you asked for.

Thank you.

>>> This then also eliminates the concern over hwp_cpufreq_cpu_init() being
>>> called for all CPUs
>>
>> We expect hwp_cpufreq_cpu_init() to be called for each CPU, so I am
>> confused by this statement.  The data...
> 
> Well, "expect" is the problem. Recall my pointing out of the problem when
> having noticed the same pattern in the amd-cppc driver patches. My
> recollection from the discussion is that there's no formal statement of
> ...
> 
>>   >, or a CPU going offline that's recorded in> policy->cpu (which would
>> result in accesses of per-CPU data of offline
>>> CPUs).
>>>
>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>> ---
>>> hwp_cpufreq_target() still requires policy->cpu to be online, though.
>>>
>>> --- a/xen/arch/x86/acpi/cpufreq/hwp.c
>>> +++ b/xen/arch/x86/acpi/cpufreq/hwp.c
>>
>>> -static DEFINE_PER_CPU_READ_MOSTLY(struct hwp_drv_data *, hwp_drv_data);
>>
>> ... here is tracked and filled per-CPU.
>>
>> Do we need cpufreq_add_cpu() to force hw_all = 1 for HWP (and maybe
>> AMD-CPPC) to ensure that policy is allocated per-CPU?
> 
> ... this being a correct thing to do, hence our code imo would better be
> resilient to it being different somewhere.
> 
>> Are we implicitly relying on shared_type == CPUFREQ_SHARED_TYPE_HW to do
>> that for us?
> 
> Right now we do, I believe, without - as said above - this being actually
> mandated by the spec.

HWP doesn't need ACPI data.  I wrote the driver according to the SDM, 
which is just MSRs.  It's Xen that needs ACPI data to initialize and use 
cpufreq.

Regardless of that, it looks like the checks for cpu_online() and 
performance_pminfo[] would constrain CPU accesses, so:

Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>

Thanks,
Jason

