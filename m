Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9577F46FB33
	for <lists+xen-devel@lfdr.de>; Fri, 10 Dec 2021 08:18:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.243570.421412 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mva9p-0005NV-JR; Fri, 10 Dec 2021 07:17:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 243570.421412; Fri, 10 Dec 2021 07:17:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mva9p-0005Kq-GD; Fri, 10 Dec 2021 07:17:29 +0000
Received: by outflank-mailman (input) for mailman id 243570;
 Fri, 10 Dec 2021 07:17:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=aCrA=Q3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mva9n-0005Kk-3Y
 for xen-devel@lists.xenproject.org; Fri, 10 Dec 2021 07:17:27 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 391a1e09-5989-11ec-9d12-4777fae47e2b;
 Fri, 10 Dec 2021 08:17:25 +0100 (CET)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2054.outbound.protection.outlook.com [104.47.2.54]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-34-sFV3Q1qiPvmvmaI9T__A6w-1; Fri, 10 Dec 2021 08:17:23 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4941.eurprd04.prod.outlook.com (2603:10a6:803:5a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Fri, 10 Dec
 2021 07:17:21 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4755.024; Fri, 10 Dec 2021
 07:17:21 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS9PR06CA0065.eurprd06.prod.outlook.com (2603:10a6:20b:464::30) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 07:17:20 +0000
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
X-Inumbo-ID: 391a1e09-5989-11ec-9d12-4777fae47e2b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1639120644;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qTJHBXBYJiKrNOAYivvW1Yd32lTL4XfvIVCkx9TaDgE=;
	b=FG/xubrz7S9VkDwA1KexaO0fdMeaUXZ/lbu9xA7zEH1AZfIXDsJk27SGiJ6DA6dB/NABuk
	n/YviR6aZ884Ii6BlVBOIYilVKryOsVgG6Mcd3LIPv8V0leLZXQ7CukzNhZ3A/FnO5d/Qn
	shUcVEOWiiPkhNromnRkzHnKLxfyd5Q=
X-MC-Unique: sFV3Q1qiPvmvmaI9T__A6w-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4An3dbcWzZEB32j4bPA7u06yJssm9b5wFmHXWlzpArqxiLX72wxwPxlrydeKU0Dt3CViF4jBwbXm8AWVWlkSc0dFNNeQgyfS58gVBN87qsN5hH0PIoRnK2QL0Y6h5RiEpcMDuhEdA9r/AepyAXaYs0/+rfWC7/xMz8Lra1pqAx04TjyTicF7VX9fuUikflhJuTPzc41urG6CSyi4CSLq2YaeFMdWW9v4jF2nuFhEkrXgP6NZrKouziJYCwhyCSbeNBfdlnmUvKX6kLDIq/Zv6ljBovcmfPN9opE0jOP1DDGAzTbenT3u0wPtMYwJhP5qr2h8GOmoW90Nuh+rIw+0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xYvbAMf7AiU9d3+al0R/spdp5o8vYM6nvrltMMyf4Bk=;
 b=Yg3lfJWynl1ufG+0RhNB69midI/fsk1pQBf3UuwI2iRhdTMkrTrPjobnMQdevNjlij5aiqibenoYglVyVEA/9497hSiCfzwf9b14XkKdeTWgtJfeCTo9nw+/7zZKgM7NURujRQ14FjA2h+pI4NCBUMBlITDFWEjnqXrD1NbBzFB762znqLXRrtTNafsb2+Fxl7JDrPnxTm6llk1WpgO/ysW/Qpyq0sb9k1xPRtnIQ5+C0eciYnWit34qCyhidtOo5S8oliMMHjgJmJwlDGM1LJ8wQpvTbXfp6mzVaoZsonOvcQHJ2nSU/a1gykhnLdwXfeRLpNaOd5zBI81WSEAMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f522b9df-1ef5-4fa0-7c77-f4b142164df9@suse.com>
Date: Fri, 10 Dec 2021 08:17:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH 1/3] x86/boot: Drop pte_update_limit from physical
 relocation logic
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>, Andrew Cooper <andrew.cooper3@citrix.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211207105339.28440-1-andrew.cooper3@citrix.com>
 <20211207105339.28440-2-andrew.cooper3@citrix.com>
 <dc3f5bf2-53f9-7dcd-2be7-f9f953b382cb@suse.com>
 <736f40e4-0297-ba7b-abce-c9b67ad8eb31@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <736f40e4-0297-ba7b-abce-c9b67ad8eb31@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0065.eurprd06.prod.outlook.com
 (2603:10a6:20b:464::30) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55493465-6447-4e3d-14ef-08d9bbad1b29
