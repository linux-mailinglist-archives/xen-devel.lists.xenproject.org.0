Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E635490EA5F
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2024 14:06:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.743746.1150713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJu5Q-0002JY-1W; Wed, 19 Jun 2024 12:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 743746.1150713; Wed, 19 Jun 2024 12:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sJu5P-0002IL-Tp; Wed, 19 Jun 2024 12:06:47 +0000
Received: by outflank-mailman (input) for mailman id 743746;
 Wed, 19 Jun 2024 12:06:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5jEq=NV=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sJu5O-0002AW-Eo
 for xen-devel@lists.xenproject.org; Wed, 19 Jun 2024 12:06:46 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on20600.outbound.protection.outlook.com
 [2a01:111:f403:2417::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 65252f33-2e34-11ef-90a3-e314d9c70b13;
 Wed, 19 Jun 2024 14:06:45 +0200 (CEST)
Received: from PH7P221CA0001.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::7)
 by IA1PR12MB8263.namprd12.prod.outlook.com (2603:10b6:208:3f8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.19; Wed, 19 Jun
 2024 12:06:34 +0000
Received: from CY4PEPF0000EE35.namprd05.prod.outlook.com
 (2603:10b6:510:32a:cafe::26) by PH7P221CA0001.outlook.office365.com
 (2603:10b6:510:32a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.33 via Frontend
 Transport; Wed, 19 Jun 2024 12:06:34 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000EE35.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 19 Jun 2024 12:06:33 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Jun
 2024 07:06:30 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 19 Jun
 2024 07:06:30 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 19 Jun 2024 07:06:29 -0500
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
X-Inumbo-ID: 65252f33-2e34-11ef-90a3-e314d9c70b13
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fc0GhekVQZU5qYJyRs/SUr4Xu0dEViyzikumWRe8q3mgxyGyTcMJjBylFNEtUZZL24Cxx5vMfLJxWpEWDkJl2HbQ/qgcIGjO56YPdg+sN0AfTBTqjYZ+DxOu/2TrvoZjBWLbLLBeZivM7jIx0k7hbMCBtz+EWVM+vcXhCZQovhye4eLqjRjykmSs/+nRhg1MNbFICwBEtbgwn/2+K5DrllQ0nTPF8tSPKiFKFUAEvKbWsMmPYyCoGwsPjERwf8D7S6zeMF1JkwSsf5lnNoaLPQGvRMvpx4unbOdzUsR/pbyLDB4YiiQixwbPqfEuhN8pqf0ti/rtGYu+PcUbXayfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+RtgDtAPbd+xYchkX/zQp44H7l0HbIK1trRzkvXzwJI=;
 b=GCIMNP5dE6In674IXqlyodZ2loZ3MYpSpU3fineVLhujYliB6fyVmYBBO+HUH8oJgKYHWum/PTfcWEUu59tkdWRyPIEhzMCH11xKmuQZSvwSyD1GdvGGhF2Gl8gz4e3GVJbMFqSUzGDT0BlX7gbRoLb2dfYRyq7wE15KLoSwMNi42l1o6R66z+1gzB2ZiT5KmsrjytEjRUrVdgf+OOovGtBrvMkN9++X+xVS8rzHTP2q9TwEGg/NlsvJpMh0HTZ1lKngxGldZDhoDUM7dk1r1sA6iWMFLGtZ9ctZP7fn02tDG/GZmbTlT3+ntpAAFu0An1saP407hUMlXDdFU6W76w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+RtgDtAPbd+xYchkX/zQp44H7l0HbIK1trRzkvXzwJI=;
 b=mKvEUJlazXtVpgCaUIBiAgyiEBhDn0bWCT0qkSb5SR6mh2wISj41PnLsY8vq9QTEeCiz8dkJNbb4zlvDimd0Yf5Cqp0rspWquFpGwmhHzh8ZcsOdC3hFNmH3brBSqhoj1QCmuliW5xQoYACSfey23yN1dxShVqVPnDpNLsIqp3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Message-ID: <99fb367a-7ceb-4769-8120-a06474e98fb3@amd.com>
Date: Wed, 19 Jun 2024 14:06:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19] xen/arm: static-shmem: fix "gbase/pbase used
 uninitialized" build failure
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240619064652.18266-1-michal.orzel@amd.com>
 <82790448-dd2f-4299-ae3d-938080ee5e19@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <82790448-dd2f-4299-ae3d-938080ee5e19@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE35:EE_|IA1PR12MB8263:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ec3a82c-0a13-4de6-f7e6-08dc90584324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|36860700010|1800799021|82310400023;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVRmbzZORHlNVGVvK3RoazFPZldxbkMvL2dreDh6U2RBVmJ0MEJ0NC9BZmR3?=
 =?utf-8?B?WFpmTllSSG0ydWlQR2xHeEgzaXN0YTk3cHNmcHliTUJ3cCtRSEdxM0h4NnVL?=
 =?utf-8?B?UTBVdGttOUZ1RFYvTTJyRlNNNW54Q1ZLcGhGM2p1b0xXeDgxaUcra21oTGN4?=
 =?utf-8?B?QU5mM2JnVENyaFpIejNURTRMRWt0OXQ3SndtQnRYVENDTjBkbnh5bmllcmx4?=
 =?utf-8?B?bUV6MmNRVEowNjVxK3Z0WWgrNHVTRlYzYlpRL1VNdXkraU9TNVZPTFI2Q0x2?=
 =?utf-8?B?cldERDBjSmgzME03aDFNa0NjU0FkYk9qaDRwTlptejFkL3MxcmdvOUlyTk1m?=
 =?utf-8?B?ajNIYTdhMnIzc0xMTzZjQXVFd2pLMG5XbmlBem9oOFFIMXNrcmUrYTFqajNj?=
 =?utf-8?B?Sk1ON1NoVVhFaThIS2kvS0s3LzlEdC9VM3J3bzdlZXJJRXNSNmorUTVhQUxv?=
 =?utf-8?B?dnp6QjFXYWhHSkxDbE40aXA2a2RCb3gxRGs1bHJPdU5CaTBkNGJWOHFzYTlC?=
 =?utf-8?B?TGxXSnFGd1RnbTBYNVBwbFE5OFpTbHlVUUk2WDg2MXlhT2pnVHQ5bUo2d1ZC?=
 =?utf-8?B?d0xFcjV4S25lN2JaMFhWUkJ4TVg2czNtSGU2cjdhR1hzaHpRT2xkRTZPdkFO?=
 =?utf-8?B?MVZuMW51VXNyZkxDZEJ4MXV2QjJUUXM1bndiLy9mUEFmNG8wYnl3dDBvZzJi?=
 =?utf-8?B?aWIvQjUzNVBlcThvMlpWaG1NSk8zVDF6SHJNY01oRUVEY2piTHQyWVpTb1ZC?=
 =?utf-8?B?SEJGaURWV3dOeGNsOXl2dXlMRmN2M1hOcGZhWWhScDRyUm02NGN3RXVsZTJo?=
 =?utf-8?B?aEtIR2RMSlhFVmVaOUJHVE1wUVhUL2VQZXN6RDlaNnRCRlZsdHphcUVXNVBu?=
 =?utf-8?B?Ump2MkdiQzlsdmJYYlkvMFZrR1lzM2JBeFlrZU9scjNIc2FMZld2bXMzSzJ4?=
 =?utf-8?B?VlA1dlpjNEVFVkFUZ1QzalQzOS9rU0pTb3pnSk45NjV1cU5oSkVTQ05QZCtP?=
 =?utf-8?B?QU5mNG9SU3ZTU0xwODZCYkVEeWs3cExTSkRDc1Q5eHdHRWZvMnpVcTA2SFdz?=
 =?utf-8?B?ZUNPRzJIT00zSVdvTlRlelpFTjhDcXZlTE9DdXZnTjlETDFFZmwyY2FxMXFj?=
 =?utf-8?B?SGtVOGhSNDFpS1JYT2NzejBhU1lOTUR6akhYTndxMjlDWnprZTFKSlVkTlVr?=
 =?utf-8?B?TnM2UnhFK0N6Zk9md2xnRFY2K0ozRkQzUnBsYVJaa0ZKbXVkTmFwZFJRa2Q5?=
 =?utf-8?B?NzV6MmlaSFJiZFlzYnJJRCsrMDhIckZNSnJkT2Z4UEs2TXlpQnY5N2JGenRB?=
 =?utf-8?B?dTJZNFh5VGw5dnkwSHBwYnIyUms5NDhXc0dCSU1PUk9PSGtiNVgwbXJOeXV6?=
 =?utf-8?B?QXVXeTAzTENBUVpDTUFYbFdsRzlWUWZJMzY0MVZFeDNSOVFObVpydlp2b0sz?=
 =?utf-8?B?U1VlcDJKNFZBc2tiQ3JidlRWK0Q3Unl1UHpUR2VJY3luVWdLZkpVUE1hYm9E?=
 =?utf-8?B?WFhpYm9yNGhwRXhGRno1dldQSUx4V1hEVnlGMVhFeE9hMUsvNGM4aEs2dWl2?=
 =?utf-8?B?cGNPdzdhV3laMkNsbXRnbjFEOW5yQlhTRlN5WGowMnhBWHYvQ3lmYVg3WDlv?=
 =?utf-8?B?bDBCd013TCtJQjVtaVpQelJxNmFBQUJRRVRlYUphc1Rka2UrT0JraE5kL3Jn?=
 =?utf-8?B?TkU2bWFUZUFOS3JHTExBZU51aHhPWFZuekJVWTI3QUVvQVl5V1FEWHhQWDVQ?=
 =?utf-8?B?RlNMN0hRNU9DbSt6TzJnQXdmT2UwUWJTZlRsRWtvWkNkZ3RCQ2ZyRDFYUFRU?=
 =?utf-8?Q?LMzmAGddPTiS6RSjM3M/3NJkx9M+zzSvn4jsk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230037)(376011)(36860700010)(1800799021)(82310400023);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2024 12:06:33.6535
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ec3a82c-0a13-4de6-f7e6-08dc90584324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE35.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8263

