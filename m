Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 986FD577F4C
	for <lists+xen-devel@lfdr.de>; Mon, 18 Jul 2022 12:05:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.369481.600917 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNca-0006y8-2o; Mon, 18 Jul 2022 10:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 369481.600917; Mon, 18 Jul 2022 10:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oDNcZ-0006ve-VO; Mon, 18 Jul 2022 10:04:59 +0000
Received: by outflank-mailman (input) for mailman id 369481;
 Mon, 18 Jul 2022 10:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pu44=XX=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oDNcY-0006vY-HY
 for xen-devel@lists.xenproject.org; Mon, 18 Jul 2022 10:04:58 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-eopbgr140048.outbound.protection.outlook.com [40.107.14.48])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 13c09431-0681-11ed-924f-1f966e50362f;
 Mon, 18 Jul 2022 12:04:57 +0200 (CEST)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB7685.eurprd04.prod.outlook.com (2603:10a6:20b:29c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.22; Mon, 18 Jul
 2022 10:04:55 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::dd30:2cbc:361d:2d1e%6]) with mapi id 15.20.5438.023; Mon, 18 Jul 2022
 10:04:55 +0000
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
X-Inumbo-ID: 13c09431-0681-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eEhzMzO+KsbC3me/t2TqhTbSavDu85LmJF/ivsKqknZxZu4yMMj08TLb+GdrRYN2/XpFg3wj1ep7Eg5UvkliU/vrbzPdCJi3IoIlr61sl2k4xN50jHa1uu3Pp083y4arTGtOnHCc9W4mbn0X15SHsQuQZrw4y2PCPgfk3yz4fPhvksgDUBCDNLUeQFk0X0NWbqnx4pe/iMQJw5GFTu+N8K8MfRqHvZqrkhpRIHnRZGWYGdiEHDTfiRS0x3eNESvcRXlwSOB+eFTwnJx27bSSUDR9AFvPzgNGDtxNiz+WtS7SmU9FRP9kVI+MveK/r2aIlMRuQP1Szj4i3u8Sj9I2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=00tc1BLgrNjZqmg52bXLTNx+98YBiFDFO9AhKU7PAIk=;
 b=ISAcDm8tV+Ftd1TkvqGeQs5sbO42ExS65zb2YTQJEhjL9GEc7W8KAwgzcVIQ6sUm6b556FA0HMFDzTcruvAxIREXjJEloJXCO3DWwKbhpmQfhIs235ggK6+4TGvzM8sE8GFuXdzBPbTtpmwNBsbaTyq0PXkhYq7EdMdptWAw0KqCw5bmkU8Ocv1wVI8ZYeOsK8EQZrkAduIxM9dzsxq1yiyPikqqOUfTRhZKmw6Z5yIJG+ckFORNN4zHCrsJjTlU9Krb91to5EkiJZMcln+Wkyi41qJXSPXgUHE5FArHEtEcT8tFxfTZMotQoNdoEd24W6hktwlXvrleiUrbJcWpAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=00tc1BLgrNjZqmg52bXLTNx+98YBiFDFO9AhKU7PAIk=;
 b=FyNGRJprxe3n1MeWiUtIIuMvvl+eXpPlYC6U7D+yCLZrBC5cP00sqSrq2F2ymbfr+/a1MacDdxjoAh3ox/9yvKd39yWRSLtwP4PGGMD2z8ZRcciLKmDzyC0OpmXDvaCVIAALY7zMaaD0W/MWglCWNyHoRod8VqoymxQtlb/I9TeT9A1ir9AhslZSQdaei9Ip6SrZuNUFvVVFX4Ep4sBh1zhsgpkB/YrIOLDk/UL6RoHnyzckyiv5CARjJWVSJR85ptHGPhNluyNGk6cBdGF8O5OmEJzO13qplc2zGMG1fA02ICk7wuSxwMA3xL3zItt8ZLuZDwNV9L9LG/ReaJoPwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <187166f8-1f38-a2f3-e6b7-d8dca587d945@suse.com>
