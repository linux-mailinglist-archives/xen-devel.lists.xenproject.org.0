Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 308FA72B86F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 09:10:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546865.853944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bgV-00061b-OP; Mon, 12 Jun 2023 07:09:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546865.853944; Mon, 12 Jun 2023 07:09:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bgV-0005zN-LM; Mon, 12 Jun 2023 07:09:51 +0000
Received: by outflank-mailman (input) for mailman id 546865;
 Mon, 12 Jun 2023 07:09:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8bgU-0005zH-2l
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 07:09:50 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on20616.outbound.protection.outlook.com
 [2a01:111:f400:fe12::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1e0a9182-08f0-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 09:09:48 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9476.eurprd04.prod.outlook.com (2603:10a6:10:366::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Mon, 12 Jun
 2023 07:09:46 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 07:09:46 +0000
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
X-Inumbo-ID: 1e0a9182-08f0-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TI9F10TwQJEEf7EdaV7uWuTlZo4UK3ea2pcd7SmXVJEwS4joJKccHrtM+DvhJYor+ClygNn9hcR8dQcpsvXChueMAKR9zDGfrGpiUs6/jSDAX9NhK1nqaX10WKUvH4QFOBSk7WNupr7ZtebpNWaIAxL7hArbJEKetIL7/YVWsdwkxL5uyBM0RoH5ojy/+bZiZGdq4HXPM9dx1FwqatotdEb8w59had/isqKQxaXWrHVjG5ulagvf5IPRhCG/JUJOhj3iBYW9EHtVwVf8z2fWrPF27zrxnFSL2RBYipTHa2VLjaE506+sz3qD2p3PWHw/eihBPYcquwkdlbWu8Z2l6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6mU7HsEVTpwTt8IixyVQQdXCiCVfEdrlqSNY7K+Xmwo=;
 b=kpiB3O+UNmtuco9j8tlIPjPton1jVeQ3NFBUUprQWUdmq1GDYNJFVDAdx1CUGGDkPzlHDpLCGrF6Uy8tbKSgC0WWDtIrJtoZKc6OvKV5LJfuIEopGuzXvj6z5ffy2xTB3J0D+pPDCK0p7pdE3znmwRMR1AyPc7Pl7PXjednockWNxsVz3DoX4S7SMuQPmHZcHUigUAJ4lGlszKTcz7myCd2HUM9JTxsTatHhapRoruxBpeU9HYbNAHGb+JcxtRPFbhDup0DzZeLv0kbZyVTbIR4rBVgpQq7+500jMWDFcu7WCVIcF2iGVcZCN5xOamKI36/0QH3vcja1JYgDqr6N4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6mU7HsEVTpwTt8IixyVQQdXCiCVfEdrlqSNY7K+Xmwo=;
 b=U2bH9DuPPn4k50M/yrZpYSWFGdL7qr5UP61gCzXSz6KHdo0ii7DbEtWHhC8LyEhHFiPEd/TMSVXr8Ps0cjbV/pmFghLJK1TKnBy5wmV/0pAhmb2hzuHinzKSk0sEYjpkmZq6MorRgcXUboLRClGSbBR4O2y3dROd2ZaQt3pOOJ1MxQfObZrEXr+fyh5Vp0d7vIywLlRnye7AQpEqHwmDDFuLym9/qBXKe7Ioj+Y1Gjpp8gZ3UdiKpO+7oExHU8oRq2zk59mhiyR+CIJldLEXW452BHdWYgPX95cCOi+5SEgEc4T5Ft7ORuRDdiGMROgpJhCDuhtfS9FTGWuKoK8NiQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <bcb3e4a2-2aa0-efac-1879-f2c30de540b5@suse.com>
Date: Mon, 12 Jun 2023 09:09:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 1/8] xen/riscv: make sure that identity mapping isn't
 bigger then page size
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <4ad639bed6b8aa6cee34288a7ce154db21d761b5.1686080337.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4ad639bed6b8aa6cee34288a7ce154db21d761b5.1686080337.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0205.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9476:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b90718-33d4-4267-4981-08db6b14013f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YaL4XPpFyT+4S9zH5W4RBlaeR3iihxW6yrysrXeShzV1wdQtzuvH3SBUfKxgV8BCoZ8Gyc1iGIhwVxFzKMlf34lc6JBG5G951BzGqCR+xDO3X1M4Nj/XLhJ4qmo2uRHwjwk109qaXH9jOW1paae0ch06oT86bbtGqdpdwlOA9b68+v1mBjVAlNPr6QpZg8iI5IXmGEfp0KbIYA+kK2IKWp80vi4nba0Cy1WU5dMpMyAcaVuwcG7aZeVeh8LpFjfIDCigaxUkaXOFmeKCcNvA51v1u52K3rKDZHw8SC4ewPX/H1bcMd3xYscP5C3aJrch5Exj8BBe9gSMSsndC07uqtDZhKYtsRNVwTsjseQWMrq7UPHG3uQs8UxVWeIfH52f4eCaTI/SB1DVIp/ZrP1DVIqjGtqwempSyHLb/ZyFvraNlDJiQHDYuGfgmphTwzGADb6sF8wKkkSU8UCzkWQaIHVc9PSNRauIIF2oYKd/IQrr0tGib1yyQNTN29rqj+v2CXkapR1peeOEvz4Ek0fa6C1fCDI/K8giJ+YxJ2iwYwp+rs05fAVf4uU9L3GKXoaxUdTbnuiwD/O55umLHCrP9ntzeLA/A0uP38yn5LaoGLh7ZsU4yKuZhUDjyMKKDFV0bcg4KG3aKMYwb5JxN98ZxCAW+ekk9GP/IBOYXULx1lOgD0JNE8lnWOyWsA/VFdzl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(39860400002)(366004)(376002)(451199021)(5660300002)(8936002)(8676002)(2906002)(31686004)(66556008)(66946007)(66476007)(4326008)(54906003)(6486002)(26005)(6512007)(6506007)(53546011)(6916009)(41300700001)(316002)(186003)(83380400001)(2616005)(478600001)(36756003)(38100700002)(86362001)(31696002)(135533001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDBQS2p3RFVrYThpM0hSZU9OMU9vQUhwK0p3SkJuZnJ0elpUOFp6T3RPd0Zy?=
 =?utf-8?B?NWNIQVlucTB0NHY2MTRheXBQV0R0c3lXeXd0dlBWMmRSWXFocVExMHdRT0pp?=
 =?utf-8?B?eEhDSGk0SW90TUJvd2NkazMxK05kYTZFb3F0dStTbS9FcDZEdGNDSFphYXZk?=
 =?utf-8?B?RU50Q0N4NkQ2aTNTcHowb0lleU1pdXFHRzdOblJJMkgyTnV2ZnJvZVl1TWZp?=
 =?utf-8?B?TFVyMW5RU3k1SnluV28yNEFDb0dMMk9Pb2FuWkMxeVZZNUpURW9OYUNoTjFR?=
 =?utf-8?B?QTBBWGY2T1lwamZPL2JXWk5GckJGQ001a1NsZUErcC9zcEk2cHdtVjA3TThP?=
 =?utf-8?B?djRzTFlsT2gvRlE3UFd2WUVZY3BXakpUVkdBVkVNODBzL3JsWTJadWlYOFVu?=
 =?utf-8?B?YkZxR2lWS1dpZ2pwRkovd3JJSE1TSXN1d3UxaU4zTmM4aUVoMTRGNWI1dEpZ?=
 =?utf-8?B?WXVsTTJkM29yZW1Ja1VkY2dkZGV0c1hhTkYrbDVFcUtnMUNvTGNrdFdHNkEz?=
 =?utf-8?B?Z04vaTlMTFNNVGVZM0U4VDgrTGZITmVldjJ1a3pzVHlTOGlFemx1WEI1UElw?=
 =?utf-8?B?TzIrZmtIdzFFU0VxSHBaUHBrZ2FxWkxURjdNM0w2KzZTejRoRGNFNHYxSW9L?=
 =?utf-8?B?OU43TS9ST1M2VUhydVk4Rm03SW85bjFsd2krR3cyQXozTXZ6dFdlbXAyZDRZ?=
 =?utf-8?B?LzhucXBrNEZQRng0alEvVE1KN2t1L1A1ZGVONnRPRVc3czdPRlZONzh2NFlZ?=
 =?utf-8?B?cjVjd09lWU1ISFovUWl6N04zTmhMNE54d3ZYQXAyOEtGRFhVeFJTRjJ4a1FR?=
 =?utf-8?B?OFAwdTNYbks5czZZVkdFSG8yVml6UlVYVEpEY2xZTG1CekIwVlZMQjhBMUtp?=
 =?utf-8?B?czVHSUp1UVd2aTFVcDFoMFpxSkw4ZFRRVEJZbDhodXArS0x3ME5yZ04zSU1P?=
 =?utf-8?B?ZEl0NkIyYW4rSVdKVjJsYm9ONmFaNDF2UnpBcXVaQVBDaE9lYkxkS3luMUk3?=
 =?utf-8?B?WHBtc0ZRZSswUmsrQ0JnNGR4TkNGQzZ5dmVPdTVSeEp0bEVKRFBjeis3N0F0?=
 =?utf-8?B?MEFyTVRpWmdyc2ZPUHZtUnpIeHEzRStIbFRER2VJV0NxaWxGSWF0c091bG1u?=
 =?utf-8?B?dEFwWkpoTUNCVjRQMGJZWWQ0RG53dzcwU2kzZTkwMW5NYWJvSGZzUDdXUGcx?=
 =?utf-8?B?UCtSdEtNOGxwYUtmak82VmpaSFJIeXZNRGtrV2pBOTFyMWl0SmZYQm5USXhL?=
 =?utf-8?B?c1BWd0srSXdIRE1NVXpBeU1DZEp0SXNtdTN4UzhCRFdZaXZiTmo2akZ2Mmlk?=
 =?utf-8?B?bnh0UGhCMWhwcVdhTTV5NTgySnlQZmJwUTBqSjhZRVZEb2hJYU9UWEF5dTRV?=
 =?utf-8?B?T3l3T2JGQmVRY25zVTdWOXZLdVVVTlNjSFp0azlhNjA3aHRIOUliS3VVd3Yy?=
 =?utf-8?B?cWJrekVWZzI0MkEzelB2blJHVVRMcW55R0lPMkxubVhTM01YSE5YaU9Gc1BL?=
 =?utf-8?B?cTFLbVNITEFxSHM2ZW9BTkYyOE5TT0hZV2NlYUp2YWdOaFlINVhTZlFpaURV?=
 =?utf-8?B?U2liU1ZCeFI2ZzBta0R1U2lsRWxUang4M3dESUVzeU1keCtYQWc2SThuZlpH?=
 =?utf-8?B?RHI5RzN2K1VCb0NvSXl4RlRZbWlGUVk5ZXAvVE1qanZXaDh6WHNDZVhoQmha?=
 =?utf-8?B?RllZSUVoTDNzUzRHdTViZnNqSTlkZVp2dUYvWVNtL0xEYXpWaWQ2VG5SVDNq?=
 =?utf-8?B?QmIrWGk1dzg3aUZsUGNTelI0K1QxRFFiR2xEZlpxSVIyeWFpVGh3T1o0RW1x?=
 =?utf-8?B?aXJSOURtcG5QL3RJWW5adW1NRmkvbEpaR1o2QkRjdlFKQldoMHlpdjlSWXZu?=
 =?utf-8?B?cUxWZnpGeWd5THJrOUZ1QWlKa1g4Q3h1TzF2MjlkZzhtY2diWVVsbnJvbnht?=
 =?utf-8?B?MXJWTVJFMnpHTDJrTDQrTHFRZThDRmg5ajN0cUVKRDV6TFdQbDM5eEFzNGJR?=
 =?utf-8?B?UVJKWnlobi9nUjBrd2J1dldYcU9aZGpkSDVnZ25ucXFOOWxsa1JGb3crcjhP?=
 =?utf-8?B?VmVHV21vMExEckdKejhWaERwWmNBb0x3L1RHVFlWNTF5VEZqbmd2T1pQMFM1?=
 =?utf-8?Q?T5VQMiHLeJIJM9T0ea1rtLGp1?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b90718-33d4-4267-4981-08db6b14013f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 07:09:46.8554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWzo2QeJmF0poCvhvbNAGvzyjl5vHetN24a50Cu2edBt4hRRa/Ol6K/MUkLAyr0lQOx7+4nm4ZrK5He6rDJJ7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9476

On 06.06.2023 21:55, Oleksii Kurochko wrote:
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Such commits without description are worrying. This may be okay for
entirely trivial and obvious changes, but that's going to be the
exception.

> --- a/xen/arch/riscv/xen.lds.S
> +++ b/xen/arch/riscv/xen.lds.S
> @@ -20,6 +20,7 @@ SECTIONS
>      . = XEN_VIRT_START;
>      _start = .;
>      .text : {
> +        _idmap_start = .;
>          _stext = .;            /* Text section */
>          *(.text.header)
>  
> @@ -35,6 +36,7 @@ SECTIONS
>          *(.gnu.warning)
>          . = ALIGN(POINTER_ALIGN);
>          _etext = .;             /* End of text section */
> +        _idmap_end = .;
>      } :text

So this covers all of .text. Why is it expected that .text will be (and
remain) ...

> @@ -174,3 +176,10 @@ ASSERT(!SIZEOF(.got),      ".got non-empty")
>  ASSERT(!SIZEOF(.got.plt),  ".got.plt non-empty")
>  
>  ASSERT(_end - _start <= MB(2), "Xen too large for early-boot assumptions")
> +
> +/*
> + * We require that Xen is loaded at a page boundary, so this ensures that any
> + * code running on the identity map cannot cross a page boundary.
> + */
> +ASSERT(IS_ALIGNED(_idmap_start, PAGE_SIZE), "_idmap_start should be page-aligned")
> +ASSERT(_idmap_end - _idmap_start <= PAGE_SIZE, "Identity mapped code is larger than a page size")

... less than 4k in size? And why is only .text of interest, but not
other sections?

I find the other assertion a little puzzling too: Isn't that merely
checking that XEN_VIRT_START is page aligned?

Jan

