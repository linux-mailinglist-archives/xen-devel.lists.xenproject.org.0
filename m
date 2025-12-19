Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DB4BCCEF29
	for <lists+xen-devel@lfdr.de>; Fri, 19 Dec 2025 09:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1190494.1510929 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWVkv-0000qj-6a; Fri, 19 Dec 2025 08:22:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1190494.1510929; Fri, 19 Dec 2025 08:22:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vWVkv-0000oZ-3B; Fri, 19 Dec 2025 08:22:33 +0000
Received: by outflank-mailman (input) for mailman id 1190494;
 Fri, 19 Dec 2025 08:22:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=idmm=6Z=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vWVku-0000Vn-7j
 for xen-devel@lists.xenproject.org; Fri, 19 Dec 2025 08:22:32 +0000
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170100005.outbound.protection.outlook.com
 [2a01:111:f403:c112::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d9be8cb6-dcb3-11f0-9cce-f158ae23cfc8;
 Fri, 19 Dec 2025 09:22:27 +0100 (CET)
Received: from MW4PR03CA0060.namprd03.prod.outlook.com (2603:10b6:303:8e::35)
 by SJ0PR12MB6831.namprd12.prod.outlook.com (2603:10b6:a03:47d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 08:22:22 +0000
Received: from CO1PEPF000042A7.namprd03.prod.outlook.com
 (2603:10b6:303:8e:cafe::fa) by MW4PR03CA0060.outlook.office365.com
 (2603:10b6:303:8e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Fri,
 19 Dec 2025 08:22:21 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000042A7.mail.protection.outlook.com (10.167.243.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 08:22:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 02:22:21 -0600
Received: from [10.252.147.171] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 19 Dec 2025 02:22:19 -0600
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
X-Inumbo-ID: d9be8cb6-dcb3-11f0-9cce-f158ae23cfc8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FbPumLChOSrn658q/E+gvS9PfdcacOnrM+yXzWp+vmWYzoG8Sqa4AWrz/QsXPKH6o+ZGF3KtyCRlboRP5fTiBPdFoBXGlgVjdRXPIiSBILiF3359y9A8Jnf3YsFsZlMcYbzkgqid4FNtUh0q/bOVSq44KsiPPtHSrx1/mCIyHb0kPpXonsg0jEtt9B7EWy168gXP76talJ4p/ivlrpvSjB925ABwdd/O3qprFLFPyOIkNth+hyn0e+AdXCu7QB3hN/wK3PC+UvGjKvEVvELmIm5UI1LTBV7VJA4rcb+A0ge+9VnIu4Iw0RaCLCd2ZyMr1D/47z110/PpuuIfo1vvxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9UnFy5KwesNcy7PIsyc/HqjEchhxWubsnRj55onrPQ=;
 b=v0RpYXuTOUgpstlAWclEZ0fbmGx6vlB6HgwSxdp8jFhaHRIDnr5W3KtfP+aWlcZceVpTwJpV8ZmYh81QljJrr03/n6cIAgY/OxQvgZARW5oD7MJeCyZA0wYLjqglHSPd7z84Kp1QSHjThqhfh3XZqYb8VvqW/rXaQNXe837Il/K7Mytme+DRQAQnitVV6/lZLLDgp9WXWvop7HG1wqrcpjnr3IcQsSnKa+D7qSYxnXJYwLukNHmVKzM8viRNpSPWZA3E0+m5hsOYmvuWpd9tBn+sX2BZ3aFubnsxr32S7NEzjzbGjKZM/ZL61c6BKn2uhFKEy/qQnzemmiIJi3VQSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=citrix.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9UnFy5KwesNcy7PIsyc/HqjEchhxWubsnRj55onrPQ=;
 b=CpeekxkTIdqeSiCd7b8cCE4jJl3/sKZgkfGNEzKwuP5AdUSePFqOpvueeLKr6DZTr0Nsif+MEvak0/cBNvmj+dkTl4w9f8QQnmISguyzyvr3Fjlq263hMPHVPPqJ1sQJb4OpRDY8+mbDoQlr8oSu22YV6OMeVsC9wiz8jcGzX7s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Message-ID: <a59fdb5d-0c7e-4303-bb1f-fa47ebfcd163@amd.com>
Date: Fri, 19 Dec 2025 09:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] xen/arm: drop MAX_PAGES_PER_VCPU
To: Andrew Cooper <andrew.cooper3@citrix.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1766053253.git.oleksii.kurochko@gmail.com>
 <74f1594aad235765002b59f2baa975cc8fe72f06.1766053253.git.oleksii.kurochko@gmail.com>
 <acbc46e0-e102-41cc-ace1-578a20644b34@citrix.com>
From: "Orzel, Michal" <michal.orzel@amd.com>
Content-Language: en-US
In-Reply-To: <acbc46e0-e102-41cc-ace1-578a20644b34@citrix.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000042A7:EE_|SJ0PR12MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 649e6213-eae8-4260-eae3-08de3ed7bb74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dDlxTWxnM21nWUdRRjBSUXRLRjJBVDFUTHc2VXNveGwzNXJRWEJYajFraHFR?=
 =?utf-8?B?OEhCdzVrMFZMd1NFSlR4ZVBnM0xJOG1IeUZRRUVCZk50dGtsR2NBRXFIL29Z?=
 =?utf-8?B?Y0s4QmZYT3duL3VsSzZvOGlFTW0vT2wwOCt1TFNybmcyOGNkUHNlRXhMcnlQ?=
 =?utf-8?B?R1hoaEZQOXlxT2Q5UCtVU0hmTXNhbWE3dmdWZnh5VTFCZjFqNXVONGNYK3B1?=
 =?utf-8?B?cVl0alI3YkZ1OW5GQ2RHV3JLbWQ0Rk82SDY4b0lpV2dQc3ZEOEY5T280Yk5s?=
 =?utf-8?B?K09PTEFLd1ZPdzVRdlh1SGpqdXVWZThmNTV4SExPNkdqek11MkJsSThzNERT?=
 =?utf-8?B?bjJGMXFnT0hHOE4zVzVmZmNXZkdsY0lWNlRnWDBHYW5sTVFjbUZqbTladFlL?=
 =?utf-8?B?TmNTeVVkcElnMWs2YWxpK0ZnUFg5R1plK01ENDVYY3dBQW5YTVNmbE1DV2o2?=
 =?utf-8?B?dmFucTJURm4rTFdiU1FOT0NGV3dCM0lUUWNjYzBwYnlRcnZ6RDRZVHNCcjdz?=
 =?utf-8?B?aEVtV2I2VGdzTjRUOS90ajY4cmtoMmdRSGQ3d3RYOTNwaml0aEd4Wk9VYkd0?=
 =?utf-8?B?cHBiZWlzSXFDU0ovUmxKcmdmQk0rRDFrdzF4czNEY0IxNXVicXRwK01pR2Iv?=
 =?utf-8?B?dm9tdTJQN3cwd1ZCeGJXUnRYY1l3bmZ3a2FEejFaV0lCbVVmbGJQbm5ETXU1?=
 =?utf-8?B?elhkeVI0SGlHdXhNTmpQdUkvSmJtUWp2SFYvNEZwTUhObkNSdGxRdWdnQTFo?=
 =?utf-8?B?c243dVJoSm1xaEZlWE9UM1hybEVLT2NWdFV6a3ZnM3NaTGlBbUZlc2VURVJN?=
 =?utf-8?B?Q01RSU50L0p2ZW9uV0g3dmFscUZGVXZEbzVGYkhZUDZKOTNEamdQQWpjdTlm?=
 =?utf-8?B?aElacGJoaUdDUU51TEJoaUNod0VzaFFHVWx0SGV2MjgwK0w1aWZqK1M5Y0dK?=
 =?utf-8?B?SkVycURyL09ha0NzMXJZeDk0U3JjcTdSTHlqWHdoUzYxRkdmR1huMU51dmh2?=
 =?utf-8?B?Q2VWVVBjdXVVNERyRUJaN3ZUc1gvMmU5eTNua0EzSDRReGFjdUtQMnpoQjlw?=
 =?utf-8?B?eXVUVkZabTY3dlJNYmR3czJKRUR2VnJXcEp3a0FkV0Z3U1U5V1pqdkZGTndI?=
 =?utf-8?B?UVRvZjllbG4yMm91QThOdlB3aDZyTHd1RHlCeUNvVTNjb0lYQ1hSdkJzWkJu?=
 =?utf-8?B?ZWNHaUFkd1E5QjZGYitDNHpnbVpQa2pRQ3p0UHZ3c2tINlFqOGRqTVpCUEI5?=
 =?utf-8?B?eW80Q2ZoSlFFejd6UDdlQnNjckZIZCtPRkhwdnQ0aGYyNml3dmRNT3hFWUVJ?=
 =?utf-8?B?VnFCejNQNjBVYkJxV0xWZTJjRkptOXlScU9iUHE4K2djRjVGMzV4Sk5ZRGhh?=
 =?utf-8?B?QXNGTEUvSlJTNXZid0lLVTVKaWhRWGZFejZiWEMzVkw4N3FFY0xubFY4akxa?=
 =?utf-8?B?ZWtzWEc0UkJjYkRpMklpZEhESVJyK0lJckFmTTNqaVBhVGhTelZBaHRHdWE4?=
 =?utf-8?B?dU1sN2lOcTc3TTh4WFRRMGY1d0ZiQVFjYTdQZXNlWTMxMXNDbGpqcFI5eFJk?=
 =?utf-8?B?OUl0dDFoYm9MbHFkc0dyRHBWTyszVEJWVHVYVWU0UEZHVVRpVW5nM2lrSHFH?=
 =?utf-8?B?d1BqdVFXT3Z1Z05SeWlyYmN2emx2WE9PanE4SEpteVFlYUoreG1ibEV6ZEMr?=
 =?utf-8?B?b3poNUVZWndvOWRoOStqL094SzJVTE01bEc5cURCeG5qK3J1UmhPOVZEYmEz?=
 =?utf-8?B?QkRMTW8wbEc1MjdwY2Z6Yk05UDJWK2RXQjBpNU1vMnVJR1VhYlc2ODJSSXdv?=
 =?utf-8?B?RW1pVUVZcFY5T3gvYTEzdHJ0OG5WcVZYNlhrQlQ0WWhqMTN1UG5LNHFkL3ZW?=
 =?utf-8?B?Slh0Wmh6SGVySnBCc2k4Q2YxZUhSVFNJOWxzZmNQVWsyd1h0b3dBNTg5Skh5?=
 =?utf-8?B?SnlMRUtmZ1VGaHZReGNiaDh5dGlkeTZ6akd2YklFa3J6YWZVTERiYnhuRFdk?=
 =?utf-8?B?SDAxOFMyOHFsdWZCTmt0RldDRlQxdjVFeklRdWtxQlF5eU5nNDJzSmNIVjEr?=
 =?utf-8?B?OHROclBlNXVxRE9KcU1kcXhYVW9lSGl2RllVSzMxcVdCWXlDblVKVTQ0Mlhh?=
 =?utf-8?Q?e60w=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 08:22:21.5749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 649e6213-eae8-4260-eae3-08de3ed7bb74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000042A7.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6831



On 18/12/2025 19:19, Andrew Cooper wrote:
> On 18/12/2025 5:28 pm, Oleksii Kurochko wrote:
>> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
>> index 47973f99d9..e566023340 100644
>> --- a/xen/arch/arm/domain.c
>> +++ b/xen/arch/arm/domain.c
>> @@ -473,36 +473,21 @@ void dump_pageframe_info(struct domain *d)
>>  
>>  }
>>  
>> -/*
>> - * The new VGIC has a bigger per-IRQ structure, so we need more than one
>> - * page on ARM64. Cowardly increase the limit in this case.
>> - */
>> -#if defined(CONFIG_NEW_VGIC) && defined(CONFIG_ARM_64)
>> -#define MAX_PAGES_PER_VCPU  2
>> -#else
>> -#define MAX_PAGES_PER_VCPU  1
>> -#endif
>> -
>>  struct vcpu *alloc_vcpu_struct(const struct domain *d)
>>  {
>>      struct vcpu *v;
>>  
>> -    BUILD_BUG_ON(sizeof(*v) > MAX_PAGES_PER_VCPU * PAGE_SIZE);
>> -    v = alloc_xenheap_pages(get_order_from_bytes(sizeof(*v)), 0);
>> -    if ( v != NULL )
>> -    {
>> -        unsigned int i;
>> -
>> -        for ( i = 0; i < DIV_ROUND_UP(sizeof(*v), PAGE_SIZE); i++ )
>> -            clear_page((void *)v + i * PAGE_SIZE);
>> -    }
>> +    BUILD_BUG_ON(sizeof(*v) > PAGE_SIZE);
>> +    v = alloc_xenheap_pages(0, 0);
> 
> I know this is only interim until the next patch, but
> alloc_xenheap_page() to match the free function used.
> 
> Personally, I'd merge patches 2 and 3 together, because everything you
> touch in this patch is deleted by the next one.
> 
> But, whatever the ARM maintainers prefer.
I'm in favor of Andrew's suggestion. There's no point in introducing something
in one patch and dropping it in the very next one.

~Michal


