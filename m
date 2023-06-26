Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E2E73D773
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 08:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555316.866994 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDfHt-0005Bo-TK; Mon, 26 Jun 2023 06:01:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555316.866994; Mon, 26 Jun 2023 06:01:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDfHt-00059j-Qi; Mon, 26 Jun 2023 06:01:21 +0000
Received: by outflank-mailman (input) for mailman id 555316;
 Mon, 26 Jun 2023 06:01:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6QYu=CO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qDfHs-00059d-CT
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 06:01:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2084.outbound.protection.outlook.com [40.107.7.84])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id dd343d5b-13e6-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 08:01:17 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB8056.eurprd04.prod.outlook.com (2603:10a6:20b:288::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 06:00:47 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6521.026; Mon, 26 Jun 2023
 06:00:47 +0000
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
X-Inumbo-ID: dd343d5b-13e6-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EhkGXHeDCw7vSUjsXcZeB1dmft/eCIytUhCGCgvpPtSRQG/PKn4CcHAspctcEE/hYN4m1l1YEzf8a417VP68j1/uvtOf9QBxq0Y+vMbm3/dccthTZA8+qGukmhF0qHwDoZGhVASbPAfnt6RlWHs+9ueI64FYpGH1dKXKhhoLSy5H4pZwOvp+IBUnOm7alVxyAVKnOcO9DE70BEAQI2k7ZwtoihUpctsmLQyFxPwLoF+dI1yuS94ajKECXEpqikCFXZ0BIOf7cIh0DIMZ4inrpnHA5CRKcAmArPoIcfZdFAN/rcD1XLxg27kJQAA7QGhmBJErKGpGuKXoCNdnk0tZ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QnDFlnnqXjdf8W9/XTU0JknxQCkE1zMQbgsLXDH4ZL8=;
 b=GAMHK+bPT7ZYCZvdqMyhrp8vFZui46943LMj7gaed9F4UUTe4bGNc/i+AqjwF9R6l2sBA3tEhm56+MB90oMXmVSELmsA1HYAsloxpQM67BiNdIEceADpVXAie2zfawOuvi8HSPeQrxjnZfvK4r5mfip3Om2EFDjYoccUuSodGHeglbRjxCSjUulvO33CL20SxED8/Z04Xl/7/tQe1D5HPVUI9PqbTEYhMMwLrN7dyI12FsqifyHWObAaicuo66S5Z0wCMCzX64An2xj7KQcQCXLKdVheOQlN44SJqz/8lhSNnVZbUtepKesO7IDlaR4C2cjQ2KwztTel3XYEePoMTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QnDFlnnqXjdf8W9/XTU0JknxQCkE1zMQbgsLXDH4ZL8=;
 b=JK6Mzm+2ckuaKLCi5dchPZSsFnmlcajp7NccM5nkpLnzGATnVKkNPMHLSb42ZAHpAiuyc6JRDEEZIMxaz1dJb4JuOXMMCvNIVy06wUTouOlrY6BfdwThe7FHWKYoWgzuZat3f1t5Ts3ZbU8wjxLtu4OJM/w4bkaLGS9fUOpza0ybEcgbC6gnY16/WsZG1s3JHKNzpmPJiAGd98dvG03jAdTm4wH5w0pMkRYJCFVNxGH5Jx6+w5mTu4i4XbKE+i9h1GfduHxSKeGImuDQTWBN2N47Nz9FgASnX0lSV1xV7LNRF3q4iYJTAms72BfcyZ0PERj9Dyy7DQ+NEA46niLn4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <654c9925-565a-80d4-5e93-129f6f0f691a@suse.com>
Date: Mon, 26 Jun 2023 08:00:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 15/52] xen: make VMAP only support in MMU system
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Chen <wei.chen@arm.com>, xen-devel@lists.xenproject.org
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-16-Penny.Zheng@arm.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230626033443.2943270-16-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BE1P281CA0096.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:79::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 61f4bce0-a630-45d2-4c06-08db760aafb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3zGRTvaGL862eGNDmohaoUXYZdOF6hEZDYIbWqAd1v2YRLenC1WMCTqAZfDsVgIjVnS0pyPxwcnh27RBxIfhLIREvAY/YsPg+s56S25+anmQkEMl0hh+hVTz0diAoGAd90I3D5QsqIjm99sMcPypo2OrHy8koDgCjFQtZv67QSdvlFeKft1E6A4PabaWWK9cckrN/aORrN5vzGUW+yvcAE13rbv5GYSW5AZ3RRvD1+Zn19VDnYvWTaYkOm4NjxUnYUWaxzpMSriKD4ODDQp2keBw3yqKoN5XqNvg6rp0tPZR8x3svOSYf/zZWekyM6J5XGTcopCLhFe5F0AijXk8GsgWOFSmFM83DO+V7/qibVCZdNWsnRt21zknTVGJ6wDRyUcokmdd8BOuk1cCWFAsUXj0OySlQFXb6A1CVlHUfSEkcLOx/m8m5ev+q2F8BkOga9Ox1Xt4CskgT6ar3J7QeAEYZUavpvQU7Xw/SRbGDSsl1CA3JwRzOZVuFPFiwhPgwlWGn9xd+sUTmDJCGOV1ZaHDfk+l6NXTgsQpFUkUSiqEk9ppEN74X7LqfmXAhSqCABnnSYv5XnD25nac3PedIk5+scv1PBFmCaTUkGjQJzxFo/AQ48J702fWSOQGbqlbR6RxTQFThHskAryqdrKy0g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(39860400002)(396003)(136003)(376002)(366004)(451199021)(31686004)(36756003)(5660300002)(7416002)(41300700001)(316002)(86362001)(66476007)(6916009)(8936002)(8676002)(66556008)(4326008)(38100700002)(31696002)(66946007)(6486002)(6512007)(26005)(6506007)(53546011)(2906002)(186003)(478600001)(54906003)(6666004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MU4vcHJ4V2k2cWJ6dVh0M2hDWkw4eHY2RFRLWDZhNjVTdTVaM3d0ekxJRnly?=
 =?utf-8?B?bEt5U0FzeHlBU0ZyTlVySENSbHpKQVRObWw3ZTNVTVBnT1RLZ2kxNFFIK093?=
 =?utf-8?B?cUNsUU0zTWFQNFpTY05CK2lBcmhLOEZEQVNkVGE4VU81YlVMV1R6VC9NZTN1?=
 =?utf-8?B?M1o0QVMwSGdpUXV2bGRsTXlLQVI1Mkp1bnZSS1JMMXFsalA5RmpxSW12ckdM?=
 =?utf-8?B?RDlNc21KOU9ucGVodE53cjNtNHQxU2hUZ0U4ZE9mZ2kyZ3c2Y0ttblgxR29n?=
 =?utf-8?B?dC9vaXlMWWxxZytlY08vUEJPQTJEVE9UbE5hQ0RmMzRoMFFJYkVMWkRVWmlH?=
 =?utf-8?B?M0tPR1JMbm81M0dYclVUQ01VejVqRWJNRFV3eTZQNW1Pc3B0aXpEWlUrUHRj?=
 =?utf-8?B?ei84bTVDaHlWNkVxSU1udUczMFpvK3VwT00zNUt6UWlJdXM4bGd3RGtKWENy?=
 =?utf-8?B?UEZsY3lwRlQrNUhydVNvQlhsZmNBcUM4Z1FSQjZ0RTM4ZG5CU3JDdUw4aVNj?=
 =?utf-8?B?UmpBU2t4dU1FWG4vbVhQWG1mMENyaTlzYk8zaUZWQ2lwYjZGcGdZY3hCYWhE?=
 =?utf-8?B?WjN3K1RSY1FqTW1FWjRSWmVQZE5xT3pMc2o0NFo5b3dhWXhYN3lmYzZ5djky?=
 =?utf-8?B?TEpQVU04RnozQVljWERBQjRjMTh4NXhSTGMvRmFpMFVsVlFsUGl4QzN1bGJM?=
 =?utf-8?B?Nk5DSk1TU3NlQjFIS2dieER1NmhLSFhteDVhYVNHMkh3QUR3bEdDeUF2b3dL?=
 =?utf-8?B?R0haZ1dseTF0MmFPY0N6Sm9YWGlXbDc4NzhqUEdhOHl1V3lDMUFQVElqQzJm?=
 =?utf-8?B?Z1dBYVErZXhINUZiQW5adG9PTkZBY3YwazBaREdyM2VzOXVBM2VmRVhIS3ly?=
 =?utf-8?B?YW5sMThZWVJXQmlhZHdWM09FUm1CUlpxTnk2ckdQb2xXSTFZa040bEowb1RC?=
 =?utf-8?B?eUFXRWFpVFNEZlllb3RYS3dTd3o4N3dqRXdoTVl1cGRkN2dWM0xvbEdaOE5X?=
 =?utf-8?B?V05nMFU1TGc2RFE2bmdxb1krS0hBblk4Wm9Xd0w1QzF0L1hWd1ArOHBUVnpW?=
 =?utf-8?B?RTc2Uk50V1NwT0dqdlc4WnhhNHNHeFl2SzFnWTQwU3ovaGN5MmQvdm05S0Ir?=
 =?utf-8?B?OGVWbGgxNjNXUVAxUnJqUGFvNXlzaUJKaHI4Q1VxdEwrQkpsQmlmUkpDUldt?=
 =?utf-8?B?b28zWGwrL0VRTG5ZSkhxUVBSYUJONFZmWjl5YTFodkh1ZTJJMWNLSHlRZ0Fj?=
 =?utf-8?B?SkhpNC9ESnFGelJxdXBhK0hzMzZkcE5NbVR6NG1QaENZdEhWclpHR0Q1RzZw?=
 =?utf-8?B?MDNSaXVYVlRjV0FXZVB3Uk1RcXZRR0NWcy90Z3NKUWl2OXU4VkF6NFBLbnA1?=
 =?utf-8?B?WnJORDZocVd2N0pjUHZVSU9kV1dGbXBFSWh3Y3F0aTFOSnBOVmVRUUNLU0o2?=
 =?utf-8?B?dG9OWllwbzYvMjNEajJQWm9Ub1VaSE9Qdyt0R1JNUEFzNnA1KytoSGtGUXU4?=
 =?utf-8?B?MjB3TzZkMlpnZE1JS2ZOQUoxaFIwakNSWmJoU1B6Qyt1QzdMZklXL09JV0VZ?=
 =?utf-8?B?blRMOFZSOGIycTlDQXpkSm5RNmR6ZVUvT1NmYmZ4UmFId0FuOGF5TWh5MVpk?=
 =?utf-8?B?eG9obTRRQzNiRnZXc2FYSEJ2ZzJsUzVkd2l0Mm85emJHVm5BbmdCQ3NrQWph?=
 =?utf-8?B?ZTVxMzJWQ3JhZWM5SXRvZXgwVFdZbXN1MVFPREUxVmhsSG5HUWhLV2FEcVhq?=
 =?utf-8?B?azAwQUQ5clJLMGxRMmZFdE5ieFllSW4wY0x2MS9IeHNhd21oMTBsR3l2ZG0w?=
 =?utf-8?B?dG12K1JEbm5IY210dlkwRkdxSWN2a05JbkkwWHZIYTdLOEt6OGtnZFhsMUpw?=
 =?utf-8?B?bEx2bkhZNi80TFhUZkx1Rnp2NjBkbTl3a3hXNzNLYnZtRVE1ZFkrN2gvSjha?=
 =?utf-8?B?c2dnbDFJUmszVXlCU3RDWDg4Zmw3ZmZKRlFTYVhmRWZGTFNJTjkxSU5SS0xW?=
 =?utf-8?B?TFA4YVZ0bEQ4Ym0rbG1KZWNvOSs3aFNOQlRHeTMzTHYzNUk5bnpXS0tOVzBm?=
 =?utf-8?B?UkFoeU95d2hpYzBuR3pGT291QXBnaURSSWZEd1l5UUlQYWRjRG9vci9CSytC?=
 =?utf-8?Q?kego7cl3Pbca0QXiVZzWMmhPW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61f4bce0-a630-45d2-4c06-08db760aafb9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 06:00:47.4833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aq2aBZq76/UjtC9s7RyvT+tsLeqQFvIozNUfg4zayxPsOFL9Do3NJo/7LoJr9deR+ChAZUCLG9Xg1gnhfMs1Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8056

On 26.06.2023 05:34, Penny Zheng wrote:
> --- a/xen/arch/x86/Kconfig
> +++ b/xen/arch/x86/Kconfig
> @@ -27,6 +27,7 @@ config X86
>  	select HAS_PDX
>  	select HAS_SCHED_GRANULARITY
>  	select HAS_UBSAN
> +	select HAS_VMAP

With this being unconditional, ...

> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -1750,12 +1750,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>          end_boot_allocator();
>  
>      system_state = SYS_STATE_boot;
> +#ifdef CONFIG_HAS_VMAP
>      /*
>       * No calls involving ACPI code should go between the setting of
>       * SYS_STATE_boot and vm_init() (or else acpi_os_{,un}map_memory()
>       * will break).
>       */
>      vm_init();
> +#endif

... there's no need to make this code less readable by adding #ifdef.
Even for the Arm side I question the #ifdef-ary - it likely would be
better to have an empty stub in the header for that case.

> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -15,6 +15,7 @@ config CORE_PARKING
>  config GRANT_TABLE
>  	bool "Grant table support" if EXPERT
>  	default y
> +	depends on HAS_VMAP

Looking back at the commit which added use of vmap.h there, I can't
seem to be bale to spot why it did. Where's the dependency there?
And even if there is one, I think you don't want to unconditionally
turn off a core, guest-visible feature. Instead you would want to
identify a way to continue to support the feature in perhaps
slightly less efficient a way.

> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -331,4 +331,11 @@ void vfree(void *va)
>      while ( (pg = page_list_remove_head(&pg_list)) != NULL )
>          free_domheap_page(pg);
>  }
> +
> +void iounmap(void __iomem *va)
> +{
> +    unsigned long addr = (unsigned long)(void __force *)va;
> +
> +    vunmap((void *)(addr & PAGE_MASK));
> +}