Date: Mon, 18 Jul 2022 12:04:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/5] xen/wait: Minor asm improvements
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20220718071825.22113-1-andrew.cooper3@citrix.com>
 <20220718071825.22113-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220718071825.22113-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8PR04CA0099.eurprd04.prod.outlook.com
 (2603:10a6:20b:31e::14) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9e049c7-38b5-43a2-c7e4-08da68a4f6c1
X-MS-TrafficTypeDiagnostic: AS8PR04MB7685:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cCyP43chqb3gsdrV2ILGwVzUAeZKDFUfKUzkMYPoaZb5LV2ch+oBkQ9YqfKhaIF9GwVlUP/sS9zrmW6NfsG7OXV9PXWn58B6brHA9DwAwU0rMDxp1mn1a0X6J/5V3D89PHwCDrw5j8GPlq4Yv9nHgTc4JD6wHMIF9rcy4Qc8s6H8TZPxqvBQ0UWIhQd2h3F++tgNNYVdx7LomGR8C+yxJ86SMM2j9rcqrxY6WVkp41y8nrnOrvNEic3+ZffCC9TvCcAQK84b+8MLWMMWiqvFGCqCvsMz3fSaAODrqVYSu/FfWopXrbuAOXXs7H7FQrWZJrC+l13leS9O0VgT11jXGwlydgUsPY5hk+rOZP3Z/+vEk5Gcp8a3QwJXBWWtm7AjesF/KM+jlCXa8NpFR05lElFuaRJRTRRNViLow9BY+wb4mAE3qxwaLhjwlwEKnN5KCfe3y6soprRwLQs9YglbwMXyJGty40OLyWo5G3ZXDTzVmJr/CAwH4OojgLIUjZn231fTk5M63ggat1Ea1ahfxh35BAodJ8wigb/tctpIu0kNdErmVmF/TUiUGvgdQRdqi3xPcHLQTyeY6tPrde2+LhHeCuj7tKuXsNvPXidOHZA6cxGJhnzlFnFPKGbXXnS4QvOP9tLH3/vUz+qQOnbb53UvlTl6xCy341jD+cK+uoik7S3UmViBGlP0HOp111By9pgjqM6YFPxwQXZV+cuayVAk0ht2IlQt9jacQep6iW0FpHZQhXBlscIUriJBdPqiUDcV7zoL3K6QiQT1gAqnNYec66CGOQMYh9xlL2fVCFiVR43Mp5fXu5se0iz7jfA2p/qroZ5DW7xss9NeL+jE6A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(396003)(136003)(376002)(39860400002)(366004)(83380400001)(186003)(38100700002)(41300700001)(6506007)(53546011)(6512007)(8936002)(478600001)(54906003)(316002)(6916009)(6486002)(26005)(2906002)(2616005)(66556008)(31686004)(4326008)(8676002)(5660300002)(31696002)(86362001)(66476007)(66946007)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUZtbUFSSFZ5ZGpKc0Q3NitHYWNUejkxbTVYdml3SWZtOElnWm92L2lWaGVt?=
 =?utf-8?B?WmdoMHJFZ21BdnNuaVg5R0R4YVJ6Y3dDMWJpcEZ4c2Y1dk5EU1oyNWZKejBn?=
 =?utf-8?B?UWdPMjRtVUQxMys3T2pPd1hKR3ZGdi8xZ0JwSVV1WDY1MGZObktYVnBQY1Bt?=
 =?utf-8?B?ZE0xcTRsNG5LelVoc21Cc2tUVnZhcEhoWlNqWVNLZU1GK2RLS3E1NGRocGM5?=
 =?utf-8?B?NGtrWWMzU0gzMVV0cXlxNjJ3SmMzYTV6NDBYLzlSZHFoMlQ2bW1wMi9qZzVP?=
 =?utf-8?B?cVNRSjBCbXhaY2JwMEEzVTc4ZzJMYk0yV2xvWWZuYWF2MEFTKzBGSlA5OSt2?=
 =?utf-8?B?c0VFRGswN0VGbXpPS0wyV25iSjZXWndmd0xmcWZWZUlHVDlpZDArMWd5RjZ6?=
 =?utf-8?B?ZEJHZzYzVk5lZENFeEU4NEJOaEM5VnRGTy84TmlJb0Q3aWZmRHhzbHBSOWIx?=
 =?utf-8?B?WmtSdXhiVEFtRVNiVk9KVGpkeGorOVk3bURsT3UvZ1l4Tmc2Y2UwU3VYWFBN?=
 =?utf-8?B?ZDk1UDJOaEFQMzQwdDMzZ0lVdXh1MmlkbEhrTmlTTXVFYzRzNkI5WVlXQlZZ?=
 =?utf-8?B?d2dJUjRhQ3diajA2M28vYytHRERvRTB2TXdXN2tJNmZnZjBIRGRNSGhQK3M2?=
 =?utf-8?B?MnI3Z281cWh5ZjlwSm9DRllSaTA4a3VINEY3WUFGRVNGdTFZZllqY2ZUa1dJ?=
 =?utf-8?B?MzU1cXltbkZmQlIzUUZ4bVVRMHR4SVdSSC92TkR6dVJnSEc5ZTNpVVJrdXBT?=
 =?utf-8?B?dndacUZJSjMwb1B0UmkzQjNGSE4wUDhrMWZUYmFlbWdHdElLY0pjcjZQVGpR?=
 =?utf-8?B?ejBoQWF3aTVINGxqR3IrbFEyZUxHZHIxSjhoalJMRWcyK1JWRlZNOUNxbHcx?=
 =?utf-8?B?UnJEUUx1QXpkZm5ZMHMwd3hFQnlBWjJyQVAxbnpOTXhQNTBMaGpaSWhEU0F4?=
 =?utf-8?B?dHBHT3JqUGJzZWNYMVNHZzl2NWRDVzl2ZUdPNmYzbXp1QmdIVVNlREllM25i?=
 =?utf-8?B?ZGw0UDhXZzBsbVNVRVJ5QWl2Zm4rMEV6N3prZXBJa1FqMjNzcWFnTmkxTlBK?=
 =?utf-8?B?cjVTeHliUjFpNWY1djczSE1MdFRDakVxeno1ZHgvOGVCRWhIZGswWi8zT3Bo?=
 =?utf-8?B?UWtXRFBMbzVGTHVoeVRzVkUwOFNLL2ZwWnkvZWhQbTZIMkpvdEpOMXRjK2Q1?=
 =?utf-8?B?NHpuYkFrZTJXREpFM25Va3lJcjh2NkFqYU8zUDdQeVVmWUIxczN1UGdSSno0?=
 =?utf-8?B?M3Bzc0RaQ2ZIY2hMZTNSc1p3ODRXZTFiT0ZOV1p1bWFjT2xGdHhrbXJlVjM1?=
 =?utf-8?B?cEVjUUVFYWNja2VNajVuWk9NUWlYVmVxRnM3MWZlVk1NSEZTRThSbEZhcSs2?=
 =?utf-8?B?U0hGcXlobytSbndaNDRFQ3puUWdZY09xWnBzNCt2dGJBRnV1dDBkdlVuTGxT?=
 =?utf-8?B?VTMvSHlGdUM5Y2U4RnZ2OElVQnZLWGFHQVZIUFpZZWdteGRmZHhMaUdITkZG?=
 =?utf-8?B?SzZFMklVNWpDRWhLR01DWThsZGRPSUxVeXJ5NXp5cHNRRHQ2dGhLMkR6MFoz?=
 =?utf-8?B?L2MxMGlJNTF6NEhUZG95dHlWUzVnQVJBTWN1Y3VVSnZtdVNscTNxK0tabkds?=
 =?utf-8?B?bUtUZ1FwcGwyamU4TUxwWVF2Unpmei83NzJ6emFFdFBZK0VSSVFYNDJDS0lv?=
 =?utf-8?B?K2U2cS8rek9rcE9Ma3N5MURNeDZSRnlLQ2NmM0o2bm95cWV3L20va0duN0Ny?=
 =?utf-8?B?cUo0WlBNellLUk83RmZGM3A3RTEzbGdvQ0dEZ2wzYWRyWnl0N05YZXpvdCs0?=
 =?utf-8?B?cWlMQUFCTWwwN244NFp0bFd0MHpTc095dk9IbXRTblRLZDh0OFBJbk1WdkxC?=
 =?utf-8?B?VExWWFBwZzRveVVLbGorc1pUSzZMSHRZUU1YRTEzMWdteXB6NmQvbTdabFhW?=
 =?utf-8?B?bjRNTjRqTmVtTWJ4d0pLODF1L0ZvMHQ0NzNJRDc1NnJuS2p2Rjg0NHBpS3dz?=
 =?utf-8?B?YkpCUndJbDZKMVpGQWpuNVBPZG1wYnhodXp6dWoyRVVWL2lQZUI0NkhNMjc3?=
 =?utf-8?B?VVA2dmxxTTNBcElmN1lLakcrTVE4WTFhV1FVdUlETURlUHhIYmloRVRaOURk?=
 =?utf-8?Q?Cx0bZsBFdz10GT9DwnttQ6g4C?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9e049c7-38b5-43a2-c7e4-08da68a4f6c1
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2022 10:04:55.1416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HxzGBZytRiROktzmuHl4niZzGhg56Xr/xQSaUVBMboOXHEAMvjOMD7qNm1vIQyhzPl+DLX+vmAtgWZAJQBtajA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7685

