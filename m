Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5B8734D36
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 10:10:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.550849.860033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9xp-00077l-7u; Mon, 19 Jun 2023 08:10:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 550849.860033; Mon, 19 Jun 2023 08:10:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qB9xp-00074r-4k; Mon, 19 Jun 2023 08:10:17 +0000
Received: by outflank-mailman (input) for mailman id 550849;
 Mon, 19 Jun 2023 08:10:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Jerb=CH=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qB9xm-00074l-V8
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 08:10:14 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2060f.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b78cf599-0e78-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 10:10:13 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8163.eurprd04.prod.outlook.com (2603:10a6:20b:3e8::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Mon, 19 Jun
 2023 08:10:09 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6500.031; Mon, 19 Jun 2023
 08:10:09 +0000
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
X-Inumbo-ID: b78cf599-0e78-11ee-b234-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msQSZyzr988oAbNq90X3lxDUxRUXLktDIQP9/C3WpRTXdoFxMUk6Qx/kwhQp46nU4L9orXZ5VDrma9msNQh6OnOqjZu9PcHl5KoJaxDFsKx9RPoBKuUyYCkm2whtMPkOf18OFx0jUXmCZsHygri/di1vHxKc+hi9ghZCd9U0m2sMpf0YjKw5MJFGhLEZunFEEyw/EDUSsKtNSXeD83qJEkz+sxdcxGphHuKjAxXqwyvfsXIaRHW0ppJszAZMQy85QS6fu1A5PM1mIh+EZYFTiJXDVELMvlRCaK+PbKpnpbsjRbOghcD3NcQffc6R6c4YabD9TZYa0giJvHqVQrSdsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5FUWPbGmB7Bc/TzM5cS7jf1DQiSsN6IzYdX7GZ8v4cc=;
 b=oS+0khi7KjrdRlOq3gHes0fdtUYqrGw7z5YoA0+Qw9o3fYZRYkT4BWEvIa9BrJ/rkkADAYxupUjibeG/LNAf/dQD+ReZH4KMe8Kr8ndxxb5IppaOjYMVypTNwQqqNrQ9oAdBsLl7dWOIZ8TduIpq6C+BHA2LA8kNUd87q/JaroR0L9SSr8+T+uYwain7BPMF2hiFZ/4Ah9kZkw7rjN7k7mqEBn3CP7rlnJLsvCEzg3W5/OFd9GTSPLV6wNCMrhhNdwCPAqatz7l8T3I86dSoQPL45pPUo0kw4PaqR807ztSsz2C+TZYxp0LhrIBvAKjEQkYglV73CPhinD0nf+i1Ow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5FUWPbGmB7Bc/TzM5cS7jf1DQiSsN6IzYdX7GZ8v4cc=;
 b=PI1N3VK/AHhFFaD9mfFBokAAy1SM0sIf1hAWPQmxgbyItocpiJeuQzrbGOX92fM/6pFztaFIhn7Ovp5WL300z68hioNUURgQCIw1OMy2rTWGs1G1gdV45G/52JY5zcijJvag57Cc+UlqXUX+7yRntl5NP/HTK9Wgd1sVuB4MTrsI7RHpp3BuYfR1N3onocu3eBKxS9s9WYjxeyns8vnkaekTFLJQnfb7AmgAHuP6HcDx0979gQWjK6cZ1+aqYZBq2WlolzdRPTTEov9evik1cUQpgMvb6wrSf23rl0r0NOGyyW8vSCyomIE/vlKDugI0d7Opwt5QdE6xB8/KWbb+7w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1ea82266-8b61-f70c-c5e2-a2b4e131d222@suse.com>
Date: Mon, 19 Jun 2023 10:10:10 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0.5/2] x86/boot: Clean up early error asm
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230615153157.444-1-alejandro.vallejo@cloud.com>
 <20230616182303.3546262-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230616182303.3546262-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::23) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8163:EE_
