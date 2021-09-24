Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 085D0416D1B
	for <lists+xen-devel@lfdr.de>; Fri, 24 Sep 2021 09:49:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.194987.347424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTfxZ-00074n-CR; Fri, 24 Sep 2021 07:49:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 194987.347424; Fri, 24 Sep 2021 07:49:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTfxZ-000721-9S; Fri, 24 Sep 2021 07:49:29 +0000
Received: by outflank-mailman (input) for mailman id 194987;
 Fri, 24 Sep 2021 07:49:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wINm=OO=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mTfxY-00071v-DR
 for xen-devel@lists.xenproject.org; Fri, 24 Sep 2021 07:49:28 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8262cc89-d26e-4d6b-8bf7-2ecf592eff9f;
 Fri, 24 Sep 2021 07:49:27 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2174.outbound.protection.outlook.com [104.47.17.174])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-16-Nu6-gG0JOfWQ6jNbHziwIA-1; Fri, 24 Sep 2021 09:49:25 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Fri, 24 Sep
 2021 07:49:22 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4544.018; Fri, 24 Sep 2021
 07:49:22 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR3P193CA0039.EURP193.PROD.OUTLOOK.COM (2603:10a6:102:51::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Fri, 24 Sep 2021 07:49:21 +0000
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
X-Inumbo-ID: 8262cc89-d26e-4d6b-8bf7-2ecf592eff9f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632469766;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p8uCJz+MYkeuLo/efHyUcBQn4gVf/Twqd4VF2Bc6Q0U=;
	b=WfC+blyvELkp8k2OhIEp7rf5zy/MxJb9IjIn90Z8j77TmAwUFudG3/ax7fNCC5bnPBgxIs
	EKo5JWO97EUpgLQB/f4XKYZyKr+/JMlLA2lgE6CkqlZyZQEKoSwiWnBxVSnJPASBcCcj7V
	e35pr1+bKBQPEq6LZ/yPSqHQE77xDZI=
X-MC-Unique: Nu6-gG0JOfWQ6jNbHziwIA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMoLHdhLLsuO/VvRCaUelXIBTTWXIerob24J3+9es9I85Vnu76j13M8fTvtpKbzoS9ut6onhwzRhJq52JQN9hlpVbogOSTh+p+Y2InrbCICy0mGQl3l+bshpGUHAzm6yJimkPh+mxi2xu4bDuQTsg3tN+Wy3Jxqb39DsAPVTMzV/4sClltDhWXsnjDb5M8SeezFjnqu6h31b47WdDti8nbnTUqaz1VxPY960tN8ieCDwcEKWDMbrX6bJq//8CkjYsCl+nqoCmff5WjtUM0XXlSpwv/M/dJA2ya6pE3A0Ku3gU9TljBoXu/U2PHgUFlyo6gY9y5d/i052KOjTc5mbEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=T07ergxdZj5ReZ6Vn90qMN6EcVeBJ/TX1/I/NHLmnFc=;
 b=aZnl/eY094kJuPsrwvW9MJwc5cgGxhC97WPsDkLQUUa4tFHejJcPkILmeaX6moJnjM9YGy4EDuD3TsqtIhO5Ar5KPwUjnj3R28gWlaslmLRY9YTKRklMC5X3JKHStT0cmHtGjXS+bJlvxkhWPdQh2wQmw1Z5MIJBUqMl3pEAP5ZbmJFYhwOHnQQJH0fxDsc6c8oo8PxxgEuRVQu/ZFazGeebnhPHgorPO3cuOet+4iq/V8n9VAOIEqJqUwOgNHVPpjgvyQV2Cu9swaZCK6vAZVXwMeUQUh8DgDp9TRvl2GOfCRHfWSDIy91T5tTifpJ0o/jebWQ2V7xuE39H4Zitmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 0/6] gnttab: add per-domain controls
To: Julien Grall <julien.grall.oss@gmail.com>
CC: xen-devel <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20210922082123.54374-1-roger.pau@citrix.com>
 <69208166-2356-cc8a-4e78-2ce8d6cddcac@xen.org>
 <YUr525A3B0cs2rBo@MacBook-Air-de-Roger.local>
 <b93a13e3-2ad9-aac4-7f87-b290aa4c3953@xen.org>
 <YUxi2DeEXhsnUTi7@MacBook-Air-de-Roger.local>
 <CAJ=z9a1MxDKg3pB0Qq2JvAfDJ6LHsSoYmg-m2Xotxi_EB1jb1g@mail.gmail.com>
 <d3a314ae-a2bb-58da-b98e-bc03a049bc1d@suse.com>
 <CAJ=z9a2gub_Dn6P3T2H05kwB6TUHf-y=rBvxcXpYaiGNrAXqyw@mail.gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <be9beaea-54ee-3f13-073b-fa069a0dc81a@suse.com>
