Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A84B7A4AF8
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 16:05:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.604087.941299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiEry-0007bB-8t; Mon, 18 Sep 2023 14:04:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 604087.941299; Mon, 18 Sep 2023 14:04:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiEry-0007Yk-5P; Mon, 18 Sep 2023 14:04:58 +0000
Received: by outflank-mailman (input) for mailman id 604087;
 Mon, 18 Sep 2023 14:04:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiErw-0007Yc-Pg
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 14:04:56 +0000
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on20621.outbound.protection.outlook.com
 [2a01:111:f400:fe1a::621])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58268658-562c-11ee-8788-cb3800f73035;
 Mon, 18 Sep 2023 16:04:55 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by AM8PR04MB7203.eurprd04.prod.outlook.com (2603:10a6:20b:1d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 14:04:53 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 14:04:53 +0000
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
X-Inumbo-ID: 58268658-562c-11ee-8788-cb3800f73035
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bxuu+r6qV/gwgqEpu3p01uv1jKh9srH1zr5CtWAP5cKx8sW7QFjrhmdPYGPoa+ZHtLiX+75VNDCQcSAz97Chi9fWi4sC7pnXT+ZgJ1PrLWI4A8ncuJ59CATmywIK9cninWj1Sq0GZ5vEbg5whxZMo3xBHXY10T6dOnM2HJQoIZ3vtmfaSrWdauxvE8rKUCxh9TM41f4bJLzmNT/oERo3KayEoezckeNLEJUY5hr/mE69IU9ZKr1kdWL9sqWKS5NL+Kz5fzCzYpEu6gCrpgwwFn0EQTn3U3k4TIhVL4+WyN45qqFRaio/hl5uTNUHLOI1qe0q1ZtJ0kSM1jebatJRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iqs/8aBOJK1uVJy9b1CHkFsfApTouh8hfkPeFn+LrMI=;
 b=UFuP+iyjbgWfvV7TgcILh8W7Bgdfty5NX9cJj6sJ/neaLpE9URAQGAOBn5aP/Smm8xsirwlpWGe2+m8hBR1+7FI+ORgIH/lDYN4Fyj6LmCX4MrpV08WLUo6XLRBqPmvssJA2bGzIhCJDY7P6rbad/6b9ZIICCY+fHfsQTvEvhTLmn/CsMDSTrtPXy1ZPz5cHxvGL4fqweg2mRL+EdOht5iUSZHuPdfpSW97kyUh5Fbm4cTc34t2VFXKgC9QQ7kMEvJOKqMkNVTKy7G01Mp2mo5cXzPUgiUFqNTO8Jdr8+Dbr7Mk4328odjfgsYQIRVOHB4LFqMZC7Eykr1ASlIER3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iqs/8aBOJK1uVJy9b1CHkFsfApTouh8hfkPeFn+LrMI=;
 b=vYKoJ2iQ/u5x3CohCpdqiE1wEgXZ4/vP0C/4uqKhL6/Z0m1rCYZyspkPzTeXoTUkpDpJCN/wbB58XSsjnG2E3cZAcHJGzjQeyRe2gyjyrLJi46v4M1OQ0X2FGzgZhijnm0lXnGIHZurVE+VcCfdYFec52Y+8slEk6MFMZymUBHwApZdlLtKziZWVtbxE6NDCuFw2hdO62ilIs49K2FFpo8aH3Kcm+lOwRc9Fwv6dx5HDKGe0dU3xcf2bIU23lDdUYDBXQ/0Xcxh+XtjmPKooouJvEzhzOsCuzKzNSWkFP99B3k623pckhlBxkF9e8v+OvyyxTLh266Dk+3s0+Ds79g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a89d0ef6-7f89-1ad0-b1fd-2b74eb9aacc6@suse.com>
Date: Mon, 18 Sep 2023 16:04:50 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 8/9] x86/amd: Introduce is_zen{1,2}_uarch() predicates
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230915150038.602577-1-andrew.cooper3@citrix.com>
 <20230915150038.602577-9-andrew.cooper3@citrix.com>
 <e28bbdf1-31e7-9500-ca5a-00cf15ceb33d@suse.com>
 <9ceb62f4-e625-3fa9-6924-f22522de47a0@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <9ceb62f4-e625-3fa9-6924-f22522de47a0@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0060.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::20) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|AM8PR04MB7203:EE_
