Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 505EF677A39
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jan 2023 12:38:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.482780.748480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJv9E-0003Az-0I; Mon, 23 Jan 2023 11:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 482780.748480; Mon, 23 Jan 2023 11:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pJv9D-00037y-Sm; Mon, 23 Jan 2023 11:37:59 +0000
Received: by outflank-mailman (input) for mailman id 482780;
 Mon, 23 Jan 2023 11:37:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pJv9B-00037s-Sj
 for xen-devel@lists.xenproject.org; Mon, 23 Jan 2023 11:37:57 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2068.outbound.protection.outlook.com [40.107.105.68])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 614dd5b4-9b12-11ed-91b6-6bf2151ebd3b;
 Mon, 23 Jan 2023 12:37:56 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7036.eurprd04.prod.outlook.com (2603:10a6:10:12f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Mon, 23 Jan
 2023 11:37:54 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.033; Mon, 23 Jan 2023
 11:37:54 +0000
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
X-Inumbo-ID: 614dd5b4-9b12-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Skxuy0KzBQSPq8nYVPYxJgKxHZxfVi8WHCUXhBssXofATBOMrlg9SIuOz/xsTslEAf0JlqkFadoA2tv5td0XY5C0bZw/WphNSaaECanEmc37uRKSEaFW7/KZ9jCqKJx1cVakBU1kava3nxoUZnwJ/XgeBTgKineTP/ze/UeTlVcJZ5XX/BodslMRwWhpl/ny/OAmdcb9dqbusiq3cWcO/ZiEDJhDfaQUwCZbb4jud+Mn0fNQgV5NH/snQDp8fr+YSBcCXLDbsWcsubys5exToktWjfhbTyFjcDziv/aaK0USSP+S+hN2nxUWI1bN0rVxsERWuFXp27RICTt2AjJG3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CG+LE7ZVGp3+peK9RIxC46OKHI6h53gF2G0/mIajOAA=;
 b=ZfbqAyWm1iYfX8hH6HeKgIfTmYon9E2IUR+Z1BlcDCfYp/avtrtBYsfLPo+tU3kKoRr1e48zAjw67jYPY9fZWvSc0va+Bbm1NNWRjUck27UgCz3Nu1M4WMjRWAINk1Fb01esuuPXk1w5AE6CZw7b/GtKz1+ghVjbPtyR7sWFksrL9zErMqR4FXdka40qe/VDNF3r4hBGcgq5/D6xjCOxJSxgW4ogaOBSrPK9MFuP9wihZ1FJ+ldIknN9jzjaLK3s43BYAmFkkiRZZoOwt9d2zOx5hxXxC3F7o4kwR8z4/b/OuS3DctVQ7qsGgJ0fUDp+nAc0XcNQq+eCs3kxmM7NAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CG+LE7ZVGp3+peK9RIxC46OKHI6h53gF2G0/mIajOAA=;
 b=hn/6lTXVJqBqgbXxGeHr5fBb5SfoKSFHEzDgE0o7IXycSDWJiG3yWtjg7jQ5K/FuqUnW779bFs5EfjrZVYL9nETe4IkvFAlmBN0T03Jj7WS6QkZQz4axfInZwjMDZo3vCB5qdcOAhpSDnmjeCjZt4W9nBug7JCRyrgr/54ZkOrDGCGxTjGbsW7NTzAsgnbXAKI1Th0wRRIMU4XVawNgTCFMcLmw0KNnt3KHU3+yCim7SI/z13NlULFW20EkRx58n3QowQJrx9nZU4w3KoF9RlBdnH+z+AwjBdAhV9lOIiyJ7c13elxfyEyM1fYR3QRnDILydj9PWrvgG+LThyS8yBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <740420d4-9e7a-6d3a-1b7d-05e16727fd2f@suse.com>
Date: Mon, 23 Jan 2023 12:37:52 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 12/14] xen/riscv: introduce an implementation of macros
 from <asm/bug.h>
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1674226563.git.oleksii.kurochko@gmail.com>
 <a0788e4744b04597fbd3e71c2bef0bd76843a066.1674226563.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a0788e4744b04597fbd3e71c2bef0bd76843a066.1674226563.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::18) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7036:EE_
