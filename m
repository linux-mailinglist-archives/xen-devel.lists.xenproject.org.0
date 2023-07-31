Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0CE769375
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 12:50:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.572901.897010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQT3-0005JQ-W7; Mon, 31 Jul 2023 10:49:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 572901.897010; Mon, 31 Jul 2023 10:49:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQQT3-0005Hk-TJ; Mon, 31 Jul 2023 10:49:37 +0000
Received: by outflank-mailman (input) for mailman id 572901;
 Mon, 31 Jul 2023 10:49:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQQT2-0005HZ-Iq
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 10:49:36 +0000
Received: from EUR02-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur02on2060c.outbound.protection.outlook.com
 [2a01:111:f400:fe12::60c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f07209f1-2f8f-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 12:49:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB7695.eurprd04.prod.outlook.com (2603:10a6:102:e3::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.42; Mon, 31 Jul
 2023 10:49:33 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 10:49:33 +0000
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
X-Inumbo-ID: f07209f1-2f8f-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cl6BAjux2KMwvVqM+QUQg1KnSdtEcKcvh7wa20NH3b7DksHxUFxXiAWrMl/dsbMY9Yj/R0UG1N2yP8DhgwijRHRK2zETIjgs6uElKVBXJrBoIC5dsFzLAubc0c7JmgcMw4vHoVwFDZ60rhT6rn88uL/IgE+TtVhKKlDzBUOscddf2q1I1A9xqCvRRGrq8jwwfRq3ZlaP/AbUBKb7I7WorJzWQRtm4I4Q35fgiTanW6WWXqClqA0Us1ewwt5GzbdvSl6BKHQsdD3ZTJO1MJUB/mTVeZjQw+pBQVOFGoD0mIyqvySnqSwlAPBi7Fu3EHsOfk2pBUqQFATpawzzRs4pHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUk93vsUukG1wnuqMAPjhSR8qVbloAaxMzKJwZ+rd2U=;
 b=oKQUiZtOvl9u1rhCqInfCVGy8XuB3gfOUP5NXe3Y1jf50RGzBBNIeHxKBRH+c8ENpp5cEg+WIakFeRKSBTWNZMgM+Ds24F2LzhBCxG+79LTCu6BzVRIcAWRh9eAYQxlWliZV5Y8OUL91YHIZt/q5g3RJF68uj4hrDZnqIf+D0QE7IVnCDxi0IZVApZK9T+apCthprteai/kd4EyMpJqP1PVyZl7PDofbWxQLQnuckJEq2J9oRtsbmAKoeAbFZB/g1fLC5dwQXPq5ErJZTzpQ93q/B70k1Txk0uZPlmmLjgETXJAQCImEA+M9UC7IKs5Dmm1qZ0hQJ3249PCkRfUvFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUk93vsUukG1wnuqMAPjhSR8qVbloAaxMzKJwZ+rd2U=;
 b=eA3l5ZzUr+eh6kymgTtGNnG3P7kjbnigWr/w3cJ6tWdgRiA+X/SFKxRWrwYbJQPmvPaOIHcPRedVDsZZO8BvpWnjH6KFwzp8lbRUXcqMIEFtT3V2UxFaVUqiqp0Mhx4GqDHAlry9yMYFt4gw//yO9FuBVsqMDSdnbNITXejnSZJVyHKN9gNxINVrLKdgiREDc3wVqFtP7Df8k6brTLY6R/cjSYeVqz7AsxNAmpyzpAN2VUpYPm6vZaPCb619V0E8fseqq27N5/y61zq/wMKLSSYiTQ2YSsfaA1d+kyNWgn+lgnZXxB5vvSwiCJGgmDpLEaMprFYWEQiOT7RjuhLSvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f21f71d-ccf5-aa01-cd4a-3f738842e64c@suse.com>
Date: Mon, 31 Jul 2023 12:49:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH v3 1/2] build: evaluate XEN_BUILD_* and XEN_DOMAIN
 immediately
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: Jason Andryuk <jandryuk@gmail.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230727145447.2701-1-anthony.perard@citrix.com>
 <20230727145447.2701-2-anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230727145447.2701-2-anthony.perard@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0046.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB7695:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e2fd5b5-1884-43d0-336b-08db91b3d33e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cN5XzQWVBSBlTXm5iA+fMonFcY1S4uqvq+v3XhsWT77AB5aOLi4x9oewdebfxIB6lQFVpw7pVHn8KdJYwWWGIsSkm7tnP0LAHZhx2JddwAIJOqpR3fgcOUTj1y+kDbzRR4WR/H2m7MUxPvgCtPpDjZdPNRCiecVEcPZ/5/HCWQUN/ydwa9/11yQww8FnLG/YAi/v/eKRU0ZH8F1eMV14Q0GQWqiD5JzY692GoBqRvzq4wa3RYzZKwCQ+Taqt8XJCSYAb3shu82v3x0OwFvzKyRoEaKTXnVgJ7ZMnxiiNN2kKV+smiK9xsqaeNMTTF9DvCQLsj1tBpPvX+2Hsial5H/ZVAVLwG19Q0GI3gFAvGTMHaw/QgrqzcYeHcAPkTsPRpCd383dpbrA9mvrX3sWNoEpKa8RY9z7ZGva9TleXvD8qzJ2Cu0H2p4SnUQUHGhoMkfJqtqJ36seAJGgBcHxRhfNen4NQXeKQlHKf7SIblHZO/jgAi6GJT3ewn+wQw89SotDZmbRe4C/sS3xsb6sRFmr1LUKf6w+x4QEpgySDFSfuqJIpaEEUYPzImT/rDbV3kWhLACZeV/CQgkgUguoX8xkVcaqGMD/iZU5ivt5T4svnz/TNA7mwWBcpSkzEG85NKFFcJJSnPQh8U7rnUKOjh+Abfvm6jLXX4xU6BYUwqJc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(366004)(136003)(39860400002)(451199021)(31686004)(2616005)(5660300002)(4744005)(38100700002)(36756003)(2906002)(26005)(478600001)(316002)(8676002)(186003)(6506007)(53546011)(8936002)(6512007)(41300700001)(6486002)(86362001)(31696002)(4326008)(6916009)(66476007)(66946007)(54906003)(66556008)(14773001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?amdYRjY4TS9VdHNpc3BIbFQ5WUVLcjB0c29PQnpteWN6VzdXU05MYkJDTUQ2?=
 =?utf-8?B?ekJSR3RJTXhQMVUwVWZxSkxKZmxVdUFnbXlnM0dDMXlSbjRHY25zMlo1N3d6?=
 =?utf-8?B?czA4cFI5UlgyVkFzbDZRZkFJNVZDMGJXM3VIQzV0aXR6U0xPL3JLL3AvN3N5?=
 =?utf-8?B?MFhVZUd2VmJDbURKYUhxSFMyaU5wS3ZHeStDeGlTK2pDWjhCamlWQ2xkSVVy?=
 =?utf-8?B?aG0vcm5GdFNsZWdaL0ljOVl0c3ZvTEQ4cU1YVkVqVTJDNmZKeS85VXAyajNw?=
 =?utf-8?B?cU5FNk5XOXVuUUJSRnlIL3RrQjIxeTJqYWlCcUErcEIyQU11M3ROcG9CVWZF?=
 =?utf-8?B?dGVQRDIxRzBvZ3hWNHBDazNHTTVmS0laaU9NSEJuQWdsMjc1L0F0U2FZVWVj?=
 =?utf-8?B?UkZaN2ovZ0xORUtSNDBQa291NWVsSENDTFFGZm04aEcrd0JpdGxER1JXZTJ2?=
 =?utf-8?B?T1ZvSDMrRFM4djlrWlM3V3BGYmJ2YjJ0WVZKQ1NyMnYyMm80QVRJMy9Eblo1?=
 =?utf-8?B?TXNYTGNvSEJHZWZBeWEwbUNReWd5YXVUbWxTMFF3UWIwdU5vU1hTSFU2L29K?=
 =?utf-8?B?WVpDNmZiK05qQXdGdEtWTWk0ZkJVbnIvZ3lYRWs1R2lnVXk3Rmo4SVEwd0pq?=
 =?utf-8?B?UVV6R3orV2prN2daQnJWenZueXRaN01jcmRWcXV5WUsyY2RNc2tUcUkxMy9S?=
 =?utf-8?B?aDJWVTQvWE1RcVM2M1Vha1M4bjZpM1R3RC9IcHRCeldEdkNoZmVERk5hVWdF?=
 =?utf-8?B?dzh6dW9EbmJlbkplQ29FcEN4MTk4b3RnTFhEL1cwU0lscDY2bE0yWHJEZkZP?=
 =?utf-8?B?akxFVEQzRkh2dUdLN2FqSGFocnVpQXd0TWkySHJ2eHJxN0RKWmNUcHpsTlJP?=
 =?utf-8?B?NXk1SThLNzJmK0tkVzVyb0VTZFlVejNWbG00SmhQUmdOQVJZOXVUd01VeU1P?=
 =?utf-8?B?R1Vsb1hYV3pGbzJsK3JadHZLTWRJZFJuOVFGOFU4TXJrb3A4Tmxxank3amVj?=
 =?utf-8?B?OG1KN1M1UHk4bU1ad1dSdDNaSjlDaGlKRWw3aXNBMWtxZm5uSWEwQnlGQkJ4?=
 =?utf-8?B?d3NFSjRmTmRwTGVBQTljZUhjRlFhUXVFaGI3aG1FVm82Uk5TRE9kL3M4bndJ?=
 =?utf-8?B?UDl4Zm9PbEsxZmJCM3p4UGJKbk1rYmlLZDFocE1SakdWeEdXb01YN1FNMHN4?=
 =?utf-8?B?dDBQMVFwUUVaOXV5VGZUMWlHaitxZE5tL1Q5QnVQWVVHNmdEdUJqc0tIRHJM?=
 =?utf-8?B?YlhsY1JHTlFFWmM0UUFNUVB4R0FnWGpwc3hoV3k4NWJIb1VUOHZyK0k0R3lQ?=
 =?utf-8?B?eEdXQWx4QnlNbDFESUZ2NHhPeURIUTBMd1lYdWgwUDlxMjlSalMwYklKeEFQ?=
 =?utf-8?B?VlF5Wk8yUXQ0N1JEOWFWVk1XSjQvbjVtZGhtRldlOG1nMGVvVVdFNHdyY1Er?=
 =?utf-8?B?WEpFV3hQWmUxTUlSS3E4SEVIQmdBL1Rtdm42QWRWRXdBTng4K0FsMks0RTMz?=
 =?utf-8?B?ZkpLNC9GUFlLa2ZVUnVMaTF6MkcrdElUT0dVQ3FtTms1MGpBOXpueXU5UWtE?=
 =?utf-8?B?SzZuREx0M0Q0dTFua2liVkhHMGhnYUpzdEl3dVlrQW1DK2doeHoyV2toa0Fj?=
 =?utf-8?B?T3BhR20ybXdZVWthYWE4NFNqZUdMdG10NnZoNDZCK1MvdEJXaTJPbmlkNFho?=
 =?utf-8?B?ODF6MVcrSXViTXlBOUEzR3lTT3BUL0d0Rmdnb1RXOHcxQTN3a0hWamlRUyt0?=
 =?utf-8?B?U29sUEczUEVCdHNDbFJhWmk2VXJNamJTR1RyUnBMTGxycTdGNGZVNk9KOXBy?=
 =?utf-8?B?NldPRDAyUmptTjMvdkRIdVFHTHBMWkQyQm1GZHNQM3BpVU1EWmV0NVdRa1N3?=
 =?utf-8?B?VWN2d1F0VlhTUnc0MTFZSE81czRmcmdJeGhnbzZmK25nU1NHQStRRkgyWVRw?=
 =?utf-8?B?MEdrOGE5a2pKYVpYb0tRelM1SWk1b1BRU3gveExTTTZaMkdVbHhETzlqd0dk?=
 =?utf-8?B?VVQzM1B2WXhDTmszMzhUUzMvbTY3aGh1clV2VWdDSmZzL2pBUEdsTTcrNjhO?=
 =?utf-8?B?M1grUHRSZ3FhcUYyUm82ODRUTmNjWGU4TGN2dDU4V2pDcGVaRzl2cjR3anFT?=
 =?utf-8?Q?51F46Xd2l9oAVEQV0wpIsXfbb?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e2fd5b5-1884-43d0-336b-08db91b3d33e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 10:49:33.4025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B00CiRxngvwfh0E3GpYQvVXYw/54W3DgrRRZPlp/zHXj/iVOMWm26N4lGGvegeisALgvuQc8NjD8yTvuQfieUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7695

On 27.07.2023 16:54, Anthony PERARD wrote:
> With GNU make 4.4, the number of execution of the command present in
> these $(shell ) increased greatly. This is probably because as of make
> 4.4, exported variable are also added to the environment of $(shell )
> construct.
> 
> Also, `make -d` shows a lot of these:
>     Makefile:15: not recursively expanding XEN_BUILD_DATE to export to shell function
>     Makefile:16: not recursively expanding XEN_BUILD_TIME to export to shell function
>     Makefile:17: not recursively expanding XEN_BUILD_HOST to export to shell function
>     Makefile:14: not recursively expanding XEN_DOMAIN to export to shell function
> 
> So to avoid having these command been run more than necessary, we
> will replace ?= by an equivalent but with immediate expansion.
> 
> Reported-by: Jason Andryuk <jandryuk@gmail.com>
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



