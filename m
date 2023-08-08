Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5CE773943
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 11:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579494.907485 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIoX-0007s1-TF; Tue, 08 Aug 2023 09:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579494.907485; Tue, 08 Aug 2023 09:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTIoX-0007pK-Q1; Tue, 08 Aug 2023 09:15:41 +0000
Received: by outflank-mailman (input) for mailman id 579494;
 Tue, 08 Aug 2023 09:15:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GY6=DZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qTIoW-0007pE-4a
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 09:15:40 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on062f.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::62f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2412213b-35cc-11ee-b280-6b7b168915f2;
 Tue, 08 Aug 2023 11:15:39 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM9PR04MB7569.eurprd04.prod.outlook.com (2603:10a6:20b:2d8::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6652.26; Tue, 8 Aug
 2023 09:15:37 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6652.025; Tue, 8 Aug 2023
 09:15:36 +0000
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
X-Inumbo-ID: 2412213b-35cc-11ee-b280-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XFgj2Q5teOd/SEjVqTa3gxAE1iyQFUmIZi3D34sFbyiNgt09etjECYsidW2VG6iLqkWa1mM+Rd6bUeQLG9XEiEfNzztJ17x/8QrzOWV3K1DbjmFSnasXiUCAGUmlkP6xH087XsBgwlGKyr8wS/S1aIiyk0GOUB9o5xFEWKvlybZ/oW8hBfM8LFXP+GJSdDJeY6F7czw0JXXjuoDETB959kiMSN2iCFiR0N7gI3HrEUz/7plN5WfN/skaf1otvHO7LmowSWPpclQAbSaGeasvhVhAVoqdAOuG6YcSU1fcU/dFNyiMqMtzBlj4SubkIXSvuwz8k993G9YXRPetENCibw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VAsLA7s8Di76h+92NZz50JjD7JBHvWH9yNdvc7cCjz8=;
 b=dccA5Ypc4Ada+xCrFPSYF8h3VOwz7x5gcSL8y/9LGFR71b3Hz1OPPTXzzO0IXLsMazf282WE4NIa6RVlMio8q+uxkm17DrRC823IAnBvtqtlRY4AL2rs3kGLHUIuZCj1ck/PKPiYqmaWXViybMk/41P5Jm2OasLnuLn8GySJnscBWrBlwnkmWUIb4F9LK+HbL+RK84jui1ZJtgnyLylyPA3qcxY9tILi1PuBP7kvbP/EB5h+2fQXgCS6evzkMVYrMckOM1etN7WANlUgwfI9YyC0HkxHD1Fuafu7iB1DMvp/hdl1GxjJvS7K/CDhBnZBAvM0rQvPZyR4V9WuSznlrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VAsLA7s8Di76h+92NZz50JjD7JBHvWH9yNdvc7cCjz8=;
 b=jfhkr39V3FcA6qffqBUivCoGCMSdtEl2qSbxzNon5cfsb5r8wXMDHa6FOLjyiPwCLPDzXFdJIRM5qUtawg/wbZKBFn6zWKYmzO0bMvhodWXzmnAj/Kr5+F5tJr4togktqd2X518IVpWmyIk9AL+j2V4aFPJRNO57H9tKJkoWxsQhOtJ/tM9tyTkcVQ4EyPJYizKvJ32U9IRA7Y7nEUlsDrh2l2eABLy99cfbEJItQIgKRNkt4G9xBnEFfaPUwFi3Y3m0X22yAKag9Yb1F/BJrSFTNN8drN9psZTJkXrZC5/SWqc878t3ZI5VdMnYhOfFuT2f9PAnIlxFxdaaghcGWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d55623d5-6764-9aaa-3431-8a8a1226e008@suse.com>
Date: Tue, 8 Aug 2023 11:15:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v7 5/6] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1691063432.git.oleksii.kurochko@gmail.com>
 <9fdda7716faf412f1e2cdf9a990c98e64c4b21f3.1691063432.git.oleksii.kurochko@gmail.com>
 <8098e465-d25c-7fe4-dd97-2f44a689c9a6@suse.com>
 <b31d2838bb331c216348ae478e7841d7bce48a88.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <b31d2838bb331c216348ae478e7841d7bce48a88.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0097.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::10) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM9PR04MB7569:EE_
