Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AA677FA0D
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 17:00:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585476.916618 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWeU7-00079o-18; Thu, 17 Aug 2023 15:00:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585476.916618; Thu, 17 Aug 2023 15:00:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWeU6-00076c-UF; Thu, 17 Aug 2023 15:00:26 +0000
Received: by outflank-mailman (input) for mailman id 585476;
 Thu, 17 Aug 2023 15:00:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aH5n=EC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qWeU4-00076W-Rk
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 15:00:24 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ca4f8d3e-3d0e-11ee-877b-cb3800f73035;
 Thu, 17 Aug 2023 17:00:23 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DB9PR04MB9282.eurprd04.prod.outlook.com (2603:10a6:10:36e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6678.26; Thu, 17 Aug
 2023 15:00:20 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::79a:54ba:8003:fbe7%6]) with mapi id 15.20.6678.029; Thu, 17 Aug 2023
 15:00:20 +0000
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
X-Inumbo-ID: ca4f8d3e-3d0e-11ee-877b-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEiRsQ+2VFrxhiJgCkbKdIyuhPPadgQOvGufKWESHAwUo2+kNebY0UEo1YoKYiZFqlQEbtiuaBZtIW2yeozxHrEGhSNacH2DFgZakcZHLNqJPfHH/xpJIRcN1SLu/+FuUwzTRg5fEresE9tUMGdh8f6YAYqfGb8BN/ERwJEHWrukz4zn7bLMhWatyCdFlkHT06J2+TTe1nCiTHfJ9pbpuW9FO0uRgRBf2infZ2jzS59UUPDX55I4nvRvGDsecNgU0InCk36p5eLT8F7jwDvIuHKsaSXTN/sfhSKgAVQa6pBP4/AokpJ1ffAKlruvrSA44/Cvnltgqfm2dZhimoQh2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NBpAWnT7XB7UvHPT/vKQ+V1hSdOCd+Qq/PlpiekQ4Zg=;
 b=SywQNAZtIiQNvBZArKOkOp4SoXw0B5tnjD+ein++TwbzWBzbsVaaSXNPZHNjTWvQdGItVWEEFtBKKjJgq9ihtu9xWygUZwRKa7nkKsjcC1LCCcZiDr/uFYPHAMA1vIJkcvXMGAO0TPBN/ErShRINlyZWcggUS7RF3BTTaB+OsvYWNAKy8Szeh/vafy99ayYDmESl0gLqIvcjGq1uCByPpDenj2w/bJYQVNfBIwipPhGUD48ZseRQo/0Y04gGFCM7JW395/Dq+WyezMQnUyYJo/RSZ2Y3n1O6uM/tTCYUwvHCmrKuFLLorwwsI94JUQsLEoUgIux49oIsmTntzo8OyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NBpAWnT7XB7UvHPT/vKQ+V1hSdOCd+Qq/PlpiekQ4Zg=;
 b=oreWE7TZY5H3imPooy5tojiXv9KBcAfEdMXJ5ztSxTouwLqcKnPG234vf5nPFMsFqNmEypnSYBeIYpadpRWDAf8ETDMOkeenGeMDudxhn8WTgsRVzByDkYgy0fcvMZv+mjT5VkHgAJoX4cDJDi1tpcwUd1vL5wHPiZQ2hRah7LDobaGEmKszqQ5L3+9iwk+/Bc6NJed+e1r6bEHl+eMnrFqmB2xdB+rJfSH26xUAiBOpy58ha7QW5fzOs+Zj6nSx0KBdtf38PSodLFZD62ljehrhu4YgF8m4Hp5/eDyv6oCs7eAHtzP2D3Vc7mwcjd5wvqtzaPi7ixIubMhNN3rM/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2b9cd73c-8ad2-9c82-bdfa-4b9af41f967f@suse.com>
