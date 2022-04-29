Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 365F35148FE
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 14:17:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.317256.536502 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkPXd-0001Qq-5g; Fri, 29 Apr 2022 12:16:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 317256.536502; Fri, 29 Apr 2022 12:16:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkPXd-0001Ny-2Y; Fri, 29 Apr 2022 12:16:09 +0000
Received: by outflank-mailman (input) for mailman id 317256;
 Fri, 29 Apr 2022 12:16:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iTs9=VH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nkPXc-0001Ns-86
 for xen-devel@lists.xenproject.org; Fri, 29 Apr 2022 12:16:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24c081f0-c7b6-11ec-a405-831a346695d4;
 Fri, 29 Apr 2022 14:16:06 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2173.outbound.protection.outlook.com [104.47.17.173]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-41-SiqG93IWMI-8IY4GDlkBkg-1; Fri, 29 Apr 2022 14:16:04 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DU0PR04MB9465.eurprd04.prod.outlook.com (2603:10a6:10:359::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Fri, 29 Apr
 2022 12:16:01 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 12:16:01 +0000
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
X-Inumbo-ID: 24c081f0-c7b6-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651234565;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WejTJcsDIC5Q7p1zbuIqZfgtE5WTXLAMIFgW6M5Nm9I=;
	b=DXsazA9bKmJWQjwdl3EszlFaB0d5EXmwTWQXhzAKIV84oJNiXoIafqBK0xNGfp48LrBjrE
	mtyg+FTE9yAT0hUO3rOnNy0PWhGFO+F7kq23+rsJagpzS604J1O3zM4yPlSlyhTfjet5P7
	RdzxQG0ORGYcCE9Cx21QFGil3979WFQ=
X-MC-Unique: SiqG93IWMI-8IY4GDlkBkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MiC23CgbcKEYZUYEfV2t6QwMtD4H9XYQ5Y2QxVukO5GzT+jOUSIHYWWcZbThxyk7z8SETAaRPazL+IZnJ1oVYUxsn8iiQQinhCo0QMlrJTaPY3P35efe3Y6yhaCDmE2HaDQOLLy82K70OS+MuEvIP0tsyaF5/O8afCl2CGSlvPURb1x8LvetMOwPlw9k+abB0nrzSJISR4hszJVCAHDqYxTGIzWRXoLQE697thZuFyvSnqOvIyI0qrCM6ia7fGlArehfb36GVz9pC8yHHHA7gMiEzroulurNgjzh9NBRaR3mWytajU7y25VH709nTMWXmLBM/s1P6nxd8s8qfVwWxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJ5RuXG8WItrBhM/uQ9rlzRMbGZNqSxGBHKHzUt6TOw=;
 b=LyXfBwvDnh9y+1IWhVdgLLVZChZfWKG7G8bMm7J+oyjpRatqPSkaR0H0/CpPhfKct0Ge1NgZz2g5YiiSPmTJCsv6hW3wqMh3OP9LaAE2R6G5L3xzupSKS+l/3zChcdHWG66UCvzGu0xLFzBLDle0/ZkMj6nJU1983VsS1avJIRL3MJbuLZNqTcqtud+9UIV9Xhf7/kT9KvmF7M/xl2n8CxqoBMZnIom/jSPLOW+U9iWPC0QQMry6Q4/an7sie+5MNdDDFu07t5xeSR3ADh9Lo0JakO0DCFkL0KwIW4irJXezm0trIhFIF0P7AxI+o8s4R7ny1VbtfZSFvRDOzU25Jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <85c55676-b21f-1eb4-0471-19ca9b6de39f@suse.com>
Date: Fri, 29 Apr 2022 14:16:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
CC: "roger.pau@citrix.com" <roger.pau@citrix.com>,
 "ohering@suse.de" <ohering@suse.de>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
 <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
 <30ac2ce8cca7217775eaa704aab45a62deb1272e.camel@suse.com>
 <e061a647cd77a36834e2085a96a07caa785c5066.camel@suse.com>
 <35599105-b441-96cf-7537-ccf9dfac0934@suse.com>
 <fd07c28fad352a476544258f2ac4d652062b2701.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <fd07c28fad352a476544258f2ac4d652062b2701.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM7PR02CA0004.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::14) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9f074ba-d6fd-47ed-b5f5-08da29da064c
