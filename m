Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F29742830
	for <lists+xen-devel@lfdr.de>; Thu, 29 Jun 2023 16:21:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.556845.869664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsVW-0004jc-Dg; Thu, 29 Jun 2023 14:20:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 556845.869664; Thu, 29 Jun 2023 14:20:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qEsVW-0004hx-AM; Thu, 29 Jun 2023 14:20:26 +0000
Received: by outflank-mailman (input) for mailman id 556845;
 Thu, 29 Jun 2023 14:20:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1sCV=CR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1qEsVU-0004hr-IQ
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 14:20:24 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062a.outbound.protection.outlook.com
 [2a01:111:f400:7e88::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 149c5561-1688-11ee-b237-6b7b168915f2;
 Thu, 29 Jun 2023 16:20:22 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by BL0PR12MB4931.namprd12.prod.outlook.com (2603:10b6:208:17e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Thu, 29 Jun
 2023 14:20:17 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::8018:78f7:1b08:7a54%2]) with mapi id 15.20.6521.026; Thu, 29 Jun 2023
 14:20:17 +0000
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
X-Inumbo-ID: 149c5561-1688-11ee-b237-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcbo3Z3EhmhvW1ESLwk+BNKxwSRB+aP16bchN9LabVC30S1V52IFmRBW/OcRS6rhRrMTwMNwcNCLdue2Rn9hj2ReesepwIylWtCFRC8hUhLkDilBr2P1fRQ3W/4QT4qiZKWsXkwRz8lIE/olAmAWQEUZvbdtSHjan0UwGBFFv+JpH2IEe9eeMle1v/A0O/P+GqgDOLkGyYZWPgOLBEVU8XO+8T64jA5TSVKNj5Q6a1DPXa8EB7aa5ZrKWWM0ztAfVJcsz0HZQyjYua7Ubt6jjzYwPUGDI8WnsDyoYDvpuAupec2AaMiUr1Zm/Tqk7YKnwuAthsVvQMILWUsGCRKSgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s80gEzrECilDabEcD9FY6cy4TnxW2I0uSGGsHeu+IPA=;
 b=RzD5SsrHUh63DnItxwYXNeBC0vsy3YXcdBEhN1gHzY5pSBusIJcqrWgAElc55heEl8o2VoMYJ5K6eyacPHhsVK30eX/QxwiPkBl9dFNKc7pm2abEZMWKOWYJOaUqufxFK3Iattp7KjOMUMWUSdx9Dx40RazrqxF1YXLoVnURUjUrtF8C13R4pneVGR7l5HcTxTVk/yJaNCf0mOYjCnkVeWYAQIQ4nz9D54u3c/lFgdue+pnoB8Y7nbza18r8l6+f2O5kwrq2G1pZxiCDyB9UM4hCO9iakH5BAj2f4OXpvynZ7yWHOwwbtyOBKfvzYWrVxsTtMeSSZRry5/hya33xCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s80gEzrECilDabEcD9FY6cy4TnxW2I0uSGGsHeu+IPA=;
 b=qNSXYoIaQELe9WJZhKRfFiyOqnNNidfrsQwj88OfqlnqVEziUQq12Ts+mWy6m2TFv3Ff08E6CsPhCzsXGTxFPQX0bvf+C6+xpnUHQkpgBXzGip0muLU2kFCiab/bAUSuETciWIakfHOGST4yr1bUG3/pUhSQ++8NGF0+a2Xk4NA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <674011bb-b8df-d11e-a322-1827096c1b74@amd.com>
Date: Thu, 29 Jun 2023 15:20:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/52] xen/mpu: plump virt/maddr conversion in MPU
 system
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
 <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-29-Penny.Zheng@arm.com>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <20230626033443.2943270-29-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0262.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:194::15) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|BL0PR12MB4931:EE_
