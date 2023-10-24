Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 452FD7D499B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Oct 2023 10:13:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621757.968529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCXU-0007KL-AN; Tue, 24 Oct 2023 08:13:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621757.968529; Tue, 24 Oct 2023 08:13:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qvCXU-0007Gt-7c; Tue, 24 Oct 2023 08:13:24 +0000
Received: by outflank-mailman (input) for mailman id 621757;
 Tue, 24 Oct 2023 08:13:22 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=krZT=GG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qvCXS-0007Gn-Fa
 for xen-devel@lists.xenproject.org; Tue, 24 Oct 2023 08:13:22 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2043.outbound.protection.outlook.com [40.107.7.43])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 314f59d6-7245-11ee-9b0e-b553b5be7939;
 Tue, 24 Oct 2023 10:13:20 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by GVXPR04MB9926.eurprd04.prod.outlook.com (2603:10a6:150:11a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Tue, 24 Oct
 2023 08:12:48 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::d924:b650:a2ad:7b25%3]) with mapi id 15.20.6933.011; Tue, 24 Oct 2023
 08:12:48 +0000
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
X-Inumbo-ID: 314f59d6-7245-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDE45eCDDRiKcky1pfwr0LLqQUxdnsyB333nX7Ns0Nrvip4a9R92k8j6oCW/DqKlJ6fMAALBwQ09w8CQwvKoXxEP5cRY8GO1pEMOv6QCb0RrseEjl2f/u2v22AxdMHVOGLVQ7wdzD9+vB9njr7/Z7CY/6Yi5ZcFdWNjWL4vmI7VlywJYIC1ycKuF+ZTJiKvypzbtoBpZVic+mLMXdBXHWw16tJQLnmzxa2L1r9P66QWEg8BD9loDssYu1qSGSTX2Raj0hqq4bf16kevT7UmiVMUhnwhfbMDAAC20utalN8BDf5xknR1YeXHahaNZO7mmeYSudeKfYqOqmEHhiUQz0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FtvrN1KREC49KTa6w7bSQtvJLMkNUjMbqi/tcrw1KK4=;
 b=gV/psuRT+B2QdpjN5MdESR9MhtIFxZq+687yZd28mPxa/dRSFt702qNrFdDip0Sc9Yr3pPZ0zN94qgvr/4FoMmQK9LYfv95ENHzbJyhU5ZdGzwz8wTm/RFDBafNPtc1WUCYOkkFAjpn09F2MkKaqeoI/D+qeOiXDunW3eJzKiCobVbdbc7SNehwPrpY7HIjobZNZuZYIrefM5vMZXlA1MpfKkUYwWn9gyZloff3pu/ps2ULM9DyioRuVPVxMksV+BaSlME6y2rG+jBbcKvbPBwBnh62RaFg830dAuvn8zOkwj0etLCufVVX7Z1TTTqA08zZGHfs3gEiwdYPxHBR7wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FtvrN1KREC49KTa6w7bSQtvJLMkNUjMbqi/tcrw1KK4=;
 b=SMCuf4rvFaLazHIFvWKV3qAhFzWs7Q8fgbx7W08vyKoxHTDTxVm1DjpaJzFs9znKaIzVEsGvURScW/gnXfPZ5GFe3Bero+INXZoko8NP5kS+Q/3SukvHNi+vFoz8N9xazh80ivWUpL+b7DXe8K7DmT+Err1yjcADUYsd7cMB1YyudAPx1iT16hcu6bIcuT0/KVs7RUlC285YG6/yQa4PsadYxEgVvvaS6OaouMHfd5IA2XFV3HbwNsdse2N85uu3RRmoGVJ8eqH4jhW6QifDxn9aL+xvYDNucz+B04e8rXh84RJpjfetchEhleJbWQx4UcsQZZ9HmvmgZ1OSjExEBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <2f3850a7-f2a3-350f-b9b6-be0bde0d1a28@suse.com>
