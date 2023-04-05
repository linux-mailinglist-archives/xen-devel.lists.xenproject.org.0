Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9916D772E
	for <lists+xen-devel@lfdr.de>; Wed,  5 Apr 2023 10:45:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518328.804740 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyku-0000pw-MK; Wed, 05 Apr 2023 08:44:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518328.804740; Wed, 05 Apr 2023 08:44:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjyku-0000ng-Jd; Wed, 05 Apr 2023 08:44:36 +0000
Received: by outflank-mailman (input) for mailman id 518328;
 Wed, 05 Apr 2023 08:44:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gw2r=74=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pjykt-0000nW-KI
 for xen-devel@lists.xenproject.org; Wed, 05 Apr 2023 08:44:35 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0611.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1617d8f3-d38e-11ed-b464-930f4c7d94ae;
 Wed, 05 Apr 2023 10:44:33 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DB9PR04MB8106.eurprd04.prod.outlook.com (2603:10a6:10:24b::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Wed, 5 Apr
 2023 08:44:29 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%6]) with mapi id 15.20.6254.035; Wed, 5 Apr 2023
 08:44:28 +0000
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
X-Inumbo-ID: 1617d8f3-d38e-11ed-b464-930f4c7d94ae
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qoo4qaPbM9PoWjOzDF+6Kl9PT4V7A1jVIpKBy7iQeEH8hutvXZyTlHOs5poH4GD+OaTn4mjT/Bpe7voidQpDJpnvuk/QuqmLsqhygDYT+b94qMW25YMRsEP14mEphqNhLJWNYNY1pjl8IdFCYDN9HhohmZPyts/9hqgAkFSX6PmOoK/6dZVV5JwnTC5fEmZBHgCsH05SyrP1ghcokLwnuidxdOxkXtJKe27K3J8lswt+0zmWa0RXIIofClw38BHSwijyOuXHIxopWA53ncFjYOOv37UDq7SWrTCh6VavRvWq/OggqmyV8y0FrjerKR7x5tEP/tGACZx8g2EQJlJLUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vupqexl+OQR8xvArBtJGbcSswETVQm/vq3260uXglUI=;
 b=UV52cjepPlk2NsrSaRJo+AN2qYA2PKL+TvfHRev/I3UKhYugjx5z2NBG384EXoUXIyZ6P9Fwjpa/JSDtFaxaK5RB3rEqnGozuhDyT4wOZ/eFEvWrVCJ/DNPEZQWdzyUriSEA+r9tKueIc0gA5Ql1d6+EW5A0Jy8za3MFKGMT1IMCpiNHG2WGpYlA17MWDu/g/WPmfkq+0WRckMaFUjdLZ0iD4nX86Pdwmxq/1Yo1uWtqSLk05ogeh/DuCQMio/b4HF2imp54pC5AD9zm4g4MGTQPj+oYh2V0nje1obEbB7x/rEDiACLSVeixF7tbeFHbsN4Jra8Wh3HXszXJttr7tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vupqexl+OQR8xvArBtJGbcSswETVQm/vq3260uXglUI=;
 b=RPE6Ka82iyrqAGrDOKh/nTlMt4Weojedes/kjbONb8a9xSqGrJ+QcluHJD1RxiqNxutg3CjrEr7m/goflyoWSjvVWKjeMQlaVbXruVrCCRA3vRXXc1UrvIIoTenDWFc8s4TAMsZ+9Thp8v4vwghhSVzdomejfb12LF8ltboMXk/Rw74X6PajwKLRKpdY06byHGcohV9hgc3IcJgmrI6jK7q4SopuA5/vePjddodVErd8xPBhRyivbCgqd47wx6bB4IgxUMbWRBu/V+usnuOJfwpZ+fe8hn0njJ7wZduoqraoyuUszoSunwmoMfh/x/U6Dsv2u0T8/+5p6JIzAR9uiw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <0f997105-4601-683a-7edf-d3fe5ee5aa48@suse.com>
