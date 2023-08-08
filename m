Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B42773885
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 09:07:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579281.907195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGoO-0003xB-CT; Tue, 08 Aug 2023 07:07:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579281.907195; Tue, 08 Aug 2023 07:07:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTGoO-0003v1-9Y; Tue, 08 Aug 2023 07:07:24 +0000
Received: by outflank-mailman (input) for mailman id 579281;
 Tue, 08 Aug 2023 07:07:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTGoM-0003up-S9
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 07:07:22 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3722a41c-35ba-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 09:07:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7757.eurprd04.prod.outlook.com (2603:10a6:102:b8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.27; Tue, 8 Aug
 2023 07:07:18 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 07:07:18 +0000
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
X-Inumbo-ID: 3722a41c-35ba-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYpXMwmcGDS1yr/uGYGcKiB8ZsgOU4+ZiTAWqdWcakds6wMpOuu3pxMYy2NsFuF+1242hjpTkvamv+iP4ns6sg8XcveVeRTqV6CZw/l4uU3xyIyyfJxDCLfp1zonSdW8Hnl4pYZO/NI7JLgreZI0iizn8ZNnmZU2UJ0t1YH0qqo5thVHnMX7EkqMkV23Zb9eSFgmf7BgX8HrWWjeSlhh8dmJxsDzrRif9SsGEHNeIHOUVyXZiNFu7A4fw8o7Ckhl2rUNKU8cfCVyt2Uhspra7b28oJ+RdwZbwy3dMgIcv/M9TYRsZfYOccA0CL+gjSWPeVYjxmV/SgANCDD14UuAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4K/6ih7WCPUX5PqpeT51DGBp3NNyv+xM1y49KZkLv5c=;
 b=D1hUKdL/PUTV5P7GBhz3RDCM4PK76H1PsP5kMkHefO9Hl/5x/CBsyXhTGLOCaZLY58Ivv5bHFw2ti7QANOFlyb09aYf6u1vWrG72J9346y3xXEzlN2opWlj+jBQXidFBIQuV+oFHrXY4C90worgkkBa/tjWVDMrjx1Ktys+OES7Rfaba1oiwWxG43Da9f+r/sYpM/93nXPta4+nxtQTHJLZPbbD2r9aYXw/Qr3YabpGYujrhF2d543K9HYv57KSByphUHzig3nnVHMt+qB5PiHocu7jUlPdNfFN0RwybmW/af96tI7dcPbn9IET6W4DQx5P50LchmgC3qxu0Df7NtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4K/6ih7WCPUX5PqpeT51DGBp3NNyv+xM1y49KZkLv5c=;
 b=5QPqHIN2+feSAzpQ+OFJDDrntSMbmLXD6vIbga7ROKTCU0Dsq2Mh53k256mUvdCWAyObJWLsRqM4PsHPQwKyKEoHJSGUfCX8lL3IYOgeHYBfGKDFiolxLAn+dEfboiPk/JFsdn/QLmmmz6KiaPxdwFFHiZ3hYom/RAp6iqsepyoyaP0I8W5LL2+aQwJ0mQoruALheYPQGS1vVH79GUg8PWs4ZnZ9Zfd9Ya+D1LFxgls668XBxSr09OmgUGW/8DqROg0+wxrH3IMHXLvEx0dAR+0utnIdjaG7bx0YjarwkNSlsHxVvKpFsu+m5vSuXsPhZKNqAR2sI2ZrmXEAKcCg9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1e5a1e82-b472-8c47-4d21-6df34755381d@suse.com>
Date: Tue, 8 Aug 2023 09:07:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH RESEND] libxl: Make domain build xc_domain_setmaxmem()
 call use max_memkb
