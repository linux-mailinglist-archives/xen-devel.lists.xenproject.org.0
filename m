Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF745750901
	for <lists+xen-devel@lfdr.de>; Wed, 12 Jul 2023 15:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.562491.879189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZT9-0001Qc-RJ; Wed, 12 Jul 2023 13:01:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 562491.879189; Wed, 12 Jul 2023 13:01:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qJZT9-0001Ni-OL; Wed, 12 Jul 2023 13:01:23 +0000
Received: by outflank-mailman (input) for mailman id 562491;
 Wed, 12 Jul 2023 13:01:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8Wak=C6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qJZT8-0001Nc-0Z
 for xen-devel@lists.xenproject.org; Wed, 12 Jul 2023 13:01:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7d00::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31b3ff3b-20b4-11ee-b239-6b7b168915f2;
 Wed, 12 Jul 2023 15:01:19 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AS8PR04MB8181.eurprd04.prod.outlook.com (2603:10a6:20b:3f5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6588.20; Wed, 12 Jul
 2023 13:01:17 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Wed, 12 Jul 2023
 13:01:17 +0000
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
X-Inumbo-ID: 31b3ff3b-20b4-11ee-b239-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RQn5bXSOM5xU7XNIFQ9XdMsEvkEL+kT/ye7DY58Szuy/FzohH4avT+iXX9nQYlYio8valJBHZa9TDjI8g+3PUQeSrvIZ5Wpv8QcLA3nqiXxhbcWG6u72Bq9o2FerPD+ZnJ6WF6AGIq/Kykn9OF+R1cEOS4nqm4urr5rmOeFMCNE6v3fpzGKmCXQm5MbNLCkQm/5FdDxN8WlxIT8lrCGOg9tSuaJJM4mM7yRVVHcXgga3lI/Bi97Lx16wiG8MMuD4kM2RzOtN/2YGL7ElFBxzLnGLG9sl0qgPlpuSZPvLNJxS7XzJWHDsd7mP/u3ZAHZzJT4b2nHSb5CkDBVDE/W1mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RwV3K5ru0fS/EaEyw2Eum6+kPBb6VamB7EOPgvTjmok=;
 b=fnWYB/IUjlbPyeOfl15Efss2Bwf7cnn93DJz8pZMsX5zq8RQWKKXHYwtn5kub5W7rWownrkGegU+JDd8JSGCttwNo8IBXqf/oythsaIvMxbUeB7x+MHumuuWvho3Zic6UmTTpS/wENI7i0FWZel8lGj59aqbyRqT+glMSv6CBVCOdZPQ0soJ0D88bu4S30ui+3OOruYJzj6lu/2xy6MS/ztNfpO86KzQktxVLR6l8K7Na/+qe7RBOfVV9+rnEYksoF3iHwUqg5LwNpL17ihSVc7at0M/8UeLMxQcqxewlkz62H5wly1usz5gnCSv2XSDs19cnKOkiRlXFlIQb0S7Og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RwV3K5ru0fS/EaEyw2Eum6+kPBb6VamB7EOPgvTjmok=;
 b=CYrZtGe8QLCuucNA0nxdjjhcD2p+p74gXxnOd5Xi/o/bmnO/LRx91c0irYE99XlAQE3TsEUoVqL0laLNIwXe52t7arBfGmFVB0oTrbiiBm+Xrwvfju1w+g3G467RU0nbh/sP8kLn5G12Bk6qL/IfSTfUdpElfJr9d5Z88inJ+vo31idxmoINQBQY4HOivoyaVp5ao+39CcHXHE58X2Oe5xqIkxRBBijW3SkOprvRzOze2uUVXOK26+Oed2E7dH/ff2Y2gXViFXsH3syrXChoyutCrUhQDI5dgkm5rW1SHAg9QC42seWnkcSGblzCzxwfQ9gY88mQJu/zG62vAJqr1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c08e5663-3337-849c-6398-42d220f43463@suse.com>
Date: Wed, 12 Jul 2023 15:01:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] x86: allow Kconfig control over psABI level
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0b45bc88-fe5f-77f1-9f9c-37d9ea1ec73c@suse.com>
 <6f462a2f-2e91-6397-a527-18eeade19476@suse.com>
