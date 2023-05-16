Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C67705302
	for <lists+xen-devel@lfdr.de>; Tue, 16 May 2023 18:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535416.833111 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyx80-0006i6-PO; Tue, 16 May 2023 16:02:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535416.833111; Tue, 16 May 2023 16:02:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pyx80-0006f0-Ly; Tue, 16 May 2023 16:02:20 +0000
Received: by outflank-mailman (input) for mailman id 535416;
 Tue, 16 May 2023 16:02:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=00Q8=BF=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pyx7z-0006et-5n
 for xen-devel@lists.xenproject.org; Tue, 16 May 2023 16:02:19 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on061e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::61e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 080a7d1e-f403-11ed-b229-6b7b168915f2;
 Tue, 16 May 2023 18:02:18 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB9098.eurprd04.prod.outlook.com (2603:10a6:10:2f1::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Tue, 16 May
 2023 16:02:16 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 16:02:15 +0000
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
X-Inumbo-ID: 080a7d1e-f403-11ed-b229-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIoKFQYZrvI7hgoht9r53loVfkGRg9oToPr9mwklKpRl7gAwUZGtEn2/EKFU7NxZdT9mFtU8KDOCVW1VR01BJifK7ptmKFcHTKixmasV9c0Zy7VcgkqMbyQ/t5DArVaxrOtH41W5Lapcqr0TNQ8BACw0hfbMvab8wNE/24nl47Qb1TdCp7y2WAmWy7RHfHvS+eBAn0SETunWlMtkAi0YJXwBmwXqMTq8Tyf/i8zhmnWWLbPmMGNIZnm2F8xtjCXt8W2sfFFh4tn17ggV7Vb3Q+sx1imOSk9bAd/Y32B/h2wfEte7W0kZxpNxc1YZ4T22GKhA0lXt8IcwHx4U3kXxaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KZ9sYQkqVq9+yjzu5bXHUNI8WFxSTxWSsFzg6hTw4oU=;
 b=oOkrdgTCKz0bJ1LNJ5FBAcaS5eWoqoNnQefEAX85f4MYlsSv75U1MNzjntKB8HblLsEkHEzOwg6S4J1QKiUh1zPHUfZPsrVhJg+K/Uwb3CZwoRFlwfNfwfiUuPcoAFTjGHFRpmwlR1WwE2CBreSv1i1XNMZyZid4DymYtNj009OYz78jg21mBI1a/TncfVQdJay9cU6hP30pEh0bKkIgg0bQ0Z6NqOIkwp4zT4qjXSW3dXd7sopa2+LznWYo214r0p2yAq9dbVKXX1/EVYAPj7bCj/hpv9kv1NYdq4c4klIacIswMsFrcchA/YgxOmXFs/4khbFs4diEZKxLta1T6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KZ9sYQkqVq9+yjzu5bXHUNI8WFxSTxWSsFzg6hTw4oU=;
 b=SfLaAdOWWWPvhJMbyce7CwwGmj1N/yW5qgy6rSviluIMyn1zoejF/1sNp7/enD44YpWZjRua0Kw+gtpzf7C+R6O6obZwL3ymOzCI0XR0lq8Rooky8NqaFz0sfYDQiIvXCYJCHdus0Z/9SzP+VysNyUc7LljLzL7nUNxskfQ2NfKIc6kgWBT0rikTi9sftHyA39yMmFtWAf8HDBGhKHH6cBhZ5S0VaSSFU+ZtTBVxyn8/NfZH4BXO1QIbo8e8jcePTeB7zZEO20Ew90Ta8yKrr/s/jiuPitBvERYdH+BrBXNVfh6Ju8yOyI9LNJT7mAOfnc534q3GsXYegbkQvXXAag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6954c105-f081-5d9a-5a77-1865fdc07133@suse.com>
Date: Tue, 16 May 2023 18:02:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v7 2/5] xen/riscv: introduce setup_initial_pages
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1683824347.git.oleksii.kurochko@gmail.com>
 <632384e200b7de0fb4e2dae500a058c2a27628be.1683824347.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <632384e200b7de0fb4e2dae500a058c2a27628be.1683824347.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ab::7) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB9098:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a6a510-728a-4ffd-ff9d-08db5626ea90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QnwRzdoflH4polssrDw7zW+QrDjZXhH/oWT7N6Gr1IkysRwDuaSgcSNex+vRDHaRp9dNTMs2ZuI/lDvchTy9ig8OGhVgh5ySfbXJrkyLU0RabRlFuYt3fKGTZLXRkxMq/HkdWZxlhhG5hXYmY+0NYFSdrsAQ8UqN1GjVR1kgmtLVfACRI0DPaZsnEx2V4VWLxoOvUWQ4NWIZx3fvcvq8L28KNTxPlhFgnYgUOkY31oUZgZFqpVgMi6o0oIDU3RhGIzcIETJh0oj1dphipFtMY0A4ovqP93aSoQjTNTW+ibzQu3HRgYtZUFx4+ELxOhfkig+bHMAO55HobY5UgMVQnrmKjMe5l2yYSMZSq2WxxhcJeC7NVZzVzIpoCo2ogiXk6ALmDcMVDx55i3hbnoJdq4ntItBJFQAR6hvXKZDRgx8hijwZVvLokHH/pq9rsQ7QDexLHioW3zCpuRcBC+ADaYdQLnpxQobsZrJ1Q2I7bFuaf69TsxF6RbDiO6eQKgcotrWS6QC6oi7l4j6k4ASmCZEz+oyzF2tIjjGp25FpVO+++a7ISsoh8c75F71TCRU6N1cZoeLQbU7Z2kYgzn2YBzTE3vj43AEyaEzJE7hb1AkKdtWgt6vSk6gDSEmUiT7V3Cv4rB04MODs70LxN7T1gw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(8676002)(5660300002)(8936002)(83380400001)(31696002)(2616005)(6506007)(186003)(26005)(53546011)(6512007)(38100700002)(86362001)(478600001)(54906003)(6486002)(6666004)(66556008)(66476007)(66946007)(316002)(41300700001)(6916009)(36756003)(31686004)(4326008)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFFCcVBBcmdJV2xuTDhzTm5yS3BLS0wzNkFkOW5PenJkZHUwTjlZYjVXZXhK?=
 =?utf-8?B?L2dwOFlRWGNuU1lKWlJMTEVkaW5KWUdzMWJ3Q08zeUN3Tk1PU0pEWXppU3pY?=
 =?utf-8?B?Y0lSSVJUTnVGU0laSWduQ2V3c09wUzl0c1dVQTN3amhEby9FM1l2Z0VFOXUr?=
 =?utf-8?B?OXJ1bHlaS2dFdVY3OGovNmREVTFsVXB6VEdTUFQvQW5FMWN4Z2FEYlVIMXUx?=
 =?utf-8?B?TzFmUElmc1R6cVhZZHpPWjIzRkRQQVgyM1UwOHFDM2E4eDlUME1DZ3VBcWhC?=
 =?utf-8?B?QmhDN3hoZDNPbnBVd05jVUZPZ0ZNR1kxcUdMRDFSQTB0ZzNWKzZxMTNzUHgy?=
 =?utf-8?B?cDB1ZTduY1lnTFVsTXpOdGFpUTNodWJLWUtYZVN1SFNFSmxwQVZ1ZnZkdFBL?=
 =?utf-8?B?VUgzSnBlSGdsdFQ2QkhhaytyS1QwQlNMeTFmYjYyNkt2a0R0b0VDaHdTc1c3?=
 =?utf-8?B?Mk5IVEJFTWwrRXJkbVhmeDg0d3g4YnlPeDE5eFFBZkYrcnhSalRNRjBqL0ZZ?=
 =?utf-8?B?TWdLUlZtZDcySm1pMWoxRjlGb1hLMm91MXAzQ3hvUjFYaUNNWkVWSndiaVVL?=
 =?utf-8?B?cUQ0ZForOHROcDJBcWdHQVptSEZGTEp4SnJwckhSN0RXMDREN3ljT3NhajhN?=
 =?utf-8?B?bkVOYWFUalozMEJ3UlVweGlQc3M1WVk4MFJTRVdKRGgzVTZRU2Y2NjZsbTZJ?=
 =?utf-8?B?cGovcFZXQ0pmekFKRE5vRHNxSHVYU1JubXFsQkcvNFVTV3NoTGw0cVdoN1cw?=
 =?utf-8?B?NGZmRWM2U0k4eVV0MkdyVmhXcmdLcCtvRG96bW5BbCtKUElYNDNYOFhnSEVH?=
 =?utf-8?B?NlpWQzNTTzE5TXZjdWZ5cUgxdzd2T1Y4Mm1CNVFmQUJWQ0hlYVZSQTByT0g4?=
 =?utf-8?B?Ri9DenZkSmgrQzRwSG5zMWdLU3ErSUJyUk1aTXZYN3BPVDhNbmVrTnUrdlE2?=
 =?utf-8?B?a0liSUkybmxQWVQ2dG1nRHQrWm4xb21WWnFTMDM0a2RYNXZiY2ZsVjJRQWxn?=
 =?utf-8?B?cGU0K01ZZnd3SUxzTlYwazBxaEVLQlhaTHFIaEd4bysrYzgzZWtWU3IyOTZa?=
 =?utf-8?B?QjZZenlRd0w4djE0U1hqMDlzMFpPVlZDSE80WHdUa0M2WlVHbkFLaERRTXdO?=
 =?utf-8?B?UFQ5V0QxZ2tTcWdEMHlNemRDa29JVmRGZEpranZUQXpqbHg5blVNV0pQQ2o4?=
 =?utf-8?B?eU1NdXN4bVNXSEk0eWwxeDlrU2ZicGQ1MmRudFozUTVkdTNrQW5qZVVGSGlT?=
 =?utf-8?B?bmpFcXNPaS9jb3NDd2EvcFJrNGpidHBNalhZTVZJWTFHSXNIcDhjWmtBZEdW?=
 =?utf-8?B?L05xTDNmSjNESC9venh0SmZMeEcvL01JRm5zUEdka0F6dVVmOE9Yckd3ZVNH?=
 =?utf-8?B?dUoySG1RcWxiTDBGR2tQeityNkdaRWhYZW5Yc0c3elhzWFcyWXo0UGVRdUZY?=
 =?utf-8?B?WFZsZmY3bjBMNE5NOCtkbTVTaDhiWjJhME83VDhHTlk0MlhIWGVuMGE0WDJz?=
 =?utf-8?B?UHZBTWFnZXRIUkQvYndHZE9mbWdCN2xHU1lTanNzaGR0ZGJ6STBhT2JYamlQ?=
 =?utf-8?B?K2ZrdU13R0NoMWt3d1AxRy9VWEJET0htVWczenlMZlNJekJZbE9lWUJ5UXJV?=
 =?utf-8?B?WjVwOW9PS29RRWhtMEJPby9jU29RT0tBN0dTSEI5TVFCNHNrcTc4Zm9xSktU?=
 =?utf-8?B?SFBYQjFvMnRJVHc0dWgzRHBXLzhvZFZsMUJqcEhybVVIeisvU2x1Snl4Y1lL?=
 =?utf-8?B?L3dqNHJiTFVPRkRVU3YvNWhYOVREUXp4U3FRaXU4a284aFJHWkNzdWs1S1M5?=
 =?utf-8?B?aDJNaUwzV2pHNWFvVklhU1pER010VFd3V1BaZmJtSXp2RWVSOGYrOUpvMFNZ?=
 =?utf-8?B?RExUVmhMVlhhVXIxQm80b3c1NUtJQzlwMlNlU2J5cmdRTWZnZHorRXozMmNr?=
 =?utf-8?B?RzZxSlZwVk5OTlhISUxTanZWY2pRSFZRMWxYYUJOOFRHU242aEh4cWJKVXph?=
 =?utf-8?B?SWhkTTJOeTUxRDVyN3JrSnVyclByUmlJbHk3MEVnaElDcFBFWUpVWjhpdkFX?=
 =?utf-8?B?cEZZR2ZHNnlBeUVpWjNOSHE4S0pPd0hLakd1MVVSei9WZkpMT0gydm1iOFgx?=
 =?utf-8?Q?LVcIZpptigJJEsLKH1b4+RWbC?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a6a510-728a-4ffd-ff9d-08db5626ea90
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 16:02:14.9889
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BKjqYnN0f/3Rv/ONYFXiHx0+oqklgyP32F+K9nE7Mnw7nAmQM4allWG82Xuxq9/bbxZWrWhbl75cQCpLN8uMEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9098

