Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1A34AEFA1
	for <lists+xen-devel@lfdr.de>; Wed,  9 Feb 2022 12:05:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.269003.462964 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHkm7-0001vE-3O; Wed, 09 Feb 2022 11:04:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 269003.462964; Wed, 09 Feb 2022 11:04:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nHkm6-0001sz-W3; Wed, 09 Feb 2022 11:04:38 +0000
Received: by outflank-mailman (input) for mailman id 269003;
 Wed, 09 Feb 2022 11:04:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XFrC=SY=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nHkm5-0001st-AS
 for xen-devel@lists.xenproject.org; Wed, 09 Feb 2022 11:04:37 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10edb001-8998-11ec-8eb8-a37418f5ba1a;
 Wed, 09 Feb 2022 12:04:35 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2109.outbound.protection.outlook.com [104.47.18.109]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-WwssaUJ9N1WW4d4pYVUvGA-1; Wed, 09 Feb 2022 12:04:34 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0402MB2703.eurprd04.prod.outlook.com (2603:10a6:800:ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Wed, 9 Feb
 2022 11:04:32 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5160:9fd7:9627:cb11%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 11:04:32 +0000
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
X-Inumbo-ID: 10edb001-8998-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644404675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ai9zrnbU99mJWZZx21K3PnZyz+f8Vwmvshux+xp5ncU=;
	b=jTrI+dbN9ahlpkYqQQlSw4XMnEocV9rnuFwai122ojCgIYvvi8LOnQMOULVSi/2x6af2pK
	eEkLn/kfimVjR4jw1MtTnZIzbwg0XWS7QY9p7S0cLbfkZayeDBwIbgIh0XuOZLywYqctNW
	jX0rDstAepmLOC6NSwtp33/OTDpJyoY=
X-MC-Unique: WwssaUJ9N1WW4d4pYVUvGA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fmFHiYnJkJYzfU43waRzJTu9EUXQmEew85X3/PeA5OBhiuUXqXbhpWmWApkgwbnCcWG9KbCtbe+2MszClBdobt4l532X0pbYBiELr6Ll+LZr4GjQgLR8uMWscXaKvnUJNzAG0f8Um+4p8T8z2KfdhwwBNmXWyXRUQ6Zg0moTCX8TN69kS0rkNhlGwMO3OtlqWHwKzX3y0keMfcpKRNQ3WPm1hWWnngZPLnCCKuOMnGzqhe2tUv+Fsm6VG4On5es/hnbv6cui1odgAxZuK7dGVBuhInIbPvwNahsosR1RjTpa+6Q/D13rA473qtOpM2C/todcfruYG3zhdwFO0QSEeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pn1dFbHAgujrZNDuCGd4SWDATTThjNWKJBsmA/6J4Q=;
 b=hJXfkHo8oa1kk5lSdNsHQDXK36xbwtYTlv3lB+0nV6o2u5D6BXN7vDAAapeH9q2BNL/ZINE7GJesR1MAycppOc8vWwg0xiJ8Qi+U4JlVcMqQ7PmsmEZjXNXbzjggXEVr9ZfKsLPb4nWzYSmUN8fAIvaouQ/5kGEM/MogAvJd2E5QmgY0sOYMofOgRkXia5BXxwWcpb1qYysfU0ochlsmewjLCA5jlnf4z5m2seaW6kgAWLDSSwGPmfJuW3lWxuiyrpB9MYVjJyB0xWMuh/JdE+1DlVq04ICnHrAf5hJaP3E2QZhwTg51fQhd8f/7atEl72Kr0xKzkmUTy4kSmxr5pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7f81a991-b66c-41cd-5f0c-1f121446ee1b@suse.com>
Date: Wed, 9 Feb 2022 12:04:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH V5] xen/gnttab: Store frame GFN in struct page_info on Arm
Content-Language: en-US
To: Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>
CC: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>, Julien Grall <julien@xen.org>
References: <1641424268-12968-1-git-send-email-olekstysh@gmail.com>
 <a54213c4-1c68-694e-c130-d95faeef3953@xen.org>
 <78d94e1e-6db4-25c1-adb8-e4bdbfe42774@epam.com>
 <82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org>
 <3629d57d-6d89-5ada-1664-cd532342fd0b@suse.com>
 <d42f0e9f-d60d-8ec4-7053-9ecd1a069925@epam.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <d42f0e9f-d60d-8ec4-7053-9ecd1a069925@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM6P194CA0092.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:209:8f::33) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cdcfc61f-37cb-46e9-b191-08d9ebbbf2f7
