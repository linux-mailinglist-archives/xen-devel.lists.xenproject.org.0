Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE69642B17
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 16:11:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453858.711483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2D75-00020w-Ei; Mon, 05 Dec 2022 15:10:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453858.711483; Mon, 05 Dec 2022 15:10:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2D75-0001z8-Be; Mon, 05 Dec 2022 15:10:35 +0000
Received: by outflank-mailman (input) for mailman id 453858;
 Mon, 05 Dec 2022 15:10:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2Zgi=4D=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2D74-0001z2-2Z
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 15:10:34 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061e.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5ed74b3-74ae-11ed-8fd2-01056ac49cbb;
 Mon, 05 Dec 2022 16:10:32 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB8483.eurprd04.prod.outlook.com (2603:10a6:20b:34b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.11; Mon, 5 Dec
 2022 15:10:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Mon, 5 Dec 2022
 15:10:29 +0000
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
X-Inumbo-ID: f5ed74b3-74ae-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eAQGgoznrbu5lx7UM34NFnZMTIBOs0IF92xIsLXQZPrlxilYTnV+FMQFCm6Mq2jA6FJEQaV8psgMVSJgoTZHeY05Go1gMQfUfJcwzFZogj6imRpSSViCiFMqaocT3Gu2cfAaBNcE3M9YdSRT1VAaPHJG8z7Qw4j8InpuJ5AUWb3l7s5LqeIfAOFuayiIfoWZcR4PidvpJOj04DeJO1WbKXSJRWSpb+1yI3Cfxe/dp5LQa4QZtYPadmTaGfZMPteIxXCn0cCqMrsoUrWJeGTvXg5uvBvjtFS4gKaw6VOBOEGvJk6ACoB9Z2KU3AA11NcYnncySfzJWgSZYei14M+iCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XF3KLLQDBeFVayULDTq96vfdGNKn9zgiyygV7OvaiL8=;
 b=UL5r13Jb2Wq2/5Tht/SJu/hZYBo/09qvYfz3RhlYHz6Qe7aJRqAXdZZPmOpTTRU7hH0YAaTGRW5TeHlx4LXm+rUsRuCc1mLKJWNi1HBAxE9sl34J134cT2D7TXLqb1QANLR4Sdsgl4SxK62Zm5qaG5lwM07QiWknwri0oIpofjJDL85MaRlqlV1bzh9K4DrOJdaTavX3LzI5ANtNwLdPo+CSmAsPsTji9y8qQouetfHvo1RXVr1CJxUeZRTBl4qMwEXqIqUq4OY+wduRbVhzuxZ7Nagkuy2YyK547pqbJMGclpHUkFM3IwbO4Jo61S4/mHobQmBNa3X+R24M4T01/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XF3KLLQDBeFVayULDTq96vfdGNKn9zgiyygV7OvaiL8=;
 b=iWHPlLrAysNagVkXdVpj6WEPIuTXxFelK7s1r7b0xBofs+FYC2M6ZSKK+/4SdaXpce8o8HePOnI8qfNkdfzykAbpZV44io8KAkgZAbGU2TwuNJUD2eBhCPjtywxN6Nh5nLD5CEzYSQlhNlz570yWY6tNCA43YkaJQAERFcnD4nsq+T8rrxuPG9aaegqfVpJmeqHHht0CoJn+aCNh4DzzgxyGDz95JpfubMOZ9UvFVf0z/3S99rxeM1oRnMxGFxg4dtZW3FprSirEVtyfd3IMYl/3GgoZiLOLgfAYASJehsNLj/qyggQEWoNZEDB5N8dG94gtq2JooH7OL773SCpBFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <8f7e0393-8c0f-a924-7cee-25b9fca6f739@suse.com>
Date: Mon, 5 Dec 2022 16:10:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 4/5] multiboot2: parse console= option when setting GOP
 mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: marmarek@invisiblethingslab.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Daniel Kiper <daniel.kiper@oracle.com>
References: <20221123154525.63068-1-roger.pau@citrix.com>
 <20221123154525.63068-5-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221123154525.63068-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0126.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB8483:EE_