X-MS-Office365-Filtering-Correlation-Id: 5560c923-2a9d-48ca-0dbb-08db709c9927
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	F9tA8Xcm3DFzWWb1ZGWQZmD5Uk5G6/ehaU0KI6jHvJXYZYtPSksYQibSF4nSFHAJoeNG1vjP31Y74//j+iyPthASnk5XLTp2LngnTcwQZpMhHJwLozzp4xLZhFvmyRRvccc/RaqWA5XMR6vI/DEQODLhptZHSwWYfKgZwDaRtwMhUKqZHvbkLZ1j+2j80Ax+io8rk27B0tIhSP6GULqVyEf/mDtQFeYXnga9WEqlGPH2Q3qz33ZUpqahbVUYn5NF2iTZrGxxhsx7dJfHAzXQ35auAOvuso1dQCvz866QdLz4L0rB9ItxvhNDZ17g/mtiZKSYM1ZCg9ORcNuOWWS+yq4oHbbIxzqUk6jOnqaq0J9V2RtthdGLUEdx2uAQ3rs37e9u3gu6jPK/f8TCDZSefCgFUmks/Zv7LRHoe5H3xttV7RxjUwJUn/Lpm7SwHK07E8MdGqwRNTVizH96SyWL7rvrLFTYV9BAeRhEljYdt/HMHteUEtlS0su2KXNS2bikzgxYBO0S9ILOlnE2lH6JHO9Z0heZGyXe7kvuKLsZWRym1nvDbzK6F5JH6DsubzT1/7Yqrx6jKW2IsCunzH049a8UaWOqG01Vki8PblTzobtrnBgu6psZL79YxXQgYwUcaO57nnZYh/0sB+s5oltnuA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(376002)(366004)(346002)(39860400002)(136003)(451199021)(478600001)(31686004)(66946007)(66556008)(66476007)(6916009)(8676002)(36756003)(4326008)(41300700001)(2616005)(83380400001)(38100700002)(31696002)(6486002)(86362001)(2906002)(5660300002)(6666004)(54906003)(316002)(8936002)(6506007)(53546011)(6512007)(26005)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UzJZZFF4Yk1ZTVJKbzR2REZTNmc1djM2T0hySG83NjNCeWREdGFpc3ZZSVVi?=
 =?utf-8?B?T1JLc2lrVS91OUs1Z3JiZUJYUjhYT3E4TWtQLzg0TUpZdm42eXZLQXNGMExy?=
 =?utf-8?B?dXZOZUFWS3RXWUU3YldKUzRoajRML1Z1SWJaaGtURkI2RDZrdzlhTUkrWHNL?=
 =?utf-8?B?OGVQNXRUS0IzZzNIUThUb013MzF3RGRneTl4RzN0TjJFK2JWbzhsY3JNT3NX?=
 =?utf-8?B?bENlUXFkbHI3d28vSnpTOXByRmhUMGhodXA5UWJhU3ZLaTcyOUFNRXNmcHdj?=
 =?utf-8?B?QkEwQm1JWnAzeTVRWHBRY29oMG11MnZSbzdENzF2eFVGZnZLTm5hcS82VzFn?=
 =?utf-8?B?VE1uY0R4enZxYVJsb29PWHRVNGVXdHBIbTA0R1A5djU1ejRRcGFGZUdsSmlo?=
 =?utf-8?B?TUE5Uzdqd0pUMVVoM3VEdE14TVFIR3dhY21GM3ZiOUNWb1MzWW1KUnQrdXJW?=
 =?utf-8?B?UUpRVzBTUFZVWmw4SWppZzdmVGtNeWh0MWlxdlUxODZKcnRrN2hTL2hjRHBT?=
 =?utf-8?B?citZU0NTTlRacXh4cFhxWFJwZ21yK1IzWkRhTEVYYi82dTVDcVZEWWk4dmlT?=
 =?utf-8?B?OUExN3dLRDl1WVRqaDl3MkRQcTR2emVxVGtTUjJVWWNUU0VoNXJnRG9vVXh5?=
 =?utf-8?B?NElZZ3JMR2hxWm5BYStqdFA1RDErcC9sVTJna1JENk1McWtLa1ZGV09jVi82?=
 =?utf-8?B?ZWRCZmlvWTZQVUhoTXJsMHQrZytqZkplTUsvcG02ZExRdTY4ZWErMDA5WUwx?=
 =?utf-8?B?b09zblRTSy9IUnY2dXlIUURXS0t4T3QrcGcvUUhYWTdZWGl2ZS82dm1FSldu?=
 =?utf-8?B?SGhUa1VpTnVxWkthUUFLRHNZQnY4T1BDelQyRlV0dnpQZ0pSZS81U25EeHpD?=
 =?utf-8?B?V21QTHlFd01mbDVVZVRkSEpVQ3R6clJvR1NyVUo3SW9pZWIzOUtoc0JsREli?=
 =?utf-8?B?Q0kvMndMWjMxNFNiaklxaHVCWWNlSW5QVSs0bCtQdDU2dG9ka0JKaHhJaTRs?=
 =?utf-8?B?RllTUUhtekRFYmxFanZPWHRjM0JLcVNwS3I3RFU0dHc0TEY5cS9odUZmOXBD?=
 =?utf-8?B?bDh0S0l2ckphc09kb3Bpck9VM0FxdmNEQU5ITlZDTEhxRVdyb0tvV2toQnpX?=
 =?utf-8?B?S25TQ0JkWnN3UktTRzYrVUpreG9XYnlGd1pGc2Urclh5M0NJRWIzdDZ2L1lu?=
 =?utf-8?B?L3NnMHJ4RmNNQkcwYmVCUmE3TngxODJab2JReThVUFZQSFJ4bW1VR1lNK1Q5?=
 =?utf-8?B?WTVTTFNldTY4c1B2aHA2ZFg0UUwwc3FsOTNFeWlNUEx4U1NINGpZM2oyTGln?=
 =?utf-8?B?eTdDa0Z3MnV4NlMzS0ZqbXdld3YrUmNzZnJXajUvbkdiM1BvOGJoRWZocWpV?=
 =?utf-8?B?ejFGSGxPNlhocUNFbHduS3RBcmVnbzZtM1NnVlVHWWgveHlBMU1xRFpDd3ZP?=
 =?utf-8?B?eVpEbXVyYklzYUN5Vzh3ZzZTNGo1di9vNkx4MllvakpGVXZIQUpIVUdhTzA1?=
 =?utf-8?B?R3JTV0JKZG9hM2l3UFNObU51ZVdmamkxOEcyditUeVVlL1JjU0xTMmN0cEY5?=
 =?utf-8?B?eXdaTUZOQ1NDM05wSHlDSC9hWWo0MjNEVTl3Q0JwWDdqYU1GcEhNSTJ0anVW?=
 =?utf-8?B?dkJ0aUtRUitsWkthbWFncHF6ZGNwS3ZCM3o5SEROb2xtbE1mbHg5UlZTcWVT?=
 =?utf-8?B?SSt4Z1lyQVU0eGpWVDlFR01rTU5IMDB4REdzUHdnYTVtTndjNVpPRTRDTG9K?=
 =?utf-8?B?WnM0TUFTaU41UEVYTnNJa2N6SHdFaW5DVG1xOFpqNnBCM3U1dkszazZYVUps?=
 =?utf-8?B?NFVkYXpUT0p0Vnl6d05rTzNOcUJJOUo2c2tRVjRyeXFPTlBpbmVLVkQwaHFL?=
 =?utf-8?B?N0c3UVBYcDJtVGNOTXVKYTlRUlE4N1luUDVCMHNpdmdRaVR1U2tsMm8zUlc2?=
 =?utf-8?B?WTBodURpZWVxK3JmK3JOaklNTW8zdktvS0ZwM052OExWSG5MUjBZWHNnQlhU?=
 =?utf-8?B?MmpZWEdIT1l3OTFocmc3MWlJY2VzYTdVWWQ2Vk9kQWNseGpvTXlyK1Fiamox?=
 =?utf-8?B?RDBJRnQrY3VyRThzMVFNWjRNSHBCdjYyUEZDQ0RIb2NnNmN5ZThOSjVlQnJP?=
 =?utf-8?Q?RAyiEtse+LZIkL/FnBSDhlhV0?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5560c923-2a9d-48ca-0dbb-08db709c9927
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 08:10:09.3746
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZmLvxiB1zqgMPpnmTx4NNpje3wudeH4NZcf4Q0aXc8h9mD3hjVmNScFCrO5gJHen+iHmUhyclrlrP/PDcZuPpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8163

On 16.06.2023 20:23, Andrew Cooper wrote:
> The asm forming early error handling is a mix of local and non-local symbols,
> and has some pointless comments.  Drop the "# Error message" comments,
> tweaking the style on modified lines, and make the symbols local.
> 
> However, leave behind one real symbol so this logic disassembles nicely
> without merging in to acpi_boot_init(), which is the thing that happens to be
> immediately prior in my build.
> 
> No functional change.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one request:

> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -142,25 +142,27 @@ efi_platform:
>  
>          .section .init.text, "ax", @progbits
>  
> -bad_cpu:
> -        add     $sym_offs(.Lbad_cpu_msg),%esi   # Error message
> +early_error:

This symbol, which isn't really used except by .size/.type below,
could do with a comment saying that it's intentionally here despite
having no real reference.

> @@ -202,6 +204,9 @@ not_multiboot:
>  .Lhalt: hlt
>          jmp     .Lhalt
>  
> +        .size early_error, . - early_error
> +        .type early_error, @function

At the 1st and 2nd glance this looks unrelated to this patch. Which
isn't to say I'm opposed, but of course once we have settled on an
annotation model, it'll need touching again anyway.

Jan

