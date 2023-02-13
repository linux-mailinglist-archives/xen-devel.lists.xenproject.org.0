Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2508F69470A
	for <lists+xen-devel@lfdr.de>; Mon, 13 Feb 2023 14:31:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.494506.764590 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYv9-0001wc-RF; Mon, 13 Feb 2023 13:31:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 494506.764590; Mon, 13 Feb 2023 13:31:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pRYv9-0001uD-NP; Mon, 13 Feb 2023 13:31:03 +0000
Received: by outflank-mailman (input) for mailman id 494506;
 Mon, 13 Feb 2023 13:31:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kX12=6J=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pRYv8-0001u7-3S
 for xen-devel@lists.xenproject.org; Mon, 13 Feb 2023 13:31:02 +0000
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on20629.outbound.protection.outlook.com
 [2a01:111:f400:7eaf::629])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a7cf8ff1-aba2-11ed-933c-83870f6b2ba8;
 Mon, 13 Feb 2023 14:31:00 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Mon, 13 Feb
 2023 13:30:59 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::e138:4fc3:705c:d178%7]) with mapi id 15.20.6086.024; Mon, 13 Feb 2023
 13:30:59 +0000
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
X-Inumbo-ID: a7cf8ff1-aba2-11ed-933c-83870f6b2ba8
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YA9UqFBzGjdovV+aLDZshUIBq6FI2sIXFmEPpE+vWJs2JRL1JfhNoqcJ37sqhw9doZTww4c7y1Kq8GrtU0PvAsh5EmTGeVJN9Ds+bXW5LduezcQJy+6V1uSHqNZcFzCs7kMTGLRQm/Y173jmlTQKPGUs8Z0iRT4JF7WCYFLPfZ20tCqY/EVFmx0rjSK7ypuzZ2fxQsMLbTkFybO0MGh0fe7SSvgWhgLKORBom8XcUULGrjsur1DemBwJ7pL4lAWh9OBkfaxUAa5URSwbvMOPJnMgy6SBxIFcubpygkTZexsDUI19+tJ/GmkqfbYwa7B3vJloQH/isnM1k630fzseaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLy90Plo2c5BQpnyAucKeQuBGoHBB5cvkumlAXKjwdw=;
 b=k2h87FZl5gr9nvQ3AnlQhg8GWlj5bZdMclIdjeHHyLFdNrkrFD6QuXQlV9MyCdJGwCS4FcleTaHK7HnEFjX4ERMo3D6VjNGtCjKL+DWc8RqMlDuJu15zptuSEUUBsAJPC8FcMOUfEiNrjdXu3KsRiVFc8fcyYuBwRmLpCATufIqIt9eW8N2dtLPUFQZ+42p01IDviXd74CVraiUxK2I9ARznHkYOHJndOiXXztu7ouPgcmHNVJBFkxGbsoqx0cAWXgCOrp+71rze0M4DFkeHphFgIqLIttCy621m34cwDy1KOBp9PdpaCaCxqvri539yVJfzFyV87Yaq/XSwce0HAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLy90Plo2c5BQpnyAucKeQuBGoHBB5cvkumlAXKjwdw=;
 b=KpfqKM4Ipb9BXO9pnnczsB8l+kEhfce3Mw30EqzwwJO27szRSDvKVAQ54fTgC7221HFVv3KLBzysjgFG04ottQxg+EuO3QfmP4JMRW9agPCyziLBse1xHPKWvLZz1pZAJIdDiLYjUYneG8qNIQRg81K6nHHBvQr6UcuB8nCkqOGwBBZJ9UukPYStbN4+96BStDdduFozgG6C8ZjPBxnyE4A9UZ1EaoZVgU2y0ce7puKCP/2Y/JR7Jp4GV+foLyJzv+w0IPFaKr1+58W6di2VQRqQIoDfxnnybrl3x5koBXO28zLg83CeO3juDmLgS8Jo8+KnmB04BUBbfumIvHNVNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <e0ab939d-30f0-f9d9-1913-6e63e7023d0a@suse.com>
