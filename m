Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA973644522
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 14:58:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.454905.712484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YSl-0007Ax-IV; Tue, 06 Dec 2022 13:58:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 454905.712484; Tue, 06 Dec 2022 13:58:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2YSl-00078y-Eq; Tue, 06 Dec 2022 13:58:23 +0000
Received: by outflank-mailman (input) for mailman id 454905;
 Tue, 06 Dec 2022 13:58:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vOWa=4E=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p2YSk-00078q-Km
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 13:58:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::625])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 02091161-756e-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 14:58:06 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8670.eurprd04.prod.outlook.com (2603:10a6:102:21d::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 6 Dec
 2022 13:58:20 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Tue, 6 Dec 2022
 13:58:20 +0000
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
X-Inumbo-ID: 02091161-756e-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OHACVKA919VXuVrNKLn/WmavLCDS5mN5oCuc1r/yAHUO/vl5ouMxPuQJT/A5e/pRzSXflhDyIrXyGBXgzSD3iKWCwPPrnCFvk3zDubRq60+56Gpq3J1xZrRLHPJ8x9w8O4DxTi/s9TfDB4cBZZLImVSOCH6vnAHSZfDB8bT/ZNunhiP+HqMxE4Apm0xPDPTBv1Dns7tUM8H6t+3R48MTMP9nsdR0gFiJjbBlTP8RfiJt7r4jBL3i9j5ScXgkDwbpKdGm7Gn/tteybhooxn83Udw6c56Z2sinjo39l6+7rPQrCL0iY/t3de8yyUhPl9T7rm76+eo3snXbjrRif1t1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WodNBYfIE6V7S2xRgR9bLeRTZMdP6q8X3QuEMlQdKK4=;
 b=J2YPKugnDRfbLZODpQtIq3mjIiosl/R2cHIo+qOXlywnvaGp3SXORDnhm/IcTnyqNodmdEscSXai3edW1FKkChOaWZ0lnchAZc0lCqEbll4Fr0Ak8aATdxZsNuR0UFn0oRN4kiW7TLbVBBDZRSgjKsqU8sYQx5rq1ZbDHduu+CX8QZQgGbHWmxdOJ6UIRFYa0VZv7t+R4ocXW1oph7lJLhzEm6a3qBAOLVnB6UW7GYQD5kguaxWaHnPO6a+P2byII3TobrBbD4phawXBS/A2/BvhsI0KFAQEo7f1AXbm1ioUP8lXZWJrGW2J3auadaCSgTWyhOiMD+rwdg48Mk3lAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WodNBYfIE6V7S2xRgR9bLeRTZMdP6q8X3QuEMlQdKK4=;
 b=WwkftNxzAFXQdIbo+rE7N1ZQmlupFFPpMcBQTpzSh7sE0D6QRlePL5ide5AlGSjX5nvQpnuQrMqkVT2FUq5eYOckvQ4Ea7MQkNeHsOOWY17YEEzt4rXZ7P492pKLDpP95zq5saSiyhAuVbozPYi89YPeu6/I9oqNW12tU1j8ABaLCwo8ib1SmTvE8dyhramPZeXGaAYRNSjwSmmNeqTMzqBbFF6P5Fm+mvW3ig53VEsjPduvPrIUinzcZXrX69/rKr+TV37ElUsQ6tUgOvb0PiZ1XZe3B03qZYer84svNiHGNeC40kePXhe+Yf300NzO+6pkL/NbS3fxojnHB8slBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a9050eac-21b0-c736-31a3-d6920080d82f@suse.com>
Date: Tue, 6 Dec 2022 14:58:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH 1/5] x86/tboot: drop failed attempt to hash shadow page
 tables
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Lukasz Hawrylko <lukasz@hawrylko.pl>, =?UTF-8?Q?Mateusz_M=c3=b3wka?=
 <mateusz.mowka@intel.com>, "Daniel P. Smith" <dpsmith@apertussolutions.com>
References: <41a370eb-09b3-6e0f-7fb1-2d6e33d25021@suse.com>
 <83f510bd-9a9c-3063-27dd-d894b1e8031c@suse.com>
