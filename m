Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F556EDE3C
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 10:35:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.525879.817381 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prE8S-0005Cr-Vg; Tue, 25 Apr 2023 08:34:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 525879.817381; Tue, 25 Apr 2023 08:34:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prE8S-0005B8-Su; Tue, 25 Apr 2023 08:34:52 +0000
Received: by outflank-mailman (input) for mailman id 525879;
 Tue, 25 Apr 2023 08:34:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x+We=AQ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1prE8R-0005B2-8q
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 08:34:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 090278a9-e344-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 10:34:47 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB6975.eurprd04.prod.outlook.com (2603:10a6:803:138::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 08:34:44 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 08:34:44 +0000
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
X-Inumbo-ID: 090278a9-e344-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EOdy7LrTX7mJmnxKuUiKWyzETscTsxLXVkFtudkWnxKFKDzWhmrZVWqYe8aj1PgDGuyq2dOociSURUE4CBmj8H38flIFfoog1Xt/pVY2BGMk4oZYsa+JCqK2gcYV9eaPeKC3J2yC/tGxNSDcAFfgFsko7XalgjdcPt5Ag+bFfubKlWZTFaw7xxE8pm9UKqTZ5neUPVh43IL2k8am02WJ8oU51UMvfgzKFjis8FGVntjL8MhWPgXVWJN4P4VhMjzZrTEx4YzCS81g4vUlT7boNMwlpb8cxTGomMytZAGbFU24+upe9wejpibMiGIAjPhXJeTI4hAJ3cbfboHU9dfKJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EzRFWBVOHDvBq54TKxesyfelsMZoGhCw5JQVop2/VUY=;
 b=h6MQ9JIeDfgC3ce4C+ZoiXYz9bmHiHZprBda8JqvJTi18KpV2COYsv1snhA2/bpQbDvJQUj8VTnuXiIumJ1rrMrQ+zp2m+pe2w3YkET9afCa2QJ8eWcC7JLIkjHR9tHvBw+UjWPyoAOI9I7tcuNa/jSvFg/29Xse3EN2SdGogvAkmOOKedvvL+iy9HtZMpqDvGPG3WMRDs1qoRHDr3AfBewRi07x1/344Hcnzxa+brNO6+YgaRScfRK/zQWkolRPf1aulVwmHJEpNuDsrs5RCy4ckGlnw8xBxMivFwk2ZrYwzk10/hTb/USXn1y/wsv83+wuerzND3gDtxPdmHllLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EzRFWBVOHDvBq54TKxesyfelsMZoGhCw5JQVop2/VUY=;
 b=bn9LWdpB4sacz8C+4ncr30dbjeQqcGP7ARk+tPHtyLmhMb9p4aZQ5Ii5SI0zyFf7fpgMLEC1tZzDHRkrt5VKNl983Jlb9pfkoQu1phkrIb19SSdJl46HduEug4pge/peJR8tM/MgjIklcxviT0dYj3FoNojwCH/UMA/yNAo0/Hbs7RN3HS+5HuRY5QMbvz3lheMv/SkGrKJx0tXeyHWR/AF6tSB1Zzl7JxVfyXRHmqlkzjt+tYulr35eOQhMmwkmC/yF6yi8L1Yz5eZo46d5t8d9lIty9FBSkqWQQ9tkNobty/LhKHS3LuUborp1fgXT1+RdH9G8dOmKj/nGrV2qHA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e03bbb52-1a19-7d18-4abe-75bbef8a0aee@suse.com>
Date: Tue, 25 Apr 2023 10:34:41 +0200
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
X-ClientProxiedBy: FR2P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::27) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB6975:EE_
X-MS-Office365-Filtering-Correlation-Id: 53ed1436-f9c9-4324-ab5a-08db4567eb89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YereA+rfMzguNCxWNnPtuTsyN+37C8HUjkbJ+MAo58I/1hgkqPA1yC1dCLlm70C3kfecR13rvW8W9YNn9UmH/IeFbryjnBZZmO8B8KS3fuH+MKwUC1iZpM64UEG2z3r6k5g4A8wbwyDo8HvvUOIW9H12IH1EUsBbX+ZnNkcUKyZYbgEt/o006515ofHtvS3DT8wRBxVHrMJOswe5UhNhYPoHYyWKyKWzYJ1HF0Cpd+dW3vXpk9gPnLVvsGUwHnRd382RVs+EiRfXSSIkWmssfh9zOkp/9GXei1llgzxnDc/48DoepiBaYD3o+iUE3Xrdr2suohVwPwz89q6kkg7Wwo8ixs+ZWrC4Zzc5EeR0btT6fiQR/UTEmtMuw5YucXnIgkniGzTjfcIq+ZKQd+ssv7sqnHS0dO1IAKEAFwNzw+jUHInwFuSm1ItDprUYAivJelBwuZ8cc8jdMWE3Vw5spK2W9Yt3lFX7XkDDtSbcA7LMCQHB2ZnuQ7exzU9yo0CSxpAhARCJylt6i2xXAvPqbk79fIVDM87WmX9wJNQV/0a6ioGyzZj9B8NfAXr/qpm9ufRM7/rId9Kw8tHp8867BwSexGMRieQB3emr2aNUhSHMtYCXXV58Pehomorh9WGw
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(966005)(53546011)(6506007)(26005)(6512007)(2616005)(36756003)(83380400001)(186003)(38100700002)(66946007)(478600001)(31696002)(86362001)(6916009)(66556008)(66476007)(31686004)(8676002)(8936002)(54906003)(5660300002)(6486002)(41300700001)(2906002)(4326008)(6666004)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cEhjWkQyZ3EyM0p3eEdWUU9PV2tFMnVPRERkdTVQWGdLd1BGajM4b0orNWs1?=
 =?utf-8?B?bWQzM29FTkNnNkZ2RWx0cGFHQkpXaktPd1ZPZXZIN3lreFg5d0xwejRBWG9k?=
 =?utf-8?B?ckVaazNIRGdhN0FRWVg5MjdkUWZUNmsxb1BkT1RqNWhMVUZZN01oVldBOHNt?=
 =?utf-8?B?WU93MncwcTk2alk4Q3Roa3ZQWDR6QUZmczcyNUdZQUtZS05FOWVSUE5NQ09R?=
 =?utf-8?B?RVhTTzJGTUxyZVNUdVlSRnVkaitGYkE3OUVvZHFYaWVaRUxGMTBDb3k1QWdW?=
 =?utf-8?B?NnB6VElGZDluYmJuWGpCUitSdmQrRzcrVWc1QkRkNjNxWVE0azVIdGdWZFVJ?=
 =?utf-8?B?bkxtVG1PUDZEcDVqNS9kOXEyRnozSnZocFdISVVmLytGcnExTFk5eEhsQ3g0?=
 =?utf-8?B?UkxhbG42YjJodnF4TXdNRW5RV0E4a3N0SUU2Y1ZEd2plTUg5MHhJT05HSzdk?=
 =?utf-8?B?RWRTaUdKM3EvbGlXYVJlaTdFVkFwMmtqQlNsQkxwQ0pFb2FMWHVCYlFUcmZB?=
 =?utf-8?B?WXIwYnExZVRSMTEwNm1hcm9reTRlSFVYbTQ0NjN5VFRHR29sY2NkWEZLT216?=
 =?utf-8?B?RDlIQzNsekY5OGk1dnk0WXpCWndRZzc2TlZLTVR1NndZTDc1VjlUdkN4TTZy?=
 =?utf-8?B?b0hPRjNvRHJFWEZzVEs2ODFVNFdpYitCU1dwVDVsV0tWM3dnNWZ1L1JXM3hl?=
 =?utf-8?B?RXdwTHI3NzIxdjY2WHIraFRJSjNzNGwwdWppeTdoeFpKek5Zbkk1OXY3MnNk?=
 =?utf-8?B?eXlOby9ncEVrMmxxNVNzOWVhUk5PakNNa253QXlkSU9LSWx5NVpseXpzYjRN?=
 =?utf-8?B?ZFA1NHpVQk0wRHhhRGo3QjEwUG1rTlg4bm5XL0k1bVBTSlJ2NG41YklsYmlK?=
 =?utf-8?B?UVVHTVIybGt6V0JDbEVuRTQ5Z1RweWg3SThoWTVENFVkRGNxU0l6Q1d6Q1NM?=
 =?utf-8?B?WWRVemhTbElKWndsdHppVEtlREFrcmVnRE1hYzdlZGpGQ2ZYMjZ5bVU4NWkz?=
 =?utf-8?B?UXVXSGFVYmpNU09xUFloZnhpbzNNK0JTaEVpRFdZMGlpZXZuV2dDNDIwM1dq?=
 =?utf-8?B?RlV5NVFDNExqVHVPQ3BHZEZWdnFoaStNYjlQdm5vUFU4YXRSOWtiNlJwTjFj?=
 =?utf-8?B?ZXNkYXlEVkNlY1d4bTlCeUUvbzB3YXN0VHpCZnV3eGkzbkZUUHNVVTJWaUFU?=
 =?utf-8?B?dXRFU0M2dDNJTHl1TjJHaEVQeWJ4SWlMS1krT1FxZER2WW5tR0s2YWh2aUI4?=
 =?utf-8?B?M3pLcm1mSjRSTm1xZ1dwOGVzWjFlZnJqRjRJLzZ0S1RwY1E3LzRPQm9UZ0E4?=
 =?utf-8?B?MXFpb1BHUm91ZS9mdHE1NitjVGEvekhCM2g4UExFZ0FHUG5ZaDNVak52ZGFs?=
 =?utf-8?B?YndocXU4MzBicVFncE4wZTRiVXRSWHRwM3FyVndrT1BJVjVneTJJWGlVenRN?=
 =?utf-8?B?TWxtbkJ4eWdRRU5jMVhGMHhCQmJ5THZpZlZsWnN0Lzk1clovaFhlK0VLQita?=
 =?utf-8?B?NzNnWldSOHBvY0o3NTUyWGpsSEhIM0UwNzlIaFJoRGg2eEwzVHNPVEhaZ1dF?=
 =?utf-8?B?bXRZU3Y3ZnEwYUtvVDkrSVBabUpTMy9wN3lVUEh3TW11WFhKUXJYZDN2dHdS?=
 =?utf-8?B?eGF5ZW55cjZvditFV3pHN0s5QjNOTnVxVXJGSk9zeVIzS3BiYlJJbVdZNHFX?=
 =?utf-8?B?b0NRbis3dDlWUjNUa2dLeGpGbXNWbHdTWFY4dG9oK0NXUitPV0l3OWhSc1Nv?=
 =?utf-8?B?SVFCNVlnUW1GVmladkp5L1VEZ0hVc3ZWa1hZZFMwbjFZMHU1Y09NUE5jVUk1?=
 =?utf-8?B?Ti9ScmhvZGx3L1RsdVNvWTRUNnZteEkyWG1TMXpVbDNJK3JGTDBjTkdvb205?=
 =?utf-8?B?SlFKN253WS9GQWh3UFE4ZW80MkxuelNnUnIrQnhmWHVGWmE4YkhtWmNKMWhr?=
 =?utf-8?B?RzUvYTZFK1hzYnluaG5jNFhmZFl6MmNwRlRyRThmZDBLeUtRNi9zMm1UbGd2?=
 =?utf-8?B?V2ZBaHBCYVBadWdBeXR6bHZ5NnAxM2ovcWRvVzlpdkxNR2JKanVTYmNJNTht?=
 =?utf-8?B?aW1QRUdRZjJOaUhtWm1JNmdHTUxCc295c0Y2TnFURzBITGlRdzJPT0RudFFC?=
 =?utf-8?Q?O1LwRiOgX9jR6HtftPNlSTTS7?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53ed1436-f9c9-4324-ab5a-08db4567eb89
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 08:34:44.0145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4pWUaiUyY+erwjaJEkiJ+EgG3bSUl421yI8Oj8J3YlZJmrBFLyZUx02z+H5kqd3VgvXeooxILYx9GG6V9F13+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6975

