Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D1E3A7F0A
	for <lists+xen-devel@lfdr.de>; Tue, 15 Jun 2021 15:17:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.142016.262172 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt8wb-0005pK-UB; Tue, 15 Jun 2021 13:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 142016.262172; Tue, 15 Jun 2021 13:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lt8wb-0005nT-Qx; Tue, 15 Jun 2021 13:17:29 +0000
Received: by outflank-mailman (input) for mailman id 142016;
 Tue, 15 Jun 2021 13:17:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=stKz=LJ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lt8wa-0005nN-QY
 for xen-devel@lists.xen.org; Tue, 15 Jun 2021 13:17:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f66fa6dd-dced-478b-815f-eefcc0b382ea;
 Tue, 15 Jun 2021 13:17:27 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-uoUbLgYzMtaGEI9M3AvL2w-1; Tue, 15 Jun 2021 15:17:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6861.eurprd04.prod.outlook.com (2603:10a6:803:13c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Tue, 15 Jun
 2021 13:17:24 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::f06c:6f5d:34d2:1c36%5]) with mapi id 15.20.4219.025; Tue, 15 Jun 2021
 13:17:24 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.9 via Frontend Transport; Tue, 15 Jun 2021 13:17:23 +0000
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
X-Inumbo-ID: f66fa6dd-dced-478b-815f-eefcc0b382ea
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1623763046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QKFKFdfFqqT/C3iPfS0rQqjeIekAZIMfQUKmdR4wnMg=;
	b=O7hpsFFeabU5kHzcqkG0IApL4L2pQTQpwoeJ7tpqAOuOODW3SvvKNyX4tCKshqvV0LTLZ2
	AMYxFQHa5wejJDYYuWtYRfViCwoX/S4k0X2apWXCTpuo5LkMZDDMXWHs8z0SlBxsxeIWk1
	UgWjCRVJ8d2xhJ7SRjv28Bi8iYaO3Ao=