X-MS-Office365-Filtering-Correlation-Id: 108742fe-6c2f-4a5b-6dc4-08db78abf6a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EimMP+b6yeFaA7zH/jFkPuxLGGeFPuAzaJezdtbAUZKLmyTe3B3A6htni6G6l+/AoPjDao67P9HVZv1ainnOcXCAyUr1BTPgI8UBlCHfVxBWW6vrnPy5M1fCP6RiF9AzU+qBa9NdNflC5/h02NQwclj0qv5yIjc+c7ERJxafToh8corOBYjhP2GHCWThEWz6ANKG+tvn9C6xAGyMDfqdnnkXpNTbXMZ0CMJIa0OCPQ7/pnLMW1jvt9yLx/e0bBKiXBHBWGZ2rCy/0hyxYAgjFGk2H6FhlP1+puuIJuXEaMEQEzJ8//aUm0o6bqDLNmnp1B5bdO1i3pVeQV2rAykzwkgEd/Zu6CdMErUit/QOelWRTffyMA9/qP8ppwLeT8HCaWL6AYchvOk/fFNRGwuqvNe+Zke3K2rvy7eFw1VozwuoAIDhSRcdG8rim8iMdlhPmXaS6c5keGlqVNKD0WLdV+TAVYtDpBwvt0kCjAzb2iP+ylE7bbJn0wDWVeAfOWNPVji6v+HhNvegd/cqMDr8wdmzA8v3gQtHkjeM70fheiZEroYFkRlCmfdujDnOTVC3GLgBpvpKwBiu5DNc+pvZjxm0nzwjXBbiSBoaNZ0/sQGBfsw5iplnbt0lyz21+IFKSAliG+eV9ucckhjvGAlO2Q==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(366004)(39860400002)(376002)(451199021)(26005)(4326008)(66476007)(66556008)(8936002)(6506007)(36756003)(2616005)(478600001)(54906003)(186003)(2906002)(6666004)(53546011)(6486002)(83380400001)(66946007)(5660300002)(38100700002)(31696002)(8676002)(316002)(41300700001)(31686004)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UlZTMDdoK3EybUZBVWlkaTNKMlg1NktIanlGSUh1bFJ2L09KamhmbXFvcTV2?=
 =?utf-8?B?b3lZYUpvcGJkSXZrNFQreEQ3QjFWRm9PZjY1T01icUxsak1yYVVWczJCL1VI?=
 =?utf-8?B?aTg0bzBnTlc4VEIxYlB6Mk12RFE1SERXT0d5cXgwb2tTL1dWTEd1Y2V6V3ZT?=
 =?utf-8?B?RHExRjgrWEtBMlhUMndQNzVvdlRKUUlrY2grMUtRdC8rUFJZNTZ0NUI0Q1Zp?=
 =?utf-8?B?WS9xNklrNDJCK3RZZEI3SVFPWFozYnpBRzhsYUtNQU1rWkc0NnpSZTFMdzlN?=
 =?utf-8?B?SEJRU2tDTkJCVkhwQU80bUhJMUxhSjdlaUtaYWh4TVQ4Yks3aVk4aVNxWVZE?=
 =?utf-8?B?TVdMNlFMYUJkdmg1azZ0aTN1V3IrTEZmZDgwNGhPTjBVNC92TWs4bG5ZNmx3?=
 =?utf-8?B?TWljL1pWMmwyZXZBMTc1KysrRWF6SmlNM2hMTGF2VnlZZjh6L1hEMEIzS3BH?=
 =?utf-8?B?ajQzeXBCZGhwZGowd1hZUjZwbDJoazE2L2N5ellUTFNSQy82cWNVRWY1THdq?=
 =?utf-8?B?QjRMMG1PMlVzYlpLckhoUW1pRVRGdVdjZnlsbFlVMVBPVWZueXhQazN2cmVD?=
 =?utf-8?B?N3FVWDJOakYwUEFoTEt1dWYrQVVYRGs0R2lBNXR4cVpRckJNa2QyUmhpd0ls?=
 =?utf-8?B?TU81UjIrU2FQa29CM0k5dEJWdXZ3Ry92Y0V4d2lxTnN3bmJ1VWhYQmxNOGpr?=
 =?utf-8?B?MS9XcFNoNmx0SWlwRmcyRjg4WXZmdVR4Q0NGdW1IcktvTWlZaVZXQityYlpr?=
 =?utf-8?B?cDZnUTc5UHB6K2VoZWRkRUVLTTlGV2pRbUdiV3BhVUovc2h5emkyNWdZbjNt?=
 =?utf-8?B?VnVMSXQ3dUp3ZXV1WDlTdHIrc1NGcDdrenpDMFdJWi9DQkJEK2R0QllxUHg0?=
 =?utf-8?B?YTkrQ3Q0cGQzUVZVandoNHBvRVRlL1lVblRrRTNzSFdPZ3gwQmdsRXVuSXg1?=
 =?utf-8?B?RjB5bThxUktzSktYVGl3MGlkMDdIbktKRDB2Y05GYmRRc2ljYUI5Y2pNUFJ2?=
 =?utf-8?B?V3lPMndvYkZva01oMlFJQ0dJY0N2OE1qdXpVdFg0enZsa2pHMWdYQlhuM09j?=
 =?utf-8?B?MVBJYmFRUVo4QktSMjIzbnkvOEh2WWYxdnV6R0t1SG9UMHFnTlIrVzFhN0tq?=
 =?utf-8?B?dGlTckNWQldPZ3FIR3ovanplclBqbjBZUWp5UHJwMFFHRjlndFpuRHpEOFBo?=
 =?utf-8?B?N2dPbHFKK1VFUWdLUkNOLzRWUHNtKyt2QmJkUFhCcnFvdlpzTjBtaUFkM0ZC?=
 =?utf-8?B?Yi9WTjJpVlRCZkVXK0F1RzJVOERwTHUzUlE5cXVERGx5bjZHSzdCbXlMbW5u?=
 =?utf-8?B?d2xKVncwMy9NZ1ZIOGlqUDZpTU1DeEIwQkdvUm1odkdtWnNaQmY2NXREc0ph?=
 =?utf-8?B?Z2xKbTF4N2YvTzFmV0lUbVpDQXRTUDQyK3N6d2xCRUt5OVhNUjFWQU0zdEpN?=
 =?utf-8?B?T2VpZU1FTTlOR2pweEY1eHZEbGhvSEF6WEhsVG1kWTVkTnZzMS80eFk4Ynho?=
 =?utf-8?B?WjdLWnpWUEVZYk9sVGNVOVorOCtJZHZGQ3ZlVzVBZjlaZm5VSHEvZHI4Tk9w?=
 =?utf-8?B?Y0REbTNjMVlldjZxby9nQlRKNGxVczllMmZOSmJpOGR3V1FoZytaekRQWmtN?=
 =?utf-8?B?cFZSNzhxR00xa3U4SVNvSkpvWkFPdjNFcUdDdVhSNlE4eVRUbGpvTmdRVUN4?=
 =?utf-8?B?OWJLQ2FmZjAra0JOWmhCN3JOSmVabkJzS0lIeTlzMG5KNkhLWkRvUE1GN1V2?=
 =?utf-8?B?VkpNb0txODJmR2M1S0ZaMVVMdVlIbEJWYktQMEIxeGZBT2dYL0xIY1JneE9Z?=
 =?utf-8?B?cDBLWXIxRHUxdno0NHZtSmRBYTcxeWxsOHp3RUlsK2xweDB0c3hQSUI4bURh?=
 =?utf-8?B?ak1VKzhlSGJhNTU1WXNieVhvZXNyUTk5dzJpRkVXTlRpMkpoTVBjRHAxazhC?=
 =?utf-8?B?VldWWU9xT2VWNG5IVlIveFgvY0pSYkloelAyT0Y1U0E2ZEs5eTJyNVprbVQw?=
 =?utf-8?B?Y05WNkpCblMvelJBbjlUWGJCejZjdDI5QnhubEhPWDdoM0Y4a1BYTW9KVGdE?=
 =?utf-8?B?OWh0cGFtZHptM3NQWFhHMFQ1NWxBbGNPcEU4a29lSGF1TEU2WVFFeWRHVjlQ?=
 =?utf-8?Q?9FrRV3wj4W/Cv9YB2dtq9cxSX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 108742fe-6c2f-4a5b-6dc4-08db78abf6a3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2023 14:20:17.7154
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jzSCaGMf0/68LSwJG/h4+NA+TDIYXUdUgouos4eQ4uazDll7ebqKy27Bz79EK3YgHMk0/XdI8IndYM8iTze6eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4931


