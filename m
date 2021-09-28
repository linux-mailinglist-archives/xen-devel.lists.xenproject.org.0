Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C6441AA91
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 10:25:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.197784.351019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8Pr-0000fR-W5; Tue, 28 Sep 2021 08:24:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 197784.351019; Tue, 28 Sep 2021 08:24:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mV8Pr-0000de-SW; Tue, 28 Sep 2021 08:24:43 +0000
Received: by outflank-mailman (input) for mailman id 197784;
 Tue, 28 Sep 2021 08:24:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mV8Pq-0000dY-FP
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 08:24:42 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cefaa5fc-3415-46c3-a974-611253d5786e;
 Tue, 28 Sep 2021 08:24:41 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-JrhyZcmgNPC6bcmC4LJLBw-1; Tue, 28 Sep 2021 10:24:39 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4192.eurprd04.prod.outlook.com (2603:10a6:803:4c::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Tue, 28 Sep
 2021 08:24:37 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 08:24:37 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0150.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1b::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Tue, 28 Sep 2021 08:24:37 +0000
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
X-Inumbo-ID: cefaa5fc-3415-46c3-a974-611253d5786e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632817480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UElRKBsHD6IT9SKEi4casJP8K2M6ZLpkY9DNMpGqoWo=;
	b=UKGcnZv/EuQT3JBh9WtBteexGIkp6ROPOEo+NoYeCcn8umJTo0J0qeuKlO6Holhhz1Xemz
	d+R4sALPueHIbOM66pt1gpjns1ZH+XFoAd+zpl+twJuS3IeN3/FoWvgg7w7TaWNMY1eNxm
	YZCgbDsW/jKgwrup7+MguRiLiaUagCM=
X-MC-Unique: JrhyZcmgNPC6bcmC4LJLBw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CPaiTNYBRAyqRbaj2+EkPpGxWAkYGG+no+IPtRhUMUMcsHPGR2Ei1PdnqvDou+QcDC07OT6icpR/NT4d2thmA8+pKamMCOfX61VT/jZTp6p3UgHCT0iSNWV9VFirVGPMlygpdiA5KpxCaprXI0gkVAEl3ZRD/lcz3Jvig4M/1vY57m82qMFpF1QSBfjMbN2QvhpgH1K6K3irntV5r/wtK+KKoAc1IY50GH3zikjXtCXsqNYyKfMgUvh4Vk6sqnT+C9jaPclh2/kmfUVoR7cnqqM4RZdv3nlOMer/Lsx4cLYy34KOvpCFdSC+KhB8pWuYmCZb4nZezsE9kEfB/hQvHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=tR4AXSaKVfroVxqGofVIKZsWC/DUTb78WRJF6HG7UP8=;
 b=QOXC8ssdJKgmbKE91mp3zO3qmObywkII0pWtMf9euyC2xswnEjWGCt1HhPv3FzmkGF3YY0jc0bfn0WwlptGpJZlHZ4SoFeftZ8TT0J3H6qmbSzgduzwTBr0CrOQIbHAhzgVxTCQ3P5tK812HLT6bBKmBJ8Qs6V0v0FgjmEY3lHbtOliLHK4SBC6XeWMVN4I1vbwBs+odCwdl5y4u79cBnO9BqeXtol0f+1Zls8toOmrWmk9K82amVybyYDQWOVRIsCfp8l9AntcYXWCv838Ztqf3BnJe2iHM/o7fFpdaX27tv9qYDiBrSn/IhkE5KkVam2Aq1OOzF0HMhD5XarmPDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: Semantics of XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Tim Deegan <tim@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
References: <13e3368d-89e3-360b-36df-bc215227b7e3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <0a9f9f66-2abb-7156-44cb-80a78415dd58@suse.com>
Date: Tue, 28 Sep 2021 10:24:35 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <13e3368d-89e3-360b-36df-bc215227b7e3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR0P264CA0150.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1b::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ea08fbd-d304-4870-20f9-08d9825968fc
X-MS-TrafficTypeDiagnostic: VI1PR04MB4192:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4192A4EDD4B1601465E7DA9CB3A89@VI1PR04MB4192.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	1RuwHU/7JKt7upeYpsipSVb1/qsSwjeK+CdRW4ScXyK3ey+DU9vc/WY2Gpe5zez7pxQBx1C6bn8B/nABZMCp1ujPZWm4e7IzsDRHtoFL1kdSkcRPWn+RXSwMYvTs/se/kuCObyCQbTtbFBG5qHw1guY4kBa5t0PZBNFu5hCDElgS1sjtu7sodY4q6cwhft3DRts4BFPJ1eFJMAoDnMmrRq0PvGQB3vbj9+yAJgtYs2E08Q+qYSq4Vk1gQqgwNQnbeEihiedbW78xKmvEaqJuqKGhLCEwGuSWvxlpkPhJQvjhoHxzvU/Zie5NKolVDHCcEXgQRItnFsHCgLuW8dzWxGv6VqOi1WbQ93tJ/DvQBfcdLrAku3aONxl7JsLTcQBn0N5XRl7bpzM9D6rxE7sscv4EGNxSPIX36cj2OcB+GCkWhSnHjkHNx9bjNwmS5SDZBHxL5cBYdY+X8qWXp6nGEavMEuutd6XLBPeoPYKkYvbgOpusCtI9M9PuewwQzF5zQTs9dLaA1P/HHZ5HokTpK5RftDsc5orLIklqif4WIna6X0vff/zZubWmzF25zszxSDsSvJym9958y4XU63PSuNYvCmeLd4SE1l6rI9yW+7nesZs3+mVkAxzfFZg3+EQE0gwncgQTLgpYQuKCyaRltkkx319VQLOOkjjuCMb++pEHX4w07Y33T5pXb7MHa+AW+R/Z5UXnSpRTn+w1NG+KAgL1nbhZByHVLPbz+Kt+y7J7QArS79rD7Aahb3270kDu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(956004)(16576012)(7116003)(26005)(31696002)(83380400001)(38100700002)(186003)(8676002)(316002)(508600001)(8936002)(66946007)(54906003)(53546011)(66556008)(86362001)(6916009)(2906002)(31686004)(36756003)(6486002)(2616005)(5660300002)(4326008)(66476007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kCObOcUhZVl+WsWGuTNWzj9S+hdrOfn/6H9T4VdFY2AoYIhetLlxTs4ETrbj?=
 =?us-ascii?Q?3thWF3ggGuNF8d9ml78NDyOD82y4zUMSUqsB9dYjbqjGovbyXFiPtvG94DiG?=
 =?us-ascii?Q?pEFabReYwb6pg5Bk/uQJrZgG+DtFnMWi5sdkLYArIsi3gz9hxLCuD7/cF6e8?=
 =?us-ascii?Q?wwKsZYJCsKmz8wmhVNMt/wnNiBJfzRkswsnfewRwe1ROh3t6i522izST5B1g?=
 =?us-ascii?Q?tYbr84Y/Z3F44+YEIxak3v7NGVzL7P5Sza+YxCCtO5UdTXwlwVuVhLXcjZzf?=
 =?us-ascii?Q?BIfc2CAofaAIv7CHJHnz6IpmfLtBl+ktrnSVhzegJze8/S5r49lV82GE71fe?=
 =?us-ascii?Q?XW2gxck/g8yYVJNJBuAAy4+jg867yB7XNcfaWxkFph8MyeDAKkTed5UJn7CG?=
 =?us-ascii?Q?+53VXrK3QFd8aWEBqFFkK78vzq5lGzLUw0vq53UZIKJ3vGsNyXo0ZT9btdJw?=
 =?us-ascii?Q?K1QJYpwBMuAwxI3eDwRuh8m/JF3Anh+jZM5yVvhd/M5muY09lkGJ4I71kr6g?=
 =?us-ascii?Q?l4uTUlMbDS9Yoe+E3bgelLEIPhj5hbKL3n5X4m3BSAY/qYAOsMlgKrl5XdiM?=
 =?us-ascii?Q?QUPoIAZsl+J3KM49xaN8OK5OwaftvX4WD8sk7DPYuNodwuR+155kyRVb9n8F?=
 =?us-ascii?Q?S6BAa9cN6qLHQU5wbN1ryfefEbrGiBLsFON7k90AKj9QXQYuyqSc37jXxqkh?=
 =?us-ascii?Q?A8eSfUCctdWhed2PTtdi6Hq47ORO+S0hmMKFowXyAPkPzeQO5NJNV3qyJtp5?=
 =?us-ascii?Q?ykk7Uk2rvQi4qcNlV3IDiVrnsnuYmHM1okk3VOlnZXBr64KBvbOsp1Qv+0iz?=
 =?us-ascii?Q?lDKB3fNqSxS0Ftfb6bcA/KIqSMd/PZ9O6zXA4lwdPkvmqmQPlrc0oRP/JJ23?=
 =?us-ascii?Q?BjwVA1vidzEkXwUvHfxlpjONI6453/fSA8M/ID7P+NoPsqJvycgBX3VK16q0?=
 =?us-ascii?Q?GxzwO3/P+NfXerV4XKZkL/fuo9Ty1vBu7B2R96WtnE8VFFopjj0hErF3rB4O?=
 =?us-ascii?Q?EG6yter9hlm/YHEzl+gHahhHv9BvyUcjubUiMNzc4leag+ObQL8gXepu7jL3?=
 =?us-ascii?Q?7LyqR+2yGGzwrApgfGNdKY/fCFRZ3euRGs1y0dUvQkqPVivrMWr/N452ZboO?=
 =?us-ascii?Q?DMP+k4Q6SinY4WtH10DcQ2ccTE0vSCOEstdFuTPqMh8THEZQp/AeMkaSeDf3?=
 =?us-ascii?Q?eDjHf8Da1NsD8Y5w9b1gRgNBgD4coVCj+h2HWIllYCmbr4pgPJYbXUbvuRTN?=
 =?us-ascii?Q?/yAkAWDz3frHhLoSLizYctFp2q6/l9lE3F/yNuAz8w2h/IoHJcQnxUN9ekMG?=
 =?us-ascii?Q?xyjGZ7bQbFM37ShS6zaod7OI?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ea08fbd-d304-4870-20f9-08d9825968fc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 08:24:37.5959
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nojxprHFaf/80yDzb1xodPqwz1WORmm8PF4ceMOzs/ZKP7+zDBEA6Ur7dE4cEIWp+APsrwtn5ICJuVmzItkEkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4192

On 27.09.2021 23:01, Andrew Cooper wrote:
> A recent ABI change in Xen caused a total breakage under the Xapi
> toolstack, and the investigation had lead to this.

I'm curious which change this was; while it's likely one of mine, I
can't seem to be able to easily guess.

> First of all, the memory pool really needs renaming, because (not naming
> names) multiple developers were fooled into thinking that the bug was
> caused by a VM being unexpectedly in shadow mode.
>=20
> Second, any MB value >=3D 0x1000000 will truncate to 0 between
> {hap,shadow}_domctl() and {hap,shadow}_set_allocation().

This wants fixing of course. I assume a patch is already in the works.
If not, let me know and I'll see about making one.

> But for the main issue, passing 0 in at the hypercall level is broken.
>=20
> hap_enable() forces a minimum of 256 pages.=C2=A0 A subsequent hypercall
> trying to set 0 frees {tot 245, free 244, p2m 11} all the way down to
> {tot 1, free 0, p2m 11} before failing with -ENOMEM because there are no
> more free pages to free.=C2=A0 Getting -ENOMEM from this kind of operatio=
n
> isn't really correct.

It's questionable, but I wouldn't call it outright "not correct": The
function was requested to obtain memory (from the pool), so one may
view this as allocation. The set-allocation functions really are both
allocations and frees at the same time (moving pages from one pool to
another).

> Passing 0 cannot possibly function.=C2=A0 There are non-zero p2m frames b=
y
> the time createdomain completes, as we allocate the top of the p2m, and
> they cannot be freed without the teardown logic which releases memory in
> the correct order.
>=20
> In fact, passing anything lower than the current free size is guaranteed
> to fail.=C2=A0 Continuations also mean that you can't pick a value which =
is
> guaranteed not to fail, because even a well (poorly?) placed foreign map
> in dom0 could change the properties of the pool.

Well, I suppose outside of domain cleanup shrinking of the pool was
always meant as kind of a best effort operation.

> The shadow side rejects hypercall attempts using 0

I haven't been able to spot this rejection logic. Instead I'm getting
the impression that the BUG() at the bottom of _shadow_prealloc()
would be hit if shrinking the pool beyond what can really be freed
(i.e. in particular if any pages are in use for the p2m).

> (but can be bypassed
> with the above truncation bug), and will try to drop shadows to get down
> to the limit.=C2=A0 This represents a difference vs HAP, and in practice =
1M
> granularity is probably enough to ensure that you can't fail to set the
> shadow allocation that low.=C2=A0 There is also a reachable BUG() somewhe=
re
> in this path as reported several times on xen-devel, but I still haven't
> figured out how to tickle it.

Any pointer to one such report? I don't recall any, and hence it's
not clear to me whether that's the one in _shadow_prealloc().

> There is no code or working usecase for reducing the size of the shadow
> pool, except on domain destruction.=C2=A0 I think we should prohibit the
> ability to shrink the shadow pool, and defer most of this mess to anyone
> who turns up with a plausible usecase.

No present use case for reducing is a fair argument for dropping support
for doing so. That'll still mean an error return, which - according to
what you have written near the top - may still upset the Xapi tool stack.

Jan


