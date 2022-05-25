Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFE453369F
	for <lists+xen-devel@lfdr.de>; Wed, 25 May 2022 08:03:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336851.561277 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntk6G-0002xK-HE; Wed, 25 May 2022 06:02:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336851.561277; Wed, 25 May 2022 06:02:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntk6G-0002uG-Dw; Wed, 25 May 2022 06:02:28 +0000
Received: by outflank-mailman (input) for mailman id 336851;
 Wed, 25 May 2022 06:02:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gDv/=WB=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntk6E-0002uA-W6
 for xen-devel@lists.xenproject.org; Wed, 25 May 2022 06:02:26 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f1c13be-dbf0-11ec-bd2c-47488cf2e6aa;
 Wed, 25 May 2022 08:02:25 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2057.outbound.protection.outlook.com [104.47.14.57]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-35-G-nqwHc-PWK6X0ThgCLLKA-1; Wed, 25 May 2022 08:02:20 +0200
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com (2603:10a6:20b:fa::20)
 by AS8PR04MB8753.eurprd04.prod.outlook.com (2603:10a6:20b:42c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 06:02:19 +0000
Received: from AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::85f7:b203:1f7c:c78e]) by AM6PR04MB6551.eurprd04.prod.outlook.com
 ([fe80::85f7:b203:1f7c:c78e%7]) with mapi id 15.20.5273.023; Wed, 25 May 2022
 06:02:19 +0000
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
X-Inumbo-ID: 3f1c13be-dbf0-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653458543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OgoLh87IBEZhZUbyi+RYO04yA9DwelZVbh0liG4/7iE=;
	b=BPDD+IvVM+lcT2dawguYit8Yt5AYCBJyjc2b8LidaNMawSDoN0kuwQ6uvMr6C3ucgAYRc0
	jyArw42BhpZ6MOWKoCilTYxKkpTYsE3zx/hDZl+ygEAdQSxRysOzYznXY3dbO/K3Lah6bX
	QlSJBchvNVxPiX4DhU1vxB5Iu+D2fos=
X-MC-Unique: G-nqwHc-PWK6X0ThgCLLKA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nwdeRwGzelQTLbPJwRdSPhXibcC9afsCUKUtbn16DsflQxSyvD/hgzxe8b788gWR7m/s68iDuC7vgm/TmIsZD1hZxK1qT1aJ9nsemZrCGH5S4CPAPcfhSzqqW0IJAkKiDF6IdHqIgqQklobOM2EyhRbQnRe/8TzzA6qukjtYRZ0c1alNEC5TA7EscV4esIFX+n09ARkE02v7lc0+zo24ULy0mmhAWgI5Wzdf6u94hClv3hPL+YprN6CN4sjd2XSZkXluJOn9xJ4OdNn8NzlHgv7NKrNTeArtj7qNJStQS2C09faDC7xZUciM8SJFWOSqOnAArYhUruBre2ylrq+oJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Noj3KK3nSzUgBcc6nC9rQgxRTm0VWrtL+J8ZkvoFO9c=;
 b=efnXhtMwMC/C8cR90KC+meb9cynYGWGG7LiAC73wBWlu+JNWqdM2INhgzXIi8ouA5g/O/tlg9e9NWMdY1MrwhCls/wqFiii6svobEypwEx3Wpf3ptxr1pcqLpmZ3kSx7tP61xBq4T8H4eygZ7deUkoEuEfT8ZOOplExG2ZD0KsZv/CsTXoLDBagwmDLw5bc55fpw2oox6ai9QFIMnt/EF5fYAqZ0TwTqbNJGFrdYS3xBzjB4vy3F9jBBW/MLQDzFjyYCC0oSbECubjCJnsPuJcDD8NjOESEfrFEN+LjAVT2ih298vT8F7E5SmoKGRS3qHVTHzKwTiVgMzCaG2p95bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <dcbcb8a1-547e-d8d8-6e69-768533d24957@suse.com>
