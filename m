Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6EF6E46D3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Apr 2023 13:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.522015.811118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNNt-0005C8-T9; Mon, 17 Apr 2023 11:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 522015.811118; Mon, 17 Apr 2023 11:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1poNNt-00059S-PS; Mon, 17 Apr 2023 11:51:01 +0000
Received: by outflank-mailman (input) for mailman id 522015;
 Mon, 17 Apr 2023 11:51:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=S5Vl=AI=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1poNNr-00059M-VK
 for xen-devel@lists.xenproject.org; Mon, 17 Apr 2023 11:51:00 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20616.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::616])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dbfe4ae-dd16-11ed-b21e-6b7b168915f2;
 Mon, 17 Apr 2023 13:50:57 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8379.eurprd04.prod.outlook.com (2603:10a6:10:241::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 11:50:55 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 11:50:54 +0000
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
X-Inumbo-ID: 1dbfe4ae-dd16-11ed-b21e-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=khk8y5YsH0rLu3VhDfGx5nxEi6eUbYOyfqmsa+zTJs87QD/S8NPnEB3Vl5ywkPZQkh52XoSGKigfknHXqzIjUTXd/mrDzsqOzUHwsEVsx3mwhWZKb6V6oQAwkUWyvSsSgQhO45RA/Ixduk01MgmvG/LaRfUOe/7kf7bMRJk/tL8TGaxk9DyhYGVptpYwLwUdvfotf1zEZbZ1UWUa2ytmg+ugsp9ECXMeic+tuW/4mF3YOuT2KhQbauJscAO1JrjyeibVLjqN+/aQnM5TuSbQzTXhhhQxE9dFNdmhGAgKA6lSbvnywbgc/umLA8f9oP3QL/MFVRGHKfYC0/zOxcw8Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IVp7bfOTYDaO/n204BRBLGpbzGv2My5FGkda1ilb9XM=;
 b=C9m/OD1kG7juwNOHozoilDhdr3R1ndulm8GXt4WEs3FyYzras6zcKUDGxD4xS6x+o2fpU87G1IwDWmDFxSS3END+Uk7M2kztN6kzldPorfzRheJd0xHmyEcU9SVILZhceIJM1melwF9XPQPMri/xxCIK2KSXSbMa5fxbWadN2Zj9lSzshrnngurrFa486AIa6eY1xo+z/ZGKr82dvcvfP8BaZiyymedrt0EPjH2r1XTsVUlq88d2lcOwXCS8ikaxLir9AeDACftC3mdCwoOjt6dcKrWYwtNQGRHkHuNSgvUkLKX+VQDC0V8dQu8VWTgez/xw0ZruywX6bwi+DCC5rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IVp7bfOTYDaO/n204BRBLGpbzGv2My5FGkda1ilb9XM=;
 b=gfiP5tQUGmz6Kotm1OwjneYr3XrsCaZNYTwQJKt9Yb/+97vKD9WIdMIVKj3yCAngbcbTivGszDB6buvSVwE4U8K7felWzN9CT2NBMDKgv2jyZC56+r4uzOrN+78zR5vhL/dMWGqebsz8b+J/y1lmaijS9z1mUt9xE3VDvVd3t2BXwAiVmPj02jTTiWwX5wfhuLalwnyT4BKawSU77hCUwiTNd8r7B7jZR8U/ruvRpHtA2i5s9mK7yZqSxj2W633S8/CQqtMNZTOJTEQrZ/o9TywDVLLIpapVSRSE+tB/l7WMRg0ixkF+Ihbnnkpl6G8NQ0upJkJxbxTlNkMdf7LHpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1cd40a12-7030-ec0d-dae7-e60132c2989c@suse.com>
Date: Mon, 17 Apr 2023 13:50:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v4 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1680882176.git.oleksii.kurochko@gmail.com>
 <50ed83073ccb440fb651070de8b0abebd3888b43.1680882176.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <50ed83073ccb440fb651070de8b0abebd3888b43.1680882176.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0253.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:af::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8379:EE_
X-MS-Office365-Filtering-Correlation-Id: cb10b0ab-76dd-45b1-d719-08db3f3a001d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J03owkyzprP5OaF9wO0JuTZpQ3HtX94/8sKo7xfkPTSQTb1nQHEv4xjiAHh/RcWqRhLu/Cd7oDWseXd5jPVPlOA6fUNrdLIlwC6rNk6x1m3YhGipPzlLkyzt40d0FolUouAvtY6Q2s/luBqd9iZmZbAnya4PkhL4wgOrxgqDv+kKWqfx4zFGyIWUqaTd4hQn77EHcxAg7QJFL+FkrQ7ElOQzFX6PerkELA6TySOUcPffJOu2+Q/fx9viWkuvixZkzRFUxpSQ73qd+X/5ktQ6lx/MSgMjDRuPeIKgl+S40bT8qHuNZpuwvE22+1z7O8yFM7205Dr0Zq7ZDl161r8/eYYszt7yy9l2Jp28DvWMa+OxYiG9pK3VIUjTlH/b5ftpfA0VkG98w4+AV01e/h+gA/SbYtBxyoVWfo4QgrX6eD7QFeKk8RD2zZZzttIbyd4b7jYYlV2tHBmL+gxUIflUPcvGveD06zGc3IC/SAi5cVjRK1gABWUSsxdJcbzKmeZ9xQt12vx3+aMWv98Biyi2s/nwP1RzUfatMXCK+z9O3K+/ovBhBn9Hqixacd1lJOQ40jUDaq8ka5933EzYakiT+SCqazwps6tfaVpsdtWhHP25yYUBfbUlrZWA2nUHRHm38a7nBMGSsT3ca1mExE55rA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(136003)(39860400002)(366004)(346002)(451199021)(6486002)(86362001)(478600001)(31696002)(2616005)(36756003)(83380400001)(26005)(6506007)(186003)(53546011)(6512007)(38100700002)(6916009)(66946007)(66476007)(66556008)(30864003)(316002)(2906002)(4326008)(8936002)(8676002)(5660300002)(31686004)(41300700001)(54906003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UjJXbThCamJRQ0VQc1VYRG9PNHNaZTFPaXpHbDVtbXMvR0cwWlk1cDV2QmFj?=
 =?utf-8?B?eDNlc01ob0F6RUhrOEtwRy9pcHVuWUF4c1JYT1B3K1lSSjRwa3VoKzlvYUdX?=
 =?utf-8?B?UThDdW9lM0VYa2Zobmtvb0JNdTluMDBtZ0Y0RzByM3N0S3pEc2t1ZE5rdG04?=
 =?utf-8?B?YU5aODhGclVrbHMrdGRHWXpGN25ONll4bGhZZ21EM2RhTDNuYTUxZ0h0UDE1?=
 =?utf-8?B?dlJSR2lKK0M3cXErS05xemx1V2NwUGV4NEpOVHZVbUI2TVJXR3MydGVwOUh1?=
 =?utf-8?B?eUpIY3hocUxNQTJSZm0xekJpWHVRN3l1RGVqS2RneDJ2QjFvckw3VDV0emxW?=
 =?utf-8?B?a0dOTnZsZ0xSM2lsMStxZnNSOThicWtIQW5hSVNZTXd3M0NGK3daajBrYjgv?=
 =?utf-8?B?SDhSdFYwWkFoZDlYaGZnVHVTYnR3S3JlSDJ1OVd3NVJGS1VoRDVsdmpDS3Vt?=
 =?utf-8?B?R2loazF3aUJnYlVPUW0vejJTQTBmeU82K2pNQUk2SGdEWGIwNElucHpGUnNl?=
 =?utf-8?B?WW51MUhuYUtmS3h0NUJ4NGdEMTlwVmdsYU4zOGRVcG15Z2srMERPYW9zYUY2?=
 =?utf-8?B?OElPanpjZUhmNE9malJzYlp1Wk8wMHBEUzFwMjAxbEpRdmFwQmVLRWdGaG14?=
 =?utf-8?B?QWJraWxrdUs1a1ZYNm9jbjVhOGNlL1BINXIvbEtUR2pscHZyQlYzeDdWQ0Jr?=
 =?utf-8?B?cGhjUXZDeVZxUE56aGFPd3BpOFJnRGxIMFVEQTZBQnZPU1YvVU1DOGV3d1BT?=
 =?utf-8?B?dUpFVzhudW50TXlQeEVDdm9qRTRFVkxSUjNpVVl3anRRNFVuUDc1ZUQyenNX?=
 =?utf-8?B?bXJzOFNpUGtmam13S0M2UXdHMXhlZHNnYVFhUEcwZ1VhWW1TQ0JNaEIxS09w?=
 =?utf-8?B?WkNEY3lmL044TStKMUs5cDdxZzRTdU5DTzRMZ1NpbUx2NU1rUk85VU02dzhn?=
 =?utf-8?B?TWlSRXd1VGZkVjhyckMrRFdLV0o3S1BCNGo4aGJrK3BZbEdZMVVKWlZqTzlL?=
 =?utf-8?B?NUFFdTE4UytXR3hQM3BETDNKWUJ3WUJwQmp6Q250TXo1bStyUmI3bU5PQits?=
 =?utf-8?B?OWFxNnZwaUZ1blFPdWRHUVB4dHhHVDNTWFhtVDlGL0JDRlg1Q24wYTJwcm5v?=
 =?utf-8?B?VjYycnVhblBrSlduWU8xK2haMW5Ka0hTbVBDM1hxSkxpOXV5SnM5T2lKQTJZ?=
 =?utf-8?B?N1daTTNzeUhldmgvWm5wSFRmazI4VmFHRjdMQVBEeTZrbzBkbWhZQm1tK0pI?=
 =?utf-8?B?NG02bHI0NnRmU2hkYmx5QldyekNGTzJ5TXltVDJ2SWtSUm90MURlTXNFNk9p?=
 =?utf-8?B?OUhtMVpZak56dFVNV0k5cVZtTzRscTlCeFRkWFFRcGQ1MmRxWS9hK0lvK3k3?=
 =?utf-8?B?ejNXNk1jRVlHQmFqQnpmN1JFNHo0QnJvdFQ3ZlhJVHl5dnkxaHhUNzNzRXZU?=
 =?utf-8?B?bUZXSHdyS0hzbHBscFZmN1Bub1R3SWZpNS9oUHMyaDBpQXl2MzljSTBmNjNW?=
 =?utf-8?B?Vi9WNlR1a0JMUVZJN1liNVpNRTlHeWJhSmh0eFpPWklocFFaSU9RZTE0ZmZN?=
 =?utf-8?B?elhNSnU1aUhPdVpyWWwrMWs1Q0RiZzVrR0lEajNWZDg5YzVzN2dTNUVjQmta?=
 =?utf-8?B?ek52UFRSUUZ3aW8xWGt4aWtlZkRxV1pnN2x0TFE4cjByTkZpRS82UUJlbTFV?=
 =?utf-8?B?VzVmUVozZ09HanQrWG43SUtFUlNEbXplc21rSlM5OEp5eks3SmEzeWNCclFL?=
 =?utf-8?B?Qkp5Uk03dFFSbXpWTk1MdG9aVUFGZFQvVEVkVS81aytZNzZvb1MrNE0zT0lQ?=
 =?utf-8?B?LzY1RlRqWWM5K2JhYnl4WitDVkpya3RaSEVjUHRZMEt0aDBUM0VaWHNaQldz?=
 =?utf-8?B?c1dZNjB1cFBJVFNYTFZoTTJvNUI4VkZqUE5vNEdjMGZTc2ZSdmJLeERrcitL?=
 =?utf-8?B?dWhiT1NvajRObWdBTXMvVStKWE9lbWVxNHNQSHJpZ3R3OGdrdzNqVmNWWWRt?=
 =?utf-8?B?T2YwSDgydXV0SXBSUFZCQWhVTGxFbkJvZWFWSzFUZ0JaY3N3Z0hBZ1NONjJZ?=
 =?utf-8?B?dHZTbk91bkl3N25SSGE3d0ZCcjd2TDdPNDBnR0ZWTUtMNUNOczlGcndiTmNW?=
 =?utf-8?Q?vtN2PB9vsD8GYABKQkJT48VNG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb10b0ab-76dd-45b1-d719-08db3f3a001d
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 11:50:54.7784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+eqZjNJBqTOQu9KKqpc+68YvW8uQKxP/JVyE1rZMY+K1NnpO7EyCvmdXBFS9WM6kNB2y1XklkKyK9NOQZ5PqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8379

On 07.04.2023 17:48, Oleksii Kurochko wrote:
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
> ---
> Changes in V4:
>   * use GB() macros instead of defining SZ_1G
>   * hardcode XEN_VIRT_START and add comment (ADDRESS_SPACE_END + 1 - GB(1))

Perhaps in a separate patch, may I ask that you add - like x86 and Arm
have it - a block comment to config.h laying out virtual address space
use? Knowing what is planned to be put where (even if just vaguely, i.e.
keeping open the option of changing the layout) is likely going to help
with figuring whether this is a good placement.

Such a comment could then also be accompanied by mentioning that
virtual address space really "wraps" at certain boundaries (due to the
upper address bits simply being ignored). For an x86 person like me
this is certainly unexpected / unusual behavior.

>   * remove unnecessary 'asm' word at the end of #error
>   * encapsulate pte_t definition in a struct
>   * rename addr_to_ppn() to ppn_to_paddr().
>   * change type of paddr argument from const unsigned long to paddr_t
>   * pte_to_paddr() update prototype.
>   * calculate size of Xen binary based on an amount of page tables
>   * use unsgined int instead of 'uint32_t' instead of uint32_t as
>     their use isn't warranted.
>   * remove extern of bss_{start,end} as they aren't used in mm.c anymore
>   * fix code style
>   * add argument for HANDLE_PGTBL macros instead of curr_lvl_num variable
>   * make enable_mmu() as noinline to prevent under link-time optimization
>     because of the nature of enable_mmu()
>   * add function to check that SATP_MODE is supported.
>   * update the commit message
>   * update setup_initial_pagetables to set correct PTE flags in one pass
>     instead of calling setup_pte_permissions after setup_initial_pagetables()
>     as setup_initial_pagetables() isn't used to change permission flags.
> ---
> Changes in V3:
>  - update definition of pte_t structure to have a proper size of pte_t
>    in case of RV32.
>  - update asm/mm.h with new functions and remove unnecessary 'extern'.
>  - remove LEVEL_* macros as only XEN_PT_LEVEL_* are enough.
>  - update paddr_to_pte() to receive permissions as an argument.
>  - add check that map_start & pa_start is properly aligned.
>  - move  defines PAGETABLE_ORDER, PAGETABLE_ENTRIES, PTE_PPN_SHIFT to
>    <asm/page-bits.h>
>  - Rename PTE_SHIFT to PTE_PPN_SHIFT
>  - refactor setup_initial_pagetables: map all LINK addresses to LOAD addresses
>    and after setup PTEs permission for sections; update check that linker
>    and load addresses don't overlap.
>  - refactor setup_initial_mapping: allocate pagetable 'dynamically' if it is
>    necessary.
>  - rewrite enable_mmu in C; add the check that map_start and pa_start are
>    aligned on 4k boundary.
>  - update the comment for setup_initial_pagetable funcion
>  - Add RV_STAGE1_MODE to support different MMU modes
>  - set XEN_VIRT_START very high to not overlap with load address range
>  - align bss section
> ---
> Changes in V2:
>  * update the commit message:
>  * Remove {ZEROETH,FIRST,...}_{SHIFT,MASK, SIZE,...} and
>    introduce instead of them XEN_PT_LEVEL_*() and LEVEL_*
>  * Rework pt_linear_offset() and pt_index based on  XEN_PT_LEVEL_*()
>  * Remove clear_pagetables() functions as pagetables were zeroed during
>    .bss initialization
>  * Rename _setup_initial_pagetables() to setup_initial_mapping()
>  * Make PTE_DEFAULT equal to RX.
>  * Update prototype of setup_initial_mapping(..., bool writable) -> 
>    setup_initial_mapping(..., UL flags)  
>  * Update calls of setup_initial_mapping according to new prototype
>  * Remove unnecessary call of:
>    _setup_initial_pagetables(..., load_addr_start, load_addr_end, load_addr_start, ...)
>  * Define index* in the loop of setup_initial_mapping
>  * Remove attribute "__attribute__((section(".entry")))" for setup_initial_pagetables()
>    as we don't have such section
>  * make arguments of paddr_to_pte() and pte_is_valid() as const.
>  * make xen_second_pagetable static.
>  * use <xen/kernel.h> instead of declaring extern unsigned long _stext, 0etext, _srodata, _erodata
>  * update  'extern unsigned long __init_begin' to 'extern unsigned long __init_begin[]'
>  * use aligned() instead of "__attribute__((__aligned__(PAGE_SIZE)))"
>  * set __section(".bss.page_aligned") for page tables arrays
>  * fix identatations
>  * Change '__attribute__((section(".entry")))' to '__init'
>  * Remove phys_offset as it isn't used now.
>  * Remove alignment  of {map, pa}_start &= XEN_PT_LEVEL_MAP_MASK(0); in
>    setup_inital_mapping() as they should be already aligned.
>  * Remove clear_pagetables() as initial pagetables will be
>    zeroed during bss initialization
>  * Remove __attribute__((section(".entry")) for setup_initial_pagetables()
>    as there is no such section in xen.lds.S
>  * Update the argument of pte_is_valid() to "const pte_t *p"
> ---
> 
>  xen/arch/riscv/Makefile                |   1 +
>  xen/arch/riscv/include/asm/config.h    |  12 +-
>  xen/arch/riscv/include/asm/mm.h        |   9 +
>  xen/arch/riscv/include/asm/page-bits.h |  10 +
>  xen/arch/riscv/include/asm/page.h      |  65 +++++
>  xen/arch/riscv/mm.c                    | 319 +++++++++++++++++++++++++
>  xen/arch/riscv/riscv64/head.S          |   2 +
>  xen/arch/riscv/setup.c                 |  11 +
>  xen/arch/riscv/xen.lds.S               |   4 +
>  9 files changed, 432 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/riscv/include/asm/mm.h
>  create mode 100644 xen/arch/riscv/include/asm/page.h
>  create mode 100644 xen/arch/riscv/mm.c
> 
> diff --git a/xen/arch/riscv/Makefile b/xen/arch/riscv/Makefile
> index 443f6bf15f..956ceb02df 100644
> --- a/xen/arch/riscv/Makefile
> +++ b/xen/arch/riscv/Makefile
> @@ -1,5 +1,6 @@
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
>  obj-y += entry.o
> +obj-y += mm.o
>  obj-$(CONFIG_RISCV_64) += riscv64/
>  obj-y += sbi.o
>  obj-y += setup.o
> diff --git a/xen/arch/riscv/include/asm/config.h b/xen/arch/riscv/include/asm/config.h
> index 763a922a04..0cf9673558 100644
> --- a/xen/arch/riscv/include/asm/config.h
> +++ b/xen/arch/riscv/include/asm/config.h
> @@ -39,12 +39,22 @@
>    name:
>  #endif
>  
> -#define XEN_VIRT_START  _AT(UL, 0x80200000)
> +#ifdef CONFIG_RISCV_64
> +#define XEN_VIRT_START 0xFFFFFFFFC0000000 /* (_AC(-1, UL) + 1 - GB(1)) */
> +#else
> +#error "RV32 isn't supported"
> +#endif
>  
>  #define SMP_CACHE_BYTES (1 << 6)
>  
>  #define STACK_SIZE PAGE_SIZE
>  
> +#ifdef CONFIG_RISCV_64
> +#define RV_STAGE1_MODE SATP_MODE_SV39
> +#else
> +#define RV_STAGE1_MODE SATP_MODE_SV32
> +#endif
> +
>  #endif /* __RISCV_CONFIG_H__ */
>  /*
>   * Local variables:
> diff --git a/xen/arch/riscv/include/asm/mm.h b/xen/arch/riscv/include/asm/mm.h
> new file mode 100644
> index 0000000000..e16ce66fae
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/mm.h
> @@ -0,0 +1,9 @@
> +#ifndef _ASM_RISCV_MM_H
> +#define _ASM_RISCV_MM_H
> +
> +void setup_initial_pagetables(void);
> +
> +void enable_mmu(void);
> +void cont_after_mmu_is_enabled(void);
> +
> +#endif /* _ASM_RISCV_MM_H */
> diff --git a/xen/arch/riscv/include/asm/page-bits.h b/xen/arch/riscv/include/asm/page-bits.h
> index 1801820294..0879a527f2 100644
> --- a/xen/arch/riscv/include/asm/page-bits.h
> +++ b/xen/arch/riscv/include/asm/page-bits.h
> @@ -1,6 +1,16 @@
>  #ifndef __RISCV_PAGE_BITS_H__
>  #define __RISCV_PAGE_BITS_H__
>  
> +#ifdef CONFIG_RISCV_64
> +#define PAGETABLE_ORDER         (9)
> +#else /* CONFIG_RISCV_32 */
> +#define PAGETABLE_ORDER         (10)
> +#endif
> +
> +#define PAGETABLE_ENTRIES       (1 << PAGETABLE_ORDER)
> +
> +#define PTE_PPN_SHIFT           10
> +
>  #define PAGE_SHIFT              12 /* 4 KiB Pages */
>  #define PADDR_BITS              56 /* 44-bit PPN */
>  
> diff --git a/xen/arch/riscv/include/asm/page.h b/xen/arch/riscv/include/asm/page.h
> new file mode 100644
> index 0000000000..30406aa614
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,65 @@
> +#ifndef _ASM_RISCV_PAGE_H
> +#define _ASM_RISCV_PAGE_H
> +
> +#include <xen/const.h>
> +#include <xen/types.h>
> +
> +#define VPN_MASK                    ((unsigned long)(PAGETABLE_ENTRIES - 1))
> +
> +#define XEN_PT_LEVEL_ORDER(lvl)     ((lvl) * PAGETABLE_ORDER)
> +#define XEN_PT_LEVEL_SHIFT(lvl)     (XEN_PT_LEVEL_ORDER(lvl) + PAGE_SHIFT)
> +#define XEN_PT_LEVEL_SIZE(lvl)      (_AT(paddr_t, 1) << XEN_PT_LEVEL_SHIFT(lvl))
> +#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
> +#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
> +
> +#define PTE_VALID                   BIT(0, UL)
> +#define PTE_READABLE                BIT(1, UL)
> +#define PTE_WRITABLE                BIT(2, UL)
> +#define PTE_EXECUTABLE              BIT(3, UL)
> +#define PTE_USER                    BIT(4, UL)
> +#define PTE_GLOBAL                  BIT(5, UL)
> +#define PTE_ACCESSED                BIT(6, UL)
> +#define PTE_DIRTY                   BIT(7, UL)
> +#define PTE_RSW                     (BIT(8, UL) | BIT(9, UL))
> +
> +#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> +#define PTE_TABLE                   (PTE_VALID)
> +
> +/* Calculate the offsets into the pagetables for a given VA */
> +#define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
> +
> +#define pt_index(lvl, va) pt_linear_offset(lvl, (va) & XEN_PT_LEVEL_MASK(lvl))
> +
> +/* Page Table entry */
> +typedef struct {
> +#ifdef CONFIG_RISCV_64
> +uint64_t pte;
> +#else
> +uint32_t pte;
> +#endif
> +} pte_t;

Please indent both field declarations accordingly.

> +#define addr_to_pte(x) (((x) >> PTE_PPN_SHIFT) << PAGE_SHIFT)

This still looks to be converting _to_ an address, not to PTE layout, ...

> +/* Shift the VPN[x] or PPN[x] fields of a virtual or physical address
> + * to become the shifted PPN[x] fields of a page table entry */
> +#define ppn_to_paddr(x) (((x) >> PAGE_SHIFT) << PTE_PPN_SHIFT)

... while this converts an address (not a ppn) to PTE layout (not a
paddr). Getting the names of these helpers right is crucial for easy
following of any code using them. To be honest, I'll stop reviewing
here, because the names being wrong is just going to be too confusing.

Jan

