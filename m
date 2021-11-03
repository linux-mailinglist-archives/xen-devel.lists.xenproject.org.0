Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FA244444B
	for <lists+xen-devel@lfdr.de>; Wed,  3 Nov 2021 16:09:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.220974.382454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHsf-0002cM-61; Wed, 03 Nov 2021 15:08:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 220974.382454; Wed, 03 Nov 2021 15:08:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1miHsf-0002ZO-2R; Wed, 03 Nov 2021 15:08:49 +0000
Received: by outflank-mailman (input) for mailman id 220974;
 Wed, 03 Nov 2021 15:08:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+Ly7=PW=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1miHsd-0002ZI-Sx
 for xen-devel@lists.xenproject.org; Wed, 03 Nov 2021 15:08:47 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f14978db-3cb7-11ec-a9d2-d9f7a1cc8784;
 Wed, 03 Nov 2021 16:08:46 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-38-BJ25QiUxMoONA0BBtpfJ9w-2; Wed, 03 Nov 2021 16:08:45 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4943.eurprd04.prod.outlook.com (2603:10a6:803:51::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.17; Wed, 3 Nov
 2021 15:08:42 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4649.020; Wed, 3 Nov 2021
 15:08:41 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0602CA0018.eurprd06.prod.outlook.com (2603:10a6:203:a3::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11 via Frontend
 Transport; Wed, 3 Nov 2021 15:08:41 +0000
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
X-Inumbo-ID: f14978db-3cb7-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1635952126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jlns22FJpJ8Br4nqMQDULxkdxmdABL520Ay4nqVaxQg=;
	b=eUFBHvzMokOS2obWjsYmX4EgY0RU4u20LgbOUFF9cZyA/UO2tChdUrVt1NDOOxuHKSDf39
	tOzkhzQz8lbYLmLhX3D7TAOCq3z347IBK8+Pu8iQXaqri+gD9RNnDx39i4uLPJrpBAZ9So
	AXJgPaoMarqzUEItzdFqycstylWZxgM=
X-MC-Unique: BJ25QiUxMoONA0BBtpfJ9w-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iXH5L2JudFlw2ADPR7bSwOXcLC51Au7jjv0Wsg/GveID/ZdvIYOJZCbkQ3gNjyDn7F30Uxc+kYKjPeLDOljXVJo8Cjhk713v3uBlhLFZrmLmdBHemGNRsAVbi9B8bLOjWgnQEsVAv4JWTbkAQLp8X3kezm69s2qi19UVTd0q5iQ85yBCzMZDWcEi2m9yJ6V1qJUH1b2WKTAwZqkRiE4QbWvOXRzmyfOOWb7DYf7J+X4/6GLE3/RluKqJomz66lNsS0ZtBrL94Q28nJ5friM3xsYdKl+VLQkQpIY13VeHfvITJfk38Em4i6hbtrfMuurqzm0Yal2xgiXVSTOKAGl4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlns22FJpJ8Br4nqMQDULxkdxmdABL520Ay4nqVaxQg=;
 b=h+ruAvZRd/PkYuU2MCZbRtjKoQi5sGBhMEAJKZQAwIKNIY5fxPMW+djPxHQL6Xw7OVdtrVqhXLnJ1w42VscRlGB7IAF/CMNco+WlGBpxw1tnwTnMtGCT7DPk3hdnZLQDZ+qVocdoBpWUtao0wouTHVyNsht0YxyBMl6NhpSk6tHUNJ4BHCCH4NUAzcRFGAR5G7vS+UKVvGeoS1DnVjZeDt+iGH28ELcUm2U+xfNIq1fQzwSEjzwwvni1SjYiPqAb/YS+SP0WbIt/youdrL5gzl8u4n89CCIpDZCKltNbQHLGoigtu8rhprOJX1A15WxtNN1HTcdqgjlwJVAexNA10Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <52aa88a8-4c86-0e5a-d0b1-1d0431a97fd7@suse.com>
Date: Wed, 3 Nov 2021 16:08:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v2.2 07/15] xen: generate hypercall interface related code
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20211103102059.19621-1-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211103102059.19621-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR0602CA0018.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::28) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8354943f-dfa6-48f6-fa41-08d99edbd292
X-MS-TrafficTypeDiagnostic: VI1PR04MB4943:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4943D796DA20F2418970873FB38C9@VI1PR04MB4943.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8rMPTfk4HciRjInZBCJpL1NMuZ5RiO4LiH3czR5upuC5Dxmz2Kj0J6d/G9W9MCP59fz7FHDx8Q//s6nWCky3gIC+2Sqp80VG6T+v/xyo9MSm5smFA31xqea2b8cWvZE1MvqKr0S73syxBoZNpM74El6Vo1LHlOTTLyInvKQUOgvWqhE0tMQul0/K51rP2DuxG3qV9hnK1dHUpXZsMDp8x3kNFLYS+7ogYBjeY/66BM7GucwhRFDY8BQzTbFmKv+o58UNX75uwOSQe6ec4aey7ZLuWXZOIRQk3rCUaaA3YjBl9nlqjDrbpGNFsHIY9lvWM6Kv17iIQ/ziqXlxcYgaUoM9zq5JR27lY/G+b9SqHIqbDpS2XCadBhPBfzs0o55iy6dhRiuNrmkLBwfoBAf2M8zg1GdB4yMyjr1Amh9LX3f68bUwZRcjKNptAyMZBfOq5/UWuA6mcxHVwtam9JA77cj08RARU7/EnUWP8YiPRmLpDjWa0lnfMCAu53Au07XaVPMQTCDIS/urXhY0361/alhSiXn3GAlLRSX3C9EAruzlF0OQXDg159g3KFYlIFZizbx4iWOpEGOUNNO08Jrgs6BXsfob8Ri53lq5L4k9IyzhS/hAmezlTAQkv/Zyn1pNRMLxKO52iOJBFg0+6+qBoj+KDis4uVb6DpiowVgkuV4Phty7TMbjRi8u9l0zIIjGSY1ETxR98miOi72CIVB/uTe0meEE9xnD+hUWCrk5MWmjHEvpxFdIVGO24s6VGszq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6862004)(186003)(16576012)(31686004)(316002)(8676002)(2906002)(508600001)(37006003)(26005)(8936002)(6636002)(66476007)(6486002)(54906003)(66556008)(5660300002)(66946007)(36756003)(86362001)(4326008)(956004)(38100700002)(2616005)(53546011)(83380400001)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHhoVS8vbE4zeHJGS3ZOYW5kNHZYNjR2K0lxdU45TWkySDNZVzA4UUp6cTBp?=
 =?utf-8?B?SE1lVzNWWkpGUUFIaWRKRVBwQWpvUHE2d1kvdFVDZmpja3M4MHUrMDQ0bUpX?=
 =?utf-8?B?UDJmUVYrVmd6ekVKYXh0dnpVTXo1bFZFOUpwT1lxcG9LVzdqd0Z0TUZtL0lI?=
 =?utf-8?B?UHBCc3I5UVJBRlp5Sm9nM1gyU1NRZUV6ZmlGR2JFZ2tKZDNHOGRFQlUxV01o?=
 =?utf-8?B?WG81T3FHbHVqelZEdnRCa2ZCa0cyT0RHeUExWXNLeTJjb2FPWEhMcktZL1hG?=
 =?utf-8?B?alpIMDI3TXgxdVVvSm1kSmVEMmxlaFpzQThNVG1EdHh4U0xJN0F0b3BCeWh0?=
 =?utf-8?B?cVk1WDYzWUpkVGtQYWxXN0FOS2dZR1IvMFg5bmZ3d0c0cER5YzBNRjFFN0Ri?=
 =?utf-8?B?SzJmNFQvd1lLdFR0UVE1QUptNTU4THgvams4b2N4RFJpWEF6bUZMa1kxMm1i?=
 =?utf-8?B?OURKS2NoTk43dis3MElsaU5YcWtxMEJyZWI3RUxCemxxY0F3amVzYlozdEdF?=
 =?utf-8?B?Rjk5VjZaQ0ViMm9neVR1a1oyVnJkb0xUZnFkTjBzbGprMkFsV1U0NGhjT2oz?=
 =?utf-8?B?NnFSM0F4YXNFbnhuc2NqNEhGZXdVWTl0akNWWHQ5TDNSa0xxalNKdVNVVlRY?=
 =?utf-8?B?OSt2Nm1Vb0FxT1NjbGRPdHFWWDlJcjF2R0gybW1iYXUyRXJ1K3huUFB5Zldp?=
 =?utf-8?B?b2t6Yjl6RTcrNFZkUVlRazI2bElXK3NDMnNJcjY1eUl4YVRLVzd4Z2V4cXl1?=
 =?utf-8?B?dGsxU2ludnA5UzZDTE5UWFliU3pXb042am5iMWN1bEF2VFlobFA1Q003UGhC?=
 =?utf-8?B?bE1CMGFRMTlFeEpUR1FCeWdxVTFxR3JIQm9QM1BoVkhJcTUwSVhZVlcrMGpl?=
 =?utf-8?B?S2t5SFFocUh1Z1o5ZWFGTmZVSmlUMTZYbTI1eEMzc0U5Y2FwZFd4VmFGWTVl?=
 =?utf-8?B?SVFoQTF2OE1CWFNmcWtna0szb3hQajFJanV5eDlDRXhmS0dOYXBTZ21hcHJq?=
 =?utf-8?B?dWpKcWVrTFMxSFdya201M3pmMTVNM1pyb2NNYnI4UU9SNm9IZHBBd2pGczA2?=
 =?utf-8?B?RjR6U2NmQm9aVVk3RURodlBtb0g2YWN6Z0l0RjZJVHpDYk9hZGJhaGM2dzEz?=
 =?utf-8?B?YVkxdnlObFpFMkk0ajhPZzQvcHlZYU91UysraEtpM3EycFpMR3lqQUVCaitI?=
 =?utf-8?B?a0FseERHWC83Q1A0YTBYMFdzeXhlV1JpUWV5V1dWWHpZaEFGSGVwVzk5YkZ4?=
 =?utf-8?B?NjVNb2NRdjJlUHVvOXdpbHEvZE9KKzJoMVVBSE1OdHk0OFNJdGIzSm5XckNj?=
 =?utf-8?B?MDdHcFc3elpCZk8wMWR3TGxiU2ZJdkFtampreEE1SUJZRTZ3ZnBMVlhBZlUz?=
 =?utf-8?B?QVdUZThMSXdqQjdZTlkwVkxDdmhDVk9vOWd6ZGVDWHVua2FyQzV0ejVUd0xF?=
 =?utf-8?B?dmVBZElsb3BPUnlvdHBuaEV1cE5BL1g3MHZKQkc1QURSV0lIOVZhRjQ0NjFa?=
 =?utf-8?B?dTlCMlFMTXI3anVJbUN3MENqWUkzbmFCL2liZ1JId1BsVVdIdjdDVGhUWmRi?=
 =?utf-8?B?aFdjQ1Zja09GN0czZGxhbm5xN0s0WllFejhyNC9lUmF3ODhUQjBTVUlGSkJI?=
 =?utf-8?B?MUlEeVZoUG5xRzZ5eHU3MEhMQ290M0dJZURLVXdTYm9qQTVVM2xJOUo5ZTZs?=
 =?utf-8?B?eXNqRy9GSnllUTUranJMUS9ZS3BIQU4zUDhnb2tHdGNkOUJ3WEhIRU9xaGdB?=
 =?utf-8?B?YVJiUHJLeCtiNFVKRGlDcU0zWUdYM2ZGQnQ4MHNlWlE3dXMrZENtWDYwQ1hj?=
 =?utf-8?B?dzdqa0djcmRZcnFYWW5KWnNld0pMYkxmUnNrSkJXRGVheWY0MXIvZm1uY1VR?=
 =?utf-8?B?U0ZFaWxvODVEaXpkcE1aN2hnZkhXTHk0VVdXV2tjWG9KeUFEbnJtMVBDRVJJ?=
 =?utf-8?B?VXg2SEtwMHFKUllzY1FRckNibWNCNmNZYTNYNDRlM0ZoNzlnNGVsQzNlbzVY?=
 =?utf-8?B?ZUJLT1RGUm5qdDR1RU40WDdUQTBPc1ZTaWpWU3g1eFUwazArTjFYQU04Mmhp?=
 =?utf-8?B?WGg3aThGQ21FTHIybkFDR1FjWDRub1IzQWFISGVFaFVCZ0lYMmVCM1IwbkFG?=
 =?utf-8?B?MG5QWHBaVHFQYkhuN2ZLZHFPUkNEWm5aekVTQWdVZTF5K3ZObWFmS1BldjN2?=
 =?utf-8?Q?vuNlbfbfkJ84e6Ptj7DJpzc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8354943f-dfa6-48f6-fa41-08d99edbd292
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2021 15:08:41.8909
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNCrtdWMN4V3vSwt9EIhU5w0Xz8qFLZoBpoiHbTomhdpSl19DCxARMmBP2Ohx+vv2ycqin5sb6Z4TDLnBr5rqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4943

