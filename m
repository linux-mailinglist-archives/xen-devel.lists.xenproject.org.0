Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F306740F78
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jun 2023 12:57:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556419.868940 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qESqN-0005G2-Cw; Wed, 28 Jun 2023 10:56:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556419.868940; Wed, 28 Jun 2023 10:56:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qESqN-0005D9-9E; Wed, 28 Jun 2023 10:56:15 +0000
Received: by outflank-mailman (input) for mailman id 556419;
 Wed, 28 Jun 2023 10:56:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NvKJ=CQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qESqM-0005D2-As
 for xen-devel@lists.xenproject.org; Wed, 28 Jun 2023 10:56:14 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20602.outbound.protection.outlook.com
 [2a01:111:f400:7eab::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6442b489-15a2-11ee-b237-6b7b168915f2;
 Wed, 28 Jun 2023 12:56:12 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH8PR12MB7231.namprd12.prod.outlook.com (2603:10b6:510:225::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 10:56:06 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Wed, 28 Jun 2023
 10:56:05 +0000
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
X-Inumbo-ID: 6442b489-15a2-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kFiW5AxI89spkwzhHq8fQZQvmrC+I1g5ndSpVa3isFe0+RHhcy2gXgJyboYvXN1h2GJZJ8BWJ5mlyuS//QsBqJbMMLzwqPF+CZeP30Jjrhfyc66rbhOJMt4egDEWnMiO53oWM+K60rOzewczoX+q7Qb3atMqHjCjaPjfjc6oTYTNduYOz8otN0UR8Oho5vyIL23cGy5WsAELrGVZqQh/f4hgWZaSL3jo81pz7RCDqmL5hsJo01WTsPWjvijvTIubdPsbN6hcyjeRs4I4tDNIrtsedElzVGTgwO2/K9F5dze4N37E0OjeQivl4Osoze3C8hjRqVFdW/Bsk1uJSkga4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48zWHUfS3duXEvXlukQsJaNTtV6BJEvUhkptiCBa56o=;
 b=MWfgo4B5YjXD+27RfQmCmjOXNstK2VqkydiOZ3ijvQyueZhT3ZuTxnG/cBbzeJyYQBrMwz3r0Ip7R8blM8NOPLYcWBex4xFA3yfji5qi2RwvCXt+p+4QOc1+Vi/0WFL6eYWgNKx3BUowWAw4KRfjH1+ZUFmNZnZC8SyKwjHnliapCxoexQOZjAxpUHjcIFNGGwwtdT19zguBi6CHioLeIJEUezemZwBfjNQsNVfEs0lxv0tIE7bn+2DmGIttBjmFhL4X3dzpEpMBLYVGt4qhjQx7bO0/xUqx0Rvzarrl7XuP5OFGh4CxjeIoFe1/uj4ddadjaTR+wfLW5o7WhB7ODg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48zWHUfS3duXEvXlukQsJaNTtV6BJEvUhkptiCBa56o=;
 b=07W0wqU/R0YfxYJL6xtKH2zVEKe3q+j2hh6a4dqmR3IoanTrlwG7LHCCM2fJIhWPVt6b1SZpeeivEuYlU0zp2XS0Wkdo3OHMO+RwtfpTf8FaaXMJcyNBO+kWVhnNy1qqBtw/vk7vpkTsOlTABPSwltkHBP41heUWPlzDXKIAYdU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <778688ab-8fd4-2b06-e644-b5a013bb56f7@amd.com>
Date: Wed, 28 Jun 2023 11:55:59 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 24/52] xen/mpu: build up start-of-day Xen MPU memory
 region map
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-25-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-25-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0187.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::12) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH8PR12MB7231:EE_
X-MS-Office365-Filtering-Correlation-Id: 41ce2bf9-8fe3-427e-97a2-08db77c6456b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hGRyS47e+uYUVCr89c8U8jHqB6+lZdDaROreacnTU+le97QPJiIYs+IIbHsSicMBPY7EhLpZUvzWhwJxVPhapipvyIt61zqyKZdsJuR4bidebxAzsABod9ZkauNQWtUSBsxvo2aSrI3wKmn7g/labyxxEqyggNpleOExttmdp2Ynwlkx5OPPX3TKnCKCWYAdFoU6tCvVkMepIdhMA7i9QYZea2eDznWhiA8thRNG76yHaBp0RUM8gE5qT/CaFPtGSRs4hGpaTLmj7hrNCED/7XuVkY+/WeE5F9THa/6E56uXLG6qQrjIgUG3hetWRt1qCePSWGxOukYdX40Dyiy/87r+0jAJXGSzm+AgRyBfc51p5T2dfJyour2TA5Ll+7fUOLXkgyCKC1H8tN2iv8MHypjJ7FxZADczi6Gw2VcW83CFpKGlxPDjpiV1trfRTqo5ZQ467hnVdVxZnaFvDOJA2aMfhmjbKjCINxkZNn+wsWXb9fKbJeyl3ou9eXd8B6IwNogVVQW92bSJbsmCl1tafYaYwc1j2Q6OJmO7b6qQuc9WBOiJxJY+pXryHi+BgBpuSLV9FZb18urOl8ftoV/UI/IcuXA+AZHHagtQrTI9oBIEngxnv3ARqau4KsujtOOu04N9oK7ShDFW8OftkUbjYg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(451199021)(83380400001)(2906002)(2616005)(186003)(4326008)(66946007)(316002)(54906003)(66476007)(66556008)(6666004)(966005)(478600001)(5660300002)(53546011)(6512007)(26005)(8936002)(6506007)(41300700001)(8676002)(6486002)(38100700002)(31696002)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RUQ3TFBVcnRXc0N2Y2ptQndLRStoZ3RrdHErdXNlS3h5eFhEazFxWXdFV2ow?=
 =?utf-8?B?dmFJVlpoeFIzYytDa3JTVTJZd3Y4QnAyalY1SmZjRGxCc2hzem9maUdEdGsr?=
 =?utf-8?B?UEdJSmlFSWwvUFlnaWRUNDFNanBzSWllZC9hZ3EyM1V4dUMwMElMeUtLcyta?=
 =?utf-8?B?Mk9uVU10c1FWZ1ZrUmtNL242VFl5RDI5Lzc4Z2NkcWJVZXl0UHVUTmRuNlAy?=
 =?utf-8?B?YlFIL0pJd3NqQUpKa1BlYUdlTDhEaWt1YUtwd2RjUWQxZ05UcXFOck5QaEVH?=
 =?utf-8?B?OXd2MVZWOVdJKzNBdFBOWUNDTkRrNHhXdEE4dFFyaC95TmdvR0NxR3R6cCtX?=
 =?utf-8?B?L1YrdmM5VHJnZzRncS9TUit1ZGpPSXFOZndRNGhLejMwVTNadHQ2TWZ2dHZt?=
 =?utf-8?B?ZXVkN0RpcDRtRDYvdGZOUExlczluMHpDQzlLMDRyU2V5bjhqNU40bnk0SFZq?=
 =?utf-8?B?MTM2SnhNeDJtNThJUTlXRm1MSnBIdDcweHBKbTRxSUR4U1gxUkxRK2xKQ05R?=
 =?utf-8?B?M1dtaXFlcFQ4UXRyRkoraFBaMmw1NjBadzZnWW9YVWRROFFTcXZndDByZlcw?=
 =?utf-8?B?eG1xSHZadEcrbUxwbDhHNkhMVlBHQmNnYlhwai83Ni9wYi9EV3l1bTlFTURK?=
 =?utf-8?B?OUQzU3NZZE0xdURFL1Y5R0hHK05MUUNvY3RIeVRQS0MvT2VZb3JHeUxsZldI?=
 =?utf-8?B?S0gwVmpONlFoYlR5c0JpZUl6d2NBc3BjNlFrRkhXNzQvTUZFc2FjdlAxVzZV?=
 =?utf-8?B?ZkpIYnAxRTQ4bldnMGtNeU5LYzYydVpYdktOTXF2N3luTFVERFdRbURhekdp?=
 =?utf-8?B?ekNJRTNLU3JYOEFsUFdOOTZsazU5TnNQazdjdG9sNWxUM0JtVHpSeWgvZFgy?=
 =?utf-8?B?SHNEQkdBYWZtdVhmcGtkdDl3V2hlelN0Q1VMVjVSb2JDRUlzUTIwYW0xWWNL?=
 =?utf-8?B?Y1NvTjlPdXBmTHF4WE5jWXU4NVdwWkxQNzAvZVJ1S2YxcTJ1eFIySHZVNGcy?=
 =?utf-8?B?Ykx6M0dQMzQ2UHRPeWVJYWxNVGg0ZGdGbTk1azRzL1BmaFhIMmFRTDVYTWl3?=
 =?utf-8?B?cVh4NnRiMDR6SUt2Ui9Hb1ZXWlRaS0JvVGlTU3pnY0E0Z1NVUndVcG1wS3Jo?=
 =?utf-8?B?RDlWYm94YWRHSmQ5Q2MvM0lPU0VicEZKOGlNN3Bkc0xCNkgzMUUrdnZLRVli?=
 =?utf-8?B?eTBTVmhtVUZyODc3UUhNVWdQMDM5NzJ5clAxTnhHR2hsTG1QSzF3ckV4TU9D?=
 =?utf-8?B?RXVocFNxMno4Y2E2UHBNcHNVdHh3YlpRRXRzS0Qrd3NtU3d3MUd3MEYrYlVF?=
 =?utf-8?B?dVNXZmdFZ3dEdnpPbG9FTEZQLzRCK29VUm1vaU9GYjBCTEcraVRSQU9DODZk?=
 =?utf-8?B?TjV3czVSVlVqVVlFRmRHK0h6U2VxTHZDd3gxSEJKSW4zMDBsVnZ5a2NJaTZj?=
 =?utf-8?B?SFR3ZG1XbmNMdUR1Ly8zY1paYVVoQ2hCaitkeHJpbVNja25zNFloaEd6OHRE?=
 =?utf-8?B?YTlzTzBCcGlranFxZGlZc1FqZ012ajAwZkVmT0pZTzJCOXRzdWNiS3I0UjJi?=
 =?utf-8?B?V3ZMUVRYUWhpYVB3NEtCZEZqYnFNSmFwWlU2ZjBwT0szNGNqM1JvaU5GMW9H?=
 =?utf-8?B?Qy94T21WN0ZGcDZjbFVybHFRZ2pKU2V2VnNYdWxKaVlrQVo1aFJCWjlJdStn?=
 =?utf-8?B?czVMT2VaUVpYNU9ZZVVORHM4OXp5R3NNNmszdmxHYzF5YklHZ0pwM0dYZTVW?=
 =?utf-8?B?Tk5mN3J2cDJVdDBvOGxkOXk5OVhxWlpZN25aVDVTQnF1dytPR2VYanYyeVVS?=
 =?utf-8?B?OHBIK1RyZlZ1QU91RSszSjVVRTVlbVpYZG4xSkxzWkVXK0VmZ3hXRWNBVmJ3?=
 =?utf-8?B?M3VBRmFIMmZjcXl4S2Ezcm9lU0lJOVVpTi96ZmtkcnlIb0N5SzhtSjlHYWtP?=
 =?utf-8?B?ZGxJMDRRUlk5WUxhMVlsOGFBY3RDSnlMNGZnN2xRdXlXdE1pamhzWGplZG1Y?=
 =?utf-8?B?WjRLd1dKZ25NR3BhczN6c2NMUDBTZVgyZHc4aWFSaEEwU2ZnbXM5L21SS0FM?=
 =?utf-8?B?enJrNHhNUHRsQlEvd0F1WmlPUHBTM0NYS0RZNGFxN3hLMW9rUGlUeXdMWWNu?=
 =?utf-8?Q?lUqVG6mYb/MAaYFUNLoETGK6g?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41ce2bf9-8fe3-427e-97a2-08db77c6456b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 10:56:05.7556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SApgKzadIDHf1LLnUv5eWDzYG9JqO/FlCx5L6n3ZHLR6TQ7d0md69KoHmRH/UksDZQDQj+O0f58bZensCFidEw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7231

