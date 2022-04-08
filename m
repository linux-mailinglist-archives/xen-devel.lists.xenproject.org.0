Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5BA4F95E7
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 14:36:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301507.514557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnqs-0004iZ-BF; Fri, 08 Apr 2022 12:36:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301507.514557; Fri, 08 Apr 2022 12:36:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncnqs-0004fX-6w; Fri, 08 Apr 2022 12:36:34 +0000
Received: by outflank-mailman (input) for mailman id 301507;
 Fri, 08 Apr 2022 12:36:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=tFry=US=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ncnqr-0004fR-0k
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 12:36:33 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 849954ba-b738-11ec-a405-831a346695d4;
 Fri, 08 Apr 2022 14:36:31 +0200 (CEST)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-wMTVG6bXPiWsP8y8zb1izg-1; Fri, 08 Apr 2022 14:36:30 +0200
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com (2603:10a6:20b:424::9)
 by DB3PR0402MB3771.eurprd04.prod.outlook.com (2603:10a6:8:6::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 12:36:28 +0000
Received: from AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd]) by AS8PR04MB8609.eurprd04.prod.outlook.com
 ([fe80::48e:2a59:a71b:d6dd%8]) with mapi id 15.20.5144.021; Fri, 8 Apr 2022
 12:36:28 +0000
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
X-Inumbo-ID: 849954ba-b738-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1649421391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZSemnoX7dyp6p0/0CQfLlAiRWmI9I36BHishgZUrHr8=;
	b=dOkDHWyaHsw7EMJhgbivFKnXCpIWvDyr+zTTmO2e7vAMLb0jlatX8PvQRYvmCCDFBEdKB5
	MefMLKIgD0lfVWqqTBsauFtmUEPZ144hFTkAbQK6HjB+glJtKvyRWfZiCnOs1XGfrwPXTp
	8fH+ZgPA5rEkkkRU1CSckAlhe0NLiPo=
X-MC-Unique: wMTVG6bXPiWsP8y8zb1izg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InrDKFC3x/srg0A/dBHW2ivAxdI7FNHBdY1jrHT9zene/XYAPLsnC/PQb0v6eF026Gnyre6KlXaQftJ7R0VEI/NGgGhalE2U9aKxuf69lRAMjZ1KCGfJxmli+Ax4J5A0pHOOF4AIcg3f+/l7ISGIxjncOzrFaAHXB65d6Fdze70iY0sLTotLjOsD+E0V0OIHeCOaA25RMoSPB//JQ9Zyz708Ehvlo0RTWC9bv/pkls0az9GA8eeY8K5uRNPLNerUmS0Q7u62DzLr6GKgr05PinG3PuwkpQkrpj7tqd47lnfkZ0aa57Ra/GFiouB56ZsHtEey+3XOc7i8D+wqoPIY+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nJ9DjZ2YgBITR4o5KgspTRYuUPRJnVk9AglH4dqAqOY=;
 b=gpzUPy0UAFxbSMADXwD57r01lrAgKDR7xC0XPh374YaxtOpdO6mvjHiw4rk7QT7SgUQvmt5XDvtT3byhEfU72QE9+eSUP7k9BvdT8nZ2NQSkLPFEtSu5cT0MavD9owty6bmu123/zbvV/vzoV/5YY3BzdCDp8sXXb0UD9DQG3Xa0ohDFKtHaCInGESpt0roeXqfyrqsJtvSGAPITGhoMfX/CcLNYNoUZ33rao7yg6MTe8TnSmMaOcBblLTyT80CVJ4LRW1dM541PTTrdeH1Ed4lKHPU/whUgj253RXBIjdVYashvi6fdtbEB0E9HxsC1w/yELKV0IgCJT/sas0Cq+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b41009b4-fea4-826f-f36f-7dd9f4edd1bb@suse.com>
