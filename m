Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B123B5B2F
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 11:22:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147760.272684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxnT6-0000ni-IZ; Mon, 28 Jun 2021 09:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147760.272684; Mon, 28 Jun 2021 09:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxnT6-0000kx-Eo; Mon, 28 Jun 2021 09:22:16 +0000
Received: by outflank-mailman (input) for mailman id 147760;
 Mon, 28 Jun 2021 09:22:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxnT4-0000kr-B6
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 09:22:14 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 65de924d-9b41-4902-ab8e-ff564b583400;
 Mon, 28 Jun 2021 09:22:12 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2052.outbound.protection.outlook.com [104.47.14.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-hFxY6NK1MIuz2DQHStMB5A-1; Mon, 28 Jun 2021 11:22:10 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4445.eurprd04.prod.outlook.com (2603:10a6:803:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4264.20; Mon, 28 Jun
 2021 09:22:08 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 09:22:08 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR2P264CA0030.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 09:22:08 +0000
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
X-Inumbo-ID: 65de924d-9b41-4902-ab8e-ff564b583400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624872131;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ekL30rVGUWPmzwXTCzbjBBg2CpH8R64dGCHd8HGXuxk=;
	b=cvhaV9yIq/j5MZzVZGsx/rHxUqYiDlmRmCZbf5hPsgPcrmBV60aK6axhbNXF/VmEREbWnn
	RQck/6qxF2ZX5GXui2cH9YBkA9LBg9GsYGBS39Rcmo77p5ks5ht8aULuMwaqHRMp6AM050
	eHo+uo6GEHMF/fsljMp+XDRuFRrXZ3Q=
X-MC-Unique: hFxY6NK1MIuz2DQHStMB5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q7Ia4aW7wOIcBh4Bs1ZoXNcNJXEP88uqQgyG17OjwTREZzDGP7Vtk5X/5oGc6qXblPdu/YkMJ5SvOu1LMOsyrsUCqmBqhqyJpbEePtaQnm2eD+PPVREEEE8I2tgSdyMhRb9LBS+u6SCRJS0RDXhsOaDuww4vzww03l1Sl6qJM2lWzfgn8DKaDeSYG4LIIU+u+Jr1NHZibDrAMIF2v2w1zRdZyf2EB6arBrAzS7okg4xdLU5FRwhy6fg25pMA+Mpn+HshxDLwfRw+zuqdz/Qp1wvUT9L13OBSogCfpQ66bHNtQOi/poNlpFGAdHRX0OA/SOH3ZqA+Xs6EnEMOn5lnag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tCQup5LRg5XvPA/47B72HUVCaTRAE1rF6WFN49f+ga4=;
 b=FE7tloSqgH0DZD73Yn09G1rt7EA+5mSqg2PNaPbjK4Pzsxf9x7mDtfViqzj1YUBEuAxb4zbKx6oT4GGCF5bmBw0ESRfBQVIpXkmgqmFi5HymG0EO7nRiklBlLJfV1atpF+Uh4VVrep5r70xN5WEnb1wIlrFB5qzDCUpoXqECC7JqZiMFL0Jh2dsgxBdE6diWlvOcNcEpL+/IjLqLvE5u7v1WtVfYYiA2AVv0e8DGYHefWKiJ0rqiWxa+HO62oVk5BSxyWQe0H7ybm2R80c04ntU1r4M6kExHWl5cm52tMGzfewch48gI/sp2OSzifpYlV4ugS9epZ/jm36TtwagPQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 12/12] SUPPORT.md: write down restriction of 32-bit tool
 stacks
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <03512f29-7a4e-70ff-271b-7d65ed471935@suse.com>
 <f3a758a2-a8a9-60a3-92c9-1a490084dbb6@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <813f814c-2ec5-915b-4fd6-303b8437ae04@suse.com>
Date: Mon, 28 Jun 2021 11:22:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <f3a758a2-a8a9-60a3-92c9-1a490084dbb6@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR2P264CA0030.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:101:1::18) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dccba999-72bc-4ca6-37d3-08d93a163416
X-MS-TrafficTypeDiagnostic: VI1PR04MB4445:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4445D7D956BD7A49DF7FFAA5B3039@VI1PR04MB4445.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/nudiJiG99DBSe24KSBGDnp5u5jQPttx+ivHWlEBhrNdsjlV1Fe5n/JBGvXOXWNo+uEmzWKC57+pebvjk/6PeCCyYqor71NUHgbj8k/O6UlxEc3BBdYFVVuYLFwNcQXGI9wpYKNC7rNMOWX6kHdDiCmz4Pcz2cAIE8ZTNtf7U9YiQ78UsPfjg6SDaSTrh/KEiIdERgrW3enk6NYyylTkILicoCh25/C5s6Pox0kGsf98bidDMkTgP+EE0I/gXEFdfp+JD28C5m9gpYEQKaXWF4mSchrwCpUQ4jMbVHq+K3Zi8sDAhgrAoipQNu0i7UKBAvkiAg1o/uzvkiy5wTto5UsFJVC7PN0nu7mmn9wE8qkhigwoyLpeTWtNXm/1jZqv2yQYrR050Qa7zoi1lkPrUuJTAm435F10K2c5Z3qtsRspBxqJFfFUT+6CSq8KUxzJOUtFaIBnAVEhIUJbFAg2uDvhKy0ydTMaEhF3/NQcYtVnpbGjxOHAOZfxaMpt/oeQFpHa/RlHnvBuifRbsEmSRY2/Q5nlxz+xBWfdrT0XN+dMBF+/suTMo4i39vuyMOTnEtnb6Eq51+6g6966zZEQyjxxioE8l3ehgIYpBW4V6cta3QgLYq9MteO+D873oIuGB9uSrLeU/W9ptGRTFwxsbT7hGiN4npNPmFpCEv8rvtU7n+jr9X2YXsT1NLsjzhwavrY4UB6t3aw8KM0KZnLp28COWintnNkhhZg3fIdFj+0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(39860400002)(366004)(346002)(396003)(136003)(16526019)(186003)(6486002)(8676002)(83380400001)(86362001)(36756003)(5660300002)(54906003)(31686004)(53546011)(6916009)(66476007)(2616005)(31696002)(66556008)(26005)(66946007)(478600001)(4326008)(8936002)(2906002)(16576012)(956004)(38100700002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UqRvsChpxIwruQBJb7IpFmodc2ZzDmY5JCMFGOWTyi4N11bXd2nSiP/OzD4q?=
 =?us-ascii?Q?Eo8pWy5azmea8H6dPaAWZ/YekAox/PtViDY0Y92LSg4EhbAbsfNlB7E2Qjm/?=
 =?us-ascii?Q?NVA7sHhz4fe0NbH16Ae2EZgoivj0lIACMNefXKBZZgiIlWg0mYQ1VbeQ7rqh?=
 =?us-ascii?Q?LJT5Qo9VEUFvBXMQSL7RamripOEGkV5DGPmdg2N2P9aDmAYjK5GzEYLeA22e?=
 =?us-ascii?Q?zuCOsJk7yFwjApsf0K/ZTt0ZhCLdKVv4Zf9qBR/ppkaFuJ7pZDIIXBma4TvM?=
 =?us-ascii?Q?/Dy8C9L0Q61KhauQ3fZYuGhYIogPTqfeAliMPczwDmSnoQhUCMqD8tRqS9QG?=
 =?us-ascii?Q?eDp5kkz19CeT81znNPQj73TsfaZSpTMqshKmCeIuTwdhAScSA6kJgKoVEbOz?=
 =?us-ascii?Q?jLE7SaTWV5Dn1TwiqMEZR8yX33VYdf/d37X73bOTkrXVneBfE1SfMJkGfsZn?=
 =?us-ascii?Q?mHN8emLTPkr2u5MrTdqPeCL3LzEugkea4eW2gzhQ4OB1euSQXeAAAGkhA7Zz?=
 =?us-ascii?Q?+MgoZAVkyB4T8CfcaOU6Vjvm7nKfWdOIID8NPm9MsFQA5d1SlU+kUhVENLNl?=
 =?us-ascii?Q?BPKUDcg5Jp1DDW7sa2y/ZIdrxzKiTtmKiAYARy9G/utOIx3xGBLIovp1BrxT?=
 =?us-ascii?Q?UlePbs691ED71yJlvWB9p1TF7q/tA4xFguikkNuXanDG/alWhJ2zDcU/iIUo?=
 =?us-ascii?Q?59wvTp3qbedL8yIFSWkjtX+DNDg5GyFyoWhatoot4ac2vZRS5RG425dfxyna?=
 =?us-ascii?Q?hG/fNkl2NWwp9BCSEwoq9czJE1zrsaS3DEmXM19MgDHJFqiQgncpDZgfFuRb?=
 =?us-ascii?Q?qTz8nsZReKS+o3WTOryVkHeCYEfWV23eQhTDfmN+S6atMUnMXhUHU6kH6U5k?=
 =?us-ascii?Q?SqjbydC4vFA+GeOnrzIyP9BsSxia71R6P8z5VP3TeCx67HTs2NSdrgmuZ2Yr?=
 =?us-ascii?Q?5qJgVwtrDe2ekiOmJhoWjR76Oopd5sYSgfVrmTJmc9l2sDW64/3jykv8xUr4?=
 =?us-ascii?Q?Asb6imX90lCsbdSMINB0+MDEY+sNAn3yDmSSqmrfU+x2wgohgBnVrGZmfPlk?=
 =?us-ascii?Q?f9yOfthO1DvI6QMAmKM9xrcb7Jt/1J++bUiGdACCIgfBMyG6y25MrEwRt6VT?=
 =?us-ascii?Q?zRwkDC8XOeXtnZ4s+OCWN2H/6cQ/Wx0yUIKPH/UVqbozK3AqNmJsQVjTYuI2?=
 =?us-ascii?Q?cgHumGqLc3a7g+NrhcCZ7nMbqiij2uuYPMLGW8Zc9jralSpk4c2d9SzzB9mK?=
 =?us-ascii?Q?9N/UQghvxT2NL9zo/LRubvsu70+rdVzmzNe3o5s5gELLYxMFWYkLqUbz8Qv6?=
 =?us-ascii?Q?q/IRMtJoCkO1cpBOEd+N/fEy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dccba999-72bc-4ca6-37d3-08d93a163416
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 09:22:08.8407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9HJypSp2r9rI+ZdibAZX+ZlTj245BYepZBjpsN2QzlIIbRSSoJgod8cEba0rh6wW3WAiZnolKew+w74TNAETg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4445

On 25.06.2021 21:45, Andrew Cooper wrote:
> On 25/06/2021 14:24, Jan Beulich wrote:
>> Let's try to avoid giving the impression that 32-bit tool stacks are as
>> capable as 64-bit ones.
>>
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>
>> --- a/SUPPORT.md
>> +++ b/SUPPORT.md
>> @@ -131,6 +131,11 @@ ARM only has one guest type at the momen
>> =20
>>  ## Toolstack
>> =20
>> +While 32-bit builds of the tool stack are generally supported, restrict=
ions
>> +apply in particular when running on top of a 64-bit hypervisor.
>=20
> Actually, this isn't true, and in a way which helps us right now.
>=20
> PV32 isn't security supported, and neither ARM nor x86 support dom0
> bitness !=3D Xen bitness.

While I agree this may be one possible way of the recent change of
support status for PV32, I didn't so far think "x86 doesn't support
dom0 bitness !=3D Xen bitness" was stated anywhere. The recent change
was about security support only, yet Dom0 isn't covered by this as
far as its status as a "guest" goes. This view of mine is, I think,
supported by osstest actually spending a fair share of its effort
on testing exactly this.

Also please don't forget that besides a (64,32,32) tuple of (Xen,
Dom0-kernel,Dom0-userspace) there's also the possible (64,64,32)
one.

