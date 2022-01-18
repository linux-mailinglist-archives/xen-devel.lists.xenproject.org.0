Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0049B492856
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 15:27:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258555.445403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pRd-0004LU-KF; Tue, 18 Jan 2022 14:26:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258555.445403; Tue, 18 Jan 2022 14:26:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9pRd-0004J6-H7; Tue, 18 Jan 2022 14:26:45 +0000
Received: by outflank-mailman (input) for mailman id 258555;
 Tue, 18 Jan 2022 14:26:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9pRc-0004J0-5L
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 14:26:44 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a8480e74-786a-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 15:26:42 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2057.outbound.protection.outlook.com [104.47.2.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-40-moJH_iqqNd-HxMATo5IGcA-1; Tue, 18 Jan 2022 15:26:41 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM5PR04MB3202.eurprd04.prod.outlook.com (2603:10a6:206:8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.9; Tue, 18 Jan
 2022 14:26:38 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 14:26:37 +0000
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
X-Inumbo-ID: a8480e74-786a-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642516002;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RWC3okJsKmTqW49xrdoEpCW2bgXyfiNuxpHL7Kvq3k4=;
	b=VEJgJ7to6Vla5tYEjN8McNWbfan5DaK1kJaZc6g8FiFLJztmqQ3HvXkIM2M9qAGmV+lYMD
	hbNpv6wCa8RpvTbn2r0ijiSjt/NoPtVY2LNcz51HE7LyGwUcSBtUyzrdpjMV42rcffKVqw
	qWV4SFolK0Q35RGqjPL6A30u9CiBME0=
X-MC-Unique: moJH_iqqNd-HxMATo5IGcA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iDcXwyUVCwnUP8GZ9vYt/NXr+cbuv1fVtYBzuQtV8WQ2VNe3O2G2MxhunK5Zn0ze+hnvZhvNT4AHQV9/xdXCKODsYUDocDIWbKDt61cmbozXIXprYctlULeRuA45CURLGiGk5X2zKOh/Jp4ysCPlktTyZ3fsLC9FTOu7HSMeUI0qdbq2Snna0UN9VTxP5nT+XWfuVOZTAaXTgbtsxobXvP4rmXslpYqrD8/uYrPpbaOVKIEOlUUCSb9abm8DnK6138qobv0H19vNvCUEcLP78YIgMLyz40V3wnpRvkwbM/5IrMxHCvAnQfE5kozhp+vMBcSF8n3f5aGdNfP6kOo7Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LSw8brPdtKgdAQpTO47YYQG7Ao7t2Fjiv+gR2rCJHqk=;
 b=fj1PRS42sBlKlrLBlw+QjKJ95PE+tXxYKQYr6ZwAfSWkfy1sYy66t1ZazkFKh0jJ1iHX6+eJEHO8MYjOdfV5igtfdzZRIo7HpDVgfvM1CCMLn4E9ZH5kuuzVNWoL8ckiLepfARPVlQuTmorcCTWWMu9ave65l5jQGsbjMWx2BTD6BUnoXooKnbVbDlkWdmLRDHktkCWB1O+iE2511due2O7Ry1crjb/VXQl60j0ckvQARpv13S4doGCeiitCkgDrK0szpwVKKRhfOZUB6Ie1pyzC3hkJasOyqfniyDKzd6/DURbTyGzYtN+RcmH6AyVorm3UbsKjq/u5LcmAj6Q4mQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1bc72631-6d76-d25c-bbab-6a7ae6f8260d@suse.com>
Date: Tue, 18 Jan 2022 15:26:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] x86/time: further improve TSC / CPU freq calibration
 accuracy
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <6c50c7b6-e521-e34f-1808-a4e2961b807e@suse.com>
 <Yea2XRrFn7qCIx/h@Air-de-Roger>
 <4bc4e379-fc9c-581a-3b03-9025e9fd92cc@suse.com>
 <YebJPd62a7rB+KTw@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YebJPd62a7rB+KTw@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9P194CA0025.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:20b:46d::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5dd5afdd-d7a8-4491-bb5e-08d9da8e896d
X-MS-TrafficTypeDiagnostic: AM5PR04MB3202:EE_
X-Microsoft-Antispam-PRVS:
	<AM5PR04MB32023D789208992BD20F9A72B3589@AM5PR04MB3202.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mT8E4ufYZHjifFACBNNNVTQ+Jd+k41NZX2FxJeYWQiluK48xJH6LFxWipOgH6bZWU8x4VSytEHAUe4Iv2tsSo8oA/DZpVDk1FQcNAUJoOd39zQFAIlKq7XVgjBQbuv373KCFZV6Wv/VJxWlzIrNBBI27Lf9ePGMabuuEACKdt+XCP6cBxMMdX8yOVJ/idpd8NLuEsA0jJ9APyD47VBHrY4rkwgwJArAwPGYhJ/S4/YHYHSOiphEtmoiCSaT5OR4A0/jpDUV0iaS8iaJpXJC5nngr7++UOEp0jm7mnjIZWNtxKt2LjY/+rykA4Vo6vSg/3trNKlmEKePymqZi0It6LS9mLaCZh0/NHMhHaoBBHLIimKeP0WVyQiwMEpzLGRFkf03heGdrYiqXnMTLto+Un5h4DuaxMAasuWfIDyCNrXhT4O8RnpURA9VpoyWlW8Voz3BlnCd8mEjWzcaZFTgSKbn/BGWTEj4H92tmLobMZwedilksW5YhEoEQhr3XmECSNMWLEDitl4543CA91EzcPrgIEb4Xm5a78PD1/w5J1VGThN8m12zlESa0jACsScQ3oXxdBFXyB5K8kdJ74E4uZrfGYGvGbUaPj8FcwFUCn1wFsba0WOj8E+V+vbj/vVU1oDmHzy3d4aLdTxTufwmj9hDyg6cuiiOY+SchQNH9Mv/pQYaiWDXtFfUYTSxekHpC9LJuDX9p+d7SlLN0cV/9nF1iKYyQgPO1+vN/yOYsm0o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(6512007)(6486002)(508600001)(6916009)(54906003)(186003)(316002)(31686004)(8676002)(38100700002)(66556008)(2616005)(5660300002)(4326008)(66946007)(36756003)(53546011)(31696002)(6506007)(2906002)(86362001)(8936002)(66476007)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/F3qvM8lQNr/edWI1HYOV44mRGrPjktxto86Fq/Q2glAypNQyuNrWeZZdlhB?=
 =?us-ascii?Q?fiQHOVZ3rqzKJ8ilAO9tFAeCfJJxLc+VK3CK9CptOX31sSjK8RlJkCxXgX9z?=
 =?us-ascii?Q?+F8BrgqDssoVBgshwWc83+3Fp7kvDa0BYXz5NKstrFsnAjbCjKqBROgLKVCm?=
 =?us-ascii?Q?6ZAxfE0hxgTMLcfO3z/2ch1TXMwLY4juyq1Q2uILwT5aSS8F4xP9tbI09JVT?=
 =?us-ascii?Q?cHQQdpsq83eujffF4ciF5Q/PXaMNeRfYfSBRHncuQwyW5EoIZwjW67BR0JB2?=
 =?us-ascii?Q?Q9Ou3pC48GKpq6mmfThhU+Yertrd5LXrqFlkDJkrtBgbzTg/QiStH+wk/Nb5?=
 =?us-ascii?Q?r1BGCJ92Lj1eAx1mVmemZUreVjGPTO39KaBfc8e4IvoM+OE/kMuKy2gsm8rQ?=
 =?us-ascii?Q?+1ZM4gVOr2x5X+Hhef+vTlOblDcgqW8CBA9lTGBUJubneHuA2KYiIXthAWsj?=
 =?us-ascii?Q?3J0DV9gjOXHXZrKl16mfbivSbvLRK8n73/uvYP2t8/ph8rTWrsLk5/PXLe4k?=
 =?us-ascii?Q?0Z2uTqnO6xQ63ETl1JFClVrAz+3pSvFA7Oiekzt+WBsDOLhQDVmNjQz441Kr?=
 =?us-ascii?Q?rjHJcTQv7Qc8wJ4854Gx7xZrQTH834B0bUXay6DgjAXbYUsK0Kgtn/LWZjIj?=
 =?us-ascii?Q?gbgbdzjRvcd8aAH24uIr238NJP3dB+z5KgeXWEg3IM4dDqvysNJWtBrd2CBz?=
 =?us-ascii?Q?a2UDyLTn7SAvrZBm1ookOYVKX4tJ+532bF3x8MkqSp2yLXUqioNnzIan5FUo?=
 =?us-ascii?Q?fclyXuRyohczqzTBT+7ekyvsqrTomJ2TDEjdud79N7HtJazwheYjg9u5gV7h?=
 =?us-ascii?Q?Q2d0jiRbUdlshrcQQVnWFrq9Q8mWS96XR9+W3AaB0jDzU8TlQEyZgXCh2p2h?=
 =?us-ascii?Q?opezthQEp15AZbqFen8LHYDTgOvKIdOcHxcnXNl+fgof5IkCuWqlj5sgcokP?=
 =?us-ascii?Q?slJLEtw1iugZfVxv/IqDaDUkjsvgOzJCNM7c6yPbHSh9bNzndaza873qeUIt?=
 =?us-ascii?Q?qPijtV3/7ptc7QX+ZgvzvuQan7Pr1Ign+drtz9GvwHoxQVu4iV5/wg1qwxqZ?=
 =?us-ascii?Q?+uesx6LbjXrR0KFWfv6SKHHFg8TeatVcKzM7DoEkhWcfz14zaUHOmHnFshhB?=
 =?us-ascii?Q?V7Dtj6uQMMCKOOX5qm+deswLjlyDBsy81xD0DvHFWe7mUOi8i6WeVJuisQMp?=
 =?us-ascii?Q?LuCyGEhOPd3viAKg5uaKPNBPoQX7KlvAKvvPTEEjFqDG6m+LiY4ncxeML9Tk?=
 =?us-ascii?Q?nDjT6wciAZJCxPlKmQzgVSiYsELS3Q+T+MKaCbPRfzL4TYt6T/qKjbev+EwO?=
 =?us-ascii?Q?y1vgBAdXGYeqX8YWQvzcpTGF66yUQExknY+2jGOTL1jgt1VjJ9S3IjriluXy?=
 =?us-ascii?Q?YS3X7IxaspGTcfDHRvad7s2Lhqape1T6ragZhufeeYzRxz8E19hUtwJw+PIV?=
 =?us-ascii?Q?siUHPvkV77AKfKZXTXUe9twc3zv+kt8UaZrdpeJgmdB/36Tiq7cn7q1SDbH8?=
 =?us-ascii?Q?uKh+sQug0zvbRByPurRHIAt6RSv/fEYFWIiZYu7UxvoqNH8G8gRdzw8LEzWG?=
 =?us-ascii?Q?zbrtC1xzO8AHEAjSix2miLZ5flwDC4+GZeN53xLnQAqWntoNnx5UUtR+HT8S?=
 =?us-ascii?Q?qVlbcj1nbSJP2NKJvsAxMmI=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dd5afdd-d7a8-4491-bb5e-08d9da8e896d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 14:26:37.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: S69shqZ6LasrmQyIFi3LCd5+8TSEwXJkxq7tV0e+ekMeOuGi8z1/yG878o1j5QoSAY7rVbgDYkt0f7FNpjE8eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR04MB3202

On 18.01.2022 15:05, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 18, 2022 at 02:39:03PM +0100, Jan Beulich wrote:
>> On 18.01.2022 13:45, Roger Pau Monn=C3=A9 wrote:
>>> On Thu, Jan 13, 2022 at 02:41:31PM +0100, Jan Beulich wrote:
>>>> Calibration logic assumes that the platform timer (HPET or ACPI PM
>>>> timer) and the TSC are read at about the same time. This assumption ma=
y
>>>> not hold when a long latency event (e.g. SMI or NMI) occurs between th=
e
>>>> two reads. Reduce the risk of reading uncorrelated values by doing at
>>>> least four pairs of reads, using the tuple where the delta between the
>>>> enclosing TSC reads was smallest. From the fourth iteration onwards ba=
il
>>>> if the new TSC delta isn't better (smaller) than the best earlier one.
>>>
>>> Do you have some measurements as to whether this makes the frequency
>>> detection any more accurate?
>>
>> In the normal case (no SMI or alike) I haven't observed any further
>> improvement on top of the earlier patch.
>>
>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Obviously (I think) instead of having both read_{hpet,pmtmr}_and_tsc()
>>>> the calibration logic could be folded between HPET and PMTMR, at the
>>>
>>> As an intermediate solution you could have a read_counter_and_tsc I
>>> would think?
>>
>> Not sure in which way you view this as "intermediate".
>=20
> As in not unifying both calibration logic into a single function, but
> rather just use a generic function to read the counter and TSC.
>=20
> With your original remark I assumed that you wanted to unify all the
> calibration code in init_hpet and init_pmtimer into a generic
> function, but maybe I've misunderstood.

Oh, I see. I have to admit that I see little value (at this point) to
break out just the pair-read logic. While I did say we have similar
issues elsewhere, my initial analysis has left me with the impression
that those other cases are sufficiently different for such a helper to
be of no use there.

>>>> expense of a couple more indirect calls (which may not be that much of=
 a
>>>> problem as this is all boot-time only). Really such folding would have
>>>> been possible already before, just that the amount of duplicate code
>>>> hasn't been this large so far. IOW if so desired, then perhaps the
>>>> folding should be a separate prereq patch.
>>>
>>> You could even pass a platform_timesource as a parameter to that
>>> generic read counter and TSC helper.
>>
>> This was the plan, yes, in case I was asked to follow that route (or
>> if I decided myself that I'd prefer that significantly over the
>> redundancy).
>=20
> I think having a generic read_counter_and_tsc would be better than
> having read_{hpet,pmtmr}_and_tsc.
>=20
>>
>>>> --- a/xen/arch/x86/time.c
>>>> +++ b/xen/arch/x86/time.c
>>>> @@ -392,9 +392,36 @@ static u64 read_hpet_count(void)
>>>>      return hpet_read32(HPET_COUNTER);
>>>>  }
>>>> =20
>>>> +static uint32_t __init read_hpet_and_tsc(uint64_t *tsc)
>>>> +{
>>>> +    uint64_t tsc_prev =3D *tsc =3D rdtsc_ordered(), tsc_min =3D ~0;
>>>> +    uint32_t best =3D best;
>>>> +    unsigned int i;
>>>> +
>>>> +    for ( i =3D 0; ; ++i )
>>>> +    {
>>>> +        uint32_t hpet =3D hpet_read32(HPET_COUNTER);
>>>> +        uint64_t tsc_cur =3D rdtsc_ordered();
>>>> +        uint64_t tsc_delta =3D tsc_cur - tsc_prev;
>>>> +
>>>> +        if ( tsc_delta < tsc_min )
>>>> +        {
>>>> +            tsc_min =3D tsc_delta;
>>>> +            *tsc =3D tsc_cur;
>>>> +            best =3D hpet;
>>>> +        }
>>>> +        else if ( i > 2 )
>>>> +            break;
>>>> +
>>>> +        tsc_prev =3D tsc_cur;
>>>
>>> Would it be better to set tsc_prev to the current TSC value here in
>>> order to minimize the window you are measuring? Or else tsc_delta will
>>> also account for the time in the loop code, and there's more
>>> likeliness from being interrupted?
>>
>> I did consider this (or some variant thereof), but did for the moment
>> conclude that it wouldn't make enough of a difference. If you think
>> it would be meaningfully better that way, I'll switch.
>>
>> Both here and for the aspect above, please express you preference (i.e.
>> not in the form of a question).
>=20
> Let's leave it as-is (just one TSC read per loop iteration).
>=20
>>> I guess being interrupted four times so that all loops are bad is very
>>> unlikely.
>>>
>>> Since this loop could in theory run multiple times, do we need to
>>> check that the counter doesn't overflow? Or else the elapsed counter
>>> value would be miscalculated.
>>
>> I don't think I see any issue with overflow here. It's the callers
>> who need to care about that. And I don't think this function will run
>> for long enough such that a counter would not only wrap, but also
>> reach its initial count again.
>=20
> Right, I haven't expressed myself correctly. It's not overflowing the
> issue, but rather wrapping to the start count value. Limiting the
> iterations to some fixed value (10?) in order to remove that
> possibility completely would be OK for me.

Hmm, I was in fact hoping (and trying) to get away without any arbitrarily
chosen numbers. The loop cannot be infinite in any event ... Please let me
know how strong you feel about putting in place such an arbitrary limit.

Jan