On 25.04.2023 09:56, Henry Wang wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> A NUMA aware device tree will provide a "distance-map" node to
> describe distance between any two nodes. This patch introduce a
> new helper to parse this distance map.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

While trying to hunt down the caller(s) of numa_set_distance() in the
context to replying to patch 3, I came across this one:

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

With these ...

> +        from = dt_next_cell(1, &matrix);
> +        to = dt_next_cell(1, &matrix);
> +        distance = dt_next_cell(1, &matrix);
> +        if ( (from == to && distance != NUMA_LOCAL_DISTANCE) ||
> +             (from != to && distance <= NUMA_LOCAL_DISTANCE) )
> +        {
> +            printk(XENLOG_WARNING
> +                   "NUMA: Invalid distance: NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",

... you don't mean PRIu32 here and ...

> +                   from, to, distance);
> +            goto invalid_data;
> +        }
> +
> +        printk(XENLOG_INFO "NUMA: distance: NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",

... here and yet further down anymore. That'll at the same time shorten
all these lines quite a bit.

> +               from, to, distance);
> +
> +        /* Get opposite way distance */
> +        opposite = __node_distance(to, from);
> +        /* The default value in node_distance_map is NUMA_NO_DISTANCE */
> +        if ( opposite == NUMA_NO_DISTANCE )

