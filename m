Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E3CB52B77
	for <lists+xen-devel@lfdr.de>; Thu, 11 Sep 2025 10:21:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1119647.1464926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcXx-0004nl-0n; Thu, 11 Sep 2025 08:20:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1119647.1464926; Thu, 11 Sep 2025 08:20:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwcXw-0004l4-Ti; Thu, 11 Sep 2025 08:20:48 +0000
Received: by outflank-mailman (input) for mailman id 1119647;
 Thu, 11 Sep 2025 08:20:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ApBa=3W=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1uwcXv-0004XB-CT
 for xen-devel@lists.xenproject.org; Thu, 11 Sep 2025 08:20:47 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37216ba4-8ee8-11f0-9809-7dc792cee155;
 Thu, 11 Sep 2025 10:20:45 +0200 (CEST)
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com (2603:10a6:20b:5e4::22)
 by AS2PR03MB9468.eurprd03.prod.outlook.com (2603:10a6:20b:59b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 08:20:35 +0000
Received: from AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593]) by AS2PR03MB8907.eurprd03.prod.outlook.com
 ([fe80::804:c187:252a:9593%5]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 08:20:35 +0000
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
X-Inumbo-ID: 37216ba4-8ee8-11f0-9809-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y5Dlbf9QjxWKGaBJfC1jScFbhD+lfvC3JGvihAD/xjmwJLqxpYhdmJAVzmY5COsHYvQSMBm9RPwD85K6lOF7vwaA1ZUJDw1dQWetNR9pgZ1By3iAKftaBnsQdd+SBF2oZRTwUf6ZsInsKbMqp/BQudpT6fk6xZ0kg/z8z/TDrLSas4xhGcGTpL/j1BHQmn010pUg7m2etdDD45zA6ceCQKrqvr7kbGm3eVPzoGY/OONplC+f0JN7spTXeWl3JmzlMucn3B0mwoiV4kQm0HtQeExU3rEy/TvJLfyjjXfrYzFJljYUyX16Ov2fC1K8/60jjHondLXQtGCAsF+dAPRa+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0z7Dk/e65IYeZmN6jBkz/XbdB5t9TmOI0aQg9z0ciI=;
 b=IAQOIrAZnkrFRM111J42aIo7Oc9nCs0AYGTabynfyuQOCqBT2NEoxJzl6Gzg2QWjNHu1J9NiHfx/xOpoEBQEGShd2Z5c9EZCR75roZNx/kzBent++SlkZxZHCGe9aBRC7YN0slQdp23CymKA/DVn8NXCAM5YxqoD0WbDrs8gigBQTx/wvHd7ny5Z0mhkJk9uCVKuvQIDOxIgPbg6Tq/X4CEiu3IDJH0KMy8+O751Mp/cLhr5dd96hMOY8jYGkg4nug+CqkB6gZpC9532s79RATJbmLs1wc2WCB+xwvBY+S9Kd5gF4Zd8FsCLqTUTk2GKwlhY/HIYGx6OfZIMWVMzgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r0z7Dk/e65IYeZmN6jBkz/XbdB5t9TmOI0aQg9z0ciI=;
 b=HzwaJncewigMb37RwfhJZgWjZuH8O4b9aYVTbiGuFPChp2vXI54XT4oMHecTQU+bmtw7aOQN+cZiDqQJ1Ww0wi0vKn/8lOINsgmmHgVqMJDmZuvo32C8DsmmT4mvV2ReWxPrE7NDFREVQqv8SmtlTCpt6fCzlhRgwZmDRwnqqjYtVweluOZVX0OPSr89EMW1YjZP9Hf2lAXwz3yxl+BobJ3GDrd0XL1rvB8ZI3qq+u4tbgvxG5obOHVUG00KmBmd8mF4SgVxzLZeGTT/q5h9690ybyLNmCx6EiFXisTYupFXQ182FtMAhqLgb0FiWCAbpcc7IaNZcCnE0V1yjMUM6A==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, Jan
 Beulich <jbeulich@suse.com>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 1/4] xen/arm: split set_domain_type() between arm64/arm32
Thread-Topic: [PATCH v3 1/4] xen/arm: split set_domain_type() between
 arm64/arm32
