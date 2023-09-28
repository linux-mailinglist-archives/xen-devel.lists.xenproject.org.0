Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1927B12D0
	for <lists+xen-devel@lfdr.de>; Thu, 28 Sep 2023 08:26:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.609272.948251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlkTI-0005jf-GE; Thu, 28 Sep 2023 06:26:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 609272.948251; Thu, 28 Sep 2023 06:26:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qlkTI-0005h3-D3; Thu, 28 Sep 2023 06:26:00 +0000
Received: by outflank-mailman (input) for mailman id 609272;
 Thu, 28 Sep 2023 06:25:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ur7q=FM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qlkTG-0005gx-Hr
 for xen-devel@lists.xenproject.org; Thu, 28 Sep 2023 06:25:58 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20626.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::626])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e1659134-5dc7-11ee-9b0d-b553b5be7939;
 Thu, 28 Sep 2023 08:25:56 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7809.eurprd04.prod.outlook.com (2603:10a6:20b:242::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 06:25:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9f5d:8bed:7a5b:e75a%6]) with mapi id 15.20.6838.016; Thu, 28 Sep 2023
 06:25:53 +0000
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
X-Inumbo-ID: e1659134-5dc7-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQNPgjnV6tUhpm7vo47/qxAFAqSH0DYTtcJEpxvNNa4ZMDjjgIduKadKZTC4NDW2B/TjR+mKgvTcLO7urFscOL/ZaO9tOJLlB+mbgoZg8h2A3bl0CxZS+nVCjQLR4hhzpiFo0yi2Jex+oClScboRkkQp6TAsqinfa+tXhd3m4a2eis7CP/gwvCXql+2U5lHl13tbbL/hq4uNHbUqjvxpLdjPpugigbEEnn25c5AW1SL/8+B7gF79V3hk7ITZhZthRRKozHsNyKDhBZTHZm+vOOPdajk7ugV8im2HbFOzdzu5yByj93RXY0NowH/FRLaZ9IDt6Q21ZY8bfApuJPZ/QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sKQTNh+YhOkIo/Whcq7H0tmI5hZxy65obV9kR55ubmA=;
 b=Zeh/B4ZmiD2p4nsS3xE51vQy8FPXcujEsSORT8ncyyv9dT5ry9o3J/cYVsYM6KpBJlK8dRdk9gAph9N2xsIkqIIPLTDYgpkkxtrXPNdU+TfuGmQmDcc2a2uLbGb4ykv8cc/xb7OwfDhLW8fR5yzPgFrJznfBff5+gNO/4DJ+qXj8W8PJO6gR/+QOL+jRQG2a6P7ZrnItrw5SWIHi1DSAywq4lugKMii+p8cieLiMnksYm7jnNaLU5LnF7gfttHhzakPJOb6kJGVtWotaQkw6ANd7BkZ4Q1Uexi29kN29iRo/QFab1ooH4F08nSkcDvA/TxhpmsBp/HniQ5+5xH/zvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sKQTNh+YhOkIo/Whcq7H0tmI5hZxy65obV9kR55ubmA=;
 b=uUUSgnXbdVDjjGIYakVdgD4vvZDrwYTWP23J41JOTQoOTZLY0KxM3+mG/wEjEwtXUL7+B+2l+LOYcoMrWP2zpMv4+Qubi3wIvcdqnzetLJ/5gRikFO8WHq0lSQ4IvUU6cJJ5DwCugajx6/iSaUpviGlc4KVFfTGF9XtOf7AcO76AvBbS1hgKs28h8fFGkzVaDd8P/brDXC43AMALNE+uYPg/bGrJNVC0Sdybo4IA9aKFl2wDebkw47dz3ek9PF+P2FYPIbmVBLsxzENsmjS1kqLa9i/LwnP5aY/okP7hJL8gSEtdRhj4575TfkJ7Fxa9l2CptsdhCoKKbABz/Cx4LA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3727a667-fada-faea-27ec-cde7612c358d@suse.com>
Date: Thu, 28 Sep 2023 08:25:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH] x86/domain_page: address violations of MISRA C:2012
 Rule 8.3