On 11.05.2023 19:09, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/arch/riscv/include/asm/page.h
> @@ -0,0 +1,58 @@
> +#ifndef _ASM_RISCV_PAGE_H
> +#define _ASM_RISCV_PAGE_H
> +
> +#include <xen/const.h>
> +#include <xen/types.h>
> +
> +#define VPN_MASK                    ((unsigned long)(PAGETABLE_ENTRIES - 1))
> +
> +#define XEN_PT_LEVEL_ORDER(lvl)     ((lvl) * PAGETABLE_ORDER)
> +#define XEN_PT_LEVEL_SHIFT(lvl)     (XEN_PT_LEVEL_ORDER(lvl) + PAGE_SHIFT)
> +#define XEN_PT_LEVEL_SIZE(lvl)      (_AT(paddr_t, 1) << XEN_PT_LEVEL_SHIFT(lvl))
> +#define XEN_PT_LEVEL_MAP_MASK(lvl)  (~(XEN_PT_LEVEL_SIZE(lvl) - 1))
> +#define XEN_PT_LEVEL_MASK(lvl)      (VPN_MASK << XEN_PT_LEVEL_SHIFT(lvl))
> +
> +#define PTE_VALID                   BIT(0, UL)
> +#define PTE_READABLE                BIT(1, UL)
> +#define PTE_WRITABLE                BIT(2, UL)
> +#define PTE_EXECUTABLE              BIT(3, UL)
> +#define PTE_USER                    BIT(4, UL)
> +#define PTE_GLOBAL                  BIT(5, UL)
> +#define PTE_ACCESSED                BIT(6, UL)
> +#define PTE_DIRTY                   BIT(7, UL)
> +#define PTE_RSW                     (BIT(8, UL) | BIT(9, UL))
> +
> +#define PTE_LEAF_DEFAULT            (PTE_VALID | PTE_READABLE | PTE_WRITABLE)
> +#define PTE_TABLE                   (PTE_VALID)
> +
> +/* Calculate the offsets into the pagetables for a given VA */
> +#define pt_linear_offset(lvl, va)   ((va) >> XEN_PT_LEVEL_SHIFT(lvl))
> +
> +#define pt_index(lvl, va) (pt_linear_offset(lvl, (va)) & VPN_MASK)