Date: Thu, 17 Aug 2023 17:00:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v1 02/57] xen/riscv: add public arch-riscv.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1692181079.git.oleksii.kurochko@gmail.com>
 <d9721f72f4a51b1240ba180e33193c551b987251.1692181079.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d9721f72f4a51b1240ba180e33193c551b987251.1692181079.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0185.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DB9PR04MB9282:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d7de3dc-975c-4f34-af62-08db9f32acf4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wdv4YAw0m+wzOGv1qVB+Ar/zufuOFqz8YmbydrlSMrYyTO8mXuF6H4npwU8IaRoxB5ti1h1BezRjl4huKLMol+1kkVtUlZvUIVHcs0Nqg+/otJVCgy2yAJ3BSlc9nw5FDcLtx8x6gZSjVt6sL6yZs9Nt3Ekn7Q3LFixM4XbNlSYpxRUqHIfGEJZMIe2+LqKzMLRyt1BPmzXwG2aVla924+0Xh+gb+7WGwHmXiOt5DNG9rid9Jvoo7GM0V0Z0wRiqc2BHrSuV/uWdT3C6Kz/OwPMtrCW6CaFCZ7sukoHeeqpEGr/hQFl/OmQtuRydwergrDmhQ4mLH3Y50HvhVtULnyjB7pxzG69uXuY1YD40bVCTHjYeOJSy9zecEPnKAao2WsAQT+7mBmfxD2sAvlMH+QMEuOPxVQ53CJ0BDcIcZ9ZK6i2x5lmqjVhFhXGpx5DUwtst28hsL9hxj4LRBqH60f67A8/FIv7CzaWYJrGejr0/91dcE4KefluomhsNr6MgXfZPNWtE0wKOA/gKUHHP+PApDN6CmdQnjD4LxgWSC0YFCOO9P/M4QJyzAFuA791sSX8uae85WRgpOUwI29x3iBNcJhcMQ7FBWVBmpvOXq7kfsu+iJjZkbWF3DZf9ZHJ7Bhvh5q0aSudXlIyt5Dn9mQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(346002)(39860400002)(396003)(186009)(451199024)(1800799009)(31696002)(2906002)(26005)(86362001)(478600001)(6506007)(36756003)(6666004)(2616005)(6486002)(6512007)(53546011)(5660300002)(41300700001)(316002)(54906003)(66946007)(66476007)(66556008)(6916009)(31686004)(4326008)(8676002)(8936002)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGp6NEg0U2hST2pUWjMyQzhFYjFuUUxleE1DR085WFFGT2t1NnA4TkFQcHBn?=
 =?utf-8?B?R0pBR3ZOSUhKbkJEUUVZYUJKZC8xbzFkRTNmTG5HNWVjOHlmNlgzNUxqWEY4?=
 =?utf-8?B?MzgrdllhcHV1Z0NXRzVxSktKSllvVnUvY0FZVG5nUVU2aUJFY1ZUU1VXWXN2?=
 =?utf-8?B?a1FJQmp0K1FvU2RPaEJjaGlKbnhuVW00S2RYbXYxRzhPc3NueXN3KzVmV0Va?=
 =?utf-8?B?N3lDYjZXODlXZC9EVXVobkpOUS9kb0sxTkptZytZa1lNNURLZmpWMDRmVW13?=
 =?utf-8?B?QmNHYTlxamVPbjduQ1c3SWY5WXBaUzhzNHg3N3o1NWRTQWZMRDdNSjRmMDVX?=
 =?utf-8?B?enBaVzJLVy9UMnN0NjlIQ0tpV28yb2hhdVp3UVZKT1RmK1N5cXIzMG5QUXFQ?=
 =?utf-8?B?eDFPaXJJbEVTWW44dDlDeWtsMW1XTVpEVUFKM2JsaHRFcUw4YS9lUHltOFAv?=
 =?utf-8?B?aTRYb0s5c2paOEdSTVBvZjdSSUpoZGVNbXloQ01kcExPMjB5WnR0WmljbmJF?=
 =?utf-8?B?NGtvMjBydnByS2lHeWZTZVdUKytBMGtaOTY1Tjc5Nk0wYlFEZ240aGhSb1g3?=
 =?utf-8?B?a2dkRHRKK2RBcjgyV1lYSHRYWkwvdlhqUk9VTU1ESWN4anhXNlNJczgyY2p3?=
 =?utf-8?B?MWlXRU9sazhtRXVEdUpVYk5MK1h6OU9zd3F3c2VWNE1pMU14aWZrMWZCbkMz?=
 =?utf-8?B?NDBJVlFvVkt1OVc2c1cwaFdBajhSNmZ6ZEwyTTBMYmJpQlVjQkNFdExEbWpn?=
 =?utf-8?B?a1Axck9RTnNFdmdHcU9hQ3hDVDB1ZlBxYmNxWW9ucDQzWGRtWTJibkVNOUo0?=
 =?utf-8?B?Mll3MTBPWmwrbEFmSWpXNTJqUno0dFFPbklHaUR5ZW9KN2Zjbm5vYXlTWGEw?=
 =?utf-8?B?VU5CRk0yMDZCZ3RuSHlmV3pMVU9Fb3V4RitrY2Vjd0hmaXZCTTA5b3QrYUhY?=
 =?utf-8?B?VW03d2xUV3V4eExvSXFoWTFncjY1S3FRQ1hIZVB3aTBOaVRWekFrcG5JWUow?=
 =?utf-8?B?V3NIVjRsM3phcFJzYjdQZWsxWkNjOTlYWGhXWDhNT0JBWVlzRWhKTk1zcjFr?=
 =?utf-8?B?c0M4RFRaTCtwenppdmplUTNDbkIwcm55NmxyekorWmZQbUgySVMwWSs2MlJl?=
 =?utf-8?B?L3poTGJUK2RYQ3RUVHJiWE55WjgvM1N0ZXdpVXY5VmtHTnJWT3UvdkhOMVhF?=
 =?utf-8?B?ckJIUmMwMXVsUndydjl4djBpbXFUaUJwdkJIOUV1NG90YnZXWEJBaDcvTHpr?=
 =?utf-8?B?RnMwSHVSK0xjQ2lFVjlUUzZMVnNyRmlYZXdKa1JaMzcwSDlaajlZekpLSFN4?=
 =?utf-8?B?dkRSdmF1Q0FhKzF5bjZDZGZHeHVKU1RYcThTdUpaMlZLYW15MkoyajBTSElv?=
 =?utf-8?B?N0xtdVlDWm9xaXZrRXNMNnBESW9IY1JSaWNNWXFhdzV5QVhSa3ZmQzZiTXVG?=
 =?utf-8?B?YlNtYWw3aTdpNzhjOFVHYklWazVrcDh0MEpjY3ZneDdGblZZT2Z6VjZtclYx?=
 =?utf-8?B?Y0F2UkNtcjFQV1dZWlY5U1R1Yms2d2lTblFMa0tiZ3ExTGVqQ3BNOWZWOU9h?=
 =?utf-8?B?RVgrcm5DWFB6ZFVKMVkvV1M2dTJxWEpPMk5rd3owd29DVmlkNmlpL0tjOWNI?=
 =?utf-8?B?Q3o1SUhOZHVLT1RhRW9hVWxiNFQ3UXFLeXp6M2hqM2lLa0VLQVdjRlQwb1hy?=
 =?utf-8?B?OVBCd21lR2JQaHV5YnMwNnQ1L0dwbDVBVHBidkJPVFZsL3NLWUluL3loZnEy?=
 =?utf-8?B?clpZMmhJWEI0WHlqRzErQStUSklBcnRFckNLN2M3ZkM3dzVPRmdMakV5eGds?=
 =?utf-8?B?a25LQm55a3hjVkZmemFRa01jNjAvdjlmd0VjMm8xOC9iTk5mUGRzWG5MNVZh?=
 =?utf-8?B?UG1WRXVoczQ0c3BCWmV5akM2eHg0VVRWaDV4TllxZXJCeFRpTWFRY09zUGVP?=
 =?utf-8?B?ZmhmSng4RDNKSS9NeVp2RU0zbWFodlB5Y2ZrYnFObEVIUnl1bkdnT0JmdzBC?=
 =?utf-8?B?TXdwUFNaNzlwYTYvbTByMjlCQ1ZweXNjc2o2TldXeGFJaDh1T1M4ZEpSOVY3?=
 =?utf-8?B?RGNZQXFwMDdtcENCMThlNHp2VXRlMVAydEJralJsRFI0WVgycG9PRTM5ZDZM?=
 =?utf-8?Q?rszLTYnUWqiLgyRobKeHjGGRf?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d7de3dc-975c-4f34-af62-08db9f32acf4
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2023 15:00:20.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16KMn6JAWVY1KsoffD3y5lgAPR9jf7KySYprKkFFTgoSkotNDtwmTDU24BmO9NqWlw7oqZnH0CL2S/svDF7CCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9282

