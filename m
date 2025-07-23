Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7162B0F400
	for <lists+xen-devel@lfdr.de>; Wed, 23 Jul 2025 15:30:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1053987.1422768 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZXp-0001gW-Dj; Wed, 23 Jul 2025 13:30:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1053987.1422768; Wed, 23 Jul 2025 13:30:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueZXp-0001eB-AL; Wed, 23 Jul 2025 13:30:05 +0000
Received: by outflank-mailman (input) for mailman id 1053987;
 Wed, 23 Jul 2025 13:30:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VoQP=2E=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ueZXo-0001MV-0d
 for xen-devel@lists.xenproject.org; Wed, 23 Jul 2025 13:30:04 +0000
Received: from AS8PR03CU001.outbound.protection.outlook.com
 (mail-westeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c201::5])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23492774-67c9-11f0-a31d-13f23c93f187;
 Wed, 23 Jul 2025 15:30:02 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by DB9PR03MB11027.eurprd03.prod.outlook.com (2603:10a6:10:5e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 13:30:00 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 13:30:00 +0000
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
X-Inumbo-ID: 23492774-67c9-11f0-a31d-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lr2pDFnAks/FXEEOjljHVOg5Lzw3VmfgnxsVesegzWFdVRK06YCXts8xOD3NeWWVFHDIHXyobEVO0tOFSwEc1+7aVBpWmAtjR2U/ic4uufCs2lFoG6EQqhTCHzpiN4AVPEDRdJF8t9iXn12qfeqySJXzn4BrYHC1mUFv6S3hSSKYTkjv9OfPQ+Y0mSD5ackBcdvCGYf/rtgMezcyPgYjWfHmn27Ok8Azi7Xo2NferdmWn32m/kVLQ8oYPcD8U2clZw8+uO2fwwnAoot1AYMGRYUth311dsGjvgHNm5e+pnI2eUyoGeTnexXUqORWcXoJW9oZPoGNj6NwJtkoLGXREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIkB1BkighrWuXy8HsL+SpL/yIuGUxD+cpCBXNansME=;
 b=mxjs+9KrghablGHX4SKyCIsFL/D9g7o9TmtH8pInuu2GXuAmMkeOjX2qHMDisnUZbcPk1axuUqM1HMD3/r4h9HgwEG+B1t1iGXuQTZPGeyevgaPrlddYd/DHnNE82ejsWCD0qkswUtNhxgrIH9myHcjdDRC/y+6ywC/KL98/UOsWQcVDdabToO2D6hSE7RuEYt4tYnhAnR2LYcv9Pxmr03uf7FdKE08Ey+JJ/IWnRcRNr3LmF/AMv8A7iNzmzQGYhA4jFXVnqCYx4ykaoQhRx93HB/Y3bX1HjtNOreBhymHUNK+LE0aFboLn/oS5Po90QTszDb/nkUlPBjyRCkVsxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIkB1BkighrWuXy8HsL+SpL/yIuGUxD+cpCBXNansME=;
 b=Yx3nj/6GQOTdZ3McBiVNAW887ueH+0+ggGylkvkNUIWZemvXO6zfLgxTU8S3M9OJtDQTrDA4kHqWHnloHkN7hubqcCba+0r1BXwT0RQeFWElbpRslH7+l/MzljMNUkpv6yHoGpXTqUtxVnYcWnX38T0pYdB+nHqkN68/7uypWxcbIVcccO2AZG1c0i/j1Hn8pPtzu37hG2XxQI3+Ww5YSqjsWouW1lNpudEADn60KCfrw4vo9wEKxXfCgVjK2fLHUZYU+HkAx94mmvANckISxO74S7T/L7sc5zyTYqqHipNCi+l7TThUzXeknLeW19wjNVckAn7ShsqSjn606LMwxg==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Nicola Vetrini
	<nicola.vetrini@bugseng.com>, Doug Goldstein <cardoe@cardoe.com>, Stefano
 Stabellini <sstabellini@kernel.org>
Subject: [PATCH] automation/eclair: monitor rules 11.6, 17.2, 18.3, 21.11,
 21.14-16
Thread-Topic: [PATCH] automation/eclair: monitor rules 11.6, 17.2, 18.3,
 21.11, 21.14-16
Thread-Index: AQHb+9XjRd4/gYe4O02P0LwT9W+DHw==
Date: Wed, 23 Jul 2025 13:30:00 +0000
Message-ID:
 <2134a233586a6aeb5de740baf082ba87ecb212df.1753271488.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|DB9PR03MB11027:EE_
x-ms-office365-filtering-correlation-id: 97ee3c29-0dfb-4ff0-2ae9-08ddc9ed062a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|42112799006|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?F2UqPAIPKERtiTRQzSjyNCx95YItSD0XaLVSo7KEvwmOsxz5jIIQV98NTq?=
 =?iso-8859-1?Q?MtvYi/4+BJJ1ODLPrwS1DewfF0M18vf6MG6CxE4lwzWhROidmGznX3roJ+?=
 =?iso-8859-1?Q?30Fvg6DMrqVAfT3k7nU8MAg4TqZq6iSRE+wFQZhBQlOzPNZcwuWzBOzfK3?=
 =?iso-8859-1?Q?3LW7kUaExxgixAZwes2M/lHODZH0GUfcH2vsb5NhzZtCU0rE/RHViZ0xnh?=
 =?iso-8859-1?Q?YoXpB6l/PwiXYVQx6cRGsRXkEwAHTTz/NwYEN/EvvhEROi9+UxwZD5Uear?=
 =?iso-8859-1?Q?JqFnFXwxd2or3lYtraIXSLG9hnJoX9YwoXntUzPtNNkjnjNixB+x/T60mx?=
 =?iso-8859-1?Q?cxsnDjJcQaxTROuxi0w1Sbf2owViIw368YYoYGKf+Zqy6FTKp44HYZ8qIf?=
 =?iso-8859-1?Q?uNQHGgtBICx7TbURftvhqnh2HgoJui8z1lTBTZIu1+qXgvh5COk0XenzEZ?=
 =?iso-8859-1?Q?/wan2oBhozZUT84GRlMXWEy8zDB8wBRpqRmUGcT6kbVkEBCbBhGHMqWhNr?=
 =?iso-8859-1?Q?jlUY71JRmQLTVWAoh0MpKBHANG8v29d7aPvxKX4cmWsOAxELk01YTWlkQH?=
 =?iso-8859-1?Q?CCdh+byiQAZpAShwNIV2Q1No+p4vOqAhJHtb0LN6Lm+Zx5o00bAnuXPptm?=
 =?iso-8859-1?Q?zh8wK/hxJEIOVfyzXNeocMdtwQom/Q1OmTFLl49NqO6FVeE2EB36z22p+Q?=
 =?iso-8859-1?Q?qOMhFsJgWuAj/NK/HqRK1H4l/QhrDhZ+nZ+e5gIbYEfY6E3Dv6deBtGqSE?=
 =?iso-8859-1?Q?12ELVB2uSZrZ0ZDH2JIPlE7JN2f92jxNzSxLp4LLAPrMVhRhR6xPuheYLt?=
 =?iso-8859-1?Q?cIrTPzh/2LUsMngySGZc1LlX8+KSnmzqK9so2T+06o8ppNMZh/GwsMJ1t4?=
 =?iso-8859-1?Q?Rd34sgkUl2iNUF78gQ3kcFJrUWbH+NH4ft3sUJhLKKJmwHLd/HUik2vgWR?=
 =?iso-8859-1?Q?00mhMty8tS+flkz1Blz3Brycun2apN5O3fzx9f3GU2+d36PE8tkwJaqZT2?=
 =?iso-8859-1?Q?Tvg5D0Cymr7FO07GgmJVb9bVH2hXyKqRpd+Gx6sHuJKBt2YZk1UPJQqENe?=
 =?iso-8859-1?Q?wGJ6+Gyvfltg+/qie5gObvoS5t6zPPpE7TdlV7R7LXpkRCMhRYO8RVcqJx?=
 =?iso-8859-1?Q?kRTZaoupINIMhyVdACvFvhxnqNk2UYN2pgXRvQTVVKaD0MmCSmDFGlvwd0?=
 =?iso-8859-1?Q?ytrf99ahp2kxwf0RZbtc8CrFpKkgMc8FCDl0j97p0otGDvuzah8Jz1qPDm?=
 =?iso-8859-1?Q?95RzLBxRrL2A/5Edt4cm8Mm7+OvbedpfFDPvkFQF+XeLK4VA+ewGAxpKTS?=
 =?iso-8859-1?Q?zVjRnyg3Eqrq/Eil0awPBCeYY0u23PWVWv8lWbq+vx345bWkuK681eSITk?=
 =?iso-8859-1?Q?Cx5h6bbzzFKsXAspjlGdA7S+PUJpp2wihKi6zbEiKpj7A6oPXqxelSDi3M?=
 =?iso-8859-1?Q?WDRSKVCdALl0SbhMrBiW8WmtxOy85XDIySzWRUiO2oBkFlMhJ6CoHgPwg8?=
 =?iso-8859-1?Q?Ls2FOdibedlN0NE8mFzsnW5Wehb2ulDiTX/85pX8sGk4E5Q6XVVXzSVvFQ?=
 =?iso-8859-1?Q?jZlK/vA=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(42112799006)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?GR++bs4jrOINF6ahvUal0QDNdJXmsXKPzkuJ4ZN31QskUptxldGGumLReY?=
 =?iso-8859-1?Q?uedEcJsSPt+iMRigc0pO9DZyaZmvm13s18E9BrEbfnDSh94bJVQxnNB2PU?=
 =?iso-8859-1?Q?oFvCjxKI34w8Act6ltWo1FkUEvAxyV4KRCsLahRdd+2mbIROksX+cXZkVT?=
 =?iso-8859-1?Q?Y835WzbGr1Mb/sqiYj7or3kNati/Wf4dfX10bcu5cV0RR86y3glA9s+MXZ?=
 =?iso-8859-1?Q?8xPeeZMdAX6D/axQjPI4ux9bHFwDH0E89VQltuCpfcRtyoNg5oRSRH6box?=
 =?iso-8859-1?Q?jKhf0R3goCI5HLobgTA+t5bkW08FdEAQHVVDkN9IL3RNvtZDFkA+L1LytK?=
 =?iso-8859-1?Q?UDyn5s4xIp7jCm56ijhLyVkCpYxxPgCqggpy3XeXmkVgyumJ8jZXgX1Vlr?=
 =?iso-8859-1?Q?Y6DNur5JtnATPH6DQlv8mIeVBxOIKpvxOAxhLqnq1LtM6o995pfMqAR5b8?=
 =?iso-8859-1?Q?6rin4MSCeOnyMp6U1wTUTMjT/am0FrXw9F8oBllMCafQQkzvlzZCtzJ4mw?=
 =?iso-8859-1?Q?s8sRa2GRTYIYJSEoUiZIQLGukSAOCLPbWNcdmiJI/6Mbtw1ZhlM4/vtZJY?=
 =?iso-8859-1?Q?7LxsZFBAbdT9EubOl4yxLk7smY3l1NKBw8K6nvT9kUyNjXlNxMYVXwtlXi?=
 =?iso-8859-1?Q?OfF4QDilfl4LvVJTb1fQjPIe6sAEW62ijrDPFNexS4vaPfK5jY63olnhU/?=
 =?iso-8859-1?Q?T/glUD2q9boJu7AGvY3oo0KunpNzFtC3Mk/p1xKHbaTC74zIERW0I9lkEu?=
 =?iso-8859-1?Q?y9vLTQ9eQ26pVNH4Crw8w176Ch2zpEuWeHXIksn3IgGXN2pLO/x7oPpXUh?=
 =?iso-8859-1?Q?4vsxA5N0BeoXtOlbR5tuJHqGYji8JQ1NlCEwwWlw6VYVPZgvSibHdpeAKa?=
 =?iso-8859-1?Q?JYC0lrR/qjsnwVWrJM7BrWLlJjyWuBHO5p2X9gV2eHWk+L0sjszYajAD2V?=
 =?iso-8859-1?Q?oBVR0bstFN9uRUQYHQInZIoep1J9YDJShofDOQvgRGhNoZBQjoLnaODm7V?=
 =?iso-8859-1?Q?O+2nIJ6Zf8dmc2qo48bm8Nv+ogIuMB8NBGvoZ+hGDhug3EdAxrwuZWp8kT?=
 =?iso-8859-1?Q?/4EiPapHhjz99Z3INN+lsa+0O/osRhekgp0endN+aHheBR5dLp5Fmmir+Z?=
 =?iso-8859-1?Q?sGzYIYZThSD6/R8JDM5c1BOTyDlzG3WreOh892mzNYyee/YRSDTdzpHuhI?=
 =?iso-8859-1?Q?utNEcte6kQy+sMaGxV3uiVRhurEolJEqrsood2pI7cBqmY3f2mKDmVhGZz?=
 =?iso-8859-1?Q?FgeDi8Yjjp4o+IsQq6YwDTzYNyi57hNhERr3QEqBtAwCAWd/gbnA2chsbo?=
 =?iso-8859-1?Q?G0ETOem0KcFVfrc9uCkIWWbQxprZcWpepN/7I5/1Y6NIFqt/L8b9NxzGz+?=
 =?iso-8859-1?Q?aNzeSCk1+pEll8a+o6LhjUzsJVcUcdMmBmnh3w1D/MyEMJAEBhhlrcm8js?=
 =?iso-8859-1?Q?iFCawIrvv32S7hOQgpANswu0JONfpk13Eto/KnDggtWchyA42cJYROKcwu?=
 =?iso-8859-1?Q?L9q43ePWFqOroii9LUjtKkGDST4n/KyRvLty0Vi/mVELhDG/UE0wUvEX6y?=
 =?iso-8859-1?Q?6eDBgvH9sCI5xhJVNeBMJqQ0/9f+sSG2ORHAwuCA/yCyY3Nrdx4YlG3z9K?=
 =?iso-8859-1?Q?SDmqq0IDAZppiEzIujAvDMB02zHpqJeiFPdtC5TCEsXc/6T+76CZXT0A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97ee3c29-0dfb-4ff0-2ae9-08ddc9ed062a
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jul 2025 13:30:00.3697
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /ODTolX4+L4433rH5tulDoyD00WodmfgYsKDnSRKunfnQRMIcutjLD0M2wKuzXtb2mBzyKb9m0zySMrfFM/WM6hfBF0DFAu8tWRY9WY8MVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB11027

Add MISRA C rules to the monitored set.
All these rules are 'accepted' for XEN, have zero or few violations,
and should be enabled for the ECLAIR scan.

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Test CI: https://gitlab.com/xen-project/people/dimaprkp4k/xen/-/pipelines/1=
943607023
---
 automation/eclair_analysis/ECLAIR/monitored.ecl | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/automation/eclair_analysis/ECLAIR/monitored.ecl b/automation/e=
clair_analysis/ECLAIR/monitored.ecl
index 00bff9edbe..72698b2eb1 100644
--- a/automation/eclair_analysis/ECLAIR/monitored.ecl
+++ b/automation/eclair_analysis/ECLAIR/monitored.ecl
@@ -45,6 +45,7 @@
 -enable=3DMC3A2.R10.2
 -enable=3DMC3A2.R11.1
 -enable=3DMC3A2.R11.2
+-enable=3DMC3A2.R11.6
 -enable=3DMC3A2.R11.7
 -enable=3DMC3A2.R11.8
 -enable=3DMC3A2.R11.9
@@ -62,12 +63,14 @@
 -enable=3DMC3A2.R16.6
 -enable=3DMC3A2.R16.7
 -enable=3DMC3A2.R17.1
+-enable=3DMC3A2.R17.2
 -enable=3DMC3A2.R17.3
 -enable=3DMC3A2.R17.4
 -enable=3DMC3A2.R17.5
 -enable=3DMC3A2.R17.6
 -enable=3DMC3A2.R18.1
 -enable=3DMC3A2.R18.2
+-enable=3DMC3A2.R18.3
 -enable=3DMC3A2.R18.6
 -enable=3DMC3A2.R18.8
 -enable=3DMC3A2.R19.1
@@ -83,14 +86,18 @@
 -enable=3DMC3A2.R20.14
 -enable=3DMC3A2.R21.3
 -enable=3DMC3A2.R21.4
--enable=3DMC3A2.R21.6
 -enable=3DMC3A2.R21.5
+-enable=3DMC3A2.R21.6
 -enable=3DMC3A2.R21.7
 -enable=3DMC3A2.R21.8
 -enable=3DMC3A2.R21.9
 -enable=3DMC3A2.R21.10
+-enable=3DMC3A2.R21.11
 -enable=3DMC3A2.R21.12
 -enable=3DMC3A2.R21.13
+-enable=3DMC3A2.R21.14
+-enable=3DMC3A2.R21.15
+-enable=3DMC3A2.R21.16
 -enable=3DMC3A2.R21.17
 -enable=3DMC3A2.R21.18
 -enable=3DMC3A2.R21.19
--=20
2.43.0

