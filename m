Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B193C4B6F01
	for <lists+xen-devel@lfdr.de>; Tue, 15 Feb 2022 15:45:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.273252.468367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJz4m-0001Jb-7j; Tue, 15 Feb 2022 14:45:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 273252.468367; Tue, 15 Feb 2022 14:45:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJz4m-0001Hj-3e; Tue, 15 Feb 2022 14:45:08 +0000
Received: by outflank-mailman (input) for mailman id 273252;
 Tue, 15 Feb 2022 14:45:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=p95L=S6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nJz4k-0001Hd-Db
 for xen-devel@lists.xenproject.org; Tue, 15 Feb 2022 14:45:06 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dcd38707-8e6d-11ec-8eb8-a37418f5ba1a;
 Tue, 15 Feb 2022 15:45:05 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2169.outbound.protection.outlook.com [104.47.17.169]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-20-4-8sQTT5M06q73_z77qm5A-1; Tue, 15 Feb 2022 15:45:03 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by AM0PR04MB4196.eurprd04.prod.outlook.com (2603:10a6:208:56::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.18; Tue, 15 Feb
 2022 14:45:02 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::d479:b728:345c:bd65%5]) with mapi id 15.20.4975.015; Tue, 15 Feb 2022
 14:45:02 +0000
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
X-Inumbo-ID: dcd38707-8e6d-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1644936304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mvcwRS/2kTL6JKXjdjAteMCyvoPmIncNGSvsR1a29Tg=;
	b=I9DuZtK3J861NoNc8tmudDE1yMuMqpu9f6+EcNmK6zMZmaoBpZU0FVBhHo3XpEoVlDDyqh
	+QrTo7PWNJpU2QxeqPygqN1f2m4/Cpnu/V4tczwTrZ56FCiI/zyqQ145DdoGx0iUdhoNlj
	eoQYIT2Kn5J1bjGBsq+OgRtmtbJhj5k=
X-MC-Unique: 4-8sQTT5M06q73_z77qm5A-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGPa7WUX3UeWjpE1W0/XisSSiUlFYCmd52G9D986Ij4m//qSAyrYMHob+nD8l61M8LGx9USj5Rs3ZxTRFpFlywER++ZO1eTZMkIO11xxUycO+AZERU8fp7PDgNYob9C6Q2c/0VvixpTrUV9rYqV/2oTR95boWKdYut1t0II+YToOuC2ctDEZkanZt5TgVq6eXidJ9PqJo4zKd49AK4T18eMwqRC3RElEjrzXGcE6WX67hvsyrhJoUi9QF9Xq6p/ANkxLAut0MWvGLQzI57CEhaoFHaLvujHIux3QJUnh9Yd0g2/0xeWzYMwJiKohQRto3D/1ArKpkbYG+OkoSJcycA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/YUQRnu7FAeGZcxpUphTiHuUlTf3kZQccc3Fm3/StxY=;
 b=GkMXJcLpzucr/C4ptqEFF66MyDAwvliFeEiijxP1wP56q0AVdSd2Dd8scLqWWoGiSeR2Sg3w3Nbtzm00BY/VGdE7fQqC9Se7K0QkN1/Z5vlpvLhJDqYqFL6e6bzIrA+4bK0Oy7+JeiTDZ1i5mdOR3gKlgestOy4FMcvfauNdji6uosqTmDx3+9pmIsHDFo3KcZwSB2x6iUHjXkxfvszluNVHtFj9njqtkNdM72JJvcb3eh/hGrKL/UeyAys4NFoONUl4yjSKBW9fifxFU6Zlpl4MQb6l05QqiF7rBGHeER8dP6lh3yQAKfvC6gj9wbbFw7KtIKlttJaaE6RNiHV4OQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <493bf9e6-7f75-7f90-0c5b-a4a3e30cfb34@suse.com>
Date: Tue, 15 Feb 2022 15:45:00 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] rwlock: remove unneeded subtraction
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
CC: Julien Grall <julien@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20220215093951.97830-1-roger.pau@citrix.com>
 <7710f137-7123-ca70-3a58-3dba1981b2c2@xen.org>
 <dfc3ab95-f2ca-bf03-98c1-5d77ebcdb048@suse.com>
 <Ygu1si+HEiPB8vGz@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Ygu1si+HEiPB8vGz@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS9PR06CA0245.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::13) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0109170b-5cdf-4f61-6891-08d9f091bf35
