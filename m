Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2E3B42CD
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jun 2021 14:01:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147140.271012 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkW9-0004lu-LC; Fri, 25 Jun 2021 12:01:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147140.271012; Fri, 25 Jun 2021 12:01:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lwkW9-0004iq-Gj; Fri, 25 Jun 2021 12:01:05 +0000
Received: by outflank-mailman (input) for mailman id 147140;
 Fri, 25 Jun 2021 12:01:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=JBOo=LT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lwkW7-0004ic-6p
 for xen-devel@lists.xenproject.org; Fri, 25 Jun 2021 12:01:03 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2e875587-1d49-4e94-9d9d-82b5a4601a3d;
 Fri, 25 Jun 2021 12:01:02 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2172.outbound.protection.outlook.com [104.47.17.172])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-32-WQL5L7QQM-SfTL4lZ1oYqA-1; Fri, 25 Jun 2021 14:01:00 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4845.eurprd04.prod.outlook.com (2603:10a6:803:51::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.22; Fri, 25 Jun
 2021 12:00:57 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.020; Fri, 25 Jun 2021
 12:00:57 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0224.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.19 via Frontend Transport; Fri, 25 Jun 2021 12:00:57 +0000
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
X-Inumbo-ID: 2e875587-1d49-4e94-9d9d-82b5a4601a3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624622461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Go99QUlpApJ7sWqjTxE2LSt2AH1oDgR7ASuYsoJcCGE=;
	b=aUqXERV88zaVZRdTYj2a2o0dsfHz+p2L9C5thR9MgW1CYmq9SQdLQbC3lNyR7tSJMaRSmB
	fbkKsBFATRnq4W+pGP9hb4pWDYeskZjJxaUT9Yc3BFpbSWzcrCdU3qbZ+nE8BRIFMDuuyx
	VsKkxCGky2w4aQe4N48ZAsQ98HH5NXo=
X-MC-Unique: WQL5L7QQM-SfTL4lZ1oYqA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MORNr3dM+ayzccvT2FDEQLds20E5glV8MEYjxykBSw+zVivUm8m1Iiu7bTYQuvdPX571eIor5KCWwzIxof28aJ2NvCI4rmgB2mMwAQQ9QrlHMycG84wY6XHcrJa2nNLftYm4Z5vl/A6RIqHHjapCOSKMKV8dWyJ0Ww945G15fCfu1UT7D7eCA5icpyRPoDQuQUfpEaiCPHJV/80KSEDubHLtlUNZH13boKkE2UFuzRJJu49rfdD0HrT6FaA2ynqOAZoUkBRcUVMdtSkS+Kz0vlFk/fuovJD6QUeJTKAQ6zJ1iTVREGqfrluDg2KQ0ivST4xUUF9eRknZtnyyz47zwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pSJHl2Fwu38djEfq1uvzLYrKquCGWT6i2pVYatcDK4c=;
 b=AF7wSUlUm9PIb2SfQug+cefJTQ1ePmAsLVK+kdpoWDsyqTknuVgta5e2KUSsWInR77+vUf4eO7y+l700E9OuVFys4enCaHYmYmAB1Xgx/Mw+5RYIO4HTpqToiU8C9F586mDqw5g1PJ989c+n4ggcyhod/FTmyuC2DTComITwBdhJGecxlqf5M6d9DGUSmucBbGRx6kdxf4072MaMk+pjXSf+PrfSToEbMKMd9lPhxKVlyuK+tTQz3q/6wX1hmJtz+RDLQOuHWitWTmY9fUOhGO+uTFwcd3yzYZlZjWy/EcOVa7Bd5y0EFtDJNMnZ4qbXhL2CFniSDjelMwfWzfEKCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xenproject.org; dkim=none (message not signed)
 header.d=none;xenproject.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH] libxencall: Bump SONAME following new functionality
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <20210624175521.20843-1-andrew.cooper3@citrix.com>
 <6e103351-f3eb-39c8-441d-be926579f2ca@suse.com>
 <9c5cff0e-0ab6-7015-3667-bad2d9f5b31e@citrix.com>
 <4b360f95-aec2-935b-ce95-73a01cae98be@suse.com>
 <24789.46868.943149.770825@mariner.uk.xensource.com>
 <3fc8f75b-fc60-78bb-f822-b87b6299fa64@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a841fff7-f386-d7b4-1695-ef6916247f11@suse.com>