Date: Mon, 13 Feb 2023 14:30:56 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v1 1/4] xen: introduce CONFIG_GENERIC_BUG_FRAME
Content-Language: en-US
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko <oleksii.kurochko@gmail.com>
References: <cover.1675441720.git.oleksii.kurochko@gmail.com>
 <8adf4aeff96750982e3d670cb3aed11553d546d5.1675441720.git.oleksii.kurochko@gmail.com>
 <199fa5a6-ca31-091e-88e0-cae9efde307b@suse.com>
 <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <64aba76d-1746-9f6c-109a-e8c3bf1e1b61@xen.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PAXPR04MB9642:EE_
X-MS-Office365-Filtering-Correlation-Id: 01add6f5-0ac8-409a-2697-08db0dc68ae6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Z1rF8eeA1WlamaJUHr0S6M8mhxCNgxL6Fqasat5X5NI8h7nKjCmKmYDq4eqPDzMRmrvL+MHbnt1y+86gqvVrE2ZpSmkrDjLD9EX/nn7j1s7LC5zVlC09pj25L0ZAmgkP68wwUcoFaeuAS2k6f03ACmtuLgYTKXiDKfJ+iiz6v4HBymMpyiZ2/eOd++2blDVWViKEep7TeD875S7XApJLDyXxNq+qXY48kvlD6tq9N0XW0eqf8woOzWYlk7qaPAAVpyjILqidT7/hlSUUmG5qylPI6jIESO6ZDyMqS63NEfh3RGBIVJP192IMQPo9JdqYljZtZIF0lZpvStrRBOp40hxzAJEW22E+tCtt9yWL5/dAbd7v3qzRBuIMbAeQYXpDXpAuGfLDFhrk32//lKS2k0UXjEWDRIzdEXsjumd1v6uh4Y9MP3cTNvq8mEiXX2Jn5TXZ23NOO9hKHaqnR/d9b9svKqgoCT6ezPUGYZIcc+ePFQgAUVBJCMoiNRK3nzBF+1Imi53PuGNpgwBiBbXUlo/uoVHQ1NEAeyvHGFF36YEiM6uNzJLLy0pkPahV8Vdrm8UmHy05b9rFT8Fbd+7HslsKLO1JKqT9gBqNKKKogdsPONybdo/UJp7XxZJ4ZAQC+ND3d5mqh6PikvcfLm2Ha0CLIgLb53F1vI7GXw5LqT8Roj4VAC6RZDXZjB0oYWZoTnX4fTRkRNRvKk/WhbbHZaKel4Q+dVslr4xiqhd06pKanlq4og69PDNB9eKCjYcs
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199018)(6916009)(36756003)(41300700001)(4326008)(86362001)(8676002)(31686004)(54906003)(316002)(5660300002)(66946007)(66556008)(38100700002)(6486002)(66476007)(478600001)(6666004)(6512007)(26005)(186003)(6506007)(53546011)(31696002)(8936002)(83380400001)(2616005)(2906002)(41533002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TWEwUGRVeitNblVodi9Vdnc5OXZZQlV1YmdZcHFqZTdUVDBZbUhlUVBleWJx?=
 =?utf-8?B?dS9qRE5TcmVuNGVQSktzNnF3Z2dsT3JCZVMzTVRHVVlQcGdiZGRRUHpGVXRZ?=
 =?utf-8?B?Tm1sbVVSa2tiT2xmWHVENlBVbmlMVGdJd25mR0VpVWYxR25iVzRHM2pmTXFV?=
 =?utf-8?B?Q3MzMVZSeVNDZVF5RHVXZFdwRi9zTTd4K0NFMVNFTUlSd2NhYU82N25WZ2pu?=
 =?utf-8?B?NFdXRWE5aTVUemkrTkcydVJjK2FvRkdvMkdjUHhWeXMyUXNQS3hLLzhiakpC?=
 =?utf-8?B?SkdKRFNvK0kzc1paenpVQjRpb1M4VDE3S2pwSXA0elRmM01uR0Nzd2RzeDFa?=
 =?utf-8?B?cXZzOVRCN2ZZQUVUMzBVazJKcHNVamdhaktDWDg1eWFtQmc0MHRwaCthYUJ4?=
 =?utf-8?B?N01EeExzSDErczlaRWdXMkVKdG0vaGYwNkRuZ2U0Y3hZcUdieUkzdTFKZXlz?=
 =?utf-8?B?RFIrNzVMWDdySU5sSGZ4R1Y1NUpiSjEwQkI5MlVMalN1UUo4b1dNTG0xVXhX?=
 =?utf-8?B?d0N4ckNoZXlBUFNFTnVTUUdzSk84dWd4blRJWm5RZmhvN0J2QUNURThSOW94?=
 =?utf-8?B?TERBZUVjRHExemFGODJndmdwQTZkMFdGQ29xTEZCWmFidnliQS83WHBYUSsy?=
 =?utf-8?B?UFVMdjNLVXJqeGtYRHV6N1NRQ01GUkhWR1JjUW1FT093V2xQcjcxYlNvRGV3?=
 =?utf-8?B?VDVGQnFDOXFPb1NHUjVZMjV0Nis0UFFGSG5wSklpSmhpbHdsWWZyOGpSZHR3?=
 =?utf-8?B?TDFjcTN2TVlNQ1VmQnd3TlUraUltMzdZSXQ5ZjFTbHJOT1ZUcFhuWkFQL3ls?=
 =?utf-8?B?d015MlhtRDFCWGZZWWtHNHVYTWhNVi9QcGY5cGpxU21nVmo5OGg0YzlJLzdz?=
 =?utf-8?B?Y3Y0R3NrRWNqNGY0eHhUdEU1cStsNUhGVTNscXlqVktRYUhuUks0d0xVcmdU?=
 =?utf-8?B?OXFLUHlpbFYzN3VkQU45WVlycFJTOEsvVDh3V0RPUXpiZ2JiNWFvVTZzUGFT?=
 =?utf-8?B?VjJHRTNCVnQwL1IrWlZVc1R6Q0pwSWpnVS8rVlg1NHdNdUM3L01NdmppcU0v?=
 =?utf-8?B?RW81R1orQVdVUkdVWEhhTEtxT1duY0RzUTFpS2xoVDlOdyt6dDZraGpyYzRu?=
 =?utf-8?B?Vk1DQ3h3dW16N2dhWUtqSUZseGlIQzRTeU95cDYrMGRUUXJDbEt4OVdpMDNt?=
 =?utf-8?B?azlmMGhKNkV1NjJEUkJ1MjBIZWU4eENkMFdZNmlWQmpvZnRrVUowcWw0SG02?=
 =?utf-8?B?QWtMcXVZblcxU0lnYWFqNWlZZHRhK2xFL0syaHRJQmo5Y3k3MUNhSUtzLzBz?=
 =?utf-8?B?Z0x2MmlDaGJ5ZFlKYUhKOVBudVFhMy85T3lPL1ZpWWU2ZGZ3a2F3NGZsVWta?=
 =?utf-8?B?YjIvN3d0QXdHT01WTllMZGFjanJVNlRkVzlZTlNCS1dQVnZYdE10YXVlTVdh?=
 =?utf-8?B?azNFN285MlozSS91Q3ZJQXhEVlVkeUJ5R1g0ajZhOEF2NGFlZVgvbDV0b2tq?=
 =?utf-8?B?ZHlkQS9Cc0FGWXZnVnNMZU1JSkFWRC9nbENDY1lJTVppUUN1UDFxL1k5N1hu?=
 =?utf-8?B?cXZJd0NHOEpMVC92dzJMZko4T2tZWUpMZTYvWkc5dkowa0RJUnFqVXJpL2JF?=
 =?utf-8?B?aFdKb0xPa2ZxYVFKWjBocjA2VWI2Q2lXRjBzSVJBT0w3S0MyQ21LMm1HT2RU?=
 =?utf-8?B?blBsYiszdHVxeDRKbFNKeFJ2RmJNNEkxYmFNc3ZJMlZ5Z0pPeDZIalFGTG5z?=
 =?utf-8?B?cWo2MGx3OXZobmNFMmthQ0F3ZVBTakRvTUFXT0VTTU8rWURtY3BVNDVWZDJy?=
 =?utf-8?B?bHgxVUFkMkhxQTZYTGtQanlaRk9rcUJQSHdXRkJPTitWaDl1ZzloZnpYcDVl?=
 =?utf-8?B?UGQ1ZHQyU3RuRHNLTmhCaERvQkZPZFhFZExIcGpMUU5BcG8yQ0gwS09sdWNV?=
 =?utf-8?B?clJTOTRXUU45NW9yd1hVak5BeHpqU1V6czk0UFRyNWNOZFZSZ05kQkhOSHZz?=
 =?utf-8?B?Z1BMQVFxRXZNUkVUOFRIUjlXNzdpcU5lVUFNaUl3Zy84Ym5zaVdXNis1Z3ZV?=
 =?utf-8?B?RFEzT3VDMnlwS1VsbDg2Q0pBSVN0TGljQWVMRnVzdjJqaDB0d1ZOSE1yaHU3?=
 =?utf-8?Q?7EGoLRgTEZ79v19inLumLOGGc?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01add6f5-0ac8-409a-2697-08db0dc68ae6
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 13:30:59.2612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HGn8WHDyp+PyGmWSQD9mk5vQq2ud/xkcf+JAvCggAZkgyA0w+HD3n9FMEGiCC3nG4WMO126eP/EDUnRexL98OA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9642

On 13.02.2023 14:19, Julien Grall wrote:
> On 13/02/2023 12:24, Jan Beulich wrote:
>> On 03.02.2023 18:05, Oleksii Kurochko wrote:
>>> --- /dev/null
>>> +++ b/xen/common/bug.c
>>> @@ -0,0 +1,88 @@
>>> +#include <xen/bug.h>
>>> +#include <xen/errno.h>
>>> +#include <xen/types.h>
>>> +#include <xen/kernel.h>
>>
>> Please order headers alphabetically unless there's anything preventing
>> that from being done.
>>
>>> +#include <xen/string.h>
>>> +#include <xen/virtual_region.h>
>>> +
>>> +#include <asm/processor.h>
>>> +
>>> +int do_bug_frame(const struct cpu_user_regs *regs, vaddr_t pc)
>>
>> I know Arm is using vaddr_t and RISC-V now also has it, but in UNIX-like
>> environments that's redundant with "unsigned long", and it's also
>> redundant with C99's uintptr_t. Hence when seeing the type I always
>> wonder whether it's really a host virtual address which is meant (and
>> not perhaps a guest one, which in principle could differ from the host
>> one for certain guest types). In any event the existence of this type
>> should imo not be a prereq to using this generic piece of infrastructure
> 
> C spec aside, the use "unsigned long" is quite overloaded within Xen. 
> Although, this has improved since we introduced mfn_t/gfn_t.
> 
> In the future, I could imagine us to also introduce typesafe for 
> vaddr_t, reducing further the risk to mix different meaning of unsigned 
> long.
> 
> Therefore, I think the introduction of vaddr_t should be a prereq for 
> using the generic piece of infrastructure.

