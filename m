Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52802A77C13
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 15:30:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.934353.1336082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbgV-0007Eo-HY; Tue, 01 Apr 2025 13:29:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 934353.1336082; Tue, 01 Apr 2025 13:29:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzbgV-0007DK-EL; Tue, 01 Apr 2025 13:29:43 +0000
Received: by outflank-mailman (input) for mailman id 934353;
 Tue, 01 Apr 2025 13:29:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=neKF=WT=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1tzbgU-0007DA-H4
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 13:29:42 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:200a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c28d615-0efd-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 15:29:40 +0200 (CEST)
Received: from BL1PR13CA0116.namprd13.prod.outlook.com (2603:10b6:208:2b9::31)
 by CH1PPF4C9628624.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::60d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Tue, 1 Apr
 2025 13:29:34 +0000
Received: from BL6PEPF0001AB72.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::f3) by BL1PR13CA0116.outlook.office365.com
 (2603:10b6:208:2b9::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.24 via Frontend Transport; Tue,
 1 Apr 2025 13:29:34 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB72.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 1 Apr 2025 13:29:34 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 08:29:34 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 1 Apr
 2025 08:29:33 -0500
Received: from [172.29.45.113] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 1 Apr 2025 08:29:33 -0500
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
X-Inumbo-ID: 5c28d615-0efd-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0ZsoPe1Jl3BzsVrw7aqxBsiKiIVea8zYMevcABAN6yoFZ1bJd6LW1VPzvAlo1JMeLA1acW+3OOnZ02qLkQMOcsRxvb93vlOGzNS9RGRuIfs+Wcp+PeY6BkwPty1hHDmszywvP1yuyP04w35gDIlxwAe5eTV4zPdNYqCOmJ8mKk8xP0p2xzlM6ahPXRp+akt2Og8RWZn5mctbrlf3MqTgIFI7LuYkQeJeaCSRiXw12mOArsWeow5GqFvisklj8loxXgsklL/aOkTVO29Qm0H5w7TIe2hKZKZ6vFsd5D9ft5Ulzd88Km23GnPYSUfZEGD6QLysCggpCc6LoAnuxJA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vLMzIdnhM/XKumo1BdHqwMW0a8QccBItyEYyTYz+sQk=;
 b=eVNov9neuAEKvB89N7wEP6EsSs98XcBtrmOm3U1eRmroodcBvLIn5B9Fg/dNGfJNsCREvxviz2S540t3mbs6uwGmRuH6tLxg7G422syplJGmqWQ+9eK23IN+1/JNQRAeUip9PJb9Zq2kgwhtVnjbUDOz4Yiuyb7g1bUGNviUlQit7+DkzewrZEZp15+pur4tiTm9nB6kNbjT4DcrLrhewdqfmyP64C/qNT3ZgFQT56OAnn4IAnsW/eIT1OSV+Bepoqze/Nrry2qNMXaMWYYw3BqMjfbI6Uk6L4hZVrv88QA/Fx87+qzBSs2u//5uhIYV4mSxvYM3W/S65WQq0aaKyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=suse.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vLMzIdnhM/XKumo1BdHqwMW0a8QccBItyEYyTYz+sQk=;
 b=luoiqQ5D7iIqIGqcwBXtpODWlNbkVN25qL5YwzlNOHCdS7zo/WcJRafZf/dd6HGy/q8H8Bld61MsxDxNj4q3gM+h3ZdlpXpJeM0ooTO1xLUk4uI3Tm3GezVirlPqhOXnJbvz63diHAD5gWBx4QoSyUjH7aur4gz8mRsQ+p3gm88=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <1f685c7c-0b63-4051-ad6c-003b262c4315@amd.com>
Date: Tue, 1 Apr 2025 09:29:29 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] xen/arm: dom0less seed xenstore grant table entry
To: Jan Beulich <jbeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal Orzel
	<michal.orzel@amd.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
	<roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>, Juergen Gross
	<jgross@suse.com>
References: <20250331214321.205331-1-jason.andryuk@amd.com>
 <20250331214321.205331-5-jason.andryuk@amd.com>
 <6765d129-66dc-48d9-aaac-2b973edfda80@suse.com>
