Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF376D5DAF
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 12:39:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517821.803683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pje4E-0005Xx-BH; Tue, 04 Apr 2023 10:39:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517821.803683; Tue, 04 Apr 2023 10:39:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pje4E-0005V0-7R; Tue, 04 Apr 2023 10:39:10 +0000
Received: by outflank-mailman (input) for mailman id 517821;
 Tue, 04 Apr 2023 10:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gREj=73=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1pje4D-0005Uu-HW
 for xen-devel@lists.xenproject.org; Tue, 04 Apr 2023 10:39:09 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20608.outbound.protection.outlook.com
 [2a01:111:f400:7e88::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ecc90741-d2d4-11ed-85db-49a42c6b2330;
 Tue, 04 Apr 2023 12:39:08 +0200 (CEST)
Received: from SN6PR12MB2621.namprd12.prod.outlook.com (2603:10b6:805:73::15)
 by IA0PR12MB7577.namprd12.prod.outlook.com (2603:10b6:208:43e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Tue, 4 Apr
 2023 10:39:03 +0000
Received: from SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242]) by SN6PR12MB2621.namprd12.prod.outlook.com
 ([fe80::659f:af8f:6d3e:8242%4]) with mapi id 15.20.6254.035; Tue, 4 Apr 2023
 10:39:03 +0000
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
X-Inumbo-ID: ecc90741-d2d4-11ed-85db-49a42c6b2330
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NXqgMz10bGgqY66STra7jb2YSy1QRnFJf5ND73tU/fZnwwmUK2yFwgdliZwYHi2r3uuYoohm9hfyDJPrgAyS53lkD4ApdTePlcXVn6ZpnKad2DB9XRcF9RIcH+/SgQOjalbHYaPcdLHrzsHZaJx9Go4vd8JRgU8gzKvp0yePkiJg2TacslqwblncNwAaIJCUy2PgXiC3eXjnx2m8SkD9S6W/QHk/il/dA/NVamkX7ld02fxvLMQgywx12JnYYpb1Ph11vTZ8hgUrnm3lNZMdGuH7kI/P3RWdhxk+KuOqqzonqjFQ5vAvZAoJwgTiopWtBcSiz9RS3s2ZIFYTx3ILWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mn9NBNAoabzJLeGf/m8W6pLeV0k6QC8ZkTvUpnBKvq8=;
 b=K8+yFpC4hhBR/yCCnHbIfGySPaUmXZB+ffbK9984YecKI6cOakh18kFba9oNb5VBdbhC0UyPWMKVqEaWOTvOOdyNn1TkTHwVuwMG/8l9oZmHjUiAU3f43w7FKO+BkMhemRWjQqwiupQGsZxPGgqSS6bSsJTNc28g9CzW5ic6kYyUlakEiZvcgGgssfQQAacju97bHBDbOCOyAXbBel9jLXDbaKDimZO4zqJscGR2GLI8rTwA7nRI63K6u6sJucJkHw7lm6gXrZPqKtdSvhrpgaDe3dIGIqWaPWIRSeYEI8t6BJKgmv2BV6ack67nQfBu3FBXCgp0IqD1Ss0Ci+l0Nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mn9NBNAoabzJLeGf/m8W6pLeV0k6QC8ZkTvUpnBKvq8=;
 b=S24BMfdfkUmh2aVNAg8LHimJ6vPxPQrMLehG34knLFtYSHqrahcJopoR6wFjNRivZuTZ9E3M/be60mLuTdABN3OUGSrHekzzI3kX/I9zleRuJhnWqQgKJe6G20EOHmxwge4tvBh4visCSiZia8MXCthVHBG9UFvisVhCoGBTh6U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Message-ID: <c080cabc-0d69-3c32-213b-06261b2f5899@amd.com>
Date: Tue, 4 Apr 2023 11:38:56 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [XEN v4 11/11] xen/arm: p2m: Enable support for 32bit IPA for
 ARM_32
To: Julien Grall <julien@xen.org>,
 Ayan Kumar Halder <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 Volodymyr_Babchuk@epam.com, bertrand.marquis@arm.com,
 andrew.cooper3@citrix.com, george.dunlap@citrix.com, jbeulich@suse.com,
 wl@xen.org, rahul.singh@arm.com