X-MS-Office365-Filtering-Correlation-Id: 01f3a11d-0d00-4ce7-e185-08dafd364429
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/2f9uRHEF1LH5nF4q6l8l4yC3DmzvXz1e79GNwscQHgUSiGPJxdesnUxsAM+g1sFMYlSiZilgRmNbylHwNOaEQEt5XJ38LGSSCCGC/O8O5jwFDR8wQaNXuksrNatpsMdMMhJldQxtrpvsVtn65C1kMSD/pjCwFEiQ5d5KBSBFBdThU3CeMTgsnRzYi0HoUU02HI1/TTgLqF2s1i0OmsVyAK4m/wv0gz4vDlJITdThkOPd5nMzXygoGi2W6W3thz7vcfQg/cJEgZOxYFfqhEZ1L8QmD6T8JutImyMaBk+j4wQnm/FWBOlNtZ9Vkca41OKEmUoTo96fmjTf8MmYx5k0axf68PxVGYWaYe/zSHa+78+SdMwnSf4jeBOBTcBysCI8rj3IRQrzCS7Q4CICsI0CSEJmr4gZosUSBubmsvfDumVEO+VEbrT0nY7C3Ka4Mh7frlE5nSrb/C2GKh+Zi1snjT0t68WaypAv5aYByEOysiO0+uxKF8RG6NhTC95zEYkuePOzY9TgdseomeSR26wV/GqrL9uPTd5tiZ9LPcQveSKlSjX0Lrw2lCnyx7SWLHdmR5Nc9Wpw9LYrdyzyf2n8m5k5kJJOUSyiTy2Yzm0MwA7DsHh+gRxw6tnLPtVqxGcZlhBmpxF1VE1vxQOSb34Lvj4rYf8DXQAUCFnclliiqgMlgx5wTQiwD4m9M/uSMFVg8eo2A6pDsLpppz8eT+WBj4Fk0flgOZiU6UrhPC090o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(38100700002)(31696002)(26005)(31686004)(53546011)(6512007)(186003)(6506007)(2906002)(36756003)(66556008)(8936002)(4326008)(6916009)(66476007)(478600001)(8676002)(6486002)(5660300002)(66946007)(86362001)(83380400001)(41300700001)(54906003)(2616005)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y09TY3hnYjU2U0d2NEdBVnlaWWg3ODJWRy8ra1drVEJIMWRMUElMRExzaVNB?=
 =?utf-8?B?SWdwWERIbi9GOVMwaGcveXZFc3kyS0VSVC9MM0pPOUhuNGdraHl6Y0ltTG11?=
 =?utf-8?B?L2UzMDNvczJYTmphN21KU3ZmQ0FKSnkvdTFMWkwzbnBWVmlteWhwNUVnTGc3?=
 =?utf-8?B?VjROT3B1RFIzalZaQUdvQjh0MGdwRzFQVUlqNWVXOGlObjhuRGMzL3BYaThL?=
 =?utf-8?B?cGwxZUE2V2o3MVBUakkweVlsNEI3VEphb2RpeVE1d3BaTHNmUk00TzUweVB1?=
 =?utf-8?B?Q0U2OGpxYWdram5WcElqS0svcENhUDFncmlJbnZWc3BXaHRCZDdZSlZGM1ZO?=
 =?utf-8?B?aFhsVUxZUGF4aTJUQ1JNQXFlNy9oU0Z5T0VwWmk3SHd0WVlQZnVFdlJXUlBk?=
 =?utf-8?B?OWRnUWNabGZmNE1ITk5oL0xhajhnR1pVOG5vL3RvUVdianNnZnZQL2t5TkJO?=
 =?utf-8?B?eTEra0krZERLekR5SE40NS9sRXZOM3NsQlh1bHZPM2VHZUlpMHZvT0ZJR25s?=
 =?utf-8?B?elo5dTEwdXF3dnZmYmRIeEYvL000VG5EV0FGRURKbHBDaHdjaDdKRkVwd2Rx?=
 =?utf-8?B?b2lraENoL3ZRYk1qRjR3bzhzSCs4TnBMR0tnVzQ5RXN0M0IxVjNWTzVwUG5i?=
 =?utf-8?B?WEZscVpoTWxYVnJvMHVTSktCbzhTM1QxZk9FUS91amwvQmZMWTR4bHI2aHpE?=
 =?utf-8?B?QnhKQ0tNU0dRYXJOUWNUZ2E0VEtqaE5XU2U1VmhLeUFzRTZDeGh5RFd1TU5m?=
 =?utf-8?B?MlFmM01nSnJLRGZFTHA0Y0Qwc1VRdWFpbXZtakZyRjNFNTZEK1h6RG1tUjc1?=
 =?utf-8?B?UG5nbkt1STRaOEN0ZkZRQXVqaG9ObmRSZXdkK3NzUTZzRXRUYXFGWnduZWZt?=
 =?utf-8?B?MGppc240QTkwK25oTWdrUFpVUVRnUmV1ajQ2Z29wTWt6bnVLTFVoMnUzelEz?=
 =?utf-8?B?REVaek8wR2RJNjRCeWZBbkV5QnNMWDZFY2FJbUcreGx6MjVneWlTM0ZuU1ds?=
 =?utf-8?B?Mm9wVnhqclNZdHU2YWpCRHpXTnJzeVFkT01vek52dFpwTlFNSUVuSm5LT0kx?=
 =?utf-8?B?VVdtM1ltYWpmV3I1dDI4aHM0cnlCbGVacndFS0Fxb3czSmNBWnNCM2NTd2tN?=
 =?utf-8?B?TCtDeGdnZXYvMGhkaTBaSG1JVG9rb1VLYjNmaTh1em04MUU2YTVGMjllRTNZ?=
 =?utf-8?B?OXJYWnN4L0xyUFlKWjFScDNTY3JwRzJTRXJkaGRuWElTNnk4U1dpSmg0L0lt?=
 =?utf-8?B?ZXg2NWtma3orZW9MSXhJNUh2R3V6Q1dwZUdrUmRvaDlKZ1krNVNWVzhHWmR3?=
 =?utf-8?B?ZktBYVljNzNQYkZ3eHJNSys5S0ZaTTFXY0xTbkxMUWRub21JQ00zYkN6bGhU?=
 =?utf-8?B?TnppcEpkOWJldTg4ZTVmS1ZYSGJPbHZLSzA0SW5EdVhKRHZuVDlYUjBBTEQ0?=
 =?utf-8?B?WDJPUVpvZ1FUVEh6aXF2TWxWVFQxbUpVOE1NZ0pUNTI0ZWVocUZTTk1DemxM?=
 =?utf-8?B?VFp4c1hpb3I0YVR3ODNCUnVBMEFFR2RqcjE4WkxRTmNaSnJONDRsZ1d2NUlO?=
 =?utf-8?B?TTVkOHRKdDZ5S1IzQ21NU2dWMjdnNFp4WkRYNFBEOUJVRzVlQUM0S2Yrb1hF?=
 =?utf-8?B?TVdhczFuL05NTzlubHlQamVyMGdnQVk2dzN4SmtkUXlNQXh6aEwrd080U2x5?=
 =?utf-8?B?M2dkUVJrTU5FM1JYem9wVUFTTTVvcDJCbkFSOEN0SXp6RkhLcHhJV1JxdFZ1?=
 =?utf-8?B?cmRrM09mbXFRaWZBQkpzRFU5K2ZYRWRtQmNSSlVqQ0o4N250S285K1BXUGRS?=
 =?utf-8?B?OGpIOVdJRmwvMm9YODVpSzlyeVQrVHBzU1BDaUREeUw0Q2dWTXdjWkdFRTlh?=
 =?utf-8?B?TG05ZllrRlV3L2lEbXFxTlpkL2VPdjB1bll4d1dVakJZelNtTDdpSVJQSUFG?=
 =?utf-8?B?bElkM01mRnpjVFhyVzd5MHZxQ21mQWR2K09wTXROSDZYdHFpVDlWaTBCc0Uz?=
 =?utf-8?B?eTNQbVBOK1dmN0ZZdk1sMVlCYzl3SzQzcUc4NEEzREhVQ0gwWEd5Z1FEVVpP?=
 =?utf-8?B?Z01RRkRtblJoVkNIWWVOU0NFakd0QThYWGovWnk0Ylc3Y0F6QUFGVThOQ0Nl?=
 =?utf-8?Q?Ek6Qv09AINYVh7PBMy7ijptPx?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01f3a11d-0d00-4ce7-e185-08dafd364429
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 11:37:54.1409
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oEZFOTUiEllRrkqCtx/bfKmJo6NFNWMzVoI3dLOiHdL9xcLWqQt7cDJxLvfblsJB1kWNzC7+V5h+tnWw9FxT/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7036

