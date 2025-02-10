Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92DD5A2E96E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Feb 2025 11:31:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.884560.1294286 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR3y-0004hd-AL; Mon, 10 Feb 2025 10:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 884560.1294286; Mon, 10 Feb 2025 10:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thR3y-0004fD-5q; Mon, 10 Feb 2025 10:30:50 +0000
Received: by outflank-mailman (input) for mailman id 884560;
 Mon, 10 Feb 2025 10:30:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NzWh=VB=epam.com=Mykyta_Poturai@srs-se1.protection.inumbo.net>)
 id 1thR3w-0004Pl-FZ
 for xen-devel@lists.xenproject.org; Mon, 10 Feb 2025 10:30:48 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170130004.outbound.protection.outlook.com
 [2a01:111:f403:c200::4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 17a3c76c-e79a-11ef-a075-877d107080fb;
 Mon, 10 Feb 2025 11:30:48 +0100 (CET)
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 (2603:10a6:102:30d::12) by GVXPR03MB8404.eurprd03.prod.outlook.com
 (2603:10a6:150:6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.18; Mon, 10 Feb
 2025 10:30:43 +0000
Received: from PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971]) by PAVPR03MB10102.eurprd03.prod.outlook.com
 ([fe80::35ac:8893:c31c:b971%3]) with mapi id 15.20.8422.012; Mon, 10 Feb 2025
 10:30:43 +0000
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
X-Inumbo-ID: 17a3c76c-e79a-11ef-a075-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aIOuHGBdgGkptes+WWCfR8w9vPMe/WZ/XE4Rq85myIIn6fQTj7Bawzl53VSn3T2UYdUEIe3yvsGBTE/9Vc4hp86J3KJXM7ux8k8Vxi8k3D8z0Jwi9cXH53mbrUSbbgQn6i3lXu+YkqyODf1Rb1YISE2Z8PJmupPLbK8TVtc0PTUFUVQxzNqV7ZSUAWpbiKdGAolPGUnX2e8ILfaiFMnLVIUZUFbE0o3BlDVU7XzrluvIZdYXv3E7p6MY6ScVKjGcavMHQfrU0yMY0Q3blVV9FJ3SoTu6aoWkSjWPCttd/Ly7QZ5zHuXz0ar30TszeTDZLzz9jr/Cm0b9NHDxjHO5yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LsbGr3uzI52QTD5cd8nv15aYeLYWU0lmOcQYVPFAVJ8=;
 b=h9b6o/+3hV+DoMVjsuIPL/R/+m3wxVdT1lMFEeltXYC42w1bXAQFSUqNOdpDVM9nHLoe4RYkWsGJOKXEKgbdWrFkSZmeSSc/lMugbwEy4/WKzEaBPIGnazPNxlcF59JvVz/+TkjQhk2E6Wex4UiKSICbCwOlJhHb1k31s2/MLwlCk0tkNQuvJ6Faxc+HYvaFVdczWQFbtVlQO3xrVA5wcPfbz75ZtdsHo8hGgjifDDLiiDHMt8pZgkpT8PU7r8j33g30wW0AP6BUrc1H4RYrgh8YUOBuOIDwCFC2VmHwoz724QbL7VDqQLU0l0UCIQ2KrN4mxf3SiU4/G+GxIKL8aQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LsbGr3uzI52QTD5cd8nv15aYeLYWU0lmOcQYVPFAVJ8=;
 b=LNwFa/OTRsYlfPBpbpiWSOTSKhlmo/bRsg9V+VlhCNaSH1ZrxVOuazHKDAUOV39ZMhJ1FRpA/wj4mblGtuqgP7BK9lcquY6GbySM2hDppHjoIVWFOfNAtiEuzEcsqmqXCQm0Qt12U4T9iao7VWM/FmSFGr5zVBdTtIck+qbIRt90RnXtRxqxDGzrbCSvy72xdEWoUN4qhUOEbpuRu2XedgL9axJyiZO3IcvMRxII0LHls5rNznMIVi72mZYAg8/qDjSaWO2D+Djm66wJDDWD36dYSDQ5eOiAI23TrfJ1RFGBF/H3fAzFoLip6KWaMlDbeJBZNNaCbs5IqVrQZrlKOg==