Content-Language: en-US
From: Jason Andryuk <jason.andryuk@amd.com>
In-Reply-To: <6765d129-66dc-48d9-aaac-2b973edfda80@suse.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: jason.andryuk@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB72:EE_|CH1PPF4C9628624:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a4a5ca-6f17-4dc4-dcff-08dd71213e02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|7416014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVJkVjZKVFN2U1pOY1pQVHNZM3B6UDI1VTVLcXNNdGNKN0tsMUlNQkEzeHY0?=
 =?utf-8?B?UmloaWZhYlNvVnYxOTh3TTFQYldSb2tpUGxDcGl5SWh4R3cwNWFabmpZZWVq?=
 =?utf-8?B?S2lDbDhWd1pTUHVnRXVGd2sxUCtZNHN1YUVFM1BBUHFuWFFMVkxFNHZRL09v?=
 =?utf-8?B?WTRlcklyYlE3SkJOTWhZMVM4d0FsMDlnK0I1SjVONk5BcFpaMElYWG15cTlY?=
 =?utf-8?B?ZXFHT1AwZEoyclpYUHdxKzF3Mi9JM3p1dEdZV3cxUFU3SmxGalZJZnFLOXZY?=
 =?utf-8?B?Vkk2a3VQTy9mU2xQdUJHNHhCUHN2QitHZUJCQ2N0ei91NDlYZllwT0RDYVZ0?=
 =?utf-8?B?Z2lGZHQyUm9CZEUwTW5ldi9IY3Nnd3U1Rk9CQmo2SDR6dEU2cVZiVGZNS253?=
 =?utf-8?B?ZWlWNWtGNUFJb3Joa25TWGdlbVZvcjI2ZWxzVzhmK2FqRnd0cUcxbW9BYlJ5?=
 =?utf-8?B?aE1JQU1Mc1JGQVBSdW40ZjVZT3lrU3dENkpkU05McldVdDR5N1p4OFZMNnRX?=
 =?utf-8?B?QTI3OGdXelN5V1BaMi95T1hyUGJnUXJPVzRQWnhuNkRScUNCczdtNEM5M2kw?=
 =?utf-8?B?THZrVExELyttNzZtMDhHV2Z1dXlxdDJSTGducW9QNmNwYk10dEt4SGZVWkNo?=
 =?utf-8?B?Y2VVZU1kUW1rUGMyYzY5Mmh2NEJEaGNyMDlrYXJkT3pScEVpY3p6ajZYR2h0?=
 =?utf-8?B?cjN0RFlwRnlFOGk5bE1mcm5BMTVDMTdsRmt2YWlqV0pYbjY0bzlzRVdGZXlR?=
 =?utf-8?B?akFyUXRjYlhlWlQ1Ymd2SHA1aUJ3cDBjYUJuVDFEaEF1M01aT09MNzNsVXVL?=
 =?utf-8?B?RmtJcTlpelpUdi9ZSUYxUVRTSnozaWNGQjgzSUpFOHBGVCt2UDRLSjc5ZWtS?=
 =?utf-8?B?VHp3c2tEbmV6SW8rUlRmVVZDSTU3TDIxK3lIbXZqU3JZTDNySzNXYTc1cGx6?=
 =?utf-8?B?VlAyWU1YM2FrbVFSMHFzaHA5NURvLzJ5b1hsTjV0K0lmVXpHZE4xTjRONDVk?=
 =?utf-8?B?czFKbytWOVBlMXVEcXlGSlVVanZBbE5WUW13U0RFYzFFNm9PcU9Jb2hXMG1m?=
 =?utf-8?B?NnRCRmZraGRwOXU4Z0Z4MW5yaGMxdWQ3RnVkU2JuZU1jYkVWcUk4UTFNdVpl?=
 =?utf-8?B?Wko3cy9tTE1ybGtaMFVCLzZUUG9wTklibFRHQVNhRDQ0SXhIZnZhTk5sY0lZ?=
 =?utf-8?B?M05EUTE5a2JIOHVBUkVrZFc3Uzd4ZnRVcVRCTVFnRlNudURlR3AyYVVYcXU0?=
 =?utf-8?B?Q2NVVVlqY0NzOG1RdGdIQncwZEpvQlFEVXpNRkVycDZnWGdRNlBhWTcwaVJv?=
 =?utf-8?B?UHZzQ2hzd0Fuc3NFTzdXQlRWSm80TGkxMENvOW0weURURVR4a0hEd1c0eW52?=
 =?utf-8?B?bzdDbUdGcDdCVlJFZW5UaWd1di9BM29PUk0xa2FQSThFNGxDaFc5eWQ2dzFa?=
 =?utf-8?B?SWZ5TG1pSnNoQzNmWWNUdlltUXpPOXdRME1oaXRlUktsdldEa2ltYmhWWXp6?=
 =?utf-8?B?ZmdpYVFYVjI0a3VsejZQemR1MU1mcExQU1c3Mkx1RzFWdnd0Q1JGQTc3aWV6?=
 =?utf-8?B?SVk2aFlRMEpRWHRwTUpxdWlQSFJ5M3ozWWRGb1JPRVZXUEFmMEtQRnpkTldW?=
 =?utf-8?B?blR1ZHBxcmhnVkdhbUFiRnphbFRJS0RmUnMvWWxmQU1ZazlFVkpxd0N1SFE1?=
 =?utf-8?B?NnNSaXd3UXltTFl0Umt2Sk11bmlMbWFadCtVaWU4b2dPVnFzU2JxY2FReDNj?=
 =?utf-8?B?UzFxRHhxYS9pcjdpcHlXVHNMY042T0lMUEFGeitXVjZObDI5QTdNNlYrVFk0?=
 =?utf-8?B?TDRqN01OZytmc1JJWDZVUWxOWVZQK1ZHRExCVkJZS2NLZ3JxMEFWTlM5V0hk?=
 =?utf-8?B?cHJYK3JzZzZZaGRsNDJWUXp4MzJuczRMYzhHZ1V1Q0o5WWhORTBxSG1kWkdZ?=
 =?utf-8?B?a0dTeSthQU5oUWlGdklJc3NFd042L05teWUxM2FuZ1Irb3VENzZ2VzVnL2RQ?=
 =?utf-8?Q?MpKRNEAtLUuDB+7wfhQykdeWVUEKLg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 13:29:34.4244
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a4a5ca-6f17-4dc4-dcff-08dd71213e02
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB72.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF4C9628624