On 18.07.2022 09:18, Andrew Cooper wrote:
> --- a/xen/common/wait.c
> +++ b/xen/common/wait.c
> @@ -151,13 +151,12 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>       * copies in from wqv->stack over the active stack.
>       */
>      asm volatile (
> -        "push %%rax; push %%rbx; push %%rdx; push %%rbp;"
> -        "push %%r8;  push %%r9;  push %%r10; push %%r11;"
> -        "push %%r12; push %%r13; push %%r14; push %%r15;"
> +        "push %%rbx; push %%rbp; push %%r12;"
> +        "push %%r13; push %%r14; push %%r15;"
>  
>          "sub %%esp,%%ecx;"
> -        "cmp %3,%%ecx;"
> -        "ja .L_skip;"
> +        "cmp %[sz], %%ecx;"
> +        "ja .L_skip;"       /* Bail if >4k */
>          "mov %%rsp,%%rsi;"
>  
>          /* check_wakeup_from_wait() longjmp()'s to this point. */
> @@ -165,12 +164,12 @@ static void __prepare_to_wait(struct waitqueue_vcpu *wqv)
>          "mov %%rsp,%%rsi;"
>  
>          ".L_skip:"
> -        "pop %%r15; pop %%r14; pop %%r13; pop %%r12;"
> -        "pop %%r11; pop %%r10; pop %%r9;  pop %%r8;"
> -        "pop %%rbp; pop %%rdx; pop %%rbx; pop %%rax"
> +        "pop %%r15; pop %%r14; pop %%r13;"
> +        "pop %%r12; pop %%rbp; pop %%rbx;"
>          : "=&S" (wqv->esp), "=&c" (dummy), "=&D" (dummy)
> -        : "i" (PAGE_SIZE), "0" (0), "1" (cpu_info), "2" (wqv->stack)
> -        : "memory" );
> +        : "0" (0), "1" (cpu_info), "2" (wqv->stack),
> +          [sz] "i" (PAGE_SIZE)
> +        : "memory", "rax", "rdx", "r8", "r9", "r10", "r11" );
>  
>      if ( unlikely(wqv->esp == 0) )
>      {
> @@ -224,11 +223,12 @@ void check_wakeup_from_wait(void)
>       * All other GPRs are available for use; they're either restored from
>       * wqv->stack or explicitly clobbered.
>       */

Ah, this is where the comment stops being misleading. I think it would
be better if you had it correct there and adjusted it here.

> -    asm volatile (
> -        "mov %1,%%"__OP"sp; jmp .L_wq_resume;"
> -        : : "S" (wqv->stack), "D" (wqv->esp),
> -          "c" ((char *)get_cpu_info() - (char *)wqv->esp)
> -        : "memory" );
> +    asm volatile ( "mov %%rdi, %%rsp;"
> +                   "jmp .L_wq_resume;"

Minor remark: No need for trailing semicolons like this one. Anyway:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

