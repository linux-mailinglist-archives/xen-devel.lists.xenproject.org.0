Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 98426749773
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jul 2023 10:27:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.559776.875078 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKKF-0004pu-RN; Thu, 06 Jul 2023 08:26:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 559776.875078; Thu, 06 Jul 2023 08:26:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qHKKF-0004oE-Nu; Thu, 06 Jul 2023 08:26:55 +0000
Received: by outflank-mailman (input) for mailman id 559776;
 Thu, 06 Jul 2023 08:26:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jdui=CY=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qHKKE-0004o8-AB
 for xen-devel@lists.xenproject.org; Thu, 06 Jul 2023 08:26:54 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dbeffbfa-1bd6-11ee-b237-6b7b168915f2;
 Thu, 06 Jul 2023 10:26:52 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AS8PR04MB9510.eurprd04.prod.outlook.com (2603:10a6:20b:44a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.17; Thu, 6 Jul
 2023 08:26:49 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::9bd3:48c9:ff58:9880%4]) with mapi id 15.20.6544.024; Thu, 6 Jul 2023
 08:26:49 +0000
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
X-Inumbo-ID: dbeffbfa-1bd6-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WMyAFVtbP7WjBFtGnATtvc5d4RsmuopCFw7y0wovvkvpFEmVMXhEcCnUoZdU71pGnoNQp5aVtKhVGdENgfLgvi+j8UbmEpaasSgbYW5u45rGvAXhNREbztv5bTCmFx6+1gP3TDqB+wF6WEaf6MhtH/1b8svej1YMpGnPhOQVdzoGqfvCejJjuNjw+6NIRb3SWhfRll6EYYeJp1JfZiDRWE/HN0R7RlzeOOpezBtr53ABTY/jKLhQgmjsHdWrXaMNoaqZfj03K6ieQyuJSVWdHIWCxR7U44NZ2rheWoj+C/q57NGL7TCG5gWnnFevEpGin8UwquV0JgOoqMS0eQ/BGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LAfA0guC5Ov+ZFLS248RHoGYPc6EK5BtnnFn///VmJk=;
 b=OnoC0B5PWDVYx/3KstUCGsyXxwNTTMM0ugzMMNpTUkd7f/b8SQ1roundnLzDx1HI7W+ONNy4Kcm2GdSAqfrzmN+1k0mbsecwcwk5HJzVlE0iWhh2nzzbWF0W42LB9vfhArK6fvgT+oPIdpmNZrM0gSaE2gZAg8qHWG5r7s5vRIBhIGwXUbNpXjOxkI1+t0qrUaO9xjO5t64NyBrQ19RdX6DmZsY5HAB83LwlX/vuyyaZuwAC+cu3dREcmjagSm714CeJklYa25dwrt6uXUyazOD6+FPZd39E51POdKze5ZFf643fvhjHEelFJhi+cFFkpNhyk5eKEsyRNIJQFLUuYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LAfA0guC5Ov+ZFLS248RHoGYPc6EK5BtnnFn///VmJk=;
 b=3nzTord4O9vxWj7+XBLV/YxZX9fkt0qDLoOJuE/VO1//8P8KNgQ2LZADulbG1nNBeA7vwoyD9t7d1JvjEGVwgFTsBP+EZJve1cbPK9BBaV9LyBrfdRaeKpZPrFKq8ZB1EJEAujC4mLKube30i5n/xM/HM85KJk+JMXNe7tx+yBR7knMi072wLHVWFziwBpxwjQOxNftf5HNZ8AwOGp4iEvYSPmhAHzyIF/mruuDSqRSyQXSPVKcJ03Pd10em6pl69RxmIRDZ9v1t+qpUhKAb1Xy1GSlwvoGg2gYxeuQaivcxSLSv3j0XSBy6kStsTND6hOEkq/wvr+hVJ+iv1bCQLA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a343fc97-84df-48e6-1c91-cd933c6e5210@suse.com>
Date: Thu, 6 Jul 2023 10:26:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [XEN PATCH v2 12/13] xen/x86: fix violations of MISRA C:2012 Rule
 7.2
