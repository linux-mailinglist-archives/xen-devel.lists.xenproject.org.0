Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC474C414C
	for <lists+xen-devel@lfdr.de>; Fri, 25 Feb 2022 10:24:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.278928.476352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWpk-0007Ml-7w; Fri, 25 Feb 2022 09:24:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 278928.476352; Fri, 25 Feb 2022 09:24:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nNWpk-0007KL-4x; Fri, 25 Feb 2022 09:24:16 +0000
Received: by outflank-mailman (input) for mailman id 278928;
 Fri, 25 Feb 2022 09:24:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RDkG=TI=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nNWpi-0007KF-KB
 for xen-devel@lists.xenproject.org; Fri, 25 Feb 2022 09:24:14 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b190b7e8-961c-11ec-8eb8-a37418f5ba1a;
 Fri, 25 Feb 2022 10:24:12 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2110.outbound.protection.outlook.com [104.47.18.110]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-22-_OZx9afaNg2i1ziCCeO9pw-1; Fri, 25 Feb 2022 10:24:11 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB5778.eurprd04.prod.outlook.com (2603:10a6:208:133::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Fri, 25 Feb
 2022 09:24:10 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5017.025; Fri, 25 Feb 2022
 09:24:10 +0000
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
X-Inumbo-ID: b190b7e8-961c-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1645781052;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8y74vp+z9psfLiuDEpwZUnEeuw8kGNyBqdnHkkA7Pxg=;
	b=Sog18XyVdFM1fVYlwj8qDF6aOirrX6MAc1N96R/I5pPT/FRSyHof9VByMBXrkWFmkmDBg8
	daAc13aeyrZlSU9goDBZNH52Sz9COc4/tOupxghzv1KbvigdHV2xpVwo/dtXqSwLQIj1q5
	goewieLcvOri07+BKI37lur6+DERO10=
X-MC-Unique: _OZx9afaNg2i1ziCCeO9pw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GT7+TzpRkI48eP1VQ8fC2Ih8YTcAVhJzj3hGk3h5VporWEzE8oVpIW8i6VYlEIsozFDs7oHs0LyAwQwLqYZTVC0Q0F5PyeE1bN/RnNu2c7Lrl7UMocmqnTyg9WBlundGJ+m6N+RDYrSZ7bOSU4KcDhe/id4wtiguPcOfO+b4KG3nzBAgJjhTgomsGds+DITQxZ9W3g0gTi91M8wwtLVgPgt/zL27/nWiF65g7OitF/h8MI2DZACvp0DdQqTmt0bRaNcPbR28NFAw4HC091araoC60+rcNVQGirA/Y7fTf2now+Nt9O9UUH7Yx1dkPP18S3UksNZDEiIN199IjYN1Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHWYKZ9o0K97kUOYCXLO7HOm1sIUmATcrVHMotVnOP4=;
 b=N/2rkqEhuXFp8Nrn+i+XFcudZSbSEvnOiXHXLAJOD4D9SYe144F3Rqn81Wz8bfxz+MhDHkkbWd01ZLmAnxMBKEnoI8TQ8CX5Inixunl009aOzG8tliiwp6/xCiO78q+xozUNEUCWi9xRZ5niRhDn3YpCdOi8TgI2Nl8xXXdVfgzDGB3vW+H9tkg4HP5F7QrzyjbGx75AG1vjKTJSuzighUUXPxTtERx1uqyrtmU8o0ePf6hVXiislvOuSxaHPJlDZnuvDsoOxdyJMndk35evTXFQcs58/UfNVkdRTqMqwRB8W63HrPGSriDl6Poxld1cFadaw+rtTUuIepxBvjYN9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <1f848da5-7f02-e380-a616-bff785520a90@suse.com>
Date: Fri, 25 Feb 2022 10:24:08 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH 2/2] xen/spinlock: merge recurse_cpu and debug.cpu fields
 in struct spinlock
Content-Language: en-US
To: Juergen Gross <jgross@suse.com>
CC: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <20220224105436.1480-1-jgross@suse.com>
 <20220224105436.1480-3-jgross@suse.com>
 <15e71984-37db-c6c2-5feb-05c8f1ad85f7@suse.com>
 <05a26a5d-8597-84c6-171c-2751987b7836@suse.com>
 <bb003355-1a2c-8145-e227-3799f782a099@suse.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bb003355-1a2c-8145-e227-3799f782a099@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR07CA0045.eurprd07.prod.outlook.com
 (2603:10a6:20b:459::16) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3598acff-eff3-41bf-ed7e-08d9f840944c
