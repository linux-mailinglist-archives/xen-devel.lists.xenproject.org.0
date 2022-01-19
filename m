Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 474D7493693
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jan 2022 09:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258778.446079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6gM-0004F6-V4; Wed, 19 Jan 2022 08:51:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258778.446079; Wed, 19 Jan 2022 08:51:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nA6gM-0004Cg-QC; Wed, 19 Jan 2022 08:51:06 +0000
Received: by outflank-mailman (input) for mailman id 258778;
 Wed, 19 Jan 2022 08:51:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uvFD=SD=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nA6gL-0004Ca-0R
 for xen-devel@lists.xenproject.org; Wed, 19 Jan 2022 08:51:05 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eec2389f-7904-11ec-a115-11989b9578b4;
 Wed, 19 Jan 2022 09:51:03 +0100 (CET)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-14-CHHVAtvUN32LrK7sCaQ4yA-1; Wed, 19 Jan 2022 09:51:02 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB7PR04MB5945.eurprd04.prod.outlook.com (2603:10a6:10:87::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Wed, 19 Jan
 2022 08:51:00 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Wed, 19 Jan 2022
 08:51:00 +0000
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
X-Inumbo-ID: eec2389f-7904-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642582263;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EklnftRDum7HT1aafqN2umGleKiF5ziptCVMnujYoEY=;
	b=PL5BZ88ANEnu/edBKulZ0cRTPxRQdvA/vVewElpRZjlsKLTqMdEaN7aE36gOpeoY+EedRr
	8GbjlWgKlEAGjgQPPNpO+nuj8uQIYU7zf6I1MUc94Yk7ILR9vn8HjgKin6Xlg+wHpNzzeY
	8dnPbPQ5ZgVZvC2xwQb9ZddK/AQKZrw=
X-MC-Unique: CHHVAtvUN32LrK7sCaQ4yA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IdPv73rkDuR0FTLADqlvRpmlkvlc5In/J0CVmtS4nKB5KFxsj3hHXp6vlqPqgmnCBGeUO3w8boe6YK0dYKoUCg7pOMgK9WjKTBfMgiQ4cAdj21ieUHIoaiPgEDpuNxjxu0kEy/DixvX2Va5ko/hvo36d5NFTZ4IKgKkH8Q1xQ+H6feoNanYHO0aMoGe4Vd8+UilP1leChwfxjXn9a7oeKoK8sdqffAV8kq/rJ9PqNQboh8VpM3C4xxgfwhjMeQgoUbc0KBvyowDr3SlAwY8mYwF4E60vPK8DWzhNkIspCblZ+OJF7BA/3WsfOYUkSktpBpK2qScHf9l3+f26ma/pXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33QpueoLz64GhrcHzT18N/M0iNqcNVFbyEsLhN19/4A=;
 b=FcADnnscrE8nWni96mXAsux4hBpglU+r/DtElrJ0IBNu1PcQpCiao3udMCyk/0OfVDSxqikIhOYe/DCVuzR70w0x65AYU0d4glIF67PY0axz6uPqlxvHKdaDjWz4fsMok0EAcl18rNBKfDE0QN2MwpaJkry2iNAplvE31kvjcelRjOxSDSy35vVdnD8aeFzludYEJLRCLDqH2cxcwS08fjoxEkvRXZyx1K+J429Bm1qju6G6ORqUtxZOjg/zKa5rXv8+tP4o1dYdm0ChOjSSBM3fPRrhIA/T4TJOcSE90330ckiH5t506JHa3E8Yvwnlgpc0yDrIHQb6mcCGaCMr7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3ee31401-11b9-a85b-cbb1-3210fafc1529@suse.com>
Date: Wed, 19 Jan 2022 09:50:59 +0100
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
 <1bc72631-6d76-d25c-bbab-6a7ae6f8260d@suse.com>
 <YefP4if57LzJGr45@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YefP4if57LzJGr45@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6PR04CA0058.eurprd04.prod.outlook.com
 (2603:10a6:20b:f0::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2b859ca4-ed06-4b65-b732-08d9db28d0ec
X-MS-TrafficTypeDiagnostic: DB7PR04MB5945:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR04MB594519165608AE4D8449D7CEB3599@DB7PR04MB5945.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	C/5rgBikAvvvX/InwWa9VCvSsmeOeFg9FULRJ+BhgZZOcl+dTDJOhQwWdul8w6jWUdOdutHH9PI6XxJ79PT4krjpB6E9mbnxRxJwXzJdSDZQbwNdMS4pe3SEwnGszGUKLj/NZdQaaE8DOeH9QCRQ9sqlE9rP5o6u5EJM3khRWcD1djeELU5JocEXMjljCNe9vxwq5K7L49i+wvjAYSLrCqAcO+NATnbRsW6BNQS0lOha29iR0WG4LmrrvMgVFfIOnu6+eh9CESwN0zSfA423h0J3aeAWSb30MpyhrL6O+SblJ3vf0vAuEJK+2QWFIFtKEeMNSPOe8GyU/2tvEYXuIKia8A7dFPFJw+bwUW/ajR92h3CJpI3H0lj6lYP/S9/R3nf0GAbQ/SLdMvZg7DLqV4VIkBo/f+63fByXb+bTnzg4JehuM43teBxOMbp8sgGxEYO+jC184vOlCFCk7a4dCHYiESike3zOdi+UXTiDw8/fWf4KAhd7iFk9gHd2vqUggDe9cNtw8aS63Lh1udIclBtcZUrVMaVMxHUFc5fTLsDIp1p06QklxZ5c0nxRvM9R3249LVrUWZQjz88435e0j/JkC7qeNuDbOYjUi2Ca7StmYJweB0xZquCzt5miJdnWtz5E6rqfYIjBSXXYP3Q69s+mxgiFxHdh/mryNBzSY5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(2906002)(8936002)(2616005)(508600001)(8676002)(6916009)(36756003)(66556008)(66476007)(53546011)(6506007)(54906003)(6486002)(26005)(5660300002)(38100700002)(316002)(6512007)(186003)(4326008)(86362001)(31686004)(31696002)(83380400001)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f8xCKickrWkeBkSAjC144+kI2r1q+RNObXlmYfqOt7UhrUIioW6riOq34M2+uFGt70rFw42gh3ILxPcxO2fW4b7XfWfVTmXCqZwHGM8sPmu0Dz6S90/1i9JB9vlwKEl18VSASPS5TVnX3BGVO+2H108p9wm3FtoV2qQj231+GZWKGkTHQWDw/drvWIW4C7oGnpVXp1IJi1Ch7Wdh7EcUpwxP1w/LhIJqhnUhwfV+A/T5WXmw5WjoPCUQZSngGvWx8sucBHwW0o1r4y1KtpGIQQfUN9SSclThNdZ8aaDLqk8MMvOKYJm6P7zA/iKuCePIttK9cOeMoMTU6pPaytFY7tJvvKDipKggVEU7uiZs8Qu2kedZsrDVaXNIEjoPYCwUYk6OnwOgg7Pc2N8qpQpZCrlCix/OSwTdYWtddrunVEJLJZeBXeNCt1Ol0fkkj1TS
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b859ca4-ed06-4b65-b732-08d9db28d0ec
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2022 08:51:00.0954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H+7dZqCujGtoL9grAdSV0tRMgFXMynuFUP4CWPbV8LdTIgDML4d32Ibs2pKPoOHRoP6iw/T69mZgaKSa1S3PgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR04MB5945

On 19.01.2022 09:46, Roger Pau Monn=C3=A9 wrote:
> On Tue, Jan 18, 2022 at 03:26:36PM +0100, Jan Beulich wrote:
>> On 18.01.2022 15:05, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Jan 18, 2022 at 02:39:03PM +0100, Jan Beulich wrote:
>>>> On 18.01.2022 13:45, Roger Pau Monn=C3=A9 wrote:
>>>>> On Thu, Jan 13, 2022 at 02:41:31PM +0100, Jan Beulich wrote:
>>>>>> Calibration logic assumes that the platform timer (HPET or ACPI PM
>>>>>> timer) and the TSC are read at about the same time. This assumption =
may
>>>>>> not hold when a long latency event (e.g. SMI or NMI) occurs between =
the
>>>>>> two reads. Reduce the risk of reading uncorrelated values by doing a=
t
>>>>>> least four pairs of reads, using the tuple where the delta between t=
he
>>>>>> enclosing TSC reads was smallest. From the fourth iteration onwards =
bail
>>>>>> if the new TSC delta isn't better (smaller) than the best earlier on=
e.
>>>>>
>>>>> Do you have some measurements as to whether this makes the frequency
>>>>> detection any more accurate?
>>>>
>>>> In the normal case (no SMI or alike) I haven't observed any further
>>>> improvement on top of the earlier patch.
>>>>
>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>>>> ---
>>>>>> Obviously (I think) instead of having both read_{hpet,pmtmr}_and_tsc=
()
>>>>>> the calibration logic could be folded between HPET and PMTMR, at the
>>>>>
>>>>> As an intermediate solution you could have a read_counter_and_tsc I
>>>>> would think?
>>>>
>>>> Not sure in which way you view this as "intermediate".
>>>
>>> As in not unifying both calibration logic into a single function, but
>>> rather just use a generic function to read the counter and TSC.
>>>
>>> With your original remark I assumed that you wanted to unify all the
>>> calibration code in init_hpet and init_pmtimer into a generic
>>> function, but maybe I've misunderstood.
>>
>> Oh, I see. I have to admit that I see little value (at this point) to
>> break out just the pair-read logic. While I did say we have similar
>> issues elsewhere, my initial analysis has left me with the impression
>> that those other cases are sufficiently different for such a helper to
>> be of no use there.
>>
>>>>>> expense of a couple more indirect calls (which may not be that much =
of a
>>>>>> problem as this is all boot-time only). Really such folding would ha=
ve
>>>>>> been possible already before, just that the amount of duplicate code
>>>>>> hasn't been this large so far. IOW if so desired, then perhaps the
>>>>>> folding should be a separate prereq patch.
>>>>>
>>>>> You could even pass a platform_timesource as a parameter to that
>>>>> generic read counter and TSC helper.
>>>>
>>>> This was the plan, yes, in case I was asked to follow that route (or
>>>> if I decided myself that I'd prefer that significantly over the
>>>> redundancy).
>>>
>>> I think having a generic read_counter_and_tsc would be better than
>>> having read_{hpet,pmtmr}_and_tsc.

Btw, I think I will want to break out the full calibration logic, to then
further generalize it to make suitable for LAPIC timer calibration (then
no longer against the PIT, but against the earlier chosen platform timer).

>>>>>> --- a/xen/arch/x86/time.c
>>>>>> +++ b/xen/arch/x86/time.c
>>>>>> @@ -392,9 +392,36 @@ static u64 read_hpet_count(void)
>>>>>>      return hpet_read32(HPET_COUNTER);
>>>>>>  }
>>>>>> =20
>>>>>> +static uint32_t __init read_hpet_and_tsc(uint64_t *tsc)
>>>>>> +{
>>>>>> +    uint64_t tsc_prev =3D *tsc =3D rdtsc_ordered(), tsc_min =3D ~0;
>>>>>> +    uint32_t best =3D best;
>>>>>> +    unsigned int i;
>>>>>> +
>>>>>> +    for ( i =3D 0; ; ++i )
>>>>>> +    {
>>>>>> +        uint32_t hpet =3D hpet_read32(HPET_COUNTER);
>>>>>> +        uint64_t tsc_cur =3D rdtsc_ordered();
>>>>>> +        uint64_t tsc_delta =3D tsc_cur - tsc_prev;
>>>>>> +
>>>>>> +        if ( tsc_delta < tsc_min )
>>>>>> +        {
>>>>>> +            tsc_min =3D tsc_delta;
>>>>>> +            *tsc =3D tsc_cur;
>>>>>> +            best =3D hpet;
>>>>>> +        }
>>>>>> +        else if ( i > 2 )
>>>>>> +            break;
>>>>>> +
>>>>>> +        tsc_prev =3D tsc_cur;
>>>>>
>>>>> Would it be better to set tsc_prev to the current TSC value here in
>>>>> order to minimize the window you are measuring? Or else tsc_delta wil=
l
>>>>> also account for the time in the loop code, and there's more
>>>>> likeliness from being interrupted?
>>>>
>>>> I did consider this (or some variant thereof), but did for the moment
>>>> conclude that it wouldn't make enough of a difference. If you think
>>>> it would be meaningfully better that way, I'll switch.
>>>>
>>>> Both here and for the aspect above, please express you preference (i.e=
.
>>>> not in the form of a question).
>>>
>>> Let's leave it as-is (just one TSC read per loop iteration).
>>>
>>>>> I guess being interrupted four times so that all loops are bad is ver=
y
>>>>> unlikely.
>>>>>
>>>>> Since this loop could in theory run multiple times, do we need to
>>>>> check that the counter doesn't overflow? Or else the elapsed counter
>>>>> value would be miscalculated.
>>>>
>>>> I don't think I see any issue with overflow here. It's the callers
>>>> who need to care about that. And I don't think this function will run
>>>> for long enough such that a counter would not only wrap, but also
>>>> reach its initial count again.
>>>
>>> Right, I haven't expressed myself correctly. It's not overflowing the
>>> issue, but rather wrapping to the start count value. Limiting the
>>> iterations to some fixed value (10?) in order to remove that
>>> possibility completely would be OK for me.
>>
>> Hmm, I was in fact hoping (and trying) to get away without any arbitrari=
ly
>> chosen numbers. The loop cannot be infinite in any event ... Please let =
me
>> know how strong you feel about putting in place such an arbitrary limit.
>=20
> It was mostly for safety reasons, I wouldn't expect that loop to need
> more than 4 iterations really (which is also an arbitrary chosen
> number).

Fair point - I should have said "without further arbitrarily chosen
numbers".

> Let's leave it without any limit then for the time being.

Thanks.

Jan


