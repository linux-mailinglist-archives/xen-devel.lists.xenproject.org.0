Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C564CBC1A
	for <lists+xen-devel@lfdr.de>; Thu,  3 Mar 2022 12:05:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.283143.482064 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjFj-00085q-Mb; Thu, 03 Mar 2022 11:04:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 283143.482064; Thu, 03 Mar 2022 11:04:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nPjFj-000843-JQ; Thu, 03 Mar 2022 11:04:11 +0000
Received: by outflank-mailman (input) for mailman id 283143;
 Thu, 03 Mar 2022 11:04:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=NyQH=TO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nPjFh-00083x-Pm
 for xen-devel@lists.xenproject.org; Thu, 03 Mar 2022 11:04:09 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a5f935c3-9ae1-11ec-8eba-a37418f5ba1a;
 Thu, 03 Mar 2022 12:04:08 +0100 (CET)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2107.outbound.protection.outlook.com [104.47.18.107]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-M9Wxcii5MEOztNHGxsBUPA-1; Thu, 03 Mar 2022 12:04:07 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by DB6PR0401MB2455.eurprd04.prod.outlook.com (2603:10a6:4:35::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 11:04:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%6]) with mapi id 15.20.5038.014; Thu, 3 Mar 2022
 11:04:06 +0000
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
X-Inumbo-ID: a5f935c3-9ae1-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1646305448;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XmXTFrWdUllm8g3MIt3VacA2yLRY1bdn6RwakbM8HDY=;
	b=KomkxVwgVsTXylplK+3cQxNJTNid2rqjUwrsvbG6jnyj0NinyhRPYB5/ZMT4NlfmQ0ojxB
	z7YoScx+Um9cLUTTJzGHGG3MSui/KX0rqKGDjdMThI6k6MDLDz9A08sHi7sBG1GhrpsWwt
	3zzMapOoGEGgoncgrpy5TIJ6LW8v+VM=
X-MC-Unique: M9Wxcii5MEOztNHGxsBUPA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pg0nuAWBrv7vTrQRnlyvnSQXgOna1bc0LQ0fnJsNzjhLKUP0b8UTbRnDdGSQ7JtEJo3PY0v0Au3MLTS8lSAs/sBvi8aLLn2jnplPDgHm9BpT7LACHuq5kFQJBFXA6calnto6e8QIEVkjqZmiDjZVj69CAzKkzLjzC/rXcEurpA0ghRnYNHrH8YIGffmXyhwlqBt6rmX573j3Avm0FU3PYXjNCyaVFYpJAhx+1lmFjmvNTeBNu3A3ihOEO/Z0czSYQhdHUpmvByGJi4HCM1Tlar+4hfMfNqzpQrIvxkjaJnBj0vG8UVeGghlyNlETv6gQj2k+Tl2qyJGX6PjfZYcAJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FppL73j/xqsPUYy46Btn0R/6oKYrGNrgVQKpuFBJZkE=;
 b=nRXYRjMcYhajZobn7Xj067TmBjJeMEVabAobxmzsIzvblNu7+XeLYhasQ9VfR2pvJZZ6HH7l86kshsFoRyKAzJGQZDiVqiMKLIecMhBxsavphBT5NtVhDfMpB3ES3oA6aFStCsNHt+rVurU+q+5D2+ZdjRHmHPeb/3twLQ4935V5JREXbcP+7530mrAozm4OtPwFofALDuI4KiJj4gMwanNCrB6GX3NPodtfZ9LXsFtdTfydn763hvm7vQ3M42huZ7AloldH9lzFklNmCsOYFypd2ky/r4lgoJnsCXYA3FjY9NlTWyA8r2sINIwmUab3HGU7Yx9RmFeVl2jC0c/Omw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <3bbbe906-ca02-c748-23fe-7a98864cfb93@suse.com>
Date: Thu, 3 Mar 2022 12:04:04 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Subject: Re: [PATCH] x86/cmdline: Interpret 'vpmu' as a positive boolean
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20220302221157.17246-1-andrew.cooper3@citrix.com>
 <6ffbc025-758e-bb7e-4e87-0b6b9e1bc2e5@suse.com>
 <bd6dda42-fc33-5958-31e7-741853c85c9b@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <bd6dda42-fc33-5958-31e7-741853c85c9b@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0051.eurprd06.prod.outlook.com
 (2603:10a6:20b:463::22) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c869a825-b81b-4a79-57af-08d9fd05889a
