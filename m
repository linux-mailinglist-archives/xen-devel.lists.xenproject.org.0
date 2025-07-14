Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375A7B03FD2
	for <lists+xen-devel@lfdr.de>; Mon, 14 Jul 2025 15:27:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1042822.1412884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJCx-0005mj-W5; Mon, 14 Jul 2025 13:27:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1042822.1412884; Mon, 14 Jul 2025 13:27:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ubJCx-0005k3-SX; Mon, 14 Jul 2025 13:27:03 +0000
Received: by outflank-mailman (input) for mailman id 1042822;
 Mon, 14 Jul 2025 13:27:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UiLu=Z3=epam.com=dmytro_prokopchuk1@srs-se1.protection.inumbo.net>)
 id 1ubJCw-0005jw-6t
 for xen-devel@lists.xenproject.org; Mon, 14 Jul 2025 13:27:02 +0000
Received: from DUZPR83CU001.outbound.protection.outlook.com
 (mail-northeuropeazlp170120005.outbound.protection.outlook.com
 [2a01:111:f403:c200::5])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 389d13e9-60b6-11f0-b894-0df219b8e170;
 Mon, 14 Jul 2025 15:27:00 +0200 (CEST)
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com (2603:10a6:150:da::5)
 by AM9PR03MB6754.eurprd03.prod.outlook.com (2603:10a6:20b:2d6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 13:26:56 +0000
Received: from GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e]) by GV2PR03MB9572.eurprd03.prod.outlook.com
 ([fe80::edd1:842f:9b14:509e%3]) with mapi id 15.20.8901.028; Mon, 14 Jul 2025
 13:26:55 +0000
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
X-Inumbo-ID: 389d13e9-60b6-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMfbCoofKu7A6bPG4uar0Ek32KsD5wxGCXSEMuUX2Mzrx684G0i8AgCILSp1mFPKWKMhwJLtVlFejMJBzTTIWFnvaGGlypqwkj45h6ixZZh162sn/zqfQjwGiKfk5SP7fIXlV5+w+hBeDakhH+2TaZMCEEwzIWEJPTVVzx08s2RGsEZmeBMyEM92AxKOKQrOjq0Y0TmrnZo2hfIYf3MfVdwLuk+hrknd5LmsX9QAodi8jTJXUBUTJ05tIrbJ12hFZefugQ5amcNJDl3icYmfdsUdJ/Xz3cwp3KRci7yQCMN/sZltz3OVkn3uVxs+CH433HJCYzzFNHlPgJleHMF70A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1HYII8dLIgknBpnIAFDugGfe9Sr4+gayrgBb2Ut8MfU=;
 b=PVVm7sqsB7XpZIvEYNvYfJcxst7WyKwPApk0KIYMX0MfUN9GScUN3o3egNiFoauM4OdwsLGp8/HjbasE0epKMgLTqADUPR9HpmabYjaUvNpq+QKISoR+gT3ZKd4PSwU3DYfIpr1elvod5V9Zbugy3L7Y2UAEypyMcdC6jso9285PdS/fatwirXpRTbHOhJzjHeaawoxVKAEEJ/YXalFowG/6NFmDgfGkxCSSExjvuVZAI5PT76QLsO/NP8IDIzuNAeHGh2WgDtHpde3aU0mxZb8ja+dPVHHQu2bArVSeMYgJSSaLgApt2mIdZMc67cqDceMi7lcV3UAIPcpYFebVHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=epam.com; dmarc=pass action=none header.from=epam.com;
 dkim=pass header.d=epam.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=epam.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1HYII8dLIgknBpnIAFDugGfe9Sr4+gayrgBb2Ut8MfU=;
 b=f/FuZwYaFdXpwg9FSeCSUn+8UJo5kGN+WK5NUVHR6HDikKTl+puM0HFFh3ZKJzt78yTpwocwc629elRo1cB4q9YWx226b22cj6hO+LYSc49IztONa48WjpnCUXZHr6OsyVwjCvS9tmXLCxTgxcE4/tlnWyCqh9kVsHAgkfGLdFdmNWiunEcTiM4TWpbPawTO+T3Wu0m8RH25SxzIomKkA0USOhtcfaqHnA7ZclwweZJ4IVa6HwlMWXY5G/jqVpzuDlNgaCGy+V0jJO2O2qHACKgMgngnhgU30RoNTyDlU02v+V7jOIZ5/JA931Hsf+8Ix5sedVgqDEeIOHBwBf/q8Q==
From: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: Dmytro Prokopchuk1 <dmytro_prokopchuk1@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, Julien
 Grall <julien@xen.org>, =?iso-8859-1?Q?Roger_Pau_Monn=E9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, Bertrand
 Marquis <bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v3] misra: address violation of MISRA C Rule 10.1
