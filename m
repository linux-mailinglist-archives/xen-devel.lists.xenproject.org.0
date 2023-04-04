Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE7296D6866
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:07:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518026.804173 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjCD-0005T5-Vt; Tue, 04 Apr 2023 16:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518026.804173; Tue, 04 Apr 2023 16:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjCD-0005OG-R2; Tue, 04 Apr 2023 16:07:45 +0000
Received: by outflank-mailman (input) for mailman id 518026;
 Tue, 04 Apr 2023 16:07:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Jsu=73=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjjCB-00042B-FM
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 16:07:43 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20616.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::616])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3cadec5-d302-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 18:07:41 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAWPR04MB10053.eurprd04.prod.outlook.com (2603:10a6:102:387::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 16:07:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 16:07:40 +0000
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
X-Inumbo-ID: d3cadec5-d302-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b0AlkEvq6ByF24u0vM7F2WktRfsIA1tpbWxgiPpskX0XNWu1lFfMbR4d7c+KRAA8JN+pRjDJosWmEcTEkzd6XMcLs14KHV0aYbntoGY1lqSo4KZiqrRZJTCqUiv4jzR9wuj6RnsqFXauGm+17t7kIIKrKYfau94du7utpnpGr/xkhX6MjiNs6yTMeG0VgGKg8MkJeXCeiF+w2hsjHf35EsGwoQuoWgHaInrEUcavaEmxO9MYGeKQFywFaUzuG6Ap1w/WAep+jRl5sC1YCUDdinEzKVdMeHbjFxwY50FeliHGeislR+cc4Qkqrpo45fmHf/z7vfN+zvYES1U8HtQ3sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2CCQNHz3YZYu6kKH9DtowEu2cW9bMzkaJbpFteJ6gbc=;
 b=i96DBr47vI704e0mhtslpD+n9bR0NzWEbE6Yj4xQjWTv09GaCErDA6sBaO5uXnbi9Q1iY2auAbku+RxNPrW+90HpYBSotTV8v87WAIjayL75otyiwMewQI3JKOWtbtabh86tj54OxOLCUUWvfRAi/iPXbWcOlHdWd+6zIwo6OsDeR/5TAvaciIWjTMkOj2JIZvPEc0uU8IRgjh4U6VQee3GaCQ5tvWj7wCr2uatVtufPmIzhrkjH3KKO73eaTofLHjfmShI4p77C0xhO0gXwmXvS4MG6P030GVlxB2Hzs5w8S5e6J7Kzc80Raca30+j2VUdwyu28egfBIRtafIISUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2CCQNHz3YZYu6kKH9DtowEu2cW9bMzkaJbpFteJ6gbc=;
 b=P2wm3j0RGT5ejgtbm1i33oOc6CYtCvUp9ZZkBBQihrQEkIXKRnBNpY8tN5VE4zAB16rgmy4pyyDzekTEqbGOVB8YYfAk5FVp03fTREFYPtNU7iWCnR0mA8xVSFCDpBXtQme5rYHB7XO1KB2DDp3V0dKntKjSKVLacpUKBbX6OpVwnHt5DaLAWWICVouGR9uNLXDg3MR4KZIYcODfAkdWXOtOvk6kpTnWKMjIosfbK8UDiEzblLaWGjNXC1Ni0tsc8szjjviIt2wolUb3fRN0ToUszgKwuEgnsV6VwWCxGIsFSHrT1uC5Kbr/Yz/2h2O8siWDcZQ1RuzI7JuAy2C62Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e80cbe9d-8e35-027d-7765-396816bae85f@suse.com>
Date: Tue, 4 Apr 2023 18:07:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/3] efi: try to use the currently set GOP mode
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20230331095946.45024-1-roger.pau@citrix.com>
 <20230331095946.45024-2-roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230331095946.45024-2-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAWPR04MB10053:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d204e65-96a9-4482-84f6-08db3526b719
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VfP0zM3lkMCNWowKLN3pye2YIwqwXggcARB9C8WF/cZnaitmjI58EK0BDayyZBB3Q/kgcxBC8pWP7scg3Xwd4/d9Kx5QsLlLtZDGjwxyUwAJoRP1C/C8hViYHRG/JA1CH0X64rq0y/IDY8DsOFUElp9TAvamdO67SYyXZUqOUa4CQoL/WheCdMTfMQhaoek4QT2eh+8LcjVCoicrWZy2XCFbLuomLuUY4zbN9v1r1c5+mnJE+KXeg/osT1H5MDqTAe1lQdVgiRmH+V99vYiqPrOsEHdhfGsQdH8Ye0hKYzTk7TagOT43DMg5QoS7TRH6/Hr35vYHqEjPCn8Y48hg8MLUIFPwIlYN0ru15nevVpaSUIofwMhFUqB50XdutvEtq2R73miiy88f61UUqbV3VxKwtn8RU0+iN8Y+88bNbiN59erstVnBi7eDiRilGT/ToIKDkWt00Y1WEis120btbKTQ894gLvKCYdA0L6FfzaptsoTiEq62grGPhGHEP7cJTA0dJQEo5EYZe7jjKurOTCzgiMPNsifdnoDM8sVu0q7gZQpiiQh6uDz1qY+t4n9aohWbJlpD++0DDKy0yibVOWNRspmVXidfooMDhoXe/r3X0WU8tEyQFZXQrPHrW6RzyW/i8ccwpz1P7rm3m0q8Hw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(366004)(346002)(376002)(136003)(451199021)(31696002)(5660300002)(38100700002)(8936002)(6916009)(4326008)(66946007)(8676002)(66476007)(66556008)(41300700001)(86362001)(2906002)(6486002)(26005)(36756003)(53546011)(6506007)(6512007)(186003)(83380400001)(316002)(2616005)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUh3SEVaei9obWtYRExlUExyWDZMdDBxcVE3N2RmOHVMYWFZTnBwSHpWTnNP?=
 =?utf-8?B?RHJvZkpzOVAvcTZPZkxrSy9BdlNJYnlDRjFRVDZ1UVV2T1ZuMmk4MlJtQ09C?=
 =?utf-8?B?M1lOdUlSWmVhL2JVcFI2RmZJNmhTeUZHOEVCd3kyem1PQ3VBMlU1dlQ1a2lT?=
 =?utf-8?B?MVlpOG1uNWVtRjhEcHM1U25jSTh0V0xLM2M2dlhJWTc4K0x2aFJtNVpvODZU?=
 =?utf-8?B?NDdwZ1VodkF0ckJ3a2t2aDNMNzh3OG96cEd5T2hDVksydXdhdUw2Znd6MEFq?=
 =?utf-8?B?aFBpMEhxM3ZHdUg1NkYrR2NYMk4ycVVPanBwN29MNFllZHZES203b1RmdDRr?=
 =?utf-8?B?TzhlVExMaU1BYkpRYmtXU1lGOUNTczAySGlLb2txSUNta2FGWkhIL0ZYZlEw?=
 =?utf-8?B?RWdYY21ZNS9USWtJRHlZdWNqWDgxbE8zVm1wNms4bDRNK0NZazk5NkQzRW5K?=
 =?utf-8?B?U09wd1JGSysveTF0VDMzTFhWYkkzUWxTUElyRkJpdFI2Q0JhMk5CeVh2UkNM?=
 =?utf-8?B?U2xsN2M4R3V5MzR4a05XNks2RitkdThIQm13emhjQ2N0L0IwMFJCd09SRGxX?=
 =?utf-8?B?RGw1TDBpYTIyQXhKdjVuZzZ6VnNKUEpKMzNLZUlpbmtXbURuamkrZHBlTGQ1?=
 =?utf-8?B?MU1DWHkwZVlNM0p1K1hzclNPajQ1eDFxSkdhYVRtSlgyZnB2OStQMzlFNzNL?=
 =?utf-8?B?VWZaVVhKN2ZZSUxheGhXSDhER0gyTTFuS2NjWTQyZUc3M2UxSkcxMlpEMzlk?=
 =?utf-8?B?K1crbHIxUXk3YmE3eUFLZVJFWS9wZFFyZStoZTJoWS83SkFmSWtKanlBa0hI?=
 =?utf-8?B?R3J3SUVLb2xOVmRiZDBSa1lOT0VpY213QUZHaENvZmdRaHZIUkI3SmZzQkNW?=
 =?utf-8?B?QUFkYzFENzRoQWUyQ1kxV2l6bXhHbU5RTEF2VGc2a0hwQVdyQXdCczhlSXFW?=
 =?utf-8?B?RW1xQVZSL3pzbW9HSmdyZTJZZWhzTE9rUmZ5WmkxV0pERkxrSk5NNGlTVVJ6?=
 =?utf-8?B?NGFUVVJpMXFHRzVsazlsYnpBUEd2L1Vod2EvNWo5WmpFSWZ0Q2tZYk5ZRUZZ?=
 =?utf-8?B?Rlc2KzNDS29yVHlSTFY2OS9PTUhSRU8xUUp2cmZENzJiMS9kd0NwSmJ5WlZp?=
 =?utf-8?B?cHRlZHJVNUFYNUNieUdTRGdWd2I1d3p6aFQ5NWliYW9OZ0V0elNHYjNBemhD?=
 =?utf-8?B?UitUUm5MWXRpTkt2MFY4ZkR3dkhVWEFjZTFCc2lYeWdTMnZQRXpOdURrbkVX?=
 =?utf-8?B?OFVta25ueVdpN25uSEx0bll5MnFRR2k4NjYwdGkrNEZtVVN3R3Q0ZTBGUTV1?=
 =?utf-8?B?WmJtS2p4OG5KcnlWZG1TaEp2RXRueCtpQ0ZHSjJVV20zckNKSTJicVk0cDIy?=
 =?utf-8?B?RjVoZjg5TzlFa20wV2tyd0k1S2xIT1pQTVFIMGZwOHFXd0gvWTRDdkEvVEdy?=
 =?utf-8?B?Zm9oTlRoYjlHVnFUalk4eTNRVTBYYjA0czhvN1JVYkFCaWdpdUliSkp1TVQ3?=
 =?utf-8?B?cUlZWDJRN2FhZXVzRVcwZUlFazVITjh5NTlvd0IzREF5MVg1UkVBcndpbnZV?=
 =?utf-8?B?SWE3dDVaWGcrWUgreXE3dG5YMGpBZjhrVDZvTUtzKzAwS2EzWE9BcjRESUR0?=
 =?utf-8?B?amlyS0V3aVNEWUNKYXhRTTJpcm9OZTBzM0ZlL29iM3g2dXdZZDcvVjVBaEtv?=
 =?utf-8?B?Zm0xVmJzbnRlS0xvc25VVC93cjJLNlI3Tm1XdlR1YVkrOE9kRUhmT3loOCtB?=
 =?utf-8?B?RjdVcXFvK2o2SW5vQUxQNW1JYk1hdDBRNzB3dDhldjB1TldpYm0wWUNYVUh5?=
 =?utf-8?B?eEUxaE4rdmgvNUI2cXlaZGtEakRaOHRGU2U2eXo1NWpRdG1LeC9kaTBTUnQy?=
 =?utf-8?B?Q0Z2UEpOOVRaMmluVXFHMC9ZZ21GTHFrWlhoTjVXZVBCRVdUQ1ZsdE5uaUNj?=
 =?utf-8?B?RGFJaWVTeUVjRDlpaSt0cE9ORHNyWHErT1ZYRmhmSjU5Mkg1MUM3QzlvUlVM?=
 =?utf-8?B?SUJJMGVoK2hvcjF2VG9wTitaMDB2ZnloZWhQUWUvaFF4azBXOFhYNFEwUzNT?=
 =?utf-8?B?ejgvd1g5dzdScXVtSU1rdThSU3dWNWRBYUVwQkJlZjVsSGxkWHVOVGFQSitu?=
 =?utf-8?Q?BVOQRAzvfKjbvF6yMZSQsocS+?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d204e65-96a9-4482-84f6-08db3526b719
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 16:07:40.3456
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jMqhkrX42BpFlA5WtXjALpAk09l0+5rjiZZmTlG6OuHfaQf99AXoPe8hz0KSIWiOy90ncg7Yfj1wAZDbdWqqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10053

