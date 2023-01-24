Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 864D9679EA2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 17:29:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483636.749909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMAW-0005EG-7B; Tue, 24 Jan 2023 16:29:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483636.749909; Tue, 24 Jan 2023 16:29:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKMAW-0005C6-40; Tue, 24 Jan 2023 16:29:08 +0000
Received: by outflank-mailman (input) for mailman id 483636;
 Tue, 24 Jan 2023 16:29:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=HFQP=5V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pKMAU-0005C0-3l
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 16:29:06 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on2042.outbound.protection.outlook.com [40.107.14.42])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 37adac9f-9c04-11ed-91b6-6bf2151ebd3b;
 Tue, 24 Jan 2023 17:29:05 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8699.eurprd04.prod.outlook.com (2603:10a6:20b:43e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 16:29:02 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Tue, 24 Jan 2023
 16:29:02 +0000
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
X-Inumbo-ID: 37adac9f-9c04-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuLqPvXL8FplC6IKyC5xvbE35ZNegRogB5XclwRKmu8QdeP1tsO4ubymajP7tfFROnSoRnrINY4yC6Ktf6HWhrLoUGPS88iJ2n4VYxftY9Bp4h3sKQUUPsOTj4O3CEtiUF61XKJMTYJktgxyL7vWEVTVAO6XEyRMP/9TDHQXPfjbDxE2+qk7Z31MQW4Rl9v390H5jKo4MNNSa7/PyeSIVfTQqAuXa+85Ug0mRGHnoJSUfaVh1Z7KSTfqAEdySuYWPBsoFONf1jdus3SnKiyTxLUnSbXaDR+qr8PBRK4pKqultqLn++omCMI405iBSx9/HK77AXjz9u6ZwriRkNfMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Clb67/GwDZhUCARy9ALs3RG4LTif/9oZzrj/is0AU6w=;
 b=OTkjtIB0794/qaih+8fD2aM4hWqeUyo59UU9oj/dJNKRfmL2fNL8uWbZsxLwJP5fah+gizZyeR1q2+y7pBa8gJ5L0GgislcnHyvi/uNtIISMjzzEpIi5uULdys0477yjgARo+weROsIRr2p4YLN6d7jC2+eTjWE7qNDxNKQ4DXy7vDvsto1P4twP1KJi/C9L9B/UWTggCO13wBVqHbTUF6HIYDNIh1KBMS4NUImWGtsMZwLzGWVCIs8wrTGnNODaJf31fAzTviQl4o65+8ZAxM9KVmS5tlNNogLIfcSn4FSO62k2wPMl0UMQnwsdT1SLCx7qGYkTj9kfZ/o+xx81sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Clb67/GwDZhUCARy9ALs3RG4LTif/9oZzrj/is0AU6w=;
 b=gLnMa1+vlxh2IEd1spM8DI9lm9wCDVP3qPIYR+iWzg+VzASjK/8jRtfuWxXFa2s6hyO79uFZovgD3B1O/LoMwRI5eZet/y+mv4ff+J5pLcosebuBTn/MCABRvDzt6TS9I3IzBPZOj7O2IKBupWThBulIgS//bbkdsDZzPf8nR/1wnx64oNALcuKhaz/3Z1mfgIxZvJYzAOxWNRDTHJCIwnoA9lIIcsmMhPN29UFl9RiUE+TPJ0be9a+ctyg9oAjKNWCzRkv2xHjmjkAwlAK/06MeTjU6++tP7Kodld4FBjiF+B81Yoq817lb2rCu9y/OiHJ9qNumX2Q9ejCC0lAZJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9bfee6d9-9cb2-262e-5a46-91b0bf35d60b@suse.com>
Date: Tue, 24 Jan 2023 17:29:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 04/11] xen: extend domctl interface for cache coloring
Content-Language: en-US
To: Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20230123154735.74832-1-carlo.nonato@minervasys.tech>
 <20230123154735.74832-5-carlo.nonato@minervasys.tech>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230123154735.74832-5-carlo.nonato@minervasys.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8699:EE_