Why does this move here?

> --- a/xen/include/xen/vmap.h
> +++ b/xen/include/xen/vmap.h
> @@ -1,4 +1,4 @@
> -#if !defined(__XEN_VMAP_H__) && defined(VMAP_VIRT_START)
> +#if !defined(__XEN_VMAP_H__) && (defined(VMAP_VIRT_START) || !defined(CONFIG_HAS_VMAP))
>  #define __XEN_VMAP_H__
>  
>  #include <xen/mm-frame.h>
> @@ -25,17 +25,14 @@ void vfree(void *va);
>  
>  void __iomem *ioremap(paddr_t, size_t);
>  
> -static inline void iounmap(void __iomem *va)
> -{
> -    unsigned long addr = (unsigned long)(void __force *)va;
> -
> -    vunmap((void *)(addr & PAGE_MASK));
> -}
> +void iounmap(void __iomem *va);
>  
>  void *arch_vmap_virt_end(void);
>  static inline void vm_init(void)
>  {
> +#if defined(VMAP_VIRT_START)
>      vm_init_type(VMAP_DEFAULT, (void *)VMAP_VIRT_START, arch_vmap_virt_end());
> +#endif
>  }

Why the (seemingly unrelated) #ifdef-ary here? You've eliminated
the problematic caller already. Didn't you mean to add wider scope
#ifdef CONFIG_HAS_VMAP to this header?

Jan


