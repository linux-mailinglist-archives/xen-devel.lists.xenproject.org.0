Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1671E6521C5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 14:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467042.726035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7d2E-0000Vd-3K; Tue, 20 Dec 2022 13:51:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467042.726035; Tue, 20 Dec 2022 13:51:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7d2E-0000TB-0J; Tue, 20 Dec 2022 13:51:58 +0000
Received: by outflank-mailman (input) for mailman id 467042;
 Tue, 20 Dec 2022 13:51:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7d2C-0000T4-9z
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 13:51:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2088.outbound.protection.outlook.com [40.107.104.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 44da24f4-806d-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 14:50:31 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8812.eurprd04.prod.outlook.com (2603:10a6:20b:40b::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 13:51:52 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 13:51:52 +0000
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
X-Inumbo-ID: 44da24f4-806d-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y2+ISJgU1Usz0ovZMpTjkeIcKDhI6zDX0PAG4PZZ8ZJI1EYMA9Zwole/a+izKrdEYQP7OwlE2BQYwR9ljwUkuBlzdH2pv2yx+FsfAl9aR26GCW3t8iCqe5LwE6WWvmMboG4ZlRp0/QQdrouLH9hfeMd7+PEuIgWSWLwlWvoPgYCGTMu6u/UlMwKiuqI3+SjBgKoGNbpuqGo8qq/H6VVjigh94wi1YY6dUBJeXLClU4F98cduiBmO/gRY8jJonHU7eEDDIf33fNbLjy1dbR2LvJMjhzADcihlBXaaLBve+l9nTmVN3BnSuAEM8+DRNe1GJzHOZxOOfccbvspoDVMWoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S0JJ7mdeFF87HmaZxR78Gl7ztlZg3kfl726JkMjy8P0=;
 b=QNix0ER7wBJvs79mOzNODJdBrgVNUhi3lvZhHSlQ3FtT5XBlawWUT9lOE4IXiGXAC5c8i2q6pbfiUGjCfSXbmwZS6i+IVQPcJetnhPZxuiyMQ5IIoW5t9/N+UDAH8pnEh4dpgRAhoAxjCYUBrHgHHBESrPsW2zmIr0znbF78WTdiZ+08d2lhkJhjay4cjZCVBHN1UZyNFa0Y3IHE9kY3DpHTO6+5YJj07fDCKA6Y+u5d8qk9ExeK/OwbuRNFfiHiyTh2tjaROTeHfaVVZPBFKQM8UL0ufekAfGSyuD4S9GJVd2cUKDzQY9485MZDLvwrPI1p+GhJHvOBuyw+CHH+OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S0JJ7mdeFF87HmaZxR78Gl7ztlZg3kfl726JkMjy8P0=;
 b=vQQvXD/Ux+jpDb/eoJSJqQIVgeKBGgJKGP7iGIg4HXPboat3q1OrpnIVfO2PPAjv7TIPQxAgjzshvV/FA2u5T+sbfV62rQcYJx26xxV7MEUh7UjG/mH+VtA06IIA4x8B4ppkwbVKBUIBjb8vAGLn9fOaE7qLdrBl/u0fYNL/1NRA5ECNv7FeJE8Kq65YvcW66t8s83JxHtuD9wJQ4HZig8U0giVrRV7BUJRhBkv4DHr8GQgkpaKHUaAi7VMOoutWtuB6zvKteaAT5PO+mozBN80LHATDROhN651cWjRUampjFzTLOAHWDAipdqoD+S915x08Q1wRFctwLph2zrY3xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <520cdde9-07e1-fce8-56d9-205fc31c62e3@suse.com>
Date: Tue, 20 Dec 2022 14:51:50 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2-ish] x86/boot: Factor move_xen() out of __start_xen()
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20221216201749.32164-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216201749.32164-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0136.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9e::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8812:EE_
X-MS-Office365-Filtering-Correlation-Id: 2fbf3e24-27b4-4cf8-c15b-08dae2915976
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k52U0SE5M9oUFAC6uKJzREds3EYZisdoXHbeVgc9m0eT4lZVRkQAHVv/E78tL+5rHXvd44UdfKKLVStvWmgvOqWdOda4aD5hHvc30EUy19w+LuoHr0pJLXzuU9mQJNLqGaCqSGEsYhkTnODTNeurR2J0RHz/LsvGwsZG+X4E4lLT5g3bQtPJBq3JmStLgl1zzX/DlTeIHCasI7/tcxe2wuwmFm7yhiAWrs2us67N4BtPVc7F+LDwiMkOkO6Vkq2UjfKMyVrykSWLRfbGe5U6z6sUW0MSsDfdIZCKPGdZUcrK6+47hfP+nHvCYHBiblk20EGU6gXsIxR82MDS5JJRsNMh/p814+CLZRiYT7P1BRqUfqp0dTmmoJbMXc9rCfP9iY3uMkpm/WyEsPJDfciHBFc9TI237yaqpHainKtooGRdsi9HzvdtKtujfs5HJkR1eZ9xcx1tMZdeErfznZ84UdHGwzEFgBtdsKgMYoGGpw02ZEeuH+bRVWd+tNZ8+sf9gMjvEpv6b1/THipegCR8J1NtHKA9h03cXTRA5klI3l3DBFk+gYgqdfesP9CxDdDDzbeXhqep/VTYuO31uJPdgUesAsKMcowZed/J0xWHGsQbxd7qa+UremCcYITnqzWPmNOKqYLP9OhIv9+fNcLJ/o9qyHEDVxf5yVp5/PHX1dRpUGPQfpG/GagA/SsC309KKv1pzbesYk8ckbHpRHCfpdQInE/Sbpav8jQleCJwWLc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(396003)(346002)(376002)(39860400002)(366004)(451199015)(6506007)(6486002)(478600001)(36756003)(6512007)(53546011)(186003)(2906002)(26005)(8676002)(41300700001)(4326008)(66556008)(66476007)(31696002)(66946007)(83380400001)(5660300002)(8936002)(316002)(6916009)(54906003)(38100700002)(86362001)(31686004)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RjdnKzhhSVVVZ3RnaEU0OG5ZaFQ4MUJ6Mld6T3hKeGlxSk81ZjMrbkFSZW4r?=
 =?utf-8?B?ay9Ham1GMFFMMXhkK3dQeTNPNHJHajAwTzhlUnNRZ0J2ZFJ2U2tBUEN4dDI3?=
 =?utf-8?B?bVM4WStKVTBmRnF6Y3FaQkZJTEhCTGpFM3orQ3BEY3RhdFBMNGNFZnZHSWUy?=
 =?utf-8?B?OVJGRG5pSlIvSDZvWTNvdnVYbloxWWhLbmFMTVJqWVRLZ0RPTkZwdnVmbU9K?=
 =?utf-8?B?MmtnNDNpQ2xqZDgySDh3eHRDSVhXWnliUzRGRHF0R1ZBcGYxb0VnWjhDeGJp?=
 =?utf-8?B?dDc0S2wzcVJXRHpYVmh3R3V2bHA2OW9UbTFjRktid01WcWhQNVNrWWIvYW8z?=
 =?utf-8?B?N1JPUE9oTlEyZjVqTlJicUFXdGxHbkFISzNsazN1UkpNTHRWNFVYSVRlaWQ2?=
 =?utf-8?B?Z3VRU1A5RDlEVmVqRkRqblJvMnNmSS80TDloTGtLa0c2cWZZMTZoTEo1VUdr?=
 =?utf-8?B?L3luNm1GRjlDS2NSSEI1VXJJaTFVMWVMNnBrTktmdHJaUlpIakw5NjlsR0pP?=
 =?utf-8?B?RW9UZ0hCaHZVL1F5a3dnTG5tTlNydXBpQWsyOS9JWSs1R01WUDVtTDZmcjlq?=
 =?utf-8?B?MFVMaFlicDdNNHZFOU8rakFsdnY0eEg4UFBwc0pBdFc0KzVaZVFZT05UOVRn?=
 =?utf-8?B?NVRMTUJTdEIyRjc2N04xQ0dVL1UyOGYva3lJa2lxaEtPOEdvWmh4Q3NpZkww?=
 =?utf-8?B?Y29VOVNOa2oxRnZwZ01zeFkvZXRnWjNLdGhGeExHelRMNlpuL1JkTm4vcWt2?=
 =?utf-8?B?eDRlTld2eWNpYjRFVHhrbWJjL2wvUEgraGxnK0hUZVkxUkQwVFppanlPay9n?=
 =?utf-8?B?OVpnMHJjd29objZBUGZjcGlUUGhac3dUVTE0amZQcytHVlE0L3VKajZncXUw?=
 =?utf-8?B?ZWJneGJPR29ZZVBFVTZnMy9WWlhQKzVIUVUybzdFb2Q1RmtQY05MUmNmREd4?=
 =?utf-8?B?c3FjN0VMZ3I4ckRvTk90MTlwS0tlc3dFOXMrVVBpTVhMVlA4ZEJkamUxY1lT?=
 =?utf-8?B?ckdyMnVGK09qWHVxd0pWZk13cjVyY0RMQUpVUlIyL29GRmZpVmN0MVJvaXZV?=
 =?utf-8?B?Nm9ySEVsUWJJTDlhLzQ1K1hqZkFBTTBsdkJLMjJ3SmhHdzVtbkJKVkVES09t?=
 =?utf-8?B?VE9iUkZJVS84bDd2L24yYlAyZ3pJYXhuYzg3V0lsa21nNnhiNTI5TC9GSVFB?=
 =?utf-8?B?dE1rUXRDMGs5Q005djVBZkhRT3dhTC8yaTVMWWxLcjd0ekl2NUlkalRRWmFj?=
 =?utf-8?B?MHVxU0drTjluQWlmQlVzZGJLVVNLY0ZHaVZTWXlzajIvSXFIVFlQRDBzeGJj?=
 =?utf-8?B?VWczelRiaE5IRXhjZERIcWJhWnUrNWZzY1FDYU9wZUZxdnpERFR4Y1FnMUgy?=
 =?utf-8?B?cE04eUszSFY5cGwxdkNHNmR6WHFRR0gycU0vampidk05R1ZlM0xTSmZXa3dx?=
 =?utf-8?B?OGhMMXNNNUpFYU43VXBHOElhTmM0cGpqaWltUktFb2c3bnRqR3NPVWpzQ2JM?=
 =?utf-8?B?SExNTVdISE9va3htSlZBRXZSTlBjTW5OM3dPUjhqMitPazlrUUR5WlVudk5J?=
 =?utf-8?B?aEVLNm84eHovUWNoYkR5Tm9ManFxL0U1S3pwNjlJU0RTTHBZZXhGTWV6d2J0?=
 =?utf-8?B?OEIrWFl3ZGY2M1k5TG1ZYmdPYVB6Ty96Z2JWS3crd1VjUjdOUXBLVnFVZ1ZU?=
 =?utf-8?B?UjUwTitncjNwOG9Bc3dvSy9HU3M5RkYrWlFucTNsYTkzQWlONTQrcmNXSzh4?=
 =?utf-8?B?ZTZVa3ZzQlhIelVQSU9pdHFWeUlYdTNHQ0hOaGRZQWY4RmlXejQ0a3djSjI5?=
 =?utf-8?B?V0Fnb1lBM0JPZTkzaXd4eUJBRDF1cGZCWjBtUDVQNjdUUy9ZMVJHL0Q1ZklT?=
 =?utf-8?B?bnQ3bnI5SW5tRjM4UzdGcHIvOXYwa0o4czR6OUY5UWpmQW1OM21vUG5SRVU4?=
 =?utf-8?B?bi9IMXJOL3lrM2tNMVpVYnhhY1RMK3ZhcFlXeDZuWmdmWlBjOFVtWE1vMjA4?=
 =?utf-8?B?VFBlNFcwZDQ5L3g5YkxRNm1qNEhXTGFiYSthZWN2UW42Skg0Z0dSK2RWSVJq?=
 =?utf-8?B?bitMblJ4MnMzRFlhWkJ5SGF5ZmoyTit0c1ZwYWV2QTZVdHlUUmxrTXU1VUJC?=
 =?utf-8?Q?jLv6IKDI+9uABah56s0TT9i3s?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fbf3e24-27b4-4cf8-c15b-08dae2915976
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 13:51:52.6842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QWcNVuNN7Q9H9hRq05DQ0cJjQvvDvSoRYstvyG8yqaABTEkWqDrIfNAs7s4EWsLsh4HimAz0qHoNCjxPOq5qew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8812

On 16.12.2022 21:17, Andrew Cooper wrote:
> Partly for clarity because there is a lot of subtle magic at work here.
> Expand the commentary of what's going on.
> 
> Also, because there is no need to double copy the stack (32kB) to retrieve
> local values spilled to the stack under the old alias, when all of the
> aforementioned local variables are going out of scope anyway.
> 
> There is also a logic change when walking l2_xenmap[].  The old logic would
> skip recursing into 4k mappings; this would corrupt Xen if it were used.
> There are no 4k mappings in l2_xenmap[] this early on boot, so assert the
> property instead of leaving a latent breakage.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> We probably want to drop PGE from XEN_MINIMAL_CR4.  It will simplify several
> boot paths which don't need to care about global pages, and PGE is conditional
> anyway now with the PCID support.

Perhaps, especially if - as you say - this allows for simplification.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -467,6 +467,113 @@ static void __init move_memory(
>      }
>  }
>  
> +static void __init noinline move_xen(void)
> +{
> +    l4_pgentry_t *pl4e;
> +    l3_pgentry_t *pl3e;
> +    l2_pgentry_t *pl2e;
> +    unsigned long tmp;
> +    int i, j, k;

Can these become "unsigned int" please at this occasion? (Perhaps as
another reason to make the change, mention that the old instances of i and
j did shadow outer scope variables in the same function?)

> +    /*
> +     * The caller has selected xen_phys_start, ensuring that the old and new
> +     * locations do not overlap.  Make it so.

As a non-native speaker I'm struggling with what "Make it so" is supposed
to tell me here.

> +     * Prevent the compiler from reordering anything across this point.  Such
> +     * things will end badly.
> +     */
> +    barrier();
> +
> +    /*
> +     * Copy out of the current alias, into the directmap at the new location.
> +     * This includes a snapshot of the current stack.
> +     */
> +    memcpy(__va(__pa(_start)), _start, _end - _start);
> +
> +    /*
> +     * We are now in a critical region.  Any write (modifying a global,
> +     * spilling a local to the stack, etc) via the current alias will get lost
> +     * when we switch to the new pagetables.  This even means no printk()'s
> +     * debugging purposes.

Nit: Missing "for"?

> +     * Walk the soon-to-be-used pagetables in the new location, relocating all
> +     * intermediate (non-leaf) entries to point to their new-location
> +     * equivalents.  All writes are via the directmap alias.
> +     */
> +    pl4e = __va(__pa(idle_pg_table));
> +    for ( i = 0 ; i < L4_PAGETABLE_ENTRIES; i++, pl4e++ )
> +    {
> +        if ( !(l4e_get_flags(*pl4e) & _PAGE_PRESENT) )
> +            continue;
> +
> +        *pl4e = l4e_from_intpte(l4e_get_intpte(*pl4e) + xen_phys_start);
> +        pl3e = __va(l4e_get_paddr(*pl4e));
> +        for ( j = 0; j < L3_PAGETABLE_ENTRIES; j++, pl3e++ )
> +        {
> +            if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) ||
> +                 (l3e_get_flags(*pl3e) & _PAGE_PSE) )
> +                continue;
> +
> +            *pl3e = l3e_from_intpte(l3e_get_intpte(*pl3e) + xen_phys_start);
> +            pl2e = __va(l3e_get_paddr(*pl3e));
> +            for ( k = 0; k < L2_PAGETABLE_ENTRIES; k++, pl2e++ )
> +            {
> +                if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) ||
> +                     (l2e_get_flags(*pl2e) & _PAGE_PSE) )
> +                    continue;
> +
> +                *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
> +            }
> +        }
> +    }
> +
> +    /*
> +     * Walk the soon-to-be-used l2_xenmap[], relocating all the leaf mappings
> +     * so text/data/bss etc refer to the new location in memory.
> +     */
> +    pl2e = __va(__pa(l2_xenmap));
> +    for ( i = 0; i < L2_PAGETABLE_ENTRIES; i++, pl2e++ )
> +    {
> +        if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
> +            continue;
> +
> +        /*
> +         * We don't have 4k mappings in l2_xenmap[] at this point in boot, nor
> +         * is this anticipated to change.  Simply assert the fact, rather than
> +         * introducing dead logic to decend into l1 tables.

Nit: "descend"?

> +         */
> +        ASSERT(l2e_get_flags(*pl2e) & _PAGE_PSE);

The warning about the use of printk() around here could make one think
that using ASSERT() (or BUG()) is similarly bad. However, aiui using
printk() isn't by itself a problem, just that the log message would be
lost as far as the circular buffer goes. The message would be observable
on the serial con sole though, at least with "sync_console". It is on
this basis that using ASSERT() here makes sense. Perhaps the printk()
related comment could be slightly adjusted to express this?

> +        *pl2e = l2e_from_intpte(l2e_get_intpte(*pl2e) + xen_phys_start);
> +    }
> +
> +    /*
> +     * Switch to relocated pagetables, shooting down global mappings as we go.
> +     */
> +    asm volatile (
> +        "mov    %%cr4, %[cr4]\n\t"
> +        "andb   $~%c[pge], %b[cr4]\n\t"
> +        "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 0 */
> +        "mov    %[cr3], %%cr3\n\t"     /* CR3 = new pagetables */
> +        "orb    $%c[pge], %b[cr4]\n\t"

I understand you need %c to apply the ~ in the operand of ANDB above.
But could I talk you into keeping things as simple as possible here
by using plain %[pge]?

> +        "mov    %[cr4], %%cr4\n\t"     /* CR4.PGE = 1 */
> +        : [cr4] "=&a" (tmp) /* Could be "r", but "a" makes better asm */
> +        : [cr3] "r" (__pa(idle_pg_table)),
> +          [pge] "i" (X86_CR4_PGE)
> +        : "memory" );

The removed stack copying worries me, to be honest. Yes, for local
variables of ours it doesn't matter because they are about to go out
of scope. But what if the compiler instantiates any for its own use,
e.g. ...

> +    /*
> +     * End of the critical region.  Updates to locals and globals now work as
> +     * expected.
> +     *
> +     * Updates to local variables which have been spilled to the stack since
> +     * the memcpy() have been lost.  But we don't care, because they're all
> +     * going out of scope imminently.
> +     */
> +
> +    printk("New Xen image base address: %#lx\n", xen_phys_start);

... the result of the address calculation for the string literal
here? Such auxiliary calculations can happen at any point in the
function, and won't necessarily (hence the example chosen) become
impossible for the compiler to do with the memory clobber in the
asm(). And while the string literal's address is likely cheap
enough to calculate right in the function invocation sequence (and
an option would also be to retain the printk() in the caller),
other instrumentation options could be undermined by this as well.

Jan