In-Reply-To: <83f510bd-9a9c-3063-27dd-d894b1e8031c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0008.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8670:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ba1b851-5948-44bc-d489-08dad791ee9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Bh+uuBzlPqX9oPyTKTOqYPZsyB1wo0+NKZuZ8TBCyhGhEMz1hTwBf1yf3IY7ahzifKn6zCBls9a9Y2D3rt6gzwMv6ctBiCiQERGbOHEOOP1mV7VQDl8vrjPzYuS9L7hOhPJ7isnG5U/ZvNCgpv1lDKkds2c+KYqiLdaO3qYPLUEHQSgIc9nJYWkSQhQk4qwKIELHGqFcfDNoxbRMkpaXTAjUN6x/4k6crB7qJyawoklL6ZyGEszwFHt9B8bM0/Vt+MYeiulSWHuP2ykmcs7yWHzA1J4queMaDdactiVuGgcfwnk2ZDoSCmcRyJzOgwnb8Vm/lywKkocXv6LYgF8sUzyx8gPvIFsqfXDAzdKumR7lxtn4omdb80sree5MQIRESzlGzofCEboQUJW75Nj0jL0P/LBE1KK8o0AdX1cPncR6UY2RjsP4zdPE5wLZOGGnGRUqAMkxJ1Jy+SjOpjDc6ljKUFYPXyplq4kFRKCeGDh4KY5ZnnINSTwkLawrQXOcQWA3ORl7qkwlUwU/sH/jNiyTjBuPwi889WXhINhRvrjOXjiTpevQICtcPsu8HReTvjya8XyQLujY3/hevM3Z47MjB1n8GExSw8iAtZ9FgCA0E5gGkKb830gnMWB7ZN1DhAKMgsRaQaBAiQBbMNAwzAP9uCsPcC3ru4MbAh8TrjUduJ6jXPdKCEyZXPQWZbJoWqJ6DG5Um3RKF40HpUiM/MOBi8lzg2oLhGVVuTjccoA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(346002)(366004)(376002)(39860400002)(396003)(451199015)(36756003)(31686004)(38100700002)(5660300002)(86362001)(31696002)(8936002)(2906002)(4326008)(41300700001)(83380400001)(478600001)(66556008)(54906003)(6486002)(66476007)(6916009)(2616005)(316002)(66946007)(8676002)(53546011)(186003)(26005)(6512007)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZXg1QVRvcXExRXVDRzUwS0hEc1JqclorLzMvK3lpZmQ5QzQwaW0zcXExZE82?=
 =?utf-8?B?WnZXenB5U3hlWkxTMS9JREorSmhON2ZWR0wxWXJzSkMrZG9EaklMWGdVQjN1?=
 =?utf-8?B?RjI2bm1KUVlYak1za25ubTkrTUF2Z2JZYW1nOUlOdDZjZTVRVmhWUHZkekg3?=
 =?utf-8?B?UHRCTGhFbEFhVzhWTWNHQmZKWGRTY0NIUVFab09taU8yMHBGdk1xbGFUUmRS?=
 =?utf-8?B?cDQwR0FVVGRCMlJ5QkMyUW52SEFUSzlHN09yQ1dweDE1K1FkY0ZnNTE0RjFi?=
 =?utf-8?B?N2M0blJYOWNqQytYOE9OVDNFelJaR3pXSzRCWXRLcXFoejhnd2xNc3dNRFJC?=
 =?utf-8?B?NTUvSUtzREI5cnJlVy9iWjRuTit5bndGcEpORy90L3NjUFBOYjNkNTFGZmZn?=
 =?utf-8?B?djZXL1EwZUJlSkd5ajNzQ2hMM091WjZkN3Q5Vnh0MVk0Qk1iYmgzUDRmVkJN?=
 =?utf-8?B?dk8zaFFWcGxUV1luamJJQVlFY1Z4TmlLOThqL3k5eEFQZWpHRWpwb2ZIYXlZ?=
 =?utf-8?B?bGxFamtGQ0VBVWdaZ3E2NHBrT3FZY2tic3ZmbUVmN3g5MDljcC9Gb2Z5TVdB?=
 =?utf-8?B?LzN3VEVqSU9CbkNIalNOdFlGTXQwVlNrQWpqU1lEVitqQnJrZFFhN2hJZUZ5?=
 =?utf-8?B?YVJIekRuRXQxaWMvWW9VeG83NVFzemlkV0hYbmlZRithbVdKZ1dvQmFvNW50?=
 =?utf-8?B?VjNqcVVmOWVZZ0h2a3BFbnhQWldoMkphNGJKRi85MjRVSmk5ZW1VTk4xS1c1?=
 =?utf-8?B?TXhNWVBkQmV3c3Y1OWRRUFIxa1lIT211Vkp6bFdvck8yd1FON2FJcy90UjIr?=
 =?utf-8?B?QkM4KzJEMFA4T0JSUXYzZE1FMmx6M1FCNjVUR1UzODBLMGlKL2Mwb2FFYVNu?=
 =?utf-8?B?UWtwWHJLWWswWEk2K0VHT0hKd2Y4ZkE5cXg4UzBUY2dYZEdOVFRoLzQ4ZXoz?=
 =?utf-8?B?ZUpFcjNUbXRXL0tRZXlHSk1LRmFBZkRacytrRi9zaEhlTzZwc04raUtlYkNY?=
 =?utf-8?B?WHBLdDkxcVMxTjVCQThTb2JFOWxVZVJMSmRlQ2FxcTk3Wm9yN3V2UkhFNXQv?=
 =?utf-8?B?M1hPek10Vm9oZ0NqUkhyemVlYWY5aTZsQ09IQXY4OXo1ZG5RTVpXcEtydEI5?=
 =?utf-8?B?OWMxQm9NaUtTK2ZrQWFERzNyWTluaDdpMnVEMlFsN3dOQm13YjM5V3pKMnRT?=
 =?utf-8?B?M0Mxb0dhWU0wM09MQVVzNHNUYXFjVWw3RWdYUWUrT0ZGKzlFanduN2dmOEY0?=
 =?utf-8?B?VlV6VE9DeW1Ia2dwWEFsNEhyaWdVNWgwdDZkMWI2ZXl2cjQ1QWxKeFZkK2Fk?=
 =?utf-8?B?eldWUjRydGZJYmRwM2NLa2dQNlRvMFFjWTNlQXBSek82eWRUN2F6bThhakhV?=
 =?utf-8?B?VEpyOU9KZXNCYzF6MHF6aHJ6UVVaUWVFZ0NMdDF0M3B5UkJrSVlQZXdnbnFx?=
 =?utf-8?B?STU0Z1lodC9Udyt0MTA3WHZhQ0ZYOTVPMmJmeERyMHhpM3FRemIrcU1OUEpR?=
 =?utf-8?B?YyswWmRKa2d0c3pqd0NiQldBMlIrckxBUnphMDY4WTI5UDljdHlWRUJMOGlP?=
 =?utf-8?B?emRSZ1c4YzhqU21mQWcrWnVQRTBtUWgvVm03eldXN3BRVnJlR3ErbGZzaFM5?=
 =?utf-8?B?OVVZOEswQmdoNDYzTFZQYVFhR0g1cEdjdkdxT0hpRHZYZzI5TjUwY1UvdGVH?=
 =?utf-8?B?S1ppSHlxZlVSNU9UMVQ1ZURyZVEzUWFyRm0yS0V1cW14ZXFHZSthN2lJQ0gz?=
 =?utf-8?B?Ny9HUHBXSEhUZVg0bmdoRXVmS2twMXdUSythUFJmRkdqeFc5QmcrSm9PSU1B?=
 =?utf-8?B?ZG5rMUN0NDZjSGtwNWF5S0tUUGNpVDR0Z2t0eTFoRWZHUlFvblZFOTUwTHpK?=
 =?utf-8?B?WXcxc3JSeTRFWnRNclBzTWswNGZ3TlZnWWYwaHNKcFhYNVhvd0tmSXRZQnZ1?=
 =?utf-8?B?dTA0ZEJGdnRnR3ljWVNYbzlZS1h0aUNVNW41MGxOZ3YyS242Tnk3emJjUGlI?=
 =?utf-8?B?VWRkUUxUeTRFbnJJazU4Zm1MYytQVkZPQkhZZlMyQ1hVa2lZeDRkT3pwK0Zu?=
 =?utf-8?B?Z3o0VkFlU05JY2E5NTFiYytJU0I0ZzZzTzZwdFNmcUU0RERWRkNvWUV4VlZL?=
 =?utf-8?Q?GMdSIWAadE1Y3M/woGEL/2Bfj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ba1b851-5948-44bc-d489-08dad791ee9f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2022 13:58:20.1122
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3g1789X6I0t5FerEY+4McOsDDx626M4joYsREB7bRQGtbxzLh2du2w3KUpjgw9FYkRqKWZJWgFtQxzs//Jk5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8670

