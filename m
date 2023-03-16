Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D638F6BCB96
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 10:55:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510462.788124 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckJt-0000hi-GI; Thu, 16 Mar 2023 09:54:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510462.788124; Thu, 16 Mar 2023 09:54:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pckJt-0000ej-Cz; Thu, 16 Mar 2023 09:54:49 +0000
Received: by outflank-mailman (input) for mailman id 510462;
 Thu, 16 Mar 2023 09:54:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pckJs-0000ed-7x
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 09:54:48 +0000
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on20628.outbound.protection.outlook.com
 [2a01:111:f400:fe16::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95aaac54-c3e0-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 10:54:47 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DBAPR04MB7445.eurprd04.prod.outlook.com (2603:10a6:10:1a7::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.31; Thu, 16 Mar
 2023 09:54:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 09:54:45 +0000
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
X-Inumbo-ID: 95aaac54-c3e0-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3TB3fcNeic2E3mycZ4j6tjb8oIp48QPTyIYnpYPoNR47zj6N9VkVPyCg/w1vN+WwO0RQyl63xBr14qWEeOwePcX6UE9bsQXHYR/P9beezAIzZUzzeTqejDy3POc0Qo4rGcbO4jUozX4EexTEagIk9YDCoqaA1+Rl+yWclb6YJ+oAnIsT8l6z+MPe6LNdOCiEk/xgbEsYTh+gSfR6Mt+yQyD8YyaXQAzu2ZRtcN2IFv76VfhDVPPTc78LePPsbb1fDDYBLCQa7M5z/Fa/72Z9+MWx6ZJOOKtw2xW3nrRm4p9QKu3985tc7zEoGP+RJJwlaSZ4hBuEk+0kHD+S4XK0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8r+P83UaUrbAniYYk0RQnRSgsFXiA09yC723Rams+Iw=;
 b=DR/8MNHRjrA1H3to8xKWIlE3URV8usNvKhJ4+gR3TJZrtZe6eiZQnEAopWPSOzO1ZjdxHiyrTJFH8xybuQTL9QGq05HkJhFSEjNEE9zTw75XpfptvKa4e3fdnvs5kStAcdF2KTlIdB3Vja8ZVxV7JHPYklpxXDxvigmlV1w2fM/kll6m+3iRXxvLn9KG8ugnyROuy2LNS8icZ2Xv2gHN0QB7BMVTUrGNBR14Q5f2urEypzlkgASlYxA+OARHwp7uLloLLI/IDbDfXJ7dc2LleyslXEH4W/EqL8ORjq3yXMZiWc5uGUXqS2oQSLgwUT5MqxEay6M5c8AfyzJAcME5pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8r+P83UaUrbAniYYk0RQnRSgsFXiA09yC723Rams+Iw=;
 b=m0AMH1cSP9potgBPiAMcD3CJYWXMQ4MI3N7CALbbr9m7Pm4tUwrO1kuf5lNMBqPaz3DR88REPsRjDpyfoH7qTl39kVvVhdaqA4t5+00Zd0q7SKs6y9FDgi2APPA4LA3Q0NWKLxBKposBUZU1PklvTDAYSYnt79SPVUPTjpvahN4u3AzQ/hpRVdzaKRql8fUE4xVfdEgC+H2v6SpBxjH5yt/T8GTHq443UJXlsDU7mw/O0tzv1MILvGVJ2SZxbkPPiSBeruy/odTUGxFg5ghITjhVN61fba1NOlxIhaGBiQy3oo2IfFeaMQMLnf22rBDs2y3/zbFs74AcVA5nDsjroA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <22c46432-e940-914e-53c2-2913607be3e2@suse.com>
Date: Thu, 16 Mar 2023 10:54:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v1] xen/riscv: make calculation of stack address
 PC-relative
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <ad2249c1b5be01f99ef9c294a3264da0c9715bab.1678809641.git.oleksii.kurochko@gmail.com>
 <9c5ec3f3-c909-8f45-4460-1b29ce333d10@citrix.com>
 <e7c42fc7561b88b1a18463b9b28d0b09cd6553c4.camel@gmail.com>
 <966c19e3-d255-db73-9bb4-7abe0a745396@suse.com>
 <ac357f76-653f-9dbd-dc54-6e31db28de9b@citrix.com>
 <00fc9016252e656be257671aa5c2c4e102df240a.camel@gmail.com>
 <4cee4508-7250-9a27-a186-8cc2000dc3ce@suse.com>
 <dfbcea7e4dc7ae9d1c824a64e85969faa415c7a7.camel@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <dfbcea7e4dc7ae9d1c824a64e85969faa415c7a7.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0158.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DBAPR04MB7445:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b0ee72b-0673-4ff2-76bf-08db260478f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GgaXWH1TcWnkY2FRsaXZA4Lr5YngtTOYWvR5h7qVKATcPE9OXKAX5p/KSIT+lUcvSSwNgSkjjd2xYeB3H9GN9UeWEFu/Y8010IZStNKSqxdKRGU/megjgY+3/KpACjbuwQfBW4XRn1ZLPKEn/jmyNqg92JRIKc0QlyAyHpLNzUAnhTY6Va0gah/qc1WPH6WCM/fHP6R/Q02BnLQjPchWycyve8ZrJElBC5R8bvUvHizy4cr/FrPdcJvxqPwQ5kydUz9E0TzeDYGvNh6H5GNZ25589t350cKkyHWvrqG5u0m+HUq9sm+qWmJpFv7Nkds9i+tJgxwxRtyxTjv5TaAI17xqgzJKW5TkEhjSp7EgDZEoBK30c9wvqtZn1P4xEsseUfIg+MaBxy7SRGh/VgY4KHWjV/CHHYeoveaauP0dZR+8HwecQ6A2PgqfhbQ7GkEiPVNPPsyCE25FqvYIGBI0MuK7QBQAL3zM2xbvMwh9luy2Y9QZxUEkQxSZcbeZgjUeNE3aZTXUpHpIfFvgFodtVnXX1bMSp2NERkVcNP2eoB7XBC+BuvZOl/pjHLAQBsx1EX1ckkM9htq4//MXz2dnod+r0hrKb7a0x8LDbO1NbFN8ksAgxDbLfkBpeIy+KAGnqdKNJacdJKWkZt3qllHMxJSOOwiq2oYHorSjGd5VSDpFHkGWoXKi4kFiBj3316EiH7K+CCf9yAl/VMlK45g7tzzedDFI9BrYRJ3izLfjYj0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(136003)(366004)(376002)(451199018)(86362001)(38100700002)(31696002)(36756003)(2906002)(41300700001)(5660300002)(8936002)(4326008)(6506007)(26005)(2616005)(6512007)(186003)(53546011)(83380400001)(316002)(54906003)(6916009)(66556008)(66476007)(478600001)(6486002)(66946007)(8676002)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ekt3ZlZNSlUxbHN3Q09yb0xIdWFqREhPcEJJdkFVeDdNYUk4SVlwTXFFRmxh?=
 =?utf-8?B?ZE5iSTRqaE5YVUxyYWJFWGJKb2FIY2RzcWJZYkZkZUU0RUF5M0ZGdU1kTE1w?=
 =?utf-8?B?NWI3NTZ5QjFkRTEvYTdmOW9pQ1VPbU1BanNtTU1mVWtGQnZVYXZPZ2FacmYx?=
 =?utf-8?B?d2h2RENhQjNwTktRN1RPbzY1Q1JFQmJqY0hNZTlqNlZnc2VhRldGTmZrM0oz?=
 =?utf-8?B?bkF4aFkwbDNiZS82ZGo3NkZkejNCcVMwc3ppVHdZLzJZek9HcTVOaTYwbmtX?=
 =?utf-8?B?TnhtY2NIQ3pQRFpodzk2azdKdkxwcmFRVDZGVnFTRGJXbFdiQ0wwYVZrMWlT?=
 =?utf-8?B?UklWa09SZ21qeC92NWU2MVhNSC8xQWhVdkVZd1dWNDUydmNtNk9XbHFhWGs0?=
 =?utf-8?B?TVdyaDVRc1hjSmszREI5clIrSzNDR3l3Y3JlWjhldUJyYnk2VVRCVlI4WlVK?=
 =?utf-8?B?M2s3R0VqRW1GYzNlNHNBQ1Eya2xreTlZVm9EZnVUeGVCemhwZWpkUWpuWlRk?=
 =?utf-8?B?bllNaDB0M0MraGd0QTRjSTN3Tk5acGdRaXFsUmtubHFsWHdKTGlrME5Fd3Av?=
 =?utf-8?B?Z3E0WmxWZHpwc0t5ZUxGZmZtU1FQamphQ0xWQTNzQjAwbnN1YXVvSUYya21X?=
 =?utf-8?B?WkhySEYyTW40NVpvZVJRcld3MVVZc25JNS91T3BMV1J6akltNVppeEt0UkNY?=
 =?utf-8?B?K3U2eXNXY1NKNnQzMFZGTXAxVFZNNzJjaUREeFM3dmNyUisxWWZIN0FiMDZK?=
 =?utf-8?B?b0JLbXNCaDhsd1ZKdHY0K1JGZ3k5dXRHVWVGVEptUHJLTmVhZnpBbjdQU0ZF?=
 =?utf-8?B?VDJJVUlUYUpFVXBPcEIwMTRIY0k0V2lRVlVVSWxEUEUydExKMXhwV1doTTZM?=
 =?utf-8?B?bTVoMTZodHNvN1I2MCtNeklQaDEwd0lVcUhPU0JGcGl4REh5REZGdnRWK0o0?=
 =?utf-8?B?WEZVc1pXUC9HNG1CRC9lTW9naUpHNTZxREI1VkJ2aWo2cVNaTGNCY2dBQ1p3?=
 =?utf-8?B?YzlaMUJHN2lENjFOODJ3YlozNHlXWkx4bkh2TU84aGFjOXdjaFYvRWJ0c1du?=
 =?utf-8?B?QVJmbHBHQkg0MnpUQjhCZDFFUk9nM251Z0hBZ3RCZytuWmYvOU1UMmtvTVo1?=
 =?utf-8?B?RU9LZHJyc0V0QXMrbXp0V1IrdVBUdG5CUnRDclJ4UzhWQjRPcWhoRlgveHd3?=
 =?utf-8?B?aU04cVFlZ1gyUWRkRDdPRmhzQTJnM3JYNDB6dERPZFI3eGdiZUkvY2RTS2xE?=
 =?utf-8?B?L2NkNW40aUdVQy9VVXBubDlCcHFHdzFpdU42ZmdqS1dlYTRxT0NzODU1cjlz?=
 =?utf-8?B?UW9SeCs0cnhRR3U3b1FBYm5Sa21mTjF5djZVam9CT2JHa2E2NEZubDdBYWJV?=
 =?utf-8?B?TTMzWFJteEdVQi94MzJ5T2xkT3FCY1lUV3BPVFdYZEVTYWxYakFPNFlTclJ4?=
 =?utf-8?B?azd1ZUNnZFRpNjJIVVd3ZGJJZUtCRU1wMGgzMXViR08wemRYcjR1UTRsUkdr?=
 =?utf-8?B?V0wxNlozdEt0SkZMTE1UdGtSQkxKYit5R3JQclFyU3FmWUorRTl3ZXg5d2NE?=
 =?utf-8?B?RFdJOVVlVXJrOTNLUVVkNXpoUURHdlNmeHUxWW1QbFJHc3R6NlFEd3pEU3VS?=
 =?utf-8?B?TUJlbW1xVXlhemh4aFVYczNaWmc2blFMaXRQWGJCVHZVZmNkWTkyUERFcG9n?=
 =?utf-8?B?V3BmTFhJK1BLamoxSi9Bc3RHdnlMUWYwSGpiYlczU0REUGpsM3NnQW1BbWhC?=
 =?utf-8?B?dzZLVjM0WFcxOWVGTFhzNzBLMHhNQTZKektNaWFDajg0dzhVL2EwRnhMajBC?=
 =?utf-8?B?ZFNmRnliN25OUGlGRi9NaTN0SFBQY3R4dWJlVHlOajJiNHovNHJVVkpDYTN4?=
 =?utf-8?B?SThJV01NYmtUV1F0eGQ2cXlIaEVQREh1aGlmSTNQSU54VFpXNGdhRnJIS2lj?=
 =?utf-8?B?YlI3czVTZEIxWmY1V3Y4VkdkUHZJOTBNOHRQMHROelVaR3g1N1hSRDVmakMy?=
 =?utf-8?B?MURFbDJkTDlFNEdOODRTUVVWUFFnQnljY3RNY05jck1ib093OHQ0QlpHVVNM?=
 =?utf-8?B?Yyt6aENlT2NiTnJQZmVzVWQ3RFdKTlZYN2JwMmpRYi9jY3lsUENDMlhTcEkz?=
 =?utf-8?Q?AnxWSe1cRKmnpuash1ux4KIBX?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b0ee72b-0673-4ff2-76bf-08db260478f3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 09:54:45.5253
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3JO0r1gk5L4T+DIqRb4HXq5LexO1MeyQVEysjARD9jpsdW4ipceeGjUhTk/GUF8mdYnCDvxfzPMfY5QIAW35w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7445

On 16.03.2023 10:52, Oleksii wrote:
>>>
>>> Could you please explain what is x86 section asserts?
>>
>> If you look at the bottom of x86's xen.lds.S you'll find a number of
>> assertions, among them one towards .got being empty. Some of the
>> sections checked there may indeed not be applicable on arbitrary
>> architectures, but I think .got is sufficiently universal. So I agree
>> with Andrew that it may be worthwhile making some of this generic.
> 
> I have question about 'SIZEOF(.got.plt) == 3 * 8':
> 
> #ifndef EFI
> ASSERT(!SIZEOF(.got),      ".got non-empty")
> /*
>  * At least GNU ld 2.30 and earlier fail to discard the generic part of
>  * .got.plt when no actual entries were allocated. Permit this case
> alongside
>  * the section being empty.
>  */
> ASSERT(!SIZEOF(.got.plt) || SIZEOF(.got.plt) == 3 * 8,
>        "unexpected .got.plt size")
> ASSERT(!SIZEOF(.igot.plt), ".igot.plt non-empty")
> ASSERT(!SIZEOF(.iplt),     ".iplt non-empty")
> ASSERT(!SIZEOF(.plt),      ".plt non-empty")
> ASSERT(!SIZEOF(.rela),     "leftover relocations")
> #endif
> 
> I assume that the check 'SIZEOF(.got.plt) == 3 * 8' was added to verify
> the case when no real entries in .got.plt are needed but .got.plt still
> has 3 entries.
> 
> I commented the code where got entries are produced now:
> --- a/xen/arch/riscv/riscv64/head.S
> +++ b/xen/arch/riscv/riscv64/head.S
> @@ -20,6 +20,7 @@ ENTRY(start)
>          csrc    CSR_SSTATUS, t0
>  
>          /* Clear the BSS */
> +/*
>          la      t3, __bss_start
>          la      t4, __bss_end
>  .L_clear_bss:
> @@ -30,5 +31,6 @@ ENTRY(start)
>          la     sp, cpu0_boot_stack
>          li      t0, STACK_SIZE
>          add     sp, sp, t0
> +*/
>  
>          tail    start_xen
> 
> And I can't see .got.plt with 3 entries:
>   $ riscv64-linux-gnu-objdump -x xen/xen-syms | grep -i got
> 
> What am I doing wrong? Or my understanding of the idea of the check is
> wrong?

Did you read the comment next to it as to only older binutils being
affected? I assume you use something newer than 2.30. Furthermore that
specific behavior may very well have been x86-specific in the first
place. So ...

> And I assume that add !SIZEOF(.got) and !SIZEOF(.got.plt) would be
> enough to RISC-V's xen.lds.S?

... quite likely: Yes.

Jan

