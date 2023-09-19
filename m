Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4497A67D4
	for <lists+xen-devel@lfdr.de>; Tue, 19 Sep 2023 17:17:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604876.942407 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicSz-0000YL-S3; Tue, 19 Sep 2023 15:16:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604876.942407; Tue, 19 Sep 2023 15:16:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qicSz-0000Vk-PE; Tue, 19 Sep 2023 15:16:45 +0000
Received: by outflank-mailman (input) for mailman id 604876;
 Tue, 19 Sep 2023 15:16:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Lmoc=FD=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qicSy-0000Vc-Ew
 for xen-devel@lists.xenproject.org; Tue, 19 Sep 2023 15:16:44 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2058.outbound.protection.outlook.com [40.107.13.58])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 89c3eda5-56ff-11ee-8789-cb3800f73035;
 Tue, 19 Sep 2023 17:16:42 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB9201.eurprd04.prod.outlook.com (2603:10a6:102:232::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Tue, 19 Sep
 2023 15:16:10 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Tue, 19 Sep 2023
 15:16:09 +0000
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
X-Inumbo-ID: 89c3eda5-56ff-11ee-8789-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mMNbw3SYh0ifZXqJwkQt9Bo+KkOQ/sVSqCbNuSRjrPJCL5cs9fnrfDgVrLX6xw4rL67uTyNSoSEErNa2cADjie+GuULSbFgS8FjAHWBJdNynxw7Ez3Qhu+mejgX/R46dTwpOujNpDid7Tt6QT9CdfWD04lyJmVb6jUZWYqqQ3OPCfHkI4T7+T6bhFgwThKS54SX6hNRnjhlxjcqCfitkCmf8prx48LyknZXmiJiVmj9K7O8+Rc+wLtZ22sc5SNpXH7W7alIivwoOKZakEXCcPi+B63jicSju9dTRUaa03RXshkxGK9YaOaZk5wzQMNTUxYLsH838DKiR3PoAgiLreg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+biRC43RtJaJPNPS+CrzW2LbFXmlEJbVAG3TcDRo2hE=;
 b=Z5gzRy75Blu5IY0T2JDawkA+stABiNAkP7jDZWiX9MOtTN6oCaMnyCXQD5Na7p1z068cfewMctFzqSh0d7K8TkPHXMW4nJh5NBbkWpM9cH5Ct7wrdluQE+2HjRr3w4HH+FDpIjCqbozPdKtXuhaddnFpLvdIoh7HEBn+SbDuQjzr6lHqykkSjanXsCzXzFVHwkB0K9Lruu8ygJAY2UijXDs0o2om0yOtVvFurCVUjyxBUN+08alb/FYuiHYqWQPopl0QsUUle8tOgb7j7L9QNnA+JC5pPfJr8bsc6JMvAGBAuzCWfq+4y9jmZGmhuiCI5TUdL6d/15U73ezy9R48jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+biRC43RtJaJPNPS+CrzW2LbFXmlEJbVAG3TcDRo2hE=;
 b=Jh0lObapRmeDYNuRYYTdwA2n0YqxW4A4tvCwiaO5/Du5yANfRwArwBnbukRQKv6C3yYcezPlUZs/fqnCSzVttJg8vuYWesYlaf7N3XK8obbkFkA0oezCzokuqaYIjUlmkPSZE/1vyWGoAo/7q8n65kBSYrH83btLC8OTI8k02V6iZMhyUErv8O4f8sIv+2o9f2y9vqgTxsf3iZkBJJz1ZPjOWgRn80cYr1xD8mistRELxLKN28ljqvJkd+LiEFK/h8hkd9YbPay8NGZx01/2IYyZZANEB9NZaVHO1Nbh/Hkn/HNFi95jGcDnhKXf6f9FG10QxRzARlKdEfxBSWNIOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <64161126-f1e1-1b5d-8491-947e2cb041e2@suse.com>
Date: Tue, 19 Sep 2023 17:16:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 04/10] x86 setup: porting dom0 construction logic to boot
 module structures
Content-Language: en-US
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: Daniel Smith <dpsmith@apertussolutions.com>, stefano.stabellini@amd.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Luca Fancellu <luca.fancellu@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Rich Persaud <persaur@gmail.com>, xen-devel@lists.xenproject.org
References: <20230701071835.41599-1-christopher.w.clark@gmail.com>
 <20230701071835.41599-5-christopher.w.clark@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230701071835.41599-5-christopher.w.clark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::15) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB9201:EE_
