Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C08FF403C1A
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 17:01:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182195.329659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNz4F-0007ic-5g; Wed, 08 Sep 2021 15:00:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182195.329659; Wed, 08 Sep 2021 15:00:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNz4F-0007gO-0m; Wed, 08 Sep 2021 15:00:51 +0000
Received: by outflank-mailman (input) for mailman id 182195;
 Wed, 08 Sep 2021 15:00:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NNqu=N6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNz4E-0007gI-5i
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 15:00:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 24fc7253-5a5b-4127-9c37-88fe82a9b5f3;
 Wed, 08 Sep 2021 15:00:49 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2054.outbound.protection.outlook.com [104.47.14.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-by4afzcJOgu_iYBmySoebQ-1; Wed, 08 Sep 2021 17:00:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6862.eurprd04.prod.outlook.com (2603:10a6:803:130::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 8 Sep
 2021 15:00:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Wed, 8 Sep 2021
 15:00:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR1P264CA0004.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Wed, 8 Sep 2021 15:00:43 +0000
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
X-Inumbo-ID: 24fc7253-5a5b-4127-9c37-88fe82a9b5f3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631113248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sZVR7O+OObN/g1PdMt9hlvKFvOQM8eMajPFVhoANg4w=;
	b=SFz3jopk2l7SW6BWOFWWues8urYKQpVGMyJc9+SoT1wS/wY8VYO0J27NsiLD8JJGkXY/g0
	nqlbXJ/n9DudmkKRxBJ2QOLqx1sKJimYsIozC/27hqA2+BVcrig32LV43OPW4dK9TAGxe2
	qJSLyWLa9gujBVI0gvBmx1CLqnrM3bM=
X-MC-Unique: by4afzcJOgu_iYBmySoebQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MpW6YhlN5dULv583Is0DuYwbX/id5+W8fPkm0FesN5yrV7bafHvbubpAmnJDsgPhLx3KmOu+FmK4aWc9GhPtSpwk0zHvoQqruTtKLIOZHnnQa2jqCsAn+jnbqpbdEAWvYvSdZ5onoJ3N/dKTdN3FYTfT4L4uRBpDVAYiULcwgc+ASSUaoxxWLJmnIrtCtes/BnrlY65/N9f6MtQHynH11GWxwAt/y7xyumIi//cZXA7s1j9afJewkTvuwEFLQSaOT9BYpdbCzHEG6sUVWK2U64ewBJ0Vt+YxJGKzqE3R1typNnq/PaGW3XJ8T9uvE+Y/zHJYjpJCc/9gsyCAfYY6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ocepLHku+35R11tzlchjRw8Kfo4yHRPs8pdkaxCwP0I=;
 b=BAxyavjBCH9P0peYCJjVbdH9VAXpJTTUND05+oq0kppQwMsSK72h7zobWvJkKoMJX45ZlGXYJvJee2d7TEyjX2jpA+kCu8DjJtuisgC9k1jpTus1kIEPUjoP6YJZ2PWiqY5UPkvKt5Iovr3t3pbtxJLFaQ3qStTq10wLcv1OOUDlVt6FLIipnyIWVjkl300bsrZndjTVUYUFYss3G2II/t/7njCDntWOAnSCcrXjo9x4ySBLXK9Auz9a+hog5y3QZkJKLkkBhDbP4jrCOU0bpgYK4Uy8m/GQPFp1gy+a7qjhaSlVmkUCArsDLYMmpai2kJ3jgD+cQUSq8uAEYRelpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 6/9] vpci/header: Handle p2m range sets per BAR
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>,
 Oleksandr Andrushchenko <andr2000@gmail.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210903100831.177748-1-andr2000@gmail.com>
 <20210903100831.177748-7-andr2000@gmail.com>
 <1fb1223e-005d-dc78-cd34-dc97191b316e@suse.com>
 <ba644629-a251-4865-8a7a-075392b9dffe@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <7e0c9d9b-6087-83ef-f9e8-1e9e6eb2d1e9@suse.com>
Date: Wed, 8 Sep 2021 17:00:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ba644629-a251-4865-8a7a-075392b9dffe@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR1P264CA0004.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19e::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcd64fc5-276c-41f3-bdd4-08d972d96f12
X-MS-TrafficTypeDiagnostic: VI1PR04MB6862:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68620724EF963914135B0694B3D49@VI1PR04MB6862.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7mr8rUIcg7Ga+mQjHd/7VD0NMwUi0hLNXPLicl7quU+CDsB1/UnrXeujDDPl/Px7uTqs73BLarQasNsjvwWm+qsUqdLDnlMwKVDLioXm+UG4Ztn6K3D4vUyJB7uBypK4U/FOISfWVQEgFLqgGCc2kfOqOecol0TcYzZFhsRZduDoeriuB1SPCZLN/kZJTcPZkT9gE31qxYJkyd5sh/YsRu7czi+Jd+TP+MxzoJUYcL9CTfDFqCSj+TErECW2RsSQUbuSMKZad1ykhnUtblYm/Cw+u1L9AJW7XiOMbBmFdCHlC0+6LMwcpJu21hSI3AStL0a2Iyv9OmYda1rw9WHQ3rP6UDlyei9HdE1uIMnDbjdeGyRLenyvKRhykHAWuB18A1oZnPbVWyWePt/YJsC7iXMKiEhokUrqjm7RqJT4D8i2hCMOSlLXzDbqQvaWP0j1+oltP+xRSMLtGBazBwAo+kFKjSDc4rasG6Frm3McpG/QYhrnXGD5XRno5qyD1pKDVrkwrXbv1G8dbciDgqJTLdmeimc7+jaKErEajFb9MAdn820lnkw3rbD+NU30R5fikDq0JT/rYf1oke2vGTWRHhcJ+wsN2LSCqJGY2RPg6Pv8++F8EXmoEOtS1LIuSaUHQJXBEyn5JtLPEWMhGVUu3VumlcRGPvNaeey74x5hHgZky+FsmOUYk1Qte5umVv/kHZUyBu6BJcZWG/FgyS12KOy36XD9Re+gnpe3yU4hjFwtgyz+iDzjHGi3XUgK/t4J
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(376002)(366004)(136003)(396003)(346002)(31696002)(8936002)(53546011)(83380400001)(316002)(110136005)(956004)(54906003)(16576012)(5660300002)(2906002)(6486002)(66476007)(7416002)(66946007)(66556008)(31686004)(36756003)(2616005)(186003)(26005)(4326008)(8676002)(86362001)(478600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WWCYzLbCjPaWGeRaW7VmbtCa4SnOYDScMcIf5+W/shhgBygq6PvBPSg1F0O2?=
 =?us-ascii?Q?b9cl/W92ZTHgkweLH8aEwPThZ8QP5akTfS8c37kOMMCTpnF7m8qt8zknIEz+?=
 =?us-ascii?Q?R+2X7lJ2zuiYWZfe4RoWA86x+MCzYWzBwwXlE7ygz0W8SATPnKCbV4eg9pLu?=
 =?us-ascii?Q?mbemKYtFeko4vuQNWke1Ox/wRWXgc9xknMHD9tOPTRQLYbiSDM6XSTmK2RWL?=
 =?us-ascii?Q?erYER/pQA00kZ94eSsndtp4IYO3jTYlKFBgjqtssXKjNyJfAABjDm0E5z5Pt?=
 =?us-ascii?Q?+XBmOl3ukK3DElFtSoVFs6XyEqyDkxDVEHKZdQJRvcO1HIfMpPOvzkBAn7H0?=
 =?us-ascii?Q?+SRAhGW2/3cmPBjVKcPqcC0uwzdWofuUQczzuFZseIpoaLoy9jk96z+7T2ER?=
 =?us-ascii?Q?ihBhL66emvkGKgANFs9aT9w9SwirasLzalJae5+9SQjyPSJsDioZibG9lVZi?=
 =?us-ascii?Q?mbWC+BE4ccbVrEfHYPWex/d9uNqINBTsyMLTqXFmaO/t4iE+cDrq+WVS2rKu?=
 =?us-ascii?Q?MUtBhX5+/cG4Kp5fvdPVqeciUCVkPs2t28GAf/1J9CBYw5LFiV3/04IHyxtZ?=
 =?us-ascii?Q?4m4fvDNlO53Wmx8lCgVBARYpM5VEKuYEBpofplN6nTpTvFJm0nV5ujVpjvUy?=
 =?us-ascii?Q?XMnZ/AghGGi6JzLMORTrfy3FVPHe8ZzPTG124hPzTSEuauZzRqX3fdBb0b3a?=
 =?us-ascii?Q?WaKlJ6Ii/v/EFxrIw25+tSmt6vBh/ACAACqTJPkTwMOA/Vk7rUSb4HYnMH30?=
 =?us-ascii?Q?xvhaeKFzDFojP+QM4jjpdd96vUdwle/n7XtAYcxqOPByLui+GcboxSe8oLCz?=
 =?us-ascii?Q?eINg4NZl4Qc94TwdDF6mRW+wfv/frOnbbVRjhBsY58P9GGmvW8u9ZheoIk24?=
 =?us-ascii?Q?dN0oelsNMXnyV2IzN74NPBj7Ubi7pEsBJ1IC47ge8xegZWg5XTuI84ZfqdrB?=
 =?us-ascii?Q?tNpg5RBEKpiw3lXhWnbpsFr0WknfSsqYchWbPjrf2oD7FgUvF82fnkF21sIa?=
 =?us-ascii?Q?EEpzn9rucSBVME3cqWww41bJ1SOvQFp6Kn2STwpMe9L5R+MtQG1tbIBkBxGZ?=
 =?us-ascii?Q?e9wN20wCqraVX/VepZaIeV3V2sqtMTDIoRXg2Vh2D2HJGvTzzEyxtyZyh1oM?=
 =?us-ascii?Q?O6rR+OqC/gfuLGDel4RNRUIryTapeehGV35FlnN8pW+p2/nNhpoQ2hfm1Bp+?=
 =?us-ascii?Q?tcj7/WLfgzAbl7Xoqw8LjqgnYM8LB6aRvTKLsL4IX1qXyQs1zYdqEhi+DCIH?=
 =?us-ascii?Q?cUPx7ROT7yYDTo7D3Be40CE8H3RVAI2Z8TawFLM3DMKCs/EDRUp3wVzAQutH?=
 =?us-ascii?Q?g69GKW8AIayft0Bq+W33pGEJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fcd64fc5-276c-41f3-bdd4-08d972d96f12
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 15:00:44.7714
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0AbORJILUFe4ynWKoS5CUpdeQT7leT7TkwOa/VXVCkqUIEWhiCcQ49ueqy0DV9B4wRYSK7384YLMzGreCVW3/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6862

On 08.09.2021 16:31, Oleksandr Andrushchenko wrote:
>=20
> On 06.09.21 17:47, Jan Beulich wrote:
>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>
>>> Instead of handling a single range set, that contains all the memory
>>> regions of all the BARs and ROM, have them per BAR.
>> Without looking at how you carry out this change - this look wrong (as
>> in: wasteful) to me. Despite ...
>>
>>> This is in preparation of making non-identity mappings in p2m for the
>>> MMIOs/ROM.
>> ... the need for this, every individual BAR is still contiguous in both
>> host and guest address spaces, so can be represented as a single
>> (start,end) tuple (or a pair thereof, to account for both host and guest
>> values). No need to use a rangeset for this.
>=20
> First of all this change is in preparation for non-identity mappings,

I'm afraid I continue to not see how this matters in the discussion at
hand. I'm fully aware that this is the goal.

> e.g. currently we collect all the memory ranges which require mappings
> into a single range set, then we cut off MSI-X regions and then use range=
 set
> functionality to call a callback for every memory range left after MSI-X.
> This works perfectly fine for 1:1 mappings, e.g. what we have as the rang=
e
> set's starting address is what we want to be mapped/unmapped.
> Why range sets? Because they allow partial mappings, e.g. you can map par=
t of
> the range and return back and continue from where you stopped. And if I
> understand that correctly that was the initial intention of introducing r=
ange sets here.
>=20
> For non-identity mappings this becomes not that easy. Each individual BAR=
 may be
> mapped differently according to what guest OS has programmed as bar->gues=
t_addr
> (guest view of the BAR start).

I don't see how the rangeset helps here. You have a guest and a host pair
of values for every BAR. Pages with e.g. the MSI-X table may not be mapped
to their host counterpart address, yes, but you need to special cases
these anyway: Accesses to them need to be handled. Hence I'm having a hard
time seeing how a per-BAR rangeset (which will cover at most three distinct
ranges afaict, which is way too little for this kind of data organization
imo) can gain you all this much.

Overall the 6 BARs of a device will cover up to 8 non-adjacent ranges. IOW
the majority (4 or more) of the rangesets will indeed merely represent a
plain (start,end) pair (or be entirely empty).

> Thus we need to collect all those non-identity mappings
> per BAR now (so we have a mapping "guest view" : "physical BAR" and again=
 cut off
> MSI-X regions as before.=C2=A0 So, yes, it may be a bit wasteful to use m=
any range sets,
> but makes vPCI life much-much easier.

Which I'm yet to be convinced of. Then again I'm not the maintainer of
this code, so if you can convince Roger you'll be all good.

> Thus, I think that even per-BAR range sets are
> good to go as they have more pros than cons. IMO
> Even if we go with "can be represented as a single (start,end) tuple" it =
doesn't answer
> the question what needs to be done if a range gets partially mapped/unmap=
ped.

This question also isn't answered when you use rangesets.

Jan


