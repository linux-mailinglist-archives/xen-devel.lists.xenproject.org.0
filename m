Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 778296524F5
	for <lists+xen-devel@lfdr.de>; Tue, 20 Dec 2022 17:51:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.467223.726254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7fpG-0005X7-10; Tue, 20 Dec 2022 16:50:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 467223.726254; Tue, 20 Dec 2022 16:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p7fpF-0005Tx-UT; Tue, 20 Dec 2022 16:50:45 +0000
Received: by outflank-mailman (input) for mailman id 467223;
 Tue, 20 Dec 2022 16:50:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I7dU=4S=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1p7fpE-0005Tr-23
 for xen-devel@lists.xenproject.org; Tue, 20 Dec 2022 16:50:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on2058.outbound.protection.outlook.com [40.107.8.58])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 70e9b6dc-8086-11ed-8fd4-01056ac49cbb;
 Tue, 20 Dec 2022 17:50:43 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS8PR04MB7847.eurprd04.prod.outlook.com (2603:10a6:20b:2ad::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Tue, 20 Dec
 2022 16:50:41 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5924.016; Tue, 20 Dec 2022
 16:50:40 +0000
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
X-Inumbo-ID: 70e9b6dc-8086-11ed-8fd4-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R8ufIft4oCT4TAAeCV/zE8/tuLtG/Jhp4ZhwNXi+jH2cgMw9816Cow9p8/MkmeKht6eac1LWGxInzK6wSDDSaPx6gq80avNXSGxMofoLHR+ejJlWDTsFPaXyuJ6EaZAsh6Ch3ExPA0B5y8BJGrqzlhHcXDOiBi6arvjf/Ec316yYaHzOMcAfiR+K8MVb1THun3OFMQ1rBWowBf160P0uzmxst3aNCw/FU6A2eH6bmbt04UdV3zKrfkdmx255at1hAS6h8wWSWOg8NiNQp+VCYTmL26TlECtqjgarr/xnsb6toX9Xy74vtVd/ZiDVmAdfk+oZ/iosCZRo9lrLZEOn+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HvOMKy1skOyfqQYTpY/2QYPpiVZWEFMf2SK2o0Rz3EQ=;
 b=DakeLD8OmSEpoWYgr5fU5glkXR4NeEixO88z+DasvrhVsn6QuMl3+fz8NZ6HiP19A59kpXoEpV/dHn2HE32/KJkTOZBfwBzmTpEr+w/4JuLOVW6FjcYl1iz5/rdFvsaMxo4GWIDvCE1zHDWaaNb9HkRX5pWsi7gGWAf7SjMypgPYqs5QewPbJQ5SNuGdhWBotPV9i1PO0134CBwe62lYlcL3lOXKO2qvaUDYTIj5DRjGNy4xVWb2hocTeND5JROz4S7/r85z2d8NMnpzzh1wE8usFZli65/Kjz0k1FVWvNLtlsiwPfqgXFWcW+FUrjVtSrBzh7TxK5LHrDpHDKXAvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HvOMKy1skOyfqQYTpY/2QYPpiVZWEFMf2SK2o0Rz3EQ=;
 b=3GezgeszY1fhSfb61vOMTXZRdRXjsJhwYSR36sK1uL2qv9NTMBfpQLb1Yw8IgdAumtlmS45OIuHziZ+FHLhCIcNgtIsaKhFKL22FDCw9bSzhI3zTazv9GAhwBEikeFKWlkdJ5IbftqeiHJK7igJ1k0Z5kQ7f+tjxA75PopGQkhwWlCrDXQGp4hzLEYA9vyo6vKSDRRDh/Q37WPXP3F6wAfuOPgnz9LGSzErxh+cZM/yEebfWnLUXWAxUg5Wh2YMWtN8oIrtX0vGRZpm4+p7/q/ux2GQ4n6PKlcoV0oF/oLgaeny/PZvvTf/lL28z+DaAKBgDkjS+AtpG5jZaiVxadA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <957791bc-2c4f-2730-5667-ba168885f670@suse.com>
Date: Tue, 20 Dec 2022 17:50:39 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 11/10] hvmloader: use memory type constants
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Demi Marie Obenour <demi@invisiblethingslab.com>,
 xen-devel@lists.xenproject.org
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <24461a6b-b118-aad9-6407-d215d07a2924@suse.com>
 <07db6af0-c5d9-56a8-0536-60d850915de2@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <07db6af0-c5d9-56a8-0536-60d850915de2@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0017.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS8PR04MB7847:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ab8c5d8-8e59-4f3e-e23c-08dae2aa53f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PRX3OrPKP9HmUR/zwo3oj9GN7LtLPaHzPWin93n17xZLfkHIn6vvcGmBi01d69tKouTgR4vQu2GFMcZBOKl1fZJqfHGer5IPxff8k+mLpMlwLX+RXhBu0KtNWLR5eZ23ZnQ1RJwi8Xj6BMxfWamEJdcb6EOYbVZRB2kjyjNGZMs21vZoj7JRnhKFS14MIAu1ZXX6tpyiJpjdy3V8slZ7gxpbl5N+DTW4qoQmCTPuDl7CDmK7aSdwjAvqOvPceC4O4YnjysI3zxGlV0rn9iJm0JAG5dI3aUfMT1ThD2P3S2qp6QPE2E6mvGMu94VEvH94ntmQldD/iqZd01TRsLA5SBKwyphpUnrWZFOkkUupffjKY873CUD1oPq++Rj9UhGuZScqCOaRmxQnnvyHk1daZHlFw3t3F7Q8tiM7B2xFQIR6QhWKkyNMDfzCmZUlcjTzQy4O9VXHKbgStbNVUg8vNm7FIuuOPMsj8vQdmVZ6bGJZ+enQQiNjA2XljuakvUc36D0UmeqdK9vB3TU08C6iLra+qnR4JsAI28QsBjPE187Px80P7ZH7/HIK7jMTlHeNvx2onVvyef/UXO9ya91S+Vb/t47uIDW43ZyTVvmHoNIJVeLxfzgVr0HcoApXT9gfUGlj4uzvRm5xkdkK1E2khR8XEdrQIoxxjbxLKQDp0ILTLqR1m3E6MwKDfNRcKwgtGSg1Wc9FzOvZwnEJcB0FThKBSDgBrFKLdtuvO3d9HuI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199015)(2616005)(31686004)(86362001)(38100700002)(26005)(6512007)(2906002)(6506007)(186003)(36756003)(478600001)(6486002)(6916009)(8936002)(316002)(54906003)(53546011)(66556008)(31696002)(66476007)(66946007)(4326008)(41300700001)(83380400001)(5660300002)(8676002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dCtFVS9IaS9BZ3hmcUFlbW50UkozbFZpZlJkRjJrQnR6RTM0V3hSZEM4aXp6?=
 =?utf-8?B?OThRdVJIeDc2UWlOeE00V2FqY2ZVVWlTMDJab0czdFc1QXJkZ2FQQ1RPYkNH?=
 =?utf-8?B?OXZyQXh5VTJyS3NEdUhhZEZaemE2VFhFRWZjaVdRRU5wQXpmaDlHSTJZOEQy?=
 =?utf-8?B?REFRYldkaWMrcTYrTlJzUEJjL2FHOS9TZmx6eG5INHVkMmZNY3pVNEdGd094?=
 =?utf-8?B?bmhmT3BHSEFUbWtBZXVVRTIySmVaK2E1TU5EUGhLOVY0dzdtcjVURDJjTGNs?=
 =?utf-8?B?ME4rN3huYmN1WXUzOXU3WGxQSjJOdzZrK2RGdU9HN3h0Y3BSd1RzQXVNV0dS?=
 =?utf-8?B?QytCcTkvaEhobFFHVldNRU5HTmZBODc0aHpuQUJtZEErdFdmVEZHdDNlZkww?=
 =?utf-8?B?L2tjam92RUVrbkZHd3A4N29hNDRWMmtNK3l5RXhIc3RlZTlUQXRPclpaTzY1?=
 =?utf-8?B?cTkva1VpbUI1b0JFa3VCUGhXTXpER1N2NDgyZGxBUGNmRUxuMXFnWWU0UWtk?=
 =?utf-8?B?VG1IUGtwTW9SNlIzS3FMN0FwQmR1NmFJTmh2aFduNFBYSjJML2d4cnVrV3pF?=
 =?utf-8?B?djY5cnRHd2ZENFp0MUlRU2VmeU9ZL3hkOXFFdW9jZW9GNDdXQlhWUW02dmZz?=
 =?utf-8?B?SjcxZjBFaEdaUzZZZ3FmRnUvUWtYeitMRWxrZVhzbG13RzdZRy9hNUNXS1FI?=
 =?utf-8?B?QklyVGtoYTdqVk1XeFduaWtyTEFsd1c0QTV4OG9mV2xMK0c0YkVZSDkrTlY0?=
 =?utf-8?B?WjJTZ3hGYTRidStLQWh6MTFRSVJTTlVTQ1I5cTE1akhZbVlHdUZja0Voc240?=
 =?utf-8?B?bmVSOGFJTEpVTUZnb3luMVhwY1lGa0VtK1MzUXdKb01ISzU1T2UxWDltb29N?=
 =?utf-8?B?OXdhOCtqVXp6YUFkNW5DM0lDL1BtUkFzQWdzTmtEblhxMmRhZmRFZjB6TWpu?=
 =?utf-8?B?bEkyLzc2cnppdHBGUFdIY3RsYUlFcmJmTzhVQ0p3QVdXZEpaUWprV1RoNGNx?=
 =?utf-8?B?dTh6Z1J4Und3ODg4SEtVRVk4U0d5eUoxTTBVR3I2ZktYaXJmRnI4SEhTdkRa?=
 =?utf-8?B?d0JLcDVacXFoZ3ZkcGdIVXJtQ2FMb2RmTk1zVjBWWitldkM4YmlVcnA5QzZ3?=
 =?utf-8?B?eGhBd2hoa0FoVDJkQ0pwMTFzSjBvZTBnbzBMekxqYURUMmpVV21Vb28yWm1r?=
 =?utf-8?B?SS82Q2dPZDl0b2ZXeFViSUd3TE53TEYxYXYvdDEzSkVySitpeU1PQjV1RDRz?=
 =?utf-8?B?dWpXVm9UVVFRbmpxTld1aVJ6ZzlkbnJacUY0UGw5ZHRWdkFwd1RaR0V6ZDNL?=
 =?utf-8?B?OStLMlRqZU1oM3VsVk5KK0ZMcFhlNGt2L254ZWI0U2JrdlBvY1hnMWh4amVJ?=
 =?utf-8?B?enFBTDZhcGJFUTgxSVA3K0xEYWF3T2U5VTdIZC9kakh6UE9XOVAvRXRVYjFE?=
 =?utf-8?B?VnRXdGw0R0hXbWxpTlc4NmdXZDNTcHRqbzlON09LQ0FFNmlHYXpSQ2s5cFdj?=
 =?utf-8?B?ZkxURzJ4bnBCazIxb3JDUm1SY1VyRWlDVHROOUNFcGUwZTVYdnF4dVZwQjZX?=
 =?utf-8?B?WDV1MVRIbEg5UktjMnZCZHlvVVNybVcwTnMwWUVKbnc0T2xDQUNicnA3bCtS?=
 =?utf-8?B?Qi9yWSttaDZCbVN3cjdlZnJ3OFRzbldVTDNSQTRWYjl0U0RIcDJIWG92RGQx?=
 =?utf-8?B?UGFNTlY1YUtLa2RrbmZ0c0hoWmJPVWtFRHQ2QlFoYXl1dUFtNGV0M1lKMEZW?=
 =?utf-8?B?Y2ZEWURpV21xeEd0c2hmQjU4ZDVNQm5WVTU4K1AzY1hITUFZYlAxVTdFbW1O?=
 =?utf-8?B?VEN3Nlo4UUlKcFQ3WnR2WFhYakxDYU9mT25WY2pnS0p5UTF6UmhBbzFDRC9B?=
 =?utf-8?B?dXYyZnZWOU1rR3RPRW0rOEhpdkVsUHpna205ZGdpVzY2cENLM0tpa0lQYnox?=
 =?utf-8?B?RGlBMVZBUXlTMkZmcUhOZStRZjJNZ3pqdDlENkhkQzFTMFdZSzdwWU9wcXNo?=
 =?utf-8?B?K1dEYXR2THBwTkFKejBXT1ZtdUUycmY3TWJ0KzVib3pJK2RIYmRmVXFzNlhV?=
 =?utf-8?B?dUl5d0dBQ3FiNFNzUHU0a2tFb1Qwc09zeXNyTkJaWHpLZDlZZ2xYK29rTmpU?=
 =?utf-8?Q?PNU3iQ8ZMFttufYzyw9/fyseO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ab8c5d8-8e59-4f3e-e23c-08dae2aa53f4
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2022 16:50:40.8940
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K6YD7at2COW7ZaHH8GJvHokNDWZr9FxnrzWVw3l3AwudbKpVYMkb9gSFtM4xTXoyhJ6zhEVuqkcQW1eAAc6Q0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7847

On 20.12.2022 17:36, Andrew Cooper wrote:
> On 20/12/2022 4:13 pm, Jan Beulich wrote:
>> --- a/tools/firmware/hvmloader/cacheattr.c
>> +++ b/tools/firmware/hvmloader/cacheattr.c
>> @@ -22,6 +22,8 @@
>>  #include "util.h"
>>  #include "config.h"
>>  
>> +#include <xen/asm/x86-defns.h>
>> +
>>  #define MSR_MTRRphysBase(reg) (0x200 + 2 * (reg))
>>  #define MSR_MTRRphysMask(reg) (0x200 + 2 * (reg) + 1)
>>  #define MSR_MTRRcap          0x00fe
>> @@ -71,23 +73,32 @@ void cacheattr_init(void)
>>  
>>      addr_mask = ((1ull << phys_bits) - 1) & ~((1ull << 12) - 1);
> 
> Does this want to be PAGE_SHIFT ?

Not really (it's rather an MTRR layout related constant which we ought
to use here, which only happens to match PAGE_{SIZE,SHIFT}) and not in
this patch (see the title).

>>      mtrr_cap = rdmsr(MSR_MTRRcap);
>> -    mtrr_def = (1u << 11) | 6; /* E, default type WB */
>> +    mtrr_def = (1u << 11) | X86_MT_WB; /* E, default type WB */
>>  
>>      /* Fixed-range MTRRs supported? */
>>      if ( mtrr_cap & (1u << 8) )
>>      {
>> +#define BCST2(mt) ((mt) | ((mt) << 8))
>> +#define BCST4(mt) (BCST2(mt) | (BCST2(mt) << 16))
>> +#define BCST8(mt) (BCST4(mt) | ((uint64_t)BCST4(mt) << 32))
> 
> IMO this is clearer as
> 
> #define BCST8(mt) ((mt) * 0x0101010101010101ULL)
> 
> which saves several macros.

Ah, yes, will switch (and then name the thing just BCST()).

>>          /* 0x00000-0x9ffff: Write Back (WB) */
>> -        content = 0x0606060606060606ull;
>> +        content = BCST8(X86_MT_WB);
>>          wrmsr(MSR_MTRRfix64K_00000, content);
>>          wrmsr(MSR_MTRRfix16K_80000, content);
>> +
>>          /* 0xa0000-0xbffff: Write Combining (WC) */
>>          if ( mtrr_cap & (1u << 10) ) /* WC supported? */
>> -            content = 0x0101010101010101ull;
>> +            content = BCST8(X86_MT_WC);
>>          wrmsr(MSR_MTRRfix16K_A0000, content);
> 
> This looks like it's latently buggy.  We'll end up with WB if WC isn't
> supported, when it ought to be UC.
> 
> I suppose it doesn't actually matter because if there is a VGA region
> there, it will actually be holes in the P2M and trap for emulation.
> 
> Also, Xen being 64-bit, WC is always available.

Right, but we (or the admin) may elect to not surface availability to
the guest.

>> @@ -106,7 +117,7 @@ void cacheattr_init(void)
>>              while ( ((base + size) < base) || ((base + size) > pci_mem_end) )
>>                  size >>= 1;
>>  
>> -            wrmsr(MSR_MTRRphysBase(i), base);
>> +            wrmsr(MSR_MTRRphysBase(i), base | X86_MT_UC);
>>              wrmsr(MSR_MTRRphysMask(i), (~(size - 1) & addr_mask) | (1u << 11));
> 
> If you're re-spinning for page_size or the macros, any chance of also
> gaining some constants for E/FE to avoid these naked shifts?

Again, yes in principle, but not in this patch. This requires shuffling
more stuff into x86-defns.h first.

Jan

