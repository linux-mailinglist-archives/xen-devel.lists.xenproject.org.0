Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F9345B1DD5
	for <lists+xen-devel@lfdr.de>; Thu,  8 Sep 2022 15:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403333.645407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHBO-0002ET-Vl; Thu, 08 Sep 2022 13:03:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403333.645407; Thu, 08 Sep 2022 13:03:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWHBO-0002B4-SG; Thu, 08 Sep 2022 13:03:02 +0000
Received: by outflank-mailman (input) for mailman id 403333;
 Thu, 08 Sep 2022 13:03:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=56Vh=ZL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWHBN-0002Ay-2v
 for xen-devel@lists.xenproject.org; Thu, 08 Sep 2022 13:03:01 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-eopbgr60067.outbound.protection.outlook.com [40.107.6.67])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 901cb174-2f76-11ed-a31c-8f8a9ae3403f;
 Thu, 08 Sep 2022 15:02:59 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR0402MB3892.eurprd04.prod.outlook.com (2603:10a6:208:11::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.18; Thu, 8 Sep
 2022 13:02:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.014; Thu, 8 Sep 2022
 13:02:55 +0000
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
X-Inumbo-ID: 901cb174-2f76-11ed-a31c-8f8a9ae3403f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gEVSfDU1c4Q7q4oSmY7IlV3KVK32ynungNzQ6WM1Kwxu1FOaHoyWjAhFXhQElIElZ3z4ky2BAUGmmMgEJ+SwsC3xyJI+dTLCZBDedLiN85GZyFIKgjysADh4p2VIywli7430iM00AtsgZWBUR9a7oNRFLxPcP2yn9qk76i+qUkrFkzD+waHz/jUoadENWMJ+giM/s78vd9fRBMYdCygYytHVzrnrR7X16Af/yAKoIsdoc3MVNUSeM514+Y9E0maR7Nhi7N7c7W6BVj6OmrUNhbisAm2Q/sCE3NtMcC9fWoPItf+BUoTQPSGo4cPj9q0axocAwHj7OsFX48djKmW2Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ZezF46r6xIcbGdDNQ19SoK7mLvv0hwZ/KPQ5tp41J0=;
 b=hDISNb/QaWtLKgGRbd5sAobn/l98Tma0LwTm6KjrDc4mju76OpvOCBD5mgofjInQ190ETDX0T7lVvU9C8rC7N2vIlP4fH1kHYmanz93J08Pp0jJijTWlcAAh1+kKVW+FIfGKa9o9k+8VolZt09HUk7BOefNJeA0RAQ5HufsOFZvwXBQrxWkD20/QDhOcqt73uf0KXhxrv+iwSl9hHoJl07GyHLv+BWPSd6qtGH/IwBfJJHP0/do8MbetnLnC/uVHO6wDUCh9rFYeMeZc2f2FNpl/XnWkpDGKpRZxNbDO5innnR/X+WYVtaxquijJz5Ht4hec8l4eAWDyBLgsqi9Enw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4ZezF46r6xIcbGdDNQ19SoK7mLvv0hwZ/KPQ5tp41J0=;
 b=ziBoWvK9DJ32I4dvL6Zl7Yq1hBANZk/vTNPTcUcpY5nDl3vjXwRRWLBtPuIkb5ANGe+4hvf4rutUiY0REO1jM65rrVxyJy8A7FLwU51M2oB1DMUhEYq2qm6uDt/ZiUPYDiuZUda57LRPcMi7sXn4Dji4FKlytxg+hVOyvwxUoD2XIcwbXZmCOTSSJuriprtEU6PSw0GNg+En+FaJ5YpcekY8zyb9H4rD6Gyi8+7hqarv7H2Sl+o3E1tVrH0WBr5K0U1NLlkfe7pg02lrZ6nxa+thSYpRiLHhV8H4taocfyU4Bqx9XXCGbFGXi+jFOVKi0nlCcXkM4lqH4/HFvr7EBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <837f7b6d-0d73-a352-17e6-5c12e06dab95@suse.com>
Date: Thu, 8 Sep 2022 15:02:53 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v4 5/6] xen/x86: move NUMA scan nodes codes from x86 to
 common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220902033121.540328-1-wei.chen@arm.com>
 <20220902033121.540328-6-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220902033121.540328-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR0402MB3892:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fcf218-761a-4dff-9d2a-08da919a7218
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UssARKcXZR+JUqrw2UvUkMeHz8F63GxOOwbVdICYA5D451B8N+B8iC8ZxFz4VNPFXZP1lIZHkZtrY7iYdR2n32SESN95dyk56i2UV2EooaMcNAtQEfoODs1yPnw9Am71TBfOIOdH8P9EbEp+YSYpBPU/+lfZHkDDXqqE6OCgK7N6ElmxJ0X1UghBc7SMvU9SdQm6IZ+PRc98U5seI/FP3vTSaGny24axqQLS+RuPjudn9w+ypHT2DTmUYzxo+uyAt1Q6xIWywVVapRSdz2WGFV2iMExDAYiARBkKktcV7knxndWEX47ktScwlF/oJYb4wuCraoCPZWrVjU5mDlGDTQ1OSPIH461WEQGNRYS+0K5OG4ebn8tea+Egph3GAucexfAsp23BjqSG6DcfDTjfTbFgsdqHb5pdtHPB4Wv/KzP+CUe4XsfxfVcnUWdwUcOQYlCoj+M6RYMBgIhibW+QevmPWFK4KL0TqrwUCiLi5OD04vrY9gaFzP3QRqWsbcqFnPvaDI5chuLUuhJB1oLfBenT4CBPjW4hrfgbkun2B2484iEys2Ugb2MoNYehH3Vl7cagC1rnXT+EAq/QiWtjvHKULNS5FSP3z3Anzk44blYIqHZmkShPIuUrY5XzlaBuYpr0dcKsn4TQQdT2PHFIxnwjQpclBPWbWz22p2I4nXb1kOhXmuvvV+6e0jszSyz9CgqVrVf/8JiBQIg5jjV2IJ5gwLLjq2wFhk9aFVf1QPndMQ1rkmi2gt8ZAeOSa04PNgRyYQzsa5iGG1T5OIftpKdIrrazjIYwUBbL2+/cqS0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(39860400002)(396003)(376002)(366004)(136003)(346002)(54906003)(316002)(31696002)(6916009)(2906002)(86362001)(66476007)(66556008)(8936002)(66946007)(5660300002)(38100700002)(8676002)(4326008)(2616005)(36756003)(31686004)(478600001)(83380400001)(6486002)(186003)(41300700001)(6512007)(26005)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cS82Yk1NRGZvaGhkcENjbEFuS3d0MDY0VjNwVXlLcFdYSEtWaUVydWpqQmJN?=
 =?utf-8?B?aUNJS0FJVmZIMTcrRHpEc0pYQzhFcENNTk1nZ296WEZEL3NnUTNxTHNGUVVt?=
 =?utf-8?B?eW1BajRud3dxczlhanVOMGdDaG9kbENYQXQwd0ZDM3MxbjdZR2o0VThNMnF2?=
 =?utf-8?B?K1NqZFdzZVN1RXQyU0NnOHR3N010MEgzcWRONEZyZ2E1dzIrYlNqclNDVko2?=
 =?utf-8?B?TjZySzJGckZtUlBaZEJhRTBGbnVGY2p3NmpjN1g5czZvNitwWXZKSTMzUlI2?=
 =?utf-8?B?b0xrU21TOEUvbWhxRXh0ZXBhRitUbmNLTkpjWlZxWlFIejc0QXQ0QlNYaEZW?=
 =?utf-8?B?ejlMd0taRzlsWCtHQ0d3Uk8vTWFGOUxCMW9wR2FLMTFidDdFLy9YMWY4ZHRC?=
 =?utf-8?B?L1ZZa0NLVU56VXFsU3hkZ2FMVzlDQ2lQUWhNZHRZcmxVVndVZTR6WFBZVmxt?=
 =?utf-8?B?MWFUTXUyQi96VUZqSGk4WW9DemszamkzbkN4OWRIeWxrQ3U2T3lNS3BCWjRp?=
 =?utf-8?B?endSeHpmckNTa2xValIzcE96cy90YW84VFpPNUJvbW9zM2pXRWtwSTFCNW9F?=
 =?utf-8?B?d09jTWo2OER4NTA2RDdyTE5QTzFqYllYNUM0TmloQVV2WkdleGJWckxlK204?=
 =?utf-8?B?bmpGVExkUThHbEg5RXpxMGtabWdkWVU1Yk9TWTJTaDgxdnJBcmtEdGQ5TXRD?=
 =?utf-8?B?MXE2UHE4VzE3cXBUSU0rUWpRc1k5dWl5OG9ON2VteWpmb05xUnZGQ01ydGZW?=
 =?utf-8?B?dEx3UmwvZkZFUDZ1aFlVZmk4enFpMDM0Yng3NHlsbnk4YkxiOGhCSW9YKy9s?=
 =?utf-8?B?UzJ4by9ibzU4ckN2TWgxYUs2QmZQSFIxZTZGczBEM1FJN1FmSE9mbFgyVHhL?=
 =?utf-8?B?V1hJcXNqMWNZdmZldXVaN0hocjcwMm9IQXE2bmVBTUxsTHBBcHN0NmI4S1Ur?=
 =?utf-8?B?RWZmNG5taGt0VVBNS2pvVHQrUWUrS0UwR1V1MWxiN3A4NHlZaEdoU0xaUXV1?=
 =?utf-8?B?ZzJVeTJaa0ZsbTFFQ1lMU3JEM0dWTnBwbWhMRlFJZWR3NSszNEYvZW15cEI5?=
 =?utf-8?B?b2V5M3BISktMSnQ1NTVwa3BmWkNYaG9xOFQwS0NidjBUaWJPV3dzRHBXaXhW?=
 =?utf-8?B?K2ZpYklPSXZNTittZzJHL2dEVmN5SEJiT1JtZ3NRbDBTV2hNV2M2enhWTyth?=
 =?utf-8?B?QTY1RWRpdGRZZUowczV6SkdZczhNVmRWckJ6QXJ4ZUhmVFp4djk0SklQdDIz?=
 =?utf-8?B?NEp2aEhBM0hiRXQ0QlhPQ1RScUsrQ0xKNXRvTGowb214VUtLMHAzQ1VnZVE3?=
 =?utf-8?B?cVdsaDZZdHBOdWJKODZTcFM4c0xOL3F2TkVVMzNKeWlISFRueXlseW5nbU8z?=
 =?utf-8?B?S1JxY3U2ZjNza2syRUpFd1ArdThrME1WMEU5SU5RbDc2YStlUlluTnM4VlR2?=
 =?utf-8?B?cDhhRnpaSVYyR1FOYTdOenptVWZiYWNmRThPMmRVcFVsN3ZsMDZCRTJoVncz?=
 =?utf-8?B?WURENWFxN3BiK0Z5V3hSQ1hzeVFrNHFzYmNCNUpxVVpwMk1HQVMwU2NTaUho?=
 =?utf-8?B?bjV6Sm1YWGlDYVpud3h6TUQraE1uOEVxek9NeVhEdXQ4Rm5kWm9kaUcva1RG?=
 =?utf-8?B?VnpmTFNSdGZWUXlqMlA4VGNRL1NTa2pZdmt1TUpxdWdZenhyZWttUDBXak5H?=
 =?utf-8?B?N0xKdUREMnFhQVJTb0ZMcHFKa1pnQWRoNTNiMW12YXlCSmxvTXhGMW54M2Fr?=
 =?utf-8?B?Zm50OC8xSDlMTGMreGJVdHh3RXRHd0pKY2luOWJ0a09uOXlVSGlPLzF0cWhV?=
 =?utf-8?B?ZjJBSkpKdXRMZk5TVUNDZlNvVnQ2OHFQclBINzd5WGFSU0R2YlJEckVWR1FJ?=
 =?utf-8?B?WUxvN2pDcGpGOEdld1h3dW9USFFob29VbDBTYXFBM2FoS0ZLc0t4WTlBaTRV?=
 =?utf-8?B?WDlCYjNMTUtYTG5NazgweDh4a21nK0czNkJDaUIzYVMrUUUyTkYwSVUrZzcr?=
 =?utf-8?B?aTk3eVBWaWNoRTQrTlhrRUJrdjM2R0tmVlRTVitFSjdJa3NudFZLekthdi9E?=
 =?utf-8?B?aWIrV0tRNWhkY1ZkWU9Jazl3Uitwek1VMW1zb0luRXpuT2xaOU04bWFnUmdw?=
 =?utf-8?Q?1lmWwlEuQBc60sz/PYkPCyMNm?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fcf218-761a-4dff-9d2a-08da919a7218
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2022 13:02:55.2803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RGJ05sS3910BoXFUwtzN4ThN0+Lc9MHoXQOsXfqKI8Tluo4947/lpIBpmkAGneg9qay/FRTNALEfCpvl7qV+Fw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR0402MB3892

