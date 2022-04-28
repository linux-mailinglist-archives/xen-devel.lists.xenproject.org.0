Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35039512BBE
	for <lists+xen-devel@lfdr.de>; Thu, 28 Apr 2022 08:39:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315999.534688 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njxmx-0006rU-07; Thu, 28 Apr 2022 06:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315999.534688; Thu, 28 Apr 2022 06:38:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njxmw-0006pW-TF; Thu, 28 Apr 2022 06:38:06 +0000
Received: by outflank-mailman (input) for mailman id 315999;
 Thu, 28 Apr 2022 06:38:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=h8bM=VG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njxmw-0006pQ-0V
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 06:38:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c187bb79-c6bd-11ec-8fc3-03012f2f19d4;
 Thu, 28 Apr 2022 08:38:04 +0200 (CEST)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2050.outbound.protection.outlook.com [104.47.2.50]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-18-M9v1_0BcPFyke9_VRdr4iw-1; Thu, 28 Apr 2022 08:38:01 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AS8PR04MB8247.eurprd04.prod.outlook.com (2603:10a6:20b:3f2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.23; Thu, 28 Apr
 2022 06:38:00 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%8]) with mapi id 15.20.5206.013; Thu, 28 Apr 2022
 06:37:59 +0000
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
X-Inumbo-ID: c187bb79-c6bd-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1651127883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9pZr5JenoXM4iIWaUGL3j4EdX8XWCwHxTDjLES1lDcI=;
	b=M0YjvNaAAswX3sPjR2Te+40SvaCZCneHsGpnRbpW2xMxyXYRkwLuuPN1z9/L46vfnJWYJV
	dhbrM7COhlfVejx2kSQKLimM8rz8wql9XnNEoEjReaMK1kCkha5LZi5E9dZToF/+xGyj9+
	O6reJx3AaD1ftHyjhVDp7mMIY/C0qGE=
X-MC-Unique: M9v1_0BcPFyke9_VRdr4iw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nLysDHRTylDYiJpTOZyK3AhTIXpTm0rYJ3UikcAN/BPMEhk4gq7MR52r3KW6jK0mFtPKv48Oo6296mg6EjGLSM3eYnFdV7N6AVjO98lXXmY8nwJuKOfnQ2pN0JhrjeFuky57dQ5AZb5/65iJVP51mWzuFDD75+v1Td9CWJoPeCI6JWnD/lHHgLR3Mb/Mw2gdTQTF4kAG8HC7tNgDnzoJxCyAHDM83SpNqjXajGUMZuk8X12WGz6BdNtAKoHvcfnFkd4P6yV0EUchLTyag/uPJzIlrue9/7wQm9lNvlg5UlSA/Ep3+I3L5AQor6QHiCK4z4Pf1vF4A/bFqE2DTUoNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6zh4VLUz3RDRWUv2f9VnJJHORSL5nQnQ67F8bY5sxs=;
 b=NIT3maZE2/oExfSbG/PyFrhWQ6fveRZIWSv78vyrQ1vb0tTFGXYK0H7lGOpiFrkYBrG251Av2vglWyH9JXlmymp2eeW+Ei7w94YMHb1FQgJE3fPWDydrTMGcOT5dstfp7pH88bLJ0ed1W8rs9WxAbDI/xlTDdaJ54kncY2PDzX9NeffKqSvUjvIncxyZbtcxKHlWHCbDYt8pqqz6FS/axa01c5XE3RmfmjNxR30QhCKNJ84ESZ44ZJQ+AhSjjUAMrIdNnPlB1Job1j41exsNDAhlcvD+SyR+adu8Y9o1V/DbBd2kvaeDadi7wLS1i2rKJkVOE7fUvM8I81G4jSxsDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <9a4d1bec-321a-21da-6a11-4b4990c52895@suse.com>
Date: Thu, 28 Apr 2022 08:37:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 3/4] mwait-idle: add 'preferred_cstates' module argument
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
References: <4eae5ab3-361c-4eac-619c-160147220be4@suse.com>
 <7c15016f-cc57-f128-4b79-79c820f3196c@suse.com>
 <Ymk7BjXdyiMUGoc8@Air-de-Roger>
 <47b50c64-b8bd-df95-9de9-175780c50e0b@suse.com>
 <Ymlb2Wly25k9bF0z@Air-de-Roger>
 <d9e797eb-5075-2c95-cfa9-959586577f98@suse.com>
 <YmlrYNFI75wQlVlg@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <YmlrYNFI75wQlVlg@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0019.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::22) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 26d6d035-9185-41f7-0688-08da28e1a333