References: <20230321140357.24094-1-ayan.kumar.halder@amd.com>
 <20230321140357.24094-12-ayan.kumar.halder@amd.com>
 <22ce7663-e63c-a3b8-9444-8f43cc4620c4@xen.org>
From: Ayan Kumar Halder <ayankuma@amd.com>
In-Reply-To: <22ce7663-e63c-a3b8-9444-8f43cc4620c4@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0632.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:294::22) To SN6PR12MB2621.namprd12.prod.outlook.com
 (2603:10b6:805:73::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR12MB2621:EE_|IA0PR12MB7577:EE_
X-MS-Office365-Filtering-Correlation-Id: 732c742c-cc52-423b-3e5a-08db34f8cecc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	s5iY7twI3ihaBx5iJGrRFUUg06tnKNi9S18DOLoBJmBeWlP12maxb9WoorEiF/YX6zDazGgGS3S7qGQLABRqBCpQ/aBIciMYdFoxOe30FMRP4y8y6sAi/pSej5CED5URDZ/L1A4MZikkQVMrSqh34I4ylHQGVq/KP6394MAkrjSJKjLoBvmPT5H6p+r+83Z3UX4QV0fAhY1jLWKoqzpim/2ID75vgVBxX75StWCV3X2EYXkNs/+n/8UxxmRBbGCFsvcItnocakRahxRCTNf30yf/vT1Jk5kGIqCzTizhzyyUKmsHtqKQSYhhtBLPXw0pc/TJ5HbjaD+/gY5F4Kd0yQ8MIhWOQ0iT+6E6DPQ4VgdFNFdNs97tY7/I9Q7vmYGuXVNZh1a+QRGATrMgBPC0eeY40zmf4Z8WML7hstY7IMc4kAW3vFzfvQ7VqGqMF4+FvNvKKRmgaic+CvS/aAl3jz+c81F7KlzG9BYJcSRmO7eWrygZ05AKY3e1nKo78MSC+tskIJjdq1Hi5GRTXGN+4P16Ur1QvtejF4Qip8ycoOMNu5jmi1v+MJn/waQDdqeCfzZrPCpzNPHEUwcxl4De5C2suYP4r47G/iB1LBJCHRgLfZPgMYWIMyY6CleQF7NXlB3IgQSA+ryExpHl6kyCDsZcGGazcHa69c6sQqwuqgDnfP8O7bUbtiI9zL82ItW4/ctlQRvgZGbg8fIAvvOlmg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB2621.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39860400002)(346002)(136003)(366004)(396003)(451199021)(478600001)(4326008)(66476007)(66946007)(66556008)(8676002)(110136005)(316002)(8936002)(7416002)(38100700002)(41300700001)(5660300002)(53546011)(83380400001)(186003)(6666004)(26005)(6506007)(6512007)(6486002)(31696002)(36756003)(2906002)(2616005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0NEbmpZSC9Jc2N6aElsYm1FdWVWL2FaZmZManpiMDNFUmJieE9UUHkrS3dk?=
 =?utf-8?B?OXdDYjVKQklsMjAyRFJPWFZCWGpoN21jQkNJOXhURDRGakU4Zm12UnRacXBi?=
 =?utf-8?B?bEFsVTMrVy90Q21NSU1DNVV3VnZlbEluc29lY3FCcndlTms5VnAwU1lEcmtZ?=
 =?utf-8?B?UUZIWWRxRjh3T0Q3VWdHUm1BbFJkTzYzRlBnYWJGd1hyU3pncCtkVy92dkRv?=
 =?utf-8?B?WkJHNXVhSWJuQmszN2JkRllqMVNPV2JqRFk4TjZ3cmpNT1NwZ1hoNmJTb3Vp?=
 =?utf-8?B?cXpaTG03RlRObzUvVUtndHhhV0REL3hrQ0FOMk1TdERMV0JUTWxrY3o2dmcr?=
 =?utf-8?B?NmNpRUIzK2NWeXhYV3JQYTdqNE8zTDgzZy9aVkZxTmxCR3F3M3h0MVdhUUpx?=
 =?utf-8?B?ZXhhQUlDbEtGbGlLN241emJ1enJCVHlXR3RRMnJCc01Ld2VCdHV3b2Vyck1P?=
 =?utf-8?B?d0V2bFlLWEphdVlJckU4WjFGMDlJZ0xLMnA1ejczK0pKRnpaT0tDUlp1a0hK?=
 =?utf-8?B?MWFtMGFndzA0aTNZZXNocXNBRndReVM1WlJTS1pMYkdRUXBEN21NeDNCV1g4?=
 =?utf-8?B?alhNN3ZQYW94R0Z1RlhsMXByb01EZUJ1a1kxL2prUkpQTjRqeTQyRys2M25r?=
 =?utf-8?B?b2c2TzMxeG4rVjA3cWM2SGg1MEx3UlhmNjczV0xpa00wczMxb0lPTG4wZ1BQ?=
 =?utf-8?B?TGFQUHh4Q0FrS3czNFdMdUVoenIxK2U4SGMvc0RvTW9BOWQ3STdqTmhvSjkv?=
 =?utf-8?B?VHRlcHBaWWhLbTViTFFrZFhyemFtL0o4dXNVUHpIZDFWbUxnR1lyYUMvaksz?=
 =?utf-8?B?VWFWdHhWWXBqdGQwTWpoZTFlRG1QVzUzcGR1SEllZ25HbjVWYVRVNDRMRmJM?=
 =?utf-8?B?SktEb3NVY29rY0VYSXNuSk5tbWpFK0NVcjFtaG05OUFvSEpPMjJjRk5PV0ZL?=
 =?utf-8?B?VVNLWHc3MzJ1YkFUVHptQ2REN3c0TWdpV2dGTXNBcWFXT2NMWSs4Y29hSHd4?=
 =?utf-8?B?ZzB5d0hRNHVOaFViWUxNN1ZxMnhqSVZCZ2dwVG83eUZLU3p3SUdIMFYrTXVw?=
 =?utf-8?B?M3lsZ0pMRWlwYXNieGVWandOODlaby9LSUt0aUJSRDFlcDFCbFp2emVtYkpO?=
 =?utf-8?B?ckRxSTJhdDRLNWlhbFpyWGdKME84QllBZXFVM1NGWlczcmQ3OWJIZmEybXRF?=
 =?utf-8?B?M2tVRXdReG4xamxNbzNrVE14YWs5bXJKeENSUzFyZG91OHQ2ZzhVT0h0dk1t?=
 =?utf-8?B?eWt3MVdaTGdjNXFCUThVSXJDSzZ6SjVaRXcwN3hFM1pEK0xGMmJyakd4dGxW?=
 =?utf-8?B?cjF3Mk12UzVHZWNnczlFZVM2emF4V2FvM2dvajFqYzVWOEQwMFloVnFVbEUr?=
 =?utf-8?B?eS90THgvY3lVTWVYTkUvNGRxTlRzTGN0Zm1JUVZIaENVYWtSRzN5NVkzb2JB?=
 =?utf-8?B?ZVF4ZS9jSE1QY3lRdkE5dFovQ1BUcWdjRE1tNkNHRWhTdkhmRWh2dmVsOHZt?=
 =?utf-8?B?THBHdHBGaUowVmxEY0t5N25CbnVUU21aS0p2dnlMenlSbnpoSGtxVlpPNTJ4?=
 =?utf-8?B?bzNmNE0xQ09uNlJjZzF0ZEVoUUVmOEdLYzdrMnFQK2Vmd3Q3bkVKRFF1Ymxo?=
 =?utf-8?B?WUtGRHMyMGpQSnVzV2IzeTdqeDM5Wkp4Z1pFL2I0b1JqazhpMjg2Q1ozQnBK?=
 =?utf-8?B?ckg2a3ZtYkh5OGdYNG54eG8vV1pmVWFZQlcwVGZ3Q3FVaCszTlR2dTN5SVBM?=
 =?utf-8?B?NklmSjNkS2xlQW9hZUltWi9lTDR1TGNyS3Q2Yk4rVUZIeEZXdk9qQWVRdWww?=
 =?utf-8?B?SVdwalFYNlBmNlFCYmFsSG5XdVNZT0NKc09HY1dmallOeWVvM1BSNWpSNDdZ?=
 =?utf-8?B?Y01VWEh1ZG04OFhiSTBRV2tReHpFdzlEaFc4RGgzLzNVWXdUOTdxU2hkMTZG?=
 =?utf-8?B?Y3ZUaVRyWklVem44bjNxeUxneEN1eUFCcHBaU1RucS9odVJBQ3hmSWhpaS9o?=
 =?utf-8?B?TFA3Uko4bktVZ1J6VTY5d2k5R0YzU0cxa0tmcTY5ekNGRHN2Q0grWW1qd1FJ?=
 =?utf-8?B?aE54c2hSWHhPaVh5K2xlZFI0Z0VDdzZyWkRyM2pYU3NsWHZwa3hWNCs3OW5i?=
 =?utf-8?Q?dSzKblbzK0MPQ+PH+/ln/W02q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 732c742c-cc52-423b-3e5a-08db34f8cecc
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2621.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 10:39:03.0467
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psfq0utQ4sQWygfKvxwz+lEWG4o9l3qx++WR5hhIHwjSKpSZjDR0qkXl9e2thUpP8jqlGFzvQ//DsnxBomSfbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7577


On 30/03/2023 22:45, Julien Grall wrote:
> CAUTION: This message has originated from an External Source. Please 
> use proper judgment and caution when opening attachments, clicking 
> links, or responding to this email.
>
>
> Hi Ayan,

Hi Julien,

I need some clarifications.

>
> On 21/03/2023 14:03, Ayan Kumar Halder wrote:
>> The pabits, t0sz, root_order and sl0 values are the same as those for
>> ARM_64.
>
> To me this read as the line should be common. But you still duplicate it.
>
> In any case, you should justify this change with a pointer to the Arm
> Arm. Not just saying they are common.

Does the following commit message read fine ?

Refer ARM DDI 0406C.d ID040418, B3-1345,

 0.

    "Use of concatenated second-level translation tables

    A stage 2 translation with an input address range of 31-34 bits can
    start the translation either:

      *

        With a first-level lookup, accessing a first-level translation
        table with 2-16 entries.

      *

        With a second-level lookup, accessing a set of concatenated
        second-level translation tables"


Thus, for 32 bit IPA, there will be only one root level translation 
tables. This is because as the paragraph explains above,  35 bit IPA is 
the minimum required to support two root level translation tables.

The root order for 32 bit IPA will be 0. (Refer xen/arch/arm/p2m.c 
"#define P2M_ROOT_PAGES (1<<P2M_ROOT_ORDER)")

Please clarify if I misunderstood something.

- Ayan

>
>>
>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>> ---
>>
>> Changes from -
>>
>> v1 - New patch.
>>
>> v2 - 1. Added Ack.
>>
>> v3 - 1. Dropped Ack.
>> 2. Rebased the patch based on the previous change.
>>
>>   xen/arch/arm/p2m.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
>> index f34b6e6f11..20beecc6e8 100644
>> --- a/xen/arch/arm/p2m.c
>> +++ b/xen/arch/arm/p2m.c
>> @@ -2272,8 +2272,9 @@ void __init setup_virt_paging(void)
>>           unsigned int sl0;    /* Desired SL0, maximum in comment */
>>       } pa_range_info[] __initconst = {
>>   #ifdef CONFIG_ARM_32
>> -        [0] = { 40,      24/*24*/,  1,          1 },
>> -        [1] = { 0 } /* Invalid */
>> +        [0] = { 32,      32/*32*/,  0,          1 },
>
> As I pointed out in one of the previous version, the root order is
> different than ...
>
>> +        [1] = { 40,      24/*24*/, 1,          1 },
>
> ... here. Yet, you still keep P2M_ROOT_ORDER and P2M_ROOT_LEVEL
> hardcoded. Your previous patch wants to define p2M_root_order and
> p2m_root_level (lower-case intended). IOW making more code common
> between arm64 and arm32.
>
> Cheers,
>
> -- 
> Julien Grall
>

