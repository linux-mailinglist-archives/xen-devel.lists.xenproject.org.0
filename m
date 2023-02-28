Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E176A5463
	for <lists+xen-devel@lfdr.de>; Tue, 28 Feb 2023 09:31:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.503108.775267 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvNh-0006pi-3J; Tue, 28 Feb 2023 08:30:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 503108.775267; Tue, 28 Feb 2023 08:30:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWvNg-0006mR-W9; Tue, 28 Feb 2023 08:30:40 +0000
Received: by outflank-mailman (input) for mailman id 503108;
 Tue, 28 Feb 2023 08:30:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rjMb=6Y=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWvNe-0006mL-R1
 for xen-devel@lists.xenproject.org; Tue, 28 Feb 2023 08:30:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2080.outbound.protection.outlook.com [40.107.7.80])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2cd2aa99-b742-11ed-a550-8520e6686977;
 Tue, 28 Feb 2023 09:30:36 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB7697.eurprd04.prod.outlook.com (2603:10a6:20b:2d6::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.30; Tue, 28 Feb
 2023 08:30:07 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.030; Tue, 28 Feb 2023
 08:30:07 +0000
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
X-Inumbo-ID: 2cd2aa99-b742-11ed-a550-8520e6686977
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jpmXQOg07UfoaNStzobtvmhaw5PzWmNgAObeoA8PWn25pwMhuM6l35M7Pk0LEwLRTe5tGRuf7/VR6j42GaiiMcKeRgHm2BxgoJmnR+K3XMPJVMeI6+Wl/qQAbePDqidG9G5v2aPf81KIHjCxX+sS3X0pwrWcrOcTdMc8UxUWVfaQTnYueo0ziwv1qBsl2Ty1z1dBWm+5HNlW3nnNdF7W4ewX1GqEUMSNge2hyS2HV7mvJlxPjm420Ldp5vyy7dTW5y9C3tQyAxcedRKfXvF+p7++x9UgQXG+ds6igTMSF5UCUkesEQ+LbDS2mcJrkOzpZQNHNnSWWfQZABfcbJVMzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwf21ZBreCLvl8McYUksuSerg7uKP6mlEmgasvp9ifQ=;
 b=EzY52TvSjhXhDj2zTvwBI4R+i9Na5M9YsC0y1dWYv5LCECHxH+qpxInyOPjz8Kv0jAajkJeUHIjX1c2Ye+0HomUVLd3zZQAg35T5b8kzpg3RESb0G0R3DBeNLFzVGaCJWQlZhFENDbw4Lsbte0k7ah1PSobzbwVgZE8C6PuKEDESnlaZEMTpuqk6XHRa2OjWWkbUePkmkPoJy0ZBtabUGGkOLHCpKQXm3m9ZtS0tal/UuZsWdl3KXziesnvD43EebZIQFOWehlbg4IGhUYxRYaxjZ+bXTOJDZegYcglgXnzdAUHKuvVwKJzK2jYmKPafBJIJNYRVVdO9nFUE6I18+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwf21ZBreCLvl8McYUksuSerg7uKP6mlEmgasvp9ifQ=;
 b=To3qr9kxPpkn+d+kYv3U28jE9F5BeoQvSvGtCySGF8hzek1+MsWPEnchnE8iy2uMgR053Dmg5rVkAtqJKIc9LyTkX7vWpjiqnuQUWDWeHgey1Ahrdwad59EoKniJR3mGwb9ETAXGVwm9gf0oU7dJkS1y+8maulISRKIbB1qOMOj8toUgDDH4FleM7ZPTOeF9tOJG+hsL82HUh0qbMQAoRQkrG9YGdch1fyBM4106jQkhDF8+0gf5aR0HKPIYjNhCInwtNfTdy6xF/ODpPp/mhET112JtpSQMavjSS1OwqcQq6BW1ARr36KetY4vRKV0Jar40oGdAwXpFjJ8EY9Z1fQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ad4f8624-6420-8b6c-829e-828ffca9bd1e@suse.com>
Date: Tue, 28 Feb 2023 09:30:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2] core-parking: fix build with gcc12 and NR_CPUS=1
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Julien Grall <julien@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <3e72f386-7afa-84a5-54c5-14d17609dac7@suse.com>
 <3ca0416c-0d16-1345-0d42-6c66759e477a@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <3ca0416c-0d16-1345-0d42-6c66759e477a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:98::9) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB7697:EE_
