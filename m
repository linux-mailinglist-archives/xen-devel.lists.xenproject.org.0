Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04495324454
	for <lists+xen-devel@lfdr.de>; Wed, 24 Feb 2021 20:05:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.89484.168596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEzSa-00046W-3d; Wed, 24 Feb 2021 19:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 89484.168596; Wed, 24 Feb 2021 19:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lEzSZ-000466-WD; Wed, 24 Feb 2021 19:04:32 +0000
Received: by outflank-mailman (input) for mailman id 89484;
 Wed, 24 Feb 2021 19:04:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mT50=H2=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lEzSY-000461-MA
 for xen-devel@lists.xenproject.org; Wed, 24 Feb 2021 19:04:30 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d27e5efc-513b-423a-bde3-c520946b2cfc;
 Wed, 24 Feb 2021 19:04:29 +0000 (UTC)
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
X-Inumbo-ID: d27e5efc-513b-423a-bde3-c520946b2cfc
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1614193469;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=uXEUfonQ+vvfFh715vKTHwnatQmAstNt3V2Mpb+O8uw=;
  b=c9mSTp8Lp46QZLtG1HgbtHAw1h14YuhTbTLg7mx7Wkjh/lIc3V2nhmV2
   dGDyd6C+iwNor2bXzrmeMywzpc8IzBHYuODVS0ccWxdeqz2qK1iKwSTyb
   Omjypn6JEdalCYRCWUEJ/FL729g2p9m1RlJmUPvb4f+sDSY8t1K857nSU
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: xLylNo1rfKRRGvIiFgG6mAtzCUGpPlTFerFdRTdbOHusavtsDwkEooBbklIIBbBznC/GbNUpPc
 20///Z3eja9/CuhA5Wj4gHGevn/QJztixP5MYTVz/lUGQD+vA83K+a/fZjVn83HQCZIhMbv0YH
 Nxn2lAN3GeCf/pjS383/ERzS4AJANBSN7fG/sCg+b1sBwIaQVwW03u5D3LWsrIVe42y2b0T0lz
 RhanjGyyg24Jnpp5TXJ+oNDQf4mYXPqK1EqzqpTZ7TwpTLq5hEfHM0mEYSsF+Zg8mIK2zR3ICy
 568=
X-SBRS: 5.2
X-MesageID: 38147358
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.81,203,1610427600"; 
   d="scan'208";a="38147358"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fB3bwUapHfEHx1Sus/NHHhu/UiHMe0n1WpdFfeFnyys8PPb/dalEPO32lZ5Kc0pSV6oEOIbF4c6hLLgwwOL8DoCjCDa8+KY+FP+bxye/7KBeLVj4oZHXrsU2+Bfx1dHoXnKi+FMNOawn0XHbdd3mlce1JST4OLj//iAqbNZluuNpooFbFux4TNNqCpsOwKesZNg+MWYfOLrAg1yNGZQdfi+Bqssl9801nl2xYJ9tSfGIzKkS8XKhK0D/O35UXZtAt5A0PfYHEmiFkvRWkr7uFkye5yV1JiBqgYDtd6GA2XhMm6TGHA/je4BvT+3bRctLPZWwbTNX/Zr9fvpd/OGcGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+S08kt1XYIigAJjpZxrc427W49akKuhZHOZEMUi8LqY=;
 b=WmRxcy9JEnSbtfVmioayV+pxMYdPciotw6UfXriBjN0D7BRfHSHFihpEMHPn9mbn+w0mbpTvXcsO5hHOnAZvO3YQLsabelEQMQlB4/XlKWoVRzzMRn6NgrQ1PsuySTppCNtSIFP9S00AvVQe/H2G4T8kIhqsl0PAwlikptlgBWqbs8dxJgJIjtk0cehRw7jAYR+WidHUouvjKfvpn6u5oC0dJ5z7vold2jpDfvZYMOX1uXUG75PF2wojsr2/bGP/5aKXOt2OFQeEbW90geNQlQqMYO8DI7BMqKrbWZKGYb7M+YmX53Lirp8nZTPSqQuTlWWoruk1bU7qBj5NeNtd4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+S08kt1XYIigAJjpZxrc427W49akKuhZHOZEMUi8LqY=;
 b=eoz+8PzWDYMYRb/p/s0ydDRHeimEPcPhFL/wJW8XRr8AtRYPIE8R8QJ1oXNA/d7gMeFOYX5riikwJ8ojcF5bjZPKruYVU6EjpbsUfmTGjeTLzv9cmv2Y2Wy28S55F3L6Uk/EINS+TkJKjV2+ehzOUzjcaByrdEWD1S98aVogH8o=
