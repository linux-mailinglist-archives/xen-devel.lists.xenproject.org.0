Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D425449DF
	for <lists+xen-devel@lfdr.de>; Thu,  9 Jun 2022 13:20:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.345082.570726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGCq-0004gS-RM; Thu, 09 Jun 2022 11:20:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 345082.570726; Thu, 09 Jun 2022 11:20:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nzGCq-0004bP-MK; Thu, 09 Jun 2022 11:20:04 +0000
Received: by outflank-mailman (input) for mailman id 345082;
 Thu, 09 Jun 2022 11:20:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jWvP=WQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1nzGCp-0004Mo-7L
 for xen-devel@lists.xenproject.org; Thu, 09 Jun 2022 11:20:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20600.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a743aab-e7e6-11ec-bd2c-47488cf2e6aa;
 Thu, 09 Jun 2022 13:20:01 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by HE1PR0402MB3354.eurprd04.prod.outlook.com (2603:10a6:7:85::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Thu, 9 Jun
 2022 11:19:58 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::dfa:a64a:432f:e26b%7]) with mapi id 15.20.5332.013; Thu, 9 Jun 2022
 11:19:58 +0000
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
X-Inumbo-ID: 1a743aab-e7e6-11ec-bd2c-47488cf2e6aa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbc+qkexA7gMgQHU3w/UAVmCTpfYhKm+x91BugYdYKnkMSE/jEx6mBpeO5/gKyflXrEXucf/7xrzYhGUYwCrKZNo1+p2W6d0mNtFyQCr7FTiz54gNgkb1TRRZAU4Cr0RTq8I4Hz88siGvbatzA8Pgu86ldfNX1UWDZChZyKv5UBmZVpNHYK3Rt8jcDTTZDtYrSyCgzHpJ+bY43/nbTLOKhCmYwjyQAk044jeFB/ZfAkh8zGmAr+BUir1gNK5RAzw0ZbsrgHZ915Pc8O/Rw8haq9a+LQUm/qW7ZexoK7G2fUlMu5T3wmREBtY7YkVQsRdn6VjiAWyZ6Vwyw7x+GWALg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wKx6xv7ny6SA1H3YTbytFXJJbnPaawkf7qGDv7wwlbA=;
 b=ASHQ8cktU0xFLE1uEmxwtbHmooPKZ4RW+phf9zNoEfAMCYryfjajx8KNFGwSZnk31MTxWf8inFEsP1TYxqR8ybnKpm3R3UrAgxNNLon/tLtcqt6nIwDEvY+ocHQeEFXAPRMM5Iol2h3oB2YCtEgq4oDBHGQpz/phBXzAmZF9/R9dRM26YDQCOzNsDmidFzClSoPrf5fza+6P9r37YrbI+TRdhnf8uOLlZpfigxMGnmhM2BSkYidoIN9jN06MhWRgk+xVwbXMhgxjMo/pVf1nF28uiJotH6IsgtqrBgsWrw+XCbH4Fhu0fYHjgtIc50tWxGE5nRIljpMqMNQUBkcjnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wKx6xv7ny6SA1H3YTbytFXJJbnPaawkf7qGDv7wwlbA=;
 b=bUhFowCEL/WqGmWTdtWIZ+g+hjqMirZFxlVUp5sLGerb14XzL3oFEp6G1UR11cb8WWFJsr86Huqq07NQytmUJZQHM5fBLZaQdUwyMwfv6rQo0QP7K/3OdyeTPUkxTiOW4hQF/jjn0d8qiA/EKTtyKVYQcerg/IBlokX9dZMwbLtCy9ddrgRQo3LUUCzbZ+O+Ll5S5c6ar+VtRWJXknYg1aSAENTkCpQznFMNUSAwKHvHY3/f1eYVaWnLdTDf8bJ0nH6Dn4s7OdoEKgO15nHTnB8FWp48tGHCYbqs5HlP4SgBp88afiRobphaarvQLjBZu9lvTVxOKu9W+WUvIdU6RA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c1c36273-af87-07b8-9770-93e6be5e60e2@suse.com>
Date: Thu, 9 Jun 2022 13:19:56 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 7/8] xen/x86: add detection of memory interleaves for
 different nodes
Content-Language: en-US
To: Wei Chen <wei.chen@arm.com>
Cc: nd@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Jiamei Xie <jiamei.xie@arm.com>, xen-devel@lists.xenproject.org
References: <20220606040916.122184-1-wei.chen@arm.com>
 <20220606040916.122184-8-wei.chen@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220606040916.122184-8-wei.chen@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS9PR06CA0253.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::21) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f799e0a1-1fe8-404e-6925-08da4a09fcf9
