Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A96E53244D
	for <lists+xen-devel@lfdr.de>; Tue, 24 May 2022 09:42:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336237.560600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPB3-0006Y4-8P; Tue, 24 May 2022 07:42:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336237.560600; Tue, 24 May 2022 07:42:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntPB2-0006Pk-Gj; Tue, 24 May 2022 07:42:00 +0000
Received: by outflank-mailman (input) for mailman id 336237;
 Tue, 24 May 2022 07:41:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7Xn0=WA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ntP65-0003DA-PM
 for xen-devel@lists.xenproject.org; Tue, 24 May 2022 07:36:53 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43e1c0ab-db28-11ec-837e-e5687231ffcc;
 Tue, 24 May 2022 08:10:52 +0200 (CEST)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2056.outbound.protection.outlook.com [104.47.12.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-iegNRE-0OPed9pyZqiSXbg-1; Tue, 24 May 2022 08:10:50 +0200
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM6PR04MB4278.eurprd04.prod.outlook.com (2603:10a6:209:4f::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Tue, 24 May
 2022 06:10:48 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::91b8:8f7f:61ac:cc9b%7]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 06:10:48 +0000
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
X-Inumbo-ID: 43e1c0ab-db28-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1653372652;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Oiiin2fQMQS4EZaMXnr26yzo2cSHCgsSDTPD0QPCSl8=;
	b=Bn1O0knBK5upumSLzryL05ND6tR8QiXUCl5X9/czxU/rjFD0tABxyASe3ze+8kqhZx2zKl
	KSbBr/jB+1YPTnlikl4+C0zGXqtn00ylcU/Mq3pTPrh1vFXQZbmFlyWhplbaxtU2G5qnp3
	zPzA33lWN0u5r31wGYsJdf/j4n50mcg=
X-MC-Unique: iegNRE-0OPed9pyZqiSXbg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SaqDKiA2sPpaCaFeWaVXkZ49ol+RWUsL8Hs3Sn5hvHBgm56SdDubJrhGm4n9WK6ysUSNEpxUiXxz7HFFZyCe76JrqYuzhvPBEQEGwwMPvu8RxYgyMwqeLo1RcnbHHsAXzZ11gouhl9dg68wrwn184A4oEqpAJppGF/DjTEmckFPevyhEGJMPwcbkSBQmgFFpsLc2Sdbop6faNffKYuKoMz2aWyZrM4/997vYMISyFrXVwB5hc2m61vWiy1pO/4XQVdhT+h9XQ4k2hfLVvg6hTeaZGQXs2yLP28bD+lmaIB9YiN6BHLqPeQtvIO4POHmQGZUnR0bjNxx0AKspuDfrsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tn4hMaJcCrqE7Eqs0AynlLT1KQMGQksU5uGKvluQd6k=;
 b=JZLdPjNzpgyaqKeg8DTg5J7RSBQ8PKLVwBOxZ7uEbQjCf871/IquIHDiuK/bR39PC0XT8E4oGixmUI6ii8f8zS9jcYtBzadWWii6v/OS6n+us5iEiYhyoi5t9Y6pdhqrSyGp/0Xi8kHiMWzM4eV7Cgbwnl7qWVzMqOPTf5RPquvLBh8Zz5VLmNyKgRQl/k9bwEtBE0pZ41iQVz7+duUnU8ASCDOGVaj7LoEHtCoX1eXmpS9hBmQhVq1G8V+hLdEUfuhWuKh1V22f/ZqY6vAfXF77XkVf5wNq+LPnjUcl+QHKkC/mcH10p4t3zLU5+BmU4dNlI9RcX0gMQuv+x+onDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <7312f3ee-bd0e-9183-922d-c9c82cd003db@suse.com>
Date: Tue, 24 May 2022 08:10:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 5/6] tools: Use new byteswap helper
Content-Language: en-US
To: =?UTF-8?B?TGluIExpdSDvvIjliJjmnpfvvIk=?= <lin.liu@citrix.com>
CC: Wei Liu <wl@xen.org>, Anthony Perard <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <cover.1653295437.git.lin.liu@citrix.com>
 <af1856e7606e948308919d0e66dcae3766318c6c.1653295437.git.lin.liu@citrix.com>
 <b800ac14-f8a8-0aac-32b8-b4fb3d7f25c9@suse.com>
 <SJ0PR03MB5405CF5CC73882FF523134C69DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <SJ0PR03MB5405CF5CC73882FF523134C69DD79@SJ0PR03MB5405.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0395.eurprd06.prod.outlook.com
 (2603:10a6:20b:461::30) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f68bce-ade7-498f-af04-08da3d4c2512
