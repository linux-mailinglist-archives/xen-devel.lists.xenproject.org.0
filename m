Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B746074999C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 12:43:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559832.875187 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMRU-0008EH-7V; Thu, 06 Jul 2023 10:42:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559832.875187; Thu, 06 Jul 2023 10:42:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHMRU-0008CN-4m; Thu, 06 Jul 2023 10:42:32 +0000
Received: by outflank-mailman (input) for mailman id 559832;
 Thu, 06 Jul 2023 10:42:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHMRS-0008CH-OC
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 10:42:30 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2055.outbound.protection.outlook.com [40.107.13.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cdbb3f2f-1be9-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 12:42:29 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAWPR04MB9806.eurprd04.prod.outlook.com (2603:10a6:102:389::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 10:42:00 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 10:41:59 +0000
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
X-Inumbo-ID: cdbb3f2f-1be9-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=j+/0BNIEjvT/PdUV8eZdurJhMpcP0IJdhq7ZtDHaJNbOwBWwSW+DK9RxogwED0TCbCDZuy7+z6fru8v9//gnYQVj0wRxL/V/Ym/LNreUZz+ANMgP/hXBCfuwyCYhItVJ4mQ5qFN2jfmkLUjgo+VPKRwvruGw4ePUxRJlUAVPFCR4RxKjcn3ztLH/W65gk6YJt+T1xqkPYr2m0iTrx3T1jVBpBMIMTeWBnrrZMN9amONfnTAdHA7h6I+UitRhVMpm3I/wRayUsU7TQ/fiMMsa8bUyoDfYvPWvc+eqHcPvQib8JP7l5eRaGGOdFqWldLNzyoK3ELmwibZhCVaImqxssA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6GIA2cEGWA93UR7I6adr6dZSo5gee1gyxHc+wJ8ZC5g=;
 b=V2xbypczwDKbehjnqyoUulRpmTiK/uZn8ol6DQgsk8+b+KTfRgwrVLO410NPxIC/hALyozMBPXXu5w8uapDYIbcuD8zWZRUi1awdaY1bgp3/xshzEktzmUryf8ahJKV9/5Ve7aaamhi2gN/zaf3KtzH7Y3ydlgJClNzPRsmOj8bps+scUFQHA8yzqXbsttkWBirE/5XWqLqdaMr9DvOXXnSuM2piDDAGVOEjn7yS9WDHmYTZz22j4g8SF7Hk/jJ3cE/A2V/rcq3qmLevaE1EdBmvdKcTck9CZWFnwJLNQboryhuIlnEKuMZ3B8fOjtAktOaEO2T1DJwZ7MlZV1SC6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GIA2cEGWA93UR7I6adr6dZSo5gee1gyxHc+wJ8ZC5g=;
 b=iax0HbeppCnQSQg8DgpePEZjh0Y/oojSKSti2UFUQImKcAWkqHJREMUdvmTqo+CQIAS6migg+42mrL/8JDw6VnyO7p/XaBbJi7QEYodwxUdViG35E7qkpIwpjEZOarTUTleiH+si6GpxVY+nDd2UmLBcB5pdPmsL5I+KCBCyUQkNryl/jn+Ya+Y3UXehMC7cU/PzEye71AxNZemXyHwpQzvvv6zVXvbpTDEVlrWGi1cIPZgzG3MTn0mDqnesWzNBKTbdXOHQs6QZdQV6fn95l4zwZTnGWCAa2DK7cdm8gi61lAWscKIo1COs+ILuvBUMZdqnXtJ9bQZlZUEJLT3IeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <47cc5f67-973a-2095-932f-6ebea2d3bd9e@suse.com>
Date: Thu, 6 Jul 2023 12:41:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 1/3] multiboot2: parse vga= option when setting GOP
 mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230705114741.11449-1-roger.pau@citrix.com>
 <20230705114741.11449-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230705114741.11449-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAWPR04MB9806:EE_
X-MS-Office365-Filtering-Correlation-Id: eb171eea-63c6-44ad-0b6a-08db7e0da0ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tnSQozHERjO48he4ZJo0rU3/IPldrRM96Wuwyg/5gjh9R5ancUpSdyvdWkV2ZHAUCgxhnNEElNhuuauJfJEA4bLcIqvOkk9zAm6cXTJAGrXhgkcNyauP7o/fEVZVM96Chx/wk6gNWxrttR5PUO7PKqyPG+r8IK+6ul78Z4ds12PNAqFaml7gDLhpcAwz2eQwdveMRGXesGwLYIgOniaQtdoTvAI/YYRpY6+rJwWR5OXQ15L6NnRQgVDEzEacu0A6oIQq6cCHiAAaTNq8RgZcAZopCY5klulatlWy+Y8pTS3B57dNsDR4V2g6jQATB8DpmdyoSFvZnbUIyekXpmnosQkD8o6gdcGIKOyVRS0jN+xVfZ9efWQoNleC3UXObWAz+GmXBU0Jv5aYDqxX24O1gPaRWM0PQ9fXC4AC09z/JxGvYLjDOHKqHygJeis/nEvIruHIFXdkYUMiYr3TmCrDW+F0u5WqrAci0ptz6AFGUICPF57Hx8P2idg5gbWwuhOPCaFVkFNpzJSPhdRqC7bGf9WP2G/anZUsayrAyXVO5GO8OnzFy/UbkjXb+Jvt2s9XGtxt2YHG/Fn3s0HS4zmMxClOXO9TGPQuCfLlNBsTAIk+tN4cta0tmDIzYWhTWr0CoK1tqnrzigFt/mngjKTqrQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(366004)(346002)(136003)(451199021)(6486002)(478600001)(54906003)(83380400001)(2616005)(36756003)(86362001)(31696002)(31686004)(2906002)(66946007)(6506007)(53546011)(186003)(26005)(6512007)(38100700002)(316002)(66476007)(6916009)(4326008)(41300700001)(66556008)(8936002)(8676002)(5660300002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YzB4YnZ0RFhmRDR2cTUwVzdtN25ZSzAvRmpHNk1RZEhVODlqNHdSSlg1SUJO?=
 =?utf-8?B?SWR1QnFuWmpjNTd5cEZwQVd5M3A3ZWNhd2pkS3ZlUWo0RExsbUxQN1ZTWXAx?=
 =?utf-8?B?Zko4V1owdmp2Z1E5Wkl4WHFCbm9nNUxER3dOUWZLL1c1RWZocEd6YngyVURU?=
 =?utf-8?B?aUVsdDZib3A1TW9JNitraGEvckJEenZCM202RThQWTM4K1hZekl1OXNFS2pt?=
 =?utf-8?B?QkFPK1hVcnpGQ1FxTTc0Nk5tVXpOYkZFMXBmdFFlNlMxMFk3V0VIZXp6dWha?=
 =?utf-8?B?bHpBMEVUWE93UkVwcXlWYmlDeDdJazNNZFVqVjZmRjJGYisxVnAvQVVrN3N6?=
 =?utf-8?B?K2xJU2FSVkU3Q25Fb3FyYUZWMUlxQ2ZxQVF6aUpDUjlGSkR5UWNPVFM2cTcv?=
 =?utf-8?B?c1c3N2lOQnlJS09MMVhLR25NUW10MjRHTW1SbFU2a0lvMkppNjlMcU52STZV?=
 =?utf-8?B?NDdrQ2Z6YmpBb3JoUytPbVRaWEh4Q0tTZUYrZHRlN245MW5wdjdLTGk4T2Ex?=
 =?utf-8?B?VlNxN2k1ZzE4MmNCakRZWm5jeGt1aFJiV1FRSDhGTE5yUG00V3kyRnhlTndV?=
 =?utf-8?B?VFVjakpTbk9MREJnZTRpWkwrNkRmbnR1UzJtTlNpaXZCN3hoTDUrN0hSaTBm?=
 =?utf-8?B?YVdXYS9VM21BOGpYeWZzdFZXcjVNVmJrNUlxT2RLWWpjb24vVE1nNkdVLzQ1?=
 =?utf-8?B?R2xHL3hYNVhJQXRHQ2JWclYrRnkvUlBtelBTOVgrR1ZWQUtMSFhYc1JqcENF?=
 =?utf-8?B?ZHNuWXp6bEo4d2VkSGEwZU9HcUdOYWk3RkhGK0RReUdBNlo1SGdTTXREcnd5?=
 =?utf-8?B?ekJ2TXZxZXBCOUdybjBsd1hpektzSHR0L2ZCUlVERGNZeE1WajFUR09PNUps?=
 =?utf-8?B?WC9ML2ovR0RrTlcxd1F6WkdQT2FzWG9XOFJkbUxpSUhLQm1zM1AxVTFlNFps?=
 =?utf-8?B?dStHeE9GQ20vaWtHVHAvcHgzdDd5NUF6Y3hITExCSzFxWEtTb2MxWG1XcnV2?=
 =?utf-8?B?MjRkWkhPMFREaGw5M3dUa3FHbGd5VGxuYjM5R0lMYy9oZ0Nac1BkaVJuZUtw?=
 =?utf-8?B?aG1BMXVuU0Izd2hpbjhVOWtGY09KY1VEQmpPNHgrMlNkZTdCcDB6MnFZbm1V?=
 =?utf-8?B?N0dnZ2szcXA1cWxtaWppd0J5clF5T01ya2lib3hiQ0EwSGZOVFBsQ09VcXZh?=
 =?utf-8?B?ODgvQXlRMzVxdUV5YW84RVdKNVVQWmgwck8xc05SMVB0ZXN1RVE1d3FqeEtv?=
 =?utf-8?B?dklSS0ltNUtjR21NSUhNRFZSWUxmWk1oWk5TR1FncWdEV0NhcFQzTzkrS0pX?=
 =?utf-8?B?ckl1VHdsRERmYlJBWm5BSHJpZVdLK1d6akdUdjQ2OVppVkFHT1RFVzlkV29u?=
 =?utf-8?B?Ui96b0tEamtrQXduTWE0RW5yWk1hV1ZtcDExVmVHY2x1dU9FSXNWbmppVit3?=
 =?utf-8?B?YXhYRFJ6Mm1DcEpRc0FQdEcwZTBQdHVoeDM2S1VDZlBVcVBEVTVtdGVERzZE?=
 =?utf-8?B?MVplREJ0V1dsc2krWkN3NkEyL2VxSTFmZmt2YmEvaGtVUks1L2QzVllpY0JQ?=
 =?utf-8?B?WDNYTm5QekhGK29LWWdUQXRJUUdiUWczbE9wOGV2RXMvQXVxOTBzeVFhM0tq?=
 =?utf-8?B?d3Y1RXNkVFpHOHJSR3lHNkErWWRCUTVPRzZSQjRVMnVJbTVMOXc1K3NWVEVi?=
 =?utf-8?B?aWhFRENqOUlUODVSbVAxNytCdkFISTFQUW1EYlpwZEErMFJqTjlTb0crVlhM?=
 =?utf-8?B?NkswbE9wdzVTRFpBSlhJeklhZTZCYm9Eb3puL0crWlJORCs2dm1iZnppbDF3?=
 =?utf-8?B?WHJGR1Vnak5QZkNZNlplVjcrNEI3bWhaZklkV3Y4RU80MEExS1FhZ3plVEVY?=
 =?utf-8?B?c293Qjh1STl6dXhGRStrYXJ1dFdaMlp1enNETEVLaDJwV1ZYdk92NlRnM0xF?=
 =?utf-8?B?cDBMUlhDNFhPYjloc0lVbGxlb0ZzbUxwaWltSjdYQ202QkpMZnNKNG1YQWUv?=
 =?utf-8?B?MjI3Z250dVpsQk1pMkJMZlBIUGVQNnRuMzFlRXVsWXVHcWZaZzBZeXlLMldT?=
 =?utf-8?B?NUZyaGI2NlBKZWwycHpETC9oZmw3Ni9MVGNsdnlPU1U4UDJFRVFsRHlMRDB2?=
 =?utf-8?Q?yKjNiVQx8x9nT6CmtqEPykui5?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb171eea-63c6-44ad-0b6a-08db7e0da0ad
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 10:41:59.9626
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BAX4vE52JGUOIrUZ5mF49KLK3fVMfq1U7nfZm0bZJbhv4rO+c5jlQGhAaqvKsuUVktCfihZgAls7+AysdUADWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9806

On 05.07.2023 13:47, Roger Pau Monne wrote:
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -795,7 +795,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>  
>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
>  
> -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> +/* Return a pointer to the character after the first occurrence of opt in cmd */
> +static const char __init *get_option(const char *cmd, const char *opt)

Nit: __init and * want to change places.

> @@ -816,7 +839,54 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>  
>      if ( gop )
>      {
> -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
> +        const char *cur = cmdline;
> +        unsigned int width = 0, height = 0, depth = 0;
> +        bool keep_current = false;
> +
> +        while ( (cur = get_option(cur, "vga=")) != NULL )
> +        {
> +#define VALID_TERMINATOR(c) \
> +    (*(c) == ' ' || *(c) == '\t' || *(c) == '\0' || *(c) == ',')
> +            if ( !strncmp(cur, "gfx-", 4) )
> +            {
> +                width = simple_strtoul(cur + 4, &cur, 10);
> +
> +                if ( *cur == 'x' )
> +                    height = simple_strtoul(cur + 1, &cur, 10);
> +                else
> +                    goto error;
> +
> +                if ( *cur == 'x' )
> +                    depth = simple_strtoul(cur + 1, &cur, 10);
> +                else
> +                    goto error;
> +
> +                if ( !VALID_TERMINATOR(cur) )
> +                {
> +error:

Nit: Labels want to be indented by at least one blank. Here I'm
inclined to suggest indenting to the level of the enclosing curly
braces.

> +                    PrintStr(L"Warning: Invalid gfx- option detected.\r\n");

Maybe better PrintErr() and no trailing full stop?

> +                    width = height = depth = 0;
> +                }
> +                keep_current = false;
> +            }
> +            else if ( !strncmp(cur, "current", 7) && VALID_TERMINATOR(cur + 7) )
> +                keep_current = true;
> +            else if ( !strncmp(cur, "keep", 4) && VALID_TERMINATOR(cur + 4) )
> +            {
> +                /* Ignore, handled in later vga= parsing. */
> +            }
> +            else
> +            {
> +                /* Fallback to defaults if unimplemented. */
> +                width = height = depth = 0;
> +                keep_current = false;
> +                PrintStr(L"Warning: Cannot use selected vga option.\r\n");

Same here then?

With these addressed (which are all mechanical and hence can probably
be done while committing, as long as we can reach agreement)
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