And the matrix you're reading from can't hold NUMA_NO_DISTANCE entries?
I ask because you don't check this above; you only check against
NUMA_LOCAL_DISTANCE.

> +        {
> +            /* Bi-directions are not set, set both */
> +            numa_set_distance(from, to, distance);
> +            numa_set_distance(to, from, distance);
> +        }
> +        else
> +        {
> +            /*
> +             * Opposite way distance has been set to a different value.
> +             * It may be a firmware device tree bug?
> +             */
> +            if ( opposite != distance )
> +            {
> +                /*
> +                 * In device tree NUMA distance-matrix binding:
> +                 * https://www.kernel.org/doc/Documentation/devicetree/bindings/numa.txt
> +                 * There is a notes mentions:
> +                 * "Each entry represents distance from first node to
> +                 *  second node. The distances are equal in either
> +                 *  direction."
> +                 *
> +                 * That means device tree doesn't permit this case.
> +                 * But in ACPI spec, it cares to specifically permit this
> +                 * case:
> +                 * "Except for the relative distance from a System Locality
> +                 *  to itself, each relative distance is stored twice in the
> +                 *  matrix. This provides the capability to describe the
> +                 *  scenario where the relative distances for the two
> +                 *  directions between System Localities is different."
> +                 *
> +                 * That means a real machine allows such NUMA configuration.
> +                 * So, place a WARNING here to notice system administrators,
> +                 * is it the specail case that they hijack the device tree
> +                 * to support their rare machines?
> +                 */
> +                printk(XENLOG_WARNING
> +                       "Un-matched bi-direction! NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32", NODE#%"PRIu32"->NODE#%"PRIu32":%"PRIu32"\n",
> +                       from, to, distance, to, from, opposite);
> +            }
> +
> +            /* Opposite way distance has been set, just set this way */
> +            numa_set_distance(from, to, distance);

It took me a while to understand what the comment is to tell me,
because in this iteration the opposite entry wasn't set. May I
suggest to make more explicit that you refer to an earlier iteration,
e.g. by "... was set before, ..."?

> +        }
> +    }
> +
> +    return 0;
> +
> +invalid_data:

Nit: Style (labels to be indented by [at least] one blank).

Jan