X-MC-Unique: uoUbLgYzMtaGEI9M3AvL2w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaJ4qP5l5OqYfYSCKRwgu39GNw41W4SckKrfXferUAEBcmrs2dOLCtt6nldu1xxIhPt8x0SHyYNHn3eni2730Xf8RKUN0vf6X42NFHF07amfXv9uVJ6IsNCYsUjQIhIG7oG4P7DARyBAdUlvBgu4m6TKFANh02nPpywAgC5R+dFEja5NIdwcDkbwqIPh0Aa+BZabo3d1cjV2UGwu091DZeshHzmQ6SHuak4LGpx6NTdHsly5X5vF8FuPM+YIArrvqpjKaUnIgzMH0wy8C/TZ/YnijnAfapyiugMmH+E3NVYKgHIG4b1xNtkycvyHH3MKwHOQyS4VLjHkjYOUR+3iZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2wv8m0t6FtTzNKuCaRqkZ+24yZa54s3jsZPKWq2ub4=;
 b=enBckFUi/9zEedkjVhL9cc41LFvkJR/Qwj8BlV3OweWVYr+/B3rs4ILgqbsd/bNNkH9Y3spr8LbH8MBIu1H8KnWkGRjl6gHzAIOx+Mo08FH7mMrFvT4Ve012sp8mPk0skENRn9ENG4xJL0z24aBkrvh9ZrWSowSsL2VWz/m5GH70IvAl1uXbgTwTUJgDiJfwCha8uwZgn/JynXrfJPJhXVpmSL+EgxIEYRLwg8UHEPY/o2PtFYXmynb0ff/a3LksGINEeyPqOJYXXtHlnDgdZOk2xT1UjVKHDfNJL5JGNRlSPvsH+6LLbi9990krHdUFuz2KdhjdmWUQ0F39Jmw5Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: BUG in 1f3d87c75129 ("x86/vpt: do not take pt_migrate rwlock in
 some cases")
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, xen-devel@lists.xen.org,
 boris.ostrovsky@oracle.com, stephen.s.brennan@oracle.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <0efd0099-49bb-e20c-fe8d-fb97c9de2b63@citrix.com>
 <74378af9-5d04-f95e-3957-918cf5c81ded@suse.com>
 <YMdZKuKOnFKpQ3sg@Air-de-Roger>
 <3e9f4ea8-2fca-bf66-6345-0b73b960cba7@suse.com>
 <YMhg6OclYQ9AS+wD@Air-de-Roger>
 <3aaed845-b273-0688-4cac-3d440e3d58d3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e93fefae-a178-5fb9-1747-45d45818d66d@suse.com>
Date: Tue, 15 Jun 2021 15:17:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <3aaed845-b273-0688-4cac-3d440e3d58d3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: FR3P281CA0040.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4a::8) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8219028-e037-4658-69c2-08d92fffea32
X-MS-TrafficTypeDiagnostic: VI1PR04MB6861:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB68611FAB500190D73DA85D16B3309@VI1PR04MB6861.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jRgMXq5pdWPNBan+XdNz1xdNsbAbVC/KWpQdHkgTaDFKAdBsj/BAKCEQ5OEu9msOga6PgHf+Vhl0K3Gl3m5RnXw5WqxV/V/XqQCg8V8USile9HUGOgwxcAPTgRbfrL/0ozyhDKkNisg8JTM3bpcEnHDH+8KtX7QBFYk2ZVpxpUdW13zI/Cmavg0+wDxpf1QjZ+U9WWqQ7Sy5RlPzse3HE2NPpRQM7x3NudCi++yQhrwFcvjjz3asXKp6pitgRYHLNTvH76ho1wXoT5DLhuNMmUZl3B2h8IMMB33BZsxd0JtpN+kxaR2Oz0dMFuomUo9SF0ZzqdyZ8DuWig38zhuaF0F7GNA6hQmzKJ54O06zWNG/QY6VBo5BJxtepFilepyZbXhIoUWI3Wo+AL8dcbA98sQJA9JVpVJukCdOkTNp8PKXTHULiaMV81fyMjiuGyRcNPqkxLyOecL6hWOgldRzq5edY/4QwUUCvGVC3wJfGSnyShSGSyl3sTzfzHRslByGG5PH8UwWl/+VIcni5gi6hmezeDRXxM/kEmnCEz8UUh+CQAbJymYxZwq/3nA2ER6uTCLa28wqBWmtQJ8rYgPsaNFCHORDBTKNkyVD8JLkTiQ3PMlmOoLnscXBGItHxghl0u8VB9/bC0q+tO9Jc1gxfznczTcm3zR+QRZYgE8Ip3vp8zNi0o52bkJxQQaFZSuJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(396003)(136003)(346002)(376002)(8936002)(8676002)(478600001)(31696002)(54906003)(5660300002)(53546011)(6916009)(36756003)(83380400001)(4326008)(2616005)(16576012)(316002)(6486002)(956004)(66556008)(86362001)(66476007)(186003)(2906002)(38100700002)(31686004)(66946007)(26005)(16526019)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h0++9GtSRHIqIk+Fm34uJ2m3ToIUXoeJ7ymmgKVNFGo3zc6d8nB37BIuz7r/?=
 =?us-ascii?Q?/BN+jDpF9Le/fEqr4sctkeO+sdKAe4GNWcRCZ+A7WX5afHAI4qCeVDAcDa3A?=
 =?us-ascii?Q?PYkNcNmm2habjIa99ejESdH0Eat+drd5mNYQ6mF0rMpJwnTYK++Ia6Cpsoef?=
 =?us-ascii?Q?jZoXCBmpXISYOAfa8746PLGTjlOzh3rdw+ppViJam9BOh9y0seKIa2BnFxdi?=
 =?us-ascii?Q?Wctgi/URZtj1z1mLTgH2u+Xniqwh7sArijz+rhLQqB6b9PMTofiDcyF4Szzb?=
 =?us-ascii?Q?2OOVr1DRVNq0B5vrwHYkYONSTnLBC8J0W+fCm4YVuCq8YIpqJog2y7Vr9WYz?=
 =?us-ascii?Q?BPpQW0/8IZ2nYM1zyr+50rjq9hJx1wH7v77zpho5GmO9sbw0qEJCmIlVtP7z?=
 =?us-ascii?Q?U1rtOxZtSZFcdCa5AT3Y4RButd/uloZPsNMyw8203nRqwK8GmRrKVo903TBf?=
 =?us-ascii?Q?U1CuOhnguOLtQZjOLkzBZDsX7sX6GG7SC8u92dQNdwb/+layFGFZej4fJ71c?=
 =?us-ascii?Q?9coKbUBMMvxAjUzBjWaBC7EDx3vdo0YNT+xJ7rClHgMflv4gTYGGkngZTuMu?=
 =?us-ascii?Q?b00MjBPcWXGQRnWYYv6YrlmZkg0XOWX5NiWkvtyuCmn4F9Afn+dQOW9E9u/w?=
 =?us-ascii?Q?I3+GdHb/KVflahKB6a7xNLdvTb6IXS/RcYfCft0+Z0eM1YQGYRqqb4VuFknT?=
 =?us-ascii?Q?H9wYb8DUu6Wi7aaLlm08SiW1Gkdi58RCdPLiQz3K0b8nlJiqSEfGbZD06H/w?=
 =?us-ascii?Q?GwFkNgsssj4lqKs+m4XoK3nCT5i1Pj0bVdyY692cLqV1gE+5OM7s1ldW+OKG?=
 =?us-ascii?Q?4XIs5bZyqNCIpFwnDnDNEBz0RtU4sASItvgkl01YhZXuWnJk5JwoGlm8RMOx?=
 =?us-ascii?Q?Xw/BpT2MkUFZkywVg3nbJaK7VsKfcbvpQcFjjLbtIaUP5GOfzFuIyRWmxf6B?=
 =?us-ascii?Q?QPu/FcwJNBIfCavvuMzZOXq9RlflXcLvJckdL1KvKFSRI6YF2E2RvoR5XKe+?=
 =?us-ascii?Q?faLGAYq1zGQG+FVSqmY6FNrg+0lIg03fbzr1CzbNXHLfYNre7KxwHYVTrSKu?=
 =?us-ascii?Q?N54PrxUmmSj5KmQVZ9g7vKLziIeXmpw0ZF2jtitL01EVTo4qA+fZlGM3uHgF?=
 =?us-ascii?Q?LJ8PNktai5Vj/nteh/88yb5DYsrffQfZ9OtyeuhUotwufo+qSGQzBiLDMaGY?=
 =?us-ascii?Q?df9BHYxUhjO2IrdM9sdpP//LxI7VTFlDAt890pwHxfbDoeLr7mdZliwzZccP?=
 =?us-ascii?Q?O6qFNhlKlZgghrOaE6XSqj5/Iryih5Z0JZX8HFiNGp9+bRX5n5cfUeWstL1g?=
 =?us-ascii?Q?uRj2+ARxXQnQ1FmhbtavUSlO?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b8219028-e037-4658-69c2-08d92fffea32
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2021 13:17:24.3213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zPDMK6imvRJxXW4sN3Q9M6ec8rcY9HLPfCZOQvuzjvNVLHj6+006yqJRxcWzMgTH1mpJsTzUk/U/7YlZHGzTrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6861