From: Mykyta Poturai <Mykyta_Poturai@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Oleksandr Tyshchenko
	<Oleksandr_Tyshchenko@epam.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>,
	=?iso-8859-1?Q?Roger_Pau_Monn=E9?= <roger.pau@citrix.com>, Mykyta Poturai
	<Mykyta_Poturai@epam.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v8 1/8] iommu/arm: Add iommu_dt_xlate()
Thread-Topic: [PATCH v8 1/8] iommu/arm: Add iommu_dt_xlate()
Thread-Index: AQHbe6bWEAW8Q/sQaUm9DrJ2a4q+MA==
Date: Mon, 10 Feb 2025 10:30:43 +0000
Message-ID:
 <02afc1bce09dd22865c7e2bad6cad9a804fca64b.1739182214.git.mykyta_poturai@epam.com>
References: <cover.1739182214.git.mykyta_poturai@epam.com>
In-Reply-To: <cover.1739182214.git.mykyta_poturai@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10102:EE_|GVXPR03MB8404:EE_
x-ms-office365-filtering-correlation-id: 086a2dc9-a317-4f9d-ef71-08dd49bdf95f
x-ld-processed: b41b72d0-4e9f-4c26-8a69-f949f367c91d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?CZveznmw8aLeuc7whmH+MQEqjnzV7TO4sqtFfKS0DB4Ltv95P5Kaj4/44+?=
 =?iso-8859-1?Q?s1RwvDuqi5qz40QQ64x3jcO08UKktvyDDMWAhpzjdofACGEoYKBlsjSWpL?=
 =?iso-8859-1?Q?2Xhm5Vl1phhKvaLrGJMu0PhBbYZpnuTnbogtH4aAGR3l03HGBqLKQjfGsA?=
 =?iso-8859-1?Q?mHeyXa3ui7GVQN/ZOW8xoTwgFWOcDwOmTEPShVQ/zX1seC94NMzDzGEIE5?=
 =?iso-8859-1?Q?QTZPg30RL5c27jhgPYjnZrG/BZJBWhRaJ01Ul6HZeYBUr8mbWTKYz5r+rE?=
 =?iso-8859-1?Q?rGGSQ71+8DNLmYb82cTCAf7XcnQ5DgZsSDGcyrnMLfl7F3u9KnCmSe8qNM?=
 =?iso-8859-1?Q?C5v9VamlARWkk7oFp863BmWzDsGC1Ps6C/fdeLSOstNkB2qsgcDjFvqSUP?=
 =?iso-8859-1?Q?n79gJojhXS/O1LKj9ZHKBTi/dK0faxw02Inm08RBTC+dTs6yJ+U4yvq7vE?=
 =?iso-8859-1?Q?XFnEsaA//KBGr3LWAsDo33gf/E2OWgZy/cEbwy2nczPRWdDq/DCLDhwGGr?=
 =?iso-8859-1?Q?gbeyXE1sxwaLT5QeY1PVnU04FjMmTw8L+1a+X1t1IioCUq/yJll2hLIRyv?=
 =?iso-8859-1?Q?Bl2jbJJBUWRQoGoWWuqeb3EBVo+4J7gzyzc93ucsviHc8T/8d8dBjYnLIX?=
 =?iso-8859-1?Q?PiDlmH6bsYZAYL0ekNpuPaKVmHyNsWr7G2LQbAPVDvEGHZA0vDnSJsubtR?=
 =?iso-8859-1?Q?nO96BpAh2hs/bG/J+p9DCR3V7Ryr6H9IEKae/7g6B6bgM9M0+gCME9jkjV?=
 =?iso-8859-1?Q?Md3ow0y7IBXnZv2IjP6PWL2T4MvB4ASYEJGEI9sj8s+HumOY3MzTQKJAvL?=
 =?iso-8859-1?Q?U8yrY8vLZZnzilMzXwxBnx4vvqQVS7EKXt/al5z8ShS8awO2zYFAexUw5E?=
 =?iso-8859-1?Q?JqYnaT4CXiksGS4Wfw5XYoOlA2ucvlQJ9/m5Ch2mY1OXAeYHbTXD06CTOc?=
 =?iso-8859-1?Q?U3zuP3Q80ov7KQjiiwo1qILuJlrtUYVSm82UjJpW7cAAxDBliC5KZLF+9b?=
 =?iso-8859-1?Q?ykeucxNWyI6NfVPzXdXJKdUcaLZW818npNiTegaZ/vR76xYAsguT1kqVi/?=
 =?iso-8859-1?Q?wElJHAq4zmhkJ6Ei+spuWDxEz4OaCWOybq7YiOtm+QO0MzpchaNYLX6B60?=
 =?iso-8859-1?Q?qBbit3+s4uhh+tv88LmqhvUqtzyIFAqficaEzGZCM+i7MdoIshXejNDk9A?=
 =?iso-8859-1?Q?bhbItSj102u+h3qAsqyE8ZmavCNW4rFZNQXhvwSC3u+lPANY0C2GHjaqsI?=
 =?iso-8859-1?Q?dFrPcYSE0ewDBvmvJ2TYI+E7xxNupnqZcbDTspo6ftKWEQc16lDe5GW1q2?=
 =?iso-8859-1?Q?0wAYEfNayIr1e5sUEExRYurkZ1r1ma9fVBpHJGqmjgsVD/w85V4+nKie6r?=
 =?iso-8859-1?Q?GVdIrF81kdkFVlgH6dFg/umx8kftG18V1kfA5wQBJF++puPbR2S9kRaLsU?=
 =?iso-8859-1?Q?jd0NFtA4fk3TQkpYBezoNbUGbHBxFCBo6P8BedHwhlHeqEi8YKN7i2Q881?=
 =?iso-8859-1?Q?FSSu4Ur7aUQ/ppx2sC66RZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10102.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hOZu1EXWeztNqa8DkWOJywY2iZ2GIRql+y6HbOrhJ6rx03kiIZQJ15bnk8?=
 =?iso-8859-1?Q?QY7tF0etm6o2VwLBjJHj4oJ7JS/68raoDKihuJEFTdayJ73UIcEdYRdF4I?=
 =?iso-8859-1?Q?t/xzx/ry4Rc6tKGs/SGitd/8EcxcZH44NBVgsJ6jd47mUv0Iu8FR5cJq5+?=
 =?iso-8859-1?Q?t9tHUq9G89khmGFXA5qVCDNSs4UKw3z+wxvXZBms3tE/nFrOaMDbBRYQRK?=
 =?iso-8859-1?Q?WET8bjkLxRrXMNNgBBjOw6pIimQzWYVNDGMEmi50JIrLtFMPaerHk2fGx/?=
 =?iso-8859-1?Q?+c38IIja6sry2hUHlDLwevPCtpcfGvdo0TsGlYSl/4tHgcRqv19IidI52d?=
 =?iso-8859-1?Q?YhYXlTatDrjGVFgkCacKwb51m0FV6YK0408J1x4JZYROE5A/Ht6QqPY5gZ?=
 =?iso-8859-1?Q?h8DpLAsu7f4hCGVYEY4L8VGrV6oHuA/E9eLlCjqcWRBzpVAIVbpJVbdE6A?=
 =?iso-8859-1?Q?Kv8n6WYhi/VAMwsE/eCUXGd3EH+cUqHBTLeZRnmMR1lHTX9El1MNp3Wo0t?=
 =?iso-8859-1?Q?bCny2mXOO63sR4Rnlfqpw8c6g9JGyDmDjwoI6YIQNmuXZLeuizRiO5RUWp?=
 =?iso-8859-1?Q?QDncIvZ8jSeO1rLVzzElV+uVtbTDV2zvSEoXPd9x0CmVwb6Y2Ug6nLlYDI?=
 =?iso-8859-1?Q?lVczRx3t7Jcy/bNu3TtdnE2yPbry5OX5i3v++yR3sJYXKpnRCaYgOiNgPo?=
 =?iso-8859-1?Q?N8asaqPmnz71ELdNR+pwjLWU1/iZO+z4S4u9XzicbHjQG48ZQloorDQ1q8?=
 =?iso-8859-1?Q?16BayRs+530wGjw7GEKhIEhvWpjYv6hJkhGKqQ4e/BSNBtcYSDKNbzExaA?=
 =?iso-8859-1?Q?leaWFvn8S9RYnWAE5hNN+Rw++6TYDtvbnKfX1L4wofx+zS/Qqk1HyXv89F?=
 =?iso-8859-1?Q?vdV+tkTyW79Ktw1p1cQ33tJAxPp/Ypfblhw3fqb7t5RaTRM2e/GnXZjSCp?=
 =?iso-8859-1?Q?O5bjjqWWo2bHOE7nJQzJ1Jl6cpgKyuyJD6jsD6Qo8UfqwMqgSNjP/UoMpo?=
 =?iso-8859-1?Q?j1uKTSogxmSRHNt2i+zBoVkFpzHIlH6ACrN1yb48MjubQ/yMb1XMUF67yu?=
 =?iso-8859-1?Q?9wNDG18wyG0wQhPTfGPPpC02wO9UNcpVvwgG3gzbJJbDYO5IFhpeiwwsEV?=
 =?iso-8859-1?Q?W4K0GOJMq3PYNiTOuHHmUFJeJ9f+vBib1d6b/a1ZadYULmu35+lgr8yG21?=
 =?iso-8859-1?Q?TCZ7eugrRALZDVVGJcIyNxd+GEF4wL1iNWbYE1Pmrq3PGQHxX26dp9ksXw?=
 =?iso-8859-1?Q?/zi/P4xwFsa5Wbvpdm7+Ks4qPW91AdN/2RssAZindbsGoZSVIQcrI6klEc?=
 =?iso-8859-1?Q?zhf8JsUJg48EjS/gBmTo2w7dOnvntFxjSDIs4GnlX4em3mrz3rC3Pfr3ii?=
 =?iso-8859-1?Q?50uf84niKV3m0lzbGkZ/6iLv2q+c44IKI2oEEaB4vkk8la+/E8A8+HVyQE?=
 =?iso-8859-1?Q?RLut12PaEM//tXix6QM5X+5PV4XcBJg7c9gy2zvQkDZJvSmp3iq590dAAn?=
 =?iso-8859-1?Q?UKGhhfygyoUuWrVrH7DbZteynxzHDeVCGh0UGB4HF8zCUclZkpU42EN2Ha?=
 =?iso-8859-1?Q?ymmuo1OoOm85q8FJSZzCIs6tY3WnrYtJ1dlDtZf+fsDFE+dez8FrhZNcg+?=
 =?iso-8859-1?Q?3AwqgshX1YDGmZX+320h2LlNrEgLTYcYe1k9vSjlUmmOnUc44iNpDb6A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10102.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 086a2dc9-a317-4f9d-ef71-08dd49bdf95f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2025 10:30:43.7107
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P9GolPV6JjoiK+BUEqvr7AcIYaYWmpS/lIspsTuaYQxqvjgHzh44b2j6mRzYcALHmBV6LurgQtm0NJcknlYJYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR03MB8404

