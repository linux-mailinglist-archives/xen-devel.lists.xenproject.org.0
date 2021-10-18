Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9E1B431213
	for <lists+xen-devel@lfdr.de>; Mon, 18 Oct 2021 10:22:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.211801.369460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNto-0002Ni-Cg; Mon, 18 Oct 2021 08:21:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 211801.369460; Mon, 18 Oct 2021 08:21:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mcNto-0002Le-93; Mon, 18 Oct 2021 08:21:36 +0000
Received: by outflank-mailman (input) for mailman id 211801;
 Mon, 18 Oct 2021 08:21:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=628V=PG=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mcNtm-0002LF-OJ
 for xen-devel@lists.xenproject.org; Mon, 18 Oct 2021 08:21:34 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ee506014-f6bc-4b9a-8c5a-a0ecf9ecc395;
 Mon, 18 Oct 2021 08:21:33 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04lp2052.outbound.protection.outlook.com [104.47.13.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-kxHj-J7vOG2e-vwCMXcqtA-1; Mon, 18 Oct 2021 10:21:31 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4606.eurprd04.prod.outlook.com (2603:10a6:803:70::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.21; Mon, 18 Oct
 2021 08:21:30 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 08:21:30 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0306.eurprd06.prod.outlook.com (2603:10a6:20b:45b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Mon, 18 Oct 2021 08:21:29 +0000
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
X-Inumbo-ID: ee506014-f6bc-4b9a-8c5a-a0ecf9ecc395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634545292;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+nPUiq0plCIbRzmzsCmwU7v1T8rSdDbSQ2p4utiF+ww=;
	b=ToLpJDEHlJ0jYnmnEDLOkQrzZV1uGDxBSNZS9ehjHqPCy5/sPHR/jKiMrOc7FMiO+RQXaJ
	ZDtOTzYPk7avwzZhzwF0sbpeVQ3x2UEyM2IgiPQB4Suob8EfSgS7JGJiGcQNSl2aG66i9h
	jQm5RPjx+Cugsx6EvTE4Ofe34kvUL1g=
X-MC-Unique: kxHj-J7vOG2e-vwCMXcqtA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RU0NWOufSA7jMnIVHusRVLY9wi33VP9KwevUEJ0xKUYP2c8GAEiyhFV9JOi7W4Ok0weQ+P8PIgz1cUqgUCMtSikaNFbAa9Fg6zsz1T/apYVo0tg76p/vnhQIuRp+99sMHh/Z+z/1UHOpOOM7erQNsYvPBdR2PLFIxHDIomJWuwhIKE3H2kheK/CUz64Cw+fDyELaRwlYS6hpwjuggY9NGPVoKz8tmchQL9hBe2hsRUIJdDJ+VqbpOCExU9TTK7Hx5QOVkzPZRbB/ugBpFOJ3SzkPYUbUEw5+YO+E11+iAXEGl5/rknfYSceRtln+bYk3B4QN+lKZ6Md+5yTVPUgeHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ICn+1vKFaW1xoOwZufQfKZd5z/UH5Lfil54ktYv5ioM=;
 b=nxMVpquSkrS2GIPrNRFWMJ37S8jObDl7+5+BPgjleLwT7pv9WiWMIujBV0/9wU7uBpIPpV7gLa8jKnC3oJDbwD3Ac6wPSIlgdjyRsW5W3U2Th8J+ZDTVNOpDAiz3sQebYbGirnnqo3jUrR6sEYuWKijCamgfGqbCN1IXtan0lQkvSOxqLGcePCYsm/CFBtVEFMJhMkAgihedUxxZD8Mq13c1uPNdC6id8CtEn9WpOx1kgItsVcqyPe71a9YF5tPjSSOvkNt0L0CNTbAAh1KwqbnI5T9RecsmPMoX4c/bJ5ycX7vX3/t9T7DlE6CCU8nDK4gTttnCv+iIdWTI2fR//g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH] x86/xstate: reset cached register values on resume
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <iwj@xenproject.org>
References: <20210818113017.454251-1-marmarek@invisiblethingslab.com>
 <45de5185-b514-8c52-6922-4c587818c698@citrix.com>
 <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6adf41a6-8f05-8ead-2b12-e922939955da@suse.com>
Date: Mon, 18 Oct 2021 10:21:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <3125583f-b965-7746-d833-c197857cd7d7@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0306.eurprd06.prod.outlook.com
 (2603:10a6:20b:45b::15) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4658da40-9bd5-4639-cab1-08d99210497c
X-MS-TrafficTypeDiagnostic: VI1PR04MB4606:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB46063AC3E7587FA819A9914BB3BC9@VI1PR04MB4606.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	mMxKAe9yJMn9Y4f/RGVNJGV6bk1RWZZxxqYXF5iu5MpsaIc8TMuggcs1JCXGlDb4t/JLlyLRez9FFkB1c9czsc9ZKx59dgoaSWZD9aLqSYmzkmhcm8G86YMr4w2Kn6STwKIjVqtgvSO4+ZqLx+mnksVKuE9pgQOJQzLtAoACFOS18SPTtl4Z4tp96oNDRQGOebesndx6sIQFZMqCJI6bzjh39Nq4wVfdxIMrwREIgDCD6AaYNN5V+UTATp1yPgKxDzDwEqYsq6YNms8+GmWNRRxIz0xHhw/Hxnh7MF031ZIT4qOEOorQlbp0TAHfdxrBkKeypf2YG2Bv6u3ZRO8rB1L3IEsvdzGAkDAzp+KwreqsMPjorRMXdqRgDv3Wf51EWlZt2bDWmWXhSOcf0ZXPMst1v6CRdKyP7ZAwZisA2e4o2MiVUVClnpmRKE0bgOpYafrH7jwHysw84qbn/IEmwHbf6x/RjcGOpfFStCbUSuXFJToWvQUj81GG7CS54S+PKp6SR4Au0/UhhLFPwEBcxm+Sn09kGRg2X4WuT4rfMLxiHpukoSL3NS5rjkg5E41ddh2msz0CYRoxitO6ytLFNu64kBr0+b9djTmrzE8t+Xjwj4Cyl+eeQVU8KE6DRP6NlhH2IV28gFCznHcd3d5uh23AMDyynRCuTQMqNekuaIaPIggPrH+DVqLwaQKVP7wPLqEGIUrV4MjKpWzFMEwByaAOoy65tL1wAfbNMaXOCM+P2n4574skU/oEOiSaZ2jg
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(26005)(83380400001)(53546011)(6486002)(2616005)(54906003)(31696002)(186003)(66476007)(16576012)(31686004)(5660300002)(508600001)(956004)(66574015)(86362001)(36756003)(316002)(38100700002)(66946007)(6916009)(8676002)(4326008)(2906002)(66556008)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EoFKfiaPoh+XQklzmeNwLuIyrccIahg478w+qBBE/a5r3ujzPOxGP8TladLD?=
 =?us-ascii?Q?fKiHO1diMj+wToNn6qDRTYvUSLYaOQDTqEaxDUpcer8WSvMZ5g1omBwI3Tob?=
 =?us-ascii?Q?3Ev5NO2jYD/aan0JbhDZKb/uHsNO5Y1MwdhbGKcUo13hx6IONiZiRz/q8qy4?=
 =?us-ascii?Q?C97hbQCuI5h7NsWqlqzk+PZMQLaSHMVU90aIu2n81yrAjEMW9i7FFySKh5QZ?=
 =?us-ascii?Q?OCNTCn80gD/LtKORhaFGi7dITzFIBdSBrztgltGLknuMiNd43dIbVhbMAcSJ?=
 =?us-ascii?Q?bnzc8cCrRRn4Gww6FFccqaP05Et2cxyJ2NTCYFXm0Si+fZtXK/G/Lcl3zaH1?=
 =?us-ascii?Q?jnoLR80KYqz2wf1jnSIW25oxJ/fNl20VuJbIwrHULnHmsG7n9/7uhG+pwYLj?=
 =?us-ascii?Q?+eHkHiL6I0v6n6Cq4KPpudnw1ZKg09/6XvZI6YHvU8cOBmzGuwkLdEe/sMrI?=
 =?us-ascii?Q?EnbPiGZDjQPktbCsOM85+QDVQQj5l18EvzJBAZiptUD8SCoWb7btbsxEavWS?=
 =?us-ascii?Q?LeTJRNB0D/vCC+WM1TcT50dnwDngfZ/W+iG2it+X7jRw3VdM1UtCeRvWPdAk?=
 =?us-ascii?Q?goI1Rrajj2SMxyVfLToJq5czfxP8tDRldN1GPWVwb0BE/473i/46JjFKZXs4?=
 =?us-ascii?Q?tMsiuwMjXJaCWU9eFGPWANVXYHt5uish3nE10QKqZXXTn5OH0eyS6M451s/m?=
 =?us-ascii?Q?1YOx0Aunl9lTdvWds86H49Ap2IR+vZY6GqGoum0avXU6x+d9XrZuZiQ0fRsa?=
 =?us-ascii?Q?Je4Pn9kDcYGV81WlNmTmw6+zbPwPtFA7V17l6IcrLjw/WB0o5QaI3m0CFnUR?=
 =?us-ascii?Q?eGo+NTEjQvMJNrSQxRifo0MRgGudHgCFPb195e9ECnxX6VBsVqAINNoKh3w+?=
 =?us-ascii?Q?ceCVMJhLyybwQAsrrtMFjP19+JWXTUCG6p5v5P92o7zd651Fasw9iiNqLV6S?=
 =?us-ascii?Q?66p/ts6nERq+nRjVosDNpqKz1QrXGLoj6Zyxulp0rfFWzvr1Za+VKnd2aq5F?=
 =?us-ascii?Q?u/JbvgZIgwgGTA74NnRfufon++cN3cdaAlP1zuAoe4Daz+97ZL6CU/o8Nemd?=
 =?us-ascii?Q?5TLCvJwLovU2BH0UhfosH8hX+yBBXZrsQb5IuzElfORwQ91191CxLcCdSdz8?=
 =?us-ascii?Q?11E3BFmpDnGvSE33tarT7mgER1UwR1Z6q0GYeDg7aBiXm1oOXTclL2UJlt4e?=
 =?us-ascii?Q?5lqZB0J+6XOY0kaWJOMRe7vJMAfgJSGvxUIOW/oWdfDkQSHh/UWIcVMYEbFn?=
 =?us-ascii?Q?VtPBG2xl9Vu0AnnlQF3JS0CjVoIkVmWBnrpWOzPw0/u0u6NQ1nIrlIUIEeKy?=
 =?us-ascii?Q?fLkJaPFdv4ltybwtjcIBW9d6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4658da40-9bd5-4639-cab1-08d99210497c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 08:21:30.0822
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMdPYNeqWcl7j5LnFef+IRcPYbvmry8Gv1vLgPK3+alYMHRyMmWgK/fkt0NUDFcJk+LGu82fPp08+/osHYIVww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4606

On 24.08.2021 23:11, Andrew Cooper wrote:
> On 18/08/2021 13:44, Andrew Cooper wrote:
>> On 18/08/2021 12:30, Marek Marczykowski-G=C3=B3recki wrote:
>>> set_xcr0() and set_msr_xss() use cached value to avoid setting the
>>> register to the same value over and over. But suspend/resume implicitly
>>> reset the registers and since percpu areas are not deallocated on
>>> suspend anymore, the cache gets stale.
>>> Reset the cache on resume, to ensure the next write will really hit the
>>> hardware. Choose value 0, as it will never be a legitimate write to
>>> those registers - and so, will force write (and cache update).
>>>
>>> Note the cache is used io get_xcr0() and get_msr_xss() too, but:
>>> - set_xcr0() is called few lines below in xstate_init(), so it will
>>>   update the cache with appropriate value
>>> - get_msr_xss() is not used anywhere - and thus not before any
>>>   set_msr_xss() that will fill the cache
>>>
>>> Fixes: aca2a985a55a "xen: don't free percpu areas during suspend"
>>> Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>> I'd prefer to do this differently.=C2=A0 As I said in the thread, there =
are
>> other registers such as MSR_TSC_AUX which fall into the same category,
>> and I'd like to make something which works systematically.
>=20
> Ok - after some searching, I think we have problems with:
>=20
> cpu/common.c:47:DEFINE_PER_CPU(struct cpuidmasks, cpuidmasks);
> cpu/common.c:120:static DEFINE_PER_CPU(uint64_t, msr_misc_features);
> msr.c:35:DEFINE_PER_CPU(uint32_t, tsc_aux);
> xstate.c:36:static DEFINE_PER_CPU(uint64_t, xcr0);
> xstate.c:79:static DEFINE_PER_CPU(uint64_t, xss);
>=20
> There is also:
>=20
> traps.c:100:DEFINE_PER_CPU(uint64_t, efer);
>=20
> which we *almost* handle correctly, but fail to update the cache on the
> BSP out of S3.
>=20
>=20
> For the APIC, I think we have issues with:
>=20
> irq.c:1083:static DEFINE_PER_CPU(struct pending_eoi,
> pending_eoi[NR_DYNAMIC_VECTORS]);
>=20
> because we don't defer S3 until all pending EOIs are complete.

As your planned more extensive rework appears to not have made much
progress yet, may I suggest that we go with Marek's fix for 4.16,
with the one adjustment I suggested alongside giving my R-b?

Jan

> I gave up trying to figure out the MCE or power governor logic so we may
> have additional issues there.
>=20
>=20
> Additionally,
>=20
> flushtlb.c:34:DEFINE_PER_CPU(u32, tlbflush_time);
>=20
> really does need setting appropriately, although I think the only
> fallout is a few unnecessary TLB flushes.
>=20
> ~Andrew
>=20


