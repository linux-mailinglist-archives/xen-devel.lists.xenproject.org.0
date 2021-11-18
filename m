Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F408545564D
	for <lists+xen-devel@lfdr.de>; Thu, 18 Nov 2021 09:09:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.227164.392806 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncTM-0006R8-56; Thu, 18 Nov 2021 08:08:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 227164.392806; Thu, 18 Nov 2021 08:08:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mncTM-0006PK-0J; Thu, 18 Nov 2021 08:08:44 +0000
Received: by outflank-mailman (input) for mailman id 227164;
 Thu, 18 Nov 2021 08:08:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nol9=QF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mncTK-0006PE-Jc
 for xen-devel@lists.xenproject.org; Thu, 18 Nov 2021 08:08:42 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bcb78972-4846-11ec-a9d2-d9f7a1cc8784;
 Thu, 18 Nov 2021 09:08:39 +0100 (CET)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2175.outbound.protection.outlook.com [104.47.17.175])
 (Using TLS) by relay.mimecast.com with ESMTP id
 de-mta-13-gO3ffBlTPty-TU37pG8BEg-1; Thu, 18 Nov 2021 09:08:38 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR0401MB2605.eurprd04.prod.outlook.com (2603:10a6:800:57::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20; Thu, 18 Nov
 2021 08:08:36 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::8062:d7cb:ca45:1898%3]) with mapi id 15.20.4713.019; Thu, 18 Nov 2021
 08:08:36 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AM5PR0201CA0015.eurprd02.prod.outlook.com (2603:10a6:203:3d::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 08:08:35 +0000
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
X-Inumbo-ID: bcb78972-4846-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1637222919;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=v3TPNVccdrcAebodlvtYNj4JZi6Q2AethMF5xAeeejM=;
	b=DkFZBZ2Wqa2n3754VyjohumuuDRAWXCJKiov/AWdjhXP+vJxjGj2k00QLni7woWb3mgQ7L
	7pw+/rSJgWuR9GZByDBAklu6jkV5WjX5O2/S4bT0ww9/ucqV4ASWpgSn6slrZObGzPxnL6
	uLhSPxmEVQybQHeetffPnDR/mNS+O1M=
X-MC-Unique: gO3ffBlTPty-TU37pG8BEg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIjPu7xTiyCnc3Qjy6wco1Vstj4weTGBJCIJCkNZXPTjNTzA9ppFT6iHjCscYOx6lQ7a5yCt+UfJLRRC2IgIFkjFAuSoPYL8NIU7s9cdazGQjFeryDa7tIUKmuacCL48dMOpYzb1be+s+qJlALEJI9sv+emABPb9IOj8Gix+TLrIV+zI/TDsUUH6mT9Sbfnw3mUGhYgZycGDK/tXHamJb6iY4VU5iqnQDLOtg1S+4RgTmXR4YYmVqUhaV8uDO3gcvvrXgJIkJ/xV2Z4K4x6AjPNTMzYuw9Tc5+z5jzlbjsuFK9nFkysrD0w6y6VQFIQRTN24JxG5Fa/bpYz7sYs7Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VxRyreEDEqFACnbtzNddexK+m4lB6miLPve8d8QolxQ=;
 b=Qf6OTSeznFtJ7jp5wNfVkmsDWew3q3Mf+A0tri+LqN6GkJJ87O3JcGo7x3h448My59PYHza6xd8GDLJ3jG2r6TBNBhpmSh19rUjrv5CPtV/CdshaoGCbGKQLKgx33b0HPcyrZMGbZRPdxzdoTjnJsky/sS0ffvy8cY3B7YtOFGw2fkC9ri5Dt4VIYWNIK88AoytbMSPUNk/9w5svlcJiwPOBqkwP9nCTi4NmIhyKo8u5Hp6X/otlFHFCUc5/972AuFK/wnokNMqLPni5W6/TtNUou2ipIhA3U4TubgN9ekQFtVcwlO9LEChosdoXn0ASejmQOw3waKBOnuhyhbK2WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <35744782-674e-b21f-7cff-76e90152e843@suse.com>
Date: Thu, 18 Nov 2021 09:08:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: PCI pass-through vs PoD
Content-Language: en-US
To: Andrew Cooper <amc96@srcf.net>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Anthony Perard <anthony.perard@citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Paul Durrant <paul@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <b6d598cd-c244-2b7f-c731-fe839df3382e@suse.com>
 <b62a87ca-b68f-76fd-51c6-114e8b8e125b@suse.com>
 <YZTDkNRY5pMLFUR6@Air-de-Roger>
 <fe31a1b4-8c66-701d-f951-6426fa72252c@suse.com>
 <d2650a7e-f681-301c-6959-bc84a502255a@srcf.net>
 <3d7d5069-591d-4535-c13a-5976e1172a68@suse.com>
 <5c503268-f729-ae02-c9f0-d015cdc747f9@srcf.net>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <5c503268-f729-ae02-c9f0-d015cdc747f9@srcf.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR0201CA0015.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::25) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c5e8e880-7ec4-48aa-2c95-08d9aa6a9f48