X-MS-Office365-Filtering-Correlation-Id: a0c4e4e9-a6c0-412e-ae12-08db1965ff65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Ufnsolse4lmln8KlCowRv2xzCh0RnPY2d64OLLsIHb6KpK12NR5Mhrqrk3u+C/wHNYE96GifpLqgH3RQCUVVnuLaFiQT9AOhkBWoK7NbCr1+ismcBJJRFzqIszaFbaABTIvAxjRruGjRU3ipNc2J3QWEX/bxELu6dxdiiiNabPlAP2wvJLk3V76aixxy8p2qprLbGiYVa/Ly84QYJps2msHfnRwLIYqyhPfw5SOVP0IYu5zlCdbdkYgOXCROUAq1dQv7ht9NGZlMsQg9+nh0Q1nrAfUf9GUwF7gaeqg8tN1iqTxYzKvNplxMQM/4OzVyybqXybsHRS6Slf6w4p3XZYyDOxXBeLCEFRFbJXtTvqfP6BopM94rIxg8UJ3S3SqL7GO+2beEAdqfpBgH0ToFijk/UmYRYXwJ6+Izqebz2A4GCBt40cJt8u0MxDm813WgEa+3EPiNX4CfyzdOvMeZtklnIFlUGAgGnDrLDP8OZ5nHgQZkK7ujHjhrftC5PcVF1L1l4H1t1XVtupNChRskYLobHri1v8q++IM/mgGvNI8bPRUUcRHGz8FQ+sHl1zbxSXZ0Bh4Lsq9YYhHdtk6eaiX5UDGyw/4ZkaLhqwuAOIuIgeNJIL7wlQqeG8dhAQWQxZq1LGoEaCrr5QVg3AmOjf7EAqcUk5Ws4heBJWIGT6mre1nHLjP0IBEb7PlUVU5SGbjU75RloPsFhwKhQSCM9CQtI28PJE4e6V0qO6eoJ/g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(39860400002)(366004)(376002)(136003)(396003)(451199018)(31686004)(86362001)(36756003)(66476007)(66946007)(66556008)(41300700001)(8676002)(5660300002)(8936002)(6916009)(4326008)(2906002)(31696002)(38100700002)(6486002)(478600001)(54906003)(316002)(83380400001)(26005)(2616005)(186003)(53546011)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzZPUFZ0UHNUK3lPSTl6TFRwcE1aNjFZaG1TVkkyZzdaYUkxU2Q0bkJ0Yk1q?=
 =?utf-8?B?aGVnTEV3L3lHUDFKMXppbWoybkcrZy92VWx2bWlXR1JWWHd3UjExM3lWL2x4?=
 =?utf-8?B?c0VveG14YmJkcE8welh3VElZQ2FRTWdzTUZRaUtpcGF2V2JrRzBEeFVNOUth?=
 =?utf-8?B?dVZhQXBtQmo1MXBxWUwySFRLWDZxZ1R4Z1BjQ05NcDQxUXpXTmJ5eVl4YkdX?=
 =?utf-8?B?OFo2a1VuUVlDbXdWVjBYNGlnRWNzRllQamlEV1dBUFkxSlA4ZGZ2eUlEZGZy?=
 =?utf-8?B?bGt1LzhYQWpBcElDNmZ3bWNUUmlubmxiWVBLcHZDRGJpVngwREZlbjJtUmZL?=
 =?utf-8?B?WjJiRkptSk56VHBnWjdqKzYvbFl4YnEzcEJUdUZFemV3bmJoTnZOeFY4aDZw?=
 =?utf-8?B?bjdoTC84YnlUTHZtL1ozaDNzSUxqMDExR2dMMDRybk9oRDNKWWlYdHNkdGdL?=
 =?utf-8?B?cThDNjN6Ylo5d1IzMyt6cEZXOXJVbUI3aDBwWEFwUFZXTG50eTVvUTU2elU1?=
 =?utf-8?B?dWhEVW5MY2crYWpIYmY1eUtZSFB6QTc2TUxuTU5wNVhSZCtKcDQ1SFl0ZEU2?=
 =?utf-8?B?aFZhUVJaYlBUQWhYMnVZUnZ6aEV0RTIwc1MxcmFlWkQ3dS9MaE5sMHoyYVoy?=
 =?utf-8?B?dEQ0WTBIU1diNTRwSG5VOWRzSlRwdmtDZjErNzlEU05wQXBGVkQvZGVNTjRk?=
 =?utf-8?B?NWlPMDhaZ2dSZVVEa1NncFFTMHREb2tNaEpsRDVZQVd6cUMzNE1rbjNEOEZS?=
 =?utf-8?B?elpheXpvZjhuL1F3WHJSSG5jV2hXM0NNNVZYcDVHZ2dKaXc5ck9HK0lFM1d2?=
 =?utf-8?B?L0NsOXYvQjdRdUx6WUtVbTlBWFN3TkU2TUMrTW8wVlRDQmMrMHBrdkdMSmxz?=
 =?utf-8?B?c21LTE1CTlVHSEFUVnVGOHRUZ003YVlpcllUbTIzOXpZY25FcTFlS09YckJs?=
 =?utf-8?B?WHlRT0dYNFRjWERvOFNENjFKU3NmTnNWaUY1UmI4NFJqR3RhQ1lhcEZvb00y?=
 =?utf-8?B?eFl3YXk5ZHFXUHFrYkprM3UxNjdLUldMalc3VU9lVnR1RGxqemI4ZGdyUGM3?=
 =?utf-8?B?WmhrSUYrNndzOVZDdnpjczRsWm16Q2dsTGc1WUllQmNtT1JhSmlFcURqYUtX?=
 =?utf-8?B?NWZYSzYweXhCOFdDQlVyTGczeXEwcXpteVNSMTVhV05xTHRwUDBreTJyTUdq?=
 =?utf-8?B?cDhJZGtuUUtpZENuNzNrNWFnd0dlcXU3WjZ2ZHlMY0p6UTdyYzdaT3dOTUxp?=
 =?utf-8?B?bHRxWkpGbjlOQTZOVGEzQk1ta0NkSFlxaTVoZ2hCdS9sbWlQb1JpMHNITEV5?=
 =?utf-8?B?Zk9sRkVSTDNhR0cvb3BpVENmYjk5NXliVWg5SjFPMU5wQTRCMG9qZHRCWFRr?=
 =?utf-8?B?Y1N5ek12dHdmejRSN1N0YVlCYUJhcFB1c2U3OUFMNjFZREVHQkZwNWIzUXpl?=
 =?utf-8?B?WVQraXovMkQ5b1hyb2NROGFzQUhmKzJmUlZYZ1dNeU9XckZiR1VkUXJweHZo?=
 =?utf-8?B?Y1l6NjBqR21rWGZLS0JWS29DbkkySnJIVFJkYXNBL3pDQkIweTBqbjArTUdM?=
 =?utf-8?B?dzNzQWQ4M2ZrQUQvL2wyVzQ3QXIxR2JxcEFla0xBY3g0Z0hNNEhkMFArRllw?=
 =?utf-8?B?eC9VelRxRk52UHh4OUJLWjZ2ZFUyRFI5bWYyMEtSMzdqck0vV3RHVHZnZnJz?=
 =?utf-8?B?eEdSNlNDekwxSHVzK0RjLzRNU1lZV2tJaVZHSGV2T0hTbE9EeTJUU2hPcW5B?=
 =?utf-8?B?NFR0RnVLQkx4RmNqaFQ0ZlpJcGZveVd0L3JEVFQzRFo0YVpySFA4UnlhUnpy?=
 =?utf-8?B?N0o5bGlRYUFxRzJWZms1Z29mcXowZDUzc2s2MnhsY2c5clpacTArTStJaUdT?=
 =?utf-8?B?QzRvdFZqdWEvRUdHaXloQXA5Y0N1QlhJelkrTTFlRjNKL3ZueXhxbklwSjFE?=
 =?utf-8?B?UlRSMGhyeUt2MlBNWHNmdC96UlJHNUZ0a1FyYmV1cU1wQmROVzNmbnB4b1ov?=
 =?utf-8?B?elkvdFA0YVlGOHRoKy80VThYTUtVSVdZRk5SckdoOEN6aHZqWkQwVUdIVC9N?=
 =?utf-8?B?Qkh2a3FzaGZiSmMwTmRzUFB5MFNvZHhOR2o0MGpidnIrcHlEUzIwdElZWEVu?=
 =?utf-8?Q?BdqXajeZW7zjXfkzT+E3GGGVk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0c4e4e9-a6c0-412e-ae12-08db1965ff65
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2023 08:30:07.1708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIlbJ/WJ81HYBHK3fixUnuePME84HVOUEd5WzrCfb0hW6yRgbX0DLKsugLpEh71eInZoOt420UufRrPHwb4big==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7697

