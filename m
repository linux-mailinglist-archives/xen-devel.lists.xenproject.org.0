Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B6A7CF654
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 13:12:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619205.963903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQwr-0007P8-6i; Thu, 19 Oct 2023 11:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619205.963903; Thu, 19 Oct 2023 11:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQwr-0007NQ-3m; Thu, 19 Oct 2023 11:12:17 +0000
Received: by outflank-mailman (input) for mailman id 619205;
 Thu, 19 Oct 2023 11:12:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQwp-0007NK-KD
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 11:12:15 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5ac208dd-6e70-11ee-9b0e-b553b5be7939;
 Thu, 19 Oct 2023 13:12:13 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM7PR04MB7031.eurprd04.prod.outlook.com (2603:10a6:20b:116::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.9; Thu, 19 Oct
 2023 11:12:11 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 11:12:11 +0000
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
X-Inumbo-ID: 5ac208dd-6e70-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMmOJ/o/ASbT1zwfBXedWV4H4J3BQgshXLVOFo7IVnI6+mMX4N3mzEta6cvN2wlp17e+nZNW7demIMb88D+5lUr3cIwp69PBdb8baiIghjuwjlPVgTM+sQEF4dsDF1gCsjZ2xEK0LiEDN96hXDdGMT/3kvvZ2zX7huhAIARn9MGLo62VSl5KNTI6b3pkISM2zzyrzhrhopIIf1jYuIc/7Ii9p5mSqZMb8Dz4VHTcmiRfaFHYecobtsgJlxMRKQm1AIxbIV91PhCEYNwiYONpV76WDBkkypRJ7qdDxvLxk8/LKKkxiusLXynt816ozm3Sjl+Kz2SS/J+rUPT1xA6VHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLZsUKhIXPghoHJHATbYjETKwEOuoxAVnYN6srOTNUM=;
 b=c+mESyi3KieUvZnDh0jDf8EfYXMiZYEe8qC+cVkKfLqVRQucRO8HJbZHl0u/an9F80Q+trWhvp0BqKxFGYzvFSpz4TJLGBrp+yQaGOVf08DMz6POMwYm23wc9LwK3goYsyA3/NWg47uY2ZvKC+m8oyZZFttrt5gYmWNOXoAPHJM0PR7U1RC66HZP6CLCqO51uqOsDz4ZnLVawWbna7qwtTZv95/hWpKfloW8mAq2iwB5J7zqEyUt1j0vHF+zOlx6p3EM2Z141SZ2/EBaOJJAXlYh5LtUUh2QlufgEuSMhG8njfMFiPBJ2bIiNonm/KL8TLBxV+h2ACDwMLV+Pn+Qlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLZsUKhIXPghoHJHATbYjETKwEOuoxAVnYN6srOTNUM=;
 b=Q6Y16JikcyimVdBY6iddsWTpC88uA9uf9cJsl8jXWPRnmikYoARdB16KHsnOyzvCMkTwdJIBEfSULqIOIXN9FdLKGdq7uRk4/I8XXpEo0L07hgBQHgbUArRVw7MXTzyEiZD2fOjm4rVsazUVnpzBocr5m5APyEiSiJMb3ZHzUYzKXQ4FqMT1bR+qkwPXDG8OO8kAZN+HaqkezWRHlNKaCusJjkLGIDQLsKllRfUhL3KYfYTEJ4SbGmCRWz3i+GQwypv7gu27UgWBo05D6TxlXHOFI7ieCWgB2+16/VhUhc+sSD8mEQpQ7ZthIrdEEkUWtN44vVPLsch5zuPUrthNxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <337bcd1c-dfc5-cbe6-8e05-7fc640dde165@suse.com>
Date: Thu, 19 Oct 2023 13:12:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v1 20/29] xen/asm-generic: introduce stub header div64.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1694702259.git.oleksii.kurochko@gmail.com>
 <0c006d03b917924c411e563dcdc8043498be48b3.1694702259.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0c006d03b917924c411e563dcdc8043498be48b3.1694702259.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM7PR04MB7031:EE_
