Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A86A7CF567
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 12:32:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619150.963742 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQKJ-0003Al-EL; Thu, 19 Oct 2023 10:32:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619150.963742; Thu, 19 Oct 2023 10:32:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtQKJ-000389-BV; Thu, 19 Oct 2023 10:32:27 +0000
Received: by outflank-mailman (input) for mailman id 619150;
 Thu, 19 Oct 2023 10:32:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=g4nO=GB=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qtQKH-00036Z-Im
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 10:32:25 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on060e.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cafec1ee-6e6a-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 12:32:24 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PA4PR04MB9461.eurprd04.prod.outlook.com (2603:10a6:102:2a9::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Thu, 19 Oct
 2023 10:32:22 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d9c0:d907:4d2d:15b3%7]) with mapi id 15.20.6907.022; Thu, 19 Oct 2023
 10:32:22 +0000
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
X-Inumbo-ID: cafec1ee-6e6a-11ee-98d5-6d05b1d4d9a1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DuGEonfQstDt3fjPUf6DB9dZQ536Qq52wx/1iIVZjxlaKCom4TOgc8rsCUfWoaV0rGxTkNnQzHwGqFoLG6FVfkfJAOVRbHM6+zUpF4wiMOXwbf6at3BI8piJW3u+gc9MBUqFoJ7lq1FdAaZon3ydcLondTrnV9H6qkwId4TZ96iqyXB2FVnA3TAL0lTObX1Sm2L2hTTj/Kb76+YFVzWNMiy4drzJaUQSpyf4kddcEJpCnjrj3AbdB/YgJO5a7wfg242pFWYh6g6Qf3iu2afPJnqqq3NrRFn/2VyclnRKzCLSU9QdLdaVravnz8I7+f4RO+MFhedSsgYno9QP5CoVyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AtDp2LM+nS3gcYzkfoE3b59zdiir11Lx+bhpl0XuDdo=;
 b=JD4pLjkKP4bpPXrY1S1NHC9zYbW7gLeVwcrWFuRoqiOWVDm8ReaHuiwattvRjgGgsbZxlbWQ59eAE8ejvgKSB8xspDhE4fFbpKTdSAAY4BIWS4ZmhC7tFmkh+FBlkAUZZiycTDpAy7Ordsv4+xT9Uge7z6V/T7XydDmi6IwrZDgKEkYVFSXRNeZKLkd+d5eYzSIVUgY79PBAACiq59be6f5tE1n5vMPxGT4B4Q8NWesROsqYK78NV8XRSyveVClKqlIEXFMVAvBTYMfu0tCPw/d2yAzeNj13CJLs/mVHoHixb3hfpZPQxYB3rWhWsVA8yFC3VBYkh5wwK6e+0Z+3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AtDp2LM+nS3gcYzkfoE3b59zdiir11Lx+bhpl0XuDdo=;
 b=4cBmkFiy4w1EZQmMDlsmkkjGwpgbah4lrpeRXjZWxS+mWTOLqVeIyaCNJa5zDz3GvdctvGPtul5u4rnxzA/DwSEWnC5Sq6TL4UhCyMAdxWHv2v1evj1Bdbai0ryythPpmk/2hUioS1Z7pos4gJj3Xob8g1AvQTMQJxU4yxSasv3lbL3JWpR0al4vTNQx/Tx8EaeXBQO9hFru3k9+/PEEmTCqwALA18rZPnLAxIFLN+Zm0PHbhJSaOZOtsQagUd9rhm5OiidlVsE8/CXgdXdfUQxD9TZoFfhgHxRrW+cj20qD0NihwV8txMmXW4cxqELhQNlxd9MHkxgEsbt4ist75Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <059882ea-3e42-f74d-83e6-2f809d0993cb@suse.com>
