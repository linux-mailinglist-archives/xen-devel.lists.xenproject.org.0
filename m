Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5CA7635BC
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 13:58:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570419.892180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOd9e-00012j-0m; Wed, 26 Jul 2023 11:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570419.892180; Wed, 26 Jul 2023 11:58:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOd9d-00010M-UJ; Wed, 26 Jul 2023 11:58:09 +0000
Received: by outflank-mailman (input) for mailman id 570419;
 Wed, 26 Jul 2023 11:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aSls=DM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qOd9d-00010E-3X
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 11:58:09 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062e.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae7fc88b-2bab-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 13:58:06 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8318.eurprd04.prod.outlook.com (2603:10a6:102:1c0::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Wed, 26 Jul
 2023 11:58:04 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::e5cf:5743:ab60:b14e%5]) with mapi id 15.20.6609.032; Wed, 26 Jul 2023
 11:58:04 +0000
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
X-Inumbo-ID: ae7fc88b-2bab-11ee-8613-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrMGus5gezlx8M/UCBw6/fnu3cORow+W+/J8CB6EUR7LWxHLlkGpCXneglLtfayBaz3AmJYmonDHib9/rKnbcCrCYX4eOVkGoSBNAo/nnfPKwhmw4SofuHPA2/Wgy2pI4KU/tnRYaBwVRiLp56aEkY8AGBrIflg1oXcTf7VBNd52y7FYi3073w55WO5smPjXa838rJZTb2vgppEMTV+AbRuHtW4z8O3PTZaasfZAkfYv9ofGMg9E4q9eIGpiOSTNVJQMkyd4bEKWBq3o5u/0czAHsI+nn0/gCMH6Li265CCPSqY0zpMX+7sB9FwxA3ER/PadTSdQZ+xuR9LjlgAyQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Kv64caLvCUE45jELVeNvwxD26DIDkltWkvIeQWmpBw=;
 b=J0laxt5eZYAKxdYBkD+3OD2zEuezMrhYIJkQv7D0lYyzWKacdNtj9pLwy+ygTT2lQ+7kM50hEeHnF19yW0/bpm6JFLuiBqngLClU21jF1LdaM2mOOWPFFXSJeg7HUYWW1GxwW7w2ZlbzehfBDn3uEIv6Fj7BNI0xOwEHcY6kd3ExCB2F0XWIEJ+UFtmGY+xM1Wb1oElb4EbpKy10X/+tRO479TDJULawinZi8B4NDiMpp6aRE/I6A1LFkp4hL963E0ShSCb0BcJNF4sMNLbL2ZMki6ZAPgmY8EPxKEQ8HIcWuqyxIdSdCR/ZoKCJc0+CG+L+uJQWfooWXk/gLFs3yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Kv64caLvCUE45jELVeNvwxD26DIDkltWkvIeQWmpBw=;
 b=3yJfR2r7ov5RDkH8FNe7/t/MTm6yPkRWRTGgg5VHpITIO0ChKPr2LQSy5O7NgbbVTJAX92wNG69M6BvLE2Cr25FN8HCS4ygsVW8+A200B9UVOVaDeQhYO5JB9oEfygmaJEt68x9sVkoI9FIZ1tpLYZnRR0EkSCPTc0GeTczKILMwOvnV60kKYc6RjM2sW5Egr8sYZJ0FUcB0fqfBmUcSB2T/DQ0VfLkM4GlZfobyY6c6B4yHAE6ktWZiUWtu+OtvU+F7O3jBT61VuRTnayi6wqXHJnGPxcp7ss1p0Zs/6jBQU6GZpDOPVfDtnYY+ql1YbrdylXbzIMz9U8myFmJkDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6675f535-7cf7-dd55-4ebe-82ba486029f7@suse.com>
