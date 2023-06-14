Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3A772F545
	for <lists+xen-devel@lfdr.de>; Wed, 14 Jun 2023 09:00:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.548470.856441 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9KTS-0001EE-8d; Wed, 14 Jun 2023 06:59:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 548470.856441; Wed, 14 Jun 2023 06:59:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9KTS-0001BW-53; Wed, 14 Jun 2023 06:59:22 +0000
Received: by outflank-mailman (input) for mailman id 548470;
 Wed, 14 Jun 2023 06:59:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dIEj=CC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9KTR-0001BO-7w
 for xen-devel@lists.xenproject.org; Wed, 14 Jun 2023 06:59:21 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2062d.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fb97882f-0a80-11ee-8611-37d641c3527e;
 Wed, 14 Jun 2023 08:59:19 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6806.eurprd04.prod.outlook.com (2603:10a6:20b:103::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Wed, 14 Jun
 2023 06:59:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Wed, 14 Jun 2023
 06:59:16 +0000
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
X-Inumbo-ID: fb97882f-0a80-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H5wFj/tvFAtS3AtTfMyhH5tjAdb0Ya2PZyIUTdZJSGxqnb7Pk7yP6Wp4VJwQWdaLj/wVkUaD9iJPOCai2hredMy2X8ktXaz3DCTHXSJ9LQHoCK/HNN2f2tBBbAoD7k2Sz/P1tDx7OgsCKHB1oKQPUpEikjBCkD6payZz2C4CQ0TbP1TRDa9WCtQP9VyKPSJUdpdSY3K2mYVYzamSbBSar7yAP6uLr7zHnijCXTxRP+JWyXCa7w4OoBqjAtoEcx+DhcZ6zuWLhkVS2kbV9C1bmScqks/JyGEO3fb21VOCw7nQL1Nwa7OTyo8F2BJjUPuNJFksUxwRAkrX/fywrWv+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W/Uv8+2ut0pU8/8B7q7t2WByz98y1j7agDfdD1y5+ro=;
 b=hBU5CbB06lKDrzHqe7Bge/g3j5n3rYj1CzWVv0FfxBCwsLCXZU189lOMFQzdTt5xSiRRIUuxyWINqJJKaY7vY6AkN6dsvgpGjwU92rCF3JjBc6/F8LDvtlX1bRvA1pC9KkUuerUeEtf9snXufxvzxL89j8IIEzk8hEjynK+R+tZFcY6ulFr9tL3bpjuQRJLAS0nSdrT7j1ZO3IZJG9bIb948AxVzI1ygq200z4WB9FatDzY1lSjEZ4DA4biI3FX3d/t4PXQkGrhRm5QVOPscwsLg6mp6Qw+sFUBA6C3ei1+34tNGZEdIb4dIYgsNL3SO91+mAQ11+cqBmrHWUWg0HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W/Uv8+2ut0pU8/8B7q7t2WByz98y1j7agDfdD1y5+ro=;
 b=Nf0GIwjlMhqVMdFb8QOzlMOR66nSOIfn/CnfJ72pAlZgoY9+Hz752raHzcd8XZnLLm3ubpXQ+U8f8AAQt5mbyiDrZ1VIgPpYR4gsizfeaForQ+EaIf05AB6oMbsddqnBWmnCKTAIziCKf+djksAntlc/y0abD4Y0U+f5+7XxCqboaQueO1ieS3FeQOQJQDstfj+Ons60KBsh9NJ3aGbMgJPBlzBEAsbf5R41JJonjPuVh8QF7aBLHwNZnM/U9pORXBP+aZtWU1qhfjHfeJq4fUT7ZlItm+sAoV9hlLgu6kfcdWUUuKpsMg5kR3D180Ai8U+pnajCdWzJIrJXL+hGaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c23a8396-a4e5-f6f8-9be9-b56c2c4ebdab@suse.com>
Date: Wed, 14 Jun 2023 08:59:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH] xen/evtchn: Purge ERROR_EXIT{,_DOM}()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230613162220.3052184-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a5::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6806:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7a9f53-9d42-45b9-d20e-08db6ca4de6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7sB08NL8rhkFdFvetm2i3ysDvGWoveJnXczZkVPqLEViS8Lgju0ZlbRE6jPq6yO7+P9hBbr+ejGe4Qj9qZfahvrm0HcXffwhmnyu+AhS4lSzFYA0I6rDAp1SSJUIc6arvF9QIGyCpI/UpEQnwryXk72ZC2Ngkj1BhuVPjEwk0/xQASt/1i1kbeaI0bf3emn59OeDR3RLEHjD4xLIpx7szzZ2rVm6FatB1WLQ/obi/0gbIHP3tPo9QtW2Ik6bFMU6+L78p99baket61Qpyos2Dpj0X3lBv5ALOifvty7vhEtwfAq1FBnlc4vPwhWlzAIa2U3bGCARG9bncLc0hpUcXJMaJaPsg0Q/NHIbHpRTPcnM9GT1sxt1o5+eA91puGIIekgHJcm8S36Qn95o8lZQI/2sFnbrHUI+2yQ/8on7k5DgKuLSdKeX4DZx8VDkOSQRjxhxFSQAZXQtQ9P7k/0BP4S2HtWYwLQRkKXV2Cv6rMBHorHe8AqnT9pUlbHFT+tctqOG2PPKfPMgQ/v/hb9NMkQjlqbt6ztwrg2kZRQHvG8tjw/tuHWuok6+MryTcnzJLGAxLu0oQVvk6kH/B2hoI725XenJ3g8vnl7O533Za3NOvFqk0K7YCZ+25eYh+xf1ll2oWJVTYnOBUO4vx3W2LA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(396003)(376002)(39860400002)(366004)(136003)(451199021)(8936002)(6486002)(26005)(8676002)(6512007)(41300700001)(36756003)(478600001)(38100700002)(66946007)(6916009)(66476007)(86362001)(4326008)(66556008)(31696002)(316002)(54906003)(53546011)(6506007)(5660300002)(83380400001)(186003)(2616005)(2906002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?enQ4Mzl2TWNtR2czSUF5NFJIWWRDdDAzcENoOUFrcmVrM0VFbEVnbEYwYWVs?=
 =?utf-8?B?RmI2NTB4bDZ4Vlk4YmxMK0xmUzFRRGNwZFYxRUpHcXQ4c0JRSUtnRGtoaGlU?=
 =?utf-8?B?b2V4bWdwSDd0TVhVTGxlc041UlBlTGVOeDVUc1hTRlJvS2djMFVabUh1TjA4?=
 =?utf-8?B?TEtaMmdvaUxsUjYyNGdlY1BZV3RiQjA0Wmx6NW9ZWWUvUkQrQ1JPcjhHSlNw?=
 =?utf-8?B?aHI1Yks3cUdKNzB1RVY2bnV6Y0NsUEZab2xjbmtOaDMzRFpHNWRZQmNKNlpk?=
 =?utf-8?B?VTgvcDZFdmZNRXdyeDZUV3lMaC9yRlNwU3J2VFlwQVNXRjdLUGtzb3BFbG5q?=
 =?utf-8?B?SEFYNXVuT2J5ajJ3OWxBM0RzZExPOVB3dktRdVRETncvT2h5V2ZOeVRuUy9l?=
 =?utf-8?B?OThQNjdFRDFRR1dEWWFEaWhEYXNRZkVyU1p3LytHTmdXSXlMbDBCM1pPSTUw?=
 =?utf-8?B?UFhkT0tkZVFYSVhjdjRqdDVXR2U1VDZGM0tRSHJIclF1TmRXVVord24xelpn?=
 =?utf-8?B?M3dTRGxwN0hNa28rUGRoTllRalFMTjZ3Z2dUeHRoTGZiUy80MDZ2QUtROFNw?=
 =?utf-8?B?c0tlc0RtSXAyNXpIb1dUSjc4MjRWWGZMdmYvbGVzK0F5THRINkxKSFZpSmlD?=
 =?utf-8?B?VWh0YU5vUjNRNS9JRjk1Tm5mb2RmbTZRN05mczFUMm1CcjNpdEJQanZQZ2Z2?=
 =?utf-8?B?NGR4cUZxZ0VzMm9HaG92eGN5M1VjVEhxelJJTERCSU5CSjE1eG9JSE9lRTJH?=
 =?utf-8?B?MGJScXo0Y0lTc0puaVdLR1VvaHZ5dGthb0dCTUVsUnJsVDJYOEgwRTZQekE1?=
 =?utf-8?B?Y2dwTlJjU20xR1dRc0p2V1J5bDNYZ2JIL2FkWGVEbUViN3ZEY05jQms3Sy90?=
 =?utf-8?B?b3NwaXJHcEt3ZFQ2dWQ4ZSt5enFTN1U1SzIzSzJ6cTM4Wit5NHdmaDB2azdr?=
 =?utf-8?B?Y1hITHhmaXRzWkM5bkNWUjNYcmEvZncwbEhDS0ptcVNHUng0Uk4wNGhMUVo0?=
 =?utf-8?B?TUozODJ1dHpzL3BnUnFXeVVYZmV4TVdxOWg5Y1JUQ0lldmhsNzlyTitCeGRI?=
 =?utf-8?B?WDZnR0ZEb1B2a1FvY05tYnFkbTVTZWpsZVFmeEFubDNHclZUWnBVMGFsSEtn?=
 =?utf-8?B?d05RSEJOSVNlZTNxZURDOEk2bVpaQTBCdHQ5NmZOcXlZSmRXOFBkUnVIZFZq?=
 =?utf-8?B?eDMzOXAyZEp4dHdnQ1k5MGdjajZHMFR0OS9RL1FpZ1huTnppWURGVHRzL2RN?=
 =?utf-8?B?RnVTa2c5REFjVDdwa0NYSHJsZVhiN2ZlbElReDloZ2hQM2d1NE1YaVEyNWtl?=
 =?utf-8?B?Z3lZK3o5K3Y1cFlkdE16TFdnRnRUYyt2dytNa0YrSzhYWjI1dlJFekJXSncz?=
 =?utf-8?B?ZnpZMm85ektNclVsaXRaYjlXR1VWbkd6bnRYUmRjekg3cUplSGpmNWRSV1Yr?=
 =?utf-8?B?b0dCdDBSdldmTDRPVk9wVHNERG1OSVpBS1FNenlBV3k1VHBJbEdlQi9aVEhu?=
 =?utf-8?B?TEJSNDBvWlk4QWZBNGdrVVFFMnNIZk9mZWpzR2phYnBkY2VZUWF3WTZaQUcy?=
 =?utf-8?B?THRpL2EyU2Fwci9ZYmlCSU1SWGhWcTROQ3BOR0xrV2ZDZHJLUkJNaGhVK1hn?=
 =?utf-8?B?VkZRTHVqVzlYUm9TUnQ5VHBZUnRpK1NTZnJtc2NRWHZwVDFoZHBmZHl5N21C?=
 =?utf-8?B?OEVFN0gxOGIzbk4wZkdqVFlXRHZOekhJRExKaTJSMXE3T1FPcnJTOWJiWVdm?=
 =?utf-8?B?RkZwNmtBZENZOVN3R1ZId08yM3JsMjBMSldQRzdNSERNV0tIZWFjd2M5OW4w?=
 =?utf-8?B?UUpvNWxhYjNZVTVpWnpWa2tEVXpTUEZXOFpkWU01eXMzUlZpemsyK2hLRXNZ?=
 =?utf-8?B?T1dNZElUZWEvMHpWMGtkcUsrcWYvT3dIMnR2Rm0vT3FBNUpOaFVtOWx5TVQy?=
 =?utf-8?B?Y2xOQi9Qc25Qa09sWUc0V2MwM2lNUUl6SXZPdGttNGRBdDZ2RXY2VUhZVlhX?=
 =?utf-8?B?Q0grL2U5V0RKd1REbmEvWWJEOVRhVG1qL0ptclFLaTBQeExMZXFKRTVwRnUy?=
 =?utf-8?B?WU1HM3ZYcVB0WUZiakorU2JDM3dVTStjeFJ1cjdUWEcvQ2xXUjZDakxzUE45?=
 =?utf-8?Q?NQu0unhoAOf1OcfxSgUEgF085?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7a9f53-9d42-45b9-d20e-08db6ca4de6d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2023 06:59:16.6347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BXJkxTawhoAtg0izEsnD8cwG6zsuzTK/I6ceCvAyLmGcjj699na47wL+pB1rjsorOwJwVJOeiehFrezgIhDq9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6806

On 13.06.2023 18:22, Andrew Cooper wrote:
> These are disliked specifically by MISRA, but they also interfere with code
> legibility by hiding control flow.  Expand and drop them.
> 
>  * Rearrange the order of actions to write into rc, then render rc in the
>    gdprintk().
>  * Drop redundant "rc = rc" assignments
>  * Switch to using %pd for rendering domains

With this change, ...

> No functional change.  Resulting binary is identical.

... I doubt this. Even .text being entirely identical would be pure luck,
as message offsets might change slightly depending on how much padding
the compiler inserts between them. Furthermore I wonder whether ...

> @@ -336,7 +319,11 @@ int evtchn_alloc_unbound(evtchn_alloc_unbound_t *alloc, evtchn_port_t port)
>  
>      port = rc = evtchn_get_port(d, port);
>      if ( rc < 0 )
> -        ERROR_EXIT(rc);
> +    {
> +        gdprintk(XENLOG_WARNING, "EVTCHNOP failure: error %d\n", rc);
> +        goto out;
> +    }

... it wouldn't make sense to mention the actual operation that failed,
now that each function has its own message(s). In turn I question the
usesfulness of "error" in the message text.

Then again I wonder whether it isn't time to purge these gdprintk()s
altogether. Surely they served a purpose for bringing up initial Linux
and mini-os and alike, but that's been two decades ago now.

Jan

