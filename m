Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0781C64C748
	for <lists+xen-devel@lfdr.de>; Wed, 14 Dec 2022 11:39:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.462033.720195 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PAs-0001SW-W7; Wed, 14 Dec 2022 10:39:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 462033.720195; Wed, 14 Dec 2022 10:39:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5PAs-0001Pr-Si; Wed, 14 Dec 2022 10:39:42 +0000
Received: by outflank-mailman (input) for mailman id 462033;
 Wed, 14 Dec 2022 10:39:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dEbZ=4M=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p5PAr-0000tB-6l
 for xen-devel@lists.xenproject.org; Wed, 14 Dec 2022 10:39:41 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2054.outbound.protection.outlook.com [40.107.20.54])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ce79490-7b9b-11ed-8fd2-01056ac49cbb;
 Wed, 14 Dec 2022 11:39:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB6793.eurprd04.prod.outlook.com (2603:10a6:10:11a::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.11; Wed, 14 Dec
 2022 10:39:37 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.019; Wed, 14 Dec 2022
 10:39:37 +0000
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
X-Inumbo-ID: 9ce79490-7b9b-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZqw00ZaHpuo/kwaJho0P8ynE4TPyrKXSER5oYjpGa3e0WAX8nYtYc3AmXQF1gpgIiUJ5Gf+8EfdZX3IJC32NlBVscdE6Kb1+C07uYywJcVsosoGJv/6xIkGXexuc1CT9/UA43dopYMbZs63m2qR0F0Qy4wbGfuqahxa4Kp8ogD0kgCsHNNsy1Ya05XhSQqYQbqUGwfA+0io79prxqHs7Kpr2HHX8L5a/Xf4hny6atu87STW4sm7kkSRuJedKkrUnoR6DKzeINEEE6czcfr86CqAJ8CSZIv6OndrYLz4hufBzad0sZjTXXwPYK9B5cUZO3jEMPcN30X+OhwyudS6ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SQRBrkQnmiPADbFGop9mFJ88PezLbKCysrXuE5d5kZI=;
 b=hlILITk64GqTi25sU0X+aiEwzcYkhyq7+h5tDSXMhcaJhHzAvZSRv2h0Ygm6k+IX2zkwQj1pLKCLjZVQC3vDhVMu3/Guhv6XBjTtLPWJaUYXMiiQu/G9ryjN0flNUxVmSuxIGbH5P8pHHO6n41b8rkvQnOFtPxcoWAN1yHflkWVfcBXSdsdsXGmCTlViKr4Ug3IAh7K9J6MSkmodQi1IZbmd3tysDu0ofA6ol6QzbimRPAx1p3Q9jetPxyQ1efUlk9k4MKW4XDnD1XkvZuMV9GXc1UtFcs9PMStU2FuhwTTeRQcWfZC20icx/NjtgAHTZmIsdm+/UXBCS8j8o1AQRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SQRBrkQnmiPADbFGop9mFJ88PezLbKCysrXuE5d5kZI=;
 b=JiKNjkh7rne7zN7RJUo2gMygf8D0uWE2ZmwNZ8aTFtyiq8o2fmRQ/398Hkz/Is9wA/q1zVsnJguunW4XZqMGYyR2qUAU4HyYBipUVtqFkFMPtmJbzUYZwpIpSNIZ7654j7kSHDP7z6EEoNzxkuoZdsczfz1UCXZif50jsG80am5sDU31qqVHN7yYNeLoKNAmT/bCxFVgPM0U01WwFriIy17QglTi4KQYROu94MpHCfypTT462N3SWyhkuWwXVa0m8qiGli9jNmG4/dam7KkrKB6+bRfgNhbNvrR8IXt4mFEBRm+q/Fmei8ZTOiKs+k+/VaeFdVOAwEMKEM6X/WwZSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <71281857-7387-afc1-f9b0-e076e4f076a8@suse.com>
Date: Wed, 14 Dec 2022 11:39:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH 2/3] xen/spinlock: split recursive spinlocks from
 normal ones
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
References: <20220910154959.15971-1-jgross@suse.com>
 <20220910154959.15971-3-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20220910154959.15971-3-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0095.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 371fb02a-8c13-4f00-18eb-08daddbf7f49
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	vZrr202J2iPlQ5WDqCcsF/OnbSOgWk4ieUh6wpU+6Mm+kh9tUkj51UvGHYhEEompNmTyiuy7gVWP51r0YvwHZhEgUmfBtZYP3Q4GGVeJ+FXzhOWjESe6j4oWK8y9ohHq0I2QdnsNVISnCK9n0/Pyms2/s/T6s5sHsWjQssz9KMWQFvCAM+RF0Vdx+fMgtSHamt/fn9RkoMkm3PUIvc1Sp6jkZan3tfEACLto2OjO3HTsgqJ9nWVUW1zjtFHKYrZ/gwGdvEg8eKdNkOzZCe8mxkP+/PeOKS+xS4hODVBE83giLYs7tM68CpwrwCY7QQ9D94MDsfKf9V3JIY9AmGOfaBaURtxpey9WA13Fb1bzrj9F97g7sp9yCvjj2F9ygG61MWCijj3KPbqqcEerI3MP9GV0GLwTJXcOH7TFeXVj5YRZl4hwlXJcyTJlvUQUBopDSykxkf34BZGgIfvMNnctdp/Md+mxvNVLgNFSz9cWNCKp4FvH1lsv37DNpvKQQNqhmRE7kZqQEAeVLnkcJcdpmwKH+4hYHtm7JEB8qsVjcAnp5MaEA1UNf7Zo+SJ619+x3YC2IlU9zMIG5b5nYXrfkhHwrsJWNJ7nbX51q2fDl7V+22fLE53m34cmrViudXYw0kvdYHb0AM6gh+qHeDcqfZbrMPwRrOgh6K6Jm3RW+KfUzzl75ztthRHMUQ1+QJbwh5l4tEU/eaClHZgSCB18upgnKz4XX6v2+7Zc8NLJG6I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(346002)(376002)(366004)(136003)(39860400002)(451199015)(86362001)(31696002)(83380400001)(2616005)(38100700002)(2906002)(6862004)(8936002)(5660300002)(186003)(41300700001)(26005)(6512007)(478600001)(6486002)(4326008)(6506007)(66946007)(53546011)(66556008)(66476007)(8676002)(316002)(6636002)(54906003)(37006003)(36756003)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UGl2RHhUdkhDR2RyRTU0QmYxSWszc2x4Z0xlNGQxclgrTHJURXdzSzJrRzBw?=
 =?utf-8?B?UC9PcTYrVXhJN29DR1MzNzdEUUw2UmJ6cTFONW85b3JlNldQUExaTDhkaFFl?=
 =?utf-8?B?c0p0d0oyVTQrRFNrTDFpZ2RldnNzS2RTT0k3c2RXZG94eUhPeGxMSGhvQURW?=
 =?utf-8?B?ZE1TUkxuQjBOd0FGZVBocDhHTHpxdCtjVnpsaVJsMW9DcGEwdEFBVTNxRk5Z?=
 =?utf-8?B?Nmd6YlVGVTRvSTF5eTVrR3RZbEZWSzVGdTZDbjVxMlhuMTYxTjZTTzZDS1Vi?=
 =?utf-8?B?aXQ5WGZyNWl6TE5uSkZkM1V4UENITmwvdTJtV3o2NmhPUTkvbUZXTDhuR0tr?=
 =?utf-8?B?Qk9ZRENVNHFXL1JnSUUzTWRWM3EyemVzYUFDZE02a1pib2xBenNIOHByenRx?=
 =?utf-8?B?YlhWS1dHOGVFdjhkZzlzQ2h5dTF5U2svZlZFYTBwd21OME1SNGUrWnVsQWFW?=
 =?utf-8?B?RUM5YVNFZXowa0dtTGl0bG8yREpET3BtaFVrL2FKVnhrdyt2bkI0Z016ZGVX?=
 =?utf-8?B?WEtaT0RwOWRYVlhmQm5FVmF4V0huQ1RQUDBBNEhrdHU1Q1ZySlBEcTUvYVhB?=
 =?utf-8?B?YVNkdDRoYTg3Skczei9WTXBkT2VpSmVsb0NUK1kzTkFMTE9BcnVZVWt5WGNJ?=
 =?utf-8?B?aXdvc0xtNUkydlJSNVRmM21vYjZyTkVHZndEQnFTN3dqY2Nldlo5Rzk5Z1lv?=
 =?utf-8?B?UXBLQWtjRjQwbDg0by9JczBoU3JuTlJ1R0RZMVUwMFlXaUlQYUNYaGwrbjQr?=
 =?utf-8?B?NmhLUDJrdEIrN0Y5dnV6SlZGTW1abHFZOG9SZ1p0NTlMYkxkeE1QaHhFOTlJ?=
 =?utf-8?B?dkJzNlpXRlBTd1lNbHlnWnVyMjRuUTgyRm1raExKU1QxOUFsNFFDOWJWUFNr?=
 =?utf-8?B?eSs3TXpVMGo1WjM5YzlYcW5odUI5RWJ3TmtmMUUyOGVNWTRkRXNZMW44TlFV?=
 =?utf-8?B?V2l0eXJaMVUyMWZsVXQwRnYvbUVDbDMralZLcXFyVzQ0ZUNEZTJ5RGNMMzRC?=
 =?utf-8?B?MWw4Qm1MaUVOQmZoUmhXd1NrUmtETllEL281aFVsZVY1dm1rMVRFanpLMlVX?=
 =?utf-8?B?QWFsd3RISHVaZVVsUnY3OUZKZG1UWG54VG9HSW0wcWYzTU5ERkE4T0pJb2ZV?=
 =?utf-8?B?MGRwNzg4eVJuQlF1eVMwM2ZENGtUdCtXZWh0VHhWSzhXWEN6aitHSlNTMDlZ?=
 =?utf-8?B?QjMvZE5UOFBRUHI4TjdENExhNUVpemdyTWNFSzZnMWx5V01yYjljVEJPcWxl?=
 =?utf-8?B?MXIySFFnUXZMWm5laW00QkwrS0xxckhyQ25vajBONmtNNkVqNFB1N3hncVdr?=
 =?utf-8?B?Y1NxOTVEMzkxcEFNSDQ1c0ZjUWMwSUJpZWM3ZWo4TjR2cHZRWVdZR3R6Q015?=
 =?utf-8?B?N0VjaHVnd2cvbVRSc2lIY2hXZnl0L010MFovaXArTU8xZkE0NXFueUYzdCtG?=
 =?utf-8?B?UGlhMjc2c2JFQnU0dkcxMjdoNG9OT2loeGkyTUpQYytwcDNGOW5VeGpQVUdC?=
 =?utf-8?B?TTNFd0d4aWZvdGNTTjZaUUI5di9CaVZDaHBqeU5LY3NsRU9PMElkOFcvN2tE?=
 =?utf-8?B?alVndm1VbEM3RVpZcExMMzl4bkNPeWEvZHdhaE45SGMwSzNFYlVraWdtT1Zu?=
 =?utf-8?B?N083b1FFZE4vZnVkMVdqYkFxa2c5UmwvMmVNZzhEclh5UEZ3ZFBXU1NMa3By?=
 =?utf-8?B?SElqQ1hpSTlCL2JqVVpGdVRNNWsxTXFwalF6MFJ1VkIxb01rVjBTNnF2TDVy?=
 =?utf-8?B?R3Q4eUVURG1kLzA5OE14R0xEeENsTnJVaUhoeWQzWlpVbG1SRzNXalB1VjYw?=
 =?utf-8?B?eFAzMGRaQndpT0hYR3lsU0xwR1B5QTVoOEtyOTBVWVhyQUdnUEVERDVkckwr?=
 =?utf-8?B?cnBhVDcxOXI4YzFCODVpZ0RHMEt0Wk1YTHhWVDRHNk02Mk84eVI4SUdnNEtH?=
 =?utf-8?B?dXV5SldadU1oK2k4NG1nTy9nbFNmMytsQUtrZ2Exb1Q1Z2lvTGxDVWVHNGtr?=
 =?utf-8?B?VVk1OTNQL1RQUjQzdTJLTTFjSjNPUUhWRG9xN1c4VlVQSDROZWFiMDc2NHd0?=
 =?utf-8?B?bXJ5eUVHUXdqQ0tPanV3RUx0bC9XRS9UV2RWZUlQRUlSOFFRaXRPeFRhekxI?=
 =?utf-8?Q?oz74pCOnZ4pxl23qM0ZGKuiR6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 371fb02a-8c13-4f00-18eb-08daddbf7f49
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2022 10:39:37.1585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwFRNdEe7OABqkpMScoB57BdvkSqipPrwHy0CjsMR00ipfM9Tb9wYG/LIGlXK6kOdTrYVUu0yBsc5ww+31ecEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6793

