Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E15D706559
	for <lists+xen-devel@lfdr.de>; Wed, 17 May 2023 12:35:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.535851.833907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzEUg-0003D4-4c; Wed, 17 May 2023 10:34:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 535851.833907; Wed, 17 May 2023 10:34:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pzEUg-0003Ba-0C; Wed, 17 May 2023 10:34:54 +0000
Received: by outflank-mailman (input) for mailman id 535851;
 Wed, 17 May 2023 10:34:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfpx=BG=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pzEUe-0003A7-TK
 for xen-devel@lists.xenproject.org; Wed, 17 May 2023 10:34:53 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20604.outbound.protection.outlook.com
 [2a01:111:f400:fe16::604])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7381ab00-f49e-11ed-8611-37d641c3527e;
 Wed, 17 May 2023 12:34:50 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS5PR04MB9874.eurprd04.prod.outlook.com (2603:10a6:20b:673::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.32; Wed, 17 May
 2023 10:34:47 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 10:34:47 +0000
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
X-Inumbo-ID: 7381ab00-f49e-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HFh32YAmLxfirtn8W//w2p7Vy4iIS6ZYKf8sUnVL01dGIu3nRYp/ZD3frZtXTWSEVg840Dm8lc+Fja1kJttRVneGZej20aQQFcDGamtrvfxcItjR67jVWr+9zH3fewpJ8v0L1tfOCV2dYCfzQwEF/UNtv6WvM2HhEo4JDXMS+w5U16bFnWY2E44UYFlUJUfXqt7QH23nlwNXjd+sJVGVO2Ch9ZRmQIDF2rcNOCIodsmG9vfUbZ8JKZmgSAdhIHR+Ixh58BMI1HVBxIxa+ZMOO8OQnuNtu573MGw9iiK3Gt0qOmdOWQg4bMRuDdZTTszX+pazYgKBAzM/5vwyWbc71w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jSQvPMopOU481hkpJmJeQLLvSa5HZmU1KdzELPpK9GE=;
 b=UNswkMJV6di5YSuJIHgetQiTE02gs9S3l9N0vClim/yTSx/aEtBtGRbuzFCEvT1vhXBHkLOxTdotNR/U3xohlWxCHfudicoZagMlj4txtt+WCQyKqmuUt4ymUiw1FZeXCy1bEhw975jCb8h50SRVjcjCwGaCM4vEA04zcdGEejioQL5DALseMPNxsH4HFP1L7o7hqcKnMcWC3TvxVtQGkTRH6+D5S9tUS8Z8v9K3JvNK360lfJYKn/N8NvUYLupzla6hmecQ9zEgeIYAVuarf+zguFbxP2rxhCKWUhvOYer6KhnF/d+O7ipS12/fHtwwILEXIbG6y2wqtnKyVz8T0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jSQvPMopOU481hkpJmJeQLLvSa5HZmU1KdzELPpK9GE=;
 b=KY6CRN65soGfJNP4sy806+UffG+hKWFM5kYCZb1QyY6c5KjxPmZmsZYuLgChbZjtM/dM3XEy0L7F1I26aKnPhDll4GHe/boKXQxYJLI72Oc3e+8AlzGY1FUmjOzCr1zKWgBgVsxZ+KUfQ7EEHgs+yTwvqttr55S9chdDGvPwYMjKtIWBknyTivOCS3VJbLN8l8CXqq7uIh5XnEezJ8t/fhmK2S8RmbduTX/NZzrfi3c2rO9QjEaj4FkwruIMwnu63gRg8KsDssS1ugugKC8nkLCZxnCl8aCKyTMJnliiIQcF4R1sKIdxYbu4+ZSPg8ehv/o5OImHsMrIBOgcCsQ0NQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <796b6671-c699-1bbf-b3a7-59c8fceeb625@suse.com>
Date: Wed, 17 May 2023 12:34:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH RFC] xen: Enable -Wwrite-strings
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Julien Grall <julien@xen.org>, Volodymyr Babchuk
 <Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230516203428.1441365-1-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20230516203428.1441365-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS5PR04MB9874:EE_
