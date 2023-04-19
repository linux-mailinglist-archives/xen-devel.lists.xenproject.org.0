Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FA86E736A
	for <lists+xen-devel@lfdr.de>; Wed, 19 Apr 2023 08:42:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.523144.812919 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1WJ-00056r-DX; Wed, 19 Apr 2023 06:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 523144.812919; Wed, 19 Apr 2023 06:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pp1WJ-00053i-Ab; Wed, 19 Apr 2023 06:42:23 +0000
Received: by outflank-mailman (input) for mailman id 523144;
 Wed, 19 Apr 2023 06:42:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8hvW=AK=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pp1WH-00053c-78
 for xen-devel@lists.xenproject.org; Wed, 19 Apr 2023 06:42:21 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2053.outbound.protection.outlook.com [40.107.7.53])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52270eea-de7d-11ed-8611-37d641c3527e;
 Wed, 19 Apr 2023 08:42:16 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8902.eurprd04.prod.outlook.com (2603:10a6:10:2e1::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Wed, 19 Apr
 2023 06:41:45 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::52b2:f58:e19:56ae%2]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 06:41:45 +0000
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
X-Inumbo-ID: 52270eea-de7d-11ed-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VUns0+5Ne1AE7iqvpLJa+UkJxlL5+Hl0Hq8AFkw4eDykHDryVF37+BODlSUCL+mv6/0FbEAtfn6n2IfAtggSLH2LVfvi6s43slXtLGU3K1L9YElia3sQVgGHwgbn8P8go2DFYeDhy9gv/pTg4li8sLCkXqu8FD+pibtkoT17mvY8A4mInzoA1J/0F25OEeEfhDvWzq++HSWnti+yy2itcZOXX7Ck5FupssiVs9oO5xly4BJxfTY6kVx6EYsg4dJ/lcDhpa3S496vCJch0bTLvmEgzVjwGicJPmjTKeiNgcNq8R0j3SP6ErKYMO0Yo9+2OD8Gw4fkvp1s7VjPARHIRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YBS5pty2ViJmqDqtH1gW6mGqVx3J7T2ZYmwft6DYzSU=;
 b=PvaoicXWprlVEuBMb+fA9uA/TVj3hjbgguVKKwEq7qeNHbqTWhUVDu80cB+DUpIV5F81bL327TKs2iIeyHv9XeVGAThKKX5qq13cFW6cn61NA2bzjc9jHnB7/dOoRYt84F0aFCtkTZ6G9kJ+V0qpJyOaU/1C7YWGGghnQoDo7SE1AEQS8qToMY5ePOqjW8woirP3Dc2JuHxi3fkiHlGN1CXDxv576ZJGRBCaDWlaLf++UWVqEIX1ZyKczHx4Ma5eeGxAZJlVmzBDSBa6O3NJPBovpHauVNK6LB8KUK03jibUzsMY+5Kca+ZS9afK5twTEQEKLbyi9oZD0FCWZEhkPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YBS5pty2ViJmqDqtH1gW6mGqVx3J7T2ZYmwft6DYzSU=;
 b=zlJYDOIXO9qN/Nhedrqz78z+3FsFiv2w/3+oFHRBW643zIEz2mzMLdI5Matdk9meQSoav0Bf5OBsKn3cdTK0OKsD0NSpn0vLiJw6oAswS1FOeiwmO59m0x8b0qXoeN/qBzlrXagO1cgm1lAQeP0BXpUCyBG3Yz5kluNxhyfQT6K3Ln0AdNuw2uW8nAanXzLMjIXwOsveHqHy7G88xQKE0TZfG4Q8dlA2LNcycntd7TfdWlDkL3ACUGloJB6EjvB9Q5+SAvlMGovHeXhKGUdXU/okZRR31AoWNgwLM2MwbPeEhtRHJwEOIOfVAfPbMIRcnGyAAmtoXXL8kh2iInmIUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b81f6d44-080a-10fa-3148-67aa23504561@suse.com>
Date: Wed, 19 Apr 2023 08:41:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v3] x86/livepatch: Fix livepatch application when CET is
 active
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20230418111032.487587-1-andrew.cooper3@citrix.com>
 <c2693ac0-4f6a-83ae-c477-75b3f05b938a@citrix.com>
 <226fba6c-aeca-d38b-7d47-07b2f8d6b403@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <226fba6c-aeca-d38b-7d47-07b2f8d6b403@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0170.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b4::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8902:EE_
