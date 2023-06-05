Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FEC172261D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Jun 2023 14:41:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543706.848898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q69V8-0006Lt-2d; Mon, 05 Jun 2023 12:39:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543706.848898; Mon, 05 Jun 2023 12:39:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q69V7-0006JY-VX; Mon, 05 Jun 2023 12:39:57 +0000
Received: by outflank-mailman (input) for mailman id 543706;
 Mon, 05 Jun 2023 12:39:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+s6H=BZ=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1q69V7-0006JS-1B
 for xen-devel@lists.xenproject.org; Mon, 05 Jun 2023 12:39:57 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20612.outbound.protection.outlook.com
 [2a01:111:f400:7d00::612])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 11abff37-039e-11ee-8611-37d641c3527e;
 Mon, 05 Jun 2023 14:39:53 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9551.eurprd04.prod.outlook.com (2603:10a6:20b:4fa::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Mon, 5 Jun
 2023 12:39:50 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e442:306f:7711:e24c%5]) with mapi id 15.20.6455.030; Mon, 5 Jun 2023
 12:39:50 +0000
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
X-Inumbo-ID: 11abff37-039e-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Krm4NtJSmPVFD5GMlVIMjSLHur+QeNrupijNaC8/T7ztWA3nIY/WFZqOCdnduoVngjSztpaUVfm0WpospzRpiBrZoR0oRfNFRUfcMbo9TsRTtA7DCutmhREw7lVOUjQCDmHI9hg661wpqcZkX3FllTmMIzIFRtsonzJHg3Frs69vOC5IKIriDblwjojDwW95ZP0XJb65o1SGQnDUsoclaMJjSCUb/SNDQpzM2BTEK3qBAlTGv4Ui7HqyhomrVQlAQomTvNJ4IveiVsaM/4e1y0JCA4UJLnX5l0ctULR6qV4pUpEfL5sezy5OSvpvV2mmGYwCH7FCNy0KylEZ8iT8zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PDlS5i9qDdxyBoeXLh/A+o5m39neOrp7/yI508+YIg0=;
 b=WlSsbRzkTSdzkWd4BRUnETpV6w5gEAUOWa94nD615rIPiKMMUQAKB5Mffd0usbbJrEXVcBNToY6tVrG0QdT3+1cUGV8ysbIOK1hnUBAd3OwyoAzMau1m/CUiYmzFL106Td4hCwkpwsUohfto2Wy7cR+FWNgYQIHpv9erTk+VQwtlTgeZxJpmLtSyCx9IbqVkO/0Vvg0xLRaCG/OnHnR8hxYghDixmmnzkVQnzSnh83BWqX6GpgO5+2noowFLOb/tyYuL6QRzDs7nVrFEsE811eBpBm/FQzUPQshxlvIXlRdvHP068pOlsyMEjKVKHdGIWqHJ6lLgIWKCKiai1n4g/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PDlS5i9qDdxyBoeXLh/A+o5m39neOrp7/yI508+YIg0=;
 b=ykTjmei+pEgPrbTr05q/YPMI865ErlIYfRa4i38uTymfqtqNU/bDQG9JhfuaE43lD4exRkiARzPOx3rxOit2BUhwafbFfz/QMTjiv6FN2FjAoLvw1/kXYi4mjJHjGnBDYMhemNw/wmE7oVaW14p7TPNpm2qRcBcI2v1EPNz0bU/HyVxv1F1DNMMRUhzmASLOu0V0oXFo7R0suAgczPZEyKcIq6Jqmm342GwBF5qgDI8/jmkWO2Muk/5lSyKqJPLfOICYOArLCqbtZSGDjFWnDTsUZzHDth4JxCOmMW97ODqYx2O2HGdtq8n7ECBOAUnGNEXBtAisTEHNqLs7FMAnyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4f293ca1-9eca-3769-05c3-0cdc39a6fc69@suse.com>
Date: Mon, 5 Jun 2023 14:39:49 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: Xen reliance on non-standard GCC features
Content-Language: en-US
To: Roberto Bagnara <roberto.bagnara@bugseng.com>
Cc: Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1cd359e7-5245-a621-3be2-9323ba5b327b@bugseng.com>
 <def81409-a328-7b13-8dc9-a791d8328d39@citrix.com>
 <4dd8c759-8257-740a-1fd4-d61376350d6e@bugseng.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4dd8c759-8257-740a-1fd4-d61376350d6e@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9551:EE_