X-MS-TrafficTypeDiagnostic: AS8PR04MB8247:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR04MB82472E843547C41E473B0471B3FD9@AS8PR04MB8247.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	A5jJTJE6qRNoL3YEQ5k+52R0V2IWv/2Va/57h4oVgeHBDkSO14f67IS6C7HmQNUPSxjXiULI9HbOtCEfHqMaYt7p8lj2dWAX5JekXATnvKS4ce4kk7i2QyngL85JtVns5/naGLe+YkE8cZUBKmzf1YUYL5V7gJS477UCWcPunFz1XoUjbQriHyJIwMO0u9MRTffQ3igbnU7VAxLAxjN+YUwupdLh0fZx/J8+v/1XHYsqhs7yb8lq3fceaK3qUQCvSnL/Kd8mdg2mLXNFDUx6/G1d2pn7lwZR8ca+6SSeM4+hPST4mevtu6IpkS0XChiRApU8TeJqH5qOfKBoFm+wuoYPZtF1oHlz5zW0wz69Ipicat3GtrMkcaa07PIGVvD8UnW0lUYZxpYAXOxBYleAhacXWH0gb4g9kTGYnKrAXCpJx8ip3kiesw+uu1iAN30kB7DBn3Yd0yOrhmXRoMQImAdxy1VcjUDa1QWGRV5ChzBs7d43yXRQwnjIb7WeaGzpINdgfCnkxvEZO5eT3X+LJ5j7V/YsleuVmkyZV5/8As1L4RHLyFNsIVw7N692R+ya9i8360S+fQ+HO8TgUxFaIqUblMnmd5gSe6q6aTX+HraRnZ7QCpWyVcKKGIEUZwXbJ84TY4AYhaGhtyjoNcABqJJ/Pyc6Ns2hJXOoGpU/4kXJVE5hOGfbdJ3HfLv0c7og80yPyGE7EnQjbCIImPez6JdDNsAlXn43I/i+SefNyqycQi1CGAGII4+UwO1QjbgrGYGGbTHSCVmwCiGQCpQa8zBeMsQzse8/NsXllXKbuzwLZ7uFea4/WKEsl0VXga0V
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(5660300002)(508600001)(84970400001)(8936002)(83380400001)(6486002)(8676002)(31696002)(186003)(6506007)(2906002)(86362001)(26005)(53546011)(6512007)(66556008)(66476007)(316002)(66946007)(54906003)(6916009)(36756003)(31686004)(4326008)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dk/Fu8yGeARY8N1t3aLc7i4+PQ5gE/wVpYpzNA2wmkkLZe9XyS+sNFfmADAj?=
 =?us-ascii?Q?pqoszo7fB4EqIQXu4p8DdPjeBDSHhwKTEkulYoHQdZCTkSh4XKTgql7fnm2w?=
 =?us-ascii?Q?hWPEOzfSAg7b8V/TyyCRM2UZj5xc3qTISk5Zvnt7/2T3qp0f6vIdAedji0Cb?=
 =?us-ascii?Q?Y65m3hm6Q4nfnUcSdUe0hS7jN5VxGt094fJ0WgdtdO978564YCi24ekvxyTe?=
 =?us-ascii?Q?CV+HVRt9t4tQfqdEopj2zWjsEpdb28zMoMI5zJJT5pIxnEi6hG26dhBfUa+w?=
 =?us-ascii?Q?GBDIoOgxudgu/BmwzqtE46wR/+TDXisI7NDA/zslyUwBK3PUdrPWBACZhNxK?=
 =?us-ascii?Q?GbXtt3mecAdS/v9lBzoalT4PoT1+vyZed/ZJ1R/ReNojbcLH0TJ6x2b17+d6?=
 =?us-ascii?Q?DvtS3nFDX8FXx2FJbGVRsi2Z/SBk87E7RN/rC0RBMInmARt0IK9aVAW05Uee?=
 =?us-ascii?Q?m/dQY9+nWnBEa5N7Gos6enzF57VGocuqnhlMKLUPRvUXbgR5oVcqXQbq9Pwl?=
 =?us-ascii?Q?81LaiqJzzjpxLKrjDVi74NJyVmT+0gbznCwlPyqu63381XnUTMqQuLQvHSxm?=
 =?us-ascii?Q?e+iwa2IvC6t0hzgR3pvUKc3CeBxcooLJoP/L/mhF3H7aUCKUQtP8V3p61sGH?=
 =?us-ascii?Q?H5cNh8cko57007oQGYXE3b6Th0XzfzUltfB3ETVkqpG8tng7uYrPj6Wv/5gq?=
 =?us-ascii?Q?zmTgTtocXKF7l8gBYVSHDi5FIEe4UpuYEMU17KBXkMNRWZ5Hq+8dWqSrr8B0?=
 =?us-ascii?Q?E4FXxCxiQmzWEpahvOJgpk26hEiidj1T4P+GGKKpcg+8PLlyvlsA+ucNAxgk?=
 =?us-ascii?Q?YJj9hRIqcHiH+KNComGOZz6dO5lt53feBzt97O2ScMA0b8n5iQFf0npSrp/f?=
 =?us-ascii?Q?dLpzzUDR56xLWdCUbRoA0shAazoIWJssHygzZMTcnmJyXyeuczY2VeyH9B2U?=
 =?us-ascii?Q?qDPthSO5m7XkUA0so0A+O+M4qvvIl4GlQA+EaDuLdU2qVAHvqQv7ffw9DCt4?=
 =?us-ascii?Q?6+l6ikId+uTaC42UOicEKkmCtnxziK9tdVRk5VPWKERTj9l50OX55ATjZTja?=
 =?us-ascii?Q?UZmCvF+m/TePCIYQGAyIMmV9vO+JP/ynwYaoz91VkvBAtsBAuR7n+GHd8piO?=
 =?us-ascii?Q?eJhDPTbaKrYpgOrajAWUZslc+rPd/DBYkoR6fYv60aMz0bFvjw6EVQ5YXWgN?=
 =?us-ascii?Q?+UtH0agiEk+6A5RH8S2UNZ0w4PpmfGCAH4BQSel/0YSk8RScDecRNIhltmyv?=
 =?us-ascii?Q?AZfOPrixlcWg3lyDWvzRb+orfrp9TWkDSgFYSvAEg2CuughsvBoyIYMuK03n?=
 =?us-ascii?Q?cA1pFxej3bZPu+RT8oLBjtu4PCOIsPrPpMUIxpDfEqJjdqxNvBJUtzlz2D4M?=
 =?us-ascii?Q?D8dvJoPudKhCp0KoGBWlgs7+brokxST11RsYViOYsbVxCwKJfffBLooS281P?=
 =?us-ascii?Q?vk2As0edauuE5uQbFsEFvJuoQY94EoDnzU/rv+6Azc8vAJ8LFw0TES7YtFrf?=
 =?us-ascii?Q?+Xl9qHlBd4xiMpk/5Un5+jgnS2D6jgOUgH3OzbrHGDstg7Kdym0ElDGXseK3?=
 =?us-ascii?Q?idjauWXsuabBtE1tg8faropAtOptahnPtJVnVeAsG1SS2A88j0erOirZCghO?=
 =?us-ascii?Q?PH8/Mo3a/bkv0obmh/WgXBD6HSOkmzHHiX16cVnJaTHBjCNLqwhfqkFQggPc?=
 =?us-ascii?Q?40vZzj362HCQOGD4CFmn6Otac+u2kk5UBT3aF88Vp2xYtU28ZYc7ssh2JAQD?=
 =?us-ascii?Q?xWaTqu2VIQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d6d035-9185-41f7-0688-08da28e1a333
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2022 06:37:59.9342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 01Aa25UTcAwFJfEC9UH/XOJwCek5Sbh2mVwP+geW2MUO0K4RqMny1OizyZteBgqWAyB7nYo3+ItOYzHhoei6UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8247