Nit: Please be consistent with parentheses. Here va doesn't need any,
but if you added / kept them, then lvl should also gain them.

> +/* Page Table entry */
> +typedef struct {
> +#ifdef CONFIG_RISCV_64
> +    uint64_t pte;
> +#else
> +    uint32_t pte;
> +#endif
> +} pte_t;
> +
> +static inline pte_t paddr_to_pte(paddr_t paddr,
> +                                 unsigned int permissions)
> +{
> +    return (pte_t) { .pte = (paddr >> PAGE_SHIFT) << PTE_PPN_SHIFT | permissions };

Please parenthesize the << against the |. I have also previously
recommended to avoid open-coding of things like PFN_DOWN() (or
paddr_to_pfn(), if you like that better) or ...

> +}
> +
> +static inline paddr_t pte_to_paddr(pte_t pte)
> +{
> +    return ((paddr_t)pte.pte >> PTE_PPN_SHIFT) << PAGE_SHIFT;

... or pfn_to_paddr() (which here would avoid the misplaced cast).

> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -69,6 +69,11 @@ static inline void die(void)
>          wfi();
>  }
>  
> +static inline void sfence_vma(void)
> +{
> +    __asm__ __volatile__ ("sfence.vma" ::: "memory");
> +}

Hmm, in switch_stack_and_jump() you use "asm volatile()" (no
underscores). This is another thing which would nice if it was
consistent (possibly among headers as one group, and .c files as
another - there may be reasons why one wants the underscore
variants in headers, but the "easier" ones in .c files).

