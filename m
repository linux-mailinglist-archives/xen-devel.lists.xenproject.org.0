Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96DA841B0FF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Sep 2021 15:38:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.198014.351300 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVDHt-0004ys-DG; Tue, 28 Sep 2021 13:36:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 198014.351300; Tue, 28 Sep 2021 13:36:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVDHt-0004we-A7; Tue, 28 Sep 2021 13:36:49 +0000
Received: by outflank-mailman (input) for mailman id 198014;
 Tue, 28 Sep 2021 13:36:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3WUc=OS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVDHs-0004wY-Dq
 for xen-devel@lists.xenproject.org; Tue, 28 Sep 2021 13:36:48 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e23392dd-0ab3-43ac-bd45-be19a73f1939;
 Tue, 28 Sep 2021 13:36:47 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2058.outbound.protection.outlook.com [104.47.14.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-jLCMAPYfOoKHvJ-5ZmA4aw-1; Tue, 28 Sep 2021 15:36:45 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB3933.eurprd04.prod.outlook.com (2603:10a6:803:24::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.19; Tue, 28 Sep
 2021 13:36:44 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Tue, 28 Sep 2021
 13:36:44 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0012.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:50::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.22 via Frontend Transport; Tue, 28 Sep 2021 13:36:42 +0000
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
X-Inumbo-ID: e23392dd-0ab3-43ac-bd45-be19a73f1939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632836206;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PXCticxT18Y17PZNDKIpCA0j/4DFPQ4recnAeJK47fs=;
	b=OuuJNMuoN0GlXIg9QJXkxHkxQlNV81lWfY6WhpJO/T/QRdCECJ3ZetSuhmtgy0DeYDGUwz
	nlUTNJtv34+kqbBEBvhEg33QLjARgunMu2eYDdn7QrA0ZWAJUkR1jN8pKIRweZedeNPIoF
	sXfayWf7SNxzzQ28ElijREe6GpEyu50=
X-MC-Unique: jLCMAPYfOoKHvJ-5ZmA4aw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lR5USHTjBOkoKJe8Wqz69QBzxyg+T0lKhaQCLQ/rsHK8AJyMLVIKSnDq4wbJ+/m2oWbk9kGvrxr2cwMBUYrtZFsFs2HF1E8qmXw/K6bgT7XA1QOND2SPlNhHJuzFHEMBmSL715iFt8RMnvtGpOsMZliufmNfcldsmplZyy+RYvZApVlVMDIZlr2FrmgWal6RrLiKNOvyZ7wq49SeoKBGOzcRvxSVNAPmIe1KhYxzymizhmSmR6r6YdXL+2H+uHZhoOePyN6z1MXYtGTXa75ltFTCZF1xGoEhWk81FoxcWQ+0Fs4CX/yWoIN4QKz8l3OKgw3tDScIZgTQ53f697pMEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5CZOjMZQ06ut6Cvo6a2Rn8E6/d3bWrOzmvQeZtCrL2A=;
 b=dznxUe6kpqU8M3WLOGHENsL/BrEuY5nn3KC+oSiXsH31jo2Ih7VSA4MylrdLLsATTIxMXvhdWgKV63bdesWTh/HRdBqPNkZHdiV0Koe7XaSHtX6fVvISROicJA0JGbRm6vHgnyd7qRa6jjEh1oaMxdFs/npXJx2w+8JeQRgBXj/ORwnJR86RSUnRxsqciZBWPy3GGxQGVh7joDl1BBZ1dinXFOdcGS/ZTeEEIoRQKylsy6tOWM73wuEHKs8YNwEN4/rYT085KxMWdpghAshKjO5ipRY+cs3tunl98sVa5K5GaJd4B+qMCD2UdfTkH16+qXHeiSfoUBKBkx5BRyEzjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Ping: [PATCH 1/2] gnttab: remove guest_physmap_remove_page() call
 from gnttab_map_frame()
To: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <4f54456b-e8da-f67f-b6a0-b5ce2cf12cae@suse.com>
 <8b73ff7c-4dd6-ff2e-14b9-088fdce0beb9@suse.com>
 <YUhgdMyTbfL8Hyke@MacBook-Air-de-Roger.local>
 <5c1fd288-2972-d264-d6b0-3c7bc6d67be0@suse.com>
 <YUmYpzhJrBZkSYyd@MacBook-Air-de-Roger.local>
 <ae0fb20c-b7c9-2467-0951-b84b2f647382@suse.com>
 <YUr2zZL3kV4/nBQp@MacBook-Air-de-Roger.local>
 <8fd9e2d5-b875-ef7d-d80a-15b6ba2948b5@suse.com>
 <YUr+21K8GNqMFjKB@MacBook-Air-de-Roger.local>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4fb0f83a-8aef-c9a3-217c-99c5c2fcb810@suse.com>
Date: Tue, 28 Sep 2021 15:36:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <YUr+21K8GNqMFjKB@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P193CA0012.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:50::17) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91b9c1fc-13e6-4199-7871-08d9828502bf
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3933:
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB393365F83FB401003F8F34BBB3A89@VI1PR0402MB3933.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kndINbsAh377M571k3H/0gM6sfFlSRLc/YO5xB+YRecQDYo4S2Kd5u5N1V8r/1FFpfEp8apPmqjNQEXIn51SKxHkEgxSCGw+BmtjAvwFslHIUUOj6otzY6dhIG7DE0oup+/9MdB0L4zxtoMvF64Opb+ju8ITLm7ztx67144nqFO0GRlTRXCA5gchwJcDHDvvFRS3GGuW5qGZ0Trdoqu+4IVY/lZYQ/Rhydb6tdK4F0OfflsB1fF1l8QoeTmkLXHuTsuoFhcmCfACzZRdYyQgFF0GAR45bJZnN5iqlC0ti5gjfPY/2Y7LD2Vt5VAt0nP+UkX9Q89i7uhWoW393QOptF1Vp5HhuUSWg/n5e15W9n2QbcPsShNe6YsvYISLITrP3gkwggMHgIyc3bz1GcdloZrDnXgpWzTqgzqbCB3jT8rfwZqeUKSW4zM3sAjlbsVb1snroivJgoMK8Yu2tNR4VJ5iOUHoLMnPjQmIrLKyfz8wBkCdg+blEN4QYEZPFCBKSILm3J4n6RymuG8ZnyGWksl413vfxOQ0sB2TqiHcq7/aWxrDDxfPK4gYimIhqDsOBroHVhk4ktaOTxhXtS0GvjLSQLAJjRrNwIMcebc/THpppDky5tlX8AdHuE/UaXL7trVG6KqIp5kU8B7IEFbg+9he9c6d0r/XKTrp2AgYG2XoSUtPCm0NvcLGJlV9qsexWRAxfu23QU8lBGHpeOPYd6X8TElD1Pw3YDM26jZH8ycnFikme3tGBQP8F213Npy8eMBKFUH+xHl1/MqO0EL0wo5kjfry0LQXVXDSC5tlX0g=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(54906003)(5660300002)(6486002)(31696002)(53546011)(6666004)(38100700002)(316002)(4326008)(83380400001)(16576012)(110136005)(36756003)(2906002)(508600001)(186003)(66556008)(66476007)(66946007)(86362001)(8676002)(956004)(26005)(31686004)(2616005)(43170500006)(76704002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?C7D+3qNffIO+I5g2+uREWXD3wilhQ6L5U2bO6vX7wBRsT1GsA4gyHgqxZ4pc?=
 =?us-ascii?Q?gUfjrM0gnGsUS/fh49z/epm0D1l7ZHdF9+2neezi9HhU6bqI+c4OKsRqH3MO?=
 =?us-ascii?Q?1XFu2IYZ39ypqUI7J3FPh5JHg9PXL3TnS0ueKrg51SDhGRreXuADwrS+1Nyf?=
 =?us-ascii?Q?qLa96FglJpRXW2H0XJRcXq//ItMFjMA86GrZlpsDVGBypR/1nYXwjFSuahi9?=
 =?us-ascii?Q?fmwpPQV+Ctsh/lXT8au7X4azAms+DBoWBaIr8/eUDgP8Mzk1RbX17/c8BSy2?=
 =?us-ascii?Q?dj8FY9OSmzt5AOk4h7iZtgvy1zN701JsetPkbyinGeM+MC/6qJV6KKm88ayf?=
 =?us-ascii?Q?SXc2xtV4fTcxVupw6fvkKWg067XwpsSrFhnsnoVtXBsVYVqpX2GCqJ4mOU28?=
 =?us-ascii?Q?MXXloSbVcSwaiKfDWqjpBNfJfxAPNBYl+B3idd4pP7IqoxLA3mq07UWRNUuZ?=
 =?us-ascii?Q?MkLC0bJN/+E7wpnvpihGlf4cwsT/XONNZL2P0bGenspBAcwojST4fChMFRuD?=
 =?us-ascii?Q?6AD5du1IkNBhuLAi3G1DAx7JkaJQ9+ntZQLAQv4cAvE64fDFmrgSFNKJovV0?=
 =?us-ascii?Q?LdegGwpEYcj2MRCsWoEcThiF6c0jA+0d4W82JqWEXgrAXT8/X/gfv4x9i5Y1?=
 =?us-ascii?Q?4YIC8ZQ4vfOa1+nJE06gaqNwQ7p+aDVLwQ5lmS2fe22gR5Kjnm73Zbzab+Jh?=
 =?us-ascii?Q?YyG+8cZ7+wse7JWeff2Hp4Zm0D3rMCiS01u+lizstGbErlfUUolQnTq+4+t9?=
 =?us-ascii?Q?AIVX662INDAtp3hkfrqEThjcxEJTbM3jEJTQfUEgXyULLrKch282bbj1EumH?=
 =?us-ascii?Q?zjy0ndGnWs1cmQ8iWsYapHFtXlLwyPyPZRT7qZ2Hsw2pxWAwcZaQqkNh5bjf?=
 =?us-ascii?Q?dpTHiRxlw6xOwOKull7rncfuabsALNQMezbMsqZQZibh4yvjDoPWjqaMHhxA?=
 =?us-ascii?Q?mFUjs27mzb77WA9A1DNYC59QFlzVjnNH5L8e1ww68kVBF9z4lep4ibtwKr4f?=
 =?us-ascii?Q?/c8voaM0M4lJrwhgH05GMg/GBoXLlkhQ04VWht99exAqXItW+TcoaxfBZzU4?=
 =?us-ascii?Q?3p5IxcoBXJ3zy6gCNOIuH/onf3rSVY5hTxGX6iH+LJXL37nuFpNSIMQq5BSl?=
 =?us-ascii?Q?TznT4Z0O2RVchycW2izOom96dbsx8mNoP9JObCimw2yXTrDl4Xl1T18yymX3?=
 =?us-ascii?Q?iIvXIo3mn9VCsB3Cpjzk7FndxZp/uTMBH8nzUvts0Obt/eTT850p1IzHc0Rh?=
 =?us-ascii?Q?VyPB5mlo2j24H3SpuicytNeXcNfJWylOjpeqXe9JHum1PsDeVPH6D1qFjCAk?=
 =?us-ascii?Q?SIgVRRmePN7cCBxU3ri65lXL?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91b9c1fc-13e6-4199-7871-08d9828502bf
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2021 13:36:43.9219
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +lpLGQZ2mejguBpW7nxSocc+bsCELOs1JnW8+vEqGyEQ9aIkn7LoFuPX4FyQi9vl3cItfiK+jumCo9RQ7tn6Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3933

On 22.09.2021 12:00, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 22, 2021 at 11:42:30AM +0200, Jan Beulich wrote:
>> On 22.09.2021 11:26, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Sep 21, 2021 at 12:12:05PM +0200, Jan Beulich wrote:
>>>> On 21.09.2021 10:32, Roger Pau Monn=C3=A9 wrote:
>>>>> On Mon, Sep 20, 2021 at 05:27:17PM +0200, Jan Beulich wrote:
>>>>>> On 20.09.2021 12:20, Roger Pau Monn=C3=A9 wrote:
>>>>>>> On Mon, Sep 13, 2021 at 08:41:47AM +0200, Jan Beulich wrote:
>>>>>>>> --- a/xen/include/asm-arm/grant_table.h
>>>>>>>> +++ b/xen/include/asm-arm/grant_table.h
>>>>>>>> +        if ( gfn_eq(ogfn, INVALID_GFN) || gfn_eq(ogfn, gfn) ||   =
        \
>>>>>>>
>>>>>>> I'm slightly confused by this checks, don't you need to check for
>>>>>>> gfn_eq(gfn, INVALID_GFN) (not ogfn) in order to call
>>>>>>> guest_physmap_remove_page?
>>>>>>
>>>>>> Why? It's ogfn which gets passed to the function. And it indeed is t=
he
>>>>>> prior GFN's mapping that we want to remove here.
>>>>>>
>>>>>>> Or assuming that ogfn is not invalid can be used to imply a removal=
?
>>>>>>
>>>>>> That implication can be (and on x86 is) used for the incoming argume=
nt,
>>>>>> i.e. "gfn". I don't think "ogfn" can serve this purpose.
>>>>>
>>>>> I guess I'm confused due to the ogfn checks done on the Arm side that
>>>>> are not performed on x86. So on Arm you always need to explicitly
>>>>> unhook the previous GFN before attempting to setup a new mapping,
>>>>> while on x86 you only need to do this when it's a removal in order to
>>>>> clear the entry?
>>>>
>>>> The difference isn't with guest_physmap_add_entry() (both x86 and
>>>> Arm only insert a new mapping there), but with
>>>> xenmem_add_to_physmap_one(): Arm's variant doesn't care about prior
>>>> mappings. And gnttab_map_frame() gets called only from there. This
>>>> is effectively what the first paragraph of the description is about.
>>>
>>> OK, sorry, it wasn't clear to me from the description. Could you
>>> explicitly mention in the description that the removal is moved into
>>> gnttab_set_frame_gfn on Arm in order to cope with the fact that
>>> xenmem_add_to_physmap_one doesn't perform it.
>>
>> Well, it's not really "in order to cope" - that's true for the placement
>> prior to this change as well, so not a justification for the change.
>> Nevertheless I've tried to make this more clear by changing the 1st
>> paragraph to:
>>
>> "Without holding appropriate locks, attempting to remove a prior mapping
>>  of the underlying page is pointless, as the same (or another) mapping
>>  could be re-established by a parallel request on another vCPU. Move the
>>  code to Arm's gnttab_set_frame_gfn(); it cannot be dropped there since
>>  xenmem_add_to_physmap_one() doesn't call it either (unlike on x86). Of
>>  course this new placement doesn't improve things in any way as far as
>>  the security of grant status frame mappings goes (see XSA-379). Proper
>>  locking would be needed here to allow status frames to be mapped
>>  securely."
>=20
> Thanks, this is indeed much clearer IMO:
>=20
> Acked-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Any chance of an Arm ack (or otherwise) here?

Thanks, Jan

> Albeit I still think we need to fix Arm side to do the removal in
> xenmem_add_to_physmap_one (or the x86 side to not do it).
>=20
> Thanks, Roger.
>=20