On 16.08.2023 12:19, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/public/arch-riscv.h
> @@ -0,0 +1,90 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +/*
> + * Guest OS interface to RISC-V Xen.
> + * Initially based on the ARM implementation.
> + */
> +
> +#ifndef __XEN_PUBLIC_ARCH_RISCV_H__
> +#define __XEN_PUBLIC_ARCH_RISCV_H__
> +
> +#define  int64_aligned_t  int64_t __attribute__((__aligned__(8)))
> +#define uint64_aligned_t uint64_t __attribute__((__aligned__(8)))
> +
> +#ifndef __ASSEMBLY__
> +#define ___DEFINE_XEN_GUEST_HANDLE(name, type)                  \
> +    typedef union { type *p; unsigned long q; }                 \
> +        __guest_handle_ ## name;                                \
> +    typedef union { type *p; uint64_aligned_t q; }              \
> +        __guest_handle_64_ ## name
> +
> +/*
> + * XEN_GUEST_HANDLE represents a guest pointer, when passed as a field
> + * in a struct in memory. On RISCV is always 8 bytes sizes and 8 bytes
> + * aligned.
> + * XEN_GUEST_HANDLE_PARAM represents a guest pointer, when passed as an
> + * hypercall argument. It is 4 bytes on aarch32 and 8 bytes on aarch64.

Nit: aarch{32,64}?

> + */
> +#define __DEFINE_XEN_GUEST_HANDLE(name, type) \
> +    ___DEFINE_XEN_GUEST_HANDLE(name, type);   \
> +    ___DEFINE_XEN_GUEST_HANDLE(const_##name, const type)
> +#define DEFINE_XEN_GUEST_HANDLE(name)   __DEFINE_XEN_GUEST_HANDLE(name, name)
> +#define __XEN_GUEST_HANDLE(name)        __guest_handle_64_ ## name
> +#define XEN_GUEST_HANDLE(name)          __XEN_GUEST_HANDLE(name)
> +#define XEN_GUEST_HANDLE_PARAM(name)    __guest_handle_ ## name
> +#define set_xen_guest_handle_raw(hnd, val)                  \
> +    do {                                                    \
> +        typeof(&(hnd)) _sxghr_tmp = &(hnd);                 \
> +        _sxghr_tmp->q = 0;                                  \
> +        _sxghr_tmp->p = (val);                              \
> +    } while ( 0 )

While I realize you simply took this from Arm, in new code I think it
would be helpful to avoid name space violations from the beginning.
Hence no leading underscore please for macro local variables. Trailing
underscores is what we mean to use instead.

It's also not really valid to use a gcc extension here, but I guess
that's hard to avoid.

> +#define set_xen_guest_handle(hnd, val) set_xen_guest_handle_raw(hnd, val)
> +
> +typedef uint64_t xen_pfn_t;
> +#define PRI_xen_pfn PRIx64
> +#define PRIu_xen_pfn PRIu64
> +
> +typedef uint64_t xen_ulong_t;
> +#define PRI_xen_ulong PRIx64
> +
> +#if defined(__XEN__) || defined(__XEN_TOOLS__)
> +
> +struct vcpu_guest_context {
> +};
> +typedef struct vcpu_guest_context vcpu_guest_context_t;
> +DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
> +
> +struct xen_arch_domainconfig {
> +};

While these are okay to remain empty, ...

> +#endif
> +
> +struct arch_vcpu_info {
> +};
> +typedef struct arch_vcpu_info arch_vcpu_info_t;
> +
> +struct arch_shared_info {
> +};
> +typedef struct arch_shared_info arch_shared_info_t;

... these two need to gain a "todo" marker so that we won't forget
to at least add a placeholder entry if no real ones surface.

> +/* Maximum number of virtual CPUs in legacy multi-processor guests. */
> +/* Only one. All other VCPUS must use VCPUOP_register_vcpu_info */

Nit: Style (missing full stop). And quite likely the two comments could
be joined to a single one.

> +#define XEN_LEGACY_MAX_VCPUS 1
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#ifndef __ASSEMBLY__

Why not continue the earlier !__ASSEMBLY__ section?

Jan

