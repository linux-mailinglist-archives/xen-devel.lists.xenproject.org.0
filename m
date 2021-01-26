Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA429304558
	for <lists+xen-devel@lfdr.de>; Tue, 26 Jan 2021 18:32:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75371.135698 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4SC5-0003wX-92; Tue, 26 Jan 2021 17:31:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75371.135698; Tue, 26 Jan 2021 17:31:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4SC5-0003w8-5o; Tue, 26 Jan 2021 17:31:57 +0000
Received: by outflank-mailman (input) for mailman id 75371;
 Tue, 26 Jan 2021 17:31:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PjTf=G5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4SC3-0003w2-Ro
 for xen-devel@lists.xenproject.org; Tue, 26 Jan 2021 17:31:55 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8b443ff2-fa97-4ab9-a084-f2348e996f97;
 Tue, 26 Jan 2021 17:31:54 +0000 (UTC)
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
X-Inumbo-ID: 8b443ff2-fa97-4ab9-a084-f2348e996f97
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611682314;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=rlN/PGPNg1H/qaHLGyE7icEYwrloOusMSSilaTRN+lE=;
  b=T8t+Lqit4Da66mqzdingcaC3FkJKCAyjw04l8eE8n0lXfYuIqn7y2ZAW
   E6zXFHw+gLxvWyYETqMdDfDt29y88ReUnRFcJlI0KtVoTCDrfqmfNoYZd
   OmQNY1N8awrlSPBMhnmYjjAMlCT+egjNyPaw+ihnj48LuHw7CdCUBGVGG
   8=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: tKoJVJK8DiAVEW0cUdkKFapIn5OelQO6ttVGUVVcdborATa7lKrS2KBOZ2FBnfY8OdcufNZT8J
 D3Si6QC1D0TDbfMMlu2Wh1Ybnt4Y44W/lXsoIkyYMVITOWgm0yokHzzrheboJta0G2ZltOSDyf
 I18hYF5aP4pkoHqKv9ZbdFiDwzy4YCnT/93e4TZ6DeYa5jeKaJNw2hoRHV4jYiBmq2BF0z3c0+
 ttqqQNpTCRemdGN67uvfIqY2tqalEcnwTIrBF+llhTvB8QckUw4NwlrgllqMtTUQk6/z5n2D5s
 BBo=
X-SBRS: 5.2
X-MesageID: 35888912
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,375,1602561600"; 
   d="scan'208";a="35888912"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcJx5Ba7gav2yDI5Ql8Hy9+v71Vj2dEYqcx/YKeFV1mz1nv/aEFoonP2PTMJdH55j+TaViU3F5QHo1P5RIc46R33Algup7bixFL5nDsZ7FYviaHTyyeXmxrv9tvbXTI2GJQfl8ykKnrdZ867p0H8OIshowoUipr50OJETMlr4OGPKnVH5ngkofyReGjxCkAqO3pMIaRrKJeU+WC4IICGK84/whLXPH5sxqEg7Qk8pM0S+iLq8SktRF96CoSrDNzahBg6Zjo/oRhPhHNVhzUON2A13WseFiGenW8GFRaakwofQmebsUbynZfFQxx4Fw4BnF7j9APQvO6YUfEn+Q3bRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUtoP7ZrkjlEHi4Jnzbzf/N3jkDvHPHZhCZWwlvfgZA=;
 b=kNQGS/+VMZLxwMDqlJMGCTfHIcv7xsVw3FeWV3Z+a3xJt37YD3KXac0xSdmRZrAB9fAH57tErYBh82iaZGGWbSytmVPnmJWbDe0lk33+5q8SeANRRSsv3eqKfK+1yyeC5ExBYHgrx3IiKHwpmVjSuXhHsQVwhnhvRbQ8JuoZjAd0wduiHIkLAsS7HSdae0nQsmIzBGD6n0hQTNf1f9TRf7K0fkzQJeKoGeiGOKI63QflUSNLtJV8oF9rTpGROtmnIfKd1Cx+PWVgNmdM6wDBV5JhNgaOrpHrQVyk58rLQD06wYNlUbin0ix89mI0q05JkyEFhihuSbzgj4mOWt68gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IUtoP7ZrkjlEHi4Jnzbzf/N3jkDvHPHZhCZWwlvfgZA=;
 b=Qf7MSbmVkY4sbHXhM0TTXitV0rYlp0+8PqVj9+xkoZ3ZEtAp9ozd5zV7aWOcmYYI4/WS2NSGiZZwiAcGv8irY8qOeSC05/2xUKxM2oKm+pXINF6R3cbei9YBUIAlkH1FCsfElTj7o7cgZDSNE1/K7DUJmKXvfRYuEdJ12MYO4vI=
