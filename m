Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDC142FBE9A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Jan 2021 19:10:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.71008.127081 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1vST-0003Cr-Hq; Tue, 19 Jan 2021 18:10:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 71008.127081; Tue, 19 Jan 2021 18:10:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l1vST-0003CS-EQ; Tue, 19 Jan 2021 18:10:25 +0000
Received: by outflank-mailman (input) for mailman id 71008;
 Tue, 19 Jan 2021 18:10:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d268=GW=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l1vSR-0003CM-8N
 for xen-devel@lists.xenproject.org; Tue, 19 Jan 2021 18:10:23 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 294b4719-aa88-4215-a618-ece96847050c;
 Tue, 19 Jan 2021 18:10:21 +0000 (UTC)
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
X-Inumbo-ID: 294b4719-aa88-4215-a618-ece96847050c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611079821;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=AmxhUfBS0uGW0afFMgu/h1rg/CM6oVzQDuUPItjWY3g=;
  b=fU3yHdU3/mveRoFv8qkNASwNml6deT548mGT/Fe7RwaRHq/qV/rfOKpT
   03tF1S5ZFIwC+Tt9RMSppcc3fsXzbv0WVmKoGVvlSQYnikx9cxIYMsgVF
   5ab076ocMsahmMP62SPh8jg08CGwH10y6dKyiRyrFTqhXGWVuiO2xtqlM
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: mfn7+Mo/t5kQ4YxUuOZoqlP0nQZSjGY5OrwzQ6pcywkmozUuIcqhKicrD5g6GaEgPcX8LKXMX8
 0VLkahkRudL5NSzB8pQXEeTZ5H2TEPTO/Ixpqwm8dRxpVj60n8/VN7ayEBJhs2W+l2K8zAEwVu
 ghO8zEv1AKoSrsz6uGucAVdUf2Cta165St3JiusaL69taMLfKYZR9TpQ4c2UnkluMIfimEKdza
 fQw2OCAtLSfCfnc/Af+A+v9GrEHqv3IvjHKekpcC5PmEQuEOBpk5ibdgUNoks/y2evZA9SrTiU
 taE=
X-SBRS: 5.2
X-MesageID: 36704360
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,359,1602561600"; 
   d="scan'208";a="36704360"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OPZE9hlz1+2rOMDSdiz5QZHyqmYy+Do4JMGC9HsHtwHaybXgBMIi2yJDmSAhVD7GEwIbCg0DQH1jN1+j/fe7aN4bIl5221RyLYwCSQ4maujIBUKcLpvF6sBXaYUCh5tmUpLh7UdNxXTxNpsbhgMezzD1nPG6gYhbSzwL9faJuMizLOhN1pazEACXtRiQ2qDIO7kcaTSkx8PlgDU4axBDaViT/lHK+mW6rUN1cv03oDSZ4bsjCBBJuRui4fzKMP+SkRAdEzlFO68dngVcOAlvy73JFpU0IZtOHbRbLFHicsjZJ2CgtXjeEXoprtxiclXcmvM9Yp5nZjuZdNnmlGrHSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd+2HUtR3QTjYImg4dZA5qwbtkwydHLIhbIfOJvKD24=;
 b=VQcDwXJtLdk3IUtCtrd3B5kj09OMJPLZwwnv5r/Xkp6HnOcOeMiNFjthcRX2nihVRnsSelDHXAoGeKiNvi6wx0LHcykBw0ixRaMV4YgFznZn3vLGD3WfX9QDbXjZS0ZZATHO5pT0gahdUrlas5s9yqrzpXpBI3TOEwsKg0Zk4oIfAAX7Ok3e7vQ/9lrU9ZtGFe3oqBVJtWxnsWN6zYjms3CLbNO2LBiZGmdkpR8Incag5Ys1HdxIydnMn7KxOILqt1DBqh5b9jLDfCxqxrA0xJYhmg8yqMViZx3SPzXe4RPu8IQ1Ro+q7TidGXIeP1iS0LgOY9zT1piXmr//K5FZgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pd+2HUtR3QTjYImg4dZA5qwbtkwydHLIhbIfOJvKD24=;
 b=uFkcXqtaeitQ6spbrHzwIj/3EHxo9nfuqNvbFvrxQptqIsrRWfQYU7GOISP/Aq/tF4q/mS0MdOsmSwnmTh8HIvf3GpEoo/vouSykQ300hksLoCcsHO/VatoGTrDNHOEURRuBd5cokDp/CbHevYrE0/8GZoka245vzVc4G/xOElE=
