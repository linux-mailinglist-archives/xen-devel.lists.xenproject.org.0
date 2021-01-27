Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E03673059ED
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 12:36:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.76049.137105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4j7a-0003eC-K5; Wed, 27 Jan 2021 11:36:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 76049.137105; Wed, 27 Jan 2021 11:36:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4j7a-0003dn-GS; Wed, 27 Jan 2021 11:36:26 +0000
Received: by outflank-mailman (input) for mailman id 76049;
 Wed, 27 Jan 2021 11:36:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=csCD=G6=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l4j7Y-0003dh-8g
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 11:36:24 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0655661b-52eb-4399-a8ef-906ab0a2d97a;
 Wed, 27 Jan 2021 11:36:22 +0000 (UTC)
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
X-Inumbo-ID: 0655661b-52eb-4399-a8ef-906ab0a2d97a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611747382;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Hdb23LT6mYJKk5iID7Z+vUVv+dd+3/ggA0yckeO4OI0=;
  b=bSX+/4jxFRsT17VtDOoKsvS9vOGyt4d5l67TF1dICig1N7xmtiCKet47
   6oFLturxWTWRDtq6pT8DDJm7IXA1yYsi+fYitC7vzrp9hbt6wxU+EL62o
   gUAir1Xes/2dianRU5ygGz9kMUt9fV/XzRiZcyq/l8ZAFS2ARLgJcFfU0
   k=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1rB+LQD5o9pwOG4SeZDqiJHydUNktdYdRGc8Bfs6sC/lJHUotednlQDGZg169a3T0xiAM5LaGR
 Bhhc78VWR0C/L1LJn1V4BkO//WC5JocvGWdkNdDggZ9ebmOjjBA/1XA01kW0Z5TJ/PgzFS2eld
 UnxyOuubuGqfP3eeHESEbi0fJC8w7dNwJmq3wNfUR7G1vcAMZpuVSfdDrOhH7MT4rLblbpKXEO
 oglarIDF/1Unuf6QN73ME6oXiy81MNq4Ul5czZMlx4aXYW/JtNzOowvf2jA0JKD0FVeGeFiXrR
 Kyk=
X-SBRS: 5.2
X-MesageID: 35996711
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,379,1602561600"; 
   d="scan'208";a="35996711"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BEBCObLc/tzLYo312cbDHeJSJXsFsJA0QHWwzUPWleYsgGnywY7TSTzKI3fC00yLEwaqztQC4TVDnt5fYSzaJh0ZBiRC+mn3mNrR7Fm4b3pjXq7mCCIfIdq3qJPbMDUoYY35QgipcQKR7O1iL9WxhORefgu6gSm80vJEFgJiWHbMVyJ87yNRmMDf+sNUgA9b7X3sL+pKjnY62LTuo8ivPbAY8OQgtXbIVf/uhU6vtvv8DVP/TzfX106XXCWKKDr4fEAD/+0VLWXMf09+4eZvJDN5Tv0aJ7nNWW6tCHXdQd6Xk97AWMJ0KLCvM2uHM1peFtERz+lNN9Fs+eo1owUkOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpT0fkr92CHk+uQUX+7UyPiDuCjB2GEMU13X/T7xSSM=;
 b=HTrh6TGVJ1wC40jmP7gZatA1BeC4AMK6dxEiI/Q4YhQQZJBJAh/OdEpBzBju7oml8UP0oWKtzzgE7rSoCZ+VOEaVhuj+SBdTE8q2ZbdE0WvKjc2oCQ4DaHtljDVfTdHK+K4IK5qrwrAlkoac5Orx3TfOxaZgJ2RgLQnzc8+gM7/RKzG/sCk/n3D0cFgYF4V6JRJcc1oZR27OAN/61WOA4t2MxSZ1k843kqSuY2GBs9KvdLKESY0DEy84mbC++RB4kiV+NhSCHCyQ9/dfBskfL7rczPFt+FWIqsiIEmgkBjy2SKqHqeVGp2hOdlNp+V759J7UHSGzRkWOhrdA94lTvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpT0fkr92CHk+uQUX+7UyPiDuCjB2GEMU13X/T7xSSM=;
 b=eBC3XXGv0pKby+3NOA6+Svq0Vx5D5k8NMH8NdrMD+tKRUZuq/Ts0AyuYwEDymCybijdXc9omWWpXzONgiU0AM7ckOoee9ursCysWI65d8NXWBd3fhY6AbaNrSPX5ZsO83DhzhIiJ5da1sWszxInOIJiaIlxgGUJ4jtGTIHiVojQ=
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
 <b8cd8e04-bf6f-f22c-74be-788ab1e39932@citrix.com>
 <50d6935c-0225-215c-b7c4-ce75fbdb2d0a@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <efaa62f7-4381-8d5f-9b99-faa85bbda315@citrix.com>