Date: Wed, 26 Jul 2023 13:58:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 2/2] xen/riscv: introduce identity mapping
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1690191480.git.oleksii.kurochko@gmail.com>
 <a8ab1829ab718dda869db3df3348ded211e81967.1690191480.git.oleksii.kurochko@gmail.com>
 <a370548e30aaa8c1160ecd5f2eccfcc10002a8f9.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <a370548e30aaa8c1160ecd5f2eccfcc10002a8f9.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::19) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8318:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4acc53-e0cb-43d2-6ab4-08db8dcf9132
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	46ZTXzXnKZLPgSE2L53tYetjLAF0xz6h6KSHmTRBQsgLNmYlYdehcGww205UhrIb2IXx17oYX7+oao65rL5+BkdJwtcIMb2a07Pvdh2GvLqdtk5+ZgYbUF+nexASL27+S7gQEkfBCY9XsVN+Kms70hZScLsuFUUTNWD9VSSoAcxmy9If8yTrPeMEwmtL+XKUrIS5BX/pCGg9LQwUU0A95hHvD9lzSQnTTkGN3x06BiGsTGUwLylDbFSlKl+3+SXJPxMDG2d3Drvl1MvwDE5L6HJCRuhJm/9z/xdVlgIhZuvZYZdB1EehFKDYVB2ZN+TxIt+FXbNQ85nVrYxbmpF2MZ5of/ypZ69tAph5X3e5jhfJSRg/BoadOKQ/uT/DuGvFlg39PXtDGEov3Id7ZHj3icjhfvWqHKnyCa+Vy5T0V3Xe3E1ezCzEo+Gj2H2BQZ58gN/PS6joqPJlnpxalml5kAtUoy4ExQCYNyV7KCdmo+Y1C/equMkZ2iZiUNsBYQxaaZ8kO3URhBlqDNuEspK3f/q19id8TJiiNFq8uK3joCc+CG4FLpbiwgHBRLWX4TNKJ3SIxXm7AoXfFWkJn4fRSUVSnzJp1qodw8d+FM3V+huEVU0tUrjc+DUYcWr2NYuNW7bmMuEEi4wa2BppKt/29w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(366004)(396003)(376002)(136003)(451199021)(478600001)(6512007)(54906003)(6486002)(6666004)(66476007)(2616005)(186003)(26005)(6506007)(53546011)(2906002)(66556008)(6916009)(4326008)(316002)(5660300002)(8676002)(8936002)(66946007)(41300700001)(38100700002)(31696002)(86362001)(36756003)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3Y0T2RpbXQvZ0RZNys5NEJPTmF3cm1McEJ6a2hCb0VyV0t3cVNVOVh2aU1r?=
 =?utf-8?B?SmVHbDlHYXV3bzk4OVNmcUxEdWswTm5kdE9zOEhQRFBKUkJSUVljRkxJUlE2?=
 =?utf-8?B?OWVmbWV2OTVTdVVNTkN5ZGhObURTd3UyLzdkVHJONmR3aFhsWUxueERPVktY?=
 =?utf-8?B?Ukt5eS9LT0tzSTZqbE1DemhZT0d2SjRhbXRFVEJ1SXA4RDB5bWJNeGVDdXZJ?=
 =?utf-8?B?enpWYTc3VlV2K1RLV1JhL21HQzBkMWNNcU9WUUowWk0ycVVGaWYwdjUyc1cy?=
 =?utf-8?B?d05GODdjbFArNE80YmdYK3dKWjNONEphc2IyUzlEdG9QQTFjeUE2NlF6SC9i?=
 =?utf-8?B?eElFTTBFZ2JhQ05YcjNtdmtVU080eW51dnI1czhNaEdaQkl5N3ZVUUovUjVp?=
 =?utf-8?B?SkFFZEpnU1BoQ1FLQlFJNFU1Y2hxZzhUcFVlSzJBRHJmdCtieU1nU3BjdVJh?=
 =?utf-8?B?M05mcitHczNWWmZMWE95OGh5a0Y1aEgrYjZUMU55eGlQdU1IdGFnVTZUZ1VL?=
 =?utf-8?B?STNnd1BpdEZnNEs2bmtuVHN6OVBpL2Z0SzFXS05RandDcHdKaU8xc1RKU0hh?=
 =?utf-8?B?S2FnUDlUaWd2ZkhZajl3ZnhjSUdnOGhUSkVKRDQ1MG9KQXhGVnR3WWRTWHp0?=
 =?utf-8?B?QTBFVSsyOThyYzFRM2JweVhsbWRqWEpuS2pRcXZDVmFwUytWK1dPYWRNcFlN?=
 =?utf-8?B?QTMrakdTM0Y5S1lVOGlUSGpVbS9OTmZHdXBGNEdiV2QzNVo5dnplTXJSSXE0?=
 =?utf-8?B?YU5PSWdUdERyYUNCNi8ybmkrK3dKNktTMGF2RFZ6STVpZ3llajBPVTR4eHI2?=
 =?utf-8?B?K3BuZDh5SFh3aW9Mb2tkUzUwSHoxNDdSOEhPb2Z1V0VPc1JQQ2JWb0dOcldK?=
 =?utf-8?B?NUQvT2NSanRwYU5TN1FjQjhidk5LdGhibHkyR0J5N2R1TFRQejVvMlZlUzdT?=
 =?utf-8?B?K1gwbFhxTkRRVi9UTDI4L1ZZd01xbzdPcUt4cWxlNkdHSSt3SXRNM2VOZjNE?=
 =?utf-8?B?cDM1V3NVcUNqZFA3bEZDcGplaWU1YVNpZzI1WU5mbE1jc1RXMk90NUNYNTkw?=
 =?utf-8?B?aXl2aG5Id0RpakZGeVJobzRMWG9sUkJCZ3BCOFBDeGdsYTVRcE90RlUyNTdR?=
 =?utf-8?B?M2ltV2pVL1RiblhsUFFCU1ZDZi9SNFdnaGo3cVA1WG1ucHMvK1JEOHlxeksw?=
 =?utf-8?B?S3U4QXFxVzZkL1dLSjlQM0VzdHRvQVZDNjBPWTd5ZTd6cXdkT1FuN0hPeDIw?=
 =?utf-8?B?K0tIelpTaE9RTFhQTy90RHFQTWZXYWtaeFkvbXpTd3JkbktmYktIaGg2VFRZ?=
 =?utf-8?B?RjJaTkd5c2l5bHZ0YVZCbUhWd0xTWkMwZm9JTEJyNERrd09teDBsZjNQdXFG?=
 =?utf-8?B?NElwNHpJK0xLMEJ6ck96d3ZmWEo3aEoxOU9TVDNMQkg3SnNEbjVzWEh1VEhV?=
 =?utf-8?B?L1NkZnR3Q0s5QnNLTE1BS0d6aDFNeUphRnBqS1Y2V1ZUa3J5MCt2MTE1cU0z?=
 =?utf-8?B?YndlTG9sNWZaUjlNcUV5QTdOSnhUTjhNcDlOanNDdXFLeDRUVldJOVk2Z083?=
 =?utf-8?B?cFFtbHhVSUZCcDcwYUNjQlBkc3Y1Nzk4UzdhQ1FKdDZFd0xHQ0hxYWk5c01T?=
 =?utf-8?B?OGR0ajdwcWhUY3RySGQ3ZTUyWWhCOVU4SGN6UGJLSnN0N3VrTlVzSEt2cGJr?=
 =?utf-8?B?aWVuYzN5NmxUZWxLVE4wVXozbVhDaERmRzBCb1VFSVByUld0WGt0NS9LT0RJ?=
 =?utf-8?B?cENlY2hKWEl2bk5PSWZzaXVGeWIvNUlXYlBBZ0V4ci9nQTVyOVovMmJsLzdv?=
 =?utf-8?B?TG82UHNLVkVpdkJHd2o4UHhpWUtNd3hPUXlnNnZQU2EwU2tnQ1QrRFlTbUNE?=
 =?utf-8?B?elg1Mm9RS0xrM0htTXRaclVYeE50T3QxZC83eEQ0VStreU9xNVhnQVJ5UWhj?=
 =?utf-8?B?OUVEcnRhYWdYWEV2VitPUjY4QTFaVWZpbzFJbktOV201U2ZnU1BvRlI2ZjJQ?=
 =?utf-8?B?RHpHaXlNV1lweG82d2xNRjF5T2ZVczZ3SEFWUGJrNmprQmtuTGNtM2N4VElS?=
 =?utf-8?B?THJJdkVaaHZJWE12N25ydlpsRXVYaGE2MlNmUE81c3NEdndjWUY1WWd2STN1?=
 =?utf-8?Q?iZQOwuXa1SHNPdTnlX+rpjHkk?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4acc53-e0cb-43d2-6ab4-08db8dcf9132
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2023 11:58:03.8951
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +kNKNDT+xPvbib6dxBNAHiafTihU/cw7FgFGmwz+I9p5QOxsjyXn6gBsZDh1RGHwzhbimohmHYDJxRA6KO+8YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8318