In-Reply-To: <6f462a2f-2e91-6397-a527-18eeade19476@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0102.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9c::16) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AS8PR04MB8181:EE_
X-MS-Office365-Filtering-Correlation-Id: afe55e66-42f8-49b9-bf92-08db82d8148a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GOl6GrtEhgxkEsXGnF3jWEj1+E7RD99MLSuwfafNBeMFwZWMR6Xj14Ki8nb7QO4uuWf0XOFpZEbP/EJ4yYStyVV1Q8Htzlutr7IPjIbK31jHboKQ/Y1Yw9ixmdb485g0tr+uyukuXGat2Z2aB7dBqNy8McD/nSUW13KURp2Uy8aPCtwJrd0MSyP/0lKR3+Iujq7imhbAyNJy8cOGLFnHdG1/QMOJjq/k47T1P/VB/faLIMnClndC6FxGUAZf1voUWwD5fDGManICxyoHZPJhQ+e8MtRF6lxbyPBo0BVYUHUGetyGdS55fcTLxpLU088fQyIs/OynehBZbCNaxNlqYyuCG7XJcpzbn//BJ3+B/xShg2Xx6hW1VZ+pQTLa4MIEYJB6iR4qytSFpr8ZhW64uiMKiyNJX9NkJ51gFd8Gx7f+pZxbPbo14QokdfxEvJyurcCNZRXZvbcEDkgl11BTmKveWzAoZbTVNzrt4b74ZUO1q3EyIoCIAhacuuO4hIKXX2DO87wn/Y73CN+N973BVSDPHGG7yi/zlFP1suhUi9k+9RaIt1EkFsJdtV6bNATEOo4pcXjg2tAM401KA76Nhh7ldsLr0HVoRDWDpepvuWLIqSzDmLLtGyYO/v9z1C0aMyxW8/q0l9+5+x8nSEgvsQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(366004)(396003)(39860400002)(376002)(451199021)(8936002)(8676002)(38100700002)(41300700001)(2616005)(2906002)(316002)(5660300002)(31686004)(4744005)(66476007)(4326008)(6916009)(66556008)(66946007)(6486002)(6512007)(478600001)(36756003)(54906003)(6506007)(31696002)(53546011)(186003)(26005)(86362001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWhTMFZUYjgvMXJhYytKRUJYQTROYzk5LzVZKzBva2VvRHJxbTA4SXd3MWF4?=
 =?utf-8?B?N0VFdUQ3ZnNaYkJXWTEydEdFNDVTNFFINjJCUXplMGdCZE9Wc0gvTGtHQUxz?=
 =?utf-8?B?bUlRMnRuUG5YZ2xyS2RRcEVHTUVQNDcxeEpkRFBmZ2JrNEJEYkc5YzRzRTYz?=
 =?utf-8?B?WnE2ZnBubUVkUTBDZUJ6Ykh6Vldoa1lFcFAvcXkwUjlvVkhOcFRwdm96cCtD?=
 =?utf-8?B?dDRwbkk0cm9UTkFWbktkN2lnaitHdlRLdyt0UjJrRG96U0ZIcWJxTFJXbmls?=
 =?utf-8?B?Z3VzQzNFek41TkxncUd5Wm9VNlpJSHpYbUhNSk1qV2p4bnpTaWIvZFZqV3Rh?=
 =?utf-8?B?V3owNXNSUjJ4bjZwV0FCYlJUN0FlQVNCWVl0TWRMYXBCNmpldGd2ZlIzV3F2?=
 =?utf-8?B?aUF3Ujd4M3BKN091K1VYSm50Z0VVU3RseUZISk1kZTF4ODFaRmI2NVIzVWJz?=
 =?utf-8?B?YkFwajVsd3VhemNYWDc5Um9Xei9PdVNYanZyQlI4WXE4M0tmdzBVRW5GYWVz?=
 =?utf-8?B?NWJjWHNDajdaaW83cHp4UUNTMWJaL1lLVlFuTGwyMDYzdDg5U0ZDZmJrL2dE?=
 =?utf-8?B?TVhacldmZmFIbmFrZzZ2djFJOFh5YWEyRkl5eWthTCtYNmVRM1l1Uk04bXJu?=
 =?utf-8?B?dEtjVEZuNHVrOXVHdHNFWXBRU256V3NCWTNWcVQ2ZG4wc1p6MjJNcGpPcmUy?=
 =?utf-8?B?MmV5cnBlM2Q3WHJGWFFZQ2RYUHdDMDRtRkozc2hqcC83a0JUa3FPVW0zVThx?=
 =?utf-8?B?a3JpdDAwMitFWWNhbFA0cGxvVWFkV0EveEo2RUZkRE16Um44OEhWVU1wZVky?=
 =?utf-8?B?em4rN3Z0V05YQVVMa1VOSE5NejZvV3VEWnZ2Z2N5bmZBQ1BLV05ndUMvOWRD?=
 =?utf-8?B?TVlQcGMzTnpCQm1Qellwa3plMzF2SGNoVHRnK2hhK0lqZTdnTi9rdTZ3cDha?=
 =?utf-8?B?ZVFvRlBkOWZFaVJQMWpGN0JkMC9xbUViQlRGaHcrTkpTbEVtYXBENFNtYitk?=
 =?utf-8?B?ZUJzQlFBb3JXWllIRWFkZEVFWWU0S1ZtY2g2bTJsaWNpVDhkLzFMcU9wd1pp?=
 =?utf-8?B?ZzdRU1NveGM4SlFxdE9Na1FjWktzc1VXcHoxMklmNWdNTkNWNkdZcTlEWDBT?=
 =?utf-8?B?T1MwVzI2MnFJM1VNY2srL0poenNKdVV6U2pwSWxVdVQrMU4yb3E0SkNEZHNB?=
 =?utf-8?B?MHYwRHEyenFvVGoydm8raFVMOFhwK2RRcmkzb2NQRlUxVGhIV25oR0NqMVNp?=
 =?utf-8?B?R2hhaTRJaThSQUJJazdRNnk1MGp6dDkrdDRHcExPYWg2WnhnZXVDRFgzRFpw?=
 =?utf-8?B?eUU0aDVFVVNCT083bnFXdVhOeVl2K2FROUlySFR1WGFON0JlVUFTbDljT0x3?=
 =?utf-8?B?aDBGY29GSTBWNENsdTI1Z3E5UmkrMnVHUFlYN0Zla0hEWTMwcU9McmhIVG1P?=
 =?utf-8?B?ejVmS0NuV3hCOXR2NncyZkwxRDJwV3E5ZVlHTE5rNTJ1bXdpT29lMjF0S0U2?=
 =?utf-8?B?NVdJTStHS2dxRkVXYjllbU5SL002UnBiY0cxY2JYWE9hZVBNbmMvZVBsQkpM?=
 =?utf-8?B?SEhjVURIQ0o1WXRZSCtjeFAyd21CWjJpTkozUXMyeGdDZnkvWUl6NzVzK1Iv?=
 =?utf-8?B?aUhHNjgvcE9TOU1pOU9ZS3hxRUJhZUJYa3p3YTNZN2RNSERVSVltOVo5VVFk?=
 =?utf-8?B?ekllQ2ZMSXRIQWJNa1p2U3ZPc1UwMU1YTm11VU05NGNtUkFqNTVVY041dk9r?=
 =?utf-8?B?TnJxc3Q3Y0hXbFhack9yZ0tuakk1NnNXNnpQaXVZWGg3NWlRUkxiTldyejBa?=
 =?utf-8?B?b214Njl6d2F3aHZjL3h3bVNERkd5L1RUcFZoZEtyVnZqeHhRcGFiZmdnQysr?=
 =?utf-8?B?UmViSGVjditwR21ycXQ1WUhCa0pJalBjcUM4bE5ITFBPVHdYV2Y0cEtCcTM4?=
 =?utf-8?B?c3lCVWozMExmRzJ2RGRjWWVpdTMvb2RIOTN2ZkxGMW9RWGZBWElpNTFHaXlH?=
 =?utf-8?B?WkVSMGtmb2RGMnBVbXJia2FTMXVtUUtYOWR1U2VoaE1XNzl1Uld2c1lPYVR0?=
 =?utf-8?B?NmZvQ1RKaUF2TnVlZU43OVBqREVxOW9BeEQ0TFNOeXpoRzhkdWdadGdWZFVJ?=
 =?utf-8?Q?L2YNmzEDOB8tJmZTyDtHb+TrP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afe55e66-42f8-49b9-bf92-08db82d8148a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2023 13:01:17.3131
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 12gyGML+LZiY4lXQLqtNona1Sqx2D6RoJlRCX8uphk1hwWogtiSiMQPH6pai0nKtB4a7r7cPYDYfrJXqnsEZzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8181

On 12.07.2023 14:33, Jan Beulich wrote:
> --- a/xen/arch/x86/arch.mk
> +++ b/xen/arch/x86/arch.mk
> @@ -36,6 +36,10 @@ CFLAGS += -mno-red-zone -fpic
>  # the SSE setup for variadic function calls.
>  CFLAGS += -mno-mmx -mno-sse $(call cc-option,$(CC),-mskip-rax-setup)
>  
> +# Enable the selected baseline ABI, if supported by the compiler.
> +CFLAGS-$(CONFIG_X86_64_V2) += $(call cc-option,$(CC),-march=x86-64-v2)
> +CFLAGS-$(CONFIG_X86_64_V3) += $(call cc-option,$(CC),-march=x86-64-v3)

Hmm, I should have remembered that this won't work with older gcc,
because of how $(cc-option ...) works. I recall someone else already
fell into this trap a few years ago, but then they weren't following
up on the suggestions on how to make their somewhat fragile workaround
more robust. Now I'm on the hook ...

Jan

