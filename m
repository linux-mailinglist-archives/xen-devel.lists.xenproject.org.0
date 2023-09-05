Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58B337920F9
	for <lists+xen-devel@lfdr.de>; Tue,  5 Sep 2023 10:23:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.595432.928989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRL6-0005YT-Ce; Tue, 05 Sep 2023 08:23:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 595432.928989; Tue, 05 Sep 2023 08:23:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qdRL6-0005VS-9m; Tue, 05 Sep 2023 08:23:12 +0000
Received: by outflank-mailman (input) for mailman id 595432;
 Tue, 05 Sep 2023 08:23:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JoEh=EV=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qdRL4-0005VK-Ky
 for xen-devel@lists.xenproject.org; Tue, 05 Sep 2023 08:23:10 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on0616.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7255db35-4bc5-11ee-8783-cb3800f73035;
 Tue, 05 Sep 2023 10:23:09 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB6935.eurprd04.prod.outlook.com (2603:10a6:20b:10e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 08:23:07 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6745.030; Tue, 5 Sep 2023
 08:23:07 +0000
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
X-Inumbo-ID: 7255db35-4bc5-11ee-8783-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTqY5TrPxWtDBQPYcbNcyHx6EViiuPprJmqAqoo9lvNvZ45lwbkMHIdcQO5a0zJb2hz0tQbSrdRyvOsJPvbmnw1qz1wBx8qHx+cJWVtzJ9HAKpsnRt8btC75iLuIkYJ1pwe1QHKRLhz6ZcdkE4+gtUTvsnj4Cc4gpG6u+T+xyEFT5L0QahDu5zOunv/0daDi+E/4pxYx4XQqJlUUxbs/6ZF8XzvrV5f+4MVuGn4q+0AqLgNz8SUqqDklHj1IaXvvKlutRRhskgwhXvOmNzAduiWrJxuE8NFAwkyfqkTxJjfd6YXrX6Ck0OCI2bJn4D3+dXrBxndSsAFn2Bey/BrrEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fizhdZTeaN1ZrOIRkRNtGAYrbL2Kl430AMz7kkJjzXE=;
 b=KsKNIrR2Mo+7q630/A+SwpFgxqOzruP1wKzcS6m5ttmlOx8J++/tWCryKqmp+8Lsay65+Hwnw47ju02CxUnA+944oio24E2thG0UMLjl94e6HOSyRoLJfXdxlpxxchmW8jaWGsJvJKLW9oajDf7z1fKawq3If540As8CCur3mskWJEu++O9CU03Uk99M2COV8/qCjCHGxfPo5pOWQ5+aby1HXlb1weI287JrOBxc3OIz/JArDuNCFjGldP19ScBRqx9M7EsHLOIJ8OS6Kz926I5EW1R67Oe+zxfNH4Gs/dAjf/jCEQwFMBRX2o42qyRbv9lMluLQJTPPjX7ISFazQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fizhdZTeaN1ZrOIRkRNtGAYrbL2Kl430AMz7kkJjzXE=;
 b=kwdRWpQ1w9bul1T2zjeqqolkFJ9chT6liF4S3Og7aIMgZKuAq4cB8G7IF5H/vwNaKkTBwqS8sLf4TXtxlvzwZ+EDCeWQhLt+/y6cnOA7uQVik4dt8Jq1hbstsbafxKwxro1xtU/TrneLRNF32/5+LE4Gr0o9rusdZqMjNZK/WWSnq9zyPLQ8aL984H3SP6jFaPUVK7Y5b5Wn4RmR1LkTLGITo41WLVPIfEZ7FeqB+QCUDi8yqH7bBPkPT2FVhm+TvYxnPr+TnwzE0DI1A7dNqLFKG/Bx7LL7yk3m1ZFGxmeR+2PQbBcRa5i59DeCB9tg+fR0zUvYlquSWqW6RNobfg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d131cdf5-8716-a6d1-5477-ed2bb60145cb@suse.com>
Date: Tue, 5 Sep 2023 10:23:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] Arm: constrain {,u}int64_aligned_t in public header
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 Anthony Perard <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
References: <56bb2024-dea0-79e6-6a51-66e6c35a2733@suse.com>
 <5FA473DD-FC52-4F55-8B49-69E75752112A@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5FA473DD-FC52-4F55-8B49-69E75752112A@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0098.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB6935:EE_