X-MS-TrafficTypeDiagnostic: HE1PR0402MB3354:EE_
X-Microsoft-Antispam-PRVS:
	<HE1PR0402MB33544F3128BC11EE268B065CB3A79@HE1PR0402MB3354.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BSFHU4ubLhLPvj+n+RCtAkNuqSmePicfV42iBZNE+UAmHVSu/sY5viarQiPwYKzOzbW9ZyNdY+XcUE9WcEVdVAVPbqSkz6noWNYnDkCo3rQtls7Y5yE9xD3JuAkuEIT0YsxdNACJn7gMnS5ZEbuMe7MNaoIepcjDg1MjGJacdOgKKvhunfnoqOv94U06kv5m2QNhfWq2SkY0W9ZBCQUBK3WZMZDtUIhQaZYAfYhbbaFgpgdBo09Ff5oHXIEvA9Auc27bm3MtNRYOq6udjzonGvLlR4SIeAa0lXtZba391PZtSptdfgxUyi3aMxcVe4sd6WypsJyWZ1H8/EyWIUIvYpLUGK+gt3gptGdsqxTWer4ohkyc8JVvVUkVbxmfDI2oDDjJ7zXBcuuhRshuJ+3axe2pVggCeBf5fm6M0cZQarKZeVkWkqZ5DQ6TZYGb2eZlfCsI9XQkJSUb0wPylLw7pkFFMXWmOsVPaMTzqrZPkaiM9jPkJwIwD1f4dTv4s0vFzUvj1hHBwKp7zgvZ5wa+j78zWrdLBlQuUW+sSCtrnHjVvwrC7PJIvfHlCiVM/oyRbXsMkuKry+ulcDx4lEdggc4205m1T2gIzwhY13XhsAP5lG4u1c1ZANkujtSVlDbh43hzBsocN1g4ZM5sHv4ldifkRMwRBl/dxka4ohJSlF+3rutIpdKwkgOJH1/aZ4WwtryIe2AwKBrT2drNpfq/OgmLyJ7Uci+5N4cyX5nq8/Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(316002)(38100700002)(4326008)(8676002)(31696002)(66556008)(86362001)(66946007)(66476007)(6916009)(54906003)(36756003)(2616005)(186003)(31686004)(53546011)(83380400001)(2906002)(6506007)(6512007)(26005)(508600001)(8936002)(6486002)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VTJKcFlXN2RQWnhlSlp4K29NU2VEZHVkOHM0cWNCNHlZMXZNTjlWZ2pXVGRO?=
 =?utf-8?B?aWpoNSsveEQ1WjM1WEtHdWxoSkRhdTBxYTIzRW1JZ05EeW1IandNbnIwNUlC?=
 =?utf-8?B?Q1JsaE0rZlo1QzlSNjR1TTZRd3gwVHhWTk80MThOeFdvU003a1lSbHU4anhi?=
 =?utf-8?B?eFdGSXYrUU5KdGV3TVRLWHpmVkI0NU1YNkpkd096OEVpVGhLUXJJT2dMRElG?=
 =?utf-8?B?VkdFWGJyZ0g5blFqK1JmYXNXODF3YW8vdW40L3UrWVRYSnl3dmllOUFzSkYx?=
 =?utf-8?B?d2l4YVBhMmk1UWI2Zk01eG1sdzdYZFR6NjhTamsvM1o4MlF0S0oweGtqT1Vy?=
 =?utf-8?B?MDFUUHA5SzJkZlNmSXA1djNkY2d4Z1ZUNi9UQmVFNVBsUDZqZ2JXR0I0dkRu?=
 =?utf-8?B?bytyQnlUbFZlMkFXTHNSeUw4N1Q2RzFyYzJjcnJlQmNhWTRUZVRvamF5UlVr?=
 =?utf-8?B?YkVreW1yL1NqMSs1L2toWERhdnZKek02cElDbGNRbGRCNDJYZVNQVFRHUm1Y?=
 =?utf-8?B?Y3M3TXM2dXdXY2lIb0g2TzZhV0dpV1lQdkNzTmdYc0hITkUzdHptOXg3NnJ5?=
 =?utf-8?B?a1NHZm1jRlFKMUtxay96REh6R2NWNUhWcVJoSmZhT1JadVpJdTBsV0VIMEJt?=
 =?utf-8?B?em5ZMmxrbHBXL2o3YjVRVll1QnRlZnZlWVJRWm0xNkNHOXMxb05YZEVtTE5y?=
 =?utf-8?B?elNtMzY0dS9vZzBlTldzRk91SHNNbFhQVWxMelIzNlJ2V3QzVURQWE15NTBF?=
 =?utf-8?B?YWFqajFjNnBGcGpRWVplOUxFbHF5SFZtS25JSUJ5VkR3THMveHc1M1Vya2Qz?=
 =?utf-8?B?Tml0SWNPbFpJSytnR1h3WTF4RWpXNmN3YXZCTU5lR0czK2hlZWVwbE45Mklj?=
 =?utf-8?B?eFdOWUJBT3daQlZUdWhXWDdLNCs3aDE5eGdJaUl3a20zSmM1OFpsUjFUSmR6?=
 =?utf-8?B?SFZFeVM3QlVVQ0VpN0NYM0lzOUVFdWFlVFM5L292Mmd5RUFVQk5RbWZCQmlM?=
 =?utf-8?B?NldLWUx4T21odHdzM0hEa1JyQVRQV21xMEJEU0xKRzZFaFZkMjNyWGF2OHBt?=
 =?utf-8?B?Y1pFZHNIbnBOZklONEpKc055WWdzSVdJbjVIZVZMdCtBRVRBbU5zRDZZOTVJ?=
 =?utf-8?B?WHZIeUlrekxaalJZUG1NdE1aRTdma245TzdXdm5BTFJiNVpBRzFEbkVuOHZ1?=
 =?utf-8?B?Yk1GRHRSUWNRSmtEQUVWZE0wa3E1RDRWUEZLVnRnL25IQmhLRjdCNFkyeU5h?=
 =?utf-8?B?SWNTMzF2VnV4T3hObDNrbHNNanZWcEM1K1RMMHk2bUtwa3I1VVBXWDlSVGJH?=
 =?utf-8?B?bGo3N2FRdWJBMWRsWE9mRUV2RHlmWEd4NnIxVFBZMEZDVndLTm9XTlIyT0M3?=
 =?utf-8?B?Q2NQTzdRcG9sN00vVGhMZ1hDMHA1N0pHNWwzVFprMzJKcXRxV1BmK1pXeisy?=
 =?utf-8?B?ekhtSlVtYnNQNXJrbU1LbTFURUJxcTNQRm4vc2VjVlF2UjQ1VzVMZ05uYnk5?=
 =?utf-8?B?czA5NUoycnhsNm52NXZqL21QeGlESWNnOVQwZWRiMWV3OTl1OG5saUpZMzhS?=
 =?utf-8?B?VnM3YkQrRFJkY1Y1Z0w1Q3V0Q0VZbjFwVk5idUJUT3RRdE5wL05TTHJacDNh?=
 =?utf-8?B?RVVrckFEcFNWMnVQSHpnNUU3YVk3bVdJWGRKU1c2RThiN0FoZUZMVXlIdDcr?=
 =?utf-8?B?YzE0M2Vid3gwY3NGeXY4SGIrczJ3dktvSWtCUXVIUjRpOTNxaHRLSzBVMGJO?=
 =?utf-8?B?N0taT0J6ekZyTEg1RHNTV0FhdEpyQlhCUFUyNGFkTVQvbDNmUFA3VklvVEIz?=
 =?utf-8?B?aW15WHJVVHVLMDRsdHlBUmphSDRjWllUZ0pxQXE5RWs4a0xZYUNxd0NnVzlL?=
 =?utf-8?B?ZUpXdjhOWWlCQW1JTGhLS0NFQjZ2cUtvY1AxRTZWOHB1aG5nd2N1RnFmTElT?=
 =?utf-8?B?QUJCblhCcFc4cDhkaTB6SmV3ZEhiMzM5anpuNVpDWklWcTJPSC96Q2ZNckxw?=
 =?utf-8?B?ODBrczV4NW53L202Q0VFUW9WZHhRMjU5cklHbUdHRXpNVFNPUlBTR2FnZk56?=
 =?utf-8?B?ZWNJcDFpS2ZjQjU2Q0hPYWpxQW1IajBsbWpacTB6bENMSnErU3FwWFpFZHA4?=
 =?utf-8?B?bFhTU3VKUkc4M25zTnEzaEdhRGl4TGFyU2NnYlZiMmpwZ3prRndkTmJNTXhG?=
 =?utf-8?B?WjI2NGJnMytvUVZzNDFZaTdsR01Ka2dBV212aVU5RmxTSlM1UTRPSTM4bFd3?=
 =?utf-8?B?N3pKS0tBdG5YN3cvT0paMEhDY0hqdndMaXR3MHNhZjlIZlBpMksrKzgzZTha?=
 =?utf-8?B?V2FJTmVjWVdwRVNVZkxaR29RbGpQT0M1UUw1SDhYOFJpeExpLzRUQT09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f799e0a1-1fe8-404e-6925-08da4a09fcf9
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2022 11:19:58.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MtG+ZNWBdnXXyibxYw/7ka57q7GReaPTLrPEhWrVwx5cGZ1uSShK92EZ7FNBcvmeO/Fv3DQ8gv+Pkli7QTuY4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0402MB3354

