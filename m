Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEBD642D270
	for <lists+xen-devel@lfdr.de>; Thu, 14 Oct 2021 08:24:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.208997.365320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mau9S-0007Fx-Ki; Thu, 14 Oct 2021 06:23:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 208997.365320; Thu, 14 Oct 2021 06:23:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mau9S-0007DJ-Fm; Thu, 14 Oct 2021 06:23:38 +0000
Received: by outflank-mailman (input) for mailman id 208997;
 Thu, 14 Oct 2021 06:23:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Xl23=PC=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mau9Q-0007DD-Kg
 for xen-devel@lists.xenproject.org; Thu, 14 Oct 2021 06:23:36 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4239f1ca-2cb7-11ec-81ad-12813bfff9fa;
 Thu, 14 Oct 2021 06:23:35 +0000 (UTC)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2054.outbound.protection.outlook.com [104.47.9.54]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-29-0oQXwG44M46ia-Rd5p31rw-1; Thu, 14 Oct 2021 08:23:32 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5902.eurprd04.prod.outlook.com (2603:10a6:803:ed::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Thu, 14 Oct
 2021 06:23:31 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.016; Thu, 14 Oct 2021
 06:23:31 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0101CA0032.eurprd01.prod.exchangelabs.com (2603:10a6:206:16::45) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14 via Frontend
 Transport; Thu, 14 Oct 2021 06:23:29 +0000
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
X-Inumbo-ID: 4239f1ca-2cb7-11ec-81ad-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634192614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUWzsmsy7qodbHa1J9ZOYegQeH7WMfsiYxysA5X4aqU=;
	b=mT6uhcaClTSCvl044S0rGRZPbO9+ndldTWrSe4fAfb6Q3U0PFWRptW2SGRdt0UgMt4jXXr
	MSIUyouA2Ycr8495gxOZ7vZv2MZSIi7Csoq5YIWFbEPJUYVygkGyHutzk/hS/tWlIbRFYC
	NV4BJiou8tq4JbU8bJP/SxBYMjAb0Os=
X-MC-Unique: 0oQXwG44M46ia-Rd5p31rw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdhpFIIJduNtKQMhbTasOv8bowLGQg5Iw2qLRJngeMteuhQKvCHgj3Etum3EUdVvYQMpKJ/cdc55UWOgGTzO/unNqYEhUf4O91P7hB2iVZ7UxgbrdqVEc5t6SWkdAAbaxPsH4Jg3CN8wQJF9QsVSnnjRkGDQrXuUm6Wk2s0RN4JGVAYg0l3osA29f+hshMgwM8xvajgUNVCsF90f9NsqBmCuagLsiOFOzMhf3fAZfXUPfu1p29Z5ZLaiUtg+qdqUgYAzIOiNJf7eBWS403yAH13uGe5TDkmCHmwKve3WuPNMhcEoMN7ZIfKkt5EzrSMdw65u289iyI7Ji5SK+qzsXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oPXr0b8YbwCUDxSUanIoirkFFYAi4vkLFc0dNSKGKRE=;
 b=YPPOtcuE1KX7S1tz4Sur10UTfn1MFdVVvQ/vMoWEL7O6z/BrMbfr3k3j9aMSf2W+cSk8lBri1LrUZGVI4rotBTTtIILpgUeaojQjnYOizhbD0X4d75C+DM9KpInaJrpRiYMjd4Z2HvR1CnvBvegiAmXTOIbDJdA+QDwYNQhrxtRj/rWsvyeiI7F/kTioB6xoek8WI6ys4yzonsWRo1mgOtsYRtwEJSSpolVzvJ8nmHSBPGRr2RRdaXQroqPGuOqV3Iknq3/tmqttrR08bEvJfqRpKP0jZtwjf/ccb2hoClGB0IGiU8l7lEP5LwNH0MnCWQyIDa2GGD7u9eYwBqTZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: citrix.com; dkim=none (message not signed)
 header.d=none;citrix.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v5 07/11] xen/domctl: Introduce XEN_DOMCTL_CDF_vpci flag