Date: Wed, 27 Jan 2021 11:36:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <50d6935c-0225-215c-b7c4-ce75fbdb2d0a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0314.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:197::13) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 15d6e70e-db10-49bc-8f97-08d8c2b7c398
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5405:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB54057FF6AE8EB9528197F38BBABB9@SJ0PR03MB5405.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8Q8p9WncvpE+PH5twWosye/ybnqHkYyIbiEzrY8P5UWFlbKMzncgtpseZTs7rocv5jU18lQxM+0A5lYa91tL2ahNEwt/x2lKlXRUKv1xCeRGQzDFPoxLhPZa2D3/mynR7vmfMTvHV9+6XxIiHaYQhy87NwboEaBk2XsRvL7V/ANTWRdlT/yH5Ds679uC+FcsfDRssIa6P8QSDoXnpIqFR0flvaPVFixcscb20dAWOcJdc6MUIMCzX6tiIDkUQzz3TJae93ibDE5cWVaCQHBm6f/YHeEwZ342b2vKyEU0Zq67Wvwy2lWHv0i0WEPXn9ZO7mGjJJbZG+ylBib4WrxCJTc1wszdlGA738rrsCu3MPcRxF3k7GpK0OoVjy92+DHKe0DDIFkussUbBHcRg5def7sWkGAVOFx2ZytOwgAM3x/lrd4C1rUXI41fRaKKkbqPI5RTsaOtCAQUnkdZp3CrTO46NhdZhSVPcLORYGAhEsuQS9gf5Ll1TV/DA5cPrAk1nIUWh1S8+x1rw7MwOnl1bukaAL3Jw5x6wnyBiBGXBzQYbKqk3U7XM54+twWtuxwN0k8v9wognUG/LD/j/fBPqPo7p21mNhL26QFl3dDLiBc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(26005)(6486002)(83380400001)(6666004)(53546011)(478600001)(2616005)(31696002)(36756003)(54906003)(2906002)(16576012)(316002)(31686004)(6916009)(8676002)(956004)(16526019)(186003)(66556008)(66946007)(8936002)(66476007)(5660300002)(86362001)(4326008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UTg5bWtnVDVLdmZpdlBOb3B0WWdaSFNxVC9DNnFyUEZzYTlDR29nOVIxb1R5?=
 =?utf-8?B?ZGI3MFRWUTd1TExvUGpxRjlHbk9LQThidUV3cVFQMzZoMmtSQms2empDQTlU?=
 =?utf-8?B?UUN2YllGL3J4MXRCalljbUZFZDdwd3VUVzZqWWFGWnU3d01lRjdmVlVwbHlt?=
 =?utf-8?B?VG9xTm5FMERvUS9HNmU2Z1h0Mit1UmovajNEWHhUbHVSTlV0TW5RVmJFbDVV?=
 =?utf-8?B?SE15TmxrODljVDJtdldXUGprQm9wekErRVJBU3JXbGVXUnJkQ0ppQmhXMENM?=
 =?utf-8?B?QmtzWlBNR2ovVDN5NkVZSi95QzhrSkpIMitXd3JmRnlQYkFSTUY5TVUwR3VX?=
 =?utf-8?B?YlNMVjg2TWV6c291KzNtZXFHcWRXRnNGUFpaRVNQdm1NMFFqN29YWHloQmdS?=
 =?utf-8?B?K2xSRU81a3RXeEFBZXNxNEE4dWVXLzNmczB1V005QVdFL3JYUlVsdmVDaDJY?=
 =?utf-8?B?RGpDU2U1TUtSeGZMQzdHL0c1bEFMblF1RmdGL0VFdFovUm9IbDdqQmxhZkRB?=
 =?utf-8?B?YVhHMGxJVCtGNE4wNnlXTG43WUtUbFZuQmgzNHV2UFplQ2xWN21oc1dnUDVo?=
 =?utf-8?B?ZTdEalJHZHgrV0xBc1lqZnM5eXFKZWZTM2szRzJVZXlGdE1xUTVXdGFpZXND?=
 =?utf-8?B?aUJJd2VmZnlROVFlS1V4SVFLUUtkUENSaEFLcVdabFkzL1BsUlpVVFVkT2JW?=
 =?utf-8?B?eGluTmxsdzhaV1djWTYxMXY4ZjFvZHF5K1hab1BCMVJxMEdPdXpTdzhDbE5o?=
 =?utf-8?B?ZFlsdG9ZWm5qbnc1MFRWZDNaNWpnTkpiampmcmNNREVpS3FCV0tlME5rUVZF?=
 =?utf-8?B?ZnM1ZTJwdjVJQjVCUWk4YlZnbENDM0NmSlpGYjRaMUNZNkdDSnA5MkNISG1x?=
 =?utf-8?B?ekZRSjhzR3hiWkNaMGpZY2ZXZDh1U2NVT2JNMUFwd0FkTjUzQWhjeVZkS2F3?=
 =?utf-8?B?RTRwSFdYL1I3Z3FFalNlYm8xTGJQR0RhMHpSbDNGMUxlTitpZkIzSFBwOHA5?=
 =?utf-8?B?VEN0Q2xuNERDSjU2NkpuM0ZsMXpqWTdWUTVPQTNUTHdFNXlUdXd2RGpPclVD?=
 =?utf-8?B?cFB0bDRGM1FnWGN6MmZMSmtKVU5yZlplWVlBeURvQ2M0ZnI2ZGVtTTBLaGdj?=
 =?utf-8?B?aTN5NGdvY3psR0pSajREQ0ZrMEY2MmxFTFB5VFFBcW4vVjdMdHB0TVVsUlVF?=
 =?utf-8?B?RmpzMWo0VVNOcWRaLzF3VVFRTi9vamVtMmw5N3cwRmdnU241VEwrcUFDcWJW?=
 =?utf-8?B?QTI4SWhlWHVIS2k0YlBVRk82cWx3cmNlOVNZQUZZTFZVaUdHaEVrOVNQNllT?=
 =?utf-8?B?U0ducTlCY1p4Skw0WXJIZ1dwaDZKR2Nqc2dCMElmcHRUTVkyWk4xYXU1Z3R0?=
 =?utf-8?B?VXcwbVRFYWN1NXNzY3drTG4yUWxXL3pZZUFrdXJDcENUempZN2FucVI4VENz?=
 =?utf-8?Q?GMtSlDYA?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 15d6e70e-db10-49bc-8f97-08d8c2b7c398
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2021 11:36:19.0953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /xiRPNqzYKr6FBkr/odx0KkSt848vTJa1twi76TD4fJCE5o4SqLuVySIMjbLTl0zQLmJx4hximgYhh2NM8YqMD0Ii0qcwPvj7t6JagK0Flc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5405
X-OriginatorOrg: citrix.com

On 27/01/2021 09:28, Jan Beulich wrote:
> On 26.01.2021 18:31, Andrew Cooper wrote:
>> On 07/01/2021 13:53, Jan Beulich wrote:
>>>> +         !((hpet_cfg = hpet_read32(HPET_CFG)) & HPET_CFG_LEGACY) )
>>>> +    {
>>>> +        unsigned int c0_cfg, ticks, count;
>>>> +
>>>> +        /* Stop the main counter. */
>>>> +        hpet_write32(hpet_cfg & ~HPET_CFG_ENABLE, HPET_CFG);
>>>> +
>>>> +        /* Reconfigure channel 0 to be 32bit periodic. */
>>>> +        c0_cfg = hpet_read32(HPET_Tn_CFG(0));
>>>> +        c0_cfg |= (HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
>>>> +                   HPET_TN_32BIT);
>>>> +        hpet_write32(c0_cfg, HPET_Tn_CFG(0));
>>>> +
>>>> +        /*
>>>> +         * The exact period doesn't have to match a legacy PIT.  All we need
>>>> +         * is an interrupt queued up via the IO-APIC to check routing.
>>>> +         *
>>>> +         * Use HZ as the frequency.
>>>> +         */
>>>> +        ticks = (SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) >> 32;
>>>> +
>>>> +        count = hpet_read32(HPET_COUNTER);
>>>> +
>>>> +        /*
>>>> +         * HPET_TN_SETVAL above is atrociously documented in the spec.
>>>> +         *
>>>> +         * Periodic HPET channels have a main comparator register, and cache
>>>> +         * the "last write to cmp", as a hidden register.
>>>> +         *
>>>> +         * The semantics on generating a periodic interrupt is:
>>>> +         *   cmp += "last value written to the cmp register"
>>>> +         * which will reload a new period.
>>>> +         *
>>>> +         * Normally, writes to cmp update the main comparator as well as being
>>>> +         * cached for the reload value.  However, under these semantics, the
>>>> +         * HPET main counter needs resetting to 0 to be able to configure the
>>>> +         * period correctly.
>>>> +         *
>>>> +         * Instead, HPET_TN_SETVAL is a self-clearing control bit which we can
>>>> +         * use for periodic timers to mean that the second write to the
>>>> +         * comparator updates only the "last written" cache, and not the
>>>> +         * absolute comparator value.
>>>> +         *
>>>> +         * This lets us set a period when the main counter isn't at 0.
>>>> +         */
>>>> +        hpet_write32(count + ticks, HPET_Tn_CMP(0));
>>>> +        hpet_write32(ticks,         HPET_Tn_CMP(0));
>>> As you say, documentation is poor here. In fact the wording in the
>>> HPET spec talks about updating of the "accumulator" instead;
>>> perhaps just an unhelpful use of a different term. (Respective
>>> Linux code has a comment indicating this is needed on a specific
>>> AMD chipset only.)
>> I'm fairly certain that Linux's comment is wrong.  This behaviour is
>> described in the HPET spec, which is an Intel spec.
> I agree. I nevertheless wanted to mention it because it has been
> there all the time, for many years.
>
>>> It would seem more natural to me if things were explained a little
>>> differently: Writes to the comparator with SETVAL clear always
>>> update the "last written" value, i.e. the increment to be used
>>> once the main counter equals the comparator. Writes with SETVAL set
>>> update the comparator itself. (Assuming that's how it really is, of
>>> course, but that's what I infer from the doc available.)
>> By default, all writes update both the accumulator and comparator registers.
>>
>> Except for the 2nd write of CMP following a write of SETVAL, where only
>> the accumulator is updated, and the comparator retains its old value.
> IOW you don't want to change how you describe it. I found it
> somewhat confusing (or at least not clear enough) to read this
> way, so had to compare and match the comment with the spec to
> follow what exactly you mean.

I can see about trying to make my description more clear, but your
attempt to summarise it is incorrect.  You've got the behaviour
backwards WRT when SETVAL is logically set.

It is the second write to CMP after SETVAL which is special, not the
first write.

>
>>>> +        /* Restart the main counter, and legacy mode. */
>>>> +        hpet_write32(hpet_cfg | HPET_CFG_ENABLE | HPET_CFG_LEGACY, HPET_CFG);
>>> This isn't necessarily "restart" - you may start the counter for
>>> the first time. Hence in the comment maybe "(Re)start ..."?
>> Well - it is strictly a restart because of how the logic is laid out,
>> and even if that weren't the case, "restart" is fine to use in this context.
> I don't follow you here. If it was strictly a restart, where
> is the place where we first started it? Higher up you have
>
>         /* Stop the main counter. */
>         hpet_write32(hpet_cfg & ~HPET_CFG_ENABLE, HPET_CFG);
>
> which of course stops the counter only if HPET_CFG_ENABLE
> was set at that point. In find it less relevant to point out
> this fact in the comment here, than I do in the "restart"
> case; in fact I wouldn't have commented at all if the
> comment simply was saying "Start ...".
>
> Furthermore, wrt legacy mode I'm even less convinced there's
> necessarily any _re_-starting.

"stop" and "restart" are a perfectly valid pair to use together, in this
and other contexts.

>
>>> As to the spurious IRQs, does it perhaps matter at which point
>>> CFG_LEGACY gets set? We could try setting it when clearing
>>> CFG_ENABLE further up, or we could also try two separate writes
>>> each setting just one of the bits. (At least I can't deduce
>>> from the spec that we ought to be prepared to observe spurious
>>> IRQs here.)
>> It will an (extra) electrical load stabilising on the line into the
>> PIC.  Repositioning control writes of the HPET won't make a difference.
> I didn't think chipsets, where all of the various functionality
> is bundled in a single chip, would necessarily use electrical
> signals over an actual "line", but instead components would act
> on a set of shared registers, using effectively software along
> the lines of e.g. our vPIC emulation state machine. But I may
> be entirely wrong with this ...

The legacy silicon block won't have changed in this regard.

Back when there were PCI lanes, they had to be real wires.  PCIe will
have had to mux INTx onto those real wires.  These days even with an
IO-APIC, some GPIO pins are still real wires.

Everything upstream of the PIC/IOAPIC is message based (both devices
actually send MSIs since the P4 era).  Nothing below it will have changed.

~Andrew

