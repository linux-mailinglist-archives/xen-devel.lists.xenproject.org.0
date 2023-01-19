Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC43673557
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 11:19:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480934.745580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIS0X-0001x6-De; Thu, 19 Jan 2023 10:18:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480934.745580; Thu, 19 Jan 2023 10:18:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIS0X-0001us-AR; Thu, 19 Jan 2023 10:18:57 +0000
Received: by outflank-mailman (input) for mailman id 480934;
 Thu, 19 Jan 2023 10:18:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hiH+=5Q=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pIS0W-0001uk-6Y
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 10:18:56 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ac2e3508-97e2-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 11:18:53 +0100 (CET)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by CY5PR12MB6035.namprd12.prod.outlook.com (2603:10b6:930:2d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 10:18:50 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::a3a7:87d9:60f1:7eb1%4]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 10:18:50 +0000
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
X-Inumbo-ID: ac2e3508-97e2-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oCmGmtsuJty04jbFU2513mPnEp25O0RGsaSRUsVcQb6KLFG/ciSAtg9dw+ZVreuhWZhcwKwMMoEqGoc0KUnBgwZKlQHWejoA+K+cIrfj2Lt55gHEdYOv3Zxw9AhtQnkz+rZwacdISDCtACPd5X+vwQJfuxtLh+KN9aKEX937iE6BnIbQHo/wDfPRRnZFYDeBsue2r58VA842xnix8NzbUexBiTHDmSrWM57whA/6lQbQRxtiP8YPwLvMgzfyEpEVqJE52uDDWIF7Oj7VXXcT8idqDtyjAuXhii6LcFqE/dLWCFfDi7bSNeomFo7Tsoi+xCki3FmHR5VhlcYLE9Sf0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bmrHRIayYgdIj+FdqSBY7nSZGN9k60MkhCWIvHM3E9M=;
 b=bWw3ylmIvvzlIoWL0tljuhD6JhPV1aQ02KPdK9nPKChgASwgkb3v4NEkt5Q2CBNQDYD7goNmi0TNRRQmKdzDVTBunej+bEKSjgrAQp+tFqO/P6PkuNrqYb/PWXz3HOkcERkqjOdqj/9FCI1u/IUzafJWPYt4U2JFhRtL7s6sjCwWOBC8+/2mMrfWRjxolYW5nurqFvgmLHcOT+uMig9XSv6MHNtPyZtg45u6Uh+raoNG8EmfEbXHf/zOIkcjjDd9XtWOHurq56sufZU7lcHAHO86CyHpptX2i3MoPY4tC30zmRrgD9ZXJgNyhyh3Ua1NYF7W3zHMbhjTueNOsQTrGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bmrHRIayYgdIj+FdqSBY7nSZGN9k60MkhCWIvHM3E9M=;
 b=gHZF3bqi2H2AaBWJALsbWkTtpbZnsFnBfRVATItiUaEU28TBdSARTyJZ+wr19cRQrMBs1MMQtwzGSCU6aiYyZ2RmyaqeXGC1+63PdLXf+HmahWflpk0FsbiDhesfwqBvZX7SWrXv+39a8Rc4UHGMQqEP4++G8W5eh3TbRnh5p+8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <54355320-2c3c-665f-32e2-90329586d98a@amd.com>
Date: Thu, 19 Jan 2023 10:18:43 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 11/40] xen/mpu: build up start-of-day Xen MPU memory
 region map