Content-Language: en-US
To: Federico Serafini <federico.serafini@bugseng.com>
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Henry Wang <henry.wang@arm.com>, xen-devel@lists.xenproject.org
References: <6f3538a91f719611e719066237568163ae90c95e.1695827160.git.federico.serafini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <6f3538a91f719611e719066237568163ae90c95e.1695827160.git.federico.serafini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7809:EE_
X-MS-Office365-Filtering-Correlation-Id: 1720ef4b-850f-4e73-81a3-08dbbfebc446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mLtGF1lcFSmI3Ty3ibSWZ9HLSYVCIoYlDb9p0Ica0Ug2h3uRlxV4TSKb+xPR1ur2MLkvrNdG45hv2OGmCkpy4lIv4UX4NbeQyQWBW7zKWVoTWfQWaztzlxhqPJcIsSVGcDjHWaVaf2Wh7fausxsfBIhag4KqpUBIBWof0PlhQOjB6MCkcyvBwWGeRLTAkSqJ0REm60cUCOh+QA7hRtSc1/c0cSEjeYdTRSPiMnDK0hnkYYAp4bmrpAtloXJAqvp8SdEheicD169a0cS2tNStm7sBDMjqTuWG5mYL2mArBBc5myyq3nvpOulZufZ8qNaN2rIuT59+YB7M4rtXmfOvnlzI/+oBq+bE7AvvFmYNnIl5Clo/u2NJhWHLlNdttcqyExJ9/v/he4OWJQ5VrD5uJSVnKBh8IScn0NMOs+hH5opZXMJSiostZw9B69Y1FkjabcSlQPEhafHPCqhOCgVPVHm4LaKXubr5fbd9xqR6ewKVja/QJ7q/yM3SD+fV5LiqMihdT5vKZ/R1NRffhs5MdJB+yW7E2oHp3Wei230uss5yhKcB/cF/C9yE/uVti1vnSXhxVzzrW27tVeVeZaZUT4/8IT7YmFChGTpe0/sYv47VaMyj9AFCzbINYpTrVGsp9tu/nTNXG2W+T2C6yepIVA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(39860400002)(376002)(396003)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6506007)(26005)(66476007)(66556008)(86362001)(6486002)(6512007)(53546011)(31696002)(478600001)(2906002)(38100700002)(54906003)(83380400001)(6916009)(316002)(8936002)(36756003)(2616005)(5660300002)(4326008)(66946007)(8676002)(41300700001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L3NZSHoyNCsvVEU4eWZ3c24xelE2T1UzeEYwRmo3TUhXd215czQwbkc3czlr?=
 =?utf-8?B?WjI1VjVPV0RWN3o2c1J6dmNDTTY2Y3d3YTZIQnRVWDl1YTg5bXFwNDRReVIz?=
 =?utf-8?B?QlZBTERSbEJ0ZW43bThmZ3ZpVWJmNnVrQlBteGowcVFVcVp6bnl6eUdjOU5H?=
 =?utf-8?B?cDZiS00wOHhEZm10ZjU4WUl5bExFN0pSQVJ2VnJqbHJMTTBmRnRzTDh0VXdS?=
 =?utf-8?B?QVFZM1V1aGFmVm50SDdveXMyV2lYd1BNdjFkclBvQnBwSjJ1N2lKYkU3cjFX?=
 =?utf-8?B?UERZT2hzbmtoeVM2VXRvTnBWY1pNbzJNZDU5by9yUng4a3hzRWVJNkt3RFox?=
 =?utf-8?B?bDY5OGRXT1hGOTR1elk3cXZtZW05K1dNQjN4SmF1bktoVTdNMzNWbHphWDJ6?=
 =?utf-8?B?WVUycTQ5MTZnQWx3UXZlQUI0Mmw4cW1HRVFtbDB0aDNtTUVKU0FyaE1rdndq?=
 =?utf-8?B?MFIrWGVIQWlMVktOQU15MTUvOWJXa1RNYnRUVHNaVkk4VWh2Y1J1MnRQeHdW?=
 =?utf-8?B?aEFyenplYkl6LzNPZVNkendub0ZPNGYycDM4eDNPRHo3NU80ZXU4RXdrYkFl?=
 =?utf-8?B?U1RsTjVGNGd2bzhwV28zdTAvK1VEZDB5dUdQZnlRU2NHcXRKS2FqNzdRcmVF?=
 =?utf-8?B?bk5YTm9kcXB5UmF1MDlXdU5GNmJhVXZCTE5YQXJ1S2lCOVR5TStka0ZQSmZu?=
 =?utf-8?B?elJ4bTV6WHlQSU9ZOG1teGNsSSsrNzVZRi8rTmNqVW1YUkVlOEdoT2lNb0hI?=
 =?utf-8?B?TEhFN3FVRGcrSG9DUktmVytLbldWSC9LdFNPRUVPNWVKLzZwcHU3L0hFR3dF?=
 =?utf-8?B?U3NiUE5vckZ6OVRLQVdlRXNMTjQvTzYrRndLeVdUY2lETUl0NHMwUWI3Yyt4?=
 =?utf-8?B?cUM1REpFTzZwcnZQekpyWE9yVjFIbk9ibVpuVHNyNCtHdzNvaWg3dDNrRjJr?=
 =?utf-8?B?RVRPMzgxQ1FtVHBySytBc2RSaGk3ZVdmMEJ1U05FOHU2eHkyell5MmpWRnVX?=
 =?utf-8?B?eFVXRWtzVHd6RG5sbUI4QmYyUkdsM2QwcjRDYjBRWVBSSXB2dGhYVDNyUW9X?=
 =?utf-8?B?b1VqZ1IwSWxDWUZlYlpxM3BjWjYzcG1rYVU4cmhLVEM3amFZMVRDamYrbTFJ?=
 =?utf-8?B?RFcvZDFqaFpOZjhKa2cxMG40LytIRmsvTWJDa1RpSGdwWlk1dS8xejRqMFIx?=
 =?utf-8?B?MmxSdEN0UDJ6MHd1WHZYMWhVSC9EMFA4UnY1cGsxV1NvWlM5ZDNWWTUwcjBO?=
 =?utf-8?B?dDRaS0ZpdUt0eWtiYlZnZ0hVM0FtcG9tWlU5cHQxY29PNE5vR3BMcm55QzB4?=
 =?utf-8?B?djdQQzcwdkc3WmZ5dTJDMHE5cWtYd2JIZmZ2dDNIMHJRQWxnNnlhT3JtV3dN?=
 =?utf-8?B?ZE90VUhXeGY3UFU1MmZhbWpvaXQzTUxkRWQzMURWNXBBSXp6dERJblU0VVRq?=
 =?utf-8?B?SFIrVkdtMldlSDJFOVNhZitnZFI0Y0paWW5pQzE4UVR6UTRDc25pcmRoSk5Z?=
 =?utf-8?B?TjA2bno2UkZOY1cxaEp4bzNnZG93S3NPU3pRdHpKQ0VYMVZyUHNvTFVXc3Rs?=
 =?utf-8?B?c05vTzlhVUhxTVRiM0pkNjVhVkhSaFNWaTVnZ0dtNW9TOUhWa1RzOGE2V0JI?=
 =?utf-8?B?dC9xSjdlZE10aElrWU01bm90b1JEOVVGSmlKL2h3elRyb0hveEgzandmNzQ2?=
 =?utf-8?B?UGIyR2F1V0VwdC9pRFBUZDdTdS90dFdSejVTSEZ4THY0VnA0ZWxjZHJ1VWtL?=
 =?utf-8?B?R2FTOWh5b0k4MXRoWWdtVWgyT3ZmUkVXTEJOVDFUTm9saGxCOXd3elA2cUI4?=
 =?utf-8?B?aFdWUFBpZ0c5akpkVGZsTDJWKzh4aUpRRjBQTUl4UWxPNnJvcGUydWI0U2F3?=
 =?utf-8?B?Q3dVYlA2aHJyTnU3cFNHZ2dwYjNSa2ZBWFFTc2FkZ1I4VEJQR3dDdTdiNFAv?=
 =?utf-8?B?bzlxcitGZ1lDcUk5TCtVSnA2dk5ZalJXL0hiNVZadmcyQ0VFUzJObXVFKzRj?=
 =?utf-8?B?S3hOU3lablozSVA4czFSTm5sRG45NFQyNHNuWEtIYXJ0ZTNmczV4c0I0WG5p?=
 =?utf-8?B?RDdwZU9meUhFZW8zaUdEOW5KampBd21UTTR0MlE2cHA2b1pPSGJSUlc5c2FD?=
 =?utf-8?Q?5jLVaIwAyH6yTvJQbG1BMnhNg?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1720ef4b-850f-4e73-81a3-08dbbfebc446
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 06:25:53.5736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vf0E4m0HfrFDIcmol/YDjylKuEIOa/dg7eya/PcH6wJqZ2RXVAKB2/9i7lNehghWM6owv6MRHDHpq9uOnQM/HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7809

On 27.09.2023 17:09, Federico Serafini wrote:
> Make function declarations and definitions consistent.
> No functional change.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/arch/x86/domain_page.c | 36 ++++++++++++++++++------------------
>  1 file changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/xen/arch/x86/domain_page.c b/xen/arch/x86/domain_page.c
> index eac5e3304f..1cfa992a02 100644
> --- a/xen/arch/x86/domain_page.c
> +++ b/xen/arch/x86/domain_page.c
> @@ -173,18 +173,18 @@ void *map_domain_page(mfn_t mfn)
>      return (void *)MAPCACHE_VIRT_START + pfn_to_paddr(idx);
>  }
>  
> -void unmap_domain_page(const void *ptr)
> +void unmap_domain_page(const void *va)
>  {
>      unsigned int idx;
>      struct vcpu *v;
>      struct mapcache_domain *dcache;
> -    unsigned long va = (unsigned long)ptr, mfn, flags;
> +    unsigned long addr = (unsigned long)va, mfn, flags;
>      struct vcpu_maphash_entry *hashent;
>  
> -    if ( !va || va >= DIRECTMAP_VIRT_START )
> +    if ( !addr || addr >= DIRECTMAP_VIRT_START )
>          return;
>  
> -    ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
> +    ASSERT(addr >= MAPCACHE_VIRT_START && addr < MAPCACHE_VIRT_END);
>  
>      v = mapcache_current_vcpu();
>      ASSERT(v && is_pv_vcpu(v));
> @@ -192,7 +192,7 @@ void unmap_domain_page(const void *ptr)
>      dcache = &v->domain->arch.pv.mapcache;
>      ASSERT(dcache->inuse);
>  
> -    idx = PFN_DOWN(va - MAPCACHE_VIRT_START);
> +    idx = PFN_DOWN(addr - MAPCACHE_VIRT_START);
>      mfn = l1e_get_pfn(MAPCACHE_L1ENT(idx));
>      hashent = &v->arch.pv.mapcache.hash[MAPHASH_HASHFN(mfn)];
>  
> @@ -317,30 +317,30 @@ void *map_domain_page_global(mfn_t mfn)
>      return vmap(&mfn, 1);
>  }
>  
> -void unmap_domain_page_global(const void *ptr)
> +void unmap_domain_page_global(const void *va)
>  {
> -    unsigned long va = (unsigned long)ptr;
> +    unsigned long addr = (unsigned long)va;
>  
> -    if ( va >= DIRECTMAP_VIRT_START )
> +    if ( addr >= DIRECTMAP_VIRT_START )
>          return;
>  
> -    ASSERT(va >= VMAP_VIRT_START && va < VMAP_VIRT_END);
> +    ASSERT(addr >= VMAP_VIRT_START && addr < VMAP_VIRT_END);
>  
> -    vunmap(ptr);
> +    vunmap(va);
>  }