On 03.11.2021 11:20, Juergen Gross wrote:
> +# Generate the output
> +END {
> +    # Verbatim generated lines
> +    for (i = 1; i <= e; i++)
> +        printf("%s\n", emit[i]);
> +    printf("\n");
> +    # Generate prototypes
> +    for (i = 1; i <= n; i++) {
> +        for (p = 1; p <= n_pre[i]; p++) {
> +            printf("%s %s_%s(", rettype[pre[i, p]], pre[i, p], fn[i]);
> +            if (n_args[i] == 0)
> +                printf("void");
> +            else
> +                for (j = 1; j <= n_args[i]; j++) {
> +                    if (j > 1)
> +                        printf(", ");
> +                    if (ptr[i, j])
> +                        printf("XEN_GUEST_HANDLE_PARAM(%s)", typ[i, j]);
> +                    else
> +                        printf("%s", typ[i, j]);
> +                    printf(" %s", arg[i, j]);
> +                }
> +            printf(");\n");
> +        }
> +    }
> +    # Generate call sequences and args array contents
> +    for (ca in caller) {
> +        if (caller[ca] != 1)
> +            continue;
> +        need_mask = 0;
> +        for (pl = 1; pl <= n_prios[ca]; pl++) {
> +            for (pll = pl; pll > 1; pll--) {
> +                if (prio_list[ca, pl] > p_list[pll - 1])
> +                    break;
> +                else
> +                    p_list[pll] = p_list[pll - 1];
> +            }
> +            p_list[pll] = prio_list[ca, pl];
> +            # If any prio but the default one has more than 1 entry we need "mask"
> +            if (p_list[pll] != 100 && prios[ca, p_list[pll]] > 1)
> +                need_mask = 1;
> +        }
> +        printf("\n");
> +        printf("#define call_handlers_%s(num, ret, a1, a2, a3, a4, a5) \\\n", ca);
> +        printf("{ \\\n");

In order to require a semicolon at the use site(s) of the macro I think
you want "({ \\\n" here. Everything else looks good to me so far, but
I'd really like to take a look at the generated output: Would you happen
to have available an instance, to supply in reply?

Thanks, Jan


