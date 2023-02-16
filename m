Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5480699807
	for <lists+xen-devel@lfdr.de>; Thu, 16 Feb 2023 15:56:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.496601.767433 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfg4-0001Cg-9G; Thu, 16 Feb 2023 14:56:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 496601.767433; Thu, 16 Feb 2023 14:56:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pSfg4-00019Z-5f; Thu, 16 Feb 2023 14:56:04 +0000
Received: by outflank-mailman (input) for mailman id 496601;
 Thu, 16 Feb 2023 14:56:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/MZc=6M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pSfg2-00019T-Jr
 for xen-devel@lists.xenproject.org; Thu, 16 Feb 2023 14:56:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2062e.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 06c76fb5-ae0a-11ed-93b5-47a8fe42b414;
 Thu, 16 Feb 2023 15:56:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 14:55:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.013; Thu, 16 Feb 2023
 14:55:59 +0000
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
X-Inumbo-ID: 06c76fb5-ae0a-11ed-93b5-47a8fe42b414
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MwDq2hjqYDyk1MiFppVbfNi29k1dan5AHlpT7Xrk/cyJ4s0I2VIMAs0Y1JUJoxmPHi7/ygcalgGKYw2BAXurbi/kRD+s8Z3mRoFTdq1qA6tMHWQwVUr7EeJUIBxlozvEXX6U4WtLP0VldpWaQlR/EVa0Bhz4sQWu0Y7xmWodm2Tyvdq84wz252EgK6Htjyhx4xG6Ku4n+cWsvBtu9NJOYX8q0V0BmeICfuISUD+FF6hwSX84NgTVRWNOjPsyqxWJtHvaVcQOFin/83m2KCF4CtnnVF/KT8ESXTxItwVx8xYMz1xoSIKMilX10FBWkVpmVmsgCYxVRpIaW/MvMJNYlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k+idfS9v1qLA8l3q1lWtl+G91cvYeHNlTIRrzXeMpvs=;
 b=X9S+eKdSFJhdnO434SrHGaIgvXJYH6LVAlkwMFGOaThgzdvMBAnaHX8SV8VaKfED2+ymDtQU3fJFfXHL95vczQRKMN+19qXQ5LiEXeaayf7QGlCFD8TvDQTO1gB/dGbty8NWO6T2jKL7mRRniBAng58eZgwa/SMGbYvXPTIpbHdu7nxhiiRcz1wp7KIz3lpy9f9CCgfXDF0e05LkNkcTqCgaKPHip11C0f4Bo4ggXfGFlx/SQOgxLMbX68XXRBv7NZFMTQuhv0de64IgvcLVx1uEQtlS0joBoEVcP2kdIti6YTNe+zlv1bmP7DpHvw87VNBb7zI4GjPrKO4YYDHOqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k+idfS9v1qLA8l3q1lWtl+G91cvYeHNlTIRrzXeMpvs=;
 b=UI12e1JoRwbYexwfwlTT5aAgyBNtWEDkmt7DLmKQQCxb1SduyfJ+VDiTMonz8P1h6tzWdnidBbO6WepJD8LemOqJM4kLTPH+GTbHm8TFMgbby6aWdsT89ABiGG5g/SoghIL+mv4tPMA/RG6ANzvfbQZcCSgwXOSNCwQUntRZVCVBNY8SzVKoMjSccLRqn/DCTAqs6UKY3PVUweKANPJ5aco2QV8DWajFOIHGEY2ud3pohT4ITVQNlvuaBA9SNTxEHeKp8JDTgYRrPXt7QaUufbZ4h1QTBLPWAsBPuCZQJCGarJzslB5pRmELWrDNCubm5zklY1AKfWDoSbeHR4KFnA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ae76d2d6-486a-8717-d02b-5431709a0922@suse.com>
