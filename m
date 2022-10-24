Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B64FA60A828
	for <lists+xen-devel@lfdr.de>; Mon, 24 Oct 2022 15:02:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.429107.679935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omx5P-0003O5-49; Mon, 24 Oct 2022 13:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 429107.679935; Mon, 24 Oct 2022 13:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omx5P-0003LJ-01; Mon, 24 Oct 2022 13:01:47 +0000
Received: by outflank-mailman (input) for mailman id 429107;
 Mon, 24 Oct 2022 13:01:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZViS=2Z=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1omx5N-0003LD-8G
 for xen-devel@lists.xenproject.org; Mon, 24 Oct 2022 13:01:45 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2046.outbound.protection.outlook.com [40.107.102.46])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 018512d4-539c-11ed-91b5-6bf2151ebd3b;
 Mon, 24 Oct 2022 15:01:43 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by DM6PR12MB4861.namprd12.prod.outlook.com (2603:10b6:5:1bd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.25; Mon, 24 Oct
 2022 13:01:39 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::901f:4652:83f:c3c2%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 13:01:39 +0000
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
X-Inumbo-ID: 018512d4-539c-11ed-91b5-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AhO2evAsDXrD1fO/sq3QQRjYmR7NfAe9bGuZsNY2FHtIADsVA51JN+vwYxygd9Ko8FRZUtzc+/+HoIijbkNsKZ5jbV2cF0uugLtiA4zuOcHFF6Em0Qm4nEHtRv02zAraeApXYJA8vcO/8jJZMCLfd0do3cQ0hdA2M4kDsFlmG7G5hBGoTQhmop6zs4zwHlnUR7nI6J7bBzovagcK2erujHHA0h+WMT+hTdhplq6JmycLgQlV7gbSuMupWnE7A/O/CDEyyo8E3myAYJncczE5l75dS9hb23njzM74ZVRVfv9S7wBOJmF30v9k1XHFADibdwrNx35lF8bsPiZthRWQNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5C0oVIfsrAO3fcfHdXqKiEqM1E5j+OU0Oi3+W3RM3Pg=;
 b=IFdYHqKm1UnJR7SRMekCwidNmMCZF6CHInUZdPI74GufGynr7/QvoPPjLfQI3dewiC+kASverC2QrlEhpuKp9lsRDsHGmWddNFm3UyeEgCSDEQeH2GM8qTDjmW9kWdL5w+0cvcoVan4WZjcwPQt3kveY01ohb3+Ms8Jm0XMTKfUpDr2y7y5mFg0A44uS4pajzHAlxTVAJb+g8SHkqwop8zsOD4fpmcOuJIJ58K7ZzCxXgVJdic25FM5Z7nPcEzncBViSVmTBLXOva7PC7UJjCP0mN/3JlXrgZlp/JlNL5WiX88thWkJ0SXmtoyyT53CDWLLdKd/l/syypogd6a1hUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5C0oVIfsrAO3fcfHdXqKiEqM1E5j+OU0Oi3+W3RM3Pg=;
 b=b0jdF6wJ0AD3FYv4rsTn59n/HwdNdLOb/pAA1KQVYAuAyMC8MLIkG+utKn8uiRCSwlvpgHxj/p0JozYRJdq7zXXi6ywHoOL7Ocbf+IWfqwJUmFe9Efy0LjWGOxV3/7JrUMKIpuNYTc4OprZC5nNR/qO32ztlcC3EI1cMm4QzGW8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <76f1b4fc-90bd-f55f-5624-f5d011bdaa9f@amd.com>
Date: Mon, 24 Oct 2022 14:01:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [RFC PATCH v1 02/12] Arm: GICv3: Move the macros to compute the
 affnity level to arm64/arm32
To: Xenia Ragiadakou <burzalodowa@gmail.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefanos@xilinx.com, julien@xen.org,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com
References: <20221021153128.44226-1-ayankuma@amd.com>
 <20221021153128.44226-3-ayankuma@amd.com>
 <cb67c768-1a05-e5d5-efed-9a282c6a8c2a@gmail.com>
 <e0183387-8556-5fcc-2f18-003832d5cd70@amd.com>
 <78306c56-7cdd-a705-f8af-0cae4e359336@gmail.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <78306c56-7cdd-a705-f8af-0cae4e359336@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0437.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a9::10) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|DM6PR12MB4861:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d2e5bd3-31d4-4224-0b2d-08dab5bfe3de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cUTBDiE0800y5MtTtONZat2q0G3fuhoro5P1iqVMCWaw8hwkIaXEI7TuOH4KmN5I+aErPdzB8UGPy2ZkqIAcvAxQJKtvUzVzn3do4LB2eEY2NTerUULO5UVzhqqo9C/fcu1lLT+A/ymP7TEWBQ0TIpVmEH8YIjDO6EADGKZi+vV840ecn4Qdb+9LC3kQBdNxXaIkQ0+PYFYQkNHB6ZG8iC86j+9zAzYrrXJ4pKofTGgiuokDwV+b10GQftWOquH+hIDJqwQlZOsyG7hkhNsj6fd/p2JudTFYTH+u9TX8240BVPNJJdoRaW1VhOyfa+PZHvnFBpinlWDL+TRhb4z9TiX/hr+bHSWcAU09ZPmTurrCFGF1OjHOJTF9IY+/FqNZ/qeOiGwtCehUYNsl/oX3Zbs/EQLYiOxPDl4hqt/D95R9gb0Z7h31tmROL+O5I/M9gwBiA+odFgORWzZQLI7Znj2JX7vL0268tdJCCWtQ4Da/qugVsYXnkYDqujw017fa2wgowZAbZbX45oxe+/3yapTNlkV4nXWwC+sXqjK4k6xgZdaUBAUsVfcODg5SFeNLT7JUwbiw5X5XcdkwT6G2clcWPlTLpTcoCDBdpEYCV+vJaAZh6v/Snid78RZA/EBKkPpdTVLBKKLZ3nRnP4KyKMZikz40Kb8+UGFufAK6tpJeiarZlhvcfUAkdo2nGNe/vh/xbeTBIHK8ZBzXz7O0sTaWtQUS/6a7UdO1URk8E0lQvNyYhz1LK/47ynOC81ggPHb4Em1uT0LVznhZpsAfy7XX9sHN9bKjmiUKPA//LjBMfIkJgDeZkYBJpmpCuKn27Ez2or5dfFseVLlzglwcrKYWyrzODSlGHzic6vzSiuE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(451199015)(2616005)(2906002)(36756003)(316002)(41300700001)(6506007)(6666004)(8936002)(31696002)(66476007)(66556008)(966005)(31686004)(6486002)(5660300002)(8676002)(4326008)(53546011)(26005)(478600001)(38100700002)(186003)(6512007)(83380400001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VU9wVVZKRS9rV3dQS29LR1F6YUhoVi8yWnZkOXhHWm1TZXV3dmpmNmhmZXdU?=
 =?utf-8?B?UmVYZGk2NXQvaW9LUzBudXFGMzd2VjBKTEViMS9ZcUwvTTBMdk50eW50Z0ZQ?=
 =?utf-8?B?L2x4RDdCY3VWMS84c1pML3ZpNVlDMHFTZk9QNmZaVFUvTWQ1K3hBM0piUktK?=
 =?utf-8?B?SWoveEJ0cEJ0TG1zek5LK2JVOVFPaThHL2pHSXdYaFQ1NVVGRjlMRkJtalhX?=
 =?utf-8?B?Zk9KOTRzMkloUlRrQ3BIYWYzalV6SWRKRnNpUmlGdmlhTU5XYWwrRytEb1Vz?=
 =?utf-8?B?VklhOFhSYTZ6RE1pREdXeHkvMFpwQzcwMVZwSHQyb2x0WTV0cUJWNkh0Q3lG?=
 =?utf-8?B?aDNsOWNkNjFMTTVRa0tMYkpyQ1I4ck9xdE9uaWhWWVgwT0hKQ04wbGwrMGUy?=
 =?utf-8?B?aGJWNXJ4MG9adlFidzYzWDBOVFM5aXVFVlFQdGgrVnA3cDRPb0FTNHVVMGtt?=
 =?utf-8?B?cFJ1YkErQTdGdjYyVkFoWlorcCt2c3V5TzAySDBwd2IySW1kZWY3VHVlM1No?=
 =?utf-8?B?TG1PcUdvNFN1SVBLdVp2VUtPc0NLb1ZxYVJCVmJqTnhFTXV1NG1MSjlaTHdu?=
 =?utf-8?B?aHk5TTBXajZrS043OUF4QnlOUUFtRzlyVm13NjVQL2hpdlA2bzBTQTdKTm5Y?=
 =?utf-8?B?KzN2MlFDeU43TDBWaXNIZ2xsejhkWW9LbSt0UzBEYUt1clJ5c2ozZ3E3L3Z3?=
 =?utf-8?B?MTJXS3VhelZHZ3ZTOG5VVUFRWTREai9hcWZFN1BrL0N5MkhoMFJLZGsvanc5?=
 =?utf-8?B?NlF5c2ZhdktiT0ZjUkVSalo5NFVYanlOVzdaRmxMUU9WODl2MWs5TXhyWGdw?=
 =?utf-8?B?TndTWVBkajAyWHNnZ2hySHg4RVlQdGdpMGZBZUtBR2kzS3Bmb0l3RHpncmFM?=
 =?utf-8?B?MXRsMm0wQWxqQ1lnbm1WUjg0NGYwanFlTkV3eXNGbFJFbTZNcklBSUJqS055?=
 =?utf-8?B?Z2ovWTQrM2lkd0R6SHhWNGVQc3o1UTFDOTJWN1ZUU2lyRkVvNjJZYWpYTFlM?=
 =?utf-8?B?YngyMVkzeVpqRmtCNnMwN21QR2JaMUUzTVd6ZFcycFZJNExRR2FtWTFzSm8v?=
 =?utf-8?B?RGpsdk9QTlRQbXlrSlJ2SWdwNnRZUzl2clVTeThWTGQxSVRTZDVzY0NpVXk1?=
 =?utf-8?B?eDl5TUNtbDMwVWZmVWZKU3FDc3FBNWczWDNOYnBVQ1Z0OUxtM2xpb08wRUwv?=
 =?utf-8?B?dElKbFJnYkxtVmcwQ3NNakxRVXJWZ3VLRlBrNjNSVTN4VlZlc2pPZ1RET2FN?=
 =?utf-8?B?bGNqMnljNHZYbnMyMmNpMEQ2OVZhTEZuTERMZUNDZ3ppaGVpS1RVbkxTenJn?=
 =?utf-8?B?WDlhanZjSjZQYmh2dTliQ0ZCWnBFNHBpaTNwYkY4SUlLRXE0Y1pjMWx4Uys1?=
 =?utf-8?B?c2VKNmlEZm5PSDRvZlN3N2FXWnhYWjR2Vkp6a0VlNE9DNHR6bEVSMHdNcHlP?=
 =?utf-8?B?R00vSmw5UHNKS0VMS1FWaHNCSjYxV2w3Qm1Zc2YvTi80RUtXTnpGbHRlcFV6?=
 =?utf-8?B?cG5tc3l3dE9RRzgrSHVMZnRaOWJxR3h1YWtLZm80SVcxR1V5VWwrUUZ1VXp2?=
 =?utf-8?B?RVZKZDlac3k2dE9KRzRWK0h2S3F6eHp4eTFrSUFZcE1zM0lybG9XT0x0TEpq?=
 =?utf-8?B?RHhZTzhxQm5hZnRFQnNHN0lEU1hEY0Y5TzdlM28zYzEwWjBkTDVMTVRlaThC?=
 =?utf-8?B?REpYWi9sYks5K1VjTUV6RkVPbHJaZmtzbHZLTGVHaXdDT0dnZDl5bnBJVFVU?=
 =?utf-8?B?R1RRcWVPWFJBM0lCK2hmc2VMbU0rR01xN0FWbzdpODlTSzZDU3ZlYUo0SkFD?=
 =?utf-8?B?WHA3ZFhiNktuK1BoeVlrWFdIdG41R1hSRHZIalF5QW5RWWJjZFhLK1RNN1Ax?=
 =?utf-8?B?S1RSR2hoekdnSEN2a0ZYVTAxK2k0a09VaGpwTTlrdkRKRVRsdnRqL2dDLzZz?=
 =?utf-8?B?RG1xYmxpR0p2RFBNS2N6ZzZRYkpwUUpqcjNKL0Z5bXkyVGRKSGMrY1lOUW5T?=
 =?utf-8?B?SHcvRDBqeFZwZmd6ZzR3RDFQRE9QSXB0MUlFd1JsSDRWU3BvMFdCcWhwbTNP?=
 =?utf-8?B?WTJyeGw1QVl0WlRGdk9ZckYwVzdzN3RIVUVNU0xVTTdlYnI4RG9FVnVNbU1S?=
 =?utf-8?Q?vkyU2R/Q+UdZE4HoHP75TpUYU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d2e5bd3-31d4-4224-0b2d-08dab5bfe3de
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 13:01:39.5050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKa0li4QqAOXZq4VKyIlN/KDij8gNAHus+vlPYlkf0xitQlBGcnuhJJYQwgvSfZ9M6fVMpJdHS+RAhDgDWdzXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4861