X-MS-TrafficTypeDiagnostic: DB6PR0401MB2455:EE_
X-Microsoft-Antispam-PRVS:
	<DB6PR0401MB2455A6459961EDC8E24FD37EB3049@DB6PR0401MB2455.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	k8pTFY7IuIQUDzB+K+LBQMbv7zeGO//PlLBcTf3AJ/RYlS8svxzJrSycNtzQChhwlYVZvFgiqGSuKq8cZaHe7x5uiHepjjxmMV7C5QCk8S5urUPx1YcloBo+HFsmyyI0W2fo+oWnf6ogj0r8w+Cl7VbPKoNN1ZDRNnVmSoJQi0Qtfiw8BluB088KCBhufM8YReGB8TKXh9UpPk6abjU+wHB/2J+h31T16pmDsNWjzOxdu9/G4ad4UPmoNYeinq2tAxxkHPRSf4F2uF2Inyvv7vk+1vafpNu13RVjd0JPNpxgL7DRSF+regm7iweR8cTwvfWcmWuU/4xSIE3a/nSjgFuI4lCunRPjn5Q6FTbWPyVjzL7N+s/Xtkdag2Ytn/n4p3hZyrSELIojBiZNy5nkRllsu+cJZBZdrzP5S4EsCpOv4f9yejAiPsVNY9yLMw7LE7IQKHPChnkLTqNgxgKMZJxXQR9n7moQomMV0fuLgVK/TeACPHd4kjw93dY0dKL44FfCY6nwP7W1u6RaS1wixOI2P1cHB6I4zb0Wcmo1mM8N8+DS80et3L27Q2xSJLUlMHM3QaafLVN8SDGbI2A6QBTXeFWYtovsyULJ5QLitvRYQUKV8QN5j6SJ7usnhCIsQ/kWJJNbT7cjXzoYOP3/4SULtyUHxkrEN+NCp0frkJbYjmqHnAg8pxDhRuh3XCKGF8igE5Kow0J/SbTvo5l3yu+z7c2DUXZ8I65KaA0Ox2A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(316002)(6916009)(2906002)(83380400001)(36756003)(66556008)(66946007)(66476007)(54906003)(5660300002)(31686004)(4326008)(8676002)(8936002)(6486002)(6512007)(6506007)(53546011)(2616005)(186003)(26005)(508600001)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ikP2L9YHZCKvn/t0LZNMy+vYvBdyNTvlWKy4zMrvXgNEuKzFECEIZw2KfOqw?=
 =?us-ascii?Q?Upo5apIZJeJQRBXrokEQbT5CSL8DuA0hosGSiANsfT7IhwqkcgQpn9vIc4Az?=
 =?us-ascii?Q?eeilgrW3jgo/Bia6oRkyEICQvyd7d7PS7qyQ7M3ZJCrybiIetcUwacHm10yu?=
 =?us-ascii?Q?0h3Y5NhK9+WVwP/W2zO+FKIb3lACgeFFP+bQcD5e+BoCTheHo6a88Dbf8GOY?=
 =?us-ascii?Q?ZpeflPg7uacclZWsr+0LTIdVxBRvMwkY2a8LPpKvexhuX7Alvtw9Blug0NeW?=
 =?us-ascii?Q?p/kMz4DINxBsxMtrPOOJ1DxS9roX5QLZyBqMup1WEinpYixGdvBlc/S7jfwn?=
 =?us-ascii?Q?bQpIOM7Nw64he1mAiTDRzBNoXJSskubK2RhpdK8Y8+GTzFMlthiI2xaokXzj?=
 =?us-ascii?Q?uxzXPPj2h4tdT5goB6WwPdhEu86qDuW6CC4C8mWcw1OHFMbaI2Zb3l2uKqHZ?=
 =?us-ascii?Q?jGvG0bvh9cxojQZvSop8UMTRRFNyruc1qiBHS3ntHBwEiNWhNfgS3LxcQi0M?=
 =?us-ascii?Q?H1arXpvP84N0JECBFMmwz2PmCGPrqHy27CYu07HwR56xrD5JgMBnRvxdfEvY?=
 =?us-ascii?Q?jpveZWoYxxOZwl0v8tIG6uUjrqjlg725RPRExL6BEFy9KaRbXjo+o+u1BYcH?=
 =?us-ascii?Q?UEGOLrOaVAt2ZGuIWTy6dQmRQ/3qeWDW7/qSRT02cdVQ1dVBLkADYfwM48GE?=
 =?us-ascii?Q?UfDJv+SeVFz2QlBdLEyHTf3LgSb9BIKgq9MDgFUy0L4N2p9o/AZTESwRJzGe?=
 =?us-ascii?Q?zTR7GuPWEmzs5EX9oZrjWyYBX2941stShohNaRIEGrPt2JBiKgQAGDXfXp4W?=
 =?us-ascii?Q?WvhE4Hwy99WjMRkvc8/3VDkzH4/+OlY2p/omlHTUVVMgj/Ep/85Z2q7oKPyz?=
 =?us-ascii?Q?4SUSeCed7o6pUhGyAjJAq9yAx6duAvmbcreEn/sOuoOE8qLu88HGNzM29iBq?=
 =?us-ascii?Q?z1gvcx+jlrebbDQHp5yO5jrahuGM6+y4CkB9s34UEm0OrePuIS+SStrsYq2h?=
 =?us-ascii?Q?BtGc1dfM/McupILFXXbFrstfESfnfBoXB3eLKe6wW2ujLuu6XfOWydClHgO9?=
 =?us-ascii?Q?6YgrVsDhMySwPF0lOl4WUyaexMYlBxTBKczpipv6VxbNcV+bdnSEXwrIP07o?=
 =?us-ascii?Q?RtO0/4AH85UrM6hm5R71CHptRzoAvM4af4MbfAxwWUz3ckVbOSRG+8Xgqn/A?=
 =?us-ascii?Q?qVHnwAHc8OgRVgmPZdEUKJrabFIZGS/br2kEAROlh0Y6rv4/p6g0TnwWfUHf?=
 =?us-ascii?Q?hs/s637GvJCObzjItWH4F/jgWG/obJ7pUAi26d8lp3KFplBoxuU3gxw5vR+m?=
 =?us-ascii?Q?jP0aNagL3iIreHIHf2dPI7GgcL+JHfjPkCbwiX+pgP0m0JQbaAI1qAVrNyYS?=
 =?us-ascii?Q?9M6CanLAatCRdkG6zSffBg/CGxDQP4L9H8v5RaOVRK9+kk+y+s9y2Od2nbFW?=
 =?us-ascii?Q?GYW2Kbu+uFQKgopMrx39peiVM9W8yAFpqVXhwUo+jMnuUmtQwNvmtfO6L9l1?=
 =?us-ascii?Q?8AK+GYh5g89hUrkZi/Rj++plxpxA1Gd+bR81qP4hYs2lHKP9PH2DvZiMfwuD?=
 =?us-ascii?Q?AXhK4Evsn6xUAPuJXD50uPbrRfWG+dfPJ8jGXG9MbXU1iRui/Qog64Yh/tCb?=
 =?us-ascii?Q?6yuXBzVvbrZ4jZs3uJp0ciM=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c869a825-b81b-4a79-57af-08d9fd05889a
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 11:04:05.9834
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d97+5oCHGo7t/ybGhennxmpB3ct1p5ysmxrAH4jsBeRmqNIhLQfMvq+yBTlSz3tHJ4BEUNN27DHRvhkOU0cYyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0401MB2455