X-MS-TrafficTypeDiagnostic: VI1PR0401MB2605:
X-Microsoft-Antispam-PRVS:
	<VI1PR0401MB260512EFB9CCD0E77DB2265BB39B9@VI1PR0401MB2605.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	O8HqEuw2YOo69tI6ZrlQDxJmEO7P7XGZlsCR0d70sdTwAJP5ZKZesOo9OZlJRosZrQqOIOA8huN+5KoKuZJj+5BePOr9lN9pOKtzUiY/PnVny3G+Iyjg1Q1DjXsjxCPmkEcID6EuSTcv+bli/amaCUuUVlQ0L1xLbaBmG+Ig65iyQnSA4J03k5sGipjWn0Sjaqym34nWoLD7osHPkntbXPCFFn5Pa3mH9bX6b+rWeo0tQfFt19np6srLQgIKJDUCDSugPi1ril3aWpHPSIkCyEkoIBfADNLfZ727VabMBrfQA5qJxG3G8Nwipehl5+z6tso/421qFu+myaHZjZ3nFhoLBZrWvFu15XBsReX7E4Db/LOQv5Lf2VsJNI2uUZuPYRw4cJuEGm1pHs6gXLTxSKW/tMmzUZy57YujdKmK2W0ubDlBYHy+R4Q6KAWKC7nkXOEJ0Q4KuxVS1J+E7N6CCRUEXWaJabxPM8plJ/eQaHXMm/UusoqqNfoHDuBv1bu5XB97boWHlGS/7bM+2JWvy0gHdfPJi/HgrYHsrCJovEu4fyNYBlYScIU7Bs3BZRzI9KVsNzEh3ojYrpvs3s9RoIakiy/+RKxFk3PjvRCiZa9A5HOKGycHQQv9BFb4NPp95UwGp+ZGD1NQzO6WIsmetOf4NzbG6++bIReW9VUZ47oyoyz9wrBFO5sLOKfdw+5ZIunBBIVcr1qcx07iGnt+iYfae9wgy97nDAkrCYrCYu0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(86362001)(6916009)(4326008)(53546011)(956004)(6486002)(26005)(8676002)(66946007)(83380400001)(31696002)(2906002)(186003)(8936002)(66556008)(66476007)(3480700007)(54906003)(2616005)(508600001)(36756003)(31686004)(5660300002)(316002)(16576012)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TO1ch9Zhm35zWQE+FHIuFau0ne6ei4/q8pG/jjsytW39+AsOKzyWo+hwDOeX?=
 =?us-ascii?Q?JEaQ+ap7h8+VqHvrIVLtSNE4V/KX3XXfFLUjeOA8pTxvU0rrBNMFXP8xrukQ?=
 =?us-ascii?Q?ztaigRzFg6a+yUCOAPl52A4eWU/VU3F/0n7u9IviwbDd3NyUnJIfAo5OZMTP?=
 =?us-ascii?Q?H5SCx1PhrTEW/NncZQm/xaj1wDSTNeb4/ROb0N0diwlaEEEogDWlfZk9TzfG?=
 =?us-ascii?Q?OC42BCixg4Mseg2X4EnTWxlT2LnhGFaNUHyvZJAmPtOsTvPaCh/uT6QoZgkx?=
 =?us-ascii?Q?hWDePuV2lL7rm3YhG2D9I8yfetlYPTTALt42i4f6KKs4pk/L9Eo5pS4cTW23?=
 =?us-ascii?Q?iCECKPF2d6V14QDYeEc5Sm9Y9vfETeG2MO2BOv3gQeODwY5ikW3O9DqybKVn?=
 =?us-ascii?Q?imk5lJhyaN/q0fr1B3EdCX+FlsNYgFVfg+ilxTOWDoNf72BtniZQSPBeL5lC?=
 =?us-ascii?Q?y/F/5k5yJ0dNyQh4xZ66Yat/ZIgoyYHGGcCmBAD8m88Xp4/tcn6DvNkWliqZ?=
 =?us-ascii?Q?KJ2XNJ8lkUTgEYVcBFEVhubOgjQfOmzYN3yieo7G08KEWZwsaR3AlpZwGU45?=
 =?us-ascii?Q?yD8uPwyxu0PBhEezRDrRSkVDRggV1gw9J3IvIFTEW0L0wtxzngBGrKovk2Z/?=
 =?us-ascii?Q?ZybVk/2YJRuTcGRRJ8uiLaJWs5dDTVKHRrBuwK5W60e0hXSIrS2C7R6vsda4?=
 =?us-ascii?Q?HM04KAW8pdVyr2V1NFxvdPSEhf1j+VUWiGUY91o0lv5ybLghmhmkQdypOJCl?=
 =?us-ascii?Q?ZoWrkJiX4s4NYwdhZufgTUE1cEQDg74b1ItKAIaYhrNvuazKGj67Y/KnzssI?=
 =?us-ascii?Q?K86/V97nCN4gvKS2QRRFa7Uu7zmp12K3gpeYaCXR+QpT7UKWThy/Li1JrUWj?=
 =?us-ascii?Q?w9niBYJqxS/hJKBQ2Fq8bjGiYvlzyfzPXqe9L5ujCIswuPnKpb/yECjszldF?=
 =?us-ascii?Q?dB/899iXupTChi9qFNBiarNLPwQ5oPskIdjLlX1L5AJTY+mR7Ci4cfg0KbO3?=
 =?us-ascii?Q?IdxELJFWUy3La00RfijtPGbsbb1cLWItcUvwNx5KdY8DlCciojo44/JeIetJ?=
 =?us-ascii?Q?MRnCg56MQhYSkDD85ljoJ7JFlS2KeikkZzuHSweQkt5qBVw/HtgbkuQTW+aY?=
 =?us-ascii?Q?2FLxz1YJr00J7py2EJMPzifZC0H4sOtvA08tDdlmmScw3JMl/rKan5Dn+wva?=
 =?us-ascii?Q?gEwq/TwFIj4LN+iI1qW7auq8FDma+iqxSU63lvaQu+JkNJFDpVKLwmFSSt+X?=
 =?us-ascii?Q?3t5i2nn+P1r6LNbagwAsxbwKPDr6O+sScyijbOyTFxyVg6N80JsblCHgFV+z?=
 =?us-ascii?Q?FW5tAifWcDaZGLb38IdhIiP1nqbBuQbBPWG0vXNmlI/R35w1JV2+fRaO7yy8?=
 =?us-ascii?Q?nQsZPsummgcer7NShCWw+mu1wUBXugoG5NBUWlTWKlH5mS2r5YbXeIpBx8SV?=
 =?us-ascii?Q?sbdzMZNPEbv3N1bHpCCyPlGmmwfsjTaVazjXjkoWbnwvw2b6Z8AygZrS0PJS?=
 =?us-ascii?Q?yPb1E/8pv4kWY1wnfZbLouB4Fb74BurCDd5r6AR57cOOeX+1IfechtDU6cVO?=
 =?us-ascii?Q?wpHS0ROQALiKCX2xGpaLgRjGQtCZcd9LEDOO2p0hUc0gh+BOzKtOLfr7CHR/?=
 =?us-ascii?Q?cleuvMJ924A9AuC+e8qHhDk=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5e8e880-7ec4-48aa-2c95-08d9aa6a9f48
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 08:08:36.6317
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBA/agAcKRQyfhXgRqGbAc5wAV6iNMivvpObVXWq4+pSuox4rIA1cnu1H838M1Lam4Wv7YEvEpinpUxAaeNjKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0401MB2605

