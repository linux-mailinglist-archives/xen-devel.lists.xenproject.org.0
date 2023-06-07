Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F076725AD6
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:41:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544621.850531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pfY-0004lD-4Y; Wed, 07 Jun 2023 09:41:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544621.850531; Wed, 07 Jun 2023 09:41:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pfY-0004ir-0m; Wed, 07 Jun 2023 09:41:32 +0000
Received: by outflank-mailman (input) for mailman id 544621;
 Wed, 07 Jun 2023 09:41:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdix=B3=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q6pfW-0004il-RY
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:41:30 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7d00::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a4abe3e-0517-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 11:41:29 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8979.eurprd04.prod.outlook.com (2603:10a6:20b:42e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:41:27 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 09:41:26 +0000
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
X-Inumbo-ID: 7a4abe3e-0517-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nRYOwSUlVPCP5tY1eOTIDNqe4KBjJTg4Rkv1+LO2fAB4BmaHOOmPFV4Zlw3k7nG9doXp4tUtml0HK0JfOflrgQq4K8HfUnmrmgaigfj/8Vk/PXBbvuj0YQirQZ8VcrmqBdh2duOxBRLuTcl2E3NFjGOBX6MN/0yiDWo2eYCp0KJOE6Uqz97DGv6bgLVmn8GSVOqd5Rgu0u5sKHcZa1GfPAtcBCBUT/bqdAGyHRPTtmlRjevMpqemCtdr/B3xGosHOldavEnjL0uPz2LjbUFZvBGErv1ZCFIkuemFkZ9FqlkCRfSVV+nVH5aZG6zi+fqX52TzYi0v119z96gBlcgsQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgiZ0t3JvhPPvFdp7H1rr5uqGPk/tLlbwEYKPq8KVdo=;
 b=LeGcxks24Lr3htX0jFIRHZxn1Sb11iKp+RCYvvJN/NClydzm6ofwFdM06ftVmhH757ipkhZQX0sjH5o4rIY2Cf7J7tSZzGzqN4u+mKh/bOfMCP2ilKGyXqynb4h5R9b0FujvP1aLfGQYeIg0qx6iBvVd6wNIlO29z2AT+9tf0JfFEqQYk8bs0ZPdHp9Ty3cDlaM/DUqLtaOMtx2fVWZhdwwjeo+9ECew7xQZWa+2k5JugZ/XG59iOg152xOvDmwWIYVMj/gHwAvIQ8PIpMRvXIIDLG7nGb6rvnva0M8nUFhysyEkyhCSxpxBbfAadFMENhYiT7efbvHU4IAUztL7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgiZ0t3JvhPPvFdp7H1rr5uqGPk/tLlbwEYKPq8KVdo=;
 b=bgBdqag0GRhjnzoluloTPH5Rni95/gY7G6I5+p/CWMox5Aa6PDbWL/jLJWbaGTMy/6GTwOkZsw8Kc72G2k0YrYB4b/q1MiEeUM9VPSowVU4QskheqLn8ds6rgw7MtrrNmVpCpHCKnJcjhpoUOtmQ9txI0iQcnCeo1KLXD9CRoSjJL9w41IvOh6G1SgOa/D1JOIXgnVdE0faG9U9wTaSyL5HL3K1hn9bvP+C7IiF7w1petzTZ1fyI5CaBoTQOAFxH9+8sn2ntptqJJbf01AAHKBbKZFKVHLz0QiQZHy7HdGGo0d1pmjSEfkDDKv6+sp0Trr9Agq2xkSMXNyol51+vig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2e194ebe-f8e8-128a-0ad6-227f8a9be976@suse.com>
Date: Wed, 7 Jun 2023 11:41:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/3] multiboot2: parse vga= option when setting GOP
 mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230601130518.48874-1-roger.pau@citrix.com>
 <20230601130518.48874-2-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230601130518.48874-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8979:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a4b34d-f951-4cd8-c42a-08db673b5d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FmCR3fuZMDSgeA7iVPbf9HdFaTgX1G6rbHtC/6GEFytPjKo5Te8ZlqfZtC/mK9/cRCmHelteWjUJeElYEPFNXqHtAVn1OUWKjAyeeybBsY7bFxnC68MMa9+l4Annf2fIdMJUrTwrzCi4dP+f1O2+e9gxY100Aq2/a7Mdqbv/WyfLx/+Gz7Gpuzsa1uYgVzseK9Q7iduk8eeesv1WVhgYTEs127CQ7LbiagiPGNlPHLrKEI8UF6TJKWgT7ldK6eroz/bUukHU0ahaAhZv09h3yBx+VCAS+qp+6G7x4IRx8MrfhYDh0EEeYGToCKMLv+VxHIquNzBzUk9C5EILrRX7hD3wHgVo7CQSHGJlujOJAs8obENQvMbgV8EgrpJGG7Gkqi16vPhHtIQ38imxHIJz46z+a3UDpEGKBG708JOcW7+WGwGQm+IQb5JRA2Szc6zfawOlkPZFVguDyW8gq6etIuEEPkqquspI2kcJbHN3yZlRhrbfdQ8OVB4kfRQcMGRYS+LEM+Veolg1HIOhOkADuO7ikuWFLQAAjTbGAlYFaWIZxPADRPfoRRyAVilQtpta2+1weIxq+DLxGf/bD9Crhv7H4pahpdwr3Q/p8E68m70ZaOvssvzTxpQZ7AHEE8Wb2z7N3DO7T9zwvIkzCT0CEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(39860400002)(396003)(136003)(346002)(366004)(451199021)(478600001)(31686004)(6506007)(26005)(6512007)(54906003)(186003)(41300700001)(2906002)(2616005)(66946007)(66556008)(66476007)(38100700002)(6916009)(4326008)(53546011)(86362001)(5660300002)(83380400001)(31696002)(316002)(36756003)(8936002)(6486002)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djhVTmdqNUxZSTRZSDFjS3pUSGpIL0RXanhtRDJEYUNpWGpQNUQzdnphL2hO?=
 =?utf-8?B?V0RkYXhLNlZEMjNGbTJpb0t1ZThEekVFYzMrMWpNYi83MlpPSm1lWFArMUxz?=
 =?utf-8?B?WlBXZHJTRVVTVlRsbUNJSFdjTk05TXlPLy9ySTFIWGFjVDhCa3c1QzB0YzFM?=
 =?utf-8?B?QkMwMThXT0Y2NXJOQmdEZDl6L2J0QjNsVTJJS3N4WmZGTUQzL0s4MlA4NXJU?=
 =?utf-8?B?TjRiVHdZaUF5WHljQ2JJZUdqS0ljS3JJVlJpOG5BMFlQZ21UZGxSc3dLUWEx?=
 =?utf-8?B?ZHBJbnQrbDRqSnlzOHk5VGhQbFFUZzVhOVF4RHdObFpRalpTOWNBN3Jlb3BK?=
 =?utf-8?B?cDNoeVE1Y2VGTWVNT2JqUzZTcFFLaHZOZDB6YStXSXJzMnZtRkhBMXlyK3Bp?=
 =?utf-8?B?RFVxTWJYTk94QTNBQ002eWdSUzFqa01kZ05Ib1JPL1BCT0ZDa29iZlV1WXQ4?=
 =?utf-8?B?Rk5US2pmZW5oZm44U2JGOGl0UjlyZjNSRHM4SjZzM01FVEtXTzQ4dlJZRVZy?=
 =?utf-8?B?bzFoSGgvcmlwQ29yVkYzQjhXaktBeHl5YmkxSitQbkw0NTcxVk5xRUtRb1lN?=
 =?utf-8?B?SjJlLytGNHQ0ejkxTHJBWDU1QWZjSWJOUkZDeEU1Mmk1VEdHbGpGUlFPYkFp?=
 =?utf-8?B?bFBScDZTTG9tNVcvaFFMT05xWDVHSW1zaWVtK0NaNmsva3pxanJQUmFFUVBQ?=
 =?utf-8?B?SHNPOXpScnFVU0htNHAyTXZnUXl0Rm5NVXNrVnhPd2pUTE9JMzE0KzhBdHZq?=
 =?utf-8?B?eDFYNnRGQWNmTlI2RmxTa3Zab2xGZWg4OHBFMlN4ZG43UGxsZ3c2b1pJYVJa?=
 =?utf-8?B?Mnk0ZnV5ME85MGpISTVNYXZXVUhBcEVtVVZuTTBvQng0MVJtcGFnRk4rYXFa?=
 =?utf-8?B?azZiSGl3SWcxY2twYUdubVJTKzlKR0owZjUvdnBXRnBJakpXTG1mYytrSjVq?=
 =?utf-8?B?TDhsT0JmN3hhallROUFBQzhZQU8zaWkvMHVmUzBlZ1Z2Z3lMQWdqZE5FdjE0?=
 =?utf-8?B?ejlhUzc4Uktkemg1RnJ1KzBuaU1qczV4WURuVVVZRUtkRUdLRW4vQmk4VVht?=
 =?utf-8?B?M3BzMGk4QzhEZ0ovdTlIVkF5MG9pcU1RV1ZCU0t6bzBaZVFYK1RrRk5ZMVF2?=
 =?utf-8?B?SU5aRWticTVoZGo3Tkp1ZHpVZTdyNWxMS0VIU1RyWmRwaDUzVlVwNVJNeFpU?=
 =?utf-8?B?VC81clVRRUNmZjA2S2pnUmdTbUJHenpTSXN5bFJqNjY0SFhQNXFjcUFOVGgv?=
 =?utf-8?B?MTFwK3J6NHdXcDlWSTVDeUpCbjUyWThxZmhlZ243emdNMEZvejNTZ3BiQWtR?=
 =?utf-8?B?YlpPRnl5cnNmamw4SWR0SCtGK1lFVkZ5OU1LN1daN2t4c2RQeDBuUkduclVk?=
 =?utf-8?B?TzZ1bHplRyttUFFjeGJId0lMNXZHNzdGYW04RHFTTFJGMzVWcGw4LzhFZ0h3?=
 =?utf-8?B?SVN4THhLWEltcG1GOFMwNVI2MStqOWpYcUxZZmFKM0NhRG10VXFBNWx5alJi?=
 =?utf-8?B?MEZ0ZmJZd2wxV0NvSWZuTzUzVVc4aEVlV1A0YytHYUdpN3B2akcxSjF5ZHpa?=
 =?utf-8?B?VXFZZ3ZQb3lLTUxkdk5lZ0NtejJtN0ltUWJ4aFpCSGhWVC81U3pzNUJsc3o1?=
 =?utf-8?B?bDVrQkZBbENWUzV4YzREb0o3dFNaN3lRYjNPdVRwYUVXc2dZR0FuNkxBaWZh?=
 =?utf-8?B?WU0zNDBVdEQyNUNYeHdVNVlob3REdnd5eWJrc083OFdib3JjOFM0dHZIc25H?=
 =?utf-8?B?bGJwMm1UMGlDU1hGZDNrQnVENUhaY1FVd2NzVThQalk4UEw4RUt5cVdyUXF0?=
 =?utf-8?B?aDBjdEFJcWpaaSszQjhsSnc5empSdGFxRzU5TkRtb0ZnT3ZHcmFKQU5QTys0?=
 =?utf-8?B?UlNTYXJLQWxvTkJyalJ1OGJ5V2kreGpKTmdlNDNtZ0NsY3BMbTdmRmtqMmZx?=
 =?utf-8?B?R2JRVWpYbTRhdVdFQjE2MTdvSTRzd2ZOSGM4Y0Y4MnNoWHJLejJWdkl2cGV3?=
 =?utf-8?B?aHVDWnk0ODREZjFpNmN3Y2JtV2NKcFVaaGR4a0xNUDFmaGlpdVZYWGd2VFAz?=
 =?utf-8?B?TEFrUGV0VnQ0eXJXbXJyamJ2V21YMDdqQ3owM2JIbTcza2VUSmVMMDcvNHFV?=
 =?utf-8?Q?ol0PVWoUYVx3GFiK3EKEW+RjM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a4b34d-f951-4cd8-c42a-08db673b5d2f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:41:26.8234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qboTaVyBeOYk6/JVA+Y3PNMICZyD1GfbwrTsEu5xWDythzeDvJnqV8D0ldQjzcPTpj0vu8SlhQM/Zg2VTAnkUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8979

