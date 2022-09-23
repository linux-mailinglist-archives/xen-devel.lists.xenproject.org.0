Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30E505E7A39
	for <lists+xen-devel@lfdr.de>; Fri, 23 Sep 2022 14:10:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.410772.653919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obhVl-0003tb-F5; Fri, 23 Sep 2022 12:10:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 410772.653919; Fri, 23 Sep 2022 12:10:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1obhVl-0003qS-C7; Fri, 23 Sep 2022 12:10:29 +0000
Received: by outflank-mailman (input) for mailman id 410772;
 Fri, 23 Sep 2022 12:10:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+sT=Z2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1obhVk-0003qM-6f
 for xen-devel@lists.xenproject.org; Fri, 23 Sep 2022 12:10:28 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b41d9497-3b38-11ed-9374-c1cf23e5d27e;
 Fri, 23 Sep 2022 14:10:25 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by PH0PR12MB7094.namprd12.prod.outlook.com (2603:10b6:510:21d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.22; Fri, 23 Sep
 2022 12:10:23 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::d085:e792:380d:ca4f%7]) with mapi id 15.20.5654.020; Fri, 23 Sep 2022
 12:10:22 +0000
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
X-Inumbo-ID: b41d9497-3b38-11ed-9374-c1cf23e5d27e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=egwba4Y8M7d9MLa73h+44+AfeOdzwzhTL5OC+JeZt1WKTkzaWk+64S5jDTgYt+tFkuEt+AFtnGIkCqbjAfRWX4gKfpwuaKcf5kwAsj23UXC4j4rMkcvclWthmdyZPOB1gWazmQ/5sIqR4dpFxNoL2HuwgnxttS7HwZhctbi37ZHWSVsw/0vhZXAu9YqgdSJnGQ6uijgpDrjibg2ujTg0Xyj1jgWgraBjSHTlpbRmV3x1iXuxCY5FOP2Kn1dx5cjryjb9aAbg2w0pBAW+9nfxapNC+pnbgHlSaOWv2bIWrAo9+KdR9wTIrzzj2Opqa+eQkP44pACyyd0dffJPzWu+/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzURtjbh1BMXeIbIvlhHYOSGR+CZp5qngLInO6UfwOc=;
 b=cGBidgL2qVsYaXnTQC3v5wur2oMztwjNiffJ8Z6qH3DkjSJZEtxleCJ5uVEdU06iC3RYkiCbCQ/tZZhFzoFvhazutXcx6/GfDRJj3dRTc3DIFC0V1i+bpDwHjX+dzIT4jLKHxOG6fMqdeWUAghP5NNnprhncrqap6DAYi6St2znDds+UPWqHzQJPNGDeVRVn1xAPehMPKNUCFz7DKAXzavwNrcWq7i6UNQZOKKp2AMlkD4N4eOd0eAa8Lg+Wry7puKyj+/zzQ3IjyYEjeiinE88uZnQltbhi0woyRZcpzLJjetvqJFpBYriDu3ZAMd3jqLW9Enm4CtRk+21f898D8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FzURtjbh1BMXeIbIvlhHYOSGR+CZp5qngLInO6UfwOc=;
 b=3CSgR6w7aL+26Zx36/c8jb1g/06ZAwt/Cqb1Ak3P0fdLoqmHggqTcs+oq9sc4OxTgAP+sj9LJEG+a3QR/TbVxk4oImEodcnAjY9icHbYieZSDLhW1qfY5GZd9g0NOiL8ADbrk0/R9PasJ6KaXtTudDfdsSSEGqK3paFFib4NsDo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <000f22e5-1628-a937-0871-44ed498e1b26@amd.com>
Date: Fri, 23 Sep 2022 13:10:17 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.2
Subject: Re: [PATCH 2/2] xen/arm: fix booting ACPI based system after static
 evtchn series
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1663928523.git.rahul.singh@arm.com>
 <0c53abc972264b0ea13864b7056fa2149cd78f9f.1663928523.git.rahul.singh@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <0c53abc972264b0ea13864b7056fa2149cd78f9f.1663928523.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0020.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:62::32) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|PH0PR12MB7094:EE_
