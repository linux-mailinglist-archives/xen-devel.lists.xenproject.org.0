Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E17F276CB66
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 13:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574876.900508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR9bn-0004nI-3y; Wed, 02 Aug 2023 11:01:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574876.900508; Wed, 02 Aug 2023 11:01:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qR9bm-0004lP-WB; Wed, 02 Aug 2023 11:01:39 +0000
Received: by outflank-mailman (input) for mailman id 574876;
 Wed, 02 Aug 2023 11:01:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=j9Om=DT=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qR9bl-0004lH-VU
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 11:01:38 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on061b.outbound.protection.outlook.com
 [2a01:111:f400:fe02::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f2cb66d2-3123-11ee-b25f-6b7b168915f2;
 Wed, 02 Aug 2023 13:01:36 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by VE1PR04MB7342.eurprd04.prod.outlook.com (2603:10a6:800:1a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.45; Wed, 2 Aug
 2023 11:01:32 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.045; Wed, 2 Aug 2023
 11:01:32 +0000
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
X-Inumbo-ID: f2cb66d2-3123-11ee-b25f-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U/VRk1PHO9C5sYd+LDcuc007V4W0AuR522r5spzO1v4EloEFrMMqfZku9wzblOvUg6LHa6hbXkMElf+pxxzaL2Q8RXt3GvjTQh2mQOtREm8+3i5BpUuAmnJ5AZ4g2NcpFyQn3SeGLi6L1Rk4CbJjniT+ZgpJYeg3T8wEtvDVQAQhSYKfMVZavUS5t6+o5Ph+BoMmKwWz/dyVlqBmgj6++N+NvyzlshCboOlnZs78EaveokO7MtQqgBeww6xOVBqH7yi17Ho96jvrmlcDIuIfdhDGtxYbY7U1SRV6W23TZKw2dITgLAUz4HgG+R8U7t0Q13h8yhBzc04u1RF6TEU8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fdh5TOzTgAphRoEI55SIoaVipyL6Mk5004Y1GLqMc8E=;
 b=A34yWaBP7MT4+F4MDlYvxLnyqy1cCj9N8RvHauaZAqESOOLmZGydbh19Z7i30pAAqsu280D4KEUKJhCWmyIGf/wHtv8MUzL7h9FW5w7QSh8Ldr7c/KQOxEF/LYG3ZiEPgosM/XWVkEQW+WhoUWqyHHo/ETqkpQi6XqovjHWce+zNCaq6cOj9snRivy1MJsDXs7gt8ZInkUicQfhKs12bQ2+YNSVapSxj2JqDM3wz0WhZdhpFOY68h6YG8Mqr1DHkXxJ9biLPSkE5TTCSu9BPirYUqYlhhL0+M4amRu5hXfJMdcEZKeFM5L6uvheueZdMDFBMuIQGHo1B2nLhmKMCJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fdh5TOzTgAphRoEI55SIoaVipyL6Mk5004Y1GLqMc8E=;
 b=gspky/Lilw5kVsHZVub/qnHoAvR2IHpjQa7DixAd1dgKjiWMJXcu2aHuWk3Bn5qkn8jsLlsZJ8ymhqS7ksNoZ6szoHPpnBxw3ipBF3BlRCVSbaZjXj2nqTj2eRaLHUY2zzVPnhcIDCuHjED1T84yqVnQLoS7Vd2bVa7ddbVXWgrJX/qWKZ3R3kq1We14BO6RJOUG/MtjmAduKo9MVqwgjX2G0zGn5mPPaeB2673iNeabGDbpDUotiz0dQW12N2yriT0uci9FBvGi+iz90IBtbdQIpo2zEfjtOhiZVbHLFz5l0Yh5r3rjFJpHpZYuwKdvyujEtg/FfwDU1DkVrTkp0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3b889079-571a-a83a-0cba-c30cf2ce0b1b@suse.com>
Date: Wed, 2 Aug 2023 13:01:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH] console: generalize the ability for domU access
Content-Language: en-US
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
Cc: Christopher Clark <christopher.w.clark@gmail.com>,
 Luca Fancellu <luca.fancellu@arm.com>, Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20230801160608.19219-1-dpsmith@apertussolutions.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230801160608.19219-1-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|VE1PR04MB7342:EE_
X-MS-Office365-Filtering-Correlation-Id: bd09ca9d-5243-4b65-88e5-08db9347d48e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	yuzgaeL9XaVHpGz1BL7Rs8Y+HhjkT4Rd/T2wuqXwuoL+NRQb/I30qTaiML3ct58n0ktxfGw8gUb4cjAxItZBjEw32kD+5J45mwKOmMVg6d08WToqaTwkGlx0uruZzg3iqMEUrE1u2psm3adkUZOXyD0hyCxIbiGDnfgB13ldx6R/0ndpxRyETTqrE+lACXWM2x83zTf4uy3PRLQZTX3FeOZ210hQA56PaF9wP02BFLWtMj3LCpBQBWrbjyVRgK76DvaR612y92SKeyocBq2zyxuJH6YhwC0jpQxJl2RqyUX4JoKkNc12aBw48O2Sva622jP8qL5UDyQ0/0i9tSb2ja5pB6sAojFZdFCwZmpMhObok7g03LELjQSK4zhY3ZccxSFj99TBx+AXyOS68n+kOD/5UgmQzZVkWbFoqgLTpkH1wC5BjFfGM1qIqCYKAT9/HCI/H80+mV3djmXq5whsJVXefP7xbKYXi2d3xD1f0v9J/voJLS/NAwDE6q8654au3EUhGB6wehMvNS0qBl9PDGs02ShfDUkF+z3BXSPBSdInSrVdIlLSazC5U4dKn64sM83yHU59/PHXt2DOfABBnGsPgxNa5xlzz01zFrhQ1ENjfPhXCthhBadguNfzJ3kdLwb4Ma46lKnUKw6EvKCBNg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(39850400004)(366004)(136003)(396003)(451199021)(478600001)(86362001)(31696002)(6512007)(36756003)(6666004)(6486002)(316002)(8676002)(8936002)(41300700001)(5660300002)(31686004)(6916009)(4326008)(66556008)(66476007)(83380400001)(7416002)(54906003)(2906002)(38100700002)(66946007)(26005)(2616005)(186003)(6506007)(53546011)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Mmlhcnd2VGJzdUlLTEE3eFdkVVRMbUpKaUQyZzBkdzY4VTBhcW5GL0hrZFBM?=
 =?utf-8?B?dUhZdERidEFrT2JCYytvbEsxMDJTYll5VENmZjVSRkh2RzBsWUpWNkRVcmlB?=
 =?utf-8?B?NDFTd0pmWlEzcFEvZ3VOWEVQcDExZFBYVEVyMjJWSmN2R1M0Z1lwbzhpQ25W?=
 =?utf-8?B?ZzM2Mjd1cVhVSEdUWXZoVHhMQUNyWUZEakovWkVWbGl5S1lLcFVGSFZzSHdN?=
 =?utf-8?B?ckhQZzYwbUJjaTdiRktWL016S05idFdNcDg4U3lycGlIeHFSRnZxYnpVZ2dT?=
 =?utf-8?B?eXpPbkdtTmFYTGJwYUlkWTJPRGpBdnVXZTZDMGJlL3UvTkxXdkVBMURvWXY4?=
 =?utf-8?B?Y3d6dTZ1QTBvWVE3Z0lMa2xEZ0hMdEVUSjFRQmtBNGhOQXhneEZwSnBWODJC?=
 =?utf-8?B?Z1dwdTNOdkwycGFDQzNXZGFBaUJxTlNweEpoaEkrTGQ2NEM2QkMyRmJZRUNE?=
 =?utf-8?B?RUc0UHJ4UnBjc1VFN0ZuYnBwSXJNQ0MyOVUrSDdUbk5nVEhYR055Vk1jRzE5?=
 =?utf-8?B?VWNtTGxabThOcDJlN2RUS3pSVEp1eWc4Tk0xMzhTMDByUVZ6dnF2QSt5dnZK?=
 =?utf-8?B?SS9sTmMwcTNuS2RZUWMzYlVzMjRxM0pjdGlpWStaOXk3ejZ1Zk03bC9JT011?=
 =?utf-8?B?Z3lLbFlmYXFydEhFbmFVQU9Yb0c2ZUsvMGVvRmZoeXcrOWp0VTVUVnlmQ1Bz?=
 =?utf-8?B?b245bE1yU0NBS0dKZ0pnMm1zTnBta2Q0bWVBNHJxOFlURGEybXB2R1lqUUdD?=
 =?utf-8?B?THNRKzViSEJRNm0ra3piemlOSU03dXN1VnhnV0pyTTQweTlZaVFJUGszOTd3?=
 =?utf-8?B?cW01aE9zcGl2OHFjNWdCSEZIUVJENFdib0ZFS3dTek12Vk5QSEtyS0p6LzVJ?=
 =?utf-8?B?U20zZllFY3BPeUo4QXloMXl6Ny9YYjhHc0NiTXJSenNwVmhSbnZXdklScGdh?=
 =?utf-8?B?ZTNpVis1MXl5NFRjWm5wQTVJaXBTQmlVQW1kb0RXRU1Rc0QzaDlqOEc5VjZa?=
 =?utf-8?B?WVhWNDRxTlZSWFFUWks2cUIrbVVlT2xiRzUzV2JiNER6QWc0WTZKU0NacTc4?=
 =?utf-8?B?OEZEUzI0anE5R0FDMkVHL2EydktrOVRpQWdTSTVoanliOVJESHEzZ0hHMU12?=
 =?utf-8?B?WDQzdUpmYjB0dFF2SkxmdFRPTURNaDRvaFliVFZDakFURXV3VkZ5bm0zVnl6?=
 =?utf-8?B?SlRvWWJkUzZ2Q0tFbngvSlFKanpXTkc1MGR4bm9NZDE5dzNZK1ExQjQ5WStT?=
 =?utf-8?B?dnZ1aFVtME8rT2htSTBMbXF4L0hQaHRkOHRFN1hOTmNNZlN6R3ZDZ2s5Ujdv?=
 =?utf-8?B?Nm05QlpwMmtrTVo1Z1FPbHVZRGFKRWJiRDZabVJ2N1FFNGFValNQeUwzU1BW?=
 =?utf-8?B?NklaRVduRUIzZ0lKQUl2WndyOFhRUHlBaGJXbm15MnNNQ3h4YnUrTTF3RlFD?=
 =?utf-8?B?VG10NVc4Y2RtRys5ZzMvejZlSG5tajBCbTltOFFnTzdnbi9RNFdEMlB4ZFhC?=
 =?utf-8?B?MnBVTUc1NkcyOFYxSWlGUWxGNGNqYjZPZFBLVXdYRTVydmxDcW03U1JBV0x0?=
 =?utf-8?B?SytLV1JZbWFxMGtuQS9NVzl2NW1oWHhuSmwvWHNmelhwUFFDZDNVbEMvQ0NY?=
 =?utf-8?B?YVlZTGJqUEM0a3kwTnFmdmNweHV3enNSZGlialNEVThmQnc3MGJSM0EvdjVM?=
 =?utf-8?B?Zi9pRFF5YWI5RFVXcUY3RUQyR2hpKzhOaDR0T1BsV2xNQjNIVk9LaUd1bTZC?=
 =?utf-8?B?dCtZejdJemN2aFVkejdNQS9pQVdzVlhpMklmS1k1NVdIYzdkL281U212NjJM?=
 =?utf-8?B?a3VUSjZFVXY5ODFCcHlNazYzMHFOeE9GdHVIeGRDRjV0TWg5ZzNCblN4L2lF?=
 =?utf-8?B?OWVBTFRlMSs2Qi9RSzByYlplNEh2THpCL29Lc2tyOEw3OFZtV09xUXVkSUx4?=
 =?utf-8?B?dW8xckxwRGdnc3llTTRMUEFaOXpJZnNDcGt4WmVJMzI5dlhJeGViT3doSlZP?=
 =?utf-8?B?bDc0cExKMmFobVJaS2tFK2FROGpQOXJodFptRCtYTWZRRDA1SGcyTjg0eVZI?=
 =?utf-8?B?Qzg0WTRLdUZsU01Ubm5oSisxbExuVy8xSmVmWnBpOHQ1blFENktvTTc2SHdF?=
 =?utf-8?Q?kEzcPZ9TCndoUPBGwTtZLLkLB?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd09ca9d-5243-4b65-88e5-08db9347d48e
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Aug 2023 11:01:32.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: np+GiwZTC29IJwLLOgS6Rz9GPXS9PW1ZPZo2tqm4dWIK2Ll5SMuHySRDzH5Kox60zPs361H4Pvio5u3vegGkpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7342

On 01.08.2023 18:06, Daniel P. Smith wrote:
> This patch reworks the console rotation logic to provide a general mechanism to
> incorporate domU in to the rotation. It does so by walking the domain list
> using the XSM console privlege check to determine if the domain is given access.
> 
> In reworking the rotation logic, the assumption that the hardware domain is the
> first domain created is removed and is changed to explicitly locate the
> hardware domain at boot.

I guess I'm unable to identify any "at boot only" code. I'm also
puzzled by this indicating there is a need to do so, when the global
variable "hardware_domain" is available, and you actually use it.

> --- a/xen/drivers/char/console.c
> +++ b/xen/drivers/char/console.c
> @@ -473,45 +473,102 @@ static void cf_check dump_console_ring_key(unsigned char key)
>   */
>  static unsigned int __read_mostly console_rx = 0;
>  
> -#define max_console_rx (max_init_domid + 1)
> +#define CON_RX_DOMID (console_rx - 1)
>  
>  /* Make sure to rcu_unlock_domain after use */
>  struct domain *console_input_domain(void)
>  {
>      if ( console_rx == 0 )
>              return NULL;
> -    return rcu_lock_domain_by_id(console_rx - 1);
> +    return rcu_lock_domain_by_id(CON_RX_DOMID);
>  }
>  
>  static void switch_serial_input(void)
>  {
> -    unsigned int next_rx = console_rx;
> +    struct domain *next, *d = console_input_domain();

Looks like "next" cannot be pointer-to-const just because the XSM hooks
still aren't properly const-ified. Oh well.

> -    /*
> -     * Rotate among Xen, dom0 and boot-time created domUs while skipping
> -     * switching serial input to non existing domains.
> -     */

While it would need adjustment, I don't think the comment wants deleting
altogether.

> -    for ( ; ; )
> +    if ( d == NULL )

This covers both Xen receiving input and the domain receiving input having
gone away. Originally in the latter case the next sequential (in domid
numbering) domain would be switched to. In the new logic you start over
from the beginning of the domain list. Such a change in behavior (if
deemed acceptable at all, which I'm not convinced of) needs calling out in
the description.

>      {
> -        struct domain *d;
> +        if ( hardware_domain )
> +        {
> +            console_rx = hardware_domain->domain_id + 1;
> +            printk("*** Serial input to DOM%d", CON_RX_DOMID);

Here and elsewhere - why %d when original code properly used %u? I also
think there are now quite a few too many of these all identical
printk()s.

> +            goto out; //print switch_code statement & newline

Leftover development comment? (There's at least one more.)

> +        }
> +        else

Please avoid "else" after an if() that ends in "return", "goto", or
alike.

> +        {
> +            for_each_domain(next)

What guarantees that the list won't change behind your back? You don't
hold domlist_read_lock here afaict. It might be that you're safe because
that lock is an RCU one and this function is only invoked at init time
or from some form of interrupt handler. But that's far from obvious and
will hence need both properly confirming and stating in a comment. (It
is actually this concern, iirc, which so far had us avoid iterating the
domain list here.)

> +            {
> +                if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
> +                {
> +                    console_rx = next->domain_id + 1;
> +                    printk("*** Serial input to DOM%d", CON_RX_DOMID);
> +                    goto out; //print switch_code statement & newline
> +                }
> +            }
>  
> -        if ( next_rx++ >= max_console_rx )
> +            console_rx = 0;
> +            printk("*** Serial input to Xen");
> +            goto out;
> +        }
> +    }
> +
> +    for ( next = rcu_dereference(d->next_in_list); next != NULL;
> +          next = rcu_dereference(next->next_in_list) )

This looks like an open-coded continuation of for_each_domain() - I'm
afraid I'm wary of introducing anything like this.

> +    {
> +        if ( hardware_domain && next == hardware_domain )
>          {
>              console_rx = 0;
>              printk("*** Serial input to Xen");
> -            break;
> +            goto out;

Since you use "goto" anyway, this wants introducing a 2nd label (maybe
"xen"?) ahead of the identical code you add further down (immediately
ahead of the "out" label), to avoid code duplication.

>          }
>  
> -        d = rcu_lock_domain_by_id(next_rx - 1);
> -        if ( d )
> +        if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
>          {
> -            rcu_unlock_domain(d);
> -            console_rx = next_rx;
> -            printk("*** Serial input to DOM%u", next_rx - 1);
> -            break;
> +            console_rx = next->domain_id + 1;
> +            printk("*** Serial input to DOM%d", CON_RX_DOMID);
> +            goto out;
> +        }
> +    }
> +
> +    /*
> +     * Hit the end of the domain list and instead of assuming that the
> +     * hardware domain is the first in the list, get the first domain
> +     * in the domain list and then if it is not the hardware domain or
> +     * does not have console privilege, iterate the list until we find
> +     * the hardware domain or a domain with console privilege.
> +     */
> +    if ( next == NULL )
> +    {
> +        for_each_domain(next)
> +        {
> +            if ( hardware_domain && next == hardware_domain )
> +            {
> +                console_rx = 0;
> +                printk("*** Serial input to Xen");
> +                goto out;
> +            }
> +
> +            if ( xsm_console_io(XSM_OTHER, next, CONSOLEIO_read) == 0 )
> +            {
> +                console_rx = next->domain_id + 1;
> +                printk("*** Serial input to DOM%d", CON_RX_DOMID);
> +                goto out;
> +            }
>          }
>      }
>  
> +    /*
> +     * If we got here, could not find a domain with console io privilege.
> +     * Default to Xen.
> +     */

"Default to" is a little odd when there are no other options.

> +    console_rx = 0;
> +    printk("*** Serial input to Xen");
> +
> +out:

Labels indented by at least one blank please.

> @@ -520,12 +577,11 @@ static void switch_serial_input(void)
>  
>  static void __serial_rx(char c, struct cpu_user_regs *regs)
>  {
> -    switch ( console_rx )
> -    {
> -    case 0:
> +    if ( console_rx == 0 )

By using CON_RX_DOMID everywhere else you try to carefully avoid and
open-coded assumptions on the precise biasing used there. With this
it would seem to me that here "CON_RX_DOMID > DOMID_MASK" would be
more in line with that model then.

>          return handle_keypress(c, regs);
>  
> -    case 1:
> +    if ( hardware_domain->domain_id == CON_RX_DOMID )

No check of hardware_domain against NULL?

> +    {
>          /*
>           * Deliver input to the hardware domain buffer, unless it is
>           * already full.
> @@ -538,31 +594,37 @@ static void __serial_rx(char c, struct cpu_user_regs *regs)
>           * getting stuck.
>           */
>          send_global_virq(VIRQ_CONSOLE);
> -        break;
> -
> -#ifdef CONFIG_SBSA_VUART_CONSOLE
> -    default:
> +    }
> +    else
>      {
> -        struct domain *d = rcu_lock_domain_by_id(console_rx - 1);
> +        struct domain *d = rcu_lock_domain_by_any_id(CON_RX_DOMID);
>  
> +        if ( d == NULL )
> +            goto unlock_out;
> +
> +#ifdef CONFIG_SBSA_VUART_CONSOLE
>          /*
>           * If we have a properly initialized vpl011 console for the
>           * domain, without a full PV ring to Dom0 (in that case input
>           * comes from the PV ring), then send the character to it.
>           */
> -        if ( d != NULL &&
> -             !d->arch.vpl011.backend_in_domain &&
> +        if ( !d->arch.vpl011.backend_in_domain &&
>               d->arch.vpl011.backend.xen != NULL )
> +        {
>              vpl011_rx_char_xen(d, c);
> -        else
> -            printk("Cannot send chars to Dom%d: no UART available\n",
> -                   console_rx - 1);
> +            goto unlock_out;
> +        }
> +#endif
> +
> +        if ( (serial_rx_prod - serial_rx_cons) != SERIAL_RX_SIZE )
> +            serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] = c;

This is Dom0's buffer; I don't think sharing with DomU-s is correct.
You also cannot ...

> @@ -717,6 +779,8 @@ long do_console_io(
>          rc = -E2BIG;
>          if ( count > INT_MAX )
>              break;
> +        if ( CON_RX_DOMID != current->domain->domain_id )
> +            return 0;
>  
>          rc = 0;
>          while ( (serial_rx_cons != serial_rx_prod) && (rc < count) )

... assume that by the time this hypercall is invoked input focus
hasn't switched. I think there's no way around a per-domain input
buffer, which of course would need setting up only for console-io-
capable domains.

> @@ -1107,7 +1171,7 @@ void __init console_endboot(void)
>       * a useful 'how to switch' message.
>       */
>      if ( opt_conswitch[1] == 'x' )
> -        console_rx = max_console_rx;
> +        console_rx = 0;

I can't bring this change in line with the comment ahead of the if():
Won't this result in switch_serial_input() switching to Dom0?

Jan

