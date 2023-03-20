Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 696C46C0EE0
	for <lists+xen-devel@lfdr.de>; Mon, 20 Mar 2023 11:32:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.511826.791105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCok-0006Fj-28; Mon, 20 Mar 2023 10:32:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 511826.791105; Mon, 20 Mar 2023 10:32:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peCoj-0006DS-Vc; Mon, 20 Mar 2023 10:32:41 +0000
Received: by outflank-mailman (input) for mailman id 511826;
 Mon, 20 Mar 2023 10:32:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AUe7=7M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1peCoj-0006DM-2S
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 10:32:41 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20611.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8a21e5d9-c70a-11ed-87f5-c1b5be75604c;
 Mon, 20 Mar 2023 11:32:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9621.eurprd04.prod.outlook.com (2603:10a6:20b:4ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 10:32:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 10:32:34 +0000
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
X-Inumbo-ID: 8a21e5d9-c70a-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AddAW00jjwrK3ufwzFVcnx+jLpo2+L/odKY3BYJYkos4PltP1TrYLleG1R7lZzwJ+1dRlULvX1F7ZAs/8PoRqf6ke1Gyv+9oiWQHfGFZM6JjVeBuhqgMfmkxR/B/8wim6vKtDlzl7Zjk8ML4z9TFLixLWVCD38oY8zAp+S3WKWa+8kUsU3yUTqyoWmMYfdNKqerxyUjmWp/ym4HWxeWdy/ah7kuUeTclfrSgNuK78gljjr6+rPOkoCGhM/EJ3xlpEotbzyA1bRnYoUJZdo6P6RkbQh/lamrfMcV09Jv1lyU4g6L85SWMPEKSki34ar7w+fYpA8Yr5Jk6kV2Iv2HgKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjrbQCcdzE4w9Xt0BVsOKXbZKykxAv0KbAu9N+r4Fnc=;
 b=EPW4F3aARDvD4Foy0UrVxaI/gJcvbim7hJMJZZBvd82f2SZdmQ0XNJGKZQ6EQo1NlyNbsqxOS9y9cRpuKYvEdhGRCKziwFUC4dloHaeutft1hnqX2v3qiwulArMfw7KFNkS5hzG5hk8JwOq/SviETlZIqVj3KBWQhHGUeQO9NHwYCELqXEbW2YoX1Z9Y2mbWpazg8im5SCylznJ22PnGl7DdXWLVKGv1PNckPUXvGd7pLQ+jlpqZ5tBUwBAH5NPm3LZvejeFI2xWe15NW4SK5fKYBMQuZWds2yigPRi0AbUA70+PWZPQQcBUDRdxvUEhDOmUFgai+KiZYJCF5/Gk4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjrbQCcdzE4w9Xt0BVsOKXbZKykxAv0KbAu9N+r4Fnc=;
 b=NtYq2hSTemZmr2a1Tp/KUrAmyWBaLcM7ccI0rL0ydmIpvPCmQgF41uq6Db82mdiBQ4rCaw1IdRipkp2Fpx7rvgX2l8hEV16K4BqRvJwE1icTALRf83ji5J2vpYoP2ux94AajwGP3Jv8/HUjsqzvW1LtJAZYkhfIdJpEHWzKzysoPive067xHur2qvsY4s2vFtfSVmNin8M5P7F2QqSzBqvEtI26mm3JeSeBn8t60NqclXhh5xIdkxxv0Xo/ht7RoKKarFgXZsseII7CdtxlzEJWEHvF1p3gNL0NJ+zj1WqYCekJShKrfH5WZDo7z6+jSVoXDErYLl/QiX6UkIh9xUg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <45dd213c-94f6-1b78-98ac-57ebd3ac1f3a@suse.com>
Date: Mon, 20 Mar 2023 11:32:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] Fix PCI hotplug AML
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paul Durrant <paul@xen.org>, xen-devel@lists.xenproject.org
References: <16d19b45842d4f98f130c98628932eb2d62ffe72.camel@infradead.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <16d19b45842d4f98f130c98628932eb2d62ffe72.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9621:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b02a3b0-d50f-4abb-0e68-08db292e6add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kMf0vuxbJhq1gk1a3iUxYikO/6/kqhwVh0JXAJNzfdopQVF5+zcBXKuCTN/KQZTdnQJEwDv8tY3LqSc6ASKf7bdmoX++e1dM+6iIIorbu3HLZxfjMFVfnkKvXInfe2OfLBb7X65NjtEkDFcwZ1A+5BDBIawHp+UqW/G3JyL874ePdRngKQeVcrv3Z78qWOghDsxC2FhpLdeUmVKcj/blkaaBUKzZ3jiaP0r08nlZj57calaeyOl4rpDYHXcxrMeM59xMWXscLFc0cwuOENXepEnXD5XrfgfGv9H8RRokuojdExgPVK8Vo5hB8XEeyu1zz9Ld6uKsdwflawhoNiTdTKs6B6GWV0jAyCKoZNBnFjAckwcbJdHlhTExp4LK/JaxDaa2FfUUz/F2fX5MVvXRRTnkGzFAtt5Fl6/hBNrqhr8gZqCWp2eLliJoE0QNvH2ApTnJI9HtJMR0ZR804dqXWQz0DsOHKwh1HEucSbbofWfdi0V+yCzORgyBZUzvggm4zyo5deJT9qPfFokaKsExAszQEFqVGEdamg/3oWe98Ut/nQUMd0mnmxtb0iF2mXCEN8niCA/ck5Zx+HCu6m83BlI/lj0dqVTwsyAJuJvKHzmq2Kl7JaoKhU5Ddar/DZkjkJHyv+OJlkTWRQ26exdcEEk45zf+OS2Ow3i/1eEMczd5R6u7y2aL7jPzG9jq1ZFCJe+500zc27LU/A4y+a1DmswBEY1fqmG5/JWLJzl8FsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199018)(66556008)(2616005)(53546011)(26005)(6506007)(6512007)(6486002)(31686004)(6916009)(4326008)(8676002)(83380400001)(316002)(66476007)(478600001)(66946007)(186003)(8936002)(5660300002)(2906002)(41300700001)(38100700002)(86362001)(31696002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VjhRMndRSjVNTWN5WW9GYXFjblMvcktWc3AyWUMzNHgrM1ZsbEZ5NUJFWUtK?=
 =?utf-8?B?eDRFeUNjVmJHR0c3Q2FqZDNlaVdLSWUvSkwvQnk2WFlJVnN4dVJrZmRhaEEx?=
 =?utf-8?B?VXdQM3d6YUpHZnJEUkduWUxMWjArdEQ0b0dYU0lhdGVhMkZ4b0F6UkNURzBC?=
 =?utf-8?B?Y0lTYnNZZWxPZUs4R2hkQXcxbEpqLzk5U2pRRXBaak5wbVVQZkwwem96aTZ4?=
 =?utf-8?B?RGZ1bjJISmZoakFTbXVNWndJY3hQTzc1SWFIdStRNmhwSFBDaE54a0FMbVVj?=
 =?utf-8?B?SEhTV3JOY0o1ZUtVdzk2R1dtNVVvdTdKL1B0RjZidzJPMEZHY21wL3ZZQncw?=
 =?utf-8?B?dmgwUmdSVitQT0x0VE9wQWgydWpOTVhLeUxwL2kxanFNQ2hzR1pKZndDSFZS?=
 =?utf-8?B?bWo5TjNWZUtka24vNEJ1ZnBycUdBQWFRUENwMWk2RmtBbEV0Z3FYTUFYVmk3?=
 =?utf-8?B?bHUrT0VKd1p5NGxSNmtHUVRFL1ZCbXdza081SW1FTUVOOElHQ1orS3IwWDR2?=
 =?utf-8?B?SHB3Y2F1bm4rVmZZMGgySjlweDlhQzJscWx0QVl5RUxET1kvektlS0FyU0g1?=
 =?utf-8?B?V3IrR3k5cXdSMFpFZkdLMGt5eG1OUk5KM240S0UrUXZta204cVRidHYrdEQr?=
 =?utf-8?B?aXprWnp2NFFyaHdHSHZtK0lMTFpzN016eWp3L21DajBmMTladGJTVVNZUzE3?=
 =?utf-8?B?SjRMZS9HUkJIVkd1WjhnMFZHMVRnMk4xem4yVitGMi9OanVWQmZwZlpnN3pj?=
 =?utf-8?B?SUUveHNEZXZWNFg4UTczS1ZIYTBveHV5QXRLSXZXTWF0a1c3M3JtQ0QvRUJK?=
 =?utf-8?B?NVdhVUx4VS84UklwcDJyM1JuUGtNUThOa3RsdzdaNVFMNFdxYWFwdFN2Mlhk?=
 =?utf-8?B?MUYydk1QRHhQakJiZCtPc3NhZFNtTnBVaTZQbjlkVTZOTHkrcmlad1pTaG8z?=
 =?utf-8?B?QkFCbm91OVVNMUwrWjluN2w4ZVRGRkdhZUZDbk1reFoyakpHaGhuWFZONlRr?=
 =?utf-8?B?UG5QVDQwUDR0V1FtWkQ0eStSclg2ekxmb0xVUDFtSWVVVWJEbmVFZEtpYUt5?=
 =?utf-8?B?cEVhMUJyV2UzNEE5a0V4V2Mwck56SjFhbjdKQ2Yrb2ExNElZRFIrQU45d2Nj?=
 =?utf-8?B?S2YxVDJSY0syc1NXYUVHblJFeEowT1I5SkxWeEhGWkZzdXh0WmMzbDgxdVR5?=
 =?utf-8?B?SFdyWTlOZFFCTmNqdVdZWTdoemREdmUxcTBuR0RyZVNHd1l6Y2t0eTVmNHNh?=
 =?utf-8?B?STMrZXJPOVhwV0JPNWdIaDQvTzI2Q1M4SUd1c2laTHJEbGd3cjVqZmtpWmps?=
 =?utf-8?B?MkpDcHBQSTVVWlpucWhQS3JITG5OVzlxNG1IY0NGcW1BZXF1aHZQdlpPTTdD?=
 =?utf-8?B?aXR4U0VpYUxaTU9nKzBnUFNxT3B3SGZ5US9jeWlxWFJwVXgrYTFudzYwV0k3?=
 =?utf-8?B?UElDOXBNTjJDbHBxa3YzOUxuQ3VoQlFidWYydC8rS3YzQlBqNExRejIvSHZP?=
 =?utf-8?B?Y215OXRETG4wY1ZRbURGR1NvRjhaUjlqRWNRWkVoc0NvSnN0RnF3TnBDSDhZ?=
 =?utf-8?B?WVV1VGdZY1VDRjF3WlJwV3N5UzlFcWNXRWhqdmkwb0Y0Tmh1OGdwaEVVbzlw?=
 =?utf-8?B?Y2JNbHVQTDg1Y1pxdmVrSDdBTGlKV1RMWHQ5NlZIRVVXRzY2T3Q3WDJWUUk2?=
 =?utf-8?B?TUFOVUhOQ1hucnhUUnpKQVIycnN6bDY2dUdrcTgzU0c1amlzYXZqajRNc3pT?=
 =?utf-8?B?WHVNbE5ZMUJqazlNcC9VYmhJNzBhWmg5SjI3ZHQzWnh3Ulp5RTA3Q1dCbmRB?=
 =?utf-8?B?WDQ5K3VUREV6VUFTYm1iWGlzaXNIeG9aWStSaGZTWDBQZWhIakdPNDhSN1M0?=
 =?utf-8?B?V1VlYStpMExZOEk1cWNBZEl5cjNxSzVOMmd0WThZV2M4NU9aR1ZUNjMxcXRZ?=
 =?utf-8?B?TGhLaXZrSjVncHgwRHQwbHRxL3FUdjRQaW1MbUZ0VkFEYkRtMDlTSEZhWWw3?=
 =?utf-8?B?b1ZiWSt1YVZuWWRoVElDeWxVSWVNUlRQWW5VYnROa0VMRGRWRW5BTXRCRzUx?=
 =?utf-8?B?eHlRcTY1UVBxWDZJaWg2Y2pEMmlyWnNEMVhmdlFPMFQ3aEVqbXNHbDNISFpq?=
 =?utf-8?Q?YjuOTdFqTgvGc4P1KOvMYsicL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b02a3b0-d50f-4abb-0e68-08db292e6add
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 10:32:34.3351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8ZmZ3exeWtWqPTQvPekckdQcGF8c81ctbaOQIB/HTsmg0sjh9L3rML5SDjXBoMK/srKXL8FLYVD/yuM+qsOsWg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9621

On 17.03.2023 11:32, David Woodhouse wrote:
> From: David Woodhouse <dwmw@amazon.co.uk>
> 
> The emulated PIIX3 uses a nybble for the status of each PCI function,
> so the status for e.g. slot 0 functions 0 and 1 respectively can be
> read as (\_GPE.PH00 & 0x0F), and (\_GPE.PH00 >> 0x04).
> 
> The AML that Xen gives to a guest gets the operand order for the odd-
> numbered functions the wrong way round, returning (0x04 >> \_GPE.PH00)
> instead.
> 
> As far as I can tell, this was the wrong way round in Xen from the
> moment that PCI hotplug was first introduced in commit 83d82e6f35a8:
> 
> +                    ShiftRight (0x4, \_GPE.PH00, Local1)
> +                    Return (Local1) /* IN status as the _STA */
> 
> Or maybe there's bizarre AML operand ordering going on there, like
> Intel's wrong-way-round assembler, and it only broke later when it was
> changed to being generated?
> 
> Either way, it's definitely wrong now, and instrumenting a Linux guest
> shows that it correctly sees _STA being 0x00 in function 0 of an empty
> slot, but then the loop in acpiphp_glue.c::get_slot_status() goes on to
> look at function 1 and sees that _STA evaluates to 0x04. Thus reporting
> an adapter is present in every slot in /sys/bus/pci/slots/*
> 
> Quite why Linux wants to look for function 1 being physically present
> when function 0 isn't... I don't want to think about right now.
> 
> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
> Fixes: 83d82e6f35a8 ("hvmloader: pass-through: multi-function PCI hot-plug")

Reviewed-by: Jan Beulich <jbeulich@suse.com>