Thread-Index: AQHcIvTy08CUia/8TkW/gNSEXuqqIg==
Date: Thu, 11 Sep 2025 08:20:35 +0000
Message-ID: <20250911082034.1326377-2-grygorii_strashko@epam.com>
References: <20250911082034.1326377-1-grygorii_strashko@epam.com>
In-Reply-To: <20250911082034.1326377-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS2PR03MB8907:EE_|AS2PR03MB9468:EE_
x-ms-office365-filtering-correlation-id: ecbf077b-3b4d-402b-fe10-08ddf10c153a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VJYnL/Jq7bj8bwY9q1062AV+ck/iAm3/6wND+u7YxVEHDW8nZyr4EKq3o0?=
 =?iso-8859-1?Q?MHTbY9F5ix4/+rEBYHD4k+KS7p2FdjqJGY1cdCOADmsx2kirrJCjXKuzvR?=
 =?iso-8859-1?Q?Kc/80nE/uWRs9wCJteS5C92LuQg3kKSASQOQpS1Ju9tWoweqgc/ewhbEAF?=
 =?iso-8859-1?Q?x37t/muSIgR5SMgUHJfVTWT2MtrAfX4mdLp/LYQQudO9PwyvmVmdFk4ySr?=
 =?iso-8859-1?Q?YGjbLImbf2b7rBYjdpGUyJ4oOG3P9dbhWQF3WU63V34XvxvddEXoeuxbRg?=
 =?iso-8859-1?Q?Wi09Whr1E2uUcdC3XkCu64qm8oiiUUobpzejQdplwIKbVKN7gnHZdcLekj?=
 =?iso-8859-1?Q?0DL5tgFnXsQbRE6OCQvWLkUCx3Kuj/SaYCMi5wc9PwEi0OvL/VljOK3wLV?=
 =?iso-8859-1?Q?cGziXQjCnlW19RVR6EqAHYijGmhKXnDtcN7aNyaK8qiv6njGtKvDH4TI5k?=
 =?iso-8859-1?Q?BRKneCfexQ0XfAf0XFnY28Kkw8Cu+66c0ujo0G8hNzOWa2V3CpqGizZQ6N?=
 =?iso-8859-1?Q?JImdr2gWaejKzF6I+fAqPk8xcSeEUB1VaT0AiOED+WKy/TvUWegPQX2VIY?=
 =?iso-8859-1?Q?AKYNN4UfVitid41y+8LlZ5BOKQzxYv4GaetPcjFNXOjYKqXJDbVWINPUok?=
 =?iso-8859-1?Q?f98I2IruvLx9tXX1SDHFu7pIkNgZLUoS780G3m6p6ID5K34wJFMjaOSn2g?=
 =?iso-8859-1?Q?QBq/lvUKUoiph0Pi6UGwlnG2NBZL9+1ASmX1l5iG0++BCAZi8um5kTdLGi?=
 =?iso-8859-1?Q?8i8IUKAv78n+sBt/cAD6mOo38iL3uuuOVQ8V1FksYtB9Rn+deeNen2gPlv?=
 =?iso-8859-1?Q?GWI3rNfAz7tHVkNTuSKD7FRHjNZUsQMHAaKK8bw+bhEMuv+gbEU7YfSGOr?=
 =?iso-8859-1?Q?3wtbv47TxKjgtlSvJp0H6Q2S60J76GEiLDe4iTCE+ybGJRe2CdujPZTIZD?=
 =?iso-8859-1?Q?VUdchqxXtRwoTHl51evfYp4j4jeSYZQEpLFSRAzzJSZrR7Y/wtMhbYt4Qd?=
 =?iso-8859-1?Q?jPx/NYfTfetUnjyW57jvburdhcw49u3fUJ64rLbD1r2EX2oBhem4HVvzzY?=
 =?iso-8859-1?Q?Mh0bd6EDoUuDDjjUoI1Zn8Ci/BAlVE23+xH02vi+vJ8dmZ7iBPAwCh+2z9?=
 =?iso-8859-1?Q?rQKfDmj8QNJUDIvQSWDSLE0Z9GsePueY4ZMWDLYlgFRID9R6KJ4vNlFOcl?=
 =?iso-8859-1?Q?3Mxzq2TtTCne/Vt7e+AbnqVLD69bQNE1h67PhIfZEislWelgC9NAWWuDkC?=
 =?iso-8859-1?Q?P9En6LhgpsxyfsQ+vftz2aHgiNtYvy2EWr6RqMrm60EOPBsP7i6Tfd8PDv?=
 =?iso-8859-1?Q?PSHAQJA4zPEJujYh6OyBvTQrm9A/DaWa8sIBBWh5QJM2DPmADxbgP1maKs?=
 =?iso-8859-1?Q?Au7JZ+ACDISNbfbo5+LTl7TeJ73XGrK2yNapINmPciNJ4PGtFD8SdlohtX?=
 =?iso-8859-1?Q?5ltg2u2fvMwEN1GZ28ACwQPcDHnfN5Nq4c6lBYIs+XmWXqoUHUJgEPYkE3?=
 =?iso-8859-1?Q?jePTs70BkZR0HgYAOaeJnKPteNbPCMKH7Ed0e5V4tmbw4ZHhgoh/p04PtA?=
 =?iso-8859-1?Q?dpo6m2A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS2PR03MB8907.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?Cx0h+rWVDro91ubKCEtocCa+TVCPUdbD0IxJc5NcParkWL6BirYJqxMwRo?=
 =?iso-8859-1?Q?7ICsxowwOlKnwOBVj6BohOoqzyrX/6zTUBF9d2RxXYrYoPJPU1lCRRys/i?=
 =?iso-8859-1?Q?87JnWAOm4cuOUO2h4KlBU3KojEtkaf1gygeQR13wBfKAnYZtrNxUpthIea?=
 =?iso-8859-1?Q?xtQTzFNFssx/IoPtiGdJ+XXVHfCf81h57tYbw6aeb6lnznWZHnUmCVWd3M?=
 =?iso-8859-1?Q?kQHh5TwF3JOd592Ni+QfhSCO/jMcmHX083u6+AuYN70Oad+s/9xpw/psQj?=
 =?iso-8859-1?Q?z4UVdNFxuLBVl/ngngGXCu2UOGZzLBMbZC7m/E1rn/kw/H8+Gxcnt/Ddbr?=
 =?iso-8859-1?Q?cUZbUXkdmMDJPTHVApWlKCUzqLVl2TP959d7OjEU2ETiVODJKZyGSLxxoP?=
 =?iso-8859-1?Q?9DHp9FDJ+VURD7C7t8BSHlkDP3w+zeCfciUP5V3T23Jp6nM16WzexCxHR4?=
 =?iso-8859-1?Q?mwRxmUcozO0PM8drgwpabrYLAn7yqdi3gRysx4IihC0EJiuNpLvY1rpgJT?=
 =?iso-8859-1?Q?OWyICesSMcICe+pLYEyXYSPCYApMvBSPNlBBiEr6wXp92y/ZdTK3x5LMJy?=
 =?iso-8859-1?Q?9WYAVLp9d2wWOrKl7VFvVL8nCNKpDFfnj0qnzVEa4R7maMGxS84GKLQReg?=
 =?iso-8859-1?Q?g5ZlAYtzG6CODf1ZfIMUroLmo0300y1kZBvXhpgxQk7NcymKo/zSk81fvf?=
 =?iso-8859-1?Q?Eucxo1EVAALQ0tQfE+cCtEg5/5HDWMXj9C0ocIhvrj2TOGnvsinU9L5bwx?=
 =?iso-8859-1?Q?0nmJCbsYFKcpCv6OATHc5hNnMGf5SRskDNACgykH3IKI2glnYUn1eCCT/F?=
 =?iso-8859-1?Q?gVyKHt+1aGLoiuhWE1XS1YPzHFtFzzdbySwoSYgddjEv+MwERaZEQfZqNB?=
 =?iso-8859-1?Q?8vLRgzEtzW6KUdS2OS69zosYUYLrlZSqUChHpaplSQa+C4yKF8YVU3mDkb?=
 =?iso-8859-1?Q?VWZxE/nB1nDVdQTq3JP9m+OsNyzmBw8AcaZplCWBMUSitlqXhpLSXmVQik?=
 =?iso-8859-1?Q?Ok3sCqJNDmwqG57CpHU1FYAb9sA3kouy2iblMO1dy4a3Z98WIPbDG051hK?=
 =?iso-8859-1?Q?+vlxDf3bsw6EH/fNNVKLWYiv80qmpw1hbHvs3OQm2XaEug6WtKz9aZWeB1?=
 =?iso-8859-1?Q?XeQkDB/NqZUrAZ7tk51YrWu1aTv597yEXFcfyvvvTq8SnEQt8rn/JZDT2X?=
 =?iso-8859-1?Q?W+Kh79WofZ1aYfULFpAP0u6+3E3nGI8qfmd6AqIGRvf1S6ub/hsOmNiJ/D?=
 =?iso-8859-1?Q?oVLnJlLtwMxjelMh5Vd2wytvshVulQGjEpUuSVreIae+5cAQep+CesV0bp?=
 =?iso-8859-1?Q?PI/4l/pIfDdad25uExBO9TqVAYYIXKjwO4L3GTbbShAxS/fIie6Xd/mQuV?=
 =?iso-8859-1?Q?6l1ynsgFxB4wWZDOsCZ+HFKoQdsVjmZQCGfH1zLJP0Xzut222OfTSg+Lci?=
 =?iso-8859-1?Q?oQc5XxW8GGQrPqye4PRIPD17k2srHhk6FixRBCaqwBWfAxFHVK5Mg8G8TS?=
 =?iso-8859-1?Q?v8NA5c4wLXChhbcwTtSIIjWoHrrS8aBOwYSLgkA0TjjB4/hch5elU12shP?=
 =?iso-8859-1?Q?PuScpq+3cQLZr8l+M1+pRg0vQZt96hZXuM/Wb1iQ1grw0LYP6yR1DdL9Fa?=
 =?iso-8859-1?Q?AJP2A4sTnH71VsONaZ7hpyVwE9wd+8KvttvBCg9x+MnEfsoqERS70Ltg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS2PR03MB8907.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ecbf077b-3b4d-402b-fe10-08ddf10c153a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2025 08:20:35.4245
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4NiV5xOTvIRNtmwNevR+jHo4C+nylSUV1aDRzK0a8cmP7/w03BmyXgzNCso0XImfD2vRRtDTd5v/2QmphZp/ygYYrOWDwtkbENVbl4KODHg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9468