On 15.06.2021 11:17, Andrew Cooper wrote:
> On 15/06/2021 09:12, Roger Pau Monn=C3=A9 wrote:
>> On Mon, Jun 14, 2021 at 06:01:17PM +0200, Jan Beulich wrote:
>>> On 14.06.2021 15:27, Roger Pau Monn=C3=A9 wrote:
>>>> On Mon, Jun 14, 2021 at 01:53:09PM +0200, Jan Beulich wrote:
>>>>> x86/vpt: fully init timers before putting onto list
>>>>>
>>>>> With pt_vcpu_lock() no longer acquiring the pt_migrate lock, parties
>>>>> iterating the list and acting on the timers of the list entries will =
no
>>>>> longer be kept from entering their loops by create_periodic_time()'s
>>>>> holding of that lock. Therefore at least init_timer() needs calling
>>>>> ahead of list insertion, but keep this and set_timer() together.
>>>>>
>>>>> Fixes: 8113b02f0bf8 ("x86/vpt: do not take pt_migrate rwlock in some =
cases")
>>>>> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>>>> Thanks for looking into this so quickly, and sorry for not realizing
>>>> myself when relaxing the locking. Adding the timer to the list without
>>>> it being fully initialized was a latent issue even if protected by the
>>>> lock initially.
>>>>
>>>> Provided testing shows the issue is fixed:
>>> I guess the change here is needed anyway, even if testing finds there's
>>> still something amiss?
>> Indeed, just wondered whether there might be other instances using a
>> similar pattern, but I'm not able to spot any.
>>
>> It might even be better to fix other issues (if any) on a different
>> commit.
>=20
> To be honest, this change is clearly good, and necessary.=C2=A0 I'd be
> tempted to commit it now, as is, irrespective of whether there are
> further bugs in this area.

Done.

Jan