Date: Thu, 16 Feb 2023 15:55:57 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <81fd6cf5ff59acf6ca8b66e093630e5accc45198.camel@gmail.com>
 <9cf03b23-586b-92e1-c0b1-578f3eadd2ad@suse.com>
 <00abbda808239ab74cb6c954b33e34380ac4e41e.camel@gmail.com>
 <5f6d7b8e-907b-d3eb-335c-8d4a77edf526@suse.com>
 <413b6d1439a31e24719321494971cc165bd6942c.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <413b6d1439a31e24719321494971cc165bd6942c.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0015.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::25)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8609:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ce41bb2-6f8a-482d-c686-08db102dea03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	j2AP67Sk/2RYZiMopBU0eGEv+3hDPS8qlFbPbHOGj/3IDw/FJSlGrw6UAtg8JsGFdiGhyFBpusILO+9I1jQ8oYfB0ItR9kk4d+BkrXhbILjQGKGC4Fg/BbEOkUYFLEVXapxMODsgoFHt5efO+qVl02gP1j0jg3hDsZXDrafu/rX1uQyOMCcdp4K/LlG1UwUwLPWkf2T9c2xYwzvwMzCv+EHIKWx/Q6tcqlRt1ay1hhVJWVehPwxWgOZm4bCXe0BsgRudjV8BiFpT25omHNanaZbYlu7tIVU++dZl1PIopkIqT/pMeOFk9pdHHLLOJZUuWdmJExKH/5YqhnawOGrkvkldrFXtancn2MfH9ET0AmXTsJsnu3ZL1TDJPe7mNhXCyZPzHo214WAPB0dCGW8F1VZdEoZrb3wTS5GSueWotj9Jj3kJsXuwKf8hHxGocgPFfzDsijVmGi6RHVNeJ5p7pT7ecdnLO7wLvuO04EnvESfVkOScD8aAgZRZyZBv0DypFnNDQUdGCyM9zjy6Ak9LvuSBTc+7mSu7LWvnOrt5LkiWU05pZqCwmxFIPUyrsQ/4BeIA57Sc8b38tSzr7DvVyonfbOojr808xj5g8xN/kPuWy3HiGYiQ/5oc0A/NHcnG+PRyVScMTPq8TTaDnUVcziuN+ydZbGwtjg+EFBTj81h9RWZZBZn38COlvuiGM6VOcv/iUH3WIOXAy+/M/3DaVTzznQ9I9tTQ9xsqG9y6s7z3knsbeFMPsuGb3o/2cx9i
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199018)(66946007)(316002)(53546011)(66556008)(41300700001)(26005)(186003)(6506007)(6512007)(66476007)(54906003)(8936002)(5660300002)(6916009)(4326008)(8676002)(31686004)(6486002)(478600001)(36756003)(2616005)(31696002)(2906002)(86362001)(38100700002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0QxV1hFSVZkRkRWdGdqa3JqbjNJWHRLOE9sZ0hQZzNvenVUNjhLT0tGdW9J?=
 =?utf-8?B?a2RWcnFvT3VSTC9WV0RLR1JqbjJYeVVqd2RLbnZwTmJTYkt3MjlBZzY5MEpG?=
 =?utf-8?B?N0kxL1NVaTQ1M0g4L25hSUllK3BBeHFCRnhCRmFnVVJkZHFDdW9talJWS1Nn?=
 =?utf-8?B?ZFk3QnZHZWpqV2s3Zk5WZ3lJUlRKLzY5dmZFaklaRGM1QVgrZ29aUTQrV2dn?=
 =?utf-8?B?ckMzUmEzTjVBRG5FYkhhbHJkQ1NYV0xhbDF2SU01cUMrSmIrd1VMVTFLWVlZ?=
 =?utf-8?B?L0VlTHVBKzhQRU5pY3dYZ2NSUnpCV3lDNUVKaTRTN1YyOER6cDZIRlNQN0tx?=
 =?utf-8?B?bUNDVTd0bDdFaWxOVnUvNm9OMVljbzJicGNEQXAyNS82Mjc2eUgrZ2tobFhn?=
 =?utf-8?B?REY2ZjJFbkFPOUNHdXlOL0Y2c3lqUHBkdlJodzFISmVpS1A4bTUvbldtRGR4?=
 =?utf-8?B?R2RVT3I3czQ3VjRiLzVRVVBrTk8zVndOZTdueXQ1alBaR3E4aUtJdVMwdGNL?=
 =?utf-8?B?MmRBUWY1M1NseStGaTBmVktFamVuMnNtYmtEd1Uzd1NVQVN0dk9LQjRSL2JI?=
 =?utf-8?B?U3pubmZmV2VKZjJseElWSUxaSzRNN0xDN2pkN3RmeVhpeHNLNFZtcG4vVDZD?=
 =?utf-8?B?MXYzZmJINkpzaEd3OG9sYjF1VWp3dnJoTXBhVUs1RFJEcWhWZkZPd3RzcTc2?=
 =?utf-8?B?bEpkb1AwdFVHODN6ZExqMkJwbTBNWTFPT0U0a00zM0NPTE8rWnQrL1VFWGQ3?=
 =?utf-8?B?SkVxaVB1Q2FlNXViaE4rK01uY29FbE42UnlkaStIdWs1dE1hMFhUWjJsSWNk?=
 =?utf-8?B?Ym9za25sMXJreExTUTE5VWZnbUVZcDNIR2k2UGxwUWU3a01SNjE2MjBGektq?=
 =?utf-8?B?UktTWGdPSlBBbW90Yms5NVVjREZacGJ3UCt0RHpKeDBLSnlzejVqVmpnVVZk?=
 =?utf-8?B?emJzMnRnZTFUN3pmTVdmRXBLQkRzVzZBbU5WSlB0MjQ5UVZRdXZSSjR3bzg0?=
 =?utf-8?B?QTJFZGpYV0ZHY2hqNUtFR3Iva2xpa0RZeVNPdFpRYlhQUjhFeEIva0g2ZnVS?=
 =?utf-8?B?aGltVTlSdCtnVWZnc3RYcTIremlGK1BvQWhZUVVVSk13VTB5SjlQLzlXc3c5?=
 =?utf-8?B?bm1rSHB6bkhuQnJySEZYTUtOQVF0bDF5UlJBbXVELy9YK2xleURWT0duaWtp?=
 =?utf-8?B?U1FZZGYrVmNmSmZ0T1o2OFd4aXl6Vm9IY2FTdUFmT1cycGtaR0ppVlA4RWNZ?=
 =?utf-8?B?UStoMXJLVjBJa1Q0YkFORTh0cnlmTytKWEdLZ21CWWZDQ1VGUFBobWM5NFQ1?=
 =?utf-8?B?N25tV0ZRR0VwbHFSWTJuRlQvWVNEUU1pYVZodWtYQ1I3WW5BejhJV2E4SHFu?=
 =?utf-8?B?NGlpaTltQlA2bU94YkxkR3FNVHczOGlnTWxjWnZxdExQczNRRlpTcVNKQmlN?=
 =?utf-8?B?c0ZSNy9waTdURUZ0bnZGR0FlLy93a1ZFaTJVNkhCNkcwc0RpM3hqTit4NVZ5?=
 =?utf-8?B?ejBBQXhNUjl4RUkxUWpWM1luenJwL005V1IvTzVtUXBOQmk1TlM2M3plT3gx?=
 =?utf-8?B?clhPVWNSSVhzY3BmUkhHOHFLZnpSTmFvTE1UWjRHdFptSXBoK0VPaFJ4c3kv?=
 =?utf-8?B?ZHdha0Q1dXZObDdZbFI1OU9NQng1SncyNzFiT2FkK0RZQVIrNnM2Y0J6c2ht?=
 =?utf-8?B?VXM1Z1liT0daNlFvU1MzOXNiZ2tPZWFxQ1doczU3aFo3WXVuY2hvMDZhTFl0?=
 =?utf-8?B?ekliVHZ4V0V4dlJzRkZWNnpXR1Q0NlRLY3hxSmhiRXBveTRRTVVCVUlJV2RU?=
 =?utf-8?B?UHpMUDBwb0ZoV2JxS0hoQXBDaEhkWUFhcElIUGg0UThSSlo0VFRWZ0czR0J0?=
 =?utf-8?B?cDZnakcxcG1DYURXMmZPVmxBVFVSV1F6SmhGM1oxNnNlejVKSkJyZ25ZckF3?=
 =?utf-8?B?WG51MWI5Szc1YXNaMmpMTmJLS3dJcUVWcXc1eEZGa3FFRVg5ZGxWbE9SM2Zq?=
 =?utf-8?B?Um9ML1BkeWJ0eDd4dnk2VVdSVUphREtPL0NHcExYaG1nZlZ0bjR1UDB1VlNn?=
 =?utf-8?B?RDVmSTBxNUhJa0VnZXJoRHdmNUQyeU1pSUNBVVV4azJmTWNRTTNkL2V4VWt2?=
 =?utf-8?Q?2aYK4q1vHRC2k2lUB7TIJEABO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ce41bb2-6f8a-482d-c686-08db102dea03
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:55:59.0933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YyvSCubF3q0ukTWx/YrU4Fb3Vkf/8IQWcUfRVhmf8P03Sr5j09GmysOgF3t03pvtPNAu2KDjcMn76Q+Q3A0cKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8609

On 16.02.2023 11:44, Oleksii wrote:
> On Thu, 2023-02-16 at 08:31 +0100, Jan Beulich wrote:
>> On 15.02.2023 18:59, Oleksii wrote:
>>> The only thing I am worried about is:
>>>
>>> #define _ASM_BUGFRAME_INFO(type, line, ptr, msg) \
>>>   [bf_type] "i" (type), ...
>>> because as I understand it can be an issue with 'i' modifier in
>>> case of
>>> PIE. I am not sure that Xen enables PIE somewhere but still...
>>> If it is not an issue then we can use x86 implementation as a
>>> generic
>>> one.
>>
>> "i" is not generally an issue with PIE, it only is when the value is
>> the
>> address of a symbol. Here "type" is a constant in all cases. (Or else
>> how would you express an immediate operand of an instruction in an
>> asm()?)
> Hmm. I don't know other ways to express an immediate operand except
> 'i'.
> 
> It looks like type, line, msg are always 'constants' 
> (
> they possibly can be passed without 'i' and used directly inside asm():
>    ...
>    ".pushsection .bug_frames." __stringify(type) ", \"a\",
> %progbits\n"\
>    ...
> ) but the issue will be with 'ptr' for which we have to use 'i'.
> 
> And I am not sure about all 'constants'. For example, I think that it
> can be an issue with 'line' = '((line & ((1 << BUG_LINE_LO_WIDTH) - 1))
> << BUG_DISP_WIDTH)' if we will use that directly inside asm(...).

Not matter how complex an expression, the compiler will evaluate it to
a plain number if it's a constant expression. The only think to worry
about with "i" is, as said, is the value supplied is the address of
some symbol (or an expression involving such).

Jan