X-MS-Office365-Filtering-Correlation-Id: ad46486e-0f0b-4937-0f21-08dad6d2d8f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	oYZbhVnyTOl4nIJAEXLH2AN9KooGOYUVJ6fCNKKAA/qAnqUqE3SdzY8DPdYF/Ih1NZnFfaV849DZuY2OpI3nqrHZ4M7pWcqz/2JFVGMe+UVdPaf7YPALiYY7RL76sG7S0LdRBYiYb1GNBkNoRu2q9hJzZDWix1SkyvRHW7WYJXKmSrtQA5NEQSa4Lb51G1V5+ORyxblOIBskphyY1Adqp3st2hGhr29mzYiYClsOnkEw2NhlNd01+upfrlaQatAH3CU98aG1SLrgJ3kJrcsjE+05yMD/hLUe+OmEWh9P++pWLhdcgV/0p0aAzatPxaEffpLtaTvSxEOAgZ3w4nnTZDVGqDWOb1cvxYIC9kw+h79e6065WHfHDlPoBKp1ZxBedRpNb1Hw9/vvF/6X9d6Mf0awiyt6FN8HsWqXsDupz7BXgxcixe84+3FF9MMCLVJR0Cz51YGvZKUQaNqxCepaDaQK/39aFudp+jITlN2EmVzuilnnf0DOvNROlIqzMqPmiLLl58Uftql/MDKp7Ol/f4NsrtTA5wUdeyWA0m3H3UiRoFf6goLP6WYrZGWDpbohhIorh85KcHryfqGWvY1lLlzZogU9XLELo+JJBYE725CS5FZLb4tjJIdaw3EAuJRo6LHWOsY7+70qVFteT4X/8dURrNGOlRjzNAI4P3RAdYweevg+rxzH+K7mIBdxinMZ/++SW6ypp+qkkViLj/SjTNMZKfbMBoFDRYf7cHSqaEE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(366004)(39860400002)(136003)(451199015)(83380400001)(31696002)(86362001)(38100700002)(2906002)(41300700001)(5660300002)(8936002)(4326008)(8676002)(53546011)(6512007)(6506007)(26005)(186003)(316002)(54906003)(2616005)(6916009)(66556008)(66476007)(478600001)(66946007)(6486002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WngxU3plWmw0cjdTdGtIT3JaRnFiRVMyQzNFNWUzanlYcnA3WkJKTzNKTk1N?=
 =?utf-8?B?bHFRUW42emx6ZEcrU3BQZnhYSlpwZno2MEN3dDRyUk5tbWVrb1hSemFXUzVo?=
 =?utf-8?B?MnlkdURqVWdUbmlTMXpueDVGMUV4TEZ0ZHdqQXEzeVdmaXBvL1VwbTdIb3ZT?=
 =?utf-8?B?Rk1YcnBtYXNaNlg4S3RzaS9UN0N1a0Y1QkZKc1l1WWdyZjU0RFNGTlpzQmQ1?=
 =?utf-8?B?dXo5ZTZQb0xzdDN1VXBiTDBwRUpTR0pJWFZnQjRNeU9LSnN1WUVmd2VZaDNM?=
 =?utf-8?B?NlM2eFRYeEVJcjV0aGI2enVNZEN5N1g1a21jTlRKV3J2dVNyMzBwbkFPVzJU?=
 =?utf-8?B?TVVNUVNoaytheExxM205MzhBTXJod0FWZTFHd3pVTmU1S3BPS3dnQ2t6ZTFl?=
 =?utf-8?B?cUdDVS95MlQxU3dXekc4K3VZUFFrSW9sUHNuMytWRFRUSnRwQ3VmUGN3Skln?=
 =?utf-8?B?UkJyM1JlWFNXMXhFODJ3NzJ0NkQ3d0lFbzdJbWpvcWhYVDB5S2pRSXFXaHN3?=
 =?utf-8?B?UUFwRTltRXJZNDdtUUcvaVIwY2pWcE9CNVdwYStrNmhCbVZ1bkt3b3BySFI1?=
 =?utf-8?B?TS9XSEQzYTUwT0JKLzhWK3I5VTdTbUFTd2pTR3RrdUhtbVFCUHIxZUpmMWNr?=
 =?utf-8?B?ODEySzJSVjU2MDQwQWdKYWkvRFM4ZHI3Vm1rTnc5SWxWZEhrT0FQdkl5QlB6?=
 =?utf-8?B?elRkR2lLSktYWk5zSFpJS2V0ODEySXhhQ1h4UzUxN0tYMTJQTWgwVURzVnlt?=
 =?utf-8?B?U2M5ZTBMV2lVK1doODVmbHMyRU42OFdiUnhiMWgydkwxMEZnSXA4cWJiUllp?=
 =?utf-8?B?WVVGQzF1MHRXR3hFV2RnTi8yWXlCK2c2Y2NibEp5dDYwd0o1b3hGdUJ4K2Fu?=
 =?utf-8?B?c2hTSjZmNUJqQk85Y2F1Y3pUZW9lK28yZHo1RmV2RktaQWd2SjAwczBPVGhi?=
 =?utf-8?B?V2V5cm1MTEI5QUJRbTdRY2lxUXNJNk9FaHJieXBMc0RjTmt4YzNNYU1IbUYz?=
 =?utf-8?B?YnRJNEgwWTNvanlGQTJPRFUzNVFVQ0tiR1pDQ1lHZDlydGVkL3E3TTF6MkNa?=
 =?utf-8?B?aXFFZFVYNGhtRnR4Rk5PcDdocFpvNHJYWFRQNWg0ekcreG9CSytrSEVmemUx?=
 =?utf-8?B?SVhmbm9rQkJOVGY2eGRuTDB6eHNVbGhPcXp0cFR4eTRCSnF2bis3cktOMS9Y?=
 =?utf-8?B?aVU2K1VOeExRTDBkazArTDJqajB2b0x3T1BKNkRKOXV6OTJnYWNteEdzMUYy?=
 =?utf-8?B?UWl3a00vaDVISG80a3R2dkxqa214QzhKUVhhaCtJWHZHOGxrRStqbEQzR25i?=
 =?utf-8?B?Q2pHQWdaNVI3cm5rSGQ5MjNKbHQzZGcrNGRlcjhpTmNBVklUU3E3OUxRK0tR?=
 =?utf-8?B?UDVSRXl5d0RLRkVWQUlWVGROUDhqcElKUnF1RGVhL3htK1psTnhKdzNyTEZn?=
 =?utf-8?B?WDVqczBEY1RqTUJ3SWRuOFVHa09YY014dFNBZjgrYXpZZy9xcjB0aEtKckl0?=
 =?utf-8?B?RksyVVAyUWVYcUFKeThqQXNiUzZMeVdLbzJIdHZLSmphcDdkREFuV2dmSDVk?=
 =?utf-8?B?cWpzZW9xV0p6enhNLy9VZkJPVHFENVNBeEw3Yk1FRTBwdFpScHpOTUZOVDNl?=
 =?utf-8?B?T29Jdi9CR3l4UzJ2OVVmVWdveGp4d1Q3ZjhncVgreHhiMXR2cUlvYzZYUVc5?=
 =?utf-8?B?WXM2WDdCQkd1TUt1VTJOQUZIaDlqcUtUd2g5ai94Q0g3SE5Hdk9tZ0ZSMmUy?=
 =?utf-8?B?eSs1NTQvbDh6UnhVMVlBazFUMDJSSjVIOUp3eXV2WlloSlU1ZlZ6U25TUnFN?=
 =?utf-8?B?aG04SEs2Q1VvRjhIY1hPKzVycHFzRVVzcFlBN1ptRGU3VzFyaitCTHNvMExu?=
 =?utf-8?B?SVQ5NEJ4SDd5VnhNVDVOZUNnVjRZTjZaMTJvR2JKVWdnVXpQNDVMNDFyM3N6?=
 =?utf-8?B?cHVkdmYwQWQ5ZkhKVEdvQkpYSWZwZEpXUTZuL1lZSXAzK2dXQmUzc0FQL3Zm?=
 =?utf-8?B?MjkxU2ZHSzlCZUhCYlBGSWUzYjhwU3hTT3hWbUlLc2RWY3VwMm5XdjBLa1Rx?=
 =?utf-8?B?RlY1ZzJUUmVmMVU3VlRUNnhUQU03OEtjTXExZUdKR1VzYU1jS3MxODMvQmRJ?=
 =?utf-8?Q?Bqfdf3CzBJpaTu3aUDZbfTpXr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad46486e-0f0b-4937-0f21-08dad6d2d8f1
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 15:10:29.8280
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XR3Wg08dYulAr3Dh1EZbqB4gpiBey0J4cFNixZOUOwNibuPbSuNvqM1hJNtokEYjQpCumgBpxAeYC3bhfPE2YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8483

On 23.11.2022 16:45, Roger Pau Monne wrote:
> Only set the GOP mode if vga is selected in the console option,
> otherwise just fetch the information from the current mode in order to
> make it available to dom0.
> 
> Introduce support for passing the command line to the efi_multiboot2()
> helper, and parse the console= option if present.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> I'm unsure why the parsing of the multiboot2 tags is done in assembly,
> it could very well be done in efi_multiboot2() in C, but I don't want
> to switch that code now.

I guess that's mainly mirroring the non-EFI boot path, where the amount
of work needed to eventually enter C land is quite a bit larger?
Anything beyond that Daniel may want to point out.

> @@ -265,6 +266,15 @@ __efi64_mb2_start:
>          cmpl    $MULTIBOOT2_TAG_TYPE_END,MB2_tag_type(%rcx)
>          je      .Lrun_bs
>  
> +        /*
> +         * Get command line from Multiboot2 information.
> +         * Must be last parsed tag.

Why? And how do you guarantee this?

> +         */
> +        cmpl    $MULTIBOOT2_TAG_TYPE_CMDLINE,MB2_tag_type(%rcx)
> +        jne     .Lefi_mb2_next_tag
> +        mov     %rcx,%rdx
> +        add     $(MB2_tag_string),%rdx

Simply "lea MB2_tag_string(%rcx),%rdx"?

> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -786,7 +786,22 @@ static bool __init efi_arch_use_config_file(EFI_SYSTEM_TABLE *SystemTable)
>  
>  static void __init efi_arch_flush_dcache_area(const void *vaddr, UINTN size) { }
>  
> -void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable)
> +/* Return the last occurrence of opt in cmd. */

