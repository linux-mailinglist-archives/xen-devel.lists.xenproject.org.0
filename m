Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7244E7318E9
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jun 2023 14:23:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.549576.858175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9m0W-0008Ri-Ob; Thu, 15 Jun 2023 12:23:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 549576.858175; Thu, 15 Jun 2023 12:23:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q9m0W-0008Op-LR; Thu, 15 Jun 2023 12:23:20 +0000
Received: by outflank-mailman (input) for mailman id 549576;
 Thu, 15 Jun 2023 12:23:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tInE=CD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q9m0V-0008Od-4K
 for xen-devel@lists.xenproject.org; Thu, 15 Jun 2023 12:23:19 +0000
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01on061c.outbound.protection.outlook.com
 [2a01:111:f400:fe1f::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67db3949-0b77-11ee-8611-37d641c3527e;
 Thu, 15 Jun 2023 14:23:17 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB6916.eurprd04.prod.outlook.com (2603:10a6:208:185::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 12:23:14 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.039; Thu, 15 Jun 2023
 12:23:13 +0000
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
X-Inumbo-ID: 67db3949-0b77-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z6ErRZpFH7HK8KM1178UeXbBTWp59C1hLQT1h9QdNRVSXToaomgExFKifz5z5toRgjRG7iHgAvFMTUkRnEUG8cpIwp3dJ5Ack4dJLbkR4DEWNft/YbO92yv6i4BHKGUitVm1PODLiiJNhVqnqTAfs64Ju7Oao6tzTRGL7pUkS4zpvkbbUl+S65RrXCqRvsxZahKem3VaFq+Ncd4FUBLciN0Cug1jWz7u1d+VXFOTgXTEm65pXsvNVKl/Y0wYby1fx3+Z8ex4zaC9OEYr3/xLcVqcwqx/sk2roxnQckh6JNuJZ5Tcs3avz8I65lLXEewTJuuNCmXhn2rd6PBLPdhsqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2QUprFQF0h8870RPvKwiYQmm8QryBFOrTZhglpSVI+s=;
 b=CFkkJgYpWYImAfQAf4E3xAdt7zw+kJ30U/3CesoFHKQM3J9v0c8QsNG+5r1/R7rhiCpMs3Aj1dNSXcGV3FGvGR7+nDlBduKHLjBHoKgVcrhXwWkkZpuMNRy7Xo7Ydi6khbdcTB/oMCtBXIRuz5PtJ63e6fOG8ix13jMozPrurkVCF1UvEUFCdzD4qWnlIV0DlH5Ep4w9J66sRoEQYYuDriX9hay/7PtF3R4CPi/0+MUtvpZsT0Vpd4+0RRegOTUSwgTPsQWtKoFnQlXbOzI61M4VvSlUmddPdSzs0eC4VhmpRzkZeqV4ebspU7b8MMv/V2BSVNF6vDMni2icpz2vtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2QUprFQF0h8870RPvKwiYQmm8QryBFOrTZhglpSVI+s=;
 b=Zw9CGLHtVzK2OlIuwS+W3CVZtOXvGgRcxkM3I0t+Ou1Ly6KAdSlcfrKsjmbBXqjn0OVw4VsNzB7p7Php/qREAisXHmPQwk5YfQmp9Jr09U1rCHxmID5kM8DFFEmzx1l+zlOlODdU6O93anu8o9hHrx6vdSsuwTKoYDIMXX2czS47Bl3tS5ARyg7ZG9UM/h7bCF+KGBJmyPfS/3xQj5SZSD7CImDikL7Z+iYRiCilismF7m9sB9+FgXG8DQnynY+djqnRC0BvqgFIG7TWcL6BKD5WQdjGLYRpbD2yZo+z/fwjCfJrsfU/m91AM1uAOTBholMIInNmTiO6BRiGCS6vew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <50c1ad9f-158e-e7cd-e94a-84e842ffbef0@suse.com>
Date: Thu, 15 Jun 2023 14:23:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH] xen/include/xen/lib.h: avoid undefined behavior.
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <e8e56dc4e45ec79f3e5380544b56c3e0b3b2bcb9.1686824437.git.nicola.vetrini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e8e56dc4e45ec79f3e5380544b56c3e0b3b2bcb9.1686824437.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0079.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB6916:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2bf57d-d907-4731-d694-08db6d9b4a4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O9GNYONH829x7VnADztvpCftL0P8Kl2uwWdSyGpLWBDfJQcWU326J1GV4GdwOCJX/MuxmBWSoN4Z1NyJyIQNB/JBfdsGuSxfwkS+j01191FgG4CY3dRgYFz3Op/oph0GZd7P/dBtf/WBB3bDxbcckjTn/JhCq14+4gGBT4wmOJbZrA7e4KkJfHvD4xmvIxM6/3skba8WKxzF+DGD7GIVniEBASuTNQu2640hMNYE8YiDkv8Kqu22uQZVbTYvVNsfX5hnY+QX3GfCCM4kuysU/Oht3PP8IGWFpUIadsyTjF0CMq8dm+SXxA1qAlVIcHLiYhq0kUJxNe4iypdOKSgRxWPKhNXl/lTl+Vtye+1TylBehv0w8+CCnGfRhlx1tvw2PfGc3tc6lWKU19o9CVzVBEVThI/DgaQMO+Ugdj+nxq4KWEPR5tc7XExYsbNJWfneQOKwm8WItTg37rIce5TXZULJOs5uTlRiKR+FVz9IOCTWnxZS298vvHS319Vpa0Db1EvIu2iQwertyIiALn2KqeyKLsmK8lswxNecjrLvhhunVMYg7lhsP0JI65Fa8fkNticuEoY6O9wd1KNIcR2yL7s7wCBQrM1GhHH+a3+k0hl9hPtEKyrCXgAEQksP3WnUvUGDxNblOV7B0lhUHo8cww==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(396003)(346002)(39860400002)(136003)(376002)(451199021)(26005)(36756003)(6506007)(6512007)(186003)(478600001)(53546011)(6486002)(2906002)(316002)(41300700001)(8936002)(86362001)(31696002)(31686004)(5660300002)(8676002)(38100700002)(54906003)(2616005)(66476007)(66946007)(6916009)(66556008)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dkNUTEo4aVJnaEtoSjZZRUlMcC9aKzI3NzJud2FDTWMzMlNEa0NFdVhYeXJ3?=
 =?utf-8?B?ZUpIMWhKanRDcHlraEgxcHZadjBIS3pTY1hHUDA2U1NEQlU1YlhCUE56SWV3?=
 =?utf-8?B?d2hiUEtUeGppS24wM2pkTFlOcnZrSUNNVmRHbGlheTBRRlRWOVgwWmNNQmZM?=
 =?utf-8?B?cGg1aFBxMWZsYmVXZUZxMWEzSHJPTzBaNGNkR2grc2JEcmhhZU00UXgrT2pv?=
 =?utf-8?B?T0ltTjhyY0czWS85VWJHbzJORzh5akp1a0ZXUk9vdG15MUN0Zm1TcWpKVGdJ?=
 =?utf-8?B?YkR4RVBjVStLcU1NdU9xcTFXWmxLL3piK0orUXF5Q0pSQkl0eVo5dG04bkFk?=
 =?utf-8?B?MnFUT1pWbWJWNkd3RGlnTGRmakZ1TjBJM2d2WWpuVXdKS1FPRWxpWE1kd01Q?=
 =?utf-8?B?c1lhUGtIRmpqUW9MQ2RSMk1ON2R3NEpBVEwvcktvOTl4Z2JQVStWcklqY2sz?=
 =?utf-8?B?ZG5wV0FsR0w0SnBQL3VjZko3dXY5K0libUQ1QW5mbzgwNlllR2txNDhhQWVO?=
 =?utf-8?B?cFZsWUlhNU1Va1lhNklvbnNQMDBSY29yTmdlS2NZLytrYWFKN2I4eW5vVFIv?=
 =?utf-8?B?bVFDdFZEdHZJendtTThNUGpOL0k0TDV6cmM4TE9za3hYVjI1cmFrWFdkd3lm?=
 =?utf-8?B?bW90di9oTTd5SVdrQmNIbi9DT0ZSSU5ZZUFDaEFZaXZWUENDcU0vbG9ERzRp?=
 =?utf-8?B?QkdFN0JKZUxJNDBKTXR1QzBUdEZwZ1Z6RmxyMUdVVXhBWks4d2ZiREZJVzlN?=
 =?utf-8?B?a1BvTjFpc0pmWEp0Q056SmFFNWJFOHlHeGlqdSs3eHlmN2dWb1I1U1FHVWNz?=
 =?utf-8?B?UFRkTHk5d25aOEZ0QU14MHc2TFgvbmZpRDkrNGN1TjMwS2g5M1Q5NjhhK2FD?=
 =?utf-8?B?LzgxNXdKM245R0RCMU5HeFNGTDh6aWFYZDB6UXpXM2xUUXlUeWo3ekxOZVRX?=
 =?utf-8?B?YzlQT2VnbkFWdlprcVJDQkZmYkRsL1BINWdVZ2NWaGJJektwOTJqQ1o1eTNI?=
 =?utf-8?B?VnhQQXFEU0RieVBaOC9WemdUOFJqeERKNWxvbWlJeUo3cHAySnF2RVdiWWtV?=
 =?utf-8?B?WlQ2RGNIUUpIckhXT09mNFc4ZGh5dndEbkdZNFZoalpia2M1WTFscUhIQTZn?=
 =?utf-8?B?ZVlUenkxVkVhOFdOSTh4blplUm9KSzV3bTlCSVJiZ3lTbUdsNHkvcWxTUjJr?=
 =?utf-8?B?b0JwZFk1RFdpUk10MExQMkJGNWR0aGlzODBDMkRJb2Jvd2tkNkFOZ3pxSDJW?=
 =?utf-8?B?YTVVTHVvYjZsemdML2JiYWNvZWc5dmZXNkNuanlCNVVLc0ZCQUhrSzFhR2lp?=
 =?utf-8?B?dis2MjVRb2Q3RlErMjFWMHNxejdEZVQyQ1B0UzZtNlhRQzYyK3kzNkxDV2ww?=
 =?utf-8?B?RWZlSzJxbjRUdHRVVy83NVZENlNxVFRuQ3FSd0h1MXIxM3U2SW9oVWNRZmxU?=
 =?utf-8?B?RjhvUnlJaXBWR1p6VTdmY0hQeVoxc0tOcGZFQnB1enR6OXJYZmxKcnpURHdp?=
 =?utf-8?B?ZzdLQXJJTHBpV2tER2RXL3NNWG9KWkMrYkdja1V5di84Y0lkc0U3RHdXUTFD?=
 =?utf-8?B?OUhkUU55M1RGRlhMb1J3WUx6TkxqSzF6aEFuelJLamlJQlVtRWo2NWduTUpq?=
 =?utf-8?B?OUxoTXZqTHcyNkl6eE5LWDI0b291MlNxeXZjNjRBQU5iUDVwdWdqUXRVQkV0?=
 =?utf-8?B?SVN4b2N6cHZ5NkhOVk0reU5jZ0hpNnptQlhrQTFtclBtYUZmQTRCV2I4Z3RR?=
 =?utf-8?B?WXpuYzBFRnFLSDNaeGl1Vi9YQ091Y2lmWlBMNUNqZlllNFNoMUVVQXhuVzJx?=
 =?utf-8?B?V2V1dDc0ci9jNHM3SFR6UlIzVTh4bGgwZG8xY1kvTS8wcFNrdndzK0hSWWJm?=
 =?utf-8?B?SkpHdGJ3YlFkL3l2RDdubnVpT1BjdkJ3VmtpbndWNTZUR2k2T0xueHI1di8w?=
 =?utf-8?B?cHlNYmkyK2tjaGpuK3V3aUVQZXJ1bkVCU1FBTDV2am1lSGtQRGMrV3lzZHJE?=
 =?utf-8?B?KzZhTlNkU2N5cDNhRDI0U2tnd0lpOWhWK1BmNzhiOG8yY3hxK3d4d0wxL1JS?=
 =?utf-8?B?b3BtRFovNm1jQ1p1Nitqc29ZMEJHbFJmSUN1a043N0NiN2Rxb3ZNWHpWOENu?=
 =?utf-8?Q?5sUQaK4af7aau7SKEPSh+b8uA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2bf57d-d907-4731-d694-08db6d9b4a4a
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 12:23:13.9163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AEkZRSQsjkt+wBcrwjw1Vw/o7TNnDANqdRZfS+c/V9utKayuW18UemlAFfkHo4Pr6g5Bgifj2sDDu3inV6xk8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB6916

On 15.06.2023 12:30, Nicola Vetrini wrote:
> --- a/xen/include/xen/lib.h
> +++ b/xen/include/xen/lib.h
> @@ -40,22 +40,8 @@
>      unlikely(ret_warn_on_);             \
>  })
>  
> -/* All clang versions supported by Xen have _Static_assert. */
> -#if defined(__clang__) || \
> -    (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6))
> -/* Force a compilation error if condition is true */
> -#define BUILD_BUG_ON(cond) ({ _Static_assert(!(cond), "!(" #cond ")"); })
> -
> -/* Force a compilation error if condition is true, but also produce a
> -   result (of value 0 and type size_t), so the expression can be used
> -   e.g. in a structure initializer (or where-ever else comma expressions
> -   aren't permitted). */
> -#define BUILD_BUG_ON_ZERO(cond) \
> -    sizeof(struct { _Static_assert(!(cond), "!(" #cond ")"); })
> -#else
> -#define BUILD_BUG_ON_ZERO(cond) sizeof(struct { int:-!!(cond); })
> +#define BUILD_BUG_ON_ZERO(cond) (sizeof(char[(cond)? -1 : 1]) - 1U)

In addition to what Andrew has said, I'd further like to ask that you
try to first understand why certain things are the way they are, by
looking at history. We did use an array here up to commit c8e857a0aff3,
and if you go there you'll find an explanation why it wants to be
something else.

Jan