Date: Thu, 19 Oct 2023 12:32:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v7 0/2] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1691507564.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <cover.1691507564.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0157.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PA4PR04MB9461:EE_
X-MS-Office365-Filtering-Correlation-Id: 79d5858e-fe03-47b7-0e9c-08dbd08eaddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	n45TbIejRgo/o/4446Bhfaf0L+oFklpI80i92Yh5bfM1K2xISe3SpegxrLsxsmbeFOgw6PLyacYDgvD3xsOWfUAlxuIFIXAU5VWHMBOalUc1tTn6eNy5Yhjf/WWu/eJ8kdbwcOANXaQLgc2AGhHuvO0fTIgtojOwKlOpATfQ7CugOpaEF9Qhwk53FZ/9iHeZR5BfGpmsfNLQh3cd+LwOknERCmGyc3nuDJELgxwInqRL6kXUVagVVN1ttISuF7mA5d60pc8byVoMWinTsWkaqrsZdfvB2U1uqY9r6TAkEJjE9OqzNZw6L+HxSsdDZt2ic8GlrBDQdJSsR88i5IwfXjmxKRNDZngNoydqgvYNSOc2tE/wAzpTflYuaynasJLppYBQG/Kjk+lvW4tPieHOiaL+0t7ugA2z3vlIdw/dlGxBAjbiW7+cl+vC/SwliZwctBQG8tJmc3Fxs0B9+KWl3gP/aZV94sIPZe8JXmcK37ddTHgdXk8BW95iWQdVL7nWFEtqzw4xcDRx3i0OYsfsnkUweqRWVw2Yxl2dz5rGwiDyQUlC0sj+/3tpkszWL0O/bAKaHUjZ8pAvm+Cr3D9q3njBQeHY5i5u3czgoXynYqtOcf9WYGe3DKo2MhiBv6hFO1956rVrMNoyx4WxbR7lXw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(396003)(376002)(366004)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(54906003)(66476007)(316002)(66946007)(66556008)(6916009)(966005)(6486002)(2906002)(31696002)(41300700001)(478600001)(8676002)(8936002)(5660300002)(86362001)(2616005)(26005)(31686004)(4326008)(53546011)(6506007)(36756003)(6512007)(83380400001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVEySS9BV25nMTFyWjRQUjVydER3azd3TE0xaWduQkY3bkxxNGluWTF3NVlW?=
 =?utf-8?B?cUlEK2szWklKc1o5QThPNFdTSk1KN2p1K2VnRUxJZWdxdTRlYk40Y0xVY3hz?=
 =?utf-8?B?TmRVYzcrOUlBUEpiOXc1OUlOM3dXV3NwWVNhNnE1bElXSUtxb1pmMUFsd3FY?=
 =?utf-8?B?N2FsYnpXZlY4N0M5SEIyL2cxS1VYQ1RTTWdibTRaOHRiRFpKa1RpOUdrUzI4?=
 =?utf-8?B?WmZXa2JtV25jMEk5NVpCUGJkSkF0Q1JwUWdjYVoxMHljTDhwK2lGM2FFRGZV?=
 =?utf-8?B?MGlNYUdxUFdkaVFxZW5NZ01Ybk5IOW81dG1XZ0VwM0xNdU1vTHBOQU1UNGZr?=
 =?utf-8?B?eFFzYU9QT3FXMEhXOUpCblA4MDBjWWZCRVlzaWZjNXJZUno0N3hTU3RnQTha?=
 =?utf-8?B?TDUrcmpkS2VscmpUS2Fwd1dyTHF4bGJ2U2xodUgwdlpsM0tMS0lFNGFlSlE4?=
 =?utf-8?B?NmFlWW9ETHZVQ21UNmhxS1ZWVEYzVFU5bDliR0w0aTRPZ0JXaEJiUEN2bFQz?=
 =?utf-8?B?R1hwRDVTOTFoZTAxU2loTlVJV0RIMjVIRktFa3kxT0twbUhXUS84Q085c0Ey?=
 =?utf-8?B?d015bms0VmIvLzRTUU02UnhsVXJ4dmp0SGJDTU9FTmdUWUtxai9LKzQ5Y2ZF?=
 =?utf-8?B?NEZUdU1IejdYdXJwdUJWZ1NjTVRmOWVpSFg4QzVlWmlGaE9xWkNwRmp3Tlph?=
 =?utf-8?B?SS9YOWZXazdyWVl6Q0Z1OVJnTUZmdEkyOTBlVCtwS1grSGFJcytLRk9sQklo?=
 =?utf-8?B?SXFjUGpMZ0dzV1M0ZWVNaS8rV2hsODd6S2Mwd3A0R1lqYmhNd0JuNlFTdzZO?=
 =?utf-8?B?c0dSMkhaS2ZNc3Y0aUFkU09tdU1YdWs5elRycU1pbWlQdThLR1FHWU03ZGRU?=
 =?utf-8?B?WFJZbVphOGJZTVhqMjhnRGtsb0lRVEczd1lzRkVocnQyNW1ER2NTTDd2TnZK?=
 =?utf-8?B?NURjbWRJSklJeENZZllGd09yMDkxdUcvdFJaREpOckFvcFZrTENXbzlNZkxo?=
 =?utf-8?B?NVRka0ZkYjJtdVZMUUQ0cDFxb3E2ekdZbHhsdGZuOWtKZGEralpDYTFPWUta?=
 =?utf-8?B?RWZUMjFkZUFpU2xhM3REclVCRzRvYWdVbUlTdk1XOENTblRpNlJTMlNkYUtL?=
 =?utf-8?B?Y1d3Mkw1cENDdXZiZExSQk5TNkZBMFp4VDFvQmpsSnMrZXdiVjBkZkd3OGhG?=
 =?utf-8?B?NzlYNG81ei9yNHBwTlNoWWNUTktzWHlabzBTTUFBbTJkM1VwVWNTQTkvTTIy?=
 =?utf-8?B?U0lVMWZ3K25Za0hPVXNZYzhzWE40V0ttZWMyZWFJM2F6aDdSWXhGb1diSTls?=
 =?utf-8?B?T205cmRObi9SUXpyTjlaUVZTN0tib3dsWVhUQ09JbzhhYkc1T2VIZTFubEV3?=
 =?utf-8?B?SHY4bzVzMzlNdzZxZWowVmJoOGJPSmxYekVFa3F2YzBYamUxTGVuZ0llNDJv?=
 =?utf-8?B?MVQ0QTRYSEhXVGNUQlRZdGptaHhlQXdnSWRwZlQ5dTlGWGVjVlMxWlY0NzBL?=
 =?utf-8?B?a0NQcDdHZmlMd3ZFdGNCeHRPUmxFckd3OFB0VFBvUXdxTlNUeExxNXNnZUlm?=
 =?utf-8?B?SkpRdUloL1dSSVpjTTc1eEdCbE5JaFhWeDNmanNJSHdlUjN5Q2Z3NTkvQVFu?=
 =?utf-8?B?bkFmQ05hUkdGLy80aTlXOGFybFA3NWFhY25HZ1dXZEZzK1FFTWxIVVZkNTlY?=
 =?utf-8?B?Ky8zYm5RTVhCaFhxU3lhQ3JoaWd4SEtrY1h6Ym5ISHhPa3oxY0wzbkpuSVhp?=
 =?utf-8?B?R09pWnVRWFhRWUxnSHo1ZkRJTm9oeTM4K1RueHRMUkRCckN6SGVaVzJEZGpt?=
 =?utf-8?B?Rk90ZUVmQXlFazFpdTBZUlh6bDc5S0dRNGNOWE5LY1dMZHBnTXEzWU1LVHdW?=
 =?utf-8?B?VVhZMU00SEVmLzJTc0d6MElLSktjMlJyOTkySHJIZ0xYRjVBYlFhczVGZG05?=
 =?utf-8?B?b2s1bjlnanVzbkpGemVJYlRtcURSR2J3ZkNuVmxBdW5VemViWVZoNTZhVUpw?=
 =?utf-8?B?WTIyNS8vbmxPQTcwdUE0Z21xY1VONWlJTW1wTlFlUUJWc2tteEJ6b2Y3ZGdQ?=
 =?utf-8?B?R28zS3NXMFpwSnNIQ0VmU3pJcmdxVExkdG5FMmRrLzhwRkNpL0tCUmx6UjU2?=
 =?utf-8?Q?Q6dvjUTR3km9oVUvTNLUv/WlM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d5858e-fe03-47b7-0e9c-08dbd08eaddf
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2023 10:32:22.5213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NvxE7zX/Cdc2LAPWVjdBfZ0Jw2cuiduDiCHa3VjyDw5OHR1/oqIXDT4M6bABzKQwGshfe/TEhFpN7Ug8E+nTsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9461

On 08.08.2023 17:14, Oleksii Kurochko wrote:
> The patch series introduces things necessary to implement identity mapping:
>   1. Make identity mapping for the entire Xen.
>   2. Enable MMU.
>   3. Jump to the virtual address world
>   4. Remove identity mapping.
> 
> Also current patch series introduces the calculation of physical offset before
> MMU is enabled as access to physical offset will be calculated wrong after
> MMU will be enabled because access to phys_off variable is PC-relative and
> in the case when linker address != load address, it will cause MMU fault.
> 
> The reason for this patch series can be found here:
> https://lore.kernel.org/xen-devel/4e336121-fc0c-b007-bf7b-430352563d55@citrix.com/
> 
> ---
> Changes in V7:
>  - use srli instruction to be consistent with slli instruction in turn_on_mmu()
> ---
> Changes in V6:
>   - Update calc_phys_offset() after rebase.
>   - Refactor turn_on_mmu() and a way how an argument of turn_on_mmu() is
>     calculated.
> ---
> Changes in V5:
> 	- update the algo of identity mapping removing.
> 	- introduce IDENT_AREA_SIZE.
> 	- introduce turn_on_mmu() function to enable and switch from 1:1 mapping.
> 	- fix typo in PGTBL_INITIAL_COUNT define.
> 	- update the comment above PGTBL_INITIAL_COUNT.
> 	- update prototype of calc_phys_offset(). now it returns phys_offset.
> 	- declare phys_offset as static.
> 	- save returned value of calc_phys_offset to register s2.
> ---
> Changes in V4:
>   - drop patch 	[PATCH v3 1/3] xen/riscv: add SPDX tag to config.h as it was
>     merged to staging
>   - remove definition of ARRAY_SIZE and ROUNDUP as <xen/macors.h> was introduced where these macros are located now.
> 	- update definition of PGTBL_INITIAL_COUNT
> 	- update the commit message for patch 'xen/riscv: introduce identity mapping'
> 	- update the comments in head.S
>   - update the algo of identity mapping removing 
> ---
> Changes in V3:
>  - Update the patch series message.
>  - The following patches were merged to staging so droped from the patch series:
>    * xen/riscv: add .sbss section to .bss
>    * xen/riscv: introduce reset_stack() function
>    * xen/riscv: move extern of cpu0_boot_stack to header
>    * xen/riscv: add SPDX tags
>  - move save/restore of a0/a1 registers from patch 4 to patch 2 ( numbers are
>    from the previous patch series version )
>  - add SPDX tag in config.h
>  - update definition of PGTBL_INITIAL_COUNT taking into account identity mapping.
>  - refactor remove_identity_mapping() function.
>  - add explanatory comments in xen.lds.S and mm.c.
> ---
> Changes in V2:
>  - update the patch series message.
>  - drop patches from the previous version of the patch series:
>    * xen/riscv: add __ASSEMBLY__ guards". ( merged )
>    * xen/riscv: make sure that identity mapping isn't bigger then page size
>      ( entire Xen is 1:1 mapped so there is no need for the checks from the patch )
>  - add .sbss.* and put it befor .bss* .
>  - move out reset_stack() to .text section.
>  - add '__ro_after_init' for phys_offset variable.
>  - add '__init' for calc_phys_offset().
>  - declaring variable phys_off as non static as it will be used in head.S.
>  - update definition of PGTBL_INITIAL_COUNT and the comment above.
>  - code style fixes.
>  - remove id_addrs array becase entire Xen is mapped.
>  - reverse condition for cycle inside remove_identity_mapping().
>  - fix page table walk in remove_identity_mapping().
>  - save hart_id and dtb_addr before call MMU related C functions
>  - use phys_offset variable instead of doing calcultations to get phys offset
>    in head.S file. ( it can be easily done as entire Xen is 1:1 mapped now )
>  - declare enable_muu() as __init.
>  - Update SPDX tags.
>  - Add Review-By/Suggested-By for some patches.
>  - code style fixes.
> 
> Oleksii Kurochko (2):
>   xen/riscv: introduce function for physical offset calculation
>   xen/riscv: introduce identity mapping

Acked-by: Jan Beulich <jbeulich@suse.com>