X-MS-TrafficTypeDiagnostic: DU0PR04MB9465:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DU0PR04MB9465ABEFB4936766A35C7E87B3FC9@DU0PR04MB9465.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AWn19TCuL+SpfJRy6ulbCKZlMOlaSe9SudPB+wYbfrvckBx9fDWIlGiZlRT1afxDcJetbIDZQ4NfeJJ8Hezs91M2iwA8xCgMeJ3t3yl0f4eRg+FjqKsuou5dkSWU5r+lloSiqCGNTfeKzea6opLho8Qu3U1PzRsFykRxsTnOJIkTR1SZvyqqZh/SJ1xK66fVYWo63Ut+DELS3SCqnZ3k7Syr58NnWNsxBRx3u2ojQy6xzhECgxp/qhrIklxWO5BpGUenF35rct8EWeN7+LcCyszW0A+O85CrYROZPGyra4Ag0AR13yglzVjJoNhQDe0TgpA50Dva8LDemyV6yRUK/CPcHSpK/6k6/byMJXwEWpNC1fhXtFw6VPzr2Ptc44/bCSAGn88Br03MqwLNP7+5gEHiEoz+WShlfIz4BINJoYpuXg+jZj1suS+h4f1JR7mwSAlvaWi1ecxQXsib7VIlBDe/Hk60tSjXpyYPCIq4Nj8YlKLyvSAzzRZcMxmMq8uXojKSz58ch89ebVxRpu8Nl/lHJwUsal6BgeJHkmjdbqqxqs/n5HLpEQzMeT/K7cChEPPjpA3gPN3C7k2288R6aMzf0Or4Xu18QqzA1x2aBOxUDVBc7JpeyTGJiFb3fwhYjkyKhAILDHnB8vW4jDJVR935LTR27aDi6wri13UV8mlhskHatCtDyV7eqy+v2eTO1keiGQjpzr1EjTfk3HQPiY1UlnfqVT1PYvPdG9E/DsI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2906002)(8936002)(5660300002)(8676002)(86362001)(2616005)(66476007)(316002)(31686004)(6636002)(54906003)(37006003)(66556008)(66946007)(38100700002)(6862004)(4326008)(31696002)(36756003)(83380400001)(53546011)(26005)(186003)(6486002)(6506007)(6512007)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uNh+ENphwdk1bM6zKZj5K/IQZbIT0OlQwNyiEdTjV9DPRRgnNDGmlrFAf9U8?=
 =?us-ascii?Q?NIBgoM7N959YIslmqDTPCcWBKKOJYvVUBAe4aoRGaE2FQl+IUfmpxCmOWAt3?=
 =?us-ascii?Q?FXz/BoVSgK7rDarZXHZ97a5EKMpi++OMvceMIFMK/Q7XqgXvYBUjhadd8hyd?=
 =?us-ascii?Q?nctFNUC+KbwOks5XAoyDSq9nz/67FsAA2GIxoNhVCUKTqjqpA5EiVR1ivBAc?=
 =?us-ascii?Q?21CrAIAhFCxGFfATZRvfED2bROjDum04lOnX9MAOAv/prtSbg/JGKX2oZdnI?=
 =?us-ascii?Q?3Mz/tdEePCyRXt81gYCi/yGQ7jWXjXqG+K1FgdgNl7VvmU8Rq8hd/ILXolku?=
 =?us-ascii?Q?J/dsH/oVgpRLPu7UDxyrPjvkQ3KFo5xEm0Fg5rNpPIqeynpaMpr/FGM6e/mV?=
 =?us-ascii?Q?TW+G3abf3KrrR3g9SW2q7xRM2TyduKiplb5+1DoQYc5vswC0A+YP2RNeKI0k?=
 =?us-ascii?Q?8NS6bvwssUWwDS9uqRc1LaatPe1y18MZyRKndFIe218kWDEAD48w2BrvDWXT?=
 =?us-ascii?Q?R2gLf19cF0N3+5h/X4rDp+4h9yfi8vU+mmhwxEGRZZtM6M3Y2RXcAIZ6E9+r?=
 =?us-ascii?Q?mazs/pyziBAT/TQcz5DG/1NYhf9wz/OrOjqNXJ5XwziU+oScM/WQZs7oJBsj?=
 =?us-ascii?Q?DhafxG48j43nXY9GDAYYzKyorDgjGQrykhI4A2+qGPjB5y7cGqo6Jb6Rv3P2?=
 =?us-ascii?Q?R5BwwAEoxgf2x65M5NKOdUhaFD7POwyXVGT3lNH1Ly6545IW+wjaq5g645Xc?=
 =?us-ascii?Q?1WfspGtYCyh6Y5T01R/LHMbkWL2W3NnjkUK42wPmmEV6S5XzNKPUQI9EhLOo?=
 =?us-ascii?Q?Clmm9tgveLUWbhD0Q1uc5a2cLP/NWcQMFURztdhT7LyJOfOvGzOFnXG0JIYr?=
 =?us-ascii?Q?tMVbcG1onGFH1Y7QhdNdq+KNPHQIdqGYvfH5oOct0mFntJm2oCIwoZ3wRF+N?=
 =?us-ascii?Q?/Blyx1C6ivLWYa+wAmoaySHQXYPBzaF+sgN/Ogb253/zNiDAYuzpR45yGudQ?=
 =?us-ascii?Q?ggHTIJRwoAxrFIZGxi0CpcjvNdeRE/R7bK1Mpoh2tFVvY89bpEG6Y3LxCrtC?=
 =?us-ascii?Q?s3miJKhcqeSImVzwGjoLIITDlCbSyvC4IQwWzHffQB/rQkWoYkewYXOwTavL?=
 =?us-ascii?Q?MzlIJ6kgPhdJ0aJCvl3nudi+fFi6trOFQ5WBVLFEPOQJ7J3rNFwVuy26tujG?=
 =?us-ascii?Q?dnxTbjRhrC8FfAFvnxSEKJacOpXz7a0BTRZM1T2cMF84a6Mvs6+dh9A00GwX?=
 =?us-ascii?Q?FflQkEZ5gmwBZj7EbaHRYHCJXKrWr+T61ac/rOcS7916z1VUBpVm68emC1uG?=
 =?us-ascii?Q?WAzcKzELi9FX0UmYFBIrGJq2Qof+iPYmHnoFb1DJg9gmhcKgcX1grqj6Y1Lh?=
 =?us-ascii?Q?78VqbK07+5qlskCkEga+mK4ABo7xSGmXoYj+2oRdHEGVR4uaT8WV13xnGAPL?=
 =?us-ascii?Q?5MaULPHf/3UalEGKk82gwNFtpZ/f8e/3kGOaxxN6OP/KgDMajXwHVxiQwvCj?=
 =?us-ascii?Q?m8SmvaO/+1HZQwHUorzbYKiO9PyLLsiy4/2MFTw64bTZdABvYf6mIzl50l5P?=
 =?us-ascii?Q?nHpOA4EgBGA3jseahT8uW4efuVa6wCepHpiHDMGun890znnesrluTncLVpAG?=
 =?us-ascii?Q?1mx6aBVo/R9O5Lxyg2/kOm2g0u04zxXHkhXiEOh27SyQmeiEl0gVOuGMXaM1?=
 =?us-ascii?Q?gdAFzNX2jxdKTQ8ybV6hVjpFnVbEWI21uMToCCsGds4TYlO/b+PJ6Am64i58?=
 =?us-ascii?Q?nV4EiEi8sQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9f074ba-d6fd-47ed-b5f5-08da29da064c
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 12:16:01.3364
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oI6XQ0Shk5QDGn4zVJYQSQyX5ZtYkYMdg+8xoC0skOV/KZEv8k9+pBWRLd0UwO+bi/PjYU5OCMzka057osy51w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR04MB9465

