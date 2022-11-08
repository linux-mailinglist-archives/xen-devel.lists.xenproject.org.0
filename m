Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427716219DC
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 17:56:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440319.694480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRsk-0002pa-Pg; Tue, 08 Nov 2022 16:55:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440319.694480; Tue, 08 Nov 2022 16:55:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osRsk-0002mz-M4; Tue, 08 Nov 2022 16:55:26 +0000
Received: by outflank-mailman (input) for mailman id 440319;
 Tue, 08 Nov 2022 16:55:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pYI3=3I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1osRsj-0002mt-ES
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 16:55:25 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061.outbound.protection.outlook.com [40.107.22.61])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22d84962-5f86-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 17:55:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8355.eurprd04.prod.outlook.com (2603:10a6:20b:3b7::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.23; Tue, 8 Nov
 2022 16:55:22 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5791.027; Tue, 8 Nov 2022
 16:55:22 +0000
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
X-Inumbo-ID: 22d84962-5f86-11ed-8fd1-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9B2yDepZDhca9iJkCKWTXXdc8jY2TYsZLvfbDsfjvviM1go6srjJM4zNucu6pqELdQHjN+kO2eKNqPnNP+2fIHJXDsGsb2Z6Xx5ACDsah++flDSofBs96AhwyQgwtECy4PUtYDK8XFMmrXoG4AdtTLdTmy/hoY02KQKBrixZ7hYhdZBHjZriE/IqIrgeR+Z1cG93ddJT++uNCKLn3DMvNWbK6gluP2V5SblncxjiLKy5rnUOROhQObdIBvJtg0Y75/GrfLRRpjtIH+Tyx6Dzhhu1LHiGDgF1WhAvF3IAVla3v5fXqITewy/zNggAKiJW5XJJ73jMXIJH3sWHlcbLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aX+6pI3IRzT1XJTvy2bh2DydG0lgzUV0zHMxdp9yMdM=;
 b=YJoqTUjeUaRMMxlO+qHChSqu+7JB1gUqGfHVJF69oHjdSLboFGfBAYykU2SepX2whfV3K2rHvG4VVvAG2jiK3mGIGUF4akJSJr/FsdvcNzzykZASfDyHi56JQiM7qrrTBP5GbdDLSLXxfEnzC5bX2pptSJajDIbEBZelo2hxluH7ZQUeiHuH9ZtwP35o6S6XSKPALu7O0GtEkP1S8BXz5AOMi/WBH610ahJdxHVC/st9S5WAryLHWor3XAEJqk/TduXgjQPl4beuOauchCU1/jmOiJ1B5XLKoWWguiB90FfQQ6bblFhXj9BgGDP3dk7YRj5fhIgYonbQFgNur1IWjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aX+6pI3IRzT1XJTvy2bh2DydG0lgzUV0zHMxdp9yMdM=;
 b=J2PjgFC5yE0F1N5ZPyek3IwbiMgT9zWTAJiR6LYbSVQKUnH/i3TFOQ+KRqHjoPG2xZ2R3RE6kAIM0FPpkKMY2nIz6hj8r0pCQ1zhUdTpvttMQ0kvcupLZ+L+Y6tqLX1Z58nS72L93fiFWhKzqMho9L/hDBoBDNBHhz++/UKY+TUBzEyS/HWbpPxQkoWfAdPsIegBpXrdd4cRkhthFXmwfqry2eDOZ3YwP5NAfMmyKsjNKoJq8SRJ6MGsXeqw0ZGVbnLaqlgnTNs2v3GNsGvBPqIyovIvhoVsNl66hkt3OBO3QsCRviZcqyBoMP03QZOue075VljWEDyrLnNUbkJb3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b957bbc9-20a1-fadc-5865-e4a6ff274a93@suse.com>
Date: Tue, 8 Nov 2022 17:55:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v7 5/6] xen/x86: move NUMA process nodes nodes code from
 x86 to common
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20221020061445.288839-1-wei.chen@arm.com>
 <20221020061445.288839-6-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221020061445.288839-6-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0005.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8355:EE_
