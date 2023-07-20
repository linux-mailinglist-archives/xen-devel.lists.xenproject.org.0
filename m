Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7585875B0D1
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 16:07:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566625.885698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMUJ5-0000Qq-Do; Thu, 20 Jul 2023 14:07:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566625.885698; Thu, 20 Jul 2023 14:07:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMUJ5-0000Om-9I; Thu, 20 Jul 2023 14:07:03 +0000
Received: by outflank-mailman (input) for mailman id 566625;
 Thu, 20 Jul 2023 14:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6Xo+=DG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qMUJ4-0000Og-8U
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 14:07:02 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2062a.outbound.protection.outlook.com
 [2a01:111:f400:fe16::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b20962ca-2706-11ee-b23a-6b7b168915f2;
 Thu, 20 Jul 2023 16:07:01 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PR3PR04MB7212.eurprd04.prod.outlook.com (2603:10a6:102:8c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.25; Thu, 20 Jul
 2023 14:06:57 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6588.031; Thu, 20 Jul 2023
 14:06:57 +0000
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
X-Inumbo-ID: b20962ca-2706-11ee-b23a-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k37neeL/b2ADppTgg0yenLMeJZ/SE373fCDs9Op3FtpvB/jEf1pIIy6XKbuucfr+jjVWSHiWQ+zTqEXH7+VuldL3r6tGtvoxu4XBo3B96aNGIqh1JrgTrHzQ00S7NnHFyFSittzT4NEp5XFBirY6m7XQ2OFw4MwaUgdSU/INZIwgQVOnXQJLt2mRtMnuWAayMrIn/O5ixrD1aXJSMd4/L4xn0U+4Xcsj7SWFh9T8JcDiIztBFAoLXm0i9QITYjTb5UHhdpn7kolth9SVB8iJmMvoHfAbdGAhaxUahrD19vpz8FTYPWFnInq77HVe10tXSx6zEN0asdQmDwZ3nT6zQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXpx28HhuSXyy3ZIGUgg5vvDxd1cieZ6+priZYEauxM=;
 b=PtFN+1asFOA5jRoznJ2mf1VnRpcT//gacbVdGHVXeN++9vWPFlGUNCpX5Fi8tZqG1E36XMMInRaKeNS3PK9V/o+qioQ5Lccf3urPvU+Vohn36LL/HcuQjHcjgLzPhNprpaCTHY4NXR1MZKjv5GzhpV5J7Lg4jQvOiZWr+bCLPFbMGjzkjn3wdBtmZCIpGhRo5DuLuTAPOxr8nWGnjZTdDOypCAzI1gDqxVKXLSodBEhQWZOhKd5FxxwsprnB0YWUVIDbd0wjmPrv2IztfxbIDPhGvBGoU5m1R/iOdcvwK1MC38Gc6OMay9AtOp2qW1ygLQ/CGh6cdRWc99omweMCKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tXpx28HhuSXyy3ZIGUgg5vvDxd1cieZ6+priZYEauxM=;
 b=hx5h651LoLCfEKKBviBWT8mwDaqI6sLEWdyR3EDqP5d2TU2cA0+gByfIfu0mFddrWbRZQkEzfhODI00jLBRwl63g8emBLUIiK7VrnstV4tox085VWgoUrjisHXUYV5mttGSY3HiCIoU3bKSodOkKvHfVF3oy6afyg2XWLvAdRFBaw4areGxM96K1ZtP+GC1+xq6rztnYE70Dm9ewqGG40FlXJDMW6nFkFsL40sIvMJGURby243yWjnRCeAB5rgQ9yhCFGzXBrbxywjK0gp5cbIJu4l9BEegnDbtNYWRCXavlTR9yhcgJeqF5YVk26jKoxGGWs5kR/Okvwv+yvTcatw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <5fd13b50-5e9f-162f-0148-0697c6194a4e@suse.com>
Date: Thu, 20 Jul 2023 16:06:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/3] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1689604562.git.oleksii.kurochko@gmail.com>
 <8c69050d7b1f42df5e776ca9494164a4d15f2d52.1689604562.git.oleksii.kurochko@gmail.com>
 <ad53c037-3c1b-ff1a-93df-b79ab2948174@suse.com>
 <30540953fb363fce4dfd59f8a7e709247a9872fd.camel@gmail.com>
 <c1a3d447-4b4d-cd9f-642d-e30fed088302@suse.com>
 <0cbf6a69e8ae08f6b85edcc4f8d53a84e0103d8b.camel@gmail.com>
 <ad72e892-2ec0-5188-f3bc-6d33544c775a@suse.com>
 <fce99ab86730de77a82e60efc2c550a3f52a2443.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fce99ab86730de77a82e60efc2c550a3f52a2443.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0024.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PR3PR04MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: dd7c8546-e62a-43fe-9157-08db892a946e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hMZzbeJmhatPq6gOwysvjrPVF92SCmZHviiKd+ggMSG4lTFlxbwuE8N3+C3IwBkle7zLxgbB16Tu8toYIfewdbzgy1gCdz9k9la0hUZ/obkxlZoMkTsnXbJX0lz9Sj6QchM22qmah0SzA8utj3OOUhMu0VQ5XzQ/R2gKRRIHe0dJMACk1MGx79QUKHkOI3BaOU6Dek09toc1gkemnxbS321RavU/oVIhk+ElJj2kRCqrb68ixmIPx3wvvciZJuX1pG9GXY0f/Ntq/JNu1+nCBB+KFRZ+Qg7yYWsTNlQboUbsMnetkylHqRfdl9JmZQ4FESIif8qz3qa4VkH6Z1hBTrVvG87ZcwPWlQxWtsocDdl1TsNALyHxEyABIN5prya6+n0xZNGLSz3EPCT+aPTXbIgLJKDGainNlHymZAQ2YvnW2nJNhEUgDjsiCKMsy2U/6otbIl2mogj2RjGYhZrtZP5Ao8ZTMlWCr96bp5swdl+CWS2qXeZhcIwg3OEfrA7dv9XRCgmzg33Zkfu9M7rQXt8TwDJrWTjpuUGZmSbBVc61Av4jbtcb9Ha9nCg7fni0oxjOlHbDkq+l6wwXtaF/AQsepwxvWcV6GiSfFI0gmawZcxdw0XnzRaBwe9s949T6Y0S+AdsXCDXhiP769XL6Kg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(396003)(376002)(39860400002)(346002)(451199021)(31686004)(4326008)(6512007)(316002)(41300700001)(26005)(6506007)(186003)(53546011)(54906003)(5660300002)(6486002)(66556008)(66946007)(66476007)(8676002)(8936002)(6916009)(478600001)(2616005)(83380400001)(2906002)(38100700002)(86362001)(36756003)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eEVJbkd5cnU0TUxuUW5NNkM5Z3dEcjlMSVZoTFg5VGMvTHRFbk9MOVkxMHAw?=
 =?utf-8?B?N0RrRlprdDBzRHJDbVdrUDNraUpjOUJGS1FSbGgxVUkrT0E3WnRaWERWQWd2?=
 =?utf-8?B?NGxvMXVnYU9ZbWt5MlVvVCtCRmF3d3JYNjdueTVZNFpFRVVMN2U3MVpUTVZo?=
 =?utf-8?B?Y3ZFeDRZUXErZ1NIZmZ0ODBGdGFJMWRWQjE4NFprQUo0STRxeVhxQkM0dG8y?=
 =?utf-8?B?NTNzajBBV2ppRjZiZXRYdnAxWmx3ZE9POUJoUTBmTFphRnBIZWdGUWhqTDR0?=
 =?utf-8?B?RGtRTHZlcXlFMjJXZHk5L2wrN3FjbHV2UThjcTJDN1MrbmNXVGo3YjlGY0dr?=
 =?utf-8?B?VitaVVIyUmdTRS9TelE3ZGd1THB5YW5ObWJKWEdwbE51Y3BkcnJHU1JoSlVZ?=
 =?utf-8?B?UzROcnl0eCttbEFFR0FzL0tERFJQRjd0U2ZYL0R5ODY4cEVBc3RTcDRYMW14?=
 =?utf-8?B?L3ovZy9ZQTVWSFlzdlZuSnZpNUdaSUJRa2lSRXZGb2ZzTERTY3FDelJaM3U4?=
 =?utf-8?B?OUtYZkJsbG1aQnBOcVNXWXMrZnZ6WW1vRTRJb0pwdnZJcEw2WkthYTJEWEh4?=
 =?utf-8?B?RTM4R0lLMHRaemNtbGRpcjNkQVBwTjZBdXB5RnhIYVFEZXVBS3JoV00rNWs4?=
 =?utf-8?B?NnlyYzNLVCt4ZzRJMzRQSVZidXFTdXM1WWdrYjM4NVd2M0lXMm5yRWZvRlB2?=
 =?utf-8?B?b2FZdG50M1l5cFZMOEJheTZEK2FmbTYwWlhLc0IyVWNIQ2FlYk5WVkJGL0hR?=
 =?utf-8?B?aHJVSFRvVEtrbzNXV24zMGp0SStRb201TXo3L0ZhS2Yra2tPZWUrVEhud0Vq?=
 =?utf-8?B?QUliWnN0SkkzTkoyejlac0dONXFYNG9JU0ZDWGxKV0RRSVRncXRuYllyT3c1?=
 =?utf-8?B?MldET0pWYUlLTUgvUjR0OTRRVHd4TmQ4TktwYXdTVDg4ZklaTXM3OGpjSkto?=
 =?utf-8?B?a3hocEZPM2ZQVEtiM3UwQ01xdEM1YXcvSTBsakJJTWRsUEZMOWhEdHRTek9Y?=
 =?utf-8?B?TmZ2RFJIY2hybzhyeVJNbWQxazRWazZpOUt1Z3drU2ZvR29Ya1RHaFhDMGw3?=
 =?utf-8?B?YW8rS0FxbDV2THRMZUhCV3FmY052aEVia1l5VWZ0aXNJSE1PdW5xd0d6SE9v?=
 =?utf-8?B?NFdEaHVxczdadEUyUVBpTkE2YUJkNVRyeVRUNjRKb1R6RzBXUjU1aHY5ai9R?=
 =?utf-8?B?TTdVYjg3Um1IaGJXeDlyK3RkOVNxSXJncUc0UGdlV3FoaUtQTURmSVBnRDNr?=
 =?utf-8?B?aVBLZ2ZCbURTUGxqNitqdEhja2JzQmdPaGJMa2hmM0Y1WmFCczZKcUI2TUVI?=
 =?utf-8?B?T0xzTmZzMldlQ0hqcG1USTZvZTdHNnpTWnppS1M3QmZIRFFEeTNlMU4vcFR5?=
 =?utf-8?B?dENzT0dNRzIvREtqdE9wVk4yUnR3T1hwL1VKWFRIa1hORW5BNXZsWUREQUdD?=
 =?utf-8?B?RDI0TSt0RW9oOFNHZFhQWWd3Tjg5bzNJOE1wemVrSVlReFNpeVVqVmZRU2dx?=
 =?utf-8?B?cDY1QmVNdU5DcWo0RVM1ODBUSnYvMlNIUzh1eFdHZVE3clZVOW4zU3pSc0tL?=
 =?utf-8?B?a3FTTlNIczhWZE1XV3FnSEF1R21ad0hVUVl6d3ZrKzh4SVh4RXk5Y2ovaGVX?=
 =?utf-8?B?Rm9FL3IwWXV2WWhOU0ZoempvSndJN1J0VWhvS1NzVkZTVnBQdytpb3hRd3NY?=
 =?utf-8?B?bXN0MEpjbVJ5NGVuN3FNeGEweW04VStkN2ZSNHl2bjVXcGwra0o5aVJXMzk0?=
 =?utf-8?B?eloxOEU2TEFIdjNlemVwSE1zZHd5Y3RRNFkxa3JRd1huK1U3dmxpS3c0MEo2?=
 =?utf-8?B?cEJqcDBzeFVhK2lnTDgxa2hrNmx4YjVtdlM4c0g0bmlUakhENk56bE5xeTJQ?=
 =?utf-8?B?Nk1DT0ZHYlczSlhwdVRWMmF0L1UwbmFTYnljU1JYOXBJOFdJU2pUT2VzTFpB?=
 =?utf-8?B?MWYxM1RPZlE3RGRDV1FvQllwYmZNclRIa2hJVWh4eW5jNkYzTWNSV25JTnVj?=
 =?utf-8?B?OE5PcHcxTWxyZWlCTWJHaklCT0srR1hRYWtUdDJjTzk5RXpKT0h2eW1GVXVl?=
 =?utf-8?B?ajhzakxRcVd5RDJhT0xobFFBUzREV3IyQ1BibzhpNlluckY2UHd6U3Jwc1l2?=
 =?utf-8?Q?FlwkJ3haoTdp9ok+l5vqdqq9o?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd7c8546-e62a-43fe-9157-08db892a946e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 14:06:57.6843
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rhqcIW+sm8CbMPf1wxn8vvXy7bEw0Xb0rt9z6tVISMEO5pXqUwWEvZVnh1Aq1xqvD0BsJ02zrO8Si5YEchtRNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7212

On 20.07.2023 15:34, Oleksii wrote:
> On Thu, 2023-07-20 at 12:29 +0200, Jan Beulich wrote:
>> On 20.07.2023 10:28, Oleksii wrote:
>>> On Thu, 2023-07-20 at 07:58 +0200, Jan Beulich wrote:
>>>> On 19.07.2023 18:35, Oleksii wrote:
>>>>> Then we will have completely different L0 tables for identity
>>>>> mapping
>>>>> and not identity and the code above will be correct.
>>>>
>>>> As long as Xen won't grow beyond 2Mb total. Considering that at
>>>> some point you may want to use large page mappings for .text,
>>>> .data, and .rodata, that alone would grow Xen to 6 Mb (or really
>>>> 8,
>>>> assuming .init goes separate as well). That's leaving aside the
>>>> realistic option of the mere sum of all sections being larger
>>>> than
>>>> 2. That said, even Arm64 with ACPI is still quite a bit below
>>>> 2Mb.
>>>> x86 is nearing 2.5 though in even a somewhat limited config;
>>>> allyesconfig may well be beyond that already.
>>> I am missing something about Xen size. Lets assume that Xen will be
>>> mapped using only 4k pagees ( like it is done now ). Then if Xen
>>> will
>>> be more then 2Mb then only what will be changed is a number of page
>>> tables so it is only question of changing of PGTBL_INITIAL_COUNT (
>>> in
>>> case of RISC-V).
>>
>> And the way you do the tearing down of the transient 1:1 mapping.
> It looks like removing 1:1 mapping will be the same.
> 
> Let's assume that the size of Xen is 4 MB and that load and linker
> ranges don't overlap ( load and linker start address are 2Mb aligned ),
> and the difference between them isn't bigger than 1 GB. Then one L2
> page table, one L1 page table and two L0 page tables for identity
> mapping, and two L0 page tables for non-identity mapping are needed.
> Then at L1, we will have different indexes for load_start and
> linker_start. So what will be needed is to clean two L1 page table
> entries started from some index.
> 
> The only issue I see now is that it won't work in case if identity
> mapping crosses a 1 Gb boundary. Then for identity mapping, it will be
> needed two L1 page tables, and only one of them identity mapping will
> be removed.
> 
> Do I miss anything else?

Looks correct to me.

> Wouldn't it be better to take into account that now?

Sure, it's generally better to avoid leaving traps for someone to
fall into later.

Jan