X-MS-TrafficTypeDiagnostic: VI1PR04MB4941:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4941BBD4DD4BBB1C9ED66FB8B3719@VI1PR04MB4941.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	aHdfs72u/0GWjMwXFeakIfPOyj0jXkVhrexPzP7cJQiLxOXL8NTcgfv3Z0PWLNhe0wqnM20lEJ0yl6k8L3Q04Uy0WQEW64kZfRom8mCFxzZ149uBmQQ/f76cSOu3sZHGTeoLowt6Rs4IoBhPs03WMuPkSXoc67q2eTmw3gKrvmRv5JQoHA7RbHfBb9Fr8qHjIhvow+rwMgAR6DQMraed+2hnntsjfFQc/DiJs8yLD4Fd/6wPHYVl0scD19bsVXf5NUNKz44cgvbvM0JEl4KWyENtc5RGsq0Ow+2r7mX0bWgUoD712VmCdvyrX7bQpDNG9JYsxjxT4J3bSnmEMnmFSTca4NS0GYpb+8bTPJN9Fy6xZeCBnUwDNxdZygKV3lmgX/O91o1x2w5KBq20kWr/3WrhteRSh/oF7tAa6Ug20iiai86SoiHus7sK2A1/Qo+kZ8GuEAnSeNCq7fsGuJBjrmQeMghgIi2cDqZshMo6OWbxDY81OU9KZGg7KwhOqWxytYUalDNwSRr4BLqSye7Ne0LcAchSXtdopedA3beldXLa3TmS3BrR6vr2jZcEh+KuBqo5rh/E+wgH3k7OYWoWagVp39faWYxjqgZftmY2h+rAJ3MJ46YysSiRJ0NS78GVp0LXoqMB8jXMf2vPeR601XtiqSdr54aDBVhSpah7M+eeffls9w0nxqa3d1sbTfNeHJ7acizvGOIxH65n1UlkK3fiz1y9I+IoN3/DSV01s78=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(53546011)(5660300002)(86362001)(26005)(186003)(83380400001)(36756003)(4326008)(31686004)(110136005)(16576012)(66556008)(66946007)(956004)(54906003)(38100700002)(31696002)(6486002)(8676002)(316002)(66476007)(2906002)(2616005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?n0bawmMTyN4TBzm2tXowRTZelBJUV1wRpcLEO7My0MRN+KRJeqMN9iEBIX5h?=
 =?us-ascii?Q?suD+gLgzFad4WMp8n+nBHlOUJ7QWcCUV4YwKkoeRz52P8ecVQ10S6aa9YyRz?=
 =?us-ascii?Q?8Dlc5bKxniYx2Gp3McCJYmirAzGfow2T1SnG5geo64IHmJZkGjUz+GXkw6lH?=
 =?us-ascii?Q?33GurFhaGXCXmarriRCFbmlIWVuld8KAaBzssgE59TaU6HiQinSknaOapsXC?=
 =?us-ascii?Q?Y5AFcF1q4Nj5SuMYUgWE2lBVwJjMieLjbaRcb43mgFXeT0I0G8OoYIyp/oWO?=
 =?us-ascii?Q?D1EMLROGIA927HVmNraUnEl8jnWnRGwL9svqQyXeW6Ue5NcfrnBLwpLIIRhg?=
 =?us-ascii?Q?t6sbQtHMWJ4P/XiftvEpgydRGeNG/w76wHFk7qR32V0lpA16HPEiDIo6SAH7?=
 =?us-ascii?Q?7AvipKq95TDxkDHeFDvmsWCVyc6wf3fHUqkmgzmJBRl250onEOao+mB+q+l+?=
 =?us-ascii?Q?amM2rFYMDTpYY9Ysm+LUaK3nBYGim3E8XdbH3mA8+rDAhrltfseSo5G6TE3z?=
 =?us-ascii?Q?VlLNo6GPOHGf/kDfNwVKzZhN0eGhgytdOU3DRlDcMb/LM4yMXWLAeEaEU+Xz?=
 =?us-ascii?Q?zNijlegECsnj/qIRxIZWJiOEAp1U9CLlbWr/jrzUcOGGFX8kXDYgOSdb83hL?=
 =?us-ascii?Q?xa1OhZt8nZJjsBW13o7zWNBG7N2ev0VTfokTxqX/A/FoNsUvW4fCrcoej7Zm?=
 =?us-ascii?Q?hAGZLW9m72SiwnTw0Uu3rncprDXtD8oC7H/5fFGS/JFcFmrBnUcuIZUaNxN0?=
 =?us-ascii?Q?eSUfGrtPI0wswOPlUSWm2ZahGbQ/Fc5y7mo0iT28kJMlRnz39H/d5HW9Bx3D?=
 =?us-ascii?Q?OifyJRmzSh7nmZHZkkQ8M1zko3a58daGhijSUKGsCoxxMove+jEwUyaTNjHB?=
 =?us-ascii?Q?XLtZ7P9c5fQHueAsIPLbJBvDBv+1T9D1qsC6Bn3h5bIEYfxt+ejCeUZL4fwE?=
 =?us-ascii?Q?aTay4VXzY336hRVjAeU8WJd0HRCGpCAKUOwMcDU11rPw6Q47zDaU5Lk3Rksl?=
 =?us-ascii?Q?MMlZR3oJSnB+H/DkCJbQDowU6ItA1NfEx/2FoslCN5fnY9ZCAdop4wsIw9da?=
 =?us-ascii?Q?DAMPI4VoM9YUkuhXK7v88PC/M98CgzKbxGCCqOgJ9eq0fChUm2oI+AxCyif4?=
 =?us-ascii?Q?8s6gkMdckUOVRJ1MRguqwGNYIuJCSimONb+3Oj3ibEEI+yiV4rLoKKk5nCPW?=
 =?us-ascii?Q?t24WvIUzMlkx2YYZ/ncxZa6d+FJ6aFMTMOSraFYLueGWecH8hcZEjrTAcZwA?=
 =?us-ascii?Q?5kB7zw5YG/N65i2cQ40Eel5Mt9aK2WOWWMiCAJW9WHkNQbKvw8hwOKVxB3pm?=
 =?us-ascii?Q?dbbbF3mBcOTOgOe+xVJx0K+QMwbDfM5h4eFrnO/0ts9AWKRfsclwtCLX7oIG?=
 =?us-ascii?Q?FPp+lLm7v5qLzF+LfNuM5oFDhBSEiBc5q+zNgcZpDcjsP4G8A9YE/cVS3d0p?=
 =?us-ascii?Q?a+qfuyYkh4gQOWNikJt1RX0Dafzv7LAulTSvN+v+Y08WSm0JKW3Ce6Fu761n?=
 =?us-ascii?Q?OkMtJRM2DaCC7rUsWin76UeopZKXuEhNs5HJbC74W/9B1XQexg4Q4rTzTQW8?=
 =?us-ascii?Q?P6OD2M53IM6Oflk87koXOGA8jMWzbQ8L0DNGGNYgXTU6lnhU1gcNZrgKAQQu?=
 =?us-ascii?Q?4oAHocmQ5eZNcfR1LUJ9/QQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55493465-6447-4e3d-14ef-08d9bbad1b29
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 07:17:21.1168
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XnYyiEK9EUpoASNMOi4L68sh3fZ9fRgq9HqqBNI18smi90ya2FJ0u36xQXGLKOWu/4dMMIiJWbr7YXL4zZF0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4941

On 09.12.2021 18:34, Andrew Cooper wrote:
> On 07/12/2021 11:37, Jan Beulich wrote:
>> On 07.12.2021 11:53, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/setup.c
>>> +++ b/xen/arch/x86/setup.c
>>> @@ -1230,7 +1230,6 @@ void __init noreturn __start_xen(unsigned long mb=
i_p)
>>>              l3_pgentry_t *pl3e;
>>>              l2_pgentry_t *pl2e;
>>>              int i, j, k;
>>> -            unsigned long pte_update_limit;
>>> =20
>>>              /* Select relocation address. */
>>>              xen_phys_start =3D end - reloc_size;
>>> @@ -1238,14 +1237,6 @@ void __init noreturn __start_xen(unsigned long m=
bi_p)
>>>              bootsym(trampoline_xen_phys_start) =3D xen_phys_start;
>>> =20
>>>              /*
>>> -             * No PTEs pointing above this address are candidates for =
relocation.
>>> -             * Due to possibility of partial overlap of the end of sou=
rce image
>>> -             * and the beginning of region for destination image some =
PTEs may
>>> -             * point to addresses in range [e, e + XEN_IMG_OFFSET).
>>> -             */
>>> -            pte_update_limit =3D PFN_DOWN(e);
>> ... considering the comment here: Isn't it 0d31d1680868 ("x86/setup: do
>> not relocate Xen over current Xen image placement") where need for this
>> disappeared? Afaict the non-overlap of source and destination is the
>> crucial factor here, yet your description doesn't mention this aspect at
>> all. I'd therefore like to ask for an adjustment there.
>=20
> I don't consider that commit relevant.
>=20
> There is no circumstance ever where you can relocate Xen with
> actually-overlapping ranges, because one way or another, you'd end up
> copying non-pagetable data over the live pagetables.

That was fragile, yes. I think I (vaguely!) recall a discussion I had
with Keir about this, with him pointing out that the logic builds upon
all necessary mappings being held in the TLB. If you strictly think
that's not worthwhile to consider or mention, then so be it.

> That particular commit was part of trying to make Xen's entry code
> relocatable, so the MB2 path could load Xen at somewhere which wasn't 0,
> but to this day we still skip any physical relocation if Xen isn't
> started at 0.
>=20
>=20
> To the comment specifically, it's actively wrong.
>=20
> Back when XEN_IMG_OFFSET was 1M, and we had 16M worth of unconditional
> mappings, then we could get PTE overlap as described, in the corner case
> where we were moving Xen from 0 to anywhere between 4 and 16M physical
> (2M physical was in principle a problem, but not an eligible position to
> relocate to, given Xen's compile size).
>=20
> And in that corner case, the logic would "corrupt" various PTEs by not
> relocating them.=C2=A0 The PTE coving _start at 1M was special cased ahea=
d of
> the 2nd loop (finally fixed last week) and the PTEs mapping beyond _end
> were unused which is why nothing actually went wrong.

The latter fact being why I guess you've put "corrupt" in quotes.

Jan


