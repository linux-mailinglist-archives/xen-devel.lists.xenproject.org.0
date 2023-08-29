Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B8E78C76A
	for <lists+xen-devel@lfdr.de>; Tue, 29 Aug 2023 16:22:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592304.924989 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazbw-0005hD-2F; Tue, 29 Aug 2023 14:22:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592304.924989; Tue, 29 Aug 2023 14:22:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qazbv-0005ek-Vn; Tue, 29 Aug 2023 14:22:27 +0000
Received: by outflank-mailman (input) for mailman id 592304;
 Tue, 29 Aug 2023 14:22:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=mPBx=EO=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qazbt-0005ea-QE
 for xen-devel@lists.xenproject.org; Tue, 29 Aug 2023 14:22:25 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2052.outbound.protection.outlook.com [40.107.7.52])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7817ca35-4677-11ee-9b0d-b553b5be7939;
 Tue, 29 Aug 2023 16:22:22 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DUZPR04MB9983.eurprd04.prod.outlook.com (2603:10a6:10:4d9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.34; Tue, 29 Aug
 2023 14:21:54 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%5]) with mapi id 15.20.6699.035; Tue, 29 Aug 2023
 14:21:54 +0000
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
X-Inumbo-ID: 7817ca35-4677-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UCpD/ou05MZ05+LSgAzn5xo1jvapsqqquI9jYnNZUQieox65NoLtFuispmav/dCfMGlrRynrUL1fnKbVcm4NX8OBaN77NiO/HBiPDp5O29HP6apHCO+vm5iBT/LCfp49rpBJh7UWWuVPKUnXn7Vzmd3zSa/wECvT0qV0gkzZvUwDlkl1GlsiiD1l98nHUnCjAoHQbgPAJgqkKXDX1MRduH7QHeEagmC+u3xt7eGr2U4mntDKCIZ7uFjREL+7TzEA20hBfo9lfK2QxLVLpAC7HneHVTwdACD+rhwb3BVjbf6bVDt9JVnqG66F2mU2VPeIDbbB838Z8fPrUNFtBJRPzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fqZQyZrY36izFBLb6hlQzKneQ331m94pD6mWUsh/gkA=;
 b=fyS92K21tMZjhCEX6qDLtJJr4vUggTwUOmeMKR8SB8KKg60ywhCDaimruelgoA4+5DVDrXiKP7WA4ZtxH7fMebmWhq4X3CrzQVPzTsW7K6nuo1+Eu4oT2RZiTDx3mSSM6eOXqGjHPt5g0UPnm4n0AC+DL7EnnXK6H6wfXuJmfIjjBrFieBEFpG8WBGGY+6vmk5TcM0HRYlsgBaiCY7O4/vJ2Vb5HuZHh29pH2xoyPsIFPP8lA0EMFesuaSu+a712lUQiKlCNsDzxQju+19jrWNBspPNku6DV4HrpdmliLJRjfgI5C3oqpM/34Sita+WOv9f2jFb4CXOgI50GOryYJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fqZQyZrY36izFBLb6hlQzKneQ331m94pD6mWUsh/gkA=;
 b=Ha9nRyewZD2OwetyLInTz+S4eM0OmDW284f0Sn9fgp9hBtFOhO5CoKw7f2wrp7Dlr6NjWnFe77v/eSO+hEC7crtDBWi72t2ibYa5N9mUyMIkNMc7R+56HL123RVdboKg1zo+0CkRB7wpSiJzK4sFujYPUtGAZebX1gUHgAardPzVtMHNdmuquGSEey3BHg/xa7PrleoT8gQlAmtakXHAk+scQgp1LScFKjhxXk/oDlnVwFznc0aksgVN2fevNzOeJVvgNfjBHqCEUvrIGquHtdQ6wr1KZ3REQOmaQjNDCRcJNhStXK6T82ZaT8ka1Y7gp3iN8KzfG0EniBnbC1VOFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f5e258e1-5517-2276-6497-4288192cfeaa@suse.com>