From: Grygorii Strashko <grygorii_strashko@epam.com>

Split set_domain_type() between Arm64/Arm32 sub-arches as
set_domain_type() implementation is going to be extended for Arm64.

Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
---
v3:
- mark domain-build.c as "init.o" for make

v2:
- no changes, rebase

 xen/arch/arm/arm32/Makefile       |  1 +
 xen/arch/arm/arm32/domain-build.c | 22 ++++++++++++++++++++++
 xen/arch/arm/arm64/Makefile       |  1 +
 xen/arch/arm/arm64/domain-build.c | 24 ++++++++++++++++++++++++
 xen/arch/arm/dom0less-build.c     | 14 --------------
 xen/include/xen/dom0less-build.h  |  8 ++++++++
 6 files changed, 56 insertions(+), 14 deletions(-)
 create mode 100644 xen/arch/arm/arm32/domain-build.c
 create mode 100644 xen/arch/arm/arm64/domain-build.c

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 531168f58a0a..969f24858cb5 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -6,6 +6,7 @@ obj-y +=3D cache.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
 obj-y +=3D domctl.o
 obj-y +=3D domain.o
+obj-y +=3D domain-build.init.o
 obj-y +=3D entry.o
 obj-y +=3D head.o
 obj-y +=3D insn.o
diff --git a/xen/arch/arm/arm32/domain-build.c b/xen/arch/arm/arm32/domain-=
build.c
new file mode 100644
index 000000000000..e34261e4a2ad
--- /dev/null
+++ b/xen/arch/arm/arm32/domain-build.c
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/fdt-kernel.h>
+#include <xen/sched.h>
+
+#include <asm/domain.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
+{
+    /* Nothing to do */
+}
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 6491c5350b2e..c5d3479f6b96 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -8,6 +8,7 @@ obj-$(CONFIG_HARDEN_BRANCH_PREDICTOR) +=3D bpi.o
 obj-$(CONFIG_EARLY_PRINTK) +=3D debug.o
 obj-y +=3D domctl.o
 obj-y +=3D domain.o