X-MS-Office365-Filtering-Correlation-Id: e2d5c666-9b71-4274-57dc-08dafe281a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	um4e5aLNyXEfl0E7iAx71N5MskEHveE9sUED3W62GEEXIN18msl8d8Jhk+golj/aor7CAvRMeWpf9JN/LFTm+ChkOCnV3Agqr/cBNiS045qn3kykygM64vsGk6Fogc/QaDdx/CCEi+wXbHgeQaSbh+B+BYCnt7+EFw/+lQPzoszJ2m8vjen/dRmiVnI5uNcyg914e1IqVa5aY+pOD/KIiSMZ/mAoiOj14V2EnOBp75I/ypWCfLskyAp9ZPXqpJyjQFlTH+gvRJJ53Sl899phaXsdD7Mn8X6Zei3+16HWkgYGE0iAlZm8Wpsd5MUquViFNITlCS5VctDNUKVDVhSEPhMcIF9DmdGsoAaV587v46b57AzjFtgjQnmOMzkd3+msZjD21kPJozro87b4zXxWdk1GJpuWA459p69+k/bh03OqYHFVYJcWqLKGT1MNol4/tQZtFPFNkG/3X9FIrdFXv4lJ2nS4rrDSpnyruUo6SbpXiuytzQzCERHehquGbqHrN8ZDTuMA93QWIMOafFmdc59Hal8nPeSFHfWtYUEtHwtxeREMkDou9GM9fBvko9Vr1qtGuWDGtXFgOpTyDPFR9Zx4y/ssmdFURhvQ6zW0n1ONHhDIVt+CTY1RMetLoFDnOFq3vm5X9g9PBC6ESWsFda4sXrmNPBFYF9EZFTJ2JKRz0+qZwCJ4JHTWedr471KmFK2CoFoLd4GvTF6C7HJFvXrbcIIyT2NWLwjBBMLr60c=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(39860400002)(366004)(136003)(346002)(396003)(451199015)(54906003)(31686004)(6916009)(66476007)(6486002)(4326008)(66556008)(8676002)(2616005)(41300700001)(26005)(8936002)(186003)(7416002)(6512007)(5660300002)(6506007)(53546011)(2906002)(66946007)(38100700002)(31696002)(316002)(478600001)(86362001)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VitVQ29xbnE1TVdyU05pVWJSUGthaWNrYjVBK3M4a3BFWFBzRWRKVXNERW1C?=
 =?utf-8?B?NUQzUlNvc1g2c3FZTnBFVDJWajVzQnVCbVU2bi9aK0NlbHU1OTh5cWsweUFS?=
 =?utf-8?B?akVENGN1S2tvNEM1UTJybXJFaGxOczh3K082ZFVtb015QW1LNXduaGkvZm9m?=
 =?utf-8?B?akNNRnFLZXd0eWhvYXpvaVhweWpBQkFPN2dBZThZNUNGV1dLNk9SaGMrMjU1?=
 =?utf-8?B?SnJBcTEyQUhGRFY4K1hNZ0hGcjcrUGJGSGRZQXVtU1hNTU5zaHY4SWtuTEha?=
 =?utf-8?B?aitUSTVqNzdtRzdwc3Rkd08vQTkrM0dRZmQ5OGEwK0UxM3U4dDN6WTF4NFlN?=
 =?utf-8?B?TUVmdFZvd1pJY1FBUGhSTmVxSzhYTzlnODlCMXVRUEJyUzlHSjNqR3lMY2o0?=
 =?utf-8?B?VmVTTEM4T0Uva3ArSlFvc3p1WWluNXBJVDZpbnhDL1Qwa0Y3elJXbTZRVFVE?=
 =?utf-8?B?TzRnc28vbVJGZ3JZeUYrK0xDQkdTV29SbFVOaU5SdE5WaFVSaFF4NXlySWdY?=
 =?utf-8?B?Yys1Z29rRHBDS3pxRmhxS1hFalVraDk0cG1MVThSOXpCcHFlVktMcGdwd0dR?=
 =?utf-8?B?SXBBUDhzTXZQVU1yQjF2QlBiekY5Tjl4S0ZnTEZiMDl1dzhsNFlWUzZZdmp0?=
 =?utf-8?B?dDlzZnRDcWx2ejFFV3YrcUdwU0wvcnE1SUdSTk1yTVoxMzlrb1pwNHhsSjNQ?=
 =?utf-8?B?S2J3ZTFGK0lCWUdKaW5KSDlISmVldi9sUUFtUEtTcVlZZHVoQjh5ZTV2dlFs?=
 =?utf-8?B?NXdwN3I5QlUvaDdvQ1N2dkRCbjRlZjVRL1g5VUlQblJrY0dtUk5kRUVscnMr?=
 =?utf-8?B?UWN5ZmZwU2tMM08xRjNlb3dXeWloeWFKdzVvejl4OTJuVmV0enhuOHlpS2ZW?=
 =?utf-8?B?YkdaOHU5ZzNUN0wzcGg1T1ljeU15NGhxQjc1MXhmRnJtZkd0eDBkL3cxRVJo?=
 =?utf-8?B?c0tvWllwbmlMZk45MjcrNlF2ZWZVd0NsYStHNkN0WWZOV0J5ZjNHRUZLaUVZ?=
 =?utf-8?B?M25rSTJkTFZLS1M2M1BqOWN5aFYxR2UyL3BnTkk1dHhJQXJjVDVZRWhUOFJX?=
 =?utf-8?B?Q2cwblRKR2lLWkx4c25qQWRTRnBwWVZlRVNZdFY5WnVhSGlsdnZrNTRlVUIz?=
 =?utf-8?B?Z1FkcTVjamhBN05DWXJaQWxRcTVnSXI2SDFRZDhuck1EY1U0SXVwbzg3TXFx?=
 =?utf-8?B?YnhPQzRlSlV6Y29tRlZFUzlhc1hEcTEyREswM0hlcU4xUnpFc0RIQmFJazBr?=
 =?utf-8?B?UkRreEkzN1VIZzFSUWRocHFFRUpvM25YS2c4MU5zUUVPdWkyTE80SHphYm13?=
 =?utf-8?B?ZG9BSDBER0dRNERybHBoOWhBM0xYcDhsRkVSSzNFZklTRlFtLy9xM3FxNFh5?=
 =?utf-8?B?RmMyOWMxcnc3Y290NnFNY016QWhVTTY3WnY0Mmp2NHZUMklhcjZOZFZSZytx?=
 =?utf-8?B?aGk3bVRSTnRTeHkxWlVCTTNaVTVpQU9iQjJEUGI2ZkJJM2krZnpjWlU0VkVl?=
 =?utf-8?B?dXdFUElESHk4VGIrSlNDem1lMEFyUExIZzVNajhEVEt2ZlJEcnR4K0NUZEh0?=
 =?utf-8?B?dVZiS2c1TUdlL3A4eUdDdG5FUlJ2VUpLdzA4Q0xRSVYrdHRMOCtnbTBqSjJK?=
 =?utf-8?B?eTdzc2VCdEI0aFIwczh0ZUhuVGFzb1FXOGVuNXJuWCtQcnp5c0E2akV1VE9y?=
 =?utf-8?B?ZHEwMTlLK1Mwb2ZSaHBPcllpQmJYaVlWUC9YQWhQekF1bHpuOGNDeXRTNENr?=
 =?utf-8?B?aG1OM0RTMzJrT2F3enVxUTB6cnZrSlRuUk5MdksvQzR2MlJTamlGSXpCdHN0?=
 =?utf-8?B?R1dqT2w3eWRCcFlrUWRTbUdvZXpzcnplSjFtWHBwZUJGalBsemNlM1g3NGxP?=
 =?utf-8?B?MVNNOFU0Rjl5dU1HeTVONWZuckx5Z3ZDZkI0a3dPekRnTVhmL1cvMDdHOXdu?=
 =?utf-8?B?eVdmeWJJRXdKUHRIWmlqS05jRlUybmhpYlV5bzVpSURUcjhOSi9UYlB5S2RH?=
 =?utf-8?B?MHBjVTc2anVSVy9MVzgwMituU1h4YkgzLzFlT2NDZFhONjdYRjZQaTF5cDFy?=
 =?utf-8?B?b0JxTkZvWDBYM3pHb3krcEZobHlTK3RUZ0ZGNzRUWG4wMFAxbHBUV20wUzlO?=
 =?utf-8?Q?SH+LMPdlOsE5OEHXhAFn39UPZ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2d5c666-9b71-4274-57dc-08dafe281a58
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 16:29:02.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eR4tBrfxj39mmjmh6mGEwBRppFxvg41BD/srfrZGnMt+Goe1o8vh+4lp6QuKsjqSOfdokM+UgwanUiQL9XbxUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8699