X-MS-TrafficTypeDiagnostic: AM0PR04MB5778:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB57781A0585EFDBF63E52D067B33E9@AM0PR04MB5778.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	TjkvKhqZ2SdTzvo4ki2dZmlDx9J50+8TikT4o+JmyVF/gFGTrsYOiDcEWV2mOIVyTf0nwZLB+MNoMHNn6m12NuPw8j2PS9/9Z8LK4HqdrsVxy+Hysa8cwW4ciQv0JVv8D/oc16SKsX1OWqSLybdGgRwZTL+y+bJHMZ/WLj478AFc3IC5KRu5zQ67HREr4enkxnZqf8QG4TSgS0NOS62Wordy5u/dSNTmdJto+zDYU7DB77Z/YxlFkNa5tyS7Bc5em7ZKOKBP5YkmuYD12a6/UZPVFTYtewcnIX473guA5nY/BoexId1Idw3vMvBLpQPOTskeScjh3bBP7rwqdu5K1RdYiZBz3dNLVo1IhcJUX8irE/3f9S2kj6/yVM1Gdwj5D94Yn4Vw5l2O4s58mI0DEMNvLj/EaRBAdgKx/TODjgm/bD4l5pSGE/EbFv8t+THICmO/heY0nRDj+MVP5hSU2HI/xagxBGpXIKQHwF2IVFRWBr0odbEjwp4qLzTo1m24vfA+l7vJO+Uvg66YIP/4QoxJqJvnx+1LgakCz/5AIyGIz7bikA0ItXgqyuobD/dOCzTSySKNST1KPbWv9hGc0vRHsDBE3BDM7W1ktlOhz8/yzW0Q6Din99nf5UkJ8ICRPTvcRaKQckSXczRB50AD9+v+gSIDf/qK5fVq+mUbB63+bh5IQ2GuNOFeYxiKyjvtbUfxFNWmEYyFWViFaLnHJJtDS7ZEFP11Yz6di1nCHrG4WiDA++sZpNcjJ06UsB7+
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(66946007)(66476007)(8936002)(5660300002)(31686004)(6862004)(53546011)(316002)(37006003)(8676002)(4326008)(66556008)(54906003)(2906002)(6636002)(6486002)(508600001)(36756003)(6506007)(6512007)(83380400001)(31696002)(38100700002)(2616005)(26005)(86362001)(186003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4af5jNj/mOPQd5htNCxQnrwaDYz0Kw49AKDk/f3g9EUC+ahCAJq45rni3TF6?=
 =?us-ascii?Q?o9sLuuzZ/bRCN2b4ZZgmDbiP6p84P6MoB1J26v0tEmkP6CDi39box2Dd3sVF?=
 =?us-ascii?Q?oaFFWmR1Kf1Eg2DhvUuvKflBism6oljFCL3OTK7VjFTPC8VNB8GFY7nNsKwy?=
 =?us-ascii?Q?pUg8XYNcdrl2S1ezVp239y5FGvj4LwmK8NHiTnrCs0awLHmFLY8x6m6QHZni?=
 =?us-ascii?Q?QqcKiSDo34ivcsaKvpQzD1w+3cP9EH94gKuMbYw+3eR6hXvT90Hz6E19NwzG?=
 =?us-ascii?Q?U1e8hU4JiVYzMV0YjXHhMbB0J1BCxZ5LsWpv/lJPRcI579BoBI5szRK9wbkt?=
 =?us-ascii?Q?ZthUN8r2IAoK9zUpE+0hZ4wCTqNS2Nr42buXvIv4cAq7616ElKcUgMnQAqh4?=
 =?us-ascii?Q?1QBs0JEUI28eo/joDZ5zT/cnIO/iLpv84NkZDLnWcVJ2ewZU1FBm6DJLd3zW?=
 =?us-ascii?Q?fw0xd0UMwbdSPfUu3Ms/XckmeCqosXj5KQkkG2TseIv568WUE+sGiPz7Ssyd?=
 =?us-ascii?Q?U5PZ1hNI8M+jlvUuQ5rXJxnBizZKOh1rLpGBEEcd0T8BlP7l2FlAigZGLXiQ?=
 =?us-ascii?Q?CInLmYhR7dAUVuxGl9pqz9ohs2wVqkt4EJDuQnhTjOXZ95uut7tYloot/Rf5?=
 =?us-ascii?Q?kio18UO7pR0dpIpacYE7A+/nPMrk8i8460MM6M0XGRh/mFJiRUEchXVGrz72?=
 =?us-ascii?Q?D3jAHyUt1Q8BVDe1GVrnviHsfUmmkagCUca/PNFgO/lf4G0qhqZKn/2Wphv3?=
 =?us-ascii?Q?FIFzv6XnguTRtXlR3to81sSsItJvZnKHrpcqq6ErH7el/eHOQqRBTs3TH1MM?=
 =?us-ascii?Q?eM8UG3Lf/tTWHggiy3TkIX7xByk5RpMr++oHw2Gvhvoo7b8Bl7RUDgyerSXE?=
 =?us-ascii?Q?FYnlmxGYhI0r1y8RhvtH9Q6Gjt+HyrvG3NFfKQDk1dKZ4tKpN4QleIsx7D+U?=
 =?us-ascii?Q?IFQs7UXsl4vAo84mIjMKO0KZfvitbRQpEDPGCCsl0i+QEGrv0fQNwqzLLsNs?=
 =?us-ascii?Q?hzSY1MJiwZ4zGqUmtugUcwaipHhvGOQmYEy6jRb1CicKK8eRzgk4xkqjSLGu?=
 =?us-ascii?Q?yEwILLdgOZAdo86wSGE3wN/mHaVnJvl4jg6gGT1HSyfhawTDx0f5+akkFJxW?=
 =?us-ascii?Q?Mjj/2dcS1eQ+G8rHqn8Z+uiDLLCb3wutgO8DweoUVPw5BQYGjWQtY5qd2Kae?=
 =?us-ascii?Q?B/CWBgHvNxXfPlbRb5rwgAbPOota5z9O76xY9yyrTaEv4a88tKLSK2IUY/gB?=
 =?us-ascii?Q?rNg+JYVjWbuHMnAWiW7Fqm1elq5cTd/lW5QkcELaQMZOf4WHAKM8isJKjNSv?=
 =?us-ascii?Q?tobLineHOxSrHC4v3co/xsOSCuUKAQLL3l/Ycs3ZvZlAbpGqHziqMrdOIzRz?=
 =?us-ascii?Q?MC3OUcMTbLtFPXlU40yXi9TiprwlejY1I5zy6hGctteCnje3zmsLZnNr8TWw?=
 =?us-ascii?Q?hTzwaySfo1zAGKXDWUUbq+J4iZLL1QrEm71NgHkRPOzDP0IwrfbhaqOlG01n?=
 =?us-ascii?Q?rQhnCF9ZfHvykAb57SzVvgxy6aj3bsVep4Ft73u1wpiCrE5SebTnjetUOhWJ?=
 =?us-ascii?Q?4WTM9jx9uG0sjxDwxeVXhfeHnHoMDSUWotPm5Nz6PiMc8ASUSYdZZNlUytAS?=
 =?us-ascii?Q?8DVCXT8AemkK1nE3kUnrVJU=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3598acff-eff3-41bf-ed7e-08d9f840944c
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2022 09:24:10.1019
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zWgMJFYbX6xbCGA2F+InvUR4IDabXmij8XEW2sO3dRobsd/nyRmL/Hx/FScaW3Hi07hxQtpei1vrQk5l++dCiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5778

On 25.02.2022 09:55, Juergen Gross wrote:
> On 25.02.22 09:36, Juergen Gross wrote:
>> On 24.02.22 17:11, Jan Beulich wrote:
>>> On 24.02.2022 11:54, Juergen Gross wrote:
>>>> --- a/xen/arch/x86/mm/mm-locks.h
>>>> +++ b/xen/arch/x86/mm/mm-locks.h
>>>> @@ -42,7 +42,7 @@ static inline void mm_lock_init(mm_lock_t *l)
>>>> =C2=A0 static inline bool mm_locked_by_me(const mm_lock_t *l)
>>>> =C2=A0 {
>>>> -=C2=A0=C2=A0=C2=A0 return (l->lock.recurse_cpu =3D=3D current->proces=
sor);
>>>> +=C2=A0=C2=A0=C2=A0 return (l->lock.data.cpu =3D=3D current->processor=
);
>>>> =C2=A0 }
>>>
>>> I see a fair risk with this: Behavior will now differ between debug and
>>> non-debug builds. E.g. a livelock because of trying to acquire the same
>>> lock again would not be noticed in a debug build if the acquire is
>>> conditional upon this function's return value. I think this is the main
>>> reason behind having two separate field, despite the apparent redundanc=
y.
>>
>> You are aware that mm_locked_by_me() is used for recursive spinlocks
>> only?
>=20
> BTW, it might make sense to add another bool for the debug case to mark
> recursive lock usage. I don't think anything good can come from using a
> lock in both modes (recursive and non-recursive).

But beware of the coexisting paging_lock() and paging_lock_recursive().
Albeit I guess your comment was for spinlocks in general, not the
mm-lock machinery. Yet mentioning this reminds me of the page alloc
lock, which different paths acquire in different ways. So the bit
couldn't be a sticky one.

Jan