Date: Fri, 8 Apr 2022 14:36:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] x86: make "dom0_nodes=" work with credit2
Content-Language: en-US
To: Dario Faggioli <dfaggioli@suse.com>
CC: "ohering@suse.de" <ohering@suse.de>,
 "george.dunlap@citrix.com" <george.dunlap@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <1617b87a-640f-d235-701d-df2c57314b73@suse.com>
 <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <2d56bb1015a263b6d1b196050d088b84c320b808.camel@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0102.eurprd06.prod.outlook.com
 (2603:10a6:20b:465::19) To AS8PR04MB8609.eurprd04.prod.outlook.com
 (2603:10a6:20b:424::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b93ed4e-3ec9-4bb5-21b7-08da195c6714
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3771:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB3771C50DE1A3A3B375563732B3E99@DB3PR0402MB3771.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9yBtp8u6+QiYo+25FnvyZ/fthnVyWEBdpuYYyDBUK9eqRoUQosiPdxMCpecx/tbtn3QRYzxtZn5CHwO/8QITNmb82/SXtfg1Rd4HJhBfunOC7UB9/oxNHmH9qt2YNyTvn3h6HdzNS7MWJ+N58DbSVHIs70tbgW70g8o+Wwr8MHlJId/jSFDua/TddtgFL9UNVIxwXMoCZhERFzSx3msuDoWWP34CaBBirwtfKRzv2cKSOp+KhF3d57TyEj9ZHxb5FrpJJhXcCQucyozPHa7GUyUekFKEIYskEnp7cdI5lreetMZ1XkOeG710R3LTiuxRZbN7OmLAfhxFFUVB4nKeQOu9CMtz36rcmoJ7yM5Z3ovtg3J0BKMRwM57JIBVrecbQB/v/tpns+cnyVXPGqeOmx0R9AWCqDLcSx0RAInb6MohgNrDWxt/sQYDea8bTf+TgqbV4vEwoj6tu8/0b7tcjhakS4MPZsCtAUv5FkIzlfmvUaNGbo9Jcl3TUC5pZYt+B6caUxTFls3A8sKFtJ2pRJh406frMWPBDllGu9cCm4z7zzFypHZPbooKEG3CFxQ91x3FV6MSxZ6M9h//CH+JHjBaFwGzFHavK5c3eicqUZw8aw6BRLPGzQk2ClETq1uhcndhYHB132fNgc+t0WPpI089zHN2I/o/uWOTMBFsiqPVTRBCnMvtmSD+pRrLKFc4M4xxENUOlJF3c4CQzRcMQNuN7HXIgIcsjEQ4VH2pTAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8609.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(6506007)(6512007)(53546011)(8936002)(2906002)(6486002)(186003)(2616005)(6636002)(26005)(54906003)(37006003)(31686004)(83380400001)(36756003)(38100700002)(316002)(508600001)(66946007)(86362001)(31696002)(4326008)(66556008)(5660300002)(6862004)(8676002)(66476007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bJVLT2M05n7RCKD3HkcVidLW4y55DZZUKoEXX39/ccKgac2E0/JWcYxJki0Z?=
 =?us-ascii?Q?6YbIgDJz5jPG1FfS/sTblwCOBWY+GZMYEBGu9V5BqUnNesVt/dxIDFEcIsvs?=
 =?us-ascii?Q?HB/kBK+aBR2neUVBh5hzPFcbcbWGfLlT9IdxGO+rQLLMP3hQkYHKJXzLG7Tz?=
 =?us-ascii?Q?1zRNeFSVIB0vwSJ9Ta0iyBgXWYXd/MX8MK68egDFmujwwbxmDoCBViY7B1PB?=
 =?us-ascii?Q?ZSmVHfj+xJ3AF7fWZO/XGfAc4NSbUifJUlWar/w2wgtc1mqord2BLPYc0TSx?=
 =?us-ascii?Q?YgMS+J0wW/AF4zI9f13MTmXjqfn4SGKEPUUxMwcCq+kiH8Vs+V7SUJ71xASM?=
 =?us-ascii?Q?KZdho4jqdhDm65GOo52zbN40RkTL0A+TGBnjNguiFpP86/2p+VEwsGZy4Nik?=
 =?us-ascii?Q?NMtDcGjH681Sq4GiYeMNOW5uCGmqvKTsJFQqvd7EoCGt30UCKL0V7OWVikxd?=
 =?us-ascii?Q?2aZGukadRkMXy2T/ZQ6VxupcuyqaG14SUNee7R076Q1x/hCi/XkNOYw/S932?=
 =?us-ascii?Q?wHYeL5RXYwtFLNOOGXNtAgLIbpNVfSeO+VbVQVLkLiuq2I70bVBI+k3mftzs?=
 =?us-ascii?Q?v5T2vO7D8wsMBYhtnnjuNqOW5Q1dZvnkhe4PBtNlHDOt5cWTyH8VXr7uGCX/?=
 =?us-ascii?Q?JCqdtQsgcZjGhlXlU1SJGndogH51R95HNub72bW84/U8AauNvUIqzCtke7mE?=
 =?us-ascii?Q?w+kraVlDrkev3DfbscdSJ5RbAiE9RP1WkhRqvtpO+9GJDXFm3hhPFflVGHi8?=
 =?us-ascii?Q?yDk14bJEbGcQ7AT4uejwKKkeZ3jC4RExPplMNsdlw0L0QwFNCXgOfThmb7ay?=
 =?us-ascii?Q?6Wtcth3zUaHiQTOqjCAJ0moc7pf2t14sc+mjsBQ2BoTBWQRJOuhoLMIRGXlO?=
 =?us-ascii?Q?lv6BPVXZe6N8F29OriCrw9y+rqaZ0GeXxP2Yhadb1gWaUdHypzUtueQ368gi?=
 =?us-ascii?Q?vU/PeJx+2TlvwjivYXYyrDl184Sc874TDPCRmWE36YYyVfEuDP/jNlEHQLoP?=
 =?us-ascii?Q?CoBny2ESvboJnnjqtEbASdLnxHJKAbhJ6z5Gy/yy25dYoz2jJrsXoreyqpgB?=
 =?us-ascii?Q?t0IYmrrW4ha8cnD6Ek/QssJ0kDK71SL9pT3GO4ZbSZZFKlAlsxOP3Jva0jMv?=
 =?us-ascii?Q?Hu4loRqGMqTuqJHU4eQzpDusGOvg6aRJfNnr61sDhI9i52BUfNoX/jw9euDZ?=
 =?us-ascii?Q?jYoGTpXZ98AdBJxLhqVXQTy7GRZa65RH5RR8FNJnZ6gNeeUCxVeo+Ctja/HS?=
 =?us-ascii?Q?xvDShu05kGcRer5h2EWEa39iz6fjfQz0K1fHKoMRrkei9Af8jliM2z73ffqs?=
 =?us-ascii?Q?wrXVsjR057CBHcFqsXgtBgCpn+xvNU0wTF/QeHg+CuBWeefFsQ65d7aOrrBa?=
 =?us-ascii?Q?O0xMjUYgF0sTDo7HIhsQLjdeyGhjF/Dj3Fg9PNNhVzRDXGGZ9Vf9rNaCxdkH?=
 =?us-ascii?Q?N2hh6E5EBbeerFkCpssIyQrwn8AlBU6Rpff3xBKiIHX0RET3xbt0ggqgJI6Q?=
 =?us-ascii?Q?A0HhGTjPukftDr9gzizUwhWzjftHe3aPKOcXXfrvENAE6Ns87SVy0Jw3C66J?=
 =?us-ascii?Q?VRl7/YFa1MR91wm+T4tMSV+P7kNz+iWUA7RMPY02UMWgWgrOhyW0mZE2KCGv?=
 =?us-ascii?Q?T8vroLL23kIOqbTC4PB2HQliSvxizaJSfL+9QlPOPcX2tfGHUkQzgXA9NZy9?=
 =?us-ascii?Q?m9TzlKKYABpaq0QApCx2iIWbhJtV0qLYG5pUfnMc6V+ZsHR6sgxYQeZZ81tt?=
 =?us-ascii?Q?3KuZpWdz2Q=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b93ed4e-3ec9-4bb5-21b7-08da195c6714
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8609.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 12:36:28.4342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dut2Sxv79CN9ucTTzGm8NY8wfjTefPh1tqABzWoRb1HbWmxGVRQ0G9yxBHtmZXUqYX08pP9rlHNW/zbz5WXK2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3771

On 08.04.2022 13:20, Dario Faggioli wrote:
> On Thu, 2022-04-07 at 15:27 +0200, Jan Beulich wrote:
>> ---
>> The Fixes: tag isn't very precise - it's rather the commit exposing
>> the
>> issue by default. I haven't been able to identify the actual commit
>> which did introduce the problem; it may well be that it has always
>> been
>> there since the introduction of credit2.
>>
>> Credit2 moving the vCPU-s off of their initially assigned ones right
>> away of course renders sched_select_initial_cpu()'s use of
>> cpu_cycle()
>> pretty useless.
>>
> Mmm... you mean that Credit2 is moving the vCPUs off they're assigned
> ones _right_now_, or that it will, with this patch?

Right now. On a 4-node (6 cores each) system with "dom0_nodes=3D0" I've
observed the 6 vCPU-s to reliably be put on CPUs 13, 14, etc. The
patch is actually undoing that questionable movement.

Since I have a large amount of other patches in place (none of which
I would assume to have such an effect) - Olaf has meanwhile confirmed
that the change helps for him as well.

> If you mean the former, I'm not sure it is. In fact, when
> sched_select_initial_cpu() is called for dom0, dom0's node affinity is
> just all nodes, isn't it? So, the we can pick any CPU in the cpupool,
> and we use cycle to try to spread the vCPUs kind of evenly.

The CPU mask used in the function is 0x3f for the example given above.
I did not check which of the constituent parts of the calculation have
this effect. But the result is that all CPUs will be put on CPU 0
first, as cpumask_cycle(..., 13) for a mask of 0x3f produces 0.

> If you mean after this patch, well, sure, but that's normal. Again,
> when we pick the initial CPU, we still don't know that the vCPUs have
> an affinity. Or, actually, we know that in sched_setup_dom0_vcpus(),
> but there's no direct way to tell it to sched_init_vcpu() (and hence
> sched_select_initial_cpu()).
>=20
> That's because, by default, affinity is just "all cpus", when we create
> the vCPUs, and we change that later, if they have one already (due to
> it being present in the config file, or in the dom0_nodes parameter).