On 17.11.2021 14:07, Andrew Cooper wrote:
> On 17/11/2021 11:23, Jan Beulich wrote:
>> On 17.11.2021 12:09, Andrew Cooper wrote:
>>> On 17/11/2021 10:13, Jan Beulich wrote:
>>>> On 17.11.2021 09:55, Roger Pau Monn=C3=A9 wrote:
>>>>> On Wed, Nov 17, 2021 at 09:39:17AM +0100, Jan Beulich wrote:
>>>>>> On 13.09.2021 11:02, Jan Beulich wrote:
>>>>>>> libxl__domain_config_setdefault() checks whether PoD is going to be
>>>>>>> enabled and fails domain creation if at the same time devices would=
 get
>>>>>>> assigned. Nevertheless setting up of IOMMU page tables is allowed.
>>>>> I'm unsure whether allowing enabling the IOMMU with PoD is the right
>>>>> thing to do, at least for our toolstack.
>>>> May I ask about the reasons of you being unsure?
>>> PoD and passthrough is a total nonsense.=C2=A0 You cannot have IOMMU ma=
ppings
>>> to bits of the guest physical address space which don't exist.
>>>
>>> It is now the case that IOMMU (or not) must be specified at domain
>>> creation time, which is ahead of creating PoD pages.=C2=A0 Certainly as=
 far