On 26/06/2023 04:34, Penny Zheng wrote:
> CAUTION: This message has originated from an External Source. Please use proper judgment and caution when opening attachments, clicking links, or responding to this email.
>
>
> virt_to_maddr and maddr_to_virt are used widely in Xen code. So
> even there is no VMSA in MPU system, we keep the interface in MPU to
> stay the same code flow.
>
> The MPU version of virt/maddr conversion is simple, and we just return
> the input address as the output with type conversion.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v3:
> - Fix typos
> - Move the implementation from mm/mpu.h to mm.h, to share as much as
> possible with MMU system.
> ---
>   xen/arch/arm/include/asm/mm.h | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> index eb520b49e3..ea4847c12b 100644
> --- a/xen/arch/arm/include/asm/mm.h
> +++ b/xen/arch/arm/include/asm/mm.h
> @@ -267,13 +267,22 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
>   /* Page-align address and convert to frame number format */
>   #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
>
> +#ifndef CONFIG_HAS_MPU
>   static inline paddr_t __virt_to_maddr(vaddr_t va)
>   {
>       uint64_t par = va_to_par(va);
>       return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
>   }
> +#else
> +static inline paddr_t __virt_to_maddr(vaddr_t va)
> +{
> +    return (paddr_t)va;
> +}
> +#endif /* CONFIG_HAS_MPU */
> +
>   #define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
>
> +#ifndef CONFIG_HAS_MPU
>   #ifdef CONFIG_ARM_32
>   static inline void *maddr_to_virt(paddr_t ma)
>   {
> @@ -292,6 +301,12 @@ static inline void *maddr_to_virt(paddr_t ma)
>                        ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
>   }
>   #endif
> +#else /* CONFIG_HAS_MPU */
> +static inline void *maddr_to_virt(paddr_t ma)
> +{
> +    return (void *)(unsigned long)ma;

Why do you need "(unsigned long)ma" ? Both "unsigned long" and "paddr_t" 
are u64.

- Ayan

> +}
> +#endif
>
>   /*
>    * Translate a guest virtual address to a machine address.
> --
> 2.25.1
>
>