X-MS-Office365-Filtering-Correlation-Id: fb662bd3-a600-4d42-bf16-08dbb9235a81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KtWHet+gLAT1pAhzfxeDuJTOwQvSF5I+akZpgJk8SS7oU39c7oHjo3ZRIrxSErC8CSh2/HluNRLOmmNy7V5IbSqiwFbdlo7ZaOCXQOzkTH3F6WwVgtMomOZd6Jxk41SIWsi8ho1S49cuj4j7iM4nsxpMiiZdYhy/qDxsj/efR4X+pE9nllN9ZI7jtTqqMgmJj42d1Hb4VQ/fWSeruJa72/Ogiza+OHA2BBb9MGtHcejEavlWhaxaUg89WoojA2aI5NA8xh97/zL6a3he7fW98wJr1NPMUzQobW2Cy3dekFtFWd5tVX2W6ayl/lBDHQLzRRWHZV+xGWaYx76MIhFqdHOTlilm5ZKn3B+xkLeF0aDPyw7PC1h317H5mhg/SuFn+qNMrRo0ZeKQGep2d4Wz1h4ESFVRMnydwck4ERonvbKEfswvEIuy+pzVeRAzlZ71iRaW0MWpk6TTXNe3+r1iBbQCATN4/of+WDwIgqZBraxNw55UFmyTrWKcbmEVgEXI5n3fw5FQtHf1xV+Orz+ICIfEQQwNf1CNTKPLB50SWMEhFGeKnDzCxnIXp9h0upMLvthjOpZIvlFiHzFg6Olyph3Kg6xZp8eisUvVM7WlxFN6vnZHBfo4yAITX9gWPyQ2CLAk75r76Df4pK/44KFnQA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199024)(186009)(1800799009)(6512007)(54906003)(66476007)(66946007)(66556008)(316002)(6916009)(6506007)(6486002)(31686004)(41300700001)(8936002)(31696002)(4326008)(8676002)(5660300002)(53546011)(86362001)(478600001)(2616005)(26005)(83380400001)(36756003)(7416002)(38100700002)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFNoODdyVG04aEozOC8rQ1l4aVcyQWVuRkNsZXpBK1YvZVhOSU5QUFhGeS9L?=
 =?utf-8?B?NVNJZkRKK2FzNHhhZHhEV2J1L2lMNnVsT3FiN3J4dVBSR01Ca2hsZ3dhcjhn?=
 =?utf-8?B?R0pVVG05S3hhMHp0Q0xZNEtLNEI0Si9FbWpLMGIzNldBazlzcml2alJENGFw?=
 =?utf-8?B?eFhzSmFEVWpaaDBKUFRVYTNmcE9xaXB5cGdyRmpaN3RKQnhhZ1pJMnpMVUJB?=
 =?utf-8?B?OG1qT2NseTRDbEJCQ3RuVGxCa01tZU92Qkx2SURRam9PbmUzVTRZaVVMaHVr?=
 =?utf-8?B?YWNPcHc5MVM3MXArM2l5MGRuK0w5eDRIZWRsL1BYUUpmZ3NQRnR2YzkxRExF?=
 =?utf-8?B?K2U0QzFoVk96MkJzc1pDdmJjUUxPNys2TkRXT0pIcnl6b1hKVXQ0TkpISjlN?=
 =?utf-8?B?Vkh2SXpOSU00MmlHelYvK2tSelhpS1VLQVNacUgyWjZPMWUzVUU0Mi85eHhq?=
 =?utf-8?B?UEdjSzJjYk5nR3ZpTGdMckZjWnlTK2Vid2lTRXl2ZHd4cXEvNGFCNERzeGww?=
 =?utf-8?B?QUp5RTNXeFE1a3d1b1d5cGxELzk2YS83U0pweW1JZG9PSzBYeUQzQ2dCZmZy?=
 =?utf-8?B?WTlKTXlQNENVVFZyMGhaOE82d3lDQlg4L3pXd3ZIbjRuQUpWbU1FSGlTOUp0?=
 =?utf-8?B?TVVyREh5LzBxcC9RUTlmL2lBSUZjWnd3SmFFZW9scmt6bGlIOWgrMHY5MCtO?=
 =?utf-8?B?bC8xamQyZ0F0WjB6aGp5c2xzRnBMRUVGbDNMaW1oc0xja2dTTC9GMEZnN2V1?=
 =?utf-8?B?NGpzMnNzZDdKbjFFSm44UHZkbUNlOWlvUnNieWRuUC9oVTFpaUpCUm1mYUoy?=
 =?utf-8?B?b2pXK21YdE5tbngxSm5iSTRDVmx3dWlJYTdiT05EVlFjQk1makF1TWRPTHRm?=
 =?utf-8?B?bnM3UmhpaHBaR1dBWHFHQWQ2N3RHcjVYYWRRdTBxUlhleFhMRGVvdEo3Tjky?=
 =?utf-8?B?Ymg1QjVKRWFVK3VmTlVtYWMxQU53aXFjTklrektqd3VvTm1JMEl0WHJlSWQ2?=
 =?utf-8?B?c0pGZitrUC9tYUhqRkhiTFpKVG03cTFWbEo1V3hIMmlJcXFFZ210TVBYckpy?=
 =?utf-8?B?ZGMybktWTy83NGN4YnAyYUc2c25GNk5qc3d6SE1WWTFsL0MzZXRpS0Fzdmlj?=
 =?utf-8?B?aEtwT3dsdVJDTTRvS0U4emRiTStiZkM5M2dLM2NyUzVFd0djaVQvMXVYS3lU?=
 =?utf-8?B?L1NyOXVldlhGU0Nvd292TDRkZUhnc3FTRzdLdERSK05aSlJRdldZZ2hxMkp6?=
 =?utf-8?B?MTRPZE9ZMytQTUJ4Zml4L3pzeVZvajVmSnZ5cmorNmUyOHpMMHNFYjE0N3d6?=
 =?utf-8?B?THFRNGY3Yk1ZMHBYR3YyM0hPMmlweUUxdG8valNEUk5FekJETjVrekQ4Wnhj?=
 =?utf-8?B?VVhRVjBVYURyMml5c2NkRjA2WjNZU2tVcGs3T01DZEJNb2VDcjRjN3BXaVdV?=
 =?utf-8?B?dTFIWmpuQW9WQXJyNGw2S0xqdHg0ZmtMQWFGRVdqbUhkNklJb212eU1PL1Q1?=
 =?utf-8?B?QkNWNkVmS0g4SVJwc2U3RVZPMkd4eFFWeTdMUHdBWldhMHlXSkhlU0NqMzBn?=
 =?utf-8?B?cHI4UVJMQ2xxc1psSllMdm02NDFXaTNxdWdaY1V5MysrUnRSSGF6ZU5PQkkx?=
 =?utf-8?B?bTJLUUFFd3E0NFRkc0o5ODVXalZKRUZzR2pIQmhKbFlUS0IyU1pvcDlXVWJU?=
 =?utf-8?B?SVhNbHlzenc4ZWhpRVdLT2xMdlpSODhyVGdaeGVEOHhOM2s5TzQ5ZlNEcmJo?=
 =?utf-8?B?TCtjNkc5dGRHTHJDMWpYNk5CVFFPWGc3YWhqdngwY1BNeGhvenhIcEhQNjkz?=
 =?utf-8?B?YWtIV2hsVUtUSk1KcDBXV1kyc3hnbndzZnV4Yzd0ZXhXcThXV0E0c1pMZm9L?=
 =?utf-8?B?bkpOcmNFMFBYa3I0VmFKdkwwRVluSW95ZkNZSzcyM3o1OWcxRjhZVGNMUVRG?=
 =?utf-8?B?NXlrT1N3WVFaV2dYNmlMV2IwSjRTRWh3R3FEYUJ2bXRlMjJVVm01V1d3TGJT?=
 =?utf-8?B?cGp2S3lKalF5VmN0U1BhMFZ0SmdGODFqaVcwZUpDRkxwL3dPeXVYZ0tBQ0o1?=
 =?utf-8?B?T00zcXorbkRBRlBVd0N0WGdqbm4rQ1NhTmpOQnpTdGhJcDh0RmpIZUxJVHZs?=
 =?utf-8?Q?MH2tnLuiRcZk5lQYa4N0izB9G?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb662bd3-a600-4d42-bf16-08dbb9235a81
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2023 15:16:09.7659
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MAtru28bFqorJyXUYV9yegGf8sh3XYSNBmCvJsUO2ESnmOhYIV29ywgfbBS14q+LdWoEbrknnEW5Bdd+iqUy4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9201

