Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE10C7A47BC
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 13:02:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603926.941071 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiC1I-0004Ri-V2; Mon, 18 Sep 2023 11:02:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603926.941071; Mon, 18 Sep 2023 11:02:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiC1I-0004PX-SL; Mon, 18 Sep 2023 11:02:24 +0000
Received: by outflank-mailman (input) for mailman id 603926;
 Mon, 18 Sep 2023 11:02:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiC1G-0004PQ-LX
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 11:02:22 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20626.outbound.protection.outlook.com
 [2a01:111:f400:7d00::626])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d724596c-5612-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 13:02:21 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by PAXPR04MB8608.eurprd04.prod.outlook.com (2603:10a6:102:21b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 11:02:19 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 11:02:19 +0000
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
X-Inumbo-ID: d724596c-5612-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LFUmNUhpYzlnll11My8tKcYx8enlgr8gwozaE3fwsviyS8vKiEy3QYCxU1BZXkJHVgfmqs8Mz9lkBraHR+WMrv+f2l8wnMsREjbmOk67h+bOswZ2TugCfvHFGQlEAtfam29mRp9emkm/0p3hL97vopCtou2RoiBkVWuyf3WBLvdzjw8MroWrTtFXPrXtJWTVd4XVHPRAaRfsl05WqSRIZm0EhImkCuKjwrUcNg7sYn+O7/9WzmtZG80eUu0iIxqN8AZgYjsEAn6o2x8s5t2yR6vgTh1sP+co7Ntgk0Kii4Z53PhJGLd00a9MfXqFtlq7FDjdGt37NRhajTi2CQHyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPXTXWpor4RLB+jbE741HdQw0jz98GiGYchyZTXNKO0=;
 b=gJzh/IFmYtQs5O0A3FTZ+flaYdo6NBjXZg/cggP+emu7w2JYo9IVCIqiHGRDGprQnh7c12bc5NR7TMvH/FdKjTpceRl+uRONY72b9tvmbiliYKDXzFsUBKmYMwtW66Yz9Tv2BkE+9S6NMU55HHCMPQUVi7+QMtxuJhHOFoAsLdoYaU9KHCbTchadS/ANBNCC5kF2dfCsIodhxDlSmmruoUIwMPBAKm3bxhtSUn6QKY4tyCYYBeJu8XyLE6I2P1/TJODRDsKCVeBx25MdKDkaj/8fjrFOfje+TEa2plzqlonu4mk5ILZSP77bfqosyTgAb9tqzyl0Mv7OKnJaJtKFuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPXTXWpor4RLB+jbE741HdQw0jz98GiGYchyZTXNKO0=;
 b=COoI8LiJCyybsILsVwcAD7KG4lYCBFd9/n1nlsXBLtChVTO6sYNTGDwUcPpwNmsGtaihjBwB5n3QqNgbwJyWzW1NkC/7k/qpFi/04640Mf41A8s2FQXYeDLxXHJ6j93CXWwhJEDLZGqpYnvr2Bb5g7GbM+gkSdVPfTt3mzawhCQjXpC5QmuAOAVBgX8aLoAXtyOKGnIKc+aWBZWF4C3jqRi6mwxXLYOTRpL4dCYCKzGTOKClxPn8JiT05RFDJxXUflW3O3fPq5rDbFq7Tp+qweFdk1Nd7iazPy9mr8T8KksPSgXQeDilX6lZREFczC+U0A3TAJHNHgzw0kYRvVOM1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d089bc84-40aa-6a71-341c-df934910c2b2@suse.com>
Date: Mon, 18 Sep 2023 13:02:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 6/9] x86/entry: Track the IST-ness of an entry for the
 exit paths
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
 <20230915150038.602577-7-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230915150038.602577-7-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0059.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::7) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|PAXPR04MB8608:EE_