Thread-Topic: [XEN PATCH v3] misra: address violation of MISRA C Rule 10.1
Thread-Index: AQHb9ML3JOK9JlDJdUaOuavuvAHq4g==
Date: Mon, 14 Jul 2025 13:26:55 +0000
Message-ID:
 <6682eaad85976a14dd84339574043ef0336cc09c.1752498860.git.dmytro_prokopchuk1@epam.com>
Accept-Language: en-US, uk-UA, ru-RU
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=epam.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV2PR03MB9572:EE_|AM9PR03MB6754:EE_
x-ms-office365-filtering-correlation-id: 2d161a42-43a1-45cd-3f23-08ddc2da1a63
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|42112799006|7416014|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?JjepQ9tGsflhARBzQj/jyPizqkIDOR3P37+kHzBrQaRrv2O9U2ERy0cbJk?=
 =?iso-8859-1?Q?LvTGz3qy5/CgltoPC6cCN7YVgIimeoiK+3Ghq0TqoFSpfL+xyOT15I8/G8?=
 =?iso-8859-1?Q?u76FEjOfmBoVi44Nsg0W16DpZJyXnhsNKtJGFP/bjmPu93b6/RHKL7IKk6?=
 =?iso-8859-1?Q?AGN+8suxksGgeGOJi0tUfCNjDjuz1hjT0ULu/f0/YFvgan65PqmfutVI/w?=
 =?iso-8859-1?Q?KkN1Gnmiv2QT5eVuW24ssGXMK9X88e3osDqALQrWjzr3oXLTkFxp/RfF4y?=
 =?iso-8859-1?Q?tCU1i7F2XcmXuR3JzY+8sje/AyWqsZv1MFd3A/yfNEb5xRtay29kln5+hF?=
 =?iso-8859-1?Q?sZ3vDu9+23p8Kkxfw5OCfmf6Vsm6slOc8jekLb7jkhpXAakXJNULUyC+j8?=
 =?iso-8859-1?Q?4MrYxxJO475xd/EpmE/GmRzH+4Pwg1oXj8BFt7+TApRF27w6QdXOavmNrs?=
 =?iso-8859-1?Q?YrvAqDCbDG/FXo21ylktTFtUQIWU7abGAJOThfeSRiTnEIdhp0Pqy9C5wL?=
 =?iso-8859-1?Q?8k0iy+ir8A+jCTgncSWlAXJBVdP1FbSaUgE3W2NbU/rhxx5Lcsew9EF5k2?=
 =?iso-8859-1?Q?Hkwklvd0QIEpChCDJebGwPLJ2nZZd/8yZz/fBK3RTzr1NzCwQDWyAtFPXp?=
 =?iso-8859-1?Q?mvpFO6pMj3A47CK9qmLpwVaervGzylq1RPgkl/KuMDs9LqJlwsRZolVzaf?=
 =?iso-8859-1?Q?IXpO03U9GlxKp/tiFGKtPlwR2xoxguidaH0Nu8iRwo/qRzMw99a15RJgNT?=
 =?iso-8859-1?Q?alRQxfsYxX8sT0ne0JU0RtHwzFbIHjAanZ3UyR2wJL9a7y6Hb+FrQJD5n/?=
 =?iso-8859-1?Q?MLpn3pJzabkUtriHkK4z3NQ5FReTYxyAs1+duTcMKJO4yRWpYjoYAoGYBn?=
 =?iso-8859-1?Q?tleEVWdmngcIT7a1pWhuASevC99Frnv1Eg9VQXyOZF2EfrBhIbF827FVie?=
 =?iso-8859-1?Q?mkpw2hPWfZxn9m6WgTVrG0KgiipeGAYuFaRewUAPn74hw6nxNVJUKq3yHk?=
 =?iso-8859-1?Q?eiGqTDYgEMG8tWj6dpTs9Ez2C7c0rwUXhQLWNppvb/fnPgPcAQiBLGqCLr?=
 =?iso-8859-1?Q?lH6JMGYc5zqdn1d6HTf8WtT5hopIn0IUxuk/Jbn9yCQiRCVRAvvxd56Zr2?=
 =?iso-8859-1?Q?+yTGnXJwSZYWoLQfWcUI0ZFWhq4WhmhLQZG9cUvf4+Gctzyc3W6qm4hyAO?=
 =?iso-8859-1?Q?k26mPHSFfwPU/aXk6pY0dVyMVmsdrc4jjpd2LJqLm2yQHcyRFRUSDFH+sE?=
 =?iso-8859-1?Q?PtmTIWpMDEAdmZwnt7gtmaxSVQfYLU7GFq0PvexJpFVhAAgynV704AVftr?=
 =?iso-8859-1?Q?NevMEEjIg1+55DF+8JDOvAnonSxL5izw/fjXBPnc+PoHR455SS+Qgyf1UZ?=
 =?iso-8859-1?Q?nq+bX1XLtGQwRIM3OQFzBCE7c1psI1VUf99bVHqXQYTvdfsu6ix2aY9aFN?=
 =?iso-8859-1?Q?82/cf++oIBtMWckO4LF84MM97ebYFATGJF1kIeOWbJHFriyc3yjeLHDWz5?=
 =?iso-8859-1?Q?A=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR03MB9572.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(42112799006)(7416014)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?91TcORD/YvYPz+zroRm9GdsTKy8ymxs4U1NHILSbfYojFTWtV1XOtZvjH6?=
 =?iso-8859-1?Q?CgBBcGnvMJf7kd79tfufwW1h1icq0wo89+b/OnWCJJvK6GZ0OnLWMWAoI8?=
 =?iso-8859-1?Q?XNVHLNhIf/jNh+EiV8gDgAJle90z6nup8Iz52pWH+54aBaz18jYXIVut9K?=
 =?iso-8859-1?Q?7hKWOWiNqsC2PB12GEpONDcllKPOXUtWfMeAKlcSHbHfWAwTPO4tLFhqKF?=
 =?iso-8859-1?Q?SxGZM/3M4usobO/cDMUVlK4/lExwgy3gCEb7Oi4qDZ2Jjx39aAfJ0O3XJF?=
 =?iso-8859-1?Q?wUggBL4weJ2XCPURATAF0GFrPifARiSDtDDNvOsjVyJ3M69kJ6jcXK+Oy/?=
 =?iso-8859-1?Q?QNkrmZDP9wHT69msG8HJaGm+UoIOg0ZE6esDZdctsV/zVYt8N0CbjiXQYf?=
 =?iso-8859-1?Q?gmE/yDmE2v2ubHJgWKgywwlsPPIP48DzU953ZzETUZ3SXvYMSP29qvLL/0?=
 =?iso-8859-1?Q?EvVLQMI6w4PK+OtMHe1SMt9yiw1aa/+2mePeijg1RFU0h27NpXEEKmytzo?=
 =?iso-8859-1?Q?2LqPHrgAkRWX1sMtQjxF9QOaxzfMU3KZz71AXO0ic5JpAIXvwq3EEFz/S0?=
 =?iso-8859-1?Q?VPKqW3GXyu0Ksbbkk2MBq+PbmiJlpiVJy0ndE7759/4tKQcJpqR84coqNc?=
 =?iso-8859-1?Q?JtPV7LhgGG1pD6eNY/87NttBTt5Txw4HfJpqzuQnAS4GN4AgTMefJp7TsH?=
 =?iso-8859-1?Q?NKCRwQ0Hd4DnJ5MCWwNsIC0DW37F1r3AeZcoAEm/TlgD9tcFSbvpQDcECW?=
 =?iso-8859-1?Q?GpuwGjaBG/VY4yo5NiSit36kBU9el/G9TAhOGn8egZPwLXCRv10pjebFUE?=
 =?iso-8859-1?Q?i81Xxiw9hOTigHOJdDXkF+3ZvohVxuYEDKDGsL6VNuNdCFEDXgYzIBUUmM?=
 =?iso-8859-1?Q?qBcBUUcRmGl+DOrU8qYvSsSCCGEdECU4bif7UC0RoMDKsyaQMlcXtSWB7+?=
 =?iso-8859-1?Q?+TX+jYKJllkutRCORG/vFos0SUsf27HS5uk/f/gjkb8iRwsYySpwmyPZg4?=
 =?iso-8859-1?Q?WtEJUvxhosau4iBJaJNa/Ne7iBdZZBAdJz9gyLJAUvJ6rNBqjFfHr9/ukS?=
 =?iso-8859-1?Q?Qr0IjuhtQuRx+8AWFdPcZAV3WMlJhB1vheJGaZrPfTTAzdI8G9+SyH0+va?=
 =?iso-8859-1?Q?zQrxcNbyT+NRa+E2j3fZwaCBJBQjBBbcncN+X05Tls99PVjf/0xwrFMKJv?=
 =?iso-8859-1?Q?acJ7Bmzp+qlXOWxr/qgnipFKNMyl3ego2T5rsG8cfK1d6I86KbUxU7tYXl?=
 =?iso-8859-1?Q?qK9XExqvEZ0FJJlV12RBsrA1VClVMGlyHLx3au4c5l9ho8NnJpaLiNXTBT?=
 =?iso-8859-1?Q?udkEC69XaW6TdcPuhMQqo8rRQ2DYSB5+kahtj6ts5lxHCV2TvDO93vNt6E?=
 =?iso-8859-1?Q?mrYHuwPk79uEwKJgci4Rh9XXUzavKWUddExlfEE7v5hno/NWcaLHPer66y?=
 =?iso-8859-1?Q?K6X1hF5pdFzHtg+QOvjjmA1Rz2YAGFwwfbZtVqzzedMeQDrG56oYn/Tsig?=
 =?iso-8859-1?Q?KfeP2S2KCW9mXi9n6UzWYl6Fw96NrOIWecjziX2npxeB+DZ6mWJaSr8NlC?=
 =?iso-8859-1?Q?Ul8ng0m4H0Sc2C0QQRq4QM4B1XvurJOM6yg3M854Ck6TJIkKxxJyXvvyas?=
 =?iso-8859-1?Q?DJAliUspmmECaoxjKVhwXmQeD7zrDBbMEvZrknGo6pFSqG3biYn+HK6A?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: epam.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV2PR03MB9572.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d161a42-43a1-45cd-3f23-08ddc2da1a63
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2025 13:26:55.7394
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b41b72d0-4e9f-4c26-8a69-f949f367c91d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Y9RQ1ebwFepS/yaNgWvcjhPoywL9UzR2ife5exvP3FISu8iiBk5ZrxVqbyEGIUfPhoiqxw+58YzDtG746tK7X6DfWcR9JP7kY1PlFq1jcPM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB6754

