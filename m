Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 548254046F6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 10:25:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182740.330473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFMB-0007hh-Hg; Thu, 09 Sep 2021 08:24:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182740.330473; Thu, 09 Sep 2021 08:24:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFMB-0007f9-EX; Thu, 09 Sep 2021 08:24:27 +0000
Received: by outflank-mailman (input) for mailman id 182740;
 Thu, 09 Sep 2021 08:24:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZYDC=N7=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mOFMA-0007f3-63
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 08:24:26 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5683202f-1147-11ec-b1a7-12813bfff9fa;
 Thu, 09 Sep 2021 08:24:24 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2055.outbound.protection.outlook.com [104.47.12.55]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-33-1cdfYwQHP_SSh7j15tiBtg-1; Thu, 09 Sep 2021 10:24:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4847.eurprd04.prod.outlook.com (2603:10a6:803:54::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Thu, 9 Sep
 2021 08:24:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.017; Thu, 9 Sep 2021
 08:24:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.8 via Frontend Transport; Thu, 9 Sep 2021 08:24:18 +0000
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
X-Inumbo-ID: 5683202f-1147-11ec-b1a7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631175863;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OmuYhMgA15CUwW4jq3ZtxwJqvsWj0orTDK1C3zPblsc=;
	b=MCWD/0FhJyeZOP378ydIoWPb2KkLvUBH1s8wk2ZoWdTZcczyOC1uK15ckeNQj6a1UOC8sA
	RGhXIVh6J9frK7jI4P9Umof7RdmNplqCeeDu2sRqMSvtAWjHTcPZNCHZK8Fes2IqROAXPU
	x6zwEpfXe01Oqo32ZbFtbK17PA4zn5I=
X-MC-Unique: 1cdfYwQHP_SSh7j15tiBtg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JAJ4sdL3iCzA3UiFuoPjw1U33/Wp33xxvBdmQI3RZa/l0ocFA5o4qbGld49Vz8XViW0FFT4Z4NLU1NqsMjZ0TqFjFkkYKr6aMkP7lXWU8O8Te4ib1duCF9AhdaV6aU0o+yVUkHZfSnxrqbbJL7b3LNih924lvW3/6Mmb9TKWuYY/XwE2DDZb5bPdig+VLcCOFdbPdF6TBkgpfXt1KRCfPxdhwLGXoN4kEy0rH7XRq0nho8/KJ2XY+OsTh5ztQF+2eGBCbDBAg+7YFbU4pLoFt+2Qj1Mley2DoEKRnqKaMJ89l6Qp7MhIyxz8BDhvwQThQA4jivNoYfNGU+f0Xl6Alw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ARrB8G9oG7epXdTmcH7phUZElpm3lxbUVHX5MKp8shw=;
 b=P5mCDlvs/wJvh+fRB0KTOnXPKNQGE+0ztRvEz5F/ZVliwvKGRYhGPofuSJvebMlhB/AvNH8nPz1iG2mqBnUVCxFpFHch88BexTFISQCGhvAxQzyN/YlogPcmhDFLHgJjBi9FsCmn4SkTYVtrfuzEMQSM7rSjSR2bgFPmYUvpmWcD13sMzV3lPP4pU1kDRd3aDWWYqnY9QPjB5IOdcn6c+2k+qgtCcgGDSViY4Plcgl50uvqgUzbVczsrVAoWdIC1ztWJR5nQKaGkHXzLQbjfCc/GJzmgH4V5oc5s5xoITrLAjMFAT89hpH1Io2otqwltlBpCN1IIQHSeZ2WePN5g+g==
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
 <7e0c9d9b-6087-83ef-f9e8-1e9e6eb2d1e9@suse.com>
 <206c7b6c-6c0f-ce5e-6e62-15b46035b036@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <422a6543-ec2e-0793-3db5-09456e04f65b@suse.com>
Date: Thu, 9 Sep 2021 10:24:16 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <206c7b6c-6c0f-ce5e-6e62-15b46035b036@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0089.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::11) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db8b9c11-c8df-42e1-29b7-08d9736b3857
X-MS-TrafficTypeDiagnostic: VI1PR04MB4847:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4847823555BFAC2B2D509251B3D59@VI1PR04MB4847.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5797;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Hv8E8zqs1pbLYiPSDvNuZgd3IgEjZ6WXMExIOtcyZGBWScYKrmc3pDxj1sT/AqOZGOpf8iEJ2gm61yxtqAYxxcEkgdBWRFl7Ho5/aqd7ZjzIIfWwchosJ7eAh6M+Eo1C4nZry2tTmGuKTtHRxNtOCJdKOgjzk+qOjTQnzxz9SCQnkA960zSzza9v6cecKGejk1rWX7Lw9f8kHKmVhT5SFkDLo1gGYqWYDrCjoMi4FY3ZzRe/LKZudHvYr67pSja6qEMbRliI8ZNtzvMY5GDoAm8OMFJSBii7IkaGPWN+CjA+GTbCJo3YMs1X5aZ72dVsWzTNJa/7IivsTxywJM5JBu70vhohumsF8vWhjLuew6qUvZp0AB1yIiJODfu/z0qyKHMtrABwH7PTvxuVmq8Fuaa7xmFvjhqcfZKIK/d4hTU8mdlepHGO2gMWaTEv46E3WLXCmmojjDbZFY8Q2v9uqOatkCbs/GbdTRcONXgcXegObg4YErIzwQff4Lur3FCYAnBv3DmuaJPpUGkc9I/n4Ks5JbBkWFsxoSAZ/tfJCPrvOGAP1yYeLEKltcvGlu6gMt5DgfAx9CVTAITT/C1q89NdCSLrXQMHG2m6h25sXPtvKj9YAp8L+5whUe4ANDjwptxVWMB4ouyg3dIVzRHD5sNf+NFah2W5tBoh++KMtd+E5vFL+2iY8cWQBxMU9vTSnaNIJ477rt8N55Utq+IFO1KIfl2A/IBeeyuO2L9WauI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(136003)(39860400002)(346002)(5660300002)(36756003)(2906002)(8676002)(7416002)(478600001)(110136005)(53546011)(66476007)(66556008)(16576012)(6486002)(8936002)(316002)(4326008)(86362001)(956004)(31686004)(2616005)(83380400001)(186003)(38100700002)(31696002)(54906003)(26005)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aUDk4TZoKLfn0ALDxYJD4jyMGavfz4GMUVCzamb/Yg9BwF4JIMGH4njmHNa6?=
 =?us-ascii?Q?KKifFMhVffdZJIev9s0iF3mda1p5BWJ6j2eHZorI5LHYjN2Ij8wQNv4XZcPI?=
 =?us-ascii?Q?iFh5xM5RFf3rSR4V+ZZGBVXKV5O3CVJTHcJWT3cKPPIpZj+0ZVCpZn24DGBo?=
 =?us-ascii?Q?QDuQP0pNoDi4ygu6sc8vTPXYLJfFPwElFslzxg454VfzmCHMmGWrUxyTaT4B?=
 =?us-ascii?Q?/KZmIV5oBFY0AsWZCx53qACkDADDSZ0KOg/HlDelHlHAUqeef7yLE2rxvnQj?=
 =?us-ascii?Q?3DSpy1EFsvx7uJAKelAu4vs7N0/RbLx374eRYUejJ9O8Rw4Z3ag1CaaU9VEI?=
 =?us-ascii?Q?Fjn4/FQSU/FBF79thGI7wBynLwoG69Q5RaQXnIxf5MXJQtW+xtQZ3TLklliI?=
 =?us-ascii?Q?9ZbDALGsQNeJzcN9SqU98qF7nXCY8/Q441KkOK1olEZanxq3gQd7rYmrhgzF?=
 =?us-ascii?Q?MQ2YP+ANrVpXexRwWmyTGzc6lwFYh1Lo7lcm2zIFSjzmNvPjHe4GTgviYpJ3?=
 =?us-ascii?Q?PhrX3j7IesciPFINTDSKH76+Ee51p8XJ2NiHAGgcdwG6MPCZlsD/7KJfBsvo?=
 =?us-ascii?Q?XZA0IFEwkHkQgx06SXY3Zu+jI4sEwsCgVAv5bomhn8dMStzDpKa3ObDkm92W?=
 =?us-ascii?Q?2c5fR+7c3hOArtDRkTPDe2tdtGqPwc6edGSnY+BmSIXDAMXzDkvPe2+x7l24?=
 =?us-ascii?Q?VWZ/c9YfAb2t+QAUBbvBvuxl8XXWJJrOkjF7YRqPcIGleytdX4ShGpT0swpA?=
 =?us-ascii?Q?byjNyVd33T1DSmVOr9ufLX0i/l4hmUAIaOtptnkSXfr9sLeeY17X8aODZ6UT?=
 =?us-ascii?Q?QLAxKRP5r6q/fo7su/c/KBx5ug0IXP4ivZM9vGGayvOk5HNs5aJQFpWHhxWY?=
 =?us-ascii?Q?xbQpxv04EkpwH+GIbT1iKyl793SHmc368qg7kj3vwKcg46yHaY/8Bj1mLUuL?=
 =?us-ascii?Q?y0P1VvH5s00hLv2vIWY/+gSj5lPJMf9yOHqghCfUMajODtpsLGYN8b/YUxAt?=
 =?us-ascii?Q?80xx/ZyzPUq0w9I5Y57Qrhy7ksgo9yIfx05iZE5PQFmi96QdX8WGwFSYwC2b?=
 =?us-ascii?Q?z3JpysgSd7JRpJzMFbzAZY93V2jsgs6Acj/5CtJAZg5+VT38ji+Qv5U1awTR?=
 =?us-ascii?Q?3DW+q61II3aXU4qhl6LnJRSienLwR1T19IGcfV9f6eWiJ26Xos8Sfw4mCSL7?=
 =?us-ascii?Q?+esBs1jpnPwinrdmk25OklGHKkNb3gGPq7MBB2SVPCV+g/h9TORcCsPvb9Nv?=
 =?us-ascii?Q?fa+23E7CE3wiwddIDGT+uWZQ60gRUikpjmzhVua9cz0tkw8pERPH1BgJnf/m?=
 =?us-ascii?Q?89t9KivVOyBIaosQRmLsmahj?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db8b9c11-c8df-42e1-29b7-08d9736b3857
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2021 08:24:19.5046
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EM/p8trsCQ1vckOK0S8wPBpGmgZV3d1xO8MTutzOudWBNG+wzddg+roNa36Q3tA9wabNUdM1hjlwizYrlsmQ3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4847

