Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A66FA7070D
	for <lists+xen-devel@lfdr.de>; Tue, 25 Mar 2025 17:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.926700.1329539 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Hc-0006Rp-I2; Tue, 25 Mar 2025 16:37:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 926700.1329539; Tue, 25 Mar 2025 16:37:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tx7Hc-0006Pe-Ex; Tue, 25 Mar 2025 16:37:44 +0000
Received: by outflank-mailman (input) for mailman id 926700;
 Tue, 25 Mar 2025 16:37:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gb8l=WM=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tx7Hb-0006PW-3N
 for xen-devel@lists.xenproject.org; Tue, 25 Mar 2025 16:37:43 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062c.outbound.protection.outlook.com
 [2a01:111:f403:200a::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 777069be-0997-11f0-9ea3-5ba50f476ded;
 Tue, 25 Mar 2025 17:37:41 +0100 (CET)
Received: from DS7PR05CA0070.namprd05.prod.outlook.com (2603:10b6:8:57::28) by
 CH3PR12MB8460.namprd12.prod.outlook.com (2603:10b6:610:156::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Tue, 25 Mar
 2025 16:37:34 +0000
Received: from DS1PEPF00017099.namprd05.prod.outlook.com
 (2603:10b6:8:57:cafe::9) by DS7PR05CA0070.outlook.office365.com
 (2603:10b6:8:57::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.42 via Frontend Transport; Tue,
 25 Mar 2025 16:37:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS1PEPF00017099.mail.protection.outlook.com (10.167.18.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 25 Mar 2025 16:37:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 11:37:33 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Mar
 2025 11:37:33 -0500
Received: from [172.22.20.237] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Mar 2025 11:37:32 -0500
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
X-Inumbo-ID: 777069be-0997-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oc2l98v99r9yWY4teGDH1J2VsL0x7YDTIwYrNgYbvb+Wwd4+reVU4Bgv5IPn5lL85Mzv4PSZOvQzUMc3rUo0Jzrbn+q7x20c4zHJgTpvBxtOkYb61x4AmBNx0gO0VVqtJCpaYwXl7/9BZsj3kLuOS/7yh1WvB7C4WsNIhI82lPcoZHi1Tk5N7pNBL1og3mbLAtB/bofzUGO92xYo/hAkw4PdbXCi8v6fzuo/BlkE+0LHYMUTlvFX5aSxGj1HLLACKa2b+ixiR232kQNnNe+Q7D6nMyutKI/rvpbZRDSzsjh2H02nraPPV496+tLvJ+oGLMczsDVfla30ZQSMwB/F6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vBMrt+AILPCIvhl8gFDMn6YmrPFPBBczacbOkXP2Rpw=;
 b=MAhB8w3EidgTBylvzR5JSixvQQ3bIortpYfbhUloYSbuJk7/4iWW7HWTE7dsedmVUj9le1U2Bp2pR0F9iEtn1JHRQN291oNf4L67/JCvCpvDJ1J/dyM64ObZ5NW+xAyPtGv/TNiyG+Oa7ISrZ9j5B1JFGuRFxOIDuHsGZgmCokPT6rFMC92DgBPg4eg+w9flDXmh3tjzEclXmJAQfHN+c0SaTPXqHwvKZTPittw/Iko95ZWsY6WfCo+mqwyYr7bo3bA3jhCX2EHJZGw6Kg2UABXt9LXdiE6X43Y/i6EI/1rEVTsvgvx5r4A5bTt+7sgfEpi4u4QN/orF+1I/r5QDXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vBMrt+AILPCIvhl8gFDMn6YmrPFPBBczacbOkXP2Rpw=;
 b=LNW7Ehv0uGHiq+CHnEghoq3D5NK2g7LufCCnsh2XeSQUqoRDoGjI8+ae19YOOJb7AvS5U3FkSF6lpBBlV/12hSJ3vn2nqG8CNyhsLCLiiTbE1RCcBuljWLOUrxU9sU47pOwwkEULYl0ITR1x5ocnDaMg5211mp5OGPkWYxWA6f4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <490094f1-001a-436f-a9a8-dc982235b2ae@amd.com>
Date: Tue, 25 Mar 2025 12:37:35 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 14/15] xen/xenpm: Adapt cpu frequency monitor in xenpm
To: Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>, "Jason
 Andryuk" <jandryuk@gmail.com>, Anthony PERARD <anthony.perard@vates.tech>
CC: <ray.huang@amd.com>, Juergen Gross <jgross@suse.com>,
	<xen-devel@lists.xenproject.org>
References: <20250306083949.1503385-1-Penny.Zheng@amd.com>
 <20250306083949.1503385-15-Penny.Zheng@amd.com>
 <6f5a81d7-c650-46d2-b667-6b7c3bc54c41@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6f5a81d7-c650-46d2-b667-6b7c3bc54c41@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017099:EE_|CH3PR12MB8460:EE_
X-MS-Office365-Filtering-Correlation-Id: 7acdd718-2e04-418d-b025-08dd6bbb586d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OXg2bkp3ODEwelZNdzYvTkdxZ0RDQzI2L3Jtb2FNS0t6RHhsQVZ1K2NSUVFk?=
 =?utf-8?B?RGgzMWpscGZQRTNnNkc0Tnc5SmIrTldaR2dRd21VUDlrRFNVR0JDMXRTQ3VI?=
 =?utf-8?B?dGVUak9XbW1uMGxReUIyY1ZtL0VXUGtnMEZmdGVTam0vazZrNHBHRlpLWFhX?=
 =?utf-8?B?SEF6dllaL3dwNG5BN0c5cXB4YjJSbStodmgvenZkQjJsUGtVZitDNkJpRFVQ?=
 =?utf-8?B?ckFKdGFjWUFwMVlGNnF6dnJPckNEOGNOV3FrcnhWdjhmRTBBV3E3M0Y4WnZS?=
 =?utf-8?B?ZVREcTVNRGxsa2dZYlpGdHMrSHFSZkRRd05xc1ZDUE5vREJuek5raFFleDNZ?=
 =?utf-8?B?NFdrK1Q4amNMNHduaUg0aWZiYXVqZHJURnN2WUpxa2NzRzdabStuWXlQa1cz?=
 =?utf-8?B?TzFGeC84dHd2S2hPWUlocjZtUVlCV2J6VHlYTHY1S2xPTmRnWjJvZm9pWWdK?=
 =?utf-8?B?aTFoVTZ5S2pmQzBRU2t1czdkQ3N5Qjk5UGFaSHlRa0ppYTBmTnBuRlJjVm96?=
 =?utf-8?B?QkNhRVVXWS9paGFzNWJjR3dsWHdBdEt5T0RUVnVKenV6M3VwWEYvZHJiaFFK?=
 =?utf-8?B?T2VlZnlNbHRVVXlIczFOdk5aMjVwendReU53WVpuSUVsbWtYVHFsNThwWnJj?=
 =?utf-8?B?cmYzUGJ3aERWbWttcUhmcTZ3a2REclU1UEJZWlFlNlJqWm5YeTF1Zi9kOExX?=
 =?utf-8?B?UVlUTWUyZkZJMUFEMWl1emxRaGl3QUladDhpaDZwNFhsQUtoZUM5SEhUQjBs?=
 =?utf-8?B?SFVoODRUTnVCZC9DTzFXTlBZaTJzc2U4bmhXNHpSNEQrbFUrVFh3cWttWDho?=
 =?utf-8?B?aFhzbFZyWkJJTXMyS3BSMS9tNXVmWmN0anplMmFrajh4MjYyMGRpclNZUXhZ?=
 =?utf-8?B?MjJRdlhnVU8xZHFxa29uZ2liOGx3R3hMT01LVHRRcVFxTVBkbGJBUktVZmVK?=
 =?utf-8?B?ZlRRUlRhQTh1UG9WS0g1WkxwbW5MUmtYcjJ3NkIzaXcrdGQ0LzBDR0ZuQUxs?=
 =?utf-8?B?SVFqSmZUaE1TaUJlSFpGU29YMU8wWXFyVlpaZ0FuNGpGUzFJbE9ibE5ST3V0?=
 =?utf-8?B?dTVERUdCSFJrVGZYdkkvUU5qUDM1bVRRMzRFR3VhaHdZaU1lRkFoVFBJR3g3?=
 =?utf-8?B?UGJwMWIyM1Q1UE9UQStJTlE1RjdwYVppTWh1L0U2b1kyY2JrYWlXc2xNQVJG?=
 =?utf-8?B?bFJMcGt4RzVGbWx5Q1JGbUZtOHZlQ0Y1S3hQS1kxcUdLMlYwUHB6OFpOZWpF?=
 =?utf-8?B?QzcwRHMyd1h2MkUrVUg2RUVhUXBHazZRVHJobGJ3QXR1YjdqaWFPa1VpQ2Y3?=
 =?utf-8?B?WTI4ZktxUXY4cEJjV0ZCQVVTODZPbGFIbGE3R2U1d3hzUHVLMUF5VmpaNWFh?=
 =?utf-8?B?Y0t5V0VuQkpoZ0U0cTJ0U2VQOTVydFpLbVZOYXVPN3kycU5CdWV0ZTl1Y05V?=
 =?utf-8?B?RlFyYmxSSWR6QVdvRHd1dlE1Vkx3QTlPRVp2dnh6T0d2c1B4OXE5MitlWFBG?=
 =?utf-8?B?S1lvRUdiWmxTVkJ5bFFUNXRIVjRVZHpqb082TDhjRXJCQlppRm9nYWxaNlE2?=
 =?utf-8?B?QXA1dHh0WjRXbUp5MHJ4aFVSRjlIb0FQK2tGL2pNYW9USGtqWXExK3dyTmJL?=
 =?utf-8?B?bCtiQnhPdlRLODlUb2J2YUFwUFBlbUwzcHl2a1M5TkNpUWd1SlBLUTRxL0VK?=
 =?utf-8?B?MWFjM3NRcTV3RDV1Z1FHb1owUXJMN0ZkaXNhTklyZHpLVEJPU2xtM1haUTRH?=
 =?utf-8?B?WWQyRkNBMXFlZjdWWnBaM1FzYUNraytUTU1JVXJkcHZrRVNkR2NPUk93eXZC?=
 =?utf-8?B?WU9xaDdsRUlTQjdPdTRveFZEUGFMTEFEM00wdDR1bzRZVjY0cFBKRnVpZFl1?=
 =?utf-8?B?WHdSSGFja3VSWFhjWkM3Y2ZGcmlLTUlId3pSY3gzNHM1T1NjVDRMNloxS3ZQ?=
 =?utf-8?B?SFA3dDhKWW5WbHl6TlVZWC93NlhDWkFMZEt0WnZuaW9lendJc3Y3ZGR1eDRN?=
 =?utf-8?Q?bi2kc61HBWq1q8xt8NDKWA8rF9Kikk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2025 16:37:34.2180
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7acdd718-2e04-418d-b025-08dd6bbb586d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017099.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8460

On 2025-03-25 07:26, Jan Beulich wrote:
> On 06.03.2025 09:39, Penny Zheng wrote:
>> Make `xenpm get-cpureq-para/set-cpufreq-para` available in CPPC mode.
>> --- a/tools/libs/ctrl/xc_pm.c
>> +++ b/tools/libs/ctrl/xc_pm.c
>> @@ -214,13 +214,12 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>>   			 user_para->gov_num * CPUFREQ_NAME_LEN * sizeof(char), XC_HYPERCALL_BUFFER_BOUNCE_BOTH);
>>   
>>       bool has_num = user_para->cpu_num &&
>> -                     user_para->freq_num &&
>>                        user_para->gov_num;
>>   
>>       if ( has_num )
> 
> Something looks wrong here already before your patch: With how has_num is set
> and with this conditional, ...
> 
>>       {
>>           if ( (!user_para->affected_cpus)                    ||
>> -             (!user_para->scaling_available_frequencies)    ||
>> +             (user_para->freq_num && !user_para->scaling_available_frequencies)    ||
>>                (user_para->gov_num && !user_para->scaling_available_governors) )
> 
> ... this ->gov_num check, ...>>           {
>>               errno = EINVAL;
>> @@ -228,14 +227,16 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
>>           }
>>           if ( xc_hypercall_bounce_pre(xch, affected_cpus) )
>>               goto unlock_1;
>> -        if ( xc_hypercall_bounce_pre(xch, scaling_available_frequencies) )
>> +        if ( user_para->freq_num &&
>> +             xc_hypercall_bounce_pre(xch, scaling_available_frequencies) )
>>               goto unlock_2;
>>           if ( user_para->gov_num &&
> 
> ... this one, and ...
> 
>>                xc_hypercall_bounce_pre(xch, scaling_available_governors) )
>>               goto unlock_3;
>>   
>>           set_xen_guest_handle(sys_para->affected_cpus, affected_cpus);
>> -        set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
>> +        if ( user_para->freq_num )
>> +            set_xen_guest_handle(sys_para->scaling_available_frequencies, scaling_available_frequencies);
> 
> (Nit: Yet another overly long line. It was too long already before, yes, but
>   that's no excuse to make it even longer.  The more that there is better
>   formatting right in context below.)
> 
>>           if ( user_para->gov_num )
> 
> ... this one are all dead code. Jason? I expect the has_num variable simply
> wants dropping altogether, thus correcting the earlier anomaly and getting
> the intended new behavior at the same time.

Hmmm.  The sysctl is executed twice - first to query the assorted *_num 
values and a second time to retrieve the results with sized arrays.

get_hwp_para() does not populate scaling_available_governors, so the 
intention was to be able to skip allocating the buffer for it.

     pmstat&xenpm: Re-arrage for cpufreq union

     Rearrange code now that xen_sysctl_pm_op's get_para fields has the
     nested union and struct.  In particular, the scaling governor
     information like scaling_available_governors is inside the union, so it
     is not always available.  Move those fields (op->u.get_para.u.s.u.*)
     together as well as the common fields (ones outside the union like
     op->u.get_para.turbo_enabled).

     With that, gov_num may be 0, so bounce buffer handling needs
     to be modified.

     scaling_governor and other fields inside op->u.get_para.u.s.u.* 
won't be
     used for hwp, so this will simplify the change when hwp support is
     introduced and re-indents these lines all together.

I noted that gov_num may be 0.  But that may have been before hwp had 
its own internal governor.  But, yes, the has_num handling looks wrong 
for gov_num == 0.  I don't have a machine with hwp to verify.


>> @@ -926,7 +926,8 @@ static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
>>               ret = -ENOMEM;
>>               goto out;
>>           }
>> -        if (!(p_cpufreq->scaling_available_frequencies =
>> +        if (p_cpufreq->freq_num &&
>> +            !(p_cpufreq->scaling_available_frequencies =
>>                 malloc(p_cpufreq->freq_num * sizeof(uint32_t))))
>>           {
>>               fprintf(stderr,
> 
> Can someone explain to me how the pre-existing logic here works? All
> three ->*_num start out as zero. Hence respective allocations (of zero
> size) may conceivably return NULL (the behavior there is implementation
> defined after all). Yet then we'd bail from the loop, and hence from the
> function. IOW adding a ->freq_num check and also a ->cpu_num one (along
> with the ->gov_num one that apparently was added during HWP development)
> would once again look like an independent (latent) bugfix to me.

I guess we rely on glibc providing non-NULL?  But also they are ignored 
for the initial query of *_num values.

Regards,
Jason

