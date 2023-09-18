Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 370CC7A4990
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 14:27:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604006.941192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDL9-00055w-Sr; Mon, 18 Sep 2023 12:26:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604006.941192; Mon, 18 Sep 2023 12:26:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiDL9-00053J-Q2; Mon, 18 Sep 2023 12:26:59 +0000
Received: by outflank-mailman (input) for mailman id 604006;
 Mon, 18 Sep 2023 12:26:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiDL8-00053D-Fq
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 12:26:58 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7f27a42-561e-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 14:26:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9450.eurprd04.prod.outlook.com (2603:10a6:10:369::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 12:26:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 12:26:53 +0000
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
X-Inumbo-ID: a7f27a42-561e-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DHJVRUkxbadiDBl1D96pVRyvrDsL4dfuSD/HEsS/W9CV+Yv0lFxgiGhZucSA3AOQ2HEqvSCncCP9Epxf8XYF5U6dEOSal9l3d9fwWQvXGinX2apIECUVtYRoNLXPyuuwcchVyxNdHf9yzB8zdCObAmryZovLxQBKCBInBP3c7vgU3dorlgn45OIFX42n310MuPHXhAeIJ4Wd8OonnDQb2K7Dcb95ezI5eHgqhFqCXaZZLCRqmMqcZUBkGMppziqict3Mswx8utHfzfs+ffjet5lrs5X9uf6DswTD5CHE8QH+ocTeqraQDAwaeLFDeaRr59Tht0i3s0ZVp79pBYDLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWp2IpDs0vRp0OtYFPLQOBzJ172L9P4VXQe5K/mK7xU=;
 b=WRByl8mBXHrbAOJwPO3J+sHR9yVdSfEr/MEz9JiG1oLKstAHDB8DtBOCVpYCfqJke8XXRdT4SdrG51ExR4Yk+N/STvuwpzP88MwTWPJ+DBWQg0IEcq/YjQApm9D0d1GewcxBo7HGwg+f7Bh/UKoFP4qshPadQcIG3irAhu+ExMXpYsWwz/pkeFROS/4dxhZunr3XtB/NztrXC4PzFA6yZLO1rikU+BKkEasvs45DQoKIhpiHLQ86CeM98ZOdn8KU7Xjubxn7aeEEVW06tf2ny7J35jHO2nHpCayeNfRtX4pxvjLaNpCVb6vBxPXi16gYEWNDznj9JzU/40ApKnVvvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWp2IpDs0vRp0OtYFPLQOBzJ172L9P4VXQe5K/mK7xU=;
 b=J7ygN7pSLRCZyL+JJXxq6sINMypyqDoBhhxhiBmyTIL6g0OK0/IG0Dmm108UGwApIZbPICLh1XGuctI9wMnJF+UIXBbRS/r8iDYmPQWuEAAK4G5H93Pq678jHVYHaTfwJlfR3nWEjMBsYvCFTaPhrTX8aeRY84REKTbfdJnqYD4qaihb1DKbo3KZL4/HAou2nGdyfeAqdbzj8v6dfxwxiVfufFLoFOfqrvgYhbxnprqhgZK4Ys0oVLrcr4onmZ8YZqHNNEDVkRiilfC1Ozo3UjCojsvsx0Q0NOZ7IIyda1o2JDhhpRwe6pvFaKMmzr1Wdt3tWMMbn2IQtOYZiRW+Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e22af903-cbdf-dfed-8f69-44e5ea05ef8b@suse.com>
Date: Mon, 18 Sep 2023 14:26:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2] x86/shutdown: change default reboot method preference
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230915074347.94712-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915074347.94712-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9450:EE_
X-MS-Office365-Filtering-Correlation-Id: 239eb83f-23c0-4c30-1de3-08dbb8428a98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ovR/jgUY1N0cdIEa/wCCbBtkTFZYKSNshoA6906lm5zanYlegV5k18z0jS8w3yTXspkIlK+4shVxSUEqTb5pJ/f8TJaLZc32YjIipJYiSwlz+TouQhZWyeUl+mnJJlCw9k5pWNZgUlP/gJ2jWqcaShbAOFOune4GWG1c78kkD8YlUrbpZIX9ruC8aW7iFw0hlK4s8NO1KjjnK8fCs94Xm/GLeQgalA+Te1/xDs7z3oO/KRW6sXAODeOALoXI0mUqgjEkeqLNTFKlQJJxCtUXle27LWPMca1hMAIxGifQAjHhIwYwHTtaJvciLQaQhKizzAvhCd9P54tCyhMEiOwGBxzGbBuQpfd1O65JGOP8YRWZtB5QDiwGZLox+C+ZQQApiRtlGm1ESEXDTdhZUOVPKKOS/YE9m1Nqx768sJgIuRnFv6F2CeqVnWybwZshjanyJUYebn6uFf7kS6T/kcPZK3c19m8PAi9BJoeZSyx9KfxQJP7vtUG5LLb/9w7gH+Tkusyr/jcCiYvEz88rC3tEnfc5dmWShB9MAQwUdCALPjQJyIk/OpPTJSYExvWvxfK7okAX88rrVuWlKeIYl+Q7zI4tdLiAJiQvzzWW8zh1M4PsA/cWH3c9rubxu8SOXOeWR3J4rF0EspVlhWz8t1FOLQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(396003)(346002)(366004)(136003)(451199024)(1800799009)(186009)(6486002)(5660300002)(6506007)(53546011)(86362001)(6512007)(54906003)(316002)(66946007)(41300700001)(66556008)(38100700002)(66476007)(31686004)(478600001)(6916009)(2616005)(8936002)(8676002)(26005)(2906002)(31696002)(36756003)(4326008)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3o1ODJRWEplckhUNG01MW1xU2Z5WWdjelZ0cU9jMEdyTXZlYW9vSkRsUDVF?=
 =?utf-8?B?RjFZVDZwYXg5S1o1ZE5vZWJ0RVJPS05YUElCODJlZUt1T2hNRUNTWjM4WE0w?=
 =?utf-8?B?b2pKTnhueWQrbTUwVWExcmxsSkx2ZDRnWllCdEJIVXpHZ1VXeUhITFQ5dzYw?=
 =?utf-8?B?NkZTa21CWk01azkvYmJKWUlGVkZ4K2pvUEFJZGFCMFNlZ3pBWCttVU9jNWNS?=
 =?utf-8?B?U2RScHB6YUdrVURkaytBZGFCOFpMMTFBM3FWbE9wYm8rekxhMUlRNGpST2Z3?=
 =?utf-8?B?cDBoRHI4QzZVRmxtVU5ZN0pYdUF2enhjaDQ0QVVkQlBwSkdMU251ZVhxWlFS?=
 =?utf-8?B?QndBUGNlRUFjMVpmMkhad3ZYblVhaVBVNlhybjVmNThoTTZpc3FyS01sK2t1?=
 =?utf-8?B?cTN6VEd0Wko5K2hsb1NLaGFMYWNNUFE4eSt4TlJPQ2JtbjJtVDhZOVJQNVp4?=
 =?utf-8?B?OHFoUjk5M2pwM2s4ekNOQWR0NER4bkNnYWdHU2FJSGpVcFFYemVGOWI1NW1E?=
 =?utf-8?B?YkVoR25KZlFKQUtDU21sUVN1V3FSQUlPdFFEY1p4c09Ga0FUcGFSLzAzQW41?=
 =?utf-8?B?dEgrWGREWHlRUjVpT20wa2c4OHYrTUNSSFlwQlNLeXJ4VjNHUjJaTHFOOGww?=
 =?utf-8?B?dFdISExtcHlTZFMyQUE4N3d0LzhKMnJ4NkFMNVM5MTgyTkpHL244Q2k3OW9x?=
 =?utf-8?B?c09rSk1yQ2RwMlpmOTVvRkNOT28vdmc5MVhvdUYyam1hc1VKMFdSM1VxVjV2?=
 =?utf-8?B?ZndVbkwzODFJTG0zdHluNGkrRGpKU1hwS1JMYnpGaVVMN2R3SHhEakFhNjA4?=
 =?utf-8?B?QUk0K1luZEljLys2RFZKYWpaVGNreisvVnVXc1VqdXJDcVV6aG5qRlorZTFq?=
 =?utf-8?B?anFYOXhZNmczT0pYWlR6WEV6ZGNQbk9Qemc2MWUrWVVtYnZOVkV6NTE4dkVF?=
 =?utf-8?B?c3ZqQkhCS0ZyN3FuR2dkeHhjRUVkbzY2YkI4NmF0T2JoeWIxMU1qRURPaEJr?=
 =?utf-8?B?ZC9iMS9zNytESVdGQlRGZlRtOFhlcm5HMDZjWURnekptd0x6NEtsajA2WTJ0?=
 =?utf-8?B?QXQvTmFrMkx0ZC9zUlBvSmN3aGRsOTJMQ3pDNTErNzEvTjErTG5vN3RnS1Qv?=
 =?utf-8?B?MGE2Yi9FYUpPQlVkY0NiN05YVEprN0dBTUo2Z3pHMXVSKzlNWUp5cTJkeFA2?=
 =?utf-8?B?MU9Yckl2VHoydmlaeUdQUXFpc2lHTFZkby9yZ1FSY0YvQjkvQ2llN29SWkc3?=
 =?utf-8?B?Tmw3Y0VEUk9rS0tkTFRUWktPTjBoc2dRTjVXQW1LaWoxT3kyUEE1Y3dZWkNL?=
 =?utf-8?B?YkNveGZRaENmSWJTSzBZQWY0aEYyVmZwVk4zekNUK3ZhVDNlZUd0S3JvN3ZH?=
 =?utf-8?B?eUc3RU1QZEtobkhKR000dGdQcUxTakJTeEtUN1dhKzYyTkNraGlUNjhvV2Rq?=
 =?utf-8?B?NTJKSDN0eE83ZDEyTEROblR0eHUzQ2tiZXo3aG9xWGNZTzZKampxRXdYQUJk?=
 =?utf-8?B?MlpQQ0pDL0ZVMVVUK1hBMUh6VXNlM1U2L3l0Mm05QmhQY3N3NXNnUUUvakRU?=
 =?utf-8?B?YUFJQmU1aGwzTVJmOTZkSlNzb2dqUXg4NUQzRzMrV0xHODZ2UGZZY1ZKNS92?=
 =?utf-8?B?K0E4Tldmc2RUTXQrWklVMWF5K2MrTGROR3BtbzdFUDJaSVRvTmo4R2duSk1Y?=
 =?utf-8?B?RzZiWDY5NitBb0RKck4yL0I5QWxNOTg1Q251NTNwZnY2Y0VnOHV5WmNJQ0Zy?=
 =?utf-8?B?Z1dweWlNZTVqQW9RSTBudUIzTmpkcUs1bTVhRExObUtvVjk0S2pYbC9Eclkx?=
 =?utf-8?B?T2hhTU15UGd1WW9HTUtLeHFjUVJCWDBLOXhrK2ZoUElaYm1oRFZmMmg5QUZL?=
 =?utf-8?B?dUx1MXZtamxJS2JMdHZGWkNzTkpSYmZpTDJPZ1NPc2hXd21mUWpDdEgxazVV?=
 =?utf-8?B?VXlsaWFNTGhRWDdqQUNvelJZUC9zampnd3lDZXc5eS83MXp2bmpRczRIdGZC?=
 =?utf-8?B?aFpyNlc0NlZlYXdiOWQ5bklDU0hoR2dXdFJZenpDRXRlRUFxb212a2ZqVXVI?=
 =?utf-8?B?RFlqSFg1NkxYRXNieThXS0JkS1N1akRicGp0d2ZDMlRhbWw3cEgrQy9NalF5?=
 =?utf-8?Q?PoCCViL7M6Rqke4iG8A4Yh+gX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 239eb83f-23c0-4c30-1de3-08dbb8428a98
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 12:26:53.7190
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pDYQuOc9RMxMMTaemxcmIepcaG1ZTb6ZV6df2CYPE01ZEvug8uAEN6EYnU6+jBvOEFyDCXwqqIarVVOl7Np40A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9450