Content-Language: en-US
To: Simone Ballarin <simone.ballarin@bugseng.com>
Cc: consulting@bugseng.com, Gianluca Luparini
 <gianluca.luparini@bugseng.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Paul Durrant <paul@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1688559115.git.gianluca.luparini@bugseng.com>
 <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <e414542d76d4a4a0df6ad969cc6332e355d6ef38.1688559115.git.gianluca.luparini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0145.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::18) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AS8PR04MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: b3daf9c3-6c96-4de0-9f8d-08db7dfabe4f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fPqkS2y9+mNI4/tcNsnEyufcBZtWYPqGy088yI0zb6BRARs3w9XCAKgqtujSqxVqaMZJ7hJQ0lsQ4uJDStWsRkHhdGeGljcqSiklz8U/89bgihwJ/Zcud3ktLpabXWbsfzYJnAPl1+SXCAAF1hkckbhabEFDlgB7//VTd5iTAX1ZSE9Gf02GedS/d+loayhRtlujm+Nn0xuQbCBXMATmIQ8qjAUedJ6QnouIp3OOvLPPVRZsaMvfv3NxklLe5enVu8d/HLAfnjItE3FPdM95Pw9Lt4DV6mkJMxXqFX7BNpUF7AZ2bZHz/Ut2iy9dbjX52yhdO7S8XkEaFdmPXOVtWiHOGquKwFiUxg/BvxAiEljQXvlan14bv7NFQH9Cqgh56OjTcvoAmT6ibP8rBZ9Gc166AkpldYwaMwFuBk/piAas8w8RVit8k0i9rVnai5X4LQY/p9ruB8V6D6UEakNH1Di2kTC1nyMdg0iTfFp/UGe8gdWxTYNEJq1DY58iRYuwJ40FsXug/qWMVQK4wtrwnTVZH1XFChkEJp2As4jqkZgC9h7uZzKl+Mmv2Rn1kTyXc84OHgRkSkV5w1hWcqRWD78YG8N4JieM1Aia5+vwSKYRLT5/0A9NoO4+/9eajfScpSEjIrySTNQVrizOWPLfIA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(39860400002)(376002)(346002)(451199021)(6916009)(4326008)(66946007)(38100700002)(66556008)(66476007)(2616005)(86362001)(186003)(36756003)(31696002)(6486002)(6512007)(6666004)(54906003)(53546011)(6506007)(26005)(478600001)(5660300002)(7416002)(31686004)(8936002)(8676002)(316002)(2906002)(41300700001)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Q21WUm5mOWFaLzVVOTZHaWJ1NGpsU3A3cnA3RFdJYmpkRG5Ia0o2cUpJQjM5?=
 =?utf-8?B?TjUvRGNmdURVNnVPMjE0aTRYUUhMZFZiMklNeEZUcTU3bVhtQ3g5ajlyOUcv?=
 =?utf-8?B?QkY5dkdWc0xnNk1CL2JRZ2U2c3R5cEZGVFdkNTJqYUR5VXI2OTBXMlZEVGRL?=
 =?utf-8?B?bWEvb3VHbGZ2SWFJL2FrR3k5QzgvT0thYmcrbkJWWVpCak1HQTc1RmRKRzBW?=
 =?utf-8?B?U0tTdlVHWThKR3dTakJlak1vWlptLzN4QnZoN2Y5RURtZnhxUW83TTY4bGRK?=
 =?utf-8?B?eDN5R2U4c3JrRDJhakNqbHU5U0F5YzFqZ01CZGg0R01wSC9RS3JXN010dVp4?=
 =?utf-8?B?VEpqaTl6OUZITnM2Y0F6dVh1bDUvWVJGbXZvOFhMclFUYTIwVTF4Z1A1eWgz?=
 =?utf-8?B?SnJBbERSMURpZlFUaC80dHhGY1VuUXVsZnZ0WWJIU0xDbDJHVURLVzNtVm1T?=
 =?utf-8?B?WEdIeTlUU2lKQm5QeVM4TFYzVHJycjBaOTRFMW9KZzRFWEN5a3pJdTJubVIx?=
 =?utf-8?B?ZGxDRHVMaU16MWdNL29oWFBxQzlRejJMZExxRk5Vam4xY3RrekJDU2pCdjE1?=
 =?utf-8?B?cHArQWhLSlh2R1l1TXBBLzJYeGxVM01qMXQydVpSbWQyRGVvd29SRUF0blM2?=
 =?utf-8?B?QTVsZHV2Z3NTQlVQaTdiRmorRFJPTkNRYUZpUHp1aFRTMGFNWXN1T2U1SkNX?=
 =?utf-8?B?L05FY0x5SmNhTjYzbXpYNVZXZElvV2xPVUY3MHEybmpEa250bkhKSHFEeTdV?=
 =?utf-8?B?Nk5NTE94bUlxRDM4V2NMVTNLY1hsUXpGVWk1YzlrZDBxU0RlaW9DZDlBNkNW?=
 =?utf-8?B?ZFQxUmJjb29CdmFaUFRVM2p5akNTS1BzQ3pVU0lyWHgzdk9CdDJRbFhQaTZX?=
 =?utf-8?B?aFNKdjJRc2ZsVlN1ZkIzTUkzWHBVTUlGb1lKcEY3YndYN3lKMHJncG1CcW9V?=
 =?utf-8?B?ZGp3KysrSy96VFd6VXhobUZ5cTZveVU2QUtFdWFHdTB6MWcraWtPc2xOaFpK?=
 =?utf-8?B?Tkl3bnNtUTdYaXgzbDV4MXpRMFk5aUZibDgwa2ZMWHFRL0lpSElOMTJUTE1C?=
 =?utf-8?B?SGkyUUNPOWtkTXRiMXJrUmRRekZWQ0REK0JENHNMTWVsVWkwMVR5UzYyRElC?=
 =?utf-8?B?S09NbHhJanM2OVNVRHhNOVZlR1BkL0JvMWJkcEY5b2xETFlMbi9qZEFjVmo5?=
 =?utf-8?B?QVdtUWY2dzVzRnRnTjlRK0NwWHY1SnpmRGY1YjRoQlgxbiswL2w2U0hrT2pr?=
 =?utf-8?B?WFUyUjlzY0xUZmRwcGY4YllneTl5L0JRV2EzMXNrVlQ4R1UvNkNubkdIRU1v?=
 =?utf-8?B?NktzYzdHM0RQTW4ycXlwTzFmSjFqWXp6Y1gxVy9hRmxFMXREZDVVWWdjR0lz?=
 =?utf-8?B?NTUreDhFRS9BUjFZQ09HYk9ZKzdzdVF2bktVNmZOcUl4cGsvUFZQVzJaVEFW?=
 =?utf-8?B?UnJ5UGo2YU1RN2YyOWtVbjVYVzdtcjFURnljUkJYelI1V01JWnNRZnVWZGVx?=
 =?utf-8?B?OXNWNUhaWkdkMlcveFhPVHhjdmM1azdLZTUrMlhmdnFvakxJMEZOdzMyQUZR?=
 =?utf-8?B?WVFRdkZkRmRTend5Sk1aKzRFelIxSndVVkc0WGZrQ05CUW9DODBZRWIxRm1V?=
 =?utf-8?B?eElqeloyUmpjZ2k5UkpRZk5MNmxCSkkra2p1QXFaS21NMkExWVFyU1lPOU1T?=
 =?utf-8?B?V0NsaDN6RFB0WlBRK3BWSkhJVWpFaUltQWRGaGJsSExrSjgvVmRsbXJlWEJW?=
 =?utf-8?B?dDRmOTNtUjFvVG1DRkFqSG9vVWtyd00wb2xJM1AyaHFOZjBYQkNWOE1SbTND?=
 =?utf-8?B?eWVaaVRpZ05FLytLd2NjS3RZY212WjJZcERsWjYxTzMzb2dkT3dhcVpsWmp0?=
 =?utf-8?B?QzloK2o4ZU1KclhjSnY1eFR4cjB1aTFPSGZhdTNKRjdnbXJoTHA4WTg5azB2?=
 =?utf-8?B?aThIZ1JqSmZ3NDgvZ2w1MzcwNytsd1huVGsxVEtWN3huRjhhMXkxN3c1aVYz?=
 =?utf-8?B?akgvN3c0S3hpL2JiWG5reHNFbTFUTVcyUzBuN3pwMlhiM0oxZ3hJaVRvMnZ3?=
 =?utf-8?B?YmhYbkF6WkFHVHpTZllUL0tpUndweHpJMFBwblZqd0pxbStsVGNaYzhHY3FM?=
 =?utf-8?Q?mdO0XyR0t0t3AKv8kgjf3ymB9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3daf9c3-6c96-4de0-9f8d-08db7dfabe4f
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2023 08:26:49.2199
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QauBAkJX45pP/ihtBla276Gy2ITwpvtwDaC/hyQK0RGpPdywbX0iruUR70zBeV2JHqPqKGkuw0soZ6pIRyZtJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9510