On 02.09.2022 05:31, Wei Chen wrote:
> --- a/xen/arch/x86/numa.c
> +++ b/xen/arch/x86/numa.c
> @@ -41,9 +41,12 @@ int __init arch_numa_setup(const char *opt)
>      return -EINVAL;
>  }
>  
> -bool arch_numa_disabled(void)
> +bool arch_numa_disabled(bool init_as_disable)

I'm afraid my question as to the meaning of the name of the parameter has
remained unanswered.

> @@ -306,32 +218,27 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
>  void __init
>  acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  {
> -	struct node *nd;
> -	paddr_t nd_start, nd_end;
> -	paddr_t start, end;
>  	unsigned pxm;
>  	nodeid_t node;
> -	unsigned int i;
>  
>  	if (numa_disabled())
>  		return;
>  	if (ma->header.length != sizeof(struct acpi_srat_mem_affinity)) {
> -		bad_srat();
> +		numa_fw_bad();
>  		return;
>  	}
>  	if (!(ma->flags & ACPI_SRAT_MEM_ENABLED))
>  		return;
>  
> -	start = ma->base_address;
> -	end = start + ma->length;
>  	/* Supplement the heuristics in l1tf_calculations(). */
> -	l1tf_safe_maddr = max(l1tf_safe_maddr, ROUNDUP(end, PAGE_SIZE));
> +	l1tf_safe_maddr = max(l1tf_safe_maddr,
> +			      ROUNDUP(ma->base_address + ma->length,
> +			      PAGE_SIZE));

Indentation:

	l1tf_safe_maddr = max(l1tf_safe_maddr,
			      ROUNDUP(ma->base_address + ma->length,
			              PAGE_SIZE));

> @@ -33,7 +48,309 @@ bool __read_mostly numa_off;
>  
>  bool numa_disabled(void)
>  {
> -    return numa_off || arch_numa_disabled();
> +    return numa_off || arch_numa_disabled(false);
> +}
> +
> +void __init numa_set_processor_nodes_parsed(nodeid_t node)
> +{
> +    node_set(node, processor_nodes_parsed);
> +}
> +
> +bool valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; i < num_node_memblks; i++ )
> +    {
> +        struct node *nd = &node_memblk_range[i];

const? (This is particularly relevant with __ro_after_init.)

> +bool __init numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
> +                                     paddr_t start, paddr_t size,
> +                                     const char *prefix,
> +                                     bool hotplug)
> +{
> +    unsigned int i;
> +    paddr_t end = start + size;
> +    paddr_t nd_start = start;
> +    paddr_t nd_end = end;
> +    struct node *nd = &nodes[node];
> +
> +    /*
> +     * For the node that already has some memory blocks, we will
> +     * expand the node memory range temporarily to check memory
> +     * interleaves with other nodes. We will not use this node
> +     * temp memory range to check overlaps, because it will mask
> +     * the overlaps in same node.
> +     *
> +     * Node with 0 bytes memory doesn't need this expandsion.

Mind taking the opportunity and drop the 'd' from "expansion"?

> +     */
> +    if ( nd->start != nd->end )
> +    {
> +        if ( nd_start > nd->start )
> +            nd_start = nd->start;
> +
> +        if ( nd_end < nd->end )
> +            nd_end = nd->end;
> +    }
> +
> +    /* It is fine to add this area to the nodes data it will be used later */
> +    switch ( conflicting_memblks(node, start, end, nd_start, nd_end, &i) )
> +    {
> +    case OVERLAP:
> +        if ( memblk_nodeid[i] == node )
> +        {
> +            bool mismatch = !(hotplug) != !test_bit(i, memblk_hotplug);

No need to parenthesize "hotplug" here.

> +            printk("%sNUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
> +                   mismatch ? KERN_ERR : KERN_WARNING, prefix,
> +                   arch_nid, start, end - 1,
> +                   node_memblk_range[i].start, node_memblk_range[i].end - 1);
> +            if ( mismatch )
> +                return false;
> +            break;
> +        }
> +
> +        printk(KERN_ERR
> +               "NUMA: %s %u [%"PRIpaddr", %"PRIpaddr"] overlaps with %s %u [%"PRIpaddr", %"PRIpaddr"]\n",
> +               prefix, arch_nid, start, end - 1, prefix,
> +               numa_node_to_arch_nid(memblk_nodeid[i]),
> +               node_memblk_range[i].start, node_memblk_range[i].end - 1);
> +        return false;
> +
> +
> +    case INTERLEAVE:

Please don't add double blank lines anywhere (original code didn't have
these); there's at least one more instance below.

> +static int __init nodes_cover_memory(void)
> +{
> +    unsigned int i;
> +
> +    for ( i = 0; ; i++ )
> +    {
> +        int err;
> +        bool found;
> +        unsigned int j;
> +        paddr_t start, end;
> +
> +        /* Try to loop memory map from index 0 to end to get RAM ranges. */
> +        err = arch_get_ram_range(i, &start, &end);
> +
> +        /* Reach the end of arch's memory map */
> +        if ( err == -ENOENT )
> +            break;
> +
> +        /* Index relate entry is not RAM, skip it. */
> +        if ( err )
> +            continue;
> +
> +        do {
> +            found = false;
> +            for_each_node_mask( j, memory_nodes_parsed )

Please be consistent with style for constructs like this one: Either
you consider for_each_node_mask a pseudo-keyword (along the lines of
for(;;)), then there's a blank missing ahead of the opening
parenthesis. Or you consider this an ordinary identifier (i.e. the
function-like macro that it is), then there shouldn't be blanks
immediately inside the parentheses. (Same issue elsewhere.)

> +                if ( start < nodes[j].end
> +                    && end > nodes[j].start )
> +                {
> +                    if ( start >= nodes[j].start )
> +                    {
> +                        start = nodes[j].end;
> +                        found = true;
> +                    }
> +
> +                    if ( end <= nodes[j].end )
> +                    {
> +                        end = nodes[j].start;
> +                        found = true;
> +                    }
> +                }
> +        } while ( found && start < end );
> +
> +        if ( start < end )
> +        {
> +            printk(KERN_ERR "NUMA: No node for RAM range: "
> +                   "[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
> +            return 0;
> +        }
> +    }
> +    return 1;
> +}

Seeing the two returns (and no further ones in the function) - did
you not mean to also switch to bool/true/false here?

> +/* Use the information discovered above to actually set up the nodes. */
> +static bool __init numa_scan_nodes(paddr_t start, paddr_t end)

Is "above" in the comment actually still accurate? Aiui the discovery
is now in a different CU. Then perhaps "Use discovered information to
actually set up the nodes."

> +{
> +    unsigned int i;
> +    nodemask_t all_nodes_parsed;
> +
> +    /* First clean up the node list */
> +    for ( i = 0; i < MAX_NUMNODES; i++ )
> +        cutoff_node(i, start, end);
> +
> +    /* When numa is on with good firmware, we can do numa scan nodes. */
> +    if ( arch_numa_disabled(true) )
> +        return false;

Btw - the comment here doesn't help me figure your choice of
"init_as_disabled". The wording towards the end is also a little
odd, considering we're already in numa_scan_nodes(). Which further
points out that really there's no scanning here, just processing,
so maybe the earlier patch wants to rename the function to
numa_process_nodes()?

> +    if ( !nodes_cover_memory() )
> +    {
> +        numa_fw_bad();
> +        return false;
> +    }
> +
> +    memnode_shift = compute_hash_shift(node_memblk_range, num_node_memblks,
> +                                       memblk_nodeid);
> +
> +    if ( memnode_shift < 0 )

As previously pointed out: As of patch 2 memnode_shift is unsigned,
so this comparison is always false (and the latest Coverity will
point this out). You can't get away here without using an intermediate
(signed, i.e. plain int) variable.

> +    {
> +        printk(KERN_ERR
> +               "NUMA: No NUMA node hash function found. Contact maintainer\n");
> +        numa_fw_bad();
> +        return false;
> +    }
> +
> +    nodes_or(all_nodes_parsed, memory_nodes_parsed, processor_nodes_parsed);
> +
> +    /* Finally register nodes */
> +    for_each_node_mask( i, all_nodes_parsed )
> +    {
> +        if ( nodes[i].end - nodes[i].start == 0 )

nodes[i].end == nodes[i].start ?

> +            printk(KERN_INFO "NUMA: node %u has no memory\n", i);
> +
> +        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
> +    }
> +
> +    for ( i = 0; i < nr_cpu_ids; i++ )
> +    {
> +        if ( cpu_to_node[i] == NUMA_NO_NODE )
> +            continue;
> +        if ( !nodemask_test(cpu_to_node[i], &processor_nodes_parsed) )
> +            numa_set_node(i, NUMA_NO_NODE);
> +    }
> +    numa_init_array();
> +    return true;
>  }

While you said you'd check elsewhere as well, just to be sure: Please
add a blank line before the function's main "return". And perhaps
another one between loop and function call.

> --- a/xen/drivers/acpi/Kconfig
> +++ b/xen/drivers/acpi/Kconfig
> @@ -7,4 +7,5 @@ config ACPI_LEGACY_TABLES_LOOKUP
>  
>  config ACPI_NUMA
>  	bool
> +	select HAS_NUMA_NODE_FWID

Are you selecting an option here which doesn't exist anywhere? Or
am I overlooking where this new option is being added?

Jan

