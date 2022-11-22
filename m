Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CB46335E6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Nov 2022 08:35:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.447009.702869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxNnx-0005NF-IF; Tue, 22 Nov 2022 07:34:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 447009.702869; Tue, 22 Nov 2022 07:34:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oxNnx-0005L7-E9; Tue, 22 Nov 2022 07:34:53 +0000
Received: by outflank-mailman (input) for mailman id 447009;
 Tue, 22 Nov 2022 07:34:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dUpj=3W=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oxNnv-0005Ku-IR
 for xen-devel@lists.xenproject.org; Tue, 22 Nov 2022 07:34:51 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2061c.outbound.protection.outlook.com
 [2a01:111:f400:fe16::61c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 254fdcfa-6a38-11ed-91b6-6bf2151ebd3b;
 Tue, 22 Nov 2022 08:34:50 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB7009.eurprd04.prod.outlook.com (2603:10a6:208:19b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.13; Tue, 22 Nov
 2022 07:34:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5834.015; Tue, 22 Nov 2022
 07:34:47 +0000
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
X-Inumbo-ID: 254fdcfa-6a38-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoXpqeRG3dpREgaEqv87AO6oM7JtYEi8LeTTn93ZQBwC7jyRb2tvRHkNdEQaGg+PGNcvXvmWSsvIof2B7Jj+U33tTzM3H+pERJh5acXnj6TjuCixSqtc7+KB4ktifQImd4+QtMwhyttAulIlVlBSD7NUM9LS5GU9uVMif26hmG+lhaPnPGzEPupCcY9hUTkD5p7vjIyDt3WRBgYJg3guUeax3gtQnQjOdyrLo++Hy9znpDdm0NW4752znRhHM5Er+xrZBoaTC/MBY+hcq2qDmOvtx69OaWeBZ4cOost2t8jkpq7SQZug3UI8MdvzlOVJcanvTeWM5x0s6XsnQRB84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QtZVCz7ByEpoqFK1T38WnG0kgLWnuHbUKrfHS2fQ0tM=;
 b=CJFM8Gpnh+xk7vSwuSYDC/Ikh8whH3lAE2xgzHxYBbtMHsfUG0g5FH6HUxJMlCr6IMpDlOu6vpmwRIhA/ldMM9YpcJWz5Ie9zH+KXYx+6TbpAe4jxOw189TcXOqtCp/Pgb5017i1Kn8boCHFbnKD6iBm1PagZ+BAfaEU1f6IQanNojfHEIhUAi1EdcZE5etB9XgxoVT68uV1Bt9xvywupjuEzY7Dw/xrUdLBemeMBcG8+ZpbCXTyH0ycx2wPzEDsOhCL32TrWnl0sdGXeGKyX04/gHX1T/+R15NpjSBUuFkNqfalfW9UL/kpf7ZSTDR1FmFC6AzUKr0R/7Hec2R59A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QtZVCz7ByEpoqFK1T38WnG0kgLWnuHbUKrfHS2fQ0tM=;
 b=CMS6osAoXhiqwRHeTxkCOeiooQoI5MJedxuHzO9e//Ew/qNMr0NeeZlrQzfPcCByLdYvSWnmSx/6+gN6twA7jQ0uWe7DCJST41qm4mLx25xCYt1aaHOCZxsXOMd6SWyiXWiD+M3vm7C7kIaE7q7DfDoKRy2xdO+BfzVSqdNXCKMIMTSy9niA66KU4lV/ygUy6GU+x4rsa7eYIPDnrEu1F1LG7YJ3FWFAsSM712xxIL80R6yusiRRs1A3a92desuyF0jRs2sHgKnkMUhUZuVF+T8+a1o9/X/xDSPSsPKXIhuEoUzxi6+FyeX/HHtAsB5U8RYVPZfEuPEK6WNiAjve6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ea024b54-87fb-2b1c-7ab9-59848f47794c@suse.com>
Date: Tue, 22 Nov 2022 08:34:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [xen-unstable test] 174896: regressions - trouble:
 broken/fail/pass
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 osstest service owner <osstest-admin@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <osstest-174896-mainreport@xen.org>
 <AS8PR08MB79912EE5EF2BA9A0F9527416920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <44dfd2eb-9ef8-7254-70a1-e41177d6c9af@suse.com>
 <AS8PR08MB7991A5DABA26E535862A4640920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <AS8PR08MB7991A5DABA26E535862A4640920D9@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 711adb46-316b-450f-c961-08dacc5c0806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dASH9ayZ0mBXpLYkJpF6MLu9sOffH/kh12bvFEVtQIY3M3tG7Xk4bXWCmhIkBltRoLsG4+2a1mTHMSPakm1U9+Icyfse+ES5Yk29tOBbBubf16/jYVX7D2Y/rPYWd4GSST5ZVoWNkAY1QQkAhpffaM3vezM21hrrVi+tGnb67R8rlU6A3vxac+QcT1wlI28DzIJkQLFx3B6MY7xy4B8PdETg4kAzHJVLYKUfdEx6ymkA97OlRc/YgMdfeLlJXyzAXBxZFnN9RC4F+8unuAn71M8hl1uOxCdbvs/7ITtnbaKtZyGUfUnQug018JsYwMGVZbhnhlWaJe3elBbxalZDER5cwMRTrlYA2hQuknQbF0z6ijRR0yeZRa5thLlQ7XNiRk8cZTafH3Mt9khWa82VejoIKyQh9DIOMIvmEdTXtq3mZEFGiGrpff5432yBbrmhUj7QlSwXknTcbbOGLEY/2MTHUo0Wbj9QKi/WUHlywLfZxcVFGchDEQxqpeBbF8nFl30Y14xE8d9eY015wJ3DwaX7BmDCCJui8YvO2ucqwCw+WMdbLg8cw1wFWW2lyrY0y0H/BjxKMf+YAjI8hlR+6qA6uTYSNE9Awb3w/EG9wh9bcAy3ilKRC3XW9O9vA+nXxsh1YxWCGmPTTb20sKwzcB1Spg/ghtnMiKstI5QI8dO/vF9CXzukSdgDrEk8evJBQnoMtAaBtmwuEftyazNyfQyvIht7LFxjGQJkSsXPkjc/UjK56A2AKydq+hRH7Ef8mnn8Kq5R2cZoUanfcQrj9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(136003)(346002)(366004)(396003)(376002)(451199015)(6512007)(86362001)(31696002)(83380400001)(38100700002)(2906002)(41300700001)(8936002)(186003)(478600001)(4326008)(53546011)(6506007)(2616005)(26005)(316002)(8676002)(66476007)(966005)(6486002)(54906003)(66556008)(6916009)(66946007)(5660300002)(31686004)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QWhuazNnN1NZazV0YkRJaWdjZ2VhclVzd0VvSEhqZjFTZXV0YmhYNUZzZGFx?=
 =?utf-8?B?RkcrQ1FlSUhOVjIydEJhOUoxZ3graEJwVGJCUU80d09kdU50YSsxMUhXYzAx?=
 =?utf-8?B?OGJzdDMvR3NkWXF4QTA1d3VQT1VnMjAwZUNpbGVDdXBEc29nclVhR1pDY0Vo?=
 =?utf-8?B?bDR4dkdCT0ZUbjl3Qno1ai9BcUhMVmtTWVlKZEpXZVhyWEcyZkdUT0Rha0xX?=
 =?utf-8?B?cmQ4aGN6L0ZGclp3bnBBSEdLNkZzNjA0ajBEQS9XaHpibkVIL3k5RzV5c3Vq?=
 =?utf-8?B?UDJHNmFXbUwzRmpLeVNWL1ZoMFNSTmtMb2dBYlpNWXl6SGd0dCswM2lHc2lN?=
 =?utf-8?B?NWVmamZMN3FUd2tid3pXUkYwd1dBbWgrci82eERCU1dMcnA5dkhwVFN2TzdP?=
 =?utf-8?B?VWFadHpDSGFIOVVIT0w3cmRpeGNhRWhPaWlyMUVWZU1Ma3VvSXhjTmNRR0c3?=
 =?utf-8?B?aC81WXhGTXBnVW83QlIwQXZWYjNDQTFiYlNRR1hlQWQ3cTBWRWo3UFl6M2FK?=
 =?utf-8?B?SXJRMmxjU0pOTEhMbFJ5OTVYMzc5Ui9iUWliLy9MN3l4eDRnTXNVQkQxcDBx?=
 =?utf-8?B?NHZQQVhtejRLWm9va2ZQN1Q4KzBmdWt5Z3Nmdmpma2l6YWR5VzBzVi9jblBv?=
 =?utf-8?B?aEZaYU82WVBtTlZ2Y3p1STdLTElvV05XTnFQVGtBaWxpSXNTWDJ5eTZTQUdu?=
 =?utf-8?B?Mll1dGlMZU9SM2VEVDc2ckhNVWk5MkRIb3NORzVWc2J2Z05oY1FlSGdpTjRR?=
 =?utf-8?B?dzFnR0NzTS84RUp4Rk5tQ2JPbXBkUDMvMExuRm1DaHlGWWRNdUVLRzJINTJM?=
 =?utf-8?B?eU5NYmFVTDNRVVlmZVpHK21abXFvL21najBYVEpuWWF6UE1aRDgvWUlpS29Z?=
 =?utf-8?B?aXZPVCtKYmg5blJhdzZCZURER1dNcjdDNis2RDVpQWs1clB4UlltR3R6TjNS?=
 =?utf-8?B?cnMyR2dKNmlESFJjNThONVZwVXFvTTEwMG80dG0zWUFQMVBuLzBQTzlGYW5H?=
 =?utf-8?B?SVRMcTZJMzlldUl2Q0R2OFl1OU9pakM5TnJVSkdYdXlDbFlSa3pZSk1EdFZo?=
 =?utf-8?B?eE4wNitZdFZ4SHB6YVNyL0ptUlhPTElZcmMvdXJOYlJuVmhsajhyMk5NbFdk?=
 =?utf-8?B?MzIyZEk0NVlkWDZuZExmeGRnTlhMOFRlVGhVQXErTW00Qkx5QjMxQnY1NlI3?=
 =?utf-8?B?RGZGaWRDWHZMekNFZGhldmFkQjVhNTFGTllxek4xRG9EcFBqa0ttTGc3VDFl?=
 =?utf-8?B?SUFjSVp0clBpQTV0Z256bEYySGExSThQM2U5N05IWUV2RjFEMTd1Wll0dGpC?=
 =?utf-8?B?Tk95RE80NUpPNDFHRElzNnFTTGg2bzczUkZtR25Ga2ZkNVp0VHJvVjgzek92?=
 =?utf-8?B?UFZubldYVW5VTTZ0ZkpIemRLeUhKaDVKSi9yNkdnalFyd1RncFArOE5nN0tl?=
 =?utf-8?B?RFN2M2N0QlM3WHIvdExsTkVtN0ZUc2oyaFJiYUFsYUl5eENBcEoyQmtjNFJo?=
 =?utf-8?B?Nm1UbHVRNG5kYnNYN20rOWxJeldhUTVKYTBvTmE2RXVHNTBYenZkeW1mNEhs?=
 =?utf-8?B?OXV2S3Rwei80WGJxNjdaOW5xUWRza3p0SDcxZkxDN3hzaDI2WmQvQzNCRzZ1?=
 =?utf-8?B?ZG9nQVNLSmxCT0ovSzZJTlp6TlBWWTFBQ1h3NVcvelRueFNWY1dNZTdnOTBl?=
 =?utf-8?B?K0lQWC9RN1BRSFRrUFhaT1ZvN1FnKzZ6TEp1OG1aODg4OGgvaUlmZElqVk9m?=
 =?utf-8?B?c1F1YllkY1Axb2MyVUVWc1pUQUpINTBUYWtQbWdHN091dWhPa1F0MWJkWGwx?=
 =?utf-8?B?OFQ1WlFYcEZUWFNDVXY0eXRjT1ZwNGN0aUliVXgzK09ObFE5bFhjdVpRQ1Bp?=
 =?utf-8?B?RFA2MndFb1R4elp0SW1tUHBMWENoQjc4S0hYYTdhRDBucGRuTkRtL0FJREtG?=
 =?utf-8?B?WWROaW0yU3c4VFg1OGxqVUI3b1ZaYXI5WngwM1gyazgvVVlXMldHUE5ib2Nj?=
 =?utf-8?B?U3B0cnJtVjZ1Mzg0OGNUbnl0YUtBY3Qxd2d2UzVLcVh1SzlLdm01dnEzeFlV?=
 =?utf-8?B?UXBIbU0ybmJQSkNEOTNiN0xXTkhNWStObGcreGoxZ0RQUUhCTStBU1lPdW1j?=
 =?utf-8?Q?rHC2Y64rKps8Tws3BVvLpZ3py?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 711adb46-316b-450f-c961-08dacc5c0806
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2022 07:34:47.1785
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nGfJkHF8NGZ9Q1MVFmyNLJUzzY6/8OmKzFpYdM7iaBKVZbDRafL51HuTg/PQTECQSn0QnpElQZfXn3HMWkBlMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7009

On 22.11.2022 08:30, Henry Wang wrote:
> Hi Jan,
> 
>> -----Original Message-----
>> From: Jan Beulich <jbeulich@suse.com>
>> Subject: Re: [xen-unstable test] 174896: regressions - trouble:
>> broken/fail/pass
>>
>> On 22.11.2022 05:40, Henry Wang wrote:
>>> Hi,
>>>
>>>> -----Original Message-----
>>>> Subject: [xen-unstable test] 174896: regressions - trouble:
>> broken/fail/pass
>>>>
>>>> flight 174896 xen-unstable real [real]
>>>> http://logs.test-lab.xenproject.org/osstest/logs/174896/
>>>>
>>>> Regressions :-(
>>>>
>>>> Tests which did not succeed and are blocking,
>>>> including tests which could not be run:
>>>>  test-amd64-i386-xl-qemut-debianhvm-amd64    <job status>
>> broken
>>>>  test-amd64-i386-xl-qemut-debianhvm-amd64 5 host-install(5) broken
>> REGR.
>>>> vs. 174797
>>>>  test-amd64-amd64-examine-bios  5 host-install          broken REGR. vs.
>>>> 174797
>>>>  test-amd64-amd64-xl-qemuu-debianhvm-i386-xsm 12 debian-hvm-install
>>>> fail REGR. vs. 174797
>>>
>>> Seeing [1] [2] and [3], I guess there is still something wrong or it is just an
>> OSSTest glitch?
>>
>> The first three are certainly osstest / environment issues, which is
>> generally the case when a test's status is "broken". The 4th, as
>> already said in reply to flight 172089, is a test which sadly fails
>> every now and then. So let's hope for another flight and better luck.
> 
> Thanks for the confirmation, this is reassuring and I guess I am getting too
> sensitive now :) Sorry I somehow missed your reply to 172089, next time I
> will check my inbox history first.

Oh, I'm sorry, no, this was not a complaint in any way. It was merely
an attempt to make people look at the state just in case they can see
a way to analyze the cause of these random failures; I for one still
have no good idea.

Jan