On 06.12.2022 14:53, Jan Beulich wrote:
> While plausible to do what was intended based on the name of the flag
> (PGC_page_table), that name was misleading and is going to be changed.
> It marks page tables pages _having_ a shadow, not shadows of page table
> pages. The attempt also didn't cover the HAP case at all, and it
> constituted a potentially very long loop doing nothing when
> !SHADOW_PAGING. Instead leave a comment of what actually wants doing
> there (which then also may need to account for e.g. the risk of A/D bits
> becoming set behind our backs).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

I'm sorry, I should have Cc-ed tboot reviewers here as well.

Jan

> --- a/xen/arch/x86/tboot.c
> +++ b/xen/arch/x86/tboot.c
> @@ -177,29 +177,6 @@ static void update_iommu_mac(vmac_ctx_t
>  #define is_page_in_use(page) \
>      (page_state_is(page, inuse) || page_state_is(page, offlining))
>  
> -static void update_pagetable_mac(vmac_ctx_t *ctx)
> -{
> -    unsigned long mfn;
> -
> -    for ( mfn = 0; mfn < max_page; mfn++ )
> -    {
> -        struct page_info *page = mfn_to_page(_mfn(mfn));
> -
> -        if ( !mfn_valid(_mfn(mfn)) )
> -            continue;
> -        if ( is_page_in_use(page) && !is_special_page(page) )
> -        {
> -            if ( page->count_info & PGC_page_table )
> -            {
> -                void *pg = map_domain_page(_mfn(mfn));
> -
> -                vmac_update(pg, PAGE_SIZE, ctx);
> -                unmap_domain_page(pg);
> -            }
> -        }
> -    }
> -}
> - 
>  static void tboot_gen_domain_integrity(const uint8_t key[TB_KEY_SIZE],
>                                         vmac_t *mac)
>  {
> @@ -233,8 +210,7 @@ static void tboot_gen_domain_integrity(c
>          }
>      }
>  
> -    /* MAC all shadow page tables */
> -    update_pagetable_mac(&ctx);
> +    /* TODO: MAC all shadow / HAP page tables */
>  
>      *mac = vmac(NULL, 0, nonce, NULL, &ctx);
>  
> 
> 