Also nit: Style (missing blanks inside the parentheses).

> +static void __init setup_initial_mapping(struct mmu_desc *mmu_desc,
> +                                         unsigned long map_start,
> +                                         unsigned long map_end,
> +                                         unsigned long pa_start)
> +{
> +    unsigned int index;
> +    pte_t *pgtbl;
> +    unsigned long page_addr;
> +
> +    if ( (unsigned long)_start % XEN_PT_LEVEL_SIZE(0) )
> +    {
> +        early_printk("(XEN) Xen should be loaded at 4k boundary\n");
> +        die();
> +    }
> +
> +    if ( map_start & ~XEN_PT_LEVEL_MAP_MASK(0) ||
> +         pa_start & ~XEN_PT_LEVEL_MAP_MASK(0) )

Nit: Please parenthesize the two & against the ||.

> +    {
> +        early_printk("(XEN) map and pa start addresses should be aligned\n");
> +        /* panic(), BUG() or ASSERT() aren't ready now. */
> +        die();
> +    }
> +
> +    for ( page_addr = map_start;
> +          page_addr < map_end;
> +          page_addr += XEN_PT_LEVEL_SIZE(0) )
> +    {
> +        pgtbl = mmu_desc->pgtbl_base;
> +
> +        switch ( mmu_desc->num_levels )
> +        {
> +        case 4: /* Level 3 */
> +            HANDLE_PGTBL(3);
> +        case 3: /* Level 2 */
> +            HANDLE_PGTBL(2);
> +        case 2: /* Level 1 */
> +            HANDLE_PGTBL(1);
> +        case 1: /* Level 0 */
> +            {
> +                unsigned long paddr = (page_addr - map_start) + pa_start;
> +                unsigned int permissions = PTE_LEAF_DEFAULT;
> +                pte_t pte_to_be_written;
> +
> +                index = pt_index(0, page_addr);
> +
> +                if ( is_kernel_text(LINK_TO_LOAD(page_addr)) ||
> +                     is_kernel_inittext(LINK_TO_LOAD(page_addr)) )
> +                    permissions =
> +                        PTE_EXECUTABLE | PTE_READABLE | PTE_VALID;
> +
> +                if ( is_kernel_rodata(LINK_TO_LOAD(page_addr)) )
> +                    permissions = PTE_READABLE | PTE_VALID;
> +
> +                pte_to_be_written = paddr_to_pte(paddr, permissions);
> +
> +                if ( !pte_is_valid(pgtbl[index]) )
> +                    pgtbl[index] = pte_to_be_written;
> +                else
> +                {
> +                    if ( (pgtbl[index].pte ^ pte_to_be_written.pte) &
> +                        ~(PTE_DIRTY | PTE_ACCESSED) )

Nit: Style (indentation).

Jan