On 20.01.2023 15:59, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/bug.h
> @@ -0,0 +1,120 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2012 Regents of the University of California
> + * Copyright (C) 2021-2023 Vates
> + *
> + */
> +
> +#ifndef _ASM_RISCV_BUG_H
> +#define _ASM_RISCV_BUG_H
> +
> +#include <xen/stringify.h>
> +#include <xen/types.h>
> +
> +#ifndef __ASSEMBLY__
> +
> +struct bug_frame {
> +    signed int loc_disp;    /* Relative address to the bug address */
> +    signed int file_disp;   /* Relative address to the filename */
> +    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
> +    uint16_t line;          /* Line number */
> +    uint32_t pad0:16;       /* Padding for 8-bytes align */
> +};
> +
> +#define bug_loc(b) ((const void *)(b) + (b)->loc_disp)
> +#define bug_file(b) ((const void *)(b) + (b)->file_disp);
> +#define bug_line(b) ((b)->line)
> +#define bug_msg(b) ((const char *)(b) + (b)->msg_disp)
> +
> +#define BUGFRAME_run_fn 0
> +#define BUGFRAME_warn   1
> +#define BUGFRAME_bug    2
> +#define BUGFRAME_assert 3
> +
> +#define BUGFRAME_NR     4
> +
> +#define __INSN_LENGTH_MASK  _UL(0x3)
> +#define __INSN_LENGTH_32    _UL(0x3)
> +#define __COMPRESSED_INSN_MASK	_UL(0xffff)
> +
> +#define __BUG_INSN_32	_UL(0x00100073) /* ebreak */
> +#define __BUG_INSN_16	_UL(0x9002) /* c.ebreak */

