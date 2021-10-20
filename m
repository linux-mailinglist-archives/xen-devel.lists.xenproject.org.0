Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9F984347D4
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 11:21:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213732.372040 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md7ma-0002Kk-Sp; Wed, 20 Oct 2021 09:21:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213732.372040; Wed, 20 Oct 2021 09:21:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md7ma-0002Hr-Ow; Wed, 20 Oct 2021 09:21:12 +0000
Received: by outflank-mailman (input) for mailman id 213732;
 Wed, 20 Oct 2021 09:21:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TQMG=PI=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1md7mZ-0002Hl-1r
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 09:21:11 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5a8e4de9-a80f-48bf-829c-7a08ae891216;
 Wed, 20 Oct 2021 09:21:10 +0000 (UTC)
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01lp2052.outbound.protection.outlook.com [104.47.2.52]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-14-mHyoR24VOZCxTnDe3c8uIg-1; Wed, 20 Oct 2021 11:21:07 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5744.eurprd04.prod.outlook.com (2603:10a6:803:e4::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Wed, 20 Oct
 2021 09:21:06 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4608.018; Wed, 20 Oct 2021
 09:21:06 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8PR04CA0075.eurprd04.prod.outlook.com (2603:10a6:20b:313::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend
 Transport; Wed, 20 Oct 2021 09:21:05 +0000
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
X-Inumbo-ID: 5a8e4de9-a80f-48bf-829c-7a08ae891216
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1634721669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1bOH7D0Vr12oUgSW4c12x8+l1FgfTUA7vVKwzlJcBA4=;
	b=PYjmt9j86fymQkTOT2M+eoHokr0npfXeuYE0UYnMwgu6cTy/cTDAHztPnaLiwFStKt+qVg
	e09YXvzvVFmUFnMwfGA5NPt5pyZcIYlK58/eizxdQUXdmnWSy42ouKXKPUq30auocmWiaY
	gLQQiLDAtOlyDWpcXCpy9bjWfAcb6nc=
X-MC-Unique: mHyoR24VOZCxTnDe3c8uIg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGcXYMwFlV8I3Fsxrhk/PQXmvQgcTwtxb2eEckLwx6nHo197Euwd3ookFES04rW6oEqwJ3ulRdpH1M6xwnOEbpJAIRSZZcws7cNOugQvGA1alD2evLD3cipuN+Bl1D3E6Xm3SswAmHgDzhVzEaGr+WsmSxy902+HZt6rj5lZKuqUUlEZJ72jZPifw7Xv2qjahMFpeOiSJNaSViyG1oQYBDft+OI1LAx6pEVBzWcDbbl17YbnH76YX0AixelQULfPthA1LLZYWXIb2p76eaFyLzwRvR8SnOqN86VAqn33DpDqAB1CPiK5H0yHwPflGb5z+fDeYjJyiR06AnHdlorwNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3azQUSj5yepMktjk7EyDu/U6Qk7BV3LRMNQ74C5EkA0=;
 b=AyVyBitdVBi+XhMYVOpPMjYqn68WpsKAE7slyYDb0tl9P/CGNtEFMds67BHj8N57dH0ybJBBrhw4Gjo41/F+pkl57cndHXm0Gm+3exrsisAeHg/j4X7rwvPIYhSLDo0r2f230JCsac85gY5f9sdtDDOXVlqgpI6tYb1fbie4z2F6+VFBAWn6feNdtqV+Yhv+0Czs0V8xNgqW34FKAc174zxvZu++oi23f7oBjhs6FqrlOOQQZhFVRL0Qxv501V4+yJMPNGEYm64VoxZjDn1TpeFQVs2nmn1X/WxCrw/OVzJiMXmmUML/1DDZhHrZfndr7+xrg/FFtIzDckH3DFcu6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: xen.org; dkim=none (message not signed)
 header.d=none;xen.org; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 1/1] xen/pci: Install vpci handlers on x86 and fix exit
 path
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "iwj@xenproject.org" <iwj@xenproject.org>,
 "Oleksandr_Andrushchenko@epam.com" <Oleksandr_Andrushchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>
References: <cover.1634659471.git.bertrand.marquis@arm.com>
 <d788dcce9e344a39f6761633f0e96774ab42c2aa.1634659471.git.bertrand.marquis@arm.com>
 <YW/TBnjCuRjm64nB@MacBook-Air-de-Roger.local>
 <e8f35e24-8dbe-db2c-02fd-f2290648a25a@suse.com>
 <2FAC788E-1736-450C-B9B5-BDE93E32260E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d58fdbaf-5535-0235-4919-099c12037d31@suse.com>
Date: Wed, 20 Oct 2021 11:21:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2FAC788E-1736-450C-B9B5-BDE93E32260E@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8PR04CA0075.eurprd04.prod.outlook.com
 (2603:10a6:20b:313::20) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 407d2052-8dca-4851-f5bb-08d993aaf1ae
X-MS-TrafficTypeDiagnostic: VI1PR04MB5744:
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5744BE266839C60B0F700FD2B3BE9@VI1PR04MB5744.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	AjVcIVuk8qVTIwbVuH2Ownu2rf2Zg1aI8HappjXvO1EX+Ml+Cp66CIBnZoAOhrhxM0/RGHIPRkM42Vcm+M0M3IBmIgZ5vWUbzeAxg9YEyEVkDYz3H16wxxbEt39UvLFL35S43OiG/UUP2sEkX/DXUaeBAaD8DBVDCp+zfeWBu2B608SJab/WBzBHIcJ1m3PuuTECGPiDRGcOZwg5NcAnb5h4dbWCGbdh7wvcSlyVB31WlG+bp5mqNHuKzXvoy8Y9MnFlE9kqMiEWblLT3u4/YShag8vVApFaMLlG7clf5iJJApfaWeY2XhWecCAdGfVW+yTm4XkRGAM3pEc1LIBYfO0uk4pV5zE8cv3Sh/uiB92mq9Gt4jwXNRnItAj8SxsikFHlSOzFpOxbQ1QJziNoD/ZFnxLKtgmWPTA16wklDfeNm7kSBpQ6JJWraQWwRk2yE5+Iy1JxtRejfWe4DyV2hl8gGkll7QDteLxQCNsh6EtDkVPPLPPFGX4Lcg0z299HjBkgN3TlnAAmlx5pH8v0eCQU3umIEYU085T4a/V+eP17uNSQf6qS2k7A4DK99punvs0mCzHKEZlaViEbB4FYiO5OHk0m0bNtMgn4NSJvyouNkMcEHfAy83za++GgE8pEyPy1KffkVJpI2hXPteAJ2byrrhnxTMiRw4LPZe9NuEDZDbBAbNFETrhl269T8Uva2HZNnm7cOss5tjA4wQqYTh3fMxutjIlE+Y3akkRoSiRYidXvkq/xoygvwYhIZTG4
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6916009)(508600001)(26005)(36756003)(86362001)(66946007)(186003)(5660300002)(31686004)(16576012)(8936002)(2616005)(2906002)(8676002)(66476007)(66556008)(6486002)(4326008)(53546011)(31696002)(316002)(956004)(7416002)(54906003)(38100700002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VIwVvBbwINWs8Brovm+yqY3GdFoph+Uw9K9oASbUTznJnGgPbHbsI/RQ8XA1?=
 =?us-ascii?Q?yn17HDfRDXaggU0GIHfqyWOcGaIc3Xkr3k8FJ6AuC1GapM55zFgzcs2R9Ygg?=
 =?us-ascii?Q?zTcK4d7egwzs92RCvJub5zoD3JLxO7NrhcQ1xgXrjdOJplot1KaP5C3m65Jp?=
 =?us-ascii?Q?QXpcKJfxAGwZkAxYvsBcoM0/R5Lvje+YqFhZAwH6nPCy4oNxZFaJCdkkal8g?=
 =?us-ascii?Q?5CNHP5e/bonzS6coJPs5ZjEl8n4slBmmHJpYAWTFSTEuQqfq/7kTabrEp5YS?=
 =?us-ascii?Q?LL/1Nu4+IQ01gqXBma3VxquI8IhhmJozNhWBrqJzbTUpf1wnDWtVTYOqKIbB?=
 =?us-ascii?Q?5yDrAC0DcI6nf+OX2sKLBliG259cgCiRE60Vgmo0BpXLEZL5KsBHf/Na4EaD?=
 =?us-ascii?Q?w7+B2rp2UoinMyGbe/Qba8yDfaF0VClGioCOS1v7TmJhbCh1OwLVhOjjDQo1?=
 =?us-ascii?Q?dVSKxCraFGEH1pIERamAANvhsbehLIYmRoopNNhz0wo7jUASQ4aTkwbBL6VJ?=
 =?us-ascii?Q?VVYHGYmgsG0eyLdJGUk+jtOoyW7MsLzxCNuVxKHDquo8kR1UUEjd60b2J3WS?=
 =?us-ascii?Q?8/DfONCfnn7zHtk0vRJQmmULLUxZhogTfREW6G80frTeT7FUlVKIvhelx09C?=
 =?us-ascii?Q?R7oY5uBoNU9A3npNwqo8dqLqPhdrcMJ8kRgXEp6u4ZHvULU2RGKCs4FTGmw1?=
 =?us-ascii?Q?TCdffX1QLYmI1G8AStmxmgYG8MhRhfRo/dd0+QnUBmqikp2Lqejc4Q4BskVo?=
 =?us-ascii?Q?u5Gnx9aSR9bTtSEalOa7ecCREXGnoV82edIrJvK7j3+CoPIyQL527T0JTpel?=
 =?us-ascii?Q?wxXnNGw6rTqyOOKJB59KbjKCp8UmkGGjjm2naxmIE5NATP5auhTy+3golbj+?=
 =?us-ascii?Q?bAdj+sq1L3R559NxKvCfWiQmDgDkQvsFBw0COQ/CUlrxOZbv2WE+8mWp7oVA?=
 =?us-ascii?Q?7Hz4IECUrN3+bzYFyIcVHgRUzzVo6MeeBFkB6ptb/vNOHjcpuPUhkWncvKXV?=
 =?us-ascii?Q?Tdt24nyP0rhXTJbTN0/EfMcUhO84Q0ZD7VJWKtlojgXQ3bCVR5K61rrqSu27?=
 =?us-ascii?Q?WMpcIZGFYJ57UeTFvzcQUbBpnRGUlUukd8BcSGLhh7q+stzUKPwhghc+doSk?=
 =?us-ascii?Q?yVdn6uoDp67FMNegHwiqmoT+HpXd3At2bXwufyGwAX3ch2TDfGxf2xEOiT8L?=
 =?us-ascii?Q?LiBLgqZ6GFCF6rhlDWsqIFuvuYAcyN0VF7pCEVGWaGRXhFa0sWFPdxNCZyiI?=
 =?us-ascii?Q?cjZR2l2vuKTqg0mk1JlBmjKGjXSXZIUJ6leKNL2uoXEDWiAVGzNy7Qz2z1yS?=
 =?us-ascii?Q?ts0KQyQak/9NSmvJ5Y4XlepG?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 407d2052-8dca-4851-f5bb-08d993aaf1ae
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2021 09:21:05.9923
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jbeulich@suse.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5744

On 20.10.2021 10:39, Bertrand Marquis wrote:
>> On 20 Oct 2021, at 09:34, Jan Beulich <jbeulich@suse.com> wrote:
>> On 20.10.2021 10:27, Roger Pau Monn=C3=A9 wrote:
>>> On Tue, Oct 19, 2021 at 05:08:28PM +0100, Bertrand Marquis wrote:
>>>> --- a/xen/drivers/passthrough/pci.c
>>>> +++ b/xen/drivers/passthrough/pci.c
>>>> @@ -756,10 +756,9 @@ int pci_add_device(u16 seg, u8 bus, u8 devfn,
>>>>     if ( !pdev->domain )
>>>>     {
>>>>         pdev->domain =3D hardware_domain;
>>>> -#ifdef CONFIG_ARM
>>>>         /*
>>>> -         * On ARM PCI devices discovery will be done by Dom0. Add vpc=
i handler
>>>> -         * when Dom0 inform XEN to add the PCI devices in XEN.
>>>> +         * For devices not discovered by Xen during boot, add vPCI ha=
ndlers
>>>> +         * when Dom0 first informs Xen about such devices.
>>>>          */
>>>>         ret =3D vpci_add_handlers(pdev);
>>>>         if ( ret )
>>>
>>> Sorry to be a pain, but I think this placement of the call to
>>> vpci_add_handlers is bogus and should instead be done strictly after
>>> the device has been added to the hardware_domain->pdev_list list.
>>>
>>> Otherwise the loop over domain->pdev_list (for_each_pdev) in
>>> modify_bars won't be able to find the device and hit the assert below
>>> it. That can happen in vpci_add_handlers as it will call init_bars
>>> which in turn will call into modify_bars if memory decoding is enabled
>>> for the device.
>>
>> Oh, good point. And I should have thought of this myself, given that
>> I did hit that ASSERT() recently with a hidden device. FTAOD I think
>> this means that the list addition will need to move up (and then
>> would need undoing on the error path(s)).
>=20
> Agree, I just need to make sure that calling iommu_add_device is not
> impacted by this. It is probably not but a confirmation would be good.

Like Roger, I'm unaware of any issue there. It would be odd anyway for
that (or about anything) to have a "is [not] on list" check. And the
set of list iterations is pretty limited iirc.

Jan