Is this sufficient in the general case (it may be for "console=", but
perhaps not for "vga=", which may also need finding as per below)?

> +static const char __init *get_option(const char *cmd, const char *opt)

Nit: The first * wants to move earlier.

> +{
> +    const char *s = cmd, *o = NULL;
> +
> +    while ( (s = strstr(s, opt)) != NULL )

I'm afraid this is too easy to break without considering separators as
well. If I'm not mistaken you'd also match e.g. "sync_console=1" for
the sole present caller.

> +    {
> +        s += strlen(opt);
> +        o = s;
> +    }
> +
> +    return o;
> +}
> +
> +void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable,
> +                           const char *cmdline)
>  {
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop;
>      EFI_HANDLE gop_handle;
> @@ -807,7 +822,21 @@ void __init efi_multiboot2(EFI_HANDLE ImageHandle, EFI_SYSTEM_TABLE *SystemTable
>  
>      if ( gop )
>      {
> -        gop_mode = efi_find_gop_mode(gop, 0, 0, 0);
> +        const char *opt = get_option(cmdline, "console=");
> +        bool vga = false;
> +
> +        if ( opt )
> +        {
> +            const char *s = strstr(opt, "vga");
> +
> +            if ( s && s < strpbrk(opt, " \0"))
> +                vga = true;
> +        }

Don't you also want to find a "vga=gfx-..." option, to avoid ...

> +        if ( vga )
> +        {
> +            gop_mode = efi_find_gop_mode(gop, 0, 0, 0);

... requesting a "random" mode here?

> +        }

Nit: No need for the braces in cases like this one.

Jan