X-MS-Office365-Filtering-Correlation-Id: 1dbb71c2-5866-46bc-bae3-08da9d5c974b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Pc43/E1KAogFk62UjzSW+pUIfFN64V8CZ00r2lq0KxSs1cbPw2wytVIXda94cYL97Q03MeJhDM1P7erai8av+OKgbDkhRUyvEA0slcKXnz+ChHT98oF73IeytYUGfCK9ZbMQyvSZOVTP/clZ8lUw0cMY4sFIfCll4OwvhAQ8rJ0cw/iw1gAcmE/kVRD7x3s1JZnG+BnApOi2UmncGuDBVLx1QMM96eGDyFaogrXAVXRMJPFbnwQL7FR7Yrv1po3qBuZliezUA6hqc8rHsqRWGQAh4ro3CTYIMSbfcOvF/nwktWec9aNryLjvsQnrV0odS6lMbzQbTreCOyOmYmfdxJP4cYzm93cjbAYL1exAaae1Q4eUQUT8tQdct83hpeqevXIXhEsH+cnHRcqTK0M8GPtwRLjF2rfNk6QZFCfqL/tyFjaSeGAX7srAjHs7BaIHWR/Ps277bXssGfUC7ntjyLp9a4tF0hCKwbrery56nX31v4I8B9Wq7Brfxrz4Tm+Kh/TefnbghmjIoO0Hp3MS5fWOaF04JDmEddxePdRkaLwKKYWlTJyC884e/PEqVIIdQujdYWM5VAKxH7MqEe399pF5tU9/uoqESWOV5iLBUJEtE3dTr/UakEb7aNDecyfAW4OrVtq5Y7fvHr9raU8dNPRFABLqd7wdC9VRbu4eVPJgKUkP2M6/yWK22CXTklDct9B3Icn6vIHjtTky0i/pT0tokfkYOyDrRV0IvZtdWJTEy9BPpt78mJcxiQlgY4oQSv+gqxc52bOuSfaK67GWqn0kl2XVFD8c4V2fwCgMvFw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199015)(38100700002)(54906003)(316002)(478600001)(41300700001)(6486002)(2906002)(8936002)(5660300002)(66946007)(66476007)(8676002)(4326008)(66556008)(6512007)(36756003)(2616005)(26005)(6666004)(6506007)(53546011)(186003)(83380400001)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjZDSXdZME5XSEU1N2t1enZVaVpHeEhxNEZwZ1hwSlhhQkIwYVIwWlhqK1VL?=
 =?utf-8?B?UkJFZXRselZIQVNONithNWF3Y045eGZVYmQ4MFJ3V3IybGgrTzdQS1N4djc1?=
 =?utf-8?B?M3BwODJHNGZuSkxLU3dNU3I4ZXVpanpqcWgzc1NBdjNvMGtUNXhVR0FpcWta?=
 =?utf-8?B?WTJWSXdTWE4wYXJSeU1KZEp5L0FJbnh5UFZQVWg3dFMzT2VHdEQvS1lTV2RH?=
 =?utf-8?B?MFd5S2kxVlpPRlhQM1ZUNXR4TXA3d016ckJ6TDl6MXJQVUdsbGN4UGprL09W?=
 =?utf-8?B?c2ZxK2p5RmdDM3lpMUxINzBSZXl1Rm5aVm8vQlZabXpySkdPV29DZUlsc010?=
 =?utf-8?B?MWJ4bnZkUDJ5amVPaFlVRHEvY0ZoVjBJWnlBNC96dlNVaEt6dS82cWZSTElI?=
 =?utf-8?B?YlBwM3UrRHFweGg4Y0x3UitrRlQxL1J3YmYwTFp2SUd3UFBaaThDSjJoV1ds?=
 =?utf-8?B?NmZlQVh5bmJCcGF6TmhiaHNCSFRVSFR6cHd2UXp1aVU1OXYrREpSYnZjTklI?=
 =?utf-8?B?cGZ5OTVzUlBETjdBSk1ZTmV4dkZnYUM2U1hWQjRYZThnWUMyeFIwMkYweVlZ?=
 =?utf-8?B?OFpPeWhmS0lXdUZaRlduMkh2NWlRUlE1bEk1MmJiKzFUMnpMTFFJa2NqcUlU?=
 =?utf-8?B?alo2S0E5Q3BJRXFjSHorc1VkS3I5dXVhVGp6LzQrcDU3TWZNUzNaQWwwbnNj?=
 =?utf-8?B?M3U4bGo5TFluYldPR0xjZE9WSU84bFNUQzZxc2ZGS1hSWWQwaUhuUkliNlU4?=
 =?utf-8?B?NXVtd2JxQXdsSTl0WExSQ1lPNnR5RTI0cWIrTW5RVHZGT0llWGl3Sk9lckc2?=
 =?utf-8?B?WlUzMnc5b01XVlQ1OVNTOEVqZnhCeVlnZE5jL1g2bUNLSEdHNjNTZW82N2JL?=
 =?utf-8?B?ZjIrcEUyQWxCN0M2NVNxdjRPK0RqZ1lUaExGanR3WW9iZmtzNlhmNUN2UlUx?=
 =?utf-8?B?bDA5bE5XK1AvVnJYSVE0WGlpRzN4dkdzZlA4ZDZZNjNvWlFxa01BeXIvSHdR?=
 =?utf-8?B?dWhFQktCWjk3NnJwNjNIK2s1a0EvY3Vac0UzcjBVOUFGL0RiaEpIYityeWRu?=
 =?utf-8?B?TjhhL3JJSlp3U1N3VkpmU1FsVElyd1Rvbk0yMmFuMjVyQVpuZWlkbzF3ZnRr?=
 =?utf-8?B?dFRiQnBBK2VyUWJEV0c4ZFVUbTBKNW9IMHJpOVYwTTBFbitLK1hISklGcEwv?=
 =?utf-8?B?QlhpelZ2TUI5Q3U4aTduNkQxNmd6Ui9rb0dSZkNtVDJZc09Nd05YQVo3ckNC?=
 =?utf-8?B?MDF1OGlGcUJaQk85K0VaTE5sajNMZjdtWlNsdTZ2TlVyNnRXWVRmZ2JXQ2l4?=
 =?utf-8?B?SWpjWHJqRTNUSG5JNE5SbUxUV0F6bzhuU01CWEl6VXk0ak03NkhEYVd2QkN5?=
 =?utf-8?B?NVBsUEdhQjJMeTZKVTFLYzl1QURXQXRlUzloOVp5SmV0cU9pallTRkg2RTdi?=
 =?utf-8?B?ZTRtbnI1WXl2c041bmxQUDBDS3ZNRWRJWHVGZ1NaRGFkYm82M1hVSGk0eCtu?=
 =?utf-8?B?YmMxSEZySmp5ZXlUalNEcXFKUHp6NDVYZUxYRm9WWEEzbnFIQmtZWGE5R0o3?=
 =?utf-8?B?Q0VwUW5TY1lOQ3lCa3VDQjBoY2I0STdSeG5IMmk0bnhSdnErdFBLUXJKVW5z?=
 =?utf-8?B?VHBNdW1rZ0toR3BoY1NhUmNxU0tKN0NDamVubzdtSmd6QTU1V3Q3algxWjQw?=
 =?utf-8?B?bTBXb0V6Y3E5V3hwSGlSaVZPaGt2UWZCd1EyS3dpU3FLYnBTM1RQN1lEUkYz?=
 =?utf-8?B?WHY4aWNEZzFqZFlMa0p6OGFISmpQSE1vOE40ck0zVlRXN3plQlB5VmpId0h4?=
 =?utf-8?B?cFN6SVdtc3ZBdldETENwdTNJRjJqaFdqa2xVRFdEZi9vOERCQVd6Z3paK0dW?=
 =?utf-8?B?TzRuNVdtWFVRQmJOWThwaGFPVVM4NHJoN3FiVTAyRzhQREVoTGdZVlFZcmVL?=
 =?utf-8?B?UC9LSnlYbWJ1emJBczFRR0Y5Rkd4T2hqdHVhendxaWFmd2M0Z1oxUElKRXZn?=
 =?utf-8?B?UjRNN3NZeGNVM2pYUnZBeEFUV2IxTkFsN2t0YmpaRU40VUNNVGc4M0xaa2lS?=
 =?utf-8?B?dkllYjlIcU1TbkVCSC9zZGthUGRLdmVJMVEwQS8vNFhicUJ3ODk0c0QxdFl2?=
 =?utf-8?Q?XUlYVEztNIjCJ8fPdIhx6VLGe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1dbb71c2-5866-46bc-bae3-08da9d5c974b
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2022 12:10:22.9252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3O09BJZoAYIdkDK+4ZReSM0NM4jOW48cAtnBiEepr+TfGKZ38jhh9820n9gM6e9yOx7l+AWtuQ0iqdrXKA0V+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7094