>>> as Xen is concerned, the logic probably wants reversing to have
>>> add_to_physmap&friends reject PoD if an IOMMU was configured.
>>>
>>> A toolstack could, in principle, defer the decision to first device
>>> assignment.
>> Right, which is what I consider the preferred approach.
>=20
> Why?
>=20
> Just because something is technically possible, does not mean it is an=20
> appropriate or clever thing to do.
>=20
> In this case, we're talking about extra complexity in Xen and the=20
> toolstack, which in the very best case comes with unattractive user=20
> experience properties, to "fix" an issue which doesn't happen in practice=
.

IOW you're suggesting to wait for the first report of this being a problem.

>>> and liable to suffer -ENOMEM,
>> Not if (as suggested) we first check that the PoD cache is large enough
>> to cover all PoD entries.
>=20
> Just because at this instant we have enough free RAM to force-populate=20
> all PoD entries doesn't mean the same is true in 2 minutes time after=20
> we've been slowly force-populating a massive VM.
>=20
> Yes, there are heuristics we can use to short-circuit the failure early,=
=20
> but that's still spelt -ENOMEM and reported to the user as such.
>=20
> The only way to succeed here is to force populate the VM and to have not=
=20
> suffered -ENOMEM by the end of this task.

I'm afraid I can't follow you here at all. The PoD cache is memory already
owned by the guest. As long as no new PoD entries get made out of thin air
(i.e. other than taking the backing page and placing it in the PoD cache),
there's no -ENOMEM possible here. That's precisely why entry count wants
to be checked against count of "PoD cache" pages to be sure.

>>> or we have
>>> to reject a control operation with -EBUSY for a task which is dependent
>>> on the guest kernel actions in a known-buggy area.
>> Why reject anything?
>=20
> Because the guest kernel has no knowledge of nor the ability to query=20
> the PoD status of a page, the only way to not have things malfunction is=
=20
> to enforce that there are no P2M entries of type PoD when devices are=20
> assigned.
>=20
> If you don't want to / can't force-populate the entire VM prior to=20
> having device assigned, then the assign operation needs to fail.

Well, yes, that's what I have been saying form the beginning. All we
appear to disagree on is whether tool stack or hypervisor should
actually put effort in doing such a force-populate.

>>> There is no point trying to make this work.=C2=A0 If a user wants a dev=
ice,
>>> they don't get to have PoD.=C2=A0 Anything else is a waste of time and =
effort
>>> on our behalf for a usecase that doesn't exist in practice.
>> Not sure where you take the latter from. I suppose I'll submit the patch
>> as I have it now (once I have properly resolved dependencies on other
>> patches I have queued and/or pending), and if that's not deemed acceptab=
le
>> plus if at the same time I don't really agree with proposed alternatives=
,
>> I'll leave fixing the bug to someone else. Of course the expectation the=
n
>> is that such a bug fix come forward within a reasonable time frame ...
>=20
> What bug?=C2=A0 PoD and PCI Passthrough are mutually exclusive technologi=
es.

I wonder in how far you've read my earlier mails properly. After initially
only suspecting this might be possible, I did _verify_ that I can assign a
device with the guest still in PoD mode, including before the balloon
driver has kicked in (in which case even force-populate wouldn't help, i.e.
assignment ought to fail no matter what). While initially I thought this
would have been an unintended side effect of f89f555827a6 ("remove late
(on-demand) construction of IOMMU page tables"), I now think this has been
an issue even before. There's no check in the hypervisor (in particular arc=
h_iommu_use_permitted() hasn't been checking for PoD so far, which is
used during assignment only anyway), while the tool stack checks only
during domain construction afaics (in libxl__domain_config_setdefault()).

Jan