X-MS-Office365-Filtering-Correlation-Id: e7503ee0-32ee-4238-a2aa-08db97f006d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	BWSjaSw5GlUvvwgNe6wrvxbhd3R8oQ1DxtWMQz+umbdzGHgDGdZF3rM7mMkxizY7ICCa8XTMbLcnoIPSXhNhC4Bwn0m8BPSYkK9ckMSJ5srQbjY8QQPuzvGqh5Ktl+zcXgCfmZz2L3f8VmDKZq+eXpMyjRO4vH+oEBA1ymvtqjyldAiqBZ0WjVZFKQ69+IIbeSYq2DLzlIHLUP8xIRj0Y2cYNwoVFBHRVD/xrdWUSpt5V98HG6s6KNBORa0nFWh/TxG7bVO/GLqyhOZNiTjLuG8CjO0orJpgSV/JRh/RkMsMaTTVV8aeVrEXGDapeg3Rr5ve1WlU6XtjAQVLN8QtC3R9Zlm5e2T7NnT7ktFHrhtpvqYsGjUzJXpBPb7GERJSbawPb5VBfDDHLm0OhYwpQD5Spt+4idW/bveTcpUyRzxFoYDAWa9qbhxYFxL7dc1GH5VrnRSsVr7IVkl7PZU1Srh/uONk2CcW9Q1pq7AB7g4pPZyXOpRTg1QBKvCvfC9Oa99hPyCKypGjmqMx8FaFt9UicFXoje/2LNB0kQDiUyft2dbGmxmQ7wh8TXaU4cLr+8Oq8wNojbOwFLOSHg34ubPkoqkp97vUFbGAhycNVNvpGReZQ84rbCu8125uzb2wFrikb0VfJb83XbTUXx5cxQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(376002)(396003)(136003)(346002)(186006)(1800799003)(451199021)(2616005)(478600001)(31686004)(6486002)(6512007)(53546011)(26005)(6506007)(66476007)(66946007)(41300700001)(66556008)(8936002)(316002)(8676002)(31696002)(2906002)(4326008)(6916009)(54906003)(36756003)(38100700002)(5660300002)(86362001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3JGVkI0bW5UeElxeFhETm1jeGQzWEI3by9XVFBGSTlaU1QrVVpxTDlKRWd0?=
 =?utf-8?B?dXNvdXFidVlndVIyakgyMW1WMGhvelJkYlgvK3lnQm5Nb29rTlF2bjBTem53?=
 =?utf-8?B?OFkwZytjTGVJcHdMUStnalZsVmhvekxBOThhU2xFQms1TTNmenplMDRhZ3Ri?=
 =?utf-8?B?WXBTUFBuZlg5ZVFFeWJBUTZTN0kycGVEeEthbVFsUjMvZFJyY0J0em5Ta0Rs?=
 =?utf-8?B?SzRzNys2MEhaRStIL08vMHU5YkNGUGVGSDZncGJTOFVLL0ZUeHljWWNRK3ds?=
 =?utf-8?B?dWY4R1dYWXZUSEEzQytzL0pEcHpPYlZBUC96RlFhS3libTdicDV3YVd5ZGg0?=
 =?utf-8?B?NXNpTTVrM3hwcFNzZTdmeWJYTHNCUGR5Nmo0dm1tTzF6aHEybGQrelcvQ2xs?=
 =?utf-8?B?QXNCdFRUcHEyTzdIbktFd204OHErcUpZb3lYRGRnSFdzTitHdHRGT01saXpW?=
 =?utf-8?B?c3lKbUtKZHlDeitsZGp0WjFIVDNhamJ5aW9wM1NMbkJXQm1TRXBHMVNCL0ZY?=
 =?utf-8?B?Zm1FanBTTnpFcFg3K1NlYVg2YWFLclpIWmRJdzU5MUFEVjk2WWRCS0FNWjY2?=
 =?utf-8?B?Y2VoVFJWdFpMNW5YTmVacFBIdUt4RVF1VjhvSGdiQ1NYM1dHS1hpKzBLWW03?=
 =?utf-8?B?YWxNS3Q0TGtNeGV2MkJ1d0lqYyttRTdqQXN3Z3ZtYUVocnE3RlNVYUYyRUpD?=
 =?utf-8?B?cGZBSzlsZm5jS2tvOUhZMUdRYXBtM3A4SVJ3M0s0UWdFUSs3djl6QVFIVC9l?=
 =?utf-8?B?Rkd4bHdUbE1jbUtYSHpBUzlLZG80WVI5OGN5TnJZQWNoUy9hbTVBZkRpcGVs?=
 =?utf-8?B?SUp1MW9oRWJFQ2p0bmExQkdmNFFjZ3hEazdhK0ZuWm9TbzEzMmRGam5lRWNh?=
 =?utf-8?B?dXNlL25iR1krbSsxL0lYNHpXZXREV3NuVzJ5QU1HS0pXQi9ydXNWdVJsYTVw?=
 =?utf-8?B?VnI1eklzbjBpbzFaVWxiV3AxbmQ2ZlZML0w0UmYyZ2pteFFCUGVxNjl0ZUJB?=
 =?utf-8?B?OEwwb0hhY0MvTExlRmJlTEJqU3Zua1lwZDNCNTlLV25oSTU0Uys5b3g4N2xD?=
 =?utf-8?B?U3RtY3dEdkdINE5vdWtIQlhTSnU2RTRnQTJtTDRuY25ZNERtNFdtNVlSUis4?=
 =?utf-8?B?S1FIWkpiRUplVGVmUFpCa0M5T2pJdVI2TmdZUEQ2UHc2Vkc2STRBeXo5ZzlF?=
 =?utf-8?B?VFhQYkxaaHdkVmhvOW5EMkRjTm4rM3pLZTB5dGtRSVVDc0FEY3FsSHFTbUd6?=
 =?utf-8?B?aFdVWWVMS2hncUdOQkQ3aEJYdEY4T25qdmczSy9BbUdHNldFay9EZlUyc0ow?=
 =?utf-8?B?N0V6Y0ptamhVTlJtb3hXN1c4RXdpTk5wR050a1ZxQXBiZVJ4Vmhzbld6Z01i?=
 =?utf-8?B?TC8zc1Rnejg4TzJGcUppaUY1NS9zZ3p3QVhIL1pjN2N4VTB2Z1MyWWhqbVJ4?=
 =?utf-8?B?cDBiaVI4UnVleWlOZURtdDhnVlBNTWoyN3FPVE5GMHZNWU1YWmdJOThiZFg1?=
 =?utf-8?B?UHh2Uy84eTFiNkNsOHg2Z1BzeG9yVEhsVjl1Q1lNK0pwZkJBem5jR20vRVMr?=
 =?utf-8?B?Qkh2VjVFU0lNd2tGc2tIclNjSVJMTy9jZmFXWnB4cU9lUnlFUFBESlYvRzAz?=
 =?utf-8?B?UmtUSE9Vb2FHdGFjeFNveTYzZGJmTjN3YlBDY1hMdHVaVWt1UzhNR1RZVkQ4?=
 =?utf-8?B?VGpFTk5RaEtJZDV6bGJ5SVk1L0RId1ZXcGN0Vkk5a1hIQ3dKMzIzVlpUM3RK?=
 =?utf-8?B?UVNidUw5NXhPbTRrMzJjby9sRU9ZekdtdmExSzdiaXNFVnBNekFicDl0aXgx?=
 =?utf-8?B?QjQ3cEs5Q0RyM1F3cnhwWTdndVVkckRwanYvVDBYV2JIQk9hVkRieWlCQjRs?=
 =?utf-8?B?UEg1emlHdFIydG1OSURaaUdlTm9OalZtYlRtQ2J4KzQ4L3VZdjVSQ3dTRGFW?=
 =?utf-8?B?K0RpZmpsWGVjR0lacmVrSEdlTnBvTmxFSEJ3QjRjQ3dsUm8xTjJOQlRqc21u?=
 =?utf-8?B?aHVVUzlWRGZrQUpLeUxvUm9kdUVYaGJVdjgvd2dYZFFNbHN2dnZBVG00MDNP?=
 =?utf-8?B?VlBGcGRXQ2dtN05CTFViVnc5ZXoxaWdLQlRDclBWcVBSVkwyQXJqR1REeWE5?=
 =?utf-8?Q?0Nzz+ndpKMkLAIC7dPe5R33cU?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e7503ee0-32ee-4238-a2aa-08db97f006d2
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2023 09:15:36.7155
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: te0L94DG7tXF+zitKcyFfmF/VicctFiktXm3eKfWvCdR80h4hmNBBmZoCcYtmRmMrbO0vked7IjWsvBzAxHuYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7569

On 08.08.2023 10:48, Oleksii wrote:
> On Mon, 2023-08-07 at 15:29 +0200, Jan Beulich wrote:
>> On 03.08.2023 14:05, Oleksii Kurochko wrote:
>>> +static uint32_t read_instr(unsigned long pc)
>>> +{
>>> +    uint16_t instr16 = *(uint16_t *)pc;
>>> +
>>> +    if ( GET_INSN_LENGTH(instr16) == 2 )
>>> +        return (uint32_t)instr16;
>>
>> (I don't think this cast is needed.)
>>
>>> +    else
>>> +        return *(uint32_t *)pc;
>>> +}
>>
>> ... there still being a double read here, do you perhaps mean to
>> make a statement (that this code isn't safe to use on guest code)?
> I wonder if it'll be safe to read 16 bytes at a time then we won't have
> double read ( if you meant that first 16 bytes are read twice ):
> 
> static uint32_t read_instr(unsigned long pc)
> {
>     uint16_t instr16 = *(uint16_t *)pc;
> 
>     if ( GET_INSN_LENGTH(instr16) == 2 )
>         return (uint32_t)instr16;
>     else{
>         // return *(uint32_t *)pc;
> 
>         uint16_t next_16 = *((uint16_t *)pc + 1);
>         return ((uint32_t)instr16 << sizeof(instr16)) + next_16;
>     }
> }

Whether this is safe for guest code depends further on what underlying
mappings there are. Surely you can't simply cast a guest add (coming
in as "unsigned long pc") to a hypervisor address. So as it stands the
function can only ever be used on Xen code anyway.

Jan

