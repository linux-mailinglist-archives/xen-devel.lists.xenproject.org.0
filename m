Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D9B480E64
	for <lists+xen-devel@lfdr.de>; Wed, 29 Dec 2021 01:55:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252271.433259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2NE8-0006Bb-CR; Wed, 29 Dec 2021 00:54:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252271.433259; Wed, 29 Dec 2021 00:54:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2NE8-000693-7V; Wed, 29 Dec 2021 00:54:00 +0000
Received: by outflank-mailman (input) for mailman id 252271;
 Wed, 29 Dec 2021 00:53:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wrt3=RO=renesas.com=yoshihiro.shimoda.uh@srs-se1.protection.inumbo.net>)
 id 1n2NE6-00068s-Ex
 for xen-devel@lists.xenproject.org; Wed, 29 Dec 2021 00:53:58 +0000
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on20700.outbound.protection.outlook.com
 [2a01:111:f403:700c::700])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c928e284-6841-11ec-9e60-abaf8a552007;
 Wed, 29 Dec 2021 01:53:54 +0100 (CET)
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 (2603:1096:404:8028::13) by TYAPR01MB5054.jpnprd01.prod.outlook.com
 (2603:1096:404:12c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Wed, 29 Dec
 2021 00:53:47 +0000
Received: from TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::f167:7435:432c:ebdc]) by TYBPR01MB5341.jpnprd01.prod.outlook.com
 ([fe80::f167:7435:432c:ebdc%5]) with mapi id 15.20.4844.014; Wed, 29 Dec 2021
 00:53:47 +0000
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
X-Inumbo-ID: c928e284-6841-11ec-9e60-abaf8a552007
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjUcBrgqNZxFAXn2A1eS5org1APEztmZmxPYxxXDkUsB5Ibx+syVVRjSz2ILAqru+gS33TvVaKW/nTa1KIvNqxiVVjuZ8ofNALVYRchv2vQNxWavVFdFqfVhgMdvQzm/joZFKcNhzeJxVPJoVui8LxJoeRNyMRQP4MPoVsmGL3DXQn6NwuwLAWvdJ41bZOBzHypNuI9c6F+qrjXyiTmxBKzMJDPo/6s+QmCDNpj1Fcw2RxtC8hxC2em55Ix6UXtXWh0TryKFOJQSH2H3hexC5/sDZEzULjBbwEI4Uj4GDVfNiW7ss4bNA2BQdIrQ6y9wRNOtENGxXnPiJ53ChMGbcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U5BQyVqZN7sskrEGvzrguzybhnnr/gy2/aW5PDNK1lg=;
 b=n4bCht83b78i1iwJ8JM/SVnj8DsDkAfobFSB6O1cYkxvYf0/HCye2VZ/mLALomb0B43REi9laHMSH8/GbLSoxmWchn7r/T6hGDaBlveDReBECpgaEd8mqiCbzgLxn+7z60qKmC/MQCan8sMiXwLFFW1ZVognurlcjAZPWh65nfZbaeq7dJBIItQS5nluydhDJJLUvM6ruz3QaBmgXNYOVf6Z7NJ/ZCnOvt9gAhvObiAYbKS/Y6kjUa1j9v6iD/7TS6FKmesDYdYRjJDKQ3KxFoBJNw/VWVT0bb3N1G99UXnrlWmE+ZTICP2nYKiBGsYfEGulnwuw3O/pez9QOD1gMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U5BQyVqZN7sskrEGvzrguzybhnnr/gy2/aW5PDNK1lg=;
 b=MTHXYL1OMJ/lAn8wd8DSdC06ZzHMchVdYwS757TvzdMEq6B++HqSQzT1mhRF2lFRI1ghLzWJJijSDtQvTpN2guECRwjFSVkIz7isy0/ASU4d0ut8ZlOBUGVAfjjBCnwK0p8r1w7Wylj16DSniMshfXZw862hWF5lCdYAhkJ8fVI=
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Jan Beulich
	<jbeulich@suse.com>, Paul Durrant <paul@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: RE: [PATCH V2 07/10] iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car
 S4) support
