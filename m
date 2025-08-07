Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28842B1D55B
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 12:03:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072761.1435732 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujxT8-0007j7-Ae; Thu, 07 Aug 2025 10:03:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072761.1435732; Thu, 07 Aug 2025 10:03:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujxT8-0007hj-6x; Thu, 07 Aug 2025 10:03:30 +0000
Received: by outflank-mailman (input) for mailman id 1072761;
 Thu, 07 Aug 2025 10:03:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eTYG=2T=epam.com=grygorii_strashko@srs-se1.protection.inumbo.net>)
 id 1ujxT7-0007hd-As
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 10:03:29 +0000
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c202::7])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c3d95373-7375-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 12:03:28 +0200 (CEST)
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 (2603:10a6:10:435::21) by PA6PR03MB10211.eurprd03.prod.outlook.com
 (2603:10a6:102:3cd::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 10:03:25 +0000
Received: from DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584]) by DB3PR0302MB8919.eurprd03.prod.outlook.com
 ([fe80::ce88:43f9:c971:9584%7]) with mapi id 15.20.8989.018; Thu, 7 Aug 2025
 10:03:25 +0000
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
X-Inumbo-ID: c3d95373-7375-11f0-a324-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wToG+n6x9HmjLFgXppME0mzKgIo5PJXZScLsfrcWbobZYHLaNiMU4/uy4rvyt8SgH9/M1Bc5xXrTy8H/kvOsNbNvSNLYQ5zlwKAgx4e5sxUlVIkljVubPMyQ3ShqSsO7elliruKPDBMaQgc2HU6fPDSPoieKzg6/wPEcIlsdXOvn+oAM5Dw4p5pEJu8/8eHzvSJT7Ljmanv3tDb+LfJqPI8Qe9rrj2BY3Jd+tghtLfPqjk/qMhYR6HA/f68pVQwRDKJucWTn8xtL2SamH1HbZQY2p+sIlOHTUK0FbxUPLGF0ueZRuK+9nO1lWLbIXK1iXSVU3jVugHoH2g8h9h39Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B7hZ5D3jfW8bkALQeyclhEHdwOVrPtaxLoDxcmg317U=;
 b=C9iHal1x99cEaRHm7KTdnQHugus/pACk5Nnm8L/yK1qLj7wpD0x9TH0OLRURJsNiJO37llZhfH8NkahanD+FHTj9FyzJ0hOPo5wGUMQQ0mefqLqMIHEU21EyFQz5ZyJST5nZBdZp6Cch8+9tNQiZBCm3SOGVeQzKJvftOKmGynTgp3lz0dQgGYsELbiuF/S3z30zzKbZodOUCKWjKCKzOBMEuskVPmJxt/yvabznbYlA7zcy8C3jF07k+Xv1SPJL53u5DpxvZwaojtiBEfem4AMAEhlcE8RajVKtKNEpKsHW7NIGWRgDCI+hm5PbZ2jCN52hArxXFMmxs856v7slWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B7hZ5D3jfW8bkALQeyclhEHdwOVrPtaxLoDxcmg317U=;
 b=nC7iPrBjksJxKbxoktj0nsihd0Us/uWsHPPYjgrpJyHH8yhRq2V64PqOcNAZxdhpS1J334E3OsTb2ZTNgxJuF6rgHV6Rc8Ov1vH5gqohzjXC4EO5th5bGHdlWzEB8NJ7FOqrYBEPH+kp0YKkrD1uXH3B6Ik0ArF31WF4hTZlIkTeFGC+9EwLE9YHdmfEBvYvHavGDdmJnKlDAuRpAGyNoF+6JvX7LBruwJX40a93SMgyMsU9pAkYg0Sp/lUtXJOaSosUX0O+FAddi3fr9uY/7W9QHorHwI7SDQbHXcEZzccTN/nprHWK6P1N897WK0M3aZH/iG0nkcjGeTETXrBVIw==
From: Grygorii Strashko <grygorii_strashko@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Grygorii Strashko <grygorii_strashko@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>, Denis Mukhin <dmukhin@ford.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3] xen/dom0less: arm: fix hwdom 1:1 low memory allocation
Thread-Topic: [PATCH v3] xen/dom0less: arm: fix hwdom 1:1 low memory
 allocation