Subject: Re: [PATCH][4.15] x86: mirror compat argument translation area for
 32-bit PV
To: Jan Beulich <jbeulich@suse.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
	<roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <bdedf018-b6c4-d0da-fb4b-8cf2d048c3b1@suse.com>
 <9eade40b-bd95-b850-2dec-f7def66c3c7b@citrix.com>
 <77a36366-9157-c3d3-b1f0-211f4fc39a93@suse.com>
 <60a31ec8-6844-2149-1a04-7e757d1d2dd3@citrix.com>
 <42c86cc7-c417-6089-4e44-90a96ebaede1@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <589cb7c9-4538-5018-85e1-6698c815477c@citrix.com>
Date: Wed, 24 Feb 2021 19:04:17 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <42c86cc7-c417-6089-4e44-90a96ebaede1@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0224.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9066505-cab3-4322-6196-08d8d8f7002d
X-MS-TrafficTypeDiagnostic: BYAPR03MB4869:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB486933A99DAA9210418CDB61BA9F9@BYAPR03MB4869.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBAc9LqRhyscGqiqTl0mAmAZDGBG0UzZgNXw+2OGEC6ujZ5hbTp6O42yMcBMfU9iaKFcLTvsvqzzNDyFrYu8/WETNIb83gLd8929w190YuuguTbkyf5cXfWRggTNLoLYkvpeRxpfmEf7iSEIctI1EcDyFJGofCLY42SIYICv7f8LxBXGczpQek1ViYGdIn6JRI7hg+sSDJ223v/+Fr9XDXdRXHlFFXTsrn+9dugcNzGWCutRXs4cPD4AAIhzRL0DjV3uVj+LanrbgxhT89/KTY1/171SdErSdj09DB6z1iJmSXeNV5GzzA9ulz2nE8lumZZQ5HiejfGgJBNNxrJuhgbSwN72SNtD70pSNSd4A6jA+lWkXFimeL5RTc3+anD4KcbnUKGW4nvcuapoVPDXxHMPL3kzamRxnoV25Dbr6i1Tn1lAa+hNC20OJJo7QjD35Ek+6F+o9nYywSn+DQ7sepKjBVNZjoK88nh4kJOT6marU9aosmQiJ1qMv6+LJum2IPu3HWn0+PxdPwtrUkrJ9Rlx4HiLUS+OKC8jZmXsm/IRibBak/9q5QJxrkQLfdWonkranbL7zRM+8sNLSCR1SuoTi8vVfC1n13hntes33MM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(83380400001)(478600001)(54906003)(31686004)(6916009)(5660300002)(6666004)(956004)(2616005)(36756003)(2906002)(316002)(16576012)(26005)(66476007)(31696002)(186003)(16526019)(8676002)(66556008)(66946007)(86362001)(6486002)(53546011)(8936002)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?MGRVQUVLTkNvYVN5czJIYkZGbVVtMjFLSlpVNGFvSDNMQXBCOHUvb3o3YUFL?=
 =?utf-8?B?Ry8wQWNYZmhPNEFEcmZSVjdacGpwRjhhRHdSWXZLZlJvNjM0eEVvMjJLL05a?=
 =?utf-8?B?OTFSeENhTm1OMXArc21TY0cweGVPczgvZjBnZVVwM1RSaHhid0dHUGxqRkZ2?=
 =?utf-8?B?dVZnRFJ3WElhUDkvL3VSVnFic2Y4azN6QkVBdUJhYkJXMUdqTXBXVHN6RE9X?=
 =?utf-8?B?SGJSRGk1eHhJZUVWZ2ZYWXNpUG9OSGlQdFF6WDZvbkw1TUthMjZDNloyMk4y?=
 =?utf-8?B?czh1TnJ0RmMzZDluMTVURkN2YS9sb1ZmQlF6ZDQwbTVNNjcrdDVhcGp1QUFT?=
 =?utf-8?B?dUxkMk9pSUNrNFJnTElORTZUejlRMkdIRTkrS2p6ZUFhNTlVZ3ZweiszenQ1?=
 =?utf-8?B?aGpLdWV4K2VadkFVajZqV1FDUjNiL0c5dTIzd2dYaXdCdGl4TDZqVjcyU2tx?=
 =?utf-8?B?U2pPOGFNbmM4ZlBHYkJ6bXJ4bVZxdnVKY3hORzdJRnpsMXZXSU1ESkhaOEhN?=
 =?utf-8?B?QkNGZkk2NytRQnBJWjduY3hEb2xpV1RDR2o4QStRYnpQS1YrdUp6TWhzNW4y?=
 =?utf-8?B?dW9iVkZkQzBSYWJYL3Q5Y01NRWg3Und4aUl2R09mMUF0SFdqc0JwV0FzYWhm?=
 =?utf-8?B?YlpZSVk3VWZvYnAzQmFUaGRyMHN1L014SlNsVkMva01kSE9tcnkxYjZyS0Rh?=
 =?utf-8?B?VHltTVI3bU1qMjA4d1FSM20rRWxEeWdEbUV0cDFBakhTZFdwNUlvdFVObThP?=
 =?utf-8?B?YlZPeVR4RHZldFhCWDZmM3lFMzh2K2w1a1FLYXlGdERncFRLa3FSRFhMbHpj?=
 =?utf-8?B?SllvclhKSHpmbnlRWVQxVzRaRXI4VVhoNkdmaVBlb3IzblBWb1NHdVNPMS9n?=
 =?utf-8?B?WStwZkFHaFVtcVp0S205NTNmMFNXOWdVa1ZacERFbGxBaEZiMjJra2VXcGtS?=
 =?utf-8?B?T3UyS29oNjFyZi9LVnRiWklSbXVKUmpCS2Z2eWNmaTFYNFBTUTVaVGEzTFR3?=
 =?utf-8?B?UEI1N1QvQ0xEUEkydEE5UVpydVJ1YXFLdXVzRngwRS9CQ29FVUFOZWJpdHFl?=
 =?utf-8?B?VjRiNU1HU25uV3pGOURwanVMc1JNWE5zb1BGMG0xS096MThYbE9hTlRLemtx?=
 =?utf-8?B?NUpFejZJaHAyNVB2eVBRcXNtZnJlR2FMRFZPUnRxMzZqd2F2OG16Y0QzTDFT?=
 =?utf-8?B?R3FDRTJWcll1ZFFCWmFtQ0ZXZnFJNmZxQnRIUFFzbGZ6WXQ2UmF1MzRsV3A3?=
 =?utf-8?B?SXRzODhkSDVLWEFWaWxxSzBZWEJaWUFOSDB2VzFCb2RlTktWMUxNR01sa3NY?=
 =?utf-8?B?bkVKTUVqSmZBQ1lwYWJYTDI1QUtiTEQ1ZnJHVDJFRjJKT0FNTkFOYkdQK0dr?=
 =?utf-8?B?S0ZZOFRzRXpFM200M3A3aWRpNjNJNnhqMytmc213bi91aEdJTTBRUGpBamFt?=
 =?utf-8?B?cWhtUEEwYUdZSkY0V1NReFIydHJxdEV1Z0dKNGZFZkhIdW1yclNjSjBCbGFw?=
 =?utf-8?B?MHl5cWdHdTlXQ1F6RHdvUnE2VmszaHZPRktualU5aUd2T25JcjdzbDNZaGhp?=
 =?utf-8?B?cUNwRlQzOHdzL1hZTVZhL1hYUUhrUXY0d1d0N2lJZEdLOHZtS2pFZFdsT2hV?=
 =?utf-8?B?SEo4S0F1Y0NSditIbllWam5ZaXU5ZGxJNlBoWWYvdDd1cVdPbVFkQ2t1REJH?=
 =?utf-8?B?TUFaSy9pNkgzUGVXTDJaSDhjU0NQWGVxL3pIc0g5RmQ3V0d4blFVYUVEUFFJ?=
 =?utf-8?Q?FCN8prO4sdeRWCj9dx+gfcsTmePMz5uDL3H+JDN?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9066505-cab3-4322-6196-08d8d8f7002d
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2021 19:04:24.5970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XQCu3Sq7mfj80JhvUw5gdDfuTsZQ1B4nLo2p/8I5xruQ9T6nQIZ2SjLAdNPS1bWehGFRuyxTpdc7oXVMvTXXoRT/dJxzRGLzjDZ8gCYQj9A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4869
X-OriginatorOrg: citrix.com