On 06.06.2022 06:09, Wei Chen wrote:
> v4 -> v5:
> 1. Remove "nd->end == end && nd->start == start" from
>    conflicting_memblks.
> 2. Use case NO_CONFLICT instead of "default".
> 3. Correct wrong "node" to "pxm" in print message.
> 4. Remove unnecesary "else" to remove the indent depth.
> 5. Convert all ranges to proper mathematical interval
>    representation.

As to this:

> @@ -310,44 +343,74 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
>  		bad_srat();
>  		return;
>  	}
> +
> +	/*
> +	 * For the node that already has some memory blocks, we will
> +	 * expand the node memory range temporarily to check memory
> +	 * interleaves with other nodes. We will not use this node
> +	 * temp memory range to check overlaps, because it will mask
> +	 * the overlaps in same node.
> +	 *
> +	 * Node with 0 bytes memory doesn't need this expandsion.
> +	 */
> +	nd_start = start;
> +	nd_end = end;
> +	nd = &nodes[node];
> +	if (nd->start != nd->end) {
> +		if (nd_start > nd->start)
> +			nd_start = nd->start;
> +
> +		if (nd_end < nd->end)
> +			nd_end = nd->end;
> +	}
> +
>  	/* It is fine to add this area to the nodes data it will be used later*/
> -	i = conflicting_memblks(start, end);
> -	if (i < 0)
> -		/* everything fine */;
> -	else if (memblk_nodeid[i] == node) {
> -		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
> -		                !test_bit(i, memblk_hotplug);
> -
> -		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
> -		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
> -		       node_memblk_range[i].start, node_memblk_range[i].end);
> -		if (mismatch) {
> -			bad_srat();
> -			return;
> +	switch (conflicting_memblks(node, start, end, nd_start, nd_end, &i)) {
> +	case OVERLAP:
> +		if (memblk_nodeid[i] == node) {
> +			bool mismatch = !(ma->flags &
> +					  ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
> +			                !test_bit(i, memblk_hotplug);
> +
> +			printk("%sSRAT: PXM %u [%"PRIpaddr"-%"PRIpaddr"] overlaps with itself [%"PRIpaddr"-%"PRIpaddr"]\n",

As said when discussing v4, mathematical representation is [start,end].
Please properly use a comma instead of a dash here and below plus ...

> +			       mismatch ? KERN_ERR : KERN_WARNING, pxm, start,
> +			       end - 1, node_memblk_range[i].start,
> +			       node_memblk_range[i].end - 1);
> +			if (mismatch) {
> +				bad_srat();
> +				return;
> +			}
> +			break;
>  		}
> -	} else {
> +
> +		printk(KERN_ERR
> +		       "SRAT: PXM %u [%"PRIpaddr"-%"PRIpaddr"] overlaps with PXM %u [%"PRIpaddr"-%"PRIpaddr"]\n",
> +		       pxm, start, end - 1, node_to_pxm(memblk_nodeid[i]),
> +		       node_memblk_range[i].start,
> +		       node_memblk_range[i].end - 1);
> +		bad_srat();
> +		return;
> +
> +	case INTERLEAVE:
>  		printk(KERN_ERR
> -		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
> -		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
> -		       node_memblk_range[i].start, node_memblk_range[i].end);
> +		       "SRAT： PXM %u: [%"PRIpaddr"-%"PRIpaddr"] interleaves with PXM %u memblk [%"PRIpaddr"-%"PRIpaddr"]\n",
> +		       pxm, nd_start, nd_end - 1, node_to_pxm(memblk_nodeid[i]),
> +		       node_memblk_range[i].start, node_memblk_range[i].end - 1);
>  		bad_srat();
>  		return;
> +
> +	case NO_CONFLICT:
> +		break;
>  	}
> +
>  	if (!(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE)) {
> -		struct node *nd = &nodes[node];
> -
> -		if (!node_test_and_set(node, memory_nodes_parsed)) {
> -			nd->start = start;
> -			nd->end = end;
> -		} else {
> -			if (start < nd->start)
> -				nd->start = start;
> -			if (nd->end < end)
> -				nd->end = end;
> -		}
> +		node_set(node, memory_nodes_parsed);
> +		nd->start = nd_start;
> +		nd->end = nd_end;
>  	}
> -	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
> -	       node, pxm, start, end,
> +
> +	printk(KERN_INFO "SRAT: Node %u PXM %u [%"PRIpaddr"-%"PRIpaddr"]%s\n",
> +	       node, pxm, start, end - 1,
>  	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
>  
>  	node_memblk_range[num_node_memblks].start = start;
> @@ -396,7 +459,7 @@ static int __init nodes_cover_memory(void)
>  
>  		if (start < end) {
>  			printk(KERN_ERR "SRAT: No PXM for e820 range: "
> -				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
> +				"[%"PRIpaddr" - %"PRIpaddr"]\n", start, end - 1);

... please be consistent with the use of blanks (personally I'd prefer
no blanks to be there, but I could see people preferring a blank after
the comma). Then
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

