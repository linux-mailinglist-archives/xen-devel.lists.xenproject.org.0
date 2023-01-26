Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B276967CA93
	for <lists+xen-devel@lfdr.de>; Thu, 26 Jan 2023 13:08:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.485008.751920 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL13K-00017m-AR; Thu, 26 Jan 2023 12:08:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 485008.751920; Thu, 26 Jan 2023 12:08:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pL13K-00015c-7H; Thu, 26 Jan 2023 12:08:26 +0000
Received: by outflank-mailman (input) for mailman id 485008;
 Thu, 26 Jan 2023 12:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=71dA=5X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pL13I-00015U-Eu
 for xen-devel@lists.xenproject.org; Thu, 26 Jan 2023 12:08:24 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2071.outbound.protection.outlook.com [40.107.6.71])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 217339c5-9d72-11ed-a5d9-ddcf98b90cbd;
 Thu, 26 Jan 2023 13:08:23 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7253.eurprd04.prod.outlook.com (2603:10a6:10:1a2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Thu, 26 Jan
 2023 12:08:21 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6043.022; Thu, 26 Jan 2023
 12:08:21 +0000
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
X-Inumbo-ID: 217339c5-9d72-11ed-a5d9-ddcf98b90cbd
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EVgjPFRpbqZoSB1YAWpH57dwTeqQSLBBLndWcQ69wtLydByL+xPeDeOawS0ujUtM2pSgkNQvzVnb41hzbLDgjVQ4cSsMH5rpAj6LvggsPJ89z74aV0inX09GRMJ8nf9O/74D1KLwXgII1wAIqXNBrqvGCRANK79XlHlhtheXdCw91+nBAoRIR7zcVG5hN5bQsoDJFUpw3kKA5jzTUuwIIye6zG+pHrWBg/tjB112we1Xcs0rYbjXnZBEReRbyJA3c3YJdN4ouZ5MluQvUuP1jjYh/7LSfOL5hYiE/GRhD+6ox792wbHr+/xEKG6OSf4e/y05KHWwg2cBz7hRmCnpxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oicwn2j9Il7hRUshoGUBWA0bFha8kNNLdMZO6PpzwG4=;
 b=Mq+StqAB0mgs64uGPVDgiXM0vKvbBJGZNHP0ES0CK87+Bm4GNs8BU7Whf2l/wWZGpPHQL/uGZEiJSKI05gaZwomlGPT537AERsJwsaZ0rZvOpj1M3SDfP4+ef6xLpdrv78IfIzhlu/JUeRtmrGhpT1blxJN1lxnm1VjNwYOEgUGOpjU1dFEDTp/2J1I3qfYb6vKCd51I9pn3W08t7FiS1QBcdRKPhUcleY23+urOrk5QTuvfINKK7Wu8UpUjz2V9a0koaf/GnT8FqKNyTwOtV41/njDODPre3CnVHppG/1oASfc7U9LVRsJHYi433cp+vz0Ijul+KbqjQ0S9nTzXgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oicwn2j9Il7hRUshoGUBWA0bFha8kNNLdMZO6PpzwG4=;
 b=S5XFeunJLVcKZTPb1hIWui9udf+/JoTxNtki3fQSsEg6RJRZN0qzfsrIB8Y4czbJ/lhRpM5O05Q6XHnf+En0SqBc5xkbaFV8BjNEXieTpewb0LT8lEFQ320el7lr/YJp7xXgF5r0w1EJ3ST/wKk4XCQDD4qt5JBy+oT+bYRn9aUGsw3Zns7rfE0hLmGdxgAap+93hv5JOHc4dcIluHW5t2HSNxhAZ5Rbhp1oAvFn0ZN33IxyA0kE+Szk2+5GNttxDF//+7sbN+LvDlAbkbWgOY/n/1fDpSn3ZJnVdcMK/Wz2zZ/T8KNkTbkXqa5tvQzJHBeYL/UhIAByiZnaxuxnXw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0a27c49-e31f-8298-91ae-60ab4c47aa9a@suse.com>
Date: Thu, 26 Jan 2023 13:07:59 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 02/12] xen/arm: add cache coloring initialization for
 domains
Content-Language: en-US
To: Julien Grall <julien@xen.org>, Carlo Nonato <carlo.nonato@minervasys.tech>
Cc: andrew.cooper3@citrix.com, george.dunlap@citrix.com,
 stefano.stabellini@amd.com, wl@xen.org, marco.solieri@unimore.it,
 andrea.bastoni@minervasys.tech, lucmiccio@gmail.com,
 Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org