On 23.01.2023 16:47, Carlo Nonato wrote:
> @@ -275,6 +276,19 @@ unsigned int *dom0_llc_colors(unsigned int *num_colors)
>      return colors;
>  }
>  
> +unsigned int *llc_colors_from_guest(struct xen_domctl_createdomain *config)

const struct ...?

> +{
> +    unsigned int *colors;
> +
> +    if ( !config->num_llc_colors )
> +        return NULL;
> +
> +    colors = alloc_colors(config->num_llc_colors);

Error handling needs to occur here; the panic() in alloc_colors() needs
to go away.

> @@ -434,7 +436,15 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>              rover = dom;
>          }
>  
> -        d = domain_create(dom, &op->u.createdomain, false);
> +        if ( llc_coloring_enabled )
> +        {
> +            llc_colors = llc_colors_from_guest(&op->u.createdomain);
> +            num_llc_colors = op->u.createdomain.num_llc_colors;

I think you would better avoid setting num_llc_colors to non-zero if
you got back NULL from the function. It's at best confusing.

> @@ -92,6 +92,10 @@ struct xen_domctl_createdomain {
>      /* CPU pool to use; specify 0 or a specific existing pool */
>      uint32_t cpupool_id;
>  
> +    /* IN LLC coloring parameters */
> +    uint32_t num_llc_colors;
> +    XEN_GUEST_HANDLE(uint32) llc_colors;

Despite your earlier replies I continue to be unconvinced that this
is information which needs to be available right at domain_create.
Without that you'd also get away without the sufficiently odd
domain_create_llc_colored(). (Odd because: Think of two or three
more extended features appearing, all of which want a special cased
domain_create().)

Jan