X-MS-Office365-Filtering-Correlation-Id: 9907db90-7372-4638-5a4d-08db40a12435
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZieHq2A6P2xCufqIH5552eWQGLpmiwYD1y62rIGjCv19jdVv7CouX4dtuc22oROlgbEcX0L6aJKxkqJBMNzkvAK6upMxn8BQ7IWyLKQcoSBfhMm6XxHKpWttUOIS6U+7JjKONlhoc5EpCA6QHKOzB37VUxE5P2b1RcFAFS7K/aPK6/ISMGDytuM/F9PTS2dkpo6QsR7KRHdfYfAOrBv7f1O0L4JhNacUp+0gqiGUbNioLZCJmKkE9UTLBA/8lAi5cLO8Crv2tbO5PfA8PGU1FRBTXiG80SHwdhZdEAFkW5Q3u/4TafFvKHWsd0QTpMVMXKkxURP0fj5hfS6V/gG0Pj5PCo14sX8xKgmIGZzFe+uWKLLtV1WZCBitlS/lKyZb8DXD98uavJp4cVIwC4nbjt0dqt2imA3gDeOn/Vhi2aTjCp/eJsH6i0aWYXUC/2W7pTpuyc8YM9JkAn+BV8i9AlGK/cCgOr5mwPFfVohL8KxjMWyDGDGnJqEIcQTvbMEV79XgECzSfPBWm4G4TpP3jmk7MdjIraW/ALvseAgkUdBbjeR9LZjyFmuSLS7xP0J/Zg1PBH3tyX5u0wWio6XRpLMg/nuQy0C4/ZjwToLbhBEafiB5QhqTOjeokfXPSB/TYGlY9MDWHo6kFXA1BPANXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(136003)(346002)(376002)(396003)(366004)(451199021)(8936002)(38100700002)(36756003)(8676002)(2906002)(86362001)(31696002)(5660300002)(478600001)(6486002)(6666004)(54906003)(31686004)(186003)(2616005)(6506007)(53546011)(66946007)(66476007)(6512007)(26005)(316002)(6916009)(83380400001)(66556008)(41300700001)(4326008)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDh1OWRtOW9WSjhmR3p5TmwwOE5UNzlJZktvVVNOMlRFQ0xVWlBjVjQrMnZm?=
 =?utf-8?B?Y2tRN244TkdQb2dQSDV6RkhwSEkrUnNLeFZPeXUxTWorc3hkcXBkM1ZsUyta?=
 =?utf-8?B?VnNPOVJUOTkzWlk0czZOOTk1RzY1UWZEeE5FcEtTL1RaK21wMkdyWktFdUts?=
 =?utf-8?B?amJmUTJrUS93T1RuWFprM3lKaGEvQytNSWY0MFdESE9MSkZRWDdvTitSSnQx?=
 =?utf-8?B?Z2prNjZZTFg3ZFRBTzRKLzF1NC85M2MrUFBkSExQQjRjanplUURpZC92akNZ?=
 =?utf-8?B?VVd4MU9tbFhLYTNlTUl1OURHVi84TCtOQ29hSjN2NEpMWnFFaGE2N1I5Vmd1?=
 =?utf-8?B?QjlUdWhoNVlYV3hsOFBqdGJLS1Nxd0pZV2hzYXdOU0ppdm1RS1pacnZmQWpY?=
 =?utf-8?B?aXhQRTFTMGJNdUpNcEZ4amRVZDVoU21JdFA4b21vdGNQVjNZTTJlbGpkbDhu?=
 =?utf-8?B?WXhpM0hIaFhxc250RTVralAreitaNE42VmtwVjNGTEQvYVNoZEZQOEx6Sm1G?=
 =?utf-8?B?WE9sUGhubEJ4QlFYclA5MDNBQzVkZ3d6MFhGYzJsTlQ0d2F4UXhRYldzR3c3?=
 =?utf-8?B?Y0JvR1FqUHJEWnhVYjdFdzYwQ3VNS0dTMTZGNUI4UjBkRWNJL0lBeldKWUNh?=
 =?utf-8?B?aVhLeDZ5eHNWcU1mM3h5d2JQM2lIOWJaaHJSYVRlWkhsY3EzUlA4QzB3bFZY?=
 =?utf-8?B?T0F5bnNWZEY3Y3pCdk1rbUIyMEt5eDdvRVFWRlJIQ1RVM3NDUWx2WUhSMTQv?=
 =?utf-8?B?aUZWbkFDWUtNeVc1VEd4WDBpVno1MHUrMUE0Qitzamo1d3BLYmRIOFg1MUND?=
 =?utf-8?B?Mm95UldrTWJTNHRkWU90ZEpmM3NXdjNkaGRpV3BOUGVzWEpYRmZ3YVJvYzVq?=
 =?utf-8?B?M09Kc2d3VzhqQmd2Y2VJM1k3VEZYSTZNaXFlVkdkTHRpY3NCN2ppcjdCM29K?=
 =?utf-8?B?MTEweFJ6UlB1b1Vkem1pb0hoMGoxZXlWWXkyOVlFblBVWnQwVlF0a0lWRzhp?=
 =?utf-8?B?TFZIV2ptUjJYWTJmOVhlWEJnV0xTSFVTbDBLcnJDVk4rYWdCNEdBSFFFZUFh?=
 =?utf-8?B?cW9rTjlKTUsyZzBMRkFuZnlNMXB3RUJUMjhkN0VOZlFyQ2pBY1d4Wjd1dnhH?=
 =?utf-8?B?cTVxM2NPdGNtUVY2Q2psNmVLRWlMb3pjcVozOHF0NkluUVoyZ0pGbmlZeVdU?=
 =?utf-8?B?UDVDQ2NtVEFXM3Y2MytUNG9sY0IyYkRseHVjZlZNeVd0dmlpQW81VXg2WThR?=
 =?utf-8?B?N0hjWlhxSEVwUzRNQlZycGc4a3BsVEw5QWo4b0pqU2ZOWHBDdEQ0REVKK0JZ?=
 =?utf-8?B?YlVtK1M5M2x3VWxTYTNLeFYrbmVNUnNLWlpTa2RrcVA4YUZxN3p1dExFRkNY?=
 =?utf-8?B?WndFNGtQajJSblRKdWpuUk1DOWtPbmdZVW9GbVBhVUtwaHRlcnE5UW9YbmxZ?=
 =?utf-8?B?NTVqZXBMVHJhU3k0b1YrTm85b294Mk1aemo2NFNySjVabm1RbkZ2OHFieE4z?=
 =?utf-8?B?RWRuS3JqY3hkUXlJbDBBdWwzZ1F1Y0dBajk4bmZIekNCWHprNURNSHhWNHM0?=
 =?utf-8?B?eGgwS3FNNXdZWTArcHp1UG5IWTBCM2Rkem03T3M1bm5HN0JtV1NXSkpMdWlx?=
 =?utf-8?B?YVNiZ1lqMFk0ZUN6eFlmdnNnakxlSXhxV1AzOTE2SEtHMTRkd05XeExqTDJ1?=
 =?utf-8?B?K0RielpYWk5kUGhyOEtCVG9TS0VxNGk3bG9IcjFNQlJBUTFwR3RlT3prNmxh?=
 =?utf-8?B?dFZCdUVvb3lScHg3ZkV0aXVsVW5vNG53UXJUMkZrMUFvbk5lZEh2eGFvOGZm?=
 =?utf-8?B?TGtES3pjVURpczVvN1hSQkQ0ZVZpQWprSXNoSHB5T01zYW9qaTlLQXBxZjkw?=
 =?utf-8?B?UkkxTG1kVDFyWWU3TlZtMXNuNU9hWnliU0U0amhEM0hCejBXb0tXNEswVTZz?=
 =?utf-8?B?WGx0UE56clA2YVVlS24rOXJUbjBIYkJKaDJkd3ltUUxtb2l0K1c1ZkhlME5I?=
 =?utf-8?B?SktqMnBFN25kVGZiOHFIVm5tQ1ozbDdWby9oaE1NRkNHTzRhdjhNNjF2eFd3?=
 =?utf-8?B?R1JRYlY0d3pzQ293NmFncnpYYXU0a0NrekJGOEVsOHpmRmxUekROWWxZdHNV?=
 =?utf-8?Q?WkVnL2U0gB1xl3ZG+jKq9CrsI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9907db90-7372-4638-5a4d-08db40a12435
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 06:41:44.6184
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6K1E/CPv2qU5FULLFKXLM3/fUvklKW3FB4qw6NlgkorIBFMhyjaKZqe09ye889/MrZrexHSVdB+9OG2W7CGTfg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8902

