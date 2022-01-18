Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 81A6B492759
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 14:39:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258509.445249 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9ohb-0000m2-FL; Tue, 18 Jan 2022 13:39:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258509.445249; Tue, 18 Jan 2022 13:39:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9ohb-0000jt-CE; Tue, 18 Jan 2022 13:39:11 +0000
Received: by outflank-mailman (input) for mailman id 258509;
 Tue, 18 Jan 2022 13:39:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aElt=SC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n9ohZ-0000jl-81
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 13:39:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0288c671-7864-11ec-9bbc-9dff3e4ee8c5;
 Tue, 18 Jan 2022 14:39:08 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2059.outbound.protection.outlook.com [104.47.2.59]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-6MJ52gYLO5GhamqoXG-yog-1; Tue, 18 Jan 2022 14:39:06 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM4PR0401MB2388.eurprd04.prod.outlook.com (2603:10a6:200:54::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Tue, 18 Jan
 2022 13:39:04 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4888.014; Tue, 18 Jan 2022
 13:39:04 +0000
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
X-Inumbo-ID: 0288c671-7864-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1642513147;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pvbZPZZ3GTXXxQZNTQLenn3sdgw1sOYj6KMQbhe1c3k=;
	b=ET6aUDe725nUBO71SkQAZ/A0y6+pzf9UY58qoX7j9QJldDjT7nM4lAVcdvILUrCYPcDGTB
	BKlEXxFqgzogQnIHHc+ehLjdLb/7vQLPXQ+aPSTRAW4Zl78Gg2mS3a9diiKjkeBv00I1Qd
	H1hn9OQv3/hSMmeNAMS3e2O/ZcVIWqw=
X-MC-Unique: 6MJ52gYLO5GhamqoXG-yog-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5igp/YCnJTOAcHoCQ2OBJzOBw5rSXlBio2UUDwxZZdPcE8tQZQvTlEbAA9kT1u3ZRVyvvcQQXTKOP3lzyK+no/EPJqqdSDdhwU4lmBcfm/qo2F7Fw3aTcTU8HuLU5hQhb6NBp5msBNgOxaIiu/Y+EpmL1DPqIiqzto4rIcgR4Zf0sMIRfBPiSNxi5zQsvqLb9aaR7tyq7W6TXuGM5jOtOKCacwTwuZAdnfpjSobIJT8Z5NHCmo320gMOpKI/3vvOuC0LsbeSxBHnFwvQkLPoVUxwpLwqEdcSO3owIk16HCpu/m4ByXwCuOTKQ05SRLSQ55nElkidMP92+0/KKN7hQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46/AV6e9Ml293GQJtOOgTGpbANnAuqmnD4/momB9YNs=;
 b=NLj08Gl1DfcusZ6gkGbrerYlMJpFpI+Mk9BTKzCC0D9NXpB/W8kVPkQruuy935NgqmPXczbdngTQ7BD5K9EXZVXy7aMN3kJFz6zCKRlY3JIuSdj6oHuGHqp4Dzo5ZW9Gw+dmVNN/b6w5+p7sqJfzxq0b7jLXLzbwkPsyLzGDhPkq4StQm+vhxkDsj5Ff2a3NOL4N7YZIlUooMG4NUnXCp2xNdo1ntQu6wugYkatwdqJT2/+Rg6RPd+FRwTilKKMQL+jNNurGWkTWaFmEXRjKZG/gEZywDYRpiupMDObR5i6BPK2Oq2R04Iyh2R8Z1SrCdOZDqC/IuqBr+HIjvjYFbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <4bc4e379-fc9c-581a-3b03-9025e9fd92cc@suse.com>
Date: Tue, 18 Jan 2022 14:39:03 +0100
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
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yea2XRrFn7qCIx/h@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR04CA0084.eurprd04.prod.outlook.com
 (2603:10a6:20b:48b::26) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6f8a1fd4-ac0e-498b-a688-08d9da87e4ab
X-MS-TrafficTypeDiagnostic: AM4PR0401MB2388:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR0401MB238825FC2239872B8C9DB8F2B3589@AM4PR0401MB2388.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nY/cT/l/sgnH3fSm3tm4u2WRV+WDvGpvtMT26TnRyjQuWsVPoh/zRK7TejL5f9rM+uXN+HlbliqWdUTDzvEjK+AUsaXit+NsffDtSY1coj1xfLYzhyQ6Y1NOJnhawjdCJNBujpN2VUFnawOpudE7aao2aYHiwiwHqWP+HBG6utSU6kQ4leP5aHt4mV9lzNVYnQfu+0Si1OqdkFybbKGVdO+WJxYGuOr0LoWGu1X+0lDgNRHpYN3tMo0FI/mVPksKzQ8K0JoZ4dtAr/Cmeq4CpSNcFNhVAZGdsXQTz7nYbim5ywqCwUwCEGUxMSupI+pbLKOQb8gKXByiKymevRUUcHzSP+Q3fwPHGk/x0fxzX6nHSNDAeRmTzA3DNhnmVKvhswnYa0c3lXITkH5xhjtQKqFHSgeXRBGlUQSEQpG0YqvBMNWbf8BT8BFyII0C9mllcnMX7DLnW7r8d+YTjqXEkwzTgVywcuCE2Abq7iPRXS5rHWzybmaf/27SmS6vKvKYBclFTg2qMCbBLBsVEwI/zRqdETdcm+QajRk0p08xEuwAcL3+pAxyhL3BT0PfCDZX/GmTwbPfPIBKFkNtHanBxXBhsRTG8xzAg3UnQgJ2f6bcT9PmWyCjPQcRmAe7WvsSwW7R/+A4tOmKgB5JlVRaGfZI85DNLfxJaC+/iD7rTW6P23gGeLjtCJIZm1IJxJ+633mMFfc3yLZ98TnE5G11s/PDZEjf9kaeR8FmBKRRuBw+tbqBXxXLthI9sx0j1BEl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(8936002)(5660300002)(8676002)(83380400001)(6916009)(31696002)(186003)(38100700002)(66946007)(6512007)(4326008)(6486002)(2616005)(508600001)(66476007)(66556008)(54906003)(2906002)(31686004)(26005)(86362001)(53546011)(6506007)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/lXmbs9r13dP9IbJYsYM//llLjZqFUayJjSWT9EUMdQN8swdWcLcXOeQM1ri?=
 =?us-ascii?Q?SoFqDYraFbi0Mfnap4PyJe70KISukbfS3PFl72gaaFKI+wZaqTnbi07eq55a?=
 =?us-ascii?Q?tRgGUGtYY1eEJLd1sfakkEvnCt9t9FXCPzem/N5HKXQ4bWdYQbTpeneGZ8Lp?=
 =?us-ascii?Q?qUecDRtehLSJtVO5fxHgqUNBs4affxniCEsuIyTQWsZ5ISO6KHM2e6wyiSh+?=
 =?us-ascii?Q?8q8JzsNdDw8ZqgdKWMkcdsAOwWu/kMULy+aYzn+Touu0nlsEEZu+TZZk6Qz+?=
 =?us-ascii?Q?OlYQFYW79y2kS8+ZnFFZY/JbSk2rGFrebpQsmCSYRXOwliyVS1COmsbq7iB1?=
 =?us-ascii?Q?iNRq4U70xv74srbLGznv9U3LqMiihY2rT/btb2Us+EbpyyNPwvpBjXn9IWNz?=
 =?us-ascii?Q?iEZnkuSuCZtcYNCZqxSG6HwbFFzW4WhgFlngqDA8UnukZrNytebd/1XUkG2T?=
 =?us-ascii?Q?wZib0IEE4u97N3V5d5zvlzehS6cgJYmLSQvODASXZ0bHmCkajAUiwPToDEoa?=
 =?us-ascii?Q?DxOwrgzmJXoGQAgRr3K1HZve+2Pb6l2Xc8DR8vqqkePeslQLwWEu9iHkXSPP?=
 =?us-ascii?Q?rHDcs76Y3irCFDNWUva+jrByHOp9aCZ0oIyoaHSUnch4Y/CHqcHoYZXOghZ2?=
 =?us-ascii?Q?ryipRrt+JdsFh+qyswuD7Ttk423CVUNShKU4ecIAjFQs1DSAG28wpP329ne7?=
 =?us-ascii?Q?bFSTSa8Sb7lSMusGt7kb/d4RDHS5FH4tELGftBZb95oZMVeJ5k674fpGY7Ls?=
 =?us-ascii?Q?zUT9v33U/5CS303G/3b/R18ZDJpIowB79TQkdmhDi2N7QTgpN9MEH1YDoBUY?=
 =?us-ascii?Q?e61zlj3fy6p7sCq/WyfbiLjX1Z0ILlbnUFrVYIV+HAkXUU1oPYFLzvcMX577?=
 =?us-ascii?Q?l+/fBGK68NBMeO4dxJbeluHQ+1n24ZpGINnYFg0zDk9pR5sI385oLz14dS6R?=
 =?us-ascii?Q?pPFXZvU9/Ihh40nI0WH1dpt4kw3N8e8CucDH9y34E6vyH296/OZkw3dmg60K?=
 =?us-ascii?Q?sei7esyo1u8Yni4Z+HsYT2Gxk+0QhVq8SdKc+lqEwy0RikWbzx1JuidAyfwW?=
 =?us-ascii?Q?NJ8KA6HsN73AIwR5CJkylai5SL3nDSGJ0s/pA1jIZk6dmt0HBjwCp7EGLnWJ?=
 =?us-ascii?Q?vEMXofVoLeSDoH9LxniNvl1/y9ZGWxzfynHeC8V/UBP0NSwBJEMmdp1l7tVZ?=
 =?us-ascii?Q?ctakt9PPBflS2JM7iQf+IGDYzOZ8NusBYTFfOzqpnbRCls7ypUDkeIw95ODX?=
 =?us-ascii?Q?T3IL75aTGmX1UaJRqD+y0G32iohqzq6u9skLFEBbweIw1XHJ+fTjZzTww0MG?=
 =?us-ascii?Q?vgCKZDTrsS6QjjZPeXSZCq8tmVi2rh3yNdb2Y3BD+LmyuZM8cEPVGWkEboLL?=
 =?us-ascii?Q?SYP1c1E3Vehb4GGIZ+k4vs3u5sHGGq2iNey6c763obZrAjzEzQt86wNatjNv?=
 =?us-ascii?Q?y+G72luxPFW/QA1zRIIbqD90jf5OXd92TpVRx+z0yAd2IKegSbmsxh3fXX9b?=
 =?us-ascii?Q?OKFlbdH3NEGdwt18LDdjjmPbUTZgMD3yXw2Zs1U2wgqLOPZ8YqSZK+07wtPZ?=
 =?us-ascii?Q?v0cIc0NV0UQKBltxfbn0i9NASZNdG7Q60L5xgpaDmSNldrDMHfXwbDNjyxxw?=
 =?us-ascii?Q?pFEw635RdFq6sPFE+kA7ft0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8a1fd4-ac0e-498b-a688-08d9da87e4ab
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jan 2022 13:39:04.2829
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jkEOvp0o0Ug8UxROEregMEPojpjP2KLzzs59z86GOKgPEbaEry+feEhveKWO8h4f+7T2HPkxge61chM8ef6ABg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0401MB2388

On 18.01.2022 13:45, Roger Pau Monn=C3=A9 wrote:
> On Thu, Jan 13, 2022 at 02:41:31PM +0100, Jan Beulich wrote:
>> Calibration logic assumes that the platform timer (HPET or ACPI PM
>> timer) and the TSC are read at about the same time. This assumption may
>> not hold when a long latency event (e.g. SMI or NMI) occurs between the
>> two reads. Reduce the risk of reading uncorrelated values by doing at
>> least four pairs of reads, using the tuple where the delta between the
>> enclosing TSC reads was smallest. From the fourth iteration onwards bail
>> if the new TSC delta isn't better (smaller) than the best earlier one.
>=20
> Do you have some measurements as to whether this makes the frequency
> detection any more accurate?

In the normal case (no SMI or alike) I haven't observed any further
improvement on top of the earlier patch.

>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Obviously (I think) instead of having both read_{hpet,pmtmr}_and_tsc()
>> the calibration logic could be folded between HPET and PMTMR, at the
>=20
> As an intermediate solution you could have a read_counter_and_tsc I
> would think?

Not sure in which way you view this as "intermediate".

>> expense of a couple more indirect calls (which may not be that much of a
>> problem as this is all boot-time only). Really such folding would have
>> been possible already before, just that the amount of duplicate code
>> hasn't been this large so far. IOW if so desired, then perhaps the
>> folding should be a separate prereq patch.
>=20
> You could even pass a platform_timesource as a parameter to that
> generic read counter and TSC helper.

This was the plan, yes, in case I was asked to follow that route (or
if I decided myself that I'd prefer that significantly over the
redundancy).

>> --- a/xen/arch/x86/time.c
>> +++ b/xen/arch/x86/time.c
>> @@ -392,9 +392,36 @@ static u64 read_hpet_count(void)
>>      return hpet_read32(HPET_COUNTER);
>>  }
>> =20
>> +static uint32_t __init read_hpet_and_tsc(uint64_t *tsc)
>> +{
>> +    uint64_t tsc_prev =3D *tsc =3D rdtsc_ordered(), tsc_min =3D ~0;
>> +    uint32_t best =3D best;
>> +    unsigned int i;
>> +
>> +    for ( i =3D 0; ; ++i )
>> +    {
>> +        uint32_t hpet =3D hpet_read32(HPET_COUNTER);
>> +        uint64_t tsc_cur =3D rdtsc_ordered();
>> +        uint64_t tsc_delta =3D tsc_cur - tsc_prev;
>> +
>> +        if ( tsc_delta < tsc_min )
>> +        {
>> +            tsc_min =3D tsc_delta;
>> +            *tsc =3D tsc_cur;
>> +            best =3D hpet;
>> +        }
>> +        else if ( i > 2 )
>> +            break;
>> +
>> +        tsc_prev =3D tsc_cur;
>=20
> Would it be better to set tsc_prev to the current TSC value here in
> order to minimize the window you are measuring? Or else tsc_delta will
> also account for the time in the loop code, and there's more
> likeliness from being interrupted?

I did consider this (or some variant thereof), but did for the moment
conclude that it wouldn't make enough of a difference. If you think
it would be meaningfully better that way, I'll switch.

Both here and for the aspect above, please express you preference (i.e.
not in the form of a question).

> I guess being interrupted four times so that all loops are bad is very
> unlikely.
>=20
> Since this loop could in theory run multiple times, do we need to
> check that the counter doesn't overflow? Or else the elapsed counter
> value would be miscalculated.

I don't think I see any issue with overflow here. It's the callers
who need to care about that. And I don't think this function will run
for long enough such that a counter would not only wrap, but also
reach its initial count again.

Jan