X-MS-Office365-Filtering-Correlation-Id: f119a301-b0b7-463d-c0ee-08dac1aa0619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2ZOZ6xmA2NNnKY1uV2+vjFS33r3L2CqpXGLw8xax21I+AiwwniAdGs7L1fhjDucqT7O22AZA1vLms+Z7P8J67Cw4+2o1LlpztJeMvXkgit4ZqbsOhEC0eQZKc6bwG717eB6FErWFk+sxjJIdBknS7rZp5Fk8NHwLsWAi3Te9hgoezHtATVckza0X84fHSXZElZaRrETnTjfQB6RY4yua3mLRi2w4KKZk1//IoChGVwTwDefitj28ttG9EvT//cCuXix5uqHbaKsU5SiZnfu4BXELdVRT7syBgDNtY0OYU8kpblonxvEKfMQITo5Q/WRl8wawLKrOwr+1w90qHXvDtoGPs3+M/y+wFcNE+fyTTfGw1jIMGsniGXqVuVC1KkfSUmr8zLieRuW8Jxj+UKqnWjx5XkxHOUjCy/Ck9Oqa+KdGGLrsovBzUEyNSOc1gDurYTZ5vDY7bH5A35zpqQnh74g0zdXrtKS/Fp1DDi0k1pebkjlVvWNAJGGk4fdQp/P0H7tjMb/hm/NIfPas6SLW4Nv8t0S2WkfuaOu+yhIMrU4bMNvwNg58puBSmsZ7Clz2QxFklDEKdYa2BiwlWkKdlXLSlQdx5+edxz2A6B31ccW4w5hw0yTB3BvKjpgPgQ0YZAD6hTVWeQ1R8FeHO3c36j8MLDWYwEYHqvj2uhlYdJX+MCkQ4lCR+mqw5ZN42U6vnwNCo+j4wXdGMY/S5FQoOvZabYIFWRRcOc5XxGaWxMdBFMDGnMa06fLkmaGTk2QQymeB3ed4Jo3lkDu9+Ry3YXkU+e3d8nMZjyqe1hx+jqo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(346002)(136003)(396003)(376002)(39860400002)(451199015)(36756003)(186003)(83380400001)(38100700002)(2616005)(66476007)(86362001)(8936002)(31696002)(8676002)(41300700001)(4326008)(5660300002)(2906002)(6486002)(316002)(6512007)(6506007)(478600001)(26005)(31686004)(54906003)(6916009)(53546011)(66946007)(66556008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGV2NXo2ZkxQbTVMaWZGQmlxenlHbXpNTEVMcXFFdTFTMGExejduU3FLeWpH?=
 =?utf-8?B?bGJUL2tsS3NWV0t3YmZMaVFqc0crVkdYb3o0aDNxbW5rQ3B0ZXJZcjI5SDJr?=
 =?utf-8?B?WEp6N1BRQnNKRWdvdEprV0pxbkNhWkhZRWx4citRVDJycDRETW1XWld3c2pm?=
 =?utf-8?B?clRpV3RmM3FLeXVwekNaSFFic1dpOUE3WFl1cW4xcEQwVERieklNaEs0Tm5o?=
 =?utf-8?B?cDMvY0cybkxGY2h4RmsreGk0eTdtdXVmRlB2S1J4SHlIMWlXNzNtdkRISWhC?=
 =?utf-8?B?TE1paHZ6Qm9SRG1ma1lZNk9OVGVsYnFIUm82T1RsZk9GVk1YTzZvTEpyU1ZF?=
 =?utf-8?B?cnRHRWk1M3J4U1VtQ01BK2hCMGdNNVZnYVl6dmRhYTBQNitSWHNWNXAyZTlS?=
 =?utf-8?B?eG5UZXpvNlZWY3k2QlhiUlplcTNRU1p3RmNjZzdabmFia1NnUzZrLytzamE3?=
 =?utf-8?B?cGRPVFVYdDdwYXFnQlR3c0l3Q25ENm1WQlB5eGlWVFBqYlNZSHluMURCR2Rh?=
 =?utf-8?B?eGMrVmRsN0M5alh6RHZiOTFaQkRXMDJGK01PTmVjWG16UEdVMWYxa1p6ZG5E?=
 =?utf-8?B?ZEJ6VlNMWGREZVhHejlpVFVPV3lwaDYxaWlHUk1lQWxKZTRHYjhOdE5SNlR4?=
 =?utf-8?B?MW1na0hNY3BUSmpoUDRGdFp3WGRRaXAzUnBXK2FJVWFDMC9JcjVJeXRLUFFW?=
 =?utf-8?B?cUFXWnJrYmd5ZlZjRUlCZlZhUytBT0FUR0NOT3BlelRHRUloNUR4cFl2cTJF?=
 =?utf-8?B?RmZyVmlCZFdxeitIblVHOGYreCtrVFpkZngwNUNLcUxGS2xjZkgvRHhZMEh0?=
 =?utf-8?B?YW4wTWhBUUdhRGM0YW50bFFBZy9sMXBqcXM3bXROYmF3VzJ2OFN2YjV3Z3cw?=
 =?utf-8?B?b1ljOHZFbXJQeHhkZVcySGVYVDYwOWFJRlJ3b3BkcUt4NW53V1VQdURPVlhG?=
 =?utf-8?B?OVJhb1pDS1RCVE5pdXZySmZiSUY4UGNMSzZYMERFeEJybi9TMzdVcUV1d3NZ?=
 =?utf-8?B?d2dkeThRVzRDTXlLYnpHYWVMbVRNb3VRb0lXWlpvSVFDM0hlR0NiVEhpbTlJ?=
 =?utf-8?B?ajJoKzFnWFZYcW1YY093YnRxazdIOGcwaml2TWNDUjVLRWZCcGtneXdlK0hu?=
 =?utf-8?B?M0lQRlVFeVlFZEx2WjFISWo4MHFXZmtCUnJUdXpmL3BMbCtEY1BIS0tGSEd4?=
 =?utf-8?B?WW82YXpZR01tMzdzNURDd2Z5TXVYL0dyeVdWTzNTTXBMeDdTaFUzaW5aNndD?=
 =?utf-8?B?R0gzdmtFUzJPMnVVYU55L3l5VVpCMG1yRXUydldDcUhGQVNaUThUUlBGZjJ2?=
 =?utf-8?B?aEN6QkJ6MVR0YmNOMWVOaWI2MVYzVkIvcFFPRWFxU0RMTmpXL1Z3VFJjZnhk?=
 =?utf-8?B?VHFlWkFXNjFMd2FYOU4vakRtdWlGVCt2anZLZ25BYWZnYnJ0Q1lPK21TbE1H?=
 =?utf-8?B?ZWF0Um4rYTk4SnlpenhkWFpod3QzOWpQZjhiL1ZjOXl6K2xGbWR0Z0o4Nk1P?=
 =?utf-8?B?cndFMXVhYVhjcmo2dFF1aVdJSWtGZjk4YUJYVHRrR3JHQkNMeDdYdU03bW10?=
 =?utf-8?B?VkV3STZYbFFRWnZGZlk4bFYwUzBOTGdnaTZJNm8xa2h1OTVteGkrT2VOTmVo?=
 =?utf-8?B?NmpFcE0yRGFoTXVmUUlFTkQ4eXJ4eFlNdmR6Vkd6bWRzY3Y2d2MwcGhwMjZr?=
 =?utf-8?B?SkJIY3FCUkordjU1NnJacXNQaXE5NUt4akY2Zy9CdjVqYTJJYlpaVzZXOHkv?=
 =?utf-8?B?MVlaL1NLSHc5S2tVdGlSK3VZMnl5R2ZwaU82aFFDUDhodVJqSHZ1N2dEVDVE?=
 =?utf-8?B?bFBUUHdkSGc1VjFTZnE5R2RaMkliU1dXbk9HWE1uNGljTzJWd084a2tnRjVN?=
 =?utf-8?B?cHAvRkQ3N29FQmhVMmtUQ2dsdEpBM05QcEFIdWtuMWRZK3dtTjhWUVdWQUti?=
 =?utf-8?B?M3RLRnpCOEQxcWJRMGl0Y0xFUkJmbWt3TWhVUjU3eXVSWXJuS2QrU1NyYVBU?=
 =?utf-8?B?a2t1VUNOSVJ4YVBTb2ZlSGtkNXYyclYvbm9JeFBEZlEvU0dUNXNoRmxWRXJP?=
 =?utf-8?B?a294TlE2Sm1FckpkSGtTeXd5UVdjV1ZZS1FSV3MrV3pIM2dZa1lLMldYK0FX?=
 =?utf-8?Q?W6LAGXsLOdEIz7Bu8bDPa2F+I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f119a301-b0b7-463d-c0ee-08dac1aa0619
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 16:55:21.9329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T9q0Zyjh3gAkoyT6Gmk42RaMYTKze+vBe8FjM8FqsYNyBLqZdik4gKxbGY5UYnNUwdGNrOER8DSEK2h7ZYgs1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8355