On 05.07.2023 17:26, Simone Ballarin wrote:
> --- a/xen/arch/x86/apic.c
> +++ b/xen/arch/x86/apic.c
> @@ -1211,7 +1211,7 @@ static void __init calibrate_APIC_clock(void)
>       * Setup the APIC counter to maximum. There is no way the lapic
>       * can underflow in the 100ms detection time frame.
>       */
> -    __setup_APIC_LVTT(0xffffffff);
> +    __setup_APIC_LVTT(0xffffffffU);

While making the change less mechanical, we want to consider to switch
to ~0 in this and similar cases.

> @@ -378,9 +378,9 @@ static void __init calculate_host_policy(void)
>       * this information.
>       */
>      if ( cpu_has_lfence_dispatch )
> -        max_extd_leaf = max(max_extd_leaf, 0x80000021);
> +        max_extd_leaf = max(max_extd_leaf, 0x80000021U);
>  
> -    p->extd.max_leaf = 0x80000000 | min_t(uint32_t, max_extd_leaf & 0xffff,
> +    p->extd.max_leaf = 0x80000000U | min_t(uint32_t, max_extd_leaf & 0xffffU,
>                                            ARRAY_SIZE(p->extd.raw) - 1);

Adjustments like this or ...

> @@ -768,7 +768,7 @@ void recalculate_cpuid_policy(struct domain *d)
>  
>      p->basic.max_leaf   = min(p->basic.max_leaf,   max->basic.max_leaf);
>      p->feat.max_subleaf = min(p->feat.max_subleaf, max->feat.max_subleaf);
> -    p->extd.max_leaf    = 0x80000000 | min(p->extd.max_leaf & 0xffff,
> +    p->extd.max_leaf    = 0x80000000U | min(p->extd.max_leaf & 0xffff,
>                                             ((p->x86_vendor & (X86_VENDOR_AMD |
>                                                                X86_VENDOR_HYGON))
>                                              ? CPUID_GUEST_NR_EXTD_AMD

... this also need to adjust indentation of the following lines.

> --- a/xen/arch/x86/cpu/mcheck/mce-apei.c
> +++ b/xen/arch/x86/cpu/mcheck/mce-apei.c
> @@ -37,11 +37,11 @@
>  #include "mce.h"
>  
>  #define CPER_CREATOR_MCE						\
> -	UUID_LE(0x75a574e3, 0x5052, 0x4b29, 0x8a, 0x8e, 0xbe, 0x2c,	\
> -		0x64, 0x90, 0xb8, 0x9d)
> +	UUID_LE(0x75a574e3U, 0x5052U, 0x4b29U, 0x8aU, 0x8eU, 0xbeU, 0x2cU,	\
> +		0x64U, 0x90U, 0xb8U, 0x9dU)
>  #define CPER_SECTION_TYPE_MCE						\
> -	UUID_LE(0xfe08ffbe, 0x95e4, 0x4be7, 0xbc, 0x73, 0x40, 0x96,	\
> -		0x04, 0x4a, 0x38, 0xfc)
> +	UUID_LE(0xfe08ffbeU, 0x95e4U, 0x4be7U, 0xbcU, 0x73U, 0x40U, 0x96U,	\
> +		0x04U, 0x4aU, 0x38U, 0xfcU)

See the earlier (EFI) comment regarding excessive use of suffixes here.

> --- a/xen/arch/x86/hvm/stdvga.c
> +++ b/xen/arch/x86/hvm/stdvga.c
> @@ -39,46 +39,46 @@
>  
>  #define PAT(x) (x)
>  static const uint32_t mask16[16] = {
> -    PAT(0x00000000),
> -    PAT(0x000000ff),
> -    PAT(0x0000ff00),
> -    PAT(0x0000ffff),
> -    PAT(0x00ff0000),
> -    PAT(0x00ff00ff),
> -    PAT(0x00ffff00),
> -    PAT(0x00ffffff),
> -    PAT(0xff000000),
> -    PAT(0xff0000ff),
> -    PAT(0xff00ff00),
> -    PAT(0xff00ffff),
> -    PAT(0xffff0000),
> -    PAT(0xffff00ff),
> -    PAT(0xffffff00),
> -    PAT(0xffffffff),
> +    PAT(0x00000000U),
> +    PAT(0x000000ffU),
> +    PAT(0x0000ff00U),
> +    PAT(0x0000ffffU),
> +    PAT(0x00ff0000U),
> +    PAT(0x00ff00ffU),
> +    PAT(0x00ffff00U),
> +    PAT(0x00ffffffU),
> +    PAT(0xff000000U),
> +    PAT(0xff0000ffU),
> +    PAT(0xff00ff00U),
> +    PAT(0xff00ffffU),
> +    PAT(0xffff0000U),
> +    PAT(0xffff00ffU),
> +    PAT(0xffffff00U),
> +    PAT(0xffffffffU),
>  };

While I agree here, ...

>  /* force some bits to zero */
>  static const uint8_t sr_mask[8] = {
> -    (uint8_t)~0xfc,
> -    (uint8_t)~0xc2,
> -    (uint8_t)~0xf0,
> -    (uint8_t)~0xc0,
> -    (uint8_t)~0xf1,
> -    (uint8_t)~0xff,
> -    (uint8_t)~0xff,
> -    (uint8_t)~0x00,
> +    (uint8_t)~0xfcU,
> +    (uint8_t)~0xc2U,
> +    (uint8_t)~0xf0U,
> +    (uint8_t)~0xc0U,
> +    (uint8_t)~0xf1U,
> +    (uint8_t)~0xffU,
> +    (uint8_t)~0xffU,
> +    (uint8_t)~0x00U,
>  };
>  
>  static const uint8_t gr_mask[9] = {
> -    (uint8_t)~0xf0, /* 0x00 */
> -    (uint8_t)~0xf0, /* 0x01 */
> -    (uint8_t)~0xf0, /* 0x02 */
> -    (uint8_t)~0xe0, /* 0x03 */
> -    (uint8_t)~0xfc, /* 0x04 */
> -    (uint8_t)~0x84, /* 0x05 */
> -    (uint8_t)~0xf0, /* 0x06 */
> -    (uint8_t)~0xf0, /* 0x07 */
> -    (uint8_t)~0x00, /* 0x08 */
> +    (uint8_t)~0xf0U,
> +    (uint8_t)~0xf0U,
> +    (uint8_t)~0xf0U,
> +    (uint8_t)~0xe0U,
> +    (uint8_t)~0xfcU,
> +    (uint8_t)~0x84U,
> +    (uint8_t)~0xf0U,
> +    (uint8_t)~0xf0U,
> +    (uint8_t)~0x00U,
>  };

I continue to question these changes. They don't fix anything, do they?

> --- a/xen/arch/x86/hvm/viridian/viridian.c
> +++ b/xen/arch/x86/hvm/viridian/viridian.c
> @@ -291,7 +291,7 @@ static void enable_hypercall_page(struct domain *d)
>       * calling convention) to differentiate Xen and Viridian hypercalls.
>       */
>      *(u8  *)(p + 0) = 0x0d; /* orl $0x80000000, %eax */
> -    *(u32 *)(p + 1) = 0x80000000;
> +    *(u32 *)(p + 1) = 0x80000000U;
>      *(u8  *)(p + 5) = 0x0f; /* vmcall/vmmcall */
>      *(u8  *)(p + 6) = 0x01;
>      *(u8  *)(p + 7) = (cpu_has_vmx ? 0xc1 : 0xd9);

Please can this and ...

> --- a/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> +++ b/xen/arch/x86/include/asm/guest/hyperv-tlfs.h
> @@ -471,30 +471,30 @@ typedef struct _HV_REFERENCE_TSC_PAGE {
>  
>  /* Define hypervisor message types. */
>  enum hv_message_type {
> -	HVMSG_NONE			= 0x00000000,
> +	HVMSG_NONE			= 0x00000000U,
>  
>  	/* Memory access messages. */
> -	HVMSG_UNMAPPED_GPA		= 0x80000000,
> -	HVMSG_GPA_INTERCEPT		= 0x80000001,
> +	HVMSG_UNMAPPED_GPA		= 0x80000000U,
> +	HVMSG_GPA_INTERCEPT		= 0x80000001U,
>  
>  	/* Timer notification messages. */
> -	HVMSG_TIMER_EXPIRED			= 0x80000010,
> +	HVMSG_TIMER_EXPIRED			= 0x80000010U,
>  
>  	/* Error messages. */
> -	HVMSG_INVALID_VP_REGISTER_VALUE	= 0x80000020,
> -	HVMSG_UNRECOVERABLE_EXCEPTION	= 0x80000021,
> -	HVMSG_UNSUPPORTED_FEATURE		= 0x80000022,
> +	HVMSG_INVALID_VP_REGISTER_VALUE	= 0x80000020U,
> +	HVMSG_UNRECOVERABLE_EXCEPTION	= 0x80000021U,
> +	HVMSG_UNSUPPORTED_FEATURE		= 0x80000022U,
>  
>  	/* Trace buffer complete messages. */
> -	HVMSG_EVENTLOG_BUFFERCOMPLETE	= 0x80000040,
> +	HVMSG_EVENTLOG_BUFFERCOMPLETE	= 0x80000040U,
>  
>  	/* Platform-specific processor intercept messages. */
> -	HVMSG_X64_IOPORT_INTERCEPT		= 0x80010000,
> -	HVMSG_X64_MSR_INTERCEPT		= 0x80010001,
> -	HVMSG_X64_CPUID_INTERCEPT		= 0x80010002,
> -	HVMSG_X64_EXCEPTION_INTERCEPT	= 0x80010003,
> -	HVMSG_X64_APIC_EOI			= 0x80010004,
> -	HVMSG_X64_LEGACY_FP_ERROR		= 0x80010005
> +	HVMSG_X64_IOPORT_INTERCEPT		= 0x80010000U,
> +	HVMSG_X64_MSR_INTERCEPT		= 0x80010001U,
> +	HVMSG_X64_CPUID_INTERCEPT		= 0x80010002U,
> +	HVMSG_X64_EXCEPTION_INTERCEPT	= 0x80010003U,
> +	HVMSG_X64_APIC_EOI			= 0x80010004U,
> +	HVMSG_X64_LEGACY_FP_ERROR		= 0x80010005U
>  };

... this together be made a separate Viridian-specific change? (I
continue to be uncertain about touching the header file; the
Viridian maintainers will need to judge.)

> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -103,7 +103,7 @@
>  /*
>   * Debug status flags in DR6.
>   */
> -#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
> +#define X86_DR6_DEFAULT         0xffff0ff0U  /* Default %dr6 value. */

Considering the respective register is pointer-/long-size, wouldn't
this better use UL? But of course we'd want to check that this then
doesn't affect code in do_debug() in an undesirable way.

Jan

