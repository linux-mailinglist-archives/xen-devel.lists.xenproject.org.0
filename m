Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447A6C4AAE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 13:34:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513409.794351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexfO-0001PZ-Lk; Wed, 22 Mar 2023 12:34:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513409.794351; Wed, 22 Mar 2023 12:34:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pexfO-0001Nb-Fv; Wed, 22 Mar 2023 12:34:10 +0000
Received: by outflank-mailman (input) for mailman id 513409;
 Wed, 22 Mar 2023 12:34:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SGSf=7O=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pexfM-0001Mm-Tj
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 12:34:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on20630.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d6db94b8-c8ad-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 13:34:08 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 12:34:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 12:34:06 +0000
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
X-Inumbo-ID: d6db94b8-c8ad-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwFQIVwCzrhY/ZARy4I/YE8M3Npf5KAVUMnXz5Z9OgWMOI3JJOYa+q3yGpZZhspDlWbrF1KnWmeVa+rTen0umW2AqBu9JzyjHMM7JqGirBHIRwzKndFvkT89I2ZOIiaU9q8llXRW7YzSWsRPLqm3BEunZAbkIzJ6ZL+8mqSLHZJ/9i/+c09mGEWE9TM3J6psjXclf44/siNBnnbiCSEg6ilbz35LYrMbCwR9gl6wx0T7mk5E9r440rBMMUUTcxiLBhSPzkKRCO16GAHrrtSbIHtOaw8J0ZOKlPSFW8M9fRvCn7JjqT3LRYJoF4z+vYcFkfHmCQGfl/lABep6uxX6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7xb2+udRRmcim7KeNpZkI03CkyRqCmZeN5dvuzaIoPE=;
 b=HDfbkU1y85J/yZ+V9Q8CQa3mxdvcsRPenPnw6rlV+jzRwJlrE8+umzeBF4fOzBO7eghNoneJu2/btaqJHI7p0kWtCSHF+yUelGgaG7zGhKTKEzHqg8jDYKNY3UmHND/m0dZblZsrbOD2kzzjQLVegVpECisy/D7uBbtzF9fsBVygZo4vkmBSWarmDj+v/SfgShu790Kauu1wmXAsphPaA2jTrhYfjBOuxDUjpyQ1OVsjZ1Jj67pOQZsJvfL2D2Balbe3FvCfCwVrGTjrUrH/M96s6NI1p0LYDM7LuMmaRrkmpv/Dq1bbCKr/6ZmNmGA+IrnlYz/8T+kTxy6LetTUug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7xb2+udRRmcim7KeNpZkI03CkyRqCmZeN5dvuzaIoPE=;
 b=PeAIX6T6UyKZs+aNiwEONDoXOqYiWT5LCxbtiAJdUXbQKvrywxhjtlFp81WFiK6InZMNaQpznkoRL9kShjb8SrIAT4sT3y558wNTm8kW9gHnYYfzDZ/HMePZ64KpCrjuGuLBG4j4x8a0/aeMNNvUF/+eMLOfSu/d6w/rRwr6zpUIHr4caHck6cJILi7RNTkP7ZGEOm0w05F/ibIq+VnEONS8yM1YwkBxabnzVbbwLr5HhfFvbRwDsGOxw1UckgG/CJ1Pyw2zNFoi+6BxaVUH/6pHslCeWO/MXX6JlG2mC3r6uvy5/POj5P/owD22klSsgDtZNTmt6lhz+bSlk9nWMw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0f3d153-5698-3915-0ee8-4a6fd2e82ff6@suse.com>
