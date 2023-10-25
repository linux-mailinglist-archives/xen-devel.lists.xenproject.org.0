Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A517D66C3
	for <lists+xen-devel@lfdr.de>; Wed, 25 Oct 2023 11:27:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.622748.969856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvaAJ-0003js-2T; Wed, 25 Oct 2023 09:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 622748.969856; Wed, 25 Oct 2023 09:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvaAI-0003iF-W2; Wed, 25 Oct 2023 09:27:02 +0000
Received: by outflank-mailman (input) for mailman id 622748;
 Wed, 25 Oct 2023 09:27:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e1rq=GH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvaAH-0003i7-T4
 for xen-devel@lists.xenproject.org; Wed, 25 Oct 2023 09:27:01 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on20629.outbound.protection.outlook.com
 [2a01:111:f400:fe13::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5ea7d7c-7318-11ee-9b0e-b553b5be7939;
 Wed, 25 Oct 2023 11:26:59 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB8298.eurprd04.prod.outlook.com (2603:10a6:10:248::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.14; Wed, 25 Oct
 2023 09:26:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Wed, 25 Oct 2023
 09:26:57 +0000
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
X-Inumbo-ID: a5ea7d7c-7318-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bWrqX8MsGN/6svO4Wh2Kx9vw5qjiKc0qlA7jtqfRUxIalAzzmqFOrGcCKPZyraFMbn7m1NovHqKgV+u0bXQgfR21V8A2W2PGV/n4mtjQ+xrfe98xfqDzVgJzr2e+nG5GHjkd46pilXE2w+qWe/mNnJxjY4RGyFygEmOkYY8IFJQ686UeRGydh8drqtfd3AW+aNQSINkGpuTmJJO0tfLsfgfBZ3fgWhWZNKfBd7kK3s27lL85G4UkRiAREcZ7wGDwvWmdafk9jJYl6ZzOOH5I0FgF1vjhFXJ2BxWAWXz4Yamq83Q2zken22MhPUYgs0cTM0KNmg8vgx5GGE9rqZTqeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p3MRZQFvSY8VxcVapiB7E3iRoHwBIWAmuF4KdhCGKNQ=;
 b=g04QNoAPw5anvxGTzwmKvvAkyaHGfGsXjfgeMEyfoq9cFKa0xumAIYWCZq3CX+/N/iA7CBO2ISJN9p4rnbcgcRoDHodV7Qn0x7Ty/HUY5WWLaSbS2OOS55pT2L234n/2tkvGv8116Dc5g7rDr0LGD2Y1ZxI1XMBaMp4DGSXhizh53XOYhXGfssxV+5b3OU5R4/f0izr58L3yU00Ze2w2+KhdDh2F+G9S+h+IP4wnnD0WT8xZYOGUzUqMBxP30y8dZgqk2aujZ5C7rWdZBiCzRR+f7VlEn7gO9bWS02hek4LBsHHlLduY7nG63Yt4ir7FvSb8O70R6KLkWZLnaS7D/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p3MRZQFvSY8VxcVapiB7E3iRoHwBIWAmuF4KdhCGKNQ=;
 b=U8+bE2Z+76Wd5AYQnXEIx68tVBakV8PtZG/5r+s8fdHLtkHeWNddIbpsohe83CeYr/ZEo6cOxkZ+rDRJbQpVYekCzSUB/XRQV/b3xOxGFAJJgoa2VJ+mVCU3cAjTmVqJTH2EhlVDBQtZA0PGZLXHOfG9DRUFPVVoMT3H0NaSGGyJIkhUBBQcev/5bkqYapNWU9wAdev/Uz4wUVbf8SNOW7egfgBUE8CAT3bAspHcKCC8Sdmqj3Af/P7xueB/xsCUt6+cbpaEZUQAImzDw1R9QNtL+kM6lSpHJ8fUFHrJkx1x2H2E5LQ9oZIUrmwLYJyxHqSBbE7kFeMjEqVh9as7Eg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4cb8a480-a587-22cc-2f11-fd9d6cc8c1d3@suse.com>
Date: Wed, 25 Oct 2023 11:26:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [for-4.19][PATCH] build: Allow setting KBUILD_DEFCONFIG in the
 environment
Content-Language: en-US
To: Michal Orzel <michal.orzel@amd.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20231025082834.31680-1-michal.orzel@amd.com>
 <9e646df5-a9de-545a-e827-951a161c935f@suse.com>
 <14ab687e-2d2b-40a4-9f79-3f547bba286c@amd.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <14ab687e-2d2b-40a4-9f79-3f547bba286c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0339.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ea::13) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB8298:EE_
X-MS-Office365-Filtering-Correlation-Id: b55a5ff7-e8a0-4c99-72c7-08dbd53c88d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/h0yYH/EJCcIpSNExW3J3+ydkE4/Y6qmIksowHayS5mNji3gfmOJmB8wyZO+AwQbIZenupeufq4NZwlN+82hzqslMo+jYw38ZTwjW+2IFLrfmhGIPM5XaGj0882rQSTABLf667BYHPVvDo3/pbTzAlsRpxYFMELj+Orpt+X6RAR83ZENrEGw2I2H1w540WS36vXYaaf0Yx9w0+JLrogua+IUFbhbhMzuC+k/J9Yys3AYkTRluKo1mncM/5xdG9otzA8bx8ONROWGU8JW7cG+opvzEnr9RqBDHz6zIbbCM96Wb6P5ZLyFPX2mLWd9KeARxmWXVRVSwO0L/sj5Bbb0lq0pH8NgolNdiGd6jZoi35GUsHZ8BZpYlKhtTEKuJska/gtURxvJlA9Rvi9QW5j/1tYggJxBt/GEtMnby2vA3F307YMYKng3gyXiD7H873BorxJgsR+DgoLrqL06OgZgH2xRkNVPVBBpC9L7r5QEAr7xeDYMNdQwmIzSaBG7wc3Rc4rtJT80lD7muHJNz8teVwoESOqQevAayrPOMi9kz9zPoKcWNAQETSxRyiS84SXLG0D77ALrGmQY8NdWQ2811csbmdAcVIJe0QzMu0e5WYSdUfFdQps+PHwRQrYmuwJyrKCvopjctxIFxCDS9hS7EA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(39860400002)(366004)(136003)(230922051799003)(451199024)(1800799009)(186009)(64100799003)(8936002)(41300700001)(4326008)(8676002)(2906002)(5660300002)(83380400001)(53546011)(6512007)(6506007)(36756003)(31696002)(38100700002)(86362001)(31686004)(2616005)(26005)(478600001)(316002)(6486002)(54906003)(66946007)(6916009)(66556008)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WVYvTTdQL1BIMWF1amdNdmZIRjlmdjVaWWh4VXl4dVhDMWwvcWYwT2JnMjVh?=
 =?utf-8?B?Y0tjY2dXS3hXdkh6TXd5VGFuVGI2QXBZSEcvZjUrWDl5eGxQNldEWXp2NnBK?=
 =?utf-8?B?QmZLQkhUclFOYUxUNkRlZldUQ0MyM2xPRE9yeDRWM3JBZ2c1WDRPbEJ6NmVC?=
 =?utf-8?B?c0hNUVV3QUh1Mjl0eXg5ZWJRY2pzQk5ZQnorY3hNYWV6UTdIaEtVREM0RGVr?=
 =?utf-8?B?eVlTNGdBUkxEQnlYVFVNVGQvajUzTGxGWWtYS3F1aFFlS0l6WmVzanpSUitk?=
 =?utf-8?B?ZHQzRjVMY2NvL1FIQXpRUjlrWG9PRm1nYVpRQXhKYnZmdEt4aXI5S1hERzlw?=
 =?utf-8?B?L0JQTWhHVk16Q3h0MUFuK21sZ3V3dXJHbmxIdDA3a2RlenlzMFlJZUM0OEF3?=
 =?utf-8?B?Y2hFZkd6WDV6ci8xa1FLYU5xcFVQYnFBSjlKTkVwZWIvSkNyU09vVi9EUlkx?=
 =?utf-8?B?cVhyOVpJL1YzUml3RTBsbWtINWNLUm9qT1VyTWxhNzFaK1FEWHgxbGdQWnBG?=
 =?utf-8?B?WjFlVWJ2Wmw2RkxzT1Q1akdHY1EreSsydlcxZ3hPeGFsZlVhMUh0bmNlaTFY?=
 =?utf-8?B?QzQrTTZFemdmYUcrQjBJWUZ5N2FzdjJkNkU1WE01SFdHWnlPUXk1QmhyNm9l?=
 =?utf-8?B?NVNNaUNVN0s3K3hPYzZNNHRmM240VDNuSHZIUGFQRFR3ejhsYVZyNHdSa3Vn?=
 =?utf-8?B?Q01uRFNybUp1bUR5amhLQU5DYytRWlVBVmptN21WUkZEYUQvK01MT0NsN2JH?=
 =?utf-8?B?UEFkc0pNSzVzNjNRRzVEQXduV2ZUb0FMc1VDOEEwMkZrZXpvdlBudVh5eEEw?=
 =?utf-8?B?NHo2a3NxQ3ExRmtVajVYT2tpWW54d2d5ZHlBM3J4LzE2YlBreTJvaTNYQmxu?=
 =?utf-8?B?dTV4c3E5L0RwK0ZsYjY0aU1WZGk1aGtHLzEwQ0hjZjJodnQvRjB0S3VyeW4x?=
 =?utf-8?B?QUljK2RhTlRBU2N5Z1Q3bEJITG5WMXBCTjNUY1JoeXEvYU1UWXlvc2tIc09k?=
 =?utf-8?B?YXNFR0R5VzdEUE9vNUIvQ0xqRVJLTkQ1N1ZldEhDWHlQZ1hDOHRxbzhOODVr?=
 =?utf-8?B?MzMrWjlxNEY3VkMrdG5HWk0zZklkSW5pY1ZLOGV6MEhFMnBVc1lwamtQSms2?=
 =?utf-8?B?QjVYSFRaemhMT2lSdzhnSlZoaGRWYU91TEMyWGVuYklueGFkSlJ2dnVqcmRz?=
 =?utf-8?B?UGl3UkdkQ1diaTg1OVBMODJWYXl4K1FRMDV6OEZCRHlRek5vQ0RoV2JGTitT?=
 =?utf-8?B?QnQrenR6NVZsbVFFdlFKdE1hZmFsQ1ZMN0w4R1laN2JlNmJML1RwcWRKWll5?=
 =?utf-8?B?TCtDdTViejJxakVtclpnS3dHMXJEYnlidkVIVDFXb1NEaWdJUm4vcU5LcVFM?=
 =?utf-8?B?dmptQUZUSGxSanp6ZUVqcnlwNHk4VGpaNlk3VmRrWHc1RHhIZ0VwaGZyeTBm?=
 =?utf-8?B?aGRNR3ExOFZZQm9IZU53SmIzeGhDeFovRVFlVm9WNHAyYjRwcXhuM2dqdW0v?=
 =?utf-8?B?dHhtQndTNE81b0gzeWdxTk9QRm1kNVI3ZzhHenV0NXdVVVpmTVRzWE40UFRP?=
 =?utf-8?B?bTVrU3c4VEJBejFKbHF0cEV1aVdWbnpHN2lhU1lGWkgwK2dSaEJtQUhIK2hI?=
 =?utf-8?B?U3Zrci9aeTdqdDNaZk40Y2kzR1BsQ29ic0YwWDJwSWdyMnAvU3pGQnRmS3dk?=
 =?utf-8?B?eE9xM25DSkpNZTFJTXFFZHF1TzE4bFpPTmh4cFhjZTVRUkNXdnhNNDc2d3d2?=
 =?utf-8?B?dFRkdVNhV2dyNjZ5TEp3bDQ0bzZIdFJkc1ZiK2NlRFNrTGdkRHBJRnFaWDZM?=
 =?utf-8?B?SHpIWGo4YTNacFc5NEFPRjRWc1lERWUzWHQxcWdUUytvd21FWnF2aEs3cHBT?=
 =?utf-8?B?aHEwUldNb1BoYkhBV2hkWVpMQ1FMZlFkbkRVSERHbE1keGhoQWNCRnl0aHdn?=
 =?utf-8?B?NUhhTDFtdUNsOWJ5SktaYnRlb1lJSFlteXRYd3VqSk91am1FdFkzcW1Tbk9L?=
 =?utf-8?B?RXFjb1Y5a0hJYkVtb25DbzdEZlk4WWlZbTdNMlQvb2s3dHoycDB1YjU2TU1L?=
 =?utf-8?B?K2x5cjNuRkFtUkRYOVp5aGVBcll5TDNaaHZDcUM3TTdlckxzYTVmYjN1WXZ5?=
 =?utf-8?Q?B7zOvx7xi19PJE9B91tDmfNzo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b55a5ff7-e8a0-4c99-72c7-08dbd53c88d6
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 09:26:57.4970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 48D8C7EieZrgkJLW2OZg3ffIkuw3i9Q8w31quuIg+Z3hPSENg8hvdxDj0J+bgjAZemqJrSMjD3uk3mo2fRR8+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8298

On 25.10.2023 11:21, Michal Orzel wrote:
> On 25/10/2023 11:10, Jan Beulich wrote:
>> On 25.10.2023 10:28, Michal Orzel wrote:
>>> At the moment, in order to use a different defconfig target than default,
>>> one needs to specify KBUILD_DEFCONFIG=<target> on the command line.
>>> Switch to weak assignment, so that it can be also obtained from
>>> environment similar to other KCONFIG/KBUILD variables.
>>>
>>> This change will activate the use of KBUILD_DEFCONFIG variable in CI
>>> build jobs that so far had no effect.
>>
>> I'm certainly okay with the change, but the above sentence looks misleading
>> to me: Yes, the envvar was ignored so far, but isn't it the case that the
>> envvar as specified in CI matches what Makefile set it to (taking into
>> account that for RISC-V riscv64_defconfig aliases tiny64_defconfig), and
>> hence the specifications in build.yaml could be dropped (until such time
>> where truly an override was intended)?
> Well, today riscv64_defconfig matches tiny64_defconfig but it can change. Otherwise, why
> would we need to have 2 identical files? Looking at the latest full build series from Oleksi,
> only the tiny64_defconfig file gets updated which would be the clear indication that what is
> specified in the CI matches the author's expectation.
> 
> Also, I never mentioned that this change fixes something. I just wrote that it gives a meaning
> to a variable that so far had no effect.

Well, sure, but if you e.g. said "... that so far would have had no effect
if they didn't match the default anyway", things would have been unambiguous.

Jan

