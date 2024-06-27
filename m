Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E092691A093
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jun 2024 09:40:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.749762.1158006 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMjjq-0008UN-UO; Thu, 27 Jun 2024 07:40:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 749762.1158006; Thu, 27 Jun 2024 07:40:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sMjjq-0008Rz-Rj; Thu, 27 Jun 2024 07:40:14 +0000
Received: by outflank-mailman (input) for mailman id 749762;
 Thu, 27 Jun 2024 07:40:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LqiX=N5=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1sMjjp-0008Rt-AS
 for xen-devel@lists.xenproject.org; Thu, 27 Jun 2024 07:40:13 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20625.outbound.protection.outlook.com
 [2a01:111:f403:2412::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7b265f15-3458-11ef-b4bb-af5377834399;
 Thu, 27 Jun 2024 09:40:11 +0200 (CEST)
Received: from PH7P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::19)
 by SA3PR12MB9198.namprd12.prod.outlook.com (2603:10b6:806:39f::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 07:40:07 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::dd) by PH7P221CA0006.outlook.office365.com
 (2603:10b6:510:32a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.25 via Frontend
 Transport; Thu, 27 Jun 2024 07:40:07 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Thu, 27 Jun 2024 07:40:06 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 02:40:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Jun
 2024 02:40:05 -0500
Received: from [10.252.147.188] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 27 Jun 2024 02:40:04 -0500
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
X-Inumbo-ID: 7b265f15-3458-11ef-b4bb-af5377834399
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Onmf8DuI91XkOmVqFNzI+p9CB+TNG+MqJMyB5F+ifSCIDR9N2L0D4W5/li2zkQ7b03ndGzfpQ5jCia8usjmPRkDIYoB1aSg7DUzqcGKQaGJqc4zX9X8GPROGH1gVuzRqUxMironuDHN0qymB5LLttHrJZoq4Fjy7zJzmJgU0toQ8xyBnM+nJw6i+tJAgblo1FlNkeZUZmVTo5eMsbB2VleV+t4e8SniuSG4eaWgzn6D957tsY4qaBXhrsjmLvtAjP+d6WpGAbfU84GD+EFFQG1g1s/ZYFEA0ZONFE285foyFuCtSUALIYBHqI8i4J2ohNYtp1nZlHcM+2Gez7/EpVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mO3uoanngyAgOP1Qo8tbtQnDmt1qO5O1KTAdzeGf6Jg=;
 b=IFiBqSWQji8xt/6+obj7DbmCY8qfmtZE3dJ7ShsqXwaKerNwGg3lWwBF+5IJTMVewX/TW7l/eIHMp5CY0rSVXEg4fQU6C4o5272aVrjYVEWF1c50KgboG64CfFE8kNH62pmnqJcNRutu7wHWOS5G3P+FCxlCaKF5Eo2BSIVcdyZHTtJgioP98UrBK5dwvivKmBCZvqe6Zr/3z+GPsRUx2JSTYibWubHUWJCDtL6QDmvNki0rrL6LiloUMkOQxkowlAD0ORoTK4KXxN8kX2QRKk8lWQ+JxzDPI9L2l+KgGPH0WLcM8/Q96bKx/pjOruzss+wtLw9gsmnR01G30YjHDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=xen.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mO3uoanngyAgOP1Qo8tbtQnDmt1qO5O1KTAdzeGf6Jg=;
 b=PFwvLpuAZXOYGW4HrspPnm1Fonw9vuaxmD6nkYAijUv1C3nVV7N2iWKR67Dkc01EFGZ4tdtGMpnHJvwD6ToCNcV2Rt9eIEPE2hbgvmsBAjJD34x8/lesYTMdmZTRCf9SlBuWQp31lYzSZEO3qwfXlRH6ezS91kiIhxOCTeCZIiQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Message-ID: <b5c861a4-1431-44c5-a1ec-bc859ea011c3@amd.com>
Date: Thu, 27 Jun 2024 09:40:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-4.19(?)] xen/arm: bootfdt: Fix device tree memory node
 probing
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>
References: <20240626080428.18480-1-michal.orzel@amd.com>
 <766b260e-204c-423f-b0e1-c21957b6d169@xen.org>