Date: Wed, 22 Mar 2023 13:34:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v4 1/5] tools: add container_of() macro to
 xen-tools/common-macros.h
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
Cc: Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
References: <20230322120844.19657-1-jgross@suse.com>
 <20230322120844.19657-2-jgross@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230322120844.19657-2-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0212.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ac::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM9PR04MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: 6597fa5a-feca-4b15-fdc4-08db2ad1ba4c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DU1UP4Kfu7UpsHujFAfSXkBtbDVM1UUYw0GGsLP+4mVf4NMwhNdEfvIizxZP5XXdTs84pu95QPt0yg0rTEbr+fP6tHHcDsBLh0czFETwg07TrEvvtLNUg1LLmkuN/PYwUFhnYXeCpxhbDKROlXn4A2F+SiC6W/YifZDEkeib/g+e1n+inetOZH2suIEqWCAwAoaiwn4YcMZXebz3QQ7eT1AC7hl98pAAD5rRtCK2Gs33xERYp+RXeyXqKVHTRXj3IN7kYDlsUWMihOsbCwmzgWnAOYJFkUR6BV7MYnp8mceuSJVbm25MeHDtHsz3dLXvjnIhJx8GiXZkqiIt/40nGKpfOG3ZkXvSrdUq4d79Rjq6Cd2fvXe1bOIT/NT2A+Za4W74GKkGwB2g98g6M7i9EmP5n7bQ30OXcXvKAd12/wlsalaPlr1FKHedePQOwSbgIhlxSajauTWgxpS2MhUFfynaXc20GP6BIjAJGFF6OBOi6hba+GtBxjlzeH7P0EOP43m8ejBZbZT0UsXWPo/miO4N4uWquPaNUAtG3fiha3PBLHnsWxjPxC4zE0tWymaxbU+AysyB28N8/g12WXLD5iC/sUpp+bJ2Gzf4ozBr7GVgW1EuA71MQ36OFdXFoH1bpD+wjIUtvillW26vRf0eFcQkl+8kQ7u11ZZMEKAeIJKWiuL1osNwXeHU5G1JBMQh8zveqvVGsNlJ5K+AWt9VOyFLW9t3aqeJCHJRMxUh9jo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(86362001)(31696002)(36756003)(4326008)(6636002)(478600001)(8676002)(66556008)(54906003)(66476007)(316002)(53546011)(6512007)(6506007)(6486002)(26005)(66946007)(2616005)(31686004)(186003)(83380400001)(38100700002)(37006003)(5660300002)(6862004)(8936002)(41300700001)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHdnMHpHVFNJR2hKYkZrZHZFbEZCdGI1enBtNXR5Z1BvMWtkb0U4NUZiWE9M?=
 =?utf-8?B?aythQy9jdEREMFFyZXhFSlFOTE1mUEVWblV4MkUzcmVwcTI5MjhsYklSOG4y?=
 =?utf-8?B?NmZvRkFIL0llZzVuSHJkZGhYdFBTa1BvcWRHVStKWllzS05GTjNxS0FFa1Nk?=
 =?utf-8?B?M2hMbmVRRmEwT1hIYkdrblc1MzdRVUdNSFhhRFFhMmw4VzZtZEw5cGxFeVZu?=
 =?utf-8?B?c3FqUk1vZG9hUWVZRTMza3lvSVlTOXArMzZIMGh5WVZlT2VzOGgzTkg2M2FV?=
 =?utf-8?B?VkVRNU5ldGJJUHlBclZCcDc3L1RXTTJ4Y3YvNjU5OHNFNis4Wlo4WUFZMDBI?=
 =?utf-8?B?U0FndmJjbFNKYzRXRnY0ajF3MVhudWRuWGpUaXBYbGcvOGJ3VjFNMDlWZWsz?=
 =?utf-8?B?OGtTQnBOMmRJOHJtUlFiUHhDbVNXdlVaWmRZN29DdElTbzJBZ1VyUjQwRnZP?=
 =?utf-8?B?Q1gwU2Q2ZHhZNm15UzR2VVRqTElZRlozOEIySUJKUThrNjBvOXBReVJrdkQ2?=
 =?utf-8?B?YkhWUE1IN29QZno4K29Sb21rS0pENmZTTUdFWFFHZW5xMExwc3UwZHlqZG1E?=
 =?utf-8?B?WDkyRnJya1FhU1BqZms2bndJYWU3YzlkdkROMVF4UCtaRzlBaDRNdGduTzF0?=
 =?utf-8?B?N0ZiMzFacTRudG5DeEVyRUhaMjBZRklsZ3pXS1BNQ011OFZ1NkRhSnl5aUU1?=
 =?utf-8?B?dXdyckRvTDhsLys4VFlJdzhLUVdhaGltTVNNVWZKVEltQ0VWWGU3RFhOcFhU?=
 =?utf-8?B?Y29vM3gyRVdULzFYelpqcTRYOEhBd0x3bkxkMzFBMDZOVkRZaWdBZXQxeGEx?=
 =?utf-8?B?TVNRc0hKRzlmRE1RY3plK3doMWRsdnR0ZDV6T0dxTkQrUSs1OGhYdXhCdUwr?=
 =?utf-8?B?bGZCQ1k0QnJUeHJHczZBVlQ3bDliSzJjM01rQ0RvM3EvSVJwL0puL1cvWFJv?=
 =?utf-8?B?YVNUWFl2a2F2d0VtZnJYZWpWaGxOTy9FMUx3cXg1RDNqckZuU08rOGk4Um1R?=
 =?utf-8?B?V05XbW5WNmNxTk05Y0YzM2RXcmR1NXVjK1d4c1ZOaTAwOUlTZFk5TVNqM1NR?=
 =?utf-8?B?dDkzLzNNbHdmdzU4eUV4VkM4WTEwY2ZTV0VkNmVBczFsT1lqaERTV0ZoUExT?=
 =?utf-8?B?UElRK2xDRFBDVVUzekV4UE5KcTF4S2FJVHc4NWpwbEJiMEY3WTVJdEtjZXNZ?=
 =?utf-8?B?SkZwOVJDYi9sQ1ZJT0h0T0tWcTBOQzVzNE1PZHp4Sk5LcG1JVCtWc0hVUUto?=
 =?utf-8?B?UlZkSDlISE04ejFZaytmaVdoQ1RqNUUxck9qRnhqaHdwZXlZeXh2aXd6c3p4?=
 =?utf-8?B?VkdNdGw0UHBJZjk5NEpibmp6QUc4cEloWE5yQmpXNUh5MlJTRVVpUTBrQlRp?=
 =?utf-8?B?dWx0OXRJaWpBSEc0Z1hUajh4SHErYit2dzJHb3dXMVc0VnNJZTM4SzFwbitC?=
 =?utf-8?B?cndWNDBQVmNtbHl1ZVlQd2J2WnpCanM4OUJZaGppTFpDSjRuWk9paFM2MSsw?=
 =?utf-8?B?b1hpbWxjbFdwNVdnT1dabjlrK1NDQnVPeVFLcThuVDZjTkRWLzUrcGpXNnZo?=
 =?utf-8?B?LzMva3ZFRXhvUnNlaFlEeUxhQnoyR3o2ejJuOE1YOCs4SjIzT1FaZGdqVEwr?=
 =?utf-8?B?RytyQTQ4T3NhWExYZFBTT3FsWUdzTlBiR3BjelpnRmxqS1FWeC9pdGJZak84?=
 =?utf-8?B?Zkh4NHNZVlU1ZU1aVWVJd0tHQ04rUlhpOGdPNUh2RDcxZ1ZwZFkvekZMd21G?=
 =?utf-8?B?YityUFgwZHdndlI5Q1QxSE5qQTdxb2t2U2xjSCttM3R4bGxwZjRSUzdvTU5P?=
 =?utf-8?B?LzVjUW9TQjNDRGF5WE96UmFoLy9zYXBMeEowamI0ZEtocW4rMjRTVVlpaHlk?=
 =?utf-8?B?TVB1aDIxVjJzdmxVdEVrNENCNy9UcFd5YTVxUlZIT01WZlVyL1VBYXZkRVhU?=
 =?utf-8?B?ZGJuTURLL3RmcnBxRnRHb3BxREtxV240VHl0YXpXOWRGcFhVWE9yUnc2YUw3?=
 =?utf-8?B?anQ5dkRBTnBpTm1MS0xIV0pYNHpwZ2lKZ08xYktkamhwV1BDMVViVkxhOUxi?=
 =?utf-8?B?QWF6Ull5cVYwSjZVODlVL1BKVTRIK0tMMm5FbVRsc0FpMU1rT1RwYVNhdzRs?=
 =?utf-8?Q?5wgjj8MbPOEM2UVIep/cGDojJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6597fa5a-feca-4b15-fdc4-08db2ad1ba4c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 12:34:06.6446
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N4gsxkdHpjGKNz5Vn/1GayC1Kl8gx55P+g9Q4UyhCr66qmd9aoZDkhkzCS1tD0t18Rltwk2epj+OnYINIaYZ5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

