Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2707C653D85
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 10:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468326.727398 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Hyt-0007Z5-G2; Thu, 22 Dec 2022 09:35:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468326.727398; Thu, 22 Dec 2022 09:35:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8Hyt-0007XA-D6; Thu, 22 Dec 2022 09:35:15 +0000
Received: by outflank-mailman (input) for mailman id 468326;
 Thu, 22 Dec 2022 09:35:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TLdZ=4U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p8Hyr-0007X0-QH
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 09:35:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eeaf17f9-81db-11ed-8fd4-01056ac49cbb;
 Thu, 22 Dec 2022 10:35:12 +0100 (CET)
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB7815.eurprd04.prod.outlook.com (2603:10a6:20b:28a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.6; Thu, 22 Dec
 2022 09:35:10 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::8084:fa5b:fe3a:fa24%4]) with mapi id 15.20.5924.016; Thu, 22 Dec 2022
 09:35:10 +0000
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
X-Inumbo-ID: eeaf17f9-81db-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TAH7Zl051i+weEJzPIS7tXC/cod9WM91RcjVeqfHQlTPkdXVA954CFgN9acLseCo7EWpO+YCp1D5nq7fqxEvbykdIgntfXpuDslgGzFsFZ+EbIVHxTQKXese15JTTjdzNRntMsuQc5CVTitxJRKTBe7TqgXGOmwxpcPVSaBHCzTRX3zXu0nGTG5X29EZIM3yEZG8KUjiaUyqSP6ZwJtYPdtEe6y5o2X4MwFzMdW7ywnV4zD6gEyopgwjRiX2LJxlPfJMFTVm2ne8JLSdBUSn0Frj2Hh0tRaJDKP1VeCgVN8BjLirTm99ZDeSrjHlAhpBkFwsYa5FJk9hyKMi3afBwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmu9w9IAkIiFH7rlxqiKkWTppf6yqvQZiccCxmvvVFU=;
 b=iH+Xq3BcaJR+MP5QDtM2zXqWQqtWU7d32teAua7PhrbGuFVv0wWpze6nK3bIK34/C/zWEoCBTlxHS0LoV9QZxQWV0gGsjWgC1e6mnMb/lk7u29O3qOwHsgvBDFuOou95jxrPBA3sxAMd2EaSussFvy4d5jEybQToZStHRr4P1o+cnz+FKgwT0LMWsqdJ0A9Jz1ZByRje6A5okdu5awUrKBgrABIX7Llo/grikDQgwttlMX8k90K4tAEk0XWL6OoyyOlULkXT0T8HDkGwonV3a3U2RwevSDxepr0DNoi4JqSOawGC5w519ie3G9l6wnhm5H5wnohp0+PxvlB9mFK1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmu9w9IAkIiFH7rlxqiKkWTppf6yqvQZiccCxmvvVFU=;
 b=As2MJQ4vj6vaGjaKpaaxQmBPXSVSjxvWC0iN3Ml+s5Qu8ausj30z4gBGuwG1bA3/V6LlPfQdqDYwdSAn2xXFZn7L5cYLX0oITAnnGbtceGFPlNVwbfg4VnNFUSY8XwHwfXqCl9PDH2IuNla9lkZXxcVCd6sgX3IDjT2DXURJ+h0C8f5XmVOFn5yM3f+rPrQtVVnG/p7I/S8inOnidSOWK8P1KdRBWTjahWW5hvyD3l/Cvs5wazBiQaeN7d7RDBDj1mTYG1OLzyZRRFRCGRZ2zu0t29VoORsFvvjBRuLvgL82/4R9KTuQ8Szhl5DRyUBaaiA6X7fzcRWiMFUjWyTw3g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <06dff83a-b120-a2b4-c61f-7864935d4c3e@suse.com>