From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Move code for processing DT IOMMU specifier to a separate helper.
This helper will be re-used for adding PCI devices by the subsequent
patches as we will need exact the same actions for processing
DT PCI-IOMMU specifier.

While at it introduce DT_NO_IOMMU to avoid magic "1".

Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
Signed-off-by: Mykyta Poturai <mykyta_poturai@epam.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
v7->v8:
* explain NO_IOMMU better and rename to DT_NO_IOMMU

v6->v7:
* explained NO_IOMMU in comments

v5->v6:
* pass ops parameter to iommu_dt_xlate()
* add Julien's R-b

v4->v5:
* rebase on top of "dynamic node programming using overlay dtbo" series
* move #define NO_IOMMU 1 to header
* s/these/this/ inside comment

v3->v4:
* make dt_phandle_args *iommu_spec const
* move !ops->add_device check to helper

v2->v3:
* no change

v1->v2:
* no change

downstream->v1:
* trivial rebase
* s/dt_iommu_xlate/iommu_dt_xlate/

(cherry picked from commit c26bab0415ca303df86aba1d06ef8edc713734d3 from
 the downstream branch poc/pci-passthrough from
 https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc.git)
---
 xen/drivers/passthrough/device_tree.c | 48 +++++++++++++++++----------
 xen/include/xen/iommu.h               |  8 +++++
 2 files changed, 38 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthroug=