Date: Tue, 24 Oct 2023 10:12:46 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [XEN PATCH][for-4.19 v4 2/8] x86: add deviations for variables
 only used in asm code
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1698053876.git.nicola.vetrini@bugseng.com>
 <67ec8b468d6048f7f91590b59430df275b2f5870.1698053876.git.nicola.vetrini@bugseng.com>
 <2aaa0978-e28f-4151-f4ba-f2628f6d4677@suse.com>
 <ef7f5c65ad0b0129f6b6119b6ad7d506@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ef7f5c65ad0b0129f6b6119b6ad7d506@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0091.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::11) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|GVXPR04MB9926:EE_
X-MS-Office365-Filtering-Correlation-Id: 236d91f3-2e0a-4ad1-78a6-08dbd4690296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B4Lp2T5Nx9UcnztUfiSQn0ksfC0hg2ZNi/Qh72/SF/Y49Ik6ZshaKbhMUTCDCWRCboun72ONZpBmJgKFuIZTM07lUYT2xZGibAwFbXICX8qYoD51Kkw0zNkPs7hS7mn50m5yRhYurDtnNc0kQ6WudHXXc9iVsDFTuyErVk8q2HoffvVUePQzO2HmxEBGn2LsWN3uNlVksQjFjC1z/GFKxeH8LqjW8u4AiGGNCAdjuIXXEk+kmO5Dih3gUF43YGPTafruCqt4VxGgnth7o0RsHHDY1JAGeKf8yvIQIjMIj17O9siyRuclCxxIbGhPrd+9LL64Lvva4/lpScbUrvzIW2TnjArmvFJbLOqWYd0U0UVgtAISIbOL6kvqhJLhvnuM2TnSL5d9B/L1hjPLq7tAMvvJcW+xnB75L+Iu3Hq0v5+l06O+yHjKi+yNyLSHi+C8yZOj/TCIFbjdFNxkWZlA0KzJXG04Ujp4Weo6x5OF9+ruLmYR0gr2Q2knbBVVKU4QHGtS4+x2hLrnVBz6IWLteu+rzepI/8NxRd+a7eYFgLM4rzxSPcWmz1j6X8Wb5mIJ0RykJFjiM8Sspcxacu6DYsHCPSerj+4OBLrk/G+yDCXnHzHTckxEPRPVrWpF1peEQRgjGD2K4k+RnNBfiIIyzA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(346002)(136003)(376002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(53546011)(86362001)(31696002)(36756003)(31686004)(6916009)(38100700002)(316002)(66946007)(26005)(478600001)(66556008)(6506007)(8676002)(5660300002)(6512007)(41300700001)(66476007)(2616005)(4326008)(2906002)(8936002)(6486002)(7416002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTVxV0pld3JZQUNTRzRjTU9tRW1XcnpyUXphZVZwWVZKc1dtL3dzd213N1Vy?=
 =?utf-8?B?NlQ5cVo0dENkeHJRdTh0K2F6YkFoRXE0TTIvOG9MeFc3czlMMmU5UVI0bWYz?=
 =?utf-8?B?NWVQUTQ4OHNoemtXZW50WS9MK0RNQzZrc2l2bCsvUnJWbVlJRTRzZi90c2RE?=
 =?utf-8?B?YzRhTnBNTUNFWi9ybEt1Q0lUM2FqTTVGR2RqY0RUT0lVNzBhR2FZWjRERzNB?=
 =?utf-8?B?L1ZuNWZPRCtOcURlRkNBa0hqMnZPNURRSi9YcXQ3Z0dsL0kyQkoydmpyOTVL?=
 =?utf-8?B?R2h4UXdZbmc2QngxQzNlSUJuazdMOHJYVmsxMndjYlZ2L2sxYU1QNmozVnRO?=
 =?utf-8?B?THlRUmszL3lFYjU5dUg2OHNkNWFmdzg3MzRwRUlaMzk3Q3duUlkyQW9zZFZk?=
 =?utf-8?B?emhKMVZnM3N3Tld2WTArdmJXcGdERTdndXlETWhFb1FEMFdEbnNGT3U0QUlU?=
 =?utf-8?B?NGJtZzJJaHFmZmozeWFpbWNNUk82SFVOUWIrSWxjak15NkJOR3lGbXVNNTRo?=
 =?utf-8?B?eUFUSDREeSt0d21KUVdhaDNwVHRSNGtWYUR3TVhYVUtCazJPVmhQakFKNmMz?=
 =?utf-8?B?NGo3Ym4wRUdreGk1MkJBNk5KRGhPMmJ3S2ZVZVFpOFpMeUZlbVZiZEppeHUy?=
 =?utf-8?B?QWNCWkxQcVNQaTBHSS9zS0FXUnU2RUFOeFM3Vjc0WU5tcmIrSGhjTkdGL0Nw?=
 =?utf-8?B?YkQvS2toVHFMMmc1NWNZUVlGVDcrQ3Rpc2dFZVhlZVFXMVBtU3Vmd0dzcjg3?=
 =?utf-8?B?U1FKTUxNdW9ucitTVlEvMHlNWFpLSFFmKzZSNXdSaEJEOEMrdVhTZTd4RjZr?=
 =?utf-8?B?MlRWekh2dC9uUWRpd0NoQVA4WUxmUDJwTVFIR3hyMzFEUDYycUZvSm4vY2tT?=
 =?utf-8?B?TkRSb1lwRElCVFAwWVJyQjdFbFovai9MVEZoYm9WUk5PcWRKRmNNbXdMYjEr?=
 =?utf-8?B?b1VSajVVOFNna3BKa0hsejl5N2dwVUZ0QktOV3JpRjFxZVF6azRWdTJWZ0p1?=
 =?utf-8?B?ZUhDVWRLL1RLMDhoS1hSNzBCcHRIL255TWJXN3FaZkRpOHdzVE1aZ04remZh?=
 =?utf-8?B?KzVDT2hwa1BjKzlOdVVCbGx1NmJsT1MwaHdqbFhqRm5hcUUrR2lEUHBaMHZD?=
 =?utf-8?B?dDJ5RytFQnFOUjg1RFVWcGNRT2wxbS9sUU1rbElKRzdISlJOVGszTHhWOENx?=
 =?utf-8?B?cE1YbjBuNzAwNnBGdDdxdVp2QnBJSm9EaStwUUhXMGlFK2c4VDFXdDA1Nzh3?=
 =?utf-8?B?a2g1UTJpY1B1aCtxZnNHTDVaR01iVjBTY3NXaGtlVGxnRU4wVWNSdU9uRVAr?=
 =?utf-8?B?ajV6NmRVU3ROUnF0L1BySU9kbFZEK0MzcDJyUU9sSVJIRG9wcHZsNkdqRXdD?=
 =?utf-8?B?Ykl4dUtxaksxNGpnb0t5VU9lYXV0Q3V1ckhzSDVRVlE2UEI0bFUrNzhXQjNM?=
 =?utf-8?B?RUI3M0xPNUpHWklpNTA3aTlVQnFNNk9VckFwUXJYZFE0VHdlSFp0NTFuUVJH?=
 =?utf-8?B?ajh0ajFQZlpRRmZuand5emwzd1hXcXpNb1FYOHdUcWNzZWpsS1BhbDRWOU9C?=
 =?utf-8?B?RFByZCtRdndYUXZBRG11VUpZb2d1eExCcWREaE8zMGp1WFZOOWMrSlk2MnF3?=
 =?utf-8?B?SUdtOHQ1OEJ2eWpudU1YMExjYVJqaVZOblIvb01iTldCZVpQUHpFaW9yTFF4?=
 =?utf-8?B?Q1FQVnNCZzhxTGxLeEtLZVdXZlA4YmNnT0hIeWJXSm40eXo4aEZ0S3FwWDlt?=
 =?utf-8?B?d3NkdkhoVGtXTEh5M1pSOHMvRXMrRHhRK3pnUHRicjlDWVZsZUJCOEJrTFIw?=
 =?utf-8?B?ais2VVU4MWRSUDJXYXpsenRSZnl6K1Q0Q0pRSldteGpQVStrZDM2Uy95Tzhq?=
 =?utf-8?B?K2g5aGt6eFZvb09ueFBLUDQzRUJSeVZxRmNtU3BpSUhSM2hiY2sxUlFhekFo?=
 =?utf-8?B?WDUxN2RVWERxbEJ3S2ZnMkdLNklabFovR0JyMVpVUytFNVRnOS94Nm04QmZ1?=
 =?utf-8?B?bjBDaXhJL04vM1NjajBGeHEySFVqYy9rd0JRaGEwell3NGpodmVzeDJXQ2Rw?=
 =?utf-8?B?K0M1aGFMOXVNUU1LRjFYMk51a2FQd0xyNkFWUlloeHY4OW1VdU5GMEFOcS9S?=
 =?utf-8?Q?LafSv26rqxaAnwBYm6ZjMRWhV?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 236d91f3-2e0a-4ad1-78a6-08dbd4690296
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 08:12:48.4318
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3zxD7OoZCXV49GQQrCJaf2nMszoBWYD8s/N5GctWK+wzFHmnpDeSgb9mdNMecflLHDkgaWcIQyDrdvP62QpZOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9926

On 24.10.2023 09:58, Nicola Vetrini wrote:
> On 24/10/2023 09:32, Jan Beulich wrote:
>> On 23.10.2023 11:56, Nicola Vetrini wrote:
>>> --- a/xen/arch/x86/include/asm/asm_defns.h
>>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>>> @@ -31,6 +31,7 @@ asm ( "\t.equ CONFIG_INDIRECT_THUNK, "
>>>   * gets set up by the containing function.
>>>   */
>>>  #ifdef CONFIG_FRAME_POINTER
>>> +/* SAF-1-safe */
>>>  register unsigned long current_stack_pointer asm("rsp");
>>>  # define ASM_CALL_CONSTRAINT , "+r" (current_stack_pointer)
>>>  #else
>>
>> SAF-1-safe is about symbols "used only by asm modules". This doesn't 
>> apply
>> to the declaration here.
>>
> 
> The wording could change to "asm code" if that is deemed clearer.

Question is what would be meant by "asm code"; "asm modules" is quite
clear.

>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -75,6 +75,7 @@ static bool __initdata opt_invpcid = true;
>>>  boolean_param("invpcid", opt_invpcid);
>>>  bool __read_mostly use_invpcid;
>>>
>>> +/* SAF-1-safe Only used in asm code and within this source file */
>>>  unsigned long __read_mostly cr4_pv32_mask;
>>>
>>>  /* **** Linux config option: propagated to domain0. */
>>> @@ -147,12 +148,13 @@ cpumask_t __read_mostly cpu_present_map;
>>>  unsigned long __read_mostly xen_phys_start;
>>>
>>>  char __section(".init.bss.stack_aligned") __aligned(STACK_SIZE)
>>> -    cpu0_stack[STACK_SIZE];
>>> +    cpu0_stack[STACK_SIZE]; /* SAF-1-safe Only used in asm code and 
>>> below */
>>
>> Wasn't it that such comments need to live on the earlier line?
> 
> On the same line is fine as well. I personally found it less clear 
> putting that in the
> line above.

But please recall that these comments are intended to cover other
scanners as well. Iirc only Eclair accepts comments on the same line.
Nevertheless I realize that putting the comment on the earlier line
is problematic (and maybe also scanner dependent) when that ends up
in the middle of a declaration / definition.

Jan