Content-Language: en-US
To: Kevin Alarcon Negy <kevin@exostellar.io>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e7ab0b64b8dce1ca5b71b3f75f7bce6d4824d2ed.1691446380.git.kevin@exostellar.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0041.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::17) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7757:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d0e74e5-de3a-40ed-8636-08db97de1a03
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jGc/OKvdXyLCE/hGXZ0QSxeU+VsdDleVW1nGCUfXrQyWFo2xCTyIfvikdsyJ0BUS7Vm/XHhQSXVMSaARCpoguJ6WrMd3U4qzUZRon9D4CTD1Cjpd6IBPE/+cBm83y3cE00ZmpdxHl3HDffu7k+8FnZUQoFmUN79vswT1cUDAfAbl1EVVdZ+SFiexvh/HIUF04gGI4aO2mCsi/SilfDrqlr4qCkBTxmWMrzJeUGPGdPOZrJnQ6baCArhecHClFAguSGbI+F7GacKiNr5xlKWxO5Guz2PlaVa2dJAi1m+buU7lIx+aViyhdRoLl5d3vZYqxPkwtL78y67zxX9fX3+omGc5Z7yzkxL6mWziCHmAGZTbEYZWdXq3Hv2QrPG2ihhr01BEFvQB9C7tKJwpvxxJToXlHrDR5fB3vsjoPWTaYwSkhqeiGlGQtzUoqAUimyWNukzO7KfRTotU4QSHQJo6aFeTU3qXM5l0gQchS4N5p7TD1Vri6BTLybKyIB5fApaljFhKYCXd+OvM96yHvpixytXlsrATIxk8DtokT2va+pSp/32m3P9JxKcDQDJrJ8jWNHU6j7PNNd4rFtsBQnBrYX5ZyasUrj4ZR8T0FV0SdBUKhcg1xaRlvR2uUtuyNPZOZXjaT/DuikKqXnE6AcKYFG78bO36cFbvhCr+LCnphiyyp2O5Hh376Ojg6nkAKkTB2Wcw3TlO0XVA0ANfz8/1xA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(346002)(396003)(136003)(366004)(39860400002)(451199021)(186006)(1800799003)(90011799007)(90021799007)(31686004)(316002)(83380400001)(2616005)(2906002)(36756003)(8936002)(8676002)(26005)(53546011)(38100700002)(6486002)(5660300002)(66476007)(66556008)(66946007)(41300700001)(4326008)(6916009)(6506007)(478600001)(31696002)(54906003)(86362001)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVHMTVhY2x1WVNsQ3dKZnoxVWVqazdITkZlYWhjekxlSmFXMk1keS90ZXYr?=
 =?utf-8?B?bnZmbCtoSUlzTTBXbkw3aVZQV002Wk5XNjFBTXI1QXlpcDdFOTNxYzk2dU5H?=
 =?utf-8?B?T0UrejcrajkvWDFHelZqcER3bDJPdDF6NFNyeDN1RnBMNmxMN3pGR0pTN01x?=
 =?utf-8?B?RUljSmttZ1FKbm9aTDNrQU02Q1p6eXBHaWFpajdwLzJsTTJOR056UzlmZk1q?=
 =?utf-8?B?K2Jwb3F2cTNQVW9TQ0VxSUZ2SE9UZ3lJUWZPVythMWdTVFA0SmM2NitHYnR2?=
 =?utf-8?B?K1FBbDNVU01GL0FBRTMyMmZ0Rjg3cldyQlJiN0xjV2RLeHB1UDFzRC9iOUhP?=
 =?utf-8?B?Z0Z4U3NTREhjTE9jeU5sc29HYjIxNVc4WTUwbDlaSjNlTFVHWEtGNEZyR1Zt?=
 =?utf-8?B?VURlRTQ1bmg3MzYxa2NNRytjdzNzZjZrQ1dTNk0yNHpaNmdRTEE5bEZJbXFr?=
 =?utf-8?B?NnZOTEorMXFqZFkrS1FmTFJSSENCQzMwaytoRWo0MFB2aVYwRDNteFhOc3Qz?=
 =?utf-8?B?b1ovazdEb25QSzZ5RWVrZ21wNUZzcmJrZDlvOEJTU3g0K0UvVGJLNldWSTJo?=
 =?utf-8?B?YjRFK0ZNL3luYVFnSlF0enI3R1JKUC95MzhKK1RpQXp3eDF5MmVlLzNJMEdY?=
 =?utf-8?B?N3I4QXJkQjRYU0QvNStKUE1yQVlFVlVzK1A1L3g2UUc2bnF3UzBLM3hxT1VQ?=
 =?utf-8?B?K24vbTRSVEcrSmxHUG9MNGVWUDBsQzNpVGRDVmRiNmdscXBkOUt4YW5Ybjcx?=
 =?utf-8?B?VWpNRFAveENpZGhvYkhEZTJqTFVISmNzMW55TncvUms2TFg4Zm0wOFhUSjB2?=
 =?utf-8?B?NmljbVFhd3RqQlBWdzdYdDNWenpZTFRxYTJCOGNuT2h3dnFWUDM4U01RZ1B4?=
 =?utf-8?B?MWdRMUY2dG55d2FRcGVsNEFNMkEvTHJpWUVBRSsyOUJWMExDSUU0UFRVV0w5?=
 =?utf-8?B?a0hBTVE4Q092S3Noa0Q4YnYyeTgxWGJhYWNFNUU5WUpSTlBKQm1LWnpRMEFs?=
 =?utf-8?B?SzZDbjB2RVR1UHdGbnhyd0g0bTFSREFXc1VwZ3FkZCthblNiQjVmcnJUeGF5?=
 =?utf-8?B?c1ZCemszdkJWaGo3bXlGQWVmV3lUNit0Mjdnblo0c1Y4ZmJNYVRTTDNFQWQ3?=
 =?utf-8?B?SnlMMHMrcHNWTFhoQUpkNEZVSUNUVkMyQWJUdXM5NHp3Nms5R1VIMzIrTVhE?=
 =?utf-8?B?Vlk2ajBHbjN2NngzSm1TWjl6RkxkU0lYM3ZZRDFRdWFiVGZQaEdsWlFuZ0s0?=
 =?utf-8?B?OGRBcTQ2YnhlV21DUzQ5SlhqaldvR0UyNERHZWRPc3kxc1BiYXVEZGZwMHR5?=
 =?utf-8?B?WGIycGlYNXhENHVudjZkQmIvSVlIaHJ2Sm5RdzEyVFRLZnJUaGx3WkRLV1BY?=
 =?utf-8?B?SWR0dUdBVC9OTWdRWXBWZVdNL1kxVzd3dlR6UVcvNTRHdlIwREVqY1gwL0NN?=
 =?utf-8?B?eTZHcUhiR3Z3N3BuN29pNForRHFZanRLcUM4RWtRb244QU5XTWRreG9jL28w?=
 =?utf-8?B?bFR6NTgyempLZ3JqNE8remZOY1lLYVcya05ZZWYrTVFieW40dmRrMllkaDRX?=
 =?utf-8?B?RzdjTGtZY0svdk1KZXprd09wRE1JeEZsN3JCdWd0K2gxVWcxU2EzeWhtV0Vv?=
 =?utf-8?B?V2xIMURFR0QyV29ZMjFDakZLcHFxejFWVkJKYkluOHB0K2l6blYrckV5YWlY?=
 =?utf-8?B?SXQ5SFNLdjF6MjlQTDRzVDVkem9OeCtvY2NNOTBaMDduSTM2dnpvNHdMcFQx?=
 =?utf-8?B?eG16WjN1Y3NodG1jZWx4T0hmVnB2OWJpaXYwZTJrV2hUZnRpM3J5T1BPS2Y4?=
 =?utf-8?B?VGlxK1QxVTRaWENiMXMya1dMdW5QTnNiVm0rR1RndEZIaWhCcnN6Nno4Zyts?=
 =?utf-8?B?dkhNYllTcU1JTUYyZTFicDRBMERHSG9aQ0d4MGE2M3BPVmM3V0JHNElVWHY1?=
 =?utf-8?B?S1ZsU2IwN1VkcktxaUJGRXRRSUpvOWhYbXZsK2duZ2FKeDZScFlCSVgwdWc3?=
 =?utf-8?B?OXQvQVIzc3pGZGdZbVcwSklRT09JYXhTRnBhYnBaVGpvVUdRM092SFlMRk1s?=
 =?utf-8?B?ODBMd3lXY2h4cS9zRWlKOVJhMFJ5YnhzV0loL2ZubDE4KzQvaGkyY1g3cGV2?=
 =?utf-8?Q?M7H9uMCWkGT5fQcyuELiPklYd?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d0e74e5-de3a-40ed-8636-08db97de1a03
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 07:07:17.9940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9GkCW4V92leApKI65tj+xCFs9P/WktzWN/NRmp0OSBtvJ3P2huifWiRlb7bTA20DyjZRJZtDbnXbzsbAk6HjjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7757

