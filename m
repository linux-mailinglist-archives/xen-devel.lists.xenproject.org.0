Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF017A46DF
	for <lists+xen-devel@lfdr.de>; Mon, 18 Sep 2023 12:25:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603878.941002 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBQm-0000eE-Gy; Mon, 18 Sep 2023 10:24:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603878.941002; Mon, 18 Sep 2023 10:24:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qiBQm-0000cN-Dk; Mon, 18 Sep 2023 10:24:40 +0000
Received: by outflank-mailman (input) for mailman id 603878;
 Mon, 18 Sep 2023 10:24:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q4jH=FC=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qiBQk-0000Lg-UP
 for xen-devel@lists.xenproject.org; Mon, 18 Sep 2023 10:24:38 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on2061b.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 916a9f8e-560d-11ee-9b0d-b553b5be7939;
 Mon, 18 Sep 2023 12:24:37 +0200 (CEST)
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com (2603:10a6:10:2e1::23)
 by DU2PR04MB9212.eurprd04.prod.outlook.com (2603:10a6:10:2fb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 10:24:34 +0000
Received: from DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654]) by DU2PR04MB8790.eurprd04.prod.outlook.com
 ([fe80::f749:b27f:2187:6654%6]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 10:24:34 +0000
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
X-Inumbo-ID: 916a9f8e-560d-11ee-9b0d-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JOO9ExqXJF5OeqoIDjjykDE8N043ctLEqdwRJQ1XH8M1/ICzdRwp7NBzsyRavxIvKPYFWUNlxgCIFAqRAaW/eKrK6/23YAtdz/X3lEvX6mKTu2pXh2OBH+g46phXkohgVQs7XSVVPlSGCooOvwODSEUqwLF3KL1guOm3KL2K7YzMRXBfw/lMbkH6Vu1OcYovy/u/vD+nNwfXhA/An87p2zxUs3sJsuNebD9s4rGYQdZsCCI064aeI5eDoW0au0LShu8PKpHt6ogvT6EZTWFXUc1bFwaKzaFAB+kOqIJHzt5RBUErJfmUlhc8G8nuERq4XqQVEuMnZn7Sw1/wTlicwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bopyGyaYwJBkoWh+NJm0lrXbfAsfTdokxew7mr1sJug=;
 b=QuCdypxo0GhBlCCiFRrhgkWeehm6//A0+n9Mmj5P7Pyv7OYCX19X+tKUhFwc06Bk5T4L5lpQ8wyQzlqRRK2bshEc9hUrLsNnId0X1N/bBhIF4D3zFn1SOZ0J0WZzuAwEqscdWN/+qpVwluDk7cQ2Rsu6GTn7Z8JvVy91aWi3sJf4PGApuUL3dDZE4T2X9039pUIqBBR16WDb82nz2F4AMeOLs3FSqCV4suydEw4Yaxpk9YNpshJ+hKFR5llR1q3Hkr42fy71Ba25IMnP7uBF4c51IgKdu0OcX0b7gOAzVJFXH3GBCrXAYlzNdqxqMgjgscwOzzkmC/9xrzcGo9oHuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bopyGyaYwJBkoWh+NJm0lrXbfAsfTdokxew7mr1sJug=;
 b=oZqfjtYgO6fvg2D5CnCQriwZYFri2H/+uQrnZPRHzuhsWICqYC7zWI5yolRcCCtwTy9PT/jgaIqs8qiJx/BUVtaxtY+pFq0px9pCn1M5/f9cDI5v4LZOlCC3Jn5kie5LqGfzHdspvnkfaYo4her3Bnw8obRk6yDFufX5AQhCx25ZXvme4e36+/PZKVr42ZXSxBWyeJ2uHzxaVvqFjyQn6uOv45HuA0K/bokwv+zetKGpQcsxqvAvJUxYxqWJZYUE33k5p51NYV3/KMS7oy23KEAW2b6A5j0HKsMPbwAoYv1XLHA3JoRC/IT3BFOXkb6776Sjl5wm90BuWY0uXyvFlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <c49be18b-256d-76b6-7d73-800ba40c313f@suse.com>
Date: Mon, 18 Sep 2023 12:24:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v4 1/8] common: assembly entry point type/size annotations
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 George Dunlap <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <e4bf47ca-2ae6-1fd4-56a6-e4e777150b64@suse.com>
 <bfc597f3-c61c-727a-159a-859f57997d02@suse.com>
 <8ed43968-311e-263b-4dd7-9f8a49a394dc@suse.com>
 <7b1582d2-8c1f-4694-995c-c92e83590b3a@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <7b1582d2-8c1f-4694-995c-c92e83590b3a@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::6) To DU2PR04MB8790.eurprd04.prod.outlook.com
 (2603:10a6:10:2e1::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8790:EE_|DU2PR04MB9212:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e662523-52b8-453e-686a-08dbb8317410
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	svB6wZBDfPpfodYwcL9/nW8IxO1TT5gk823+LfmKALG7C9s1GZmMiCm7C6sp3R4jNgyrd7e8n0aiPH2KrPTYxGYH9tCG83ZcSeO6LtYY6n8kKXxM9z+8BHfo38h2hNwwLscFzxT6fnzGPO9FPAsZpQo23FRyXd9qOjObSPfJQxR/g9tY+M2teqdwOkV5ROSm4swE/IzvZ42ygBWKotR0JsUUwh79zg4dqze6GHy06vuWci4h6btsits5cQ6an8MF+bftDcc7UnIAO7N59rMoJe7YoNnNDQouXBvuhXRxo1/OqwGtbwz2p8oqj4B/in5NXGxVRo6AN6XjKrBQ61sGp3agJkb4SuR/1vtrQYcxCIE2EoQch0AfA438WuICVNZQXu4YSCqu5On8QaYd/fZf6A1He1kZVU71P57e6QDyYQcvCPAr1BAYqsGAV5dWMFzjDuJWKFi6Uto7n+6m3Lk4zFOG4T1fFElAotMI4BYouR2zZKYO3ODhMtCJoGIQxb/swKzJ/tZUVs9R2gBQalQrRgcdB+BAlhvSdyRlEEhGMK+sYjF/0COQoU5M9y0T8wAS7JbFgQc80vluiic1YwZLmIjkp+kouO7NXjatEpdRhiJXerkO0k1dBr2vIXoA0GGk1PKhwI+9M5EJRSCb3AhkHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8790.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(39850400004)(136003)(376002)(396003)(346002)(1800799009)(186009)(451199024)(31686004)(36756003)(38100700002)(31696002)(86362001)(6486002)(6506007)(53546011)(478600001)(54906003)(5660300002)(66556008)(66476007)(2906002)(4326008)(8936002)(66946007)(8676002)(6512007)(83380400001)(41300700001)(6916009)(316002)(26005)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RXpjLzRhR0l1Sm5lRGdITHBicXlEekorVTFpQk9YdFFYU051UWpFUEFabWJH?=
 =?utf-8?B?SjBTeWZhNm4rSkZZNmgxaTdnSlFqRSs5VWprWWY3ZXM4Y2dOMXd3TGM2THd2?=
 =?utf-8?B?MTlSK01pSkJhRklKWnkvT2p0U2I0aE1lMG1MTkVIRCtwdHN2S2h4cUcwVmxk?=
 =?utf-8?B?eEF4VkR0aTF4SENMRWYwK25VR2lHa2lwakJCT05ITGRiSW1SVStYL0o2ZTJq?=
 =?utf-8?B?eWMzUWd0NWFOejE3TnBlV3BXSi9hc1hHQlZnYmJQWVlyVVBRd2tQYVlGanRy?=
 =?utf-8?B?M2hQTWdlN0FaTnlaVyt2UCs3RGFZMHdoK1pWZzVqaDRsS0ZxSENGVm10Zkpw?=
 =?utf-8?B?Sm43K2lGdk1YMmF5ZThKbXR0ZGsraHJrZFhlcTBEQUhiS2pyS1UrYlN1MENK?=
 =?utf-8?B?RW0vWHQ3ZFErTWNXZmdNR1llWlZQNkVmTjBSdFQrY1pzY2p4cEY5S2hsWndS?=
 =?utf-8?B?bXpEb0ZNS1FuNk1qenVPdXVjNmpHVDQ5V2F4bjFiUjZKUzVNMUdjUUxyZ3J0?=
 =?utf-8?B?cDdxVlk2OUtsY3h1bW9oT08wRGRVMS80cXhCemt5Y2NYYVArbzlCWjMxTElK?=
 =?utf-8?B?MHV2bVVTWDBhWVliRUlhdjBIK2tHS2Qwcm1nTXJLQkJwbU56YjljeVFSU1dD?=
 =?utf-8?B?VVBWVG1ubjJKY2dSL043YVhkM3FkSWY4Z0NCMVE0MEZ1OGJGWWVVVCs5R3k0?=
 =?utf-8?B?Zk5OREoxN2Nna3B2Y1k5dU4yNHNBcWVTNzBBZTNvWVU2eC9nUDlzZ0w3WGNa?=
 =?utf-8?B?YmhOVys5b0tFQVFiSjlBWXFZd0RBMDRWbUhLMlliUlRwL3dQaVJmZldTVWtk?=
 =?utf-8?B?ZVJYZEgzZTVOejhHZTNIMHY1eW9kTVRxNWIxWlV4YzhBUjlpcEloYTlRL3l4?=
 =?utf-8?B?L05wOExQRm04U0Y2NXRaS0txaEFOM2ljVmE4VFdQd3BwL0xUNjFndS9uTk0y?=
 =?utf-8?B?Sk05YWZCamo2ZkJCSUc0cDJFUDFxRzR1eldvdUkrSy93ekplOHFLODBXSEJ4?=
 =?utf-8?B?V0FXTTUxaGNtZGNGeG9pM0pESXlnUFNRYW9YWU01MEp3UUQzOXBXUnc2UjBm?=
 =?utf-8?B?RTdrVXlxTWNGcmQ5L0hLR0JKa3hJcGI1ZGoxQy92M0Y2UVFTVFhpeXovaWx5?=
 =?utf-8?B?eXU4N0prbHNLdGhNRDFVenFzTE5TYzRoSnN3MmdvakpFc3pSeEZ6bWxyMndI?=
 =?utf-8?B?R2lPM1hZVWRONW5UU3R5bDRPeEpTajdTVDVGMnRwL2piRWtzN3BpVDdISWlY?=
 =?utf-8?B?SStJbEVZVmFSMVg0eDBocUw4Y1pidEMwK3Z6YlZHSytqWjVYSEFTN0lXWnVZ?=
 =?utf-8?B?WFMxSWNWcTNQdnNaK2VocGFlaFVJYmVIR3FKdXE1TWZjT3R5d0treG5ocDZC?=
 =?utf-8?B?VlFPTjV2c3RkSzlmVXdweFkrWWs4NmphbnFIeEl6VldRMXNBZ1pmdTRLenM3?=
 =?utf-8?B?dHZpaENaUC8vVzk5ZTlWb3VKYWZTb0I4aUNzOEhISjZRdTBGdHpDdis2K2ZZ?=
 =?utf-8?B?a3lqSzRxSVNOTFFSeDZTYnlCUkVqOUpyTUtuUkVkMHhrelJqblhqOHhaOE5h?=
 =?utf-8?B?dnBKM1NWTVlGR0hBQmVla3d0YXptSzl5K1U1OWdjZUlrdm5iaTFCT2htWlZT?=
 =?utf-8?B?Tm9RUTEzWXRIZk1IajloSlF2cnhsWmdwVjV5NWxPT0xLYkRhRUJaRS8vemI4?=
 =?utf-8?B?VWVVTUJlM3RDWEJWaXE5R1kxRFlDemMxTWlpYzJRQ3dCWGtSc013cFkyV2xs?=
 =?utf-8?B?VlBPTHVmQll0L3Y2bFkrVUdScVhncU81ZERUSjdrU1lhbHEvSFVUNEhTejJv?=
 =?utf-8?B?b2ZZdWVxMjdXR2Q5c3IySXU0ODRyTWIvU1lJMEpXS2JxaFBNN0NMTnk1WCs5?=
 =?utf-8?B?R3hhNGpYbER3alhBS0lqMisxS083LzVwRXNzUDNZTjlOdlZmYTRmUUsza3Ix?=
 =?utf-8?B?R1REaW5hL251bVF2bzRkZEF5eENIT0tZZktMbUlMMnpGZnUrYTZ3WGQ2QjZx?=
 =?utf-8?B?bXluQ0toak13OHp2OWpTakNMeGVDbnQrWHNiY0k5cW9lQXVHL0IzbnRTYzNZ?=
 =?utf-8?B?RkFlUFMwanRqK0M1MFdKZ2dTSWVya0dsd0I0NjdPR0xKNXIzRmwyNUZUeERh?=
 =?utf-8?Q?Iys+vBllWyfq54sE/Yyz0U1Ys?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e662523-52b8-453e-686a-08dbb8317410
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8790.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 10:24:34.4834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wpLI/BY+jHBfUN/fJr6XqpBmTEFHiq1Ev0MgnRRiG27Z3T5Pv1o9dAV/MkbOED/bXH9dHxSJhM88N/Y7Snz00Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9212

On 14.09.2023 23:06, Julien Grall wrote:
> On 04/08/2023 07:26, Jan Beulich wrote:
>> TBD: What to set CODE_ALIGN to by default? Or should we requires arch-es
>>       to define that in all cases?
> 
> The code alignment is very specific to an architecture. So I think it 
> would be better if there are no default.
> 
> Otherwise, it will be more difficult for a developper to figure out that 
> CODE_ALIGN may need an update.

Okay, I've dropped the fallback then.

>> --- /dev/null
>> +++ b/xen/include/xen/linkage.h
>> @@ -0,0 +1,56 @@
>> +#ifndef __LINKAGE_H__
>> +#define __LINKAGE_H__
>> +
>> +#ifdef __ASSEMBLY__
>> +
>> +#include <xen/macros.h>
>> +
>> +#ifndef CODE_ALIGN
>> +# define CODE_ALIGN ??
>> +#endif
>> +#ifndef CODE_FILL
>> +# define CODE_FILL ~0
>> +#endif
> 
> What's the value to allow the architecture to override CODE_FILL and ...

What is put between functions may be relevant to control. Without fall-
through to a subsequent label, I think the intention is to use "int3" (0xcc)
filler bytes, for example. (With fall-through to the subsequent label, NOPs
would need using in any event.)

>> +
>> +#ifndef DATA_ALIGN
>> +# define DATA_ALIGN 0
>> +#endif
>> +#ifndef DATA_FILL
>> +# define DATA_FILL ~0
>> +#endif
> 
> ... DATA_FILL?

For data the need is probably less strict; still I could see one arch to
prefer zero filling while another might better like all-ones-filling.

>> +
>> +#define SYM_ALIGN(algn...) .balign algn
> 
> I find the name 'algn' confusing (not even referring to the missing 
> 'i'). Why not naming it 'args'?

I can name it "args", sure. It's just that "algn" is in line with the
naming further down (where "args" isn't reasonable to use as substitution).

>> +#define SYM_L_GLOBAL(name) .globl name
>> +#define SYM_L_WEAK(name)   .weak name
>> +#define SYM_L_LOCAL(name)  /* nothing */
>> +
>> +#define SYM_T_FUNC         STT_FUNC
>> +#define SYM_T_DATA         STT_OBJECT
>> +#define SYM_T_NONE         STT_NOTYPE
> 
> SYM_* will be used only in SYM() below. So why not using STT_* directly?

For one this is how the Linux original has it. And then to me DATA and
NONE are neater to have at the use sites than the ELF-specific terms
OBJECT and NOTYPE. But I'm willing to reconsider provided arguments
towards the two given reasons not being overly relevant for us.

>> +
>> +#define SYM(name, typ, linkage, algn...)          \
>> +        .type name, SYM_T_ ## typ;                \
>> +        SYM_L_ ## linkage(name);                  \
>> +        SYM_ALIGN(algn);                          \
>> +        name:
>> +
>> +#define END(name) .size name, . - name
>> +
>> +#define FUNC(name, algn...) \
>> +        SYM(name, FUNC, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
>> +#define LABEL(name, algn...) \
>> +        SYM(name, NONE, GLOBAL, LASTARG(CODE_ALIGN, ## algn), CODE_FILL)
>> +#define DATA(name, algn...) \
>> +        SYM(name, DATA, GLOBAL, LASTARG(DATA_ALIGN, ## algn), DATA_FILL)
> 
> I think the alignment should be explicit for DATA. Otherwise, at least 
> on Arm, we would default to 0 which could lead to unaligned access if 
> not careful.

I disagree. Even for byte-granular data (like strings) it may be desirable
to have some default alignment, without every use site needing to repeat
that specific value.

Jan

