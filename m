Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4AD6CD2BF
	for <lists+xen-devel@lfdr.de>; Wed, 29 Mar 2023 09:15:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.516075.799611 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQ1g-0002Z3-9v; Wed, 29 Mar 2023 07:15:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 516075.799611; Wed, 29 Mar 2023 07:15:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1phQ1g-0002XM-78; Wed, 29 Mar 2023 07:15:20 +0000
Received: by outflank-mailman (input) for mailman id 516075;
 Wed, 29 Mar 2023 07:15:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Nc1T=7V=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1phQ1e-0002X9-O5
 for xen-devel@lists.xenproject.org; Wed, 29 Mar 2023 07:15:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20614.outbound.protection.outlook.com
 [2a01:111:f400:7d00::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 74759c2b-ce01-11ed-85db-49a42c6b2330;
 Wed, 29 Mar 2023 09:15:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8767.eurprd04.prod.outlook.com (2603:10a6:102:20e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.35; Wed, 29 Mar
 2023 07:15:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 07:15:14 +0000
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
X-Inumbo-ID: 74759c2b-ce01-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KlgUdrLaPOw+5Quw3MUy7UwIUwxq3D6vbvVQKZp1EkO8SCxIsCaKDJKpdwwULIpKSqK9qwQ0gTRh+pHA9qhpLGUywxHSiyEDfbRjsq8N5RXOGYkgc3BR2SZP3BQq1zrRmQ8ALaV8JHVUGqZBG2k81HLOE72EovddhnR+v2aZd6n5ySPgTYZux10bpHVqBVcue0+WfLmzQdWrWn5eXdqetMcvaKDJs35CQhcvf4mOL3ZOBhQ0tcuPN+MBjcDtBjYrC14k+fJDZ43YEM+HjRSwG03nShUKtkBg0bq2eJCSunlJEb38PBdYQxtYh4N8Swt+Tp9G0Mki5x3m9gWYCYRI3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLUm2dX2Z5EJl8PrVBg6l86Q535A0KvN1z5s0boiVVw=;
 b=KvxvUxOpv3QVS20zzyJuOomg4rsJbjPAAb6i3e/qecI+RsegkyGuAjNSvxlmjHruqI0hgwQ72crqLs4rsb/uwmdMyD+nUys60NzvHhfv6tmd7AzVaQFfbCbjaTCYZZij9kiGNuyRyzij6ovULJNEMBmv4h4jWfM6/eCkjoEdX6rr0Y0Qvz4O+22qv+9x67hicgqaKA5AhV4C/loQeeE57LbzJsThrcyVcXKKpdNCRA5kQrGO0OzJ0CR07DzkyHjpNUw4sqGhWimyD5Nf3wjK+VHohx9zj1oOGS8duGXVGx0wilrRNT9aZ7fac1dvskR5RIFv2mKzCfcUTKsH6/lUFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RLUm2dX2Z5EJl8PrVBg6l86Q535A0KvN1z5s0boiVVw=;
 b=UgkS7CASwNmmZfh9iG6GmL3tmWZuI0o1PO6cJnrW9Ox69YLfOYAYFQgseF6hoO5mnKekwSWy/a/wx0HQf5GaY3HmGRrOE3R7t58t8H0oj8ZLE43TMVmu+xAEwbfCWqSwSOKstBCG8riyo1oBOazOpx3/HBEkEIwU0yKNAnJrUPawGJ8BcXuXbDmzqGxmuz85qOSofqSzgQtP5WO+8mYyQq/6tmjtE4MpC3MhB9Gh2xovj2aMISVOuJPrOQM6bJ4+1m+gsUYw89zPa6lXPd7Krplz58bsF3TLCA4JL9IaetvktlExB13s3FmWXZAeR0glpPNy45pJftX9T6h3QfdW0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <736f512f-858a-214b-bdd5-aadc183d2cb8@suse.com>
Date: Wed, 29 Mar 2023 09:15:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v8 5/5] xen/x86: switch x86 to use generic implemetation
 of bug.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1678900513.git.oleksii.kurochko@gmail.com>
 <5e252e8dacea5c4f2fdbb4f7970e34a862987639.1678900513.git.oleksii.kurochko@gmail.com>
 <9af94e49-ff66-5e7f-bf5f-ba4095cfed13@suse.com>
 <883d29a6bc888b4f78d5f20af4c2cf4b1b64e7c7.camel@gmail.com>
 <20063ebfc717b8281aaad4314213f26545f28273.camel@gmail.com>
 <4d0565dbc1711c2ebd122af2f6da69006be02ee5.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4d0565dbc1711c2ebd122af2f6da69006be02ee5.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB6PR07CA0175.eurprd07.prod.outlook.com
 (2603:10a6:6:43::29) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8767:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f0b7e65-86b3-48fa-3fdf-08db3025577c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hgGGKttXVmEDVtUQWhpbZTJRc0W7uqoNuk9QKSxKCAllgJUszeubOERqT+rf+HBjUQ2sGq18/FZsnv9o9aXL61wodcVSluH+NoIkpY8JpyI4+WlxQoPto+gBwt4iK2uH+lgOaXshhbWGd84Yy/kpYDbcH9+aqmIzjcI5xzjNo9FmgV3P2DdsdluaZWvMY5r9ejUQ7sNkhM6KhjyTos1PvQJDAVBVw5ztUtTXFCeG3YKowgaAi8WonCniA1xti4IdoibaxuVcAIqKvWBb4A0HWSVrRdRXhrgnQCf6NeZ2KQzIIWstu8mZg8i7gTl5GX+UZHEpwr6BeUdZo9imlMInxXnwo32BYiSaAul2akd6EKt2UPnGkffUqVm+Zo4i0D04a/anufy2b3+QAH7lAfZNzgVurO+L8tep7D+4VxM/L+QARfoEWs5MYq8+KROjBi2ENL+uRq8Lmlv28imOwfQDRxEdBBzDpX+C1zbCrm5r6YkYUbX3cniHkbon9QGKX/fBbdpNbkq2pJ93mcW8EyfF8/Ig/Sq33MMdEXlgvqU/2dVlFTZCYPVXf5/sHyTZ9x14elttLcxq74q25R/61nhU/bonV+JetSRTh4RtGcf8AgncU6lzXu3v7Hlw58MeRx6m3TdlMe0U+X7oI7CLRdi6/TrF3h5z8FoXHskcAOYZntY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(366004)(39860400002)(346002)(136003)(451199021)(6666004)(53546011)(26005)(6486002)(38100700002)(2616005)(186003)(2906002)(5660300002)(8936002)(6506007)(36756003)(6512007)(54906003)(478600001)(316002)(86362001)(41300700001)(31696002)(6916009)(4326008)(66946007)(8676002)(66556008)(66476007)(83380400001)(31686004)(66899021)(41533002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OVM0Z3FlR3VLY2pMSndzeGF0Rm91M0ZiSDBiUEIvRk9HOXJUK1FMNmdGamY4?=
 =?utf-8?B?b0o2TmdHYzRWV3FXb0sxU2pxc0lGZDNkVFZmTVl1QnhydkUyV0d4dmUwc0hi?=
 =?utf-8?B?S3lhYnFNUEc3K2dkd3JUTkx5cFJsWlV3RUlSN0s5TGhOdHlHd2hlTG83Q0ZZ?=
 =?utf-8?B?TGVEOUJxbTU5ay9YcGRNRVN3QXZvdkw2RjRQV2dlN250L0tJeityTkFuaElh?=
 =?utf-8?B?MG1aZjhFdWhXTktITmlocjJxNzg2b21kMHJQa3NSUGd5SktSNzNJWG1GMVBQ?=
 =?utf-8?B?dUNiQ0dLdzRmY2ViNHN5NjJHaTc2ajVwZ3VQaitLK21sZUQ5ZG1zeExnY0VP?=
 =?utf-8?B?MFdWd0g0c215VGFEUStUK0tDTUJTOVBWL0dhZ0tiTUZ6b0tkZzlOTmgwZzc1?=
 =?utf-8?B?MWRPV0x1Vk96S2xpRTgxbnBxTW16K3ptVmxUaHNYVE5reE8zQUFBbzVEMFYy?=
 =?utf-8?B?S1NtT1poZVFGYU1zS0h5OXBtQmdVWDdJTmt0UTBiSUgvVTkrc2YxK2loeFlo?=
 =?utf-8?B?dzM5aVhod0pxUW1rby9rMU81R3ZYOFpTY0laekVrankrbnZyNE9kRzhrTzNL?=
 =?utf-8?B?T21XaHc3WDFQcDk3bUtkMHE4SHA2Qm1Dd2xWZUhOdkk2NGVCeGRYc2hBK1pS?=
 =?utf-8?B?TlRqU2MzU2hJVzVtbWxiam1mL0lsakR1YUdTMW9rTmpEaDVPYTVEUG5WMWFr?=
 =?utf-8?B?Y0hjVCtRbFFiYUZzbjJCeDM0b3I1QnFTOEZVY2dHaGJnNDRqNUZDK25sdzdR?=
 =?utf-8?B?L09zcjJWYjJ2K0E4VGNhc2FSVkplaEtvZkZIZHhOS1NTQUxwR3dBcEN6eVU1?=
 =?utf-8?B?d3FMd2FOUnBzYkhiRlV4OTlGaFNLNmxhMWh3TVdUNm52K3p1TGRSOVJvaGNX?=
 =?utf-8?B?Z1cxY3hzMzhqOW5tVlUzcUhZTkwzV2h2U0t4aFhvb2VaRjFWeDdienFJenFY?=
 =?utf-8?B?VmliRG43SlI0WFNwR0pBNitTcUhaeGIwL3VscmpxY2wxQ0ZqNVErUFBvWm5I?=
 =?utf-8?B?U1pvRHJtTWdFMTZRbUR4NVJ3RzVKeDViV3B1R1pUOWNtRnhkZkF6MVR1NmU2?=
 =?utf-8?B?RnFCRTBndElzYVN1Q0U4RlRuVVhuelUrK2VCa2ljNThSOE91SDNnNGFqbHlM?=
 =?utf-8?B?NFhsVFVJSU55S2NlYm1zK0ZybW9WQ25wczJrQld4T0lqVjJHa2NQYjhTSms5?=
 =?utf-8?B?L1NRam5MYXZEYWhoMy9QWHJoN3NBZDRQR2dpWU1jU0M2NWR3UGpNdUdma3JM?=
 =?utf-8?B?ZWlRODRib2xqTUwrLzMxWjM5clVjcTlSVzh0U1E5c3hMaGpqaFRZaCs5T0hD?=
 =?utf-8?B?WUxMTFRRNDVpSkh6ZllQQld2MktUYlArWElycHdUc3B3RkxHSzJCc210QU1m?=
 =?utf-8?B?NmxaNStXRkw5VmU2MXdrem5iUjB6ejFnamN5TDhhK1JXUjBRVWwweGlPSWk3?=
 =?utf-8?B?ckRVbG9aMFArR2RwcWVGbWpMcXJxWC91OHdkTTdJZHJGc1pyWXBSWTNjU3VV?=
 =?utf-8?B?TXNwSi92a1NGQWRzVkdMbEtrVEJ2NjRBMHpkQWJlZ01TVERTYXhyVU1LR1c2?=
 =?utf-8?B?bnV3UUpoYXdqaDM0NnRFMkR0SExSWno2MCtJdGQzb1ZvOGI2eEhrcDhobGtv?=
 =?utf-8?B?M08rUWh2clhmWnZlc1ozY3ZqZ0Y1dU03VWNIUUlpYkZwcVd5M2Q1RGg1QUhU?=
 =?utf-8?B?TTNtZ2toa2JiTkZoUzJ4VG42SUlTSDhXNnhUQWVKRUJlL1lDN2NUOVRhcytL?=
 =?utf-8?B?REJzd1JTeXN0SXowRVVrL2lWR2dLYmJDWFZNaVVKd2RJVVgrQVZjdldxTzNX?=
 =?utf-8?B?cWZsMHF1d2VtK0lxT3RUR0dkWlZRd0s4WUFFd0JGQjh4UXdXazVkY28zRmMx?=
 =?utf-8?B?UGVrOTYwU3pMY0VBTVhPMWg2b2Y4dVlMTlhZOUxGdDVwS1pmQ29GQkxrV05U?=
 =?utf-8?B?UU1BdUVSaWRpa3BQaFg0dTJpUmc0TGVyRGtrTVNDdFJSNnFnbzlhdi9vcXQw?=
 =?utf-8?B?VWdzV0dESE8rdnZiRE83TFRvWk82dmFad1FnckhLSVJNTk9EQXZCMHdxcXhl?=
 =?utf-8?B?dGpDMnJIc25LT3FiNHh1dERMWkV5OEFqT21OT1V0VHZjaUdzSGpXdFdBUHNM?=
 =?utf-8?Q?bOTNLz1b8fVgsN8cHUSxaA9J3?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f0b7e65-86b3-48fa-3fdf-08db3025577c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2023 07:15:14.4632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ToBLUemr0i+O6IqO6mcqDQu4QmSC9SNlMdeMo0ui3VZwmoM0WIo8Fer2cEti7+DbkfmTPHQVIvi2Y6vAOQ3CmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8767

On 28.03.2023 18:55, Oleksii wrote:
> On Tue, 2023-03-28 at 19:38 +0300, Oleksii wrote:
>> On Tue, 2023-03-28 at 18:38 +0300, Oleksii wrote:
>>> offsets.s arch/x86/x86_64/asm-offsets.c
>>> In file included from ./include/public/domctl.h:21,
>>>                  from ./include/public/sysctl.h:18,
>>>                  from ./arch/x86/include/asm/cpuid.h:14,
>>>                  from ./arch/x86/include/asm/cpufeature.h:10,
>>>                  from ./arch/x86/include/asm/system.h:7,
>>>                  from ./arch/x86/include/asm/atomic.h:5,
>>>                  from ./include/xen/gdbstub.h:24,
>>>                  from ./arch/x86/include/asm/debugger.h:10,
>>>                  from ./include/xen/debugger.h:24,
>>>                  from ./arch/x86/include/asm/bug.h:6,
>>>                  from ./include/xen/bug.h:15,
>>>                  from ./arch/x86/include/asm/alternative.h:7,
>>>                  from ./arch/x86/include/asm/bitops.h:8,
>>>                  from ./include/xen/bitops.h:106,
>>>                  from ./arch/x86/include/asm/smp.h:8,
>>>                  from ./include/xen/smp.h:4,
>>>                  from ./include/xen/perfc.h:7,
>>>                  from arch/x86/x86_64/asm-offsets.c:9:
>> And again the problem is that x86's <asm/bug.h> includes
>> <xen/debugger.h> which somewhere inside uses BUG() which will be
>> defined after we will back for x86's <asm/bug.h> to <xen/bug.h> where
>> BUG() is defined.
>>
>> So it looks like we can't include to <asm/bug.h> something that will
>> use functionality defined in <xen/bug.h>...
>>
>> Thereby I don't see better option that include <xen/debugger.h> in
>> <common/bug.c> instead of <asm/bug.h>

Well, to deal with this specific issue we could re-arrange xen/perfc.h
a little (to skip part of it when COMPILE_OFFSETS is defined), but it
seems quite likely that then the same issue would surface yet again
elsewhere. So yes, for the time being I guess we need to go with what
you have. Until we can sort the xen/lib.h vs xen/bug.h aspect.

> Or as an option we can include <xen/bug.h> in <asm/bug.h> instead of
> include <asm/bug.h> in <xen/bug.h> it will allow us to resolve an
> issue...
> 
> Do you think this option will be better?

No, imo that arrangement should remain as is.

Jan