On 24/10/2022 12:35, Xenia Ragiadakou wrote:
> Hi Ayan,
Hi Xenia,
>
> On 10/24/22 14:00, Ayan Kumar Halder wrote:
>>
>> On 21/10/2022 22:18, Xenia Ragiadakou wrote:
>>> On 10/21/22 18:31, Ayan Kumar Halder wrote:
>>> Hi Ayan
>> Hi Xenia,
>>>
>>>> Refer https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm64/ \
>>>> include/asm/cputype.h#L14 , these macros are specific for arm64.
>>>>
>>>> When one computes MPIDR_LEVEL_SHIFT(3), it crosses the width of a 32
>>>> bit register.
>>>>
>>>> Refer 
>>>> https://elixir.bootlin.com/linux/v6.1-rc1/source/arch/arm/include/ \
>>>> asm/cputype.h#L54  , these macros are specific for arm32.
>>>>
>>>> Signed-off-by: Ayan Kumar Halder <ayankuma@amd.com>
>>>> ---
>>>>   xen/arch/arm/include/asm/arm32/processor.h | 10 ++++++++++
>>>>   xen/arch/arm/include/asm/arm64/processor.h | 13 +++++++++++++
>>>>   xen/arch/arm/include/asm/processor.h       | 14 --------------
>>>>   3 files changed, 23 insertions(+), 14 deletions(-)
>>>>
>>>> diff --git a/xen/arch/arm/include/asm/arm32/processor.h 
>>>> b/xen/arch/arm/include/asm/arm32/processor.h
>>>> index 4e679f3273..3e03ce78dc 100644
>>>> --- a/xen/arch/arm/include/asm/arm32/processor.h
>>>> +++ b/xen/arch/arm/include/asm/arm32/processor.h
>>>> @@ -56,6 +56,16 @@ struct cpu_user_regs
>>>>       uint32_t pad1; /* Doubleword-align the user half of the frame */
>>>>   };
>>>>   +/*
>>>> + * Macros to extract affinity level. Picked from kernel
>>>> + */
>>>> +
>>>> +#define MPIDR_LEVEL_MASK ((1 << MPIDR_LEVEL_BITS) - 1)
>>>> +#define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * level)
>>>> +
>>>> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>>> +    ((mpidr >> (MPIDR_LEVEL_BITS * level)) & MPIDR_LEVEL_MASK)
>>>> +
>
> Above, since
> #define MPIDR_LEVEL_SHIFT(level) (MPIDR_LEVEL_BITS * level)
> you can replace (MPIDR_LEVEL_BITS * level) with 
> MPIDR_LEVEL_SHIFT(level) in the definition of MPIDR_AFFINITY_LEVEL.
> You will see that it is identical to the arm64 definition
> #define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)