On 09.09.2021 07:22, Oleksandr Andrushchenko wrote:
>=20
> On 08.09.21 18:00, Jan Beulich wrote:
>> On 08.09.2021 16:31, Oleksandr Andrushchenko wrote:
>>> On 06.09.21 17:47, Jan Beulich wrote:
>>>> On 03.09.2021 12:08, Oleksandr Andrushchenko wrote:
>>>>> From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
>>>>>
>>>>> Instead of handling a single range set, that contains all the memory
>>>>> regions of all the BARs and ROM, have them per BAR.
>>>> Without looking at how you carry out this change - this look wrong (as
>>>> in: wasteful) to me. Despite ...
>>>>
>>>>> This is in preparation of making non-identity mappings in p2m for the
>>>>> MMIOs/ROM.
>>>> ... the need for this, every individual BAR is still contiguous in bot=
h
>>>> host and guest address spaces, so can be represented as a single
>>>> (start,end) tuple (or a pair thereof, to account for both host and gue=
st
>>>> values). No need to use a rangeset for this.
>>> First of all this change is in preparation for non-identity mappings,
>> I'm afraid I continue to not see how this matters in the discussion at
>> hand. I'm fully aware that this is the goal.
>>
>>> e.g. currently we collect all the memory ranges which require mappings
>>> into a single range set, then we cut off MSI-X regions and then use ran=
ge set
>>> functionality to call a callback for every memory range left after MSI-=
X.
>>> This works perfectly fine for 1:1 mappings, e.g. what we have as the ra=
nge
>>> set's starting address is what we want to be mapped/unmapped.
>>> Why range sets? Because they allow partial mappings, e.g. you can map p=
art of
>>> the range and return back and continue from where you stopped. And if I
>>> understand that correctly that was the initial intention of introducing=
 range sets here.