Rule 10.1: Operands shall not be of an
inappropriate essential type

The following are non-compliant:
- boolean used as a numeric value.

The result of the '__isleap' macro is a boolean.
Use a ternary operator to replace it with a numeric value.

The result of 'NOW() > timeout' is a boolean,
which is compared to a numeric value. Fix this.
Regression was introdiced by commit:
be7f047e08 (xen/arm: smmuv3: Replace linux functions with xen functions.)

Signed-off-by: Dmytro Prokopchuk <dmytro_prokopchuk1@epam.com>
---
Changes since v2:
- improve the wording
Link to v2: https://patchew.org/Xen/41538b6b19811eb74c183051d3e7a4fd216404e=
6.1752232902.git.dmytro._5Fprokopchuk1@epam.com/
Link to the deviation of an unary minus: https://patchew.org/Xen/7e6263a15c=
71aafc41fe72cecd1f15c3ce8846f2.1752492180.git.dmytro._5Fprokopchuk1@epam.co=
m/

Jan, regarding that:
If an expression is needed here, I'd suggest to use !!, as we have in
(luckily decreasing) number of places elsewhere. Personally I don't
understand though why a boolean cannot be used as an array index.

The '!!' isn't a solution here, we'll have other violation:
`!' logical negation operator has essential type boolean and standard type =
`int'
(https://saas.eclairit.com:3787/fs/var/local/eclair/xen-project.ecdf/xen-pr=
oject/people/dimaprkp4k/xen/ECLAIR_normal/deviate_10.1_rule/ARM64/106741148=
52/PROJECT.ecd;/by_service/MC3A2.R10.1.html#{%22select%22:true,%22selection=
%22:{%22hiddenAreaKinds%22:[],%22hiddenSubareaKinds%22:[],%22show%22:false,=
%22selector%22:{%22enabled%22:true,%22negated%22:true,%22kind%22:0,%22domai=
n%22:%22kind%22,%22inputs%22:[{%22enabled%22:true,%22text%22:%22violation%2=
2}]}}})