X-MS-TrafficTypeDiagnostic: AM0PR04MB4196:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB41967DA82362F3AD912F68F8B3349@AM0PR04MB4196.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2bfBQl0zkapymzKZnJDAKiC/8kpn3xnju0FYMOmJOjNMmfp7C2ovf/8A3SpUM2dvIVlHtkq6GF87C/7HfLxefiwLl4AvjKx+Uf9gyVCKNxnsamcz2bdx9w49/qV6uykFJ5ep52FzjELuUbCsF26vPeclrE3W9H7EZfu30ajoLzneAPZATawtJA84ElF4Pikb1NVC5gMQ6KpxtFzVLWul0JmFfIw2hV41dw+nbuF0Pd0RUCedJt29QLzGfp6M/4UzVpPos48YxmU45XQBU9ZwNm4SykNdILVDoZv0QDFj4Zs3A2jlJuLXeXwMC60dgQy/lfh60kcXY3BO4hoxVQ0MDli/7gR4JtqP+X/xpFs4ln4bOxCPmz8kgOuOC09KXTfCZBZlk4mo/esLI8RydixynxfgDrmRmCI5b512D8/SCq5G9TCvMjsDCTT0QzETJtjwILsoUJGd0QfbHJ3iPPZcRlCRIiQZmlJPe+/Ss71jfEqmkpgqJxTJ19ZjdDff2GDYICR+RFmNBrY5oEXb8Y+ErGsw7ycppgO3982GXKSVG4ro0nBeRNSt2r/sV9LiSYqBJrZv90XyKk6JPoIOgJjiaHy5wpBbajiud27mSKcyPH0yJoUrLFoNnjEeHoL2mkRYZaNJ4HxwKXZsk3gwp1M7x/RdzoUxJijt2tz8RAUR31t37xKf6l0TDIYO4y1tzXLd0x20CFRdl0VyKdrhxRxUmIHXgtpvqsgAIcnJiWvPUo0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(36756003)(6506007)(6916009)(316002)(6486002)(6512007)(53546011)(508600001)(54906003)(38100700002)(86362001)(66556008)(8676002)(31686004)(83380400001)(5660300002)(4326008)(66476007)(8936002)(66946007)(2616005)(26005)(31696002)(186003)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?lHzAu49IQa+vE6+56LdKdYIqK/0qWJDqRSK05gcBjQ/gmXZd/8u/IVycxpBf?=
 =?us-ascii?Q?gqeNf5M5R4MWEDGp7UZS0K/QD6IKe+47ZaME72NjzWv570wT0ORXUFtRvWRK?=
 =?us-ascii?Q?JVCSiBin1vXaZG0tBx1sMZsbv2nwl8s9SJuxY6sdos3Ww4W2rlFGMxvBUu74?=
 =?us-ascii?Q?a1mupa8E7CHE/7azXF0WkPJQmiqh4+5S+xF5REGFwaZIIhMRpRHmHBbJF9Wc?=
 =?us-ascii?Q?bR7yNSLKqlGupCmcz/orHHHdJ6grRCBE8MzKr6udNKj5bLD6M3oF1iIxL8J4?=
 =?us-ascii?Q?r6E06qnEEobaFSviagOlhnjn4UbIMr5LoJdUdP4DhYUWSfFSSzDP4GZnr3Lr?=
 =?us-ascii?Q?DT/sI2Nzw4tCJMgd4K2PB7YFxCImYckLVZYkUlPvi68nUKcaJwWjSCPAksjx?=
 =?us-ascii?Q?rpxl2aHLiBU8PLhVrWddaQquHrYkOjHmlesxLhPsSVYctAelke/ejeU5ruE7?=
 =?us-ascii?Q?xI89Qh+HYPRlKyHv7D5ax3GOFSo8l9M6coKdA/BXGjssAQ5IyqWREGKxT5Zl?=
 =?us-ascii?Q?xMwC8uJ/bZXH4M6uhFqXKyLjIdYJeQ81MlKE2vwQATZiX630wWW/QDv9h6y3?=
 =?us-ascii?Q?Sk/G5zGP0F+tXfkHUQbf7FwAlnby97TIeslWlvLxQTyI2BMMfSB4MRaeJDSF?=
 =?us-ascii?Q?9+utK1MHiC8CfFOXP5ruRsp0esUSb2mfV/vn3QSLMIsdYlMmyo97BGn9aw9x?=
 =?us-ascii?Q?Bmw0XsSSKAn2Adn+dvSH52+5BpkuBH6KMLcZlhgu1uJ5G7GgceEaHNdRwhrh?=
 =?us-ascii?Q?pYX6INy5KzCn7IXrSjK8fTOZuD/bvbmIDOn9Ie9F3UfBy0lxDor4r1bji5Or?=
 =?us-ascii?Q?P3fw4qH5q2ncWGcDHW49wmkrwX5JzAKJ2X9Dr7MwVE5P2Amoh4xI++9u92WS?=
 =?us-ascii?Q?1QqGiHT+v3pY00LuWjDkA2bGfJc8LQxwOKvAPpN6w/BcWadtm2IdoIUE3isa?=
 =?us-ascii?Q?Rv8gCbMtk1u3TGxwll76Ym8sI8ziR9hR1M0WP1eFmB+h4kCifwr1NK4cikev?=
 =?us-ascii?Q?2tWkNUN+PXwPJn5xeVijtuxgqxAd40maOnHKL0/yzWcLwXyY0Tkk4B70SQzV?=
 =?us-ascii?Q?EFQfrJZ1pLixFJsDTkDiH0NA8+4CX4c8Q5sP3MZ/wOXw9Z2wNbV88JtEbGrJ?=
 =?us-ascii?Q?AH4GZUII5Y2rDY17TTsr7rFESgwB5Zf0wtIdW8YbRXtQDcGmWltM5Mf/3Q3e?=
 =?us-ascii?Q?JxFL+2z+gBX7JpzDgViXXqTjWozoJg5/iQV3/rFTFsWF/SqFJzqBH9yvugZ6?=
 =?us-ascii?Q?Cm6VN2+qz77oUEn/bvXp8KgQweabM2CfJrISVluQRp1wEWPxgzkbrZngDAKx?=
 =?us-ascii?Q?60NIELCgbvfP6gSNEJZt3lTQqcS8PLueUuZHRyed/dKFOp/xET2xwsavv94d?=
 =?us-ascii?Q?IN4HXHwWjA+GCJJgY7HFC6R9Hkd86hFOb5ZKJPC+naKd/s9vsijEzlZ6Med1?=
 =?us-ascii?Q?Iv8lM2ztW/gHJdv64ONj1qwHjLibY4Cs7LfaECYY7rX7/gQIj4xXF48UjEPP?=
 =?us-ascii?Q?MRJKSnqEdthWfgU6NwzPFX4SkNrA15xumGAuGonXtLdAs8T/UMI53QV8LIvT?=
 =?us-ascii?Q?zvgeDxJ0kTu7Hg8Ye/xFbeEqo+WAqZ55J9Pq0DHrUOVznG48Wcgt/OZX42ac?=
 =?us-ascii?Q?D/zQVRgTogPvOMZsNLci2ko=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0109170b-5cdf-4f61-6891-08d9f091bf35
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 14:45:02.0070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RlWh6eoAYtrStKqDoJpUsmCd9cb3d+1AejXlEaY1KaVJ/ZIq5jDVeWECypTKkTtgTPlH37UaGiTrD2IGRQcQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4196