Hi Julien,

On 19/06/2024 13:55, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 19/06/2024 07:46, Michal Orzel wrote:
>> Building Xen with CONFIG_STATIC_SHM=y results in a build failure:
>>
>> arch/arm/static-shmem.c: In function 'process_shm':
>> arch/arm/static-shmem.c:327:41: error: 'gbase' may be used uninitialized [-Werror=maybe-uninitialized]
>>    327 |         if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>> arch/arm/static-shmem.c:305:17: note: 'gbase' was declared here
>>    305 |         paddr_t gbase, pbase, psize;
>>
>> This is because the commit cb1ddafdc573 adds a check referencing
>> gbase/pbase variables which were not yet assigned a value. Fix it.
>>
>> Fixes: cb1ddafdc573 ("xen/arm/static-shmem: Static-shmem should be direct-mapped for direct-mapped domains")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> Rationale for 4.19: this patch fixes a build failure reported by CI:
>> https://gitlab.com/xen-project/xen/-/jobs/7131807878
>> ---
>>   xen/arch/arm/static-shmem.c | 13 +++++++------
>>   1 file changed, 7 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
>> index c434b96e6204..cd48d2896b7e 100644
>> --- a/xen/arch/arm/static-shmem.c
>> +++ b/xen/arch/arm/static-shmem.c
>> @@ -324,12 +324,6 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>               printk("%pd: static shared memory bank not found: '%s'", d, shm_id);
>>               return -ENOENT;
>>           }
>> -        if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>> -        {
>> -            printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
>> -                   d, pbase, gbase);
>> -            return -EINVAL;
>> -        }
>>
>>           pbase = boot_shm_bank->start;
>>           psize = boot_shm_bank->size;
>> @@ -353,6 +347,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>>               /* guest phys address is after host phys address */
>>               gbase = dt_read_paddr(cells + addr_cells, addr_cells);
>>
>> +            if ( is_domain_direct_mapped(d) && (pbase != gbase) )
>> +            {
>> +                printk("%pd: physical address 0x%"PRIpaddr" and guest address 0x%"PRIpaddr" are not direct-mapped.\n",
>> +                       d, pbase, gbase);
>> +                return -EINVAL;
>> +            }
>> +
> 
> Before this patch, the check was globally. I guess the intention was it
> covers the two part of the "if". But now, you only have it in when
> "paddr" is specified in the DT.
> 
>  From a brief look at the code, I can't figure out why we don't need a
> similar check on the else path. Is this because it is guarantee that
> will be paddr == gaddr?
The reason why I added this check only in the first case is due to what doc states.
It says that if a domain is 1:1, the shmem should be also 1:1 i.e. pbase == gbase. In the else
case the pbase is omitted and thus a user cannot know and has no guarantee what will be the backing physical address.
Thus, reading this doc makes me feel that for 1:1 guests user needs to specify pbase == gbase.

~Michal