X-MS-Office365-Filtering-Correlation-Id: bf6530bd-6f4e-4437-ef8d-08dbd0943d93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	eynFr02p/cyksaAoO5kf5fp/ddAn8IB0/wjTjHM8ZSexOa/rfoogLqpP5nX+8bf4JrXPzW+xT4ZtHDhMXjKtGQF5Nlhu9JnhalTRQDrVTYrfgMuPjqcBTh3SYaOQjrl4EmWm0YyxqXrQ+jzVhBq+E2deGtKYFoayOoQOpxrR04NFkYtdpeixKFR7xqu9HH+zVbV19LjR0UQ+tPw/v3gxC87zet4UhAo3zeSMLa1KiobQHxbV1d3honraOqOFrE8BGP7c4Zea7Mc86v16X+k+TitFPreC+gkkbqlW1NfyRUE/ULKrpaUsdNQGljvD/jJxRpR8HsIeKqNQ412AkbLUh4RxxNJhZ6MCY56oZPKpB1Lg6PuAsSxa0OibmjbNym2Vd+Bp+QL1/HZxt8so25zyC64aEcEbD1JEzQZgT+2eggJlESmkJds8bjfsgq08rPKuzpYXF1FxZRQrGBQj488Xr//bI0c/AJYDLEhvofXNSpzzuhm59kJnM+0cQlvWg2DFdxrs0b6VhSTlVwng5BUlspTkuSyf0HdZBNAwyfvO/nyeGV/Uuy7bYl15jD5DA9E8BPnZnN+MVxqmTt9BxjGdg3+PxqDv9PvbkPzugR7Tv7JLHsntlEyAp9k+eSZ+vqimEoHbqiqqPJw6hNtCnpFpbZfV3uxgfu4eZWaAwKRL/vo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(346002)(376002)(366004)(136003)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(5660300002)(4326008)(8676002)(8936002)(53546011)(6666004)(6512007)(6506007)(36756003)(2906002)(26005)(2616005)(38100700002)(31696002)(86362001)(6916009)(478600001)(54906003)(316002)(66476007)(66556008)(66946007)(41300700001)(6486002)(31686004)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N0pwbEZkcTQ0N1ZzNVkyNzVVTTJ3cE5EVmJMMWNsT0lzU3VGZVFhL2QwZWpp?=
 =?utf-8?B?eU1qdDRiSGtMUDdIZitDVi9MZGN3NkpKZ2JoSWpWekltU1k4cUZ5MldreWlY?=
 =?utf-8?B?K2V3dEV6L043SXpaSmhjdWZYK0YzbVNPY3NzeDkyZDdOUHZrNnlUSndwckVp?=
 =?utf-8?B?cWZZK1RUUlBJZENzVy80anIzRTczNlRBd3RDOElMZUNBUkV2MTVSWlB2WStR?=
 =?utf-8?B?YVZjMHJLWjRMRlZGajllMlUxUGtLdDlQMUdxdGtlWWJXSXgvRTE3TEZkMWs5?=
 =?utf-8?B?Qks4dTg2akJROWIyYlhFVFVnc2x2emVpbmlNY3lFbUJPT3dPQVJaZHk0ZUtE?=
 =?utf-8?B?TWNvOTFBNFRhdXVSQTd0VGIzdkxkZndzYlRaTjNvdHJmbXFBaFA4dEthd040?=
 =?utf-8?B?SGhSUUt3V21DTjhaeW9wdUxWelMrTldDd21vUWowY09GM2djczRDOTdMZmEv?=
 =?utf-8?B?RkZoWkpUeU5tcEw5U0VCNDIwcFcvNWxHL0k2OTVYT3dZQ1VFK3FhR2I5Vk9V?=
 =?utf-8?B?V0JJNy9rcGpsa2pvTWh4N2EwdkI3VFM3Sis0UUpYZ2FmK1FuQ0VWWFFBa3dw?=
 =?utf-8?B?ZHV5WG1TdEFFZ3JWanJzWko5WTlIb1c3RFVPOW5veUVJbUZhZXFmL0UrNVNL?=
 =?utf-8?B?L3d0Tm9RcjNGOHlHNFBNMmRhY05VcFdNL3g0YkpJYXZIL3ZBbG8waDY1UlFT?=
 =?utf-8?B?bFl1cUtGZkFiV0NpK0xydjdpSFdWajdxOWNGdzRuZUZhSnp6djd3cUhycHNq?=
 =?utf-8?B?MHJQN2xaNkY3bGN4THNvZnNuY2FEaFF4Z2U2aHc2Ky9FcnZaSWVYWGo3YmVV?=
 =?utf-8?B?Y05Wc2FrOHQ0N3RseHlKZTNwUzlWdU5hTmEwM0puM1dKejJiRkRQZllIeGNZ?=
 =?utf-8?B?bWRPQ0M2SFVyU0x3NGdYQUJRNTdCOXIySlc1VVBhZitYTWx1b1ltUDl4UGVF?=
 =?utf-8?B?L0c1MnlTYk9kZjNBSm9yTUFnVDRxcmQ5d29DZGJFMXBVUkRVdHc2M1F0NjRx?=
 =?utf-8?B?YnlRVmowUlA4cVp1UUJJS0IxREVyMElVNUNRTmN1R0d5RmRXbDNtQjYvSms1?=
 =?utf-8?B?cENFaFBRazhTWXF2dy92QkR3M2w0WWttMHdEWkorSmgwNVZldEVvQ2JBYUZO?=
 =?utf-8?B?WmFZakVDWHh6ZHZtZjJSSlhrQWVMWG52RHBJL1hJUnQxOG1GUkxQMzNLOWRQ?=
 =?utf-8?B?Tnp1Wmh2UHQ1Qk50YXlMdHN6cDZJNFlQSWFCb3V5NmVrbzFTWUs0WTdYWGIz?=
 =?utf-8?B?Um84S3JFWUJ1bllMQnlNaEtybWJBOVVmVDZ3aDVCekxibEpQaUd4dzlOSVJB?=
 =?utf-8?B?dTNrZzR6VTYrVXVGaS9VNkhGNHBKaWFQYldLNEIyYk0xS1JjdXkvUi91V0kw?=
 =?utf-8?B?d2lncHpHcHdIOSsvdnlJMzJOQ2JCb1dzbm9kczh5dGlDUDJwSG9VQzFGVTlr?=
 =?utf-8?B?VmRZTzlKc3J2MDJ4SytVQmpDL0NETmlhaUd5Um1tTG1wV1RZeHM2R3hKZUF1?=
 =?utf-8?B?M3VVeXpYSDBMUjI5MnI0L3JsOEw1M0tJUUUzdlMxWm5qWGJwRnB5blNXR3E4?=
 =?utf-8?B?ZmxQSitzcktaQ29TUVVicjNLeUlIN1N6TVJzdTBidEROWlZFVGhhbmt0aGxk?=
 =?utf-8?B?cVNkUWJjSDhHKzdCaTkrUmsxZ0dVMkd4VklEaDJJa3BKOThDaGpmK0NMQVps?=
 =?utf-8?B?OEpMK3NjR3FJT04vcW12NnFDaEV4QjMzTUZjQkUwQk92SWgvM1hSbkQxQkdE?=
 =?utf-8?B?NzQvdmErR003YkxzZUNJWnc1TTl1OWVUa0V5bkRsd05Kc2N2dmJXTXpud2Nw?=
 =?utf-8?B?TUc2dGh6RmNnckhmTk9Mb09HR1NZUFh2aVFLYkhtRnRSdGtYU2dBWjBac1Zi?=
 =?utf-8?B?NFh5NUJDa3VXMGhoUU5uZHhlWkpEcUFJSmZsOXpaVndJZXV3d1lKWVZHYWlL?=
 =?utf-8?B?N1B4UXdFTkV1V3ZjZWtLdXNkS2NGZDhOYmdITElBY0VDQXdwSUVhY3lWdE5w?=
 =?utf-8?B?cXVFSjJHVEZXdno3NUJHSUNPYi9JNmhJTkNxQnJWK0tUTjZmTjlnUWJFOS8w?=
 =?utf-8?B?bUJFTWN4WjNSOVorRG5zbzBmRzQvVTNOLzJLYnhBVVhBMENJcDZqUi9hNEsz?=
 =?utf-8?Q?4S/DjeFuSAjTHAFLl8JugjnZj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf6530bd-6f4e-4437-ef8d-08dbd0943d93
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 11:12:11.0950
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OBYoEUnIQJPmhosgizftUosgT/B1Ns64E5KxWVvXNeUjn2o0hIa/xyb1Lotn+tdmWfRK8g6224+ry4wihO2DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7031

On 14.09.2023 16:56, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/asm-generic/div64.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef __ASM_GENERIC_DIV64
> +#define __ASM_GENERIC_DIV64
> +
> +#include <xen/types.h>
> +
> +# define do_div(n,base) ({                                      \
> +        uint32_t __base = (base);                               \
> +        uint32_t __rem;                                         \
> +        __rem = ((uint64_t)(n)) % __base;                       \
> +        (n) = ((uint64_t)(n)) / __base;                         \
> +        __rem;                                                  \
> + })

While I'm fine with having just the BITS_PER_LONG == 64 implementation
here, this then still needs to have the #if retained that Arm has. Only
with that will it then be fine to have a blank between # and define.

There are style issues though: A blank is missing after the comma,
and according to recent agreement leading underscores should not be
used for symbols like the ones here anymore (I also wonder whether
"base" is really a good name for the symbol; "divisor" may be more to
the point). There are also excess parentheses around the two cast
expressions.

Jan