Up to here a statement in the description is needed why this apparently
much heavier code churn (compared to changing the declaration) is still
the (likely) better approach. (It may still be worthwhile to consider
changing declaration and Arm code, for "ptr" being the imo better name
for a const void * parameter, and "va" being more specific than just
"addr" as a local variable.)

>  /* Translate a map-domain-page'd address to the underlying MFN */
> -mfn_t domain_page_map_to_mfn(const void *ptr)
> +mfn_t domain_page_map_to_mfn(const void *va)
>  {
> -    unsigned long va = (unsigned long)ptr;
> +    unsigned long addr = (unsigned long)va;
>  
> -    if ( va >= DIRECTMAP_VIRT_START )
> -        return _mfn(virt_to_mfn(ptr));
> +    if ( addr >= DIRECTMAP_VIRT_START )
> +        return _mfn(virt_to_mfn(va));
>  
> -    if ( va >= VMAP_VIRT_START && va < VMAP_VIRT_END )
> -        return vmap_to_mfn(va);
> +    if ( addr >= VMAP_VIRT_START && addr < VMAP_VIRT_END )
> +        return vmap_to_mfn(addr);
>  
> -    ASSERT(va >= MAPCACHE_VIRT_START && va < MAPCACHE_VIRT_END);
> +    ASSERT(addr >= MAPCACHE_VIRT_START && addr < MAPCACHE_VIRT_END);
>  
> -    return l1e_get_mfn(__linear_l1_table[l1_linear_offset(va)]);
> +    return l1e_get_mfn(__linear_l1_table[l1_linear_offset(addr)]);
>  }

This change, otoh, moves the violation from x86 to Arm, afaict. IOW
this likely wants taking care of by changing the declaration. Then,
for consistency, the consideration above gains one more supporting
factor.

Jan