On 26.07.2023 13:23, Oleksii wrote:
> I would like to ask for advice on whether it would be easier, less bug-
> provoking ( during identity mapping to remove of whole Xen ) to have a
> separate identity section that won't be more than PAGE_SIZE.

I'm afraid you can't safely do this in C, or at least not without
further checking on what the compiler actually did.

> @@ -264,6 +268,19 @@ void __init enable_mmu(void)
>                RV_STAGE1_MODE << SATP_MODE_SHIFT);
>  }
>  
> +void __attribute__((naked)) __section(".ident") turn_on_mmu(unsigned
> long ra)

Did you read what gcc doc says about "naked"? Extended asm() isn't
supported there. Since ...

> +{
> +    /* Ensure page table writes precede loading the SATP */
> +    sfence_vma();
> +
> +    /* Enable the MMU and load the new pagetable for Xen */
> +    csr_write(CSR_SATP,
> +              PFN_DOWN((unsigned long)stage1_pgtbl_root) |
> +              RV_STAGE1_MODE << SATP_MODE_SHIFT);
> +
> +    asm volatile( "jr %0\n" : : "r"(ra) );
> +}

... none of this really requires C, I think we're at the point where
(iirc) Andrew's and my suggestion wants following, moving this to
assembly code (at which point it doesn't need to be a separate
function). You can still build page tables in C, of course. (Likely
you then also won't need a separate section; some minimal alignment
guarantees ought to suffice to make sure the critical code is
confined to a single page.)

Jan

