Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 152F690FDAB
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 09:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744231.1151247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCBq-0001Kj-IE; Thu, 20 Jun 2024 07:26:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744231.1151247; Thu, 20 Jun 2024 07:26:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKCBq-0001IE-FW; Thu, 20 Jun 2024 07:26:38 +0000
Received: by outflank-mailman (input) for mailman id 744231;
 Thu, 20 Jun 2024 07:26:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=duhU=NW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sKCBp-0001BS-17
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 07:26:37 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20600.outbound.protection.outlook.com
 [2a01:111:f403:240a::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6bbbdf00-2ed6-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 09:26:35 +0200 (CEST)
Received: from BY5PR04CA0014.namprd04.prod.outlook.com (2603:10b6:a03:1d0::24)
 by PH7PR12MB7017.namprd12.prod.outlook.com (2603:10b6:510:1b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.21; Thu, 20 Jun
 2024 07:26:29 +0000
Received: from CO1PEPF000042AE.namprd03.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::37) by BY5PR04CA0014.outlook.office365.com
 (2603:10b6:a03:1d0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Thu, 20 Jun 2024 07:26:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000042AE.mail.protection.outlook.com (10.167.243.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 20 Jun 2024 07:26:29 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 02:26:27 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 20 Jun
 2024 02:26:27 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 20 Jun 2024 02:26:26 -0500
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
X-Inumbo-ID: 6bbbdf00-2ed6-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQuGi3Ye/E0+8xrDenrAkHe8l/0o0jiVU/eStu3ZEl5JCp83eVURr0OEKRMmDyRDosQAjkn5Pa8mc0s6FvfLR1wuKm7K948KQQPeq4cQrK4g6GvmQ/IoxY61Lomx8Y2Qin4vIyr7l60wIijs4O2J2YG3JqpWBuZWYVdUJ4tbKGFeafRmkhuqfC3aYln334KTL/M7HT7XqDf9Jpm85td5qHvim2GbuaTWSz5Lc1Bz1l9pH0iPKduGRURbxafrxFDBcsXhzLg/RxKAZcd7qSKKyPHeYVDwsxhJfgr+Fqq0sdazMHFVRPJeo5LGGb8w1TTffujSCOnEQ1sfuRg8mxgQQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O4a2PhBrpHCu3XKgwdNkoRXO5cL+e+BTf3xeee/EQow=;
 b=AV+CckSiCPsCP2fZjTLqGQut2IQWKAlYAfz36ZYaU0i2IwmyUTHoqCZ+cjg9iW8XDsj4F/XXVVhMuvJqiRIx5vYL0o5WP10OVZkh+mKeP1VpKI7VKy04c+lPSRHfrGDvNrXjKzUSqp6L8wC0sKQ9XYoqycJ4iTimSP+gS8NgI7J6r7d1Ti6IGRqtUj7Ws4zdn7gv//XpUuJRrtdyd6Tfv56ueeWOeiLYHgILbSGVV+khNap6OzNIwOb5A6QMq85C8R6Wndozfyf41heCfQIK7JxlUuuxXCGIzPgqv7D7qeM8k/JcBepWFT9u23oSo2blLdYLa8OkOUVNi/T3mvXHlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O4a2PhBrpHCu3XKgwdNkoRXO5cL+e+BTf3xeee/EQow=;
 b=C4khkmOA4+iaJyAEv/zNa6eERJ92jGW9rytaHxRVahI2SVomfUkqIWxHQnUUgTTJWD3mu7QK5M9KklPIEhxSNSVUnwb/Lwf/3edIUweJLlqbppqOn8VSNsxNypEvbEdPhAwqmYS8GI8cglx7mSkwPl+VKElp6Fq6cKcgXW9++rI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <bed9d557-66b7-4711-80f7-a85c28e57f6c@amd.com>
Date: Thu, 20 Jun 2024 09:26:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240619064652.18266-1-michal.orzel@amd.com>
 <82790448-dd2f-4299-ae3d-938080ee5e19@xen.org>
 <99fb367a-7ceb-4769-8120-a06474e98fb3@amd.com>
 <7bffdbeb-0219-4ec7-a70f-a9fa55cd6b5e@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <7bffdbeb-0219-4ec7-a70f-a9fa55cd6b5e@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042AE:EE_|PH7PR12MB7017:EE_
X-MS-Office365-Filtering-Correlation-Id: 8924aa85-8cd4-4520-f387-08dc90fa4d51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|1800799021|82310400023|36860700010|376011;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEdZOVg4ZGdzOGZzZk9CSnVHc0RBd1Rua3NVSUZZTERkWEFNYUNsaHFzTUZa?=
 =?utf-8?B?bkUvcm1NMVBtVHhzMndGRkcrTnVaVVVxYzZhcFpRamhBT3p2aXFDNXo2TVBZ?=
 =?utf-8?B?VTJnd3k2SXBhSUlhT1BXRDdnbGJua0w1OWFBZE9tTU5jNWY2T3V0NUdGWXc1?=
 =?utf-8?B?aitBNG9vbFNkZllpcUE2S1Zta3Z1eHVLNVBmRjZZK0JoR3RFaFE4UGcxeHhj?=
 =?utf-8?B?UGc0ellUTGJxWU1zRFpaZ3ZmdTJTOFI3cnY0cjVXNHNsY0dIWVhTYTRnYnY4?=
 =?utf-8?B?dU92MmoxZmtDSU9jVzJuSFo0QWt2a0pxem90OWUyM3J2Um91OHhaQm5UQ3FY?=
 =?utf-8?B?U0FOK1FqbXdZMTZlSTQxR2RMWFBTWURxTXpvV0QzeEdnaFBDYWtsOVZyaFUr?=
 =?utf-8?B?M2ZoU3lHQWc4cS9GQkVySlRuSDhkaXlEQ3p0VFFhVFNvaHJDdjZlTnlwNWkr?=
 =?utf-8?B?ZlgrV0h5NEtYSnJxeVhXL0xveGsycGFOS0pWVXc3S0RGdjROLzZLVEV0LzJH?=
 =?utf-8?B?MjFaUFpESC9XQVhJa3B2YVJWMU1TNVdhTTFXN2NIaHNzZTMyY0VRSUIyQUR4?=
 =?utf-8?B?RE5ja1FkWEY2cWFPdlJicVpHKzBwRTVKZkFVMVI3MVUxQ09GVEQ4QXNQdVVU?=
 =?utf-8?B?b2dyaDNock5nQSt2T0IrVU5YYWtzd2JORFpRWU5NbE1JMDdYTUpKbkFOK2Zz?=
 =?utf-8?B?QUd2VnI4R1MwV0FBKzJVT3lrZWx0bWFVREtCNDhrRGMvdko0VnBuYXN4SVgy?=
 =?utf-8?B?bmZESlcxWlRHZDA5SzM3bWJNVUYxUGhDeC9rbHdsVFVhNVRDQ2JGL2wxWVZi?=
 =?utf-8?B?QU9vY2NIRE5SU2FOMll4enpWMjFqM3RpVWNSRCs3RUg5MmczK2gyTE5odkQ0?=
 =?utf-8?B?ajFXWGpsc1NpM1lQYm1mVCtnSVNjNkJhb0ZQR3RsZzBQSzlIKzc2MzV1Sklr?=
 =?utf-8?B?dFQ1c1d0eWpSYWRoL2Z6NnhPUDE3c0lYVDdVWFJ0ei9SbTJoTTZmREZUUUhm?=
 =?utf-8?B?N3NhRXZ1VzBwaUVuN1JQdUZDc1VObTY2S0dMN1R4S2V4SEhxQ1h6aUFqTkF4?=
 =?utf-8?B?WHNvUzFpUEkvQUQ5NE1FMTh5a2pNSHdJazNla0J1ZG81cXZaR1ZrYmp6OHU3?=
 =?utf-8?B?NmdJcFFEZGN6SDRsNStOck13QlhyTGFUUVRUQWNxc2JpdEJKN2ZtM1dML3Bx?=
 =?utf-8?B?TFhJWW8xVnZVU0tzclU5MnQ1dC9DdGRkRzh2WFVWblFuNEJpOWlSRHVENlBy?=
 =?utf-8?B?UEdKRThReXpieWs3cU5zRHMyN2huVy9LZVRYQngyNmV3QllyV1p3aFptRXR6?=
 =?utf-8?B?aSs1S2swVVhJdWNzZnhSaUZ1cU40b3dRNm9sdzZTYnFVZFZhZ3F6RzFqVlZR?=
 =?utf-8?B?VE8ybHR4Y0tHbUJYWGVtb2lENzRUWWJRdi9NVXF2dzhiQzJZbWdGd0J4SUwv?=
 =?utf-8?B?OXp3VU55d2ZHWG40ZDJLbFgzNyswdXd2WDljVHgxajFkUXpTYlRtdmlzZzFZ?=
 =?utf-8?B?dnFQVmdMQ2Z1NGRZZkVKWlFUNFVZTHVDa3FMUGJqNWpBRUZXWGNhd2ZETlpr?=
 =?utf-8?B?UkVNejVuZTFKYTFPaU9naTh6OElaSkNuUXdoSkEvZDBYMmIzeFUwNGwweHlG?=
 =?utf-8?B?QWVEK2tjMjJMYXJaM001eG9LQkU3NVI0NnBzYmF2OERUQzJHTnNrRi96eUpJ?=
 =?utf-8?B?bWYvd3NsaUdPSm9NdVdlNVZ1SDhMN3lPK1ZVemRBNG5NQWh2SUJldU9QMDRL?=
 =?utf-8?B?aFI4bloxaUZBUnRpSWNzNVc5emJUODc0RG1JaVloTlVhQytkbVQzUjJOaXdH?=
 =?utf-8?Q?4+a+zQo8sUsvemujaioGLvHU1MzEA1jkkcuZw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(1800799021)(82310400023)(36860700010)(376011);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2024 07:26:29.1176
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8924aa85-8cd4-4520-f387-08dc90fa4d51
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042AE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7017



On 19/06/2024 14:34, Julien Grall wrote:
> 
> 
> On 19/06/2024 13:06, Michal Orzel wrote:
>> Hi Julien,
>>
>> On 19/06/2024 13:55, Julien Grall wrote:
>>>
>>>
>>> Hi Michal,
>>>
>>> On 19/06/2024 07:46, Michal Orzel wrote:
>>>> Building Xen with CONFIG_STATIC_SHM=y results in a build failure:
>>>>
>>>> arch/arm/static-shmem.c: In function 'process_shm':
>>>> arch/arm/static-shmem.c:327:41: error: 'gbase' may be used uninitialized [-Werror=maybe-uninitialized]
>>>>     327 |         if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>>>> arch/arm/static-shmem.c:305:17: note: 'gbase' was declared here
>>>>     305 |         paddr_t gbase, pbase, psize;
>>>>
>>>> This is because the commit cb1ddafdc573 adds a check referencing
>>>> gbase/pbase variables which were not yet assigned a value. Fix it.
>>>>
>>>> Fixes: cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem should be direct-mapped for direct-mapped domains")
>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>> ---
>>>> Rationale for 4.19: this patch fixes a build failure reported by CI:
>>>> https://gitlab.com/xen-project/xen/-/jobs/7131807878
>>>> ---
>>>>    xen/arch/arm/static-shmem.c | 13 +++++++------
>>>>    1 file changed, 7 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>>>> index c434b96e6204..cd48d2896b7e 100644
>>>> --- a/xen/arch/arm/static-shmem.c
>>>> +++ b/xen/arch/arm/static-shmem.c
>>>> @@ -324,12 +324,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>                printk("%pd: static shared memory bank not found: '%s'", d, shm_id);
>>>>                return -ENOENT;
>>>>            }
>>>> -        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>>>> -        {
>>>> -            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
>>>> -                   d, pbase, gbase);
>>>> -            return -EINVAL;
>>>> -        }
>>>>
>>>>            pbase = boot_shm_bank->start;
>>>>            psize = boot_shm_bank->size;
>>>> @@ -353,6 +347,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>>>                /* guest phys address is after host phys address */
>>>>                gbase = dt_read_paddr(cells + addr_cells, addr_cells);
>>>>
>>>> +            if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>>>> +            {
>>>> +                printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
>>>> +                       d, pbase, gbase);
>>>> +                return -EINVAL;
>>>> +            }
>>>> +
>>>
>>> Before this patch, the check was globally. I guess the intention was it
>>> covers the two part of the "if". But now, you only have it in when
>>> "paddr" is specified in the DT.
>>>
>>>   From a brief look at the code, I can't figure out why we don't need a
>>> similar check on the else path. Is this because it is guarantee that
>>> will be paddr == gaddr?
>> The reason why I added this check only in the first case is due to what doc states.
>> It says that if a domain is 1:1, the shmem should be also 1:1 i.e. pbase == gbase. In the else
>> case the pbase is omitted and thus a user cannot know and has no guarantee what will be the backing physical address.
> 
> The property "direct-map" has the following definition:
> 
> "- direct-map
> 
>      Only available when statically allocated memory is used for the domain.
>      An empty property to request the memory of the domain to be
>      direct-map (guest physical address == physical address).
> "
> 
> So I think it would be fair for someone to interpret it as shared memory
> would also be 1:1 mapped.
> 
>> Thus, reading this doc makes me feel that for 1:1 guests user needs to specify pbase == gbase.
> 
> See above, I think this is not 100% clear. I am concerned that someone
> may try to use the version where only the guest address is specified.
> 
> It would likely be hard to realize that the extended regions would not
> work properly. So something needs to be done.
> 
> I don't have any preference on how to address. It could simply be a
> check in Xen to request that both "gaddr" and "paddr" are specified for
> direct mapped domain.
Fair enough. I can add a check for 1:1 in the else case to return error with a message that
host and guest physical address must be supplied for direct-mapped domains. Would we consider it for 4.19?
In my opinion yes as it would remove the possibility of a feature misuse.

~Michal

