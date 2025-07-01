Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCEEAF041D
	for <lists+xen-devel@lfdr.de>; Tue,  1 Jul 2025 21:51:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1029932.1403635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh0S-0007pc-Ai; Tue, 01 Jul 2025 19:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1029932.1403635; Tue, 01 Jul 2025 19:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uWh0S-0007oH-7K; Tue, 01 Jul 2025 19:51:04 +0000
Received: by outflank-mailman (input) for mailman id 1029932;
 Tue, 01 Jul 2025 19:51:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mpZg=ZO=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uWh0Q-0007oB-58
 for xen-devel@lists.xenproject.org; Tue, 01 Jul 2025 19:51:02 +0000
Received: from AS8PR04CU009.outbound.protection.outlook.com
 (mail-westeuropeazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c201::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b4387021-56b4-11f0-b894-0df219b8e170;
 Tue, 01 Jul 2025 21:50:56 +0200 (CEST)
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 (2603:10a6:102:32a::16) by DU2PR03MB8075.eurprd03.prod.outlook.com
 (2603:10a6:10:2e6::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Tue, 1 Jul
 2025 19:50:54 +0000
Received: from PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673]) by PAVPR03MB10142.eurprd03.prod.outlook.com
 ([fe80::61c8:1ce8:e4ea:c673%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 19:50:53 +0000
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
X-Inumbo-ID: b4387021-56b4-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bI6fTInhpfQeWqSvjUqgtmp/W0vjmWN7EDvCZRmSg9mZ7W3p9rBDXZyWAHJazDhuz4g2PwSUtUHoZTHWkkEve3Q02wQoMT3jNrznesQmN3L2K2n7brjxYHVgHLSJA210i5T1iMeVOPTa3v/Rys8WrxJ85YKQWAGZ8NJh81+HnSI9etQI6Gs2FaU6tGqzztK/eWDOY/BAwMCjBRttn+9MsuXpASzm2KxI78FAsLZ3/GeY4Q9BkW6yFcwCfxxpndTMxltwQE+rqLRfh1PEqAEzZQGI9BmEjDliBCKU3msi6lIRGrFXfYpXuLpKfcfLA7UllIOr5gJr8Kkn56L7NphqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AK9RY5BMGQQPbiULiN7ngcIXmj6sxM6MiJfpvUXN/N0=;
 b=ZKSAus+sjVEZD2TFdD9ueL3eIZ0sNKN8XM9RARrQzkiftVaso2cukd1R8MYLivtBn89aeiwB/ZEAm4umRXl7Pa5PFk+RPLljNqU6au8wA5Y321qvWN2kmGLlUZMuC1/TM+6+DxIepQp7j0R2wEKJZYs0Q4tpShNhhyk10w9NcmwPWOi4KNkt6DAqI0fBrcez/VeRbXF8axdQVO5OeY0udXD3VfqLViyQUvLRq8L6Tj4/EdTbSxsJLnwS4+2HTj7Jrte+lc6eumfDcANh1WFB2XGiGfmDoLExfcn9YTTtr3VjTiCkZxiMLg6Cip4sBjRlBIDowGvRM+gKL5P2anYENg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AK9RY5BMGQQPbiULiN7ngcIXmj6sxM6MiJfpvUXN/N0=;
 b=gIcMD1v8p3GLcMDII00xNywI5m0NHL85hquOfFVWdPJzzgaaV8kY4RQFTijXL9i03zAhVjkuIQ5qmiloCk7iI4oRZJzzbKN55ddWqJwr/L59eN01a8nOPgcm4mFBgrzZFAwuXPEm3fEUtG+gpu8VKfcxvMgkwq7hSE2v7IPgFxVt77aKu7DTVs+ThqrsZ1lr4GeLGZotXLjJ8DEuLqiieqMY7oPX5ArPLA09F8o0B2nnqDZ/rdnb5XLZ32l1KCnHuEpVy9479Nfo91/9Nwty4dCWDfYD/e3KDKDlfXw+/iwpxHzIJO3yz7ZMFZasEnJtNEtF5yQLTkt9mvQOI+W6kA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Federico Serafini <federico.serafini@bugseng.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
Subject: [XEN PATCH] misra: deviate violations of Rule 21.6
Thread-Topic: [XEN PATCH] misra: deviate violations of Rule 21.6
Thread-Index: AQHb6sFzLVXZNQ9kcU6nwe5F2wXIFg==
Date: Tue, 1 Jul 2025 19:50:53 +0000
Message-ID:
 <e299faef83b0d76c92071002b2302a67fb670b45.1751395929.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAVPR03MB10142:EE_|DU2PR03MB8075:EE_
x-ms-office365-filtering-correlation-id: 25d92671-90ea-4e1a-5d1e-08ddb8d8965e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?HhXVFSqO8SUubz2aHQbqb28WC5dMbqYZ313cd3thuFwiVcrD7KdDtknwrp?=
 =?iso-8859-1?Q?xr4dmfxPwxg1IimBqyxBMYwcW34Oxgd4CnPIPIAp1oiItbF+QEDh36nmwp?=
 =?iso-8859-1?Q?Wx/v/yvR4wOVPpSdz9dy7Pk6q6hsDrYJ6S6YRYNuCLZQelRUeWZq1xdQ/5?=
 =?iso-8859-1?Q?XSA2RKDzu4ttGs9WkdWchU1P5WxHu4CxF4EJ2v/YzeWrqbhz9P5CXoyAdM?=
 =?iso-8859-1?Q?tHYBNsk7VNDmPruNK7UO6K8/7ARFElLPdCpGqs+Hjw/FV5/lLcPYtgeUok?=
 =?iso-8859-1?Q?ADA2T3S5RncNS8SPGZlv3t4C3PseK2jnYcnDYeFJfGFwKLobXogDzfAqgg?=
 =?iso-8859-1?Q?M8+Uv38S5zpOQCs6ixkRyMqjsDJqM5r9iCY3D40XumjDqvPdw3WhRJvxRg?=
 =?iso-8859-1?Q?nWkKFEkeSTasClkQDx12q9F9elTE3iwOLQzwNqI9WFXcRQ+yR1iBoH+bm6?=
 =?iso-8859-1?Q?VXFIqlk1awyhErNl9V794aTj41ObmN4W0iA14ofMd5zkn4Qwy6aif5PRUv?=
 =?iso-8859-1?Q?NR234hbCwPHBCLqfoSZgp1vwTj2PBuqGd/HB6GsWGMZ7AncWnPjk++DSko?=
 =?iso-8859-1?Q?4GF3i3C28+sQVEnoym0u2uq7lLsrQPPcTubfNEQx0XeWSoPtrrEu5m9C5E?=
 =?iso-8859-1?Q?50Ornuw4cER10SlkZaUWcCdy9M/AK7uwvO8cLUZZ9T3bg50Ky48kMKZi9i?=
 =?iso-8859-1?Q?Hca/uPOd01+YQvw7sjl/qum3iubPjHkk4pBdMvBYL0Y3Pfx8S05/hgtljs?=
 =?iso-8859-1?Q?dvH2h2hZlnR4MWKIKus1/kvyRMplYfmFTqc2y07HujUMhmwxHCq/+rllXw?=
 =?iso-8859-1?Q?t9MxUqKzIiJpbyvBJdk9CEYldDXvyHSIt6Nw1vyDPTyqJ/eU1yzAQzadr4?=
 =?iso-8859-1?Q?ADaATOFUKVizNj6wgNGVZ4anXX1nJAQlLizdWSws7uGDmakU9zE9LI4imO?=
 =?iso-8859-1?Q?UCLeBS5Xn2VUQvXNDOVt8RvwK8/AJ3OiZ6XO4rqHSlksdQIRbkRkL0h5lJ?=
 =?iso-8859-1?Q?coqILfyeXSnEv/Kx2mLUB4TybG6sQzLGpKfBVlNCeg96ftUdAWNm9phgdk?=
 =?iso-8859-1?Q?n3T1XEQi1YGcm2ouVIZEqWOHA+hEr14/AUVt7BFBykw2o6sDAA+Wk16eyB?=
 =?iso-8859-1?Q?STabRi+LG7PnolvAiyQldwN45SX18RzJmZpHNFc0Hf/BU+sGYv/cD6qFYl?=
 =?iso-8859-1?Q?U00Yu4/F2HV+Nj4wwGLmQV7AGi1hq9WDoOopDwG8Qx8TAtaIkubhmdCl92?=
 =?iso-8859-1?Q?ZsaGIXBaTNoP5LIxpZPfC0OCEHsLy6umaWF5d+r8ifkYlr4FLEAX+7V4Ud?=
 =?iso-8859-1?Q?kPQnrAkmJYtSjriqu1QdQk6YhbPDNVLNWsJ6+7EPmgHRzW0AZM7cobdcqr?=
 =?iso-8859-1?Q?lJTJP3oLh2YOhsDtChCG+b47j7mQoaeVgMkv9PpEgujVFQm341cmTuUjL7?=
 =?iso-8859-1?Q?z4sbVrhosoHSEujP/9hsm/l4hOaDE3/y8H04w6M1c15BjmrTHCzr26LIp8?=
 =?iso-8859-1?Q?cP2fHKB8dXVxoFlpYh7hgxnYpd5WHiAIqS/1DlH7z/jQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR03MB10142.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?hVVQwMk8meCgBHXtVnnv3nsh2rOGfebHXpdibJWoW/mNTWkNO/i5t5P8xL?=
 =?iso-8859-1?Q?bdX1FwsPyq4deloHnsxeCy1FFCFsfbg4l4NlsOCm0jfsOJDHZZvHE90yWI?=
 =?iso-8859-1?Q?KMU2SS+yFfvVsfxrZyQ5GmAIFgMlYM8zrvefil9RPc428KnJSInDIV4scj?=
 =?iso-8859-1?Q?Gr4ZWPk2JyeE1jKsxt/cA9jhMJyDAizBibUJkZKyIkMZ0H1kwF8lpoIciD?=
 =?iso-8859-1?Q?KdzSCsvv3BpU6eKyNtHUPYsnNi5d0zKRgKkGUYfZnyShRXaX7nofIPQuy1?=
 =?iso-8859-1?Q?rma5AFYdSNKJ7CnITVGnL/G2Ohocmb2SLVfGSuuINTq0QcDibmz/YoBCzh?=
 =?iso-8859-1?Q?FO+uXurIcLVxpnX1HuZ8dHP/FyIZBvG6n6j4TuRCZIeSLPhfYkrhuI6hzr?=
 =?iso-8859-1?Q?VCNVblYFaVwePEmJq6yVluwp+8MlSR6hb7G8dXDLqD3eK7RaycXUg77RhT?=
 =?iso-8859-1?Q?bTUISLVOQvGLE8pCjU8E3fekExFGBuee39kgf6268F2DrfLpBNEMLFZRdl?=
 =?iso-8859-1?Q?oJWiLXkCskt5H1K3Z4nMcIECK1IBYMe8l9Ywwq9sIs4uzfz+VTZFF57PZo?=
 =?iso-8859-1?Q?sS4YEQMoxNZyeBuhRS3qe3WfSybyeWXsDOflMkL0fmVOVKMYpICijOQzQZ?=
 =?iso-8859-1?Q?7tizA/XktmnAD7pMtkVwTUBIL/IZn6YDKH/S98JAw7qzyxgUErYBlFDWTr?=
 =?iso-8859-1?Q?R7bgW39jRurfDCCAZPcSze2d02m0zLvSDl67BM4KOnS4/Uce3I7HJkmJ+r?=
 =?iso-8859-1?Q?4DU5AgS1Ef3O49h2rqmErban6qicmMPp8eCi2Nx3nq1QVGPaWGQ6T7R9fV?=
 =?iso-8859-1?Q?vfIAUGR9nbeoqoZ0z/NjJj8AiO4nzdOQKmxdebgV8bEsJJ9cwXBXeMUcwv?=
 =?iso-8859-1?Q?Q3uo9BsjKdDocU3UHRstbJ6hof7er/D1q/yEO4wVwI/U2pTrxAeuIQH5RW?=
 =?iso-8859-1?Q?cKMqA2CMl+0WVO//0M2dfvEln6Vta43rUUxzU6GSz2Cb89zHRewn7Fdelk?=
 =?iso-8859-1?Q?9RLDESGfYbbsaMJUzz6zl+/TDinwVk4lkqJKoMhRGf/WxaVW2DIX58Qpua?=
 =?iso-8859-1?Q?VoLXJIdFFkYkvsXeXlAjTxWrlkaqYdl3Scsn5lSg3Is9uFfkZraeMt5tch?=
 =?iso-8859-1?Q?CxkZKl7jnVf9r+xeKxBFAOYjj8AYZI4nozADnPZcpTTv/SrL3y45RD049m?=
 =?iso-8859-1?Q?8ekKqnMYfkMCbnbydwkYdN7N5i9I+u9i77f1KZEYBlKSmZbCd1pJq9+p/N?=
 =?iso-8859-1?Q?SNdJm1Lrwc6iyC+fsa01hOwxuZxjvguewpEjXrUBvdefjAuSF07wU1J4Dt?=
 =?iso-8859-1?Q?Lqfk2jgupsqlVEBMSIP5+gLIAY5ogL1apmeea265h1x7GUGVqE0lXwM6RZ?=
 =?iso-8859-1?Q?Mdj8phzfWA5kwPpZTYjhrXiDT2OCYjOR/CUTzcttSJxzKBvbocVtrhy9Rr?=
 =?iso-8859-1?Q?Ir8/Ea/0jQb9t7WS5Femnt8w62Yxzg3GHU0FN4jzURmooathrrh5ejw3Nd?=
 =?iso-8859-1?Q?GBzMMbUBQbIN5YXbU+L/WAivLjAxgcAZpbftYVLRORWNcecol/dO829ud0?=
 =?iso-8859-1?Q?dNyEiCZSwxopsTLqEIhFTgjdhk6oFOsmXmOreJvuJR9HfJ6pNtWzWUTrW+?=
 =?iso-8859-1?Q?nM9mvjnB+nO+Qeq37kh1Yhaxg0N9QnytK9AY7BcbD7KT4lZAsSOOmGYg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAVPR03MB10142.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d92671-90ea-4e1a-5d1e-08ddb8d8965e
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jul 2025 19:50:53.1192
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 3E8frnqHGymOwQWyEW+dqaKqa3MxVdM1OZ0YwlMz+KtAiqsHby3QBtqDT2NXu3FOm1+82Dyy5YczlA7PghzDV2HJDdkOiZ7Zo7NeE3IJ5OU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR03MB8075

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Rule 21.6 states that "The Standard Library input/output
functions shall not be used".

Xen does not use the functions provided by the Standard Library,
uses -nostdlib to ensure this.
Xen implements a set of functions that share the same names as their
Standard Library equivalent. The implementation of these functions is
available in source form: if some undefined or unspecified behavior
does arise in the implementation, it falls under the jurisdiction of
other MISRA guidelines.

Update ECLAIR configuration to deviate violations of the rule,
tag it as clean and add it to the monitored set.

Updated docs/misra/deviations.rst accordingly.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---

The latest Eclair analysis shows 20 violations (ARM64 and X86_64) of the ru=
le MC3A2.R21.6.
In details:
14 violations - use of function `snprintf(char*, size_t, const char*, ...)'=
 (<stdio.h>)
6  violations - use of function `vsnprintf(char*, size_t, const char*, va_l=
ist)' (<stdio.h>)
As mentioned before Xen doen't use Standard Library input/output functions.
It implements its own functions in the common/vsprintf.c.
So this Rule can be deviated.

 automation/eclair_analysis/ECLAIR/deviations.ecl |  3 ++-
 automation/eclair_analysis/ECLAIR/monitored.ecl  |  1 +
 automation/eclair_analysis/ECLAIR/tagging.ecl    |  1 +
 docs/misra/deviations.rst                        | 11 ++++++++++-
 4 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 9c67358d46..3a4d9ee3c0 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -650,7 +650,8 @@ implements a set of functions that share the same names=
 as their Standard Librar
 The implementation of these functions is available in source form, so the =
undefined, unspecified
 or implementation-defined behaviors contemplated by the C Standard do not =
apply.
 If some undefined or unspecified behavior does arise in the implementation=
, it
-falls under the jurisdiction of other MISRA rules."
+falls under the jurisdiction of other MISRA guidelines."
+-config=3DMC3A2.R21.6,reports+=3D{deliberate, "any()"}
 -config=3DMC3A2.R21.9,reports+=3D{deliberate, "any()"}
 -config=3DMC3A2.R21.10,reports+=3D{deliberate, "any()"}
 -doc_end
diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/e=
clair_analysis/ECLAIR/monitored.ecl
index ca2f5e3c7f..e2ad224d79 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -82,6 +82,7 @@
 -enable=3DMC3A2.R20.14
 -enable=3DMC3A2.R21.3
 -enable=3DMC3A2.R21.4
+-enable=3DMC3A2.R21.6
 -enable=3DMC3A2.R21.5
 -enable=3DMC3A2.R21.7
 -enable=3DMC3A2.R21.8
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/ecl=
air_analysis/ECLAIR/tagging.ecl
index f9da5d5f4d..5bf214f480 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -93,6 +93,7 @@ MC3A2.R20.14||
 MC3A2.R21.3||
 MC3A2.R21.4||
 MC3A2.R21.5||
+MC3A2.R21.6||
 MC3A2.R21.7||
 MC3A2.R21.8||
 MC3A2.R21.9||
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index fe0b1e10a2..6cd8f48c91 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -587,7 +587,16 @@ Deviations related to MISRA C:2012 Rules:
        construct is deviated only in Translation Units that present a viol=
ation
        of the Rule due to uses of this macro.
      - Tagged as `deliberate` for ECLAIR.
-    =20
+
+   * - R21.6
+     - Xen does not use the input/output functions provided by the C
+       Standard Library, but provides in source form its own implementatio=
n,
+       therefore any unspecified or undefined behavior associated to the
+       functions provided by the Standard Library does not apply. Any such
+       behavior that may exist in such functions is therefore under the
+       jurisdiction of other MISRA C guidelines.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R21.9
      - Xen does not use the `bsearch` and `qsort` functions provided by th=
e C
        Standard Library, but provides in source form its own implementatio=
n,
--=20
2.43.0