>>>
>>> For non-identity mappings this becomes not that easy. Each individual B=
AR may be
>>> mapped differently according to what guest OS has programmed as bar->gu=
est_addr
>>> (guest view of the BAR start).
>> I don't see how the rangeset helps here. You have a guest and a host pai=
r
>> of values for every BAR. Pages with e.g. the MSI-X table may not be mapp=
ed
>> to their host counterpart address, yes, but you need to special cases
>> these anyway: Accesses to them need to be handled. Hence I'm having a ha=
rd
>> time seeing how a per-BAR rangeset (which will cover at most three disti=
nct
>> ranges afaict, which is way too little for this kind of data organizatio=
n
>> imo) can gain you all this much.
>>
>> Overall the 6 BARs of a device will cover up to 8 non-adjacent ranges. I=
OW
>> the majority (4 or more) of the rangesets will indeed merely represent a
>> plain (start,end) pair (or be entirely empty).
> First of all, let me explain why I decided to move to per-BAR
> range sets.
> Before this change all the MMIO regions and MSI-X holes were
> accounted by a single range set, e.g. we go over all BARs and
> add MMIOs and then subtract MSI-X from there. When it comes to
> mapping/unmapping we have an assumtion that the starting address of
> each element in the range set is equal to map/unmap address, e.g.
> we have identity mapping. Please note, that the range set accepts
> a single private data parameter which is enough to hold all
> required data about the pdev in common, but there is no way to provide
> any per-BAR data.
>=20
> Now, that we want non-identity mappings, we can no longer assume
> that starting address =3D=3D mapping address and we need to provide
> additional information on how to map and which is now per-BAR.
> This is why I decided to use per-BAR range sets.
>=20
> One of the solutions may be that we form an additional list of
> structures in a form (I ommit some of the fields):
> struct non_identity {
>  =C2=A0=C2=A0=C2=A0 unsigned long start_mfn;
>  =C2=A0=C2=A0=C2=A0 unsigned long start_gfn;
>  =C2=A0=C2=A0=C2=A0 unsigned long size;
> };
> So this way when the range set gets processed we go over the list
> and find out the corresponding list's element which describes the
> range set entry being processed (s, e, data):
>=20
> static int map_range(unsigned long s, unsigned long e, void *data,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned long *c)
> {
> [snip]
>  =C2=A0=C2=A0=C2=A0 go over the list elements
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 if ( list->start_mfn =3D=3D s )
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 found, can use =
list->start_gfn for mapping
> [snip]
> }
> This has some complications as map_range may be called multiple times
> for the same range: if {unmap|map}_mmio_regions was not able to complete
> the operation it returns the number of pages it was able to process:
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rc =3D map->map ? map_mmio_re=
gions(map->d, start_gfn,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 size, _mfn(s))
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : unmap_mmio_regions=
(map->d, start_gfn,
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size, _mfn(s));
> In this case we need to update the list item:
>  =C2=A0=C2=A0=C2=A0 list->start_mfn +=3D rc;
>  =C2=A0=C2=A0=C2=A0 list->start_gfn +=3D rc;
>  =C2=A0=C2=A0=C2=A0 list->size -=3D rc;
> and if all the pages of the range were processed delete the list entry.
>=20
> With respect of creating the list everything also not so complicated:
> while processing each BAR create a list entry and fill it with mfn, gfn
> and size. Then, if MSI-X region is present within this BAR, break the
> list item into multiple ones with respect to the holes, for example:
>=20
> MMIO 0 list item
> MSI-X hole 0
> MMIO 1 list item
> MSI-X hole 1
>=20
> Here instead of a single BAR description we now have 2 list elements
> describing the BAR without MSI-X regions.
>=20
> All the above still relies on a single range set per pdev as it is in the
> original code. We can go this route if we agree this is more acceptable
> than the range sets per BAR