Content-Language: en-US
From: Michal Orzel <michal.orzel@amd.com>
In-Reply-To: <766b260e-204c-423f-b0e1-c21957b6d169@xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|SA3PR12MB9198:EE_
X-MS-Office365-Filtering-Correlation-Id: e21d0555-7fa3-4a55-dad6-08dc967c5d70
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MlozV01qSUY2MTNWNjFJZVdadnlHRTkwcG5zWDAwWXNaVnphNTYvTlNYclNV?=
 =?utf-8?B?MHVLdHIxSnZMbmpQNDVlVGlOdWJkR1FMdzRUUS9VWG1CNkx0YjBndm1LOWVN?=
 =?utf-8?B?MkRiRU1hZS9HZGpBb0YxeGd5eUtYZ3VPWUdmRkRNS2g3djV0eEczTkhpUnMy?=
 =?utf-8?B?RnZIZWxQR01sdk8xYTQyL3dPek9OOTF3bk8zQUprc0xHbFVZSExHR25qNU9z?=
 =?utf-8?B?TXhvazBHMzRSYVFGSDBxVVc5RDJIeXh6dlI5OUJnY0ZNUVN5dVdlK1ozYUtO?=
 =?utf-8?B?eW8wSTNTKzRRL1R4YmlQMmVKRENKNGtveUZYZlhrUmNhKzlmWTNNaExSdUEx?=
 =?utf-8?B?UFI2TXJhTHh4MXFvMnR5VXlvWFhBd1RNUkRuNU5RdnpWMXNaWEx4RC8rYmpK?=
 =?utf-8?B?dDl5Tm5BbHlzUDN0WlhMcDdhV3dMVTBiVTBRT2FYRDJuZUk4bGZuT0hHTFpj?=
 =?utf-8?B?Nyt3VDNyZzA1WWRDRzMxYmpNSXdFZ3E4SG1rMFYzTG4zWVJFUWJnNGFrV0Mv?=
 =?utf-8?B?K25TTEF4SFFnT24xUkF1VUVwUkRrOGgyZXBKWXBMcStrN3Buc3hVZHZQbHZE?=
 =?utf-8?B?cGlRY0srUXlNTzU2bzU5Vi9wWWJSRXBHaFNRaCtUN0pXVlp6UnZlbS9ZOEZx?=
 =?utf-8?B?RU9MVFg4a3hRYjFodTdza0kwQVRFUVVKamZBR2FMSmljTFRlcFNzcjhXQUJX?=
 =?utf-8?B?Um5tV3BOcVh0TEk5bC94Z1ErREpkU2hTMW1lYSs5YnRoQTZYRVdZd2M0bnUy?=
 =?utf-8?B?TkVqK0ZCcUJkS2JWOVhlT2pwSkQxRkJRVllRcFoybVl5dGxPMkc3ZVFyTlhQ?=
 =?utf-8?B?MEJsVnBXWXNkVHAybit5TER6N2dpbkQ0SWZNZTFVcG9jN0xsclhpME1ocnk4?=
 =?utf-8?B?aE15SVVZT3ZITk9JZ1Z6NjFVL2hGY3lZTU1tSitSYzF6UlNkWjR0NldhbUw4?=
 =?utf-8?B?T1E5ak9xcFZpYjZLZ3d1YWRQU2dCUkhxRU9xMjYwayt0YkxOMWZDT243RW1H?=
 =?utf-8?B?UmZiVlNXVGtwU20vb2hHS1A5bUdPL1VjZnJMUXBQdXdtRDk1NUNYY25MYkFE?=
 =?utf-8?B?Vlh5UDVTY1ZpQTNKNHJSRXU0eFhoVWVzZVB1cG5jc1ltWGhhd3NsRnZod3Rz?=
 =?utf-8?B?bVlMakRkVlN4UWlzb2tOY2Z0NlI4Vk5VL2pXNWsrUnM5M1ZuV0NPeHZVU29X?=
 =?utf-8?B?TFBOVXZ6Vkxjakt5Tld5YmYrUVUxaTVEV01Tbm5tVFUzRlIzYkFUVE0zb2dS?=
 =?utf-8?B?bVUwdHpKWFhQb1ZlRG52QTY5aWRlNm9WL1hXdGJhbDAzZnFvSW9sTENTUElh?=
 =?utf-8?B?ODc4KzcyR3BaMkdlYWs0ZStENWRyU1hxMDJGTHN2bUkyYktDZSswa0J0UnlB?=
 =?utf-8?B?MXZORlMxc0lldURBV2NJY2gzNVNTSDhBSm1pMkFZRjVqaXRES1dWSDNiVXdj?=
 =?utf-8?B?NGpubDJkdDhSZExsSWg5d3lvVTRDWlpoLzVoYkk5WGN5NFZPSm5nQlFWVUJE?=
 =?utf-8?B?SFNoMExNanlBRjd0UXR5QTE4VzZZbHdlbXFmajZSSDNPcHJIbW8wRHB4SEtK?=
 =?utf-8?B?VTNQYjhZWkJCZmsvb25PYnRyU01zTlE3Q2tWenh1VS9tQXhCMUdFZFZHTjBZ?=
 =?utf-8?B?aGMyQ2tVTit2UE9hWXN3RUdMNFQzeGdIMHYvMlBaUVBPRFZTTVhvdGFuNUpi?=
 =?utf-8?B?ODJtK1F2SVlDTlQ2UzMvanVqUUhKYVhHQ1BLYUY2ZEdrdnhycnpiTmF5ckJC?=
 =?utf-8?B?STMyTDJnQ0RWTEVIeGdOSDNPMjV5b2hJeFFWRDRqZmdUNXBvLzB3MkZrZnZS?=
 =?utf-8?B?THB6cTdmYUVGbnA2VzRBVGxVR1psVkdqLzZDbitZemZ1ZmVhdHhuVW1CeTgr?=
 =?utf-8?B?bkFOVGVBSTROUjJGZzYzcjBkRW1OR3MrUnE3cGpMeDRJUEsxOFBZY0VVVGpn?=
 =?utf-8?Q?qYmn35So6mDyrrqnvt0TKeOZnvOTo+yx?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2024 07:40:06.6306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e21d0555-7fa3-4a55-dad6-08dc967c5d70
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9198