X-MS-Office365-Filtering-Correlation-Id: 58bd49e1-75f2-4d92-b0a2-08dbade95517
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	m3ErvH+LRHBVeSaEJmM7a0MehL3sXo1OjnDaItcsk6uGOsBwEgiLPbI9ic4PbsnvHPXPe0filpDgb2hefhoD2vkGEEdii1c4tu+x1QMMgKutxN8V9ijs0Fl4gAeXcnL8KWcUEIwbofycRXo16mmTGJVSXSCTM7chSzmOvFgtAcP8cC2dQpJUU0BOcVIOZOikNeXztCYXdw0yYElCsnsIvO5wjQtZXDcndNpFBhO6GpPEZr8dl2T0WMGYCVOY+ZepGiLYQlgs/aa4uA3nwxWTXs6LQsIYldd9mQHWuD0unafbmPCcZqj6nw7riot4b5CWE0Wl86kXDafscCbZynZsDR5H8IYBbGO6t3TPSNt5TqHCZ64oBxnOrFsSE+o4a4R60ShBcMOrG9SIgJ1ECubM4ZnSlJhpeT3+zvwYyq6BmJUeW3+grhMzNLUDkkfotVIpF26snT+MfimKJCgFandx+MJCsHB3LEcMK+JvIfxMxdvMwQ0oW++/OZ6Fp0Vqf4Sw/TycAAB88tHUBDi6lyXZQe44eZhAVRXUgaf6TxsAGIOmFRfjFdY3GZrIgDBcwqg8H1+FS5Kpd4EvAmJynD12TEGd4fR8I/cQVcxD209h6QzdLRPaJ2EM+aV3q/Ecvy8P5ZN/oVHjDB2NitTlb+1vRN9y07c4433zCwkT3X8jHM8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39850400004)(396003)(366004)(376002)(136003)(346002)(186009)(451199024)(1800799009)(66899024)(2906002)(38100700002)(36756003)(31696002)(86362001)(41300700001)(6512007)(6486002)(53546011)(6506007)(54906003)(110136005)(316002)(66476007)(66556008)(66946007)(4326008)(8676002)(2616005)(8936002)(478600001)(966005)(6666004)(31686004)(5660300002)(83380400001)(26005)(10126625003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M004Y1Z1b01zUlEyTWRHdnFMS3lsUTNQekRBakxwdDExajNxK081eXRpUklZ?=
 =?utf-8?B?WmJES3dna1hpSzBTa1Y2dGY5U2VaR1lZNS93VHdQaDFHamFJeE50VC9sL3l0?=
 =?utf-8?B?ZGtiQ2EyTmhITkIxODV3ZUJJbkd6QW94dy80UXAwVHJXekt5WDh0bVNibk84?=
 =?utf-8?B?cEJJeFlxM250SmU5U2l4bmVuTGdEVUdRRGsvYXhqM1Q2Q0lpQzRlNEU1eHp4?=
 =?utf-8?B?OFVCbkROZzR1ZUQyNVViODJ2a292NkFzOSs0WHFVbTMrdDZyUk1zQjdQQ2Zj?=
 =?utf-8?B?ZTR0SE53dWRhR004RmwwbUZjMzRHdnB0M1R1SWpaeVBMU3ByQVRBV3RTa0J0?=
 =?utf-8?B?SnRWZndWV3RJUjZwSVZSR1BHTVBidXlVRUx2RkQycE1lSGxTelh6OHlra01y?=
 =?utf-8?B?SWw5WlpickFzbGFjdW9hZFkySlRpVkhBQTd5cDg1cmExSkNMR1RBQkgxRHha?=
 =?utf-8?B?WVJ5RG1NR0Z4eEljOXJJelVyUVdCMm9PRUtQUldGNWZMeWlMeDRFblZiSjYz?=
 =?utf-8?B?aGNkNWFsWFFLZEtCRXJTSGdYeGVoMGNWaUF0b1BhZXUwSUJGa2FzdU9rRklQ?=
 =?utf-8?B?clByeElId1huZ3lIT0JVbWpiUUoxdW0rRkVpS1VuTk1mNXNhUzFIR1Q1MlFt?=
 =?utf-8?B?Rk9wVDN6biszOTdBV2o0ZkI0QTY2MVRvbHQ2cHFGcGgxdkdFZUcyUk9JWWNR?=
 =?utf-8?B?bXhVbk4yNkl5VlRBazloZ0VlNlFqTTNDOGd4OHkvZUhsRWFpY0JwdXFJZi83?=
 =?utf-8?B?YnBNUHhYWWNPREZwOW9BTndTTG5BejZ5WGRtc3FWemQ5VXFjeEZCWCtUeCtJ?=
 =?utf-8?B?SWtFOWtQVTF3cWo3dUV1bUJoWExMbHJZMW9FUXY0SVZTTmhydElpUkI0UHlm?=
 =?utf-8?B?KzdRd0dzTzFBcmJqY1E1dmlreFdtd2pPVDRNRUZPY29KVTA5cXpFMkloVlZP?=
 =?utf-8?B?Y3lwQzBWdERjRWlyV3VNRURPOTE1aU90eDFORlgwaTNQVVZXZlhYKzdHcDhX?=
 =?utf-8?B?RHdxdWlnYTRqZWpjN0l1OExMcTVSK2tlbGxvU2JQYUVlcjF4bUM1RlVHUW5W?=
 =?utf-8?B?NmRrRjQwUXhvZGNTUDhhV25XWVN4UVZjU0ZCSDZqQTVrc3NNcEZXTlJpeG5U?=
 =?utf-8?B?dkxlN1hxRVJyT1ozN2xqRUJPdjZPeHl1ZE1BQ0YrSkxjdnFZem5mZTJac2tD?=
 =?utf-8?B?bGtqTzJhWTZhNVV1cWVQZlhpQXFVN0o4VnduTnpXLzlNNUd4c2VEOEx2bGUx?=
 =?utf-8?B?a1YzOW5KWHlDanphN0l0a2RwRWJOT2tkbjcraVdnd0R2dytFVVFKb2lPbzM1?=
 =?utf-8?B?MVo5YXM0VWIwdHVjbHk0TDVsYjRKZlpnNUdUOG5JZm10M2lPTnI5N1JPL1Jn?=
 =?utf-8?B?T3pMN3BvMlNKQ2JldWcwOFZmaHQxMEVuNkRDaTkzVzhhQXhDNTdCTUljdjVG?=
 =?utf-8?B?Mis5QmRsYWIvM1ZFOWRzWm5YUzI1MmZxTkNpWUhPNzUrYXpoSXFDckNZdzRB?=
 =?utf-8?B?WGpEYksyeGRDRkFrbFU2WUF1bjB3WDlaZUg1MCtIYU5hc0FFQUlZNHkrTXVI?=
 =?utf-8?B?d2xmTldZMXhZTEY2eUM1MlRycGZXRk8rQ3o0d1VCbG5LVkQ4aytvUGZGVXhY?=
 =?utf-8?B?RUEwQnFGOTk4ekxkQzVVK1lweVZnejBsbGZ3UDd1ZnNyK0o3Y1JIRCs4L1lG?=
 =?utf-8?B?dGZLYlpJSllQM1lxa0dPQ2pEV2h4WmJtQVEzcDJNU2NTZFdjQmI5UmUzNkIx?=
 =?utf-8?B?c0pmTzd2RHVIdGo1ZG9IWVZTYnF3VHZOZkdmTmxUcVc5ZmtoZklNUy9yQ1VW?=
 =?utf-8?B?bkI0elFUQ2liTVY3MGdxR1I0TG44Uk8wRGdNblFXNlJIaE9XRDVYVUp6cSt5?=
 =?utf-8?B?dDFHRkVqNnY0UXpaRkZ4R1pwN21WaGxsRFdkd1lWSnAwS0krQVE3bmZ0TTFv?=
 =?utf-8?B?cUtPUHhKSy9ndzg5RkNoK2UzWkt6N3N0MTZzWHY0eTlaRWZ4MzBybWJycldx?=
 =?utf-8?B?VUZVNUNnK3VmTmk0R2c2cU1lS3Q4eVpabTR4YkpvUlhxQmRKakFzZTdMTVF1?=
 =?utf-8?B?eWtoTmI5T280OHo4bFBnU2xvNVFLaXAvWDRJNWdkR1lMQkp2VldpSDMwSU5h?=
 =?utf-8?Q?dZKSS1zbPJetVBcsP+dzMngSp?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58bd49e1-75f2-4d92-b0a2-08dbade95517
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 08:23:07.1265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KdXtCsJoe0QcRsXun6wk1YEgmXKHpKfXyxSTYHFkvZqjqdtoPin4ntAvJtJB79rO5me9mDV2/NK5S1JQBU0qXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6935

On 05.09.2023 04:08, Henry Wang wrote:
>> On Sep 1, 2023, at 15:26, Jan Beulich <jbeulich@suse.com> wrote:
>> --- a/xen/include/public/arch-arm.h
>> +++ b/xen/include/public/arch-arm.h
>> @@ -152,8 +152,10 @@
>>
>> #define XEN_HYPERCALL_TAG   0XEA1
>>
>> -#define  int64_aligned_t  int64_t __attribute__((aligned(8)))
>> -#define uint64_aligned_t uint64_t __attribute__((aligned(8)))
>> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
>> +#define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
>> +#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
>> +#endif
> 
> Today I tested this patch by our CI (on top of today’s staging), and it looks
> like below error will happen for both arm32 and arm64 Yocto build:
> 
> The arm32 failure:
> https://pastebin.com/raw/S7ZqmG6z
> 
> The arm64 failure:
> https://pastebin.com/raw/HMFh5tuS

Thanks for pointing this out. Turns out that not even all libraries
get __XEN_TOOLS__ defined (see tools/Rules.mk). In the case of
toolcore, the public xen.h is included solely to get a definition
of domid_t. None of the handles are actually needed. I wonder if such
a dependency couldn't be avoided. Yet doing so would help only a little:
Other libraries (evtchn or gnttab for example) likely need more, yet
don't depend on libxc either.

For the time being I'll extend the #if to also check for __GNUC__, but
I'm not convinced this is a good way of dealing with the issue.

Jan