>=C2=A0 On x86, it doesn't remotely work because of the
> pointer size mismatch,

Are you saying this for (64,32,32) or (64,64,32)? In any event I
have to admit that I don't see where pointer size (and it not
matching) would make this in principle impossible. That's what
both Xen and kernel have compat layers for.

> and while this was bodged in a horrifying way in
> the ARM ABI, I doubt anyone is in a hurry to turn that into a supported
> configuration.
>=20
> That said, it is my intent with the ABIv2 changes for a 32bit toolstack,
> under 64bit guest kernel, under 64bit or 128bit Xen (yes - RISCV-128 is
> already a thing being discussed) to function.

I'm curious what your plans are there. Afaict accommodating 128-
bit in the ABI right away would be a good idea, by end up bloating
structures unnecessarily. But perhaps you have some clever ideas
there ...

>>   For example,
>> +very large guests aren't supported in this case.
>=20
> The wording here wants to be careful, because under certain readings,
> you've just dropped security support for 32bit toolstacks.
>=20
> What we actually mean is "a toolstack with bitness < Xen is not expected
> to be able to manage very large domains correctly, and don't pester us
> with bugs when it doesn't work because we won't fix them".
>=20
> Whereas we will fix security issues which only happen to manifest in
> 32bit builds of the toolstack.

I've replaced "supported" by "expected to be manageable". If this
still doesn't fit, then please provide sufficient detail for me
to derive what wording would suit you.

>>   This includes guests giving
>> +the appearance of being large, by altering their own memory layouts.
>=20
> I'd drop sentence.=C2=A0 Its an internal detail of a corner case which we=
're
> expecting to remove in the future,

But this is the main reason for us having notice the lack of clear
statement here. Plus within the current ABI I don't see us having
any means to remove all the truncation issues. We shall be glad if
we get a 64-bit tool stack to correctly deal with such guests
(performance aside).

> and "the guest kernel can DoS itself" isn't interesting.

Of course there's no intention to state anything about this aspect.

Jan