To: Stefano Stabellini <sstabellini@kernel.org>
CC: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <Michal.Orzel@arm.com>, Rahul Singh <Rahul.Singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andre Przywara <Andre.Przywara@arm.com>,
 Christian Lindig <christian.lindig@citrix.com>, David Scott
 <dave@recoil.org>, Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <cover.1633540842.git.rahul.singh@arm.com>
 <20d5b9d6a0d01a7b90711d28cbefb5701a88b438.1633540842.git.rahul.singh@arm.com>
 <YWQDguvmf/O4rDIs@MacBook-Air-de-Roger.local>
 <9217a6b8-fc53-a049-7cd3-7458b574424b@arm.com>
 <YWaZKX44IOfIBtX6@MacBook-Air-de-Roger.local>
 <8F9D6B9C-58CB-4000-995A-95517EE72A3B@arm.com>
 <YWa7eGr3D8Ax8VUX@MacBook-Air-de-Roger.local>
 <9C5C0FE2-67EA-4CD7-893B-82C156F5F77A@arm.com>
 <e88892cf-e0c3-c39c-dce8-bfe2d25a5b53@suse.com>
 <alpine.DEB.2.21.2110131113212.9408@sstabellini-ThinkPad-T480s>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <291330d4-73c4-7893-7735-23c21ba04ccb@suse.com>
