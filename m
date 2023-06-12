Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F242372B87F
	for <lists+xen-devel@lfdr.de>; Mon, 12 Jun 2023 09:16:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.546877.853964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bmr-00087w-QJ; Mon, 12 Jun 2023 07:16:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 546877.853964; Mon, 12 Jun 2023 07:16:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q8bmr-00084d-Na; Mon, 12 Jun 2023 07:16:25 +0000
Received: by outflank-mailman (input) for mailman id 546877;
 Mon, 12 Jun 2023 07:16:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Cme/=CA=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q8bmp-00084X-EY
 for xen-devel@lists.xenproject.org; Mon, 12 Jun 2023 07:16:23 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2075.outbound.protection.outlook.com [40.107.7.75])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 08d193cc-08f1-11ee-b232-6b7b168915f2;
 Mon, 12 Jun 2023 09:16:22 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6898.eurprd04.prod.outlook.com (2603:10a6:208:185::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.39; Mon, 12 Jun
 2023 07:15:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Mon, 12 Jun 2023
 07:15:54 +0000
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
X-Inumbo-ID: 08d193cc-08f1-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqfjvFak8qKTbm3RCcIHxBwiXassoyvhfsFryHBw7/C7SsSBLYaxWj7ZIX7l4FdhUUgBqtAbNg0isLHNtEPi5+ZUIIUNF+fgTqEGemsXUnm0tKdEzsfxTtukyFFnY+3opQ3FVp7vnlN1+XE612HlkwIwPjBPjXOKu558hA6X1wyBSTKCSLcNkUsVC32wVh4N9ipJx8FIBwQAv5qEVAUtMwK09coHLmyge9WQgBvtEq2aawQbWcklIpUpc4+TVy4vGwttbidwzO1qtJnRbgHnann4J+ts1Zj7l54zc9ggvXw9DmorAkCu+k6vGuAVj+fw5LVRNNqfMgexEevkemlYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aw00iNeYQdxK3fbRKFRRTemZezbdy/PhkdqHdw7pCYo=;
 b=ahr18pfoGFX+gyG3Q2PEMZQBsvgzpPgC5e6w41KrWfBHO+u1nJ17kizHm3gKcs2uM/h1QAntszcNL5tqbb1o2qDLrxXxv+AZrdncZrubGoArGy8mdPvADknyYHnL04cAnd0cNcSxeykh5tU5AHHw4DpagvCFiLMvr1s+YstTBrLAu44/D0A8jcJNz5aTM0hNZWtc+u/EmMcLS+u+PA4ETNTDl7pUruT0gAAMIckYJKQUHhNFgH7f8aw6KfDkhKksO/tbJso+ibexg8BPcuCiW1qVJw6m/DaiBXLIouqih5ljmAD6wtpF8zf9CXHWr1Vm3A5z+2fpd4mah/Ozy1tyvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aw00iNeYQdxK3fbRKFRRTemZezbdy/PhkdqHdw7pCYo=;
 b=rrXjdhHoDQIFbvkSMhjqpCzDeTNWgV2gcyNx+a2Lffz4I5JbO4+3zhZB++s9O45aUVrDS9NJY6zeThxuZsk0pSzsVS9sGwHlUYcluQXHVWIM9ctO5/NF2P/wj085Fjjok0X3dhefzH9LeTyq4yoFcMawQw6aJNEPrrOoqtc6tsErhXFU7I+DSXhEOXavAFQenmUt+VPcAzPEXKSkunT+GmWFY1mfNmP1DRhsOI+t7+u9tED11DmQ6ZLG3l43EXPE7zFW9kwhny4M8lsBnnfpRbzFM1AwyAP8lUTcuxibZbABCkTcO5OAAaL7T2al4XKOwhdZaY7RQt1ccpso9PFH6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <726a9d97-aab1-f6d7-ab97-d75cf47b4c2d@suse.com>
Date: Mon, 12 Jun 2023 09:15:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v1 4/8] xen/riscv: introduce function for physical offset
 calculation
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1686080337.git.oleksii.kurochko@gmail.com>
 <d5971bce174c7bbae61c7e16337ef95c7f3d1f62.1686080337.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d5971bce174c7bbae61c7e16337ef95c7f3d1f62.1686080337.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6898:EE_