X-MS-Office365-Filtering-Correlation-Id: 06b39551-9efb-42b0-53fd-08db65c1f44f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2fT7K0gd5DjRTiJdaudZpK6YJKnDxRfvmU+J7jmnX33ZWUZtGa/1UPS3SyzEaZjbukRqM6vJjcGt+ecQc/HVqSq5UgyvtZBIyUrpJ9eAkC4MXNvrNifeOCjTafZW+sLAQFpdBsso5wX7Yy1FgFJruC08LP5Myqh8rpK0UAh0SFvUlqT0NmB2zpbRukqLqQ3DZSs9Ua21L3QupN889dfUSHvRj5/4NP/CFvLx93TLnLXrTJNR8J9RPsKoj9kT2VoV0KvUT56vFEjAF6bHlctPkr62YHAT78dBXLzenBfjrTMj3nZtKzVElAeNtbkcBUxAtc/QV/XfSQqPVo/N25t4LxlKzoqxHBHgwON6WFOxoLRM3AFIgn7494OWctrP16jSQxa0OGj4TJ4L9gp69TTW09Tn2Ql+UinXHpBl15P9SqeaQ8U6XdvnqokXt7907D8aWQHx1KQp5QUXHU3Sz/L78c/kdbgtk0LZBgsVnnK3yFEQSL5nLySwFL7hW/NiFAicpQlkXT1DmcxcZz/I0F4+0f1o+gNokpYZzziTvnctOqbBOM3B8n5hp8rZDwMAbSzYdjt3H4Uhmj3kR67YfPe//aax4QLgBSarSiSPSjuzGl+KwjsB7gnVlasBvl0LbNxxfzCnhrYCJEdX3qSxVrAxxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(396003)(39860400002)(136003)(451199021)(6486002)(2906002)(66476007)(66946007)(66556008)(8676002)(54906003)(36756003)(38100700002)(8936002)(5660300002)(86362001)(31696002)(41300700001)(4326008)(316002)(6916009)(478600001)(2616005)(53546011)(6512007)(6506007)(26005)(31686004)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjNPOVR0aXNOWU5McmxaM0VOQjV5Q091b09Cd0ZKaG52UE5IU0ovYnZCZ05p?=
 =?utf-8?B?dDFsR3QxNzNQcjU5UzFlTEhSR2llNXZib01hSzlLOHFvRzVFUUlnQk1iM3RC?=
 =?utf-8?B?VEtISGFhSDVYekhobGcrYzRUNEZPeitNVk5JSUNuYk8xN2FaOVdieHI1MHls?=
 =?utf-8?B?bkRTK01vTnZ6MFZobi9uRHRsYW9yejFyd04xdkN6cVR0cHNhN2s2L0lpZHZj?=
 =?utf-8?B?MTB2a0IvN0hyZmJrOEJhbXV2OTR5ZXFRaXUzbHIxVU1hWitiay94Zk5HM3Nl?=
 =?utf-8?B?VnJuaTl5bStVSTk5SFJPYWo1Tkk3cWJCeGxLL1l5VHVpNnFzOE5pVHRhemZn?=
 =?utf-8?B?djRla04rejF0WE9RdzgvejJQeEN5SU1NeUF4NnF5THRYMnF1Q1U0enNvMWRW?=
 =?utf-8?B?TVhXMDZrOHZhOWd3bE1TVEpsZ2loYXMvYlROcGhNTkRyMFRYa0F6S2pBU1pn?=
 =?utf-8?B?TXNOQjJLdHFMeXU0QXdSNnBmLzFEbFVLKzd2UW55WCtmRVB5SnhHRnVPeWpU?=
 =?utf-8?B?SzhmUkhwYy9IZiszbmVhd2N5MytheEhkVXlIR1FRS3FHc3BiRTZFcG9hbksz?=
 =?utf-8?B?d2lmSDBENjFQS0JPYUV0MW1RODRZMmc5TkNqaXhKWkJkN0tOMWM2NC9vSVJs?=
 =?utf-8?B?dGg1dmtRVU4wVXpuZVRKcXJoTVRyWndZNkdKV29valo3eGtLQ1lhVWgyZXRP?=
 =?utf-8?B?TEJPTkZXZmpJUHUxVTQwYTc3blhyaXFPKzh2dUx3SGtVV0lPaW5TMmJjNzlp?=
 =?utf-8?B?V1pGRzQzNGIycmFkWCtZWEFvK3lQUXl6Nlk5NklXZ2VZRmNWNUhYd3VESGlv?=
 =?utf-8?B?WmhLTjNjTDhxeEdCbDYxam96bURCbGFtZ3RGeHIwSjR1NUE3a3JoOENacGRx?=
 =?utf-8?B?UTE2WnVQYmU4MEpuS3Q1SStHMW5xWkZtVklHUmRMMStseU1GLzAvcEtza29E?=
 =?utf-8?B?N2NmZENmdllaNmFNWFN3ZjRhYzdZelE1ZkF1R3YzOENqV1l3alNZbCs4NmJT?=
 =?utf-8?B?dGtpalY0bVJ6d2IySkNVTm5hRS9jLzNnL3RTaVp3VS9HTmY1V3Bja21kN3I0?=
 =?utf-8?B?ZHF2VG9IUk1KdXFpSXZ2bGcvOGo3QzVQbXZ4YXFNcnVNNlVmcWFPbzhrYWZM?=
 =?utf-8?B?S0VBRjdEbmlnRml3NDE3UVkvUUJKU25WeGdnbXZyamhpdk10aVlPVmZJV2c4?=
 =?utf-8?B?NnRNR25jZ0pzSmRGMm02bk9NRGZyV2hac0Z6aE1EOTY1Mk8xVWFTblovcDBn?=
 =?utf-8?B?ZTEyblpNVXA3L3dJTml0Z0JhaGRwRlJRRnBOQnp1ZnBIR2pzUmJXYWNERlRp?=
 =?utf-8?B?Z1RnZnFWUGtzN1ZpZS9uS1dDb2NzcVFUNnZSYmg2OUsxaGFoeEU1N3VCQTBC?=
 =?utf-8?B?dit2Vjg0YmVmR21ybWVmYXFLQzVXYmpORXJ3SWpVa3N6NDErc3M3RmJ4Wngx?=
 =?utf-8?B?cWQyTWxvS1l4L0xuQndwa2RubS9LNWRYeHZodVNBNW9kZkpxSWdlUjVsN01l?=
 =?utf-8?B?WE9Qb2RmeS9wZ2o1aDJLMC90R2N6dnFMRUtvVGU2MzNURnY0a3pzTnFpcmw1?=
 =?utf-8?B?TnJMK1ZwNFY1MFcrRHlNN2VnQ1JqK0NNUzdPQWV4RVFxTGpSRXE1K21sT2J0?=
 =?utf-8?B?a1NzM3QxOFI4L2pSeU1JajA1SSt1YjIzUG5UV0ZoKzlqQlBhbCtuNUlhZkVQ?=
 =?utf-8?B?QTNiODkxaUV0bTVycDJIOWlVTzRBSVRFdFZFSXJZVDBFMmozR1FSTUVHY2dH?=
 =?utf-8?B?VXZmaHdTU3BvYjlWMXg2bzFLanNJa0VHY2FTUXVvUmJUVlJKUkxqaW9YYnVl?=
 =?utf-8?B?YS9wWjdPOFluMGU0L3FtV05GMVZOK3M3TStDRXc5eG1Ec2dpL0piQWcwOU5o?=
 =?utf-8?B?OERjQXFsVDlBS2pMaHl1SlJjRFN6RHE3cHF3MkRIN0xPd2w4dW10REpVU1J1?=
 =?utf-8?B?b2VBUFBOVENmTXBrOHY2M2FVYS9OcjJUUDZnTmR6ODEzTldLRTZxMnVISkRs?=
 =?utf-8?B?MzU0TjBaa2ZzT25GajJqWWtmVEhkUWpOd1hVTWNhbWtGZVdqcTRBRXlDd0Vl?=
 =?utf-8?B?Q0JRUlJCcHZQckJlanc1OEtiVDZ0NU1zOWZMK1FRS1lrTDB4Uk5HcFRha0hC?=
 =?utf-8?Q?yjUIN9qxtyyLIlcjv6+d4T64l?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 06b39551-9efb-42b0-53fd-08db65c1f44f
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2023 12:39:50.6225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRGsZZ9yM0gLYgfOvkmOpA1Lp4Uvgh2fuqeXD3GJRMy7HLNOVdnNhAfXOFU1L1U82h5ZKjTk/+WjaqRN3kitBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9551

