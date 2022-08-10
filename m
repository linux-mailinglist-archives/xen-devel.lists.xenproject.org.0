Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4031758F09C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Aug 2022 18:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.383729.618909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLooZ-0006th-OK; Wed, 10 Aug 2022 16:44:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 383729.618909; Wed, 10 Aug 2022 16:44:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oLooZ-0006qg-Ky; Wed, 10 Aug 2022 16:44:15 +0000
Received: by outflank-mailman (input) for mailman id 383729;
 Wed, 10 Aug 2022 16:44:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0+s=YO=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1oLooX-0006qZ-Jz
 for xen-devel@lists.xenproject.org; Wed, 10 Aug 2022 16:44:13 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2052.outbound.protection.outlook.com [40.107.220.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7b85ef4-18cb-11ed-924f-1f966e50362f;
 Wed, 10 Aug 2022 18:44:10 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY4PR12MB1512.namprd12.prod.outlook.com (2603:10b6:910:3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.16; Wed, 10 Aug
 2022 16:44:06 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::84ed:932e:f39d:54c7]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::84ed:932e:f39d:54c7%7]) with mapi id 15.20.5504.020; Wed, 10 Aug 2022
 16:44:06 +0000
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
X-Inumbo-ID: a7b85ef4-18cb-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FslCcDXOTvkefU6afIs5W6E2fyB6vDYdHFF2NHjTJ7MKsoE6hA0wvE7rK5dHmUAadXWx+0jJPXWPFw+3Hp0cAfQDrqRqalguYVRp3GF1x7zXi3nMVU2MnbMw2oxeugpsSoDE3z6+GxQk6rG/Ruw8wRs6zJtE+aGj+I6a3ENwbM9e5u0j4KhMqk3Mt2Y7U+o5uzP6sMXwQAjNDCbQVXpmoeil3SH3hWN9iR1e8fYNLGfuLynCiZ2couns+vdwxReY8rF08a4ipxmFCcGKl0/76pBhKhjQZgeKush0DUI3/DzPIAIo+KQAp3oRujeKoLTJ34TTk4F9sfjkO+QQNBoSjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6SssnIpM48YIUE2OLtl1iBnPsDbowaRmdHSF6rIkGUM=;
 b=VFNxO5Vc2g40rDVQsR0IL27fOOVsF42NQCdHaJnBnbhp9OB1jXKOUHtW5q09jt/wkM4X8WnMUmFL5O8WsmoDrcQQKZdKKo8JJsBuUKUVaf7qwZNtNxmheoHyNOMQcpNH+Tbjpnjvja1S3dPSuwnv84ZR6U1bk17ZibhEv1Lwr1EkS0Rbk5SbBY0rzLFjxBP1aRgOtjGUPa4Yol4AIvCeEb4w5GRNzmSJ/l4dWj9MSpUC6ZfFXgjbNXy/QB1TR2NNusm5TPgip2pci7CsqP7TGOgK/jzLRMGJTUZhLUc7mz6V85iP2wOotlTh5D7yULIAnoo1zx9/12WSjoF1KgbyTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6SssnIpM48YIUE2OLtl1iBnPsDbowaRmdHSF6rIkGUM=;
 b=AyVb84n9wOag6Arxx8skeovijZNsHY75RZuJl1QGtVPfe1OdMM+hEqd0AaD9bD9XX6csZ8AzkUTykeR9AKV3DZnpEna6VZ2alHKNACtwtDJ9jBTX1rch3a3otJcKgHm1wYb85nrgmAvHYNcgh0JPLPp0jc+QKqKQTgAbrwIdi+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <5548c76c-cf75-05fa-2f20-256e210afd32@amd.com>
Date: Wed, 10 Aug 2022 17:44:00 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [XEN v1] xen: arm: Check if timer is enabled for timer irq
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@amd.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com
References: <20220810105822.18404-1-ayankuma@amd.com>
 <6cfcd4fa-3afd-1c70-6a70-9df557ee1811@xen.org>
 <f10e92ea-ac57-18a9-8843-781d3242f67d@amd.com>
 <28d85fd0-0e61-7e45-34c5-91ba746561ce@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <28d85fd0-0e61-7e45-34c5-91ba746561ce@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0105.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c3::7) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cdecddd-da3a-4d87-ba28-08da7aef8a45