On 27.02.2023 20:43, Andrew Cooper wrote:
> On 09/09/2022 3:30 pm, Jan Beulich wrote:
>> Gcc12 takes issue with core_parking_remove()'s
>>
>>    for ( ; i < cur_idle_nums; ++i )
>>        core_parking_cpunum[i] = core_parking_cpunum[i + 1];
>>
>> complaining that the right hand side array access is past the bounds of
>> 1. Clearly the compiler can't know that cur_idle_nums can only ever be
>> zero in this case (as the sole CPU cannot be parked).
>>
>> Arrange for core_parking.c's contents to not be needed altogether, and
>> then disable its building when NR_CPUS == 1.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> v2: Disable building of core_parking.c altogether.
>>
>> --- a/xen/arch/x86/Kconfig
>> +++ b/xen/arch/x86/Kconfig
>> @@ -10,7 +10,7 @@ config X86
>>     select ALTERNATIVE_CALL
>>     select ARCH_MAP_DOMAIN_PAGE
>>     select ARCH_SUPPORTS_INT128
>> -    select CORE_PARKING
>> +    select CORE_PARKING if NR_CPUS > 1
> 
> The appropriate change is:
> 
> diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
> index 6a7825f4ba3c..2a5c3304e2b0 100644
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -10,7 +10,7 @@ config X86
>         select ALTERNATIVE_CALL
>         select ARCH_MAP_DOMAIN_PAGE
>         select ARCH_SUPPORTS_INT128
> -       select CORE_PARKING
> +       imply CORE_PARKING
>         select HAS_ALTERNATIVE
>         select HAS_COMPAT
>         select HAS_CPUFREQ
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index f1ea3199c8eb..855c843113e3 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -10,6 +10,7 @@ config COMPAT
>  
>  config CORE_PARKING
>         bool
> +       depends on NR_CPUS > 1
>  
>  config GRANT_TABLE
>         bool "Grant table support" if EXPERT
> 
> 
> The core parking code really does malfunction with NR_CPUS == 1, so
> really does need a hard dependency.
> 
> It turns out our version of Kbuild does understand the imply keyword,
> which is the right way to spell "I want this feature unless something
> else happens to rule it out".