Thread-Index: AQHcB4KDC2FxELT99UexPqqnlkcdng==
Date: Thu, 7 Aug 2025 10:03:25 +0000
Message-ID: <20250807100323.513384-1-grygorii_strashko@epam.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB3PR0302MB8919:EE_|PA6PR03MB10211:EE_
x-ms-office365-filtering-correlation-id: e41910b4-51ec-47c0-f4d1-08ddd599a669
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?QvUYkH1ohvfFR4S7jVSv5lWkwwRf8OXd4TsxnhewlJ3wHmYb4m1T53fJgN?=
 =?iso-8859-1?Q?jBRNanuJ8Dhs+ujiIgGjhHLTY/KtzqOuobpaYfXuZnRbv8GCdbO7sBTmrN?=
 =?iso-8859-1?Q?Jqs6UQY/ypimZcvF9/h+ucBdWGanp6AYTJl/9RUSphxMgwwftlOb9L8LpN?=
 =?iso-8859-1?Q?F3zXZYAVBZdJLkQUUxinqgsa09jX13V024+b1qVtT+N77IXZJQnPvDhy9x?=
 =?iso-8859-1?Q?gMlz6Sa5OexChcWznrJ3B6MRvFlVKpZLmOMsaYHyDUtwxaK/4/lvTQUWvp?=
 =?iso-8859-1?Q?J6zwtR5ttvQH07dybzVQTNgxsewA1qU/NWeG6WifeAHRlsi3TjOaYZRK6g?=
 =?iso-8859-1?Q?AQIDj4bjjBXPxlQjVFKztSuQTpxJ/jHU60ML76YltVYgT7Sry5VNVqcXmp?=
 =?iso-8859-1?Q?UG8EDMijBTuRWcvCo4raQhBza0hfCLSJEWH9YehrDpgXAeBRQmyMnkOGyz?=
 =?iso-8859-1?Q?tFKvRIpX0h1InOo6d9GveJ+pLZ2qEFBT/K49N4Weqk49fEYTUGZY757/Ok?=
 =?iso-8859-1?Q?qsTTQIz/ibQ+FcXZqZnphlAy7Wbp8ACrD4h6yh6t7d5J3vERV8A4sLRBzC?=
 =?iso-8859-1?Q?MjUTy99ICzznbMNccltJK3ocCWndWoDFN2BVkKQ3d/BY7n+iky7MV21PvD?=
 =?iso-8859-1?Q?UXDNBnbx79YUUsb7rx8im7VCnjuyBuoYVVZRR9IWjWtvl/5QFtU6kSxGNY?=
 =?iso-8859-1?Q?AlP9Xh5N3RfnVejozzMUzK2z6OQA5ELYlxjKTTz4hkYM6FcuklzsjuO+iU?=
 =?iso-8859-1?Q?KGhbeSQWXjAnvw7tcqDaG1pdWarRlI2XIY91JjAgDNHM1o3MdMtw+gWQ5h?=
 =?iso-8859-1?Q?gn3r7TqpWlv8Rv//CWgiMs85J2OGTOofbZ+NMMtyTbbheXQPa79A/8Pdw6?=
 =?iso-8859-1?Q?4WjfeoTh0AiuzoGFjy4Kx9Nz9gv/3rQQVzv6WL0TZ+jo0Cfe3JpPe61zNN?=
 =?iso-8859-1?Q?iq6Dk4MUUQWuemsCNoQ9D47JL/xXla2DkuMvFOJcLd+r8+P2/jjL4Hjhbb?=
 =?iso-8859-1?Q?C4TMk4aZk5PP9DdqxdVouRhXBjmZ2avvB03XNRWuDJlN8nh2mX2ItCbYkJ?=
 =?iso-8859-1?Q?21AAAc9Sqr6MSHERMwGnRwqbpY/mAfDhOEXtOon5YkGIk2YVJ5+lixQK8b?=
 =?iso-8859-1?Q?NGAA/VuFmvrdP6umJ4CfUgbCs3wHec+6IkAHBdx3gCn+k7ygurzHDJlObk?=
 =?iso-8859-1?Q?9IOmW5AMxwnC66TysKNiBYSULZCecvWBlUauxIDlLMuKQ4UmzuH3Wh0dbn?=
 =?iso-8859-1?Q?rU5/CedFbrGp0BuwKgLikjHj9/OJrtEMvi5OPHXDLJUAsBEXbcpcJX+eB/?=
 =?iso-8859-1?Q?tXHZlbPJRaiz81WzTDnvQSr/6O04/ewyM5Tlz5Iku7QRvzWUgrdKdLzkJb?=
 =?iso-8859-1?Q?TarH6028dh3w8M+0qN6oHc5CRo+qwoL3Gx9hr8VhsyY2FrRV8/3YNF2L8O?=
 =?iso-8859-1?Q?tGWTsMphN1pgKYa7vWvh5FY1bznx7rYsKs3hqMKvcKd//tfIgE0S+ycDJE?=
 =?iso-8859-1?Q?z+2ijeTS6y4WVh0fhbaMYiWCeYVCewZ4RCUKhyd2F3VQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB3PR0302MB8919.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?waq/oJPrx0QwILL+YeCqfMH+Iw8fd8H6DnKIthjFrDuMz7b7U6oHV866Xs?=
 =?iso-8859-1?Q?rjsGZ1bGz00SrsABq+azIFyC+YvlBUQG6oBfgE26tBwa4bmn2VP5PNUBkw?=
 =?iso-8859-1?Q?UQwv1cWEi5SFe//44UJ9mwVPxmEaHC1XeIZuQ21970WJCmIaVlq/EPoGUU?=
 =?iso-8859-1?Q?zN7rQtLLAuJ+wKGy6pEgPPh0k3Bs0dURMI3fKfKLn5vCWUat6b1MTmm2Qm?=
 =?iso-8859-1?Q?NWbgnF/zn+I2ynpMME0eZakAfJwPRaefPtIFPuKLC3e1JxAob8H0TC+Vnh?=
 =?iso-8859-1?Q?7e2HYMCroisnaZYOWmeO5Pve/KXQqx6kWkAv8x545V4jerUCSJ1Bkk0ud7?=
 =?iso-8859-1?Q?ujDeWCF5lbP74eFFQrVqbRjo9SuSEXPQFaOFFdHC4+k2SuksFbwqEBi/ay?=
 =?iso-8859-1?Q?GsC03p7tXHNQBVyLanNr22kRpqXrYJY4WRS/7gfdQV/hEKjWnsdLmasOtA?=
 =?iso-8859-1?Q?wfWFS9CUnIdnLhb4pl1WyAW9336jfa8M5csHGB7ADppj8SmNGMf9hRX/yB?=
 =?iso-8859-1?Q?90EHkKna7nONRf9pTcLckY5tNyHiNSQtLXzXY+idl1g0+2pFkqypjvFwa6?=
 =?iso-8859-1?Q?cJ6ap4ok4Y2hv2HSK2JsqVXQlxDg6yDdEwKG3DA0k1FcTJWZ+QMkJtiO/n?=
 =?iso-8859-1?Q?U7r/wQ+geXkSPA/aJMCjWppVQQ58KdLMvScukz6R+siBaOfKzXj2T5VQnm?=
 =?iso-8859-1?Q?dh6KjRKfHaQJk2Zo4xkMyHVDxLJLwR8FopgWNS2Jn5mNu6UodcgV6cqWds?=
 =?iso-8859-1?Q?G5C7++T2rTiIRiVoZV/soYar1jH30oinLmsFpQY5t/wNgEP5DNCvea7TkO?=
 =?iso-8859-1?Q?BolrLdgSZH1FZ4ApH8miqWIIEwRWXmHxqB+55sZR49qz5TvBTKaYJLp2vS?=
 =?iso-8859-1?Q?bYzuKKow4ZT6th+u5KKgTqRSA/RvTX1W6SYGXF181O3f60TwcQCDI3f1CP?=
 =?iso-8859-1?Q?q0WRv+PrQ6iIxidkYoKkPTXtpIsgJf9gA4yYlfjdzWdktmmVfodqCBZW1s?=
 =?iso-8859-1?Q?223v1OxbTRg0MYm8/JZABg5SlNiz5WVltE9i69oh+B6z6fEWMuf0x3hDHh?=
 =?iso-8859-1?Q?rPv84cV8KvV+YWO9riaXSOlZFOP53iCVLeHudwS3o8hzI2dwgaz815MMnV?=
 =?iso-8859-1?Q?wNyKn9hwkNcv/sX5tvkbVHgoDVaX8ywEUvUZxj288xZAgTrFBeylB4t2Dk?=
 =?iso-8859-1?Q?ycZ9jj/KZn1/Yg/VIIBSdUzKdi2A2NtHZaJ+6gcS1PFZg+0WbIS5Dr9CR5?=
 =?iso-8859-1?Q?2jjf7537csXxQTMNDwFI1p1OijB393ZzkDq8edDT4nOOgLKxXaYfkTitTk?=
 =?iso-8859-1?Q?1hECNZFrI+Bspu8u5pdXbD45dTe3tTiLYx7XJpq15QIb4FQ98KBg67aSrd?=
 =?iso-8859-1?Q?3tS7wLqEP7IGnZO8ALkiKzqZjwBxSM231iFcTpYjk8rEHx0D0j+jm5cAZA?=
 =?iso-8859-1?Q?H+RKUCbAJZcFCSdaiCubAk30Tx8JS3npCartfgKVCVFwZM8aGpvyN5DNg1?=
 =?iso-8859-1?Q?BU4kBKjEqSiOf1Pm7aYXzlyJR5Yu90HIx7TZsK4kuEppuiins+ppb2ZQhi?=
 =?iso-8859-1?Q?BwB471NptlYV3p+O2duEHniMUdvBCJAaXk6i/FhGACrvB5FH86sdiCpL0b?=
 =?iso-8859-1?Q?lCcB6fNimlR8233m8yFtKTC/iB4mi/o5ny6Cp70vO6+mtc9sbcxOvthw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB3PR0302MB8919.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e41910b4-51ec-47c0-f4d1-08ddd599a669
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Aug 2025 10:03:25.4776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5RFfXCwejZwfDxIUXjnuixwlXvd1obEEgxdt3JAgYorBzO2XCD8eoZatKrpFwxR5wrxNWnDCVPAPURJzGUJ37iumWpFTLltC7wGspA92I6Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR03MB10211