Hi Penny,

On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> The start-of-day Xen MPU memory region layout shall be like
> as follows:
>
> xen_mpumap[0] : Xen text
> xen_mpumap[1] : Xen read-only data
> xen_mpumap[2] : Xen read-only after init data
> xen_mpumap[3] : Xen read-write data
> xen_mpumap[4] : Xen BSS
> xen_mpumap[5] : Xen init text
> xen_mpumap[6] : Xen init data
>
> The layout shall be compliant with what we describe in xen.lds.S,
> or the codes need adjustment.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - cache maintanence for safety when modifying MPU memory mapping table
> - Hardcode index for all data/text sections
> - To make sure that alternative instructions are included, use "_einitext"
> as the start of the "Init data" section.
> ---
< snip>
> +/*
> + * Static start-of-day Xen EL2 MPU memory region layout:
> + *
> + *     xen_mpumap[0] : Xen text
> + *     xen_mpumap[1] : Xen read-only data
> + *     xen_mpumap[2] : Xen read-only after init data
> + *     xen_mpumap[3] : Xen read-write data
> + *     xen_mpumap[4] : Xen BSS
> + *     xen_mpumap[5] : Xen init text
> + *     xen_mpumap[6] : Xen init data
> + *
> + * Clobbers x0 - x6
> + *
> + * It shall be compliant with what describes in xen.lds.S, or the below
> + * codes need adjustment.
> + */
> +ENTRY(prepare_early_mappings)
> +    /* x0: region sel */
> +    mov   x0, xzr
> +    /* Xen text section. */
> +    load_paddr x1, _stext
> +    load_paddr x2, _etext
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_TEXT_PRBAR
> +
> +    add   x0, x0, #1
> +    /* Xen read-only data section. */
> +    load_paddr x1, _srodata
> +    load_paddr x2, _erodata
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_RO_PRBAR
> +
> +    add   x0, x0, #1
> +    /* Xen read-only after init data section. */
> +    load_paddr x1, __ro_after_init_start
> +    load_paddr x2, __ro_after_init_end
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
> +
> +    add   x0, x0, #1
> +    /* Xen read-write data section. */
> +    load_paddr x1, __ro_after_init_end
> +    load_paddr x2, __init_begin
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
> +
> +    add   x0, x0, #1
> +    /* Xen BSS section. */
> +    load_paddr x1, __bss_start
> +    load_paddr x2, __bss_end
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
> +
> +    add   x0, x0, #1
> +    /* Xen init text section. */
> +    load_paddr x1, _sinittext
> +    load_paddr x2, _einittext
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6, attr_prbar=REGION_TEXT_PRBAR
> +
> +    add   x0, x0, #1
> +    /* Xen init data section. */
> +    /*
> +     * Even though we are not using alternative instructions in MPU yet,
> +     * we want to use "_einitext" for the start of the "Init data" section
> +     * to make sure they are included.
> +     */
> +    load_paddr x1, _einittext
> +    roundup_section x1
> +    load_paddr x2, __init_end
> +    prepare_xen_region x0, x1, x2, x3, x4, x5, x6
> +
> +    /* Ensure any MPU memory mapping table updates made above have occurred. */
> +    dsb   nshst
> +    ret
> +ENDPROC(prepare_early_mappings)

Any reason why this is in assembly ?

We have implemented it in C 
https://github.com/Xilinx/xen/blob/d1258f1cefe406a3f91237b8106746c089864651/xen/arch/arm_mpu/mm_mpu.c#L941 
, so that it can be common between R82 and R52.

- Ayan