On 23/02/2021 07:13, Jan Beulich wrote:
> On 22.02.2021 17:47, Andrew Cooper wrote:
>> On 22/02/2021 14:22, Jan Beulich wrote:
>>> On 22.02.2021 15:14, Andrew Cooper wrote:
>>>> On 22/02/2021 10:27, Jan Beulich wrote:
>>>>> Now that we guard the entire Xen VA space against speculative abuse
>>>>> through hypervisor accesses to guest memory, the argument translation
>>>>> area's VA also needs to live outside this range, at least for 32-bit PV
>>>>> guests. To avoid extra is_hvm_*() conditionals, use the alternative VA
>>>>> uniformly.
>>>>>
>>>>> While this could be conditionalized upon CONFIG_PV32 &&
>>>>> CONFIG_SPECULATIVE_HARDEN_GUEST_ACCESS, omitting such extra conditionals
>>>>> keeps the code more legible imo.
>>>>>
>>>>> Fixes: 4dc181599142 ("x86/PV: harden guest memory accesses against speculative abuse")
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>
>>>>> --- a/xen/arch/x86/mm.c
>>>>> +++ b/xen/arch/x86/mm.c
>>>>> @@ -1727,6 +1727,11 @@ void init_xen_l4_slots(l4_pgentry_t *l4t
>>>>>                 (ROOT_PAGETABLE_FIRST_XEN_SLOT + slots -
>>>>>                  l4_table_offset(XEN_VIRT_START)) * sizeof(*l4t));
>>>>>      }
>>>>> +
>>>>> +    /* Slot 511: Per-domain mappings mirror. */
>>>>> +    if ( !is_pv_64bit_domain(d) )
>>>>> +        l4t[l4_table_offset(PERDOMAIN2_VIRT_START)] =
>>>>> +            l4e_from_page(d->arch.perdomain_l3_pg, __PAGE_HYPERVISOR_RW);
>>>> This virtual address is inside the extended directmap.
>>> No. That one covers only the range excluding the last L4 slot.
>>>
>>>>   You're going to
>>>> need to rearrange more things than just this, to make it safe.
>>> I specifically picked that entry because I don't think further
>>> arrangements are needed.
>> map_domain_page() will blindly hand this virtual address if an
>> appropriate mfn is passed, because there are no suitability checks.
>>
>> The error handling isn't great, but at least any attempt to use that
>> pointer would fault, which is now no longer the case.
>>
>> LA57 machines can have RAM or NVDIMMs in a range which will tickle this
>> bug.  In fact, they can have MFNs which would wrap around 0 into guest
>> space.
> This latter fact would be a far worse problem than accesses through
> the last L4 entry, populated or not. However, I don't really follow
> your concern: There are ample cases where functions assume to be
> passed sane arguments. A pretty good (imo) comparison here is with
> mfn_to_page(), which also will assume a sane MFN (i.e. one with a
> representable (in frame_table[]) value. If there was a bug, it
> would be either the caller taking an MFN out of thin air, or us
> introducing MFNs we can't cover in any of direct map, frame table,
> or M2P. But afaict there is guarding against the latter (look for
> the "Ignoring inaccessible memory range" loge messages in setup.c).

I'm not trying to say that this patch has introduced the bug.

But we should absolutely have defence in depth where appropriate.  I
don't mind if it is an unrelated change, but 4.15 does start trying to
introduce support for IceLake and I think this qualifies as a reasonable
precaution to add.

> In any event - imo any such bug would need fixing there, rather
> than being an argument against the change here.
>
> Also, besides your objection going quite a bit too far for my taste,
> I miss any form of an alternative suggestion. Do you want the mirror
> range to be put below the canonical boundary? Taking in mind your
> wrapping consideration, about _any_ VA would be unsuitable.

Honestly, I want the XLAT area to disappear entirely.  This is partly
PTSD from the acquire_resource fixes, but was an opinion held from
before that series as well, and I'm convinced that the result without
XLAT will be clearer and faster code.

Obviously, that's not an option at this point in 4.15.


I'd forgotten that the lower half of the address space was available,
and I do prefer that idea.  We don't need to put everything adjacent
together in the upper half.

~Andrew