Date: Wed, 25 May 2022 08:02:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2] x86/flushtlb: remove flush_area check on system state
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220524105052.5210-1-roger.pau@citrix.com>
 <1b0b643b-a906-13ba-d414-feedc98428d3@suse.com>
 <Yo0L+mp5kP1zMU/d@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Yo0L+mp5kP1zMU/d@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P192CA0024.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::37) To AM6PR04MB6551.eurprd04.prod.outlook.com
 (2603:10a6:20b:fa::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d7aa51d5-1194-48f9-c258-08da3e142085
X-MS-TrafficTypeDiagnostic: AS8PR04MB8753:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB8753691EDC807E0358DE68C9B3D69@AS8PR04MB8753.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/bSoIsXfkkhZL4tvBMLpiP911wYATIiRN2NpbsWz6DWdezDkfedJ3ZVI2hdWRIwdVm5DhUnM3jUDK74syJusMSVXkr0enDDWTmTEHKNXRGh4E566IhoVaAVlj7/04gjg51+ZkT4RaAZeOTH1Qyac5ZfxwhInHdPdKStYTBNDOFV76gaqceMl2u06vtCpS+yT6sSJ2XUNreFnaX2oKsg0C4dKBnwYtIBOd1blzZx7KRW1bCIyWT3OAppORzPmAvf729dTLPuWPgcr2K8OdVZEV9pTmpacPJZDzjkKaZeBvOHw+LZ/0l6D0VyU2JFoMlAm1NMmXjvtAorYjbB87S//lWetaVFbMtBj366XOv9jRy6mgGjXH9ObkkSoIAiykQWBm3jlIpaJUOdaeUjNr0un6YWGTyw8z8hO2xrL44US7wODhz9/6JJjpm6bxSLmz6ZYztdzau5yrxlkSkNgJmx8h9/4gczVM4KZcyyZptD7n4akXPvYhXgrSTzCJEPMjuUr4+FoLlvpoA+KTVnZez0nB/eqZQKLLpDsyUK7h/ybTYHMfwZTgbAXHpe2odfO9vtcjsckg8r8yQbiLolMnw8f7YuXoHcQDuv/dvA5gXdubv9f+TTVnYdxYuWJNGiFELmAcSbw1ArAk5O8u5FansCKYRA7+/rQwhRo1eg11Q4FN4kNWTvnO+6NvsDOt+eRACeAec/QcY1X7oyCMX+LcqdI9VvEcDarvQEK3cigfesxJwI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6551.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(86362001)(8936002)(31686004)(31696002)(316002)(4326008)(66476007)(66556008)(2906002)(38100700002)(186003)(5660300002)(8676002)(36756003)(6486002)(66946007)(83380400001)(508600001)(6506007)(2616005)(6512007)(53546011)(26005)(54906003)(6916009)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZHrcg5Kjv0Yb1lkOEHyE5eXWs/XsyI7U/ivtF9rKP7VBxdDGYav7EzorKhWU?=
 =?us-ascii?Q?58LbeFCF9y8kO+OavidZhnTcYkzdVI+7KgNMKFDa9b/RzKcBLx2mhj5Apu8n?=
 =?us-ascii?Q?jqhacViEPUZSKnD8vDwgpSxdFyM9mlOfDzDPLw42HBsGS+xMOiyTtt+9sXVp?=
 =?us-ascii?Q?/HwSYnBDp+HbtXXxq8BR0d5G1k02LrTteAuKZtjcDEMaFEo/2E/j3FHdTfbV?=
 =?us-ascii?Q?/S6BB/nM4Mwe+IAK9kwB3tg0+mYvkjulTrMPYMaPonOfrarvSpkKmdYxUuCR?=
 =?us-ascii?Q?e9pP/DpWX17gd9W/9+gUiZXdujczuCWG2sw8hT1hr1UVg0ifs6w9OhgfFc3B?=
 =?us-ascii?Q?lULQqrmivDz3dHRjBny1YGiLKBwfbJ0Ad5un9t/xodh1QmrsJGWLmN+LMFsN?=
 =?us-ascii?Q?tjGkMEY923j7aqPbrOO1ZTURxpq5yngkwM1cYNmb9bU8qkp8B3dRE5ko9IhZ?=
 =?us-ascii?Q?IFAtHSSDRCyTUk6P/BE8jS4BG1VW6dVLZNTazvyx1VbHU6V2FRzsnPZbKEXj?=
 =?us-ascii?Q?vtATWLfZg1huz/cZf3gi7WcbmowW5S4VA+rdjFRvChCSLLXFN4MNlOAv96pC?=
 =?us-ascii?Q?ZuM/40mPBp4ZZsgPdlCFns3Xu3y58c0QeTg4lC4Pk7z0rHwMpYU4fDto97Fb?=
 =?us-ascii?Q?vuZ9QscsTXF3fMaUAA3L4OD8mRO8p1BgFwYFtHSrr+vbLN2F0rMhiP0p2M7u?=
 =?us-ascii?Q?NpDXC0X0Ruq4C33qni2U9FvNCaAj7pzJdVUs45Jkzj4Afv4t9T0mi1HdiD0N?=
 =?us-ascii?Q?/NBP7FCE8tW/FJ74Tnk8TewDjhImWbxiPz93lrJ1w5scdWPhfQALZTidgFZI?=
 =?us-ascii?Q?6kDm5bo6nE9vJV521fFfgsiG80hPLA84BY/5DG8UzIfviyB/kKwfzlWNyIL/?=
 =?us-ascii?Q?+V+jo81mypsqlT1cF8Y3abQjuvFmLfWUfBYhUwDHQuazu7n0J1K05i7rJAec?=
 =?us-ascii?Q?0/JNEzSHMGYrhnvNKilM9kVQQNKNSQemqZuf77207Ty8Lgq+5ZeTciQ1wYca?=
 =?us-ascii?Q?/wurDhDyq/O/N4jK7Vz8S3DLAhPYx8R295mwA038TChl/pGGZIbSFtCHZz9o?=
 =?us-ascii?Q?OJIiurxN0/kpO+34AqTWUkgUANjhqWBIGE5PflpYvKUYw7phJB/5WNVEgcer?=
 =?us-ascii?Q?kEBJ2UAAQv6lbw/5Zzc+W5mXYoRZY1/+f3ON7UbPGVO4clGMJKXz26NPVPpr?=
 =?us-ascii?Q?aoyi0v+0nB3Slrw24JMUvmxArXNIPNVOzvp8V9N1Lu5Jz9G0nYSCRqQJn0Yd?=
 =?us-ascii?Q?4M982D0MpoMRuqKW75mD2Ju7V2G1euW+LAUKm8lKxn8L6c/xyCwPt5hQWPNc?=
 =?us-ascii?Q?A3JgdOUcJeJ0ncbOC9FUGQZxczFsxsBGF7dPgLxqiqk5B3uLJ4DjaVyjgiCU?=
 =?us-ascii?Q?ByI+YZIDIh1K1hKf4usBid7FD315k8QI5zROH7HRV1ciUoDagagnuRZCSd6/?=
 =?us-ascii?Q?6/lNyFlMCgReTsb259oHgNHqvECZzC4QFKpUyJa02Ds3OCjIgYpyOBDPxmsh?=
 =?us-ascii?Q?AdpeAoXc21WtFqUGuC+pywtanYjOu+NWjvgooL+v+nVYFfu20uEYwB+qVqVn?=
 =?us-ascii?Q?4LIJVfHpEHI21DlpYnUnntBcchsMkd3+l9XLlikUaULQ5QvFM78yI2NsXA64?=
 =?us-ascii?Q?lZKjePuIw1kGv8gdiyarkr3DjzF98PCGIIbhYQTdXqklJF7f/pL8Xn8vWFtq?=
 =?us-ascii?Q?o4GQjA0//LkxbUADH5n/FlADzODHd3a+oJGwDOF7Urzk2DAVjahToaXxMMVv?=
 =?us-ascii?Q?IvGw4IuxtQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7aa51d5-1194-48f9-c258-08da3e142085
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6551.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2022 06:02:19.3657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kpsRI1Zt9stG6pMZzQNhY/BfFnxkLxncKPfyD9IWcLCndI23rT58OMfNxK0xOxCHnvfvW//w2N5ZqM2dFIfZ/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8753

On 24.05.2022 18:46, Roger Pau Monn=C3=A9 wrote:
> On Tue, May 24, 2022 at 05:27:35PM +0200, Jan Beulich wrote:
>> On 24.05.2022 12:50, Roger Pau Monne wrote:
>>> Booting with Shadow Stacks leads to the following assert on a debug
>>> hypervisor:
>>>
>>> Assertion 'local_irq_is_enabled()' failed at arch/x86/smp.c:265
>>> ----[ Xen-4.17.0-10.24-d  x86_64  debug=3Dy  Not tainted ]----
>>> CPU:    0
>>> RIP:    e008:[<ffff82d040345300>] flush_area_mask+0x40/0x13e
>>> [...]
>>> Xen call trace:
>>>    [<ffff82d040345300>] R flush_area_mask+0x40/0x13e
>>>    [<ffff82d040338a40>] F modify_xen_mappings+0xc5/0x958
>>>    [<ffff82d0404474f9>] F arch/x86/alternative.c#_alternative_instructi=
ons+0xb7/0xb9
>>>    [<ffff82d0404476cc>] F alternative_branches+0xf/0x12
>>>    [<ffff82d04044e37d>] F __start_xen+0x1ef4/0x2776
>>>    [<ffff82d040203344>] F __high_start+0x94/0xa0
>>>
>>>
>>> This is due to SYS_STATE_smp_boot being set before calling
>>> alternative_branches(), and the flush in modify_xen_mappings() then
>>> using flush_area_all() with interrupts disabled.  Note that
>>> alternative_branches() is called before APs are started, so the flush
>>> must be a local one (and indeed the cpumask passed to
>>> flush_area_mask() just contains one CPU).
>>>
>>> Take the opportunity to simplify a bit the logic and intorduce
>>> flush_area_all() as an alias for flush_area_mask(&cpu_online_map...),
>>
>> This is now stale - you don't introduce flush_area_all() here.
>> Sadly nothing is said to justify the addition of a cast there,
>> which - as said before - I think is a little risky (as many
>> casts are), and hence would imo better be avoided.
>=20
> So prior to this change there are no direct callers to
> flush_area_all(), and hence all callers use flush_area() which has the
> cast.  Now that I remove flush_area() and modify callers to use
> flush_area_all() directly it seems natural to also move the cast
> there.  While I agree that having casts is not desirable, I wouldn't
> consider this change as adding them.  Merely moving them but the
> result is that the callers get the cast like they used to do.

I'd agree with all of this if the change was local to mm.c. As I'd
like to see the macro in flushtlb.h left unchanged, did you consider
retaining flush_area() as a wrapper in mm.c, reduced to merely
invoking flush_area_all() with the cast added? That would also
reduce the code churn of the patch.

>>> --- a/xen/arch/x86/smp.c
>>> +++ b/xen/arch/x86/smp.c
>>> @@ -262,7 +262,10 @@ void flush_area_mask(const cpumask_t *mask, const =
void *va, unsigned int flags)
>>>  {
>>>      unsigned int cpu =3D smp_processor_id();
>>> =20
>>> -    ASSERT(local_irq_is_enabled());
>>> +    /* Local flushes can be performed with interrupts disabled. */
>>> +    ASSERT(local_irq_is_enabled() || cpumask_subset(mask, cpumask_of(c=
pu)));
>>> +    /* Exclude use of FLUSH_VCPU_STATE for the local CPU. */
>>> +    ASSERT(!cpumask_test_cpu(cpu, mask) || !(flags & FLUSH_VCPU_STATE)=
);
>>
>> What about FLUSH_FORCE_IPI? This won't work either with IRQs off,
>> I'm afraid. Or wait - that flag's name doesn't really look to
>> force the use of an IPI, it's still constrained to remote
>> requests. I think this wants mentioning in one of the comments,
>> not the least to also have grep match there then (right now grep
>> output gives the impression as if the flag wasn't consumed
>> anywhere).
>=20
> Would you be fine with adding:
>=20
> Note that FLUSH_FORCE_IPI doesn't need to be handled explicitly, as
> it's main purpose is to prevent the usage of the hypervisor assisted
> flush if available, not to force the sending of an IPI even for cases
> where it won't be sent.

Hmm, yes, that's even more verbose than I would have expected it to
be. Just one point: I'm not sure about "main" there. Is there really
another purpose?

Of course an alternative would be to rename the flag to properly
express what it's for (e.g. FLUSH_NO_HV_ASSIST). This would then
eliminate the need for a comment, afaic at least.

Jan