Well, in our case boolean can be used as an array index.
But index value is limited: 0 or 1.
I guess MISRA wants to predict such errors related to index limitations.
And I think fixing the code is easier here, instead of writing a deviation.

---
 xen/common/time.c                     | 2 +-
 xen/drivers/passthrough/arm/smmu-v3.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/time.c b/xen/common/time.c
index 92f7b72464..980dddee28 100644
--- a/xen/common/time.c
+++ b/xen/common/time.c
@@ -84,7 +84,7 @@ struct tm gmtime(unsigned long t)
     }
     tbuf.tm_year =3D y - 1900;
     tbuf.tm_yday =3D days;
-    ip =3D (const unsigned short int *)__mon_lengths[__isleap(y)];
+    ip =3D (const unsigned short int *)__mon_lengths[__isleap(y) ? 1 : 0];
     for ( y =3D 0; days >=3D ip[y]; ++y )
         days -=3D ip[y];
     tbuf.tm_mon =3D y;
diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthroug=
h/arm/smmu-v3.c
index df16235057..4058b18f2c 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -315,7 +315,7 @@ static int queue_poll_cons(struct arm_smmu_queue *q, bo=
ol sync, bool wfe)
=20
 	while (queue_sync_cons_in(q),
 	      (sync ? !queue_empty(&q->llq) : queue_full(&q->llq))) {
-		if ((NOW() > timeout) > 0)
+		if (NOW() > timeout)
 			return -ETIMEDOUT;
=20
 		if (wfe) {
--=20
2.43.0