X-MS-TrafficTypeDiagnostic: CY4PR12MB1512:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aMs54cQ+M9EvqXO9ONcz2VPziuZxyLhpRwlME2Bp3Cfvx10U8+AHkGHyMz+02Mb2Rv5um1p+c/tPw/AAWJ27upH6V95Gw8N2zYjlESUyKgw1kdjNhAvBdAB0Z4pGLTIdwK+zXUljJ2WdTIz8uFMUR3RrLqNdrfSM6uT9T0U61Gv2krahOtnY9m/qKyeR7oCU1mHXBUMoroMl0L6ch8mkVt0yHHY4FUFbbTtrg56v4ZzMfMllmaCMwySqG2qQ849ujcPMIFV69f4V3a7xTF6iKxH8O1wmatSlWXJGVe3853l4YTPEQ3SciyReVq+dNDuRMscpagQSYzRbwKbuMMpoZwumiTCIvfgNPKunC7fqHnWgQH5Ysql6hEVbZILCPtcxQdt2mrBvcBNOwASxW9cYE9PgLB0dKUudvdJdUUjY1jDHiHfpCEkiGj67fgRrV7dC5VLeQfoNnnIFSCcrt34Wv5tvruyMjufWtDOQJlAghxoGqtCOJHVaAY/O2F8I5JkDZRzXxJH6BC3977koO/GzyvaPijSnrM2LdMgHCd/tsIWPI78ugv5f8PJqjhzxUdjsg9DCyGNmVuITIssjL8DJLDxTav8ZRtjTZ+UHNZt33VXY/+yJwe6azAkgL8tYD4DsiEBjRu07fTPyBXBLahRtJsChqDBJnsj56o7qqTr7QJN2PFDMTsjtGmokYx/JaogBvnVj98TzpjYNer7Lg8OTv7+nA5M/u+8BMO1jY01oCykEFORfx7tM5BDgMY+/WCuLkt6T/xjxByfdlKNrlNNvTHTMHztA3XiUwKXo9FszdOYb2NqRKK1a55Eb0QRt4tfnngYDFUfLzldMFa5ccxR7XBg7m88efqIgLbGPBlXX5bU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(8676002)(26005)(41300700001)(5660300002)(2616005)(316002)(186003)(478600001)(66476007)(6666004)(36756003)(31686004)(4326008)(31696002)(6512007)(8936002)(6506007)(53546011)(66946007)(66556008)(38100700002)(2906002)(966005)(83380400001)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzRVNTFicEo3QjFwNDh1bHlENXV3Smkzcmo1ZGNZS20vYnRBWGkyVmNscEo5?=
 =?utf-8?B?cWxGUkE3N093c1FzTlRaUnBLQU5XYkg0cnBVSzRUTVRGblRPNXVSMEdpUHFL?=
 =?utf-8?B?T3pla0VxbUNyWHRFREliVWpEOGRkbzJvRU90ZjF0YTdkTW5mOGhTUXBWNGF1?=
 =?utf-8?B?VHI0S3BDN1dIUE5rQWZQMzJyUVhiRE95d0ZKU2lCRytoNXM4UnZaV0lhb240?=
 =?utf-8?B?K0p3VHJrRURTUmozazF4MFNQYVN4eFFIVkNHa3dFOTRITEU3NmR1WFpRN3Js?=
 =?utf-8?B?OWhxbHpxYjlVUkNzUHp0Y3dndHNNN25TM2RPZXBscUUxT2lzaGdiUS9xRHJ1?=
 =?utf-8?B?a3RZYVBFUURSZGNNUlNsZFUyK3ZuUXNZWGZrSnRTQ1lLeXNrME55Vmptc2E2?=
 =?utf-8?B?STRzcVlKd2JFbFExN3hsbFpHSEFXa3pDV1dSdFJJMmw0aXJzNUd4UGFvVitM?=
 =?utf-8?B?S0RUdTdRbk5mcjlHZlovR3hMN0dCYmZocWVHeTUvU25TMmxjdDhuV0JpaXlW?=
 =?utf-8?B?ZTBMMSs5NThNVmlPTGRXeHBNREViaDl5cThkbU8xUUpRSTlIQXZna2NJOW9U?=
 =?utf-8?B?a1pRcXhWbm5YSDZHUVhXKytNVngxbm9PZnFodFgreHNqYnE1Nks0ckg5R0Fl?=
 =?utf-8?B?WjNIdkljdUdTQ0NtcDFJcmtRc1FScVJEdjlEbDZiTFhId2xJZDBlUS9YbHRW?=
 =?utf-8?B?K043WGlDci9TS0FtTFF6RmhPMGRxYVRFZE00Z3ViQ2NlTENVVW04UHhnSWhU?=
 =?utf-8?B?bWNxNTFLOVJIR293ZElWL3FuZy9RdWcvQnBuWnZ0VHBEakd3TEFJMDZCUHps?=
 =?utf-8?B?MjRCeXVSZ2VLcUtXVi8xa2ppUnE3aDQyTUpYbXc1cVNvaXFOTlQ2UEhsV3po?=
 =?utf-8?B?S2phaXV4MXgxSUo4NnpjbTYyYUtpdE8xNm1OZ0lidUpCZ0MxekZFWGZJYU9J?=
 =?utf-8?B?bGMweU1EUHJsTkc1bDY4b1Fsc2xoZUdUM1JjZTAvRS90UzV0UTBJK0NEQVR1?=
 =?utf-8?B?M2o1NmcvcTkrRWVmUmRPUElKK2toL2gzTGY1dFVZNlBTa3F1OHlTOU5RU3p0?=
 =?utf-8?B?MXhzQ0MvdWpwTXRxbUFLUlNlWGhpNmV6NnFpYTZXY0xPcStxVTRHZnVMeUFQ?=
 =?utf-8?B?dk1IdHRDYThOWC8xc2VqOHJRRkN0cDFFY09vWjNGOFE0anBYdHRIdlYxUi8y?=
 =?utf-8?B?aHJqZmdyWjY5eWNqemVPelhISWFvemgram9KamwvUWlGd0ZBMDdXRTd3UGlw?=
 =?utf-8?B?elNpYUJiUFNpWmZ0dzBBbXA3ZXZvZUZ5ZkYvbWxuMUNucHMyVnZEek5OTk8x?=
 =?utf-8?B?cnBSTEsxYzJaZWU1SVVIOU9mNlFtL3BUTmhyYjU0bWdrekhYMGlzLzlwUmJs?=
 =?utf-8?B?dmRpa1Frc1RCZzBRTjUyTWRWdUFMM05TUWFPbWl4Y1F0TU40VUw4NHdVTml3?=
 =?utf-8?B?ZHMyVFZNSngrcjZtUVFZb2xlU0QrY2VQcUZHdGl6U3pQOFRDYStHckpmY1JO?=
 =?utf-8?B?aEdzT2FsbytYM2VHeTZvRHg2QXppaEt3bWFXa21ZQlFXMGZ1b25wSnhUMm5U?=
 =?utf-8?B?TmxLOUdDYit5UktZaVg4ZVZrL2c2V0l2aTZyUzc4L3NoYXo3ekRZK0gzVEZa?=
 =?utf-8?B?T3JvZ2x4QWNoWUQ3NEZtR1ZBaHlqV25TYVB3dE5xbDRkNU5WMm0yMmVYYlZl?=
 =?utf-8?B?NSs1TC8yRTRvU1k1T0FMeU55ZTU3Q2tBWmJ4SWoxSTZySUxObE91RmxYemc1?=
 =?utf-8?B?K1JkbVZGVTRhSzhDVzYvbUx1N2g2b3AzM2VIQjE0SDM2UEFCUDB0WWUwNEN6?=
 =?utf-8?B?REJnd3hNdWFpNE41NUgzWEtrYTdESTZ2VFJKbURUb0ZTYjZRZjUzMENEUHFK?=
 =?utf-8?B?ank0dmZjNG9iQmtSLzZxYkhuQTAvd3V6MzFITDBhOWc1bWgyNlFEdmdsVmI1?=
 =?utf-8?B?TE40cHF6MHVzQk44ZHFZNDhvT3pqQ2pvbkJ5Mkp0Zk5DOWMza2VwK045ME1B?=
 =?utf-8?B?QzlCL25ONTZRY2hNOC9qS1d6MVErZmdmSk14b1lMRWRZS3Z1eS9rbEJmMkVL?=
 =?utf-8?B?dnRKb0swcWRUWW8vWUhTNnVzbGF2Z09pc0xmSzFGK3cydytReEtRN3lsWm9a?=
 =?utf-8?Q?QN3ndSIlnSODpw4BZ9MyOf8lm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cdecddd-da3a-4d87-ba28-08da7aef8a45
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2022 16:44:06.4287
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1xmVU7k0yotLCQ00v5mane4rnl9LQQ0lff6exKVlvZhiKtINhZXpPlLXbMG4c9oqvwy+lnhOax4xmlroQ0kXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1512