On 20.10.2022 08:14, Wei Chen wrote:
> x86 has implemented a set of codes to process NUMA nodes. These
> codes will parse NUMA memory and processor information from
> ACPI SRAT table. But except some ACPI specific codes, most
> of the process code like memory blocks validation, node memory
> range updates and some sanity check can be reused by other
> NUMA implementation.
> 
> So in this patch, we move some variables and related functions
> for NUMA memory and processor to common as library. At the
> same time, numa_set_processor_nodes_parsed has been introduced
> for ACPI specific code to update processor parsing results.
> With this helper, we can reuse most of NUMA memory affinity init
> code from ACPI. As bad_srat and node_to_pxm functions have been
> used in common code to do architectural fallback and node to
> architectural node info translation. But it doesn't make sense
> to reuse the functions names in common code, we have rename them
> to neutral names as well.
> 
> PXM is an ACPI specific item, we can't use it in common code
> directly. As an alternative, we extend the parameters of
> numa_update_node_memblks. The caller can pass the PXM as print
> messages' prefix or as architectural node id. And we introduced
> an numa_fw_nid_name for each NUMA implementation to set their
> specific firmware NUMA node name. In this case, we do not need
> to retain a lot of per-arch code but still can print architectural
> log messages for different NUMA implementations. A default value
> "???" will be set to indicate an unset numa_fw_nid_name.
> 
> mem_hotplug is accessed by common code if memory hotplug is
> activated. Even if this is only supported by x86, export the
> variable so that other architectures could support it in the future.
> 
> As asm/acpi.h has been removed from common/numa.c, we have to
> move NR_NODE_MEMBLKS from asm/acpi.h to xen/numa.h in this patch
> as well.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>