X-MS-TrafficTypeDiagnostic: AM6PR04MB4278:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<AM6PR04MB427848B48CA9C7C4E824A750B3D79@AM6PR04MB4278.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nYg26GWmj0rKjeGN3G/5BRYLpOQ0R3mHSi3WAMiPGZ73uB5CCNui6+UZiNMIPuDSfQTxXN1fAAkxQo2YdSJjSgWJBz6vDu8i2XoZR6sJlsnL/9SAItsvftS46fPOwYpFB//a908TNxy4DXCRrgEwtGOs7Ue9g22KF+fm/yIS84iBypFC9tA1uhSiWP2PO8dusfbdx9lmJokFIVzSRfGRdoZ2sQTDTwa99wrWcIR6wd3E4GFjmTBW1f0l/ObahUBnWFfI/iqF1TIkcYbfTnVqyrrJZMNUAjjYjDE4LnjhmWeZzk/6F/M6Wzy3NLYxP/Z3nVQVKn2xfvls5J5Q1gYakSBdz2lJuPvPq2UBcgIXLq94WKEG85Db70ssJxcn3B8SzHGqmDzng2N4GDyI29pNK5iFepgj1hEZyx9GwyxK9qoB+1YUbAHn7V6ZC/lZuyN40iXRAMMDl0l3YeE/82bkF+/48W5QvyZMyoldD1WZUbRuSx2auTDTRMqTIxgGI2juxQqu3FQN/Uo98nKWPcLS8cPp1JJ3WPvm49yFHZGA6xxI690QBlOGgcKKIwms2aHaC5tBzGYiTgKKvwYgZf3lQvNqS6+/zSg/OqrwltSRTPyNQ1ZBKWI2DLrY49UuNm1alOU0PRD8JQwdLsU72lql0N2RjlHp3swUulgWgBCndyqsH4OEPvQ9QIbvtp5Lz/cKq88I01O1vTImxWyDAXfUtj1J4i9YckzBH01JqcbxCKc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(38100700002)(4326008)(8676002)(66556008)(2906002)(6666004)(66946007)(54906003)(5660300002)(4744005)(66476007)(6916009)(8936002)(316002)(86362001)(31696002)(6512007)(6486002)(508600001)(26005)(6506007)(186003)(31686004)(53546011)(36756003)(2616005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Mh2XvWzYHSKpWAN+mn+8VvoHdPXuqe3DjOavlAIe+/DU4ABF6fFXYRxwdyDi?=
 =?us-ascii?Q?6ktUttdACP+rmRXh8pv4xDG3G0RxEHsN5Mf+2bLyW6AGuViPnIvGWzx8R4oJ?=
 =?us-ascii?Q?aq76A69RsnadDtMENpRvE9jYH8CFdffJC20iuM6GKWfB/ddh4MaS6pTQYkI7?=
 =?us-ascii?Q?itGT9lk3cITU9m3C6YiT2D32LGjyszT/OTMsWCIcaMxrRaUE7CTWt8a6ovsL?=
 =?us-ascii?Q?TcarrfGMal28lfehmduEvywE7kK6NpkAEMWJvwzs7CS5oSNv5xs/bGPByXuW?=
 =?us-ascii?Q?xnR8RL0TS1+DXtnfbq6Ih3RjntoSDBoiw7v/v54Lz3VSVRlTPF781pTZrRuM?=
 =?us-ascii?Q?s9QfhbEJPnf8/GCtNA+BPNvkdwW2PkWsAACPBzCH4QVFezNfGSAiwzDHnsbQ?=
 =?us-ascii?Q?TodRsfjGTRuG4fM1f0ERq5GWqct4yjFjoqU7fEmVmOT1TAl09JZF8z5V4kCx?=
 =?us-ascii?Q?yElHgeNdenvV4n5UvB1+yAiByk4Qg1Ts7V+NmtmvKCtGinBLL1gBbZs6UGYa?=
 =?us-ascii?Q?B8/2/Ca58rUYKSL4+q9EUnzl4nZGaz66ARFykV25EEUv9GPnggC/g+d1u1tU?=
 =?us-ascii?Q?OyyoBoyVy6tHzGYZpNE4u/f857wbPwmZTY4Q/QF/gWaEuKfhijdSKcE3+YAK?=
 =?us-ascii?Q?FB+IQZu4vXDknvyLIyadXLezzdFmNc770gpnmi7zX0VyUrh21xt+9vDZNuTO?=
 =?us-ascii?Q?Qd5uxf+GWDEwPWWwgXsLgs/lm4qbsn+tv/P7oWpuAzNhAVvY63y8EPdwqa1R?=
 =?us-ascii?Q?WXEDN8dS3+rApZRa8/CoLfA38xiZviSFqoOODbI6j4d0/49BjVMS6bSWbAEO?=
 =?us-ascii?Q?gpaSHhth12TkabYrgPyR1rEvJcE7qcaMxuNCHaFxbDYoF2J6omjyM7dRRx8j?=
 =?us-ascii?Q?DEyEvTAFhGMovLp/OmEX15zap0dzaHozLMPIO4/L7k4W0bX1mwWIT++QkY/4?=
 =?us-ascii?Q?Cwx6JBVqzKJ7WAFlz22tstUIo66fjQ7NwUHBJGrR4K1+UlWFzGnortE1TJuH?=
 =?us-ascii?Q?eRKxsi1zTknNnp04aVOXUekTiWeYbCNuopw+Rzi00ZjSX4YOqYv0lSAMCE9h?=
 =?us-ascii?Q?lcmtd1BBdIa6FYn7ABq2U4ZzGX31IcQAC0o4LqRDqppWSmE0mG/XPWu7gyMe?=
 =?us-ascii?Q?bcLbnPzUolPmowcwKurX58slpsvUiGj3/rHf7+64nJq/wf+eIllH9okvErIN?=
 =?us-ascii?Q?78BnoHJTEYUPGprPQ9DqS3rH4HzHCXOb8RNvD6PnQUYeR+JNG6U89v5pstwY?=
 =?us-ascii?Q?+Dg7qSQEWBZgLaaRjYnwvLcs/dO5Qnq6nyaNHlb0l3BZdp6EhSyC9FQNeOkg?=
 =?us-ascii?Q?LlzkQ1yDVDn67wmmnStj7b74sphf32WoN/eNeriQdF4ibk/K/SbgSydPReYT?=
 =?us-ascii?Q?tMdc5hvKR0IQFZ9+g8/cWmAPa6AZZrZyzznHSe5WR9wteW3NWtsJZya+FnSh?=
 =?us-ascii?Q?uOGs4vfInoIXyQNAaRBTJcv0L4wzY4K7ovOQWtjY8XyKb309GIH6LbzW05NF?=
 =?us-ascii?Q?Y+hwPxqEQX8JfzqdzJIoPfLgElhcIL8CC4kcgYirONdzEDWWMM9blJjRMggG?=
 =?us-ascii?Q?PZs0e3CfYJDGO6/ApguGGcpW+bT56xGpZcoTG9iPU3SRVs7AFavj4VwZtLkm?=
 =?us-ascii?Q?GIaafARkYIQ9MqzfTwKPvi+PkbSf/REBvXj5m/kfJ2MsxUyfd1Nj4QSuaybU?=
 =?us-ascii?Q?QIw8UnS0DrVV97ScZXUVq0RZs7t3lN1GpZtLDxup+ha6YPmQZc+nP3bsavVn?=
 =?us-ascii?Q?8Ozyw41ykA=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f68bce-ade7-498f-af04-08da3d4c2512
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 06:10:47.8574
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RTduTwkzk9GXn6ReCfp8lpbdtwc5Dww3r89+ApmGbVjV7DBUa71WfdEBkKfSXpSzeVQeCTHX0hXveQXZ6O/NsQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4278

On 24.05.2022 04:13, Lin Liu =EF=BC=88=E5=88=98=E6=9E=97=EF=BC=89 wrote:
> On 23.05.2022 11:52, Lin Liu wrote:
>>> --- a/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
>>> +++ b/tools/libs/guest/xg_dom_decompress_unsafe_xz.c
>>> @@ -34,6 +34,11 @@ static inline u32 le32_to_cpup(const u32 *p)
>>>        return cpu_to_le32(*p);
>>>  }
>>>
>>> +static inline u32 le32_to_cpu(u32 val)
>>> +{
>>> +   return le32_to_cpup((const u32 *)&val);
>>> +}
>>
>> Why the cast? And why not uint32_t?
>>
>> Jan
>=20
> le32_to_cpup has following prototye and definition
>=20
> static inline u32 le32_to_cpup(const u32 *p)
> {
>         return cpu_to_le32(*p);
> }
>=20
> xg_dom_decompress_unsafe_xz.c redefine and use u32, use u32 to keep consi=
stent
> typedef uint32_t u32;

This answers neither part of my question. For u32 vs uint32_t, please
also see ./CODING_STYLE.

Jan


