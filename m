Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8EE6EDE45
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 10:40:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525891.817400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEDA-0006Rl-TU; Tue, 25 Apr 2023 08:39:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525891.817400; Tue, 25 Apr 2023 08:39:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prEDA-0006Q1-QW; Tue, 25 Apr 2023 08:39:44 +0000
Received: by outflank-mailman (input) for mailman id 525891;
 Tue, 25 Apr 2023 08:39:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prED9-0006Pv-Pc
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 08:39:43 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b957c739-e344-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 10:39:42 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6817.eurprd04.prod.outlook.com (2603:10a6:208:17e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34; Tue, 25 Apr
 2023 08:39:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 08:39:41 +0000
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
X-Inumbo-ID: b957c739-e344-11ed-b223-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTC+NTg1fAs4JOrL4+FF45IohpGITY5Mzghe8xmWVFStjPK8MX/klAH4yn0aFxJNaAwvZ6CTujpS2T+chRhiuMu2jniOAVQPRXTqhknotEppCAOyY6CenBHYAIrMtrgXwkofzbammLydoHVeTHrf9gGw0muth13nigP8jahYOU262FQ+ZmNcBV5K9ihQbymCIemfHGI5NF+9xe/XvuhP/5EY87sdMXl3+ZK4AgxG7ve8zf0CwTfq9rGM8aJETS21mBpT4nreFsd3S4kmYgZMb4pjpzo7YTAuLU0ngDeEo8x1ohjs3sX47vcOiVjM4dGTflAYkJgS4JKimC17YkvBYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FTceK13BVxbds1j7LGdf3l1aAsxCS1lDwoJf1eO/QPI=;
 b=SAAAqDmt5Ex1W1wHsz7oJkUD3DArlk/0NSE2J7zOp6azFFScZ8GIE3fYFUHFF/81OTNmUV2V1VZ5xk6TO+cJoMx8rcHRKw+fHW7qQlekIO0eTwm3eijDk86ikkRx/kZGVT+bYeBUgf6CdvQfJVxAF+sRpc19qAZftmJBARL+cgkIGvFJcMoTiAlPviG1h2P0cC9MxoIF1JODl3ocAji36AcjfBkhh2ReYPU4qE+OG2hlHGOWBzv3KzRPXlnuP2kHOUXV9N4Fcs/HLp80FsGvZUQIg3V41mfQpi8CBAv1zPXYfDGHpIMrcsTokKcCo8mzvuiZ/J/RNwowOdQQsl0+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FTceK13BVxbds1j7LGdf3l1aAsxCS1lDwoJf1eO/QPI=;
 b=DrL9mjql0R9fz8lzanA2JdV70efk+1LhzPORpPrRAw5fuo/UZWjrmtwNWP4JhDL0A2TCHjdf88TPkTmNyAPibKUSSn2fgi37piP9Zcru293fwatsgPgvVUF13rNGQhouvXQ44YYEFmlrhV7u2jhivpnazCifUte2f9NLFUnyUZ6M9SUvqZPGCc/UGDxpxDK8wohYr8h3GPOL8mWf3/LOqKKD2f3qs1vbb+LIIXim11U+u48w+FN7/tNakzeiYXui2qWeBbB85dBSbc3Cj0PapCCwXiEnpZTYGlOKOr1aWE06a8MWjK431PFFumuScPWmrrVXpmfRCSSbwJHEOMBz3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <188a01f0-a2d1-0f2d-4d01-61a259c790f1@suse.com>
Date: Tue, 25 Apr 2023 10:39:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v4 09/17] xen/arm: introduce a helper to parse device tree
 NUMA distance map
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <20230425075655.4037980-1-Henry.Wang@arm.com>
 <20230425075655.4037980-10-Henry.Wang@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230425075655.4037980-10-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0159.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6817:EE_