Date: Thu, 22 Dec 2022 10:35:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 08/10] x86/mm: make code robust to future PAT changes
Content-Language: en-US
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <a8920eef3254cbf470a0d35a887dbaf0e4907a6d.1671497984.git.demi@invisiblethingslab.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a8920eef3254cbf470a0d35a887dbaf0e4907a6d.1671497984.git.demi@invisiblethingslab.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0086.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::13) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB6551:EE_|AS8PR04MB7815:EE_
X-MS-Office365-Filtering-Correlation-Id: 58d0771b-13ce-4387-48cd-08dae3ffd1fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	utgmbBjJJjnr3dE50RSG2JK9iMkpBWGWgerapqfdXK2JgvGlUWpn0j/yB9uO5pyrRRNe0b7QaftKLYGXh1vf9+HfJ0LFtAy3m0/Xtut3B09+GqiKjTDa87LKzhaIDRwGcBzsEddo0UfXahHkMHTFXK/DXExBYCAXuR+6JRnXBsC6BP+nYKGlj4AD6G1Os7VjdcEuV3BxlDFPxjoD55anC9QaoGI76IQONYppdn5k/f5UXf5x4vpagjaG+/8B8j87NxrJm7GRApUMfS5xR+YDE40o8p61VH6jNnSRIfUPCFFFegG/hwQjTWnsp6jJJYAUR+hH/xFw5L4asmFZSlgn5uJTtScvIVuZiwNWWLuX0R8VDQfqC7gVA1+MvLFJ2ZqwJqnQlWx18Uj6KPRCUe5Z046/6fSt21crecqDfVuG3W7ifsXld+egBwF0HtQB2dQocq2qqbg5V+xGhqlB27xLHz62D7XPDWc6tjwg5v0UeMtUacjZPO0SPrUgGthVdUQcOTCHX8aHdNqebqAlNxWwzN4zcYzKiiPs5CscWzYvhX8DoFqYK/xiuKiADTJUwodchEZhDSXXgIXeNJAfLM+TVuNYZC5lKAx2VcydxC6U35MAPjyQ5ORp9TaYgyMzeWMGA9mqmOLixAGZTJNoQa/zEiaDKrd87hWSG1MRtb4EzeFGrs4OV3knRKBkCZ5oZJcCbIEDrwLuOTS3y2VU0XqZ8HP12ktlCzz99psXrMxLRUc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(376002)(396003)(366004)(346002)(39860400002)(451199015)(31696002)(83380400001)(86362001)(38100700002)(2906002)(7416002)(41300700001)(5660300002)(8936002)(4326008)(6486002)(6506007)(478600001)(53546011)(2616005)(6512007)(26005)(66946007)(186003)(66476007)(54906003)(8676002)(6916009)(316002)(66556008)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2JPdXJlTzBmNFhoQ0gzM3ltV3lVaEtNSEUxU0ZhbFZ4T0lYekFtdTJwTCt1?=
 =?utf-8?B?cFRGaVJjOTBjck4vSklBOEdXSC9hVXNIL0J4Sk1pbUorOS9mRm1Hck50YVJQ?=
 =?utf-8?B?amlSZlpodlBQVysxdW9XRjFzMzQzZ2VMUDVkRWFZRDQ5Z0VZeE1xOWxJREpU?=
 =?utf-8?B?OE1XSjhNT0pJdUhjWTUxcUhVanZGUWpKaDdtTU01TE5jc2h5bFVUSk5Jazg2?=
 =?utf-8?B?YVBybG5zVVRlbmhxdDI4clc2c0tJbXUxckcxc01RaEY2eGhlazF3WEVaUk91?=
 =?utf-8?B?cElEamcxSStMY2VPTEVFUFh3bFdkRlo0SFlwb3BuRm9jL2JCbmF6WnM2OXhH?=
 =?utf-8?B?TGR3dy9wd3duQXNsVE5xVmdWc0h3V1ZDOUJLbHNCeDJzcFNtQjExMW9lakZh?=
 =?utf-8?B?ZHlsY3ZpMTRoMzNIQzNFWlprYS9PREVOdVRzMEpueC9LY2E1M2Q0KzNGVDNi?=
 =?utf-8?B?MkFMbEd2Tm43cmwzTGdnQkswajdkam8vaUlqTHkzNXFjUmpBMEFud3RKTXJM?=
 =?utf-8?B?UlZ0V0hTWGxvU0xaRnkxeFIwSzEvZDBqVmtHZE5udWdIOGcyZ05ERE10cUw3?=
 =?utf-8?B?dHQ3NlJWT2dsbU1qVGV1Z29xb1V5VTJYUHo0UXdLemZmSGdtQ3MrdFM2MU53?=
 =?utf-8?B?NkdlRU50TlUxN2UzNmhiT3lGOGFUOXpxczV0WkRYWFZwR1lHMmh5WVU5Y0la?=
 =?utf-8?B?d1ZOSXMzTnJGOTR6NDlMSHkrODRoY1g1Nk5UMGN3YkFLdFFlL1g3NWFpL2dr?=
 =?utf-8?B?Sjh2V1NxK3BoakF6VGlSOHkvVEoyeXpXbk1ZN2FIWTVlTmwvVUJqZjFHc2J3?=
 =?utf-8?B?aVZpbm01Ny9tTmpucWZ1TENYKzVybHdzU2xWM09vQWZkVUVXTHVqZ2lBOVo1?=
 =?utf-8?B?eVRLWEs5TzlSMWxGSHI0T3ovcFRyS3l5aFZPVDhOeDNPRHpJMkJTRXZEUUNN?=
 =?utf-8?B?SlZ1R1ozckZ3SkhYeEZGa05lcVNZNVZQOFlLLzFJb3RwREplYndndW9RNCtv?=
 =?utf-8?B?aUxkMXF6dUtSSUNBbnZoMStobW9LOENwTFU4RTRYVzNaSEdkM2VWNkloYWxU?=
 =?utf-8?B?NXBVWDI4OW1rRDhJc3hVZ1paWE84UjczSjA1MXZlaW00SnNKTHFWQlp1bjhQ?=
 =?utf-8?B?aE95TjYrK3BhYmkrZFgyMTEyWUFqQWVnUlYzUll2TWpMQi92aHNDRnhWVWhO?=
 =?utf-8?B?M3VjSVJaaWQ2N0pleDVuVGZKRWJjKytQeDFQcElkZTFrM2x6dFFuWmt0QlZ3?=
 =?utf-8?B?VlFZb2lTRFpkNlMvZ0lFZVBkc1FiUHVLVFdXV3JYR05mSWFUaUI1UlpTbWJV?=
 =?utf-8?B?emVjN2ZqMHRPeEJyc1EzWldpYWpMNm5ER21keG1qcVlGMUVLVEVuTE9VUXk1?=
 =?utf-8?B?ZmVtbnZxU09RRFNHeFViVHNrSnRUa1ZsUkhOakMzYUhubkYxVDlBTUhEc1lp?=
 =?utf-8?B?VVFOdys4aDg4YjNoZVhOci85QS85ZHl5blY2d2hqdzhMZ3lHclZwc2J5U1dv?=
 =?utf-8?B?Rmk4cms2eFFaVXBIVGd2Qlo1eHVYNFBhaUNJOTk4MElnYjF5c2lSVHVacVV5?=
 =?utf-8?B?SjBNVHowMWlHdU0zV2U0TXpzUFRNdStTc2s2dkRDalpXUzEzOFhvU1dpVVlp?=
 =?utf-8?B?a3UxNTVXNVRKT0JaOWJvVDNxRUFBekxXL3dLQjN1VmdFTElUWVlrZzZaRkR4?=
 =?utf-8?B?RFYrZFJOeFhrY2JuanJONjhmNGZ6V0toK1NxQXVyZSsxYXJlaUVoMzZCSzdk?=
 =?utf-8?B?LzRzYXlEU2RZQ3hlS1dCZXZ0MHpKcUFjclYzQXVDakdpRXpabzhJUGo5cXRE?=
 =?utf-8?B?Z0FvbGxYbEVaU3VjVXhSalZrYjhiTEhrQUdhMkVxUFJodFpMTlBSTGZGTENB?=
 =?utf-8?B?eTllWGdLYXdIODZBbENoa1NWbVVyVmovbWx6QW1NZTU0RWhVekRkWVpMVExm?=
 =?utf-8?B?SUpObkNxdzYzeVdXM2hQTTFPL3ZQalo3Y2FwZDZadFNIbk0weCtlaitmeHJp?=
 =?utf-8?B?ZE9NbTZEaG5Ob2VvMU9WckxscWRNSWVBU0tvUE5NOGxpbmNjUmJYUzUrSGNS?=
 =?utf-8?B?TWx1L0RGMGIyYmdicktGUWxnaVFhT2N0SG5tQlVRMTNOTmI2aW9ISGVTMWJE?=
 =?utf-8?Q?P+T42s+uFgo5z5f08mZxkuGIw?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58d0771b-13ce-4387-48cd-08dae3ffd1fe
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 09:35:10.6552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxc+CCOROnIj/dpnlcSYiP30vA+l/850dmExTkdJo+2yo+E4dVcQpusuf7Rg9v9a9sbuStZV5oUvoehIBoAp9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7815