Thread-Topic: [PATCH V2 07/10] iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car
 S4) support
Thread-Index: AQHX9ebXat4RyGuQs0+nEBbexUv6B6xIrxzg
Date: Wed, 29 Dec 2021 00:53:47 +0000
Message-ID:
 <TYBPR01MB53417B6CD4E3B6A575891A5FD8449@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <1640034957-19764-1-git-send-email-olekstysh@gmail.com>
 <1640034957-19764-8-git-send-email-olekstysh@gmail.com>
In-Reply-To: <1640034957-19764-8-git-send-email-olekstysh@gmail.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3f613c14-43f1-4ef3-bcad-08d9ca65abc2
x-ms-traffictypediagnostic: TYAPR01MB5054:EE_
x-microsoft-antispam-prvs:
 <TYAPR01MB5054E0FB356188B54DBD123CD8449@TYAPR01MB5054.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1122;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 Jf+PAlvizeF+1+Funj27suNTW9ARTsWxPM8X45W+NquEzXayTItedaYn/383poGIXNgVxkwU1169pJ8bwwzw6Ny5C+yMi5x2fO7YY0J0h6nBNiz5XWB7+pT3Cku8OFmz8kXzVCydy/3+q4B4SdlPw9FNFaupqayxsElvnBxWGruH+bNKiX58xPYWXeeA/qmn98f1BkvX1e9Oz7uKq7gACH1Aaba+SFdlYv1ngh+z2KfzRXe/bxTJmTN6q07ovZ4y+FnEMe1FHK4OrqVQDHXcQF5nWBwMt/4hTa21VGrUmIgQ00+HWMuzRThQJF6eM/rhPKm0ylvQ7flFmf1oEVMmrR2oIpvsI3BBqB3aiPu7xLuvtkAIcKZxnXM6uOWD6esHkSxO85cQsTfZvHA5MEOnk+zCz1Ovz6gCF4LcpcWt2orZAQVr3BfqsIMaiHc+odfVS/fpXoH1afUxrSmtyvFLyWsYetnPmy9mbSM0meTYozLVUt5miodJPaHF/o+jX+AydyS0b2BHHj4E8kjOurn2butKhHJkgH7kpFpYP0GcSfIOu673aQZ33nRKNpI+owE0m1fd23TQE/EFmFfHATGo7F6IA5YHNDG66Tm/1XRDPajYEM9SlhCAcljad7Fkhv/wOqMtiEgWb2zThAGbBhBZLXpeG+CFEkvKKDVcsvJwi2vUv6zHuPchzGFZ92aZkiYAYXuiRLmT3bAsCkf7RoASnIdSB+kSNck8K/1EHZmqrF5rIrj77vUD5HKWgTCK4ylua9Fws8Wqn9MgKY9uMtQUBWZVWDVLMVs3vlSAWis17/0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYBPR01MB5341.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(38100700002)(110136005)(9686003)(966005)(508600001)(2906002)(55016003)(33656002)(5660300002)(8936002)(52536014)(7696005)(38070700005)(8676002)(186003)(54906003)(86362001)(66556008)(6506007)(4326008)(316002)(7416002)(45080400002)(122000001)(83380400001)(64756008)(76116006)(71200400001)(66476007)(66446008)(66946007);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?nCyLPxeURCllxdFYygfzkOZV+NB1z+jihmYkxzmhrhCS1Ws7YdmEceg0hHdr?=
 =?us-ascii?Q?N9lNEgRsmVjkBZ+VaufG3qQMDe/mZ09XZP4BqwFf7C6o9y1GIGmzM+jA0PEL?=
 =?us-ascii?Q?6sWsWS2SPTXA2r2q1AeeuOKXfPgjJgnN2y4fV40/4Y+cAGYoaOYErINXvBCJ?=
 =?us-ascii?Q?UdKj/o1BvACATELYAavWF20ofD1n8Vc9DT7TctWEMXvWlnDIjqZBfx8EEcyX?=
 =?us-ascii?Q?2Nysx+42sl7cZNRvrQmr4XlnETsgWGEM25Q9mqs3yqe08hq81WzSL5g65bxA?=
 =?us-ascii?Q?E71ffjRkq1VmmIXz8ZuQ/RWd+EarsZy87O8ChfEnH6sY1q5wB/jDeRIWfYeo?=
 =?us-ascii?Q?Sbg8B12IJADWHjsEqvGMB9c2S1CIbR+pav5y93c0y2NWMavUx2mbp+1VdZ52?=
 =?us-ascii?Q?DXdk7IuHLftHlizZ6WAB7X0eG0xqO12EFc8+Dxkt6yYeKQK+m0SwAS2E39j9?=
 =?us-ascii?Q?yEjXHypWrGttqeV8t0OGBt+r0uZ+WzpwRb4UQ2g2Nv2rmjlgia08mdDZke6h?=
 =?us-ascii?Q?jnm/X0+PQ7SjKHIagldSbFfUxsn19oMoTJs0mYQhEeyoJjXqdiudto6EXivV?=
 =?us-ascii?Q?a6iVI3hpE5TNp3v+SlcHPbsuV7C7RqZ//9UNN8N7bOeAUOUKNH8f2/OIluP6?=
 =?us-ascii?Q?a3SLYZeTdsaZclMJ3qHz3+lini/YGKNMOOJQIakEOwbtqBEsVx75lZhkw45Q?=
 =?us-ascii?Q?Evm7xNRAgMqJ4HuFdFAYUfkT6VzGczNpx5ATPZjV2ZHL7PYKR/wD56UGXgPm?=
 =?us-ascii?Q?XvFCGf7UsBnNFaBQpibyc74M3JYazGj99ZTZBaqWVX4Ruh9VN/Yy6oUgg1aN?=
 =?us-ascii?Q?R880l8m8YFcyGiC3j4PkAbM8mrc2gtJ1vlNxwdkKGu1/KnrBo2nS2PnPRAOn?=
 =?us-ascii?Q?Kf8SxHTFeYp1dC/zD3/b+DVhDECAGqZRpFsEJQCUsRDaBADskjhnnlJAo6Ga?=
 =?us-ascii?Q?HaDNEDUisN8TqGV1lfDOzFjnoCR5ULeGCocOh2cqkGs7PaiZhbupG0LZl5L/?=
 =?us-ascii?Q?yUTNLtL2kOu8MvarpzwAk2mekub1egKOKVK5hKJ6NsvweQKGh2/GeFei+P0G?=
 =?us-ascii?Q?2lX3L7lrP7byu7ab6lthD1hvtgJtTDf6LEasn2Ih0TBf4OwRH6lsAOiSGRFM?=
 =?us-ascii?Q?xIQEcp+Ba8APFTidVFPZSV5JeA43YW4oJWkj6VmRtwWiJNLs8ooIXjCwTwNK?=
 =?us-ascii?Q?qjeWWIk5JBj+UuUopLvXq4VsWifov1L1I7E8CKAQ2zeMLacd1mzf9aYAgkHZ?=
 =?us-ascii?Q?9eLEXUmhFZ6osVuDY9ZOtNLpzBq4io1V5+9QBIT+lUwRDyHUsSDMsY3ghgsc?=
 =?us-ascii?Q?k3c5JlO3NmTDrBeH8XieQLAaflY7pDBtt9KFHdxvLOVYSiwAweZovKaCcO41?=
 =?us-ascii?Q?NxISiZU9C5gqp0qlxRsLN1lExi3edaTxqMvZAuyHB18Ib29asAZ0BvNAlIlU?=
 =?us-ascii?Q?/NscFgr25wx6V5Ll0AYhPXGQLa9QJEWo4Fi0jCjTw+sf2PlcLtgfFoXPDwAj?=
 =?us-ascii?Q?Hrc1kvE1g3xGybwvndNrVrmwo4iNCvoyb+hMNnTnUW3Knq73coNQhuxulOGf?=
 =?us-ascii?Q?ccg9x6E/J8npXc+lXbI44zpQPIgEsSKw3GBiwfod1DXBOSbM3eWVKSVLWxkE?=
 =?us-ascii?Q?djfSCbE0Et7j12AVPDxWg1HiE4pvDsl4c4xv7fGagVdjr70UBs/So7ZhLLt/?=
 =?us-ascii?Q?+i91/lEMC94E5JltVMd2o76oXh2KLjxrzYgzfNwZW6+dkUG0/bUQw2XEvDx0?=
 =?us-ascii?Q?ZQVYDvFzV3/A+49XtDfy6fpZdbPqFmIaSOoIckzaVwbKzmEb5Can?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYBPR01MB5341.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f613c14-43f1-4ef3-bcad-08d9ca65abc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Dec 2021 00:53:47.0983
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E3SnZl9Ak/T/Q8oGTbjiGfmCepEpsBQ063xurf028HpWEsDZRlCu3LFduQ5dpcIq294YDb0SvYH0hNtSUnkUSa66YXerYMWqJs0RD1kEXRgqMcj6FsTlFRfLScPlF0xP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5054

