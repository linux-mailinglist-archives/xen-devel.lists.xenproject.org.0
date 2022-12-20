Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6D652375
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 16:09:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467113.726123 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eEg-00040l-Ko; Tue, 20 Dec 2022 15:08:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467113.726123; Tue, 20 Dec 2022 15:08:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7eEg-0003yj-HE; Tue, 20 Dec 2022 15:08:54 +0000
Received: by outflank-mailman (input) for mailman id 467113;
 Tue, 20 Dec 2022 15:08:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7eEe-0003yd-NQ
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 15:08:52 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2073.outbound.protection.outlook.com [40.107.7.73])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3532e930-8078-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 16:08:49 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB6949.eurprd04.prod.outlook.com (2603:10a6:20b:102::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 15:08:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 15:08:48 +0000
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
X-Inumbo-ID: 3532e930-8078-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlK2NwNiiWNumktXhQdutJPhbpUbhUABIkOJp8z3x39oeJEvcxnQ78u6/tP36OUVxHYxG/azO9g3+XEp+whG0PHYrXTnFQLSu1dMF61ArBGyxTOSgGbSKMJ5Jjr6ZY/4pz9ZdTKikhQUuAQQ5QckZSvhlQj0a9izTTdCUQdN+HMDaMLNuyQO4edtH8c/jFhxf0BMne0nshfJaXVm25CNK9lGEFzWKjOwsJCTnfYiO6azhjbUMLT0bE2iflSVEho4uOaPantyFQ1dYUvAi8/n+CwUBjgkt7cgLRB8t3yhu98CC9RF8SnvV3cmDB+4OQAqk7mdIUBdTpCadNobVp8GEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f0zqbx8KuSk5ZlN32x2thqPAFk5deW1dN7LHdDCeExY=;
 b=EFWowL2dmr43JgBhV0obLESMVv/jlzrOi85lb1O9B2GhpTYHjvIT6/pUGB4Wqny1pWL62f54SYC/ruXg1WqgWReOlCSbO8jt6IMPLxtMdHNyMVJq6Qtc2r/00pIq+cxltj+fpyb4eadD8aSArM1UFHtdLelV5ZhCBMTz0WwvAtp0D9A4GFwv0K5zjUhkQ+ub5e9GFv8vlp2fSQ1Iw5Riryep+sXP8PXsSL0c5bZ1qSo8zG/pDBtJoo1jwPyzI28Sx3p27zFE+YaOee+RQJA328k+yIndw4tjM4+28duTrdO25WNkcBRv1z/lk6Q6lfd1z5boaAuTAxD+zLnfYESKYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f0zqbx8KuSk5ZlN32x2thqPAFk5deW1dN7LHdDCeExY=;
 b=4mouptQbxA49RakURepH5QqN3a1BNeQEUw4cQjsLCM6DOOFjobc+FlSCpLEHc6RrUInYLnp7WMD/oFv1BfdtYmM/H777716V+VBPQVTMdK4WqhD/7veV3S2FAkaMZOTZD5IiQnZDQyNPVSKyfon6FE+6kRnBPGDc80BefHWktwToCAU623rUUZrQyZ6PoXgQbG5Eb2RYOq0bqSS93SpLyPEvRitWENXkmmOZkWSASI6vA1E94+BUug2AGMzwxC7xfCWncWCT1j9ZVbUhUHr4TrFKuHMLqXYtZ/18xh7KpwJmFJF1+tffbIZed2UFG+O219/ZWJU15T6n7XwS2G7k6Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <92d82899-4e74-8638-4a60-09104ba16c9a@suse.com>
Date: Tue, 20 Dec 2022 16:08:46 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 02/22] x86/setup: move vm_init() before acpi calls
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Wei Liu <wei.liu2@citrix.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 David Woodhouse <dwmw2@amazon.com>, Hongyan Xia <hongyxia@amazon.com>,
 Julien Grall <jgrall@amazon.com>, xen-devel@lists.xenproject.org
References: <20221216114853.8227-1-julien@xen.org>
 <20221216114853.8227-3-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20221216114853.8227-3-julien@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0180.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::13) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB6949:EE_
