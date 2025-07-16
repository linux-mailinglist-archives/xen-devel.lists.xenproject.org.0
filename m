Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5923FB07C7E
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 20:08:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045574.1415724 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc6YT-00038M-Iz; Wed, 16 Jul 2025 18:08:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045574.1415724; Wed, 16 Jul 2025 18:08:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc6YT-00035v-GJ; Wed, 16 Jul 2025 18:08:33 +0000
Received: by outflank-mailman (input) for mailman id 1045574;
 Wed, 16 Jul 2025 18:08:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nLWN=Z5=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1uc6YR-00035p-Pn
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 18:08:31 +0000
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazlp170130007.outbound.protection.outlook.com
 [2a01:111:f403:c20f::7])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e07890b3-626f-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 20:08:29 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DB9PR03MB8284.eurprd03.prod.outlook.com (2603:10a6:10:30b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 16 Jul
 2025 18:08:26 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Wed, 16 Jul 2025
 18:08:26 +0000
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
X-Inumbo-ID: e07890b3-626f-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gggrt5fCwEBjmVzln0BgdCIsC4ImnMrsnRgm7eGnkKg1OalwtaQwiV58r8q0IxxNhnd+rUrAvj05AMVJTwi9DeQI+F7kGkN6UqDEVBZo9m+d9c2tDJiOWBvXUY8Rea7tf2tljjUYbKpuotQJCAuVPPdZLgcATGujnzyRY46/E1F9e9ppfXKlvvjakoxR7x3xfSxVCPZTrfG7Wi1QhsnTdbFh1hdGJyd4JTKYv71t39tsnSAiccYYuS8TJstCH7puerUBL/8WWBGH4cXe3T1tm6ezkVoiydMb7Kff1qw10bcifn/32IbgHE+RJeABKKwfZKa2LuQDHKuPjeqIebbfWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XhJh5hGYMzBx0qp1vV4LaB8BjWjwnZSC+bBn/zZ+X4A=;
 b=Z+D+Cl+YX0ZDaRW6oxaSqUuksf0xQNrR+RmeKeY0oflSKke0lNgrqC3h4wE94lM8ZhfLY/49B55sRBCG21m6u2GmsIGMl0wpRnntYZtqE4rET/0f0rL0H1WKQaX7zON866Hylz0ZMhKaXwfG6YoXz4decclZ7hZEAwcn1tG09MqyOwQxp9VfpOyOgqKY8Ke3SG+ompBH7a8zHtjX9LzNMqy+PcgV79tHbmaPVdFbb8osyHa9oZAOWECsYOtoAX261+ZXrFswFbl3oSzMW0UK/gdIdh7ZbEVRz2Sk2xfK+zCWzF9KcfTfZ6ZexNF50fJ4ORBNS2ZEAjWPaeFzyPUZpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XhJh5hGYMzBx0qp1vV4LaB8BjWjwnZSC+bBn/zZ+X4A=;
 b=WMapbYRMpS+d5uIjMmJn/LbYLW58JSEbu2g3CuuVPaV6sE5dYdSLx4viSa0TqHz4Gb5tj2+dwZAxkDtTPwblee1NOAJd7UENcvpaPsCadtqnhD8+v8edgvHLr0vaOP2ETapUBjlrcR+eq1lDMmhvsijVHrtDCqSPHGV7t4CMqEu34+lbkWrLHvOX0adn4F0xNoPwPJbzZ/XIfZJ/kG8bYV2LwSHiNPVJTkCS1iwyubkDS+l8kHcZXK4Q7pNbUcT8MtUyHiXX14G7uCVX5S9LOAw4B3elD3W2vdIY1ZJZwEX2Sol3wnbFgFr3C1W+SK9mzoCKiTFVt170Pn5M5vtHzQ==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>
Subject: [PATCH] misra: add deviations of MISRA C Rule 5.5
Thread-Topic: [PATCH] misra: add deviations of MISRA C Rule 5.5
Thread-Index: AQHb9nyfKWuy2uMkq0ebdJsomrMUpg==
Date: Wed, 16 Jul 2025 18:08:25 +0000
Message-ID:
 <7e1c381d6fab6d38bb2a5484d5fac5e863ba135f.1752689112.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DB9PR03MB8284:EE_
x-ms-office365-filtering-correlation-id: df5ef5e1-b0cd-4263-50cc-08ddc493c2a9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|42112799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?KvkOFpuE3go6cvRIV0RN7C+dABalydXVO3VTkjMTEADiqZHTDSPRz7yiLJ?=
 =?iso-8859-1?Q?0aA0tuWURRjuLrsc+6yxXuRSRpeo74X6fo/loJyU38oFGG19CwPwHuHBsV?=
 =?iso-8859-1?Q?9D9lOXJqbzA0ZbpvxdmiipNBGDy2pIL8WSSF8NBfiy1Bl762GLnS/Znk3E?=
 =?iso-8859-1?Q?R6RaYM4m1hAp5qRlhS+G/x+zVxfrme+US/dFwTkXu0TM/FjCeYqKjmkCIb?=
 =?iso-8859-1?Q?ermiRstkyZe93eTN5iyeleNeny20trpKPLq1SGWO0mSf4NhW2S0We3LxEO?=
 =?iso-8859-1?Q?z4ns4ccP69aU1bbeBt5H8Gdty6VQuquF/nFztx0yZkhH1CcP5LaFzjXgrj?=
 =?iso-8859-1?Q?hBFCyVas3Uc2WPQ3CGvolkG8A8J5kyeo2oZBVpdFUzA+o305Z1+sFQ2DAk?=
 =?iso-8859-1?Q?VQsXIwbThGapkhZOx1SzXVcDh3lLmvIBo4DLYH92C+UkDO83pDO3K0r5EP?=
 =?iso-8859-1?Q?gYvD0VrmkYa5nnZK670jqYsAxXn+fDRPWmWVS9CAuoVRT0LV18Rbk3q/Fj?=
 =?iso-8859-1?Q?63o/4FASEgD6fAc3QooQdpFkVAV4LxIAVJ5InGEv3PQs49jUGd+ph7HWRm?=
 =?iso-8859-1?Q?bz7jjmHlRH5AvdqXla/+hGGrPlVkcsnR8EUSm92GViBrp/YIuS95SbUUg6?=
 =?iso-8859-1?Q?I9dztIbhDZgX1/OXCHtk6tdz7HKKPgmJtHRqIkyQEh2jKvncbM1zOeZIl8?=
 =?iso-8859-1?Q?QPHSLAPQfT2urtT++qUGT9oeCIf0vqWp0QqsmktQMF63XHWwwlveWJPMFd?=
 =?iso-8859-1?Q?Zoql9TEVlMmMME7YgHPD2TUNhUQt+EBLNcdY3hXvZL1YQNxORSdcOKLLPw?=
 =?iso-8859-1?Q?b9MSVz1EQtOL2UYDc4ksDBUEiz9etENHXSoHL8u6sfSxlqRZUPC9fyNnON?=
 =?iso-8859-1?Q?ajfyClZNmnYNJMfhbKpAJ7xjse51x1AkTWZUsOEj5ZCdFokY0UQkVJQg83?=
 =?iso-8859-1?Q?3xi3mTdH9p8QDeCSa3jRmn13OX/8+z50qkuzYTj9K82WUVgC0xTELxDnGj?=
 =?iso-8859-1?Q?xgCJeY+SAG+2ic9K/AN+bN6i0U/UvS737dg7SS4IO0jkXTimhYZcE7i82W?=
 =?iso-8859-1?Q?bNfbxWCpWVS7iNMJA1Eh9Pxboqss48qPVYApPyJ3vrskZFNjLerUBlxdGS?=
 =?iso-8859-1?Q?t16FOac2wSLJ5XB8u8Q//r8QRLzfK/Yb5VXwnnwVPkXnJxunLKCnD4aAga?=
 =?iso-8859-1?Q?AGGf5oRyv4KKcoX0phdvwYogqWeMX9+MO7w7FcCMkw+cLV9oq1irojXfMz?=
 =?iso-8859-1?Q?6u8RviPtvaxx1kiM7UqJV6wUAkNtarMbehxZj6m9vE7C5JyCPkuPadrNTr?=
 =?iso-8859-1?Q?//hF3IEz07Szpgl7wMzZ3xkLi/yEKBnU7+xJhQ22IhmBarNBw5B3ojjcau?=
 =?iso-8859-1?Q?3mSroz3GBSkuJhiZJmNkUgFYxP9xjZTQJHAnDpo7DpuU7NDuoGUWMFlzt0?=
 =?iso-8859-1?Q?gzC+YlU0kxwya4AQpgb1TYs+vW1j/jQJhvXCuJBuphSUjBK1LecnxKsAzU?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(42112799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?TIaq+awXZI+z4O8qbz4XGGdkX0yf46O2YcHdyYI4Vo9X1ELqdkmvnfP0VD?=
 =?iso-8859-1?Q?O4iG79fSMLcQKgzh9AZMOctS7+JYNnYMR4O7jesMZIhNHwa2LOkj7GP+BX?=
 =?iso-8859-1?Q?ue11MMWdajEzvuMQP2sNY1oyNAMs/a4K5kri4d+IIwiaooCTIsFVhRYBqZ?=
 =?iso-8859-1?Q?KLWJX7CDMYyHM36OLLihUMo3tAqIve6BVJ3BmR07lKqu2m30TN9K0zpPu5?=
 =?iso-8859-1?Q?pr08ejHO2hLGsGhRohZXYTyd7MZPGfHsHvaEC4vgYLSQ49pYOHn7nSMH9y?=
 =?iso-8859-1?Q?I7eNQzO89NsU8ocGj5pd8cEmH1Z+qd480GBE4D9x1ebNaDj1/Nmeojedlk?=
 =?iso-8859-1?Q?EmPRzHdwj/MxFLYkdCXZY6cx2VLV4BgeSqvq/jtXaJndzsq8p9Px/bUn6n?=
 =?iso-8859-1?Q?TSJ/OkqvxQnmlsbh+Q+tUhmXmmPF+s32GW1FtIYkrO2nOPr3853qt9lEuq?=
 =?iso-8859-1?Q?fHulzXkPao8Ul9idLLEL7XcY+xx2AKtOs9aeOhTFW/b503xco9Z8EBNB3h?=
 =?iso-8859-1?Q?Gh3LqcJ8YJwwN61+r9Pe7yWh6UE4jl6DRHWURUBPbt68mpFq9UPf9jeaEH?=
 =?iso-8859-1?Q?DjvBxfO/7U5Fj4j6M6JQo9LKgxBhaTfgXcPopPLkQAS4pbK0rM/AvfmMUd?=
 =?iso-8859-1?Q?aNO99+viUUAM1DNRwzBIb+U1MDNXB97eHMe7WtX8qL6yi4tShwVz0UdBfY?=
 =?iso-8859-1?Q?+p23zTexSVEO4eYTke0lWMcsJ4NXNvTla2i7nYdYCQ6QRqJnEogae9li48?=
 =?iso-8859-1?Q?8CIAV7dzOuqbvo3ZfknWJZcDsTQS/5BMEnk8Is89Zj0OSbiD+4oLDAwzWP?=
 =?iso-8859-1?Q?9AJWUL0cWURNhXbcuVg809AsM9IkTypiTbUSDVg0qWrBs1UvP8XYjs6Xmd?=
 =?iso-8859-1?Q?jTTjD99hBiz2lp49veirNcQnZ6P8iIovVAVkd+jdZLtrAW6MSaZioyZSEI?=
 =?iso-8859-1?Q?1hg0JIXvyYgyqU66kaLE+NWK3N9OUCPUjucHLMYasDriwxd7vlKy2TIbj0?=
 =?iso-8859-1?Q?0VLkQbnCg5sYE+xOAPsW1Jk9xXQaWSXAiygfoUJatL+ZEYpJ1yftkTWDt7?=
 =?iso-8859-1?Q?fTn7RBZYBLJUGXz3Nx4eJXIq1RXbUJUgc2WbM3uHKr6klfTna3z+niiCLh?=
 =?iso-8859-1?Q?kByzP1Td9E3IhXkm5KFEDMppHnSV2dRmyC5sYZBTYTjUvDn3enjAuW0te5?=
 =?iso-8859-1?Q?hIGmVhMG8py+/6JRNMCvm8Nooyha1cryvYnV9KdQA8dkIoHFKJYWv4AlBo?=
 =?iso-8859-1?Q?tfyRyElzK+ssVi4xlboaVfOHjDYPmW0OFTK11E9gPioJEvVntXgOGuqK9V?=
 =?iso-8859-1?Q?lUD+/m4PiNhbAHRrlmZ4U8HA0f1B+tU91uXU0P34wwRa8zxL19iDSGCp5b?=
 =?iso-8859-1?Q?9hwlD70iJgim6kVNilKGxjBOp8QPtn9Gisdzx2npLUXXk5zTIzSNx/p6hn?=
 =?iso-8859-1?Q?0cimwfk1epRWNo5XYhY/QCA1MbZC621tGlrIQLdplWPOVV+k+w+09xOu2+?=
 =?iso-8859-1?Q?u50dx2RgC6eujSeGSvKQJoPpF8Yxnsb8YbyeYI1ZoO987q6qDGiscD29PZ?=
 =?iso-8859-1?Q?RiQYhwkrs6I54mq5FAgjFQX8QBsW/nbIQxOLFgCWK0KxjYgsLX6fRigtfP?=
 =?iso-8859-1?Q?1GZ0YGS4qOzS2xDcSPzq2N4ugbxZ3pMsmuM0UB7UkvUDMc5LHBQ/bVZQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5ef5e1-b0cd-4263-50cc-08ddc493c2a9
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jul 2025 18:08:25.7231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LrxPBWypRrYG0IGlxEHTyGz6hKs887UjTj9dLLfCHh9tpKKZmVMicczOyk2FctBCQzn80Seb4gyb/mCtKAFAUskTLRdlOBHbPxjbd1UVlFE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8284

MISRA C Rule 5.5 states that: "Identifiers shall
be distinct from macro names".

Update ECLAIR configuration to deviate:
- clashes in 'xen/include/xen/bitops.h';
- clashes in 'xen/include/xen/irq.h';
- clashes in 'xen/common/grant_table.c'.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
This patch makes MISRA Rule 5.5 "clean" for ARM only.

Was agreed to narrow deviation:
https://patchew.org/Xen/cover.1752096263.git.dmytro._5Fprokopchuk1@epam.com=
/e47d08e4465f913f03348830954e800f420c652d.1752096263.git.dmytro._5Fprokopch=
uk1@epam.com/

CI:
https://eclair-analysis-logs.xenproject.org/fs/var/local/eclair/xen-project=
.ecdf/xen-project/people/dimaprkp4k/xen/ECLAIR_normal/rule_5.5_deviation_fi=
nal/ARM64/10706457595/PROJECT.ecd;/by_service.html#service&kind
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 7 +++++++
 docs/misra/deviations.rst                        | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/=
eclair_analysis/ECLAIR/deviations.ecl
index 8504e850c1..3895148460 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -117,6 +117,13 @@ it defines would (in the common case) be already defin=
ed. Peer reviewed by the c
 -config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(decl(kind(function)=
)||any_loc(macro(name(memcpy||memset||memmove))))&&any_area(any_loc(file(^x=
en/common/libelf/libelf-private\\.h$)))"}
 -doc_end
=20
+-doc_begin=3D"Clashes between function names and macros are deliberate and=
 needed to have a function-like macro that acts as a wrapper for the functi=
on to be called.
+Before calling the function, the macro adds additional checks or adjusts t=
he number of parameters depending on the configuration."
+-config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(all_loc(file(^xen/i=
nclude/xen/bitops\\.h$)) && macro(name(__test_and_set_bit||__test_and_clear=
_bit||__test_and_change_bit||test_bit)))"}
+-config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(all_loc(file(^xen/c=
ommon/grant_table\\.c$))&&macro(name(update_gnttab_par||parse_gnttab_limit)=
))"}
+-config=3DMC3A2.R5.5,reports+=3D{deliberate, "any_area(all_loc(file(^xen/i=
nclude/xen/irq\\.h$))&&macro(name(pirq_cleanup_check)))"}
+-doc_end
+
 -doc_begin=3D"The type \"ret_t\" is deliberately defined multiple times,
 depending on the guest."
 -config=3DMC3A2.R5.6,reports+=3D{deliberate,"any_area(any_loc(text(^.*ret_=
t.*$)))"}
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index 620e97f0bd..84bc933cbf 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -142,6 +142,13 @@ Deviations related to MISRA C:2012 Rules:
        memmove.
      - Tagged as `deliberate` for ECLAIR.
=20
+   * - R5.5
+     - Clashes between function names and macros are deliberate and needed
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