X-MS-Office365-Filtering-Correlation-Id: f56baa9a-6b28-4dec-38e4-08dbb836b9e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	y2dkogtkvZHtslsvEBCZsABaHhl7xkNWxs1RY3nn2T79raHGWyQUOXVnkRHHq4pAcJPNHfuR+fVNUHyh/lvoMMT9vZA5UBQEOq3suLuXfwq8+bfPaVO2iwl5r57I6foNBCzQhKSxlMyNWY4T2T53b0f/8HPwp6wRhx4utYvJvs142U95ih01TCQxCpAQdf9sLgswX0hpQkaXjBPmzRVAhgZWITpgWN8p0W+GkS+vJwXQbVyRDowZWPYhqGMJSSRWBaZZronRoUCsQrwKsVhNdwr+5bgF9AOT7w5RfIFIFIfmCY+37x5oSxFcvIC+YqoiaAtrxeMiJ/P6V7ED1kBJIROE28D5n20s1W3RTLatJfi/rQMmbY1njD7+lg/yeSdinVkEts/7Wq8h/U9yLXtsDXfRvPQUX04+4LtmxTOzkkrnzD9rpTMjeQl4xvYWQtRT3FEcLMYbE0eBfHXIuuT3CXjkvYvVMM19EHkn8QQQtBd3BqaHXFO6IxuXwBuDR/scPf88eHIGFQFe86McWJLSqQ5nZAaIP/y/h13PM7kM/TxLMxBQJjr/CJhTetOC8KV+8gbiTyFmtI64o0KS7SOQ/O6BcgaxVTrumvruLJNYp46VwTKyJyvRtLIykgh2XRNcEMGLwx3LWCU6lrPiczTp+A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199024)(1800799009)(186009)(2906002)(5660300002)(26005)(66556008)(41300700001)(316002)(6916009)(54906003)(66476007)(66946007)(478600001)(8936002)(4326008)(8676002)(31686004)(6486002)(6506007)(53546011)(6512007)(2616005)(36756003)(38100700002)(31696002)(86362001)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MFd6Nzhlcm52SVRSZkFrNUZNVktNbllHQ2FDc1FZMVVjeXQ5TENYQTBLRHYw?=
 =?utf-8?B?WndBUWZxRHBGazBqcVY3Y21DdFNKY1VmaUo2bjFZd0p4MWw0N0xPdVVVUnFB?=
 =?utf-8?B?N29iamh6eWpMdURNWUFvb0YrL3JBMTVHZk1lbURKK3B0dWxVbmR6Yk9tcjFp?=
 =?utf-8?B?ZkVEeUVLRGlURmVxY0VWUXNDWnJjWWJiODdCb3JXZ04rYVk5a1VSeUNkSlJk?=
 =?utf-8?B?VmNPWHJ3ZVpwT0I5dUYrQ0pqVEFJaDlFZ3BmelltMlJuRjlXSWdTWjdqV1BK?=
 =?utf-8?B?a2xsaDUwQVBqZ2VTWDRURzFSM1Q0TW1WTEVLK2xoZGdNMjBtTG13ZTFMZEda?=
 =?utf-8?B?ZitBbnNEQ0hPQm0rdzBNRVJ1SDBHQ3ZmM0VBU1BaNTE5eHMwcXcrczZsU2RK?=
 =?utf-8?B?Tzc1MzZEUjNaS3pEbG10V1p0OGtXZDFidHB4R3EyMENXYU5mQjVDNGZ6dTVp?=
 =?utf-8?B?TzVlY0ZHZlduTFNWM2M0ZEF3RFhaWGtNNDJpVWJHNk1iMlhXSFIwY0F5S2JG?=
 =?utf-8?B?eG1oVnI1UVhuWVdKY3JwdFp4cHh4N1hJZ2Q2UkRkYmh2bXV6Y0c2SThnVWEx?=
 =?utf-8?B?ZHJmQUJ0OUN5cCtvOUk4RHNGcmFKLzdJSVViVWh6QW5ydDhsbnh4RFBrUmJO?=
 =?utf-8?B?NHgxMk9JUk5EanlONFNTNmNLUytwQ0pEVUZEWVduZk1FdW0rZithdFlWRGdI?=
 =?utf-8?B?R1FZdFBmNW9YRWZiV2lIVGlKbHJzMG9XYzVidVBZajBkMjcxbC8zWXFHekVh?=
 =?utf-8?B?a1FtcGNKR0dISThValNDVGo1Ymt6ekVQRU1IYVF5QWlCUC9UM25PVWpteVNv?=
 =?utf-8?B?OXduaUNQWEhoNVd5blp5czVEWDNpUTdDcGJIVGIvN040RHVGZ25rTXZvT2o1?=
 =?utf-8?B?cXJKRWxnWHo3N0t6bk84VTViZWkzcVZtdXJMQkVMbk9KSzNDR0EwNDU5dW5t?=
 =?utf-8?B?dGpWTDdTdzQ1L01XYXRzUG1ubEx2V1NNK21ac3hpcmxSbzluWExnRnFyb3Nn?=
 =?utf-8?B?WFhpbXV3NG5PWkc0QUw2ZzlTeXhvY3RiZC92dUUzQURpSm12dDVPYVFxZzFE?=
 =?utf-8?B?eU5DSjQvZEZzMXdDT0MrUmlBcWJYNU9hSFZGY3BudldQQzMzdkJxWW16M3Bu?=
 =?utf-8?B?YnF6N0pwQXZ3VVFPcWxMZTU0cm1OSjBKT2xha2h0WlJYVVA2aDFua0lhL1Zq?=
 =?utf-8?B?SmE0aC9pM1pnWUd5WnVHcHRtL1FDSTdFRlEzM2Z1YjAwQXNSaE40cEozWVdI?=
 =?utf-8?B?dVJQQUVoeHZtNzcvdVNDWTV2REdHZEJ6ZDB5OEhPVEY5ZEJDbmtGQWxIanA0?=
 =?utf-8?B?NmdUZzNkczM1eXFvT2Z0QkpHNXltYTJlTkMxcGJWN2FkM25Pc3hGWjB3ZEVN?=
 =?utf-8?B?dUwxQWE3dW9ocnJjU3oxY25pUU1KenVLY2FuZGVpb3pFZHRXdndwNFV2K3hO?=
 =?utf-8?B?NitVZFdnM2tRMTYvUFpabTVuVXlCVmJJVVRDUGg4Tk1mOERKb0NmaFZxT1dZ?=
 =?utf-8?B?OWozRG1CRm9tSEhSaCtFL1JnREhKREIvUVZkQ01BTWxjQ29YaExKRENJVGxL?=
 =?utf-8?B?UDMwbGNtcFE3V1FnQjBPQzBYVHRLclFFNDF6VDFycTd1V1VEQm52cFRDSEFW?=
 =?utf-8?B?OHFGaWFuZCt2VzdqR1N6NmJYU0toWDF1V2VQemk1d25NK2VsdUdPcmpFMTZh?=
 =?utf-8?B?Y2EzYkdUeERzcXpCa0k2WDVhSzZUcWIvUnd6WXJENTdsQU94Nm1CbEsvY1Nx?=
 =?utf-8?B?TnlzNHVxYjV4U1FVWDluVW5TREtpNTJyRW1EQjZNNDFFWk1OY21RWDVBUDg4?=
 =?utf-8?B?aHZwMHM4S1h6UHRYaFNvcm0reGFYSDBncGx3dG1UMUxHcmpPYUdUSzQ5czRo?=
 =?utf-8?B?TTlWRDc0TVhKTmJzSzNIck5kZDNxSTRqVERvemFuelpncDFWZXl4ZitCdmox?=
 =?utf-8?B?T2FKdUVCeXJ0OC80Kzk1SFFBelhZZWptT2xYT2g0dVdFdTZVOUt1SGdJVFVk?=
 =?utf-8?B?QWVWVGpPblI0SEliRmRDYm9QUi9mYlBDbllVWWx6MEcxYUFQWHhMVTZJMXZ2?=
 =?utf-8?B?OE9tcUhweTR2MXVOWUZEemZFVlA0SHRMVFNFMmNyTUtPRUlJUktVays5cWI3?=
 =?utf-8?Q?LrM7UHxd3CkAJE+UqdUgEK8ni?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f56baa9a-6b28-4dec-38e4-08dbb836b9e9
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 11:02:19.1064
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NBpe1wT9o98mMo+4KJetgI9bUliglRhc7twueO1wlc0lXmK4JQHZhRSVS7AA62rMXo35bq4+FkIHFm6v1/FGBQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8608