Date: Thu, 14 Oct 2021 08:23:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <alpine.DEB.2.21.2110131113212.9408@sstabellini-ThinkPad-T480s>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0101CA0032.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::45) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b1eeddaf-c1fa-4161-6fe7-08d98edb244d
X-MS-TrafficTypeDiagnostic: VI1PR04MB5902:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5902043053EF4B23576E5DC2B3B89@VI1PR04MB5902.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	u/ke90tNqoOiVn5xiGdL2VyI43MwwQjLkQzH/I4sN6ccDQg7Od+YiFYDG71KElSfsIwHbNDLCM0B2fK9dphCo2WJeTfIoHv8na3fVnPLQjZ/n+v9/Quoifyq/MV/j+KeKBrX8Ii48XTk7XHv8HirPH3x5/3fqK0tRpW/Ump1MTvOptJwiQdVY2uk5xGGo+zhuvrq9P2K7n/zLMab8iu5nPeAVZwbjNwSLdtXGItH8wJ6t/zhKgRs5HQK3ptPiBVxrt7WwyZKq4iz83u28wTFS54qRIkMwRoo/2dDwsrFLxayzGkAGyk/7JoKrva+tSwhew3Z5zF3JucVM+5+VaTcZiRfNmGqg+or6D0jYkp1m83cC/QSQlzRqqlyJBjl9yPDzEhpmpMqP9JspzvYO27gJAYqAcFrtCnzI3zFdyyPg2VkDsf5MYlrdug1P/SpRF/RxghRsvAKqdBM8m7rkIS6HNZQTHL0ZwQ6E/DMHU0QU8PBttm39HQ54QSWWHOOiBuAM1lJ39C2xAhl6Z0giGyYm4VHVkT1uKstvAfLrx7hWKIhR6uobA4S4RCB0eQOcyWVYg7qSzx8FM2n+Ladgt42DAyoa5eCnspy89eSsWW5/IfdnWYxoRkdnTBft9tFCKVy9qAQZIkedbg4E2Sjp8EUYd2QH4Qa6ENkcSbOHdUCE5i6p+jIzD2P5LXEVcUJrEVhkNLCwv8HaQaY9jGzk93P+gLL9SBu44zS+84NNkh8jNxci47h2HDymglHy3KLQdZ3wvSI1NZpGU80J/WS8LDajByuEhpanFgId/1eScc9Ay36p+0jDLgbMc3IF8o4IWGQ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(38100700002)(966005)(186003)(36756003)(66476007)(66946007)(66556008)(31686004)(6486002)(4326008)(83380400001)(508600001)(6916009)(53546011)(7416002)(2906002)(26005)(31696002)(8676002)(54906003)(5660300002)(956004)(2616005)(8936002)(86362001)(316002)(16576012)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?34gj4gEqZeKCWeoaYbiGMKLHlLCjl+2MFYZmKUkEUHx9kFwD8V5qfSdka+FV?=
 =?us-ascii?Q?3tCOG4LKU279AbkZ39RSSt17Pwi1CjuoFkU0JaLT4xD4bMkzdTwLMB/ocVyh?=
 =?us-ascii?Q?v5/NrbaGzIncejNY4vHL+5PvyAclfS2jTsk890LHYSVIFV95m+zNi41b9SU+?=
 =?us-ascii?Q?zSsc4ba4J4lnnoRTyU7d7ddxDZ5svV1cnAs0XdpKaOaUX11CWgcDIp6iP0J5?=
 =?us-ascii?Q?D/JE4sR5H8qzZtHICc/KSfFtQVfEbTE2VNTA7JTbPQjp+JYanFLMEOSRsLmb?=
 =?us-ascii?Q?nc2Zud+UWKGyP8dLd2MKDL/E7vp25zG8i80pv1v4pZsX6DewMI7hKdyxpScn?=
 =?us-ascii?Q?+4+J79/pl2pH9CYsdlskz7zFhJauuUi2xU33pzLMaAZsNpsLipDWeuY5n/RL?=
 =?us-ascii?Q?SSKVRs+UHRX1tauQUqpg7QyMgX7FBqf2CbJR5TYEOpGWLIj1pWY7OW0qxyT/?=
 =?us-ascii?Q?DZPc8EF1uqHcKoHcgFmjY9r4denNp6DwCDsvyfns0/ruyfcbmYdjGwVyzn/6?=
 =?us-ascii?Q?kdmHBVlhhvdkteNaSAItnBzMmww04S0uk2HiDM0iP1a6YLHvv9kQwKBatKC7?=
 =?us-ascii?Q?swysrJwhmkFKWsVvRgDKNDheyxPrp/0NqyRVK4+vwVzv7Q0oxjpO+eS9cKn0?=
 =?us-ascii?Q?/cjR+9tRAjXjD3TcYq+Wz0suKCalidslQdoQKVsyVbqUmuctttnngaEkUjfE?=
 =?us-ascii?Q?wI9doUmIkiSgKg2Cmu/TnBZgN+pz4VEK/003i4m1EbGS+LKeyyEDYMFLV9c3?=
 =?us-ascii?Q?fVuL59aztXv/D8s0JJvXtoXjMHYZyv5QZSzXHw701LFYTO1J6ZOtLJ/JrSI3?=
 =?us-ascii?Q?yZANUZqvAagtHkrIbXyZ7G4jej28qeDs91q+dGypWMa3vx1MreAwXMorJO/s?=
 =?us-ascii?Q?cFLvfH/Qmn4ktHOc2WmMqCao6fsMyR7dGhpSBdFu0M9skHpIwaau298sUo6u?=
 =?us-ascii?Q?YCqp6/ox6c03meokOkCPkIJ1U5HvfERGLy9s1PYt99y7q5LXpRhM+2MpCGXS?=
 =?us-ascii?Q?QXMzJVyTQVGhd6eCvujqHesz4v5R/kkOk66S1xMJBK1F8PDTh/2E1l6ssyfX?=
 =?us-ascii?Q?kMOo8hsa9W00JK+FI3aT7L6GHSDCjHyf8+ZRDiYELqN9egdA+ijfwWW3h0pL?=
 =?us-ascii?Q?oIh/eQD2K4rcQvo7l6Bz/UL53glDxexRD+ng2A8L8acvRtZrZSiNyI/raMqS?=
 =?us-ascii?Q?nbDu688qlK8Y68GVNpDw5+WWmaBz6ZBWzcfoQ5FmcsZ08uJujIOz2Y9kDtw0?=
 =?us-ascii?Q?l90mH4/MGG+jShI4dOAR3xWRDp/hIM7EuwicdnqYb99o5f7AcuMLIi9enCxa?=
 =?us-ascii?Q?W9A0EduNnWHSIjMvcV2qhqju?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1eeddaf-c1fa-4161-6fe7-08d98edb244d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2021 06:23:31.2179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f+WzxVkUdbf6njaWl8S/th/SxkOTqQIXakVJHk7bemEr9JVy8e7l8RFx+PIUVZF23PkUIVEAeWCoMZuYDsQugw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5902

