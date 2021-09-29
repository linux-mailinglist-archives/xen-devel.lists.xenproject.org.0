Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B896941C57C
	for <lists+xen-devel@lfdr.de>; Wed, 29 Sep 2021 15:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.199120.352984 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZYu-0006ET-LV; Wed, 29 Sep 2021 13:23:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 199120.352984; Wed, 29 Sep 2021 13:23:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mVZYu-0006CN-IF; Wed, 29 Sep 2021 13:23:52 +0000
Received: by outflank-mailman (input) for mailman id 199120;
 Wed, 29 Sep 2021 13:23:50 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lbjb=OT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mVZYs-0006CH-DW
 for xen-devel@lists.xenproject.org; Wed, 29 Sep 2021 13:23:50 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da39c8c0-55b6-4ddc-a1dd-f1c5f49e0dd0;
 Wed, 29 Sep 2021 13:23:49 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04lp2058.outbound.protection.outlook.com [104.47.12.58]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-40-W5CYHx9SN-e0rqNP3yJQpg-1; Wed, 29 Sep 2021 15:23:47 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2333.eurprd04.prod.outlook.com (2603:10a6:800:28::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Wed, 29 Sep
 2021 13:23:45 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4566.014; Wed, 29 Sep 2021
 13:23:45 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P251CA0027.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4566.14 via Frontend Transport; Wed, 29 Sep 2021 13:23:44 +0000
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
X-Inumbo-ID: da39c8c0-55b6-4ddc-a1dd-f1c5f49e0dd0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1632921828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LxxVHC5DI2Oe+uQaFcjF9bzlScAMMc57H+MBGVqKnZE=;
	b=eeXBb3VDYRpYkdGwvITpRKlRhJomTDWLaq9bdUWy2Oycv+rFvmpsJQ37A3hC9GExKSI1eL
	eIoaQ/XQ2EiO3fcTC85Ih8byij6D80AirVkSIe4D+NdI/nYUm/JVvye8MMYeRlWTq3CyyK
	1/Kj9QLxk1x7DZFzQZ44OnehX9lL070=
X-MC-Unique: W5CYHx9SN-e0rqNP3yJQpg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6LbTx+d33V/CrpqLr94URQHO1B0CsbY4MYVDCLGfwwRjaeuFqXvXSvAwW8slU+575xgldlQppkCuokmvy9P2bDNyz8puXcLFTOg1z6zrenjYMalW4LriT0S5HnPmmrDvZqEY62Qjwejm5rxo151QPSeYE1Y4MD/5LZo+89pSJIrLjbHFQSppOyu5s6e9YTTi+AqOVAISss7JnQJl3MmsPJ05V5Rsc2U3zwqMFWzKyyCueRoOwRLU4AdvCaA5+0k+WvceVYFz5u4bZRL6accXk4dtDSaF1DQUGfuxktLjwklHhDoFasVdX+RTn1d5/INp0kzbts5PjAHLJId5ZQnNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7bWYQaG7TskQCma8sk6hdeKPJ8HJVY7LRSAjfWfTtLw=;
 b=eLDzijqvFqxr8iPR05EvVV0Hb+M/xPtz6TMKgxL0cs2B+P6VJME7tRXzDKfcfhD0c2HLlQl+D25U2NuGTI6v8c8wKmp19Y9VU93gPAkplchC4EXdQgXBHiAWYVYXqONPjQoohOBvy8FPiEkqw2loxIwtacYwCtjkID8l00AL35vHCarRpC0wSQlHvKEAEpE0/8qH9zpxheAtFs3eMVTJ2w5UUHPP48zG1h/ANGEfOwLCMMrzzFweabRR/Wim7lVZckHyHKQa6rKsvqgIiT+p03IFQzVIP4P12NfUe7GOm+o7EoemUZ7XRzG3vGWBKjlmBNY7zsmCpecwMdIeCX9kNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=suse.com;
Subject: Re: [PATCH v2 10/11] vpci: Add initial support for virtual PCI bus
 topology
To: Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
CC: "julien@xen.org" <julien@xen.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <Oleksandr_Tyshchenko@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Artem Mygaiev <Artem_Mygaiev@epam.com>,
 "roger.pau@citrix.com" <roger.pau@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Rahul Singh <rahul.singh@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Michal Orzel <michal.orzel@arm.com>
References: <20210923125501.234252-1-andr2000@gmail.com>
 <20210923125501.234252-11-andr2000@gmail.com>
 <6a760126-ba6e-bdf7-97a3-205d75d3d99f@arm.com>
 <66cc2b43-eedf-5d58-bf93-5047ecf9ac7b@suse.com>
 <71d8eda6-49f8-691c-1e6b-711ce9f99d50@arm.com>
 <600cc603-5e6c-b430-def3-74a9b596daa0@epam.com>
 <8f5f9b93-2b13-30dc-372b-10326130b71d@epam.com>
 <4bde7d37-6b11-675e-79c1-e6e413fc97f9@suse.com>
 <7402aa24-e203-795b-0ca7-69e55c6b3f4b@epam.com>
 <38d64660-bf9f-98a5-9aef-5a3c39804f7f@suse.com>
 <26c228b1-eb4d-1984-4f24-30dcd24e1cb5@epam.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <548561a6-f878-cacc-cda2-30508a43072d@suse.com>
Date: Wed, 29 Sep 2021 15:23:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <26c228b1-eb4d-1984-4f24-30dcd24e1cb5@epam.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P251CA0027.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:20b:2f2::9) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6c863af8-d35a-4185-25d9-08d9834c5cf8
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2333:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB2333D02029FBED74A3DF69AFB3A99@VI1PR0401MB2333.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GSyFRYE6v3HRTfEgtE3WaGC2lLUaXK8uoQHZ1G5Rx9EUjZTsbZu4ThUreemrG1qlYgaMUqusmnF6wl1eaLEJt1hIHbmHCLz1AYx4fQaGcvynpjmaMVfNrxuuL3ajz5fs9K3T3ghjWX7jDaasZM8+SJa9fMIbv4oD+IQ4HGGNE1/jHUI5ZWzwZiTqiQ2iZzhpFBM+mAJOR+LjNz1Ig0WWNZqETqk0oMYVIZg7+AEduiQacBOzqKWEIKFa2EaoR5cGgbphXsxF5jhiZjR39lKsotffUwXuu73AySY04Ii+OIoJrk9ZCNLHVyrQUwJT9Zjg3QeQf0vZpsqDF+wZeRyVmzG7vll4ivqD7ZwKSdYkU/JxbsqsDDuj9QifFkPKJ/uJhCrH7huq/l9DUxc9pIfvjW9DsOkIgrdIJUlMQAEXoWDqjYSAMS9qDhcrjx58FziRXXom8yXKR0hUB3L1wu5C/XIRuwjY3o8tixgZ+S4xG0rf6njZSVQh8xFVMVE85ryjG2nBJF/CZpGe/kS2B6qyWZdEqlgFOGwHp1exRccJCMkYkSvhfqF2kCm2kD/FnzCg4GtvVtfAWPq5ZAP4+Y1dans3UyA8b8spLuqKMY/ZnWwvNV75HWH1COdEaIDZx4uXF4RfdhxgVoWsrKlo36cV9WdwtPXZkS9Wgcdd15zjzRUVlHJiav/sfM9hBuUbn/EqnZULmZH6mBS2q68t3uQoFoCg7/vSYEyJSNsRJ4SUeck=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(26005)(508600001)(8676002)(83380400001)(38100700002)(53546011)(4326008)(956004)(2616005)(31686004)(5660300002)(54906003)(16576012)(66556008)(66476007)(66946007)(8936002)(86362001)(7416002)(6916009)(316002)(6486002)(31696002)(2906002)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kgOLTnNfpVKXDsn+/JmdIBgo7zAev71sKG8S7f4v/mBtjkP9XnUKTopgJhLh?=
 =?us-ascii?Q?puqD+3x8cB95MYivVGCx2MUn6JTzH0ntK7mh3UHShYBpBUXURh7zhkjhGy3Q?=
 =?us-ascii?Q?ZaDnvrndlM1cciO9Pmlb8BFAuZhjb//OpnLGh+Bw8/AYyy9InCse5XkA12v2?=
 =?us-ascii?Q?4r9VWNhD38lPWeZjg5a5dxz7YPif2KZw9qZTsb0MNlTqAbrQkiabO0A7/DRt?=
 =?us-ascii?Q?n26oc9bY7nE4Uxm5yhtQ3puuiDjIE/ZsABXuoKKi03eUui2lo6uXNmD/Rof4?=
 =?us-ascii?Q?1SNwRYCECtm+Kxb/lpuwIqJ+b3eWAsfemLO5ubRDO/M4pijXazAoWSwcSO+M?=
 =?us-ascii?Q?dct8d/2M7SkTCiB54Gfwtare4qzezakez4H4K0jB1bhAxwifiMOJe8J3wkQk?=
 =?us-ascii?Q?ujj21+ZH+kAoevALE6DUmOUWRk8XGKPppcuLjKky0U5sFVidHvEpv1uNr/4P?=
 =?us-ascii?Q?/bIYYHkxKbzd5LTyhKeBs5y+UGfIU4PAIkywwVKHmIdSWJmGWHDi9UGmXz/I?=
 =?us-ascii?Q?+2lHhjS6l0xJWYoU0vBLg7nMQ/4VoUJoYYQtgHUMtPCa6DyHKJk/w79RAjTF?=
 =?us-ascii?Q?Akg0g3Jjx9+19leg1siA5U1uMGRPkJLpNXLuJzrzrXRaUj07O82LdoM8Dy1q?=
 =?us-ascii?Q?MmNFN9/+MlQ87DZRM+dcYBWK6opyaezds5QsRyUsX5SfrxESX4C9n1Lu1cjB?=
 =?us-ascii?Q?h1mN1heGpL4zHmKj9k7KI6oBN6VR0Tp2uyQ//zlw1CLWTTSii8ET3QgmfynM?=
 =?us-ascii?Q?z5Fq/uSVxuQmBa/p0ZZM0CBMR+sW4lYWC0ztzOasK+Z5I0V1DBIEuh1LxXmw?=
 =?us-ascii?Q?URWx0q2VbbZ6WUoeDgUgDQ89V/2ZgSKPIpEsJTLKSglohpAIV5znvot5bJLn?=
 =?us-ascii?Q?pagLWSEZGoI15TCwun/BEpZVnBc4bT828yQyYz7+9bP3YaET9Ywastx3o9bT?=
 =?us-ascii?Q?wUgzcpvZ1URnmIkCpuaBfs2S50vC5lGVBNkqhv/T4iJSrZ6YT5mSNSvIZ9dH?=
 =?us-ascii?Q?Tr7ywxd2dELs2gWrtHnEStZo+O+BSJoTkqWz+TAtHR8bwMYsRvSs+7WY+08k?=
 =?us-ascii?Q?fFjLpg3hbbKp1/7kFGkpGG0YGgi55FJgsGtwkuv9uwDpjtkZzaHFn1WFVVLg?=
 =?us-ascii?Q?eTzADsuNbeubkf2+vPDkYhK9S9HyDYfSvQg8oQjCV4F1tLhQ1Tcn3N+3Xc1y?=
 =?us-ascii?Q?2ThCaeooLpTKcXeAwcZrl78aCvHPg7Lu3wzbwx7EHH7jBcD3cDOze7MjgjGa?=
 =?us-ascii?Q?2kuQ6ymxR8H/J+PZ46oOKr3SH1D3SAmNXZymjc8bV3MopkTZH6PwMXMZbTcR?=
 =?us-ascii?Q?AqCCvAq2P4EuzUEHvH4SgBEA?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c863af8-d35a-4185-25d9-08d9834c5cf8
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2021 13:23:45.1454
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V4So5Z465Az18rgKRJDPwSkLyYHwTIpNPSIqQi7X+yUNnNCiIHpqTfVOwT1a4im41wzjjWaZvwC5xTSmkqGIoA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2333