On 01.07.2023 09:18, Christopher Clark wrote:
> --- a/xen/arch/x86/include/asm/boot.h
> +++ b/xen/arch/x86/include/asm/boot.h
> @@ -19,6 +19,42 @@ static inline void *bootstrap_map_multiboot(const module_t *mod)
>      return bootstrap_map(&bm);
>  }
>  
> +static inline unsigned long bootmodule_index(
> +    const struct boot_info *info, bootmod_type_t bootmod_type,
> +    unsigned long start)

unsigned int?

> +{
> +    for ( ; start < info->nr_mods; start++ )
> +        if ( info->mods[start].bootmod_type == bootmod_type )
> +            return start;
> +
> +    return info->nr_mods + 1;
> +}
> +
> +static inline struct boot_module *bootmodule_next(
> +    const struct boot_info *info, bootmod_type_t bootmod_type)
> +{
> +    unsigned long i;

Again.

> +    for ( i = 0; i < info->nr_mods; i++ )
> +        if ( info->mods[i].bootmod_type == bootmod_type )
> +            return &info->mods[i];
> +
> +    return NULL;
> +}

What is "next" meant to express here? You always return the first module
of the requested type.

> +static inline void bootmodule_update_start(struct boot_module *bm,
> +    paddr_t new_start)
> +{
> +    bm->start = new_start;
> +    bm->mfn = maddr_to_mfn(new_start);
> +}
> +
> +static inline void bootmodule_update_mfn(struct boot_module *bm, mfn_t new_mfn)
> +{
> +    bm->mfn = new_mfn;
> +    bm->start = mfn_to_maddr(new_mfn);
> +}