I guess I am now even more confused: I can't spot any "rangeset per pdev"
either. The rangeset I see being used doesn't get associated with anything
that's device-related; it gets accumulated as a transient data structure,
but _all_ devices owned by a domain influence its final content.

If you associate rangesets with either a device or a BAR, I'm failing to
see how you'd deal with multiple BARs living in the same page (see also
below).

Considering that a rangeset really is a compressed representation of a
bitmap, I wonder whether this data structure is suitable at all for what
you want to express. You have two pieces of information to carry / manage,
after all: Which ranges need mapping, and what their GFN <-> MFN
relationship is. Maybe the latter needs expressing differently in the
first place? And then in a way that's ensuring by its organization that
no conflicting GFN <-> MFN mappings will be possible? Isn't this
precisely what is already getting recorded in the P2M?

I'm also curious what your plan is to deal with BARs overlapping in MFN
space: In such a case, the guest cannot independently change the GFNs of
any of the involved BARs. (Same the other way around: overlaps in GFN
space are only permitted when the same overlap exists in MFN space.) Are
you excluding (forbidding) this case? If so, did I miss you saying so
somewhere? Yet if no overlaps are allowed in the first place, what
modify_bars() does would be far more complicated than necessary in the
DomU case, so it may be worthwhile considering to deviate more from how
Dom0 gets taken care of. In the end a guest writing a BAR is merely a
request to change its P2M. That's very different from Dom0 writing a BAR,
which means the physical BAR also changes, and hence the P2M changes in
quite different a way.

Jan