h/device_tree.c
index 075fb25a37..fe2aaef2df 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -137,6 +137,30 @@ int iommu_release_dt_devices(struct domain *d)
     return 0;
 }
=20
+static int iommu_dt_xlate(struct device *dev,
+                          const struct dt_phandle_args *iommu_spec,
+                          const struct iommu_ops *ops)
+{
+    int rc;
+
+    if ( !ops->dt_xlate )
+        return -EINVAL;
+
+    if ( !dt_device_is_available(iommu_spec->np) )
+        return DT_NO_IOMMU;
+
+    rc =3D iommu_fwspec_init(dev, &iommu_spec->np->dev);
+    if ( rc )
+        return rc;
+
+    /*
+     * Provide DT IOMMU specifier which describes the IOMMU master
+     * interfaces of that device (device IDs, etc) to the driver.
+     * The driver is responsible to decide how to interpret them.
+     */
+    return ops->dt_xlate(dev, iommu_spec);
+}
+
 int iommu_remove_dt_device(struct dt_device_node *np)
 {
     const struct iommu_ops *ops =3D iommu_get_ops();
@@ -146,7 +170,7 @@ int iommu_remove_dt_device(struct dt_device_node *np)
     ASSERT(rw_is_locked(&dt_host_lock));
=20
     if ( !iommu_enabled )
-        return 1;
+        return DT_NO_IOMMU;
=20
     if ( !ops )
         return -EOPNOTSUPP;
@@ -187,12 +211,12 @@ int iommu_add_dt_device(struct dt_device_node *np)
     const struct iommu_ops *ops =3D iommu_get_ops();
     struct dt_phandle_args iommu_spec;
     struct device *dev =3D dt_to_dev(np);
-    int rc =3D 1, index =3D 0;
+    int rc =3D DT_NO_IOMMU, index =3D 0;
=20
     ASSERT(system_state < SYS_STATE_active || rw_is_locked(&dt_host_lock))=
;
=20
     if ( !iommu_enabled )
-        return 1;
+        return DT_NO_IOMMU;
=20
     if ( !ops )
         return -EINVAL;
@@ -215,27 +239,15 @@ int iommu_add_dt_device(struct dt_device_node *np)
     {
         /*
          * The driver which supports generic IOMMU DT bindings must have
-         * these callback implemented.
+         * this callback implemented.
          */
-        if ( !ops->add_device || !ops->dt_xlate )
+        if ( !ops->add_device )
         {
             rc =3D -EINVAL;
             goto fail;
         }
=20
-        if ( !dt_device_is_available(iommu_spec.np) )
-            break;
-
-        rc =3D iommu_fwspec_init(dev, &iommu_spec.np->dev);
-        if ( rc )
-            break;
-
-        /*
-         * Provide DT IOMMU specifier which describes the IOMMU master
-         * interfaces of that device (device IDs, etc) to the driver.
-         * The driver is responsible to decide how to interpret them.
-         */
-        rc =3D ops->dt_xlate(dev, &iommu_spec);
+        rc =3D iommu_dt_xlate(dev, &iommu_spec, ops);
         if ( rc )
             break;
=20
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index b928c67e19..2b6e6e8a3f 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -238,6 +238,14 @@ int iommu_do_dt_domctl(struct xen_domctl *domctl, stru=
ct domain *d,
  */
 int iommu_remove_dt_device(struct dt_device_node *np);
=20
+/*
+ * Status code indicating that DT device cannot be added to the IOMMU
+ * or removed from it because the IOMMU is disabled or the device is not
+ * connected to it.
+ */
+
+#define DT_NO_IOMMU    1
+
 #endif /* HAS_DEVICE_TREE */
=20
 struct page_info;
--=20
2.34.1