Subject: Re: [PATCH v3] x86/mm: Short circuit damage from "fishy"
 ref/typecount failure
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Paul Durrant <paul@xen.org>, Tamas K Lengyel
	<tamas@tklengyel.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210119094122.23713-1-andrew.cooper3@citrix.com>
 <20210119130254.27058-1-andrew.cooper3@citrix.com>
 <98f64276-ec5d-7242-f10f-126fe7ee1f7e@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <45f5d1f0-1a89-706f-f202-91ddb1d8b094@citrix.com>
Date: Tue, 19 Jan 2021 18:09:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <98f64276-ec5d-7242-f10f-126fe7ee1f7e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0441.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::21) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 420bb245-f6ee-46e4-93b5-08d8bca5711a
X-MS-TrafficTypeDiagnostic: BYAPR03MB3687:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3687C4E7B9A3283652F0C6DEBAA30@BYAPR03MB3687.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DCMQKAwpqrPsXD5KN3PRqR8JilK9ci3J/36uzcbZZCw2/UlBYG+DBnzuadPeE47iP0EGrqAsQUS1XAlfTwfFCKFsxo4fvwpT4NPhNKrau982C2snsWvBSbnzxtcLvivG/1b5eFMd1LrTPgf9ycclNAiIZS/MMwQsfSzJel7UWrLVeBD8AU/KcRL0dzb12xf/dMC2KlU71ucKZhMFLXuPHfdcFR/dkGLoiFPDUVhMMJ+SdN0VF+qy/lVJ1qx1xrmeSgAKDqsurnH0J9n4g0Z/mJgOrMqP1t/JdHea7Mlzj8Fg+3L9/hyC9+0CnhXhHgM83bJM343bLGrwii+muT0bRo+NLgX2Z7t39eqKJaOGCQ1o7Pa1cywRWoBh5PYg98ukeFoosIcizIfqTiPtpUvpe9oawSUt5tJQHYeQrpmosJntQ5A7PvLJbGyVPv2MWCOvxe4I0MXZKOVouS3Hceiele1yIqCfNjMFGFUwvqc2qf8=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(136003)(396003)(366004)(346002)(376002)(8936002)(2906002)(26005)(16526019)(53546011)(956004)(2616005)(6666004)(478600001)(4326008)(6916009)(186003)(5660300002)(316002)(36756003)(54906003)(66556008)(6486002)(66476007)(83380400001)(66946007)(8676002)(86362001)(16576012)(31686004)(31696002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?eDkzRWJONTRCMnJobmdzQmVld3E2RERtNFI3cU8wRGRhL09ma2xuZHdaN1ZQ?=
 =?utf-8?B?ZDVSMFRhSkwzMmJkcldDMmhSUHhsUE5oZUxQL2ZLWDFhYzVhUitQQ3RXL3Zy?=
 =?utf-8?B?Y2FnMzN5NXd4ZkVocmRpL0wvY3lXYVBlV1gwb0JVL2RyeGtDVStBYzJ3YUVk?=
 =?utf-8?B?SE5ycVI3K1Zkdkt4OXBHcWpaOXU3OUExV09mUTVXVVc1REF5NFpCSExDZzFE?=
 =?utf-8?B?S1BIalg0aUsva3BDRG16VFlIMGdRc0xPYkNPUHQ4dDNNZTl0TkhTT29nR0Jz?=
 =?utf-8?B?MmZuMzdTR3hJZC9VUmhRMDJVeDVlTlRhM0dTOFBUL1BsNmxGUU5abUptYmVM?=
 =?utf-8?B?RlY3R1AwWHA3ejU3blNMcU1rRDA2R1M1OFBuRmIzVnBONlRtd0lNcHUzcDFV?=
 =?utf-8?B?UG1UeC9UeGptYzlwWDFjYXdlVjZYaWJCcndNc3JoZ1N2Y29oeUd2aDVaTEhh?=
 =?utf-8?B?L2dOWC9mQVRRY0VoMWVJMXEzY2h5RUZ0SHhrU0R4VENPVEtLdG5Wazk5bVJo?=
 =?utf-8?B?TklwK09uYm96ODAzOXlMWkloamtIN1VHY2p4OE1KQi9JUy9tNDBJNXRTMG1U?=
 =?utf-8?B?bTZ2MnZtd0UveWd6b3VZUmh0cld4c2NZb2xMcjBXY0RXTEFJdDRMaCtxa0xO?=
 =?utf-8?B?MGN5OU1JajJyWHJ6YW9HUTNhdlltUDdJNHU2RHRQOE42SDNTKzRWcmI5R2Jz?=
 =?utf-8?B?bGtUZXpRbitRY1NIbHY1eVU1dVFZMzVsMGdHZ21LcDYvWGFseFNiNG9GT3BD?=
 =?utf-8?B?dzM3YkJnbGsrOHpRZnZIdXU5Y1hZQ1p5clpyUDlLc29ZcVdzU3hKRG95SnZl?=
 =?utf-8?B?RlFQVzduRzIyQ1pmZjhKM2lVTVFuN3FlRnVsWUxUN0s5ODlVbFR3bklSV2tw?=
 =?utf-8?B?NG5ZZytWYnZoeWgvMHdENTdqZ1RGYkFDeEliM2dNNHVMZGxuOWpzWFZ2bVlI?=
 =?utf-8?B?ZWRSd3BzNnlJTzIyUFdDeXYwdE4ydEJmajV1OXZJNDBiZTQvU0NGc0wyVUd2?=
 =?utf-8?B?czBmM09ZcldBdTVOaEhKYWcwTlNnM21IV2xhWExCZTVxSUhWVHRhMHJDOHpr?=
 =?utf-8?B?RHAwUngrTk9BUElMTFlEWEZZeU5tLzVPRGRxcGVKdlFXcnAzQ2xIS0tZM2sy?=
 =?utf-8?B?QVUyT1BzWUhKdy9jR1d2QllETWRxck9lajMzZ3p6MytKcVlkQjhDZlROeEcx?=
 =?utf-8?B?RkkvZjhmeC9zWmpMaHdIa3l0S1JKMHRCSmlHeGVNb0ZmL01BWnkyeis0Mnov?=
 =?utf-8?B?Z0srbG5ibytiRFRwamI1eC95YmZYOThQWlM0c2ZRVmRXcXFUM3FKdnFIQVlL?=
 =?utf-8?Q?Fuo3oy8os3IMYVOG11KntB2paZiEaOAc1d?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 420bb245-f6ee-46e4-93b5-08d8bca5711a
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2021 18:10:02.8106
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HYIHthpWYDBFX/00m/oz+0LIWIJ28xI1eLvj9ay41GytM3NG0980fliJzfFj30oqt6P0d5LlB3KJ7iezCSt5wi8909L2ktUYaCgrPSss5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3687
X-OriginatorOrg: citrix.com

On 19/01/2021 16:48, Jan Beulich wrote:
> On 19.01.2021 14:02, Andrew Cooper wrote:
>> This code has been copied in 3 places, but it is problematic.
>>
>> All cases will hit a BUG() later in domain teardown, when a the missing
>> type/count reference is underflowed.
> I'm afraid I could use some help with this: Why would there
> be a missing reference, when the getting of one failed?

Look at the cleanup logic for the associated fields.

Either the plain ref fails (impossible without other fatal refcounting
errors AFAICT), or the typeref fails (a concern, but impossible AFAICT).

When the plain ref fails, put_page_alloc_ref() spots the underflow with
a BUG, while if the typeref fails, it is _put_page_type()'s BUG which
spots the underflow.

> IOW
> I'm not (yet) convinced you don't make the impact more
> severe in the (supposedly) impossible case of these paths
> getting hit, by converting a domain crash into a host one.

I have test cases.  I didn't go searching for the BUG()s by code inspection.

> It is in particular relevant that a PV guest may be able to
> cheat and "guess" an MFN to obtain references for before a
> certain hypercall (or other operation) actually completed.

And do what with it?  PV guest's can't force typerefs for
pgtable/segdesc because we prohibited cross-pg_owner scenarios many XSAs
ago.  A PV guest also can't force it to none or shared.

That only leaves PGT_writable_page, which is the ref we're interested in
taking.

>> v2:
>>  * Reword the commit message.
>>  * Switch BUG() to BUG_ON() to further reduce code volume.
> Short of us explicitly agreeing that such is fine to use, I
> think we ought to stick to the previously (long ago) agreed
> rule that BUG_ON() controlling expressions should not have
> side effects, for us not wanting to guarantee it will now
> and forever _not_ behave like ASSERT() wrt to evaluating
> the expression.

So what you want is v1 of this patch.

~Andrew