On 22.03.2023 13:08, Juergen Gross wrote:
> --- a/tools/include/xen-tools/common-macros.h
> +++ b/tools/include/xen-tools/common-macros.h
> @@ -76,4 +76,8 @@
>  #define __must_check __attribute__((__warn_unused_result__))
>  #endif
>  
> +#define container_of(ptr, type, member) ({                \
> +    typeof( ((type *)0)->member ) *__mptr = (ptr);        \
> +    (type *)( (char *)__mptr - offsetof(type,member) );})

Can the variant used here please be closer to ...

> --- a/tools/tests/x86_emulator/x86-emulate.h
> +++ b/tools/tests/x86_emulator/x86-emulate.h
> @@ -56,11 +56,6 @@
>  
>  #define cf_check /* No Control Flow Integriy checking */
>  
> -#define container_of(ptr, type, member) ({             \
> -    typeof(((type *)0)->member) *mptr__ = (ptr);       \
> -    (type *)((char *)mptr__ - offsetof(type, member)); \
> -})

... this rather than ...

> --- a/tools/xenstore/list.h
> +++ b/tools/xenstore/list.h
> @@ -3,6 +3,8 @@
>  /* Taken from Linux kernel code, but de-kernelized for userspace. */
>  #include <stddef.h>
>  
> +#include <xen-tools/common-macros.h>
> +
>  #undef LIST_HEAD_INIT
>  #undef LIST_HEAD
>  #undef INIT_LIST_HEAD
> @@ -15,10 +17,6 @@
>  #define LIST_POISON1  ((void *) 0x00100100)
>  #define LIST_POISON2  ((void *) 0x00200200)
>  
> -#define container_of(ptr, type, member) ({			\
> -        typeof( ((type *)0)->member ) *__mptr = (ptr);	\
> -        (type *)( (char *)__mptr - offsetof(type,member) );})

... this, both formatting-wise (excess blanks) and local-variable-
naming-wise (trailing underscores instead of leading ones)? (If I was
the one to commit this, I'd be happy to make the adjustment at that
time.) Then
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