On 29.04.2022 12:52, Dario Faggioli wrote:
> On Wed, 2022-04-13 at 12:00 +0200, Jan Beulich wrote:
>> I also have a more general question here: sched.h says "Bitmask of
>> CPUs
>> on which this VCPU may run" for hard affinity and "Bitmask of CPUs on
>> which this VCPU prefers to run" for soft affinity. Additionally
>> there's
>> soft_aff_effective. Does it make sense in the first place for one to
>> be
>> a proper subset of the of the other in _both_ directions?=C2=A0
>>
> I'm not sure I'm 100% getting what you're asking. In particular, I'm
> not sure what you mean with "for one to be a propper subset of the
> other in both directions"?
>=20
> Anyway, soft and hard affinity are under the complete control of the
> user (I guess we can say that they're policy), so we tend to accept
> pretty much everything that comes from the user.
>=20
> That is, the user can set an hard affinity to 1-6 and a soft affinity
> of (a) 2-3, (b) 0-2, (c) 7-12, etc.
>=20
> Case (a), i.e., soft is a strict subset of hard, is the one that makes
> the most sense, of course. With this configuration, the vCPU(s) can run
> on CPUs 1, 2, 3, 4, 5 and 6, but the scheduler will prefer to run it
> (them) on 2 and/or 3.
>=20
> Case (b), i.e., no strict subset, but there's some overlap, also means
> that soft-affinity is going to be considered and have an effect. In
> fact, vCPU(s) will prefer to run on CPUs 1 and/or 2, but of course it
> (they) will never run on CPU 0. Of course, the user can, at a later
> point in time, change the hard affinity so that it includes CPU 0, and
> we'll be back to the strict-subset case. So that's way we want to keep
> 0 in the mast, even if it causes soft to not be a strict subset of
> hard.
>=20
> In case (c), soft affinity is totally useless. However, again, the user
> can later change hard to include some or all CPUs 7-12, so we keep it.
> We do, however, print a warning. And we also use the soft_aff_effective
> flag to avoid going through the soft-affinity balancing step in the
> scheduler code. This is, in fact, why we also check whether hard is not
> a strict subset of soft. As, if it is, there's no need to do anything
> about soft, as honoring hard will automatically take care of that as
> well.
>=20
>> Is that mainly
>> to have a way to record preferences even when all preferred CPUs are
>> offline, to be able to go back to the preferences once CPUs come back
>> online?
>>
> That's another example/use case, yes. We want to record the user's
> preference, whatever the status of the system (and of other aspects of
> the configuration) is.
>=20
> But I'm not really sure I've answered... Have I?

You did. My question really only was whether there are useful scenarios
for proper-subset cases in both possible directions.

>> Then a follow-on question is: Why do you use cpumask_all for soft
>> affinity in the first of the two calls above? Is this to cover for
>> the
>> case where all CPUs in dom0_cpus would go offline?
>>
> Mmm... what else should I be using?

I was thinking of dom0_cpus.

> If dom0_nodes is in "strict" mode,
> we want to control hard affinity only. So we set soft to the default,
> which is "all". During operations, since hard is a subset of "all",
> soft-affinity will be just ignored.

Right - until such point that all (original) Dom0 CPUs have gone
offline. Hence my 2nd question.

> So I'm using "all" because soft-affinity is just "all", unless someone
> sets it differently.

How would "someone set it differently"? Aiui you can't control both
affinities at the same time.

> But I am again not sure that I fully understood and properly addressed
> your question. :-(
>=20
>=20
>>> +=C2=A0=C2=A0=C2=A0 }
>>> =C2=A0=C2=A0=C2=A0=C2=A0 else
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(uni=
t, &cpumask_all, &cpumask_all);
>>
>> Hmm, you leave this alone. Wouldn't it be better to further
>> generalize
>> things, in case domain affinity was set already? I was referring to
>> the mask calculated by sched_select_initial_cpu() also in this
>> regard.
>> And when I did suggest to re-use the result, I did mean this
>> literally.
>>
> Technically, I think we can do that. Although, it's probably cumbersome
> to do, without adding at least one cpumask on the stack, or reshuffle
> the locking between sched_select_initial_cpu() and sched_init_vcpu(),
> in a way that I (personally) don't find particularly pretty.

Locking? sched_select_initial_cpu() calculates into a per-CPU variable,
which I sincerely hope cannot be corrupted by another CPU.

> Also, I don't think we gain much from doing that, as we probably still
> need to have some special casing of dom0, for handling dom0_vcpus_pin.

dom0_vcpus_pin is likely always going to require special casing, until
such point where we drop support for it.

> And again, soft and hard affinity should be set to what the user wants
> and asks for. And if, for instance, he/she passes
> dom0_nodes=3D"1,strict", soft-affinity should just be all. If, e.g., we
> set both hard and soft affinity to the CPUs of node 1, and if later
> hard affinity is manually changed to "all", soft affinity will remain
> to node 1, even if it was never asked for it to be that way, and the
> user will need to change that explicitly as well. (Of course, it's not
> particularly clever to boot with dom0_nodes=3D"1,strict" and then change
> dom0's vCPUs' hard affinity to node 0... but the user is free to do
> that.)

I can certainly accept this as justification for using "all" further up.

Jan