Why two functions setting the same data and overriding each other?

> --- a/xen/arch/x86/include/asm/bootinfo.h
> +++ b/xen/arch/x86/include/asm/bootinfo.h
> @@ -2,9 +2,33 @@
>  #define __ARCH_X86_BOOTINFO_H__
>  
>  struct arch_bootmodule {
> +#define BOOTMOD_FLAG_X86_RELOCATED     1U << 0
> +    uint32_t flags;
>      unsigned headroom;
>  };
>  
> +struct arch_boot_info {
> +    uint32_t flags;
> +#define BOOTINFO_FLAG_X86_CMDLINE      1U << 2
> +#define BOOTINFO_FLAG_X86_MODULES      1U << 3
> +#define BOOTINFO_FLAG_X86_MEMMAP       1U << 6
> +#define BOOTINFO_FLAG_X86_LOADERNAME   1U << 9

In how far are all of these x86-specific? And are they needed at all?
Can't you internally use respective fields being NULL as good enough
indicator (looking at e.g. the places where LOADERNAME and CMDLINE
are inspected).

Also the values are all missing parentheses.

> +    char *boot_loader_name;

const char * ?

> +    uint32_t mmap_length;
> +    paddr_t mmap_addr;
> +};
> +
> +struct __packed mb_memmap {
> +    uint32_t size;
> +    uint32_t base_addr_low;
> +    uint32_t base_addr_high;
> +    uint32_t length_low;
> +    uint32_t length_high;
> +    uint32_t type;
> +};

This looks to duplicate an existing structure, without removing the
original, and without annotating both places to mention that they need
to remain in sync. Question of course is why you need a 2nd struct
definition in the first place.