X-MS-Office365-Filtering-Correlation-Id: 788ca8bc-5a10-4ebd-6069-08db45689cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Vcwvq+F640DhnS/rmOwJf4rCxdK6+m7uzbZRxZmSu+6ZmKamkFaf5gVRU+gixWkp2Uv0xVbZSTXTm+sRYI+G+d8LF6GHYMXsKMBrNgpCs2aGmAqDzyUgKfoGsnxnRgKNM0X9y5gRS8MZg4y6j7eRoLxCgjcYjaVu+78qisjj2z5MgNTCAb3Ql5fM4BPMvrLuL8PyvUVkrsmyX3pLhFYmA3gJkDxP4Um06tGpRJczZjEuOOhOUZ80hx6rkw/g50iQ/jkkS0jkc33bn4dJJoaTwjnmJTM5w8U74NYpoFcGMOSI4duiVf5DnmmMcvPlkDu7vqU5DMNTR8+RB6bWKwXFKnGO48xIiqL6qb75P/k2IrN92NpFklZNo5iLxaB/IgEq9RSn3+zZMzETR4mkL3laJSLePqC9rWnraicpTULSU2bLR+cdffzmBMzN3+5ZMG8KmzkU3mNvifZ+V8dmBSpwS2eu64KzAwU0tE5XyGWTNR/yYV7g91XOBrX7vKVNvjlL+Do/WOx8O118AIEJwUTk3RZDboO6wQEdX2nO1Q8ZZOx/hQFBTQpu3h6Vi3URzXbW71npsTOwYwem/SZPjYwloZwDRfvbxU+0Bq/P6/bd/pQsSDj2m8ASBraTLPkBBaoS9Q4+Mk7u48ciycqg40Qp/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199021)(38100700002)(8936002)(5660300002)(2906002)(8676002)(36756003)(31696002)(86362001)(6486002)(54906003)(478600001)(2616005)(83380400001)(53546011)(26005)(6506007)(6512007)(31686004)(186003)(316002)(66946007)(41300700001)(6916009)(4326008)(66476007)(66556008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eFQ0b1FidXNRdzZaeTczd2ExZHNWZmkxTnV5d2RYdFUxYVFFKzVXM25XZmNw?=
 =?utf-8?B?aENvSmwxSkRFWHk3WDRMTEpPeEJudG9ibUkyMU91T0hlWFpqQWhNY05ieG9X?=
 =?utf-8?B?cStsM0dlZFJ4anNEeUNIZ1hkdmE2RVhvRWFtdmhacjJBcVluSVlPRTBjVVFn?=
 =?utf-8?B?RDEvTnpmZzRJeWpXUWJaV2hqWm1sekFsTGU4c1NObm1DOWxnWkFucnpQMG9N?=
 =?utf-8?B?RlQ3ekJWT09BdWIvOFZQOFpjdnVOUFRsM3BKWHhtRWwvMnZYQjlpVGhQUGx0?=
 =?utf-8?B?N1JRMjdySWRoMjdHT05JbDlPUnJDbW9JTDZBK3BZdFNpdUxqV0xYUENMRWxC?=
 =?utf-8?B?Y01wMG0zL1lrRU5QRTlwM2NWTnAvNlRiUG1LUnFrUmY2bm5uK2crVkdGUjNy?=
 =?utf-8?B?QkxQUlhOcVppcmwyU25zcUd1RzBEZXFLcnk4c3V4SkdSUjRoK1ZyWEJBeDhh?=
 =?utf-8?B?bDNQbGg0blZvWXNiRUFUWEZVZjQ1MXR1d3c4TWRPSVZkdlpjSElHRjRLdjN1?=
 =?utf-8?B?ZVlRbXBsSDNGR0dQOTVQeEhDc0Q1ZjBXeG5ZZGxYL1VXcWdDVEwxTEQ4clV5?=
 =?utf-8?B?UmlmSHdNNGEwb2paQXlBeUhiRWpNNGo1OXI4V1N3WGZkajBCejRrRi8rdU9K?=
 =?utf-8?B?bk1GbWx6RkdJZ1U0OGx5SDBYeEpQeHpNMUxGZ0Z0dm5Kd2xZam0xbERwZXow?=
 =?utf-8?B?M2VHTlBZMU5HN3lvTk9ncGJNaVd1aWNDU2dvYnVHbDFpMGlmSjVnS0Z6OGlY?=
 =?utf-8?B?bDNDSHpPMjcyODBTWldpSDc1QUZ4T3JrYWowbTVXaWhVTVM1bHdwSVFaL1F1?=
 =?utf-8?B?R0YyV3JrTXd3UENKL0JldENnSnkyclh1MFRya3BaWm4rSG9YdGN0cFErSVZG?=
 =?utf-8?B?RjZUWlZnejdyOHpRZWkxTTNHUlZqdVhXMmIvM2ZVdnRLeDJGYmxJYWw1RGVr?=
 =?utf-8?B?cjhoV09sUjlLNTRXeUVsODZhbndyaDV4OVFSdjFhc2tpdXNDc2gvV25CRjlY?=
 =?utf-8?B?L1VXUlo0dzlkZ3Z0cUtRYndIakIvTDc5eHUxWmVlaWxFT3l4M1BnaWFiZG54?=
 =?utf-8?B?TFV2OThYcmVDYnJnZ2c3VENwblgxejd2bHdpYysrWUdodjF5eHF0VDNIS2Fw?=
 =?utf-8?B?bVUvbkZJWDk1OXJjQkFmYzBDODl6Mkpxa1kvTytPVm5KMllVZm01TlFsYlBQ?=
 =?utf-8?B?a3hzSzVMcVUwbDQ5d0FlbzNmUEhmd2tGUEFuZXNFSWtFYXF6cEJIYkRLbCs3?=
 =?utf-8?B?RDJ6dkc5MFZKNmxYL3JnZFF1SlZwT1dxTFZkNFRFVDY2VjVrQ25kMStNZUlT?=
 =?utf-8?B?YkZwb0pKV2tkb0lZREkxL2ptaWhHUVFFQnVNRDBkaW9DNlRlVXF0RytTcFJM?=
 =?utf-8?B?R21qRGpCVmFFMXhTalpNdjV5R2N1aUs0cjd0MURFSWFvYTRZa0xhTTNVQnpR?=
 =?utf-8?B?YjR1aDNNeGtrUDFpT2ZON0pKcVNnUGlxTjYvQXdmM3ZHajBaM3E1Q0pDYzNy?=
 =?utf-8?B?dEFCcmp1N3JzdUZ4NXQ2em9jZVlIQTVJSEFLVU8yNkZrWmNpbVRXREFVOGNR?=
 =?utf-8?B?c1lveVRaY0RSeWpLci9GblN4djdiT2REbWxEaWxvQWgxbDJ6anF3SXRvRTdY?=
 =?utf-8?B?dzBLOERXUzhaMnRPZjU1Uk5QekZMdm5QNUQ3MzNDL09hV0VMRU9vMWpaZGNy?=
 =?utf-8?B?Y1JodlFaZ1h1VDBnUHB3Y3ZJNnAydFdyMXlvZmw2MUc1MVcwcEtYVHRob3l0?=
 =?utf-8?B?amNCUlM3OElHZU01cGJXK01FbW1PSUVNYi80ZnlMQ0lCbXRjYUIwUGN6YlJt?=
 =?utf-8?B?cnU5SWVmTFV2RjdPY0R1RXhScm1wb0RyN1F1R0VmWnBTR1pKMnFidXNHWEg2?=
 =?utf-8?B?eHovODdKM0dDVFdpclNJbDJPRGVhRjUrY0JXejJxNUtzQ0RXNWR1dzQ0YnMy?=
 =?utf-8?B?elRZWGpiRmpleXlybkVvNWt5VHBQYjRnWm04Slh0UnJDVjRnaXlyc1EvQ1cy?=
 =?utf-8?B?cU5FVHppS3pTSzV0VVFQKzdBTld2RWlCRVh3a3A5WWtTTVBwUk1GVUJBVWdL?=
 =?utf-8?B?SCsxaHh3NG5OWjJpc0ZxZE13Yzd5ZWo4dXpUTEg5cVkvRTBqMHp3dWQ3SDQr?=
 =?utf-8?Q?Uhd7kVo4Jfvmgf1xIAqkZ5Y+I?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 788ca8bc-5a10-4ebd-6069-08db45689cea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 08:39:41.6033
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Sfv1HqYYyca9ByhpnE8G3NijptUPhw1rV6ujGtyuapXPLW0CXdfy6y/yPOv4KLeZlSf0syVeKuMIK6GVnJH3CA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6817

On 25.04.2023 09:56, Henry Wang wrote:
> --- a/xen/arch/arm/numa_device_tree.c
> +++ b/xen/arch/arm/numa_device_tree.c
> @@ -151,3 +151,111 @@ invalid_data:
>      numa_fw_bad();
>      return -EINVAL;
>  }
> +
> +/* Parse NUMA distance map v1 */
> +static int __init fdt_parse_numa_distance_map_v1(const void *fdt, int node)
> +{
> +    const struct fdt_property *prop;
> +    const __be32 *matrix;
> +    unsigned int i, entry_count;
> +    int len;
> +
> +    printk(XENLOG_INFO "NUMA: parsing numa-distance-map\n");
> +
> +    prop = fdt_get_property(fdt, node, "distance-matrix", &len);
> +    if ( !prop )
> +    {
> +        printk(XENLOG_WARNING
> +               "NUMA: No distance-matrix property in distance-map\n");
> +        goto invalid_data;
> +    }
> +
> +    if ( len % sizeof(__be32) != 0 )
> +    {
> +        printk(XENLOG_WARNING
> +               "distance-matrix in node is not a multiple of u32\n");
> +        goto invalid_data;
> +    }
> +
> +    entry_count = len / sizeof(__be32);
> +    if ( entry_count == 0 )
> +    {
> +        printk(XENLOG_WARNING "NUMA: Invalid distance-matrix\n");
> +        goto invalid_data;
> +    }
> +
> +    matrix = (const __be32 *)prop->data;
> +    for ( i = 0; i + 2 < entry_count; i += 3 )
> +    {
> +        unsigned int from, to, distance, opposite;
> +
> +        from = dt_next_cell(1, &matrix);
> +        to = dt_next_cell(1, &matrix);
> +        distance = dt_next_cell(1, &matrix);

Upon second thought I checked what dt_next_cell() returns: You're silently
truncating here and then ...

> +        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
> +             (from != to && distance <= NUMA_LOCAL_DISTANCE) )
> +        {
> +            printk(XENLOG_WARNING
> +                   "NUMA: Invalid distance: NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",
> +                   from, to, distance);
> +            goto invalid_data;
> +        }
> +
> +        printk(XENLOG_INFO "NUMA: distance: NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",
> +               from, to, distance);
> +
> +        /* Get opposite way distance */
> +        opposite = __node_distance(to, from);
> +        /* The default value in node_distance_map is NUMA_NO_DISTANCE */
> +        if ( opposite == NUMA_NO_DISTANCE )
> +        {
> +            /* Bi-directions are not set, set both */
> +            numa_set_distance(from, to, distance);
> +            numa_set_distance(to, from, distance);

... here again. Is that really the intention?

Jan