On 08.08.2023 00:16, Kevin Alarcon Negy wrote:
> When building a domain, xc_domain_setmaxmem() is called with target_memkb (memory in domain config file).
> If a config specifies maxmem > memory, any attempts to increase the domain memory size to its max,
> outside of xl mem-set or xl mem-max, which already call xc_domain_setmaxmem() properly, will fail.
> Changed xc_domain_setmaxmem() call inside libxl__build_pre() to use max_memkb.
> 
> Signed-off-by: Kevin Alarcon Negy <kevin@exostellar.io>
> ---
>  tools/libs/light/libxl_dom.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

A note on why you resent would have been useful here. Is this perhaps
more a ping than a resend?

Jan

> diff --git a/tools/libs/light/libxl_dom.c b/tools/libs/light/libxl_dom.c
> index 94fef37401..16aa255aad 100644
> --- a/tools/libs/light/libxl_dom.c
> +++ b/tools/libs/light/libxl_dom.c
> @@ -355,7 +355,7 @@ int libxl__build_pre(libxl__gc *gc, uint32_t domid,
>          return ERROR_FAIL;
>      }
>  
> -    if (xc_domain_setmaxmem(ctx->xch, domid, info->target_memkb + size) < 0) {
> +    if (xc_domain_setmaxmem(ctx->xch, domid, info->max_memkb + size) < 0) {
>          LOGE(ERROR, "Couldn't set max memory");
>          return ERROR_FAIL;
>      }


