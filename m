Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EA371F76A
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 02:57:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542869.847274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4t6q-0004eh-BW; Fri, 02 Jun 2023 00:57:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542869.847274; Fri, 02 Jun 2023 00:57:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4t6q-0004c9-7O; Fri, 02 Jun 2023 00:57:40 +0000
Received: by outflank-mailman (input) for mailman id 542869;
 Fri, 02 Jun 2023 00:57:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CQ40=BW=amd.com=vikram.garhwal@srs-se1.protection.inumbo.net>)
 id 1q4syu-00018B-GP
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 00:49:28 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20609.outbound.protection.outlook.com
 [2a01:111:f400:fe5b::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52270aa4-00df-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 02:49:26 +0200 (CEST)
Received: from MW3PR12MB4409.namprd12.prod.outlook.com (2603:10b6:303:2d::23)
 by CYYPR12MB8853.namprd12.prod.outlook.com (2603:10b6:930:cb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 00:49:22 +0000
Received: from MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::246d:4776:b460:9277]) by MW3PR12MB4409.namprd12.prod.outlook.com
 ([fe80::246d:4776:b460:9277%5]) with mapi id 15.20.6455.024; Fri, 2 Jun 2023
 00:49:22 +0000
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
X-Inumbo-ID: 52270aa4-00df-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DoEOKmpTchvaQTQlppGQTRJJ+A+pWP2neCSN2FQWCY9080ITXpX29u9ur/HQqVcmEjhHLSzWQB/QVIW2Vdve+H+DZPHuXMlYSU9RPeuRm/cX3nFIxX3rKgZiGM/1onB9rE2uKVXysU3aDPjjZV2aUcBmErTql2QE6gwEDAb+0vGO73rp35QdJXt8bJq24rkFHyO72d3f9sqGEVTmh8J8TO4zj8ckc7ZAs++l6/xy6hF1Qbx7pCgDE1Fw3mVMN5PM3Y/Y2i8YnJlFy0xwAtwwVYwqzMfsIS/vdEGpiU+BiX3O7DV4Sih4rqQ/QDnF2QONbsO653YVnbLQRi7yY2rH9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pjHAUFOEL6gSTDQmQdF8t3vtqEdVfFrFldH0mIAkjDI=;
 b=HXpIBRQoIf+75E4QLOso35u3cBfAGm74RjoyyQpOgn0zUX5gLz2Du1+94wrJvmT1TydLQlPNe4zPtDlT5mYWXwRzEGwYwIc4vJJUJDEWdDQS9Fdj1nVXx5wINkKSwR/mSsB8LAOutyfkKYLAD7EN3n22ZsjfAERmuPI83bzKd0oY9lWACFM978mSqXA9OeoeQQ8G6zwUHB9xXbGzMJgyhFK+Fbi9TGCEa8aa5C+rAk3GdpL0Ik7QUs2SBfRJjILDRB7OIpmmXlcRwD3NXdSKUO1WbcCKBOBoU+gqfB0LeSi2VzO24aIQbPifUm/off4o8APDE2tOTXJ8A79jh4Oy5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pjHAUFOEL6gSTDQmQdF8t3vtqEdVfFrFldH0mIAkjDI=;
 b=UmuvHNyrEHcPVe4bhtt+CP1KSZEttcUVPiV6BeLUU95bXmzmBjR4NOZBzL/GFvzn6bfijOXjl4870Sl2clB7sQ4qW35opXwfsrSlQDryuvOxzhTiJBQA+C346NA5ZrGv2cNkI9ZJbsyfITm7ucEtHqAi1Ww7iKtbrg9t+m8HlSs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <f29f9b95-793e-5ca7-16ec-b5ec6dcc7435@amd.com>
Date: Thu, 1 Jun 2023 17:49:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [XEN][PATCH v6 16/19] xen/arm: Implement device tree node
 addition functionalities
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
References: <20230502233650.20121-1-vikram.garhwal@amd.com>
 <20230502233650.20121-17-vikram.garhwal@amd.com>
 <27af742a-c8c2-006e-fcd8-bbad116e1908@amd.com>