Date: Fri, 25 Jun 2021 14:00:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3fc8f75b-fc60-78bb-f822-b87b6299fa64@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0224.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59b1b59e-94b2-4f7a-ee07-08d937d0e479
X-MS-TrafficTypeDiagnostic: VI1PR04MB4845:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB48454319F55F949D79F463C5B3069@VI1PR04MB4845.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SZd01+nKozVPWoEDYS0p9cpbGKbttX8/P3WlcmTQRHWZ6nboPOEAllf0pVlQUCI0U/WVpBT7m8nOv98TW8ped/2biP+lN1+y21UamBRy8O+v7FZ0ZkQDTVvdqRqoFk/tBYtRuLTRkXr9xuwvLsXlUtt/EmheiTvxbzh4FOMLiJZsiD6qluTAwEOqjFHzmFWWgL/R0jif1tz2dMZFQZLWwgA9JZBW1+iYtN90mJIaWsStDiqOQKJXEPn0iU18AgSPZriRcGRYm0tqiXuVXS/rZFwevFSmJwframJpafB9zdtGVSTGRIfCrlBdolw47Yl+ggJJrODHqid2K+Y+dbgZXXhHJfWeCHCCQGWBQjuqSDWXGbwiPeX1J5FUzmuMxQQNHd3m4BhGlDd7hGohe0H8odI/tyufF3SvMI7SyNS6ul6dfJZd+h95+7BBH49HeTLnaxlyoxQHhXslyAKmxMM6fBzjjQHs0NBPDfEM0VDzqEIzyAgbULLHPQcs7EcOA+RWw6t02d3TQokacRYzmvZlnDKx2Qh6nnFYiK1McnlnHS+8yuHOwOltkksCJmQNVKP5RF8GtUBsfBass6363+TTpnzQUInMtx7F+cUkx+87q9VVATl7iEFm0eEStXLg+AE6pJxu7MVgfPqvq3Dj4wnnyXNSjlpJ05th6+D0xw+8Pk0t+NDfxj6toRJNU1yqiFgRj1clSq66tsUVOGiaB1+4Tm//TFdMm7+oQ8UXz2kKI+o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(346002)(376002)(39860400002)(136003)(396003)(31696002)(31686004)(2906002)(36756003)(86362001)(316002)(4326008)(2616005)(38100700002)(956004)(16576012)(478600001)(5660300002)(54906003)(66946007)(66476007)(66556008)(53546011)(8676002)(6486002)(8936002)(26005)(16526019)(6916009)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cVzgTdoiIfqD92KMjjOe+tbWSE8vkWb0D4U5P9pSKRqPvrd4zjgsbnKF7+S6?=
 =?us-ascii?Q?AIBakpQ/baaCTm/2ea5/VhJCU+Tw7CWbxhSDgqmoy4vmSB/VPgie8EmsUAeU?=
 =?us-ascii?Q?AB4tW6xGVWOz5efvQC2Dn7xlW15PKMpPgREkrdE6OoV03GQAxDUyd7kEbYBN?=
 =?us-ascii?Q?F6WsYxZoeNGhbY5oplGJ6EA3kv9w+HsylDOB8Dczqd2N87PoKWZq8ZlMeGaM?=
 =?us-ascii?Q?BMmJG77Vn1j0jcH1pthUhbnk/xi9ppS2JZeOqju8cIMyc1rqoec6s8ZtQ7D9?=
 =?us-ascii?Q?m4Z+nvHLGQA06V+lhmAK9VhJ5Ci8an3gWsYyxSP1zQWg24Zx3G5121Uz5zIh?=
 =?us-ascii?Q?3BbhyXlns/oSOEDpGGCptsyTVanO415Dz0iaRbW1fOPgwhRWj5PS7wHJINDg?=
 =?us-ascii?Q?EkO0AgcPmHQqfWf5FArL8wofo8a/dT2+JCW2+0Joj/RFKLN/jKkLOzW+vZ72?=
 =?us-ascii?Q?u2Q82xbvBTT6gNqsVDbLQyfBL1eaEijH1W/4KHc2JAZNHac7IZJShepgy+ua?=
 =?us-ascii?Q?LJ8eEfPkxpyYz4gK9yCKMvYpbtGxTtIaVLYYlJzr+xVX03sdDn5EkMfsYsqq?=
 =?us-ascii?Q?1bGfnOGSQPCYp6QLhrRuPWBEwFtXj6yvZR689TPLnUt95oQtL8vVcurgMBvS?=
 =?us-ascii?Q?t5Hrb3NIFtECD+C8CSc9gVx1JfVKLK9UUYj8hfJust/I0Ra7lCjfNsxdwJxl?=
 =?us-ascii?Q?ZVAF0EBi+d7W5X1Hk2PS7BnLHZ6iGKXaG5bS8SbwZy/CW1fDJ7QxDwENWEHP?=
 =?us-ascii?Q?gTi/kN5T+tiUspTM76KIZwuezyy78o7gg70OQQw6xBfzWIcUgiUeNN5Eh6pz?=
 =?us-ascii?Q?5KZbNIXO4UYq4kJB+k0FTh9rRP2+3sB6jB6s5d7TwPiOp6iRmx4Noo9BTje3?=
 =?us-ascii?Q?Zv+ChmlzmGKJiVmgOzQUeDynNBSl6qcfAndnfalQBli7rPJXbnWL9qgK8m5P?=
 =?us-ascii?Q?eFxf8qHMs49WU4V1pBVr+tFZH3kKzqi6NhrHB8OHQL5lfGoQ/mjc8a664c42?=
 =?us-ascii?Q?R63IOSTmLR/YiESCttf5vKUthp2hGgw806oGlXjLNIb5dSr6eBsWwvf/51ui?=
 =?us-ascii?Q?ZZbRObO82PNtgS6JPpJID+nZTjzqk5zfZJyc46sSkC2HecMpIlAoVKoqL6fQ?=
 =?us-ascii?Q?DDjTAlKqdrUCnGvGuZPUhxTBvBEBuup3cp62J+DFP8Wg//fiMOS09r8r85tv?=
 =?us-ascii?Q?ESeiXYHxq3PB2Xmh7zgc3rgTAB4tF4SVGLuBJLFjY+eG86Swz6z1wEVIwnKm?=
 =?us-ascii?Q?lrucK9Z393Tz39y3/TQM58KWRc8Q39SiX5AR2PppuI3ouSk/B6NkjVrQPOOs?=
 =?us-ascii?Q?uiHrlVozT1Rvs6lZSvAK3+ix?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59b1b59e-94b2-4f7a-ee07-08d937d0e479
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2021 12:00:57.6696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aGW3OOZ8spfa2ZQQdNvgRw2VhmyUztNJ1pKk+nv5/yDgnuqyrCVmZE6+diZDdgDZamMabJLSXjkWQcxwFsfL6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4845