X-MS-Office365-Filtering-Correlation-Id: 037c08cf-56f2-41f7-5397-08dbb8503b14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TQb1H9wC0Vy40R5X/JenR1aMW4+3tiv8LDNA0eZmURic90r6KtXh1YxYbvIDtHOjVhqECo1SMUyDZqe9QxVLhEaobIBS5M4r5ZppPDFvC4gwxnW6H3o+W7QuMg9lSSAwRK5dSy1YeP+pJxTGR4xdOzfsBkYnb4tP7zBpcMrBM5iVJmTbSb1zroNF4OZ8pFIZ5ajXOaSnhKlgVd0bzYXh95cYUXhW3GClR7mtp94X2LBWPAAkHtdH90soxkHK3HzQ8TveaHB4hVx7d1EGnwarfW66P2o4LCNBPwZ+sy39wvOeOfIWxEc+TpodIKVPDeytiVs6jrLb5tVIcbazsVQcgxLNgjvRonv5cwpCKxkNPepSFmXnhKdv0Yi66uqGEfVln6Q9bY5uxzJrPMRtJln0exB9liV8LHqtAn6NLQZi1Drwx///uBJ79Hk8DzE1dL/T4Nq7jPszUeKGyu593RImft8AwJWaYHBknjSmsN9ieVzKcN9Q8o1WB0ugv85ZTmkp85kgTIxYQwklWM0PikuhH2xJ4BJbNccmKDcQuZYjIZUPmPLIc4XaqXwm8y64e0i3l8hRpzd93M0PxgMOKLjpfAerDEJTvzmEmqoU8HPQbxrNKoE0XBJLR+3pmhw/ViU94jD3z1zrtAg7Y4QD1xV71w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(376002)(39850400004)(136003)(366004)(1800799009)(186009)(451199024)(6512007)(53546011)(6486002)(6506007)(86362001)(31696002)(38100700002)(36756003)(2616005)(26005)(66556008)(66946007)(6916009)(66476007)(54906003)(41300700001)(316002)(2906002)(5660300002)(8676002)(4326008)(8936002)(31686004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3NHKzJBdHNDNFQrd2tOU0xMQzlsd1Myd2ZWejlzRjIrZ2wreTd5dklBajBI?=
 =?utf-8?B?YUxLYTh4UWhPMGpNaHhHdzY0eVIvMHB0Y2xLZEMrT1RQenc3RWg5OThTRk1O?=
 =?utf-8?B?MlByWU5Vd21HOWxYM3F4ajlhUlEyZWdqeVp1VTZpcm85VURNMHZzSnBXY2lF?=
 =?utf-8?B?TlNvZVJtSEIzUFVkV1ZCcEpidlFKQjllMGFEMExwcEgxUDR5UFVCTFppY25K?=
 =?utf-8?B?Y3RGaUJLVnVUV0VSVjFFNUdGZERRSFhKM2tkVDdhTHYvckFHc1NYVzZnUHQ0?=
 =?utf-8?B?OXNjS3hIc1ZDcm9LanRoSk1JbEN2aTdPTm81VTdLdW5DWjd0N3Bvd3RSSjdI?=
 =?utf-8?B?SGJiTjlWSVgzbXJHVTR0ai8xUTV1SSsvZ3ljRTQvWmlZdlgvK2tCSHFMbWNJ?=
 =?utf-8?B?Tno0c253ZHVYaHkyQ2RIVm5vMmlFMFAzaGtkSXNvZW5iVEFOOU9UYkhRdVlQ?=
 =?utf-8?B?YUJQTi9oeCtFRGcrVVlvZzBqOWRoVzNRR21LeWMyeEFYSlljV3NHWUpTNUFo?=
 =?utf-8?B?U0tzWlVTTjIrWDhQTTh3ekJua3BjSm92L3N3aHJhb282cGxEeUdIcHFUa0FG?=
 =?utf-8?B?eDZqaW82YmgxMTEyeXdvRUVNdVgxYU9JeExhS1dhNkFncFp4LzNXSW9ScXAr?=
 =?utf-8?B?MlhRemhscFQ1UFo0QThlM0IrOThaL3hraDZWREV3WkhHZVdoWXcwc3JsS3ZJ?=
 =?utf-8?B?TkxHNENWY0FDZUFiVm5LNUZqSEpocUdJTkFqNzkwN0liNzJVbGYxL2diMXEw?=
 =?utf-8?B?UkYwVS93emY5VmVmZTVGaWdTb1VsWkR4azFSbkprVXVmcjRiK0pvUys4MXd6?=
 =?utf-8?B?OWdqekNnLzhYZjArZHBNVTJJRkRYZVZHLzh4WHFHSFBQOE4zY3JNeWpvRmo3?=
 =?utf-8?B?SEt4eU1kOVcwa0Z2Nkh6L2JRcktvSnkzUlV5L0VxYlh6QTNQZkdxeDBacXRF?=
 =?utf-8?B?aDEwUDJMMHJMWlZzbm9sdy9iY2xzeHMySmVGUTZ3NDA3eDJZdERhK1FMRXY2?=
 =?utf-8?B?bHZ3TmhRdVlRSE1lYTQ0cFN3Uks4cUVGL1F0OUJndUgyR1lrN0xrVWlrd2xJ?=
 =?utf-8?B?bllERFF5Q1Z2aElESHBmeUZIK0xEZHpSYnVQMFVocHVMRDMrWG5mcnRhYS8r?=
 =?utf-8?B?TzZPVUNqRnB5Yk5YaERjUk0yeXRGaGpxd3g1L3BTSzBBWDR1WmxYUnpQZ2NG?=
 =?utf-8?B?UWdUMy9MUEJxNjg5ODd3Vll4Wnh4Tkg0Sm1ZMkZNclVBZ0FLbWdYTHl4TE5R?=
 =?utf-8?B?QXlNNjErOEFSbEJSNlN0VG1xMlpNVVEwS0IzQ1FzRTZEYW4yM3VJbU0wdkxu?=
 =?utf-8?B?NzFFcDhQZUZFZTNkZ1A2V1RqZkR0K0Zkb2t4L2IyMFJaRkQ5U1YvUXhGWGtI?=
 =?utf-8?B?dFE4ZDE0WkcxanNRY2Z5cVRvMytOVDFyajM5WVBPcjFhaDJpNG16UFFlVldX?=
 =?utf-8?B?bDIrM0g0bEVzY3RIeUVnbHZHVWhqamV1MXprS3BBbEtocnVqVzM2cThvOWNQ?=
 =?utf-8?B?dW5HcnBhV2lVYlJNQjhJRFlkTnFYdXEyei96S1RBSGIvaFZDM3E2MXJqZ2li?=
 =?utf-8?B?clg1bjBkcWJVU2JVeUxyeVpmRWdMRHdvWHduYndvMHVsWll4RWZhczBnNDY3?=
 =?utf-8?B?czYyMnZxa2dZaVB6cVNIRmVpRjB5Q2Y3Z0FIQ2JiTjk0MlJyRkFqeHBVMHVp?=
 =?utf-8?B?VEpDQmtVRlNQaTUvUmhjRUVOaktBK2RZdk1jMlhzT3JFcm5HeUV3TTNtMlFu?=
 =?utf-8?B?VWQ4b1hGWktyamJlbyttZTZFaUJON3ppajRrcFUrVmxGT3pEU2VNT3NDUlZV?=
 =?utf-8?B?d3dLL3dzVWVKR2ZpSXpMVFFDU0U2RVcwenRkSm9CRGZHT09CV05YN2dmM3Jy?=
 =?utf-8?B?OTBIRWNWK1ZVZW1GbTdPcDY1T0tCdXhBWUQrc2tIQTg2Y1R6NGlaaFpDQWI5?=
 =?utf-8?B?UFNEQXNDTmxqQVBjSDhuNnZmODVuK1hkWXI1aThkdU16b1c5TEdBQTFnSWll?=
 =?utf-8?B?NStHVWQraVljMmUrdG1ETVRpL3NUOEloRW5JUmplZFpYaVl4dVlCMHd3Y3hO?=
 =?utf-8?B?VVpLbHd1VkZvbFlmbUdQMEc2N2FjR0VyTzQ5dFZLUnVPSitwejdOamh2TVNN?=
 =?utf-8?Q?kVBxlt9Bii16gliG5nvBpbtk9?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 037c08cf-56f2-41f7-5397-08dbb8503b14
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 14:04:53.2610
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vXPWjF3zzSGY+ctN2o4FvwqNoKEmre7kRkSdIywziIhUFo0doCt7CO6QaFSzT9koK9XMe7iuCCMd74/OpnH9Cw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7203