X-MS-TrafficTypeDiagnostic: VI1PR0402MB2703:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR0402MB27030AB3D33D4124BD8F57BEB32E9@VI1PR0402MB2703.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	QHe0hkr8HUrTZULaDgOMMIAPuOi6A2VaUiZgyc/MWAzh/HQRSYWFZ3gcKHXP2mbRKacq73OJHfvaDHvoBslf9U+tYuU15vMS3H67FRIbzXQuFd+DJ170vZR6uGwmZ63OcT7zT/WK9MXPpwGhkoSZzuLoAztxK9r76yHm1tCqBGwPvyohNnQ/0mUqf+T1q3nHlJ3i7BrX2zu6nVbFCnSg6eyKGjlTNQ6SP2PAe2PQePtt7jkAH6jXkDKdwCvxzWty2oezwOxtebGjBaX1hHzqAF61H8Fe+0JTYDQZXNFl6KadALlLYjespodH3dHY8C5Uh7j/8pm44j3gP0wK5CIkgp6JlMEcq/iyVv0O/0uWH7F8wWX/MrMdKGAbS3ALtexK+Er/8iuIOKI/cxux4KLXxVejBKh/xWzwJ3CY75L8jl+ctD4aGU+GAvGKngdQyrDOpZBR92rmybqTw2dgQ/JJbLG9otdqRQn0O7vHJ/QtfmfkYeUZ629pWgEcKbTuUb2+Azu6FI8cwEUL3lLzNaWwIpISBQB5PEKjhK/2DQ63TCYVtSPviwLsvX1PPkQv29QoFOdkDn0TCM41IGKpRMHs1V8fmS4fHcQFVw/f0Opuvbbp3yfcb6lcvmQSsbiQpGMx3SQH6nyDwUyj3+waN0X4KIFbgFl+seZT5OwiqMMrgwl6zAuU1FV+hGlgyOhuDOUOe9HXMajhILPc63O5wijVqxaFvWwpyQi/1BoEkVh15AY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(66476007)(66556008)(66946007)(4326008)(186003)(26005)(8676002)(86362001)(7416002)(2906002)(38100700002)(5660300002)(316002)(6506007)(53546011)(2616005)(8936002)(54906003)(36756003)(6512007)(6486002)(31686004)(6916009)(508600001)(6666004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5MiCdNRkb4UAyxw2PVCbwIrPM3v+69XOP0A0IpAUrRQ/69/FFJCBvcy1Ln7g?=
 =?us-ascii?Q?oIyFsBw2iKx8g38D0l8g+M1mG77Cy3VQSyMiH2cmYZ6Kos+PvYMzlL9dmK4H?=
 =?us-ascii?Q?vaOlN1zm2t03m0DO6/3rNn3PFRo5HVJG3PDJHAW/6fiMCMMkQXZJJiH/HOsD?=
 =?us-ascii?Q?PB14/x0dc8TOqDrAOfpbhNIKF6BWEUZN1A9D2ffBudJEvICHvu+f4xv1AsYM?=
 =?us-ascii?Q?mHPfzaT1sZnOL2iaAUClhAZvtc/j4uAWMMtc/TMnVd9SAdZtMHzhBkaRNUfP?=
 =?us-ascii?Q?tfWoZrK5kNQdnKD/GzdBkVdEqGc9bOe+3rcuVNSN/5m+asXgsDzChnM+pvpv?=
 =?us-ascii?Q?S0+DtU/w53+jfSEeLtVFsLntyNcXJbToreKpu+imrOFh5qDob5KDUgcrv14R?=
 =?us-ascii?Q?WKuH1KHffOXEhsSP5tJ4455tidr9SRPKMlLBPJrStL0pwwX5HJ4GSzVQGGAI?=
 =?us-ascii?Q?W6FM4ejCmSGHKq/CyBSpVxk9S4pgRANGKZV5ZtGsZQnvfMea4PKxwNwNr8dJ?=
 =?us-ascii?Q?5ZGt5Pa9GM6ZwUPupQsQZMsdNGtGfx4iF8e4V0GTp6XAgCb1AGqXbPe5CHfW?=
 =?us-ascii?Q?H165Mc/WBi3blseL2sinB+COFccUj+q8t4gZeopbo5JM7uJR8oVSgiRm9W3V?=
 =?us-ascii?Q?TJO3Sf5RjFy9lwJGLjrNWvPnyHcFlMNEgMrldzfRYtEgxWDXuGwgEBp2F1l0?=
 =?us-ascii?Q?xIndbA3guXHXDGSn0QnIxIztgh3QkQchSHJSDC40nAvw84tmz5uRJxftKZN3?=
 =?us-ascii?Q?fyVtim6ZYoaSGSin7s4YKWAf3JJ2kqXFKNxD9HRjx4ubH9TSO6ETNPJELTb9?=
 =?us-ascii?Q?GYDB+0R4t7azZoRT3dL/COUNC+yEvzTowO7hZjE5aYOKl/5b1KzzED8aUhdp?=
 =?us-ascii?Q?H9bcwIE71XuAMjtLU/aqqzICk3nLT/jZizkPMwPeN39MgEneV+wL5UmoxyWf?=
 =?us-ascii?Q?E2W6JZynctH+4h8jkdVt02Eg6E0iCZf2++i0IY4jfF40HFzNHQeSxsQXWJDw?=
 =?us-ascii?Q?6Ap1geVaKUoMFzY517eqek/lCQ5OG7AMcI/AV1cQ8+kUgBhUJ039EZ7pUKR/?=
 =?us-ascii?Q?MsA0GUNOjk+OEiHY9KdfWQJmBGZHDx1Iag/cuW51of+8lfw62qbK0Kntacoz?=
 =?us-ascii?Q?nduGcccahvDOXP4xfWZko1ta+ACM6r5i9FPmMQKE7Kq3JZE7JTurUNFZpTt0?=
 =?us-ascii?Q?aJe8VVhcO0IztnS2gwPFySmgbSeHGwl3dJkx8FbfiYF+eyYs4EaOVwe9z5Ho?=
 =?us-ascii?Q?fedvSbs96MOdDIgFyY/D7SS0uZVX65AUknrF3syLk1vOWMrSTxtT1PqmyBLw?=
 =?us-ascii?Q?ibwei64FljJH5yNwsLue2MuUeZiooaZ5IzQlZrMD68nfpKlBJUnRG1Uz47C2?=
 =?us-ascii?Q?NVsKBDpB6LGHUYyZwr6kdu5Jxx8kVK5HPvvYcthLbwL3taUPNgSsTvOIR37r?=
 =?us-ascii?Q?BH5gN62XhC8u/IS84wAnhZ0HyE5yPJfmO12rVH+TnaQVGkpuMMn6E+ggUyGs?=
 =?us-ascii?Q?E3gpQ2OIEf7logLctg/WQLif6BQDd3DhbQItMKWhS/ygV7L16T8/3IskofzZ?=
 =?us-ascii?Q?5kNFXeazGJTO01jbG1cHGS5Uf4emKwKCnY/0o2DLJfaUwl43VR6uyv9Ceklf?=
 =?us-ascii?Q?MM0ybmTx1TQWnjFJJgggqMc=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cdcfc61f-37cb-46e9-b191-08d9ebbbf2f7
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 11:04:32.0022
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcs+rc2/y1uGGCYt/qTD2yFzq5yTIM/LdFkNETbEiGhR/nRVz9yjlBKcig0lPJpVebINRMLFUqaPAtCDE+N7PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB2703

On 09.02.2022 11:08, Oleksandr Tyshchenko wrote:
>=20
> On 08.02.22 14:47, Jan Beulich wrote:
>=20
>=20
> Hi Julien, Jan
>=20
>=20
>> On 08.02.2022 12:58, Julien Grall wrote:
>>> On 07/02/2022 19:56, Oleksandr Tyshchenko wrote:
>>>> On 07.02.22 19:15, Julien Grall wrote:
>>>>> Hi Oleksandr,
>>>>> On 05/01/2022 23:11, Oleksandr Tyshchenko wrote:
>>>>>> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>>>>>>
>>>>>> Rework Arm implementation to store grant table frame GFN
>>>>>> in struct page_info directly instead of keeping it in
>>>>>> standalone status/shared arrays. This patch is based on
>>>>>> the assumption that grant table page is the xenheap page.
>>>>> I would write "grant table pages are xenheap pages" or "a grant table
>>>>> page is a xenheap page".
>>>>>
>>>>> [...]
>>>>>
>>>>>> diff --git a/xen/arch/arm/include/asm/grant_table.h
>>>>>> b/xen/arch/arm/include/asm/grant_table.h
>>>>>> index d31a4d6..d6fda31 100644
>>>>>> --- a/xen/arch/arm/include/asm/grant_table.h
>>>>>> +++ b/xen/arch/arm/include/asm/grant_table.h
>>>>>> @@ -11,11 +11,6 @@
>>>>>>   =C2=A0 #define INITIAL_NR_GRANT_FRAMES 1U
>>>>>>   =C2=A0 #define GNTTAB_MAX_VERSION 1
>>>>>>   =C2=A0 -struct grant_table_arch {
>>>>>> -=C2=A0=C2=A0=C2=A0 gfn_t *shared_gfn;
>>>>>> -=C2=A0=C2=A0=C2=A0 gfn_t *status_gfn;
>>>>>> -};
>>>>>> -
>>>>>>   =C2=A0 static inline void gnttab_clear_flags(struct domain *d,
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 unsigned int mask, uint16_t
>>>>>> *addr)
>>>>>>   =C2=A0 {
>>>>>> @@ -46,41 +41,12 @@ int replace_grant_host_mapping(unsigned long
>>>>>> gpaddr, mfn_t mfn,
>>>>>>   =C2=A0 #define gnttab_dom0_frames() \
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 min_t(unsigned int, opt_max_grant_f=
rames, PFN_DOWN(_etext -
>>>>>> _stext))
>>>>>>   =C2=A0 -#define gnttab_init_arch(gt) \
>>>>>> -({ \
>>>>>> -=C2=A0=C2=A0=C2=A0 unsigned int ngf_ =3D
>>>>>> (gt)->max_grant_frames;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0 unsigned int nsf_ =3D
>>>>>> grant_to_status_frames(ngf_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 \
>>>>>> - \
>>>>>> -=C2=A0=C2=A0=C2=A0 (gt)->arch.shared_gfn =3D xmalloc_array(gfn_t,
>>>>>> ngf_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0 (gt)->arch.status_gfn =3D xmalloc_array(gfn_t,
>>>>>> nsf_);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0 if ( (gt)->arch.shared_gfn && (gt)->arch.status_=
gfn
>>>>>> )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> - { \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while ( ngf_--
>>>>>> )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(gt)->arch.shared_gfn[ngf_] =3D
>>>>>> INVALID_GFN;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 while ( nsf_--
>>>>>> )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
(gt)->arch.status_gfn[nsf_] =3D
>>>>>> INVALID_GFN;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> - } \
>>>>>> - else \
>>>>>> - gnttab_destroy_arch(gt); \
>>>>>> -=C2=A0=C2=A0=C2=A0 (gt)->arch.shared_gfn ? 0 :
>>>>>> -ENOMEM;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -})
>>>>>> -
>>>>>> -#define gnttab_destroy_arch(gt) \
>>>>>> -=C2=A0=C2=A0=C2=A0 do { \
>>>>>> - XFREE((gt)->arch.shared_gfn); \
>>>>>> - XFREE((gt)->arch.status_gfn); \
>>>>>> -=C2=A0=C2=A0=C2=A0 } while ( 0 )
>>>>>> -
>>>>>>   =C2=A0 #define gnttab_set_frame_gfn(gt, st, idx, gfn,
>>>>>> mfn)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> ({ \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 int rc_ =3D
>>>>>> 0;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>>>>>>   =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gfn_t ogfn =
=3D gnttab_get_frame_gfn(gt, st,
>>>>>> idx);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ( gfn_eq(ogfn, INVALI=
D_GFN) || gfn_eq(ogfn, gfn)
>>>>>> ||=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 (rc_ =3D guest_physmap_remove_page((gt)->domain, ogfn,
>>>>>> mfn,=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0)) =3D=3D 0
>>>>>> )=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
((st) ?
>>>>>> (gt)->arch.status_gfn=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 : (gt)->arch.shared_gfn)[idx] =3D
>>>>>> (gfn);=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> - rc_; \
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (!gfn_eq(ogfn, INVALID_G=
FN) && !gfn_eq(ogfn,
>>>>>> gfn))=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ? guest_physmap_re=
move_page((gt)->domain, ogfn, mfn,
>>>>>> 0)=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 :
>>>>>> 0;=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>>>> Given that we are implementing something similar to an M2P, I was
>>>>> expecting the implementation to be pretty much the same as the x86
>>>>> helper.
>>>>>
>>>>> Would you be able to outline why it is different?
>>>> Being honest, I didn't think about it so far.=C2=A0 But, I agree with =
the
>>>> question.
>>>>
>>>> It feels to me that Arm variant can now behave as x86 one (as
>>>> xenmem_add_to_physmap_one() now checks for the prior mapping), I mean =
to
>>>> use INVALID_GFN as an indication to remove a page.
>>>>
>>>> What do you think?
>>> I will defer that to Jan.
>>>
>>> Jan, IIRC you were the one introducing the call to
>>> guest_physmap_remove_page(). Do you remember why the difference between
>>> x86 and Arm were necessary?
>> The code was different before, and Arm's behavior was also different.
>> Hence the two functions couldn't be quite similar. If Arm behavior is
>> now converging with x86'es, the functions becoming more similar is
>> not entirely unexpected.
>=20
> If Arm's gnttab_set_frame_gfn appears to be the similar to x86's one,=20
> what would be the next step?
>=20
> I thought of the following options:
>=20
> 1. Leave per-arch helpers as they are
> 2. Move helper to the common grant_table.h
> 3. Remove the helpers, call guest_physmap_remove_page() directly from=20
> the common grant_table.c

Well, "similar" is not enough for 2 or 3, but if they end up identical,
then I guess 3 is the way to go unless we foresee e.g. RISC-V wanting
something different. But this would be a separate change, so the
similarity level of the two implementations can actually be easily
seen during review (or later when doing archaeology).

Jan