To: xen-devel@lists.xenproject.org
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-12-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
Cc: Wei Chen <wei.chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>
In-Reply-To: <20230113052914.3845596-12-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|CY5PR12MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: 69a4883a-b39f-4516-d37f-08dafa068eba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ERDMSUjgPW1oHITiZz4ws+recrhWKK0H0EDm/PX98byYOImpKyiSFPwpWRMjMb5ON3tg8H4Q5Uv5V45CWoLdKqbbpXTapGn04+pkzr3QVVCED5jf3kgbiTFFOrEkkUrHmGOoepuW33UwJqH6/rvYtiXeTfGfiyGxMIqgaE6aBZ1Cw0NV0jAwJTrZ90FpTVASJ5HWwr8c/thLlcy+73wykB1GQHAFv/jGZGZK6K7aVPfAiVVNIGsvAvgU/XS5OCErOII5tVuuqFGR8k9Wfvh34l8/CoB+P7eYbSFUzO3/qtx4rIV9rK7Yw8oi0NPMS+YIktSGA77y+yOJR3R8YlrNNwOmwWzW9TWXMHAwbd6VOzFfEPTdQ6E7iTBco6Oor015P5ag4rkjjSXO7Fs6tSKMAn9j+GFC2jWPAtCQuJ/hYsQUUiX5h8J5UneFp+SThlHT5QJj5zPVfIpnkWYDRzVq23MvOd7qWfERWbs5AzmKuaOMpvFEfs9af8/8mBQCpidk6Lne9mQijRzjD7/gX023ZndXeel2dzpg6wOkf5a/i+rA9egZaNE6fmkZMyncwYSy8rl+/omYFrcd63LdAh1euh9+WWel+pwunTXQkJ/SDCgQKVm7WTXy5CsJzJeGW/8ZWRnn8rbS9EbukHiz97azGGCwajRQuRRRoICw9OWdT0SM8OHWsIIMZ1KQDorEmYZJg5BUVSNydmmvx43ridfp9AA3s6Sg8FURTEMugrB5dY/zgxCRl1IhtaHUdMcuX5paojiA20jkLtCTQ96FCwMyegQpsS/xjacMRzV1TWL3wwEy/9+IkuGwYZQHactT1j/M
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(396003)(346002)(39860400002)(136003)(451199015)(31686004)(36756003)(8936002)(8676002)(66556008)(66946007)(478600001)(4326008)(31696002)(2906002)(30864003)(6916009)(5660300002)(83380400001)(38100700002)(66476007)(6666004)(316002)(966005)(6486002)(54906003)(41300700001)(2616005)(53546011)(6506007)(6512007)(26005)(186003)(2004002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czgvNXpaZmgwbE5sQXE3dEJENE0rQjVMazZGVitSazJhL1NrZzd6bjJDT3Np?=
 =?utf-8?B?ZFlNeW1HaFBnTnlBaWNDT3ZEVzBaY0JvVWpkMUVvZHZFQzlTUk9DV3BwM0NJ?=
 =?utf-8?B?ejJiS2xxV1F4MlhzcVBld1JURFdVMU8vTGRPeFkrTTNKUEtTYTk1ckhlUmRY?=
 =?utf-8?B?b25JYWc3NzAxQkFLbUJCRTVwTlpSL2dHaHNFT0hySzhTb3d6R2lCSUNzOFJ5?=
 =?utf-8?B?UkRTVkJxR0ZLcUZKNktmZW5XSVZxQmJJMmJrcElqWnZJZXRBRE1wUFhKVFFs?=
 =?utf-8?B?RXdBV0xkVTBsaW1TUTdDcUI2b0c3VHV2OGFiQkFwRDMrQUNvSklLSWZPbXhM?=
 =?utf-8?B?emVmd3hsMytxNmttWTRmSzNmVU02TnZXWHNhWlJrYTduTDg4REV0MnBNcElH?=
 =?utf-8?B?TkJXNGVBbjRIK1NkTUdxckNjbEJ1VFVURzFrSjhPZVUrUnlXNzdhcXBVSmxi?=
 =?utf-8?B?OWNLVWhGdi9qa1M0T29wMktVN01VeElGMk10ZUpKV204UDc0MjZLakNnSTJn?=
 =?utf-8?B?Zlg2WVRiN005UFMyNFFvbmdBVTVFZk5DRktKQVBCb2xxV0NKVDRrTmdVaW5L?=
 =?utf-8?B?bVFidkIyNHBmWUVyQUJqRmpxNTYyaVJZdjJJNy9aTktqdnVSeWZIcC9FczRm?=
 =?utf-8?B?RDNubjNxa0JkVWYxMDFKNDRVMmFadGpwQW5KUG1aSEVIREcvaFpKVjZVemhX?=
 =?utf-8?B?MzdpditJaWI0R05PUzdyQWxtZGx2akl6T2tJYjV1bFRwUlBjMzA1Qk14TmJa?=
 =?utf-8?B?cDdXRWl4d2VienAyekRqdlBJVkhBYnB3ZHhmSjRFbFJ4V2pHMVMvck5jQkpY?=
 =?utf-8?B?WjJQWmNSVkpxRjFYZVZFWHFlYkVCdDQvRWxDT3R6R2UzejQzanZaL3h5d2xS?=
 =?utf-8?B?Q0ZHT1hlNVlzTngwbmd4dnVDbjJMVEN6ZUVra25rWk9LYy9ZdXFhTHNZUGti?=
 =?utf-8?B?ajgrRmx4SlI0WlptVnE3TU1FUjRFM3hoaDFYa0xmVC8wVUVJaUZ5TWRzWEZt?=
 =?utf-8?B?QzFIMEJCTVVtRFNjNjl1dDNPYTZGMlh2MGYwZ2UwWFR1YUZ2TDRvVThWSThP?=
 =?utf-8?B?Y3BWclRMNEMralAvUDdaZ2w4dUlQelZRMGQrUDVHTmY3WER3cHVVbm4rTzhy?=
 =?utf-8?B?emtKWjVqYjFGMk1mVjVQZjJsSlcxcHRDd1J3YkZXNTRDY1RUZU16ZlBSUU5S?=
 =?utf-8?B?WHZabzErVGt2dmtZUTBOellnNWVyeTBaeXVxelQxcExRMnZHSnN0Q1llM24v?=
 =?utf-8?B?SVhyMmNOQ0loNXJMY0cwWmRrckVtV2lvM0VucmJPVUhQM3VJK1pjQnBjbW4r?=
 =?utf-8?B?b1dIL3VDbGV6VGdFNDRaZFFUeFFaa3puODRxQlV0VGtGSFFDZTBKTC8zMlFv?=
 =?utf-8?B?ODIyZS9CZXFBSEowaVU5Q0hUc3VHc2Q3MkZ5bW9QRUJ4ODBjTFN3ZmZUSWox?=
 =?utf-8?B?RzFyUyttaWNscHYyTkZ1a2htMWZhdGhxY2pDQk9CZmJMemg3aVZvYTZJcGZj?=
 =?utf-8?B?eFg1eHZDMG9pelRQSWc2V2UxVUFqaWRuR1k2TnY1V2Fzazlqd2xDdkZHR3FB?=
 =?utf-8?B?eU40dGczejA4YldHNEdEdk4vSW5QQjFWL2FNekpma3BydWZ3TE4yYlJ4K1Yr?=
 =?utf-8?B?enVOdGN1ZEFZRFZPR1I5T2QrMXhPSEJBbnNLZWpDTXg1S0lrVXgwdW4yd25Y?=
 =?utf-8?B?dkZCa21YbzkyNll5c3lIV2wwaWw4endvbUVVcG1SejJHTWIrMWVxMHJXNVFH?=
 =?utf-8?B?N1R0WTlHWWgyZVFPQzF1cW5CaXdjVFI5NEFKVHU4b1I4S0xCN09DTWtNV1dQ?=
 =?utf-8?B?WnRIUEhzanU1STZmbHZRWGNOQjVjSUw4R0t3aWpKRjJwQjBseHlrRktNb0t5?=
 =?utf-8?B?NzgrMXdwSFlzd2xGb3lrN1NQdjI3N0JUVGVQb0tVVmhJZHZRZDNEM25lRklu?=
 =?utf-8?B?YWtsamdHM2hhRTJ3NENZdVRYZkVKSWtJQm9qMmxZL1ZQMTIwbml5cGFidlJM?=
 =?utf-8?B?VjVIdThpSC9nd1RxRjRxM251YUFCdUI1Q0o5WE1ERU52WDBGemdsQWdRcEF1?=
 =?utf-8?B?c2Z4ZTlyVUloQVJIUzl3VFNpUTBtNFp1NE5ULzRhYWFleUZTeTlyRUN1K2ov?=
 =?utf-8?Q?tpDDF5cqIWKG1kdwMTLjoQcUy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69a4883a-b39f-4516-d37f-08dafa068eba
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 10:18:50.1296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2xgXsUXkLLRNnElqW9X/OzcB/Q9nh/N04RhtRem5iYZaha1oskX2Ye137nnWbTf2K8MKg6ZIhz5cVszWgUtSsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6035


On 13/01/2023 05:28, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> From: Penny Zheng <penny.zheng@arm.com>
>
> The start-of-day Xen MPU memory region layout shall be like as follows:
>
> xen_mpumap[0] : Xen text
> xen_mpumap[1] : Xen read-only data
> xen_mpumap[2] : Xen read-only after init data
> xen_mpumap[3] : Xen read-write data
> xen_mpumap[4] : Xen BSS
> ......
> xen_mpumap[max_xen_mpumap - 2]: Xen init data
> xen_mpumap[max_xen_mpumap - 1]: Xen init text
>
> max_xen_mpumap refers to the number of regions supported by the EL2 MPU.
> The layout shall be compliant with what we describe in xen.lds.S, or the
> codes need adjustment.
>
> As MMU system and MPU system have different functions to create
> the boot MMU/MPU memory management data, instead of introducing
> extra #ifdef in main code flow, we introduce a neutral name
> prepare_early_mappings for both, and also to replace create_page_tables for MMU.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/arm64/Makefile              |   2 +
>   xen/arch/arm/arm64/head.S                |  17 +-
>   xen/arch/arm/arm64/head_mmu.S            |   4 +-
>   xen/arch/arm/arm64/head_mpu.S            | 323 +++++++++++++++++++++++
>   xen/arch/arm/include/asm/arm64/mpu.h     |  63 +++++
>   xen/arch/arm/include/asm/arm64/sysregs.h |  49 ++++
>   xen/arch/arm/mm_mpu.c                    |  48 ++++
>   xen/arch/arm/xen.lds.S                   |   4 +
>   8 files changed, 502 insertions(+), 8 deletions(-)
>   create mode 100644 xen/arch/arm/arm64/head_mpu.S
>   create mode 100644 xen/arch/arm/include/asm/arm64/mpu.h
>   create mode 100644 xen/arch/arm/mm_mpu.c
>
> diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
> index 22da2f54b5..438c9737ad 100644
> --- a/xen/arch/arm/arm64/Makefile
> +++ b/xen/arch/arm/arm64/Makefile
> @@ -10,6 +10,8 @@ obj-y += entry.o
>   obj-y += head.o
>   ifneq ($(CONFIG_HAS_MPU),y)
>   obj-y += head_mmu.o
> +else
> +obj-y += head_mpu.o
>   endif
>   obj-y += insn.o
>   obj-$(CONFIG_LIVEPATCH) += livepatch.o
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 782bd1f94c..145e3d53dc 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -68,9 +68,9 @@
>    *  x24 -
>    *  x25 -
>    *  x26 - skip_zero_bss (boot cpu only)
> - *  x27 -
> - *  x28 -
> - *  x29 -
> + *  x27 - region selector (mpu only)
> + *  x28 - prbar (mpu only)
> + *  x29 - prlar (mpu only)
>    *  x30 - lr
>    */
>
> @@ -82,7 +82,7 @@
>    * ---------------------------
>    *
>    * The requirements are:
> - *   MMU = off, D-cache = off, I-cache = on or off,
> + *   MMU/MPU = off, D-cache = off, I-cache = on or off,
>    *   x0 = physical address to the FDT blob.
>    *
>    * This must be the very first address in the loaded image.
> @@ -252,7 +252,12 @@ real_start_efi:
>
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> +
> +        /*
> +         * Create boot memory management data, pagetable for MMU systems
> +         * and memory regions for MPU systems.
> +         */
> +        bl    prepare_early_mappings
>           bl    enable_mmu
>
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> @@ -310,7 +315,7 @@ GLOBAL(init_secondary)
>   #endif
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> +        bl    prepare_early_mappings
>           bl    enable_mmu
>
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
> index 6ff13c751c..2346f755df 100644
> --- a/xen/arch/arm/arm64/head_mmu.S
> +++ b/xen/arch/arm/arm64/head_mmu.S
> @@ -123,7 +123,7 @@
>    *
>    * Clobbers x0 - x4
>    */
> -ENTRY(create_page_tables)
> +ENTRY(prepare_early_mappings)
>           /* Prepare the page-tables for mapping Xen */
>           ldr   x0, =XEN_VIRT_START
>           create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
> @@ -208,7 +208,7 @@ virtphys_clash:
>           /* Identity map clashes with boot_third, which we cannot handle yet */
>           PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
>           b     fail
> -ENDPROC(create_page_tables)
> +ENDPROC(prepare_early_mappings)

NIT:- Can this renaming be done in a separate patch of its own (before 
this patch).

So that this patch can be only about the new functionality introduced.

>
>   /*
>    * Turn on the Data Cache and the MMU. The function will return on the 1:1
> diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
> new file mode 100644
> index 0000000000..0b97ce4646
> --- /dev/null
> +++ b/xen/arch/arm/arm64/head_mpu.S
> @@ -0,0 +1,323 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Start-of-day code for an Armv8-R AArch64 MPU system.
> + */
> +
> +#include <asm/arm64/mpu.h>
> +#include <asm/early_printk.h>
> +#include <asm/page.h>
> +
> +/*
> + * One entry in Xen MPU memory region mapping table(xen_mpumap) is a structure
> + * of pr_t, which is 16-bytes size, so the entry offset is the order of 4.
> + */
NIT :- It would be good to quote Arm ARM from which can be referred for 
the definitions.
> +#define MPU_ENTRY_SHIFT         0x4
> +
> +#define REGION_SEL_MASK         0xf
> +
> +#define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
> +#define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
> +#define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> +
> +#define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> +
> +/*
> + * Macro to round up the section address to be PAGE_SIZE aligned
> + * Each section(e.g. .text, .data, etc) in xen.lds.S is page-aligned,
> + * which is usually guarded with ". = ALIGN(PAGE_SIZE)" in the head,
> + * or in the end
> + */
> +.macro roundup_section, xb
> +        add   \xb, \xb, #(PAGE_SIZE-1)
> +        and   \xb, \xb, #PAGE_MASK
> +.endm
> +
> +/*
> + * Macro to create a new MPU memory region entry, which is a structure
> + * of pr_t,  in \prmap.
> + *
> + * Inputs:
> + * prmap:   mpu memory region map table symbol
> + * sel:     region selector
> + * prbar:   preserve value for PRBAR_EL2
> + * prlar    preserve value for PRLAR_EL2
> + *
> + * Clobbers \tmp1, \tmp2
> + *
> + */
> +.macro create_mpu_entry prmap, sel, prbar, prlar, tmp1, tmp2
> +    mov   \tmp2, \sel
> +    lsl   \tmp2, \tmp2, #MPU_ENTRY_SHIFT
> +    adr_l \tmp1, \prmap
> +    /* Write the first 8 bytes(prbar_t) of pr_t */
> +    str   \prbar, [\tmp1, \tmp2]
> +
> +    add   \tmp2, \tmp2, #8
> +    /* Write the last 8 bytes(prlar_t) of pr_t */
> +    str   \prlar, [\tmp1, \tmp2]
> +.endm
> +
> +/*
> + * Macro to store the maximum number of regions supported by the EL2 MPU
> + * in max_xen_mpumap, which is identified by MPUIR_EL2.
> + *
> + * Outputs:
> + * nr_regions: preserve the maximum number of regions supported by the EL2 MPU
> + *
> + * Clobbers \tmp1
> + *
> + */
> +.macro read_max_el2_regions, nr_regions, tmp1
> +    load_paddr \tmp1, max_xen_mpumap
> +    mrs   \nr_regions, MPUIR_EL2
> +    isb
> +    str   \nr_regions, [\tmp1]
> +.endm
> +
> +/*
> + * Macro to prepare and set a MPU memory region
> + *
> + * Inputs:
> + * base:        base address symbol (should be page-aligned)
> + * limit:       limit address symbol
> + * sel:         region selector
> + * prbar:       store computed PRBAR_EL2 value
> + * prlar:       store computed PRLAR_EL2 value
> + * attr_prbar:  PRBAR_EL2-related memory attributes. If not specified it will be REGION_DATA_PRBAR
> + * attr_prlar:  PRLAR_EL2-related memory attributes. If not specified it will be REGION_NORMAL_PRLAR
> + *
> + * Clobber \tmp1
> + *
> + */
> +.macro prepare_xen_region, base, limit, sel, prbar, prlar, tmp1, attr_prbar=REGION_DATA_PRBAR, attr_prlar=REGION_NORMAL_PRLAR
> +    /* Prepare value for PRBAR_EL2 reg and preserve it in \prbar.*/
> +    load_paddr \prbar, \base
> +    and   \prbar, \prbar, #MPU_REGION_MASK
> +    mov   \tmp1, #\attr_prbar
> +    orr   \prbar, \prbar, \tmp1
> +
> +    /* Prepare value for PRLAR_EL2 reg and preserve it in \prlar.*/
> +    load_paddr \prlar, \limit
> +    /* Round up limit address to be PAGE_SIZE aligned */
> +    roundup_section \prlar
> +    /* Limit address should be inclusive */
> +    sub   \prlar, \prlar, #1
> +    and   \prlar, \prlar, #MPU_REGION_MASK
> +    mov   \tmp1, #\attr_prlar
> +    orr   \prlar, \prlar, \tmp1
> +
> +    mov   x27, \sel
> +    mov   x28, \prbar
> +    mov   x29, \prlar

Any reasons for using x27, x28, x29 to pass function parameters.

https://github.com/ARM-software/abi-aa/blob/main/aapcs64/aapcs64.rst 
states x0..x7 should be used (Table 2, General-purpose registers and 
AAPCS64 usage).

> +    /*
> +     * x27, x28, x29 are special registers designed as
> +     * inputs for function write_pr
> +     */
> +    bl    write_pr
> +.endm
> +
> +.section .text.idmap, "ax", %progbits
> +
> +/*
> + * ENTRY to configure a EL2 MPU memory region
> + * ARMv8-R AArch64 at most supports 255 MPU protection regions.
> + * See section G1.3.18 of the reference manual for ARMv8-R AArch64,
> + * PRBAR<n>_EL2 and PRLAR<n>_EL2 provides access to the EL2 MPU region
> + * determined by the value of 'n' and PRSELR_EL2.REGION as
> + * PRSELR_EL2.REGION<7:4>:n.(n = 0, 1, 2, ... , 15)
> + * For example to access regions from 16 to 31 (0b10000 to 0b11111):
> + * - Set PRSELR_EL2 to 0b1xxxx
> + * - Region 16 configuration is accessible through PRBAR0_EL2 and PRLAR0_EL2
> + * - Region 17 configuration is accessible through PRBAR1_EL2 and PRLAR1_EL2
> + * - Region 18 configuration is accessible through PRBAR2_EL2 and PRLAR2_EL2
> + * - ...
> + * - Region 31 configuration is accessible through PRBAR15_EL2 and PRLAR15_EL2
> + *
> + * Inputs:
> + * x27: region selector
> + * x28: preserve value for PRBAR_EL2
> + * x29: preserve value for PRLAR_EL2
> + *
> + */
> +ENTRY(write_pr)
> +    msr   PRSELR_EL2, x27
> +    dsb   sy
> +    and   x27, x27, #REGION_SEL_MASK
> +    cmp   x27, #0
> +    bne   1f
> +    msr   PRBAR0_EL2, x28
> +    msr   PRLAR0_EL2, x29
> +    b     out
> +1:
> +    cmp   x27, #1
> +    bne   2f
> +    msr   PRBAR1_EL2, x28
> +    msr   PRLAR1_EL2, x29
> +    b     out
> +2:
> +    cmp   x27, #2
> +    bne   3f
> +    msr   PRBAR2_EL2, x28
> +    msr   PRLAR2_EL2, x29
> +    b     out
> +3:
> +    cmp   x27, #3
> +    bne   4f
> +    msr   PRBAR3_EL2, x28
> +    msr   PRLAR3_EL2, x29
> +    b     out
> +4:
> +    cmp   x27, #4
> +    bne   5f
> +    msr   PRBAR4_EL2, x28
> +    msr   PRLAR4_EL2, x29
> +    b     out
> +5:
> +    cmp   x27, #5
> +    bne   6f
> +    msr   PRBAR5_EL2, x28
> +    msr   PRLAR5_EL2, x29
> +    b     out
> +6:
> +    cmp   x27, #6
> +    bne   7f
> +    msr   PRBAR6_EL2, x28
> +    msr   PRLAR6_EL2, x29
> +    b     out
> +7:
> +    cmp   x27, #7
> +    bne   8f
> +    msr   PRBAR7_EL2, x28
> +    msr   PRLAR7_EL2, x29
> +    b     out
> +8:
> +    cmp   x27, #8
> +    bne   9f
> +    msr   PRBAR8_EL2, x28
> +    msr   PRLAR8_EL2, x29
> +    b     out
> +9:
> +    cmp   x27, #9
> +    bne   10f
> +    msr   PRBAR9_EL2, x28
> +    msr   PRLAR9_EL2, x29
> +    b     out
> +10:
> +    cmp   x27, #10
> +    bne   11f
> +    msr   PRBAR10_EL2, x28
> +    msr   PRLAR10_EL2, x29
> +    b     out
> +11:
> +    cmp   x27, #11
> +    bne   12f
> +    msr   PRBAR11_EL2, x28
> +    msr   PRLAR11_EL2, x29
> +    b     out
> +12:
> +    cmp   x27, #12
> +    bne   13f
> +    msr   PRBAR12_EL2, x28
> +    msr   PRLAR12_EL2, x29
> +    b     out
> +13:
> +    cmp   x27, #13
> +    bne   14f
> +    msr   PRBAR13_EL2, x28
> +    msr   PRLAR13_EL2, x29
> +    b     out
> +14:
> +    cmp   x27, #14
> +    bne   15f
> +    msr   PRBAR14_EL2, x28
> +    msr   PRLAR14_EL2, x29
> +    b     out
> +15:
> +    msr   PRBAR15_EL2, x28
> +    msr   PRLAR15_EL2, x29
> +out:
> +    isb
> +    ret
> +ENDPROC(write_pr)
> +
> +/*
> + * Static start-of-day Xen EL2 MPU memory region layout.
> + *
> + *     xen_mpumap[0] : Xen text
> + *     xen_mpumap[1] : Xen read-only data
> + *     xen_mpumap[2] : Xen read-only after init data
> + *     xen_mpumap[3] : Xen read-write data
> + *     xen_mpumap[4] : Xen BSS
> + *     ......
> + *     xen_mpumap[max_xen_mpumap - 2]: Xen init data
> + *     xen_mpumap[max_xen_mpumap - 1]: Xen init text
> + *
> + * Clobbers x0 - x6
> + *
> + * It shall be compliant with what describes in xen.lds.S, or the below
> + * codes need adjustment.
> + * It shall also follow the rules of putting fixed MPU memory region in
> + * the front, and the others in the rear, which, here, mainly refers to
> + * boot-only region, like Xen init text region.
> + */
> +ENTRY(prepare_early_mappings)
> +    /* stack LR as write_pr will be called later like nested function */
> +    mov   x6, lr
> +
> +    /* x0: region sel */
> +    mov   x0, xzr
> +    /* Xen text section. */
> +    prepare_xen_region _stext, _etext, x0, x1, x2, x3, attr_prbar=REGION_TEXT_PRBAR
> +    create_mpu_entry xen_mpumap, x0, x1, x2, x3, x4
> +
> +    add   x0, x0, #1
> +    /* Xen read-only data section. */
> +    prepare_xen_region _srodata, _erodata, x0, x1, x2, x3, attr_prbar=REGION_RO_PRBAR
> +    create_mpu_entry xen_mpumap, x0, x1, x2, x3, x4
> +
> +    add   x0, x0, #1
> +    /* Xen read-only after init data section. */
> +    prepare_xen_region __ro_after_init_start, __ro_after_init_end, x0, x1, x2, x3
> +    create_mpu_entry xen_mpumap, x0, x1, x2, x3, x4
> +
> +    add   x0, x0, #1
> +    /* Xen read-write data section. */
> +    prepare_xen_region __data_begin, __init_begin, x0, x1, x2, x3
> +    create_mpu_entry xen_mpumap, x0, x1, x2, x3, x4
> +
> +    read_max_el2_regions x5, x3 /* x5: max_mpumap */
> +    sub   x5, x5, #1
> +    /* Xen init text section. */
> +    prepare_xen_region _sinittext, _einittext, x5, x1, x2, x3, attr_prbar=REGION_TEXT_PRBAR
> +    create_mpu_entry xen_mpumap, x5, x1, x2, x3, x4
> +
> +    sub   x5, x5, #1
> +    /* Xen init data section. */
> +    prepare_xen_region __init_data_begin, __init_end, x5, x1, x2, x3
> +    create_mpu_entry xen_mpumap, x5, x1, x2, x3, x4
> +
> +    add   x0, x0, #1
> +    /* Xen BSS section. */
> +    prepare_xen_region __bss_start, __bss_end, x0, x1, x2, x3
> +    create_mpu_entry xen_mpumap, x0, x1, x2, x3, x4
> +
> +    /* Update next_fixed_region_idx and next_transient_region_idx */
> +    load_paddr x3, next_fixed_region_idx
> +    add   x0, x0, #1
> +    str   x0, [x3]
> +    load_paddr x4, next_transient_region_idx
> +    sub   x5, x5, #1
> +    str   x5, [x4]
> +
> +    mov   lr, x6
> +    ret
> +ENDPROC(prepare_early_mappings)
> +
> +GLOBAL(_end_boot)
> +
> +/*
> + * Local variables:
> + * mode: ASM
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm64/mpu.h b/xen/arch/arm/include/asm/arm64/mpu.h
> new file mode 100644
> index 0000000000..c945dd53db
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/arm64/mpu.h
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * mpu.h: Arm Memory Protection Region definitions.
> + */
> +
> +#ifndef __ARM64_MPU_H__
> +#define __ARM64_MPU_H__
> +
> +#define MPU_REGION_SHIFT  6
> +#define MPU_REGION_ALIGN  (_AC(1, UL) << MPU_REGION_SHIFT)
> +#define MPU_REGION_MASK   (~(MPU_REGION_ALIGN - 1))
> +
> +/*
> + * MPUIR_EL2.Region identifies the number of regions supported by the EL2 MPU.
> + * It is a 8-bit field, so 255 MPU memory regions at most.
> + */
> +#define ARM_MAX_MPU_MEMORY_REGIONS 255
> +
> +#ifndef __ASSEMBLY__
> +
> +/* Protection Region Base Address Register */
> +typedef union {
> +    struct __packed {
> +        unsigned long xn:2;       /* Execute-Never */
> +        unsigned long ap:2;       /* Acess Permission */
> +        unsigned long sh:2;       /* Sharebility */
> +        unsigned long base:42;    /* Base Address */
> +        unsigned long pad:16;
> +    } reg;
> +    uint64_t bits;
> +} prbar_t;
> +
> +/* Protection Region Limit Address Register */
> +typedef union {
> +    struct __packed {
> +        unsigned long en:1;     /* Region enable */
> +        unsigned long ai:3;     /* Memory Attribute Index */
> +        unsigned long ns:1;     /* Not-Secure */
> +        unsigned long res:1;    /* Reserved 0 by hardware */
> +        unsigned long limit:42; /* Limit Address */
> +        unsigned long pad:16;
> +    } reg;
> +    uint64_t bits;
> +} prlar_t;
> +
> +/* MPU Protection Region */
> +typedef struct {
> +    prbar_t prbar;
> +    prlar_t prlar;
> +} pr_t;
> +
> +#endif /* __ASSEMBLY__ */
> +
> +#endif /* __ARM64_MPU_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/include/asm/arm64/sysregs.h b/xen/arch/arm/include/asm/arm64/sysregs.h
> index 4638999514..aca9bca5b1 100644
> --- a/xen/arch/arm/include/asm/arm64/sysregs.h
> +++ b/xen/arch/arm/include/asm/arm64/sysregs.h
> @@ -458,6 +458,55 @@
>   #define ZCR_ELx_LEN_SIZE             9
>   #define ZCR_ELx_LEN_MASK             0x1ff
>
> +/* System registers for Armv8-R AArch64 */
> +#ifdef CONFIG_HAS_MPU
> +
> +/* EL2 MPU Protection Region Base Address Register encode */
> +#define PRBAR_EL2   S3_4_C6_C8_0
> +#define PRBAR0_EL2  S3_4_C6_C8_0
> +#define PRBAR1_EL2  S3_4_C6_C8_4
> +#define PRBAR2_EL2  S3_4_C6_C9_0
> +#define PRBAR3_EL2  S3_4_C6_C9_4
> +#define PRBAR4_EL2  S3_4_C6_C10_0
> +#define PRBAR5_EL2  S3_4_C6_C10_4
> +#define PRBAR6_EL2  S3_4_C6_C11_0
> +#define PRBAR7_EL2  S3_4_C6_C11_4
> +#define PRBAR8_EL2  S3_4_C6_C12_0
> +#define PRBAR9_EL2  S3_4_C6_C12_4
> +#define PRBAR10_EL2 S3_4_C6_C13_0
> +#define PRBAR11_EL2 S3_4_C6_C13_4
> +#define PRBAR12_EL2 S3_4_C6_C14_0
> +#define PRBAR13_EL2 S3_4_C6_C14_4
> +#define PRBAR14_EL2 S3_4_C6_C15_0
> +#define PRBAR15_EL2 S3_4_C6_C15_4
> +
> +/* EL2 MPU Protection Region Limit Address Register encode */
> +#define PRLAR_EL2   S3_4_C6_C8_1
> +#define PRLAR0_EL2  S3_4_C6_C8_1
> +#define PRLAR1_EL2  S3_4_C6_C8_5
> +#define PRLAR2_EL2  S3_4_C6_C9_1
> +#define PRLAR3_EL2  S3_4_C6_C9_5
> +#define PRLAR4_EL2  S3_4_C6_C10_1
> +#define PRLAR5_EL2  S3_4_C6_C10_5
> +#define PRLAR6_EL2  S3_4_C6_C11_1
> +#define PRLAR7_EL2  S3_4_C6_C11_5
> +#define PRLAR8_EL2  S3_4_C6_C12_1
> +#define PRLAR9_EL2  S3_4_C6_C12_5
> +#define PRLAR10_EL2 S3_4_C6_C13_1
> +#define PRLAR11_EL2 S3_4_C6_C13_5
> +#define PRLAR12_EL2 S3_4_C6_C14_1
> +#define PRLAR13_EL2 S3_4_C6_C14_5
> +#define PRLAR14_EL2 S3_4_C6_C15_1
> +#define PRLAR15_EL2 S3_4_C6_C15_5
> +
> +/* MPU Protection Region Selection Register encode */
> +#define PRSELR_EL2 S3_4_C6_C2_1
> +
> +/* MPU Type registers encode */
> +#define MPUIR_EL2 S3_4_C0_C0_4
> +
> +#endif
> +
>   /* Access to system registers */
>
>   #define WRITE_SYSREG64(v, name) do {                    \
> diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
> new file mode 100644
> index 0000000000..43e9a1be4d
> --- /dev/null
> +++ b/xen/arch/arm/mm_mpu.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * xen/arch/arm/mm_mpu.c
> + *
> + * MPU based memory managment code for Armv8-R AArch64.
> + *
> + * Copyright (C) 2022 Arm Ltd.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program. If not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include <xen/init.h>
> +#include <xen/page-size.h>
> +#include <asm/arm64/mpu.h>
> +
> +/* Xen MPU memory region mapping table. */
> +pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
> +     xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
> +
> +/* Index into MPU memory region map for fixed regions, ascending from zero. */
> +uint64_t __ro_after_init next_fixed_region_idx;
> +/*
> + * Index into MPU memory region map for transient regions, like boot-only
> + * region, which descends from max_xen_mpumap.
> + */
> +uint64_t __ro_after_init next_transient_region_idx;
> +
> +/* Maximum number of supported MPU memory regions by the EL2 MPU. */
> +uint64_t __ro_after_init max_xen_mpumap;
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index bc45ea2c65..79965a3c17 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -91,6 +91,8 @@ SECTIONS
>         __ro_after_init_end = .;
>     } : text
>
> +  . = ALIGN(PAGE_SIZE);
> +  __data_begin = .;
>     .data.read_mostly : {
>          /* Exception table */
>          __start___ex_table = .;
> @@ -157,7 +159,9 @@ SECTIONS
>          *(.altinstr_replacement)
>     } :text
>     . = ALIGN(PAGE_SIZE);
> +
>     .init.data : {
> +       __init_data_begin = .;            /* Init data */
>          *(.init.rodata)
>          *(.init.rodata.*)
>
> --
> 2.25.1
>
NIT:- Would you consider splitting this patch, something like this :-

1. Renaming of the mmu function

2. Define sysregs, prlar_t, prbar_t and other other hardware specific 
macros.

3. Define write_pr

4. The rest of the changes (ie prepare_early_mappings(), xen.lds.S, etc)

- Ayan