But that's what I'm talking about a little further down, where you
reply that you don't think using the more narrow set would hide the
issue.

> Something that *maybe* we can try, since we're handling dom0 vCPUs
> specially anyway, is to directly set dom0's node affinity to the nodes
> of the CPUs we have in dom0_cpus, before calling vcpu_create() (in
> sched_setup_dom0_vcpus(), of course).
>=20
> This should make sched_select_initial_cpu() pick one of the "correct"
> CPUs in the first place. But I don't know if it's worth, neither if
> we'll still need this patch anyway (I have to check more thoroughly).

As per above - sched_select_initial_cpu() behaves as I would expect
it. It's credit2 which subsequently overrides that decision.

>>  But I guess that's still useful for other schedulers.
>> I wonder though whether sched_init_vcpu() shouldn't use the CPU map
>> calculated by sched_select_initial_cpu() for its call to
>> sched_set_affinity() in the non-pinned case, rather than setting
>> "all".
>>
> If we do that, and there's no affinity configured for the guest, or no
> "dom0_nodes=3D", when will we reset the affinity to all, which what it
> should be in such a case?

Why "reset"? When no restrictions are in place, afaict
sched_select_initial_cpu() will calculate a mask of "all".

> Also, if I'm right in my reasoning above, when we come from
> sched_setup_dom0_vcpus(), the mast calculated by
> sched_select_initial_cpu() is basically cpupool0's cpus_valid, so this
> wouldn't really change anything for the problem we're trying to solve
> here.
>=20
>> (I guess doing so might mask the issue at hand, but I think the
>> change
>> here would still be applicable at least from an abstract pov.)
>>
> I don't think it would mask it, but I do think that, yes, the change
> you're making would still be applicable.
>=20
> And, about it, One thing...
>=20
>> --- a/xen/common/sched/core.c
>> +++ b/xen/common/sched/core.c
>> @@ -3403,9 +3403,15 @@ void __init sched_setup_dom0_vcpus(struc
>> =C2=A0=C2=A0=C2=A0=C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_sched_unit ( d=
, unit )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 spin=
lock_t *lock =3D unit_schedule_lock_irq(unit);
>> +
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 if ( !opt_dom0_vcpus_pin && !dom0_affinity_relaxed )
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 sched_set_affinity(unit, &dom0_cpus, NULL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 sched_set_affinity(unit, NULL, &dom0_cpus);
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sche=
d_unit_migrate_start(unit);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unit=
_schedule_unlock_irq(lock, unit);
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sche=
d_unit_migrate_finish(unit);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0
> ... The result of this (also considering the call to
> domain_update_node_affinity()) ends up looking very similar to what
> we'd get if, instead of calling sched_set_affinity(), we call
> vcpu_set_affinity().

Funny you should say this - this is what I had done first. It works,
but it is less efficient than the approach above. First and foremost
when there are multiple vCPU-s per unit.

> I'm therefore wondering if we should try to just do that... But I'm not
> sure, mostly because that would mean calling
> domain_update_node_affinity() for all dom0's vCPUs, which is clearly
> less efficient than just calling it once at the end.

Indeed, that's the other reason why I did change to the approach
above.

> So I'm thinking that we can indeed do it like this, and add a comment.

A comment to what effect?

Jan