Currently, MPIDR_AFFINITY_LEVEL(mpidr, 3) differs between arm32 and arm64:-

In arm32 :- (mpidr >> 24) & 0xff

In arm64 :- (mpidr >> 32) & 0xff

I think this is what is expected. See xen/arch/arm/gic-v3.c ,

static inline uint64_t gicv3_mpidr_to_affinity(int cpu)
{
      uint64_t mpidr = cpu_logical_map(cpu);
      return (MPIDR_AFFINITY_LEVEL(mpidr, 3) << 32 |
              MPIDR_AFFINITY_LEVEL(mpidr, 2) << 16 |
              MPIDR_AFFINITY_LEVEL(mpidr, 1) << 8  |
              MPIDR_AFFINITY_LEVEL(mpidr, 0));
}

>
>>>>   #endif
>>>>     #endif /* __ASM_ARM_ARM32_PROCESSOR_H */
>>>> diff --git a/xen/arch/arm/include/asm/arm64/processor.h 
>>>> b/xen/arch/arm/include/asm/arm64/processor.h
>>>> index c749f80ad9..c026334eec 100644
>>>> --- a/xen/arch/arm/include/asm/arm64/processor.h
>>>> +++ b/xen/arch/arm/include/asm/arm64/processor.h
>>>> @@ -84,6 +84,19 @@ struct cpu_user_regs
>>>>       uint64_t sp_el1, elr_el1;
>>>>   };
>>>>   +/*
>>>> + * Macros to extract affinity level. picked from kernel
>>>> + */
>>>> +
>>>> +#define MPIDR_LEVEL_BITS_SHIFT  3
>>>> +#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>>>> +
>>>> +#define MPIDR_LEVEL_SHIFT(level) \
>>>> +         (((1 << level) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>>> +
>>>> +#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>>> +         ((mpidr >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>>>> +
>>>>   #undef __DECL_REG
>>>>     #endif /* __ASSEMBLY__ */
>>>> diff --git a/xen/arch/arm/include/asm/processor.h 
>>>> b/xen/arch/arm/include/asm/processor.h
>>>> index 1dd81d7d52..7d90c3b5f2 100644
>>>> --- a/xen/arch/arm/include/asm/processor.h
>>>> +++ b/xen/arch/arm/include/asm/processor.h
>>>> @@ -118,20 +118,6 @@
>>>>   #define MPIDR_INVALID       (~MPIDR_HWID_MASK)
>>>>   #define MPIDR_LEVEL_BITS    (8)
>>>>   -
>>>> -/*
>>>> - * Macros to extract affinity level. picked from kernel
>>>> - */
>>>> -
>>>> -#define MPIDR_LEVEL_BITS_SHIFT  3
>>>> -#define MPIDR_LEVEL_MASK        ((1 << MPIDR_LEVEL_BITS) - 1)
>>>> -
>>>> -#define MPIDR_LEVEL_SHIFT(level) \
>>>> -         (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>>> -
>>>> -#define MPIDR_AFFINITY_LEVEL(mpidr, level) \
>>>> -         (((mpidr) >> MPIDR_LEVEL_SHIFT(level)) & MPIDR_LEVEL_MASK)
>>>> -
>>>>   #define AFFINITY_MASK(level)    ~((_AC(0x1,UL) << 
>>>> MPIDR_LEVEL_SHIFT(level)) - 1)
>>>>     /* TTBCR Translation Table Base Control Register */
>>>
>>> Since only the definition of the MPIDR_AFFINITY_LEVEL() differs, 
>>> maybe you could add only this one to the arch specific headers e.g
>>> for arm64:
>>> #define MPIDR_LEVEL_SHIFT(level) \
>>>     (((1 << (level)) >> 1) << MPIDR_LEVEL_BITS_SHIFT)
>>> for arm32:
>>> #define MPIDR_LEVEL_SHIFT(level) \
>>>     ((level) << MPIDR_LEVEL_BITS_SHIFT)
>>
>> Also, MPIDR_AFFINITY_LEVEL needs to be defined in arch specific 
>> headers as it differs between arm32 and arm64.
>
> As I point out above, there is no difference between arm32 and arm64 
> regarding the definition of MPIDR_AFFINITY_LEVEL(level).

Please see above and let me know if it makes sense.

- Ayan

>
>>
>> However, MPIDR_LEVEL_MASK can be defined in the common header (as it 
>> is same for arm32 and arm64).
>>
>> Please let me know if it makes sense.
>>
>>>
>>> But in any case don't forget to add parentheses around the macro 
>>> parameters when an operator acts on them to avoid trouble with 
>>> operator precedence (MISRA-C Rule 20.7 :))
>>
>> Thanks for pointing it out. Yes, this is a mistake in my patches.
>>
>> - Ayan
>>
>