> @@ -269,20 +273,44 @@ static int __init cf_check parse_acpi_param(const char *s)
>  }
>  custom_param("acpi", parse_acpi_param);
>  
> -static const module_t *__initdata initial_images;
>  static struct boot_info __initdata *boot_info;
>  
> -static void __init multiboot_to_bootinfo(multiboot_info_t *mbi)
> +static void __init multiboot_to_bootinfo(multiboot_info_t *mbi, module_t *mods)
>  {
>      static struct boot_info       __initdata info;
> -    static struct boot_module     __initdata boot_mods[1];
> -    static struct arch_bootmodule __initdata arch_boot_mods[1];
> +    static struct arch_boot_info  __initdata arch_info;
> +    static struct boot_module     __initdata boot_mods[MAX_NR_BOOTMODS + 1];
> +    static struct arch_bootmodule __initdata arch_boot_mods[
> +                                                       MAX_NR_BOOTMODS + 1];
>  
> +    int i;
> +
> +    info.arch = &arch_info;
>      info.mods = boot_mods;
>  
> +    info.cmdline = __va(mbi->cmdline);
> +
> +    /* The BOOTINFO_FLAG_X86_* flags are a 1-1 map to MBI_* */

I would say the comment should go in the header and here you want to
check the property via a set of BUILD_BUG_ON().

> @@ -1147,19 +1177,22 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>             bootsym(boot_edd_info_nr));
>  
>      /* Check that we have at least one Multiboot module. */
> -    if ( !(mbi->flags & MBI_MODULES) || (boot_info->nr_mods == 0) )
> +    if ( !(boot_info->arch->flags & BOOTINFO_FLAG_X86_MODULES) ||
> +         (boot_info->nr_mods == 0) )
>          panic("dom0 kernel not specified. Check bootloader configuration\n");
>  
>      /* Check that we don't have a silly number of modules. */
> -    if ( boot_info->nr_mods > sizeof(module_map) * 8 )
> +    if ( boot_info->nr_mods > MAX_NR_BOOTMODS + 1 )
>      {
> -        boot_info->nr_mods = sizeof(module_map) * 8;
> +        boot_info->nr_mods = MAX_NR_BOOTMODS + 1;

This makes for a transient disconnect between module_map's size and
MAX_NR_BOOTMODS (which only so happens to be 63; it could well be
another value).

> @@ -1459,14 +1486,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  
>              if ( s < end &&
>                   (headroom ||
> -                  ((end - size) >> PAGE_SHIFT) > mod[j].mod_start) )
> +                  ((end - size) >> PAGE_SHIFT) > mfn_x(boot_mod[j].mfn)) )
>              {
>                  move_memory(end - size + headroom,
> -                            (uint64_t)mod[j].mod_start << PAGE_SHIFT,
> -                            mod[j].mod_end);
> -                mod[j].mod_start = (end - size) >> PAGE_SHIFT;
> -                mod[j].mod_end += headroom;
> -                mod[j].reserved = 1;
> +                            (uint64_t)boot_mod[j].start,

Another case where you no longer need a cast afaict.

> @@ -1492,13 +1520,14 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>  #endif
>      }
>  
> -    if ( boot_info->mods[0].arch->headroom && !mod->reserved )
> +    if ( boot_info->mods[0].arch->headroom &&
> +         !(boot_info->mods[0].arch->flags & BOOTMOD_FLAG_X86_RELOCATED) )
>          panic("Not enough memory to relocate the dom0 kernel image\n");
>      for ( i = 0; i < boot_info->nr_mods; ++i )
>      {
> -        uint64_t s = (uint64_t)mod[i].mod_start << PAGE_SHIFT;
> +        uint64_t s = (uint64_t)boot_info->mods[i].start;

Yet one more.

> --- a/xen/include/xen/bootinfo.h
> +++ b/xen/include/xen/bootinfo.h
> @@ -2,23 +2,50 @@
>  #define __XEN_BOOTINFO_H__
>  
>  #include <xen/types.h>
> +#include <xen/compiler.h>
> +#include <xen/mm-frame.h>
>  
>  #ifdef CONFIG_X86
>  #include <asm/bootinfo.h>
>  #else
>      struct arch_bootmodule { };
> +    struct arch_boot_info { };
>  #endif
>  
> +/* Boot module binary type / purpose */
> +#define BOOTMOD_UNKNOWN     0
> +#define BOOTMOD_XEN         1
> +#define BOOTMOD_FDT         2
> +#define BOOTMOD_KERNEL      3
> +#define BOOTMOD_RAMDISK     4
> +#define BOOTMOD_XSM         5
> +#define BOOTMOD_UCODE       6
> +#define BOOTMOD_GUEST_DTB   7

Not all of the constants are used here (and I don't mean Arm-only ones), so
I wonder how they're reliably assigned. Without assignment ahead of use
(via e.g. bootmodule_next()) it's not entirely clear what the purpose is.

> +typedef unsigned int bootmod_type_t;
> +
> +#define BOOTMOD_STRING_MAX_LEN 1024

Is there any chance of getting away with a hard-coded upper bound? You have
...

> +struct boot_string {
> +    char bytes[BOOTMOD_STRING_MAX_LEN];
> +    size_t len;

... a size field, after all.

> +};
> +
>  struct boot_module {
> +    bootmod_type_t bootmod_type;
>      paddr_t start;
> +    mfn_t mfn;
>      size_t size;
>  
>      struct arch_bootmodule *arch;
> +    struct boot_string string;
>  };
>  
>  struct boot_info {
> +    char *cmdline;
> +
>      unsigned int nr_mods;
>      struct boot_module *mods;
> +
> +    struct arch_boot_info *arch;

Along the lines of the question on the earlier patch: Why a pointer?

Jan