+obj-y +=3D domain-build.init.o
 obj-y +=3D entry.o
 obj-y +=3D head.o
 obj-y +=3D insn.o
diff --git a/xen/arch/arm/arm64/domain-build.c b/xen/arch/arm/arm64/domain-=
build.c
new file mode 100644
index 000000000000..3a89ee46b8c6
--- /dev/null
+++ b/xen/arch/arm/arm64/domain-build.c
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/fdt-kernel.h>
+#include <xen/sched.h>
+
+#include <asm/domain.h>
+
+#ifdef CONFIG_DOM0LESS_BOOT
+/* TODO: make arch.type generic ? */
+void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
+{
+    /* type must be set before allocate memory */
+    d->arch.type =3D kinfo->arch.type;
+}
+#endif
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index f00912a1ca85..713a90c3ad79 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -237,20 +237,6 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
     return 0;
 }
=20
-/* TODO: make arch.type generic ? */
-#ifdef CONFIG_ARM_64
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* type must be set before allocate memory */
-    d->arch.type =3D kinfo->arch.type;
-}
-#else
-void __init set_domain_type(struct domain *d, struct kernel_info *kinfo)
-{
-    /* Nothing to do */
-}
-#endif
-
 int __init init_vuart(struct domain *d, struct kernel_info *kinfo,
                       const struct dt_device_node *node)
 {
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-bu=
ild.h
index faaf660424b2..4de8d9edba52 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -57,6 +57,14 @@ int init_vuart(struct domain *d, struct kernel_info *kin=
fo,
 int make_intc_domU_node(struct kernel_info *kinfo);
 int make_arch_nodes(struct kernel_info *kinfo);
=20
+/*
+ * Set domain type from struct kernel_info which defines guest Execution
+ * State 32-bit/64-bit (for Arm AArch32/AArch64).
+ * The domain type must be set before allocate_memory.
+ *
+ * @d: pointer to the domain structure.
+ * @kinfo: pointer to the kinfo structure.
+ */
 void set_domain_type(struct domain *d, struct kernel_info *kinfo);
=20
 int init_intc_phandle(struct kernel_info *kinfo, const char *name,
--=20
2.34.1