On 10/08/2022 15:51, Julien Grall wrote:
> Hi Ayan,
Hi Julien,
>
> On 10/08/2022 15:00, Ayan Kumar Halder wrote:
>> On 10/08/2022 14:34, Julien Grall wrote:
>>> On 10/08/2022 11:58, Ayan Kumar Halder wrote:
>>>> Refer "Arm Architecture Registers DDI 0595", AArch32 system registers,
>>> Checking the 'enable' is not going to add too much overhead. So I am 
>>> fine if this is added. That said, would you be able to provide more 
>>> details on how this was spotted?
>>
>> This was spotted while debugging an unrelated problem while porting 
>> Xen on R52. For a different reason, I was not able to get context 
>> switch to work correctly.
>>
>> When I was scrutinizing the timer_interrupt() with the documentation, 
>> I found that we are not checking ENABLE.
>>
>> Although the code works fine today (on aarch32 or aarch64), I thought 
>> it is better to add the check for the sake of compliance with the 
>> documentation.
>
> Thanks for the clarification. I am quite curious to know why you think 
> our code is not compliant.
>
> As I wrote before, when ENABLE is cleared, you should never have an 
> interrupt because the timer interrupt is level. So I believe our code 
> is compliant with the Arm Arm.
>
> The only reason I am OK with checking ENABLE is because the overhead 
> is limited. If this wasn't the case, then I think I would have wanted 
> clear justification in the commit message *why* this is not compliant.

Sorry, I think I misunderstood this part of the documentation

"When the value of the ENABLE bit is 1, ISTATUS indicates whether the 
timer condition is met."

I understood this as "ENABLE" need to be checked before "ISTATUS" is 
checked.

- Ayan

>
> FWIW, Linux seems to use the same approach as us (see [1]). So, if you 
> think this is not compliant, then maybe this is something you also 
> want to consider to fix there?
>
> Cheers,
>
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/clocksource/arm_arch_timer.c#n644
>