On 15.09.2023 09:43, Roger Pau Monne wrote:
> The current logic to chose the preferred reboot method is based on the mode Xen
> has been booted into, so if the box is booted from UEFI, the preferred reboot
> method will be to use the ResetSystem() run time service call.
> 
> However, that method seems to be widely untested, and quite often leads to a
> result similar to:
> 
> Hardware Dom0 shutdown: rebooting machine
> ----[ Xen-4.18-unstable  x86_64  debug=y  Tainted:   C    ]----
> CPU:    0
> RIP:    e008:[<0000000000000017>] 0000000000000017
> RFLAGS: 0000000000010202   CONTEXT: hypervisor
> [...]
> Xen call trace:
>    [<0000000000000017>] R 0000000000000017
>    [<ffff83207eff7b50>] S ffff83207eff7b50
>    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
>    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
>    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
>    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
>    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
>    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
>    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry+0x113/0x129
>    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idle+0x3eb/0x5f7
>    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> 
> ****************************************
> Panic on CPU 0:
> FATAL TRAP: vector = 6 (invalid opcode)
> ****************************************
> 
> Which in most cases does lead to a reboot, however that's unreliable.
> 
> Change the default reboot preference to prefer ACPI over UEFI if available and
> not in reduced hardware mode.
> 
> This is in line to what Linux does, so it's unlikely to cause issues on current
> and future hardware, since there's a much higher chance of vendors testing
> hardware with Linux rather than Xen.