May I suggest that you avoid double-underscore (or other reserved) names
where possible?

> +#define GET_INSN_LENGTH(insn)						\
> +({									\
> +	unsigned long __len;						\
> +	__len = ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32) ?	\
> +		4UL : 2UL;						\
> +	__len;								\
> +})
> +
> +typedef u32 bug_insn_t;

This is problematic beyond the u32 instead of uint32_t. You use it once, ...

> +/* These are defined by the architecture */
> +int is_valid_bugaddr(bug_insn_t addr);

... in a call to this function, but you can't assume that you can access
32 bits when the insn you look at might be a compressed one. Just to be
on the safe side I'd like to suggest to either avoid such a type, or to
introduce two (32- and 16-bit) which then of course need using properly
in respective contexts.


> +#define BUG_FN_REG t0
> +
> +/* Many versions of GCC doesn't support the asm %c parameter which would
> + * be preferable to this unpleasantness. We use mergeable string
> + * sections to avoid multiple copies of the string appearing in the
> + * Xen image. BUGFRAME_run_fn needs to be handled separately.
> + */
> +#define BUG_FRAME(type, line, file, has_msg, msg) do {                      \
> +    asm ("1:ebreak\n"														\

Something's odd with the padding here; looks like there might be hard tabs.

> +         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
> +         "2:\t.asciz " __stringify(file) "\n"                               \
> +         "3:\n"                                                             \
> +         ".if " #has_msg "\n"                                               \
> +         "\t.asciz " #msg "\n"                                              \
> +         ".endif\n"                                                         \
> +         ".popsection\n"                                                    \
> +         ".pushsection .bug_frames." __stringify(type) ", \"a\", %progbits\n"\
> +         "4:\n"                                                             \
> +         ".p2align 2\n"                                                     \
> +         ".long (1b - 4b)\n"                                                \
> +         ".long (2b - 4b)\n"                                                \
> +         ".long (3b - 4b)\n"                                                \
> +         ".hword " __stringify(line) ", 0\n"                                \
> +         ".popsection");                                                    \
> +} while (0)
> +
> +/*
> + * GCC will not allow to use "i"  when PIE is enabled (Xen doesn't set the
> + * flag but instead rely on the default value from the compiler). So the
> + * easiest way to implement run_in_exception_handler() is to pass the to
> + * be called function in a fixed register.
> + */
> +#define  run_in_exception_handler(fn) do {                                  \

With

    register void *fn_ asm(__stringify(BUG_FN_REG)) = (fn);

you should be able to avoid ...

> +    asm ("mv " __stringify(BUG_FN_REG) ", %0\n"                            	\

... this and simply use ...

> +         "1:ebreak\n"                                                  		\
> +         ".pushsection .bug_frames." __stringify(BUGFRAME_run_fn) ","       \
> +         "             \"a\", %%progbits\n"                                 \
> +         "2:\n"                                                             \
> +         ".p2align 2\n"                                                     \
> +         ".long (1b - 2b)\n"                                                \
> +         ".long 0, 0, 0\n"                                                  \
> +         ".popsection" :: "r" (fn) : __stringify(BUG_FN_REG) );             \

   :: "r" (fn_) );