Subject: Re: [PATCH] x86/timer: Fix boot on Intel systems using ITSSPRC static
 PIT clock gating
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Aaron Janse <aaron@ajanse.me>, Jason Andryuk
	<jandryuk@gmail.com>, Ondrej Balaz <blami@blami.net>, Tamas K Lengyel
	<tamas@tklengyel.com>, =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210107010625.5993-1-andrew.cooper3@citrix.com>
 <6be85030-11aa-4143-b202-48a086bb5595@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b8cd8e04-bf6f-f22c-74be-788ab1e39932@citrix.com>
Date: Tue, 26 Jan 2021 17:31:42 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <6be85030-11aa-4143-b202-48a086bb5595@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0279.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::27) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97f7fb0e-11c2-4a12-84b8-08d8c2204371
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5422:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54221EF58D099DDB5EFD6351BABC9@SJ0PR03MB5422.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4eFo7wUTsc9Q2ign9Z8lIeTxWsvo4UhqY9mfNU0lLvvpK14VmPWHhGgkidYcbL/FyK+/A3UE1Zfh/nuWV4Meq7KUAt4rghXAV1TeyBXfkK6Puuh7Qc5jFikoYcyt+G0hCAy0huxriHf7bBoxZuZCxOCi1Fe2OB2DTjFXV6eLteH+r/aT27j5ib0QYTO7nSEI8cDJYqR3RUr5MxINQ+IPc9pdS5pG2049frJxDwBykjwAucZHiDvRv9I6ZSYhAhoQjSqji3gW8W81/04o+zbHDE9RtSwJaqvDoJ9SWkDu5hyeyD7IpEBUrfWPVdt/3Jp8XgaLx5EC19IpsrB8fxnp7rDocSamDnEOw1q3HTWJn8v6L/AhBBHW5bHyZBVjFA4UMX7ZprSIGWB0nUs3+rKSErjqUO6Wyvz6UQRCCl3PnzVYGG3X/kSKRD0EVMzEDjvOCD4nLsaBceF0j8lbDQZozwFLC6RySiCfmyYa/UanHzk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(366004)(346002)(376002)(4326008)(2906002)(66946007)(66476007)(6666004)(66556008)(478600001)(8676002)(83380400001)(31696002)(26005)(36756003)(186003)(16526019)(53546011)(16576012)(86362001)(54906003)(316002)(6916009)(8936002)(31686004)(6486002)(5660300002)(956004)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z1Q3SElsbUJuc0pyVDE5OEx1U3JYVTdKNHBucTkwa05qQ0FjeEdScDRzUXhZ?=
 =?utf-8?B?Y3l4Yis5aDBPbEVpM1A1d0xORUIxVm1mMkVWaXNIdmhwSDBWWFA5c3VVMkdO?=
 =?utf-8?B?OVpmcUkrV2g4NVRCZHFYVUlrMCtnbGgxVXVCenQvK3lkbDdxY08wZFVKOVhQ?=
 =?utf-8?B?aS9MRVNoQjA1ZWhmdWFSY3lOVFllSzUvU0gxazVONEMrdU9kbDFUYmdTVTZ5?=
 =?utf-8?B?aUhybkpyTmh1MWJ4bTNwQkszMHlpTEtzbUxGbzdvcXdqM2orSWE4QXdWcnJy?=
 =?utf-8?B?Mi92azVXMlhWNlF0WndLL3VoMnVvNjUya2lERnpidmhIbGMyQlAwQVkxT2xm?=
 =?utf-8?B?bkFNc3FjNmdSYUFDMk9qbWo5ZGFXUUU5R2ZVYTFrSWRDRVVkeGlVQ0dtNytG?=
 =?utf-8?B?ZFhTQS9RUnZSakNQK0plbU00U0VHdm5uREtlb2NNMXBPS29Temg3R2gvUTl0?=
 =?utf-8?B?bi9MVTlwcjU4eG1zNnF2RnNMZjc1WXdvK25SMWdtOUdRcE82c3dyZ3JLQ0U3?=
 =?utf-8?B?WFl6d3Z3Wjd3YjhYMFZpbkMvSXVmNmx1emZ5cHlYVXh5M1JRUHluVWVac1lp?=
 =?utf-8?B?TkpZazVMNHlRTjNhUkQ4dTRvTU43UEowNzF0OGVMY2xTaHVQYmE4VFZJMEQ1?=
 =?utf-8?B?WmozcHpmK0lyZW1yeGFrcWtZVVh4akFHUXlhZHJwV0VXd1lDMWFudzRQZmVq?=
 =?utf-8?B?NEJsN2kyK1JpT2xFM0VueHJKSGc2anFsbXRZVTM4NE9nRzd4Mlp0QkNQdkJD?=
 =?utf-8?B?dE1aelo2SEhDd3NjMGJTQzROdzBVSjJDcHFHR3djbWNJSlIxcFhlUFBuTnJ5?=
 =?utf-8?B?dVd5bzBhcEN3dGNwM2thb2hpc2lHM0FGak4zaGVJUGVNZjFxOWVzWkFoNFlU?=
 =?utf-8?B?OTFZWW5uOG1nNGZkdUhxbWpDdXBNcmNaeE5MV0xmTHRsWk9lV3ZxcjYrRDIz?=
 =?utf-8?B?NHYvOTk4b01ZSy8wQ2tuTnVRbmx5RHR5MDQ1ZTVOSzBkYndpaW5zci9LSGZ2?=
 =?utf-8?B?WXd5SjFnWjNiNm5wdjVUN2dWUzBkbkY5U3RvbjcrNVRlNlR6TnRqeE5hQW1J?=
 =?utf-8?B?M3UwbnA4a0NCQ2JYeWkwTDVvMlEzeVlaY3hVZUhhdE1mZHc4bmlVcko3aldL?=
 =?utf-8?B?QUs3OVNCYzBmblNuaG5KWGM0M1VVSjFCeDFTdzVVcWtMaTZ1eW1TZ2paaTBv?=
 =?utf-8?B?V3p5eDQrdndKS2V1b0ljbFhvdDlJbWNCTzlqL2VOZFFIR1lJRWtMM29DQTlS?=
 =?utf-8?B?ZXVCZDI4L2JPVUNibXpseU1EL2tnWEh5SFhSRjZQdTBQSXZMMUVWcythZ0JV?=
 =?utf-8?B?czUxbnJlTnpJS2xhU1gzUVpPSG9wY2FzRG1RYnFJVnljVlRrRkxmYWNRNTJP?=
 =?utf-8?B?aTRHMDkyZk9PQ01pa3lWSkkreWsvQ3lkSm0rODZiM2Fpa29YVmdZQklnZG5n?=
 =?utf-8?Q?yXlwvCZK?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f7fb0e-11c2-4a12-84b8-08d8c2204371
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2021 17:31:50.1938
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hHKRFETi6C9TmGJvJhWTaN69W0ZTfSAs/RNndc+i9kHxNb3iXoDBo8FxnxZLBwGgISdBZtTQTIh4oXYpd73BQ8ZE+oOizhWAwl2ODZqdl4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5422
X-OriginatorOrg: citrix.com