Date: Fri, 24 Sep 2021 09:49:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <CAJ=z9a2gub_Dn6P3T2H05kwB6TUHf-y=rBvxcXpYaiGNrAXqyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PR3P193CA0039.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:102:51::14) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ae305402-d6a9-4425-29f6-08d97f2fd28f
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5167A2890BD217CA996EB8ECB3A49@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	UtC9vk1ALeqZFoLxWE5XVwkmlbYLJS9qhhmQhldMl3/trhmV3qj3mmWPxIVzQQ8x71sgNbiON7GOs2Jl/YXPr5rgq/PDzJ4TDclhDozpHhGutCx6haTg9/avsNJkaguOdwt+1bqkR7ygGahTCYsYZZ8jQ3mIhpC0Jrlnvc+yKJ5LLOmgAZd9WWxO/Ul6i7JG6ZYOsz8y+PjOF7nqiDaaELDSChgoDUNo/uANmtHV3VC1WxC6vAyQ48yy5uZPWUS6FvJozJJ0Q6oWWwfdoSZ2bDy8JrXgVdW0c/1QBbKWSYNdU3wmy9YcPeBFnpPf2WS+k03uFpf2jHI3lnxcSF3EiuxY8Gdpjwwc8Pt3bRuZGMY2QQx0V3W/lerrNLKYzYIqZl3ayVVE+A5TkGaJ9f94Tfd4lJjx7JtuLbbWHA0AxZwbKXYsTtRAAWQ19Q/jPhycXOFm6377+V1Xjob15JOJU+j1Bi33r46hkR0twEj6On/w5O1J6EdchYFBp0Uo3vqvr7YXWm1AgrUpZM3yNfzbaletk1K6yy/pWsrxp0jqoXl2W/Ymplrr4/E4+amwtPrCXA/Uooo8k3pIOYuIC1Jqd4lm2QuTQ8zWNOf60RlHYB2OZyhGP2YOPSb/Kj+0s9YrZM2uSu33mru1nhh6HKMLAStbX5Hx/JQHT5Yv1XdtwLFBONhlXiK43bEpSWcVMYBDmuGKwdBMnSZ6iL/Ht7sjEXAXm6/bbEobVw0pFaxjRQo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(83380400001)(316002)(956004)(2616005)(7416002)(6486002)(186003)(16576012)(6916009)(31686004)(66556008)(66476007)(66946007)(5660300002)(26005)(31696002)(54906003)(8676002)(38100700002)(2906002)(36756003)(8936002)(4326008)(53546011)(86362001)(508600001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zlW4X4REhhKiNE/MevjsvoC6/TK08qr9Ltr8frMiH0tqQxQ1QWqdH+HwN8u7?=
 =?us-ascii?Q?Eb3u+Y1zkus183hNdzNpIIcvQm2VPFLUSrs0DvPPeOVX+3fDBf6hZejaAJOe?=
 =?us-ascii?Q?0GgO+Wrspky3VhyesJKtorSQG6pt7Up310suTLZEDALumXXqEw+DDm1mjlYo?=
 =?us-ascii?Q?XjDOISbJXMBHyPFymVK99FUNF2HVznN3zBuPPLyYFrV+BxLObB0Rzd4wAqkM?=
 =?us-ascii?Q?eLIS7hzLxCfU+aq7BYXvrPrnlYKW1ubLasYNHnsy3HOwn/FePk8kOhRuFDTr?=
 =?us-ascii?Q?6mw3n8piZwG423o+/q2oV3+t5kODicQ/4Xm3hapkJVIfXmKAcu7wHy0ZDeey?=
 =?us-ascii?Q?IBIQc1/gcJ2DcPpJgs08esynTlTLNziSXiaClgm3vLCdBJtG7G48uzwhhNFp?=
 =?us-ascii?Q?4O4fbV/VYlrNa55WU/yKhT73iB29NatRSOw1gpIRgowizhTWkYy9Y9qND0Bw?=
 =?us-ascii?Q?e3IB1CCVUbzZKYGEOKYWIhu/IanugZ/ezHSzn9QshfWw0egUGbW1WGEb+haB?=
 =?us-ascii?Q?dFU34OV6G9DMZ0RVkVXd95T3kB/u8gJ9C0d6BoJm9laC2xPcOFjj2lp1yWL6?=
 =?us-ascii?Q?rl8tTXTImQNmPa4psNdGG5NQ86bRlC1HXDvg0Wp7q/KIT8m0qz6hkBJWV9yp?=
 =?us-ascii?Q?B0IK88D2X+5JOW7I1C2f0kvFndaqxOOQtd+xD2jVYtiEbyXTY5SVynST/qer?=
 =?us-ascii?Q?ZGKKJHnW8lyhOf8mebFsMSQ63/zMTKLs7kfNBzhf0QXmzHVsyRLGXeR0MT4U?=
 =?us-ascii?Q?+6bOTnjZImnAYPJ2VHoloVh7mrXbI0u4nwkNjAygzTjCPJO2C5VpQi+mEmR8?=
 =?us-ascii?Q?ApWFcCB/wVYFow3rn8eLy7Tt/AHO2Esw+AH5bXNNKqTP6S3J7Ij9ZuUaG8Qx?=
 =?us-ascii?Q?gLmj/VkUZzgW1ern9efay3TuU++lN4u+adGKLszVUgLNU/raMusTNcz76sn3?=
 =?us-ascii?Q?i+qyoVvdY73hjiFmb3S6QMHkbQyyFXPqxenlUuiwHN3tG8LWS2Ggdpo+kpVj?=
 =?us-ascii?Q?DE6+iC31iGKXGwApj185i8BG6DYIOMlBMVIwraZwtCoqVouydl49w4tSN7uZ?=
 =?us-ascii?Q?Ovv+XGrdzjmoTrIVFk88v4Kl3nnVR5249RQPx9dw8ImeHHZk7akLxcniRdP0?=
 =?us-ascii?Q?w+aJoV55rdcdBk7Gftfikas5uRExmDWCTuiDTdVlhzMVquEObWbzKTZUskRX?=
 =?us-ascii?Q?kfVUsYte1gEvvE8gEdC0GReuXfdVnH36gT86GoP+LO5fI5Wq06vCujabTlJo?=
 =?us-ascii?Q?r6qrj9/7owBEPhI1+w9aaiamiY3j0+LkaIRRujIs9STrMsMV6yTrEOZY2/Kz?=
 =?us-ascii?Q?l3hIyT426xrl7tiLLCgxUTgy?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae305402-d6a9-4425-29f6-08d97f2fd28f
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2021 07:49:22.3563
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zxxrXON+o8YMtMMd40xonpLCpGrsVJb+XQ7uCI+UDeRK3seVLXk1KFkmEdctoug7LfyV3tR/mdAeq5eRULeMSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

On 24.09.2021 09:30, Julien Grall wrote:
> On Fri, 24 Sep 2021, 11:21 Jan Beulich, <jbeulich@suse.com> wrote:
>> On 24.09.2021 04:30, Julien Grall wrote:
>>> On Thu, 23 Sep 2021, 16:20 Roger Pau Monn=C3=A9, <roger.pau@citrix.com>
>> wrote:
>>>> On Thu, Sep 23, 2021 at 01:47:37PM +0500, Julien Grall wrote:
>>>>> On 22/09/2021 14:39, Roger Pau Monn=C3=A9 wrote:
>>>>>> On Wed, Sep 22, 2021 at 01:57:02PM +0500, Julien Grall wrote:
>>>>>>> On 22/09/2021 13:21, Roger Pau Monne wrote:
>>>>>> But it's also arguable that a guest not having a grant table should
>>>>>> also likely prevent foreign mapping attempts. Plus such foreign
>>>>>> mapping won't work from stubdomains.
>>>>>
>>>>> There is another option: extend the acquire hypercall to allow
>> xenstored
>>>>> domain to map the xenstore interface. This would require more work, b=
ut
>>>> at
>>>>> least it would avoid the interesting dependency on the grant table.
>>>>
>>>> Xen isn't aware of the shared xenstore ring page currently, so that
>>>> would mean introducing more knowledge to the hypervisor that what's
>>>> strictly required IMO, as Xen has no business in knowing such details.
>>>>
>>>
>>> Well Xen already knows the page for HVM/PVH because the guest retrieve =
it
>>> through an HMV param.
>>
>> To be honest using this in such a way would feel like an abuse / layerin=
g
>> violation to me.
>>
>=20
> I can see how it can be seen like this. Do you have a better suggestion t=
o
> be able to map mapping without the foreign mapping interface and the gran=
t
> table?

Well, as was mentioned, PV would need covering anyway. And I think just
like with grants the guest should consent with such foreign mappings
outside of the "can map everything anyway" category. Hence I think if
such a capability is indeed needed/wanted, it ought to be the guest to
announce this page to Xen.

Jan