I've switched to that; as said in the private discussion we had, I
simply didn't know of "imply"; I've never come across a use so far in
Linux. But ...

> As noted in the kbuild docs, select should only be used for immutable
> properties (this arch has $X), whereas imply should be used for all "I
> want $Y".  Most places we use select ought to use imply instead.

... I agree that's what we want to use here and likely a several other
places.

>> --- a/xen/arch/x86/platform_hypercall.c
>> +++ b/xen/arch/x86/platform_hypercall.c
>> @@ -727,12 +727,17 @@ ret_t do_platform_op(
>>         case XEN_CORE_PARKING_SET:
>>             idle_nums = min_t(uint32_t,
>>                     op->u.core_parking.idle_nums, num_present_cpus() -
>> 1);
>> -            ret = continue_hypercall_on_cpu(
>> -                    0, core_parking_helper, (void *)(unsigned
>> long)idle_nums);
>> +            if ( CONFIG_NR_CPUS > 1 )
>> +                ret = continue_hypercall_on_cpu(
>> +                        0, core_parking_helper,
>> +                        (void *)(unsigned long)idle_nums);
>> +            else if ( idle_nums )
>> +                ret = -EINVAL;
>>             break;
>>
>>         case XEN_CORE_PARKING_GET:
>> -            op->u.core_parking.idle_nums = get_cur_idle_nums();
>> +            op->u.core_parking.idle_nums = CONFIG_NR_CPUS > 1
>> +                                           ? get_cur_idle_nums() : 0;
> 
> These don't look right.
> 
> If the core parking feature isn't available, it should uniformly fail,
> not report success on the get side and fail on the set side.

I disagree. There's no reason to report failure when we can fulfill a
request. Note also that "set" doesn't unconditionally fail either the
way I've coded it. Both are so people won't have to special case
single-CPU environment higher up the call stack.

>> --- a/xen/arch/x86/sysctl.c
>> +++ b/xen/arch/x86/sysctl.c
>> @@ -157,7 +157,7 @@ long arch_do_sysctl(
>>         long (*fn)(void *);
>>         void *hcpu;
>>
>> -        switch ( op )
>> +        switch ( op | -(CONFIG_NR_CPUS == 1) )
> 
> Extending what Julien has said...
> 
> We use this pattern exactly twice, and I would probably ack a patch
> disallowing it in the coding style.
> 
> Its a trick that is too clever for its own good.  To anyone who hasn't
> encountered it, its straight obfuscation, and even I, who knows how the
> trick works, still has to reverse engineer the expression every single
> time to figure out which way it ends up resolving.

Well, I've replaced it then. Will send a v3 in due course.

Jan