here. See x86's alternative_callN() for similar examples.

> @@ -107,7 +108,122 @@ static void do_unexpected_trap(const struct cpu_user_regs *regs)
>      wait_for_interrupt();
>  }
>  
> +void show_execution_state(const struct cpu_user_regs *regs)
> +{
> +    early_printk("implement show_execution_state(regs)\n");
> +}
> +
> +int do_bug_frame(struct cpu_user_regs *regs, vaddr_t pc)
> +{
> +    struct bug_frame *start, *end;
> +    struct bug_frame *bug = NULL;
> +    unsigned int id = 0;
> +    const char *filename, *predicate;
> +    int lineno;
> +
> +    unsigned long bug_frames[] = {
> +        (unsigned long)&__start_bug_frames[0],
> +        (unsigned long)&__stop_bug_frames_0[0],
> +        (unsigned long)&__stop_bug_frames_1[0],
> +        (unsigned long)&__stop_bug_frames_2[0],
> +        (unsigned long)&__stop_bug_frames_3[0],
> +    };
> +
> +    for ( id = 0; id < BUGFRAME_NR; id++ )
> +    {
> +        start = (struct  bug_frame *)bug_frames[id];
> +        end = (struct  bug_frame *)bug_frames[id + 1];
> +
> +        while ( start != end )
> +        {
> +            if ( (vaddr_t)bug_loc(start) == pc )
> +            {
> +                bug = start;
> +                goto found;
> +            }
> +
> +            start++;
> +        }
> +    }
> +
> +found:

Please indent labels by at least one blank; see ./CODING_STYLE.

> +    if ( bug == NULL )
> +        return -ENOENT;
> +
> +    if ( id == BUGFRAME_run_fn )
> +    {
> +        void (*fn)(const struct cpu_user_regs *) = (void *)regs->BUG_FN_REG;
> +
> +        fn(regs);
> +
> +        goto end;
> +    }
> +
> +    /* WARN, BUG or ASSERT: decode the filename pointer and line number. */
> +    filename = bug_file(bug);
> +    lineno = bug_line(bug);
> +
> +    switch ( id )
> +    {
> +    case BUGFRAME_warn:
> +        early_printk("Xen WARN at ");
> +        early_printk(filename);
> +        early_printk(":");
> +        early_printk_hnum(lineno);
> +
> +        show_execution_state(regs);
> +
> +        goto end;
> +
> +    case BUGFRAME_bug:
> +        early_printk("Xen BUG at ");
> +        early_printk(filename);
> +        early_printk(":");
> +        early_printk_hnum(lineno);
> +
> +        show_execution_state(regs);
> +        early_printk("change wait_for_interrupt to panic() when common is available\n");
> +        wait_for_interrupt();
> +
> +    case BUGFRAME_assert:
> +        /* ASSERT: decode the predicate string pointer. */
> +        predicate = bug_msg(bug);
> +
> +        early_printk("Assertion \'");
> +        early_printk(predicate);
> +        early_printk("\' failed at ");
> +        early_printk(filename);
> +        early_printk(":");
> +        early_printk_hnum(lineno);
> +
> +        show_execution_state(regs);
> +        early_printk("change wait_for_interrupt to panic() when common is available\n");
> +        wait_for_interrupt();
> +    }
> +
> +    return -EINVAL;
> +end:
> +    regs->sepc += GET_INSN_LENGTH(*(bug_insn_t *)pc);
> +
> +    return 0;
> +}
> +
> +int is_valid_bugaddr(bug_insn_t insn)
> +{
> +    if ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_32)
> +        return (insn == __BUG_INSN_32);
> +    else
> +        return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
> +}
> +
>  void __handle_exception(struct cpu_user_regs *cpu_regs)
>  {
> +    register_t pc = cpu_regs->sepc;
> +    uint32_t instr = *(bug_insn_t *)pc;
> +
> +    if (is_valid_bugaddr(instr))
> +        if (!do_bug_frame(cpu_regs, pc)) return;
> +
> +// die:

Perhaps better to omit the label until it's actually needed? In any
event you shouldn't be using C++-style comments (see ./CODING_STYLE
again).

Jan