Would be nice if other maintainers could share their thoughts here. I,
for one, would view a typesafe gaddr_t as reasonable, and perhaps also
a typesafe gvaddr_t, but hypervisor addresses should be fine as void *
or unsigned long.

>>> --- /dev/null
>>> +++ b/xen/include/xen/bug.h
>>> @@ -0,0 +1,127 @@
>>> +#ifndef __XEN_BUG_H__
>>> +#define __XEN_BUG_H__
>>> +
>>> +#define BUG_DISP_WIDTH    24
>>> +#define BUG_LINE_LO_WIDTH (31 - BUG_DISP_WIDTH)
>>> +#define BUG_LINE_HI_WIDTH (31 - BUG_DISP_WIDTH)
>>> +
>>> +#define BUGFRAME_run_fn 0
>>> +#define BUGFRAME_warn   1
>>> +#define BUGFRAME_bug    2
>>> +#define BUGFRAME_assert 3
>>> +
>>> +#define BUGFRAME_NR     4
>>> +
>>> +#ifndef __ASSEMBLY__
>>> +
>>> +#include <xen/errno.h>
>>> +#include <xen/stringify.h>
>>> +#include <xen/types.h>
>>> +#include <xen/lib.h>
>>
>> Again - please sort headers.
>>
>>> +#include <asm/bug.h>
>>> +
>>> +#ifndef BUG_FRAME_STUFF
>>> +struct bug_frame {
>>
>> Please can we have a blank line between the above two ones and then similarly
>> ahead of the #endif?
>>
>>> +    signed int loc_disp;    /* Relative address to the bug address */
>>> +    signed int file_disp;   /* Relative address to the filename */
>>> +    signed int msg_disp;    /* Relative address to the predicate (for ASSERT) */
>>> +    uint16_t line;          /* Line number */
>>> +    uint32_t pad0:16;       /* Padding for 8-bytes align */
>>
>> Already the original comment in Arm code is wrong: The padding doesn't
>> guarantee 8-byte alignment; it merely guarantees a multiple of 8 bytes
>> size.
>> Aiui there's also no need for 8-byte alignment anywhere here (in
>> fact there's ".p2align 2" in the generator macros).
> 
> I would rather keep the pad0 here.

May I ask why that is?

>> I also wonder why this needs to be a named bitfield: Either make it
>> plain uint16_t, or if you use a bitfield, then omit the name.
> 
> Everything you seem to suggest are clean ups. So I think it would be 
> better if they are first applied to Arm and then we move the code to 
> common afterwards.
> 
> This will make easier to confirm what changed and also tracking the 
> history (think git blame).
> 
> That said, I don't view the clean-ups as necessary in order to move the 
> code in common... They could be done afterwards by Oleksii or someone else.

I disagree: The wider the exposure / use of code, the more important it is
to be reasonably tidy. Cleaning up first and then moving is certainly fine
with me.

>>> +         ".pushsection .rodata.str, \"aMS\", %progbits, 1\n"                \
>>> +         "2:\t.asciz " __stringify(file) "\n"                               \
>>
>> file is always a string literal; really it always is __FILE__ in this
>> non-x86 implementation. So first preference ought to be to drop the
>> macro parameter and use __FILE__ here (same then for line vs __LINE__).
>> Yet even if not done like that, the __stringify() is largely unneeded
>> (unless we expect file names to have e.g. backslashes in their names)
>> and looks somewhat odd here. So how about
>>
>>           "2:\t.asciz \"" __FILE__ "\"\n"
>>
>> ? But wait - peeking ahead to the x86 patch I notice that __FILE__ and
>> __LINE__ need to remain arguments. But then the second preference would
>> still be
>>
>>           "2:\t.asciz \"" file "\"\n"
>>
>> imo. Yet maybe others disagree ...
> 
> I would prefer to keep the __stringify() version because it avoids 
> relying on file to always be a string literal.

... hiding possible mistakes (not passing a string literal is very
likely unintentional here after all).

Jan