On 01.06.2023 15:05, Roger Pau Monne wrote:
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -226,9 +226,10 @@ __efi64_mb2_start:
>          jmp     x86_32_switch
>  
>  .Lefi_multiboot2_proto:
> -        /* Zero EFI SystemTable and EFI ImageHandle addresses. */
> +        /* Zero EFI SystemTable, EFI ImageHandle addresses and cmdline. */
>          xor     %esi,%esi
>          xor     %edi,%edi
> +        xor     %edx,%edx

While perhaps better to leave this as you have it, ...

> @@ -266,6 +267,13 @@ __efi64_mb2_start:
>          cmove   MB2_efi64_ih(%rcx),%rdi
>          je      .Lefi_mb2_next_tag
>  
> +        /* Get command line from Multiboot2 information. */
> +        cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE,MB2_tag_type(%rcx)
> +        jne     .Lno_cmdline
> +        lea     MB2_tag_string(%rcx),%rdx
> +        jmp     .Lefi_mb2_next_tag
> +.Lno_cmdline:

... in new blocks of code I think it would be nice if commas were
followed by visually separating blanks.

> @@ -329,7 +337,8 @@ __efi64_mb2_start:
>  
>          /*
>           * efi_multiboot2() is called according to System V AMD64 ABI:
> -         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable.
> +         *   - IN:  %rdi - EFI ImageHandle, %rsi - EFI SystemTable,
> +         *          %rdx - MB2 cmdline
>           */
>          call    efi_multiboot2