On 13.10.2021 22:41, Stefano Stabellini wrote:
> On Wed, 13 Oct 2021, Jan Beulich wrote:
>> On 13.10.2021 14:11, Bertrand Marquis wrote:
>>>> On 13 Oct 2021, at 11:56, Roger Pau Monn=C3=A9 <roger.pau@citrix.com> =
wrote:
>>>> If vPCI for Arm on 4.16 is not going to be functional, why so much
>>>> pressure in pushing those patches so fast? I understand the need to
>>>> remove stuff from the queue, but I don't think it's worth the cost of
>>>> introducing a broken interface deliberately on a release.
>>
>> +1
>>
>>> We did not push that fast, those have been on the mailing list for a wh=
ile (this is the 5th version of the serie).
>>> PCI passthrough is a big change requiring lots of patches and we decide=
d to push it piece by piece to make
>>> the review easier.
>>
>> 5 versions for a series like this one was to be expected. Imo it has
>> been wrong in the past to rush in new features (even if experimental
>> ones) very close to the freeze, and it has mislead people to think
>> they can delay work until very (too?) late a point in time.
>=20
>=20
> Hi Roger, Jan,
>=20
> Let me take a few minutes to clarify and provide context for this work.
>=20
>=20
> I don't think anyone "pushed hard" any of the ARM series close to the
> release. I sent "one" email in public as a reminder of things that need
> reviewing:
> https://marc.info/?l=3Dxen-devel&m=3D163373776611154
>=20
> I did send a couple of private emails to Jan but they were to synchronize
> ourselves rather than push; Jan, I hope you didn't take them the wrong
> way.

Definitely not, no worries.

> At the same time it is certainly true that all the people involved here
> worked very hard to get these series ready for 4.16. Oct 15 is the Xen
> Project feature freeze. It is also the deadline for many of us working
> with upstream Xen Project to upstream features and report back to our
> management. I know it doesn't affect you guys directly, but you can
> imagine that as employees of our respective companies we feel pressure
> to complete our objectives in the given timeframe. Of course we need to
> make sure to do that without compromising quality and without
> overextending upstream review capacity.
>=20
>=20
> The ARM PCI series are public since Dec 2020, pushed to a gitlab branch
> for testing: https://gitlab.com/xen-project/fusa/xen-integration/-/tree/i=
ntegration/pci-passthrough
> I helped creating, managing and testing the branch.
>=20
> So, I can see why Bertrand feels like they have been around for a while:
> we have been dealing with these patches for almost a year, even if from
> a xen-devel perspective we are "only" at version 5.

I'm afraid that anything not on xen-devel doesn't really count; the list
is the only "official" channel. ISTR that for certain aspects there's a
plan George has to make this more pronounced / formal in some of the docs
we have.

Making internally set deadlines is a fully understandable aspect. But
starting to post in September for a mid-October deadline is putting
oneself at risk, I would say, for a (set of) series this involved. I see
no problem with anyone doing so, as long as they accept that risk rather
than expecting to get away by either extraordinary efforts by others
(reviewers) or relaxation of what is permitted to go in.

Of course there's the opposite problem of feedback taking unusually (I'm
inclined to say unduly) long to arrive, like with the gpaddr_bits
addition still facing vague / unclear opposition by Andrew.

> My suggestion is to accept the TODO for patch #8 [1] but I agree with
> Roger that we shouldn't introduce bad interfaces, especially as they
> impact x86 which is not "tech preview". So I think we should revert
> patch #7 (this patch.) I'll reply with more details in separate shorter
> email.
>=20
> [1] https://marc.info/?l=3Dxen-devel&m=3D163412120531248

FWIW I agree with both proposals (acceptance of TODO and revert).

Jan