Hi Julien,

On 26/06/2024 22:13, Julien Grall wrote:
> 
> 
> Hi Michal,
> 
> On 26/06/2024 09:04, Michal Orzel wrote:
>> Memory node probing is done as part of early_scan_node() that is called
>> for each node with depth >= 1 (root node is at depth 0). According to
>> Devicetree Specification v0.4, chapter 3.4, /memory node can only exists
>> as a top level node. However, Xen incorrectly considers all the nodes with
>> unit node name "memory" as RAM. This buggy behavior can result in a
>> failure if there are other nodes in the device tree (at depth >= 2) with
>> "memory" as unit node name. An example can be a "memory@xxx" node under
>> /reserved-memory. Fix it by introducing device_tree_is_memory_node() to
>> perform all the required checks to assess if a node is a proper /memory
>> node.
>>
>> Fixes: 3e99c95ba1c8 ("arm, device tree: parse the DTB for RAM location and size")
>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>> ---
>> 4.19: This patch is fixing a possible early boot Xen failure (before main
>> console is initialized). In my case it results in a warning "Shattering
>> superpage is not supported" and panic "Unable to setup the directmap mappings".
>>
>> If this is too late for this patch to go in, we can backport it after the tree
>> re-opens.
> 
> The code looks correct to me, but I am not sure about merging it to 4.19.
> 
> This is not a new bug (in fact has been there since pretty much Xen on
> Arm was created) and we haven't seen any report until today. So in some
> way it would be best to merge it after 4.19 so it can get more testing.
> 
> In the other hand, I guess this will block you. Is this a new platform?
> Is it available?
Stefano answered this question. Also, IMO this change is quite straightforward
and does not introduce any engineering doubt, so I'm not really sure if it needs
more testing.

> 
>> ---
>>   xen/arch/arm/bootfdt.c | 28 +++++++++++++++++++++++++++-
>>   1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
>> index 6e060111d95b..23c968e6955d 100644
>> --- a/xen/arch/arm/bootfdt.c
>> +++ b/xen/arch/arm/bootfdt.c
>> @@ -83,6 +83,32 @@ static bool __init device_tree_node_compatible(const void *fdt, int node,
>>       return false;
>>   }
>>
>> +/*
>> + * Check if a node is a proper /memory node according to Devicetree
>> + * Specification v0.4, chapter 3.4.
>> + */
>> +static bool __init device_tree_is_memory_node(const void *fdt, int node,
>> +                                              int depth)
>> +{
>> +    const char *type;
>> +    int len;
>> +
>> +    if ( depth != 1 )
>> +        return false;
>> +
>> +    if ( !device_tree_node_matches(fdt, node, "memory") )
>> +        return false;
>> +
>> +    type = fdt_getprop(fdt, node, "device_type", &len);
>> +    if ( !type )
>> +        return false;
>> +
>> +    if ( (len <= 0) || strcmp(type, "memory") )
> 
> I would consider to use strncmp() to avoid relying on the property to be
> well-formed (i.e. nul-terminated).
Are you sure? AFAIR, libfdt returns NULL and -FDT_ERR_TRUNCATED as len if a string is non null terminated.
Also, let's suppose it is somehow not terminated. In that case how could libfdt set len to be > 0?
It needs to know where is the end of the string to calculate the length.

> 
>> +        return false;
>> +
>> +    return true;
>> +}
>> +
>>   void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
>>                                   uint32_t size_cells, paddr_t *start,
>>                                   paddr_t *size)
>> @@ -448,7 +474,7 @@ static int __init early_scan_node(const void *fdt,
>>        * populated. So we should skip the parsing.
>>        */
>>       if ( !efi_enabled(EFI_BOOT) &&
>> -         device_tree_node_matches(fdt, node, "memory") )
>> +         device_tree_is_memory_node(fdt, node, depth) )
>>           rc = process_memory_node(fdt, node, name, depth,
>>                                    address_cells, size_cells, bootinfo_get_mem());
>>       else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
> 
> Cheers,
> 
> --
> Julien Grall

~Michal

