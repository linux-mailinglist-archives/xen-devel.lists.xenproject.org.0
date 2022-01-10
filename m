Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F7F489E00
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 18:05:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255514.437870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6y5n-00039D-LR; Mon, 10 Jan 2022 17:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255514.437870; Mon, 10 Jan 2022 17:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6y5n-00037A-I2; Mon, 10 Jan 2022 17:04:23 +0000
Received: by outflank-mailman (input) for mailman id 255514;
 Mon, 10 Jan 2022 17:04:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/GSA=R2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1n6y5l-000374-LH
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 17:04:21 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 596235f9-7237-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 18:04:19 +0100 (CET)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur01lp2052.outbound.protection.outlook.com [104.47.1.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-36-BDnKyrL_OXmGXfE2yoqDIQ-1; Mon, 10 Jan 2022 18:04:17 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2447.eurprd04.prod.outlook.com (2603:10a6:800:53::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.11; Mon, 10 Jan
 2022 17:04:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4867.011; Mon, 10 Jan 2022
 17:04:16 +0000
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
X-Inumbo-ID: 596235f9-7237-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1641834258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b2nEafEhS60r2s+a3eB8VJcSMVaDd3MdoS5flB9lIHg=;
	b=FTU9g3AdrL+kWmkCg4ecUedgyN/o4unfN3sUD0wbWYxRAaLowVQ+Nh6vWIZOAaVTrPEY98
	IJ4uo4Vya98/b/V9DGCTQuiQUtuO9RTmLvblL7fcPptH/h16ZaXf6Hw8/7MVWyT4LqZTaf
	5BFm+th0zmE1DA7X5QCSRkPrcuJyTu8=
X-MC-Unique: BDnKyrL_OXmGXfE2yoqDIQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GWGVVDqap70XiDQxTW4nEKMDnr8kL4ZtqYNGiw8kUB9oqUA8qI0p66abnkSKipWt8fZT63GpLUkM3prF8Hr7kBDp/4dSG0OYUGj+hQlq4hCY00fKbP+mjsuLtt8NNPZPEF4b9jSUXiNCNge3h+f+xbl7TU/AGIdo8RALII+6Kn/9HjBEdSl0UCfESylx0SOGdKhG76Q6pgnFCXV5BhazqIT/niFZhnaI/21AmmHKLIPTosjhMOdr6uwJm2LE8wV5NKVUrYDCi/bxuUdKYWkUZXvosgiR65RnSs7GaeEf4qYa47ecNHXvGsGsGJQvkT9tEvHHuPh3BV7wgb6CqQ/HnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D/qz+VDnnOiM+8CL3hmDweRilidN9IzU+w4L9mzC25k=;
 b=OvvM+jSw5spAZ9OsKXR4df95sj2qmXc5gCnruIP+BufvXmGi7ZT4c2f/+IxMEUM5ijvbI8eX+znrOzTrUmWuE39Xsq0ESF3D7vA78dE3sZ2EYdNbsEMWi1k8udniLkjEvta35ki2hQjt8xAmrUdbfaPUFlm8LwYHy218k657I40m8n8fxrE5TZNnei2NIManSd0GP041/cIG8ir6MM1A5amNL7Pyc6Qp3sW37jglT0JsU8SX4r1RO706evRkR2H2+ZuA29sj5A+1L6gw3yXXm1sIkZwQSdlYlSQwT+wfBUE6T8K5LsMSCM0k+r8FfPJJXKZNttjcz7RipHLJVqlwYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <d887e3c2-8d89-8855-887c-943ebac6494d@suse.com>
Date: Mon, 10 Jan 2022 18:04:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: xen 4.14.3 incorrect (~3x) cpu frequency reported
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: James Dingwall <james-xen@dingwall.me.uk>, alexander.rossa@ncr.com,
 xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <20210721092958.GA2502468@dingwall.me.uk>
 <c9c6778d-9823-4b07-fb48-604acef1f3de@suse.com>
 <20210726123332.GA3844057@dingwall.me.uk>
 <06be7360-0235-3773-b833-3e0d65512092@suse.com>
 <20211105152501.GA485838@dingwall.me.uk>
 <20220106150809.GA856484@dingwall.me.uk>
 <78540c18-c54e-07e8-c099-d7bfd29bea91@suse.com>
 <YdwodzmyvNwGJaSM@Air-de-Roger>
 <539e31bc-3e68-9e9d-3bb3-2d0f1b2834fc@suse.com>
 <0b2d6240-5780-b8ea-8828-ece44047cd63@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <0b2d6240-5780-b8ea-8828-ece44047cd63@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0304.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58ebb3d4-c94b-4733-ad43-08d9d45b3ba1
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2447:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB24476DFAA579FACFEFFD5B4BB3509@VI1PR0401MB2447.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kHigwHDil1vX5jMz7/zuvj7XRQAz/ARTzZzC72QRVSCVRJbkE1s3mcXjtnbOeiT4n3RQUu/FYi10ChGAV/TX76BH4eH9K+iTm78RVBLXXLqhKjHey9kCmXPo/xqegZ4qjr/YbYyQRWKsySCD/Hfm4HsyOeZrZNTvtAVsZZk1XQeCjsA80tdN6bzeNUVNQ6YJXRAOqCyuKYaGLEdr1F96C3JLMpxitAmHmr2kq9i+18kUkk1jPz2NlJxdYE0LezsGv4oeGq5JfOc5bTkvhsbJqu6XwIfST7uqOLTbhE3suI42u2mxH6kPMjxGwCe/3bplJGNNaaW4aiRpXDgnZiSmj7B/drcrnNyIywVoF6bu1qTI3Oe9WwkhUqvRBoydjl13Sw4YAjlKIIX6b1bVFFDx8HUp5eb7FTqziFvXiWT3beEsyKaJanBRY5pvowU5NQsgV0h4NO7iMZnQ/GhIQ7S64QTeiSOo8pczxhIB0CT/nFuLBX5gJK7Mh/c6VySIulDhiM0TYXSvVavPv7ayNoow1xyX9dBydyFa6dBC271j35xdujlsuj58mVt/gZnhhL1+6uxIzFcJpHEF5o56L8MrCny470vsazwBzczRscj89/WMRvoaILjO0cNSic7DSKDjW4fD2evCTHPU5gVdY1ZkB04UhPqCWNe007ibvqHGF0XujwybcFGg8XVbQJiXR9n1uWHlfhi7rjEU2PMNDm49JTmLgeVO8Jlw7f8y84OKgdo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(508600001)(186003)(26005)(54906003)(66556008)(38100700002)(66476007)(6506007)(2906002)(53546011)(66946007)(6916009)(86362001)(8676002)(8936002)(4326008)(316002)(83380400001)(2616005)(6666004)(31696002)(36756003)(6512007)(5660300002)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aie9+ScwcFYXXKKAmpp4QkNmak7i+IV5HWJh/fLpK9Lks3eUDuUxO14dvwiZ?=
 =?us-ascii?Q?58EDIpzrWPjNQpq51MKCRXnCGllpThR8EVlv7/PNlM1KogSMHEYSmhYnBQfI?=
 =?us-ascii?Q?YzKTJobuG9hqa9lt6yqp/zUJ3V3JBW9Vdb+ybrV5UvPrFdbePhxaRVnLv1fv?=
 =?us-ascii?Q?U9Sv525ZS+BGaspQFIsxt2SA3OmPksfEYTsJ0C37K9xJsSnDMpHvovey2wnn?=
 =?us-ascii?Q?H9QczMD0TKnk/Y4LXVJNB5sK6DzFrs6x5ZC3e9fB32yrXQwmjJESudt08MOf?=
 =?us-ascii?Q?u9IUPpPr/WwAajI5uISM7c7/di2hPzIs2qL6IzTJMuQ6F8IAXxR0ZJ5WZdjW?=
 =?us-ascii?Q?PM0wMQa35mPZSc7vomr6nSC3pu9to9lOtG+h0TANLifPQaFQgZBSxTSimkIY?=
 =?us-ascii?Q?ylAAt2Zqsq/CyE4dy8SjJKfkWNpTQK/peqQIsqJwg0r/LJje+ZFN61hsz6q/?=
 =?us-ascii?Q?R1EQxIBFhInpPx8E/YSeSi8deZYZQQ2R1gE8JBblYpyvmzYSIsV2CJpjO/OW?=
 =?us-ascii?Q?QRU2PvpE31opkHRD+WOfTOhqyYbjovtFuXTSSfyUB/M2bxNMVO6t5ccWucv9?=
 =?us-ascii?Q?HF+cLO/5JR7rtEEhmacU+d0/3jxH8OTcu97wOXIqZDlThFgK3ZhfNqLUwg2+?=
 =?us-ascii?Q?dL9XV3sm/EdA6S1Ar96TRREO6F+tkkpp6iggJo5qKRiWNoYokVMZM0GHBf6u?=
 =?us-ascii?Q?jx554CdwdZGjX+mxCmxym2gi0B5Tik9fwGs93hpYwafOkrRzy8LH4dJ0Ykru?=
 =?us-ascii?Q?cHBzfojytmcXN3g4xmnKUbHc+FMs0AkhL5cJCQjbxn+aFyOGfdCQh+quuw6i?=
 =?us-ascii?Q?29ntj9lBtvPcCGVFRKUXb52d6hJKed2WYVsO8TD+bb4YRJ3uYDj80dnFXrkG?=
 =?us-ascii?Q?N94q8ICOKiHM0XNbAXgft+hQTnQBh/SjE0ZJ1+b9U68KXcm0cCz4TMx9PNVe?=
 =?us-ascii?Q?HHyRMmnAJImiQzVdVQqp8lnXrdYjdcXbRnqloUx9vib2U1LXF3TsQ5dzYu0P?=
 =?us-ascii?Q?sfaE1M5Q1kZCj71QpM+3o151rfloME3DnMAdQ7xEl0lm7T5B1MT6AVGVyHFW?=
 =?us-ascii?Q?zTsfeQLr0aF+DBIVt3HwW8Q2ixfmi/Q2ze5oDwT6PW7MnpyXSV5ctGdGKtsW?=
 =?us-ascii?Q?dltXd6JbnqvVKhlTAlc2W+Z0Kb34VW7Wk5tShIQLU/o7vw0no43M0/8IM+b7?=
 =?us-ascii?Q?NE2EjvamZMXJNNTdBNL+8se7DPOWG3ExJHb77iJhFLyRGJWtHNFAzR2eDdXq?=
 =?us-ascii?Q?Ri4k51XvuU40jc4ALVxJA+xurr0FT4/jITN9GYx0FnXOalitjdnwqSa10vLc?=
 =?us-ascii?Q?efqEL3/X5/QvPjSdWkEKs2nWU8UT1OGaglUt1+rr5jlvN6y8SoLmf+Ky3U3E?=
 =?us-ascii?Q?BoyPiL3p05gDCMthd8D2oizNFWIDFmDPs0RgZs00aYhZVXRBNKDujHhBgRSv?=
 =?us-ascii?Q?T6K3pE4C6USLMvjrQJCiaLtroV/hiHUIU59ib+tJoA+Bp2MO4bp5pCY+QLjk?=
 =?us-ascii?Q?8MaR6HZ7eOhD2bjIOwhV0CvKSOExMWi/C5yEWdEhpxMAvuTxrUeCNG6rlHLD?=
 =?us-ascii?Q?sbTBWiJQPTpAD0BlQ6CAUra4OP72tupCZ38PajE0q+p8gKqcjhEHyNYNB975?=
 =?us-ascii?Q?gMhSIJ117a2rmxXu3l3qTqU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58ebb3d4-c94b-4733-ad43-08d9d45b3ba1
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 17:04:15.8708
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyBXXKcq6QN1IdYwLrtoJkW5TF4WYtoDhYxjJhyR2fKn9CidLbHYJB5MNjlajmRVKrM9KMYoiKdH+CQUfo2LVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2447

On 10.01.2022 16:43, Andrew Cooper wrote:
> On 10/01/2022 13:11, Jan Beulich wrote:
>> On 10.01.2022 13:37, Roger Pau Monn=C3=A9 wrote:
>>> On Fri, Jan 07, 2022 at 12:39:04PM +0100, Jan Beulich wrote:
>>>> @@ -415,16 +416,35 @@ static int64_t __init init_hpet(struct p
>>>> =20
>>>>      pts->frequency =3D hpet_rate;
>>>> =20
>>>> +for(i =3D 0; i < 16; ++i) {//temp
>>>>      count =3D hpet_read32(HPET_COUNTER);
>>>>      start =3D rdtsc_ordered();
>>>>      target =3D count + CALIBRATE_VALUE(hpet_rate);
>>>>      if ( target < count )
>>>>          while ( hpet_read32(HPET_COUNTER) >=3D count )
>>>>              continue;
>>>> -    while ( hpet_read32(HPET_COUNTER) < target )
>>>> +    while ( (count =3D hpet_read32(HPET_COUNTER)) < target )
>>>>          continue;
>>>> =20
>>>> -    return (rdtsc_ordered() - start) * CALIBRATE_FRAC;
>>>> +    expired =3D rdtsc_ordered() - start;
>>> There's also a window between the HPET read and the TSC read where an
>>> SMI/NMI could cause a wrong frequency detection.
>> Right, as said in an earlier reply I did notice this myself (actually
>> on the way home on Friday). As also said there, for now I can't see
>> any real (i.e. complete) solution to this and the similar instances
>> of the issue elsewhere.
>=20
> Calibration loops like this cannot be made robust.=C2=A0 This is specific=
ally
> why frequency information is being made available via architectural
> means, and is available via non-architectural means in other cases.
>=20
> There's a whole bunch of situations (#STOPCLK, TERM and PSMI off the top
> of my head, but I bet HDC will screw with things too) which will mess
> with any calibration loop, even if you could disable SMIs.=C2=A0 While,
> mechanically, we can disable SMIs on AMD with CLGI, we absolutely
> shouldn't run a calibration loop like this with SMIs disabled.
>=20
>=20
> Much as I hate to suggest it, we should parse the frequency out of the
> long CPUID string, and compare it to the calibration time.=C2=A0 (This
> technique is mandated in the Intel BWG during very early setup.)

This, according to some initial checking, might work for Intel CPUs,
but apparently won't work for AMD ones (and I don't dare to think of
what might happen if we run under, say, qemu). Imo we'd need to deal
gracefully with the case that we can't parse the frequency out of
that string, with "gracefully" including that our calibration still
won't be too far off.

Also I wonder if we wouldn't better prefer CPUID leaf 0x15 / 0x16
data over parsing extended leaf.

> If it is different by a large margin, rerun the calibration, and if it
> is still different, complain loudly into the logs.=C2=A0 This will fix a
> one-off-spurious event, whereas if e.g. the system is thermally
> throttling due to a bad heat sync, there is nothing software can do to
> recover the system.

I was already considering to use reference data like that from CPUID
leaves 0x15 / 0x16, but I couldn't really settle on what "large
margin" would really want to be. Imo we should try to correct not-
just-as-large errors as well, if we can.

For the moment I continue to consider my plan (outlined in another
reply on this thread) superior to what you suggest, but I'll be
looking forward to further replies from you or others.

Jan