On 20.12.2022 02:07, Demi Marie Obenour wrote:
> It may be desirable to change Xen's PAT for various reasons.  This
> requires changes to several _PAGE_* macros as well.  Add static
> assertions to check that XEN_MSR_PAT is consistent with the _PAGE_*
> macros, and that _PAGE_WB is 0 as required by Linux.

In line with the code comment, perhaps add (not just)"?

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -6352,6 +6352,11 @@ unsigned long get_upper_mfn_bound(void)
>      return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
>  }
>  
> +
> +/*
> + * A bunch of static assertions to check that the XEN_MSR_PAT is valid
> + * and consistent with the _PAGE_* macros, and that _PAGE_WB is zero.
> + */
>  static void __init __maybe_unused build_assertions(void)
>  {
>      /*
> @@ -6361,6 +6366,72 @@ static void __init __maybe_unused build_assertions(void)
>       * using different PATs will not work.
>       */
>      BUILD_BUG_ON(XEN_MSR_PAT != 0x050100070406ULL);
> +
> +    /*
> +     * _PAGE_WB must be zero for several reasons, not least because Linux
> +     * assumes it.
> +     */
> +    BUILD_BUG_ON(_PAGE_WB);

Strictly speaking this is a requirement only for PV guests. We may not
want to go as far as putting "#ifdef CONFIG_PV" around it, but at least
the code comment (and then also the part of the description referring
to this) will imo want to say so.

> +    /* A macro to convert from cache attributes to actual cacheability */
> +#define PAT_ENTRY(v) (0xFF & (XEN_MSR_PAT >> (8 * (v))))

I don't think the comment is appropriate here. All you do is extract a
slot from the hard-coded PAT value we use.

> +    /* Validate at compile-time that v is a valid value for a PAT entry */
> +#define CHECK_PAT_ENTRY_VALUE(v)                                               \
> +    BUILD_BUG_ON((v) < 0 || (v) > 7 ||                                         \

PAT_ENTRY() won't produce negative values, so I don't think "(v) < 0" is
really needed here. And the "(v) > 7" will imo want replacing by
"(v) >= X86_NUM_MT".

> +                 (v) == X86_MT_RSVD_2 || (v) == X86_MT_RSVD_3)
> +
> +    /* Validate at compile-time that PAT entry v is valid */
> +#define CHECK_PAT_ENTRY(v) do {                                                \
> +    BUILD_BUG_ON((v) < 0 || (v) > 7);                                          \

I think this would better be part of PAT_ENTRY(), as the validity of the
shift there depends on it. If this check is needed in the first place,
seeing that the macro is #undef-ed right after use below, and hence the
checks only cover the eight invocations of the macro right here.

> +    CHECK_PAT_ENTRY_VALUE(PAT_ENTRY(v));                                       \
> +} while (0);