On 25.06.2021 13:36, Andrew Cooper wrote:
> On 25/06/2021 11:59, Ian Jackson wrote:
>> Jan Beulich writes ("Re: [PATCH] libxencall: Bump SONAME following new f=
unctionality"):
>>> On 25.06.2021 11:17, Andrew Cooper wrote:
>>>> On 25/06/2021 07:31, Jan Beulich wrote:
>>>>> On 24.06.2021 19:55, Andrew Cooper wrote:
>>>>>> Fixes: bef64f2c00 ("libxencall: introduce variant of xencall2() retu=
rning long")
>>>>> Is this strictly necessary, i.e. is a Fixes: tag here warranted?
>>>> Yes - very much so.
>>>>
>>>> andrewcoop@andrewcoop:/local/xen.git/xen$ readelf -Wa
>>>> ../tools/libs/call/libxencall.so.1.2 | grep 1\\.3
>>>> =C2=A0=C2=A0=C2=A0 33: 0000000000001496=C2=A0=C2=A0=C2=A0 59 FUNC=C2=
=A0=C2=A0=C2=A0 GLOBAL DEFAULT=C2=A0=C2=A0 13
>>>> xencall2L@@VERS_1.3
>>>> =C2=A0=C2=A0=C2=A0 39: 0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0 0 OBJE=
CT=C2=A0 GLOBAL DEFAULT=C2=A0 ABS VERS_1.3
>>>> =C2=A0=C2=A0=C2=A0 76: 0000000000000000=C2=A0=C2=A0=C2=A0=C2=A0 0 OBJE=
CT=C2=A0 GLOBAL DEFAULT=C2=A0 ABS VERS_1.3
>>>> =C2=A0 020:=C2=A0=C2=A0 4 (VERS_1.2)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 5 (=
VERS_1.3)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 (VERS_1.0)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 3
>>>> (VERS_1.1)=C2=A0=C2=A0
>>>> =C2=A0 024:=C2=A0=C2=A0 3 (VERS_1.1)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 (=
VERS_1.0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 4 (VERS_1.2)=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 5
>>>> (VERS_1.3)=C2=A0=C2=A0
>>>> =C2=A0 0x0080: Rev: 1=C2=A0 Flags: none=C2=A0 Index: 5=C2=A0 Cnt: 2=C2=
=A0 Name: VERS_1.3
>>>>
>>>> Without this, you create a library called .so.1.2 with 1.3's ABI in.
>>> I'm aware of the change to file contents as well as the disagreement
>>> of file name / SONAME vs enumerated versions. So telling me this is
>>> not really an answer to my question. It may be by convention that
>>> the two should match up, but I don't see any functional issue (yet)
>>> if they don't. Plus of course you leave open altogether the
>>> backporting aspect of my question.
>> The patch, including the Fixes tag,
>>
>> Reviewed-by: Ian Jackson <iwj@xenproject.org>
>=20
> Thanks.
>=20
>> Changing minor version in the filename as well as the .so is not an
>> impediment to backporting.  The actual soname remains the same so
>> there is no compatibility problem and the change is still suitable for
>> including in eg distro stsable releases.
>=20
> Correct, although backporting in general however is problematic.
>=20
> Until Xen 4.16 is released (or, we explicitly decide to make an explicit
> library release early), the 1.3 ABI isn't set in stone.
>=20
> Backports to older stable-* branches must sit on a boundary already set
> in stone in staging, or we'll end up with different versions of Xen
> having different ideas of what VERS_1.3 mean.

Which effectively means we'd have to open 1.4 despite being in the
same release cycle if this change got backported. Or did I not
understand correctly what you were trying to say?

Jan