From: Vikram Garhwal <vikram.garhwal@amd.com>
In-Reply-To: <27af742a-c8c2-006e-fcd8-bbad116e1908@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR07CA0038.namprd07.prod.outlook.com
 (2603:10b6:a03:60::15) To MW3PR12MB4409.namprd12.prod.outlook.com
 (2603:10b6:303:2d::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4409:EE_|CYYPR12MB8853:EE_
X-MS-Office365-Filtering-Correlation-Id: 09dbbf1b-9ff1-4532-2f04-08db630334c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wbz+jZMkOpEKmQ/DRwpkuZ9ZqQzxwYMoZoQV0wKO7vj1FD8WBowpKRx/s5U3krF1QixyqeFzpAFuWOaCw7AXBQ//TcGekEKkp6mSqNNymR5DmRFNj0oZcUmdfTgJCRTzDTIGBCPgrVhJkczLe+j3HXrRP/T3j7dFouF2INsyG8QqYYrHm3P86RkJ6J1YWk+MTixur3uRvwo5eooPH2i1mSJEt3Cd43Z8uNXbktOXlByD0CFR2GXtwQu314hyV5dOkH3V/Y57W2e82YVQ2/Ep/R37abjm1OvPG3o1cf2wkn5yyKUKo/dKFtRoc4yC87UUXLswifq0Y3EbP8YOlmLRd2KMUFLu4T784Q63tFkiiN1ICTWpDyDhCzBCh90c3vl2lMic1qeaU1n6SStyP42fnxm6OrzOAffsq2vz10qNm0KvSn8mWtFuutfGgotYw1+AS7TyHJOzQNxIXuix99voMxcPltIAd7M8uMf9HezPSI0nA/JWvCAt4jZtS0mOTUXYVq80zRhN3+mxKWYStq87tGE921pUX3/iSNKhF6SWfPUY+t7UXjtna9IlL7dBgIBl836ks7CAHhQpmHCX0iQhRYUfgtoeNWATkgprecfGgne4JTfbjDQ5EyYGlg1M0gARpIMJx1xX19m23Y7cs74hxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4409.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199021)(36756003)(38100700002)(86362001)(31696002)(66899021)(31686004)(41300700001)(8676002)(8936002)(30864003)(2906002)(53546011)(6506007)(6512007)(44832011)(5660300002)(26005)(186003)(2616005)(83380400001)(66476007)(66556008)(6486002)(478600001)(66946007)(54906003)(316002)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHFxbUhDY3QzL2lPY2FCT1l0WGhJYkk0OXhmaHZjRXl1SVY4d0w0ZVdDVFdL?=
 =?utf-8?B?Y0VnNjVPT1pmWHpIWE56cm5nLzl0dW5obkJucXhYR1ljN1lwVG5XRTNxb20r?=
 =?utf-8?B?R2dJeGg1YUV5ODl6cFhpY2k3VGZXQ295SHVSOGtPMWxuOVg3MEY1QUFPM2ZY?=
 =?utf-8?B?MS9pUldZeCtGQkhSb3I4ajR0a0t2Z3VnNmJJM1Z4eld6eURSbzNQTHJiZTF5?=
 =?utf-8?B?ZGt3eDVyanB2WmJxcnNFU2oyVk5VZVdPVklJcVgrM1NKNlBBcVBGcklLZEhF?=
 =?utf-8?B?MDFvdlVHT3dUYmVjS0VJLzBDWGRhSUFmWHhiODBQZ0dwd29WditSVW1FM2NL?=
 =?utf-8?B?NUt1Y3pCZml4eGJ0UmdBZHFzU3EyTXZ6V0R4TGQzeS9OVmF0TjNvWFV6aFNR?=
 =?utf-8?B?Z2hhZUlLdGlDeXIybDlzaTFNK2lmNWM5S3F2VjFObXhKcGFpVzA0TVZEVWFm?=
 =?utf-8?B?ZmE2MTFuYWJZcnk4TFhYa0tpd25TMm1YS2N6M2IrdmZDekprYnJxMDRFQ21x?=
 =?utf-8?B?QjZYTnpyUi9oUnNOcTF5M3hMWEJVZDdIUm1ITytoeXQrZWxQbjkxRXpmNk1N?=
 =?utf-8?B?UmV3ano1RFpUbVZrMjV0cC9TNG9pQjBXOUcxM1p0QU5ZSGl4VjF1VStXRk8x?=
 =?utf-8?B?bWppTUp2dzV3TXdXaDBCbnRpSTRsb3RpYUZMLzBTLytXdWJMc2ZERHhIZEsy?=
 =?utf-8?B?emVVeFBwRjRPbVR5Q091emJpQjdlVDFQS1dOVFRuRGFTSXhmQmdFY3FGcHJa?=
 =?utf-8?B?dVZpRS9UVVplOWt0QnhMZlVTNVJJK3YxZkRwWW5QMUtHYTJNM25jUnRwRTlR?=
 =?utf-8?B?M0hrcjZ3UHh5OHNsZWlGSFJZVGdFaEZBWkdIeGM1d0xUSjZVZFR3elFpb0g4?=
 =?utf-8?B?NVFEVkpzUVhjTGZDMEgxRy9pZloxNVo4YUVIMjVBa3V6RDJ5d1NhbkpxeEhO?=
 =?utf-8?B?Vlh5Q1A0bmF3RnlMSVB5Y2hISE1xM211ZndQS1ltdVcvZWtnb2ZCSm9RSTBM?=
 =?utf-8?B?dDBrdFRzK3pvOVpFTWt5SlVZTU5ZeGtHUU15eTkxRzNPZllYbzQ2VjJFY1lH?=
 =?utf-8?B?blRXMHhHSXRyelhqdVIySEd1ZFhKd1pvSjB6TXRXMmxZTEtrdGxIV002ekNR?=
 =?utf-8?B?NVJNclk0bldOcCtDRm5WOEkxN2Fsd0JGeURjc2Rab1RhZW15UEpCQzhYUWFE?=
 =?utf-8?B?aTJjZHBmYjBHNVFJdm9YY295U3B0TGRENHY5N1VKZ2N0S2w3dzlPdnVxOFVa?=
 =?utf-8?B?VFp1UVdldGVrWGN1NkZhQkFkNDQzdTA4T2VzVHRQOEhZTnluQWRGQkFpNW0z?=
 =?utf-8?B?dEs2Lzd6WDMyeDEycWtkb29mRFl0amNHQ29YVVg5N2lnN1A4dUpxSVVZSEVW?=
 =?utf-8?B?MytBM3pueEVISi85R3FYaUNZdGpmVHptV280YXkvVVZqYURrL3pNcTBLRllm?=
 =?utf-8?B?elluMDQyY2k1cS92ZWQ5cnpCSnFwRUx3YzI0RGJFUEdBSFNuWUtrUXVzR0FS?=
 =?utf-8?B?eUVFelUzcW8rSkJrUkxGbjYwSUZldHZYNGx2dHJGWmNpVTJDdFMxVGhZVHk4?=
 =?utf-8?B?QkI1dlZSbVNRdzBuL0x0N094VEZaQUQzdGhhdFdYRURFWWpscE9CeEZhRlI2?=
 =?utf-8?B?SFYrUzNiRkpKaXBXNG54VXhjYi9LY0hyak9PaUNVRCtyaGw1Y3VXZFNITm5Z?=
 =?utf-8?B?NjBNMVMxY0FpeitxeFpOaktPMmVtUjk0L0xBdjk3bE10dG05TjVnOGRTaFRn?=
 =?utf-8?B?NnFNU3VRM0pNRU5oYXFORU5XcWJQMldkZlU3cy9senhzMytwR09QTVR5Umw5?=
 =?utf-8?B?VnUxbzFBakdNeXpzZmoybG5ka3RGT1JQVDR4Z2F5Y25zeG9QSkx2NnhTUlE1?=
 =?utf-8?B?L2tCRTlBMXpkVE5ueUV2M2NWNExGQ2QrNTRiY1hxTjN0ZnBVT29PenFGeWJq?=
 =?utf-8?B?RlRycnBwbDQrWjFEb2VQR1BHeWhzSnZLWFpWdDE1dVdiWHdxbXVhUXhZYXZw?=
 =?utf-8?B?eDRNQmRzWFIyZjNSNG80ekROUzFCSnM0eDBESFhlMHVRc0d4TlFqVG5vNGRB?=
 =?utf-8?B?ODZ1V250R0VhelNOcFFyT21WVm9yN3lzMlY2L2RqcHJzZy9sRHltK2lRaS9s?=
 =?utf-8?Q?WN8WTXfhqWh7XJcZvCOSYCLn1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09dbbf1b-9ff1-4532-2f04-08db630334c5
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4409.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 00:49:22.7272
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bAxwsdEoNgbojNbWbjWQfCPAAvURoz5sSSwb4v0bbCIbYRPro9rCW4G73Lsod91gbeo8Kl3w/sB1DFQonOtC5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8853

Hi Michal,

On 5/10/23 3:18 AM, Michal Orzel wrote:
>
> On 03/05/2023 01:36, Vikram Garhwal wrote:
>> Update sysctl XEN_SYSCTL_dt_overlay to enable support for dtbo nodes addition
>> using device tree overlay.
>>
>> xl dt-overlay add file.dtbo:
>>      Each time overlay nodes are added using .dtbo, a new fdt(memcpy of
>>      device_tree_flattened) is created and updated with overlay nodes. This
>>      updated fdt is further unflattened to a dt_host_new. Next, it checks if any
>>      of the overlay nodes already exists in the dt_host. If overlay nodes doesn't
>>      exist then find the overlay nodes in dt_host_new, find the overlay node's
>>      parent in dt_host and add the nodes as child under their parent in the
>>      dt_host. The node is attached as the last node under target parent.
>>
>>      Finally, add IRQs, add device to IOMMUs, set permissions and map MMIO for the
>>      overlay node.
>>
>> When a node is added using overlay, a new entry is allocated in the
>> overlay_track to keep the track of memory allocation due to addition of overlay
>> node. This is helpful for freeing the memory allocated when a device tree node
>> is removed.
>>
>> The main purpose of this to address first part of dynamic programming i.e.
>> making xen aware of new device tree node which means updating the dt_host with
>> overlay node information. Here we are adding/removing node from dt_host, and
>> checking/setting IOMMU and IRQ permission but never mapping them to any domain.
>> Right now, mapping/Un-mapping will happen only when a new domU is
>> created/destroyed using "xl create".
>>
>> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
>> ---
>>   xen/common/dt-overlay.c | 510 ++++++++++++++++++++++++++++++++++++++++
>>   1 file changed, 510 insertions(+)
>>
>> diff --git a/xen/common/dt-overlay.c b/xen/common/dt-overlay.c
>> index b89cceab84..09ea46111b 100644
>> --- a/xen/common/dt-overlay.c
>> +++ b/xen/common/dt-overlay.c
>> @@ -33,6 +33,25 @@ static struct dt_device_node *
>>       return child_node;
>>   }
>>   
>> +/*
>> + * Returns next node to the input node. If node has children then return
>> + * last descendant's next node.
>> +*/
>> +static struct dt_device_node *
>> +dt_find_next_node(struct dt_device_node *dt, const struct dt_device_node *node)
>> +{
>> +    struct dt_device_node *np;
>> +
>> +    dt_for_each_device_node(dt, np)
>> +        if ( np == node )
>> +            break;
>> +
>> +    if ( np->child )
>> +        np = find_last_descendants_node(np);
>> +
>> +    return np->allnext;
>> +}
>> +
>>   static int dt_overlay_remove_node(struct dt_device_node *device_node)
>>   {
>>       struct dt_device_node *np;
>> @@ -106,6 +125,76 @@ static int dt_overlay_remove_node(struct dt_device_node *device_node)
>>       return 0;
>>   }
>>   
>> +static int dt_overlay_add_node(struct dt_device_node *device_node,
>> +                               const char *parent_node_path)
>> +{
>> +    struct dt_device_node *parent_node;
>> +    struct dt_device_node *next_node;
>> +
>> +    parent_node = dt_find_node_by_path(parent_node_path);
>> +
>> +    if ( parent_node == NULL )
>> +    {
>> +        dt_dprintk("Parent node %s not found. Overlay node will not be added\n",
>> +                   parent_node_path);
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* If parent has no child. */
>> +    if ( parent_node->child == NULL )
>> +    {
>> +        next_node = parent_node->allnext;
>> +        device_node->parent = parent_node;
>> +        parent_node->allnext = device_node;
>> +        parent_node->child = device_node;
>> +    }
>> +    else
>> +    {
>> +        struct dt_device_node *np;
>> +        /* If parent has at least one child node.
> incorrect comment style, should be:
> /*
>   *
>   */
Changed this in v7.
>
>> +         * Iterate to the last child node of parent.
>> +         */
>> +        for ( np = parent_node->child; np->sibling != NULL; np = np->sibling );
>> +
>> +        /* Iterate over all child nodes of np node. */
>> +        if ( np->child )
>> +        {
>> +            struct dt_device_node *np_last_descendant;
>> +
>> +            np_last_descendant = find_last_descendants_node(np);
>> +
>> +            next_node = np_last_descendant->allnext;
>> +            np_last_descendant->allnext = device_node;
>> +        }
>> +        else
>> +        {
>> +            next_node = np->allnext;
>> +            np->allnext = device_node;
>> +        }
>> +
>> +        device_node->parent = parent_node;
>> +        np->sibling = device_node;
>> +        np->sibling->sibling = NULL;
>> +    }
>> +
>> +    /* Iterate over all child nodes of device_node to add children too. */
>> +    if ( device_node->child )
>> +    {
>> +        struct dt_device_node *device_node_last_descendant;
>> +
>> +        device_node_last_descendant = find_last_descendants_node(device_node);
> empty line
>
>> +        /* Plug next_node at the end of last children of device_node. */
>> +        device_node_last_descendant->allnext = next_node;
>> +    }
>> +    else
>> +    {
>> +        /* Now plug next_node at the end of device_node. */
>> +        device_node->allnext = next_node;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   /* Basic sanity check for the dtbo tool stack provided to Xen. */
>>   static int check_overlay_fdt(const void *overlay_fdt, uint32_t overlay_fdt_size)
>>   {
>> @@ -145,6 +234,82 @@ static unsigned int overlay_node_count(const void *overlay_fdt)
>>       return num_overlay_nodes;
>>   }
>>   
>> +/*
>> + * overlay_get_nodes_info gets full name with path for all the nodes which
>> + * are in one level of __overlay__ tag. This is useful when checking node for
>> + * duplication i.e. dtbo tries to add nodes which already exists in device tree.
>> + */
>> +static int overlay_get_nodes_info(const void *fdto, char ***nodes_full_path,
>> +                                  unsigned int num_overlay_nodes)
>> +{
>> +    int fragment;
>> +
>> +    *nodes_full_path = xzalloc_bytes(num_overlay_nodes * sizeof(char *));
> You are not freeing memory in this function in case of an error and rely on a caller
> to free the memory allocated by this function. Wouldn't it be better to allocate this
> from handle_add_overlay_nodes()?
Changed this in v7.
>
>> +
>> +    if ( *nodes_full_path == NULL )
>> +        return -ENOMEM;
>> +
>> +    fdt_for_each_subnode(fragment, fdto, 0)
>> +    {
>> +        int target;
>> +        int overlay;
>> +        int subnode;
>> +        const char *target_path;
>> +
>> +        target = fdt_overlay_target_offset(device_tree_flattened, fdto,
>> +                                           fragment, &target_path);
>> +        if ( target < 0 )
>> +            return target;
>> +
>> +        if ( target_path == NULL )
>> +            return -EINVAL;
>> +
>> +        overlay = fdt_subnode_offset(fdto, fragment, "__overlay__");
>> +
>> +        /*
>> +         * overlay value can be < 0. But fdt_for_each_subnode() loop checks for
>> +         * overlay >= 0. So, no need for a overlay>=0 check here.
>> +         */
>> +        fdt_for_each_subnode(subnode, fdto, overlay)
>> +        {
>> +            const char *node_name = NULL;
>> +            int node_name_len;
>> +            unsigned int target_path_len = strlen(target_path);
>> +            unsigned int node_full_name_len;
>> +            unsigned int node_num = 0;
> How this is supposed to work given that on each iteration you are setting this to 0
> and at the end of the iteration you increment it? It will then always be 0.
Yeah, this will work only for one node. I moved it here because of a 
comment in v4 but it's wrong. Corrected it now.
Thanks for catching this!
>> +
>> +            node_name = fdt_get_name(fdto, subnode, &node_name_len);
>> +
>> +            if ( node_name == NULL )
>> +                return node_name_len;
>> +
>> +            /*
>> +             * Magic number 2 is for adding '/' and '\0'. This is done to keep
>> +             * the node_full_path in the correct full node name format.
>> +             */
>> +            node_full_name_len = target_path_len + node_name_len + 2;
>> +
>> +            (*nodes_full_path)[node_num] = xmalloc_bytes(node_full_name_len);
>> +
>> +            if ( (*nodes_full_path)[node_num] == NULL )
>> +                return -ENOMEM;
>> +
>> +            memcpy((*nodes_full_path)[node_num], target_path, target_path_len);
>> +
>> +            (*nodes_full_path)[node_num][target_path_len] = '/';
>> +
>> +            memcpy((*nodes_full_path)[node_num] + target_path_len + 1,
>> +                    node_name, node_name_len);
>> +
>> +            (*nodes_full_path)[node_num][node_full_name_len - 1] = '\0';
>> +
>> +            node_num++;
>> +        }
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int handle_remove_irq_iommu(struct dt_device_node *device_node)
>>   {
>>       int rc = 0;
>> @@ -371,6 +536,344 @@ out:
>>       return rc;
>>   }
>>   
>> +/*
>> + * Handles IRQ and IOMMU mapping for the overlay_node and all descendants of the
>> + * overlay_node.
>> + */
>> +static int handle_add_irq_iommu(struct domain *d,
> If you only allow adding nodes to hwdom, what's the point of this parameter?
> This is not consitent with function that does removing.
Remove domain *d part for this series. This was something added for 
assigning the node to a running domain but while splitting  the series 
into two part(check 00/19 patch) i didn't remove it. Removed it in all 
the places.
>
>> +                                struct dt_device_node *overlay_node)
>> +{
>> +    int rc;
>> +    unsigned int naddr, i, len;
>> +    struct dt_device_node *np;
>> +
>> +    /* First let's handle the interrupts. */
>> +    rc = handle_device_interrupts(d, overlay_node, false);
> Similarily to your comment about skip_mapping, it would be welcome to explain why false here.
Done!
>
>> +    if ( rc < 0 )
>> +    {
>> +        printk(XENLOG_ERR "Failed to retrieve interrupts configuration\n");
>> +        return rc;
>> +    }
>> +
>> +    /* Check if iommu property exists. */
>> +    if ( dt_get_property(overlay_node, "iommus", &len) )
>> +    {
>> +        /* Add device to IOMMUs. */
>> +        rc = iommu_add_dt_device(overlay_node);
>> +        if ( rc < 0 )
>> +        {
>> +            printk(XENLOG_ERR "Failed to add %s to the IOMMU\n",
>> +                   dt_node_full_name(overlay_node));
>> +            return rc;
>> +        }
>> +    }
>> +
>> +    /* Set permissions. */
>> +    naddr = dt_number_of_address(overlay_node);
>> +
>> +    dt_dprintk("%s naddr = %u\n", dt_node_full_name(overlay_node), naddr);
>> +
>> +    /* Give permission to map MMIOs */
>> +    for ( i = 0; i < naddr; i++ )
>> +    {
>> +        uint64_t addr, size;
> Make sure to check Ayan's 32-bit paddr series status as it impacts parts of your code.
So, In staging, I cannot see any change for dt_device_get_address() 
which we using in these patches. That function still uses uint64_t addr 
instead of paddr_t. Did i misread your comment?
>
>> +
>> +        /*
>> +         * For now, we skip_mapping which means it will only permit iomem access
>> +         * to hardware_domain using iomem_permit_access() but will never map as
>> +         * map_range_p2mt() will not be called.
>> +         */
>> +        struct map_range_data mr_data = { .d = d,
>> +                                          .p2mt = p2m_mmio_direct_c,
>> +                                          .skip_mapping = true
>> +                                        };
>> +
>> +        rc = dt_device_get_address(overlay_node, i, &addr, &size);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR "Unable to retrieve address %u for %s\n",
>> +                   i, dt_node_full_name(overlay_node));
>> +            return rc;
>> +        }
>> +
>> +        rc = map_range_to_domain(overlay_node, addr, size, &mr_data);
>> +        if ( rc )
>> +            return rc;
>> +    }
>> +
>> +    /* Map IRQ and IOMMU for overlay_node's children. */
>> +    for ( np = overlay_node->child; np != NULL; np = np->sibling )
>> +    {
>> +        rc = handle_add_irq_iommu(d, np);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
>> +            return rc;
>> +        }
>> +    }
>> +
>> +    return rc;
>> +}
>> +
>> +/*
>> + * Adds device tree nodes under target node.
>> + * We use tr->dt_host_new to unflatten the updated device_tree_flattened. This
>> + * is done to avoid the removal of device_tree generation, iomem regions mapping
>> + * to hardware domain done by handle_node().
>> + */
>> +static long handle_add_overlay_nodes(void *overlay_fdt,
>> +                                     uint32_t overlay_fdt_size)
>> +{
>> +    int rc, j, i;
>> +    struct dt_device_node *overlay_node;
>> +    struct overlay_track *tr = NULL;
>> +    char **nodes_full_path = NULL;
>> +    unsigned int new_fdt_size;
>> +
>> +    tr = xzalloc(struct overlay_track);
>> +    if ( tr == NULL )
>> +        return -ENOMEM;
>> +
>> +    new_fdt_size = fdt_totalsize(device_tree_flattened) +
>> +                                 fdt_totalsize(overlay_fdt);
>> +
>> +    tr->fdt = xzalloc_bytes(new_fdt_size);
>> +    if ( tr->fdt == NULL )
>> +    {
>> +        xfree(tr);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    tr->num_nodes = overlay_node_count(overlay_fdt);
>> +    if ( tr->num_nodes == 0 )
>> +    {
>> +        xfree(tr->fdt);
>> +        xfree(tr);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    tr->nodes_address = xzalloc_bytes(tr->num_nodes * sizeof(unsigned long));
>> +    if ( tr->nodes_address == NULL )
>> +    {
>> +        xfree(tr->fdt);
>> +        xfree(tr);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    rc = check_overlay_fdt(overlay_fdt, overlay_fdt_size);
>> +    if ( rc )
>> +    {
>> +        xfree(tr->nodes_address);
>> +        xfree(tr->fdt);
>> +        xfree(tr);
>> +        return rc;
>> +    }
>> +
>> +    /*
>> +     * Keep a copy of overlay_fdt as fdt_overlay_apply will change the input
>> +     * overlay's content(magic) when applying overlay.
>> +     */
>> +    tr->overlay_fdt = xzalloc_bytes(overlay_fdt_size);
>> +    if ( tr->overlay_fdt == NULL )
>> +    {
>> +        xfree(tr->nodes_address);
>> +        xfree(tr->fdt);
>> +        xfree(tr);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    memcpy(tr->overlay_fdt, overlay_fdt, overlay_fdt_size);
>> +
>> +    spin_lock(&overlay_lock);
>> +
>> +    memcpy(tr->fdt, device_tree_flattened,
>> +           fdt_totalsize(device_tree_flattened));
>> +
>> +    /* Open tr->fdt with more space to accommodate the overlay_fdt. */
>> +    rc = fdt_open_into(tr->fdt, tr->fdt, new_fdt_size);
>> +    if ( rc )
>> +    {
>> +        printk(XENLOG_ERR "Increasing tr->fdt size failed with error %d\n",
> User does not know what tr->fdt is and it's better to be more user friendly.
Done
>
>> +               rc);
>> +        goto err;
>> +    }
>> +
>> +    /*
>> +     * overlay_get_nodes_info is called to get the node information from dtbo.
>> +     * This is done before fdt_overlay_apply() because the overlay apply will
>> +     * erase the magic of overlay_fdt.
>> +     */
>> +    rc = overlay_get_nodes_info(overlay_fdt, &nodes_full_path,
>> +                                tr->num_nodes);
>> +    if ( rc )
>> +    {
>> +        printk(XENLOG_ERR "Getting nodes information failed with error %d\n",
>> +               rc);
>> +        goto err;
>> +    }
>> +
>> +    rc = fdt_overlay_apply(tr->fdt, overlay_fdt);
>> +    if ( rc )
>> +    {
>> +        printk(XENLOG_ERR "Adding overlay node failed with error %d\n", rc);
>> +        goto err;
>> +    }
>> +
>> +    /*
>> +     * Check if any of the node already exists in dt_host. If node already exits
>> +     * we can return here as this overlay_fdt is not suitable for overlay ops.
>> +     */
>> +    for ( j = 0; j < tr->num_nodes; j++ )
>> +    {
>> +        overlay_node = dt_find_node_by_path(nodes_full_path[j]);
>> +        if ( overlay_node != NULL )
>> +        {
>> +            printk(XENLOG_ERR "node %s exists in device tree\n",
>> +                   nodes_full_path[j]);
>> +            rc = -EINVAL;
>> +            goto err;
>> +        }
>> +    }
>> +
>> +    /* Unflatten the tr->fdt into a new dt_host. */
>> +    rc = unflatten_device_tree(tr->fdt, &tr->dt_host_new);
>> +    if ( rc )
>> +    {
>> +        printk(XENLOG_ERR "unflatten_device_tree failed with error %d\n", rc);
>> +        goto err;
>> +    }
>> +
>> +    for ( j = 0; j < tr->num_nodes; j++ )
>> +    {
>> +        struct dt_device_node *prev_node, *next_node;
>> +
>> +        dt_dprintk("Adding node: %s\n", nodes_full_path[j]);
>> +
>> +        /* Find the newly added node in tr->dt_host_new by it's full path. */
>> +        overlay_node = device_tree_find_node_by_path(tr->dt_host_new,
>> +                                                     nodes_full_path[j]);
>> +        if ( overlay_node == NULL )
>> +        {
>> +            /* Sanity check. But code will never come here. */
>> +            ASSERT_UNREACHABLE();
>> +            goto remove_node;
>> +        }
>> +
>> +        /*
>> +         * Find previous and next node to overlay_node in dt_host_new. We will
>> +         * need these nodes to fix the dt_host_new mapping. When overlay_node is
>> +         * take out of dt_host_new tree and added to dt_host, link between
>> +         * previous node and next_node is broken. We will need to refresh
>> +         * dt_host_new with correct linking for any other overlay nodes
>> +         * extraction in future.
>> +         */
>> +        dt_for_each_device_node(tr->dt_host_new, prev_node)
>> +            if ( prev_node->allnext == overlay_node )
>> +                break;
>> +
>> +        next_node = dt_find_next_node(tr->dt_host_new, overlay_node);
>> +
>> +        read_lock(&dt_host->lock);
>> +
>> +        /* Add the node to dt_host. */
>> +        rc = dt_overlay_add_node(overlay_node, overlay_node->parent->full_name);
>> +        if ( rc )
>> +        {
>> +            read_unlock(&dt_host->lock);
>> +
>> +            /* Node not added in dt_host. */
>> +            goto remove_node;
>> +        }
>> +
>> +        read_unlock(&dt_host->lock);
>> +
>> +        prev_node->allnext = next_node;
>> +
>> +        overlay_node = dt_find_node_by_path(overlay_node->full_name);
>> +        if ( overlay_node == NULL )
>> +        {
>> +            /* Sanity check. But code will never come here. */
>> +            ASSERT_UNREACHABLE();
>> +            goto remove_node;
>> +        }
>> +
>> +        rc = handle_add_irq_iommu(hardware_domain, overlay_node);
>> +        if ( rc )
>> +        {
>> +            printk(XENLOG_ERR "Adding IRQ and IOMMU failed\n");
>> +            return rc;
> This is definitely wrong as you will return with spinlock held and memory not freed.
Fixed it.  And also split this function into two parts for better read
>
>> +        }
>> +
>> +        /* Keep overlay_node address in tracker. */
>> +        tr->nodes_address[j] = (unsigned long)overlay_node;
>> +    }
>> +
>> +    INIT_LIST_HEAD(&tr->entry);
>> +    list_add_tail(&tr->entry, &overlay_tracker);
>> +
>> +    spin_unlock(&overlay_lock);
>> +
>> +    if ( nodes_full_path != NULL )
>> +    {
>> +        for ( i = 0; i < tr->num_nodes && nodes_full_path[i] != NULL;
>> +              i++ )
>> +        {
>> +            xfree(nodes_full_path[i]);
>> +        }
>> +        xfree(nodes_full_path);
>> +    }
> This block of code is identical to the one at the end so some cleanup is necessary.
Created a common function for this as this will happen in three places. 
I missed freeing memory in remove_node failure cases.
>
>> +
>> +    return rc;
>> +
>> +/*
>> + * Failure case. We need to remove the nodes, free tracker(if tr exists) and
>> + * tr->dt_host_new.
>> + */
>> +remove_node:
>> +    tr->num_nodes = j;
>> +    rc = remove_nodes(tr);
>> +
>> +    if ( rc )
>> +    {
>> +        /*
>> +         * User needs to provide right overlay. Incorrect node information
>> +         * example parent node doesn't exist in dt_host etc can cause memory
>> +         * leaks as removing_nodes() will fail and this means nodes memory is
>> +         * not freed from tracker. Which may cause memory leaks. Ideally, these
>> +         * device tree related mistakes will be caught by fdt_overlay_apply()
>> +         * but given that we don't manage that code keeping this warning message
>> +         * is better here.
>> +         */
>> +        printk(XENLOG_ERR "Removing node failed.\n");
>> +        spin_unlock(&overlay_lock);
>> +        return rc;
>> +    }
>> +
>> +err:
>> +    spin_unlock(&overlay_lock);
>> +
>> +    if ( tr->dt_host_new )
>> +        xfree(tr->dt_host_new);
>> +
>> +    xfree(tr->overlay_fdt);
>> +    xfree(tr->nodes_address);
>> +    xfree(tr->fdt);
>> +
>> +    if ( nodes_full_path != NULL )
>> +    {
>> +        for ( i = 0; i < tr->num_nodes && nodes_full_path[i] != NULL;
>> +              i++ )
>> +        {
>> +            xfree(nodes_full_path[i]);
>> +        }
>> +        xfree(nodes_full_path);
>> +    }
>> +
>> +    xfree(tr);
>> +
>> +    return rc;
>> +}
>> +
>>   long dt_sysctl(struct xen_sysctl_dt_overlay *op)
>>   {
>>       long ret;
>> @@ -395,6 +898,13 @@ long dt_sysctl(struct xen_sysctl_dt_overlay *op)
>>   
>>       switch ( op->overlay_op )
>>       {
>> +    case XEN_SYSCTL_DT_OVERLAY_ADD:
>> +        ret = handle_add_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
>> +        if ( ret )
>> +            xfree(overlay_fdt);
> See my comment about xfree in previous patch
  I am sending v7 with fix for 15/19 patches also. Please review that.
>
>> +
>> +        break;
>> +
>>       case XEN_SYSCTL_DT_OVERLAY_REMOVE:
>>           ret = handle_remove_overlay_nodes(overlay_fdt, op->overlay_fdt_size);
>>           xfree(overlay_fdt);
> ~Michal


