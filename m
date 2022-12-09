Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 598FE647FD0
	for <lists+xen-devel@lfdr.de>; Fri,  9 Dec 2022 10:04:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.457713.715686 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ZIu-0001Er-Kt; Fri, 09 Dec 2022 09:04:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 457713.715686; Fri, 09 Dec 2022 09:04:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p3ZIu-0001BQ-Hc; Fri, 09 Dec 2022 09:04:24 +0000
Received: by outflank-mailman (input) for mailman id 457713;
 Fri, 09 Dec 2022 09:04:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wVCj=4H=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p3ZIs-0001BK-Uh
 for xen-devel@lists.xenproject.org; Fri, 09 Dec 2022 09:04:22 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20624.outbound.protection.outlook.com
 [2a01:111:f400:fe16::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 780cec6c-77a0-11ed-8fd2-01056ac49cbb;
 Fri, 09 Dec 2022 10:04:21 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB8374.eurprd04.prod.outlook.com (2603:10a6:102:1bd::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Fri, 9 Dec
 2022 09:04:19 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5880.014; Fri, 9 Dec 2022
 09:04:19 +0000
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
X-Inumbo-ID: 780cec6c-77a0-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kuwrxz+0D01L1x10kYHDWwTu1miBKPFJ6S45OqVZ9c0tPBwD3VYgHJ2NEHyzYp6xcVqIRmLrhI8Aa2o2b58BndHFaDFUUewQ7SeK8Hit/yzUPTHhR/PZN1xDSgzK5DsIZ+vL0/9m9nczNmww06bRjI6bMMX1sy1tLcdTiufzjXLuLWtFFAqOWIPXNxYag+H+ttfhV3aesoMRqmgwOsoUQqa9JhxbhUhxsKvea8xsRrZ16AvrMspFaBryMRPTYFzrPiT4ZaBSTHVRDrAfn08O4Eol3Gf30ps8N9Yse+eOKtrl/0AOfsJ7BSa/8hBR78UhqhqYzitbdwlaQ69cQ+JvrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1ZTMm8FnIb7IyS1Qz5SW8sEglnaz/WvcoZ5DWb/SS20=;
 b=CM5EiifIOcAwkeu0NpTRjMGwMx9zleaAFx/1f35nlUa6047uMbtVTyEJVQ6j1JSJQTK4mpHAQfzUNmTti9mBauJPl+kL+PrH7WU6HRFH5PPMGjJBIo/hyJu/aUh5bd2NZ/Drb7AN2qssTylFV17M9H53zVUzaEvh12+IRTvdbW9rYKH5ZO5ayPAU3Xxo4qJNgMn7C6gVUvGJVGgJXiD3dszBbLYN0ZZ9lFyOaPvWWq2mwzvzAEh/VkgIL25gbz79ykHjavcgJyu3UTbBcLc7Np3od/duNve4Lcdw26a/+XWRNPbG/OU/nlOQg+/FFg9ruhQyvaNuVIWRd5c+Bjr4Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1ZTMm8FnIb7IyS1Qz5SW8sEglnaz/WvcoZ5DWb/SS20=;
 b=cu0q/UoSAmuPDhweMs0IS8i06es7nAIs2CnAs14pQVX/LJhNhZhjC+UQbgo+pbZs+npL1fTODUdNkMyzsFg/D5kG9IA9o93B2rKGJu8R78nEt4dSkyZ6VqLY8Y34wwjE6O1Uw4f+nWUVuHzSre2u0P7MI3QADoLGnT6kNjBP6U8DodX7HSggevdNG+8IVQ46UYnpgy4kkTYOaAoMMDoX2sRi7dRGfmhJ/1WNz1dpG7eCEV6VI3l3YnUoTFHqvjHOtTJoJQjUzifs9mLXWMOTuSxyujmn9Z626rtbbT45i/jrc5VZvkzAdgNSTk+ygo9MYpR8E1uDy7CW2FTuxVtphQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ddb12b37-fef4-b603-6a8a-ed474757c5b4@suse.com>
Date: Fri, 9 Dec 2022 10:04:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] xen/arm: efi-boot misra rule 4.1 fix
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Volodymyr_Babchuk@epam.com, xen-devel@lists.xenproject.org,
 julien@xen.org, bertrand.marquis@arm.com
References: <alpine.DEB.2.22.394.2212081538310.2965472@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2212081538310.2965472@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0165.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB8374:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d1118b4-7e1c-4934-eccb-08dad9c45ae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G8yBjYBvDAs9YB8/T67fYBZ2z79BjRQ20wZV/bHB6cLRya/mFDlkmLHDmFEH8v6YeD7+HBITVYPYT1weWsfyk8cIu25IitiQQvI71uCg2l0K2ZXaRIR+PVihPa1ptad7vNeOqZ+92HaZL1hkhvRPn4AV8S8yW1neDnIWk+HuhRdqRV/GyhapPKu19MBJ3TldEarClIm9QUtu2qn8X/5D/ENuNy6Ml/xfoRQyR4x0ZtJM7rqcP5KkN2mjeLpb/1qp+rNuMt3kmPQpE/ZAO8QardtrtF3dBzSAe0SDer2EIghg19lP4Yia7WtCq2xEVa564OTsU+CxOfcmArhIJrYkHyV1qsiZQ0JMBt7KS5VwSZ+2Oi2NWTlj2jy3ytphBO5IwRK1i7FmspJxRJezI0Wl+msld36MM55OSRQdi1kOArp3ByQlspbpeLBJBexAaYy8j+8ajCoVS3qIgxwibKQtnjSEOHzqrHA8Wg+z+fHLDXbjIHje8Z0NZ3DGSdhx+N3zyfkkeT2MRcEZbKiXFasFt0ohYHhLLl3RHglgZIrm4GkJCtDV15QNmEECdq4639pkxmGEQ0/NOX1WE/Ylf/ZrFDfbdMs3wKsrTeg1rMdevk9s5yF9ujmnysLrfHUDEx9FBJFvAPbr38w2d+A8sc4LUbz14tjVw3dQ8k1t3SSf9UpKCLVpNgE6LbUcGlcjGhhu95GhY4W0m9EO1YtiXHhw5zRyB+jKEkjsJsbQl/hM07s=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(366004)(136003)(346002)(39860400002)(396003)(451199015)(478600001)(6486002)(6506007)(86362001)(26005)(31686004)(6512007)(31696002)(53546011)(6916009)(316002)(38100700002)(4326008)(66476007)(8676002)(41300700001)(66946007)(66556008)(36756003)(186003)(83380400001)(8936002)(5660300002)(2616005)(2906002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SFNKUFlVYUg0ZlJRc3ZVblJCUGRFaHBiWDlTOGxCcytJcXYzZW82TktwcEdi?=
 =?utf-8?B?aDF1Qk1pa2k5Y1VwcDZ1bUVzSC8vdnJQOEhrR2tSMklUalhXT2dQRllHTjVK?=
 =?utf-8?B?ZzV2S0hJM3N6MFZOZjZCaXJzQmFrZEdpcDhHMVd0TEVSZ3ZBZnhKeGRaSGsw?=
 =?utf-8?B?MklNanVhWVZPOVJqL2svdkRoenBxWnEyejByV0tmTmFFMmtYeGp1WU1iSUNw?=
 =?utf-8?B?MjY2YmM4cFF1R2RsRy9MRFFZOW5iN25DaklqR0paYk41Uys5TzV5eURsM1Bj?=
 =?utf-8?B?ZXVyVzBNOE92SytSOFBobWM1Wm5ObW5waUV2bUxmSFY0bjJnR0pZQ2VrWEhj?=
 =?utf-8?B?a0tMaFZNUC9Vam5Cckl1cTA2bm9jdzMrSm5ud3NQQkpMNUd1OHI1VklXZjJ5?=
 =?utf-8?B?Y3laV1pnV0huelN4NG5yY01lWkFSdFdnWkJvUW5YK0tDcm5kMEF3VTRtNE9O?=
 =?utf-8?B?Ty9XNVVMT2hwQ0ZpMlExYmY4V0JnK2pRZ0lSS1dzVkFJU0I0Nk1kS0FYSk1C?=
 =?utf-8?B?Z3lpTTFJL242Y3ZGdkZaVnlHdlRWcU96cU1LOXVJZmdKdnc3QjJnR0xIUXc3?=
 =?utf-8?B?dllHVDEzdlJsOENjbHV5dTFpTWd0TjRWSGJ2VmFYRVdtTk5aWm9UZ05KVWRN?=
 =?utf-8?B?WWRXaUZwYnQzR0NhSUVENzhMTnVsbDhaMmVkamFtMFlWRS8vKzJCSXp1UFZW?=
 =?utf-8?B?ellTRWNPUzVmWkczTVYxQzRxbUNaaTNaTmQxS2pNSk9Nek43T0ZSWmFia3lW?=
 =?utf-8?B?ekZ5ampsdkhOaTQ2RkFBSjZjRElheW1lUmdZamtXN1hDSTZIeWpxazZsWTJF?=
 =?utf-8?B?a0k5WndQdTBHUzJBcVkvbC9YKzhPOVBUQWtudG5DQS8zUk5KdkxSTnVIR1RT?=
 =?utf-8?B?M2xrZkZIL0R2QnIzdTVQNitUUUpnUTIzNmhYbUpJdHJ4ZXoxcFZFZE1YTFBU?=
 =?utf-8?B?U1U1eUQyVzZwaUFTRnQ2cmtyVURMYjUwbmZYUk4vaUVDZG9aektub3lIbnRF?=
 =?utf-8?B?dzBUUENOZ0tDOWM1ZUNjSklaQmlYTVlmc3hmZzkySHNYUytQSFFiblJkQTND?=
 =?utf-8?B?SFFYQW9OY25HNFFsM2NqM2lRcHc3c3Z0dWFFVnRCYjl4UzJXOGYzQ0hHc0FP?=
 =?utf-8?B?MVR5ZloxRWVBVEJOSUcrb0QwOHpXZ1B1M09tSzBheUV3WUtDWlVKM0xpZmxD?=
 =?utf-8?B?RWM3YlE0SUVVTkVRbXMrQW90SjE4UWRxS1pHS2xSUHdLQ0lHbkNMektrQVNG?=
 =?utf-8?B?VVlKK1pMYm1ZaFE3LzRWOUdUOHFiVWdsNnFNMVR4TitQUG94aXphaTFXUjhT?=
 =?utf-8?B?Y0dENllmSFMrVE9CbjJ1Y1NTRzNJTnFWZTY4SnYrS01wTXc1LzJsMkp1SHVy?=
 =?utf-8?B?OThNOUZlTWFDRC9GRDExRldMa3k0bGRTWG81VEVORVhESmoxZG9vM3ZTVWJ0?=
 =?utf-8?B?K09LZmxuclBBK1c3WkVsTURMMHMwZks0TTBpdU5TWGRoNEQrZzZ1VkNDNnFG?=
 =?utf-8?B?bEJZcGVWTWJmRk80VFVvSnpxN1llV1pTTkhVTk92K3l5cys1TWxvZ1lHTXVa?=
 =?utf-8?B?Y1N1Q3BuV3hjM0hnbzV4TkVTcUlvL3pIZkNScWNPdTFkTUZMQjlDeWZDQ2h2?=
 =?utf-8?B?T2lJTDJNa0IxNkd2Y1p1emRiZ0RzVE9lZjV2OFBJTVhvdkVxN1o0Wkd3UkN6?=
 =?utf-8?B?RWd6Ym5mQ0xkTThSYzluTldZZ2M3RHdRVExsQmN6TVhybnZXK3hJODd2RDh2?=
 =?utf-8?B?NUxKcjk3TklrUXRKTkxvZEhYRlBIYmxrUXltUjRvVC9HTEZqWU5UWmh6aWZ5?=
 =?utf-8?B?d29rV0g1N3I3MEZkY3c4VjZ2YkRqdGlGV0lLcEFzWXMwdkk5aG5jN3BBclE2?=
 =?utf-8?B?VytHQUdwd3ozblZIT2ZEWExzbVFnS1dqNnY3YjZqNjBKcUNON3owNGVydHRx?=
 =?utf-8?B?Wmg0NnE0dVhkWDhLemhQaVUwSEozTVNzV2xVdTBYZjNPcFZoQ2tBd1lsSEZ3?=
 =?utf-8?B?RnlncTIwT3RDWlRyL0dsS1B0bFE4MklLWTJMMmNCa3A5ekprcjJ5Sm1MaHhn?=
 =?utf-8?B?aHI5QkxnTlliUmg4MEV6cFVZY2NIcWFzcjdUYTBLWjhodkNWNTltdXVTWHQ4?=
 =?utf-8?Q?ltwqZYup3pgptdOReJ6Kw4gvc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d1118b4-7e1c-4934-eccb-08dad9c45ae5
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2022 09:04:18.9744
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WsVoMXMjWdIinlKP+ePjpCNaPRViRkijCqlAIJvp8VJUxK8lqPWULD0an21mnIPNp94Uj0wa9zFJZNSLU5M9yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8374

On 09.12.2022 01:41, Stefano Stabellini wrote:
> We have 3 violations of MISRA C Rule 4.1 ("Octal and hexadecimal escape
> sequences shall be terminated") in xen/arch/arm/efi/efi-boot.h. Fix
> them.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

While I certainly agree, I wonder if you don't want to correct style
(missing blank line after every one of these declarations) as well as
data placement (all three should imo be static __initconst) at the
same time.

Jan

> --- a/xen/arch/arm/efi/efi-boot.h
> +++ b/xen/arch/arm/efi/efi-boot.h
> @@ -542,7 +542,7 @@ static void __init efi_arch_handle_module(const struct file *file,
>  
>      if ( file == &ramdisk )
>      {
> -        char ramdisk_compat[] = "multiboot,ramdisk\0multiboot,module";
> +        char ramdisk_compat[] = "multiboot,ramdisk\0" "multiboot,module";
>          node = fdt_add_subnode(fdt, chosen, "ramdisk");
>          if ( node < 0 )
>              blexit(L"Unable to add ramdisk FDT node.");
> @@ -555,7 +555,7 @@ static void __init efi_arch_handle_module(const struct file *file,
>      }
>      else if ( file == &xsm )
>      {
> -        char xsm_compat[] = "xen,xsm-policy\0multiboot,module";
> +        char xsm_compat[] = "xen,xsm-policy\0" "multiboot,module";
>          node = fdt_add_subnode(fdt, chosen, "xsm");
>          if ( node < 0 )
>              blexit(L"Unable to add xsm FDT node.");
> @@ -568,7 +568,7 @@ static void __init efi_arch_handle_module(const struct file *file,
>      }
>      else if ( file == &kernel )
>      {
> -        char kernel_compat[] = "multiboot,kernel\0multiboot,module";
> +        char kernel_compat[] = "multiboot,kernel\0" "multiboot,module";
>          node = fdt_add_subnode(fdt, chosen, "kernel");
>          if ( node < 0 )
>              blexit(L"Unable to add dom0 FDT node.");
> 