On 18.04.2023 19:54, Andrew Cooper wrote:
> On 18/04/2023 6:30 pm, Andrew Cooper wrote:
>> On 18/04/2023 12:10 pm, Andrew Cooper wrote:
>>> diff --git a/xen/arch/x86/mm.c b/xen/arch/x86/mm.c
>>> index 36a07ef77eae..98529215ddec 100644
>>> @@ -5879,6 +5880,75 @@ int destroy_xen_mappings(unsigned long s, unsigned long e)
>>>      return modify_xen_mappings(s, e, _PAGE_NONE);
>>>  }
>>>  
>>> +/*
>>> + * Similar to modify_xen_mappings(), but used by the alternatives and
>>> + * livepatch in weird contexts.  All synchronization, TLB flushing, etc is the
>>> + * responsibility of the caller, and *MUST* not be introduced here.
>>> + *
>>> + * Must be limited to XEN_VIRT_{START,END}, i.e. over l2_xenmap[].
>>> + * Must be called with present flags, and over present mappings.
>>> + * Must be called on leaf page boundaries, i.e. s and e must not be in the
>>> + * middle of a superpage.
>>> + */
>>> +void init_or_livepatch modify_xen_mappings_lite(
>>> +    unsigned long s, unsigned long e, unsigned int _nf)
>>> +{
>>> +    unsigned long v = s, fm, nf;
>>> +
>>> +    /* Set of valid PTE bits which may be altered. */
>>> +#define FLAGS_MASK (_PAGE_NX|_PAGE_DIRTY|_PAGE_ACCESSED|_PAGE_RW|_PAGE_PRESENT)
>>> +    fm = put_pte_flags(FLAGS_MASK);
>>> +    nf = put_pte_flags(_nf & FLAGS_MASK);
>>> +#undef FLAGS_MASK
>>> +
>>> +    ASSERT(nf & _PAGE_PRESENT);
>>> +    ASSERT(IS_ALIGNED(s, PAGE_SIZE) && s >= XEN_VIRT_START);
>>> +    ASSERT(IS_ALIGNED(e, PAGE_SIZE) && e <= XEN_VIRT_END);
>>> +
>>> +    while ( v < e )
>>> +    {
>>> +        l2_pgentry_t *pl2e = &l2_xenmap[l2_table_offset(v)];
>>> +        l2_pgentry_t l2e = l2e_read_atomic(pl2e);
>>> +        unsigned int l2f = l2e_get_flags(l2e);
>>> +
>>> +        ASSERT(l2f & _PAGE_PRESENT);
>>> +
>>> +        if ( l2e_get_flags(l2e) & _PAGE_PSE )
>>> +        {
>>> +            ASSERT(l1_table_offset(v) == 0);
>>> +            ASSERT(e - v >= (1UL << L2_PAGETABLE_SHIFT));
>> On second thoughts, no.  This has just triggered in my final sanity
>> testing before pushing.
>>
>> Currently debugging.
> 
> (XEN) livepatch: lp: Applying 1 functions
> (XEN) *** ML (ffff82d040200000, ffff82d0403b4000, 0x163)
> (XEN)   l2t[001] SP: 000000009f4001a1->000000009f4001e3  (v
> ffff82d040200000, e ffff82d0403b4000)
> (XEN) hi_func: Hi! (called 1 times)
> (XEN) Hook executing.
> (XEN) *** ML (ffff82d040200000, ffff82d0403b4000, 0x121)
> (XEN)   l2t[001] SP: 000000009f4001e3->000000009f4001a1  (v
> ffff82d040200000, e ffff82d0403b4000)
> (XEN) livepatch: module metadata:
> 
> When Xen is using forced 2M alignment, the virtual_region entry for
> .text isn't aligned up to the end of the region.
> 
> So the final bullet point is actually wrong.  I'm going to relax it to
> say that it is the callers responsibility to make sure that bad things
> don't happen if s or e are in the middle of a superpage, because I'm not
> changing how virtual_region works to satisfy this assert.

I.e. you'll drop both assertions, not just the one added recently? Or
else what you say you'll tweak the comment to isn't going to be
consistent with code. (I ask because you say "this", not "these", which
is a little ambiguous in its meaning here.)

Jan