X-MS-Office365-Filtering-Correlation-Id: 387118cc-78a9-4624-4e8a-08dae29c1887
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	raPnXnz0hf2omHaswcKk+dh4GU1YSc9+5/NM3V1ULUCAPsMkSpzlEkBV1z80QtPG3RMzlFpWNwP7EogUePB3OcOupqDMasZKmMCQclLWRlDlJBlal4OYFBP3r0PmxfQgRp7LYxp9WVXDovlMoEfocBmfFi1871+IKyuksu02Frqf28dazawf5QT+wZ9ehmUGeZXWfLGw442xveAWR/XEiXJdvvlS9f7CxyDNMspNncfO+IUeue82nxw5dC7Em4a7lTkZYXbsptnNYjxWL73ZreKoSR9nR1QxrVzcRzm4NBnxEcsG+/FHqofkTR+MfnOuy7G9NtLKT6ByMkYyh4QmgpM4uZu5fnWOViDfnLEXw7ZmeXTAIqXqvXKNSNP5azRZ9ayQdZSvNalL+aVJDKohqNDG/Uxzd/Lb1ryLdmR4PoMMradp7RZdyVci3cmTey5H+s/lzm0SmD2jwwUHc3rqT6B6j1LiJdy0nPeg/2PhNuTkSTs2trb7SLj6oda8RFm7UqZ6yLR3KaeoJohVwCLvfc2wnrz0I/LWzATlPaKUi9/f8s19FC8IqYq60l2FxmJwET+mpjc3VUzGtO/sosBRDmSIyt12ck6NWBL7waXpZsIhZ5/bMVO5oEM+JRyDtBQhQ9JB+WpIjgrdPU+C6r7YyHAhxILWM2hxv6elGxENxvC2tc2pLG6SLgnWfK54/yW1cBI59qnXICNU+JI0ZHSmvjBXWEAgjhnEvx5mPcwGQMk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199015)(316002)(4326008)(31686004)(8676002)(5660300002)(86362001)(6512007)(6916009)(26005)(66556008)(7416002)(2616005)(66946007)(66476007)(31696002)(478600001)(186003)(6506007)(6486002)(53546011)(38100700002)(8936002)(36756003)(41300700001)(2906002)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGZMVTh0ekVXWFFjMHJ1RmNhdzFNWjhFNzNJc0wvd3pmSXZOYlJxTDcvS05P?=
 =?utf-8?B?ZEFXSm5CV0ZPMHZNSm9uakEwSW5KUXNvM0xrK21JUDJqSURzU3l4aFhBM29X?=
 =?utf-8?B?eXFIbzdPYlNHbVg3c2UzN3VxQ0dSbjFZck9KSC9rS0NVNXdlV2M0a2M3Y0E5?=
 =?utf-8?B?SlQwSkV0QVdPYWtXZTZ5M2laVTcrb3VnVUNxR1VXbGpvVzJWdk1hMWNtTmFC?=
 =?utf-8?B?R00vNzlhZnlYODczbmlHZW91RmpNM0lORVc4eG9tcGRGbmpxWGpMUWgzSU1l?=
 =?utf-8?B?RS9JYktYZjJQbnVpV21LaTVsaHM1YlF4OFBBNk1VMjkvNUlic2pTaHZHak8y?=
 =?utf-8?B?bXJvMXUxNlVyWjJVeEExSVRTMlBJSkNiQUtBb1pQV0ljMjlNNVMrVk1TdjBY?=
 =?utf-8?B?NjdJUG94VFAwUDlqUHlNNG83SzZISlZmdzQrMFJtbjc5RVlobFJnM3RGeGpN?=
 =?utf-8?B?SmZaUGtjRkxmQzdtUzRLQWNNQmVVRWJaWVlwOHMzekdBcjZkUlo3RU5UTDll?=
 =?utf-8?B?ZnlJMm9CSk5EQkxZdVlzbjcrcEdMK0RXYkpBNXVBdTUycWRZY00zOXVJbUVD?=
 =?utf-8?B?ZEl0ajlnbDJzdDNTZXhhWTVjR1h6U0dsZDVwQVRJRGxHL1N2ZVZXYldMN2pL?=
 =?utf-8?B?eDdYQ21CQnVNWFRBZERNVTlaRXV0K2h5NFdZNWpDZDNBTUNCdS82ZmhISEpx?=
 =?utf-8?B?Q0RSdktaZy9tR2NHQ2JQUHFzMEl3ZFJVR3QrR3YrMzN4Q0s5ZTdjWHFoQUhp?=
 =?utf-8?B?T3hnU1RxQWFSeC8xOUZvbWUyaVljdmd1NmlYSjFpbitNbXFJdGptRElOS2ky?=
 =?utf-8?B?OUJCc3pxUHAyUE9GOStYbkRyazBUdFJCMnFwdXloWGxxWW1aOU5vc1BuSFc1?=
 =?utf-8?B?UW5PRnZwNUJsUEVvTmpZNFlVRlFtWVc5MVZiRWRQZWFUa0ZmV2tnVG5iWHZZ?=
 =?utf-8?B?Nm94Z05nSGNhQitMTEhyL3NwWFYzZDRPeDRXYytoeWZvRGwxVS9YcjZuT1Fs?=
 =?utf-8?B?YnZIb2dzbVk3MjFzUEovZnZCNFhkc2NwRS9oYjkweldHWWJLTEVSTDBNN0Rr?=
 =?utf-8?B?ZjlHajk4cWk0L0xLZm1xNURodzRBdnRRYklzbTZsM2o1d1ZFSzdvL1UzT2oy?=
 =?utf-8?B?a2dnckJJdjJ3cHFvUWZLVmpuQkxEdWFkN2FFbFZJSzR3eStoUUdBT090TXo2?=
 =?utf-8?B?OTNLTXBKTXoyeVJ6S2NUWFYzSmcrcnNyYStlTkwyaFR3SHV1Wkc1Sm9laUY0?=
 =?utf-8?B?VDcrQXplMDQvbVdCS0lMUDZ2c0ZFMDV6VnlGUUNYSVV0WFgwdzJScTFqWmQy?=
 =?utf-8?B?MXgrQzIyYzU1SXRIV1FJOGhuNVowdnBnWm5na3VzbDExeC9nS3JPTnRndzNj?=
 =?utf-8?B?WVVkZzZDeW1nSktaNk9nanFlaDFXdDlTZGMyVU42aGlnYWx2em9tNWkxYmY5?=
 =?utf-8?B?N3ZQQytlemU3MDUrUXUzR2wwQlhhdTc4d3JUT0hQS1d0Y255MVhUT0lIUE0z?=
 =?utf-8?B?VEY0TzlCbEdjdGxPRk9EcjUzVytiNmRiZ1ZEVWhoUkhFZDR3bEluSk1uMGo5?=
 =?utf-8?B?UDFWVGE0MGVBMzZhay9jSDZRaW5UWWxaZ2RpK0hTWDNJbi9KQzhkc3JqTjFv?=
 =?utf-8?B?Ny9VNitpN0xOMlV2a1BVZ3VDTFkrNUpyUC95amN0a3RZNTVtRGlYVHRISGdw?=
 =?utf-8?B?cTVMVTVia1ZvN3NjUG9GWUxPZytmRUFiOXdGZTFTWDFtZ0o2a0tLNFdkQ2NY?=
 =?utf-8?B?Y2xxQkR2R2ZmTUtqQVFxQmFEZ2dSVllDZW92SXRzVnBsTlRtcFp1VFBqQ2I4?=
 =?utf-8?B?OHVwYVBnUzhCTGhyTWJqdU1aOVpaNW52enlYYXMwL0VzRG9HUjd2WkFYWEt2?=
 =?utf-8?B?eENaZjdFRTkzcVNjNXdQNjRSUE9uWWpyamk1a1NYb2YweGFiV1E2UzNvSWJt?=
 =?utf-8?B?SHgwNEt6bnN0RVZMMGNYUXNPd1lkM1c4blMwdWpnUW1zeE9SKy9rTmhvcUNV?=
 =?utf-8?B?TVdqVnFMd0UyWHZ0Zk9aOXhIVkVsTkVtakRpVXVncStVUEt5bmJPQ1ZGTWpN?=
 =?utf-8?B?S0EvWm1OVHBHNWxLQzJISzMzby8yNmdxOWZ6UmtvUk52UFp0Q0lyb04xMW55?=
 =?utf-8?Q?SRp+PyhGtGfG27Xv0EWxMcLcP?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 387118cc-78a9-4624-4e8a-08dae29c1887
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 15:08:48.2048
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8m8bkeESvfTATn+hkwYDFW1c2UEr55ElD1i8cHu8PZLmh9t9Y28dURk+rO+J2NI0HYp4j5A38y9nSMa1mCuMgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6949

