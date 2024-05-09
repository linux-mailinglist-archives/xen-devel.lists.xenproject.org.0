Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC48C0EA8
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 13:05:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719186.1121800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51aE-0002pW-SK; Thu, 09 May 2024 11:05:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719186.1121800; Thu, 09 May 2024 11:05:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51aE-0002nz-PB; Thu, 09 May 2024 11:05:06 +0000
Received: by outflank-mailman (input) for mailman id 719186;
 Thu, 09 May 2024 11:05:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w/8E=MM=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1s51aD-0002mg-Kt
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 11:05:05 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20601.outbound.protection.outlook.com
 [2a01:111:f403:2415::601])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb70cf7f-0df3-11ef-b4bb-af5377834399;
 Thu, 09 May 2024 13:05:03 +0200 (CEST)
Received: from DM5PR07CA0117.namprd07.prod.outlook.com (2603:10b6:4:ae::46) by
 DS7PR12MB8371.namprd12.prod.outlook.com (2603:10b6:8:e9::18) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.42; Thu, 9 May 2024 11:04:59 +0000
Received: from DS1PEPF0001708E.namprd03.prod.outlook.com
 (2603:10b6:4:ae:cafe::ee) by DM5PR07CA0117.outlook.office365.com
 (2603:10b6:4:ae::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.48 via Frontend
 Transport; Thu, 9 May 2024 11:04:59 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708E.mail.protection.outlook.com (10.167.17.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7544.18 via Frontend Transport; Thu, 9 May 2024 11:04:58 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Thu, 9 May
 2024 06:04:58 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Thu, 9 May 2024 06:04:57 -0500
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
X-Inumbo-ID: fb70cf7f-0df3-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFWHu18ARKRHYNQFn+mHirwiJ+wKSZ0wIpItQgFn13fSnwlCJu97CqQWAk+zB5MTVYgInY/G1Mi2Bfz+FyN/yhP2ILIOqsGs+AFWep/yfZdN+SUakvZubMPki1tXMBYzFcGCQJa7yHYD/RqmMOxS0+cBo00mkTgf9Tc0cmFupA9swvkuBTUA4lDBQ7W8Lujuaigk3hrD8iySuSeAzQtTLyWEHqRzHxI3/I+pJd3nhjcnV6ktGZnpQb9atLYzj1B8khkLLpKyHRgvhtEvDJKzf2hSlK5Im+UlohRJFzYd0ZwuKczPsE5ScS0G7ErOE/U50EdGcXbAXylLWWBoCvQejQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58tk2iO5nZkSEk4pdwHDQp+LLGrAotAPa3v3zDIQrG8=;
 b=iL0506ofxRA9GYOmnIuvKsxYAvbQ+RFRR2DIpAayWBalCpXyTQI2JQIEqCSrGa2K3v28Mo4I9eajdeyc+1NJf4PgHX5olfG1cyJpQORw8EI9EuCp+UbPo6sDXqoe0SC90SVLjh4Rmf5a5HWurV1JiTOS1Ob6E8HtvHZ3FkNRpHxnaHK76djaKBkkO/c19/9eAevKazRRo6fhsBnt2Y2C1gPbXsLWXvVWi2eWMcNouwSokCafPKn9oNSWMuIliQ/Kl8SNVgOGgmFjQEctKgF/8MNFSZQlsvwHQ8aK81q31xrI1RlNvjxViSPuSONNVVDbzJIqatExztAPYbNLSEbIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=arm.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58tk2iO5nZkSEk4pdwHDQp+LLGrAotAPa3v3zDIQrG8=;
 b=aWRjUSjo1hzuVT+Z5dt0K35n/stdWE2L4R6Ea/fs7NT+5hhMquGM5n5FaS8i+nAvFS9fg70o6zvOUhOrKXIHJX/ZYY4B5JYErqojE5BmS3Sj4RqXBoQ14QD0eiw2pzURU9f9kyEF1VsrfqmjIXIh1y4JMFnhT7L19tD765KHfwE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <43e6fb55-bab0-4d61-9e18-9aa215157341@amd.com>
Date: Thu, 9 May 2024 13:04:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] xen/arm: Rework heap page allocation outside
 allocate_bank_memory
To: Luca Fancellu <luca.fancellu@arm.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <20240423082532.776623-1-luca.fancellu@arm.com>
 <20240423082532.776623-6-luca.fancellu@arm.com>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <20240423082532.776623-6-luca.fancellu@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708E:EE_|DS7PR12MB8371:EE_
X-MS-Office365-Filtering-Correlation-Id: b55f75bc-336c-4243-5634-08dc7017dde6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZGhydFd0RlNBc2V0SmtaYTJjTG9hdU1OYmp1T0wzcTVPWEVQZnB1aFR2WDE3?=
 =?utf-8?B?TEo4VXhHb0tlR0F0VENmU1dEczFubHo0Tm9XdnVmdmVETmlRRnZ3RFZQM0h4?=
 =?utf-8?B?WGJkcnNxcFBaaWZmM3FQdEtRallFd1l3czQwejRwZ1I5a1ZzZEpHN0ZUZndZ?=
 =?utf-8?B?TWFmdGpQZm04WFZ2WmFhSE9KMTY4OTYrSVB2WmVFT2dLeWFRazdDSGRyNU5V?=
 =?utf-8?B?UWw3Z0FKdVJHb1pKU09UeG1NK1lBNjdEaGg5Vk5aZW1TbHJzNE5QQXY2c2I4?=
 =?utf-8?B?YzQ5Sm5vNE15N2E3ZDUvWUUwVkZUR1ZWL3RpK3lNaklMd1FNV0RJNWJEcEJE?=
 =?utf-8?B?Qng0TjNCOHU2S3hJSUlPdUoxWVlNRDQxT3R6M1gzQTB1M2c1aFNDbW5IS1g3?=
 =?utf-8?B?SWtzYWFMSXJ1aTlwSjJZK3lpcmltZXpsdlo0WVo5TnRnUWlGUmdwK1k1Qmlw?=
 =?utf-8?B?a0ZFMGQwa2JRMmRKa3IvMEFOdkNDVnVpMFJEY0tmbmplS2Nzc1lQWUdqMHQ1?=
 =?utf-8?B?Wjg3djJDT1JEbFNjTWE1Sy94WXlrdTRBbFprVHVNMmV0UnFpb0UzT1dvaWsy?=
 =?utf-8?B?dnc2WTZyOWlxV004ZmhZMlMrUkdQNCtKZVBUcW8xOXpRVVU2V3dYWEZrYndm?=
 =?utf-8?B?ZEZ2d3JXR080cUJQcHJDRDNJZHl4WTE3T0ovOUJ1ZnpSNzBHNTFWcUlWMjJC?=
 =?utf-8?B?NVBYUXRHQ0pjTW1zcmppN3UxQjFsenJWSDI5aGp4MkM3d2JXUmQ0YzBPRDlH?=
 =?utf-8?B?OWJsV3dFaVdpWC9HcDRZOStlS0ZFWXhpSDNiaVFmTjBYWUMrajdzR0M2c1FX?=
 =?utf-8?B?WUd1aXg3OEdzZWVieFVMbkVnS1JwaUNVbGtqNktLT2RGNys3bFdYSXR4Tk9j?=
 =?utf-8?B?d2xjWHJCTzFDdFlMTG9hemUrV2Zid09INCsrVGJ0UnVPM0RKVWwyc0NLbktm?=
 =?utf-8?B?TkFBRVBpVkk0alAyRmlRSTRYSTNOQUtYWk9EajNjeEJYQ3dDQXJSYkZVVnMr?=
 =?utf-8?B?My80QytjQUFjcUVIOEwwbHZWUmxsS3F4NHlBZjlxRXhSWDd2MjBkRHNyUkVn?=
 =?utf-8?B?MU41elZsbVIxVjlEc0o5Y2lIZmpLbHgrbVVlU3NLK014U1NBM09oWVVwWWlG?=
 =?utf-8?B?cDQrNjA2Sm9DWjJNR21hc1UvdEEzdVJWSVJCdVZabUZqY05tcURRaGhOQUV2?=
 =?utf-8?B?NkpuNEk0anhVbUF2a29XOUR3ME51U0JXTU9rUEFsQ2Jqa2ZHYnd4U05vWHpM?=
 =?utf-8?B?ZjREbGJPZ3lxUnU4STRtdUgwN0t1ZjJUekZibTU4VUh6dEtkVFZXM2pwWGps?=
 =?utf-8?B?ZnZITjZ2dHplVmFrNjFySldsRzNoWk9vV0psRjN3R3ZGNDdIRC9XS01iRWtJ?=
 =?utf-8?B?R0krWnBZT0dCMUswY2s3dDJacldLMTltQ3NYRnhnUVVLZFZyUlBLdUhkWUZi?=
 =?utf-8?B?TzhRSHpNTnBRUERqdkFMUENiUllTT3JEaWQ2c3lTMzRMbnRqaGZ5M2VOR2NX?=
 =?utf-8?B?Z3orUG9nZ2VERkZxeHFCRUVtbFZIbjdFUmROS0xJVTZ4bWpJajdKRlIvZzJD?=
 =?utf-8?B?OFVnV0lDQXdKNG53R0Y5azRZNWpROU1kU3Fwcm9qZ0xrNlMzSloxQnN6VzZQ?=
 =?utf-8?B?MnUvNEEwQ3cvNCtqdGpXNXRKbnZnVElrb2EyNnFqMVh6bUNFMk1ZaXg3eUdG?=
 =?utf-8?B?VUtRS2h4YnQySmhTRTg5b3hSZU9SWjM5MmxEM0kvNU02QTV1WXlkRW1GSy9h?=
 =?utf-8?B?SFN1UDNGd2NRTllOMlRQTFhFTTBQdk1tcXhyN2VicHMwbSt5OGI1Nk1ZSzdu?=
 =?utf-8?B?VjU3Yi9WdHFOS2QrVXVZOVpMSVJmRE4vUlNNWnZVL3hEK2hxaGdTaERtbDVt?=
 =?utf-8?Q?AkCCdnd30S3Qj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2024 11:04:58.8249
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b55f75bc-336c-4243-5634-08dc7017dde6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8371

Hi Luca,

On 23/04/2024 10:25, Luca Fancellu wrote:
> 
> 
> The function allocate_bank_memory allocates pages from the heap and
> map them to the guest using guest_physmap_add_page.
s/map/maps

> 
> As a preparation work to support static shared memory bank when the
> host physical address is not provided, Xen needs to allocate memory
> from the heap, so rework allocate_bank_memory moving out the page
> allocation in a new function called allocate_domheap_memory.
> 
> The function allocate_domheap_memory takes a callback function and
> a pointer to some extra information passed to the callback and this
> function will be called for every page allocated, until a defined
for every region given that you pass sgfn and order

> size is reached.
> 
> In order to keep allocate_bank_memory functionality, the callback
> passed to allocate_domheap_memory is a wrapper for
> guest_physmap_add_page.
> 
> Let allocate_domheap_memory be externally visible, in order to use
> it in the future from the static shared memory module.
> 
> Take the opportunity to change the signature of allocate_bank_memory
> and remove the 'struct domain' parameter, which can be retrieved from
> 'struct kernel_info'.
> 
> No functional changes is intended.
> 
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> ---
>  xen/arch/arm/dom0less-build.c           |  4 +-
>  xen/arch/arm/domain_build.c             | 77 +++++++++++++++++--------
>  xen/arch/arm/include/asm/domain_build.h |  9 ++-
>  3 files changed, 62 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 74f053c242f4..20ddf6f8f250 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -60,12 +60,12 @@ static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
> 
>      mem->nr_banks = 0;
>      bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
> -    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
> +    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
>                                 bank_size) )
>          goto fail;
> 
>      bank_size = MIN(GUEST_RAM1_SIZE, kinfo->unassigned_mem);
> -    if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
> +    if ( !allocate_bank_memory(kinfo, gaddr_to_gfn(GUEST_RAM1_BASE),
>                                 bank_size) )
>          goto fail;
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 0784e4c5e315..148db06b8ca3 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -417,26 +417,13 @@ static void __init allocate_memory_11(struct domain *d,
>  }
> 
>  #ifdef CONFIG_DOM0LESS_BOOT
> -bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
> -                                 gfn_t sgfn, paddr_t tot_size)
> +bool __init allocate_domheap_memory(struct domain *d, paddr_t tot_size,
> +                                    alloc_domheap_mem_cb cb, void *extra)
>  {
> -    struct membanks *mem = kernel_info_get_mem(kinfo);
> -    int res;
> +    unsigned int max_order = UINT_MAX;
>      struct page_info *pg;
You can limit the visibility of these variables by moving them into loop

> -    struct membank *bank;
> -    unsigned int max_order = ~0;
> 
> -    /*
> -     * allocate_bank_memory can be called with a tot_size of zero for
> -     * the second memory bank. It is not an error and we can safely
> -     * avoid creating a zero-size memory bank.
> -     */
> -    if ( tot_size == 0 )
> -        return true;
> -
> -    bank = &mem->bank[mem->nr_banks];
> -    bank->start = gfn_to_gaddr(sgfn);
> -    bank->size = tot_size;
> +    BUG_ON(!cb);
No need for that

> 
>      while ( tot_size > 0 )
>      {
> @@ -463,17 +450,61 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
>              continue;
>          }
> 
> -        res = guest_physmap_add_page(d, sgfn, page_to_mfn(pg), order);
> -        if ( res )
> -        {
> -            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
> +        if ( cb(d, pg, order, extra) )
>              return false;
> -        }
> 
> -        sgfn = gfn_add(sgfn, 1UL << order);
>          tot_size -= (1ULL << (PAGE_SHIFT + order));
>      }
> 
> +    return true;
> +}
> +
> +static int __init guest_map_pages(struct domain *d, struct page_info *pg,
Does it make sense to return int if it is not taken into account by the user?

> +                                  unsigned int order, void *extra)
> +{
> +    gfn_t *sgfn = (gfn_t *)extra;
> +    int res;
> +
> +    BUG_ON(!sgfn);
> +    res = guest_physmap_add_page(d, *sgfn, page_to_mfn(pg), order);
> +    if ( res )
> +    {
> +        dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
> +        return res;
> +    }
> +
> +    *sgfn = gfn_add(*sgfn, 1UL << order);
> +
> +    return 0;
> +}
> +
> +bool __init allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> +                                 paddr_t tot_size)
> +{
> +    struct membanks *mem = kernel_info_get_mem(kinfo);
> +    struct domain *d = kinfo->d;
> +    struct membank *bank;
> +
> +    /*
> +     * allocate_bank_memory can be called with a tot_size of zero for
> +     * the second memory bank. It is not an error and we can safely
> +     * avoid creating a zero-size memory bank.
> +     */
> +    if ( tot_size == 0 )
> +        return true;
> +
> +    bank = &mem->bank[mem->nr_banks];
> +    bank->start = gfn_to_gaddr(sgfn);
> +    bank->size = tot_size;
> +
> +    /*
> +     * Allocate pages from the heap until tot_size and map them to the guest
until tot_size is 0

> +     * using guest_map_pages, passing the starting gfn as extra parameter for
> +     * the map operation.
> +     */
> +    if ( !allocate_domheap_memory(d, tot_size, guest_map_pages, &sgfn) )
> +        return false;
> +
>      mem->nr_banks++;
>      kinfo->unassigned_mem -= bank->size;
> 
> diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
> index 45936212ca21..9eeb5839f6ed 100644
> --- a/xen/arch/arm/include/asm/domain_build.h
> +++ b/xen/arch/arm/include/asm/domain_build.h
> @@ -5,9 +5,12 @@
>  #include <asm/kernel.h>
> 
>  typedef __be32 gic_interrupt_t[3];
> -
> -bool allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
> -                          gfn_t sgfn, paddr_t tot_size);
> +typedef int (*alloc_domheap_mem_cb)(struct domain *d, struct page_info *pg,
> +                                    unsigned int order, void *extra);
> +bool allocate_domheap_memory(struct domain *d, paddr_t tot_size,
> +                             alloc_domheap_mem_cb cb, void *extra);
> +bool allocate_bank_memory(struct kernel_info *kinfo, gfn_t sgfn,
> +                          paddr_t tot_size);
>  int construct_domain(struct domain *d, struct kernel_info *kinfo);
>  int domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit);
>  int make_chosen_node(const struct kernel_info *kinfo);
> --
> 2.34.1
> 

~Michal

