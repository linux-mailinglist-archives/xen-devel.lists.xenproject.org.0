Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC1074CDE6
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jul 2023 09:05:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.560974.877204 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIkxA-0000UO-E3; Mon, 10 Jul 2023 07:05:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 560974.877204; Mon, 10 Jul 2023 07:05:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qIkxA-0000R9-Af; Mon, 10 Jul 2023 07:05:00 +0000
Received: by outflank-mailman (input) for mailman id 560974;
 Mon, 10 Jul 2023 07:04:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=72qR=C4=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1qIkx8-0000R3-Nz
 for xen-devel@lists.xenproject.org; Mon, 10 Jul 2023 07:04:58 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062c.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 137cfde8-1ef0-11ee-8611-37d641c3527e;
 Mon, 10 Jul 2023 09:04:56 +0200 (CEST)
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com (2603:10a6:20b:42f::21)
 by AM9PR04MB7601.eurprd04.prod.outlook.com (2603:10a6:20b:285::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.31; Mon, 10 Jul
 2023 07:04:53 +0000
Received: from AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e]) by AS8PR04MB8788.eurprd04.prod.outlook.com
 ([fe80::cbc0:69aa:c9a2:198e%7]) with mapi id 15.20.6565.016; Mon, 10 Jul 2023
 07:04:53 +0000
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
X-Inumbo-ID: 137cfde8-1ef0-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PofhZU5CJdCtpOFc6tt5FIL7pg45kPxY+tx21NsaVuWS2g6ebRtbDl9mfJGK+27YW2fYwXap95+0Yv+eQvA9p0Q/QomEJXcljsqxItl9PS4jZcmAbQ3Pwb8z2rMCSihmWNxvuBY/pdT5Jd+gFJ8SVABiXZ/16JpjDFy+qX6tocNFtTl9+byLB43ggOAhsqCKEvij1aekzCTc9yGYDHgsOrMfk2M/SsEzFlqKtADxzr00LVsLsWDydXzOnqnQ2Uw002T2JoguT7p/u3fzrqqvm9S9sP0crYUW8Sc6vaZWuELTQQUoLK9T/4pG8uuazpl03JQhJVB0+SikFW8hdXOE8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDs25XemFfOM1SAvRnePHIamijZCHmsmmSpXwXJ78Ms=;
 b=HCE9gPkR5xy7RkNbB1JUnDdHOTygqhHSUWm+oMrRxo+x4sS6mhkuCtaZvtu4yqZ2qnzGsKB4UZSRVHF0NOwRNx/6NBVY6fa01SPkI2Y2Fne1QFrpGaZ1GS945ZaHkz/gybOrOv+LzTmUqUDZTQq3a8aoKDTNF2zm4IFvqkmc9Bk4fM6vqictN3Bc2f6eNNAaSbCsMOpGCdCimzAsiCwRAkMPEs9Fau3gisOxBt5ivV1a+xXpNjdSfd9apIql4qqz+gYrxhqezGCJ+KZSGn1gHF6n5v778PiKiLU0jIB5L7a8U/WGu5/qcqHraiEgr7H9og0pvkIvF/mbfdHCxRn2pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDs25XemFfOM1SAvRnePHIamijZCHmsmmSpXwXJ78Ms=;
 b=pE1n9GtfcgAxvyGp4/xR+K9CAt7oFltC/WtSJiE1bls4lXLya4PNeQyNmDpulXLGQ6PlTbu0JNgM1qYZvxFPsIWzS/OMPGVGuZ87Bk0FO8nAIeB/vGP/MyqbqVT2x6+LQdoK9boEbjgt49IEPGLTmpoGViW0AwaNNqMsMBWmr00g8/McskKyPTfiHnRfBOJgK8iTvoL71ldlLDEAcQVx1ZPq7ga1EPl3SsTvD/iv0ZF8hOo2u2mqhqjTEOMeijbrKjs8xaxJrRO2z8yQ1CGFipy9U0bvKx8U/USgAO8zUaBKcJ6NlaK08jlvN8wPTV9CelgP5T4DOOaM6PVG+tNhmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <272b20f4-e45d-d0db-2dec-785e15025c64@suse.com>
Date: Mon, 10 Jul 2023 09:04:52 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 1/2] x86/mm: add API for marking only part of a MMIO
 page read only
