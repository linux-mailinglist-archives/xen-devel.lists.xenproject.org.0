Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F41A56A45A7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 16:13:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502699.774604 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfB8-0003TD-KF; Mon, 27 Feb 2023 15:12:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502699.774604; Mon, 27 Feb 2023 15:12:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWfB8-0003RI-HG; Mon, 27 Feb 2023 15:12:38 +0000
Received: by outflank-mailman (input) for mailman id 502699;
 Mon, 27 Feb 2023 15:12:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=10za=6X=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pWfB7-0003RC-Al
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 15:12:37 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2074.outbound.protection.outlook.com [40.107.7.74])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a54d616-b6b1-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 16:12:35 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB8PR04MB7033.eurprd04.prod.outlook.com (2603:10a6:10:125::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.28; Mon, 27 Feb
 2023 15:12:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.027; Mon, 27 Feb 2023
 15:12:06 +0000
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
X-Inumbo-ID: 2a54d616-b6b1-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gzXTup+AiO2r3seL0Sj6MPcr9JKeFEo+XHKYmqAcfYSU2DtrYI9tIcYRVrYMffyjsD3zL7F70KxmKI1/9IrppqRC7ZrCt/P10c27jZ+H2CGMwc2E3Zh+tc9RkPndMr3IrMEo91WFPhwCTHjCzKDTKYqoDdhCytWeVauPbz0LfgT8wlolnGo7ZLr9vLE1jjGLYmkfwivJ1t97FtXZG5y7TUrB0JNebgOutTDCDc6rfhoei95vZPEfqL6uCp0p/23PpK7AF1WSFBsKBRPejxLQoWpWN2QTI9LowUDI/li6pRsI9iM/NOfU7Jqg1pyrEvLvUTacigesafb+0HxXyDPtoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=thipQ+7g6tRxAePPGRBmtb4i0eicBgj4YL/e3xZ826o=;
 b=WgFDNe0l1pOvR7JLU4wBXv8Vw51RpVwMckZZ3nHcIxpfTFiaSXm9RzOpshzy/k6CHMyFqwN4qoqPOnGTWWelGR8Wiv5mganQZ67aS6vRAwmNY8LCs8TLYWWD1zp5kC6ghvSRKm4UV+IvUnd5tCieG6Rsgq0C9Qxbdp16m4pPY2Bo3Mb1AkNjiMt+HelxGJ3xhow9WuqDwbXiTrNdNOPHzpu26XEJfRoodyXk1yXWnmxouDUAl7xuYfjuoOXWrBJnLv+bCL1lv9Myydhnb39d1vBUxD1YLeLRRrqfKXRGCCWlK78nyRW+sH5Ml7p4Z04EtsN/+HGRS04O9aPZTt38HA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=thipQ+7g6tRxAePPGRBmtb4i0eicBgj4YL/e3xZ826o=;
 b=bvU7ZTiYjlsBBrhSCE1qiGK3AFjo8/VBTcAVnqUZvI42deTrb0D8/6v6CSH1M0h36YL1b8nUv6MhVq3otnRQ8we7N/XHBI/qmpCulpXBvSDs0AvmuV/Y3cjISoU/2ek/6YBhUVTkPFiDjbSHdyU7YObJJx0i4WAJBhUItyKxuLiMj4ER9jIQG+cAeL/ZGFcoc3BjAEQNzNSNutu7tX3B3t3TtIOjEOwUMu2uhIY6OCfXfK0hY5bVfzHCt6x/5CXENXw/TxIlAUrYUBY1f0b2vS2Ngm9fbaI6J/l3u1OqRWilWhLsCfN5vih29kVtHd8UwG2k+EpzSrneEpnQAJpmKQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <fcd149ee-b95e-4488-c1c1-c2122843fa5b@suse.com>
Date: Mon, 27 Feb 2023 16:12:05 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1677250203.git.oleksii.kurochko@gmail.com>
 <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a145fbbfb166d9f6bd4859b669d23a1f52004b2b.1677250203.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0045.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB8PR04MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 3eb505af-308f-4776-5353-08db18d4fccd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J3QgeegCp+8F1soHV5DSTSYroMBVNa4gg6y8+wj8A3J5YFGaSyxCVaxbn31pjGy5DLn0q4sNtdCwp2ztddKsC4WSJxJ2hVGZC9Bvii490d0R0diedWN2RWYax7YDt+fmDhLqzQGJJrOyuG8iI00hQJ/TR4ij2719K3VfoW7HQqEcGdfqy08YigtM5Lr3+zMcekYdMTdWa6j9Eqw0zn64TL9xzxQPanKeGuN6///Cxv0A9MULO4F/w6g5Z8RnuKY6us/JnbSOdUcQLviU28WtcN1Mn5qEatoq2SE1qNEJRGBbeLjkq6VBqAoJ5EiYhsALlsp40kjn/8n1pVgVakE9Z3bUnz2xIKy698paeXFlhA3zkqJ3QaohE/fjpjRdRVBYM/9ln8HZBnHgY11teggKDg+odh7CI7Gk/eETVDpznkwwb72unakFYOXPJSuEHe4KnEqZgGM7Lh1BI5PW69sObhuMYiLqUdYpQ/7INe/LHp96vowU0712hhufm+AgBn4HAENt108eU5QYjI/rf4wl3wy003C93CBTWXiGHfiunbFmF7T+2fT15aRYott7fv2iT8DLRIguZ2AfLsQt5JPKljxR+t/qTKch3lpnteA6oaQ58U0G3Hg2u0vbykip7P2cRPM6xrye0MM4X+Us22Otm4E6YMOGdc5G3jV0aPYAjf+dpksH3MbVThWIDMJDXqch2EUr2Rjjdw9kpSiFrpm9Wyeo3s4jHSsPK8pX+lpYqsM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(396003)(39860400002)(346002)(376002)(451199018)(36756003)(8936002)(5660300002)(66476007)(6506007)(53546011)(6512007)(38100700002)(26005)(83380400001)(186003)(2616005)(86362001)(31696002)(41300700001)(54906003)(66946007)(316002)(4326008)(66556008)(6916009)(8676002)(6486002)(478600001)(31686004)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qm0yazVzekJ4ejhicGxkTkk3YlUvM29LVm1UbG1MUHJScnlmMGdzWmRJZE9G?=
 =?utf-8?B?QmdnZXI1Ui9UT0I3RVFOeHVSRVdmeW9pdUFuUlVER0tXOVhiZVdWY0h3SGVZ?=
 =?utf-8?B?OGVaUzlXYk9iaGpUMkR5aU9EOTFrNWE3V2gycWdNVDdhUU5LK0hadk9uNHBq?=
 =?utf-8?B?V3JUdW92NjQ1N2oycHBoNlE0eHVNK2JwSUh5dU5LYmxVWkprSERIYVNlbXhw?=
 =?utf-8?B?NGRVR1FxZG1ZbXdGR2h1VDA4Nmd6dHVPZDdjZDRHZENWVGJQWk9RYXZCWWY3?=
 =?utf-8?B?bE50SGVUOGJObGxmTldrYVd4MVdvSlNORVZmOXQrNVBRMW5iR01KaVkweTQ2?=
 =?utf-8?B?Z2lFMktxOVRWOWhTSjkxYmNIa0xuTzg4QTV1M0t1N2ZXZUdMbEd4WFVLbGVz?=
 =?utf-8?B?VEhIdCs2SGJodmFtdjJIS0tmaVhtRmxJNkg2alh4azBGOHNJcVRJNS9DMXR2?=
 =?utf-8?B?c0hlampnV0pLRHZhT1pocnhUOEl1VmVuUFQ4RTJjQm1Qd25iVWh6WmNXZjU5?=
 =?utf-8?B?VStGY1FleEt5a3FOaiszdENDWERUV1ZsbkFyRE9LdUNLVi9wMTB6RjFrMmFO?=
 =?utf-8?B?dnJnZnhGS2YrZzd2YW53SGN3cFc0TkpZUHZQN2crWWVlYWlrcnprdjJDMlRp?=
 =?utf-8?B?QU9uVFZCWmpmVHB3WWxuZTcwRkxJN0JkdEpZSGdNVzhqTHU3eHdBWkEzSysx?=
 =?utf-8?B?bmdMZW9CQXR6ekp3U2ZTN0tXRHNZUWZKZ1hRREd5VVFqbnNlMHVyb3Ztclh2?=
 =?utf-8?B?RnkxNHh6U01GbnNHK1FqWm4vVlcrZGhTQUQxNC9RQjVINFNnbjViNis5VFRh?=
 =?utf-8?B?UEd0akw5Vno5ZGFVRlF1ZjA0RWZHTFBxdWNiTU1FSW1rVEMyeVB2MGhDUlcv?=
 =?utf-8?B?cjBpQ1FzRGNmY3YrVDFTMWFQVGE1YjlaeHQyYUliK0U3VjFUZ2w2aW9KTmRm?=
 =?utf-8?B?SjJtSFN6T0d6UXRTVzV6cmZIRkdVbTYrQmVXN2h6VENDQVQ4a1BUVjVORUNl?=
 =?utf-8?B?T3NmWThhVkRTNUpoNk5SeWlKeDg4SHh5UnBocGZTUUJLQmFyZVBnVFlOclht?=
 =?utf-8?B?S0MxbzFVNllZSnROVTYrczZIOE5PZ2U0ZklOajdVa21ISXNzNzdRQmJJLzZ5?=
 =?utf-8?B?cFpYRUg3YzhxblVmQVVYR3dNUnNzZXVFL01jaktISFRuaGRmM3hUcVByR1d2?=
 =?utf-8?B?Wk82STNzeFFuOVFqaitJL3pUR1VoeUhVNHVVWGhKWUc4WUJXK21vQVFPWTBt?=
 =?utf-8?B?WjlkM2UwTEMrMXh5U2N1dHBJZ3lYRkErSU9PTHhjV0NKaEp1bXVpSHZEdnd0?=
 =?utf-8?B?NFpIa3lBbmlGejgxLzNRdWYwczVpTXhuQTRHVUlma1Z1OFFmVUFTNHpYK0JG?=
 =?utf-8?B?ck5CQzcrQ05BVzlVUzhhejhOcG1SUDJxaDE5QldUV0FOQVhldTBUcCswYjhR?=
 =?utf-8?B?VzJwdXJYSS9KREZBdzZNUjZLOWloS0ZTWnhkWkNwaGppUldJU3B0VE9CVTlS?=
 =?utf-8?B?OXRuZzNiS0hFL0RNRndhMkxOVjVOYWhSTHpqckJ4WGR1czBLMUdrcDZNWXdB?=
 =?utf-8?B?RzJVbC9YT0wreVNOaU9JbkhGZlg2L0YxOHZwZmJJeWsvemxobCttRHdCQ3hG?=
 =?utf-8?B?dmxkRUNEbVNTRHJGc3BZSW5ycDRSNVpqYlpPQUlsbWN4SDFPK3M3QTFxY2U5?=
 =?utf-8?B?eVdZTllRd1NWS0RiUTRaMVppdDltWElpVmsrMng2QnRTU2NGYmRlSmZSS2lV?=
 =?utf-8?B?WWVxUkd5S3hhTWdCNHFpa0x4VGhpUmdGYnQ5bW9uTGdpQnBtTGxpVHlidG81?=
 =?utf-8?B?QlJaTkkyb1N0N0FFWUtyYitmM2pQU09PTno5RWdlaTBJY1JLRHc3L1R3dnlh?=
 =?utf-8?B?U293Rzg1SE1YMW1PUVJpWE1COGtBRHQ0ei9xU2Q2VXF2Y2k4bGQwZUMzQ3NO?=
 =?utf-8?B?c2hMTHc0QUI4Z0l0emZGUkZEZ2hNT2dBN2k0VWNrYU53Mk1MYUEzdEthenda?=
 =?utf-8?B?azN0V1l1WHZGeExOQU9OS013TkJlVkFMNlNIdjBoWm5tc2dhSmdZNnZLMlBT?=
 =?utf-8?B?Q1NPbXhvNGhzZ1N6N0ZERTdSU2l4VU1rbE1WSFp6Y1ZDMU1TUDkyYk1ReVcv?=
 =?utf-8?Q?GHTWtgSZbt2S5gKYe/L/WLZEr?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3eb505af-308f-4776-5353-08db18d4fccd
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2023 15:12:05.8692
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XHINMP3T8QIoQ0A6C8v7mpg9u13qZfenHLXWQmtUHxSInHgS7zLwjvuoltW+rJH97RLas/T23Xl8OI95Y4FAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7033

On 24.02.2023 16:06, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,90 @@
> +#ifndef _ASM_RISCV_PAGE_H
> +#define _ASM_RISCV_PAGE_H
> +
> +#include <xen/const.h>
> +#include <xen/types.h>
> +
> +#define PAGE_ENTRIES            512
> +#define VPN_BITS                (9)
> +#define VPN_MASK                ((unsigned long)((1 << VPN_BITS) - 1))
> +
> +#ifdef CONFIG_RISCV_64
> +/* L3 index Bit[47:39] */
> +#define THIRD_SHIFT             (39)
> +#define THIRD_MASK              (VPN_MASK << THIRD_SHIFT)
> +/* L2 index Bit[38:30] */
> +#define SECOND_SHIFT            (30)
> +#define SECOND_MASK             (VPN_MASK << SECOND_SHIFT)
> +/* L1 index Bit[29:21] */
> +#define FIRST_SHIFT             (21)
> +#define FIRST_MASK              (VPN_MASK << FIRST_SHIFT)
> +/* L0 index Bit[20:12] */
> +#define ZEROETH_SHIFT           (12)
> +#define ZEROETH_MASK            (VPN_MASK << ZEROETH_SHIFT)
> +
> +#else // CONFIG_RISCV_32
> +
> +/* L1 index Bit[31:22] */
> +#define FIRST_SHIFT             (22)
> +#define FIRST_MASK              (VPN_MASK << FIRST_SHIFT)
> +
> +/* L0 index Bit[21:12] */
> +#define ZEROETH_SHIFT           (12)
> +#define ZEROETH_MASK            (VPN_MASK << ZEROETH_SHIFT)
> +#endif
> +
> +#define THIRD_SIZE              (1 << THIRD_SHIFT)
> +#define THIRD_MAP_MASK          (~(THIRD_SIZE - 1))
> +#define SECOND_SIZE             (1 << SECOND_SHIFT)
> +#define SECOND_MAP_MASK         (~(SECOND_SIZE - 1))
> +#define FIRST_SIZE              (1 << FIRST_SHIFT)
> +#define FIRST_MAP_MASK          (~(FIRST_SIZE - 1))
> +#define ZEROETH_SIZE            (1 << ZEROETH_SHIFT)
> +#define ZEROETH_MAP_MASK        (~(ZEROETH_SIZE - 1))
> +
> +#define PTE_SHIFT               10
> +
> +#define PTE_VALID               BIT(0, UL)
> +#define PTE_READABLE            BIT(1, UL)
> +#define PTE_WRITABLE            BIT(2, UL)
> +#define PTE_EXECUTABLE          BIT(3, UL)
> +#define PTE_USER                BIT(4, UL)
> +#define PTE_GLOBAL              BIT(5, UL)
> +#define PTE_ACCESSED            BIT(6, UL)
> +#define PTE_DIRTY               BIT(7, UL)
> +#define PTE_RSW                 (BIT(8, UL) | BIT(9, UL))
> +
> +#define PTE_LEAF_DEFAULT        (PTE_VALID | PTE_READABLE | PTE_WRITABLE | PTE_EXECUTABLE)
> +#define PTE_TABLE               (PTE_VALID)
> +
> +/* Calculate the offsets into the pagetables for a given VA */
> +#define zeroeth_linear_offset(va)   ((va) >> ZEROETH_SHIFT)
> +#define first_linear_offset(va)     ((va) >> FIRST_SHIFT)
> +#define second_linear_offset(va)    ((va) >> SECOND_SHIFT)
> +#define third_linear_offset(va)     ((va) >> THIRD_SHIFT)
> +
> +#define pagetable_zeroeth_index(va) zeroeth_linear_offset((va) & ZEROETH_MASK)
> +#define pagetable_first_index(va)   first_linear_offset((va) & FIRST_MASK)
> +#define pagetable_second_index(va)  second_linear_offset((va) & SECOND_MASK)
> +#define pagetable_third_index(va)   third_linear_offset((va) & THIRD_MASK)
> +
> +/* Page Table entry */
> +typedef struct {
> +    uint64_t pte;
> +} pte_t;
> +
> +/* Shift the VPN[x] or PPN[x] fields of a virtual or physical address
> + * to become the shifted PPN[x] fields of a page table entry */
> +#define addr_to_ppn(x) (((x) >> PAGE_SHIFT) << PTE_SHIFT)
> +
> +static inline pte_t paddr_to_pte(unsigned long paddr)
> +{
> +    return (pte_t) { .pte = addr_to_ppn(paddr) };
> +}
> +
> +static inline bool pte_is_valid(pte_t *p)

Btw - const whenever possible please, especially in such basic helpers.

> --- /dev/null
> +++ b/xen/arch/riscv/mm.c
> @@ -0,0 +1,223 @@
> +#include <xen/init.h>
> +#include <xen/lib.h>
> +
> +#include <asm/csr.h>
> +#include <asm/mm.h>
> +#include <asm/page.h>
> +
> +/*
> + * xen_second_pagetable is indexed with the VPN[2] page table entry field
> + * xen_first_pagetable is accessed from the VPN[1] page table entry field
> + * xen_zeroeth_pagetable is accessed from the VPN[0] page table entry field
> + */
> +pte_t xen_second_pagetable[PAGE_ENTRIES] __attribute__((__aligned__(PAGE_SIZE)));

static?

> +static pte_t xen_first_pagetable[PAGE_ENTRIES]
> +    __attribute__((__aligned__(PAGE_SIZE)));
> +static pte_t xen_zeroeth_pagetable[PAGE_ENTRIES]
> +    __attribute__((__aligned__(PAGE_SIZE)));

Please use __aligned() instead of open-coding it. You also may want to
specifiy the section here explicitly, as .bss.page_aligned (as we do
elsewhere).

> +extern unsigned long _stext;
> +extern unsigned long _etext;
> +extern unsigned long __init_begin;
> +extern unsigned long __init_end;
> +extern unsigned long _srodata;
> +extern unsigned long _erodata;

Please use kernel.h and drop then colliding declarations. For what's
left please use array types, as suggested elsewhere already.

> +paddr_t phys_offset;
> +
> +#define resolve_early_addr(x) \
> +    ({                                                                          \
> +         unsigned long * __##x;                                                 \
> +        if ( load_addr_start <= x && x < load_addr_end )                        \

Nit: Mismatched indentation.

> +            __##x = (unsigned long *)x;                                         \
> +        else                                                                    \
> +            __##x = (unsigned long *)(x + load_addr_start - linker_addr_start); \
> +        __##x;                                                                  \
> +     })
> +
> +static void __init clear_pagetables(unsigned long load_addr_start,
> +                             unsigned long load_addr_end,
> +                             unsigned long linker_addr_start,
> +                             unsigned long linker_addr_end)

Nit (style): Indentation.

> +{
> +    unsigned long *p;
> +    unsigned long page;
> +    unsigned long i;
> +
> +    page = (unsigned long)&xen_second_pagetable[0];
> +
> +    p = resolve_early_addr(page);
> +    for ( i = 0; i < ARRAY_SIZE(xen_second_pagetable); i++ )
> +    {
> +        p[i] = 0ULL;
> +    }

We typically omit braces around single-statement bodies. Here,
though: Why do you do this in the first place? These static arrays
all start out zero-initialized anyway (from when you clear .bss).
Plus even if they didn't - why not memset()?

> +    page = (unsigned long)&xen_first_pagetable[0];
> +    p = resolve_early_addr(page);
> +    for ( i = 0; i < ARRAY_SIZE(xen_first_pagetable); i++ )
> +    {
> +        p[i] = 0ULL;
> +    }
> +
> +    page = (unsigned long)&xen_zeroeth_pagetable[0];
> +    p = resolve_early_addr(page);
> +    for ( i = 0; i < ARRAY_SIZE(xen_zeroeth_pagetable); i++ )
> +    {
> +        p[i] = 0ULL;
> +    }
> +}
> +
> +/*
> + * WARNING: load_addr() and linker_addr() are to be called only when the MMU is
> + * disabled and only when executed by the primary CPU.  They cannot refer to
> + * any global variable or functions.
> + */
> +
> +/*
> + * Convert an addressed layed out at link time to the address where it was loaded
> + * by the bootloader.
> + */
> +#define load_addr(linker_address)                                              \
> +    ({                                                                         \
> +        unsigned long __linker_address = (unsigned long)(linker_address);      \
> +        if ( linker_addr_start <= __linker_address &&                          \
> +            __linker_address < linker_addr_end )                               \
> +        {                                                                      \
> +            __linker_address =                                                 \
> +                __linker_address - linker_addr_start + load_addr_start;        \
> +        }                                                                      \
> +        __linker_address;                                                      \
> +    })
> +
> +/* Convert boot-time Xen address from where it was loaded by the boot loader to the address it was layed out
> + * at link-time.
> + */
> +#define linker_addr(load_address)                                              \
> +    ({                                                                         \
> +        unsigned long __load_address = (unsigned long)(load_address);          \
> +        if ( load_addr_start <= __load_address &&                              \
> +            __load_address < load_addr_end )                                   \
> +        {                                                                      \
> +            __load_address =                                                   \
> +                __load_address - load_addr_start + linker_addr_start;          \
> +        }                                                                      \
> +        __load_address;                                                        \
> +    })
> +
> +static void __attribute__((section(".entry")))
> +_setup_initial_pagetables(pte_t *second, pte_t *first, pte_t *zeroeth,

Why the special section (also again further down)?

Jan