All you obtain is a pointer to the string, which is fine from what I
was able to establish, but that's not entirely obvious: The MBI
structure used has a size field, so it could have been that the
string isn't nul-terminated, and hence the size would also need
passing. May I ask that this be mentioned at least in the description?

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -786,7 +786,30 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>  
>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
>  
> -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> +/* Return the first occurrence of opt in cmd. */
> +static const char __init *get_option(const char *cmd, const char *opt)
> +{
> +    const char *s = cmd, *o = NULL;
> +
> +    if ( !cmd || !opt )
> +        return NULL;
> +
> +    while ( (s = strstr(s, opt)) != NULL )
> +    {
> +        if ( s == cmd || *(s - 1) == ' ' )

Iirc I had asked before: Not allowing for at least tab? (See
cmdline.c:delim_chars_comma[] for what the non-EFI parsing permits,
which in turn might be going a little too far especially with
permitting comma as well.)

> +        {
> +            o = s + strlen(opt);

I don't think the comment ahead of the function describes this
behavior, i.e. in particular the adding of the length of the
option.

> @@ -807,7 +830,41 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>  
>      if ( gop )
>      {
> -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
> +        const char *last = cmdline;

Nit: Maybe better "cur" than "last"?

> +        unsigned int width = 0, height = 0, depth = 0;
> +        bool keep_current = false;
> +
> +        while ( (last = get_option(last, "vga=")) != NULL )
> +        {
> +            if ( !strncmp(last, "gfx-", 4) )
> +            {
> +                width = simple_strtoul(last + 4, &last, 10);
> +                if ( *last == 'x' )
> +                    height = simple_strtoul(last + 1, &last, 10);
> +                if ( *last == 'x' )
> +                    depth = simple_strtoul(last + 1, &last, 10);
> +                if ( *last != ' ' && *last != '\t' && *last != '\0' &&
> +                     *last != ',' )
> +                    width = height = depth = 0;
> +                keep_current = false;
> +            }
> +            else if ( !strncmp(last, "current", 7) )
> +                keep_current = true;
> +            else if ( !strncmp(last, "keep", 4) )
> +            {
> +                /* Ignore. */

Maybe "Ignore here, handled in ..."?

Jan