On 27.04.2022 18:12, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 27, 2022 at 05:25:35PM +0200, Jan Beulich wrote:
>> On 27.04.2022 17:06, Roger Pau Monn=C3=A9 wrote:
>>> On Wed, Apr 27, 2022 at 03:41:24PM +0200, Jan Beulich wrote:
>>>> On 27.04.2022 14:45, Roger Pau Monn=C3=A9 wrote:
>>>>> On Tue, Apr 26, 2022 at 12:05:28PM +0200, Jan Beulich wrote:
>>>>>> --- unstable.orig/xen/arch/x86/cpu/mwait-idle.c
>>>>>> +++ unstable/xen/arch/x86/cpu/mwait-idle.c
>>>>>> @@ -82,6 +82,18 @@ boolean_param("mwait-idle", opt_mwait_id
>>>>>> =20
>>>>>>  static unsigned int mwait_substates;
>>>>>> =20
>>>>>> +/*
>>>>>> + * Some platforms come with mutually exclusive C-states, so that if=
 one is
>>>>>> + * enabled, the other C-states must not be used. Example: C1 and C1=
E on
>>>>>> + * Sapphire Rapids platform. This parameter allows for selecting th=
e
>>>>>> + * preferred C-states among the groups of mutually exclusive C-stat=
es - the
>>>>>> + * selected C-states will be registered, the other C-states from th=
e mutually
>>>>>> + * exclusive group won't be registered. If the platform has no mutu=
ally
>>>>>> + * exclusive C-states, this parameter has no effect.
>>>>>> + */
>>>>>> +static unsigned int __ro_after_init preferred_states_mask;
>>>>>> +integer_param("preferred-cstates", preferred_states_mask);
>>>>>> +
>>>>>>  #define LAPIC_TIMER_ALWAYS_RELIABLE 0xFFFFFFFF
>>>>>>  /* Reliable LAPIC Timer States, bit 1 for C1 etc. Default to only C=
1. */
>>>>>>  static unsigned int lapic_timer_reliable_states =3D (1 << 1);
>>>>>> @@ -96,6 +108,7 @@ struct idle_cpu {
>>>>>>  	unsigned long auto_demotion_disable_flags;
>>>>>>  	bool byt_auto_demotion_disable_flag;
>>>>>>  	bool disable_promotion_to_c1e;
>>>>>> +	bool enable_promotion_to_c1e;
>>>>>
>>>>> I'm confused by those fields, shouldn't we just have:
>>>>> promotion_to_c1e =3D true |=C2=A0false?
>>>>>
>>>>> As one field is the negation of the other:
>>>>> enable_promotion_to_c1e =3D !disable_promotion_to_c1e
>>>>>
>>>>> I know this is code from Linux, but would like to understand why two
>>>>> fields are needed.
>>>>
>>>> This really is a tristate; Linux is now changing their global variable
>>>> to an enum, but we don't have an equivalent of that global variable.
>>>
>>> So it would be: leave default, disable C1E promotion, enable C1E
>>> promotion.
>>>
>>> And Linux is leaving the {disable,enable}_promotion_to_c1e in
>>> idle_cpu?
>>
>> Iirc they only have disable_promotion_to_c1e there (as a struct field)
>> and keep it, but they convert the similarly named file-scope variable
>> to a tristate.
>>
>>> I guess there's not much we can do unless we want to diverge from
>>> upstream.
>>
>> We've diverged some from Linux here already - as said, for example we
>> don't have their file-scope variable. I could convert our struct field
>> to an enum, but that would be larger code churn for (I think) little
>> gain.
>=20
> Hm, OK, could gaining the file scope variable would make sense in order
> to reduce divergences?  Or are the other roadblocks there?

I don't recall. It might have originated from a change I decided to not
port over, or I might have dropped it while porting. To be honest I'm
not keen on putting time into researching this, the more that I would
generally try to avoid static variables.

What I would be willing to put time in is making a more user friendly
command line option, but as said - I can't think of any good alternative
(except perhaps "preferred-cstates=3Dc1e" or "cstates=3Dpreferred:c1e", wit=
h
internal translation of the strings into a bit mask, as long as (a) you
would think that's an improvement and (b) the further divergence from
Linux is not deemed a problem).

Jan

> I think this is ugly, but would make sense as long as it allows us to
> keep closer to upstream.
>=20
> Thanks, Roger.
>=20


