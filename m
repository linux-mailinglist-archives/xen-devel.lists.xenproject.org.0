Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7BA42A5AB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Oct 2021 15:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.207186.362933 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maHnX-00067m-El; Tue, 12 Oct 2021 13:26:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 207186.362933; Tue, 12 Oct 2021 13:26:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1maHnX-00065P-BH; Tue, 12 Oct 2021 13:26:27 +0000
Received: by outflank-mailman (input) for mailman id 207186;
 Tue, 12 Oct 2021 13:26:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/4YK=PA=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1maHnV-00065J-RQ
 for xen-devel@lists.xenproject.org; Tue, 12 Oct 2021 13:26:25 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id fee2ed6c-2b5f-11ec-8128-12813bfff9fa;
 Tue, 12 Oct 2021 13:26:24 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur03lp2056.outbound.protection.outlook.com [104.47.10.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-1-hdrcOWgbN9qPkIOw4Dr4ow-2;
 Tue, 12 Oct 2021 15:26:22 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB2957.eurprd04.prod.outlook.com (2603:10a6:802:4::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25; Tue, 12 Oct
 2021 13:26:19 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4587.026; Tue, 12 Oct 2021
 13:26:19 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0101CA0022.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Tue, 12 Oct 2021 13:26:18 +0000
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
X-Inumbo-ID: fee2ed6c-2b5f-11ec-8128-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634045183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kMM+Wk8I0JSbqcSEVuP6xXOlW16RBO1J/1v5wqpoWLE=;
	b=A58c1lqurxaaNucg0QhTUDeUNBAwyq81HP9KxxAvtZv9eIZsZB1Z4SSPqOXAjBreTHev3G
	UTwucTJyIVd2jJwYJqqEwrzNwhOOYAWzsTraUoMbY1SYqfPL3uEaBGimHxigvqBpzhjnVV
	NvOUh1pA9gwJFfQ3lKumet94AG/i8ic=
X-MC-Unique: hdrcOWgbN9qPkIOw4Dr4ow-2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JFGf7RtcuwTxpn0yLtDNfcS5oHJLRkJpa0KCRGZcTRux8XksvZefduQO9l5vswZFQF2ucoPRgPWfDj8Ljprstx+oeFETpbVnP7CHxwH9Vk4fQGC+9tM9wH0TMbMV/YuVzhoY2eMufMNCqmk7BQPXLiGCLAbq+Gjj0kbWOmJTuIqi3bofaiTmP1ihIZN4+cPTw48tfUng+/2gORtQrQwzN7lerEimPJQPdffcnIuuGU8k+ETNKGD7tRJxC9OKB7YgAXT+hWtJUp11FGIy/pCROV/f2ATutepanbN9U/9I8zXP1ssT+rOptnnzBOzZgJ4gZ1Af1aYCLIIGOJkERMOp9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IToWpyt7AOU2OjtGOwE90l5w1WwgETQz987UHIC8epE=;
 b=GNzEwt1za7g2GhaZgNvknqImBrsuJYMTEu4agVzVFpXBsj5FLxwWnz/+Z1QxM+49U7OFc0+alwqZzRDiAHIWve/oXzv1ww14c4OkY0906K4uJcJ0KB2opFKYIjjJPCK4HUxEMa3ToA1/Bn2ddxR9mZpHZvmcRG3js42yARCMicqB5GrUP+v/HSQzqggs4mWRefq37C0GrdEhWkT8mTj7sNMTEcB+sbk4axUZryRisUTTgEa16T4aYRju/TtpQIxvRJBhhtFrvdhYR32vUMVOyS+GYOMOeKkJeOIkNx/NC0vxQ6n1n7XE8EwLY0DMYz5hs40T7JDlSJ//8OSux1rYhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH V6 1/2] xen/arm: Introduce gpaddr_bits field to struct
 xen_domctl_getdomaininfo
To: Oleksandr <olekstysh@gmail.com>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Juergen Gross
 <jgross@suse.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <1633974539-7380-1-git-send-email-olekstysh@gmail.com>
 <1633974539-7380-2-git-send-email-olekstysh@gmail.com>
 <1466e946-d247-2380-6d7d-cda405a2f255@suse.com>
 <68213f79-2cbc-e0cf-3181-bc487f0a5eff@gmail.com>
 <0e03fe6e-8236-fc7d-669f-98107f40e014@suse.com>
 <31f869a5-5788-74c7-c290-ce6797584e9e@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d2d0f5ef-09c8-a213-2667-828abce56e6f@suse.com>
Date: Tue, 12 Oct 2021 15:26:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <31f869a5-5788-74c7-c290-ce6797584e9e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0022.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::35) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5e14350d-6a60-4d58-7219-08d98d83e03d
X-MS-TrafficTypeDiagnostic: VI1PR04MB2957:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB2957CB6DCD7FC120C6CDD1ADB3B69@VI1PR04MB2957.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tZo6MIGAHb3olr7LjhRiTgr+vlfnFe8PU73KnEYYzUaQxpg3Ra/dbbUB6h/lnfUE2qW0A/085srpdzu5H6ypEO0bIv4FBTzIg/eQimPsaa1yFOhdUxgQ7P4ce9e+Vv4HxxWstiJ8YAFk98gkBrS2CGrzWUO6OHI82OB8ZONlrSXnva21xKGxujqtdZYp5bcTfV0wvD5BGOaLujFxo6I8F33/a/tDiCXIKg/ChG+UHsYeDX4mFHumc+Nt1GTrnyETLBccshnuDYVucMQN0kyGBpzQgFMvX5pSP3sNDuwdlDTfG4oXbUTvcUvFp+FrNUigXS3JMJ441LU70aBJyAGdYzypbeOV/uoH/6ULnAOUBrojy/4k3pC5rVRLwJivhX0WfA4L4csJs29NWYgklOJKRj3YqcDybdV0stmFZdIqVGzvqKr6KGuQI9+je+xSDitEE8D5ZVJrJ77tBtlahWZmuHd5HLE6HPrsw2H+qYX0qKs2D3D6EAIC71AA8xsmOvQ3r7Cx7d7+t89GKdYMoRWAPcFYpIToY1SYzWRscFnkQLw/1fPzV87913tzgaQXsZYU5Den4IAlBl/lJnRDG6CltIKZffTsD2PV8+f0QbC32vspVKOz0Ws4P06RoFqYqSF2APfSJyrmtRacVfirB0xU7/sxyvorgRrrR89vV9VBToAbdjM8ggvxih82QWuKy2VE1KsYQGU8qgNRmPkq2K99bw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(508600001)(956004)(5660300002)(66476007)(31686004)(7416002)(4326008)(36756003)(38100700002)(66946007)(86362001)(6486002)(53546011)(2906002)(2616005)(66556008)(186003)(8676002)(316002)(54906003)(8936002)(31696002)(6916009)(26005)(16576012)(83380400001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Tq+ok4o1p99fs/yA8Or7rj7G07Q9X/AqxjcA90zgVMbB3h9L4HutVeN2YT8H?=
 =?us-ascii?Q?IkJC6jY4e1KVLUGkbK+zeyeqwxjwYxYoOBVLg5b4yePTWoht6HExgU68g6nx?=
 =?us-ascii?Q?BgmLebLkwGeXCJ428Jt0AZFHnYR/rn7tfDodvQeVFP1oNfwypAHNNgIokLG5?=
 =?us-ascii?Q?pJrJ0d/x7FI7je70LOeo3ZC0D7ULDeDebwLBmsEw352Iq0DMhBZMzu3b1UXz?=
 =?us-ascii?Q?ObpcEpbsY1aYbhOi2EyPfI3AqDLSoyHOXJwruVZOM3e8QdE4XxlHNlbKjeKF?=
 =?us-ascii?Q?qTBuk3A1oV40IqtycKQYMV9FfDIH3Y41U67AcR7CXjGl+bXZMrS5zKwPXISI?=
 =?us-ascii?Q?p/hqExT1mqS9lorTnrM4c/Mb6oKHPN3Ys+TrURb/28CR3fA7lAd1TBUBzf1E?=
 =?us-ascii?Q?FNygj9ryb/9BQ09rvXwxA9/zK6LoE5Dxg51tlJS59kLu/QTGeddqU5skw0TC?=
 =?us-ascii?Q?P+T69OeZEZPNdaqnbqTH6ZNDi/9pmzzMf5/K0kz3w9nC7s+2eFprpUyXPxUI?=
 =?us-ascii?Q?L9jEv2mpUDK+cH3aJXib7bI6d2ChLyetx1agKGGIou9KLePsgdlvV45rISgK?=
 =?us-ascii?Q?F8giHkikgdJDq+TuUWowx5KpuXxpbQghlwgs0yF/382iWGfDrNvQI13b1q18?=
 =?us-ascii?Q?VTemXfYj74TDEUJvwhMB4XZnUd5Rx/BuoF0BueED7SpR/paTfvPv0AP+SELO?=
 =?us-ascii?Q?avju7Ief9ZNyUNlnAtSPjm+BMru3awACtLzf0YTTtlFVAjPffJsY4psGMSqj?=
 =?us-ascii?Q?Sl4z6GRI9ync/gk+4l+YolCMjY/yUUdH38TCq1BuA38ZB2jO6TpD0f/nWIce?=
 =?us-ascii?Q?XgnIzjBr+axkdPjmfanonrVM+LDYJUQycouGX9wmOAbHcaA+VA31VQ3F9NIR?=
 =?us-ascii?Q?NFpZiazt7cMFRtjFLDBZpjIfnZTmTOpsFfzT4M2ZYRFUVZYQHRPlp7t0+YbN?=
 =?us-ascii?Q?nUk2DgPQ977KK0ApwfDcg90gJLJl0sQ3HXNNTSPtjtULLIPqSpBKnIjEZfKe?=
 =?us-ascii?Q?dM5UN4fz41yVOnKYo/v0++9bFbvWYbS6jnoYC8ss/pRNlLZY5WCtF4Ok4WVV?=
 =?us-ascii?Q?Rk7gR9f1v8CsQ20/h06xJXGS0SSmJIeTXqjen8/cJ6EKNqSo7flC9DiPEBYP?=
 =?us-ascii?Q?dV5/zqKLhIaxY87sWAjpwusAW1qQZjHTPLrR09jFZu01My54SpU28ZOwUIYA?=
 =?us-ascii?Q?cR40vz63pczOz9SKstI4Y0jKJBGY3ejYTTdYOcT0CLc7kqI6NGUDT7ECb/HJ?=
 =?us-ascii?Q?sbhhANImU31FoZerLrhEg7aJC7JpJwwIVK3KGuQ0YzMnaio3l5d2Ymb2UjvS?=
 =?us-ascii?Q?Ps3Mbguy1whwqtIA90YCYEqJ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e14350d-6a60-4d58-7219-08d98d83e03d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2021 13:26:19.3960
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FAm/1sUOWt+aVUW1IQEmTyJa7r5+72yOguEKhnI628jYuTU2+VPscfDgdYro19GC1pitTBo98iOBuUALEXYn4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB2957

On 12.10.2021 15:18, Oleksandr wrote:
> On 12.10.21 14:49, Jan Beulich wrote:
>> On 12.10.2021 13:28, Oleksandr wrote:
>>> On 12.10.21 12:24, Jan Beulich wrote:
>>>> On 11.10.2021 19:48, Oleksandr Tyshchenko wrote:
>>>>> @@ -150,6 +150,7 @@ struct xen_domctl_getdomaininfo {
>>>>>        uint32_t ssidref;
>>>>>        xen_domain_handle_t handle;
>>>>>        uint32_t cpupool;
>>>>> +    uint8_t gpaddr_bits; /* Guest physical address space size. */
>>>>>        struct xen_arch_domainconfig arch_config;
>>>> On the basis of the above, please add uint8_t pad[3] (or perhaps
>>>> better pad[7] to be independent of the present
>>>> alignof(struct xen_arch_domainconfig) =3D=3D 4) and make sure the
>>>> array will always be zero-filled, such that the padding space can
>>>> subsequently be assigned a purpose without needing to bump the
>>>> interface version(s) again.
>>> ok, will do.
>>>
>>>
>>>> Right now the sysctl caller of getdomaininfo() clears the full
>>>> structure (albeit only once, so stale / inapplicable data might get
>>>> reported for higher numbered domains if any field was filled only
>>>> in certain cases), while the domctl one doesn't. Maybe it would be
>>>> best looking forward if the domctl path also cleared the full buffer
>>>> up front, or if the clearing was moved into the function. (In the
>>>> latter case some writes of zeros into the struct could be eliminated
>>>> in return.)
>>> Well, I would be OK either way, with a little preference for the latter=
.
>>>
>>> Is it close to what you meant?
>> Yes, just that ...
>>
>>> --- a/xen/common/domctl.c
>>> +++ b/xen/common/domctl.c
>>> @@ -69,10 +69,10 @@ void getdomaininfo(struct domain *d, struct
>>> xen_domctl_getdomaininfo *info)
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 int flags =3D XEN_DOMINF_blocked;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 struct vcpu_runstate_info runstate;
>>>
>>> +=C2=A0=C2=A0=C2=A0 memset(info, 0, sizeof(*info));
>>> +
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 info->domain =3D d->domain_id;
>>>   =C2=A0=C2=A0=C2=A0=C2=A0 info->max_vcpu_id =3D XEN_INVALID_MAX_VCPU_I=
D;
>>> -=C2=A0=C2=A0=C2=A0 info->nr_online_vcpus =3D 0;
>>> -=C2=A0=C2=A0=C2=A0 info->ssidref =3D 0;
>> ... there are a few more "... =3D 0" further down iirc.
>=20
> I didn't spot anything except "info->flags =3D ..." which probably can no=
w=20
> be converted into "info->flags |=3D ..."

Oh, I guess you're right: I've been looking at my own tree, with
"paged_pages field is MEM_PAGING-only" and "shr_pages field is
MEM_SHARING-only" already applied. These sadly are still waiting
to go in, as they depend on earlier patches in their series.

Jan