Nit (style): Missing blanks around 0 and perhaps better nowadays to use
"false" in such constructs. (Because of other comments this may go away
here anyway, but there's another similar instance below).

> +    /*
> +     * If one of these trips, the corresponding entry in XEN_MSR_PAT is invalid.
> +     * This would cause Xen to crash (with #GP) at startup.
> +     */
> +    CHECK_PAT_ENTRY(0);
> +    CHECK_PAT_ENTRY(1);
> +    CHECK_PAT_ENTRY(2);
> +    CHECK_PAT_ENTRY(3);
> +    CHECK_PAT_ENTRY(4);
> +    CHECK_PAT_ENTRY(5);
> +    CHECK_PAT_ENTRY(6);
> +    CHECK_PAT_ENTRY(7);
> +
> +#undef CHECK_PAT_ENTRY
> +#undef CHECK_PAT_ENTRY_VALUE
> +
> +    /* Macro version of page_flags_to_cacheattr(), for use in BUILD_BUG_ON()s */

DYM pte_flags_to_cacheattr()? At which point the macro name wants to
match and its parameter may also better be named "pte_value"?

> +#define PAGE_FLAGS_TO_CACHEATTR(page_value)                                    \
> +    ((((page_value) >> 5) & 4) | (((page_value) >> 3) & 3))

Hmm, yet more uses of magic literal numbers.

> +    /* Check that a PAT-related _PAGE_* macro is correct */
> +#define CHECK_PAGE_VALUE(page_value) do {                                      \
> +    /* Check that the _PAGE_* macros only use bits from PAGE_CACHE_ATTRS */    \
> +    BUILD_BUG_ON(((_PAGE_##page_value) & PAGE_CACHE_ATTRS) !=                  \
> +                  (_PAGE_##page_value));                                       \

Nit (style): One too many blanks used for indentation.

> +    /* Check that the _PAGE_* are consistent with XEN_MSR_PAT */               \
> +    BUILD_BUG_ON(PAT_ENTRY(PAGE_FLAGS_TO_CACHEATTR(_PAGE_##page_value)) !=     \
> +                 (X86_MT_##page_value));                                       \

Nit (style): Nowadays we tend to consider ## a binary operator just like
e.g. +, and hence it wants to be surrounded by blanks.

> +} while (0)
> +
> +    /*
> +     * If one of these trips, the corresponding _PAGE_* macro is inconsistent
> +     * with XEN_MSR_PAT.  This would cause Xen to use incorrect cacheability
> +     * flags, with results that are undefined and probably harmful.

Why "undefined"? They may be wrong / broken, but the result is still well-
defined afaict.

Jan