Date: Wed, 5 Apr 2023 10:44:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] x86/PV32: restore PAE-extended-CR3 logic
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <47ab9000-68f6-8925-d814-a3a955b7f6cc@suse.com>
 <6d64dd4a-5b25-ddca-5c07-7b4c0fc48c0c@citrix.com>
 <5f9218c1-9ee9-c5bd-af8b-003084aa66e4@suse.com>
 <78e72635-6ebc-b3b7-83d5-134d5c63d561@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <78e72635-6ebc-b3b7-83d5-134d5c63d561@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FRYP281CA0008.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::18)
 To VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DB9PR04MB8106:EE_
X-MS-Office365-Filtering-Correlation-Id: dc0cea9c-568f-42cd-2b5f-08db35b1f7c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	JBlpMTUQIuvZJuyLUhYSAH8M3MTbbr4yZJ2lV/byyiW3iJekFd8FCNRSKLItXoXyVgU4+f8ZJNn/EasSNhpLaiZP6Rs0Aj2Ht0UhOumg7tHx7gekNi8H53H3Y6kk2AuvoJaf0MAIAUaZbeWAPq6/fpTh+d2/bf9JpueJ1qmki65VJ0COXxfVf+uxAXWT08wm76njYY8ReDwTK+KvM5E3eA6ahbNV0/WO14ZJN1Xbwq6uxmB1Z/YpCAIj9f4Myi3HMjEO+sIjL76lH0yJ5o2dS2uaqiIx1WprsmFX1MzV16Ewv2go+TnoR0njN32+OqyqfAlkYVhPdmUBTNLsMtnaCVQaxWqBaQDAdpQW4qJ4gDSUhQbmM/nvGUkcqMnj4B7hwoBNRqlZXEszWMWc1oqqruYK/B/D7JFy1L3SnZW0r5/sI8kQ50TV9xEycRmKRUH277/IxJZjWVNPC/zz6q7typpP8kPy1SR94M8m9y28OVjgkB0FGhaAFSXegxHCuqIDon2jmzwjF9aq2a5vjFP9EEn/3zl53MTbDvbfqURhmYw2pJdP5QTZQXREh246GPjLhwnWX0+LNCQ15cDiIZoIuvglePz9Tib9xZEl/NADb6TTGSeHO4bC8mE469u7J1mjfMNyjpKcA5583nE2xKFwRA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(396003)(39860400002)(136003)(366004)(346002)(451199021)(8936002)(66946007)(66476007)(41300700001)(66556008)(316002)(2906002)(54906003)(478600001)(31686004)(2616005)(4326008)(186003)(8676002)(6916009)(5660300002)(6512007)(6506007)(26005)(53546011)(83380400001)(66899021)(86362001)(31696002)(6486002)(38100700002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blJqNjQ3b1RsZUJJR0dONnRZQ2MrMUdvVGlSK05ud2RKOEJuQm1mdDhMUS94?=
 =?utf-8?B?T3ZHWjNIMlJHWi80akJiN1BQZjhVVHlQUjYxWVRDS1creXRIQXVLNzUxVjht?=
 =?utf-8?B?VU16Z0Y2RlFoUUNyWjMydUJPUTFzQ2ZxcDljMkhBdk5jYzdjdTdxM1hkVkJ2?=
 =?utf-8?B?a0RoWnNsVW11dU9jL0xaTHladVRnZDFMT2ZoN3BydHVOMi9SNjdSL0NSNndk?=
 =?utf-8?B?Nk4wVUxHdFpyNkc3ckUrREhEMENIY1F5ZFZPelRGYzdGOEM4eXZjTUh2ZFJl?=
 =?utf-8?B?YW5SQm9jbDgrMURTK0I1YVRoZU43elQxUXZ3a3ZvZ2hOSHlacU5QL1lqVE80?=
 =?utf-8?B?bmE4SmhMNXpDeDVFZzdUajdDOUxVYXFjTEEyRDREVCtuZFUrNzNDOXFNZktu?=
 =?utf-8?B?M2N2dUV6bWxlRFRGQ080am1pc3RvZTZOdDlMQ2lQdmdiUVkxb21ZMlMxM2dI?=
 =?utf-8?B?bjMvY0dTTk5mdjIyTGREd2d0cmVxSHZwQ2xwNm1yYnNRVXNqSVZUQXZBUHFL?=
 =?utf-8?B?T1ZBK0t1eVJzTGg0WDB4WWZXZHhpZS9CbC9hRllwZ2Q0N0psYjVPUzM4eEpQ?=
 =?utf-8?B?a0lHTk1FaEdzWVpJK3cwZndQSDZ5RkRUTGlSYXJySEdGb29DRktvQWk4VGV1?=
 =?utf-8?B?dEdKNUd2NHFWNVhodktKWHArSURrd0dzUXZMN2taSmtyY1JkZktPRmRvZkgv?=
 =?utf-8?B?c211eFpKeDI4cWtLOHRqMi9yRnlsQ1RjRVBZU05kb3pPZ254K0dDRWNwT1lq?=
 =?utf-8?B?cTR5TTRuMFZlVkwyWkpFSWVJcWlwd1N1eXhmNTc1TEJ5ODJ5MEpYdXl2L1BX?=
 =?utf-8?B?Y1E2RnVqUWRzZGFKVENSMUFkb3cwRWl2R3dmMUl2bWtrSnBKTWROV0FNbklo?=
 =?utf-8?B?K09TaWFlN2tpZG1MMFc1VTVINTJxNTZNY3I5ZXo3alZhbWc1QmNvOVh3aVNo?=
 =?utf-8?B?MXhzeTBkcXZxTVBJYlRwTmp3NVI5VDNSWnNTdWQvbWpkZGhBWlE1MXNJVnQx?=
 =?utf-8?B?SWJjaUJOMUEyQ0lrZWhPMS9VRWZiSXVweGpFSUFOUmVLSDNmclZ5NHpxRW03?=
 =?utf-8?B?QnNMOVRFYmJkZ2Z6Y212dFBtNTVyU3VRTEhhSmJXaDEzQWtxVStReE1NQWgr?=
 =?utf-8?B?ZldickJoTmFWeTRIaGdzSU1xSkVGaTdJQkE2bnFrcEd0VTFNZ053bVo4eUVD?=
 =?utf-8?B?VTZJTUhMNDJ5dGxsWWM1SHhvTlhhV05tMDlCTWFPaDBQa21MU2tLclZyZlU5?=
 =?utf-8?B?dVZ0WVRmMXNaWjB5TS93ZjlzYXRmenZIcFFRanozVkdNaURYWUFFZTBscDJa?=
 =?utf-8?B?VThqZVVQQjBBdFBYVnZLclNmUzREejVSRTJZRG9WaEhSQ203YlhzYSt3Ri9U?=
 =?utf-8?B?cWNDVHNtN0s0YTgwR3RzNGpiSFl4ZFZqdnN1MS81djR6Zks4dXhEQXYwdWdK?=
 =?utf-8?B?NVlIZGRwRDl5YlRZdk9nOXFYVFRmOUh4UlI5NXJ1Rkp5YmRzTEoxYmZaT2c5?=
 =?utf-8?B?NStkSit1VGNFUzJBS2hycHQzSmtNRXBFbVhCNGNnNWpkYXBXT2FERDlnU3Js?=
 =?utf-8?B?c0k2cEZYOUZwZmdyYVUxWldaVFFiaUpSREkwVHo0U2c3UG01VHU3N1prdlNj?=
 =?utf-8?B?d1RJa2hnUUppcVNIVkVuN0piazU2MUsvNllNZ3hlY0pqZkd2Uzk2RVV6ckw2?=
 =?utf-8?B?NlRWbGVzUExwZmRZYkZMQmxza0dvbWc0UncvUEJqaUpjT0lSczcvV1F5aWNu?=
 =?utf-8?B?eUJIb0tTL0pUS3VhRWlUeTllc2pVTFlxdGtJVGJVVlJRaFFnWUliemg5a2pM?=
 =?utf-8?B?WjdUSzBHOVJ6ZEE3RzZpWldaNUlrU3VwNHE2b2JIOTFicmZWT0NwUHFEWXZM?=
 =?utf-8?B?amx1Qk5DdjhNa1BPUEF2Q3NNV09taXExbWZicVZpdS9TV0FVellTUkpsSGV4?=
 =?utf-8?B?QWlSRkZqd1NpajNQQThDWTcybnhOUWppN2hud1NmdW96QmpKTnZTYXV2RlR3?=
 =?utf-8?B?eTNHRVcyVjI2NWN3ZzhEY3VWOXlwRDZ2K3Y4YSszUFM5SjVuT2grbm80MStG?=
 =?utf-8?B?UjU5cHRZMS9mWnJJZENBRGw5TmY5WFk0N2M2VEY3bDVhRnp3Q3pPOEUxRmd4?=
 =?utf-8?Q?1i4sGD69ySDkomvUyND4i2xxG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc0cea9c-568f-42cd-2b5f-08db35b1f7c7
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 08:44:28.7200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xTsq/miP+jpQM4NEiJaIaO+6aNs6nHB0kONzJHc+Nnqk69shIcmpoHTNGLBtpv1uwGN1lwtg1BvT+NUXh2K4Wg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8106

On 04.04.2023 22:40, Andrew Cooper wrote:
> On 04/04/2023 3:21 pm, Jan Beulich wrote:
>> On 04.04.2023 15:08, Andrew Cooper wrote:
>>> On 15/02/2023 2:54 pm, Jan Beulich wrote:
>>>> While the PAE-extended-CR3 VM assist is a 32-bit only concept, it still
>>>> applies to guests also when run on a 64-bit hypervisor:
>>> Is this really true?  Even when looking at Xen 4.2, 32bit guests are
>>> required to pass a full 4k page, not a 32b quad.
>> The full-page vs 32b-quad aspect is orthogonal. This VM-assist is solely
>> about where that data structure is, not what size it is.
>>
>>> Which makes complete sense.  It was a hard requirement of 32bit non-PAE
>>> guests, so it was a natural restriction to maintain into 32bit PAE guests.
>>>
>>> This is *only* a 32-on-64 issue, because this is the only case a 32bit
>>> guest could in principle use an L3 placed above the 4G boundary.
>> Not exactly. 32-bit Xen maintained a 4-entry "shadow" array below 4G
>> that it would copy (massage) the guest entries into upon CR3 reload
>> (just look for struct pae_l3_cache in the old sources). So above-4G
>> page table base was possible there as well.
> 
> Oh eww, so while Xen never gained an optimisation to permit only a 32b
> quad in place of a full 4k L3 table, it did support having the full
> tables higher.
> 
> (This code is especially hard to follow with #ifdefary in the common
> mm.c when there are perfectly good x86_{32,64}/mm.c's to use for
> differing function implementations...)

Except that the #ifdef-ary was wrong, and should have been suitable if()
instead. Those having been #ifdef was why the respective code got
removed in the course of purging 32-bit Xen logic.

>>>> --- a/xen/arch/x86/mm.c
>>>> +++ b/xen/arch/x86/mm.c
>>>> @@ -1520,6 +1520,23 @@ static int promote_l3_table(struct page_
>>>>      unsigned int   partial_flags = page->partial_flags;
>>>>      l3_pgentry_t   l3e = l3e_empty();
>>>>  
>>>> +    /*
>>>> +     * PAE pgdirs above 4GB are unacceptable if a 32-bit guest does not
>>>> +     * understand the weird 'extended cr3' format for dealing with high-order
>>>> +     * address bits. We cut some slack for control tools (before vcpu0 is
>>>> +     * initialised).
>>>> +     */
>>>> +    if ( is_pv_32bit_domain(d) &&
>>>> +         unlikely(!VM_ASSIST(d, pae_extended_cr3)) &&
>>>> +         mfn_x(l3mfn) >= 0x100000 &&
>>>> +         d->vcpu[0] && d->vcpu[0]->is_initialised )
>>>> +    {
>>>> +        gdprintk(XENLOG_WARNING,
>>>> +                 "PAE pgd must be below 4GB (%#lx >= 0x100000)",
>>>> +                 mfn_x(l3mfn));
>>>> +        return -ERANGE;
>>>> +    }
>>> Having dug through source history, I see this is largely the form that
>>> it used to be.
>>>
>>> But I'm unconvinced by the "cut control tools some slack".  I'm quite
>>> tired of different bits of Xen taking on unnecessary complexity because
>>> people are unwilling to fix the problem at the correct layer.
>> But anything tools do before having created the first vCPU would not
>> have had any means to engage the VM-assist. I.e. ...
>>
>>> A toolstack which has non-pae_extended_cr3 guest on its hand will know
>>> this before any pagetables get allocated.
>> ... this knowledge buys it nothing: It would need to move the table
>> to below 4G irrespective of knowing that the guest can deal with
>> bigger addresses, just to get past this check.
> 
> This just goes from bad to worse.  It is mad that the VMASSIST flags
> can't be set ahead of a vcpu initialise hypercall.
> 
> But.
> 
> The code in xg_dom_x86.c unconditionally moves the L3 below the 4G
> boundary, so the thing actually pinned as an L3 will always pass the check.

Where do you see this being dome unconditionally? I only see this inside
a check of dom->parms->pae being XEN_PAE_YES.

> Which is just as well because it too blindly applies the extended-cr3
> transform momentarily after conditionally setting
> VMASST_TYPE_pae_extended_cr3...

Doing this "blindly" is (kind of) fine, isn't it? The transformation is
an identity one when extended-CR3 isn't in use.

> So a 32bit PV guests will pass the check irrespective of their
> pae_extended_cr3 setting.

As per above - I question this: dom->parms->pae isn't a simple boolean
(see enum xen_pae_type in libelf.h, and as can also be seen from the
condition around the enabling of the VM assist).

>>> For this check specifically, I'd suggest prohibiting non-32p guests from
>>> setting pae_extended_cr3 in the first place (I see no limit currently),
>>> and then simplifying the check to just
>>>
>>> if ( unlikely(!VM_ASSIST(d, pae_extended_cr3)) &&
>>>      mfn_x(l3mfn) >= PFN_DOWN(GB(4)) )
>> Dropping the is_pv_32bit_domain() check isn't possible because we can't,
>> all of the sudden, fail 64-bit guests' requests to enable this VM-
>> assist (no matter that we know that it is of no use to them).
> 
> I'm not so sure about this.  This VMASSIST cannot credibly be set at
> runtime,

Why not? A kernel may statically say XEN_PAE_YES, resulting in its
initial L3 to be relocated to below 4G, and then - before any further
page table creation - enable the assist.

> and making a restriction here is not usefully different from
> prior patches of yours that relax checks in Xen that still break on
> older builds.

How's this not "usefully different"? I replace potentially silent
misbehavior by the failing of a hypercall (which ought to be noticed)
plus a (debug build only) log message.

> But as I know you're going to argue with that position, I'll at least
> note that ignoring a 64bit guest's request to set that bit would be less
> bad than the current behaviour.

We already ignore this bit (as in: it has no effect). Yet just like we
can't fail the request all of the sudden, we also can't zap the bit
from the supplied mask, as kernels may legitimately check that what
they read is what they set. (That said - I'm unaware of such checking
anywhere.)

Jan

>> Dropping
>> the control-tools part of the condition is at least problematic as well,
>> as per above. Albeit I'll admit I didn't check whether nowadays vCPU 0
>> is initialized before page tables are built. But I think it's more
>> sensible the other way around: CR3 setting (in the hypervisor) is less
>> involved when the page was already validated as an L3 one.
> 
> All of this is before the guest starts running, so it doesn't matter.
> 
> The most efficient way (from Xen's point of view) is to pin the L1s,
> then L2s, then L3s and then set vCR3, because this is the only order
> where we don't have to do do recursive type acquisition.
> 
> But, the most efficient way for the toolstack to do this is the opposite
> way around, because making Xen do recursive type acquisition is faster
> than other ways, and turns all subsequent hypercalls into almost no-ops.
> 
> I doubt there is a relevant difference between these two approaches.
> 
> 
> And it doesn't matter either.  The check won't ever trip from domain
> creation (see above), nor from migration (we set vcpu context before
> pinning the pagetables, and a non pae_extended_cr3 will have exploded on
> the source side).
> 
> So there really are no toolstack codepaths that can trip the check. 
> Future improvements that might trip the check can come with a less
> broken hypercall as a prerequisite.
> 
> ~Andrew


