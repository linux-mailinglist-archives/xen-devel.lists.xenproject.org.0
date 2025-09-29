Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50994BA8736
	for <lists+xen-devel@lfdr.de>; Mon, 29 Sep 2025 10:49:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1132649.1470941 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZH-0007HC-NV; Mon, 29 Sep 2025 08:49:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1132649.1470941; Mon, 29 Sep 2025 08:49:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v39ZH-0007F3-JZ; Mon, 29 Sep 2025 08:49:11 +0000
Received: by outflank-mailman (input) for mailman id 1132649;
 Mon, 29 Sep 2025 08:49:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NbRY=4I=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1v39ZG-0006Tl-4b
 for xen-devel@lists.xenproject.org; Mon, 29 Sep 2025 08:49:10 +0000
Received: from DB3PR0202CU003.outbound.protection.outlook.com
 (mail-northeuropeazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c200::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2525c4df-9d11-11f0-9d14-b5c5bf9af7f9;
 Mon, 29 Sep 2025 10:49:01 +0200 (CEST)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GV1PR03MB8109.eurprd03.prod.outlook.com
 (2603:10a6:150:20::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Mon, 29 Sep
 2025 08:48:58 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::b8c6:f37a:987a:beb%7]) with mapi id 15.20.9160.014; Mon, 29 Sep 2025
 08:48:57 +0000
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
X-Inumbo-ID: 2525c4df-9d11-11f0-9d14-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oX4joyaV4qutFshZNFu1LMTgCAs1vo8iif33nLZ0OgBr9uqDrrvn1Z1vWg8cGpe0IYPhd1u//Mh2fot9hwch1RoY5qOhETU99NBU07zDrr41bYl3WxpUcW3T/wvUT69sL/OAA5PBFZ6mwLewQsm1/o0oQyLgS4I4CRUsZF+lS8Bdi4lehtl8BpnEsfH41pMoaqVIJTSYJDZeXUWp4NKCakDksy1XfgX44MZtSduzJ96h/+0ig2b11nt3MV8YufIC0FwwKZzAx3gKOjXG4m9kdnaYy6xkErhWGNsvGtx8e4ar8aFndIoW+j3rltt5hBo9N835iymqoRnd91WA/W2opA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=473GSDVLMpJl1ZQAXxO45hU8uScDcpmMAD2GZKlDRyw=;
 b=O1Ivj3cmCtqSKtHrWai5Qe/M5Buxqh+9dxUawt+d/O+xAg46uLhvZY0gKPH6hZ7AyCG4KKwpKI6LXDU9Uh4PLn3XZtsU5F5PU7nfK+Esku2lCo76TI7ty+dmpRu2isMlD7ua1gmILDdB96CoGEbynQPlYZN47bwYkuXHDDB5qZPMq7Pg3Gzvkubmx8WILvTiuYjdzjv7DGU1/LHZnFc6lPu5ysACpsq/QAnNQXe0ThCakoW6nhdwfVBIhIHV5our+0DbN9ITmueIrOh4CHtXZkweYBYG/riM/aJDueG5TRpNzRjge3hwp12JTiaU9YinmxmEYF2JsDmJUGxbIJBg7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=473GSDVLMpJl1ZQAXxO45hU8uScDcpmMAD2GZKlDRyw=;
 b=JSjjJogXfzgwM6ec8keswL3BEQCq3c8tR4EMxo+ySQsxCUkYzYZiMasC7SdNsRq1niWWDbdH3VNrw0lPbqAsalL2jAFz+fXUK+36eC262mUKBRiPeE3tBK/aTvsiLPvncEkOjqJvXee+Rim1PL2Tu53jofH8KkiEwmqRTN8nCNfzkfB1fABxbz0xuHFfY/LJtdAlyT+vRCxeviRCTHjtnWi2NGk1j2SrivYh8shTGY5QrwvJkIt0L5k30kbxKKyrbtzsY9TWzLNBQUqZ3No3cqTotFlEZsaLP2XQCdLq7bnlwkr0QZCERYdMSp+P6mNWaiqj7j68Lz5ZIa3Q+0tqsw==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Mykyta Poturai <Mykyta_Poturai@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [PATCH v2 0/4] Implement CPU hotplug on Arm