Date: Tue, 29 Aug 2023 16:21:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 3/3] x86: Fix calculation of %dr6/dr7 reserved bits
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jinoh Kang <jinoh.kang.kr@gmail.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230829134333.3551243-1-andrew.cooper3@citrix.com>
 <20230829134333.3551243-4-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230829134333.3551243-4-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::8) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DUZPR04MB9983:EE_
X-MS-Office365-Filtering-Correlation-Id: 9220f704-2fdc-437f-c7b0-08dba89b4b84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mKOWnke059JZBKjzy1veKQ3TRRWe1D1ZaSWtNozE0jGk/kLAH15vAIpaOV4eXaAIbVeOBvAiKKpd+Q5r9JAl0+LDAs7fWX5yxDsG2T54Ixkq/TLVt9kbuzhtQNQ71DCDpOOZ7uiX0kLmikdXZfS2MuogRx7d0r1/H4bY6CZJH7Q8ZCIv3mpDifsIPoJgBi++OHToH4HRZwzz/z25mz8EgFYQ2iVPix4ej8rvioqY7lLwYnuGCMAq++P2Ozr/XQxYMSqh/GHHTIPgtiRNf2jEvyMHZX4g24dJgzbzDsOWvJEs56svi03XX2A8eW1+p1NIkTHZBvosXVN2mY3/RghRq7zxa8YdZW+0PpIc0P5tWoFphwtXtYWYdSuYk38Rm5irTvXGnZptMmV4szGSpt2/FX2b+uIlqcyCK4vi6JOw471HFZ1dBu9FRvwAccXTpm8LkM49dujORkWZ7N+FVShgsPi39kA+4Fteh9oLYqYJNzBAzh9od3WhDRBSxfyeZ6/ZY3h9ZMoVDDF5SybHaU8wnDSUDDnxAlCcl+2HRAh7jwIhPhM21ylvIrr++gA4W8VnRKyw0nnoQoU5vaWI+kxBeK/q51AVwFRj53WPwi0zYrH1nDHAlNdrmNEkyEKqfd+2Eux4FUPxbiL3VlQdBcYR9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(376002)(366004)(136003)(346002)(396003)(451199024)(186009)(1800799009)(6512007)(31696002)(6666004)(53546011)(6506007)(2616005)(6486002)(86362001)(2906002)(5660300002)(6916009)(4326008)(8676002)(8936002)(36756003)(54906003)(66556008)(66946007)(316002)(41300700001)(66476007)(38100700002)(478600001)(83380400001)(31686004)(26005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RFVvWHpjMEQ1TzY1a3NybkYwbXBnbmZIdFJ2VTYxNVdwc2VEVEJoRFA5SEtX?=
 =?utf-8?B?YkcvQ0Erbzk4bk11bHNEeDNOcmEreld2RUJUM3BodmF3aEl3OTZJb3p6TzNl?=
 =?utf-8?B?U0psVVk3VUFBSmxHRnBzVTBFMGkvUXp2UXIwdXFkSU9FSE9keW53RVY3ekhl?=
 =?utf-8?B?QXp1bGpkdDQvOTBSdms3Y1RMZEF1QW1IbDZtL1ZSWVFsYlNzOTNvRFYvQ2Vt?=
 =?utf-8?B?MmR1MGo3bEhKZEFmejlnZ3YvRzlZcHplN2cvdG54Z0dWQlBvT3RCckFvclVt?=
 =?utf-8?B?cnNxYmZ0WjVBbnRISXd2eEdoK0Q4RHJpRHB1Mjg2ZFJFUERFTHFBb0dNcWF3?=
 =?utf-8?B?TDFLeThYb3oxd2l1SEhvbUxvOW9aOUJ4S3FUZ1JRUmJiZ3pQaGpPVDRxeVZY?=
 =?utf-8?B?R0ZYa3E1UHhpWlJsN3ZQdmxMVFVTMFV1MUpaTzBFZ1hZTU1nREdPU0hSWnQw?=
 =?utf-8?B?WlNDK00rMFk0bjdZUDI4THdaNjNrZnVDdjB1NlVtblNWVjVEczkvSGRiTm1k?=
 =?utf-8?B?KzdTUkZUTTF1ZCtiMmxKSFdMQnNkOVBSSGZaSUVyRjhheHJGTUQ2Qk1MSEJ2?=
 =?utf-8?B?MXNSck9razhiMXpSYzlLczhIT3IvSyt6bjgwQzNiK1Npc3Y5OTU2cngvZDF3?=
 =?utf-8?B?Y0ZXUENKYm1qMFQ1SnVMQ0djQjFscjBENi9kT0x5SGdBMzdRclorS0NKRUVv?=
 =?utf-8?B?aGpMYkpYTTVsU0Y0ODRKQy9BdVdIVHBZU0Y5S3pTWnd5bEhRdFdQMVRUczQv?=
 =?utf-8?B?VFFISlg5UVR2eHkzSHE2d3NTbldyOERZd0xVWkxTcjlGSHd1aHpYUC9hWTFO?=
 =?utf-8?B?ZlF4YkFER085VGRzSXFuV1lLRm9USHBwSXBRZndseWVvZEtZVGZ1WFYwbnpX?=
 =?utf-8?B?ZThUWC9ZMW85czl4WTRzcWhPaURobEJCRmJyOUNxclNOWU02MkxjQ1VHZXdk?=
 =?utf-8?B?R1h2amNYa1dIRjZXMldGQVJEL1J3dnNLSnJxaytUVWJWMFFIVnhnZWtxT0tn?=
 =?utf-8?B?dVd6SGlxUERSRG1kT3l1YW44RHJOcGNHY1IyM1dUYXVmdmkreEswcmNQVXp0?=
 =?utf-8?B?a0RwUHZNL09jNW5zbmJaUERkK0d3UHJxTktvdHJHd1BFS3lTRXZOa3NWaFpu?=
 =?utf-8?B?ZHVnWWdmcnVYNnpmcXZZclZ3N1dsczEwaW8vYXliUTdVOGRDNGlpRWVXS01q?=
 =?utf-8?B?VkE2bVJ5WW1CTTNzZytlVTBRVlNESFRNUGtVZWppNktRYkIvZzZzZy9yVGhG?=
 =?utf-8?B?VHV2Rmd4T3FycVZaaStwMWhEejQ1UExicUoxbjZITXNaNiszZSsxR2U1R3VU?=
 =?utf-8?B?WXR5QXJqb1J1OWdPOUpOMExGT1JvUWg0a3dhOWZ6Vy9zYXNvWWZzL2xONDJm?=
 =?utf-8?B?OEYwSDltS1h2QjZGQy9DUGhDUGozb21iWFhUc3hjdXpyNmNMOUg3MzlTNDl3?=
 =?utf-8?B?TFdRUmU5RzBkMm1GRytQenE5MDJvKzZ5ZGdabnBmWnJFTkg2QmRtY3Brc0Ry?=
 =?utf-8?B?OUFDQVZqRStGWk82WDNFSmJBTW9Fc2hYWGRhaVhrbE5rK1JuREhtdEdKSjZH?=
 =?utf-8?B?dVEwSFE3c05rQmZidERaKy9Nb2l2SkttVWMzeFB0UEdxRzJmK1FrQi9KQ0tE?=
 =?utf-8?B?cHZYeVpTbVZaY2VLUE9sNVJ1T24rS2xnU0xROThNZjI2OFZEKys1MlhkNldR?=
 =?utf-8?B?TjJmV1EwRmhNM0FyWTJBWGh1V25UTGFyVWV2NDZNbVdtckZsOWEwSUFVbjFo?=
 =?utf-8?B?MEFEaTZ1OUlHK2FiQmtCWm9yNUF4MnBLMHZVb3czSVExSi93U093NjBHb0Ux?=
 =?utf-8?B?QkJ3YzNOZkF2S0tCeDlLWU92NmQvMnM5VmdoTndyalpPUHZ5VjQ0V0lBMzNW?=
 =?utf-8?B?TTFFMUk4Umg2Q25rVHRWN2l2Y0VmTXdBN2puckRBamI2S0x1SXR5azQrZTMy?=
 =?utf-8?B?c1ljaEJObnVMRTdVREVFajNUWFk5UmdmcjNTQ3llclBjTDNXbVNtNFpGb0dq?=
 =?utf-8?B?R2g4TkxNNitUTnp5bG1Rck5mbWNZMHB5ZmJYYXZUc2Q2ODVCSEwrVGJQRXFJ?=
 =?utf-8?B?dEw3cU5uR0RwV28vNmV2eC84VGZsU2NvRExzYTZkUEZwY0I1OVdDK3VKS1JP?=
 =?utf-8?Q?ACDNBHqA7QzA5ODuSJp6e+kzv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9220f704-2fdc-437f-c7b0-08dba89b4b84
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2023 14:21:54.4860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eIMXKlKe5oRyuAbR911etg88bS/v8KE3CoMy/hTN937pbPSjXxavF3po8sHfNQvEO7J29iA7IywyaTKOZNUc8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9983

On 29.08.2023 15:43, Andrew Cooper wrote:
> --- a/xen/arch/x86/include/asm/debugreg.h
> +++ b/xen/arch/x86/include/asm/debugreg.h
> @@ -1,6 +1,7 @@
>  #ifndef _X86_DEBUGREG_H
>  #define _X86_DEBUGREG_H
>  
> +#include <asm/x86-defns.h>
>  
>  /* Indicate the register numbers for a number of the specific
>     debug registers.  Registers 0-3 contain the addresses we wish to trap on */
> @@ -21,7 +22,6 @@
>  #define DR_STEP         (0x4000)        /* single-step */
>  #define DR_SWITCH       (0x8000)        /* task switch */
>  #define DR_NOT_RTM      (0x10000)       /* clear: #BP inside RTM region */
> -#define DR_STATUS_RESERVED_ZERO (~0xffffefffUL) /* Reserved, read as zero */

As you're dropping constants from here, how about the others? Especially
DR_NOT_RTM would be nice to go away as well (I don't really like its name),
yet DR_SWITCH looks to also be unused.

> --- a/xen/arch/x86/include/asm/x86-defns.h
> +++ b/xen/arch/x86/include/asm/x86-defns.h
> @@ -102,13 +102,30 @@
>  
>  /*
>   * Debug status flags in DR6.
> + *
> + * For backwards compatibility, status flags which overlap with
> + * X86_DR6_DEFAULT have inverted polarity.
>   */
> -#define X86_DR6_DEFAULT         0xffff0ff0  /* Default %dr6 value. */
> +#define X86_DR6_B0              (_AC(1, UL) <<  0)   /* Breakpoint 0                */
> +#define X86_DR6_B1              (_AC(1, UL) <<  1)   /* Breakpoint 1                */
> +#define X86_DR6_B2              (_AC(1, UL) <<  2)   /* Breakpoint 2                */
> +#define X86_DR6_B3              (_AC(1, UL) <<  3)   /* Breakpoint 3                */
> +#define X86_DR6_BLD             (_AC(1, UL) << 11)   /* BusLock detect (INV)        */
> +#define X86_DR6_BD              (_AC(1, UL) << 13)   /* %dr access                  */
> +#define X86_DR6_BS              (_AC(1, UL) << 14)   /* Single step                 */
> +#define X86_DR6_BT              (_AC(1, UL) << 15)   /* Task switch                 */
> +#define X86_DR6_RTM             (_AC(1, UL) << 16)   /* #DB/#BP in RTM region (INV) */
> +
> +#define X86_DR6_ZEROS           _AC(0x00010000, UL)  /* %dr6 bits forced to 0       */

0x00001000?

Jan

