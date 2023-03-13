Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E8C6B7D39
	for <lists+xen-devel@lfdr.de>; Mon, 13 Mar 2023 17:16:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.509340.784911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbkpp-0006le-D7; Mon, 13 Mar 2023 16:15:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 509340.784911; Mon, 13 Mar 2023 16:15:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pbkpp-0006jW-8t; Mon, 13 Mar 2023 16:15:41 +0000
Received: by outflank-mailman (input) for mailman id 509340;
 Mon, 13 Mar 2023 16:15:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ddKj=7F=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pbkpo-0006jQ-IM
 for xen-devel@lists.xenproject.org; Mon, 13 Mar 2023 16:15:40 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2060f.outbound.protection.outlook.com
 [2a01:111:f400:fe13::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ba186a4c-c1b4-11ed-b45f-930f4c7d94ae;
 Mon, 13 Mar 2023 16:35:48 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9434.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:15:34 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:15:34 +0000
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
X-Inumbo-ID: ba186a4c-c1b4-11ed-b45f-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DaZqK2pvmHDUUTVH2oRib8F2qtzU2Gu0IrhGLzCna3LAZIQ4K1kJmfFtuwIbBYFEwYSTy8osHd5ikV1vlrN5clyBZAMd8d89q3vIm51vGliLXfSLRrIzoO2lWLAJAqBZgr99Wif0lddq6X43W1nQmiAlKje1AeQkUwyISXpRK7w2pDdvSwbJPr0VLXjGOQNL6FIoCU4xWaS4NGPrq+EqrFNmwxO8NgNiQeHbRzoCmxF/rtLWzjyxcoG3C8eqv+s4X7t06ljNh+LXjvLHSnnHg/FZmn34XtYx9cf4FG5Ektrc+GK02S4t3iFMkX8icNPOjy42ww13/tG8ug86Ac4InQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H8ayyE/TOhRdwhKKcF4iK01e8s/A1foQtZEUI6plLkw=;
 b=mj1UuQfnyJADGq4iEbvUb3Rl8hrP3sMWVWXVMWePdm7lwtuHX/lHtQwW5tJC082auVdkFLmXLeTymcZYDDzEenMBKdWmLPeLwmOXtIBcY/xy0EWtvPz7H6xZ8ib4TM32ALXIMRHt3iA+1y+la36me6dU2IOXKMEn3u6P7kgRIc6wswCAqTLoE3cPKWzDKxTOwLImWC+JiWGTEFvBP3HXzyHeYOHvzNNmVgREJ6nG97K8gmPGLzvE8Tzibf91bskQbtPBt+wICDWmlAKkbiryvH/kaEjEuz/abJpGJY+pif2axBR1fj7Fc2HKuyG9jEHUhPodTSojUgzMBtf2NmKs5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H8ayyE/TOhRdwhKKcF4iK01e8s/A1foQtZEUI6plLkw=;
 b=pBSRAqO6COKqe0he2uDwHvhcvf1swdw/Yj0aQCN2L2ct4N9Lw+G2adcP0CT15WRHT7tzoEAXenvnaQp0zc9bIOqhj2G0k/0lZ4D2dcTdgZJy9/yx8sErkUkPdsp0p7PDrwq4Q52w7TGZXn6MjeH563vj+vPkQvqURF33x0uprHJ+tqutQzrlBJ6pv2/IKT8bAhE9vJL+OBPB97FWi2E4LRsKT3b5EpIPxKOSKbjP2EPj5HmDaqMfF1g7arUrz/hI4mYc0ejUFCBav36HnPJKotF3T9GO+5mkHsNUpXDdeZ5C7S3R3s0ltA1sQ4UCOQOollitULYcjBaBjsYsaaSZYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8b258946-4fe4-b988-ac25-a99ae1f06806@suse.com>
Date: Mon, 13 Mar 2023 17:15:32 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [XEN PATCH] x86/monitor: Add new monitor event to catch I/O
 instructions
Content-Language: en-US
To: Tamas K Lengyel <tamas@tklengyel.com>,
 Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 Anton Belousov <abelousov@ptsecurity.com>
References: <3f577545b8ee6846ff98c4411cdc96dfe1412b3e.1678505295.git.isaikin-dmitry@yandex.ru>
 <CABfawhn0+XuByYGM-rAkQy+XL9E4aNiBDfE5irOzvRVesuKMjg@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <CABfawhn0+XuByYGM-rAkQy+XL9E4aNiBDfE5irOzvRVesuKMjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0006.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::16)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9434:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ce1104a-f075-48bb-97d4-08db23de2c90
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F3F0CEZ0wx9J4OnMNMgPAKn9xQyTDOG0NMCSjfVLy1HVCz+eoJqZP+hJP/Z5LdoOiho727ofH+C7q/cO7jJvH8pmKi9OYeEcW55oVTU2J4vWbARkWoJnPuCZ2iF6osjRj5TtrHSoUdWUa2tcOF8qMQZnLhnFcCkZvJsJJxDaLWiL6reSRZDt/c3Z8fHOSvK4JM8JUbDXjAOesU5a42rC8AKcALMQQifTW6yZgO3rA/RYoSndmPkPtfXDSBXT4YFzy3rmbCjMLHLhlok04sl3XK6mSMen5r3Zx6Bo6TiSeiGMQpJASHBNqY6/lOAp/7wIDWTFHPcv7HYAoRLD1ufn7wvpc8X0YA2RG95rMQZZBYNUyLoMd/0RTUcaoWucrLfL4VtTzVVgPlSKa2pAIqtrfLffG3YDJhvUBP4PM9l7IqG17lDVqTbmSwN0yHzbIou9jRirF8kMVTIOu05h08G71hif1psC11ZGfoHEFsAwgJZpXOtm4ANVSaKDmHfPzTPIk/vxQ0EdTZPrMVWS4BzAZscy580s9M0apNqKf95jQFzL8HGiLqwwuMz81eEIBQcd96/SL+TrHWXUSc84KFeGJhFgYM3NbysQ2DQ2OXRoFTNexRVn5aJBclT4j2B06hM4WcyMBSpv0tfJjek/HJpkoVxLxN2VHQqbPW1y1YfFVuUoQoOhxS/V+RvbVlvMerpD6EyT7jdkowNcTAqPTmYtNkWtdXXgKM/7yewLls5hj4jXd8MZoLSzXKdbSPM5WhpvpFQOfl6iQozBgg9+r4RqyQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(136003)(376002)(39860400002)(396003)(366004)(451199018)(2616005)(7416002)(186003)(31686004)(53546011)(6512007)(6506007)(26005)(8936002)(38100700002)(5660300002)(6486002)(8676002)(66556008)(4326008)(66476007)(2906002)(41300700001)(478600001)(316002)(36756003)(31696002)(66946007)(110136005)(86362001)(54906003)(23180200003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aVgxbldMdy9VSDE0NHpseDhYQVh4K1p1QXp6b2FXSlc3TE1Iby9IbTdXa3Er?=
 =?utf-8?B?cVlDcUlndU40clppakxEb1lXZFN2RlZZK0VrT1hhWG1rT2lPMUxxYWY4eXUy?=
 =?utf-8?B?NW02cnhoTFR0WmdzM0xRbFUwQnJJS3B4M2JBVk1YckNrN1l5QnIxZTN1RWlR?=
 =?utf-8?B?YXQ4N01zdU8yUWFwS0VaTG9LVHd5cnMxeDhWb3VHN2VlWVNndWlhTEpzRGJQ?=
 =?utf-8?B?Ykh1bDZCa3Q3ZVhMRFZuNy94Qm1aVlBMVFFHQVZlRXc2UllDVWVzYjFuZFd2?=
 =?utf-8?B?K2hDb0h4RGFiNHhiQjlHUTNwYXVYeTNMdVRTM0k0bWtqWHk3UUpDNXFrVW5q?=
 =?utf-8?B?UGRiaFU3Y2lteWdpczlTQTF4Q2IzQ00vWW01TUErN0QrOWt6NlJsOVgwaXlV?=
 =?utf-8?B?QUl5TlV6NlpHL01wSWxKUlBjQTFiRGVWclgvenJnY0kwbGoyNHlHaENrNTNz?=
 =?utf-8?B?SHJybCt6R3g3QVhDc0FjZk9ITVN6eDU2eFU3L2RlaHBENHQxV1hGdXRhSmpU?=
 =?utf-8?B?UWZra3I4bGp1THNUNC84YS9ONEtGZ1BsdHIwSkEzMitTUzRQS0l3eE9pQjNB?=
 =?utf-8?B?ditXZndZT0Vaekh4T005MHRKQ0lDZVJMclQ4REVyK2tNUExlU3Q3bHl6UEJK?=
 =?utf-8?B?V3daeTd6eTdVTncwRjdpbElGbStZcmNwbFZNLzdkcVhmVEtpYUJsZXJUVGU1?=
 =?utf-8?B?S3UvbFNCbFR2eWt6WG84N3JZbXlBUnNwM25Ua1RkK0RPbGpIVk4remJyRDZU?=
 =?utf-8?B?THRWZDcxRnl3Q294OEp6Y3N5RFQ3RUpXZy9VVnVJQ0xUOFR6MVZGRUdZTnVT?=
 =?utf-8?B?VHg2d2g0V2ZKSjJlZlBKdk5JT2d2RnNZT0xlM29oV003SHJZSzRKR0NaaTdE?=
 =?utf-8?B?V3JmajZES0ViZkxjb1JOY3JUL285TUk2eVdjeVcxajlWTUtiS1ZOMGtFdzRR?=
 =?utf-8?B?RWtLQlZMQWh4Q0hyOGZSTWZmME5QblpPOEg1NEQrMTdFd1BhZFlmeVlIeEZm?=
 =?utf-8?B?cnUyNHF0NlpFMk5sWFZzKzdmaGJFeXMxckN4Q1pYcm94NTBUNXZqWFFmbUNm?=
 =?utf-8?B?a3hPNCs0cTJFd1M1bExJTmEwOVJjdmFmdXlmbFBjdktUVktJVjNyMTgzVGRW?=
 =?utf-8?B?TDFkeVlPcEdQUFg1K0l6Um1lSkQrRjZEWFJuS1lDdmEvOTJVcldtQkVRaTF2?=
 =?utf-8?B?L3M5c3djTEpWR3BHL3YxNkJMTEpZdGkxVGY2VVNrZlhVUkM3azNEVVROZWdz?=
 =?utf-8?B?Wk9SazNjQUdQZ3Yrby9hTWdnNmRXVWJJWmpMK0EwL2hEcXMxRk1wYlVraTZH?=
 =?utf-8?B?RFV5cEZDSzN0ZEUxQmtWa053MHNjK2VuaGRFcytlalZHVXBlVEhjMzhHSXgr?=
 =?utf-8?B?RzRZM200NjZrWmx2SjBIRUo4MHMvcEM0VEI3bzI4TFZaK05NK2NIR05mbFRQ?=
 =?utf-8?B?Yk9GUldTU3RqRFdXUVVySWFyYXp6YUl6WUlHNGV2WnNoenNRUjRTVnA1d2tq?=
 =?utf-8?B?QnY2NjhPSmRLWUREOW9KMmlMNnd0Ymx5K3JKcTZNdjRUMzd6ZVVjWVY5Q0wz?=
 =?utf-8?B?R2NFMEFreUR0L3RSOEF1QkNrWEpGeUF3aVYrYUJnT21XZHJTdGRFa0N6b2dv?=
 =?utf-8?B?UnhiUTd1MGZLNzgrS3lYdytTeEhhUHdVdVBnVDg2NjVuUk9mSlhWR0h5bzFs?=
 =?utf-8?B?YnNmeFlXeExqdmZBV2dMMFJ0UWtzcHVlZjRCcUJLSm1jNzByRVpjb1hhd3Bq?=
 =?utf-8?B?UG5yZ29xckN0T25OYXFtS1FxUkJHMnVNeWNQS2tQRlh0L0JLR2tNYzV0WGhR?=
 =?utf-8?B?L2E1eXJMMFUrWHZUYkNxb1RhenZ6ZGNkaU00MlErUzR1R25sMExxaXNqc0xo?=
 =?utf-8?B?TFlYcVQxWTZBMjljd0c2LzA4OWQwcmRlK1E3TDhsSEExdUIzVG5GbG5JcDh4?=
 =?utf-8?B?WVkvekpzK0hSN1FweldZS1oybDRmZ1Y5SmpYUCtSRWNhejJtcmRJcC82bkRp?=
 =?utf-8?B?VGVGTUc2RGFpYktXZFdxRXgxYzk0YnhDL3VQL2JsbHJDODkzR2xPaFA2dUc5?=
 =?utf-8?B?bU1kdEJHNUlJNks2QTFGMTc5WmpSdkc0M2ZzMVJuU0VobWlnTzNnRWJxSUxW?=
 =?utf-8?Q?cH81/aYy9Yeyt7WjVZgmwMnPH?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ce1104a-f075-48bb-97d4-08db23de2c90
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:15:34.2316
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ESBCJPiZ/lLWDiancNOY8VDj8Icx3xUI35UMJea0kzBw/PAKIPMhuwxuPfZkCjTFeRuGvffelS32Pqbk2gPSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9434

On 11.03.2023 15:50, Tamas K Lengyel wrote:
> On Fri, Mar 10, 2023 at 10:57 PM Dmitry Isaykin <isaikin-dmitry@yandex.ru>
>> --- a/xen/arch/x86/hvm/vmx/vmx.c
>> +++ b/xen/arch/x86/hvm/vmx/vmx.c
>> @@ -4579,6 +4579,8 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
>>              uint16_t port = (exit_qualification >> 16) & 0xFFFF;
>>              int bytes = (exit_qualification & 0x07) + 1;
>>              int dir = (exit_qualification & 0x08) ? IOREQ_READ :
> IOREQ_WRITE;
>> +            int str_ins = (exit_qualification & 0x10) ? 1 : 0;
> 
> You are already in a branch here where str_ins is checked and known to be 1.

0 that is, i.e. only non-string insns would presently be reported.

Dmitry, you also want to make this variable and the corresponding function
parameters "bool". Unless of course they need changing anyway to e.g.
communicate the address of the data (as also indicated by Andrew).

>> +            hvm_io_instruction_intercept(port, dir, bytes, str_ins);
> 
> IMHO you should have this intercept be called outside the if-else. The
> function already kind-of indicates str_ins is an input yet right now only
> called when it's 1.

I agree. Question is, as above, what further data may need supplying to
the monitor agent to make the intercept useful. Merely %rsi / %rdi as
Andrew suggested may not suffice, as especially outside of 64-bit mode
the involved segment base may be non-zero.

Jan

