Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 904C969DDEB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Feb 2023 11:32:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.498721.769606 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPw1-0003ss-72; Tue, 21 Feb 2023 10:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 498721.769606; Tue, 21 Feb 2023 10:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pUPw1-0003pu-3h; Tue, 21 Feb 2023 10:31:45 +0000
Received: by outflank-mailman (input) for mailman id 498721;
 Tue, 21 Feb 2023 10:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pUPvz-0003po-Se
 for xen-devel@lists.xenproject.org; Tue, 21 Feb 2023 10:31:43 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20623.outbound.protection.outlook.com
 [2a01:111:f400:7d00::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id edcaec45-b1d2-11ed-933d-83870f6b2ba8;
 Tue, 21 Feb 2023 11:31:42 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7558.eurprd04.prod.outlook.com (2603:10a6:20b:23c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Tue, 21 Feb
 2023 10:31:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6111.021; Tue, 21 Feb 2023
 10:31:40 +0000
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
X-Inumbo-ID: edcaec45-b1d2-11ed-933d-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ABTtAnAvxKTwaiEdd9MOZiETsPIUOzrbB614gAlTh9kLXcZnUmQ+en0FhWhSk45/ZtcK3X0p8/lxC98IkO3JLFzunGeu0u4Ol+3pD0jvA0vzx5NeuMPbXqNEkM7/+W47W+qrVinoKfUP+LA5+EhyirSQn7FLzajHcrNj9nMYvF9i1KjtlJH/EdXt8xRc7NjnSDQ0kxuI7Sb7QOPTw6sC4/SrDmno3MsoxMsoLlviutz6AQT5Ki52JskhvvGdD1PFmxFTItC5iHK/5FL919Z27e8ZuFz+PzEakfhqvqERovmlaryx0W8wH/FWV5ven+O1XKadsvjDi9XYYBPdmuq8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RBo8RCIw8/koyDM0t9V0MkNRvC5oq99mXXdBU9AHosc=;
 b=f1dy/saTMZ2yuk/UrwAvu7F0fzVnTzCpiBIvVSTW1a9iq61cCUZDt97lBangUqPBt5tR6BQWxoj9MVfjBqcFjEFh//KxlPAnEs9v2wgRmPInjft+4vllTyznWNZ3LFPjbP6+1nKi7mFc5QVE5EHr5KTnjuhF6y051By+AFUe/SB7IbIe93wf37K0Ys9Xhfpjjx/ZraP2oFbuyHIDLFKaQc35piVcogwEPbAPVElyA7qxoWqCxoSstb+aD9jlC1ZvpiLRS/v6D2t8EMIU3uo6rzu0ZaIe/9KL1FKRbNTpFdXsV18h4ZR1KlYR1nuD9FhxJHULVeXa85k8PGHnwJ3dDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBo8RCIw8/koyDM0t9V0MkNRvC5oq99mXXdBU9AHosc=;
 b=0CD5P+kKK4FUY398UynrCOB7AOwtqQYDDatqXZBc1FSI6J6COYB+bC/PLwDMhx7HaljUARqb7td6/2//KHhRvPqvBek4HaROFNyiC2YGBYyUejRku7lWATLMASiG7U0X26VMLqtuUMVXSRy+W8d0E8eQRXetDSinbQn5iD4HIQ6yPSPzujCZV+AO9BjTuyTDDPp2+R7lhvDVr2PhVtafNvXZttpYoibOT4/EceMPCWfSyquaP9ypgSMuSxuBr8dnrqa7hPjkgJx1d7PTsi55yJCSmt1HKcwUhzEsdrDohDSrEcyqjKRjDnuPqS/Ks/eN0RQmSJ5SCxCesOboRIHn2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <04891259-ffde-a6ff-32a1-e3a84a7278ca@suse.com>
Date: Tue, 21 Feb 2023 11:31:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen: Work around Clang-IAS macro expansion bug
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230217001914.762929-1-andrew.cooper3@citrix.com>
 <20230217122203.790737-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230217122203.790737-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0084.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::20) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d0318e-7140-4012-9438-08db13f6d0b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mhzoZs1l8Y1HxC/0nJE1hbFWKCWrxlA1qtVX+ycHetfhsesAad2gw7jZTc2DigYC7TTArDN3l6llVABbIi4TvQTWuH+htwqlos/GA2H4TXrgOA8pMk1sa/VIumNrvONG1q+64XkMZLwAnTEBvwxLyR2UoPNCf/xkc4LfMTehuj2nTRCUugvmH7gJ1m9NJM4XsUKZWt+UlQOQvK9jT/5RfXM6FYTdHoomTNjQ+zF58jPGP0soJOzZBAKFRA9GpklsQfLobxglIHdaRyUiTfAbJ5NGE5sWTmbsIf+NcbRzp/n4TWiAK/76rERlpEqtvDF4yO4ZbXGtUjQk0Sg2aWM/omSKGRiKKE7dzqgp6YO9HHqkrPRrIcz61v7IU3vrco5kLXWfelqdlzNp5SuVIl4xooBPFU+gG/jYmunt10g3X5Pd3vy5WjKW5QieE8lTHZs8pqrHIfLa7dr6IW58zNKQY2S4FLi4fm/earg+L41SnWY7aCTacVdEuoHyH/FxhGSYbInAofdJ0dd+prjzZvg+NrSAm4U/rAdfyZR4ZdmryNVNYrSwoS3OMYfsrXQA6vp+lOzPtlvLzPJPWL643Eht09pDFKX+vSvTsC1bZWVIEt3E5LP93FK0gykubeLZAuXXp9SjVuCx+QeRYAG2x6YARLT7w+G5CxY+oXyy9HP4Q9d+AccBw9K+JbgvpOI8o9MFnUKG3AND9KoJI4Q93pqHtpGsiIWNDG3oAiVqjUZH9rM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(39860400002)(346002)(396003)(376002)(451199018)(31686004)(31696002)(86362001)(36756003)(41300700001)(5660300002)(2906002)(8936002)(38100700002)(83380400001)(478600001)(66476007)(8676002)(66946007)(6916009)(66556008)(54906003)(966005)(6486002)(186003)(26005)(53546011)(2616005)(6506007)(316002)(4326008)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2lmMnUrRWZ5Q0w3YjhZZEdQeUhZc0JFSHNQeEU0bkMxdzh3cmR5TXlXRmtq?=
 =?utf-8?B?dElGcUxnbHNad3F4ZXlxMytSbjdzUzVWVjlURTgxdVo4UHNSZ1dYMEZ5TElO?=
 =?utf-8?B?OG9ONlAveFViRy9TZWlKVi9uQ25RT0FXQUtJTzE3UWh1YjNIU0FTTUpVbFJD?=
 =?utf-8?B?NVp1NmNVT29JNVNsbEc5S3dwSVY4UzdEcTB0WTVobXBUT1Z4Z2hyYjgvak05?=
 =?utf-8?B?Zm1SZzBMRFB0NjN5dGhLVnUySEdxdTdnV3dlLzFiZmFsWkFyWkg5OGhyUDNa?=
 =?utf-8?B?SEMrb1ErbS8yNXBlNzR2anhIVURBRmZKWFB0emVwbHpFeXU4dm9jZDMxN2Ix?=
 =?utf-8?B?ZWZ1bytUUGd1bnVsUStSUXJBUDFkOXByRW9YdXgwODhuSm5VbUZHTjNnSHcz?=
 =?utf-8?B?M0JQWklDREwzRE1SaGFJRk5laWMrWXB2Wlpuc2oyNTlPS3JMT1BsSEphNXZp?=
 =?utf-8?B?T1lqUWs5c3BreHN1OUg1Nm9qdURKZXNjQVJRNVBnUElKT3JSVEhhd2R1MlBh?=
 =?utf-8?B?QXk0enJaM3Z3YUxvWFlCc3N1emUzMWd5dnl5UGZUYlVIWTNLc1poY2ZMazJ0?=
 =?utf-8?B?TEZTTm9xTkFLNWRmcUg2bEdQMk45a3U3TDY2WHMyRXdEUmtHUU45YW1wUHdC?=
 =?utf-8?B?WXpsVk5UdGdMV1hCUlpXMEM2TFhLZ1dCNExocFM4S0EvWkNuRGtpZmxqK2ll?=
 =?utf-8?B?blgzUEJEeVFKNldqM2tYNWYyVnFMVDhTSkNxdy9VQWs2WEdyYmhPZ0szZ20y?=
 =?utf-8?B?SXQ3ODNpTG1RZW43Uk55NjBDRHRlaGMybWpjdWRNcmRBRFJ5T3hWbXBWMzRT?=
 =?utf-8?B?VjUzR0dXYlBNR3g1RHdzTGhiSDJXWE83WXpON3BkNWJzS2N4U2VhbFdDYlN6?=
 =?utf-8?B?NG9BZXcvQkIvVTFZSUQycGlMTDR6MmtHdnd3YWorelQyeHo5VTB6VFJDQTVk?=
 =?utf-8?B?eTVPb1N6ZHdvcVFxUmc0OUtJcVlGZDBaV2VQZGpCaFlrczB1VU9icVIyN2F2?=
 =?utf-8?B?VDlRWlFFV0xTbFJDbzIrYTJJNmkxMUhReTUyaEFRZVIxL1FwWE8rL3hXa1JJ?=
 =?utf-8?B?eGhLTU1RQ05TOGFOR0NqMXhvVURSS3NTa0dTZzNZclI4ZlY4TFpGeXU3Z1Bk?=
 =?utf-8?B?QVRLYVR6UGJsMjNZVjQ5blNkVVB6UjNDUnZIUFdYa1c2RW92eFI1aGdZeWFh?=
 =?utf-8?B?a293YU9EZDJxWDFJMXFNck5FejcvSlhKeDV4UkhWaGk5NC9DL2doQTErYU1J?=
 =?utf-8?B?SGduYmhFZFZrRndOWGVJT0RoRlZXdnZOaVlmWEVVUFlXRE4rbXhkQ0Nwd1h5?=
 =?utf-8?B?RzdwZjF3YzRmMzhoL2dUTXlWYk5leXVsem9CMXRpVHhza3NpVFphMDUzNzJM?=
 =?utf-8?B?TE9XM2NLVVRrV3dXdUd6aG51SHExNjAzc1R3ZjlpN1A4eUd3amQ2dW95ejIr?=
 =?utf-8?B?Ry9LdC9uemFkV0o2T3cxWC9PQ2pIOStEdXJmOWJzd2RibFBZNGJaWlhxUTVh?=
 =?utf-8?B?bGVhbTVOTFRKRDJnUWMvL3FVU3Z6V1loS3Z1ZWRHdTdBTkNOeHI0UjRYcHJI?=
 =?utf-8?B?dTRFL29RVm9UZEduU2d4MlYxQnVSWGRSbk1WdmdMcHEwbFkvWWpVS1ZueGd0?=
 =?utf-8?B?VzNhRXppYlQrUHdTQ0JFSHlXMTh4Q0Y2VW12MVB1Tmp3TmJJM3VSTjQ5WGU0?=
 =?utf-8?B?bkszdzBUVHpGa002aDYxbFhETG55UHZUcjdtenA2UG5YNUhDWGlkTUQ4b2Fh?=
 =?utf-8?B?UG5hZHdvaDM1cHRLdUp0N2crSXBIUlBnbGZhUEQrdHVSK0ZoWmFZTVlpL09s?=
 =?utf-8?B?Z25vODZncUtXZXM2QUxJRktYeHByL2xHWUIyRWw4b1pnQitMR0o2YzNXL0JM?=
 =?utf-8?B?Qk9Ndy9kMk01ckNJUWdlb0tVb2prWG4vN0R5WnNsa255clhBcHVjYktRSGJr?=
 =?utf-8?B?by91Uk0vN0tMM2FWZGs2cXE3d0FrQU0vZ29GZWFmWmVrcVkrRWRyb0F2TmVD?=
 =?utf-8?B?MXltKzUxOCtSRy9tTW9ScFVPUHg4MVhEaEVpVVZrd2pQVFgzOWgxWVErZWJZ?=
 =?utf-8?B?OFV6T2Q5VXJhQjZuZ1h2N21wYnJwaTBVUGd0UCt2ZFBCNzBwVHptUWd2ZDU0?=
 =?utf-8?Q?Oq6FKnmEKZOvBgwGNWLa1HnyE?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d0318e-7140-4012-9438-08db13f6d0b8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2023 10:31:39.9258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +5plRvFI5NGm10aH5bDT2/C94mjKDvNE3qFz7gwxjX/Eysgab5FXX6tvRnFsUaS8JjzU0fxE1VJi2R1hbXaQyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7558

On 17.02.2023 13:22, Andrew Cooper wrote:
> https://github.com/llvm/llvm-project/issues/60792
> 
> It turns out that Clang-IAS does not expand \@ uniquely in a translaition
> unit, and the XSA-426 change tickles this bug:
> 
>   <instantiation>:4:1: error: invalid symbol redefinition
>   .L1_fill_rsb_loop:
>   ^
>   make[3]: *** [Rules.mk:247: arch/x86/acpi/cpu_idle.o] Error 1
> 
> Extend DO_OVERWRITE_RSB with an optional parameter so C callers can mux %= in
> too, which Clang does seem to expand properly.
> 
> Fixes: 63305e5392ec ("x86/spec-ctrl: Mitigate Cross-Thread Return Address Predictions")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> 
> v1 (vs RFC):
>  * Rename \foo to \x, reorder WRT \@ to avoid needing \() too.
> 
> I originally tried a parameter named uniq but this found a different Clang-IAS
> bug:
> 
>   In file included from arch/x86/asm-macros.c:3:
>   ./arch/x86/include/asm/spec_ctrl_asm.h:139:5: error: \u used with no following hex digits; treating as '\' followed by identifier [-Werror,-Wunicode]
>   .L\@\uniq\()fill_rsb_loop:
>       ^
> 
> It appears that Clang is looking for unicode escapes before completing
> parameter substitution.  But the macro didn't originate from a context where a
> unicode escape was even applicable to begin with.
> 
> The consequence is that you can't use macro prameters beginning with a u.

How nice. If really needed, I guess we could use -Wno-unicode on the
assumption that we don't use anything that could legitimately trigger that
warning.

> --- a/xen/arch/x86/include/asm/spec_ctrl.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl.h
> @@ -83,7 +83,7 @@ static always_inline void spec_ctrl_new_guest_context(void)
>      wrmsrl(MSR_PRED_CMD, PRED_CMD_IBPB);
>  
>      /* (ab)use alternative_input() to specify clobbers. */
> -    alternative_input("", "DO_OVERWRITE_RSB", X86_BUG_IBPB_NO_RET,
> +    alternative_input("", "DO_OVERWRITE_RSB x=%=", X86_BUG_IBPB_NO_RET,
>                        : "rax", "rcx");
>  }
>  
> @@ -172,7 +172,7 @@ static always_inline void spec_ctrl_enter_idle(struct cpu_info *info)
>       *
>       * (ab)use alternative_input() to specify clobbers.
>       */
> -    alternative_input("", "DO_OVERWRITE_RSB", X86_FEATURE_SC_RSB_IDLE,
> +    alternative_input("", "DO_OVERWRITE_RSB x=%=", X86_FEATURE_SC_RSB_IDLE,
>                        : "rax", "rcx");
>  }

Since inside the macro you retain the uses of \@, I'd find it desirable
to keep gcc-generated code tidy by omitting the extra argument there.
This could be done by introducing another C macro along the lines of:

#ifdef __clang__
#define CLANG_UNIQUE(name) " " #name "=%="
#else
#define CLANG_UNIQUE(name)
#endif

Besides the less confusing label names this would also have the benefit
of providing a link at the use sites to what the issue is that is being
worked around. Plus, once (if ever) fixed in Clang, we could then adjust
the condition to just the affected versions.

> --- a/xen/arch/x86/include/asm/spec_ctrl_asm.h
> +++ b/xen/arch/x86/include/asm/spec_ctrl_asm.h
> @@ -117,11 +117,15 @@
>  .L\@_done:
>  .endm
>  
> -.macro DO_OVERWRITE_RSB tmp=rax
> +.macro DO_OVERWRITE_RSB tmp=rax x=

The "=" in "x=" isn't needed, is it? It looks a little confusing to me,
raising the question "Why is this there?" Furthermore I think it would
be good practice if macro parameters were comma-separated. I realize we
don't have this anyway near consistent right now, but still.

>  /*
>   * Requires nothing
>   * Clobbers \tmp (%rax by default), %rcx
>   *
> + * x= is an optional parameter to work around
> + * https://github.com/llvm/llvm-project/issues/60792 where Clang-IAS doesn't
> + * expand \@ uniquely, and is intended for muxing %= in too.

With the above suggestion I'd see this comment move to next to that
helper macro, with a link to there left here.

Just to clarify: I'm not going to insist on any of the suggested
adjustments, but personally I think they would be beneficial. If you
are pretty certain the other way around, please let me know, and I'll
consider ack-ing (largely) as-is.

Jan