On 16.12.2022 12:48, Julien Grall wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> After the direct map removal, pages from the boot allocator are not
> mapped at all in the direct map. Although we have map_domain_page, they

Nit: "will not be mapped" or "are not going to be mapped", or else this
sounds like there's a bug somewhere.

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -870,6 +870,7 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>      unsigned long eb_start, eb_end;
>      bool acpi_boot_table_init_done = false, relocated = false;
>      int ret;
> +    bool vm_init_done = false;

Can this please be grouped with the other bool-s (even visible in context)?
> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -34,9 +34,20 @@ void __init vm_init_type(enum vmap_region type, void *start, void *end)
>  
>      for ( i = 0, va = (unsigned long)vm_bitmap(type); i < nr; ++i, va += PAGE_SIZE )
>      {
> -        struct page_info *pg = alloc_domheap_page(NULL, 0);
> +        mfn_t mfn;
> +        int rc;
>  
> -        map_pages_to_xen(va, page_to_mfn(pg), 1, PAGE_HYPERVISOR);
> +        if ( system_state == SYS_STATE_early_boot )
> +            mfn = alloc_boot_pages(1, 1);
> +        else
> +        {
> +            struct page_info *pg = alloc_domheap_page(NULL, 0);
> +
> +            BUG_ON(!pg);
> +            mfn = page_to_mfn(pg);
> +        }
> +        rc = map_pages_to_xen(va, mfn, 1, PAGE_HYPERVISOR);
> +        BUG_ON(rc);

The adding of a return value check is unrelated and not overly useful:

>          clear_page((void *)va);

This will fault anyway if the mapping attempt failed.

Jan