On 18.09.2023 16:02, Andrew Cooper wrote:
> On 18/09/2023 12:07 pm, Jan Beulich wrote:
>> On 15.09.2023 17:00, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/amd.h
>>> +++ b/xen/arch/x86/include/asm/amd.h
>>> @@ -140,6 +140,17 @@
>>>                         AMD_MODEL_RANGE(0x11, 0x0, 0x0, 0xff, 0xf),	\
>>>                         AMD_MODEL_RANGE(0x12, 0x0, 0x0, 0xff, 0xf))
>>>  
>>> +/*
>>> + * The Zen1 and Zen2 microarchitectures are implemented by AMD (Fam17h) and
>>> + * Hygon (Fam18h) but without simple model number rules.  Instead, use STIBP
>>> + * as a heuristic that distinguishes the two.
>>> + *
>>> + * The caller is required to perform the appropriate vendor/family checks
>>> + * first.
>>> + */
>>> +#define is_zen1_uarch() (!boot_cpu_has(X86_FEATURE_AMD_STIBP))
>>> +#define is_zen2_uarch()   boot_cpu_has(X86_FEATURE_AMD_STIBP)
>>> +
>>>  struct cpuinfo_x86;
>>>  int cpu_has_amd_erratum(const struct cpuinfo_x86 *, int, ...);
>> With one simply the opposite of the other, and with the requirement of a
>> family check up front, do we really need both? Personally I'd prefer if
>> we had just the latter. Yet in any event
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> We specifically do want both, because they're use is not symmetric at
> callsites.
> 
> In particular, having only one would make the following patch illogical
> to read.

I don't think it would, but that's perhaps one more of the many areas where
we take different perspectives.

Jan