There's just one remaining concern I have: I continue to consider ...

> @@ -341,159 +247,14 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  		pxm &= 0xff;
>  	node = setup_node(pxm);
>  	if (node == NUMA_NO_NODE) {
> -		bad_srat();
> +		numa_fw_bad();
>  		return;
>  	}
>  
> -	/*
> -	 * For the node that already has some memory blocks, we will
> -	 * expand the node memory range temporarily to check memory
> -	 * interleaves with other nodes. We will not use this node
> -	 * temp memory range to check overlaps, because it will mask
> -	 * the overlaps in same node.
> -	 *
> -	 * Node with 0 bytes memory doesn't need this expandsion.
> -	 */
> -	nd_start = start;
> -	nd_end = end;
> -	nd = &nodes[node];
> -	if (nd->start != nd->end) {
> -		if (nd_start > nd->start)
> -			nd_start = nd->start;
> -
> -		if (nd_end < nd->end)
> -			nd_end = nd->end;
> -	}
> -
> -	/* It is fine to add this area to the nodes data it will be used later*/
> -	switch (conflicting_memblks(node, start, end, nd_start, nd_end, &i)) {
> -	case OVERLAP:
> -		if (memblk_nodeid[i] == node) {
> -			bool mismatch = !(ma->flags &
> -					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
> -			                !test_bit(i, memblk_hotplug);
> -
> -			printk("%sSRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with itself [%"PRIpaddr", %"PRIpaddr"]\n",
> -			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
> -			       end - 1, node_memblk_range[i].start,
> -			       node_memblk_range[i].end - 1);
> -			if (mismatch) {
> -				bad_srat();
> -				return;
> -			}
> -			break;
> -		}
> -
> -		printk(KERN_ERR
> -		       "SRAT: PXM %u [%"PRIpaddr", %"PRIpaddr"] overlaps with PXM %u [%"PRIpaddr", %"PRIpaddr"]\n",
> -		       pxm, start, end - 1, node_to_pxm(memblk_nodeid[i]),
> -		       node_memblk_range[i].start,
> -		       node_memblk_range[i].end - 1);
> -		bad_srat();
> -		return;
> -
> -	case INTERLEAVE:
> -		printk(KERN_ERR
> -		       "SRAT： PXM %u: [%"PRIpaddr", %"PRIpaddr"] interleaves with PXM %u memblk [%"PRIpaddr", %"PRIpaddr"]\n",
> -		       pxm, nd_start, nd_end - 1, node_to_pxm(memblk_nodeid[i]),
> -		       node_memblk_range[i].start, node_memblk_range[i].end - 1);
> -		bad_srat();
> -		return;
> -
> -	case NO_CONFLICT:
> -		break;
> -	}
> -
> -	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
> -		node_set(node, memory_nodes_parsed);
> -		nd->start = nd_start;
> -		nd->end = nd_end;
> -	}
> -
> -	printk(KERN_INFO "SRAT: Node %u PXM %u [%"PRIpaddr", %"PRIpaddr"]%s\n",
> -	       node, pxm, start, end - 1,
> -	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
> -
> -	/* Keep node_memblk_range[] sorted by address. */
> -	for (i = 0; i < num_node_memblks; ++i)
> -		if (node_memblk_range[i].start > start ||
> -		    (node_memblk_range[i].start == start &&
> -		     node_memblk_range[i].end > end))
> -			break;
> -
> -	memmove(&node_memblk_range[i + 1], &node_memblk_range[i],
> -	        (num_node_memblks - i) * sizeof(*node_memblk_range));
> -	node_memblk_range[i].start = start;
> -	node_memblk_range[i].end = end;
> -
> -	memmove(&memblk_nodeid[i + 1], &memblk_nodeid[i],
> -	        (num_node_memblks - i) * sizeof(*memblk_nodeid));
> -	memblk_nodeid[i] = node;
> -
> -	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
> -		next = true;
> -		if (end > mem_hotplug)
> -			mem_hotplug = end;
> -	}
> -	for (; i <= num_node_memblks; ++i) {
> -		bool prev = next;
> -
> -		next = test_bit(i, memblk_hotplug);
> -		if (prev)
> -			__set_bit(i, memblk_hotplug);
> -		else
> -			__clear_bit(i, memblk_hotplug);
> -	}
> -
> -	num_node_memblks++;
> -}
> -
> -/* Sanity check to catch more bad SRATs (they are amazingly common).
> -   Make sure the PXMs cover all memory. */
> -static int __init nodes_cover_memory(void)
> -{
> -	unsigned int i;
> -
> -	for (i = 0; ; i++) {
> -		int err;
> -		unsigned int j;
> -		bool found;
> -		paddr_t start, end;
> -
> -		/* Try to loop memory map from index 0 to end to get RAM ranges. */
> -		err = arch_get_ram_range(i, &start, &end);
> -
> -		/* Reached the end of the memory map? */
> -		if (err == -ENOENT)
> -			break;
> -
> -		/* Skip non-RAM entries. */
> -		if (err)
> -			continue;
> -
> -		do {
> -			found = false;
> -			for_each_node_mask(j, memory_nodes_parsed)
> -				if (start < nodes[j].end
> -				    && end > nodes[j].start) {
> -					if (start >= nodes[j].start) {
> -						start = nodes[j].end;
> -						found = true;
> -					}
> -					if (end <= nodes[j].end) {
> -						end = nodes[j].start;
> -						found = true;
> -					}
> -				}
> -		} while (found && start < end);
> -
> -		if (start < end) {
> -			printk(KERN_ERR "NUMA: No NODE for RAM range: "
> -				"[%"PRIpaddr", %"PRIpaddr"]\n", start, end - 1);
> -			return 0;
> -		}
> -	}
> -	return 1;
> +	numa_fw_nid_name = "PXM";

... this to be happening too late. Not because I can see a way for current
code to use the variable earlier, but because of the risk of future code
potentially doing so. Afaics srat_parse_regions() is called quite a bit
earlier, so perhaps the field should (also?) be set there, presumably
after acpi_table_parse() has succeeded. I've included "(also?)" because I
think to be on the safe side the setting here may want keeping, albeit
perhaps moving up in the function.

Jan