From: Grygorii Strashko <grygorii_strashko@epam.com>

Call stack for dom0less hwdom case (1:1) memory:
create_domUs
|-construct_domU
  |-construct_hwdom()
    |-allocate_memory_11()

And allocate_memory_11() uses "dom0_mem" as:
min_low_order =3D
  get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));

In case of dom0less boot the "dom0_mem" is not used and defaulted to 0,
which causes min_low_order to get high value > order and so no allocations
happens from low memory.

Fix it, by using kinfo->unassigned_mem instead of "dom0_mem" which has
correct memory size in both cases: regular dom0 boot and dom0less boot.

Fixes: 52cb53f1816a ("xen/arm: dom0less hwdom construction")
Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
Reviewed-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
Changes in v3:
- updated "dom0_mem" doc in xen-command-line.pandoc
- add tag from Julien Grall

Changes in v2:
- changed 'fixes' tag
- fixed comment for allocate_memory_11()
- added reviewer's tags

 docs/misc/xen-command-line.pandoc | 3 ++-
 xen/arch/arm/domain_build.c       | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line=
.pandoc
index 6865a61220ca..1f33b7a11eba 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -1035,7 +1035,8 @@ For example, with `dom0_max_vcpus=3D4-8`:
 > `=3D <size>`
=20
 Set the amount of memory for the initial domain (dom0). It must be
-greater than zero. This parameter is required.
+greater than zero. This parameter is required (and only used) when the ini=
tial
+domain is not described in the Device-Tree.
=20
 ### dom0_mem (x86)
 > `=3D List of ( min:<sz> | max:<sz> | <sz> )`
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 463ae4474d30..a9e4153e3cf9 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -249,7 +249,7 @@ fail:
  *
  * We first allocate the largest allocation we can as low as we
  * can. This then becomes the first bank. This bank must be at least
- * 128MB (or dom0_mem if that is smaller).
+ * 128MB (or memory size requested for domain if that is smaller).
  *
  * Then we start allocating more memory, trying to allocate the
  * largest possible size and trying smaller sizes until we
@@ -278,7 +278,7 @@ static void __init allocate_memory_11(struct domain *d,
                                       struct kernel_info *kinfo)
 {
     const unsigned int min_low_order =3D
-        get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
+        get_order_from_bytes(min_t(paddr_t, kinfo->unassigned_mem, MB(128)=
));
     const unsigned int min_order =3D get_order_from_bytes(MB(4));
     struct membanks *mem =3D kernel_info_get_mem(kinfo);
     struct page_info *pg;
--=20
2.34.1