X-MS-Office365-Filtering-Correlation-Id: 36d32761-d4b2-4a5b-d0c9-08db6b14dc09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pdxvUTEkkb3YPDflTLD0GDHdw4g1b+u4/egsbridd40sVpHXQBLcUNSnsZnuMQxa2aYch7MoAK/Yco5/ZxPMPMk/6zD+KJEUzhDmuyCdvcc41wAVkpOrnY1DzEkKa594dD46kd2Yc1CZ8REoHODdK630rx9zDDMBbWMMeaVTccUrbp7zOfSIU7u4Rs12aP0tRZItu+/QcEesT/IwQaHp4PlWWAaulx/g7SWQsRCtkuLZ23rNDdg6I7TStb7EA4kIJEwvaUKLf5UNg698RqxNUzfD7uefcgE9UD9bpkKR7zj0WvOTWCI10Bu7HGoilyzo8lLJ8PVsVZLDpFwQihPa7fdw50Ua02BP98QtHtLkI4jeBpT453iPg9R5/kDLXm+q6xyfb4vHiVdxA247r3jfzA4FfsQUua4uP5S5AXjrJYY5mWXIexZQ87+EFkw+Y7sNQ4qX+v05ymSNV4ziV420nBXN9XIkF4tyqRe+uDPYdqboKLUJHYrQFbnWmJMkBAlo/Ht+tbaqL8QAvrZiJCK2JclMqQBpCbywtIfE99dUY/E8bA836wAYrGHyHO7qS8HhKKtWh99rONeiPn0mefPOYRhrNI7Z3hlN3abnl027u5njovmz0pWjtUkHBWW08JWppVA6Qxc/D4VDreP9r2SIEg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(39860400002)(136003)(366004)(451199021)(6916009)(4326008)(66476007)(66556008)(316002)(31686004)(41300700001)(186003)(2906002)(54906003)(478600001)(66946007)(8676002)(8936002)(5660300002)(6486002)(53546011)(6506007)(6512007)(26005)(83380400001)(36756003)(86362001)(2616005)(31696002)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dWR4ekNDU0crcU9Tb3RWZUprdDlscVRQOFg5UnYwS24rSEYxNjZWRzQ0cmZB?=
 =?utf-8?B?SUUzS3l5NXRGUlpLelN3MGpwNjUyTlRaejNBWkdTZjJBVTJqVWYxajNDM2pj?=
 =?utf-8?B?UHlIQnN4MUFNRXVZQmRQZVhQeXYwaUxSL0svNmZELzBBWTFzdklIMUxiOTRR?=
 =?utf-8?B?T2JvR0dYNFpiRlI2cXNLSTluZ3FjSW5VL3lYOXdaMm9MamtWQTRPem5lVGU2?=
 =?utf-8?B?SS9BS1luTVBtaTRINVEvRUp4SlR3Ukwzai9ldTF2d0kySDNVZVY5c1lSQXZJ?=
 =?utf-8?B?cU1Tb3RBOVp2dUxWYlRuWERtZ1drVjJ2NGxXaWJHU1c4WmxFQklyVTNyT3ZB?=
 =?utf-8?B?WGdKaFpHRlpUSE5hTzhqczQxTnNMd3RyV1diS1I3dExiL0t0TDZ6QUo1K2Vm?=
 =?utf-8?B?VW5IU0hPNzhTQ3B3cGhhVVBRcXI2djQwTTVuMjBaY2lwbkdCUXpoc2VZZllQ?=
 =?utf-8?B?bko1SzZRekpWd3VhQWNkNFBFaXE2dTM2UXNTUWN3VXRpOExaT0ltaXdlNTVC?=
 =?utf-8?B?d0xwU3hTWWN0eVorb0tlMmUwaG5HRDEvU05KMkJPdEt0cmxSM3ZyRUdHYS9s?=
 =?utf-8?B?RzU1ckJ1dE82UU5lbHNjOWhxQStmVHJ2UFlWTnl0Z0x6RjZzVGJWczBTZnpN?=
 =?utf-8?B?Z29uU2VxMEE0Z0R4a21kRm9uOC9sWmNKYnViZmRMNGltYmVtcDJ3d01ZeThT?=
 =?utf-8?B?cjQ5NzFSaHExcHBiSk5OcWFhZ3ZNSHhKNy9oMWtVSGE5V053eStSVXBqMWRW?=
 =?utf-8?B?bGt2bGR3OFFFVVROUXBYZXBXcmYwQkwrUlN0MExzazQ2dEMweFRsNyt1Z0VS?=
 =?utf-8?B?YXo1cWhvZjNiZC9lNjZoL0ttM0k4WThKWHY4Q1U3Sm5WTnhCTU1hWnhKLzMr?=
 =?utf-8?B?aW5NVFJja0RmNVlLbHc2YlgxTWptNG1FNit3RGtSRXUwMlRrRGNUb20ya0pD?=
 =?utf-8?B?VFNaRGxWZmdMd2JkUkR6T0tRQ2czZmU2RUZ0VFROWXBVQVpHSEhxcGFXTVlu?=
 =?utf-8?B?dnlZRklWRTRZZVBzMzZCa0hoblM1ZFhGY2ljZWppYTI0eVlRcnB4QndIOFpk?=
 =?utf-8?B?SUdxNkFRSDMvV0NPcjRZY1MrTi9KQTU2NS9jTTRuWDNyVnVIM1N1ZHE2a0o5?=
 =?utf-8?B?VnZzRU9xOGdDSmdCZ1JtSTJORlNsL1lHRUthZUdCV21RdmZXRWJlV2NwanNT?=
 =?utf-8?B?Yndpb0VueHpYTnFneU5iUWU5Y1NScVhXaVhxanp3QUNaSW53cHVaT2NMSDdG?=
 =?utf-8?B?QUE2WVU4S1JncVJYcmZienN3ZjM5cVpWSnJSNm4zbnVHY3dlUWRlUVVxc3hv?=
 =?utf-8?B?TGtQMVpmSFVicm1lWnVLYVpQMmcxQWFrTE5YY0NEM3Z0UWhsVXJnYVc4aHl1?=
 =?utf-8?B?aTdOVXRTMm94S2s5Q1dSWDRTSWR1RmhvUER3YlhxNTRkckJ4ZnpkZzdrc2sr?=
 =?utf-8?B?alVRY2N4MTVYcEZQWGI3YVlObm1KWlk3SDBhdmQ1b3BwbVZXOWtMekFUeW13?=
 =?utf-8?B?VG53Z0Eya3hZU0s0ZTE3S3RZaXNEWm5Ha1MzRTFWS20zYzRKNjNEeS9leUF2?=
 =?utf-8?B?Z1ZjcHRGRlRBUHVTNXNRR2dIK0ZFLzBuZFJNcDFsalFTVlh4K2tqUVNMNzR1?=
 =?utf-8?B?bUtac1VQOFZMWGI3c2xxcFBEVVZLMnVabjQvcmRNNWc4NVpqL21ka3EyUk1F?=
 =?utf-8?B?UEwyQXhaaXNxalpSRHZYTGhNMWFtVDFHcC9GWWxCaFJpSlBaOFN0RzF3MjF2?=
 =?utf-8?B?OVk0ZjlvSXRhUkVxNnJFb08wTThXSmpNcERxQksyOTVrN09oMllMQXFOQkVJ?=
 =?utf-8?B?aXRmKzc0aVNITENsOW14SHRvcG5nSldqQ0VFaU5VYjk5SWl4RHpiSXkrTVY0?=
 =?utf-8?B?THdyL09seVRwTm1mTDd4ZFVyYzNZRk1ZNlR0Y0NOS2p0dzNaYkdQdkFFMmxj?=
 =?utf-8?B?dU1mekFIZzNMNW91S1pPL0hpUzVGa01odHZZVHBIYi9PNTR4Ymd4MDFUVzZa?=
 =?utf-8?B?Nk5Tcno1YzdIdVRjemJCRld0bmlMTERpZGszNFJCbW9MalAycnNOTDM3UzVJ?=
 =?utf-8?B?UlRiWGdPcXFHcUIyVjBuQ2FiejNWWHUvRHhPclVzM1NVOGNpUnlTeTNyRDVt?=
 =?utf-8?Q?hC6wUAS5q7oEEhGGqGWsjggOs?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36d32761-d4b2-4a5b-d0c9-08db6b14dc09
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 07:15:53.9400
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOPc86NJrdKZULat2Dx1vHZ4pfHJKoiWv+zVODVrbVcX0tqtjTK2LCKudSVTGrkhaZ9R785wVFR4VuhgYBO7Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6898

