Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24CBA4266EE
	for <lists+xen-devel@lfdr.de>; Fri,  8 Oct 2021 11:31:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.204595.359756 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYmD4-0002c4-0z; Fri, 08 Oct 2021 09:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 204595.359756; Fri, 08 Oct 2021 09:30:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYmD3-0002Zn-T7; Fri, 08 Oct 2021 09:30:33 +0000
Received: by outflank-mailman (input) for mailman id 204595;
 Fri, 08 Oct 2021 09:30:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aYfl=O4=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mYmD2-0002Zh-Dt
 for xen-devel@lists.xen.org; Fri, 08 Oct 2021 09:30:32 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 60e77d78-281a-11ec-8026-12813bfff9fa;
 Fri, 08 Oct 2021 09:30:31 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-7-MCxniIA_N028e5Bxj2QIfA-1; Fri, 08 Oct 2021 11:30:28 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5328.eurprd04.prod.outlook.com (2603:10a6:803:59::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.18; Fri, 8 Oct
 2021 09:30:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.022; Fri, 8 Oct 2021
 09:30:27 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.4 via Frontend Transport; Fri, 8 Oct 2021 09:30:26 +0000
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
X-Inumbo-ID: 60e77d78-281a-11ec-8026-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1633685430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4/vZb0aEvXjjfzt7OVIjwfSk5dIoU42hFDYAS/bExUQ=;
	b=Y54tzfz0xXdEJMRBvcDBwn0V5l6jmFfteBv3g7qFtRIKaMlfwAgpvH/YZ0/SUSsR95nAI1
	TMoAsGvpVRR4rhAuvy7Y53+cbMq4JMw11lMgvTBYEPXz9xOekCvZ/8n0vjNoaH4VaU8O1+
	iJb9CoKfinyVWXfFdzBMLzWeTitlQ24=
X-MC-Unique: MCxniIA_N028e5Bxj2QIfA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bfZlYRtP+ksecha/x1nAORubKtbYu8H2MpdnOmD53o2i4D7PHXsI2cWV77YsaPYxJVNTTjXbhWX47XrQkbNpIRKuPKn0WAkI6NNlzq2OUSbespqG38bj/fgYcgUykzLgncjAkV8zZHr1fqx+TSemLKVNdMMFShlVUOxcu3rAVOhPXC8cuOzuJCxBwxkpajPeAGZNNLO5uXiqk2jwEbfb/xsFNKuQfC/PFg2Arqg7t86Au17kIDsLIkc3smtqUWN/T7mHLLqPiPkUuuKsvXn8im1jkOFO/y3CUsFyhx50GsnBxEpZ+0QJh9/d8aLnlTOWAjrt2KFM6kh1NDcAgcmYSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NAows11ib9/2DBlqxbzf3C0a75Pd5fKIXtdRIXUTJAk=;
 b=bdjKizALnoq1rodGxZYXliKDky0z0xoH4Ownw/yFuK1KdmgkLlgVHjrwRE9jSUNdz6Glfr0u4ICfKFJnxYqu84AgqMZYKJRl7PlAWHhzWQvRaWnqFsNK+fb9AdogPz3SKDEPOt0zC/pDxBsXZPcdjj3POYP7i6m0hxrBvTKxdUFwCcbWOqqAp0syHrmc1XWACsBr7B6X3p2PMm5hPcsYeljE0r3Y4cFRDUnLUrnsCnEjbmRGGmKuDDMrSvjS33WOul3nTjhxdm82qP2BCZSywdO20W7sgDtbxt7LlQYijfqvWN4DhZhYd4Y1Ka07iOX+thWoIwQtrFkyXs+eN0a1yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xen.org; dkim=none (message not signed)
 header.d=none;lists.xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: PV - different behavior of pgd_offset in xen 4.6 and 4.13 for
 GUEST ACCESSIBLE memory area
To: =?UTF-8?Q?Charles_Gon=c3=a7alves?= <charles.fg@gmail.com>
References: <CAAQRGoBQZ4mMWy2ibectwbN85oWvgcwus2rwO23u7BA7JWbf+A@mail.gmail.com>
CC: xen-devel@lists.xen.org
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4c622d73-6907-35aa-2701-4aea73fdb160@suse.com>
Date: Fri, 8 Oct 2021 11:30:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAAQRGoBQZ4mMWy2ibectwbN85oWvgcwus2rwO23u7BA7JWbf+A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0001.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::6) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 43d97590-a756-4185-a342-08d98a3e4323
X-MS-TrafficTypeDiagnostic: VI1PR04MB5328:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB53283EA7E037B189CACFC278B3B29@VI1PR04MB5328.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	FB8HTxsp3yw2qtz/JhJc2OcMOZ3d2YChqsN9pcr67y7C6kj8/P9tEhkz48j3GoNXcQtuOtJBxqtFmOY3d12oZr1+BMX+eA+AwDjc6e7r9T/VYYfMgi9UDQWgi3J/chG5l01RO6IlkoEvB2KajP20FcA211lpxBHfB6TAdjU8bm+RVzWndyowHfR2mgZVN+WEnQm3NTLBDHEyBagPYUEdmwQznzkrDlrM87IJcYsNwWTFcQqqFbEVukw1byVJ2TzItpGpzo0nnaDfGnwmus/C59j171ScfAFpEICT4UTZjdk1ng7WfAVzF0ImAmASy/OWIbTvtlPxm0/M7nzbjO54WIkQoQa4s03ThPHzRS+r+V0/ZIQYuMX3hLKUx1gHWc0hNnXf9ggJ7vz2YnPexdbjetJglO+dBwVm62PeycRfMbz2Js8h+36l8WVATEEnlt7jOX452KTshqfoOtUm7q67hiq1pTlm9NQwVKgKkkAdvgoT/skgyIxaZL4HbcE+u7rJe+MTqdiBJXn4jQuTKGqv+fsNe2RH3AKN1huEgqsyq7zuIGHNOGwPTOGRWtSE+UfjsE1E7pXq2oBIyiANc5tTZB6L6F8ulIIq5EEBCFU6QVw1o3lJo693JvXUxwoExHDh5/UbQ7e1CeQt7ic4y6Rhv6b9S7ocTlUTVjV1dQMimVEnPBa6j91GyyTWxYFd/YHhk4TV2+BpgkOevI0ftuwERQvkIwE04hpUCUCH8AEkr3+EHHS+FDsZLntBFg9uJOre/XzvRZQkbJmIlNBAyxEcxejQWRMHWw19b6KDYLOPZj9CnazNSIs8gs8XsVAwyJrCq+GvLzrnAzy6EMAoRRoTZw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31686004)(66556008)(36756003)(8676002)(86362001)(66476007)(5660300002)(66574015)(53546011)(6486002)(8936002)(66946007)(38100700002)(31696002)(2616005)(186003)(956004)(4326008)(316002)(83380400001)(6916009)(16576012)(2906002)(26005)(508600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NrYlrCRGB3POCibaDa4PUFQ8WR4Qnj+GiZJLU3gpaLOjMvxJNQ2c15Yu8M1T?=
 =?us-ascii?Q?fObeSE9lAFxLxWq2oeKYwaMVquq6w9vvEb4KPktlSh6CvcXNGO2yKC7Oyq2j?=
 =?us-ascii?Q?5055BmMnd6lzuweUSPSbAlW0WlPSu1+FZnQM6Ji5TbXA9t0XOLjdlID3ZwUZ?=
 =?us-ascii?Q?iHjqPXBLqr7HIsbix8nRYFWn1H95hogZq7zEBLAOuF9JZllVTuICguvlsQZs?=
 =?us-ascii?Q?7Ud0Vf6O2ryYdvKmC+WNQ/QVtP9vgJSewPrJTbPNTGsYUZixl0109txGHRCO?=
 =?us-ascii?Q?K/vG6zOQvcf1ihsDhxSM2Lt3EhQq2hyCo23L1MXzcdC4K/OmztkY4R14aDMV?=
 =?us-ascii?Q?XBilSNJm4DohEz28unkCTbo6LARt1ZiZ5bfknmw1hlvog+UIHrJqt0+88UIL?=
 =?us-ascii?Q?LVEAmRrEz/RM6z64vTdkhKguTEqjcCh1fwgVX8ishxIfhMOrJBPEQ9LroggW?=
 =?us-ascii?Q?rr9dWJokc6kwOUklyRzii7EnK8u8jU8pygtj1AYD6IJ3PY8s17a7m58dchSQ?=
 =?us-ascii?Q?ovBB43KCBqmkFPXfBsUdJ21l4WG9lstHxRiMPXaxc1RiWtfhhrKbb9I8uc7v?=
 =?us-ascii?Q?HYxZHqcXuQihzcq3XW4lP/RUP0KnlLqQetwdG1KrIVFgrfBZTFB4Pw13pNu5?=
 =?us-ascii?Q?9mECau+l05NLE7hqIeuvYQCn4MuEnaqGOFUKXLbFKEw9u56VP8Mb8lbtcGO+?=
 =?us-ascii?Q?SvZknDX9PK0PZyNXrliJEa7cQ9HBL29KblmAC0eCwETGVNUNKkGyfROg9rhx?=
 =?us-ascii?Q?un35DISgH45VbsEyGWQ0alw1eWm4k5v1SMbajxb+dRJIiUvdJM6Bfx2Vbd7x?=
 =?us-ascii?Q?BpsU0wllfe2x1sQ/2zbSgbnig7A6mD44/4rSUa7UJCsZZlm1zQhzR4FXBiSF?=
 =?us-ascii?Q?aNA9ztxI7kg0RU/CW3v9ddU2ANigW/E+VgtZK07v3YeIRw0ydEAL/3aqjAMw?=
 =?us-ascii?Q?8h9wcPsQdYMJVEID1W0FKqFE1ErzA8DW07N2MVuywagohLHvzBVSxZRydpUi?=
 =?us-ascii?Q?1AxWQEO5CAALEkxDE6mYgwor0UeO4c3zZotrUIFTffL6K91y5jhfP2H0nrfU?=
 =?us-ascii?Q?rVqNckwkK7/l+Wc8zKrgqUrkSnJQgCfOBLpExZNbhurg0RELi0HEKUjyDMrR?=
 =?us-ascii?Q?eBjcZj7tRSsat9/IkvBWys2CmKid8tgpydBhmjT7N+qvdrAVkWY5n64iuvHC?=
 =?us-ascii?Q?IvO4AsHIv6BD/NXEOeoQ71g0XhV2Dg9MfLJbuuq7rDXIiChfOSgr7nUGAW6w?=
 =?us-ascii?Q?aIfK3BF9nzVJwUsgORFGe6vCUOgX/h/0LUsiJ3u8YkSnEVdIDUOfw8UiWrWU?=
 =?us-ascii?Q?lS6yavgJoAAupAe/0nImTl5x?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43d97590-a756-4185-a342-08d98a3e4323
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2021 09:30:27.0479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w8Koxes2GUCVb67KomW363SQw8jpRXAZuTcS/hrtbYIRPAtJXDdSqrtd5N5RVC7gTW+Hx2MpQqu+kXxZvvey7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5328

On 07.10.2021 17:10, Charles Gon=C3=A7alves wrote:
> During some experiments in my PhD I've tried to reused a code from
> Jann Horn (https://bugs.chromium.org/p/project-zero/issues/detail?id=3D11=
84
> ) that used the mapping in
>=20
> ```
> 0xffff804000000000 - 0xffff807fffffffff [256GB, 2^38 bytes, PML4:256]
> Reserved for future shared info with the guest OS (GUEST ACCESSIBLE)
> ```
> to map some temporary page table data to be able to attack the system.
>=20
> This used to work on Xen 4.6:
>=20
> ```
> #define MY_SECOND_AREA 0xffff804000000000ULL
> printk("PML4 entry: 0x%lx\n", (unsigned
> long)pgd_val(*pgd_offset(current->mm, MY_SECOND_AREA)));
> ```
>=20
> In xen 4.6 :
>=20
> `[ 3632.620105] PML4 entry: 0x183d125067 `
> Returns a valid PGD ( pgd_present(*pdg) =3D=3D true )
>=20
> but has different behavior in Xen 4.13 (despite no change in the
> asm-x86/config.h .
>=20
> In xen 4.13:
>=20
> `[70386.796119] PML4 entry: 0x800000021a445025`
> Return a bad PGD ( pgd_bad(*pdg) =3D=3D true )

There's nothing really bad in this entry afaics. The entry is r/o
and nx, yes, but that ought to be fine (i.e. I think pgd_bad() is
too rigid here, but may not be valid to be used on hypervisor
controlled entries in the first place).

> I could not find any reference on the branch RELEASE-4.13.0 of why
> this happens this way.
> Any hint of what is happening here?
> Has Xen changed the way it handles memory from regions in range
> 0xffff804000000000 - 0xffff807fffffffff  across those versions?

Yes - see a5a5d1ee949d ("x86/mm: Further restrict permissions on some
virtual mappings"). The page table arrangement underlying this VA
range isn't part of the ABI, i.e. we're free to change it at any time.

Jan