On 05.06.2023 14:15, Roberto Bagnara wrote:
> On 05/06/23 10:58, Andrew Cooper wrote:
>> On 05/06/2023 6:28 am, Roberto Bagnara wrote:
>>> U10) \m escape sequence.
>>>       Is this an undocumented GCC extension or just a typo?
>>
>> Where are you seeing this?
>>
>> The only examples I see are in asm macros, and they're all parameter
>> substitutions.
>>
>> This includes the one in x86's bug.h where it's a parameter substitution
>> into an .ascii string literal, not an escaped special character in the
>> literal.
> 
> The point is that escape sequences must be considered for tokenization,
> which happens in translation phase 3, as they are relevant for phase 4,
> which is where preprocessing directives are processed and removed.

The C99 text mentions escape sequences the first time in phase 5, which
means string literals inside preprocessor conditionals which evaluated
to false were already removed. For tokenization all that should matter
is escaped double quotes (when determining the end of a string literal),
escaped single quotes (when processing character constants), and
escaped backslashes.

> See C99 Section "5.1.1.2 Translation phases" for the definition of the
> phases.  So \m is non-compliant even in areas guarded by
> 
> #if defined(__ASSEMBLY__)
> 
> and a conforming compiler should flag it.  On this, see footnote 65 to 6.4.4.4p8,
> where the 'm' in '\m' is one of "any other character":
> 
>    65) The semantics of these characters were discussed in 5.2.2.
>        If any other character follows a backslash, the result is not a token
>        and a diagnostic is required. See ‘‘future language directions’’ (6.11.4).
> 
> Kind regards,
> 
>     Roberto
> 
> P.S. Note on passing that the comments on the preprocessing directives
>       are a bit misleading due to the use of the exclamation mark
>       (IMHO "defined(__ASSEMBLY__)" would be better than "!__ASSEMBLY__"):
> 
> #ifndef __ASSEMBLY__
> 
> ...
> 
> #else  /* !__ASSEMBLY__ */
> 
> ...
> 
> #endif /* !__ASSEMBLY__ */

As long as these comments are unambiguous, I for one strictly prefer
the shorter form.

Jan