On 29.09.2021 15:16, Oleksandr Andrushchenko wrote:
>=20
> On 29.09.21 15:54, Jan Beulich wrote:
>> On 29.09.2021 13:56, Oleksandr Andrushchenko wrote:
>>> On 29.09.21 12:09, Jan Beulich wrote:
>>>> On 29.09.2021 11:03, Oleksandr Andrushchenko wrote:
>>>>> Sorry for top posting, but this is a general question on this patch/f=
unctionality.
>>>>>
>>>>> Do you see we need to gate all this with CONFIG_HAS_VPCI_GUEST_SUPPOR=
T
>>>>> as this renders in somewhat dead code for x86 for now? I do think thi=
s still
>>>>> needs to be in the common code though.
>>>> I agree it wants to live in common code, but I'd still like the code t=
o
>>>> not bloat x86 binaries. Hence yes, I think there want to be
>>>> "if ( !IS_ENABLED() )" early bailout paths or, whenever this isn't
>>>> possible without breaking the build, respective #ifdef-s.
>>> Then it needs to be defined as (xen/drivers/Kconfig):
>>>
>>> config HAS_VPCI_GUEST_SUPPORT
>>>   =C2=A0=C2=A0=C2=A0 # vPCI guest support is only enabled for Arm now
>>>   =C2=A0=C2=A0=C2=A0 def_bool y if ARM
>>>   =C2=A0=C2=A0=C2=A0 depends on HAS_VPCI
>>>
>>> Because it needs to be defined as "y" for Arm with vPCI support.
>>>
>>> Otherwise it breaks the PCI passthrough feature, e.g. it compiles,
>>>
>>> but the resulting binary behaves wrong.
>>>
>>> Do you see this as an acceptable solution?
>> Like all (or at least the majority) of other HAS_*, it ought to be
>> "select"-ed (by arm/Kconfig). Is there a reason this isn't possible?
>> (I don't mind the "depends on", as long as it's clear that it exists
>> solely to allow kconfig to warn about bogus "select"s.)
>=20
> There is yet no Kconfig exists (even for Arm) that enables HAS_VPCI,
>=20
> thus I can't do that at the moment even if I want to. Yes, this can be de=
ferred
>=20
> to the later stage when we enable VPCI for Arm, bit this config option is=
 still
>=20
> considered as "common code" as the functionality being added
>=20
> to the common code is just gated with CONFIG_HAS_VPCI_GUEST_SUPPORT.
>=20
> With this defined now and not later the code seems to be complete and mor=
e clean
>=20
> as it is seen what is this configuration option and how it is enabled and=
 used in the
>=20
> code.
>=20
> So, I see no problem if it is defined in this Kconfig and evaluates to "n=
" for x86
>=20
> and eventually will be "y" for Arm when it enables HAS_VPCI.

I'm afraid I don't view this as a reply reflecting that you have
understood what I'm asking for. The primary request is for there to
not be "def_bool y" but just "bool" accompanied by a "select" in
Arm's Kconfig. If HAS_VPCI doesn't exist as an option yet, simply
omit the (questionable) "depends on".

Jan

PS: The more replies I get from you, the more annoying I find the
insertion of blank lines between every two lines of text. Blank
lines are usually used to separate paragraphs. If it is your mail
program which inserts these, can you please try to do something
about this? Thanks.