Hello Oleksandr-san,

> From: Oleksandr Tyshchenko, Sent: Tuesday, December 21, 2021 6:16 AM
>=20
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
>=20
> Based on the following Linux upsteam commit:
> 7a62ced8ebd0e1b692c9dc4781a8d4ddb0f74792
>=20
> Original commit message:
>  commit 7a62ced8ebd0e1b692c9dc4781a8d4ddb0f74792
>  Author: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>  Date:   Tue Sep 7 17:30:20 2021 +0900
>=20
>   iommu/ipmmu-vmsa: Add support for r8a779a0
>=20
>   Add support for r8a779a0 (R-Car V3U). The IPMMU hardware design
>   of this SoC differs than others. So, add a new ipmmu_features for it.
>=20
>   Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
>   Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>   Link:
> https://jpn01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flore.=
kernel.org%2Fr%2F20210907083020.907648-3-yosh
> ihiro.shimoda.uh%40renesas.com&amp;data=3D04%7C01%7Cyoshihiro.shimoda.uh%=
40renesas.com%7C995a1c66b6d841ccc79a08d9c3fdf
> 90a%7C53d82571da1947e49cb4625a166a4a2a%7C0%7C0%7C637756317833053012%7CUnk=
nown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQ
> IjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=3DTirhJToNqy3=
3Fzt0tSpukl9YFOj4iHgd3M1lX8W%2Bxlo%3D&amp;res
> erved=3D0
>   Signed-off-by: Joerg Roedel <jroedel@suse.de>
>=20
> **********
>=20
> The R-Car S4 is an automotive System-on-Chip (SoC) for Car
> Server/Communication Gateway and is one of the first products
> in Renesas' 4th-generation R-Car Family.
>=20
> The integrated IOMMU HW is also VMSA-compatible and supports
> stage 2 translation table format, therefore can be used with
> current driver with slight modifications (thanks to the prereq
> work).
>=20
> In the context of Xen driver the main differences between Gen3
> and Gen4 are the following:
> - HW capacity was enlarged to support up to 16 IPMMU contexts
>   (sets of page table) and up to 64 micro-TLBs per IPMMU device
> - the memory mapped registers have different bases and offsets
>=20
> Please note that Linux upstream doesn't support R-Car S4 SoC
> yet unlike Renesas BSP [1], but it was decided to reuse upstream
> patch for R-Car V3U anyway as the IPMMU HW settings are similar.
>=20
> [1]
> 7003b9f732cf iommu/ipmmu-vmsa: Add Renesas R8A779F0 (R-Car S4) support
<snip>
>=20
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>

Thank you for the patch!

Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Best regards,
Yoshihiro Shimoda