On 10.09.2022 17:49, Juergen Gross wrote:
> --- a/xen/arch/x86/mm/p2m-pod.c
> +++ b/xen/arch/x86/mm/p2m-pod.c
> @@ -397,7 +397,7 @@ int p2m_pod_empty_cache(struct domain *d)
>  
>      /* After this barrier no new PoD activities can happen. */
>      BUG_ON(!d->is_dying);
> -    spin_barrier(&p2m->pod.lock.lock);
> +    spin_barrier(&p2m->pod.lock.lock.lock);

This is getting unwieldy as well, and ...

> @@ -160,21 +165,30 @@ typedef union {
>  
>  typedef struct spinlock {
>      spinlock_tickets_t tickets;
> -    u16 recurse_cpu:SPINLOCK_CPU_BITS;
> -#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
> -#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
> -    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
> -#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
>      union lock_debug debug;
>  #ifdef CONFIG_DEBUG_LOCK_PROFILE
>      struct lock_profile *profile;
>  #endif
>  } spinlock_t;
>  
> +struct spinlock_recursive {
> +    struct spinlock lock;
> +    u16 recurse_cpu:SPINLOCK_CPU_BITS;
> +#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
> +#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
> +    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
> +#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
> +};

... I'm not sure anyway it's a good idea to embed spinlock_t inside the
new struct. I'd prefer if non-optional fields were always at the same
position, and there's not going to be that much duplication if we went
with

typedef struct spinlock {
    spinlock_tickets_t tickets;
    union lock_debug debug;
#ifdef CONFIG_DEBUG_LOCK_PROFILE
    struct lock_profile *profile;
#endif
} spinlock_t;

typedef struct rspinlock {
    spinlock_tickets_t tickets;
    u16 recurse_cpu:SPINLOCK_CPU_BITS;
#define SPINLOCK_NO_CPU        ((1u << SPINLOCK_CPU_BITS) - 1)
#define SPINLOCK_RECURSE_BITS  (16 - SPINLOCK_CPU_BITS)
    u16 recurse_cnt:SPINLOCK_RECURSE_BITS;
#define SPINLOCK_MAX_RECURSE   ((1u << SPINLOCK_RECURSE_BITS) - 1)
    union lock_debug debug;
#ifdef CONFIG_DEBUG_LOCK_PROFILE
    struct lock_profile *profile;
#endif
} rspinlock_t;

This would also eliminate the size increase of recursive locks in
debug builds. And functions like spin_barrier() then also would
(have to) properly indicate what kind of lock they act on.

Jan