On 2025-04-01 08:16, Jan Beulich wrote:
> On 31.03.2025 23:43, Jason Andryuk wrote:
>> xenstored maps other domains' xenstore pages.  Currently this relies on
>> init-dom0less or xl to seed the grants from Dom0.  With split
>> hardware/control/xenstore domains, this is problematic since we don't
>> want the hardware domain to be able to map other domains' resources
>> without their permission.  Instead have the hypervisor seed the grant
>> table entry for every dom0less domain.  The grant is then accessible as
>> normal.
> 
> Yet aiui the original idea was to specifically not do this in the hypervisor.
> I agree it shouldn't be the hardware domain, but what's wrong with having the
> control domain do that? It is what is responsible for creating new domains as
> well. The question of where to do that when there's no control domain must
> also have been solved already (without me knowing the answer), as that's
> where init-dom0less must be running.

dom0less does not allow configuring a domU to have xenstore without 
using dom0 today.  This series changes the dependency to the xenstore 
domain.

I want to move away from relying on the control domain to set up 
xenstore connections.  Domain boot can achieve more parallelism if 
xenstore domain can independently configure its connections.  If 
xenstore connections need to wait until dom0/control userspace runs, 
that is a measurable delay.

 From the permission side, with a preseeded grant, and the event channel 
places in the xenstore_domain_interface page, a xenstore domain can 
connect and introduce existing domains when it starts up without needing 
additional permissions.

Generally, I'm looking at making xenstored perform more configuration on 
its own.  It doesn't matter for dom0, but it will help for 
dom0less/Hyperlaunch.  Seeding grants from the hypervisor is a small 
change, but it helps remove dependencies for xenstore.

>> This works with C xenstored.  OCaml xenstored does not use grants and
>> would fail to foreign map the page.
> 
>  From the sentence it's not clear whether this is unchanged behavior or
> a deliberate regression.

I was trying to highlight existing compatibility.  xenstored uses 
grants, so it can take advantage of the pre-seeded grant and therefore 
does not need privilege to map foreign pages.  OCaml does not use 
grants, so this seeding is irrelevant.  With a combined 
hardware|xenstore domain, C xenstored using grants works, but Ocaml does 
not.

>> --- a/xen/arch/arm/dom0less-build.c
>> +++ b/xen/arch/arm/dom0less-build.c
>> @@ -865,6 +865,10 @@ static void __init initialize_domU_xenstore(void)
>>           rc = alloc_xenstore_evtchn(d);
>>           if ( rc < 0 )
>>               panic("%pd: Failed to allocate xenstore_evtchn\n", d);
>> +
>> +        if ( gfn != ~0ULL )
> 
> Is this an odd open-coding of INVALID_GFN? And even if not - why ULL when
> "gfn" is unsigned long? The way you have it the condition will always be
> false on Arm32, if I'm not mistaken.

I'll have to double check that.  Thanks.

>> --- a/xen/common/grant_table.c
>> +++ b/xen/common/grant_table.c
>> @@ -4346,6 +4346,21 @@ static void gnttab_usage_print(struct domain *rd)
>>           printk("no active grant table entries\n");
>>   }
>>   
>> +#ifdef CONFIG_DOM0LESS_BOOT
>> +void __init gnttab_seed_entry(const struct domain *d, unsigned int idx,
>> +                              domid_t be_domid, uint64_t frame,
>> +                              unsigned int flags)
>> +{
>> +    const struct grant_table *gt = d->grant_table;
>> +
>> +    ASSERT(!d->creation_finished);
> 
> While I don't mind the assertion, it's a little funny to see such in an
> __init function.

This check was added in response to v1 comment.  Yes, I too considered 
just relying on __init, but the ASSERT explicitly checks the desired 
property holds.

>> +    ASSERT(gt->gt_version == 1);
>> +    shared_entry_v1(gt, idx).flags = flags;
> 
> Does this really need to be a function parameter? The sole caller passes
> a constant (GTF_permit_access).

I suppose it could be dropped.  The toolstack side passes flags, which I 
mirrored when writing this.

>> --- a/xen/include/xen/grant_table.h
>> +++ b/xen/include/xen/grant_table.h
>> @@ -45,6 +45,11 @@ void grant_table_destroy(
>>       struct domain *d);
>>   void grant_table_init_vcpu(struct vcpu *v);
>>   
>> +/* Seed a gnttab entry for Hyperlaunch/dom0less. */
>> +void __init gnttab_seed_entry(const struct domain *d, unsigned int idx,
> 
> No __init on declarations please. They have no effect (as long as the definition
> properly has the attribute) and hence are only at risk of going stale.

Oh, okay.  I thought they were necessary, but clear I am wrong.

Thanks,
Jason