On 03.03.2022 11:48, Andrew Cooper wrote:
> On 03/03/2022 07:44, Jan Beulich wrote:
>> On 02.03.2022 23:11, Andrew Cooper wrote:
>>> This makes it behave slightly more like a regular boolean option.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>>
>>> Slightly RFC, because there is no easy way of making the opposite "norm=
al
>>> boolean" case work for no-vpmu.
>> There's nothing to do to make this work afaict: Generic command line
>> handling converts "no-<option>" to "<option>=3Dno" for custom params.
>=20
> Oh - I'd forgotten that, in which case this patch actually wants to be
> simply:
>=20
> diff --git a/xen/common/kernel.c b/xen/common/kernel.c
> index adff2d2c77f3..2cea1da781ac 100644
> --- a/xen/common/kernel.c
> +++ b/xen/common/kernel.c
> @@ -162,6 +162,11 @@ static int parse_params(const char *cmdline, const
> struct kernel_param *start,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 safe_strcpy(opt, "no");
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optval =3D opt;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 }
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 else if ( !*optval )
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 safe_strcpy(opt, "1");
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 optval =3D opt;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 }
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 rctmp =3D param->par.func(optval);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 break;
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
case OPT_IGNORE:
>=20
> to turn "option\0" into "option=3D1", no?

Iirc extending this to the positive case was deliberately not done, for
the risk of breaking custom handlers not expecting the standard boolean
forms. We could likely go this route, but only after auditing all custom
handlers, I'm afraid.

Jan


