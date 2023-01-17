Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD27866DA4D
	for <lists+xen-devel@lfdr.de>; Tue, 17 Jan 2023 10:49:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.479275.743020 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiak-0006yT-6E; Tue, 17 Jan 2023 09:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 479275.743020; Tue, 17 Jan 2023 09:49:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pHiak-0006wL-3P; Tue, 17 Jan 2023 09:49:18 +0000
Received: by outflank-mailman (input) for mailman id 479275;
 Tue, 17 Jan 2023 09:49:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pwid=5O=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1pHiai-0006wF-3y
 for xen-devel@lists.xenproject.org; Tue, 17 Jan 2023 09:49:16 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3225820d-964c-11ed-b8d0-410ff93cb8f0;
 Tue, 17 Jan 2023 10:49:12 +0100 (CET)
Received: from MW4PR03CA0053.namprd03.prod.outlook.com (2603:10b6:303:8e::28)
 by MN2PR12MB4472.namprd12.prod.outlook.com (2603:10b6:208:267::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Tue, 17 Jan
 2023 09:49:10 +0000
Received: from CO1PEPF00001A5E.namprd05.prod.outlook.com
 (2603:10b6:303:8e:cafe::5f) by MW4PR03CA0053.outlook.office365.com
 (2603:10b6:303:8e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Tue, 17 Jan 2023 09:49:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF00001A5E.mail.protection.outlook.com (10.167.241.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6002.11 via Frontend Transport; Tue, 17 Jan 2023 09:49:07 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 03:49:05 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 17 Jan
 2023 03:49:05 -0600
Received: from [10.71.193.39] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 17 Jan 2023 03:49:03 -0600
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
X-Inumbo-ID: 3225820d-964c-11ed-b8d0-410ff93cb8f0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I/IQDOWCFra+DCfOd/djXhk3sPu1QQjo9omv6Wi3O02mOxGNfEnwv0fo927gY9Bjz9x/pUClvP2aLl4n5FGUceNqgrcmsFqL12e2MN/J/TIhgKXunK7+lfmSCQnMR0d4j0yFP/ryZnm0Q02lxqYYcVRB6xRlY/mZwbEUUuMijqk4/HCNwTDP8dKVgQO/R05ut9QDM5FtZmuuViqM30Ez8E6GWvz7/Q56Lp0k6o5gp0QFYvwmgbnzBFfVnYfSNjio4FA3oE54pmwrTjlL6Pq7tIojfwTlQikB/DvKNk8ocHT9iSYxw+qOuDvifCnkX4RAoJGlpV1OSqrWSgSI5VKCYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cuAwr511feybCwgNoTeux5EWB6I1zFbkf7avC719RE=;
 b=oBuJYu9mjs6GbHjpvNyLxZS3RXEqL+pnUWw8tQJ4l1WFLTyeTSDcv+ff6CuCkXVXL/15dWwMJ9GTGgQ0oY+E7xEv/xMbw8wUduVHdb8ail4xcNzDPowC5/7ufpbHCW/abTCEwQbhU/9wsFtOewZejSMc5Tklr69i1a3fGcgPVR2Ant/BtvJvAXisp/c8c2Pv6FS9lZcqvfC+sYk9B8Qngvnrz/2pw4V+baUcPktSyGPsYvpvkfoiUp/pEl5/UiepbUZLkYNX6npZMuRVfzZ6dEZKvki5Y0pA8UBGOqh5Je0mzuhJ21MfoWVMR4hKV42lFa08uccH9Uq5R3XW3ogVpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cuAwr511feybCwgNoTeux5EWB6I1zFbkf7avC719RE=;
 b=AAU4oMF0QNlMtC6Zvv+ccQfqzVToeZN3KMVXVdtBgDYa+n+YWXOKf6Qvgx4OdcHQCW4eLeDWyM8tHNHCDD5lnyJYWAP+58R1YTVAGIyJSywRia405oWYr7frrY8WYhZINiQAjPVywQ4USODozmKCUYfUOQNBp5zVmBP8zOU419M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <001fe638-1bd8-5624-499e-8f1690cb33c0@amd.com>
Date: Tue, 17 Jan 2023 10:49:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] xen/arm: Harden setup_frametable_mappings
Content-Language: en-US
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230116144106.12544-1-michal.orzel@amd.com>
 <2a679d99-4ed4-4fe8-8aee-faee57b5007b@xen.org>
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <2a679d99-4ed4-4fe8-8aee-faee57b5007b@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF00001A5E:EE_|MN2PR12MB4472:EE_
X-MS-Office365-Filtering-Correlation-Id: 391db344-c032-4fa8-3b75-08daf87013e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bqjBeXUJY5wZDMoONguHWVsYSh5B4n4mak/hoYOrVLb4IvctbaRpqEJcBjlPjdn/uIaSr6on/95ZEJ+Ko+at27xRArF1MzSTMdLvbLeOVNOquILB1QtyGKrp9ViURKSqG8/fEmZRS7QZ1ZqpgIMKhnfQEmXCA4wIC7StyrEOknxsfBq/PJ1ofBhFKD0mN2VCMaQ++kRmFZbI0o5CVRvvAQ3lrFvD+mOrkj0N2S/GcTkuErhHmW/T2GTH8RZNPyWzdYGPcrGG2S3LYyN7bxMrm55J2hijbYB88OJY6Eg7iwMB3lyvUw9Ft77V3XTU/3IVT1t4QlOTNwqYgM+3CxGJvLUpsV/v1EvdzqfKhJTO1/l+O1QKKIPkBbmqICHXZ4g9/pe2g/95437dBYadiebkjEjltdTE8gdN2rJubi74GudH/l3h70VFFTjn0FXDiMs0wOaOs8kQ4xS7OIxEvhI/PCqEnq8S9PDcC1JXBp8tvBUL284BM+tTB8vEC9B3i4q7JjBifwLEfVaFA9uiKVrEC7TabHonGEoXI16HTz9Dn0DUIpHfv0TCpTWWx9aeRq+lu+M74CaFU886dfYFO1TzwOa6BEbNURANcd6hucuGQ4qtFjqu24/BIGoDyeTJxpUInPw8TGUPmwy+E2Gb8+6YID+AzPVlrIBtEecxqLQdBlZ1yvMvHG/LKwGzTtOVjzCq9PtIvqLhO5tRKjgmrwB7ANyTRvHeFzKnoA6mgHLzsVHjtNCjvMFMpSON0Jrplq+6MQOw2vJpcs3Z5d4d+410LQ==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(82740400003)(36860700001)(16576012)(82310400005)(31696002)(86362001)(40480700001)(54906003)(40460700003)(41300700001)(110136005)(4326008)(70206006)(83380400001)(8676002)(70586007)(316002)(2906002)(44832011)(8936002)(186003)(336012)(47076005)(478600001)(426003)(2616005)(26005)(5660300002)(53546011)(31686004)(81166007)(356005)(36756003)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2023 09:49:07.8533
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 391db344-c032-4fa8-3b75-08daf87013e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00001A5E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4472

Hi Julien,

On 17/01/2023 10:29, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 16/01/2023 14:41, Michal Orzel wrote:
>> The amount of supported physical memory depends on the frametable size
>> and the number of struct page_info entries that can fit into it. Define
>> a macro PAGE_INFO_SIZE to store the current size of the struct page_info
>> (i.e. 56B for arm64 and 32B for arm32) and add a sanity check in
>> setup_frametable_mappings to be notified whenever the size of the
>> structure changes. Also call a panic if the calculated frametable_size
>> exceeds the limit defined by FRAMETABLE_SIZE macro.
>>
>> Update the comments regarding the frametable in asm/config.h and take
>> the opportunity to remove unused macro FRAMETABLE_VIRT_END on arm32.
>>
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>>   xen/arch/arm/include/asm/config.h |  5 ++---
>>   xen/arch/arm/include/asm/mm.h     | 11 +++++++++++
>>   xen/arch/arm/mm.c                 |  5 +++++
>>   3 files changed, 18 insertions(+), 3 deletions(-)
>>
>> diff --git a/xen/arch/arm/include/asm/config.h b/xen/arch/arm/include/asm/config.h
>> index 16213c8b677f..d8f99776986f 100644
>> --- a/xen/arch/arm/include/asm/config.h
>> +++ b/xen/arch/arm/include/asm/config.h
>> @@ -82,7 +82,7 @@
>>    * ARM32 layout:
>>    *   0  -  12M   <COMMON>
>>    *
>> - *  32M - 128M   Frametable: 24 bytes per page for 16GB of RAM
>> + *  32M - 128M   Frametable: 32 bytes per page for 12GB of RAM
>>    * 256M -   1G   VMAP: ioremap and early_ioremap use this virtual address
>>    *                    space
>>    *
>> @@ -95,7 +95,7 @@
>>    *
>>    *   1G -   2G   VMAP: ioremap and early_ioremap
>>    *
>> - *  32G -  64G   Frametable: 24 bytes per page for 5.3TB of RAM
>> + *  32G -  64G   Frametable: 56 bytes per page for 2TB of RAM
>>    *
>>    * 0x0000008000000000 - 0x00007fffffffffff (127.5TB, L0 slots [1..255])
>>    *  Unused
>> @@ -127,7 +127,6 @@
>>   #define FRAMETABLE_VIRT_START  _AT(vaddr_t,0x02000000)
>>   #define FRAMETABLE_SIZE        MB(128-32)
>>   #define FRAMETABLE_NR          (FRAMETABLE_SIZE / sizeof(*frame_table))
>> -#define FRAMETABLE_VIRT_END    (FRAMETABLE_VIRT_START + FRAMETABLE_SIZE - 1)
> 
> This is somewhat unrelated to the goal of the patch. We do clean-up in
> the same patch, but they tend to be in the same of already modified hunk
> (which is not the case here).
> 
> So I would prefer if this is split. This would make this patch a
> potential candidate for backport.
Just for clarity. Do you mean to separate all the config.h changes or only
the FRAMETABLE_VIRT_END removal? I guess the former.

> 
>>
>>   #define VMAP_VIRT_START        _AT(vaddr_t,0x10000000)
>>   #define VMAP_VIRT_SIZE         _AT(vaddr_t, GB(1) - MB(256))
>> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
>> index 68adcac9fa8d..23dec574eb31 100644
>> --- a/xen/arch/arm/include/asm/mm.h
>> +++ b/xen/arch/arm/include/asm/mm.h
>> @@ -26,6 +26,17 @@
>>    */
>>   #define PFN_ORDER(_pfn) ((_pfn)->v.free.order)
>>
>> +/*
>> + * The size of struct page_info impacts the number of entries that can fit
>> + * into the frametable area and thus it affects the amount of physical memory
>> + * we claim to support. Define PAGE_INFO_SIZE to be used for sanity checking.
>> +*/
>> +#ifdef CONFIG_ARM_64
>> +#define PAGE_INFO_SIZE 56
>> +#else
>> +#define PAGE_INFO_SIZE 32
>> +#endif
>> +
>>   struct page_info
>>   {
>>       /* Each frame can be threaded onto a doubly-linked list. */
>> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
>> index 0fc6f2992dd1..a8c28fa5b768 100644
>> --- a/xen/arch/arm/mm.c
>> +++ b/xen/arch/arm/mm.c
>> @@ -676,6 +676,11 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
>>       const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
>>       int rc;
>>
>> +    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
>> +
>> +    if ( frametable_size > FRAMETABLE_SIZE )
>> +        panic("RAM size is too big to fit in a frametable area\n");
> 
> This is not correct. Depending on the PDX compression, the frametable
> may end up to cover non-RAM. So I would write:
> 
> "The cannot frametable cannot cover the physical region 0x%PRIpaddr -
> 0x%PRIpaddr".
Yes, you're right.

> 
>> +
>>       frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
>>       /* Round up to 2M or 32M boundary, as appropriate. */
>>       frametable_size = ROUNDUP(frametable_size, mapping_size);
> 
> Cheers,
> 
> --
> Julien Grall

~Michal