On 15.09.2023 17:00, Andrew Cooper wrote:
> Use %r12 to hold an ist_exit boolean.  This register is zero elsewhere in the
> entry/exit asm, so it only needs setting in the IST path.
> 
> As this is subtle and fragile, add check_ist_exit() to be used in debugging
> builds to cross-check that the ist_exit boolean matches the entry vector.
> 
> Write check_ist_exit() it in C, because it's debug only and the logic more
> complicated than I care to maintain in asm.
> 
> For now, we only need to use this signal in the exit-to-Xen path, but some
> exit-to-guest paths happen in IST context too.  Check the correctness in all
> exit paths to avoid the logic bitrotting.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>

I understand you then didn't like the idea of macro-izing ...

> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -117,8 +117,15 @@ compat_process_trap:
>          call  compat_create_bounce_frame
>          jmp   compat_test_all_events
>  
> -/* %rbx: struct vcpu, interrupts disabled */
> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>  ENTRY(compat_restore_all_guest)
> +
> +#ifdef CONFIG_DEBUG
> +        mov   %rsp, %rdi
> +        mov   %r12, %rsi
> +        call  check_ist_exit
> +#endif
> +
>          ASSERT_INTERRUPTS_DISABLED
>          mov   $~(X86_EFLAGS_IOPL | X86_EFLAGS_VM), %r11d
>          and   UREGS_eflags(%rsp),%r11d
> --- a/xen/arch/x86/x86_64/entry.S
> +++ b/xen/arch/x86/x86_64/entry.S
> @@ -142,8 +142,15 @@ process_trap:
>  
>          .section .text.entry, "ax", @progbits
>  
> -/* %rbx: struct vcpu, interrupts disabled */
> +/* %rbx: struct vcpu, %r12: ist_exit, interrupts disabled */
>  restore_all_guest:
> +
> +#ifdef CONFIG_DEBUG
> +        mov   %rsp, %rdi
> +        mov   %r12, %rsi
> +        call  check_ist_exit
> +#endif
> +
>          ASSERT_INTERRUPTS_DISABLED
>  
>          /* Stash guest SPEC_CTRL value while we can read struct vcpu. */
> @@ -659,8 +666,15 @@ ENTRY(early_page_fault)
>          .section .text.entry, "ax", @progbits
>  
>          ALIGN
> -/* No special register assumptions. */
> +/* %r12=ist_exit */
>  restore_all_xen:
> +
> +#ifdef CONFIG_DEBUG
> +        mov   %rsp, %rdi
> +        mov   %r12, %rsi
> +        call  check_ist_exit
> +#endif

... these three instances of identical code you add, along the lines of
ASSERT_INTERRUPTS_DISABLED?

Jan

