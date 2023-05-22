Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD57170C0F3
	for <lists+xen-devel@lfdr.de>; Mon, 22 May 2023 16:24:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.537980.837668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16Sf-0007IN-Jn; Mon, 22 May 2023 14:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 537980.837668; Mon, 22 May 2023 14:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q16Sf-0007Fh-Gh; Mon, 22 May 2023 14:24:33 +0000
Received: by outflank-mailman (input) for mailman id 537980;
 Mon, 22 May 2023 14:24:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=oqCu=BL=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q16Sd-0007FZ-Iq
 for xen-devel@lists.xenproject.org; Mon, 22 May 2023 14:24:31 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20628.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c0002e7-f8ac-11ed-8611-37d641c3527e;
 Mon, 22 May 2023 16:24:28 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by VI1PR04MB7070.eurprd04.prod.outlook.com (2603:10a6:800:123::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Mon, 22 May
 2023 14:24:25 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 14:24:25 +0000
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
X-Inumbo-ID: 5c0002e7-f8ac-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BXKuecOZgCnbw26bCWrjmW0w4eU6hCUYYLtv7QL75v9xzbqvoB9204OPV4/nw5mgjOFmJ2JojSA8+4jKe2/T3fmyTvvGDmQFj4VAqi+vWYAjsd+SDQz5ShLJUdqp/LwsJBKYyek1oBxvjm2O/gj/QfIdnXBqy9O371ZWW38zeNRNPwUgWjlXHw2YC1zNdqFwv6Zlv0ilA6coFCKvCXqjPNgof8V4J9XcYJ3kV1/C8XRm7LihwDYCGULR1lYanJ49cC+ChXkXfvVzMb4NrG94E6iJVSvp46Jgghrosf1FqKiUwHa7DSq68paZLKaT3LViLFEtJA+3nvB5qIErIsno+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LJ8S4kwInCreaZDstvSczi/tr9qkWZ0yKrweweCBVU0=;
 b=FzOzfXeGfIXpTRMBFZvfd8ixIG5O4rlaIbJQ8fBBHOPDm5DwBuQYLuV6LgoLOkkkgMEvY9PCi7aGbS1nG31eV5PtYw9K92If6KVbIYR/cjf7VA2b/kXswP7SdS2ZEm1H/2amv5HLv5U42hjbIuiuSFPKsmYPWdlydxIdSJiQwQeRkQA5WDxiUJdbVV8+w/CIXg7JeZW1pgbv5wsxvcO4aa35/1W/VHJe5jAdh2o7IefhwtKDvRSdYdkHleKmDjMF8BjafKHirZE1vQWIT5cF9xCY54K1mZZkhLUB6ZzOvsCR4d/vZ+6j6JE2uDwncBFQJ0yybiiUX8gkCfsTFJkxBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LJ8S4kwInCreaZDstvSczi/tr9qkWZ0yKrweweCBVU0=;
 b=DFCO7CUDFGcKz+OKfbSVewpn2ie9bwBv/IFynFNHSaTocTL4W5qTw3mzDp966JcHjdyrkDN/cRHv3si6snu/ocavXH+SJ1itKa/T08p1icBlBebKnbjrsfRdlrH1P0IxZBzpPfvGzhUHwAFyoE3Z5hN+oYGKO1WXEI4up0rhKZU1fB8IiB1uLTw4kvvls5mcjltGdR65ifRNFROs70NluWN/Ee2TzHEEwTbNdDgrhd31WH5dtr7Yl7jd0XqoMVEZOPZ3/tk9f47J4INDS9Wqoi2IEBtLfhcJ/7vb9YOza5PcL9JoFSeVAZ44eQ6YH5x4SXcL5Fk5gZfjMdDNGHQnng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0ddd0533-635d-48c6-7f19-d8ef2ee04302@suse.com>
Date: Mon, 22 May 2023 16:24:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v8 2/5] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1684757267.git.oleksii.kurochko@gmail.com>
 <cd705abf9e44eb7c91895163b73f60080634706f.1684757267.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cd705abf9e44eb7c91895163b73f60080634706f.1684757267.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0122.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|VI1PR04MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: a0513f71-e67b-4be2-7b1e-08db5ad03e18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9pnTYj0kX1HPgrvAyGHWQZ1rJHoZUTkCVGL7EFv3YB2QrKbVB0pa1DT4dsEr9lfpbY216Lv2NhZmkiyfXmLTzS/WltaYtt9Pg6HFau3YXeIlaKgd4u9CQ/5UqjjCTajo14cdYfcP0H5eroSm02BCVIIQxXSTqDgFTbBe9Vra6LJyNkxMmEHMlRUZ0mY1+S+/k871htZgknUIyGBTvNmJ33N6Rell3unvm7BHbq2QnAoFwGPdZUjke4PZDUSlTd1a8hgTCsT4zudkuDFrTnr3Zugc27SwTZQrDXap3tmD7y3UOOuNDcKiYifQyPVLSfZsL9rWKMQtS3i5cKrUMCO/uxd9u079uCen/mG5U87Mlv5vOjaPgUuCzRxgooEyf34u9l9qEC7BAqP9Crydamr9NUm/h5a8SkkzspHmhUDNMebWbc/EQsMouNMLTlVNmxxmocINsdBvPs4D49+yyrpJOOdscfESHs844siwSX4QkKTLi3j+WnKXFv1oQjrtJimAzkqcImnOC4IYsJAA3/ekkhTrr55vPCm2ZighsVdr98QWCbuBUaxpD99H2o7VWr5DFnwFgAvNH23LuBJwIVPU8ew0hUECiIlXlB1KA/qq3mP0iC7GwQ3l/L2t6YX4wgYl8GvTEaUirMGPvoX9EvIXGw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39850400004)(366004)(376002)(346002)(396003)(451199021)(6666004)(31686004)(86362001)(316002)(54906003)(478600001)(41300700001)(6486002)(66946007)(4326008)(66556008)(66476007)(6916009)(38100700002)(8676002)(8936002)(5660300002)(83380400001)(2616005)(36756003)(31696002)(53546011)(26005)(2906002)(186003)(6512007)(6506007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WmF5cVVCQ2dsMm5qeERSU2VuZVJYcnN0K3JkZG4yOEs2VHlMcW4vdjZTMnAr?=
 =?utf-8?B?dmdOSDdDb1pzOWQrRDUyWmVQelZCM0NlWThGeGhvRVpVZTk4ZDhmV0ZkRXNC?=
 =?utf-8?B?R3JKTUUxYXl6V3g0clJWOUdnU0NtUHVVTkdiTGVBc2pRZEQvRVB1NzVtUUVY?=
 =?utf-8?B?bzVpZ1N0L0hmOUVtZGgyanVGYXJsVFh5aVV1YzYvRmRxeUZlb1VDeEU2TW5l?=
 =?utf-8?B?aWlrSGsxTk9QZWlvWTMvQzY5Wm1zenJVQWNWZVJCYmtmOGRMNk41RzFNYnJl?=
 =?utf-8?B?MjdTandOVVhzeEdESGJxZnBYa3FEa2piUFU1THA1ck1IYmZmTUo5WVd2Q0Fk?=
 =?utf-8?B?bWJFakpBV3Btd0RxbXN6UkFFc1NJbXlKQzlSRnN6Wms5dU0weWdoRVBwV01m?=
 =?utf-8?B?Zi9VSmdmY21VVDFRWU1rd1JYZFh2UTZjUHI3WFVocmhHYUdTaVB3NzJJS095?=
 =?utf-8?B?MEgvM1B3dE9iS3BVTWxmc1lIOHIxcHo2U2c0OUtwRFBuWGFOcDlVbVR0ajQ1?=
 =?utf-8?B?ZUZzMTNJT1Brcjl2a1hYRWpyOFdlNU1zZVhkVVQwYzJ2UTBUN3ZwQXA4RjFy?=
 =?utf-8?B?V0hZMm9tb2s2K0t5ZlBCZUxqblRhM0VyeHNDelU4RHRWSmhzSWdxa1IzbWF1?=
 =?utf-8?B?Y21DdkJaaVQzTkZaek5rL3lVbytNclVQZ0d6VzZqVGxJM3lSRDNReVA5RTh2?=
 =?utf-8?B?OW0wTnIxZ2VnTlE3cVVWQ01ydER0OGxiK2FrOWVRQ0F0UWtFU2piYkgxWjVl?=
 =?utf-8?B?RmdlQlIwNW9QUXlCVTVYZ2l1YU1wK0gxUVVxS0ZaZjJORVhXbGVYZ20rbEhO?=
 =?utf-8?B?YnpyZ1lZSE92NW5NS0dCNURQWjlBSWpxZHpSWWFHd3VFYXByMS9UN2xHejIv?=
 =?utf-8?B?Ny91NjBNd05FRHpodXBRazZnYkNkc1AyaCs4UFhUb1F0MjZjNW1LcFpqL3lV?=
 =?utf-8?B?YzI1dXFUYnNRd1hZR1V3QWpqZWZTUU51bWhwVHB4S2tkdVFIeWwxNGM1L1E1?=
 =?utf-8?B?QUJEODVFNU0zZ0wrNU1UWnBHSGZCWnVPYkEyMWsramRTaTNIK0pvVXVXK3dw?=
 =?utf-8?B?aTBKZ1U0b2czajBXOFlWOG5hc0xoTDY2R0c0RVhEQ0hyOStQdURuUC9QTmEy?=
 =?utf-8?B?ZEhsLzBkS0JJeTc5OWRCKzcwSFFFdjBQQmc1VDJJeitTaXFkdEp4WDVYTUk2?=
 =?utf-8?B?MEMySDgvNFJtekJDMk1kWkVhQ2tEdFg4UWdBZDNFT1V5ZW5KbkxyMFFndXgv?=
 =?utf-8?B?T1BQUHZKZkRQcVcyVHpVWko0YkxWbW52Y2p0d1dhYmZpMWdBdWVsRnNVd1l2?=
 =?utf-8?B?YThncnVEOFdiUEVqcFVTai9seWRVZnF6WlV5THFQUkJpaTN4MDZFY2FYOXZa?=
 =?utf-8?B?N0dhS2dNZnlpNmE0eDRzYk9UZUlxdURzU0VFRkV0aVo5MkJVODFVNldvRWZi?=
 =?utf-8?B?RExTZU1TL0h0cnRva2ZNL2tNb1kvMURhc2pCU01HSDB3SitRRTdFMFJaNWpt?=
 =?utf-8?B?TFBHeXVsN3A2T0hDblhwY211QlQ4ZGFxWkhZbUZDTjBrQW5VVWhwVld0cUdq?=
 =?utf-8?B?dlN5TmIraG02M0tJRlpxK3NVb1dPT1d3a2pkdHN6ZzUvNDI3Ky9tVVhGTTZ2?=
 =?utf-8?B?WmNDbjhXVnYzRVkyU1RhUEQySTBPbDhvRHVieW5Yem9namJBK3hLaTZPMy9G?=
 =?utf-8?B?b1hNR21ucTFMcHVJTmlwUkozcm9xVTUyMUFlZjlyY1NYMUg4UDRlNGt2STR1?=
 =?utf-8?B?SDhiSXhIWHRtNllxbFBTREFxUUxMVmJKdzUyeEMvRW84czhlL0hKR0hSM2Fy?=
 =?utf-8?B?ZDdkZjYvb2FPNnVMd3lSYmgvalErVmJVRU1COEwyY3U4M2ZqU0hTUlVhNllS?=
 =?utf-8?B?TGhNR0JRQkIrS0xtV3lKOTNXd3lTV3RSQ3BOelFnSHZtb0tHcVVuWml6Tmdn?=
 =?utf-8?B?b1AwWmxHSWo4TDFkbm9UeCs3QjVxYTlsNngvRnUvODZNKzBhejFUTU1ZNm9T?=
 =?utf-8?B?Z3NVREZPWStnVEozcVBNVjlyZzlRZFdjVUJRVEo2WjJwenNzVWVzazRaaUlr?=
 =?utf-8?B?anUrRFdaT0d1bjlhWW56NGdnR1RMQSsrVk1xeTJiYXlTLzl2KzVkb3hoZVJs?=
 =?utf-8?Q?2g8rW4Aog4oSmXndRHX39FHtC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0513f71-e67b-4be2-7b1e-08db5ad03e18
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 14:24:24.6578
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0S3Lh9HQ2O3uumMt1NEHjpDsSQ0/sVZ4KJjE8KU1K5uJb9xUZyclqqgL2du+pv794gDIOmdWiQ+/ugvu/D2nLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7070

On 22.05.2023 14:18, Oleksii Kurochko wrote:
> The idea was taken from xvisor but the following changes
> were done:
> * Use only a minimal part of the code enough to enable MMU
> * rename {_}setup_initial_pagetables functions
> * add an argument for setup_initial_mapping to have
>   an opportunity to make set PTE flags.
> * update setup_initial_pagetables function to map sections
>   with correct PTE flags.
> * Rewrite enable_mmu() to C.
> * map linker addresses range to load addresses range without
>   1:1 mapping. It will be 1:1 only in case when
>   load_start_addr is equal to linker_start_addr.
> * add safety checks such as:
>   * Xen size is less than page size
>   * linker addresses range doesn't overlap load addresses
>     range
> * Rework macros {THIRD,SECOND,FIRST,ZEROETH}_{SHIFT,MASK}
> * change PTE_LEAF_DEFAULT to RW instead of RWX.
> * Remove phys_offset as it is not used now
> * Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0);
>   in  setup_inital_mapping() as they should be already aligned.
>   Make a check that {map_pa}_start are aligned.
> * Remove clear_pagetables() as initial pagetables will be
>   zeroed during bss initialization
> * Remove __attribute__((section(".entry")) for setup_initial_pagetables()
>   as there is no such section in xen.lds.S
> * Update the argument of pte_is_valid() to "const pte_t *p"
> * Add check that Xen's load address is aligned at 4k boundary
> * Refactor setup_initial_pagetables() so it is mapping linker
>   address range to load address range. After setup needed
>   permissions for specific section ( such as .text, .rodata, etc )
>   otherwise RW permission will be set by default.
> * Add function to check that requested SATP_MODE is supported
> 
> Origin: git@github.com:xvisor/xvisor.git 9be2fdd7
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one more nit and a remark:

> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,61 @@
> +#ifndef _ASM_RISCV_PAGE_H
> +#define _ASM_RISCV_PAGE_H
> +
> +#include <xen/const.h>
> +#include <xen/types.h>
> +
> +#include <asm/mm.h>
> +#include <asm/page-bits.h>
> +
> +#define VPN_MASK                    ((unsigned long)(PAGETABLE_ENTRIES - 1))

Just as a remark - this could also be just

#define VPN_MASK                    (PAGETABLE_ENTRIES - 1UL)

> --- /dev/null
> +++ b/xen/arch/riscv/mm.c
> @@ -0,0 +1,277 @@
> +#include <xen/compiler.h>
> +#include <xen/init.h>
> +#include <xen/kernel.h>
> +#include <xen/pfn.h>
> +
> +#include <asm/early_printk.h>
> +#include <asm/csr.h>
> +#include <asm/current.h>
> +#include <asm/mm.h>
> +#include <asm/page.h>
> +#include <asm/processor.h>
> +
> +struct mmu_desc {
> +    unsigned int num_levels;
> +    unsigned int pgtbl_count;
> +    pte_t *next_pgtbl;
> +    pte_t *pgtbl_base;
> +};
> +
> +extern unsigned char cpu0_boot_stack[STACK_SIZE];
> +
> +#define PHYS_OFFSET ((unsigned long)_start - XEN_VIRT_START)
> +#define LOAD_TO_LINK(addr) ((addr) - PHYS_OFFSET)
> +#define LINK_TO_LOAD(addr) ((addr) + PHYS_OFFSET)
> +
> +

Nit: No double blank lines please.

Jan