On 06.06.2023 21:55, Oleksii Kurochko wrote:
> The function was introduced to not calculate and save physical
> offset before MMU is enabled because access to start() is
> PC-relative and in case of linker_addr != load_addr it will result
> in incorrect value in phys_offset.

"... to _not_ calculate ..."?

> --- a/xen/arch/riscv/mm.c
> +++ b/xen/arch/riscv/mm.c
> @@ -19,9 +19,11 @@ struct mmu_desc {
>  
>  extern unsigned char cpu0_boot_stack[STACK_SIZE];
>  
> -#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
> -#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
> -#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
> +static unsigned long phys_offset;

__ro_after_init?

> +#define LOAD_TO_LINK(addr) ((unsigned long)(addr) - phys_offset)
> +#define LINK_TO_LOAD(addr) ((unsigned long)(addr) + phys_offset)
> +
>  

Nit: No double blank lines please.

> @@ -273,3 +275,13 @@ void __init noreturn noinline enable_mmu()
>      switch_stack_and_jump((unsigned long)cpu0_boot_stack + STACK_SIZE,
>                            cont_after_mmu_is_enabled);
>  }
> +
> +/*
> + * calc_phys_offset() should be used before MMU is enabled because access to
> + * start() is PC-relative and in case when load_addr != linker_addr phys_offset
> + * will have an incorrect value
> + */
> +void  calc_phys_offset(void)

__init? And nit: No double blanks please.

Jan