Hi Rahul,

On 23/09/2022 12:02, Rahul Singh wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> When ACPI is enabled and the system booted with ACPI, BUG() is observed
> after merging the static event channel series. As there is not DT when
[NIT] : s/not/no
> booted with ACPI there will be no chosen node because of that
> "BUG_ON(chosen == NULL)" will be hit.
>
> (XEN) Xen BUG at arch/arm/domain_build.c:3578
Is the bug seen on the gitlab ci ?
>
> Move call to alloc_static_evtchn() under acpi_disabled check to fix the
> issue.
>
> Fixes: 1fe16b3ed78a (xen/arm: introduce xen-evtchn dom0less property)
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>   xen/arch/arm/setup.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 61b4f258a0..4395640019 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -1166,9 +1166,10 @@ void __init start_xen(unsigned long boot_phys_offset,
>           printk(XENLOG_INFO "Xen dom0less mode detected\n");
>
>       if ( acpi_disabled )
> +    {
>           create_domUs();
> -
> -    alloc_static_evtchn();
> +        alloc_static_evtchn();

Can the code in alloc_static_evtchn() be guarded with "#ifndef 
CONFIG_ACPI ... endif" ?

- Ayan

> +    }
>
>       /*
>        * This needs to be called **before** heap_init_late() so modules
> --
> 2.25.1
>
>

