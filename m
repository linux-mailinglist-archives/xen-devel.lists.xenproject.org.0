Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBFA769997
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 16:34:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573114.897501 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTyW-0004Xt-Jl; Mon, 31 Jul 2023 14:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573114.897501; Mon, 31 Jul 2023 14:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQTyW-0004V6-Gf; Mon, 31 Jul 2023 14:34:20 +0000
Received: by outflank-mailman (input) for mailman id 573114;
 Mon, 31 Jul 2023 14:34:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bN9S=DR=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qQTyU-0004Uy-FL
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 14:34:18 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0612.outbound.protection.outlook.com
 [2a01:111:f400:fe02::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 53d3c969-2faf-11ee-b255-6b7b168915f2;
 Mon, 31 Jul 2023 16:34:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS1PR04MB9261.eurprd04.prod.outlook.com (2603:10a6:20b:4c7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 14:34:13 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6631.026; Mon, 31 Jul 2023
 14:34:13 +0000
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
X-Inumbo-ID: 53d3c969-2faf-11ee-b255-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZZh/1ZnLEehFziwE9fmKVNRBhx6IUzM4IYL3V55Rm5VQsK1GxwfQRDLu1TcqZ4rweddcgXDsPK/oguvzuRJKq9G8h43ly3I3+fv1IxCYDUOMqPEs6MaYwWRiaFzz0o2RFkTNYJoYOGgpBQKQ9RS14OGG755Xv2YwEwKdXyHrOqynEBl8XPD/6qWO9owVEf8T2iTr25Ts8UJhGf3vGwm/Zr628izcuYWHQxDRtH2Qvv7ZClDSBrlsPRR5Yk6QuQbw/d0pdvRWcWFglMM9FlsIh1FU0iekqLPpcTQsWY/GJcghid4q/YWgPpNmbFy8K1e+87jPDBUg6xEpnSMNg38Myg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3FX8rbhAcyUryLoKijikT17wPy7qOP35SQufsVcD/gc=;
 b=Qd2qQje2JQdfvc5m3ajUwqceByWCKLpyJsFW/RLxEQdufcBUvOzuVs36Asqxp78CoFeW8zcZUce9UbUbVkR1HTZX/f6BhXx4CzzAE82qayTDeQQp0o4kW0CtXCm6p5v2c9IgGjTwm8ZmCnWKEkXYb+RAD1qG/K9gvLqgZgh9GDFKW5cS/DVhUgbnreLkZouHikc94oBjDTj8N5kK+HoSTWrBN1xsPPxC9OZGlC+E6FYb5NUazaxsz2QjANhlo4cAOCFzyd8YZ4UYmDDOwwwMoIrnMTPk1RQyVxQpG/lOi395y6h9FVBodbWlbGhqx6QhvylY7bl9XzfXEtPoW9bQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3FX8rbhAcyUryLoKijikT17wPy7qOP35SQufsVcD/gc=;
 b=NwUd7K4JBUyQ4UOlyEqvuPEoM7iEYLHGR19gulpJGtaTRewE8grz+xGV4rNFqWk7LUGaf0ui0FUNHpL8y7PFLgiDtcr7+gegapp2GPDbYyoCbV+4FbklF6BH4slRFyXGhG2xQq7RgZsFJT6+z+/oSYXPUBPJahp10py3+iYwuY7Ss33IqjhGGX96nofzCFLl1Z1zrgu3XLSj7DYmkkBbEME6Y8S5A842BnKD6GPjo/QNQ4XBmCZJ/mCuu3IjxwDtx7o6vgUbT1aKi2T5QtPTVsopiDuGL5ZsIjdrxz+srRhi1d8H6Sm5yFT8e/p06B1irUBI3NlfDnkwoRt3YIWnqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f12b9c37-b7d0-ce03-024d-709a7fda7f26@suse.com>
Date: Mon, 31 Jul 2023 16:34:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [XEN PATCH 3/4] xen: rename variables and parameters to address
 MISRA C:2012 Rule 5.3
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1690810346.git.nicola.vetrini@bugseng.com>
 <8aebc67a150cb4116affdd6da755a8e82c827ffa.1690810346.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <8aebc67a150cb4116affdd6da755a8e82c827ffa.1690810346.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0141.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::14) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS1PR04MB9261:EE_
X-MS-Office365-Filtering-Correlation-Id: 196adfc7-bc25-4ea3-fb6f-08db91d33610
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dpnYPN1fyYoOYal+HA/mJW/AHrJmzZTvjZokkKxTeKqiFvXws37ArgQR6gDU/rwACTyB+NyVKn3Tlxjd8H2SUcxWbTvUhGO+PzfGEkLrshM8hVYMtFsR3FPsZUDv3KVnAxEwzPWwuUYgXw8mzyQefQ3jVljoxYlvfEYmCeQJeI87UKNPX7gJ4zF/gQU0p9sDfE40vbyxVPsWc30eo1c+TEnjT+rIQR//IlWZNdRTH4ZUAYwWMx1EbJoX+O2crWCcwx9C6FoprHKa8zp0az65a+E2xyCTpKkqh+FjxrKd2I+18oZVVbZmiNGrVyS1joICoYwkVTFQws957rnmsDEhJt74o1Ix7lyLOYUbiwJWkqMVOo6Ukr24xI+qExrTKOewNaBiVE1NTl2cOHlz2qHBcD9CAAASlebTn5Ve4pfJRgXdNFsYFPpEwF5lfFkfoTRbrsRYMAPPZR0WjTlMt8lZkBlvy0+O4JtgLB8WXzaVOUeKFFkK6VB9EnA4nFWcDySr75NU4c4H5vPXQ9Stw+LJ/awJ9r3W/9lzjqpL9RUtImvpzvvL4O/gkL8GOswuFvkbfS1C2G2Hv8y2BDabRNe20RIXJbYd+4SoUBYuws+PklXkStyezJuYveqAvcf7C57pQNuxEhHN/lDQVE8Um7Hykg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(346002)(136003)(39860400002)(366004)(451199021)(6512007)(6486002)(186003)(36756003)(83380400001)(2616005)(66574015)(31696002)(86362001)(38100700002)(26005)(6506007)(53546011)(5660300002)(41300700001)(8936002)(8676002)(31686004)(6916009)(66946007)(66556008)(66476007)(2906002)(316002)(7416002)(478600001)(54906003)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NC9TM0tBdXZrRDB2aGFKZUNKOHJqbTgvS1FhUmhkbmRqaGFLc2VhNVNNdXlB?=
 =?utf-8?B?aDUwWXBIdnNHZFBIanF0V1VMYWRUd0crQ3VFOWV3WHJuakpZNSt2ZDV1dURG?=
 =?utf-8?B?TlpjQWh5RTRnd1FTOURCZC9GWWNOZzJuNzhkRVU0RENOQnJOREpOMkFnWHgw?=
 =?utf-8?B?OE9mKzhtQ2g1MjVmUTB6UHJyckh3NlRGYTMyTGs2SWJyV0ZySGJWWERtWnFI?=
 =?utf-8?B?TzlndW96REw4dDlRQytIdVpLZnM3aWlkcHQ1UkVqYlZrdTE0T2NFNUQrcDd2?=
 =?utf-8?B?K1AwZHFteDN4cGRHWU1lWFdIUEVuVTE0VjQ5d2xHUjE0dnE2ODdSdlVMVUhI?=
 =?utf-8?B?ZEo2QnN2NFg2V0RvSGtaSkxGdkRLQk83ZHdZZWhucXBCU09KSXpCcEpvMnA2?=
 =?utf-8?B?YmprNC9xL1FXVmEwNWt3eXJ2aW00aWwzMTRvV2hwbWtKNml2a1JSQ1lQeHM1?=
 =?utf-8?B?Rzd0NVBRQ3BLd2I2ZFh1T1pSd0VsUmxWblFxcThoemYzNU1VTzhScUIvUUpB?=
 =?utf-8?B?TFpTWUVHM28yVndRMmxmSlVNc1BPZHBzZDJaOStISmNneDBCQXliQnNQTHBD?=
 =?utf-8?B?TGV2L1Z3b29PN2Z6aktYU2thN3B0eXNtVk8zKzczV2FWbGdIRjBYS1BOYUxx?=
 =?utf-8?B?M1dNemc5Y2JtOVU0eXJVc3JjeE1HaXk5WjNtOC9IYjBHK1haSkVuRVhscmsx?=
 =?utf-8?B?UXhkbGVGem5hWlFpV2xncTd0TWluZEFuRy9QcFUzK1lCdURQeWFjTU50WGRt?=
 =?utf-8?B?VGgyZ0ExMHEreTBLZjM3Z0FIaktkZFQ4VkxGa1dsTDFPR3NheHdxcWVwSGJ1?=
 =?utf-8?B?ekNnYUtqN04ra0ozOFI5bUkwVzJOME84S1ZVS0pTbmdBWXV5a1RZVkwvZVdh?=
 =?utf-8?B?MzBVbWc3OUV4V1ZsUzN5THFDaVpCZ01teDNHOWdtM0hwYWRjdXFEMGVjZ3dP?=
 =?utf-8?B?R3VhV0VjZWxYNTJHMEtoRTd6SXY5dDlnOTZ4djI3aEpEL0FoR2VZcERFUjNv?=
 =?utf-8?B?KzBKR3JZMjdhbm0xaEd1cWdjVVIzMjZaTGZ0WkFNLzdRNTMxdEV6d3ZyOUx1?=
 =?utf-8?B?TmxRekQ2eHpSMFhZMWFXSnJMbXdKd1lRdWswRVVZOWZscERHK01PQ3l4TnVw?=
 =?utf-8?B?UG44YU96RTNwYzJXY1BaVGlPSGMvd3VSeGNlYWJJS05qei9lVTZtbi9KSld1?=
 =?utf-8?B?TmR6VWNubGJWMDBoUDJzcmxZUDBpVUUrS3BWcC9rR0Z3czVzMDg1eGVYMnUr?=
 =?utf-8?B?eXdWVnBKMlIvSkpDSHRhVGlmZG93Z0w1T3VuZzVrdnZpUFM5UDJ2T0NwN3BN?=
 =?utf-8?B?OG9hakE2cUJVV1FvZENpQTdZRGRTK3RzcitvR2x6YzhGZkF4WXNFOTZ3S1hr?=
 =?utf-8?B?ODkzejRYbWJRZjVidnAyZDhZK25NeGhCTFhxK3VGaFVEU25mYVVmc0x6NFll?=
 =?utf-8?B?KzllTjBLWHkrZnBYQlp3d3JmWVo3WEhvRGI1U1NkckhuUEhCZWJYS29aalli?=
 =?utf-8?B?VkVSTEo0UVJ5VEFlUzNuekZIcm9ZNGRHQ2lackZQek5qWHMvaW1wTWVwd1lQ?=
 =?utf-8?B?R1VTSklpanpUbHlGSjNZSE91bFo0VS8vN2hKbEZMbTRYYWVIaWp4T2s5Z1Zi?=
 =?utf-8?B?bGlYKytkVkdiZ3pscVJOTkQvWHlYN3pYWmxva2JCT29KekNUL2FzSUtVcjQz?=
 =?utf-8?B?WG91RzBsbHRtQnlRc0dEeG1pZis1c2Yvb0N6UHhPVE5WTVJVQllPeENuZUhP?=
 =?utf-8?B?SHQvcHJKcWwwMXlwNnRBcE1xNTUyUFllckJ6WjVtd1BZb1dGVkJvMmtYRVNK?=
 =?utf-8?B?akozckNXZm41ZGVXWmNPaFpZTUFqK2d6MHplVUdwdEJKdVIrMTZMb0w0Mk9Q?=
 =?utf-8?B?eFk2bXFJN0tpWndaOWludW5Pb1B2ZiszU2Nvd3FTeW5XLzVhdHByNVhRWkps?=
 =?utf-8?B?dTFnNy9FTk5RUmE1OWdPU0pLbEEzRWJYR0ZZeXFxYXVLNHByTUE1VTZ5ME5w?=
 =?utf-8?B?UTEyMVVtWTN6S2pjZytqanZHVDZjb2ZTZ0w1bGExTGZTUVo0RjJOZzRTU1Rt?=
 =?utf-8?B?Zm13ZHI5dGlFVFVsRWJ3NytzOUNwMVBsNDJnWmQzSmdDNENIOGNpWFhmU2h2?=
 =?utf-8?Q?JHjtMa1MBTDAU8flgzlbci+a6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 196adfc7-bc25-4ea3-fb6f-08db91d33610
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 14:34:13.5587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tyol60DNLLvixHUujPSVXvg9wsg5CJFF9Z70G2+C3XawCpml+CfCIIOTc9HMCeh53wNthiMWpA5NKw9R2ZoObQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9261

On 31.07.2023 15:35, Nicola Vetrini wrote:
> Rule 5.3 has the following headline:
> "An identifier declared in an inner scope shall not hide an
> identifier declared in an outer scope"
> 
> Local variables have been suitably renamed to address some violations
> of this rule:
> - s/cmp/c/ because it shadows the union declared at line 87.
> - s/nodes/numa_nodes/ shadows the static variable declared at line 18.
> - s/ctrl/controller/ because the homonymous function parameter is later
>   read.
> - s/baud/baud_rate/ to avoid shadowing the enum constant defined
>   at line 1391.
> 
> No functional change.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
>  xen/common/compat/memory.c   |  6 +++---
>  xen/common/numa.c            | 36 ++++++++++++++++++------------------
>  xen/drivers/char/ehci-dbgp.c |  4 ++--
>  xen/drivers/char/ns16550.c   |  4 ++--
>  4 files changed, 25 insertions(+), 25 deletions(-)

This is an odd mix of files touched in a single patch. How about splitting
into two, one for common/ and one for drivers/?

> --- a/xen/common/compat/memory.c
> +++ b/xen/common/compat/memory.c
> @@ -321,12 +321,12 @@ int compat_memory_op(unsigned int cmd, XEN_GUEST_HANDLE_PARAM(void) compat)
>  
>          case XENMEM_remove_from_physmap:
>          {
> -            struct compat_remove_from_physmap cmp;
> +            struct compat_remove_from_physmap c;

The intention of the outer scope cmp is to avoid such inner scope
ones then consuming extra stack space. This wants making part of the
union there.

> --- a/xen/common/numa.c
> +++ b/xen/common/numa.c
> @@ -382,7 +382,7 @@ static bool __init numa_process_nodes(paddr_t start, paddr_t end)
>   * 0 if memnodmap[] too small (or shift too small)
>   * -1 if node overlap or lost ram (shift too big)
>   */
> -static int __init populate_memnodemap(const struct node *nodes,
> +static int __init populate_memnodemap(const struct node *numa_nodes,
>                                        unsigned int numnodes, unsigned int shift,
>                                        const nodeid_t *nodeids)
>  {
> @@ -393,8 +393,8 @@ static int __init populate_memnodemap(const struct node *nodes,
>  
>      for ( i = 0; i < numnodes; i++ )
>      {
> -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
> -        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1);
> +        unsigned long spdx = paddr_to_pdx(numa_nodes[i].start);
> +        unsigned long epdx = paddr_to_pdx(numa_nodes[i].end - 1);
>  
>          if ( spdx > epdx )
>              continue;
> @@ -440,7 +440,7 @@ static int __init allocate_cachealigned_memnodemap(void)
>   * The LSB of all start addresses in the node map is the value of the
>   * maximum possible shift.
>   */
> -static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
> +static unsigned int __init extract_lsb_from_nodes(const struct node *numa_nodes,
>                                                    nodeid_t numnodes,
>                                                    const nodeid_t *nodeids)
>  {
> @@ -449,8 +449,8 @@ static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
>  
>      for ( i = 0; i < numnodes; i++ )
>      {
> -        unsigned long spdx = paddr_to_pdx(nodes[i].start);
> -        unsigned long epdx = paddr_to_pdx(nodes[i].end - 1) + 1;
> +        unsigned long spdx = paddr_to_pdx(numa_nodes[i].start);
> +        unsigned long epdx = paddr_to_pdx(numa_nodes[i].end - 1) + 1;
>  
>          if ( spdx >= epdx )
>              continue;
> @@ -475,10 +475,10 @@ static unsigned int __init extract_lsb_from_nodes(const struct node *nodes,
>      return i;
>  }
>  
> -int __init compute_hash_shift(const struct node *nodes,
> +int __init compute_hash_shift(const struct node *numa_nodes,
>                                unsigned int numnodes, const nodeid_t *nodeids)
>  {
> -    unsigned int shift = extract_lsb_from_nodes(nodes, numnodes, nodeids);
> +    unsigned int shift = extract_lsb_from_nodes(numa_nodes, numnodes, nodeids);
>  
>      if ( memnodemapsize <= ARRAY_SIZE(_memnodemap) )
>          memnodemap = _memnodemap;
> @@ -487,7 +487,7 @@ int __init compute_hash_shift(const struct node *nodes,
>  
>      printk(KERN_DEBUG "NUMA: Using %u for the hash shift\n", shift);
>  
> -    if ( populate_memnodemap(nodes, numnodes, shift, nodeids) != 1 )
> +    if ( populate_memnodemap(numa_nodes, numnodes, shift, nodeids) != 1 )
>      {
>          printk(KERN_INFO "Your memory is not aligned you need to "
>                 "rebuild your hypervisor with a bigger NODEMAPSIZE "
> @@ -541,7 +541,7 @@ static int __init numa_emulation(unsigned long start_pfn,
>  {
>      int ret;
>      unsigned int i;
> -    struct node nodes[MAX_NUMNODES];
> +    struct node numa_nodes[MAX_NUMNODES];
>      uint64_t sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
>  
>      /* Kludge needed for the hash function */
> @@ -556,22 +556,22 @@ static int __init numa_emulation(unsigned long start_pfn,
>          sz = x;
>      }
>  
> -    memset(&nodes, 0, sizeof(nodes));
> +    memset(&numa_nodes, 0, sizeof(numa_nodes));
>      for ( i = 0; i < numa_fake; i++ )
>      {
> -        nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
> +        numa_nodes[i].start = pfn_to_paddr(start_pfn) + i * sz;
>  
>          if ( i == numa_fake - 1 )
> -            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
> +            sz = pfn_to_paddr(end_pfn) - numa_nodes[i].start;
>  
> -        nodes[i].end = nodes[i].start + sz;
> +        numa_nodes[i].end = numa_nodes[i].start + sz;
>          printk(KERN_INFO "Faking node %u at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
> -               i, nodes[i].start, nodes[i].end,
> -               (nodes[i].end - nodes[i].start) >> 20);
> +               i, numa_nodes[i].start, numa_nodes[i].end,
> +               (numa_nodes[i].end - numa_nodes[i].start) >> 20);
>          node_set_online(i);
>      }
>  
> -    ret = compute_hash_shift(nodes, numa_fake, NULL);
> +    ret = compute_hash_shift(numa_nodes, numa_fake, NULL);
>      if ( ret < 0 )
>      {
>          printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
> @@ -580,7 +580,7 @@ static int __init numa_emulation(unsigned long start_pfn,
>      memnode_shift = ret;
>  
>      for_each_online_node ( i )
> -        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
> +        setup_node_bootmem(i, numa_nodes[i].start, numa_nodes[i].end);
>  
>      numa_init_array();
>  

I think renaming the file-scope variable this way would be more logical
and less risky (the way you do it it's easy to miss one place without
the build breaking).

> --- a/xen/drivers/char/ehci-dbgp.c
> +++ b/xen/drivers/char/ehci-dbgp.c
> @@ -424,9 +424,9 @@ static void dbgp_issue_command(struct ehci_dbgp *dbgp, u32 ctrl,
>           * checks to see if ACPI or some other initialization also
>           * reset the EHCI debug port.
>           */
> -        u32 ctrl = readl(&dbgp->ehci_debug->control);
> +        u32 controller = readl(&dbgp->ehci_debug->control);

Why "controller" when the field read is named "control"? Perhaps
easiest would be to drop the variablöe altogether: It's used exactly
once, ...

> -        if ( ctrl & DBGP_ENABLED )
> +        if ( controller & DBGP_ENABLED )

... here.

> --- a/xen/drivers/char/ns16550.c
> +++ b/xen/drivers/char/ns16550.c
> @@ -1473,7 +1473,7 @@ static enum __init serial_param_type get_token(char *token, char **value)
>  
>  static bool __init parse_positional(struct ns16550 *uart, char **str)
>  {
> -    int baud;
> +    int baud_rate;
>      const char *conf;
>      char *name_val_pos;
>  
> @@ -1504,7 +1504,7 @@ static bool __init parse_positional(struct ns16550 *uart, char **str)
>          uart->baud = BAUD_AUTO;
>          conf += 4;
>      }
> -    else if ( (baud = simple_strtoul(conf, &conf, 10)) != 0 )
> +    else if ( (baud_rate = simple_strtoul(conf, &conf, 10)) != 0 )
>          uart->baud = baud;

So along the lines of the earlier remark on common/numa.c: Here you're
actively introducing a bug, by not also renaming the further use of the
variable. Please reconsider the name change.

Jan