Content-Language: en-US
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>
Cc: Paul Durrant <paul@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.dd82aca339854e90ffe12e7bc4298254a6caaf0d.1683321183.git-series.marmarek@invisiblethingslab.com>
 <def382a6481a9d1bcc106200b971cd5b0f3d19c1.1683321183.git-series.marmarek@invisiblethingslab.com>
 <f3531050-fb31-2d9e-f3dd-2d310dc7c5ec@suse.com> <ZJ9XFdGhxyKLY3fm@mail-itl>
 <3773dc6e-9d36-ba80-2a0a-bb1589c9993f@suse.com> <ZKfwsvFmwEo+gzh9@mail-itl>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZKfwsvFmwEo+gzh9@mail-itl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0181.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::17) To AS8PR04MB8788.eurprd04.prod.outlook.com
 (2603:10a6:20b:42f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8788:EE_|AM9PR04MB7601:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc12517-1cf8-4ee3-db1b-08db8113f5b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nBzohlw+SA3cHCx4C8JbIqRiGDPckle2ksU/PfeDx7rGRGkKgzCYXcWrqpbT61wCN8hKdHH/OT/+qbvpsbPIJfIaPDvJ7xyaR2+uCFUV0UkWPmGe4RN0EyWZlQr8g6OmXROOu54+9Wt84pg5rzzbYZ3wMH/zHJuw5x8azyTgpD12unNoef9OJp14JoKxDx/maBshd3c3iwFUlb3exM6SZX7dZMy4VOdCvfJUsMguxq4RXcUUcOfo7PLpXZ/osm0JNKGLg2yWrIupL0rD6Wa45Omdcf8xNFTfQmEZ1vvmEfgSYZOUdunEIxLFO76VniG2ZKkiPaUED9U5JbK3jUXCpbm/xM1Tmjzv32uA4/jb3iZYQrR0NXOJGlHBAGXLBisjgjrcw4PbAUcQWgoP384dEkJ0eHjIENa7yri7bqlQa24JSxcEBHJpIjXF8A3pvbhTj0Hepw2ZueXULrkaDiCw4igcUGEN6XMhVotE1KwRmJe2GAC+teZ18J8qUwenN0sAbCuoyPBKdR85zrJyKHvAky20o3hFHYzf0ODNm8CmDJ+2er3JtrIu7VLVb3WvOBs+uuNWjWFgoKELckFq8H2IFR54DY+oedpAARqrBzyIBXgiakwVKX7aiAJAYIJjlXmt+UI6s6Lqqr6W+VY7zlzJOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8788.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(136003)(39860400002)(396003)(451199021)(53546011)(66574015)(6506007)(186003)(26005)(86362001)(8676002)(8936002)(2616005)(31696002)(31686004)(83380400001)(5660300002)(6512007)(6486002)(41300700001)(66476007)(66556008)(66946007)(2906002)(36756003)(478600001)(54906003)(38100700002)(4326008)(6916009)(316002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDJKZ2FzZHd4U3IwNnhsbWZxMmhram1zNlBDQU1CRU1iU0FlQUhOVFNGSWNx?=
 =?utf-8?B?S2I1ZTdXbDBNZUc4ZHo5bkl0VEJWeGRIYS9hU1JlSjVOek1vOWZoMHoycS83?=
 =?utf-8?B?UjF2eTJBcHUvM3I3VjYrNllJcnEvZEk2bHk0bVJ2L1ovdlVLK09SMGFwRlc1?=
 =?utf-8?B?MkY2RjB2SE5yc1gxL0o3akxpUGtkZVNpTVQ1Z083T20zMjJ5NnRDWHQ4bTNP?=
 =?utf-8?B?YjVSdklVdUZCbWcvWHZRNkMrUnphc1B6aUNUSlE5Q1p4NWR5VWI0QnFIcEpl?=
 =?utf-8?B?TWxhdVM1bnJON0Vvd0tKdW5PYVFHS1AvVm1ic1BmRURBN0tvckxqOTdCdmZz?=
 =?utf-8?B?QUEzQjhZbS9ZK1hPbC8xY3pmZmpMby9tTWx2NTVVMXpCZ2pLL3R6Mld2cFhL?=
 =?utf-8?B?ZHRNSHFYbEFQcUI2Tk0xRVVOaTJ1YytFYVN6QVZjUDhXN1M0T1hzWGgwVnF6?=
 =?utf-8?B?dXUrMHRoM2IrR1ZTOVV4RVNGM2ZpaXBoN28zWjNDN0N2c3JGNUh0bTJOdEU3?=
 =?utf-8?B?ZlM1MlQ2WVRZU1FuUmtuMlU3VGFkNGs4RGxMWGRmdXVLU3J1WU9VeEMvY3E0?=
 =?utf-8?B?SFdPdWE0MUlYdmg4VFJRT2lpNWVObC9SUkFuVytiTWMxOEVwUXZVekpZWjNX?=
 =?utf-8?B?MGVzeXRSd3VHKzhEOTllNHFoZnYvM0FrVUZwVzhuMHVHdnBsdVA3dlcrQ1Fs?=
 =?utf-8?B?dGFXRzltbEdyTXRRWlVNc1REMTZ1bXcxK2UvUWxEamZuRlc5OTkxMVVhdGlr?=
 =?utf-8?B?ZXdTOS9pZTJSNFgwMng4eEFiNWFxTnFURmFWemNNa21wdmwwUGJ1M1Y4WUNC?=
 =?utf-8?B?cXoxMlMwSTd6Y2ZLemJlYm1nQkVJcjMxUVdxbHdXV0U1dmQ4NjVZSjVOTXRp?=
 =?utf-8?B?WjJyL1NtazZMWCtjQ2RjVjRyMWFUUHdieXdsZUJkU3RWVEoxa0sveU9mVW5K?=
 =?utf-8?B?a1paYXZTcVBldCt3T0M0UnNlQjhsL2d0N1ZoNGh1NnF2WEIzbjU5QjZLVU5R?=
 =?utf-8?B?eDJxd1N6QUQ0QURYNjVnKytFODRJTkdFanhsbzFZT1dnQkNjdzB1eURoRTRr?=
 =?utf-8?B?MC95aXhISHpvS3FGV1JmUTN1Q3RBaG1ENXBHeGJacWxYNkNEWTM5Q3dqN2VB?=
 =?utf-8?B?MjlnRXdIVmR3ZDZQYmZxNHlyTmRoWGd5TXFRbkUzS2pMM294TlF0WlZtYlF2?=
 =?utf-8?B?cDY5QlJmclhpSDdoaUI1T1QzNWlNL0kxRjJTR2xTdXJCdTNIL3lKSUxvQVhT?=
 =?utf-8?B?SHZFZlFRV2k0eEZTZ21PaFFiUC9yb2pQMDZYK2w1NGtkS1JZS2UxVlVzRURm?=
 =?utf-8?B?RDc1UlFRbVRZdExlOHJ6NCtMQWhCZU81blZUSkp3czd5TGRqaXU1R2dnaHlO?=
 =?utf-8?B?OGpxajNRbnJnZWc2Nzh0dzNEOVV3SmhvNUhBY1VpamNuam9RbFVYYnNTTGlj?=
 =?utf-8?B?cnYyQ3c5QVA5WEs3ZmFWUHp6b3pIaC9oQTc4UnlJWDA5RXRWSUt4Q2tDNWdr?=
 =?utf-8?B?M1VXUzJrKzZpUkQwYW9KaW1FekV3UE1TTlB5RUtGODZtTGhXbWZlT2NPcStN?=
 =?utf-8?B?bWtDbzFMOElCMFQ5bEM5YVZvMDhROHBqV21pQTBkRml1RDVhKzBpRVlLVGph?=
 =?utf-8?B?azNWMFk1cXBPa2JXR2VjQXZ4alhGNWEwQVNMRmVjLzdJdU5IS1Q2bmhzVWV1?=
 =?utf-8?B?dHJFVjk4Q0U4WXNQZElSQStzRXo5Z3ZFWWp3cFp3VHNlTVYrWmpLVE9mOUtj?=
 =?utf-8?B?SFFINHZWbTZ2NzdkWDEyTThTQlJmVzVJY0NOMytkWDh4cTg3eld3SmJQUy9h?=
 =?utf-8?B?YzNhNlM2TitqYjkzRHYwd3B6N2dGLzZib3hIdTFZSmZFeVozQkk2eDBidTRx?=
 =?utf-8?B?NFY1MWVrUmpPelNsaEJuRGwyV29jUmFpVVhyczZQL3JiZThtTGdvZ0xsamx0?=
 =?utf-8?B?ODlzTy9QdXdBeGI5NDZCM2ZpK0FSaFRLOWFpUU94SEl3NGtaOXgvSmVqQzdW?=
 =?utf-8?B?STduV1Q2U2RLbDl2QUFCQjBjUFhvMmZaSzhEMkltdXV1WWFvd2ljVzdFM2xO?=
 =?utf-8?B?elhBU2pVY1B3NEM2VUdyMW1mR2pEWWtLaXlvWHVLUzd3dHhEcENMRmpSLzJ1?=
 =?utf-8?Q?q1Zmp/6IPE3609y7S3rMuzvWi?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc12517-1cf8-4ee3-db1b-08db8113f5b6
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8788.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 07:04:53.1045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h6tSkQvIKLszxqABEzRYVzlpHhkwj2020oN1O7USqRzmJ2UYtoblF863vAvO1NPPrDuSl500hCosq8X5LkYdMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7601

On 07.07.2023 13:02, Marek Marczykowski-Górecki wrote:
> On Wed, Jul 05, 2023 at 10:23:53AM +0200, Jan Beulich wrote:
>> On 01.07.2023 00:28, Marek Marczykowski-Górecki wrote:
>>> On Tue, May 30, 2023 at 01:56:34PM +0200, Jan Beulich wrote:
>>>> On 05.05.2023 23:25, Marek Marczykowski-Górecki wrote:
>>>>> --- a/xen/arch/x86/hvm/hvm.c
>>>>> +++ b/xen/arch/x86/hvm/hvm.c
>>>>> @@ -1990,6 +1990,14 @@ int hvm_hap_nested_page_fault(paddr_t gpa, unsigned long gla,
>>>>>          goto out_put_gfn;
>>>>>      }
>>>>>  
>>>>> +    if ( (p2mt == p2m_mmio_direct) && npfec.write_access && npfec.present &&
>>>>> +         subpage_mmio_write_accept(mfn, gla) &&
>>>>> +         (hvm_emulate_one_mmio(mfn_x(mfn), gla) == X86EMUL_OKAY) )
>>>>> +    {
>>>>> +        rc = 1;
>>>>> +        goto out_put_gfn;
>>>>> +    }
>>>>
>>>> But npfec.write_access set doesn't mean it was a write permission
>>>> violation, does it? 
>>>
>>> Doesn't it? IIUC it means it was a write attempt, to a mapped page
>>> (npfec.present), and since we've got EPT violation, it got denied. 
>>
>> But the denial may have been for reasons other than the W bit being
>> clear, at least in principle? Abusing the bit now, even if in
>> practice there was no other possible reason on existing hardware
>> with the features we presently use, might lead to hard to locate
>> issues in case a different reason appears down the road.
> 
> Ok, so how do you propose to check if it was a write violation?
> 
> (...)

Well, that's the thing - even on VMX, where more state is provided by
hardware than is conveyed here, this can't be done reliably (afaict).
Hence any "approximation" will have its safety towards false positives
or negatives justified.

>>>> Since you mark the qwords which are to be protected, how is one to set
>>>> up safely two discontiguous ranges on the same page? I think I had
>>>> asked for v1 already why you don't do things the other way around:
>>>> Initially the entire page is protected, and then writable regions are
>>>> carved out.
>>>
>>> Because that's not how the API is used. This API is for those how want
>>> to write-protect some specific ranges (to be written exclusively by
>>> Xen). They don't need to even know what is else is on the same page.
>>> Take XHCI case as an example: it gets the range to write-protect by
>>> enumerating XHCI extended capabilities, which is a linked list. The
>>> driver gets info where XHCI console registers are.  Things before/after
>>> them on that page may not even be XHCI extended caps at all.
>>> This in fact is very similar approach to already existing
>>> mmio_ro_ranges.
>>
>> While I agree there's a similarity, multiple entities caring about the
>> same MFN isn't an expected scenario there. Whereas here you explicitly
>> add support for such.
>>
>> Furthermore you sub-divide pages covered by mmio_ro_ranges here, so
>> defaulting to "full page protected" and then carving out sub-regions
>> would be the more natural approach imo.
> 
> But then the API would be awkward to use. Instead of "mark this (smaller
> than a page) region as read-only" so Xen can use it safely, you would
> (likely) need marking _two_ regions as writable, after marking a page as
> read-only. So, either you'd need separate (3?) calls, array of ranges or
> something similar.

I understand that, and hence I'm willing to accept it provided ...

>>>> I guess I shouldn't further ask about overlapping r/o ranges and their
>>>> cleaning up. But at least a comment towards the restriction would be
>>>> nice. Perhaps even check upon registration that no part of the range
>>>> is already marked r/o.
>>>
>>> Yes, this is a good suggestion, I'll add that.
>>
>> As long as all restrictions are properly spelled out, this may be
>> sufficient. But please don't be surprised if I ask again on a
>> subsequent version.

... it's all spelled out (including the multi-subrange limitation
mentioned earlier, and left purposefully in context).

Jan