X-MS-Office365-Filtering-Correlation-Id: da901812-507d-4aaa-cde4-08db56c25624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UZRNPUaNT8nOPPxYNK/ByUKuw/xW8zQRlawq/ITRrRYLP8y0NGfI713DdijGOUR9WekZDEUylsJTFYL6euiwWZxplRJxYR9i9kkWfYP/CUICEHdwkb73aa8yz4N9NGK9+R0b6CnOwH9t9oFTSLbWBv3OmN1kHVEBiLTYnQQZ09daiojYsebpsVEtRv4VcFfp0NPNvCKksej/gPrLeFJiVi5tkeYaI+Z3q4P0xrPOOmslI4LG4IcR9dtsaFSkC/LNu2c1rn9aV3hJUZw1o6jCFoMMo+KfWHv7FTg4eMqeerTNLX7MfQW+9ryYcejWvWkpR/fSJFjhrLMei5uvkwRhW1+l5FO7sENTtZGq6jOWeswWu44O+d9kA+cM+NxsdvbqQiGjXx/hupmZDGSz4xwnKgyb1dElDUx1hJ+jcpY31qJ7exfBp0M7JUob219a5jd9rdP4vfA2omfZzUHzq8KOob+VdLQp5/8yz3MrsyYQE9AaObkecWPNeH5xZqtdSoy7kEZxokoT5F5/xGTDPPM0VQqO8Nk+5v+GSTrnZ+naaaD+jDIGIrl6Milfe1oU/G22BT3k/UVnUpdftn/PsPZhN3WFjbWR+jHyjoEiHkLbLaqUpNlEk+LRBcNfrIeEQCBbBjelP/vwVrvMy1ejcFN6mA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(366004)(396003)(136003)(376002)(346002)(451199021)(31696002)(36756003)(86362001)(54906003)(316002)(66476007)(66556008)(6916009)(478600001)(66946007)(4326008)(8936002)(5660300002)(2906002)(38100700002)(8676002)(53546011)(186003)(26005)(2616005)(6506007)(41300700001)(6512007)(83380400001)(6486002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K2tjOSt4SlI1Y1dpKy9hQ0hHY2F6TzN2RE40M0lNdXJwbndmMkpUOWd4eHdr?=
 =?utf-8?B?cXNaL3BBaUtjZWJQRXdCSElFMUVaRHJrSXFWTEVVaDY0cXdLUUY4OEZ6d24y?=
 =?utf-8?B?Q0NuTTA5TXh1aDEwY3JBNUUvTFVrTFRrOUlJTytxOGV1enZNU0g3aXJzUmMy?=
 =?utf-8?B?UTczaEFSTzlMT1ZPdlJRUjhaYUtPeldVRmplTmNMOHRNK2lGeHRXQ0RBeExR?=
 =?utf-8?B?SEFUY092UGxMT1JVVjk0d2ZabGhDSU1jdHQ0aFcxVFptc1lwamZVam9la2da?=
 =?utf-8?B?NCt3Mjh6a3hxVVdUMnZuYUVzQUNEYTdBNTVOWElNU3hGZUtlOHg2bEdob3Jv?=
 =?utf-8?B?MUIzd3M1d25oM0p2UFBuajdoYytOWWVreVpKV0hKT3NQQjZEZ2s0S1JLVHVw?=
 =?utf-8?B?dGZKQ3dwbmlnRlBNWFo0MGdFYlFRUWt1RGV0RFptM3JFUUV1SFpod1JreHI4?=
 =?utf-8?B?dFVDVnZDMldWUXhId2JmQytPU2dRRnhCZ2JVcm9Za1JHTUg1UGpvd3lSV25W?=
 =?utf-8?B?TVF3UzRBQTRKMkhNMEZwWDY3Wms1VmNvTkFRdXJYUEUyMkR4cTY3QmZMVURC?=
 =?utf-8?B?REtxYzN1MnNkVkNSZEpaRzNZRWVTV2FWSmsrYlVGUjZTSkVlb2tzOFNzQisr?=
 =?utf-8?B?S3R1bFc1RjhyYllvU05HN1ZibDllTk1NU2FXRTgwKzMzSDgzRlhIUVNCZW9u?=
 =?utf-8?B?NjltMjJPbldWc2V1S0paaTUwNGhmdHlIeGNTZnZLRlRXSXBnanNWRklFOEpq?=
 =?utf-8?B?N0ZQaVNMWkdQODZOOVFoK2N0UWpUOWtXRitFVHExQ25INFIzL3NsTXR6RHZP?=
 =?utf-8?B?NFFEeWhPbFdIVUFxN0w0cUZ4eUw1eUlHK08vZ0Vid3FTOGtwZm9lZHdVQkRU?=
 =?utf-8?B?Z2s2Nk5BVG9WcU5pWlkrM0ltQ1p2bFpBYzBPUC9tZVFsbzJlOU9sbGNhWXZo?=
 =?utf-8?B?VGpYd3V1ZXQwKytkOElGV2E2cE82clBLZ3pSQk52Qk4wMEsxYms2ZktycmNw?=
 =?utf-8?B?YTlBakgxQzZ6L3htOEw2bEllQWc3bjR1Lzk5QlAzVkhwaWc1bWdRWUJSQzF4?=
 =?utf-8?B?TmJFcXkra1JYRDcyckwvNFdQNHdQcVJwQTFLaG9vWU5oYnFFK3NhNkM0UGlO?=
 =?utf-8?B?bzAwZVBTcDZtSjhsM2lIZ3A5WHJrbnZ5SHJjSVJEQ2dIZzRIVFZuZmdLdHBT?=
 =?utf-8?B?Vm4wQUtLTmt1dE1QUUpDek4vSVlNSER3cGJ6eVpFZUtVTjdaN00rVm5nZjc0?=
 =?utf-8?B?TXJRczBPT0RHR05YN21KdWk3SjRacWdQUFdYbkIvRzhYdHNtVmdHY2hPdndQ?=
 =?utf-8?B?LzZNQ3Q5Nld6bkEvb0UrcS9CTFJNd1RhSk9OM3NrZ3hiNlFQTG1TTTVhV3Jm?=
 =?utf-8?B?K2sra1pJTVNHQjAxeFZaT3lPanpzUVpaT203RzcxYytvOStENTllYmxxVWdI?=
 =?utf-8?B?TmlBZnZPbkg1WEFYQ3oxREJKZEMwUGRyNHh1YVFVWHB2SmZxVno2YmM0UXhG?=
 =?utf-8?B?NURWc1dTaDBpbGMrL2FZVlQrOGt5bkRCRm1ISVFheUFmNCtETlpaV2hXTG1u?=
 =?utf-8?B?NjNZQ3VQT1FoaFIyQW1pdUc4b05WOGwvalFIZ2VPRy9OWFZ2QStHejRpM2NF?=
 =?utf-8?B?VWtXdktPS3pEb2dwVlY0b2k5YjdnQ2hxSktCKy9BYzVyd29hWXJRVmgwQVZh?=
 =?utf-8?B?Q0tmZkgzR2htN09OVnFEOUxoc3NYakZwVXFkeG1JdXYybXpMYjcyR2lDSXg3?=
 =?utf-8?B?OW45ZFN2SW1sVjk3aUR1WGxYbDZuY2RBTG1UQzlIbkE4aVNoaTl5bHdsbjBi?=
 =?utf-8?B?MU43eHA4bkk3SkhIVHpEOWFYZ2NkWXpReGFVQTN3WU14RmpVSi9LdFdkU0JD?=
 =?utf-8?B?ZzFwYWE3TjcrN3JrcHRiNGp5ZXk4ZFhab01JOTdjcEY4K3YrNXBJRk9rKzdR?=
 =?utf-8?B?enZGbE5kMy81SlVEemxSb2xZbkFhOGhHOHdiaVFHOGZvM2s0WDFlRXpNMWxB?=
 =?utf-8?B?YTA4Ti9GU1dXeU9ESFZtdlBaTlhTZTNUcnlnSU8xbkpIYVgxY2I2NVVyR2lh?=
 =?utf-8?B?ZWVLYjhIT0owR2E0RkxjdnVSVGFGb2Z3TmNzNmp3R2NTZjBNOXY1bVlYc1l4?=
 =?utf-8?Q?/Hlve76RPvnfJOjY2SuoWdtGM?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da901812-507d-4aaa-cde4-08db56c25624
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 10:34:47.3314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zBRvdg6BlTAqK9JXA6ddq+VznXPvr3nAWWa4imicTtHa/IFJUF4ETAlWFzUz8x9+QH/Je8INZj3zYNTOKqRPeQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5PR04MB9874

On 16.05.2023 22:34, Andrew Cooper wrote:
> Following on from the MISRA discussions.
> 
> On x86, most are trivial.  The two slightly suspect cases are __hvm_copy()
> where constness is dependent on flags,

But do we ever pass string literals into there? I certainly would
like to avoid the explicit casts to get rid of the const there.

> and kextra in __start_xen() which only
> compiles because of laundering the pointer through strstr().

The sole string literal there looks to be the empty string in
cmdline_cook(), which could be easily replaced, I think:

static char * __init cmdline_cook(char *p, const char *loader_name)
{
    static char __initdata empty[] = "";

    p = p ? : empty;

Yet of course only if we were unhappy with the strstr() side effect.

> The one case which I can't figure out how to fix is EFI:
> 
>   In file included from arch/x86/efi/boot.c:700:
>   arch/x86/efi/efi-boot.h: In function ‘efi_arch_handle_cmdline’:
>   arch/x86/efi/efi-boot.h:327:16: error: assignment discards ‘const’ qualifier from pointer target type [-Werror=discarded-qualifiers]
>     327 |         name.s = "xen";
>         |                ^
>   cc1: all warnings being treated as errors
> 
> Why do we have something that looks like this ?
> 
>   union string {
>       CHAR16 *w;
>       char *s;
>       const char *cs;
>   };

Because that was the least clutter (at respective use sites) that I
could think of at the time. Looks like you could simply assign to
name.cs, now that we have that field (iirc it wasn't there originally).
Of course that's then only papering over the issue.

> --- a/xen/include/acpi/actypes.h
> +++ b/xen/include/acpi/actypes.h
> @@ -281,7 +281,7 @@ typedef acpi_native_uint acpi_size;
>   */
>  typedef u32 acpi_status;	/* All ACPI Exceptions */
>  typedef u32 acpi_name;		/* 4-byte ACPI name */
> -typedef char *acpi_string;	/* Null terminated ASCII string */
> +typedef const char *acpi_string;	/* Null terminated ASCII string */
>  typedef void *acpi_handle;	/* Actually a ptr to a NS Node */

For all present uses that we have this change looks okay, but changing
this header leaves me a little uneasy. At the same time I have no
better suggestion.

Jan

