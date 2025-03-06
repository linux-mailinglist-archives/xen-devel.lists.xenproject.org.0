Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6AEA54E24
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 15:48:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903655.1311624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCW3-0008S7-M7; Thu, 06 Mar 2025 14:48:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903655.1311624; Thu, 06 Mar 2025 14:48:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCW3-0008Pr-Im; Thu, 06 Mar 2025 14:48:03 +0000
Received: by outflank-mailman (input) for mailman id 903655;
 Thu, 06 Mar 2025 14:48:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0N12=VZ=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tqCW1-0008Pl-An
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 14:48:01 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20624.outbound.protection.outlook.com
 [2a01:111:f403:2405::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fc4c046e-fa99-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 15:47:55 +0100 (CET)
Received: from SN1PR12CA0113.namprd12.prod.outlook.com (2603:10b6:802:21::48)
 by SJ2PR12MB7846.namprd12.prod.outlook.com (2603:10b6:a03:4c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.19; Thu, 6 Mar
 2025 14:47:51 +0000
Received: from SA2PEPF00003AEA.namprd02.prod.outlook.com
 (2603:10b6:802:21:cafe::ff) by SN1PR12CA0113.outlook.office365.com
 (2603:10b6:802:21::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8511.19 via Frontend Transport; Thu,
 6 Mar 2025 14:47:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF00003AEA.mail.protection.outlook.com (10.167.248.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Thu, 6 Mar 2025 14:47:50 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 08:47:50 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 6 Mar
 2025 08:47:49 -0600
Received: from [172.20.156.222] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 6 Mar 2025 08:47:49 -0600
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
X-Inumbo-ID: fc4c046e-fa99-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIq/nyWOEztUz2mFyxpzwbmjrUg27dlz5Vid32FnlLOkFsY1HsGwZVzxz8f3EWviiAd6TkznMmcGT36SlcXOIaTkwnQMxAK9WLRdd/eU9STxGhPDxQqv79WN6H0SOCcwdNEcTNIJX1vhSdoEDYP1WdgZqV4iU3dp5N6jhrOZjsBp+g5FWZR9SnsY0vIgQNm3ECtm786e8zObVrFbAbXRcjQdn+xHle23E3OsZHq5Xejvq3H496TuFzRjZ+FvUhJyN4Fb86BRHDABp0fPIg8i5fnzcUFoMuaP+2Z01OtyEu3z8l/cPgZxNnIZe4BWtk/vECyaIGthd42nJ/WYpnQo0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1heS64KgZ3r02jYamtEMX/Puq01EbLbBLG4OpDXOigY=;
 b=Y00MNGhu80DIVvgesQSI7WvmopQNOku3ExyD08r085voeRAWVYnurNcO6oaxEg84NFWm2pe0XchqPu4Vucsw6kboNl/CET8HBbxEKdrrY/tTD2ry9yIxShRsLBvIQbObaaVSRmisz3NZIG9iV5Yh4zuRSNtB00RMhoTkmyFAy5EziPUUsqxvDInuXh1SPt2JEHAYRybSeHM4iwdrcU/AGnuBhaJBO1epPhsjSMllY5N98XpTnxfbAQ0RidV8qatI91uv5JYbE+5O7+fjJhaYiGPkIHGAjcoUkOjH+Dn98ZEbVjI7x8921YG1/c8tcn5277eIsHO0fhjl/NbCkMqtCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1heS64KgZ3r02jYamtEMX/Puq01EbLbBLG4OpDXOigY=;
 b=M6zaiK25SooZgtYNjd1q3VIK+PGPdUJa8VYR2wcmE2Fu96nPvaLkVKONemV5ILIk7oX7ZVWnO2Web+7/oHpRy7Y4khizlu92lm260AubcqzwcG8H3o9PbNyX5WScJAc60EgAOh4CvEHj01+uQ7a3bbp84DnIpJ+niXoL2SygkBU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <4ea050fa-7525-4ad2-9802-1f70480d04ca@amd.com>
Date: Thu, 6 Mar 2025 09:47:51 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/init-dom0less: Fix cpus > 1 and xenstore entries
To: "Orzel, Michal" <michal.orzel@amd.com>, <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@vates.tech>
References: <20250305215832.98162-1-jason.andryuk@amd.com>
 <dc076e36-f58b-43c9-b9ec-ea5d636a0efa@amd.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <dc076e36-f58b-43c9-b9ec-ea5d636a0efa@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AEA:EE_|SJ2PR12MB7846:EE_
X-MS-Office365-Filtering-Correlation-Id: 18f8564c-240b-4313-6a0f-08dd5cbdde59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MkEvYmoxOWxQRk1mOWc2S3g5czEzYlo2Ti9BT0s3d2hlazAxRUdSL3NJd3ZY?=
 =?utf-8?B?ZXVKaG5JVThKemZ1dUNsY3lUa2RKcWxwdWlUeWtxa01vRU1kYU92QWZYWXI2?=
 =?utf-8?B?cWQyOURUMGg3MTN5MjlySGpISkJUcUVJTjB3cE5PUk1tMzFzV3hXbE1tN2Rx?=
 =?utf-8?B?RGthaFdVQnVxRkRFYytqUkRhM1lDY3o1eW5mbjRycGk5VW9WZ2FSVVlnUFdx?=
 =?utf-8?B?cFNhUzhXd1M5Nm15MVNWRHdhL25TSnA3b2R4ZkVxa052MnBtZXpYdnNFa1BR?=
 =?utf-8?B?T2RqUzNQYmdYcFN5d1lSN3Q1dGlBcHBRdTRxQ2VnRlN0UHd4TzZCc1VZbDVN?=
 =?utf-8?B?SHZLWkc2QzhlcHZaMTNnRVJLbDlpa0EvZ0gzSCtvQnlzVEpIWTlFdXBqWEpj?=
 =?utf-8?B?QzBsbTd1WThGL1g5NCs3cENBWDg5cDByTUREZVpHeWtvc2x6R256VjBUbnJ5?=
 =?utf-8?B?Zk9aRVd2Zm83RlhnT01nOU5RQVhwNGpxR0srSkRpTUZ0LzZNWENjTkgyeW1S?=
 =?utf-8?B?ek9ZWFo4anQ3Sk9CbWJ4VldZK2xCbnJtcVZyNkxrT0VXVEE1NDNoRGxISmlY?=
 =?utf-8?B?Y1Y1S3JlOVE0bS9qYTFzb0h2QWVCMG5kSmJiS09QYXpEaDRKekpOdGN5QlJl?=
 =?utf-8?B?eU8wQnBROXNVVTJpcHdDaWphR3duTkRXSi8zVlZQZEw3clF5eHJoc1ZuYVJh?=
 =?utf-8?B?RDU0aitwWjlnRmJQMlBXa1NLRFNVSmp5WTlvOW91K1FYYnN4T1B3ajZ5alE5?=
 =?utf-8?B?Z3BIUk9tMW8zZzA2MTdjc3VpQVV1M3Y1LzVyalZmNitxZnpDMWV1bjFzaEda?=
 =?utf-8?B?STlNeHVOR0tNcTBSdmIzMXNtYmJxbzVaTnRYcjJ3TTBZdWl0Zzc0UzI1bndD?=
 =?utf-8?B?NW1KU3FQSmhjUlpLNUtWMEdDSTlBbWhHdkJoSXAzMjEzU05MMlE2OVpIRDlE?=
 =?utf-8?B?NmEvTEZ4Yy9Ub3FiaWtWU2oySVZVWmlhRW4yTEV5bGk5TXE1NmU5ZDN5akp3?=
 =?utf-8?B?WVA0UDJwYUhCVUVjMjlrUDUzZllHSEJGaWJEczBTVWpoSWRhN3FzWFoxRlZT?=
 =?utf-8?B?U3RSeDhNUUlwQW4zRmtXOHFURFo0eEVSZlVDTlVKZmNVMjBrbFJOR2VNVlc3?=
 =?utf-8?B?RVdFUGx6cWEzQlUvVllkb0VRK2xQNkFpbUpXdjNlM0VIZGpUYUZoWjgzVjZ0?=
 =?utf-8?B?SkVBbUFqS29yZzF5VG9GUWtqamxTRlRjR292NUNnUFhtRXZ2bnFlTEY4UWxr?=
 =?utf-8?B?Z1NldmRjc3ZvYkZlQ0tMb3FjTHJqSmdEbk5KOW43K251c2pyK2QxMFNHM2xv?=
 =?utf-8?B?UmtXeVlYR0hGY1ZTWk5LL0pwSjhqQ0tZNjlETmErM29XTGk2SGp5SmNVSDVz?=
 =?utf-8?B?ZWlFWkpwM0RYM3p1RDIrY0N1SFhXMkJXVlVwUllWRjhxb0puTGFSS1hGUzl2?=
 =?utf-8?B?NVZ1QTBwbTRUbFc5TXFWdHhQTkZjTGtuT3JjSWgwYS92L2tvZ2FrOTc3OGNZ?=
 =?utf-8?B?Um1WMHp2NU1COGJRNnJlT0Q4R0V3YmxnN25OeFRqVnVyd1EwSTNYekNWRkJV?=
 =?utf-8?B?OHRzbzFzME1URmdvNkptMStjKzREcFQ0RWljNHFVZlIyN00xd3F6YWcreVJ5?=
 =?utf-8?B?dHNkekdGVzlCVVY0OUdTVVFGZXAweklHdXZuK3Z0dmZEMS95cnJhYzB2V055?=
 =?utf-8?B?aHpwK20wTUZ2N2tSODhnNVBVeDRtRFZvKytwNDlWQU0xTXd2czFTVkRGV21q?=
 =?utf-8?B?eGQ3WngvMldSNExockh5Vk1UUTF2VHFCT3JVaDJ2bnI2MmhXdDdrMHVveWNN?=
 =?utf-8?B?WThsclFHTVNHMVdmSWlKU2ZSbHFWR3hrbDNMVXY4MUFvdkIvVVpYaWw2SFB6?=
 =?utf-8?B?M1VnT2VFQURFcHpYNTg2NTlrYVdBSUJTMHpFY0JyMGZMb1JSckhsK1l3aDFM?=
 =?utf-8?B?LzlJT0lqRSthUlJEWlEyT2FNY2tzSzU2Vlk4ZnVndUxueEEwSUdRU20vRVBG?=
 =?utf-8?Q?a/qr7CNNFNONOIC5kBxTxErVQS4z6Y=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2025 14:47:50.4517
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18f8564c-240b-4313-6a0f-08dd5cbdde59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00003AEA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7846

On 2025-03-06 05:29, Orzel, Michal wrote:
> 
> 
> On 05/03/2025 22:58, Jason Andryuk wrote:
>>
>>
>> The trailing / in the path is incorrect and generates an error when
>> writing to xenstore:
>> Checking domid: 1
>> Init dom0less domain: 1
>> init-dom0less: writing to xenstore: No error information
>>
>> init-dom0less exits without finishing initialization.
>>
>> vcpu_max_id is an inclusive value, so it should be included in the
>> loop's range to include all vcpus.  Without this, no xenstore entries
>> are created for a 1 vcpu domain.
>>
>> Finally, use vcpu_online, the count of online vcpus, to determine online
>> vs. offline.  info->cpupool is a cpupool id and not a bitmask.
>>
>> Fixes: ec53e0c4ea ("tools: add example application to initialize dom0less PV drivers")
>> Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
>> ---
>>   tools/helpers/init-dom0less.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/tools/helpers/init-dom0less.c b/tools/helpers/init-dom0less.c
>> index 17579fe2e8..c569a890a0 100644
>> --- a/tools/helpers/init-dom0less.c
>> +++ b/tools/helpers/init-dom0less.c
>> @@ -182,13 +182,13 @@ retry_transaction:
>>       if (!do_xs_write_dom(xsh, t, domid, "vm", vm_val_str)) goto err;
>>       if (!do_xs_write_dom(xsh, t, domid, "name", dom_name_str)) goto err;
>>       if (!do_xs_write_dom(xsh, t, domid, "cpu", "")) goto err;
>> -    for (i = 0; i < info->vcpu_max_id; i++) {
>> -        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability/", i);
>> +    for (i = 0; i <= info->vcpu_max_id; i++) {
>> +        rc = snprintf(cpu_str, STR_MAX_LENGTH, "cpu/%u/availability", i);
> Up until this point:
> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
> 
> That said...
> 
>>           if (rc < 0 || rc >= STR_MAX_LENGTH)
>>               goto err;
>>           rc = -EIO;
>>           if (!do_xs_write_dom(xsh, t, domid, cpu_str,
>> -                             (info->cpupool & (1 << i)) ? "online" : "offline"))
>> +                             i < info->vcpu_online ? "online" : "offline"))
> I struggle with this one. Let's say that a dom0less domU starts with 4 vCPUs and
> later on (before executing init-dom0less from dom0), decides to kill it's 2nd
> vCPU. So domU is running vCPU{0,2,3}. With your patch, after executing the
> script, the 4th vCPU will have its availability set to offline and domU will get
> notified to kill its 4th vCPU. That does not sound right...

You are correct.

With xl create, cpus 0..vcpus-1 are marked online and vcpus...maxvcpus-1 
are marked offline.  I was trying to match that.  To online or offline 
cpus, xl vcpu-set keeps them densely packed, 0..$m.

I think libxl_list_vcpu() should give the needed information to set 
these correctly.  I'll try that.

Thanks for taking a look.

-Jason