On 07/01/2021 13:53, Jan Beulich wrote:
>> +         !((hpet_cfg = hpet_read32(HPET_CFG)) & HPET_CFG_LEGACY) )
>> +    {
>> +        unsigned int c0_cfg, ticks, count;
>> +
>> +        /* Stop the main counter. */
>> +        hpet_write32(hpet_cfg & ~HPET_CFG_ENABLE, HPET_CFG);
>> +
>> +        /* Reconfigure channel 0 to be 32bit periodic. */
>> +        c0_cfg = hpet_read32(HPET_Tn_CFG(0));
>> +        c0_cfg |= (HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
>> +                   HPET_TN_32BIT);
>> +        hpet_write32(c0_cfg, HPET_Tn_CFG(0));
>> +
>> +        /*
>> +         * The exact period doesn't have to match a legacy PIT.  All we need
>> +         * is an interrupt queued up via the IO-APIC to check routing.
>> +         *
>> +         * Use HZ as the frequency.
>> +         */
>> +        ticks = (SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) >> 32;
>> +
>> +        count = hpet_read32(HPET_COUNTER);
>> +
>> +        /*
>> +         * HPET_TN_SETVAL above is atrociously documented in the spec.
>> +         *
>> +         * Periodic HPET channels have a main comparator register, and cache
>> +         * the "last write to cmp", as a hidden register.
>> +         *
>> +         * The semantics on generating a periodic interrupt is:
>> +         *   cmp += "last value written to the cmp register"
>> +         * which will reload a new period.
>> +         *
>> +         * Normally, writes to cmp update the main comparator as well as being
>> +         * cached for the reload value.  However, under these semantics, the
>> +         * HPET main counter needs resetting to 0 to be able to configure the
>> +         * period correctly.
>> +         *
>> +         * Instead, HPET_TN_SETVAL is a self-clearing control bit which we can
>> +         * use for periodic timers to mean that the second write to the
>> +         * comparator updates only the "last written" cache, and not the
>> +         * absolute comparator value.
>> +         *
>> +         * This lets us set a period when the main counter isn't at 0.
>> +         */
>> +        hpet_write32(count + ticks, HPET_Tn_CMP(0));
>> +        hpet_write32(ticks,         HPET_Tn_CMP(0));
> As you say, documentation is poor here. In fact the wording in the
> HPET spec talks about updating of the "accumulator" instead;
> perhaps just an unhelpful use of a different term. (Respective
> Linux code has a comment indicating this is needed on a specific
> AMD chipset only.)

I'm fairly certain that Linux's comment is wrong.  This behaviour is
described in the HPET spec, which is an Intel spec.

It smells very much like a bug discovered during software bringup on
early alpha platforms with an HPET, and fixed at v0.9 of the spec (or
thereabouts).  I can entirely believe that it is the kind of thing which
would have been fixed in beta silicon before the spec was formally updated.

> It would seem more natural to me if things were explained a little
> differently: Writes to the comparator with SETVAL clear always
> update the "last written" value, i.e. the increment to be used
> once the main counter equals the comparator. Writes with SETVAL set
> update the comparator itself. (Assuming that's how it really is, of
> course, but that's what I infer from the doc available.)

By default, all writes update both the accumulator and comparator registers.

Except for the 2nd write of CMP following a write of SETVAL, where only
the accumulator is updated, and the comparator retains its old value.


I can only guess at the horrors for the internals of the HPET to make
this work.

SETVAL is RAZ so can't be observed in the CFG register.  To get the
observed semantics, every write to CMG will have to copy the SEVAL bit
from CFG to a local flipflop, and on the falling edge of bit, forgo the
comparator update.

This also smells of being a "least invasive fix" at a late point in
development.

> Linux additionally puts udelay(1) between the two writes. Do you
> think we're fine without such, on all platforms?

HPETs substantially predate 64bit capable systems.

There is no spec requirement for a pause, and there is a good chance
that implementation bugs like that were shaken out back in the 32bit days.

>> +        /* Restart the main counter, and legacy mode. */
>> +        hpet_write32(hpet_cfg | HPET_CFG_ENABLE | HPET_CFG_LEGACY, HPET_CFG);
> This isn't necessarily "restart" - you may start the counter for
> the first time. Hence in the comment maybe "(Re)start ..."?

Well - it is strictly a restart because of how the logic is laid out,
and even if that weren't the case, "restart" is fine to use in this context.

> As to the spurious IRQs, does it perhaps matter at which point
> CFG_LEGACY gets set? We could try setting it when clearing
> CFG_ENABLE further up, or we could also try two separate writes
> each setting just one of the bits. (At least I can't deduce
> from the spec that we ought to be prepared to observe spurious
> IRQs here.)

It will an (extra) electrical load stabilising on the line into the
PIC.  Repositioning control writes of the HPET won't make a difference.

~Andrew