I certainly appreciate this as a goal. However, ...

> Add a special case for one Acer model that does require being rebooted using
> ResetSystem().  See Linux commit 0082517fa4bce for rationale.

... this is precisely what I'd like to avoid: Needing workarounds on spec-
conforming systems.

> I'm not aware of using ACPI reboot causing issues on boxes that do have
> properly implemented ResetSystem() methods.

I'm also puzzled by this statement: That Acer aspect is a clear indication
of there being an issue. Plus it's quite easy to see that hooks may be put
in place by various firmware components that would then be used to make
certain adjustments to the platform, ahead of an orderly reboot / shutdown.

> --- a/xen/arch/x86/shutdown.c
> +++ b/xen/arch/x86/shutdown.c
> @@ -150,19 +150,20 @@ static void default_reboot_type(void)
>  
>      if ( xen_guest )
>          reboot_type = BOOT_XEN;
> +    else if ( !acpi_disabled && !acpi_gbl_reduced_hardware )
> +        reboot_type = BOOT_ACPI;
>      else if ( efi_enabled(EFI_RS) )
>          reboot_type = BOOT_EFI;
> -    else if ( acpi_disabled )
> -        reboot_type = BOOT_KBD;
>      else
> -        reboot_type = BOOT_ACPI;
> +        reboot_type = BOOT_KBD;
>  }
>  
>  static int __init cf_check override_reboot(const struct dmi_system_id *d)
>  {
>      enum reboot_type type = (long)d->driver_data;
>  
> -    if ( type == BOOT_ACPI && acpi_disabled )
> +    if ( (type == BOOT_ACPI && acpi_disabled) ||
> +         (type == BOOT_EFI && !efi_enabled(EFI_RS)) )
>          type = BOOT_KBD;

I guess I don't follow this adjustment: Why would we fall back to KBD
first thing? Wouldn't it make sense to try ACPI first if EFI cannot
be used? And go further to KBD only if ACPI then also turns out
disabled (a mode that Xen quite likely won't correctly operate in
anymore anyway, due to bitrot)?

As an aside, KBD likely is unusable on hw-reduced systems, for there
simply not being a legacy keyboard controller. Instead we may need to
fall back to CF9 in such a case.

Jan