On 15.02.2022 15:16, Roger Pau Monn=C3=A9 wrote:
> On Tue, Feb 15, 2022 at 02:22:02PM +0100, Jan Beulich wrote:
>> On 15.02.2022 14:13, Julien Grall wrote:
>>> On 15/02/2022 09:39, Roger Pau Monne wrote:
>>>> There's no need to subtract _QR_BIAS from the lock value for storing
>>>> in the local cnts variable in the read lock slow path: the users of
>>>> the value in cnts only care about the writer-related bits and use a
>>>> mask to get the value.
>>>>
>>>> Note that further setting of cnts in rspin_until_writer_unlock already
>>>> do not subtract _QR_BIAS.
>>>
>>> The rwlock is a copy of the Linux implementation. So I looked at the=20
>>> history to find out why _QR_BIAS was substracted.
>>>
>>> It looks like this was done to get better assembly on x86:
>>>
>>> commit f9852b74bec0117b888da39d070c323ea1cb7f4c
>>> Author: Peter Zijlstra <peterz@infradead.org>
>>> Date:   Mon Apr 18 01:27:03 2016 +0200
>>>
>>>      locking/atomic, arch/qrwlock: Employ atomic_fetch_add_acquire()
>>>
>>>      The only reason for the current code is to make GCC emit only the
>>>      "LOCK XADD" instruction on x86 (and not do a pointless extra ADD o=
n
>>>      the result), do so nicer.
>>>
>>>      Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
>>>      Acked-by: Waiman Long <waiman.long@hpe.com>
>>>      Cc: Andrew Morton <akpm@linux-foundation.org>
>>>      Cc: Linus Torvalds <torvalds@linux-foundation.org>
>>>      Cc: Paul E. McKenney <paulmck@linux.vnet.ibm.com>
>>>      Cc: Peter Zijlstra <peterz@infradead.org>
>>>      Cc: Thomas Gleixner <tglx@linutronix.de>
>>>      Cc: linux-arch@vger.kernel.org
>>>      Cc: linux-kernel@vger.kernel.org
>>>      Signed-off-by: Ingo Molnar <mingo@kernel.org>
>>>
>>> diff --git a/kernel/locking/qrwlock.c b/kernel/locking/qrwlock.c
>>> index fec082338668..19248ddf37ce 100644
>>> --- a/kernel/locking/qrwlock.c
>>> +++ b/kernel/locking/qrwlock.c
>>> @@ -93,7 +93,7 @@ void queued_read_lock_slowpath(struct qrwlock *lock,=
=20
>>> u32 cnts)
>>>           * that accesses can't leak upwards out of our subsequent crit=
ical
>>>           * section in the case that the lock is currently held for wri=
te.
>>>           */
>>> -       cnts =3D atomic_add_return_acquire(_QR_BIAS, &lock->cnts) - _QR=
_BIAS;
>>> +       cnts =3D atomic_fetch_add_acquire(_QR_BIAS, &lock->cnts);
>>>          rspin_until_writer_unlock(lock, cnts);
>>>
>>>          /*
>>>
>>> This is a slowpath, so probably not a concern. But I thought I would=20
>>> double check whether the x86 folks are still happy to proceed with that=
=20
>>> in mind.
>>
>> Hmm, that's an interesting observation. Roger - did you inspect the
>> generated code? At the very least the description may want amending.
>=20
> It seems to always generate the same code for me when using gcc 8.3,
> I even tried using arch_fetch_and_add directly, it always results
> in:
>=20
> ffff82d04022d983:       f0 0f c1 03             lock xadd %eax,(%rbx)
> ffff82d04022d987:       25 00 30 00 00          and    $0x3000,%eax
>=20
> Similarly clang 13.0.0 seem to always generate:
>=20
> ffff82d0402085de:       f0 0f c1 03             lock xadd %eax,(%rbx)
> ffff82d0402085e2:       89 c1                   mov    %eax,%ecx
> ffff82d0402085e4:       81 e1 00 30 00 00       and    $0x3000,%ecx
>=20
> Maybe I'm missing something, but I don't see a difference in the
> generated code.

I've looked myself in the meantime, and I can largely confirm this.
Clang 5 doesn't eliminate the "add" (or really "lea") though. But
nevertheless ...

> I could add to the commit message:
>=20
> "Originally _QR_BIAS was subtracted from the result of
> atomic_add_return_acquire in order to prevent GCC from emitting an
> unneeded ADD instruction. This being in the lock slow path such
> optimizations don't seem likely to make any relevant performance
> difference. Also modern GCC and CLANG versions will already avoid
> emitting the ADD instruction."

... I'm fine with this as explanation; I'd also be fine adding
this to the description while committing.

Jan


