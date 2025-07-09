Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A708CAFF3FE
	for <lists+xen-devel@lfdr.de>; Wed,  9 Jul 2025 23:38:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1038671.1410970 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZcUq-0001a2-D4; Wed, 09 Jul 2025 21:38:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1038671.1410970; Wed, 09 Jul 2025 21:38:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZcUq-0001Xy-94; Wed, 09 Jul 2025 21:38:32 +0000
Received: by outflank-mailman (input) for mailman id 1038671;
 Wed, 09 Jul 2025 21:38:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HxYN=ZW=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uZcUo-0000ps-Ta
 for xen-devel@lists.xenproject.org; Wed, 09 Jul 2025 21:38:30 +0000
Received: from MRWPR03CU001.outbound.protection.outlook.com
 (mail-francesouthazlp170110003.outbound.protection.outlook.com
 [2a01:111:f403:c207::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0d9dee23-5d0d-11f0-b894-0df219b8e170;
 Wed, 09 Jul 2025 23:38:29 +0200 (CEST)
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com (2603:10a6:10:3f3::12)
 by AS8PR03MB7461.eurprd03.prod.outlook.com (2603:10a6:20b:2eb::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.27; Wed, 9 Jul
 2025 21:38:27 +0000
Received: from DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30]) by DB4PR03MB9556.eurprd03.prod.outlook.com
 ([fe80::ff66:ad9c:fa1:ef30%5]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 21:38:26 +0000
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
X-Inumbo-ID: 0d9dee23-5d0d-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvoldB9gZBNqJsfx8qpdA2iIdT7Ikjs7OS3gbAmB+lS5TNb6oZk2eF2v3Po9LeY5qM88eSWu0F/biveBpURTCL97n+0TJfVqm04LVjSQ/ogjqvkPAR+12+TayIlA0qkPadi+nM/VBsc3K7TDxzzQVoSLtBSYXSWCmJSkwNMgcce5+i1CbBc3S3HuUNeOuIwsBazJXMqLLKvrU90CnQ2WKXfaC0DvxNMmMOOJS2nYp1bwvVe9oJmoxEXCFTD7RdOpUNTctKvgStM0vs7k4dfpbb3wyPJ8+y8FUZC1Cpx5yfY2OnUet9I8CTi4t6paq08HNsHD1rI/GsQC9ISzwfpRMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O28uEQYanihHq7NdPpbEx867fvOgfmU0socN+LB8aNw=;
 b=YLHfrvInFPJHcNLTtZSJwTMIBZFLMaro/2vZufUKozw8d3FbW6KFSQ8fF+qVZTmoo7h2aSPbu3aP1X1ndxyUo/UkHlECPrsn4hoqU5CEHUQZuImGZRQa2RIIiGzZda+utWDN4MDN7u7ro/934FlzxM0PvW9o+266zzodZBCnuaZ23dT/2rE+csl1hvm8ZZAe2vGok+JcPFRB/ukF7KFC8vGWqxqSAzgssYBmsoEUYSxcQrc16Zi9bq81HQaOBqM33wBXXgB/vxwYftBwWwOTDY4mc/yc37bDGecwtKXcyYx/FIVzId3FyXavVnIx5sx3Uqa3MmDiw5qV+34S1Fjqkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O28uEQYanihHq7NdPpbEx867fvOgfmU0socN+LB8aNw=;
 b=m0s7w9b3gw9ujhG3RgXB5rwXIUlQWYO0fu+ofV96YnnE4BaxZu+ejnkb4KZrfjaS+eMS+zWiSQGnNj0GPDjYtv6sNY7FUC44EKv2wls3+2/DQ3dyYSBcfptBSa2eY3E3n+7g6uOhQx2AdavG0WNkJZDJvaFzwMU1WZc+Q2fppMJd4WswrBC5WNpOj7mBolFS3PQKRVZqm0b1StL6byxHzKSoMCgDK/yymLUdy8VRlgf21ZQGl6dr/ZL5pUUd4o+qKwAjJLR+MghTpjhY68peX9diOeRauJV92U5dFxbqvK1+YMCUTVSZbOCPrLkt2ZcmCG8VozF/1AHiSbTUrzH5QA==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Topic: [XEN PATCH v2 3/3] eclair: add deviations of MISRA C Rule 5.5
Thread-Index: AQHb8RnNNQ6jd6+ExkWCWY/+NTwtQw==
Date: Wed, 9 Jul 2025 21:38:26 +0000
Message-ID:
 <e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro_prokopchuk1@epam.com>
References: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
In-Reply-To: <cover.1752096263.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DB4PR03MB9556:EE_|AS8PR03MB7461:EE_
x-ms-office365-filtering-correlation-id: a477d23e-44c1-410c-d531-08ddbf30f067
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|42112799006|7416014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?eLqpea8KC5jhu72Oa+Ab1hsbS6a3j55VrDYlSgWT9b6dU8BBrMAYMzG7Aa?=
 =?iso-8859-1?Q?Sp8Bn3iMehKXgswP02fuPj1GkcNV+siQiNl1bmRvAZwgFNXzQEWrF8uKUC?=
 =?iso-8859-1?Q?SjXQr8bTUJ2xti7Ckvs3Ii7i5q0KKMIGwoigWdj8LGioam5zgI01m9XF+2?=
 =?iso-8859-1?Q?30kpXqIP2wHP8qRq6Bo9y5a4ybq7xhCsvelAiKZ0vvy+0Yl6RXWn4hDnZD?=
 =?iso-8859-1?Q?ZbqCmPf2TIa6R32X6ZKNuRpCIMQOoX/j1GcROeer5/LCdDi74QXWxF9H2K?=
 =?iso-8859-1?Q?bt5MsxAZy8RA6ujLf2hzS71hw0eyqqDEOfGTALa8pNS4fbiYAhBQA8+06s?=
 =?iso-8859-1?Q?iABGiVvmv/N/VhLMCZ9AWSX9+rfv/OowssKJ3YFAcnumKSW06jm593/P0s?=
 =?iso-8859-1?Q?0U8R1LUYSHm4ziM6BaEMWy745vlvBnWH3pbrDRQy3GfbwyweTuq0KtAN8e?=
 =?iso-8859-1?Q?i/Xe5rHugdO+yRFxRce0TiZWgjUA9C36ubg7jZtM5qnuyPnnjgJdklHFup?=
 =?iso-8859-1?Q?grspGxOw1UrKhKyrYLyeUPlAsLA9KhMbweszFa8TwWC3YRcELFJUf7+h0E?=
 =?iso-8859-1?Q?sHv5C5FPNNNnj4zDzVO8BD0IcYmNHpzcVhyp8/pywtUA5D9Yk9LBiXDon6?=
 =?iso-8859-1?Q?62bO2BNWsJAjs3+3Sv3MYItAJxQC6BYZvPgb6ccsue42l5BHpFAGLZa/dT?=
 =?iso-8859-1?Q?jL2fIyGqOL8An7G6mzY9EQMtipvk56Tslahu2DsS9uZ4VwpjGR57ClV187?=
 =?iso-8859-1?Q?V4RrZ0rhBI06IQJS3HpTi9LncB3WN0pNndlUPvcTndITks9c2YKZ+hw3Hk?=
 =?iso-8859-1?Q?4oaeD0BcucpKP4E2oa6RREVVPU7fKuyxU/ejgGL+RTpx3mXC+R69lcQyoO?=
 =?iso-8859-1?Q?jFuGvGKIbjsaljTlhckgwIOpbejHVmFt/BScTQHZlTTFcdrKJQ8ag54JnW?=
 =?iso-8859-1?Q?d33tZcc7NiNqjHJcRa3IZXIRDUVi3tF75no0f49BGvGLV4IY5VU9gocFaD?=
 =?iso-8859-1?Q?oo0vUlXbLjh72NtoBusZWW7Zb+DucnmRJ+VfeM6fFFmLEB2iDVFaDzLDd4?=
 =?iso-8859-1?Q?tHX+22T80Jasj1wwCnNPSD0uDb0Jq1w9bWg3cFWAh0Yb/aZH/dTgSnXZSJ?=
 =?iso-8859-1?Q?sQ2LmzXCwD9b+eKmC0HbbbLug3lEZp1rphBLN8wWkhgbSoEXPL+vFx1zAn?=
 =?iso-8859-1?Q?IywnR1D9Py4DVEFNHf039NeAVInPBL81oW9o8DkaELMwntXmKgJUDdKLyc?=
 =?iso-8859-1?Q?/leEzu7q9FNNKQCYkvkLwr58QiOZQyz7bZrx5+/K9IV5JvcRTp4LFi6Fbo?=
 =?iso-8859-1?Q?JwhlXjwtBDlTIQH/mefQvZApNkIkyIxntAlH1xdpN/XDYtU8BUP2OPUCDN?=
 =?iso-8859-1?Q?YaUpi1SiMBkdrB7JeQ8KgQNPfn3Krqk+aoQe/7f2V2O6fTqVUS0vwe2SaF?=
 =?iso-8859-1?Q?iyoMrVo3I8gdgquen+Kj+8zBSB38rktOKtgKNhcy9r8C/VPlzrpCSy9JLK?=
 =?iso-8859-1?Q?94Y33RwYJLj9a7q8UfsNSG/3SXRJB7au/oPjSVGEX+rA=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB4PR03MB9556.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(42112799006)(7416014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?pgGd8gV7XTdvIXb7K0ksoKbrOVkVn1s8HAzT/4R7u5niRTWSEdgggLkRR2?=
 =?iso-8859-1?Q?TgNpP77KS4EBX/ON9HYdS6Tft72Hm20i6hWMWAxrO6W/gOKz+y6SqtOwJ2?=
 =?iso-8859-1?Q?db194g1PMGObhJeXGzL0n5fbpfEgeoZKbAD0AfGdfx6s97oBpEa+MFYlLx?=
 =?iso-8859-1?Q?NDgeW7FVizByE2WkknkSA/QzXc19Ll3e6AW/2sgCN0Joc2U3+iDS87Mr5/?=
 =?iso-8859-1?Q?WW21uSO/qetBQu9xnVC3AHjU3NE3tmjkfDbr5SV5LtuG9Nx6VLMmW93FsT?=
 =?iso-8859-1?Q?98JGcOvVEJ+nfMsd5qp9og1H8CCkTAewc2Gq1e6TYrKLTjwsvyifl9GP+i?=
 =?iso-8859-1?Q?X+Gpbc0gIv0dLSOGLDNFWBR+BUdfLTPK2pO9Hn8NH8nTrap7ia49UyJ0t9?=
 =?iso-8859-1?Q?x+580xG5ps8cJKuUjxunw2E370iZgsznyHFHxZs97l7QiIvCZWf31sZ2rI?=
 =?iso-8859-1?Q?VxhvVyT5US65Xh+7mKNBOUJ7lB2ykYnJsWC7EaG8m3rPfDQ1BjtFcoeQrj?=
 =?iso-8859-1?Q?ub3EFV4/SlBmA8UJzVGokRUSUeJ5DTfWI+UyAb4O6oII2pK+xr0CQBoIFk?=
 =?iso-8859-1?Q?BsKsN44etrMXYxREXiVdPReQH8Kdz0HD+kHmVL0LYUktmCX2MVL6xxkY5A?=
 =?iso-8859-1?Q?8lzCRBYoZ/ka7TXyXhX/YYxh1e0OBFmhcRE9NzP9c+encEwRvwjdxJcewh?=
 =?iso-8859-1?Q?qw0qvtrCM8z4clEiRTn3LFn5Hj1zdncEP9GyEdQLexdtA57Z8KTk0wqQXZ?=
 =?iso-8859-1?Q?9Bn0KPJ1stVPFMGcNHkPO0KU6yHToXv2ZQ+M+iOQTyulfqiOJGcD5cB2Xb?=
 =?iso-8859-1?Q?ZbtqML5odZzl1GztyZZCr5DiDzqNjJFrGc6epDvKMFhKI1nOF5drIqQr7L?=
 =?iso-8859-1?Q?md3Vbcfvdfti8TkmaWuhOpa/ntxcuoxcV863KW/8sjbXUQeWtvjFuf4ESt?=
 =?iso-8859-1?Q?KreoiXN/KP3035mrl8zSQW+v7x9SzkaK+nBWfGA8uCiDeBMQlSQVc+eDqU?=
 =?iso-8859-1?Q?nLLiBTWVkH+nZ2ZCsJwSMcWZDQw3RqI5GsCx119kwZXtfvCgUhtU3ovArX?=
 =?iso-8859-1?Q?ZdWGLKq0DISZmBAJOg8+XQHPROuGPwR7farLDGWdfD0UBu1BiSRsHtV+0C?=
 =?iso-8859-1?Q?92/kgIyVnYqn/YgSJo6X6U3pBGFUQOVPw1CYIJF9HNE9dRZtfD38KuJa0T?=
 =?iso-8859-1?Q?qER5U3BeJK20ZMKDbhvgTLScyNQKuVe8+C5DUq0ncX/pNsoF4y7Zu+rrf6?=
 =?iso-8859-1?Q?k0pr2kJ7/v6+9q0EsKAA1B3rS0hxPbvAvYCPlRHBGDxQ7VSDVkAq5qwphi?=
 =?iso-8859-1?Q?3fjZi2ENurjUFeuLvl3cJ36IxsLT3mE1GkrxRrM6NCdhAzcd2NEXUqJ7sC?=
 =?iso-8859-1?Q?yJZRDei3/WD+w912m21+mFT0uf3OYlToKnd0PHiPk1MQkiegyzAdPzJU6+?=
 =?iso-8859-1?Q?KdNUGbD3gV09O7h9AfwaAosLEXJ1w9Lt/0k/zxj5bIsz96bU7tbIhsKu7n?=
 =?iso-8859-1?Q?iA/tS0QdijL/HLzAMySksn+ySDnwNwe12GLwtiKDUkOigGfunQlQq0tD/A?=
 =?iso-8859-1?Q?bCE80uOg1jpUbtfD10je3tmvUZsA8diylETGRmHrlne9vHTe0sqFIgbFE+?=
 =?iso-8859-1?Q?a13LP1ipBmooF6FybBYRA27IjGWwBfd6FVAw+ekQEISMAPb94I/P9oKQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB4PR03MB9556.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a477d23e-44c1-410c-d531-08ddbf30f067
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2025 21:38:26.8653
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RT6qMxGIKIiKu5CLQxrtRGJTVkkRTn/tl6jRENfDNG4vb96y04Lkvjehmdw1y/af8/H2/x3MOrMTYpa3JQApZK20ZJu5aMyXjv8ixPwDDQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7461

MISRA C Rule 5.5 states that: "Identifiers shall
be distinct from macro names".

Update ECLAIR configuration to deviate:
- clashes in 'xen/include/xen/bitops.h';
- clashes in 'xen/include/xen/irq.h';
- clashes in 'xen/common/grant_table.c'.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 8 ++++++++
 docs/misra/deviations.rst                        | 8 ++++++++
 2 files changed, 16 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index e8f513fbc5..a5d7b00094 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -117,6 +117,14 @@ it defines would (in the common case) be already defin=
ed. Peer reviewed by the c
 -config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(decl(kind(function)=
)||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^x=
en/common/libelf/libelf-private\\.h$)))"}
 -doc_end
=20
+-doc_begin=3D"Clashes between function names and macros are deliberate for=
 bitops functions, pirq_cleanup_check, update_gnttab_par and parse_gnttab_l=
imit functions
+and needed to have a function-like macro that acts as a wrapper for the fu=
nction to be called. Before calling the function,
+the macro adds additional checks or adjusts the number of parameters depen=
ding on the configuration."
+-config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(all_loc(file(^xen/i=
nclude/xen/bitops\\.h$)))"}
+-config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(all_loc(file(^xen/i=
nclude/xen/irq\\.h$))&&context(name(pirq_cleanup_check)&&kind(function)))"}
+-config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(all_loc(file(^xen/c=
ommon/grant_table\\.c$))&&context(name(update_gnttab_par||parse_gnttab_limi=
t)&&kind(function)))"}
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 0d56d45b66..fe05e4062e 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -142,6 +142,14 @@ Deviations related to MISRA C:2012 Rules:
        memmove.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R5.5
+     - Clashes between function names and macros are deliberate for bitops=
 functions,
+       pirq_cleanup_check, update_gnttab_par and parse_gnttab_limit functi=
ons and needed
+       to have a function-like macro that acts as a wrapper for the functi=
on to be
+       called. Before calling the function, the macro adds additional chec=
ks or
+       adjusts the number of parameters depending on the configuration.
+     - Tagged as `deliberate` for ECLAIR.
+
    * - R5.6
      - The type ret_t is deliberately defined multiple times depending on =
the
        type of guest to service.
--=20
2.43.0