Thread-Topic: [PATCH v2 0/4] Implement CPU hotplug on Arm
Thread-Index: AQHcMR3kP6l96o/PGU+srPxQ0vcF3w==
Date: Mon, 29 Sep 2025 08:48:57 +0000
Message-ID: <cover.1759135193.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GV1PR03MB8109:EE_
x-ms-office365-filtering-correlation-id: 9a0ebecf-2ed4-439c-78a9-08ddff35072d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?NMIqdK+4QGtqFnu9bytI+sg7n9+C2bteRBKLvtj3dt9/e48cgtHvF//xAW?=
 =?iso-8859-1?Q?qLfSloIZebxXY9LYeTZdNghkcx3Ek4vtD1KuI45pX9pGpEvagJDwhn+wVH?=
 =?iso-8859-1?Q?MKRFYQTKZ8XOBanaOT898qWok98h5kCzDZAKM12YzfCL9l44qQO29TjqOf?=
 =?iso-8859-1?Q?T4itRpoZKZQQzE3wnR3NQ1q49WnPSMd2jAm6+WbAzuMElbTZruomn4poRf?=
 =?iso-8859-1?Q?pvCZZUc7HR6eGD2JO4FUe60HON5xNzSITHqhkOjK7dEUCfXa18btKBcSD/?=
 =?iso-8859-1?Q?vYXOzrlwqsrbU1R0vPp2JmVO62E52oN5MOAHhY/tGi0adfL/nbkmwfthb7?=
 =?iso-8859-1?Q?O5vQyhovTIW13boUbdtggbhCe5xbAJKGfHZTm/UGgt53f1ozvJ+5ceMkol?=
 =?iso-8859-1?Q?GSx5i7D6RZ8KB+0tszzPSKUfRG5MWN4Hl4yL1TyLw6XLVUYbOlufyIKbTk?=
 =?iso-8859-1?Q?u04vQwZrmmWoz65RYOzgw+zz4FxsE1ISG8/DdTUstMXZujLMY7MfcmOPp/?=
 =?iso-8859-1?Q?JbbixfvNl8EBHgtnPeGeUOHTxnu1RQrGmsRPYwOBAJT/5ebrb16PX3w/YD?=
 =?iso-8859-1?Q?Ilq7OiyuMNp+TXLV6XIiZNnjEsCX1Ebb/hUOSdRk50bXTZJ4ztc+bZ6VYz?=
 =?iso-8859-1?Q?Bj5kqkomvU9OTnmcZ0hjyKJFWJL1eDazPY6b7RIoh65doQNwo6VcLeUqoK?=
 =?iso-8859-1?Q?gy/TUxLgTd4ca08WdLJNRUfSfRLe8H7jFmDsXzsJW3ef1GIl/2jBs+rE0p?=
 =?iso-8859-1?Q?35DJ+Fe0bOC0kao/xZAs2wNr3Ufy4md8F3mrjXMI2p0ggPhOaN/WAhEoLY?=
 =?iso-8859-1?Q?NcWX8KU/cA/9+PVDL5oUznVm61d6wMXLmIaW6CHk/urfPBegXhbjA4HMTa?=
 =?iso-8859-1?Q?wxIn5qbf4809Q2kIG2VTCL9UtvzfqpEZPXAx7T06roKIGwax9yD8JQhiI+?=
 =?iso-8859-1?Q?+bpOGpkscaWzil1+1QstYz+U7knMKoyN9hwK9k0dkPdHjlaxNobdZpDJd9?=
 =?iso-8859-1?Q?ALy2DC/aCZWKXzMhmuIpx/UnkPnVTNXipdUQF70lvvrP9xOiAKf1qLTzcg?=
 =?iso-8859-1?Q?RTXl8e3gOoMy6GcSnYP5IokIAiqeKskC1dQGvfcjEMjMdAFzX4OLkTgLHi?=
 =?iso-8859-1?Q?GuCNbV26pn3LbPmNpx4tQ04jCUfrRvgxh944I5mHFR0kftgfhNy+v4W8JW?=
 =?iso-8859-1?Q?VKDT9Fe3+kh0AKSX1vnIj9dQXo3D6tICFbOpSVAdFMejVGSpCC4SUDHJOD?=
 =?iso-8859-1?Q?lGfPjbh7ZN4piUezWXi5L3w91dmURAoPM7w9DILBHVCJLIBzJEEjwKIWZK?=
 =?iso-8859-1?Q?5odRlE3ulZ1TsEF24CiqwQXLYkZVjMF5ucQst6beHaGFIx1bNNaFYljYU+?=
 =?iso-8859-1?Q?A5Bb4okv3FNk6vXRoPN/5+yNntyzH2Ewc641KS5aU7j7OePAdOY7Sjo+y2?=
 =?iso-8859-1?Q?rIvERDYT4/zKZ98gcb1MGeSxO8R1lOwyDTkajCRSyoV4QuKYUZTxgU6j2G?=
 =?iso-8859-1?Q?HrqL/JjtJRTMtEYpWMaGJjlErf1LgDdF3EuRe+qD08FZM5Zq3gViPRL9Ar?=
 =?iso-8859-1?Q?5zNfrZEKQ2Ws/4nrVJqhd0wIkv7S?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TrYJ3qoMgr9LjIBgGytWghvVIZR3IzLonscXjD8+QM+kZm5CUmrxtNMjBy?=
 =?iso-8859-1?Q?q/1q1rgF5i28OkTGe2VhuFXVz7WT/6ORr9dkhGHiZbMPU4TpTCu00+F66k?=
 =?iso-8859-1?Q?4OqwOOgQiCGA3qSNaDDOUg1P3jfF/h3BicJF5L7fZ1NnR2SsHtbJYBzyO+?=
 =?iso-8859-1?Q?pc+UYDCZr5BitnBIcQCcqVqilsXRRUJRRIZDi+PID6Os4wY3FHRk1lnM2o?=
 =?iso-8859-1?Q?pMIGsAmxJebS032WYq7DUDncagOcboyX99aLIEy0sO3tKkqxUS1mTZLrv7?=
 =?iso-8859-1?Q?2VLu+dEUSF+YmmUhd1IlgZ+sXklPuFy5PWT4g9rpeBU1i4yQ9cNIqxo5A0?=
 =?iso-8859-1?Q?7C6yzBAhssAGnslIyd8fI0bY9NSqpohLmOF6k7w5rMigFYsghzW02j/IM1?=
 =?iso-8859-1?Q?xFL5s40RXXPGqaSKfoHdW0BEogW649F08BZ9J+94Qqni3Ua/6XG40zAQJr?=
 =?iso-8859-1?Q?abBNwX0hmPd0UTUeMqwl92De1empZ7DzDra4sC14th22vnWWJfUb3q0pjK?=
 =?iso-8859-1?Q?+nRS8R+dZFTqZUsZpiogGsD4vT1wWvzj4v7s2aTG7oOOWUQSVKpVrWfYIx?=
 =?iso-8859-1?Q?crFGauvUwCXJn2du01TcnFYbFHqeWVh+iO9J/I+QeH9x4ReUP0yKVvUEhO?=
 =?iso-8859-1?Q?lO9VzZp8NaIcGrFaUQd8wmXPvJTln5N8kBFaIwUdJkPzsIUoWFwNIDOERW?=
 =?iso-8859-1?Q?UIIujYbUO57/5XUQwMtlscjzsr09jzbsPrxh26yBQPN9hggOixZErOJffY?=
 =?iso-8859-1?Q?BGO2bTJVK6cBeXwBG5D2e8JsKfJeC89UpOAyPrCPxeF8ajW8qZ0BZRjdzg?=
 =?iso-8859-1?Q?kqpUIEMs0+t5erNehECeLxtS18ntt7TkRGY/Yd8Dux4Z4X2gvK3zee/E8r?=
 =?iso-8859-1?Q?hqUyadRyO1WNtCHZLe+T7IOYD5mXPagrbrcCorHDF2hioWnaPFGYUNgcJ3?=
 =?iso-8859-1?Q?O0a+xUSkVQGOodBs0Kv+AInkukiuMnl/AGp0xu7D39gn+oZi2HP4Pxtnt5?=
 =?iso-8859-1?Q?KQEFN5ivHqgPz/js07p/B4/Z38q8RUuONEweDWdtZ8GO0ySZSJqUIbcFWT?=
 =?iso-8859-1?Q?abGFeIdFe59JwuKhIX2dK3XI5WvfxQ8kA5GdN8bGdB7XiJE/JOG+AtWtSM?=
 =?iso-8859-1?Q?Icts1qyB4+g9PtKrAeU3PxSao6opO5NqEBLMPFxoHfAMw3CGvb880ZRyST?=
 =?iso-8859-1?Q?KOp7TsdCyxTvZYoVrPoonu8ecpEV0IDG5zzIQYZQmkKv/ePRK+z2civaep?=
 =?iso-8859-1?Q?HdYKYVsUqayby/aLjk8Hic5RbYUyB6n2cLeA80FZa6RUUAmP9AgfbQn0eN?=
 =?iso-8859-1?Q?Xg8wYz+qlnNKKmkmGZC7dEUASvkIkKGa0p3LazVPo7rJ/Il0lRhNCOIE/A?=
 =?iso-8859-1?Q?3rzw/1I+DGzHeEp9Wp/WgisCCqhifwjsmF+NVKcNray5njU2TIaBOcFQCo?=
 =?iso-8859-1?Q?CBCpO/VTnuNPkKYsWXF/yaiN07DWwNNrh62Tsoh9lBjxas48ep7q8h8tNj?=
 =?iso-8859-1?Q?3Su9NmjaZsU1NL1xShejdlzJHdzRLi/EidfXJX7omh++cilR+UJU6a+Ab/?=
 =?iso-8859-1?Q?NCAM5nPTeaqSjvKaVWqkwGXl7TKo60IVSyh0KeESCXV/coGzHippIemI/N?=
 =?iso-8859-1?Q?hVspg2gwJDAW2Krlffw1u6KY2tjVw6NP4S7WdzAVKdRDaXSdC2GKVjHg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a0ebecf-2ed4-439c-78a9-08ddff35072d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Sep 2025 08:48:57.5004
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v3twRJYkCuBELluboHSkAFuK4UUqSqaed9HBmee48Npe6gqDYHi/rbr44ynrG+YxDBfr5wUawCHWoxH1SPJmZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8109

This series implements support for CPU hotplug/unplug on Arm. To achieve th=
is,
several things need to be done:

1. XEN_SYSCTL_CPU_HOTPLUG_* calls implemented.
2. timer and GIC maintenance interrupts switched to static irqactions to re=
move
the need for freeing them during release_irq.
3. Enabled the build of xen-hptool on Arm.

Tested on QEMU.

v1->v2:
* see individual patches

Mykyta Poturai (4):
  arm/time: Use static irqaction
  arm/gic: Use static irqaction
  arm/sysctl: Implement cpu hotplug ops
  tools: Allow building xen-hptool without CONFIG_MIGRATE

 config/Tools.mk.in               |  1 +
 tools/configure                  | 30 +++++++++++++++++++++
 tools/configure.ac               |  1 +
 tools/libs/guest/Makefile.common |  4 +++
 tools/misc/Makefile              |  2 +-
 xen/arch/arm/gic.c               | 11 ++++++--
 xen/arch/arm/sysctl.c            | 45 ++++++++++++++++++++++++++++++++
 xen/arch/arm/time.c              | 21 ++++++++++++---
 8 files changed, 108 insertions(+), 7 deletions(-)
 mode change 100755 =3D> 100644 tools/configure

--=20
2.34.1

