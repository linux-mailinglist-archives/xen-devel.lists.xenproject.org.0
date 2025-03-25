Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6135EA702F9
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 14:59:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926510.1329351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4nb-00033C-Dz; Tue, 25 Mar 2025 13:58:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926510.1329351; Tue, 25 Mar 2025 13:58:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx4nb-00030Q-AW; Tue, 25 Mar 2025 13:58:35 +0000
Received: by outflank-mailman (input) for mailman id 926510;
 Tue, 25 Mar 2025 13:58:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gb8l=WM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tx4nZ-00030K-8k
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 13:58:33 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20606.outbound.protection.outlook.com
 [2a01:111:f403:2009::606])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3b2bf6fd-0981-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 14:58:30 +0100 (CET)
Received: from BN9P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:408:13e::16)
 by IA0PR12MB8085.namprd12.prod.outlook.com (2603:10b6:208:400::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 13:58:25 +0000
Received: from MN1PEPF0000F0E0.namprd04.prod.outlook.com
 (2603:10b6:408:13e:cafe::fd) by BN9P220CA0011.outlook.office365.com
 (2603:10b6:408:13e::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 13:58:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E0.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 13:58:24 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 08:58:24 -0500
Received: from [172.22.20.237] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 08:58:23 -0500
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
X-Inumbo-ID: 3b2bf6fd-0981-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gk2Pd68if4EDPZ3H/nwDMJh/uIQgeYmgpDfRt071L4LDX9h3nh4syRUlzd3mjOp/wM8o6HymR4HSPw9XeRhnDt7YNVS7QTQ73vO1+0faurDdmnhSBm1r7hWPDJUJ/Uch33d+L2eswqUTrXIlslmNK7GYEnXZYXk+rlehOrzT687ofF6b68h0ZWrCSj740nnz/amJdeDGDMrwKr3pi0Lt+pW08MhJnVwaEOXToFUne7W0154dxAXWFmnyINosBxQGuLawdgzOQBXz3xV6JKIfA6MEPSy4su1svOTbZGd3Uq4lKFNm/5hDCUU5p13iIVEv1eZR0qVzWBGwDNlr+jtqcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eUMPZCTEFXblxCYkyJrC1VgNbVD1w51DI+hmhmSZaH4=;
 b=ePwJ6nNdCBPCHJ+C4tM4K7KEZyWPnMYozX98zDuXBnszVe4PFpYSaNQw31OinJFSGpX3j3+EIUw0pAjsGFY11TguGdPtLB91jMUCcCxyayJAKknn1Q9rHo+3U7wMT19KX/FKdTosFDe2Pq/yCiNBVif7cKQ5c8Fqcbupd0D+MNDcVUfayWuIoSlIpfSZEZmK3LootGiPDmwHAnenADTR9uwAUwo5SlysaGNW2dgMa7jWwhiDuH2teBC/0xHMDu5fR2hApG1U/RMYX08cSi0VYoc9bi0zMN2MIYvGWJZ9dNNzm3rNJRLlTVL1+dK/gu3Yo5dcoxU4nBFpHg5B6fec5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eUMPZCTEFXblxCYkyJrC1VgNbVD1w51DI+hmhmSZaH4=;
 b=brM6+/1WU8uxCAN8nKq6cY/d5RHZ8TwnKFRNmGLCcibMiCWxeWmCvR+8a+Dmp2MTOw285EGxgj9QgPST9v9nrgullZfYJyAoYpslM+rMfNGddohUP+1DbvZPCmWJmiUbXZdfg9dcVqlVUgRi/UB6LLhOGTVLOaq8JY78FNTYr1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <c0f64c48-7284-4534-a861-4d6f6fa6c61d@amd.com>
Date: Tue, 25 Mar 2025 09:58:25 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/15] xen/x86: introduce a new amd cppc driver for
 cpufreq scaling
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
CC: <ray.huang@amd.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
	<xen-devel@lists.xenproject.org>, Jason Andryuk <jandryuk@gmail.com>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-10-Penny.Zheng@amd.com>
 <4fe44e49-f55d-4d2a-ac02-538038e9128c@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <4fe44e49-f55d-4d2a-ac02-538038e9128c@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E0:EE_|IA0PR12MB8085:EE_
X-MS-Office365-Filtering-Correlation-Id: a974c17c-9964-4fd3-6bf9-08dd6ba51c8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UlVvUmxlZlR5OUZxYm9NajhWU1FWVFRxMTY4dDFmZUgvWUUyZTRwTjNQVTBN?=
 =?utf-8?B?Z2lZdk5VZmJLZS9YM1RodUcwdHUrYjArUVJqTkhmV3psMk9pRGV3djQwMDZL?=
 =?utf-8?B?YUt4SEdvRkpJWm92QmRvbW1BbGNuM1YxTGZ3YUdad3dsNXRHMDFFTWQxRGtP?=
 =?utf-8?B?VXVueW91N2lPWVh4MWlCaHRkY0ZCanRWY0VCeFI0RFpNOTZLUmZPbnYwaXZq?=
 =?utf-8?B?TXhoUSt0aEJRbm85WE1tSE1KUHpxRFRFSUI4QTU5M1RzQU04S052Yk1MUkhY?=
 =?utf-8?B?THFEWnRWK2tyTzNzMmZGMkNnWmxORnNjckw3aXZBU0U2WGtZNGk5NlkvUFk5?=
 =?utf-8?B?Q24yTGlVaUc2SkdndHI4OUlLWTYxR05JQ2hBdXJrWVlnblFWcGhWQ0R6eDgy?=
 =?utf-8?B?R2lHMW1WUVo2K29vMlZVNmhTdVA0cGZLdDVEVGNQNFpRa1JuZnZnOGVFQUEv?=
 =?utf-8?B?R1NhNXBmcmNjUnVudEhBVnFJeGVzKys5VldkMjErR3BKeGwvSTliOTNUUEVM?=
 =?utf-8?B?N0wvSkpzMjUvbGIwT0dKVUg0ZGhsOStjLzNQZ0REdk03UktIazcrNHNQNmxa?=
 =?utf-8?B?dGNRMkdGQlIyVHFYdHJDWE1TaDB2QlgwS1BaUmR4Z2VRUEt2VDdZcVZZRjF4?=
 =?utf-8?B?RFAweFE3enBianl3T09tdVZteVhWUVZlQmF0VDJMQ3g3T3NZek54RVhKV3Fs?=
 =?utf-8?B?WGswQXZ6ajNlelpYcGhRNUJudFFzZlovT3F2YWdVY3p0VUVTVUoyczBCRjFI?=
 =?utf-8?B?bHNDTTRSMUV6amFJaHNadDYvMkdmT1VZQ2hwQng2SnMycVV3WWEyUDNndnBq?=
 =?utf-8?B?Q1R2bkZrY0VzTnpUWFFTZWlzTTBvV3M3M2NmdkRRVThBUGRhMHhxOENvNk5M?=
 =?utf-8?B?RDZKSkFHYVlKSUY2bC9ZaU50aGp2c1F3R0hWRUdjS2hTQ1JXNTZtV2ROYjQw?=
 =?utf-8?B?NklXNlEvS0NjSTZhV3VPc3J5cVFReitvZ2c3VlFrZXJZV3JXeVM1QWE1cGtH?=
 =?utf-8?B?aWlvUnZWMnJxMnphWnJNQ1NKVFNTeUdxcGZhS3JVUWdpTmJqMmFETzZhK1A4?=
 =?utf-8?B?Q2RXV2pBYytlL0lTN1Bvd2k2b2lLN2ovWVNzT3I0Q0EvZ0pxQ0pYQXBUUGJi?=
 =?utf-8?B?d1J5TnIycCthVXhxZ2dVcDYzNW9hdXRoR2VlWmJHYk9mb3I1a0p4R0tGQ3hr?=
 =?utf-8?B?NUovb1lpVEJ3OE5pTk5qKzNNNFdQN2FOZEVPT1lFdVpNSXJLWXU1SnBDWWl5?=
 =?utf-8?B?RWIvSXRNRFY0cUJubjBjYVZuRUllblgxS1NicTdadkxMbUZKYUgxU241UldM?=
 =?utf-8?B?QVNISkdKVWpuTzd0czNVL3pHTTRyNWZDbGhZMFJqSUV6UGtKcnZYZmxaanU0?=
 =?utf-8?B?VGdTbk95S21samVzdkZNWWtIUEwrNHBUbzJFSDYwbDhJZWpQRmVVSkVvVm5l?=
 =?utf-8?B?bWRXbTVRNDFEWEwyS2hYZmtWb0hyM215VkNGeFUrdk1rMlI5ZXY3TzE0blFx?=
 =?utf-8?B?N2M2REcxeEltUUtXelNWTFRSSVFyTFM1K2V0VW1CbldMOUFmQTJ4am1WZ0Ur?=
 =?utf-8?B?bnNoUUd4dTdYWlo4VE45SVJuUFplSGxIdU1PY012OStDTWdnMU16c3dhcVlW?=
 =?utf-8?B?dTFKN3NjTWcxeTd6QnQ0a1N5N0J3SGRwbktJMktBczBwUUd0Q0NQNnJBN3hH?=
 =?utf-8?B?UjZ2ak5COXZXNlBaTTZVSkNPYTBnNXF1ZS9JeUVtbEg3VHRQNkpPaDF0SUs0?=
 =?utf-8?B?RmU1YktGTEtidVVuYnhrWllDTzVGaGtkWG9ScXdVaEVZS21uWnhMYTRXeGJV?=
 =?utf-8?B?UktSVU8razQzZ0dHVXlrSkxqY0tidnpCYlRvdy9YcjNrSjdhcW83c2ppeTUw?=
 =?utf-8?B?STl5MzdNS3FMM3NqWE1YZkd2Wk1Qb1NJWXFKR3JDVC9BaFc1OG5Ja0dSU1RL?=
 =?utf-8?B?cWpZRU0wOGhldklhMnhzWnJWdURqSE9JcCs5TDU4a3NzcEozVTRtcFhlTDlu?=
 =?utf-8?Q?8eVmC9aS0GGxy1QTV3p+EEi3eqaFaQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 13:58:24.8946
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a974c17c-9964-4fd3-6bf9-08dd6ba51c8f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0E0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8085

On 2025-03-25 05:57, Jan Beulich wrote:
> On 06.03.2025 09:39, Penny Zheng wrote:

>> +static int cf_check amd_cppc_cpufreq_target(struct cpufreq_policy *policy,
>> +                                            unsigned int target_freq,
>> +                                            unsigned int relation)
>> +{
>> +    unsigned int cpu = policy->cpu;
>> +    const struct amd_cppc_drv_data *data = per_cpu(amd_cppc_drv_data, cpu);
>> +    uint8_t des_perf;
>> +    int res;
>> +
>> +    if ( unlikely(!target_freq) )
>> +        return 0;
> 
> Checking other *_cpufreq_target() functions, none would silently ignore
> a zero input. (HWP's ignores the input altogether though; Cc-ing Jason
> for possible clarification: I would have expected this driver here and
> the HWP one to be similar in this regard.)

Yes, for HWP, the target and relation are ignored.  All control is done 
by writing MSR_HWP_REQUEST which are "continuous, abstract, unit-less 
performance scale" values.  Those are applied by set_hwp_para() from 
`xenpm set-cpufreq-cppc`.

I think the difference is that this CPPC driver supports both autonomous 
and active mode.  The HWP driver I wrote only supports the equivalent of 
autonomous mode - write the MSR and let the processor figure it out.

I think Penny's implementation also uses the existing governors, whereas 
HWP only uses the dedicated hwp_governor.

Hopefully that gives some context.

Regards,
Jason