References: <20220826125111.152261-1-carlo.nonato@minervasys.tech>
 <20220826125111.152261-3-carlo.nonato@minervasys.tech>
 <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <308a7afa-a3c9-b500-06c1-3d4cbe8bbf65@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7253:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b6639e6-e0ee-40ec-48af-08daff95f905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x7/5FSpMBw5lZXYJcLvKALPKUtaCaNGoo3FWsVdUe9sYP+nnBVT1wmqwEkCoWFISsOL6r/exuzsB9auIlKdBaB/OwfyvJQpt81OjyOWr3jxsqtavNbUB5AHxvBJUXazvwhqaQUkGWBLs9Wbm9lhE78bSQROe6l01icwOZDEtdK2Pitc5Ki0n4sHVnca3C6zffdlUCKpPSQL179QvhKuK2kXuZZBh8XbjFqwWD7LdTHR46itJrRajD9jEJkwzh2foFJnEZ2fluFmDtCXDvwWqSE1wWvrmYKkxTEVV8kTVKMR5wYU/z6gq0xEAoJFVjIkYO5USE7M1li59HSZ/ALrEeXQ89NCKjhZb8DgNMLHtaVyymPKSXDfu8wrNa9qXhs08Q/Sv+QEzGDdBCH0CZJtiEB9jKRacXo0KaCnO0La9WqH+T/Co0rSdbMNqWzJOmFin7A6LOw26isJKacCkPU2CbWalvV7Q0I3AZ/sbFkJrvtpxYYwswOu1cN4sICVvbHfVVFlDB2schbZObrKQcSgzZ7S+xaFIGrQzu9iMDejSifhh2FNKz+Yt6sqIEmP4mGxSCKCMJf+bLs15ymP7xUuc2yyazBNvBJXyIRjgz7+s5OnomYihh4URZVbLO2B20t9P6yP0b/d5yQT9X6396rl/lDQU++p9MjkPopRv5XltKKpSrMnKnYL/r6ei5ihtOKs1qOl7h+RxHTJf4wUMVKKxWWi84tKv48T2fRQc/C5+kYs=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(366004)(376002)(136003)(39860400002)(346002)(451199018)(36756003)(66946007)(38100700002)(478600001)(186003)(6666004)(2616005)(26005)(6506007)(53546011)(5660300002)(83380400001)(4744005)(2906002)(6512007)(7416002)(8936002)(41300700001)(86362001)(31686004)(31696002)(6486002)(316002)(110136005)(66556008)(66476007)(4326008)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cDhrczNGOTN4QzhrUmN3OHFERjhMSjBzZ1NPaUUxdndTUGxsUUF2OXVnbmM4?=
 =?utf-8?B?MnY1Ti9VNVpzWkVib0FYUEl1dXdUVnRkclJYa1ZZMnpDOEdxbFowMjBjbitF?=
 =?utf-8?B?Qm9EUGpCU2dOSFYyRGdCbGplc1NkaEtMcFFkRkh5dWZFczdEQVp6WEtQOTAr?=
 =?utf-8?B?aHNWVFI1alpOWVg4TDBrczcrZmJnbnJKbStZSXo1U0gxOVI1UlBsTnlKdW5D?=
 =?utf-8?B?VGZsdnFDVUtvNGRPeU1ZS3AvWFNMY0tKL0JLUW5qUmRFY2ZXS1luTUo5djIv?=
 =?utf-8?B?K1NJUExpbGFFbzVWei80cVM2dlBxUTlQZFRNUVBJaVZsWUIvUlZrNWVJMnow?=
 =?utf-8?B?TjJVaStNbHpOWklkc2tKWHpGaEcwRnU2YmtMRnhxR2hKaXFaRE5NckdQQUFr?=
 =?utf-8?B?RDZRZkFWZ1FFUklTM3dnNGRJaFNrQ1NSeE9hSGJhN3M1NFBaVVdIVWRIK2FV?=
 =?utf-8?B?MytsRFYvRTZPWWlrUURWdlRjRTNCb1h2ejE0V081Tk5VLzR5WENQWERaeVZP?=
 =?utf-8?B?bmZjQ0pCYTRkVGxCbGsxNjRKa1NIMk93dkZGRE9va0tRa3RMMFFuTmo1Q3hM?=
 =?utf-8?B?cTI4RG5WcC9renhIbU5OZC9oNmV2eUZ1UldkQ3l1aDg5a09aNi9FNk5ZOTF3?=
 =?utf-8?B?NUVlaHFxQmN4TXdDM0V3RGhkeUw1RGRaU3hMMm92aXFoNll4QlhCU0JTSm5j?=
 =?utf-8?B?UlQ5UmdJRGMwQkdSTW52Q1RLSDAxODkvdDVITFcwaFZGVnJXbitueS9yRHRh?=
 =?utf-8?B?T0EydDdDRExGQndXVWVuZjcxZWt1SlJOd0FWT0x3RHczMHlNVXBycGFrOFVI?=
 =?utf-8?B?cy9RcEdMRU9PQnd1ZFNFMStkRnRxRi9MYXNBUTNVTVc5RW1yS0tQbm1yN1RP?=
 =?utf-8?B?KzBvSDBGSWVmN1owNXZrb2F4QjNLRDY5UG1jWUd0eVpTVG1qN0lTcnYwWWhT?=
 =?utf-8?B?b044TDJDSDRVbk9mcGNyb0JQYktmNnJSWEVaNjI4am4xdmhIZUZ4ZHB5TmNV?=
 =?utf-8?B?VjNYWjNmY29sUm9hUkVITkk5VHpuUzJhdGxIQWZIbzZTaUllS2ZpUWlVS2pB?=
 =?utf-8?B?aTNQMytFSzJ6d3hGUFp1SXhHRi9JUllFYjAwTzNNenptKzFrM1JCNmR0ZUtP?=
 =?utf-8?B?djRsSWhWelFUMXhoSitTL3A5K25uZ25YY25nalJ2WDB4aU8vTEdyT0d1OXRz?=
 =?utf-8?B?Z25xZUdsdkdnOEVnZUplK3FsS3EwK0xxUDltVFVSTDhZSUV0Z2dZbytKdWFl?=
 =?utf-8?B?NVJQd2Z3U2FJbGdIcWFHaS90VEh2SjNhb2JKRnUvVDNLUlNnTzlNd1krRU44?=
 =?utf-8?B?NklsbnV6TW5acllsazRYWFpiVk5NaU9ralhxM1BsWkh2REczdjZmcERUR1Jz?=
 =?utf-8?B?S1hDcnkrK0Q4QlpWelBFT2o5SWJIZGpKaDkzVTBUa2IxaEZKazZ6aUxrWnR6?=
 =?utf-8?B?TThYTWNkMllYZkRRVlR0Z2pTWVdkdFp4enlnMXE0OWh6aTR6Qm1VcXR2ZHEr?=
 =?utf-8?B?b3RTZWxoQ1g2QW9heTVSNmxFMGxRc0trdnkyQzRLbXo4c2h0TTU4RE11NUFT?=
 =?utf-8?B?bnpxc0NLRUJPa01QbTdZTi80R0RHcFdQWGNETlJqa2xPY1Rycy9nL29HQzhG?=
 =?utf-8?B?YkRBeEI0a05yQjA2UlhaQUNXeHlvTG1JbDdobS8xRmRISktlaWNmUnlMT0Z0?=
 =?utf-8?B?OFdRbHYrQWU5U2R4WjJjRlZPbGhZOFFCU3JYekNNNmp1SGc4R1I3Sm1iZEwy?=
 =?utf-8?B?VW5wL2dqQWc3QlZXSkt5U0NuWjRqaG02OUR3bUVVclhmRW9nbWRjam1vblpB?=
 =?utf-8?B?NTNSZTVKdGdzNEIvT0l0UFF5ZVpFZ3VSTVJhenl6ZFNCbkkvRnB2dEFMb3B3?=
 =?utf-8?B?NXRNczVnaWV6QmoreUlLODJCeGJpK09VY0tTaGNSL2ttOGdBNHVmS1FVYVNv?=
 =?utf-8?B?aDBkTmJDb1ppQ3RIaTJpcG1DbXRwZUhhYXo2ajhLVEx0Y1FkLzlzOUg4MzlM?=
 =?utf-8?B?OWVRSnZXTlJGUitPZ0twczRhMjIzTXBEaXp5S1hzWVZZNzhSdVZvUm96THhX?=
 =?utf-8?B?eW5mNnVlMXRhdnJJZTFjbWo5aThVOXE0MXF0V3c1Z09MVnJEc1VJVXJsdjNq?=
 =?utf-8?Q?GbAXKBauJGuUcD3ng9piJ/Wpk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b6639e6-e0ee-40ec-48af-08daff95f905
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 12:08:02.0835
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 396ApYTUTX3OuOmfaMkpYPVepq7PRlQxbH8jeP+/vMEa4DPvjYTL8I5PMijFqHNQSzbBVMa5vVo1esoVHpb0GQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7253

On 21.10.2022 20:02, Julien Grall wrote:
> On 26/08/2022 13:51, Carlo Nonato wrote:
>> @@ -335,6 +337,12 @@ struct xen_arch_domainconfig {
>>        *
>>        */
>>       uint32_t clock_frequency;
>> +    /* IN */
>> +    uint8_t from_guest;
> 
> There is an implicit padding here and ...
>> +    /* IN */
>> +    uint16_t num_colors;
> 
> ... here. For the ABI, we are trying to have all the padding explicit. 
> So the layout of the structure is clear.
> 
> Also, DOMCTL is an unstable ABI, so I think it would not be necessary to 
> check the padding are zeroed. If it were a stable ABI, then we would 
> need to check so they can be re-used in the future.

Independently of the other reply, a comment here as well: While domctl
being unstable does permit to omit zero checks, I think we're well
advised to still have them. The we can re-use such fields without
needing to bump the interface version.

Jan

