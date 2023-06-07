Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B146E725B4B
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 12:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544646.850559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6q5G-0008BR-LT; Wed, 07 Jun 2023 10:08:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544646.850559; Wed, 07 Jun 2023 10:08:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6q5G-00089L-Hm; Wed, 07 Jun 2023 10:08:06 +0000
Received: by outflank-mailman (input) for mailman id 544646;
 Wed, 07 Jun 2023 10:08:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6q5F-00089F-OM
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 10:08:05 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061d.outbound.protection.outlook.com
 [2a01:111:f400:7d00::61d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3145deee-051b-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 12:08:04 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB9579.eurprd04.prod.outlook.com (2603:10a6:10:306::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Wed, 7 Jun
 2023 10:07:57 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 10:07:56 +0000
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
X-Inumbo-ID: 3145deee-051b-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQXO7hXRy46jMaL7laowhsvZPOqSh4EXdHRKiaWT4uDpmIB+oHiXk1gKf4bvKISWCba5AEZzpCxW9NklKPgqTXMCVEPvKjdaP8f5IJCZxtANVE3RXpx94HVwRDcq5qSRAKh6W7xM5JiuMO60PdSRHamb6dnSL6VJxC42Dcy/5WcqmMXM6SHx08fnlAh8ZCL7geetwZn6jKOB2M9a6+bswsLXTonnuta5w4SVvEM33q65k13IOteQk3uPfHClT2Fwu7rnKy/9pNc1IhHsYR4+JjPAykX1eshbRBU3u89UMWaabloYymmZGjeCofymaiXthOKKvyFsmbOCXGOjXvK3aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7aSI9lSvPAdTvYt8KMrXmfa1BHJy5GIgor8Sau9mKbI=;
 b=DO9sNXFpSozg8oRiZ8Us7e1Yoz1arN+OzAZflkaCN6I4x0/Ax4029jG8jF9/zge6hBwicYLRm2Zh0nqL+MdIj5hU2YdGIZ457rnO9N0Tn/G7Z6NAQULOK6XdV7MzG0Ey95M0i5ICw7v4qryO/eEW1BPbVAOWUyF8aa0PdrAAN4Fny6X/yqyu/QGpH3+sPVob+k/YLcp24/uxW9ER6wk1Yjs6ARp9Drpwtf3fftw0P/QLrPt6Dy4OUHlLZj7aELDop/ttXrMMYE9s2/ZXEVugi6vG0rW9ohY9C0clr0AeKb/63zun9gessdbljhXdjSOAhW4q6/rOLPcY8QA/CvHMlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7aSI9lSvPAdTvYt8KMrXmfa1BHJy5GIgor8Sau9mKbI=;
 b=UOH/dg3B1eA6wGWTGf2PwUbKnw2Ih1ejnu9tWQIhgVAlxM+1SxWIl2Z8lvCdAhS3NQYcPV3kedNiABzDI/8ZsIYrIiX8Le4eFJcQ3zBOXySPBM1Zf5hBKFxkNOk3g3mzv4ZDK9+tB3NcoQ7a8n/dNsYYFMJKA86VS+eeA0/Lnj2glrndfRbbz8MmRTNwJUtIyckPkGSlugEOO+S+e1D9LSr8l/WxlnyXieV6fyfebOp7J4cVofRYJ/WpggsxOXCjyoDvXC1fWfw6pbdJsiNDyx4LXcm6EkU6HuA63KqSU2WoN+mYXBng8cAFi34AEfPduUEkZ8FwxKMje7HEqbqC2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0a0671ea-9209-37fc-1d9f-1c38aff45bba@suse.com>
Date: Wed, 7 Jun 2023 12:07:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 3/3] cmdline: parse multiple instances of the vga
 option
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230601130518.48874-1-roger.pau@citrix.com>
 <20230601130518.48874-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601130518.48874-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB9579:EE_
X-MS-Office365-Filtering-Correlation-Id: 6563e871-0085-4a40-4a59-08db673f10b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NPgvYUk8E0RGNpZE4rnDute9fsEkUiAf9OnmSofcbfqCPMq8ZNoO6vMkznb+Abnt+dB5714iAnnWjH4mTWZW4uneI4MxX4PI6QDBg4tWot3w/aaWsvl2Mar2s3wUpoGMx90B2yLvLbST5FH4GO/ZT7c+6YmHLAIWHNRld1ya1vAdmBA18vzldhsgxmd9Kp8qUjPFCxmXwz9yyBDzn6mf/v3hYIU+XRRF/5Ger4lJCgsrBQziLWJdG4rdj6S4WMCv90rmFYl4QLLzD7QxSLlSTMZV5L/X7r4jOMaiFLposVlLchZIG680uoNF4XRAmncImd5Tv/pRSir/uK29G8MULVRlQiMhP39LUPhKcsqQw3IM9oaLAhlVAK/zvIdtA1/GRMhu0YqhvlANgGi3V0D2MbM5mz6YX5XSzIUEKMFUFS1aBBWB7atN3bIZMgv/N1Onid+X1gvwmMcmgp1gA3T2M3u4tjNST8A0uvioylM4HXx+ZMUIWXvpH+zVURIdrWKTu5xUAB34O+A3X7Bm4bj10ey/E9ONlcusyUSqOsp3xTSjQdAbssUKJ5T9kQYKT6P9I6JEkx0Lpd3N63qK2/LgtnUPXQJohaTUjtHXCi6lFTsQiDJ/0H7tf3M2eb2Z3MUULQAej7mEyOql1HQq1Xc27g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(376002)(366004)(396003)(136003)(346002)(451199021)(31696002)(2906002)(2616005)(36756003)(86362001)(38100700002)(6486002)(41300700001)(5660300002)(316002)(8676002)(8936002)(54906003)(478600001)(66556008)(66946007)(31686004)(66476007)(4326008)(6512007)(53546011)(6506007)(6916009)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZVZsWUdVNU5zOU9sUEtseUZOWVRUcS9CUTQ3VXExWlRGTGRaMmRGSjZrZHNo?=
 =?utf-8?B?N0tCcU05dFJHa1pJVkpSL1hwcVlYaTRHWnJERXZic0wrS0JlY3JNZUx5K0NV?=
 =?utf-8?B?OGJiajQ3c1M1TXdNQ0VpOTUxUURGM0pkaVpRZUdtVlo2ODJwM3plYnRCSUxm?=
 =?utf-8?B?emZNajZieDhWTDVOTFQ1Q1dVSFdJTUFScjBnSjZYOFpjTC9PUGlzUXpJNy9W?=
 =?utf-8?B?c0lUbjdPVE8yM1g5elJ3bFp6NHJuN0poVmZpK2t6WGRNS1ZiV2tNVisreXoy?=
 =?utf-8?B?bWl5VFVsZnZwS01pSWZQK2g2M2lYYmJxcFVPN2ZsMWlJSXZLaGpBQTVpbk85?=
 =?utf-8?B?aTgzN3krblZNckFFaE5wajJSYnNUWnhsYkUwcDIrcVBBOUVKeDJLWDhWd24y?=
 =?utf-8?B?bE1DRUU2TEJmZnpndDZ5bHJSLzRTb3BqNEVkZkFGdmpITWNUdnhWQ1VuVVRo?=
 =?utf-8?B?U3JUZ2ZwVmxqcHNMWHJBUkFBeEtwdFY3WUxQN096VDh6dVM0eHFaUVk0K3ZY?=
 =?utf-8?B?ZG5VWjRyN3dHRG9yVUhKSjZTWDRLVzFPVWRqZ21kK2ZTMGkzSlpQc3ZRQ0V6?=
 =?utf-8?B?bytWMGgvZ1E4cG5rVFAxT0h4ZWVmczNFZVRKU1M0QUVVOU53d1RUQ3FQMW9T?=
 =?utf-8?B?bVF3UlF5VnZVMHN1aERXcFdDVmtpdTVibitaSW1rL2VQWnlVV2ZFRGZadUll?=
 =?utf-8?B?am82VWp3cmxMMlpYTjM5Y09NOEZNb0k3UEE1Sk5UaDRrbHFZOHdjdHhvQlJ1?=
 =?utf-8?B?Qmx3MFg0RWFvZVBQOHY5TWFwbnlYQzI0MjNXNXRvZE9aMUNmRkgvYUs5Q1hr?=
 =?utf-8?B?c2FFc0pxTjlwUU0xNnZkSXY2cFlRU1dhbDFoMGVuMUtEbVovYndEN1k5amh0?=
 =?utf-8?B?Q3hXdkc0WjRBMFlhVnNyVVN5SWxKV2hlancrMVJEcXFPNmNjRG5iekNYUUVs?=
 =?utf-8?B?c0dhRFQrQ0tuZzdTclBnV0Nxejd4MGwzTGtnaHFzaHEyVXBwT3JDaHB4OExm?=
 =?utf-8?B?MFlSeCtiYUlFV2MraU1Ubmc4dEE0R0pOK2RCMkgrcEg4UmNIb3MxZWgxOHVm?=
 =?utf-8?B?TVBwVWlkTHlVSWZQQ3ZBTmFmRytnRnJXblZDTHdKYlRxWXRKM1BkcDI5WGxh?=
 =?utf-8?B?cVMrNGM5YnhHUXBhZklpNVgvS2xSWFlqNGtIM1AxbW4xRWRycHVQaE9zVVJw?=
 =?utf-8?B?WU94d1p3aHA5L3F4SjZRWkZKOElKaTVyTUgzLzR4bXBLaExuK1BsM3Z1M3dt?=
 =?utf-8?B?V1NYdUQ5TVNCUWJwT09DYmRSc0M2WXNqRmxSSUgyaFhDUk4xU2tpZ2dCMWll?=
 =?utf-8?B?eENDT3pGaktMeFRDYS9XQUNIRFFXblJFc0IvOUd3ZmpBSktackd1bE14Nmxz?=
 =?utf-8?B?U1hxNmJZU3doakVEellRSFdGUG1kQzJoenZOUjFIWXRLalBZbmkrQWtrWnB4?=
 =?utf-8?B?Z2NLVU9lTmxvcitqTHUxWXhBOFJsVFdSTjd0ZkV4YURBb0c2NVFJNzVQRGJR?=
 =?utf-8?B?RTV5aG9aOW5wU1RibVVOR3RzU3Jqc29wUG9HeFlDeXB6WGtNbkhpaXFPVzJ6?=
 =?utf-8?B?R1l4WVF1aUhuOXhna01uMXZpRThwZVJ0QzAzWko2MlJDOGtOY2dwL0FLRTVZ?=
 =?utf-8?B?aWtLV1YrNDA2NjkrSjhWdFZtb2dxVWVOQkpMc0UveWFvaHpGd1o0Q0dpWjFO?=
 =?utf-8?B?NDZYYXppdmFLK1JhendBaHM5UTYwUkJTMW1RWVdReExBdE5aZzBWRTg3RU1Y?=
 =?utf-8?B?Y242aHA5WWhXZTRHWGpqa3Njd0xKcHhWN3JIMlk3cndrVXJ3L2tvdzRoZUR0?=
 =?utf-8?B?ZHJRRXU1V2F0RnJQeUt0RFZ3cnEyWG1lckxoUDZnUWJVSGxmZnF5eWQ1bnlI?=
 =?utf-8?B?M04yU0dvNEQwSUR6anFYNU5BMmJCZzZ1NzJEWG9yc0EyeVlqUUlGUEF6TVZY?=
 =?utf-8?B?UzFQMFpWUDBEMXkxK0xRYlFRQjRLVEg4NE5aWGhteGZGaStKQTNsbWptMXV4?=
 =?utf-8?B?TDAzM1FHL2kwQlNZOWlrUTBhQmVIb0hCRzdKWHhkdU9Ick15L3QveHk3RkNs?=
 =?utf-8?B?am56NHE2c3JtUkdIdlFybEo3b3plUlZvb1g0SWw5SWtnVGRBZSt0Nk41bll4?=
 =?utf-8?Q?x/ihVZjWpZReQoBB1qd4cV8Oe?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6563e871-0085-4a40-4a59-08db673f10b3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 10:07:56.5182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQFsuGp48pDy+jmFrGGBUb6D99/UTOVlw8jIqyNjMwzLAUWpzpvkPIMDN+2rU2Iu408Pgywd4fo6spd0y4+aog==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9579

On 01.06.2023 15:05, Roger Pau Monne wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -2628,6 +2628,9 @@ with the specified width, height and depth.
>  `ask` option.  (N.B menu modes are displayed in hex, so `<mode>`
>  should be a hexadecimal number)
>  
> +Note that all the occurrences of the vga option in the command line are parsed,
> +and hence later occurrences can overwrite selections done by prior ones.

I'm not a native speaker, but is it perhaps more "override" that you
mean?

> --- a/xen/arch/x86/boot/cmdline.c
> +++ b/xen/arch/x86/boot/cmdline.c
> @@ -277,59 +277,58 @@ static u16 rows2vmode(unsigned int rows)
>  
>  static void vga_parse(const char *cmdline, early_boot_opts_t *ebo)
>  {
> -    const char *c;
> -    unsigned int tmp, vesa_depth, vesa_height, vesa_width;
> -
> -    c = find_opt(cmdline, "vga=", true);
> -
> -    if ( !c )
> -        return;
> +    const char *c = cmdline;
>  
> -    ebo->boot_vid_mode = ASK_VGA;

I think this needs to stay here along with the addition of the related
"else if" below. Otherwise I expect behavior for e.g. a sole "vga=keep"
on the command line would change (in no longer prompting for the mode
to use).

Jan

