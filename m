Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DA977E2C2
	for <lists+xen-devel@lfdr.de>; Wed, 16 Aug 2023 15:40:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.584768.915587 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWGkg-0007fy-UU; Wed, 16 Aug 2023 13:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 584768.915587; Wed, 16 Aug 2023 13:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWGkg-0007dK-RX; Wed, 16 Aug 2023 13:39:58 +0000
Received: by outflank-mailman (input) for mailman id 584768;
 Wed, 16 Aug 2023 13:39:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8IcS=EB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWGkf-0007RR-9o
 for xen-devel@lists.xenproject.org; Wed, 16 Aug 2023 13:39:57 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20604.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62f67961-3c3a-11ee-8779-cb3800f73035;
 Wed, 16 Aug 2023 15:39:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB8PR04MB6874.eurprd04.prod.outlook.com (2603:10a6:10:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Wed, 16 Aug
 2023 13:39:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Wed, 16 Aug 2023
 13:39:54 +0000
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
X-Inumbo-ID: 62f67961-3c3a-11ee-8779-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSzDch9Z6e9xMNMojBBnT2Q8DLHy2YumQOfuahqpa+U1MxSihUOKFZF4SjG2o6yBbKqh9zffkDG8AdFns+oKVosTHZiHMFKrcjBS8KqOGAYabSgCHA2/P/gXhxlMchk/neNRbQxx/fdUnvIdmw4FzjGVX2k53mZPxfE8bx1Yac8e5AZIfAt5h9MyGSNsNsDTjpyxEGFDXMTl9GH5+5MYcZU9AU1ZkSAsb5/4yvJrg98wQXfjY0Mbqi1itAsSPp7eCz2zFmAdPLqmSBM2sen5qNV1ZUwhYjRmDwBiXpO/bdT+C1oxlH54cV/RAxSGkHO2um+spD76UAJyy2zG5vDYxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AM5oBtmVS8a8QaOE8sjQInakuSvwPDsbDyA9jnD4i6g=;
 b=VRDyN8DzD6C+RiCivD/WZhszZTnFlwQML3eWi+eqpZeGa7X/q7ONl8QD1q0Z0Q1dRQRkwipsL1+Cz1M2AfRlYsXKbEcFYyVNllH42i49H0fBWVgclTdac5XaROWqLMHis4Jg8Scq3YuxwtLOFaze7u7lqwwv96+2DT+uUXZZfsn7oRXH661lMOaJnzwE8QdK/zmi650aBvNmmYIRkC70/dPrrdfjFgxMVqLfbUZX4Gvtke4b61Lc5Y5mW7tkRMTRLGHxsw7HCwznHnqfYN0evDHES86mrSDBbxpxK6z/Sm1oT7EnGVX/QfABpEwuhQoG6ynaKzslVheKdMRLXj7WlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AM5oBtmVS8a8QaOE8sjQInakuSvwPDsbDyA9jnD4i6g=;
 b=2S8Mjl+QfgnxrcM4C1g90NJ2eg/skxXUye+RCGWQ87VK27Enddy1/H2Swyw/AlR3AgWjlfAFDQ4aUss7btQAcRVxs9IUJW1ce4V6xl1DbSeCh+6T692Y37ocy9W8QcTrenV2bCgI8hTeVUJvNCQt548Esp1eIpSXIUbAoSZvQPP0fmaBjvEfGOGeDfKonEP2qfV+tUHX4vYmVUe1RLPPoaTdBlSMEuaUMeLPtQfXzPAKgrH+mnTwYgog02X7pHxAxt1MuuJwkXdd9nWnRVsnJt6QncjpVrAlVcgtQtT/NCzkYOfzMu9OLvBbETaPLbpds9VJknhYHjY8EJTDCMaZdQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <aa19cb1c-a437-7eeb-d727-3cc9867ac307@suse.com>
Date: Wed, 16 Aug 2023 15:39:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] ns16550: add support for polling mode when device tree is
 used
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <88bd54876c745ef45eb740274fd36d747c7db471.1691767729.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <88bd54876c745ef45eb740274fd36d747c7db471.1691767729.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB8PR04MB6874:EE_
X-MS-Office365-Filtering-Correlation-Id: 326cb86a-0150-4e42-c862-08db9e5e45f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WVvrp8eVFkCF1KUDY7GTHRYqEz1Ag/7Pn+5pcizwImIsldbtCZpRZ3FYEt+yl73y3wFdZoodLtP9LvzP+I8ipjEXiWjjXJQ17lT7ZgNu7mlXycH4ABmWwpGGDZFsp33SrKMjQ9DHPSSE27HjHGuTVtM3BWiOYpo6zTibPw2melYxc7tOe/ORWvmKy/0FJxpZB/hROdl7iIT3ySjDgPrLZvEduO83Y7AnRTMWo2ci5kE2aE7g0hwWNlD1cr4GgCygVhYAA7orBZnMXJPHM8Bm3nGsyJGd3zFYxTsWhijNllPfpWit8I5kLB9SfMPxBp0038Vt4sT4G/cILSU0HyPy/fZer7U2X8LN5stLF1zZ4d1dIB18EA8IT7idIWH/+xnvN5ralYIBmUqtJs/b7/Z1Cgjy7I4AWDNHS/1P9IiNb5y0+dlykJisRRsaousnM3FOmDQ5oYuoSjPR/a3bdkhlt5vZrvuPDKylm/EKXUqgfq4Z99DTQYCCxbcb2FgscBIKlr7gN1Nj5HFK37fFVwTDqTLhjbZSwENWA3Zdtna3+8ljwkyTesWm339EtU+Wn8mNM97LPeBPlW84FlxdpOCxxHMxd6+39Z3ZkuiwPB5Es0Zx8iLTN7Yk9OtaPU1oM5gaFELdWNAhXgWrEooK1V9sPg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(39860400002)(346002)(366004)(376002)(136003)(1800799009)(451199024)(186009)(316002)(54906003)(6916009)(66946007)(66476007)(66556008)(41300700001)(5660300002)(38100700002)(31686004)(8676002)(4326008)(8936002)(2906002)(83380400001)(26005)(478600001)(86362001)(31696002)(6512007)(53546011)(6506007)(36756003)(6666004)(2616005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T3prczlhUjIvaGdpS0pzaU0zMDV1NDJHOGxQZzUrUmFvY1JiNzErUUw1K3J0?=
 =?utf-8?B?RENIVFgzbUZQWUJEUDhLcnhtemdJTjF1bi90RlRqZHJ5QVo5cjdUTkxlS2Z6?=
 =?utf-8?B?RVI4Z29ISnFuZjgyN3BjelQyV1hNVlExNWsxY210anh2Z2xsdGFFSjJZQWpP?=
 =?utf-8?B?UDBSOXc3V3RlOFhyMFE4Y0JQQlJvV2IxeDl2RCtkbGx1M05mZThobkFUK3Nn?=
 =?utf-8?B?SHplQTVkYnpnUlBSY0FHemtYOFpicmxUSzJIbG9zeDYzVlUxQW4vOTBGYlFO?=
 =?utf-8?B?cThhWEE5KzliWVdyd09WcHk5WmVzQk5OREZycVBmTmRGQ0xTL2V4aGt5VFdL?=
 =?utf-8?B?bVVWQm4rek96akp2NzRVd29jQUhselVVUFNKMlNsbDloM0FTNk9qeGU2czha?=
 =?utf-8?B?aFRWRWV4UmdWOUpDTHBsdjdqOXhUeXkxUGQzcElqcFRTM3dPQUJkVTRna0kz?=
 =?utf-8?B?dDVCT2lRL0lLbFlVTk5qQk1CakZIa1A4VFJ2K3VRcHJ3dWN1ckRiL3AxYTg0?=
 =?utf-8?B?TElQcUhOc0hCcElHSGhQYTRKUmtZYUNWbUJiY3B5dW1wT0E4MjdPOXVRaGFC?=
 =?utf-8?B?Qk9YVkwrL1ZNZDNnNTI4NkY1MVQvY1VTV0FUUTdidTdHdDdSMUtNWGFzUUEy?=
 =?utf-8?B?aGFuQ0dHTmk4WkJ0REpvVW1RUVl6YXorSVdBWDB4Q2U2R01EVkdFNlAvYnFs?=
 =?utf-8?B?b29JYUdzSFJsd01hc3ZrMHVzODVURURQTzljdXhyUmJ1SXJuR014VXRKY2JR?=
 =?utf-8?B?NkV4anMwN3U0VXJLQ0tueWxNYVZKQUduTGMzY0pNWEl2NllzUkN1cnVZYkp4?=
 =?utf-8?B?WGhKbm9zb0o2TExOTm1FSklZZ2pVTFFUSCt5d3JneXJWVTJsVjFEbTJBOEdJ?=
 =?utf-8?B?WDRqYzhkb2VXV29TVUZZNk5xcm85cG41YWtDcVlaZHlYTmRXVTh1TytndTdR?=
 =?utf-8?B?NnZnY0ZvZDgwQktnL0tWeFBDeERzZU9GVktINWNmVVJzeXVybnJ3UUl0bnJS?=
 =?utf-8?B?bys1SVJCUm9nbFdSWmc0M2lscHBwazBWVlBaS2pZVGlHQkpYUmNNb2NsR05o?=
 =?utf-8?B?RkpqWmtzRW5iSkI1TEZ1OUtzL2F6S2dKUDRSM2ZzNUE0STd2bUxuKzVUR3VJ?=
 =?utf-8?B?S1JxTmZ5czE2T2xZYVJ6a0ZFamEvZGs1UWZ3N2l3dzZZYWNWN3hROFA0aUND?=
 =?utf-8?B?UmRTNis1M1hXZUhSaGROSmUxOXc0ZGdvTVdubmRLS1c2T3RQTmo2RW9uR29H?=
 =?utf-8?B?Ulk3d1Q2NktLL2hORVJEaGNiKzR5RklNQU9ES1dmMk13MDE4ZHpXM2pXbnZZ?=
 =?utf-8?B?ZTJIZ0FRRExDbkNmYlBSY1F4S3B4N2x5RlVrT09iM3ViaEZZQVFOcy93cVFo?=
 =?utf-8?B?a2lycWtGS0k4U2pmaEFZaXU0N2FHbFF6SGN3NWpOWTdjSUFiSzZhelJFQlV3?=
 =?utf-8?B?MzFvN3NYOVpoOEhDeTY3ejdrMjVRVHltbDFWTENNbUJ2N0JsUHVWUXhZU28v?=
 =?utf-8?B?SHRtekFvK1Bha1FqSGRaK1J6Zzl4QXZrdEZJYkVlSzd1QjE0ajFsV3hzN0lr?=
 =?utf-8?B?Um14WEFHMzRWOFpqZkxmd2NxaC8yRGRSYWNrNVV6azNUR1d3UHJ3RzJYWFMx?=
 =?utf-8?B?WnpzNUJjQUZOYis2SWdDZUY2WXoyblhCZEFUeHNxNW1NdXh5aXU0R1ppM3JQ?=
 =?utf-8?B?V3J3aDRXamxoT1JXL3AvTkQ0Q0R1WmZ5b2xmMDYzRytsakVwYTJxRm4zOUly?=
 =?utf-8?B?eDBpMEhUMURiSGkyV01aRzR0TVhqNnpySkpXNTBlUGpUMUl6M2VKWHcyNHlW?=
 =?utf-8?B?WHI3TUlIcHdWRmwxY3UzcXJuMElybjVSTk5SVDhxN0lFQmZlK0JPUFBjb1hO?=
 =?utf-8?B?d1cwdGZBNVhheWdrYzYwbTd3WFQvVzhwU3JhOWJTTmJYNjNodXNqZExoT0ZE?=
 =?utf-8?B?cllFc0pqT0RsVlRVVU1TZERIcUJ2Vk81bjQwWEhzN0RUV3AybytIOW5VNDNr?=
 =?utf-8?B?OVBhVGFKQTY0WUtWUEM4b0ZsbFhRayttZkgvelFrSTFoQlNWUnVrSk54bm5R?=
 =?utf-8?B?dzZKbGtqOHpkWm9QL2hROEVCQjBnUFNwcVRxN2VVNlVGUlpZYmNTcGJjSVk4?=
 =?utf-8?Q?obxAn6KJQW33TiQ2Zynr3luEU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 326cb86a-0150-4e42-c862-08db9e5e45f2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2023 13:39:54.2030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5MT62ilFqkd+BHi+vqEYm/zl0Ikajn6dYRFwIFZe2P3Ymb4OB65PzJ659Mnvh50+ivrFL8zeEYNPlrP0YyVSKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6874

On 11.08.2023 17:30, Oleksii Kurochko wrote:
> @@ -1555,6 +1566,9 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>          }
>          else
>  #endif
> +        if ( strncmp(conf, "poll", 4) == 0 )
> +            uart->intr_works = polling;

Don't you need to update "conf" here as well then?

As said before, please also update parse_namevalue_pairs(). I would
appreciate (but not insist) if you also added recognition of "msi"
at this occasion.

> +        else
>              uart->irq = simple_strtol(conf, &conf, 10);
>      }
>  
> @@ -1760,6 +1774,9 @@ static int __init ns16550_uart_dt_init(struct dt_device_node *dev,
>  
>      ns16550_init_common(uart);
>  
> +    if ( strstr(opt_com1, "poll") )
> +        uart->intr_works = polling;

Is strstr() really appropriate? Shouldn't it simply be strcmp(), with
there not being any other sub-options in the non-x86 case?

Plus the question remains of it necessarily being com1: Is there no
way with DT to have multiple serial ports (e.g. one for the console
and one for a debugger)? If there indeed isn't, then unconditionally
using opt_com1[] here is of course okay, but then opt_com2[]
is effectively a dead variable and recognizing "com2" on the command
line (rather than spitting out an error) is then also a mistake. IOW
in that case both would want keeping x86-only (with a new #ifdef, as
we certainly don't want to have com1 and com2 stuff in separate
places).

Jan