On 31.03.2023 11:59, Roger Pau Monne wrote:
> Modify efi_find_gop_mode() so that passing cols or rows as 0 is
> interpreted as a request to attempt to keep the currently set mode,
> and do so if the mode query for information is successful and the depth
> is supported.
> 
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Changes since v1:
>  - Only update cols or rows if the value is 0.
>  - Leave depth alone.
> ---
>  xen/common/efi/boot.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)

While I realize that docs/misc/efi.pandoc currently doesn't describe
what rows/cols being zero means, I think that file needs updating in
the course of what you're doing. Irrespective of this I'm uncertain
about the change in behavior: Presently both values being 0 means
"find biggest resolution mode", in an attempt to have as much info on
the screen at a time as possible (in particular in case of problems).
I certainly appreciate the desire to have a way to say "keep the
current mode", but I don't think this should alter behavior of what's
presently considered valid config settings.

> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -930,6 +930,27 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS_OUTPUT_PROTOCOL *gop,
>      UINTN gop_mode = ~0, info_size, size;
>      unsigned int i;
>  
> +    if ( (!cols || !rows) && gop->Mode->Mode < gop->Mode->MaxMode )
> +    {
> +        /* If no (valid) resolution suggested, try to use the current mode. */
> +        status = gop->QueryMode(gop, gop->Mode->Mode, &info_size, &mode_info);
> +        if ( EFI_ERROR(status) )
> +            PrintErr(L"Invalid current graphics mode\r\n");
> +        else if ( mode_info->PixelFormat < PixelBltOnly )
> +            return gop->Mode->Mode;

What if one of cols/rows was non-zero? You then wouldn't fulfill the request.
"depth", if non-zero, is also entirely ignored. (We don't fulfill such a
request right now either, but not doing so becomes more odd now imo. In fact
right now in this case we leave the screen alone, if I'm not mistaken, so
there already looks to be a way to achieve what you're after.)

> +        else
> +        {
> +            /*
> +             * Try to find a mode with the same resolution and a valid pixel
> +             * format.
> +             */

Is "valid" the right word here? I think you mean "usable for us" or some
such?

> +            if ( !cols )
> +                cols = mode_info->HorizontalResolution;
> +            if ( !rows )
> +                rows = mode_info->VerticalResolution;
> +        }
> +    }

Overall with the resulting behavior I'm not sure the title really describes
what's being done. You "try" only in certain cases.

Jan

